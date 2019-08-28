# frozen_string_literal: true

module DataAnalysis
  class CheckChordsService
    def initialize
      @chord_service = ChordService.new
      @unknown_chords = []
    end

    def call
      Tonality::ALL.each do |key, value|
        puts "<----- starting #{key} ------->"
        File.open("app/data/chords_by_key/#{value[:symbol]}.txt", 'r').each do |line|
          check_line_for_chord_quality(line)
        end
      end
      if @unknown_chords.empty?
        puts "YAY YOU'RE GOOD"
      else
        @unknown_chords.each { |uc| puts uc }
      end
    end

    private

    def check_line_for_chord_quality(line)
      chords = line_to_chord_array(line)

      chords.each do |chord|
        # remove key
        chord[0] = ''
        if chord[0] == '#' || chord[0] == 'b'
          # remove flat or sharp
          chord[0] = ''
        end
        if @chord_service.find_chord(chord).nil?
          @unknown_chords.push(chord) unless @unknown_chords.include?(chord)
        end
      end
    end

    def line_to_chord_array(line)
      line.gsub!(/\s/, '') # remove whitespace
      line.sub!(/^.*:/, '') # remove title
      line.split(',')
    end
  end
end
