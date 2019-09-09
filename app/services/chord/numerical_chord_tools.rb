# frozen_string_literal: true

module Chord
  class NumericalChordTools
    class << self
      include DataConversion::Enharmonics
      private

      def get_base_and_quality(chord_name)
        base = chord_name[0]
        chord_name[0] = ''
        if chord_name[0] == '#' || chord_name[0] == 'b'
          base += chord_name[0]
          chord_name[0] = ''
        end

        [clean_base(base), chord_name]
      end

      def clean_base(base)
        return TO_BACKEND[base] if TO_BACKEND[base]

        base
      end

      def get_numerical_base(base, tonality)
        lower_note = clean_tonality(tonality)
        NoteService.semitone_distance(lower_note, base) + 1
      end

      def clean_tonality(tonality)
        clean = tonality.chomp('m')
        clean = TO_BACKEND[clean] if TO_BACKEND[clean]
        clean
      end

      # rubocop:disable Metrics/MethodLength
      def get_quality_attributes(quality)
        unknown = quality.dup
        modifications = []
        %w[add sus no].each do |type|
          next unless quality.include?(type)

          Chord::Modification.symbols(type: type).each do |mod|
            modifications.push(mod) if unknown.slice!(mod)
          end
        end

        base = find_base(unknown)
        unknown.slice!(base)

        if unknown.present?
          Chord::Modification.symbols(type: 'change').each do |mod|
            modifications.push(mod) if unknown.slice!(mod)
            break if unknown.empty?
          end
        end

        raise "Could not decode quality: #{quality}" if unknown.present?

        [base, modifications]
      end
      # rubocop:enable Metrics/MethodLength

      def find_base(quality)
        best_match = ''
        if quality.present?
          Chord::Base.symbols.each do |symbol|
            best_match = symbol if quality.start_with?(symbol) && best_match.length < symbol.length
            break if quality == symbol
          end
        end
        best_match
      end
    end
  end
end
