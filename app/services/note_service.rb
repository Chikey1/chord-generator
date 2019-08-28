# frozen_string_literal: true

class NoteService
  def sharp?(note)
    note.include?('#')
  end

  def flat?(note)
    note.include?('b')
  end
end
