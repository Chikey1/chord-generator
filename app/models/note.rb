class Note < ApplicationRecord
  validates :name, presence: true, uniqueness: true, format: /[A-G](\s(sharp|flat))?/
  validates :symbol, presence: true, uniqueness: true, format: /[A-G](b|#)?/

  validate :enharmonic_exists
  validate :name_matches_symbol

  def enharmonic
    Note.find_by(id:enharmonic_id)
  end

  def enharmonic_exists
    return if enharmonic_id.nil?
    if enharmonic_id == id
      return errors.add(:enharmonic_id, "enharmonic cannot refer to itself")
    end
    if Note.find(enharmonic_id).nil?
      return errors.add(:enharmonic_id, "note does not exist")
    end
  end

  def name_matches_symbol
    valid = true
    valid &= name[0] == symbol[0]
    valid &= name.include?("sharp") == symbol.include?("#")
    valid &= name.include?("flat") == symbol.include?("b")
    return if valid
    errors.add(:base, "name must match symbol")
  end

  def sharp?
    symbol.include?("#")
  end

  def flat?
    symbol.include?("b")
  end
end
