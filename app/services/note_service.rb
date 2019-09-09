# frozen_string_literal: true

class NoteService
  class << self
    def semitone_distance(lower_note, upper_note)
      lower_index = get_note_index(lower_note)
      upper_index = get_note_index(upper_note)

      upper_index += Note.count if lower_index > upper_index
      upper_index - lower_index
    end

    def get_note_from_distance(note, semitone_distance)
      index = get_note_index(note)
      index += semitone_distance
      while index < 1 || index > 12
        if index < 1
          index += 12
        else
          index -= 12
        end
      end
      Note.find_by_id(index)
    end

    def get_note_index(note)
      Note.find_by_symbol(note).id
    end

    def sharp?(note)
      note.include?('#')
    end

    def flat?(note)
      note.include?('b')
    end
  end
end
