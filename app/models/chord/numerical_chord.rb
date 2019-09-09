# frozen_string_literal: true

module Chord
  class NumericalChord < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions

    serialize :modification_ids
    belongs_to_active_hash :chord_base, class_name: 'Chord::Base'

    validates :quality, uniqueness: { scope: :base, message: 'must be unique with base' }
    validate :valid_base
    validate :valid_quality
    validate :valid_chord_base_id
    validate :valid_modification_ids

    validate :quality_matches_chord_base_and_modification

    validates :chord_base_id, numericality: { only_integer: true }

    def valid_base
      if base.nil?
        errors.add(:base, 'Base is required')
        return
      end
      return if base > 0 && base <= 12

      errors.add(:base, 'Base must be an integer between 1 and 12')
    end

    def valid_quality
      return if quality.class == String

      errors.add(:quality, 'must be string')
    end

    def valid_chord_base_id
      return if Chord::Base.find_by_id(chord_base_id).present?

      errors.add(:chord_base_id, 'is invalid')
    end

    def valid_modification_ids
      if modification_ids.class != Array
        errors.add(:modification_ids, 'must be array')
        return
      end

      if modification_ids != modification_ids.uniq
        errors.add(:modification_ids, 'must not have duplicates')
        return
      end

      modification_ids.each do |mod_id|
        next if Chord::Modification.find_by_id(mod_id).present?

        errors.add(:modification_ids, "is invalid: #{mod_id}")
      end
    end

    def quality_matches_chord_base_and_modification
      return if errors.present?

      try = quality.dup
      if try.start_with?(chord_base.symbol)
        try.delete_prefix!(chord_base.symbol)

        return if matches_modifications?(modifications, try)
      end
      errors.add(:quality, 'does not match chord base and modifications')
    end

    def matches_modifications?(modifications, try)
      modifications.each do |mod|
        return false if mod.nil?
        next if try.slice!(mod.symbol)

        return false
      end
      try.present?
    end

    def modifications
      modification_ids.map do |mod_id|
        Chord::Modification.find_by_id(mod_id)
      end
    end

    def composition
      composition = chord_base.composition
      modifications.each do |mod|
        composition -= mod.remove
        composition += mod.add
      end
      composition.map do |note|
        comp = note + base - 1
        while comp > 11
          comp -= 12
        end
        while comp < 0
          comp += 12
        end
        comp
      end
    end
  end
end
