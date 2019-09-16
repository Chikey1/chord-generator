# frozen_string_literal: true

module DataAnalysis
  class DataFormatterService
    class << self
      def call
        start_time = Time.now

        Tonality::ALL.each do |key, value|
          formatted_data = []
          count = 0
          puts "<----- starting #{key} ------->"
          File.open("app/data/raw/chords_by_key/#{value[:symbol]}.txt", 'r').map do |line|
            song_data = get_song_data(line, value[:symbol])

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

      private

      def get_song_data(line, tonality)
        chords = DataAnalysis::DataCleanerService.clean_line(line)
        song_data = []

        ActiveRecord::Base.logger.silence do
          chords.each do |chord_name|
            chord = Chord::FindNumericalChordService.call(chord_name: chord_name.dup, tonality: tonality)
            if chord.nil?
              chord = Chord::CreateNumericalChordService.call(chord_name: chord_name.dup, tonality: tonality)
              raise if chord.blank?
            end
            song_data.push(chord.id)
          end
        end

        song_data
      end
    end
  end
end
