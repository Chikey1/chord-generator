# frozen_string_literal: true

module Matrices
  class GenerateService
    class << self
      def call
        update_composition_matrix
        update_naive_next_matrix('major')
        update_naive_next_matrix('minor')
        update_first_note_matrix('major')
        update_first_note_matrix('minor')
        update_last_note_matrix('major')
        update_last_note_matrix('minor')
        update_overall_matrix('major')
        update_overall_matrix('minor')
        update_grouping_matrix
      end

      def update_composition_matrix
        matrix = Array.new(Chord::NumericalChord.count + 1) do
          Array.new(13, 0)
        end
        Chord::NumericalChord.find_each do |chord|
          weight = (1.0 / chord.composition.length).round(3)
          chord.composition.each do |note|
            matrix[chord.id][note] = weight
          end
        end

        File.open('app/data/matrices/chord_composition.json', 'w') do |file|
          file.puts matrix.to_json
        end
      end

      def update_naive_next_matrix(type)
        dim = Chord::NumericalChord.count + 1
        naive_next = JSON.parse(File.open("app/data/factors/#{type}/naive_next.json", 'r').first)
        matrix = Array.new(dim) do
          Array.new(dim, 0)
        end
        naive_next.each_with_index do |relations, chord1|
          next if relations.nil?

          relations.each_with_index do |percent, chord2|
            matrix[chord1][chord2] = percent
          end
        end

        File.open("app/data/matrices/#{type}/naive_next.json", 'w') do |file|
          file.puts matrix.to_json
        end
      end

      def update_first_note_matrix(type)
        dim = Chord::NumericalChord.count + 1
        first_note = JSON.parse(File.open("app/data/factors/#{type}/first_note.json", 'r').first)
        matrix = Array.new(dim, 0)
        first_note.each_with_index do |percent, chord|
          next if percent.nil?

          matrix[chord] = percent
        end

        File.open("app/data/matrices/#{type}/first_note.json", 'w') do |file|
          file.puts matrix.to_json
        end
      end

      def update_last_note_matrix(type)
        dim = Chord::NumericalChord.count + 1
        last_note = JSON.parse(File.open("app/data/factors/#{type}/last_note.json", 'r').first)
        matrix = Array.new(dim, 0)
        last_note.each_with_index do |percent, chord|
          next if percent.nil?

          matrix[chord] = percent
        end

        File.open("app/data/matrices/#{type}/last_note.json", 'w') do |file|
          file.puts matrix.to_json
        end
      end

      def update_overall_matrix(type)
        dim = Chord::NumericalChord.count + 1
        overall = JSON.parse(File.open("app/data/factors/#{type}/overall.json", 'r').first)
        matrix = Array.new(dim, 0)
        overall.each_with_index do |percent, chord|
          next if percent.nil?

          matrix[chord] = percent
        end

        File.open("app/data/matrices/#{type}/overall.json", 'w') do |file|
          file.puts matrix.to_json
        end
      end

      def update_grouping_matrix
        dim = Chord::NumericalChord.count + 1
        grouping = JSON.parse(File.open('app/data/factors/same_song_frequency.json', 'r').first)
        matrix = Array.new(dim) do
          Array.new(dim, 0)
        end

        grouping.each_with_index do |relations, chord1|
          next if relations.nil?

          relations.each_with_index do |percent, chord2|
            matrix[chord1][chord2] = percent
          end
        end

        File.open('app/data/matrices/grouping.json', 'w') do |file|
          file.puts matrix.to_json
        end
      end
    end
  end
end
