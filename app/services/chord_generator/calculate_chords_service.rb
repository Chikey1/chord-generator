# frozen_string_literal: true

module ChordGenerator
  class CalculateChordsService
    class << self
      def call(chord_intervals, tonality_type)
        chord_intervals = chord_interval_matrix(chord_intervals)

        harmony_matrix = chord_intervals * composition_matrix.t # chord_interval x chord_ids

        modified_array = with_overall(harmony_matrix, tonality_type, 0.5)

        modified_array = with_first_note(modified_array, tonality_type, 1)

        modified_array = with_last_note(modified_array, tonality_type, 1)

        modified_3d = with_naive_next(modified_array, tonality_type, 1, 0.4)

        modified_3d = with_grouping(modified_3d, 1)

        chord_ids = Array.new(modified_array.length)
        chord_ids = get_chord_ids(chord_ids, modified_3d)
        # handicap_weight = 0
        # last_length = chord_ids.uniq.length
        # while last_length < 3 && handicap_weight < 200
        #   handicapped_array = handicap(modified_3d.dup, chord_ids, handicap_weight)
        #   chord_ids = get_chord_ids(chord_ids, handicapped_array)
        #   last_length = chord_ids.uniq.length
        #   handicap_weight += 10
        # end
        chord_ids
      end

      private

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
              next_chord = chords.index(max)
            end
          else
            next_chord == 1 if next_chord == 0
            chord_id = next_chord
            chords = chord_interval[chord_id]
            if chords.max > 0
              chord = chord_id
              max = chords.max

              next_chord = chords.index(max)
            end
          end
          chord
        end
      end

      def with_grouping(modified_3d, weighting)
        array = JSON.parse(File.open('app/data/matrices/grouping.json', 'r').first)
        # chord 1 are rows
        # related chords are columns
        modified_3d.map do |chord_interval|
          chord_interval.map.with_index do |chord_relations, chord1|
            chord_relations.map.with_index do |value, chord2|
              value + (array[chord1][chord2] * weighting)
            end
          end
        end
      end

      def with_naive_next(modified_array, type, weighting, repeat)
        array = JSON.parse(File.open("app/data/matrices/#{type}/naive_next.json", 'r').first)
        # chord1 are rows
        # next chords are columns

        modified_array.map.with_index do |chord_interval, i|
          chord_interval.map.with_index do |chord_value, chord_id|
            if i == modified_array.length - 1
              Array.new(array.length, chord_value)
            else
              array[chord_id].map.with_index do |next_chord_value, next_chord_id|
                next_chord_percent = next_chord_value * modified_array[i + 1][next_chord_id] * weighting / 100
                if next_chord_id == chord_id
                  (chord_value + next_chord_percent) * repeat # make it unlikely to repeat chords
                else
                  chord_value + next_chord_percent
                end
              end
            end
          end
        end
      end

      def with_overall(harmony_matrix, type, weighting)
        harmony_matrix = harmony_matrix.to_a
        array = JSON.parse(File.open("app/data/matrices/#{type}/overall.json", 'r').first)

        # 1 row
        # chords are columns

        array.each_with_index do |percent, i|
          harmony_matrix.length.times do |j|
            harmony_matrix[j][i] += (percent * weighting)
          end
        end

        harmony_matrix
      end

      def with_first_note(modified_array, type, weighting)
        array = JSON.parse(File.open("app/data/matrices/#{type}/first_note.json", 'r').first)

        # 1 row
        # chords are columns
        array.each_with_index do |percent, i|
          modified_array[0][i] += (percent * weighting)
        end

        modified_array
      end

      def with_last_note(modified_array, type, weighting)
        array = JSON.parse(File.open("app/data/matrices/#{type}/last_note.json", 'r').first)
        # 1 row
        # chords are columns
        last = modified_array.length - 1
        array.each_with_index do |percent, i|
          modified_array[last][i] += (percent * weighting)
        end

        modified_array
      end

      def chord_interval_matrix(chord_intervals)
        Matrix.rows(chord_intervals)
      end

      def composition_matrix
        array = JSON.parse(File.open('app/data/matrices/chord_composition.json', 'r').first)
        # chords are rows
        # 0 to 12 is the composition
        Matrix.rows(array).map! { |i| i * 100 } # make it a bit more fair lol
      end
    end
  end
end
