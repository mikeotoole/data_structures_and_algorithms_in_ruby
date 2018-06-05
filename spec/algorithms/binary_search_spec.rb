require 'minitest/autorun'
require './algorithms/binary_search'

describe BinarySearch do
  let(:array) { [1, 3, 5, 8, 13, 21, 42] }
  subject { BinarySearch.new(array) }

  describe '#contains?' do
    describe 'when the array contains the value' do
      it 'returns true' do
        assert subject.contains?(3)
      end
    end

    describe 'when the array does not contain the value' do
      it 'returns false' do
        refute subject.contains?(14)
      end
    end
  end
end
