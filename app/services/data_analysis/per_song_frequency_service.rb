# frozen_string_literal: true

module DataAnalysis
  class PerSongFrequencyService
    class << self
      def call
        start = Time.now
        puts '~~~~~~~~~~~ CALCULATING UNIQUE CHORDS ~~~~~~~~~~~'
        calculate_unique_chords
        puts '~~~~~~~~~~~ CALCULATING UNIQUE CHORDS PERCENTAGE ~~~~~~~~~~~'
        calculate_unique_chords_percentage
        puts "TOTAL TIME: #{Time.now - start}"
      end

      def calculate_unique_chords
        start = Time.now
        frequency = []
        Tonality::ALL.each do |_key, value|
          print "#{value[:symbol]}  "
          raw_data = File.open("app/data/analysis/formatted/#{value[:symbol]}.json", 'r').first
          data = JSON.parse(raw_data)
          data.each do |song|
            count = song.uniq.length
            frequency[count] = 0 if frequency[count].nil?
            frequency[count] += 1
          end
        end

        File.open('app/data/analysis/numerical_frequency/unique_chords.json', 'w') do |file|
          file.puts frequency.to_json
        end
        puts "\ntime: #{Time.now - start}"
      end

      def calculate_unique_chords_percentage
        start = Time.now
        raw_data = File.open('app/data/analysis/numerical_frequency/unique_chords.json', 'r').first
        data = JSON.parse(raw_data)
        total = data.compact.sum
        new_data = data.map do |frequency|
          if frequency.nil?
            0
          else
            (frequency * 100.0 / total).round(1)
          end
        end

        File.open('app/data/factors/unique_chords.json', 'w') do |file|
          file.puts new_data.to_json
        end
        puts "time: #{Time.now - start}"
      end
    end
  end
end
