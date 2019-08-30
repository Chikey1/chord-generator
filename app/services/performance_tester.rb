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
  end
end
