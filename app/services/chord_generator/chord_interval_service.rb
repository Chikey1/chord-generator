# frozen_string_literal: true

module ChordGenerator
  class ChordIntervalService
    class << self
      def get_chord_intervals(notes, time_signature, changes)
        chord_intervals = []
        interval = []

        notes.each do |note|
          remaining = time_signature / changes - get_beats(interval)

          if remaining > 0 && remaining >= note[:length]
            interval.push(note)
          elsif remaining > 0
            interval.push(
              length: remaining,
              number: note[:number]
            )

            leftover = note[:length] - remaining
            chord_intervals.push(interval)

            interval = []
            interval.push(
              length: leftover,
              number: note[:number]
            )
          else
            chord_intervals.push(interval)
            interval = []
            interval.push(note)
          end
        end
        chord_intervals.push(interval) unless interval.empty?
        chord_intervals
      end

      def get_weighted_chord_intervals(chord_intervals)
        chord_intervals.map do |interval|
          weighted_interval = Array.new(13, 0)
          interval.each do |note|
            next if note[:number].nil?

            weighted_interval[note[:number]] += note[:length]
          end
          weighted_interval
        end
      end

      private

      def get_beats(interval)
        interval.map do |note|
          note[:length]
        end.sum
      end
    end
  end
end
