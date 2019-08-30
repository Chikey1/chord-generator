# frozen_string_literal: true
module DataConversion
  module Enharmonics
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

    TO_FLAT = {
      C_SHARP => D_FLAT,
      D_SHARP => E_FLAT,
      F_SHARP => G_FLAT,
      G_SHARP => A_FLAT,
      A_SHARP => B_FLAT,
    }.freeze

    TO_SHARP = {
      D_FLAT => C_SHARP,
      E_FLAT => D_SHARP,
      G_FLAT => F_SHARP,
      A_FLAT => G_SHARP,
      B_FLAT => A_SHARP,
    }.freeze

    TO_BACKEND = {
      D_FLAT => C_SHARP,
      E_FLAT => D_SHARP,
      G_FLAT => F_SHARP,
      A_FLAT => G_SHARP,
      B_FLAT => A_SHARP,
      "E#" => "F",
      "B#" => "C",
      "Cb" => "B",
      "Fb" => "E",
    }.freeze
  end
end
