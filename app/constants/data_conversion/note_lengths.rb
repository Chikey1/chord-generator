# frozen_string_literal: true

module DataConversion
  module NoteLengths
    WHOLE = "whole"
    HALF = "half"
    QUARTER = "quarter"
    EIGHTH = "eighth"
    SIXTEENTH = "sixteenth"

    TO_NUMBER = {
      WHOLE => 1,
      HALF => 2,
      QUARTER => 4,
      EIGHTH => 8,
      SIXTEENTH => 16,
    }.freeze
  end
end
