# frozen_string_literal: true

module ChordGenerator
  class CalculateChordsService
    class << self
      def call(chord_intervals, tonality_type)
        start = Time.now
        chord_intervals = chord_interval_matrix(chord_intervals)
        puts "chord_interval: #{Time.now - start}"
        harmony_matrix = (chord_intervals * composition_matrix.t).to_a # chord_interval x chord_ids, percentages
        puts "harmony: #{Time.now - start}"
        # byebug
        factors_matrix = overall_matrix(chord_intervals.row_count, tonality_type, 0.2)
        puts "overall: #{Time.now - start}"
        factors_matrix = with_first_note(factors_matrix, tonality_type, 0.2)
        puts "first note: #{Time.now - start}"
        factors_matrix = with_last_note(factors_matrix, tonality_type, 0.2)
        puts "last note: #{Time.now - start}"
        # byebug

        factors_matrix = make_3d(factors_matrix, 0.5) # 3D
        puts "make 3d: #{Time.now - start}"
        # byebug
        factors_matrix = with_grouping(factors_matrix, tonality_type, 0.2)
        puts "grouping: #{Time.now - start}"
        # byebug
        factors_matrix = with_naive_next(factors_matrix, tonality_type, 0.2, 5)
        puts "naive next: #{Time.now - start}"
        # byebug
        combined_matrix = combine(harmony_matrix, factors_matrix)
        puts "combine: #{Time.now - start}"
        # byebug
        chord_ids = Array.new(chord_intervals.row_count)
        chord_ids = get_chord_ids(chord_ids, combined_matrix)
        puts "chord ids: #{Time.now - start}"
        # handicap_weight = 0
        # last_length = chord_ids.uniq.length
        # while last_length < 3 && handicap_weight < 50
        #   handicapped_array = handicap(combined_matrix.dup, chord_ids, handicap_weight)
        #   chord_ids = get_chord_ids(chord_ids, combined_matrix)
        #   last_length = chord_ids.uniq.length
        #   handicap_weight += 10
        # end
        chord_ids
      end

      private
      def make_3d(matrix, weighting)
        matrix.map.with_index do |chord_interval, i|
          chord_interval.map do |chord_value|
            next Array.new(chord_interval.length) {chord_value} if i == matrix.length - 1
            matrix[i+1].map do |next_chord_value|
              chord_value*(1-weighting) + next_chord_value*weighting
            end
          end
        end
      end

      def combine(harmony_matrix, factors_matrix)
        factors_matrix.map.with_index do |chord_interval, index|
          chord_interval.map.with_index do |chord, chord_id|
            chord.map.with_index do |next_chord, next_chord_id|
              percent = next_chord*harmony_matrix[index][chord_id]/100
              if index != factors_matrix.length - 1
                percent *= harmony_matrix[index+1][next_chord_id]/100
              end
              percent
            end
          end
        end
      end

      def handicap(modified_3d, chord_ids, weighting)
        modified_3d.map do |interval|
          interval.map.with_index do |chords, index|
            if chord_ids.include?(index)
              chords.map { |v| v - weighting }
            else
              chords
            end
          end
        end
      end

      def get_chord_ids(chord_ids, modified_3d)
        next_chord = nil
        modified_3d.map.with_index do |chord_interval, index|
          chord = chord_ids[index]
          max = 0

          # sums = chord_interval.map { |i| i.max }
          # max = sums.max
          # chord = sums.index(max)
          if next_chord.nil?
            chord_interval.each_with_index do |chords, chord_id|
              next unless chords.max > max

              chord = chord_id
              max = chords.max
              next_chord = chords.each_with_index.max[1]
            end
          else
            next_chord == 1 if next_chord == 0 # should never happen
            chord = next_chord
            chords = chord_interval[chord]
            if chords.max > max
              max = chords.max

              next_chord = chords.each_with_index.max[1]
            end
          end
          chord
        end
      end

      def with_grouping(matrix, type, weighting)
        array = JSON.parse(File.open("app/data/matrices/#{type}/grouping.json", 'r').first)
        # chord 1 are rows
        # related chords are columns

        matrix.map do |chord_interval|
          chord_interval.map.with_index do |chord, chord_id|
            chord.map.with_index do |next_chord, next_chord_id|
              next_chord + array[chord_id][next_chord_id]*weighting
            end
          end
        end
      end

      def with_naive_next(matrix, type, weighting, repeat) # repeat is flat percentage
        array = JSON.parse(File.open("app/data/matrices/#{type}/naive_next.json", 'r').first)
        # chord1 are rows
        # next chords are columns

        matrix.map.with_index do |chord_interval, i|
          chord_interval.map.with_index do |chord, chord_id|
            chord.map.with_index do |next_chord, next_chord_id|
              next_chord_percent = array[chord_id][next_chord_id] * weighting
              if next_chord_id == chord_id
                next_chord + next_chord_percent - repeat # make it unlikely to repeat chords
              else
                next_chord + next_chord_percent
              end
            end
          end
        end
      end

      def overall_matrix(length, type, weighting)
        array = JSON.parse(File.open("app/data/matrices/#{type}/overall.json", 'r').first)

        # 1 row
        # chords are columns

        length.times.map do |i|
          array.map do |percent|
            percent*weighting
          end
        end
      end

      def with_first_note(matrix, type, weighting)
        array = JSON.parse(File.open("app/data/matrices/#{type}/first_note.json", 'r').first)

        # 1 row
        # chords are columns
        array.each_with_index do |percent, i|
          matrix[0][i] += (percent * weighting)
        end

        matrix
      end

      def with_last_note(matrix, type, weighting)
        array = JSON.parse(File.open("app/data/matrices/#{type}/last_note.json", 'r').first)
        # 1 row
        # chords are columns
        last = matrix.length - 1
        array.each_with_index do |percent, i|
          matrix[last][i] += (percent * weighting)
        end

        matrix
      end

      def chord_interval_matrix(chord_intervals)
        Matrix.rows(chord_intervals)
      end

      def composition_matrix
        array = JSON.parse(File.open('app/data/matrices/chord_composition.json', 'r').first)
        # chords are rows
        # 0 to 12 is the composition
        Matrix.rows(array).map! { |i| i * 100 } # change into percentage
      end
    end
  end
end
