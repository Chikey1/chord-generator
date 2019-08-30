module Converter
  class MacroChordService
    class << self
      def call(chord_name)
        key, quality = get_key_and_quality(chord_name)
        base, modifications, unknown = get_quality_attributes(quality)
        return {
          key: key,
          quality: quality,
          base: base,
          modifications: modifications,
          unknown: unknown,
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

        chord_name = chord_name.split('/')[0] if slash_chord?(chord_name)
        if DataConversion::CHORD_QUALITIES[chord_name].present?
          chord_name = DataConversion::CHORD_QUALITIES[chord_name]
        end

        [key, chord_name]
      end

      def get_quality_attributes(quality)
        unknown = quality.dup
        modifications = []
        ["add", "sus", "no"].each do |type|
          if quality.include?(type)
            Chord::Modification.symbols(type: type).each do |mod|
              modifications.push(mod) if unknown.slice!(mod)
            end
          end
        end

        base = ""
        if unknown.present?
          Chord::Base.symbols.each do |symbol|
            base = symbol if unknown.start_with?(symbol) && base.length < symbol.length
            break if unknown == symbol
          end
          unknown.slice!(base)
        end

        if unknown.present?
          Chord::Modification.symbols(type: "change").each do |mod|
            modifications.push(mod) if unknown.slice!(mod)
            break if unknown.empty?
          end
        end

        return [base, modifications, unknown]
      end

      def slash_chord?(chord)
        chord.include?('/')
      end
    end
  end
end