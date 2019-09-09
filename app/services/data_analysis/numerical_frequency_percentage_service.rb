# frozen_string_literal: true

module DataAnalysis
  class NumericalFrequencyPercentageService
    class << self
      def call
        start = Time.now
        puts '~~~~~~~~~~~ CALCULATING PERCENTAGE: OVERALL (MAJOR) ~~~~~~~~~~~'
        calculate_overall_percentage('major')
        puts '~~~~~~~~~~~ CALCULATING PERCENTAGE: OVERALL (MINOR) ~~~~~~~~~~~'
        calculate_overall_percentage('minor')
        puts '~~~~~~~~~~~ CALCULATING PERCENTAGE: SAME SONG APPEARANCE ~~~~~~~~~~~'
        calculate_same_song_percentage
        puts '~~~~~~~~~~~ CALCULATING PERCENTAGE: FIRST NOTE (MAJOR) ~~~~~~~~~~~'
        calculate_first_note_percentage('major')
        puts '~~~~~~~~~~~ CALCULATING PERCENTAGE: FIRST NOTE (MINOR) ~~~~~~~~~~~'
        calculate_first_note_percentage('minor')
        puts '~~~~~~~~~~~ CALCULATING PERCENTAGE: LAST NOTE (MAJOR) ~~~~~~~~~~~'
        calculate_last_note_percentage('major')
        puts '~~~~~~~~~~~ CALCULATING PERCENTAGE: LAST NOTE (MINOR) ~~~~~~~~~~~'
        calculate_last_note_percentage('minor')
        puts "TOTAL TIME: #{Time.now - start}"
      end

      def calculate_overall_percentage(type)
        start = Time.now
        raw_data = File.open("app/data/analysis/#{type}/overall.json", 'r').first
        data = JSON.parse(raw_data)
        total = data.compact.sum

        new_data = data.map do |frequency|
          if frequency.nil?
            0
          else
            (frequency * 100.0 / total).round(1)
          end
        end

        File.open("app/data/factors/#{type}/overall.json", 'w') do |file|
          file.puts new_data.to_json
        end
        puts "time: #{Time.now - start}"
      end

      def calculate_same_song_percentage
        start = Time.now
        raw_data = File.open('app/data/analysis/numerical_frequency/same_song.json', 'r').first
        data = JSON.parse(raw_data)
        new_data = data.each_with_index.map do |chord1, index|
          next if chord1.nil?

          total = chord1[index]

          chord1.map do |frequency|
            if frequency.nil?
              0
            else
              (frequency * 100.0 / total).round(1)
            end
          end
        end

        File.open('app/data/factors/same_song.json', 'w') do |file|
          file.puts new_data.to_json
        end
        puts "time: #{Time.now - start}"
      end

      def calculate_first_note_percentage(type)
        start = Time.now
        raw_data = File.open("app/data/analysis/#{type}/first_note.json", 'r').first
        all = JSON.parse(raw_data)

        total = all.compact.sum

        new_data = all.map do |frequency|
          if frequency.nil?
            0
          else
            (frequency * 100.0 / total).round(1)
          end
        end

        File.open("app/data/factors/#{type}/first_note.json", 'w') do |file|
          file.puts new_data.to_json
        end
        puts "time: #{Time.now - start}"
      end

      def calculate_last_note_percentage(type)
        start = Time.now
        raw_data = File.open("app/data/analysis/#{type}/last_note.json", 'r').first
        all = JSON.parse(raw_data)

        total = all.compact.sum

        new_data = all.map do |frequency|
          if frequency.nil?
            0
          else
            (frequency * 100.0 / total).round(1)
          end
        end

        File.open("app/data/factors/#{type}/last_note.json", 'w') do |file|
          file.puts new_data.to_json
        end
        puts "time: #{Time.now - start}"
      end
    end
  end
end
