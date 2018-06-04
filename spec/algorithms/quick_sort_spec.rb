require 'minitest/autorun'
require './algorithms/quick_sort'

describe QuickSort do
  let(:array) { [2, 4, 0, 1, 3] }
  subject { QuickSort.new(array) }

  describe '#sort' do
    describe 'with integer array' do
      it 'sorts' do
        assert_equal [0, 1, 2, 3, 4], subject.sort
      end
    end

    describe 'when string array' do
      let(:array) { ['zero', '1', 'c', 'b', 'a'] }
      
      it 'sorts' do
        assert_equal ['1', 'a', 'b', 'c', 'zero'], subject.sort
      end
    end
  end
end
