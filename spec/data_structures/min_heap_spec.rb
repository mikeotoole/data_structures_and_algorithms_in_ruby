require 'minitest/autorun'
require './data_structures/min_heap'

describe MinHeap do
  let(:heap) { MinHeap.new.add(3).add(4) }

  describe '#add' do
    it 'adds item to heap' do
      heap.add(1)
      assert_equal [1, 4, 3], heap.to_a
    end
  end

  describe '#peak' do
    it 'returns the min value in heap' do
      assert_equal 3, heap.peek
    end

    it 'does not remove value from heap' do
      heap.peek
      assert_equal [3, 4], heap.to_a
    end
  end

  describe '#poll' do
    it 'returns the min value in heap' do
      assert_equal 3, heap.poll
    end

    it 'removes value from heap' do
      heap.poll
      assert_equal [4], heap.to_a
    end
  end
end
