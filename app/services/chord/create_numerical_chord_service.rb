# frozen_string_literal: true

module Chord
  class CreateNumericalChordService < NumericalChordTools
    class << self
      # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
      def call(chord_name:, tonality:)
        base, quality = get_base_and_quality(chord_name.dup)
        base = get_numerical_base(base, tonality)

        chord_base, modifications = get_quality_attributes(quality)

        puts "CREATE NEW CHORD: #{chord_name}"
        puts "base: #{base},"
        puts "quality: \"#{quality}\","
        puts "chord_base: \"#{chord_base}\","
        puts "modifications: #{modifications}"
        answer = ''
        while answer != 'Y' && answer != 'n'
          puts 'enter Y/n'
          answer = gets.chomp
        end
        if answer == 'Y'
          chord = Chord::NumericalChord.new(get_creation_params(base, quality, chord_base, modifications))

          return chord if chord.save

          raise "Unable to create chord: #{chord.errors.full_messages}"
        else
          false
        end
      end
      # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

      private

      def get_creation_params(base, quality, chord_base, modifications)
        {
          base: base,
          quality: quality,
          chord_base_id: Chord::Base.find_by_symbol(chord_base).id,
          modification_ids: modifications.map do |mod|
            Chord::Modification.find_by_symbol(mod).id
          end,
        }
      end
    end
  end
end
