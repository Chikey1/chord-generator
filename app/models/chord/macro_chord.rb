# frozen_string_literal: true

module Chord
  class MacroChord
    attr_reader :key, :quality, :modifications, :base, :unknown

    def initialize(chord_name)
      @chord_name = chord_name
      attributes = Converter::MacroChordService.call(chord_name)
      @key = attributes[:key]
      @quality = attributes[:quality]
      @modifications = attributes[:modifications]
      @base = attributes[:base]
      @unknown = attributes[:unknown]
    end

    def chord_name=(chord_name)
      @chord_name = chord_name
      attributes = Converter::MacroChordService.call(chord_name)
      @key = attributes[:key]
      @quality = attributes[:quality]
      @modifications = attributes[:modifications]
      @base = attributes[:base]
      @unknown = attributes[:unknown]
    end

    def valid?
      valid_key? && valid_quality?
    end

    def valid_quality?
      @unknown.blank?
    end

    def valid_key?
      return true if Note.find_by_symbol(@key).present?
      return true if Note.find_by_symbol(DataConversion::Enharmonics::TO_SHARP[@key]).present?

      false
    end
  end
end
