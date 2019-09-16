# frozen_string_literal: true

class PerformanceTester
  class << self
    def call
      formatted_data = []

      count = 0
      File.open("app/data/raw/chords_by_key/#{"Abm"}.txt", 'r').map do |line|
        song_data = get_song_data(line, "Abm")

        formatted_data.push(song_data)
        byebug if formatted_data.count(1) > formatted_data.count(2)
        count += 1
        print "\r#{count}"
      end

      puts ' - COMPLETE'
      byebug
    end

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
