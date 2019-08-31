# frozen_string_literal: true

module Chord
  class FindNumericalChordService < Chord::NumericalChordTools
    class << self
      def call(chord_name:, tonality:)
        base, quality = get_base_and_quality(chord_name)
        base = get_numerical_base(base, tonality)
        Chord::NumericalChord.find_by(quality: quality, base: base)
      end
    end
  end
end
