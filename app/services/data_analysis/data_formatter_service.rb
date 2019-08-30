# frozen_string_literal: true

module DataAnalysis
  class DataFormatterService
    class << self
      def call
        start_time = Time.now
        formatted_data = []

        Tonality::ALL.each do |key, value|
          count = 0
          puts "<----- starting #{key} ------->"
          File.open("app/data/raw/chords_by_key/#{value[:symbol]}.txt", 'r').map do |line|
            chords = DataAnalysis::DataCleanerService.clean_line(line)
            song_data = []

            chords.each do |chord|
              song_data.push(Converter::ChordIdService.id_from_name(chord.dup, value[:symbol]))
            end

            formatted_data.push(song_data)
            count += 1
            print "\r#{count}"
          end
          puts ' - COMPLETE'

          File.open("app/data/analysis/formatted/#{value[:symbol]}.json", 'w') do |file|
            file.puts formatted_data.to_json
          end
        end

        puts "total_time: #{Time.now - start_time}"
      end
    end
  end
end
