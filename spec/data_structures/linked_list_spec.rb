require 'minitest/autorun'
require './data_structures/linked_list'

# Tests for the LinkedListNode class.
describe LinkedList do
  let(:list) { LinkedList.new }

  describe '#head' do
    it 'returns nil with new list' do
      assert_nil list.head
    end
  end

  describe '#prepend' do
    describe 'when the list is empty' do
      it 'adds data to the list' do
        list.prepend(1)
        assert_equal [1], list.to_a
      end
    end

    describe 'when the list is not empty' do
      let(:list) { LinkedList.new([2, 3]) }

      it 'adds a node to the beginning of the list' do
        list.prepend(1)
        assert_equal [1, 2, 3], list.to_a
      end
    end
  end

  describe '#append' do
    describe 'when the list is empty' do
      it 'adds data to the list' do
        list.append(1)
        assert_equal [1], list.to_a
      end
    end

    describe 'when the list is not empty' do
      let(:list) { LinkedList.new([1]) }

      it 'adds data to the end of the list' do
        list.append(2)
        assert_equal [1, 2], list.to_a
      end
    end
  end

  describe '#delete' do
    let(:list) { LinkedList.new([1, 2]) }

    describe 'when the list contains the value' do
      it 'removes the value' do
        list.delete(1)
        assert_equal [2], list.to_a
      end

      it 'returns true' do
        assert list.delete(1)
      end
    end

    describe 'when the contains only the value' do
      let(:list) { LinkedList.new([1]) }

      it 'removes the value' do
        list.delete(1)
        assert_equal [], list.to_a
      end

      it 'returns true' do
        assert list.delete(1)
      end
    end

    describe 'when the list is not empty' do
      it 'returns false' do
        assert !list.delete(42)
      end
    end
  end
end
