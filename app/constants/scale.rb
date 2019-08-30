# frozen_string_literal: true

module Scale
  MAJOR = 'major'
  MINOR = 'minor'

  ALL = {
    MAJOR => {
      enum: 0,
      semitone_composition: [2, 2, 1, 2, 2, 2, 1],
    },
    MINOR => {
      enum: 1,
      semitone_composition: [2, 1, 2, 2, 1, 2, 2],
    },
  }.freeze
end
