# frozen_string_literal: true

module DataAnalysis
  class NumericalFrequencyService < NumericalFrequencyPercentageService
    class << self
      def call
        start = Time.now
        puts '~~~~~~~~~~~ CALCULATING FREQUENCY: OVERALL FREQUENCY (MAJOR) ~~~~~~~~~~~'
        calculate_overall_frequency('major')
        puts '~~~~~~~~~~~ CALCULATING FREQUENCY: OVERALL FREQUENCY (MINOR) ~~~~~~~~~~~'
        calculate_overall_frequency('minor')
        puts '~~~~~~~~~~~ CALCULATING FREQUENCY: SAME SONG APPEARANCE ~~~~~~~~~~~'
        calculate_same_song_frequency
        puts '~~~~~~~~~~~ CCALCULATING FREQUENCY: FIRST NOTE (MAJOR) ~~~~~~~~~~~'
        calculate_first_note_frequency('major')
        puts '~~~~~~~~~~~ CALCULATING FREQUENCY: FIRST NOTE (MINOR) ~~~~~~~~~~~'
        calculate_first_note_frequency('minor')
        puts '~~~~~~~~~~~ CALCULATING FREQUENCY: LAST NOTE (MAJOR) ~~~~~~~~~~~'
        calculate_last_note_frequency('major')
        puts '~~~~~~~~~~~ CALCULATING FREQUENCY: LAST NOTE (MINOR) ~~~~~~~~~~~'
        calculate_last_note_frequency('minor')
        puts "TOTAL TIME: #{Time.now - start}"
      end

      def calculate_overall_frequency(type)
        is_minor = (type == 'minor')
        start = Time.now
        frequency = []
        Tonality::ALL.each do |_key, value|
          next if is_minor != value[:symbol].end_with?('m')

          print "#{value[:symbol]}  "
          raw_data = File.open("app/data/analysis/formatted/#{value[:symbol]}.json", 'r').first
          data = JSON.parse(raw_data)
          data.each do |song|
            song.each do |chord|
              frequency[chord] = 0 if frequency[chord].nil?
              frequency[chord] += 1
            end
          end
        end

        File.open("app/data/analysis/#{type}/overall.json", 'w') do |file|
          file.puts frequency.to_json
        end
        puts "\ntime: #{Time.now - start}"
      end

      def calculate_same_song_frequency
        start = Time.now
        frequency = []
        Tonality::ALL.each do |_key, value|
          print "#{value[:symbol]}  "
          raw_data = File.open("app/data/analysis/formatted/#{value[:symbol]}.json", 'r').first
          data = JSON.parse(raw_data)
          data.each do |song|
            compacted = song.uniq
            compacted.each do |chord1|
              frequency[chord1] = [] if frequency[chord1].nil?
              compacted.each do |chord2|
                frequency[chord1][chord2] = 0 if frequency[chord1][chord2].nil?
                frequency[chord1][chord2] += 1
              end
            end
          end
        end

        File.open('app/data/analysis/numerical_frequency/same_song.json', 'w') do |file|
          file.puts frequency.to_json
        end
        puts "\ntime: #{Time.now - start}"
      end

      def calculate_first_note_frequency(type)
        is_minor = (type == 'minor')
        start = Time.now
        frequency = []
        Tonality::ALL.each do |_key, value|
          next if is_minor != value[:symbol].end_with?('m')

          print "#{value[:symbol]}  "
          raw_data = File.open("app/data/analysis/formatted/#{value[:symbol]}.json", 'r').first
          data = JSON.parse(raw_data)
          data.each do |song|
            chord = song.first
            next if chord.nil?

            if frequency[chord].nil?
              frequency[chord] = 1
            else
              frequency[chord] += 1
            end
          end
        end

        File.open("app/data/analysis/#{type}/first_note.json", 'w') do |file|
          file.puts frequency.to_json
        end

        puts "\ntime: #{Time.now - start}"
      end

      def calculate_last_note_frequency(type)
        is_minor = (type == 'minor')
        start = Time.now
        frequency = []
        Tonality::ALL.each do |_key, value|
          next if is_minor != value[:symbol].end_with?('m')

          print "#{value[:symbol]}  "
          raw_data = File.open("app/data/analysis/formatted/#{value[:symbol]}.json", 'r').first
          data = JSON.parse(raw_data)
          data.each do |song|
            chord = song.last
            next if chord.nil?

            if frequency[chord].nil?
              frequency[chord] = 1
            else
              frequency[chord] += 1
            end
          end
        end

        File.open("app/data/analysis/#{type}/last_note.json", 'w') do |file|
          file.puts frequency.to_json
        end

        puts "\ntime: #{Time.now - start}"
      end
    end
  end
end
