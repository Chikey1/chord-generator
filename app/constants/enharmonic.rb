# frozen_string_literal: true

module Enharmonic
  C_SHARP = 'C#'
  D_FLAT = 'Db'

  D_SHARP = 'D#'
  E_FLAT = 'Eb'

  F_SHARP = 'F#'
  G_FLAT = 'Gb'

  G_SHARP = 'G#'
  A_FLAT = 'Ab'

  A_SHARP = 'A#'
  B_FLAT = 'Bb'

  ALL = {
    C_SHARP => D_FLAT,
    D_SHARP => E_FLAT,
    F_SHARP => G_FLAT,
    G_SHARP => A_FLAT,
    A_SHARP => B_FLAT
  }.freeze
end
