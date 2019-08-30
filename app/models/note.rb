class Note < ActiveHash::Base
  self.data = ActiveHashData::NOTES

  def self.as_hash
    all.index_by(&:symbol)
  end
end