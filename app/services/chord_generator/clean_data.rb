# frozen_string_literal: true

module ChordGenerator
  class CleanData
    class << self
      include DataConversion::Enharmonics
      include DataConversion::NoteLengths

      def call(measures, key_signature)
        key_signature_accidentals = get_key_signature(key_signature)
        measures.map do |measure|
          accidentals = key_signature_accidentals
          measure.map do |element|
            value = clean_value(element['value'])

            accidentals.push([value, element['accidental']]) if element['accidental'].present?

            {
              length: convert_length(element['length']),
              symbol: get_symbol(value, accidentals),
            }
          end
        end.flatten
      end

      private

      def convert_length(length)
        Rational(1, TO_NUMBER[length])
      end

      def get_symbol(value, accidentals)
        symbol = value
        return symbol if accidentals.empty?

        accidentals.each do |accidental_value, accidental|
          symbol = with_accidental(value, accidental) if value == accidental_value
        end

        return symbol if TO_BACKEND[symbol].nil?

        TO_BACKEND[symbol]
      end

      def clean_value(value)
        return nil if value.nil? # rest

        symbol = value.chop.upcase
        symbol
      end

      def with_accidental(symbol, accidental)
        case accidental
        when 'sharp', '#'
          symbol += '#'
        when 'flat', 'b'
          symbol += 'b'
        else
          symbol
        end
        symbol
      end

      def get_key_signature(key_signature)
        accidentals = []
        accidentals += KeySignature::FLATS.first(key_signature[:flats])
        accidentals += KeySignature::SHARPS.first(key_signature[:sharps])
        accidentals.map do |accidental|
          [accidental[0], accidental[1]]
        end
      end
    end
  end
end
