# frozen_string_literal: true

module Tonality
  C_FLAT_MAJOR = 'Cb major'
  A_FLAT_MINOR = 'Ab minor'
  G_FLAT_MAJOR = 'Gb major'
  E_FLAT_MINOR = 'Eb minor'
  D_FLAT_MAJOR = 'Db major'
  B_FLAT_MINOR = 'Bb minor'
  A_FLAT_MAJOR = 'Ab major'
  F_MINOR = 'F minor'
  E_FLAT_MAJOR = 'Eb major'
  C_MINOR = 'C minor'
  B_FLAT_MAJOR = 'Bb major'
  G_MINOR = 'G minor'
  F_MAJOR = 'F major'
  D_MINOR = 'D minor'
  C_MAJOR = 'C major'
  A_MINOR = 'A minor'
  G_MAJOR = 'G major'
  E_MINOR = 'E minor'
  D_MAJOR = 'D major'
  B_MINOR = 'B minor'
  A_MAJOR = 'A major'
  F_SHARP_MINOR = 'F# minor'
  E_MAJOR = 'E major'
  C_SHARP_MINOR = 'C# minor'
  B_MAJOR = 'B major'
  G_SHARP_MINOR = 'G# minor'
  F_SHARP_MAJOR = 'F# major'
  D_SHARP_MINOR = 'D# minor'
  C_SHARP_MAJOR = 'C# major'
  A_SHARP_MINOR = 'A# minor'

  MAJOR = 'major'
  MINOR = 'minor'

  ALL = {
    C_FLAT_MAJOR => {
      enum: 0,
      symbol: 'Cb',
      flats: 7,
      sharps: 0,
      type: MAJOR,
    },
    G_FLAT_MAJOR => {
      enum: 1,
      symbol: 'Gb',
      flats: 6,
      sharps: 0,
      type: MAJOR,
    },
    D_FLAT_MAJOR => {
      enum: 2,
      symbol: 'Db',
      flats: 5,
      sharps: 0,
      type: MAJOR,
    },
    A_FLAT_MAJOR => {
      enum: 3,
      symbol: 'Ab',
      flats: 4,
      sharps: 0,
      type: MAJOR,
    },
    E_FLAT_MAJOR => {
      enum: 4,
      symbol: 'Eb',
      flats: 3,
      sharps: 0,
      type: MAJOR,
    },
    B_FLAT_MAJOR => {
      enum: 5,
      symbol: 'Bb',
      flats: 2,
      sharps: 0,
      type: MAJOR,
    },
    F_MAJOR => {
      enum: 6,
      symbol: 'F',
      flats: 1,
      sharps: 0,
      type: MAJOR,
    },
    C_MAJOR => {
      enum: 7,
      symbol: 'C',
      flats: 0,
      sharps: 0,
      type: MAJOR,
    },
    G_MAJOR => {
      enum: 8,
      symbol: 'G',
      flats: 0,
      sharps: 1,
      type: MAJOR,
    },
    D_MAJOR => {
      enum: 9,
      symbol: 'D',
      flats: 0,
      sharps: 2,
      type: MAJOR,
    },
    A_MAJOR => {
      enum: 10,
      symbol: 'A',
      flats: 0,
      sharps: 3,
      type: MAJOR,
    },
    E_MAJOR => {
      enum: 11,
      symbol: 'E',
      flats: 0,
      sharps: 4,
      type: MAJOR,
    },
    B_MAJOR => {
      enum: 12,
      symbol: 'B',
      flats: 0,
      sharps: 5,
      type: MAJOR,
    },
    F_SHARP_MAJOR => {
      enum: 13,
      symbol: 'F#',
      flats: 0,
      sharps: 6,
      type: MAJOR,
    },
    C_SHARP_MAJOR => {
      enum: 14,
      symbol: 'C#',
      flats: 0,
      sharps: 7,
      type: MAJOR,
    },
    A_FLAT_MINOR => {
      enum: 15,
      symbol: 'Abm',
      flats: 7,
      sharps: 0,
      type: MINOR,
    },
    E_FLAT_MINOR => {
      enum: 16,
      symbol: 'Ebm',
      flats: 6,
      sharps: 0,
      type: MINOR,
    },
    B_FLAT_MINOR => {
      enum: 17,
      symbol: 'Bbm',
      flats: 5,
      sharps: 0,
      type: MINOR,
    },
    F_MINOR => {
      enum: 18,
      symbol: 'Fm',
      flats: 4,
      sharps: 0,
      type: MINOR,
    },
    C_MINOR => {
      enum: 19,
      symbol: 'Cm',
      flats: 3,
      sharps: 0,
      type: MINOR,
    },
    G_MINOR => {
      enum: 20,
      symbol: 'Gm',
      flats: 2,
      sharps: 0,
      type: MINOR,
    },
    D_MINOR => {
      enum: 21,
      symbol: 'Dm',
      flats: 1,
      sharps: 0,
      type: MINOR,
    },
    A_MINOR => {
      enum: 22,
      symbol: 'Am',
      flats: 0,
      sharps: 0,
      type: MINOR,
    },
    E_MINOR => {
      enum: 23,
      symbol: 'Em',
      flats: 0,
      sharps: 1,
      type: MINOR,
    },
    B_MINOR => {
      enum: 24,
      symbol: 'Bm',
      flats: 0,
      sharps: 2,
      type: MINOR,
    },
    F_SHARP_MINOR => {
      enum: 25,
      symbol: 'F#m',
      flats: 0,
      sharps: 3,
      type: MINOR,
    },
    C_SHARP_MINOR => {
      enum: 26,
      symbol: 'C#m',
      flats: 0,
      sharps: 4,
      type: MINOR,
    },
    G_SHARP_MINOR => {
      enum: 27,
      symbol: 'G#m',
      flats: 0,
      sharps: 5,
      type: MINOR,
    },
    D_SHARP_MINOR => {
      enum: 28,
      symbol: 'D#m',
      flats: 0,
      sharps: 6,
      type: MINOR,
    },
    A_SHARP_MINOR => {
      enum: 29,
      symbol: 'A#m',
      flats: 0,
      sharps: 7,
      type: MINOR,
    },
  }.freeze
end
