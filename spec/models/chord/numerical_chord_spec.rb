# frozen_string_literal: true

describe Chord::NumericalChord, type: :model do
  describe '#valid?' do
    subject do
      Chord::NumericalChord.new(
        base: base,
        quality: quality,
        chord_base_id: chord_base_id,
        modification_ids: modification_ids
      )
    end

    let(:base) { 1 }
    let(:quality) { 'maj7b5' }
    let(:chord_base_id) { Chord::Base.find_by_symbol('maj7').id }
    let(:modification_ids) { [Chord::Modification.find_by_symbol('b5').id] }

    def errors
      subject.errors.full_messages
    end

    context 'with valid attributes' do
      it { is_expected.to be_valid }
    end

    context 'when not unique quality and base' do
      before { subject.dup.save }

      it 'is invalid' do
        is_expected.to_not be_valid
        expect(errors).to include('Quality must be unique with base')
      end
    end

    context 'when base is nil' do
      let(:base) { nil }

      it 'is invalid' do
        is_expected.to_not be_valid
        expect(errors).to include('Base is required')
      end
    end

    context 'when base less than 1' do
      let(:base) { 0 }

      it 'is invalid' do
        is_expected.to_not be_valid
        expect(errors).to include('Base must be an integer between 1 and 12')
      end
    end

    context 'when base greater than 12' do
      let(:base) { 13 }

      it 'is invalid' do
        is_expected.to_not be_valid
        expect(errors).to include('Base must be an integer between 1 and 12')
      end
    end

    context 'when quality is an empty string' do
      let(:quality) { '' }
      let(:chord_base_id) { Chord::Base.find_by_symbol('').id }
      let(:modification_ids) { [] }

      it 'is invalid' do
        is_expected.to be_valid
      end
    end

    context 'when quality is not a string' do
      let(:quality) { nil }

      it 'is invalid' do
        is_expected.to_not be_valid
        expect(errors).to include('Quality must be string')
      end
    end

    context 'with invalid chord base' do
      let(:chord_base_id) { Chord::Base.count + 10 }

      it 'is invalid' do
        is_expected.to_not be_valid
        expect(errors).to include('Chord base is invalid')
      end
    end

    context 'with no modification ids' do
      let(:modification_ids) { nil }

      it 'is invalid' do
        is_expected.to_not be_valid
        expect(errors).to include('Modification ids must be array')
      end
    end

    context 'with duplicate modification ids' do
      let(:modification_ids) { [1, 2, 1] }

      it 'is invalid' do
        is_expected.to_not be_valid
        expect(errors).to include('Modification ids must not have duplicates')
      end
    end

    context 'with invalid modification ids' do
      let(:modification_ids) { [Chord::Modification.count + 10] }

      it 'is invalid' do
        is_expected.to_not be_valid
        expect(errors).to include("Modification ids is invalid: #{Chord::Modification.count + 10}")
      end
    end

    context 'with unmatching quality, chord_base, and modifications' do
      let(:modification_ids) { [] }

      it 'is invalid' do
        is_expected.to_not be_valid
        expect(errors).to include('Quality does not match chord base and modifications')
      end
    end
  end
end
