# frozen_string_literal: true

module Chord
  class Base < ActiveHash::Base
    field :omit, default: []

    self.data = ActiveHashData::Chord::BASES
    # composition: every note in semitones from base note (base note is 0)

    def self.as_hash
      all.index_by(&:symbol)
    end

    def self.symbols
      all.map(&:symbol)
    end
  end
end
