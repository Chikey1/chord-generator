# frozen_string_literal: true

module DataAnalysis
  class FrequencyService
    def initialize
      @total_frequency = {}
      @tonality_frequency = {}
    end

    def call
      Tonality::ALL.each do |key, value|
        puts "<----- starting #{key} ------->"
        File.open("app/data/chords_by_key/#{value[:symbol]}.txt", 'r').each do |line|
          title = get_title(line)
          line_frequency = get_frequency_object(line)
          @tonality_frequency[title] = line_frequency
        end

        File.open("app/data/analysis/frequency/#{value[:symbol]}.json", 'w') do |file|
          file.puts @tonality_frequency.to_json
        end
        @tonality_frequency = {}
      end
    end

    def calculate_total_frequency
      Tonality::ALL.each do |key, value|
        puts "<----- starting #{key} ------->"
        @total_frequency[value[:symbol]] = {}
        File.open("app/data/chords_by_key/#{value[:symbol]}.txt", 'r').each do |line|
          increment_total_frequency(line, value[:symbol])
        end
      end

      File.open('app/data/analysis/frequency/all.json', 'w') do |file|
        file.puts @total_frequency.to_json
      end

      @total_frequency = {}
    end

    def top_chords_by_key(key)
      frequency_data = JSON.parse(File.open('app/data/analysis/frequency/all.json', 'r').first)
      if frequency_data[key].nil?
        puts 'invalid key'
        return
      end
      sorted_data = frequency_data[key].sort_by { |_k, v| -v }
      sorted_data.first(5).to_h
    end

    private

    def increment_total_frequency(line, key)
      _title, chords = line.split(':')
      chords.gsub!(/\s/, '')
      chords.split(',').each do |chord|
        if @total_frequency[key][chord].nil?
          @total_frequency[key][chord] = 1
        else
          @total_frequency[key][chord] += 1
        end
      end
    end

    def get_title(line)
      title, _chords = line.split(':')
      title
    end

    def get_frequency_object(line)
      _title, chords = line.split(':')
      chords.gsub!(/\s/, '')
      frequency = {}
      chords.split(',').each do |chord|
        if frequency[chord].nil?
          frequency[chord] = 1
        else
          frequency[chord] += 1
        end
      end
      frequency
    end
  end
end
