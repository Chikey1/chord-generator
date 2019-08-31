# frozen_string_literal: true

module DataAnalysis
  class NumericalFrequencyPercentageService
    class << self
      def call
        start = Time.now
        puts '~~~~~~~~~~~ CALCULATING OVERALL FREQUENCY PERCENTAGE ~~~~~~~~~~~'
        calculate_overall_frequency_percentage
        puts '~~~~~~~~~~~ CALCULATING SAME SONG APPEARANCE FREQUENCY PERCENTAGE ~~~~~~~~~~~'
        calculate_same_song_frequency_percentage
        puts '~~~~~~~~~~~ CALCULATING FIRST NOTE FREQUENCY PERCENTAGE ~~~~~~~~~~~'
        calculate_first_note_frequency_percentage
        puts '~~~~~~~~~~~ CALCULATING LAST NOTE FREQUENCY PERCENTAGE ~~~~~~~~~~~'
        calculate_last_note_frequency_percentage
        puts "TOTAL TIME: #{Time.now - start}"
      end

      def calculate_overall_frequency_percentage
        start = Time.now
        raw_data = File.open('app/data/analysis/numerical_frequency/overall.json', 'r').first
        data = JSON.parse(raw_data)
        total = data.compact.sum

        new_data = data.map do |frequency|
          if frequency.nil?
            0
          else
            (frequency * 100.0 / total).round(1)
          end
        end

        File.open('app/data/factors/overall_frequency.json', 'w') do |file|
          file.puts new_data.to_json
        end
        puts "time: #{Time.now - start}"
      end

      def calculate_same_song_frequency_percentage
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

        File.open('app/data/factors/same_song_frequency.json', 'w') do |file|
          file.puts new_data.to_json
        end
        puts "time: #{Time.now - start}"
      end

      def calculate_first_note_frequency_percentage
        start = Time.now
        raw_data = File.open('app/data/analysis/numerical_frequency/first_note.json', 'r').first
        all = JSON.parse(raw_data)

        total = all.compact.sum

        new_data = all.map do |frequency|
          if frequency.nil?
            0
          else
            (frequency * 100.0 / total).round(1)
          end
        end

        File.open('app/data/factors/first_note_frequency.json', 'w') do |file|
          file.puts new_data.to_json
        end
        puts "time: #{Time.now - start}"
      end

      def calculate_last_note_frequency_percentage
        start = Time.now
        raw_data = File.open('app/data/analysis/numerical_frequency/last_note.json', 'r').first
        all = JSON.parse(raw_data)

        total = all.compact.sum

        new_data = all.map do |frequency|
          if frequency.nil?
            0
          else
            (frequency * 100.0 / total).round(1)
          end
        end

        File.open('app/data/factors/last_note_frequency.json', 'w') do |file|
          file.puts new_data.to_json
        end
        puts "time: #{Time.now - start}"
      end
    end
  end
end
