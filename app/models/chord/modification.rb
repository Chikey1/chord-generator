module Chord
  class Modification < ActiveHash::Base
    field :add, default: []
    field :remove, default: []

    self.data = ActiveHashData::Chord::MODIFICATIONS
     # remove: every note in semitones from base note (base note is 0)
     # add: every note in semitones from base note (base note is 0)

    def self.symbols(type: nil)
      list = all.map(&:symbol)
      case type
      when "add", "no", "sus"
        list.select { |symbol| symbol.include?(type) }
      when "change"
        list.select { |symbol| !symbol.match?(/(add|no|sus)/) }
      when nil
        list
      end
    end

    def self.where_type(type)
      case type
      when "add"
        all.select { |el| el.symbol.include?("add") }
      when "no"
        all.select { |el| el.symbol.include?("no") }
      when "change"
        all.select { |el| !el.symbol.match?(/(add|no|sus)/) }
      when "sus"
        all.select { |el| el.symbol.include?("sus") }
      end
    end
  end
end