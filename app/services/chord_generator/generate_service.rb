module ChordGenerator
  class GenerateService
    class << self
      include DataConversion::Enharmonics

      def call
        data = JSON.parse(File.open("app/dummy_data/ode_to_joy.json", 'r').first)

        tonality = Tonality::ALL[data["key_signature"]]
        tonic = get_tonic(tonality)

        notes = ChordGenerator::CleanData.call(data["measures"], tonality)
        notes = numerical_notes(notes, tonic)
        return { error: "bad data!" } unless notes

        # for now, use time signature as chord interval
        time_signature = Rational(data["time_signature"]["top"], data["time_signature"]["bottom"])
        chord_intervals = ChordGenerator::ChordIntervalService.get_chord_intervals(
          notes, time_signature, data["chord_interval"]
        )
        chord_intervals = ChordGenerator::ChordIntervalService.get_weighted_chord_intervals(chord_intervals)
        chord_ids = ChordGenerator::CalculateChordsService.call(chord_intervals, tonality[:type])
        chord_symbols = chord_ids.map do |id|
          next if id.nil?
          Converter::MacroChordService.call(id, tonic)
        end
        byebug
      end
    private
      def get_tonic(tonality)
        tonic = tonality[:symbol][0]
        if tonality[:symbol][1] == '#' || tonality[:symbol][1] == 'b'
          tonic += tonality[:symbol][1]
        end

        return tonic if TO_BACKEND[tonic].nil?
        TO_BACKEND[tonic]
      end

      def numerical_notes(notes, tonic)
        notes.map do |note|
          return note if note[:symbol].nil?
          {
            length: note[:length],
            number: NoteService.semitone_distance(tonic, note[:symbol]),
          }
        end
      end
    end
  end
end