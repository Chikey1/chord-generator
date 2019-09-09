# frozen_string_literal: true

module DataAnalysis
  class NumericalProgressionService
    class << self
      def call
        start = Time.now
        puts '~~~~~~~~~~~ CALCULATING PROGRESSION: NAIVE NEXT (MAJOR) ~~~~~~~~~~~'
        calculate_naive_next("major")
        puts '~~~~~~~~~~~ CALCULATING PROGRESSION: NAIVE NEXT (MINOR) ~~~~~~~~~~~'
        calculate_naive_next("minor")
        puts '~~~~~~~~~~~ CALCULATING PERCENTAGE: NAIVE NEXT (MAJOR) ~~~~~~~~~~~'
        calculate_naive_next_percentage("major")
        puts '~~~~~~~~~~~ CALCULATING PERCENTAGE: NAIVE NEXT (MINOR) ~~~~~~~~~~~'
        calculate_naive_next_percentage("minor")
        puts "total time: #{Time.now - start}"
      end

      def calculate_naive_next(type)
        isMinor = (type == "minor")
        start = Time.now
        progression = []
        Tonality::ALL.each do |_key, value|
          next if (isMinor != value[:symbol].end_with?("m"))
          print "#{value[:symbol]}  "
          raw_data = File.open("app/data/analysis/formatted/#{value[:symbol]}.json", 'r').first
          data = JSON.parse(raw_data)

          data.each do |song|
            (song.length - 1).times do |i|
              progression[song[i]] = [] if progression[song[i]].nil?
              progression[song[i]][song[i + 1]] = 0 if progression[song[i]][song[i + 1]].nil?
              progression[song[i]][song[i + 1]] += 1
            end
          end
        end

        File.open("app/data/analysis/#{type}/naive_next.json", 'w') do |file|
          file.puts progression.to_json
        end
        puts "\ntime: #{Time.now - start}"
      end

      def calculate_naive_next_percentage(type)
        start = Time.now

        raw_data = File.open("app/data/analysis/#{type}/naive_next.json", 'r').first
        data = JSON.parse(raw_data)

        new_data = data.map do |chord1|
          next if chord1.nil?

          total = chord1.compact.sum

          chord1.map do |frequency|
            if frequency.nil?
              0
            else
              (frequency * 100.0 / total).round(1)
            end
          end
        end

        File.open("app/data/factors/#{type}/naive_next.json", 'w') do |file|
          file.puts new_data.to_json
        end
        puts "time: #{Time.now - start}"
      end
    end
  end
end
