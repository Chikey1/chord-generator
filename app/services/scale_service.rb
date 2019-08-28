# frozen_string_literal: true

class ScaleService
  NOTES = Note::ALL.keys

  def distance_in_semitones(lower_note, upper_note)
    lower_index = NOTES.index(lower_note)
    upper_index = NOTES.index(upper_note)

    upper_index += NOTES.length if lower_index > upper_index
    upper_index - lower_index
  end

  def scale_from_key(key)
    note_service = NoteService.new
    root = key.slice!(/[A-G](#|b)?/)
    mode =
      case key
      when 'm'
        'minor'
      else
        'major'
      end

    if note_service.flat?(root)
      converter_service = ConverterService.new
      root = converter_service.flat_to_sharp(root)
    end

    build_scale(root, mode)
  end

  def build_scale(root, mode)
    start_index = NOTES.index(root)
    scale = [root]

    Scale::ALL[mode][:semitone_composition].each do |step|
      start_index += step

      start_index -= NOTES.length if start_index >= NOTES.length

      scale.push(NOTES[start_index])
    end

    scale
  end

  def check_key_signature(scale)
    note_service = NoteService.new
    flats = scale.select { |note| note_service.flat?(note) }
    sharps = scale.select { |note| note_service.sharp?(note) }

    check_sharp_key_signature(sharps) && check_flat_key_signature(flats)
  end

  private

  def check_flat_key_signature(flats)
    valid = true
    flats.length.times do |index|
      flat = KeySignature::FLATS[index]
      valid &= flats.include?(flat)
    end
    valid
  end

  def check_sharp_key_signature(sharps)
    valid = true
    sharps.length.times do |index|
      sharp = KeySignature::FLATS[index]
      valid &= sharps.include?(sharp)
    end
    valid
  end
end
