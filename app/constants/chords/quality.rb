# frozen_string_literal: true

module Chords
  module Quality
    # CATEGORIES
    UNISON = 'unison' # also individual category
    INTERVAL = 'interval'
    TRIAD = 'triad'
    SEVENTH = 'seventh'
    NINTH = 'ninth'
    ELEVENTH = 'eleventh'
    THIRTEENTH = 'thirteenth'

    # INVTERVAL
    POWER_CHORD = '5'

    # TRIAD
    MAJOR = 'maj'
    MINOR = 'm'
    DIMINISHED = 'dim'
    AUGMENTED = 'aug'

    # SEVENTH
    DOMINANT_SEVENTH = '7'
    MAJOR_SEVENTH = 'maj7'
    MINOR_SEVENTH = 'm7'
    DIMINISHED_SEVENTH = 'dim7'
    HALF_DIMINISHED_SEVENTH = 'm7b5'
    MINOR_MAJOR_SEVENTH = '7b5'

    # NINTH
    DOMINANT_NINTH = '9'
    DOMINANT_MINOR_NINTH = '7b9'
    MINOR_NINTH = 'm9'
    MAJOR_NINTH = 'maj9'

    # ELEVENTH
    DOMINANT_ELEVENTH = '11'
    MINOR_ELEVENTH = 'm11'
    MAJOR_ELEVENTH = 'maj11'

    # THIRTEENTH
    DOMINANT_THIRTEENTH = '13'
    MAJOR_THIRTEENTH = 'maj13'
    MINOR_THIRTEENTH = 'm13'

    # MODIFIED
    MINOR_SEVENTH_NO_FIVE = 'm7no5'
    DOMINANT_SEVENTH_NO_THREE = '7no3'
    MAJOR_SEVENTH_NO_THREE = 'maj7no3'
    MAJOR_SEVENTH_FLAT_FIVE = 'maj7b5'
    DOMINANT_NINTH_NO_THREE = '9no3'
    DOMINANT_NINTH_FLAT_FIVE = '9b5'
    DOMINANT_NINTH_NO_FIVE = '9no5'
    DOMINANT_THIRTEENTH_FLAT_NINE = '13b9'

    # SUSPENDED
    SUSPEND = 'sus' # usually sus4, sometimes sus2
    SUSPEND_TWO = 'sus2'
    SUSPEND_FOUR = 'sus4'
    SUSPEND_SEVEN = 'sus7'

    MINOR_SUSPEND_TWO = 'msus2'

    DOMINANT_SEVENTH_SUSPEND = '7sus'
    DOMINANT_SEVENTH_SUSPEND_TWO = '7sus2'
    DOMINANT_SEVENTH_SUSPEND_FOUR = '7sus4'

    MAJOR_SEVENTH_SUSPEND = 'maj7sus'
    MAJOR_SEVENTH_SUSPEND_TWO = 'maj7sus2'
    MAJOR_SEVENTH_SUSPEND_FOUR = 'maj7sus4'

    DOMINANT_NINTH_SUSPEND = '9sus'
    DOMINANT_NINTH_SUSPEND_TWO = '9sus2'
    DOMINANT_NINTH_SUSPEND_FOUR = '9sus4'

    # ADD
    ADD_TWO = 'add2'
    ADD_FOUR = 'add4'
    ADD_FLAT_SIX = 'addb6'
    ADD_SIX = 'add6'
    ADD_NINE = 'add9'
    ADD_ELEVEN = 'add11'
    ADD_FLAT_THIRTEEN = 'addb13'
    ADD_THIRTEEN = 'add13'

    ADD_FOUR_ADD_SIX = 'add4add6'
    ADD_FOUR_ADD_NINE = 'add4add9'
    ADD_SIX_ADD_NINE = 'add6add9'
    ADD_SIX_ADD_ELEVEN = 'add6add11'

    MINOR_ADD_TWO = 'madd2'
    MINOR_ADD_FOUR = 'madd4'
    MINOR_ADD_FLAT_SIX = 'maddb6'
    MINOR_ADD_SIX = 'madd6'
    MINOR_ADD_FLAT_NINE = 'maddb9'
    MINOR_ADD_NINE = 'madd9'
    MINOR_ADD_ELEVEN = 'madd11'
    MINOR_ADD_THIRTEEN = 'madd13'

    MINOR_ADD_SIX_ADD_NINE = 'madd6add9'

    DOMINANT_SEVENTH_ADD_FOUR = '7add4'
    DOMINANT_SEVENTH_ADD_SIX = '7add6'
    DOMINANT_SEVENTH_ADD_ELEVEN = '7add11'
    DOMINANT_SEVENTH_ADD_FLAT_THIRTEEN = '7addb13'
    DOMINANT_SEVENTH_ADD_THIRTEEN = '7add13'
    DOMINANT_SEVENTH_SUSPEND_FOUR_ADD_FLAT_NINE = '7sus4addb9'

    MINOR_SEVENTH_ADD_FOUR = 'm7add4'
    MINOR_SEVENTH_ADD_FLAT_ELEVEN = 'm7b11'
    MINOR_SEVENTH_ADD_ELEVEN = 'm7add11'
    MINOR_SEVENTH_ADD_FLAT_THIRTEEN = 'm7addb13'
    MINOR_SEVENTH_ADD_THIRTEEN = 'm7add13'

    MAJOR_SEVENTH_ADD_ELEVEN = 'maj7add11'
    MAJOR_SEVENTH_ADD_THIRTEEN = 'maj7add13'

    SUSPEND_ADD_SIX = 'susadd6'
    SUSPEND_TWO_ADD_TWO = 'sus2add2'
    SUSPEND_TWO_ADD_SIX = 'sus2add6'
    SUSPEND_TWO_ADD_ELEVEN = 'sus2add11'
    SUSPEND_TWO_ADD_THIRTEEN = 'sus2add13'
    SUSPEND_FOUR_ADD_SIX = 'sus4add6'
    SUSPEND_FOUR_ADD_NINE = 'sus4add9'
    SUSPEND_FOUR_ADD_THIRTEEN = 'sus4add13'

    ALL = {
      MAJOR => {
        enum: 0,
        name: 'major',
        type: TRIAD,
      },
      MINOR => {
        enum: 1,
        name: 'minor',
        type: TRIAD,
      },
      MINOR_SEVENTH => {
        enum: 2,
        name: 'minor seventh',
        type: SEVENTH,
      },
      DOMINANT_SEVENTH => {
        enum: 3,
        name: 'seventh',
        type: SEVENTH,
      },
      ADD_NINE => {
        enum: 4,
        name: 'add nine',
        type: TRIAD,
      },
      SUSPEND_TWO => {
        enum: 5,
        name: 'suspend two',
        type: TRIAD,
      },
      SUSPEND_FOUR => {
        enum: 6,
        name: 'suspend four',
        type: TRIAD,
      },
      POWER_CHORD => {
        enum: 7,
        name: 'power chord',
        type: INTERVAL,
      },
      SUSPEND => {
        enum: 8,
        name: 'suspend',
        type: TRIAD,
      },
      MAJOR_SEVENTH => {
        enum: 9,
        name: 'major seventh',
        type: SEVENTH,
      },
      DIMINISHED => {
        enum: 10,
        name: 'diminished',
        type: TRIAD,
      },
      DOMINANT_NINTH => {
        enum: 11,
        name: 'dominant ninth',
        type: NINTH,
      },
      MINOR_NINTH => {
        enum: 12,
        name: 'minor ninth',
        type: NINTH,
      },
      MAJOR_NINTH => {
        enum: 13,
        name: 'major ninth',
        type: NINTH,
      },
      ADD_ELEVEN => {
        enum: 14,
        name: 'add eleven',
        type: TRIAD,
      },
      DIMINISHED_SEVENTH => {
        enum: 15,
        name: 'diminished seventh',
        type: SEVENTH,
      },
      ADD_SIX => {
        enum: 16,
        name: 'sixth',
        type: TRIAD,
      },
      ADD_FOUR => {
        enum: 17,
        name: 'add four',
        type: TRIAD,
      },
      MINOR_ADD_SIX => {
        enum: 18,
        name: 'minor add six',
        type: TRIAD,
      },
      DOMINANT_SEVENTH_SUSPEND_FOUR => {
        enum: 19,
        name: 'dominant seventh suspend 4',
        type: SEVENTH,
      },
      DOMINANT_SEVENTH_SUSPEND => {
        enum: 20,
        name: 'dominant seventh suspend',
        type: SEVENTH,
      },
      MINOR_ADD_NINE => {
        enum: 21,
        name: 'minor add nine',
        type: TRIAD,
      },
      ADD_SIX_ADD_NINE => {
        enum: 22,
        name: 'sixth add nine',
        type: TRIAD,
      },
      DOMINANT_SEVENTH_ADD_FOUR => {
        enum: 23,
        name: 'dominant seventh add four',
        type: SEVENTH,
      },
      DOMINANT_ELEVENTH => {
        enum: 24,
        name: 'dominant eleventh',
        type: ELEVENTH,
      },
      MINOR_ELEVENTH => {
        enum: 25,
        name: 'minor eleventh',
        type: ELEVENTH,
      },
      SUSPEND_TWO_ADD_SIX => {
        enum: 26,
        name: 'sixth suspend two',
        type: TRIAD,
      },
      MAJOR_SEVENTH_SUSPEND_TWO => {
        enum: 27,
        name: 'major seventh suspend two',
        type: SEVENTH,
      },
      MAJOR_SEVENTH_SUSPEND => {
        enum: 28,
        name: 'major seventh suspend',
        type: SEVENTH,
      },
      DOMINANT_THIRTEENTH => {
        enum: 29,
        name: 'dominant thirteenth',
        type: THIRTEENTH,
      },
      MAJOR_SEVENTH_SUSPEND_FOUR => {
        enum: 30,
        name: 'major seventh suspend four',
        type: SEVENTH,
      },
      HALF_DIMINISHED_SEVENTH => {
        enum: 31,
        name: 'half diminished seventh',
        type: SEVENTH,
      },
      DOMINANT_MINOR_NINTH => {
        enum: 32,
        name: 'dominant minor ninth',
        type: NINTH,
      },
      ADD_TWO => {
        enum: 33,
        name: 'add two',
        type: TRIAD,
      },
      MINOR_SEVENTH_ADD_ELEVEN => {
        enum: 34,
        name: 'minor seventh add eleven',
        type: SEVENTH,
      },
      DOMINANT_NINTH_SUSPEND_FOUR => {
        enum: 35,
        name: 'dominant ninth suspend four',
        type: NINTH,
      },
      MINOR_ADD_ELEVEN => {
        enum: 36,
        name: 'minor add eleven',
        type: TRIAD,
      },
      MAJOR_THIRTEENTH => {
        enum: 37,
        name: 'major thirteenth',
        type: THIRTEENTH,
      },
      DOMINANT_SEVENTH_SUSPEND_TWO => {
        enum: 38,
        name: 'dominant seventh suspend two',
        type: SEVENTH,
      },
      MINOR_MAJOR_SEVENTH => {
        enum: 39,
        name: 'minor major seventh',
        type: SEVENTH,
      },
      DOMINANT_SEVENTH_ADD_ELEVEN => {
        enum: 40,
        name: 'dominant seventh add eleven',
        type: SEVENTH,
      },
      AUGMENTED => {
        enum: 41,
        name: 'augmented',
        type: TRIAD,
      },
      ADD_THIRTEEN => {
        enum: 42,
        name: 'add thirteen',
        type: TRIAD,
      },
      MAJOR_SEVENTH_ADD_THIRTEEN => {
        enum: 43,
        name: 'major seventh add thirteen',
        type: SEVENTH,
      },
      DOMINANT_SEVENTH_ADD_THIRTEEN => {
        enum: 44,
        name: 'dominant seventh add thirteen',
        type: SEVENTH,
      },
      MAJOR_SEVENTH_FLAT_FIVE => {
        enum: 45,
        name: 'major seventh flat five',
        type: SEVENTH,
      },
      MINOR_ADD_THIRTEEN => {
        enum: 46,
        name: 'minor add thirteen',
        type: TRIAD,
      },
      MINOR_SEVENTH_ADD_FOUR => {
        enum: 47,
        name: 'minor seventh add four',
        type: SEVENTH,
      },
      MINOR_ADD_FOUR => {
        enum: 48,
        name: 'minor add four',
        type: TRIAD,
      },
      ADD_FOUR_ADD_NINE => {
        enum: 49,
        name: 'add four add nine',
        type: TRIAD,
      },
      DOMINANT_THIRTEENTH_FLAT_NINE => {
        enum: 50,
        name: 'dominant thirteenth flat nine',
        type: THIRTEENTH,
      },
      DOMINANT_NINTH_FLAT_FIVE => {
        enum: 51,
        name: 'dominant ninth flat nine',
        type: NINTH,
      },
      DOMINANT_NINTH_SUSPEND => {
        enum: 52,
        name: 'dominant ninth suspend',
        type: NINTH,
      },
      MINOR_SEVENTH_ADD_FLAT_THIRTEEN => {
        enum: 53,
        name: 'minor seventh add flat thirteen',
        type: SEVENTH,
      },
      SUSPEND_SEVEN => {
        enum: 54,
        name: 'suspend seven',
        type: TRIAD,
      },
      DOMINANT_SEVENTH_ADD_FLAT_THIRTEEN => {
        enum: 55,
        name: 'dominant seventh add flat thirteen',
        type: SEVENTH,
      },
      DOMINANT_SEVENTH_ADD_SIX => {
        enum: 56,
        name: 'dominant seventh add six',
        type: SEVENTH,
      },
      MINOR_THIRTEENTH => {
        enum: 57,
        name: 'minor thirteeth',
        type: THIRTEENTH,
      },
      SUSPEND_FOUR_ADD_SIX => {
        enum: 58,
        name: 'sixth suspend four',
        type: TRIAD,
      },
      MINOR_SEVENTH_ADD_THIRTEEN => {
        enum: 59,
        name: 'minor seventh add thirteen',
        type: SEVENTH,
      },
      MINOR_SEVENTH_NO_FIVE => {
        enum: 60,
        name: 'minor seventh no five',
        type: SEVENTH,
      },
      DOMINANT_NINTH_SUSPEND_TWO => {
        enum: 61,
        name: 'dominant ninth suspend two',
        type: NINTH,
      },
      ADD_FOUR_ADD_SIX => {
        enum: 62,
        name: 'sixth add four',
        type: TRIAD,
      },
      SUSPEND_FOUR_ADD_NINE => {
        enum: 63,
        name: 'suspend four add nine',
        type: TRIAD,
      },
      ADD_SIX_ADD_ELEVEN => {
        enum: 64,
        name: 'sixth add eleven',
        type: TRIAD,
      },
      MINOR_ADD_TWO => {
        enum: 65,
        name: 'minor add two',
        type: TRIAD,
      },
      MAJOR_ELEVENTH => {
        enum: 66,
        name: 'major eleventh',
        type: ELEVENTH,
      },
      SUSPEND_TWO_ADD_TWO => {
        enum: 67,
        name: 'suspend two add two',
        type: TRIAD,
      },
      SUSPEND_TWO_ADD_ELEVEN => {
        enum: 68,
        name: 'suspend two add eleven',
        type: TRIAD,
      },
      SUSPEND_TWO_ADD_THIRTEEN => {
        enum: 69,
        name: 'suspend two add thirteen',
        type: TRIAD,
      },
      MINOR_ADD_FLAT_NINE => {
        enum: 70,
        name: 'minor add flat nine',
        type: TRIAD,
      },
      MINOR_SEVENTH_ADD_FLAT_ELEVEN => {
        enum: 71,
        name: 'minor seventh add flat eleven',
        type: SEVENTH,
      },
      ADD_FLAT_SIX => {
        enum: 72,
        name: 'add flat six',
        type: TRIAD,
      },
      SUSPEND_ADD_SIX => {
        enum: 73,
        name: 'sixth suspend',
        type: TRIAD,
      },
      MINOR_ADD_FLAT_SIX => {
        enum: 74,
        name: 'minor add flat six',
        type: TRIAD,
      },
      DOMINANT_SEVENTH_NO_THREE => {
        enum: 75,
        name: 'dominant seventh no three',
        type: SEVENTH,
      },
      DOMINANT_NINTH_NO_FIVE => {
        enum: 76,
        name: 'dominant ninth no five',
        type: NINTH,
      },
      UNISON => {
        enum: 77,
        name: 'unison',
        type: UNISON,
      },
      DOMINANT_SEVENTH_SUSPEND_FOUR_ADD_FLAT_NINE => {
        enum: 78,
        name: 'dominant seventh suspend four add flat nine',
        type: SEVENTH,
      },
      SUSPEND_FOUR_ADD_THIRTEEN => {
        enum: 79,
        name: 'suspend four add thirteen',
        type: TRIAD,
      },
      DOMINANT_NINTH_NO_THREE => {
        enum: 80,
        name: 'dominant ninth no three',
        type: NINTH,
      },
      MAJOR_SEVENTH_NO_THREE => {
        enum: 81,
        name: 'major seventh no three',
        type: SEVENTH,
      },
      MAJOR_SEVENTH_ADD_ELEVEN => {
        enum: 82,
        name: 'major seventh add eleventh',
        type: SEVENTH,
      },
      ADD_FLAT_THIRTEEN => {
        enum: 83,
        name: 'add flat thirteen',
        type: TRIAD,
      },
      MINOR_ADD_SIX_ADD_NINE => {
        enum: 84,
        name: 'minor sixth add nine',
        type: TRIAD,
      },
      MINOR_SUSPEND_TWO => {
        enum: 85,
        name: 'minor suspend two',
        type: TRIAD,
      },
    }.freeze
  end
end
