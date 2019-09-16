# frozen_string_literal: true

module Converter
  class MacroChordService
    class << self
      include DataConversion::Enharmonics

      def call(chord_id, tonality)
        tonic = get_tonic(tonality)
        chord = Chord::NumericalChord.find_by_id(chord_id)
        quality = chord.quality
        base = NoteService.get_note_from_distance(tonic, chord.base - 1).symbol
        if tonality[:flats] > 0
          base = to_flat(base)
        end
        base + quality
      end

    private
      def to_flat(symbol)
        TO_FLAT[symbol] || symbol
      end

      def get_tonic(tonality)
        tonic = tonality[:symbol][0]
        tonic += tonality[:symbol][1] if tonality[:symbol][1] == '#' || tonality[:symbol][1] == 'b'

        return tonic if TO_BACKEND[tonic].nil?

        TO_BACKEND[tonic]
      end
    end
  end
end
