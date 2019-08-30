# frozen_string_literal: true

module DataAnalysis
  class NumericalFrequencyService
    class << self
      def calculate
        start = Time.now
        frequency_time = 0
        tonality_frequency = []
        Tonality::ALL.each do |key, value|
          puts "<----- starting #{key} ------->"
          raw_data = File.open("app/data/analysis/formatted/#{value[:symbol]}.json", 'r').first
          data = JSON.parse(raw_data)
          data.each do |song|
            frequency_start = Time.now
            line_frequency = get_frequency_object(song)
            frequency_time += Time.now - frequency_start
            tonality_frequency.push(line_frequency)
          end

          File.open("app/data/analysis/numerical_frequency/#{value[:symbol]}.json", 'w') do |file|
            file.puts tonality_frequency.to_json
          end
          tonality_frequency = []
        end
        puts "total time: #{Time.now - start}"
        puts "get_frequency_object: #{frequency_time}"
      end

      def calculate_total
        start = Time.now
        total_frequency = {}
        Tonality::ALL.each do |key, value|
          puts "<----- starting #{key} ------->"
          total_frequency[value[:symbol]] = {}
          raw_data = File.open("app/data/analysis/formatted/#{value[:symbol]}.json", 'r').first
          data = JSON.parse(raw_data)
          data.each do |line|
            increment_total_frequency(line, value[:symbol], total_frequency)
          end
        end

        File.open('app/data/analysis/numerical_frequency/all.json', 'w') do |file|
          file.puts total_frequency.to_json
        end
        puts "total time: #{Time.now - start}"
      end

      def calculate_percentage
        start = Time.now
        all = combine_frequency
        total = all.values.sum

        all.transform_values! do |frequency|
          frequency*100/total
        end

        all.delete_if do |_chord, percentage|
          percentage == 0
        end

        File.open('app/data/analysis/numerical_frequency/all_percentage.json', 'w') do |file|
          file.puts all.to_json
        end
        puts "total time: #{Time.now - start}"
      end

      private

      def combine_frequency
        all = {}
        raw_data = File.open('app/data/analysis/numerical_frequency/all.json', 'r').first
        data = JSON.parse(raw_data)
        data.each do |key, chords|
          puts "<----- starting #{key} ------->"
          chords.each do |chord, frequency|
            if all[chord].nil?
              all[chord] = frequency
            else
              all[chord] += frequency
            end
          end
        end
        all
      end

      def increment_total_frequency(song, key, total_frequency)
        song.each do |chord|
          chord_name = chord.to_s
          if total_frequency[key][chord_name].nil?
            total_frequency[key][chord_name] = 1
          else
            total_frequency[key][chord_name] += 1
          end
        end
      end

      def get_frequency_object(song)
        frequency = {}
        song.each do |chord|
          chord_id = chord.to_s
          if frequency[chord_id].nil?
            frequency[chord_id] = 1
          else
            frequency[chord_id] += 1
          end
        end
        frequency
      end
    end
  end
end
