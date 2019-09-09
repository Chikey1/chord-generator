# frozen_string_literal: true

module Converter
  class MacroChordService
    class << self
      def call(chord_id, tonic)
        chord = Chord::NumericalChord.find_by_id(chord_id)
        quality = chord.quality
        base = NoteService.get_note_from_distance(tonic, chord.base - 1).symbol
        base + quality
      end

    end
  end
end
