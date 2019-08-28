# frozen_string_literal: true

class ChordService
  def find_chord(chord_name)
    chord_name = chord_name.split('/')[0] if slash_chord?(chord_name)

    chord = Chords::Quality::ALL[chord_name]

    if chord.nil?
      chord_name = Chords::QualityAlternativeNames::ALL[chord_name]
      return nil if chord_name.nil?

      chord = Chords::Quality::ALL[chord_name]
    end
    chord
  end

  def slash_chord?(chord)
    chord.include?('/')
  end
end
