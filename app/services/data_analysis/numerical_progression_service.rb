# frozen_string_literal: true

module DataAnalysis
  class NumericalProgressionService
    class << self
      def recalculate_all
        puts '~~~~~~~~~~~ CALCULATING PROGRESSION BY KEY ~~~~~~~~~~~'
        calculate
        puts '~~~~~~~~~~~ CALCULATING TOTAL PROGRESSION FREQUENCIES ~~~~~~~~~~~'
        calculate_percentage
      end

      def calculate
        start = Time.now
        progression_time = 0
        progression = {}
        Tonality::ALL.each do |key, value|
          puts "<----- starting #{key} ------->"
          progression[key] = {}
          raw_data = File.open("app/data/analysis/formatted/#{value[:symbol]}.json", 'r').first
          data = JSON.parse(raw_data)
          progression_start = Time.now
          progression[key] = get_progression_object(data)
          progression_time += Time.now - progression_start
        end
        File.open('app/data/analysis/numerical_progression/naive_next.json', 'w') do |file|
          file.puts progression.to_json
        end
        puts "total time: #{Time.now - start}"
        puts "get_frequency_object: #{progression_time}"
      end

      def calculate_percentage
        start = Time.now
        all = combine_progression_frequency
        all.each do |_from_chord, to_chords|
          total = to_chords.values.sum

          to_chords.transform_values! do |frequency|
            frequency * 100 / total
          end

          to_chords.delete_if do |_chord, percentage|
            percentage == 0
          end
        end

        File.open('app/data/analysis/numerical_progression/naive_next_percentage.json', 'w') do |file|
          file.puts all.to_json
        end
        puts "total time: #{Time.now - start}"
      end

      private

      def combine_progression_frequency
        all = {}
        raw_data = File.open('app/data/analysis/numerical_progression/naive_next.json', 'r').first
        data = JSON.parse(raw_data)
        data.each do |key, from_chords|
          puts "<----- starting #{key} ------->"
          from_chords.each do |from_chord, to_chords|
            all[from_chord] ||= {}
            to_chords.each do |to_chord, frequency|
              if all[from_chord][to_chord].nil?
                all[from_chord][to_chord] = frequency
              else
                all[from_chord][to_chord] += frequency
              end
            end
          end
        end
        all
      end

      def get_progression_object(data)
        progression = {}

        data.each do |song|
          (song.length - 1).times do |i|
            chord_name = song[i].to_s
            next_chord = song[i + 1].to_s
            progression[chord_name] ||= {}

            if progression[chord_name][next_chord].nil?
              progression[chord_name][next_chord] = 1
            else
              progression[chord_name][next_chord] += 1
            end
          end
        end

        progression
      end
    end
  end
end
