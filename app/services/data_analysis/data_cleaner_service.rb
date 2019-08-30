# frozen_string_literal: true

module DataAnalysis
  class DataCleanerService
    class << self
      def clean_line(line)
        chords = line_to_chord_array(line)

        chords.map do |chord|
          clean_chord_name(chord)
        end
      end

      private

      def clean_chord_name(chord)
        key = chord[0]
        chord[0] = ''
        if chord[0] == '#' || chord[0] == 'b'
          key += chord[0]
          chord[0] = ''
        end

        key = clean_key(key)

        quality = clean_quality(chord)
        key + quality
      end

      def clean_key(key)
        key = DataConversion::Enharmonics::TO_BACKEND[key] if DataConversion::Enharmonics::TO_BACKEND[key].present?
        key
      end

      def clean_quality(quality)
        quality = quality.split('/')[0] if slash_chord?(quality)
        quality = DataConversion::CHORD_QUALITIES[quality] if DataConversion::CHORD_QUALITIES[quality].present?
        quality
      end

      def line_to_chord_array(line)
        line.gsub!(/\s/, '') # remove whitespace
        line.sub!(/^.*:/, '') # remove title
        line.split(',')
      end

      def slash_chord?(chord)
        chord.include?('/')
      end
    end
  end
end
