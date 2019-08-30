# frozen_string_literal: true

require 'rails_helper'

describe Converter::MacroChordService do
  describe '.call' do
    def get_key(name)
      Converter::MacroChordService.call(name)[:key]
    end

    def get_quality(name)
      Converter::MacroChordService.call(name)[:quality]
    end

    def get_base(name)
      Converter::MacroChordService.call(name)[:base]
    end

    def get_modifications(name)
      Converter::MacroChordService.call(name)[:modifications]
    end

    it 'returns the correct key' do
      expect(get_key('B')).to eq('B')
      expect(get_key('Bb')).to eq('Bb')
      expect(get_key('B#')).to eq('B#')
      expect(get_key('Bbmaj7')).to eq('Bb')
      expect(get_key('B#maj7')).to eq('B#')
      expect(get_key('Bbmaj7add13')).to eq('Bb')
      expect(get_key('B#maj7add13')).to eq('B#')
      expect(get_key('Bbmaj7add6add13')).to eq('Bb')
      expect(get_key('B#maj7add6add13')).to eq('B#')
    end

    it 'returns the correct quality' do
      expect(get_quality('B')).to be_empty
      expect(get_quality('Bb')).to be_empty
      expect(get_quality('B#')).to be_empty
      expect(get_quality('Bbmaj7')).to eq('maj7')
      expect(get_quality('B#maj7')).to eq('maj7')
      expect(get_quality('Bbmaj7add13')).to eq('maj7add13')
      expect(get_quality('B#maj7add13')).to eq('maj7add13')
      expect(get_quality('Bbmaj7add6add13')).to eq('maj7add6add13')
      expect(get_quality('B#maj7add6add13')).to eq('maj7add6add13')
    end

    it 'returns the correct base' do
      expect(get_base('B')).to be_empty
      expect(get_base('Bb')).to be_empty
      expect(get_base('B#')).to be_empty
      expect(get_base('Bbmaj7')).to eq('maj7')
      expect(get_base('B#maj7')).to eq('maj7')
      expect(get_base('Bbmaj7add13')).to eq('maj7')
      expect(get_base('B#maj7add13')).to eq('maj7')
      expect(get_base('Bbmaj7add6add13')).to eq('maj7')
      expect(get_base('B#maj7add6add13')).to eq('maj7')
    end

    it 'returns the correct modifications' do
      expect(get_modifications('B')).to be_empty
      expect(get_modifications('Bb')).to be_empty
      expect(get_modifications('B#')).to be_empty
      expect(get_modifications('Bbmaj7')).to be_empty
      expect(get_modifications('B#maj7')).to be_empty
      expect(get_modifications('Bbmaj7add13')).to match_array(['add13'])
      expect(get_modifications('B#maj7add13')).to match_array(['add13'])
      expect(get_modifications('Bbmaj7add6add13')).to match_array(%w[add6 add13])
      expect(get_modifications('B#maj7add6add13')).to match_array(%w[add6 add13])
    end

    it 'raises an error for unknown chords' do
      expect { get_key('Bm123') }.to raise_error('could not decode Bm123')
    end
  end
end
