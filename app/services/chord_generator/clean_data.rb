module ChordGenerator
  class CleanData
    class << self
      include DataConversion::Enharmonics
      include DataConversion::NoteLengths

      def call(measures, key_signature)
        measures.map do |measure|
          accidentals = []
          measure.map do |element|
            value = clean_value(element["value"])

            accidentals.push([value, element["accidental"]]) if element["accidental"].present?

            {
              length: convert_length(element["length"]),
              symbol: get_symbol(value, accidentals, key_signature),
            }
          end
        end.flatten
      rescue
        false
      end

    private
      def convert_length(length)
        Rational(1, TO_NUMBER[length])
      end

      def get_symbol(value, accidentals, key_signature)
        symbol = value
        symbol = with_key_signature(symbol, key_signature)
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
      end

      def with_accidental(symbol, accidental)
        case accidental
        when "sharp"
          symbol = symbol + "#"
        when "flat"
          symbol = symbol + "b"
        else
          symbol
        end
      end

      # TODO: implement key_signature
      def with_key_signature(symbol, key_signature)
        symbol
      end
    end
  end
end
