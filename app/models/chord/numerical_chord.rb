# frozen_string_literal: true

module Chord
  class NumericalChord
    attr_reader :modification_ids, :chord_base_id, :base
    # base: 1 to 12 in semitones

    def initialize(chord_id)
      @chord_id = chord_id
      decoded_ids = Converter::ChordIdService.decode_id(chord_id)
      @modification_ids = decoded_ids[:modification_ids]
      @chord_base_id = decoded_ids[:chord_base_id]
      @base = decoded_ids[:base]
    end

    def quality
      name = chord_base.symbol
      modifications.each do |mod|
        name += mod.symbol
      end
      name
    end

    def id
      @chord_id
    end

    def chord_id=(chord_id)
      @chord_id = chord_id
      decode_chord_id
    end

    def modifications
      @modification_ids.map do |modification_id|
        Chord::Modification.find_by_id(modification_id)
      end
    end

    def chord_base
      Chord::Base.find_by_id(@chord_base_id)
    end

    def composition
      composition_relative_to_base.map do |semitone|
        semitone + @base
      end
    end

    private

    def composition_relative_to_base
      relative_to_base = chord_base.composition
      modifications.each do |modification|
        relative_to_base -= modification.remove
        relative_to_base += modification.add
      end
      relative_to_base
    end
  end
end
