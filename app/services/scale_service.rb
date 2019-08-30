# frozen_string_literal: true

class ScaleService
  class << self
    def scale_from_key(key)
      root = key.slice!(/[A-G](#|b)?/)
      mode =
        case key
        when 'm'
          'minor'
        else
          'major'
        end

      root = DataConversion::Enharmonics::TO_SHARP(root) if NoteService.flat?(root)

      build_scale(root, mode)
    end

    def build_scale(root, mode)
      start_index = Note.find_by_symbol(root).id
      scale = [root]

      Scale::ALL[mode][:semitone_composition].each do |step|
        start_index += step

        start_index -= Note.count if start_index > Note.count

        scale.push(Note.find(start_index).symbol)
      end

      scale
    end

    def check_key_signature(scale)
      flats = scale.select { |note| NoteService.flat?(note) }
      sharps = scale.select { |note| NoteService.sharp?(note) }

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
end
