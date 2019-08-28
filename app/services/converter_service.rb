# frozen_string_literal: true

class ConverterService
  SCALE = Note::ALL.keys

  # def tonal_to_numerical(chord, _key)
  #   tone = chord.slice!(/[A-G](#|b)?/)

  # end

  def sharps_to_flats(notes)
    notes.map do |note|
      sharp_to_flat(note)
    end
  end

  def flats_to_sharps(notes)
    notes.map do |note|
      flat_to_sharp(note)
    end
  end

  def sharp_to_flat(note)
    Enharmonic::ALL[note]
  end

  def flat_to_sharp(note)
    Enharmonic::ALL.key(note)
  end
end
