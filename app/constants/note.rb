# frozen_string_literal: true

module Note
  C = 'C'
  C_SHARP = 'C#'
  D = 'D'
  D_SHARP = 'D#'
  E = 'E'
  F = 'F'
  F_SHARP = 'F#'
  G = 'G'
  G_SHARP = 'G#'
  A = 'A'
  A_SHARP = 'A#'
  B = 'B'

  # with sharps
  ALL = {
    C => {
      enum: 0,
      name: 'C'
    },
    C_SHARP => {
      enum: 1,
      name: 'C sharp'
    },
    D => {
      enum: 2,
      name: 'D'
    },
    D_SHARP => {
      enum: 3,
      name: 'D sharp'
    },
    E => {
      enum: 4,
      name: 'E'
    },
    F => {
      enum: 5,
      name: 'F'
    },
    F_SHARP => {
      enum: 6,
      name: 'F sharp'
    },
    G => {
      enum: 7,
      name: 'G'
    },
    G_SHARP => {
      enum: 8,
      name: 'G sharp'
    },
    A => {
      enum: 9,
      name: 'A'
    },
    A_SHARP => {
      enum: 10,
      name: 'A sharp'
    },
    B => {
      enum: 11,
      name: 'B'
    }
  }.freeze
end
