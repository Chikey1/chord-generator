# frozen_string_literal: true

module Converter
  class MacroChordService
    class << self
      def call(chord_name)
        key, quality = get_key_and_quality(chord_name)
        base, modifications, unknown = get_quality_attributes(quality)

        raise "could not decode #{key + quality}" if unknown.present?

        {
          key: key,
          quality: quality,
          base: base,
          modifications: modifications,
        }
      end

      private

      def get_key_and_quality(chord_name)
        key = chord_name[0]
        chord_name[0] = ''
        if chord_name[0] == '#' || chord_name[0] == 'b'
          key += chord_name[0]
          chord_name[0] = ''
        end

        [key, chord_name]
      end

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

        [base, modifications.reverse, unknown]
      end

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
