# frozen_string_literal: true

module Converter
  class NumericalChordService
    class << self
      def id_from_name(chord_name, tonality)
        formatted = Converter::MacroChordService.call(chord_name)
        base = get_relative_base(formatted[:key], tonality)
        chord_base_id = get_chord_base_id(formatted[:base])
        modification_ids = get_modification_ids(formatted[:modifications])
        encode_ids(base, chord_base_id, modification_ids)
      end

      private

      def encode_ids(base, chord_base_id, modification_ids)
        id = 0
        modification_ids.each do |mod|
          id += mod
          id *= 100
        end
        id += chord_base_id
        id *= 100
        id += base
        id
      end

      def get_chord_base_id(chord_base)
        Chord::Base.find_by_symbol(chord_base).id
      end

      def get_modification_ids(modifications)
        modifications.map do |mod|
          Chord::Modification.find_by_symbol(mod).id
        end
      end

      def get_relative_base(base, tonality)
        lower_note = clean_tonality(tonality)
        NoteService.semitone_distance(lower_note, base) + 1
      end

      def clean_tonality(tonality)
        clean = tonality.chomp('m')
        clean = DataConversion::Enharmonics::TO_BACKEND[clean] if DataConversion::Enharmonics::TO_BACKEND[clean]
        clean
      end
    end
  end
end
