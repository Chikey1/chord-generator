# frozen_string_literal: true

class PerformanceTester
  class << self
    def call
      start = Time.now
      36_000.times do
        a = Chord::Modification.symbols(type: 'add')
        a = 0
      end
      total = Time.now - start
      puts "total time: #{total}"
    end

    def encode_ids(base, chord_base_id, modification_ids)
      id = 0
      modification_ids.each do |mod|
        id += mod
        id *= 100
      end
      id += chord_base_id
      id *= 100
      id += base
      id
    end

    def decode_chord_id
      id = @chord_id
      @base = id % 100
      id /= 100
      @chord_base_id = id % 100

      @modification_ids = []
      while id > 0
        @modification_ids.push(id % 100)
        id /= 100
      end
    end
  end
end
