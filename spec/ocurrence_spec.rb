require_relative '../occurrence'

describe Occurrence do

  let(:objects)        { [] }
  let(:object_to_find) { rand(1000) }

  subject { described_class.search_for_occurrences(objects, object_to_find) }

  describe '.ocurrence' do
    context 'given an invalid array' do
      context 'nil array' do
        let(:objects) { nil }
        it 'returns correct values' do
          expect(subject).to eq([nil, 0])
        end
      end
    end

    context 'object present in array' do
      let(:objects) {[1,'hello',2,4,'moove-it',4,4]}
      let (:object_to_find) { 'moove-it' }
      it 'returns correct values' do
        expect(subject).to eq([4, 1])
      end
    end

    context 'object is not present in array' do
      let(:object_to_find) { 8 }
      let(:objects) {[1,'hello',2,4,'moove-it',4,4]}
      it 'returns correct values' do
        expect(subject).to eq([nil,0])
      end
    end
  end

end

