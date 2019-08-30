require 'rails_helper'

describe Converter::ChordIdService do
  describe ".id_from_name" do
    def get_chord_id(chord_name, tonality)
      Converter::ChordIdService.id_from_name(
        chord_name: chord_name,
        tonality: tonality,
      )
    end
    def get_chord(chord_id)
      Chord::NumericalChord.new(chord_id)
    end

    it "returns the correct id" do
      chord_id = get_chord_id("C", "C")
      chord = Chord::NumericalChord.new(chord_id)
      expect(chord.quality).to be_empty
      expect(chord.base).to eq(1)

      chord_id = get_chord_id("C#", "C")
      chord = Chord::NumericalChord.new(chord_id)
      expect(chord.quality).to be_empty
      expect(chord.base).to eq(2)

      chord_id = get_chord_id("C#m", "C")
      chord = Chord::NumericalChord.new(chord_id)
      expect(chord.quality).to eq("m")
      expect(chord.base).to eq(2)

      chord_id = get_chord_id("C#madd6", "C")
      chord = Chord::NumericalChord.new(chord_id)
      expect(chord.quality).to eq("madd6")
      expect(chord.base).to eq(2)

      chord_id = get_chord_id("C#madd6add9", "C")
      chord = Chord::NumericalChord.new(chord_id)
      expect(chord.quality).to eq("madd6add9")
      expect(chord.base).to eq(2)
    end
  end

  describe ".get_relative_base" do
    subject { Converter::ChordIdService.send(
      :get_relative_base,
      base,
      tonality,
    )}

    context "with clean tonality" do
      let(:base) { "C" }
      let(:tonality) { "C" }

      it { is_expected.to be(1) }
    end

    context "with dirty tonality" do
      let(:tonality) { "Cbm" }
      let(:base) { "D" }

      it { is_expected.to be(4) }
    end

    context "with higher tonality" do
      let(:base) { "C" }
      let(:tonality) { "D" }

      it { is_expected.to be(11) }
    end
  end

  describe ".encode_id" do
    subject { Converter::ChordIdService.encode_id(
      base: base,
      chord_base_id: chord_base_id,
      modification_ids: modification_ids,
    )}

    let(:base) { 2 }
    let(:chord_base_id) { 5 }

    context "with no modifications" do\
      let(:modification_ids) { [] }
      it "correctly encodes" do
        is_expected.to eq(502)
      end
    end

    context "with one modification" do
      let(:modification_ids) { [15] }
      it "correctly encodes" do
        is_expected.to eq(150502)
      end
    end

    context "with many modifications" do
      let(:modification_ids) { [2, 6, 12] }
      it "correctly encodes" do
        is_expected.to eq(206120502)
      end
    end
  end

  describe ".decode_id" do
    let(:decoded_ids) { Converter::ChordIdService.decode_id(chord_id) }
    let(:chord_id) {502}

    it "corectly decodes the base" do
      expect(decoded_ids[:base]).to eq(2)
    end

    it "correctly decodes the chord_base_id" do
      expect(decoded_ids[:chord_base_id]).to eq(5)

    end

    context "with no modifications" do
      let(:chord_id) {502}
      it "correctly decodes the modification_ids" do
        expect(decoded_ids[:modification_ids]).to match_array([])
      end
    end

    context "with one modification" do
      let(:chord_id) {150502}
      it "correctly decodes the modification_ids" do
        expect(decoded_ids[:modification_ids]).to match_array([15])
      end
    end

    context "with many modifications" do
      let(:chord_id) {206120502}
      it "correctly decodes the modification_ids" do
        expect(decoded_ids[:modification_ids]).to match_array([2,6,12])
      end
    end
  end
end