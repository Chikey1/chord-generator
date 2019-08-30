# frozen_string_literal: true

module DataAnalysis
  class CheckChordsService
    class << self
      def call
        start_time = Time.now
        unknown_chords = []

        Tonality::ALL.each do |key, value|
          puts "<----- starting #{key} ------->"
          File.open("app/data/raw/chords_by_key/#{value[:symbol]}.txt", 'r').map do |line|
            chords = line_to_chord_array(line)
            chords.each do |chord|
              attributes = Converter::MacroChordService.call(chord.dup)

              unknown_chords.push(chord) unless valid_key?(attributes[:key]) || valid_quality?(attributes[:unknown])
            end
          end
        end
        if unknown_chords.empty?
          puts "YAY YOU'RE GOOD"
        else
          puts "UNKNOWN CHORDS:"
          unknown_chords.compact.each { |uc| puts uc }
        end
        puts "total_time: #{Time.now - start_time}"
      end

      private

      def valid_key?(key)
        return true if Note.find_by_symbol(key).present?
        return true if Note.find_by_symbol(Enharmonic::TO_SHARP[key]).present?
        false
      end

      def valid_quality?(unknown)
        unknown.blank?
      end

      def line_to_chord_array(line)
        line.gsub!(/\s/, '') # remove whitespace
        line.sub!(/^.*:/, '') # remove title
        line.split(',')
      end
    end
  end
end
