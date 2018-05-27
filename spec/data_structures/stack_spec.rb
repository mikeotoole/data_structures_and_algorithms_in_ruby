require 'minitest/autorun'
require './data_structures/stack'

describe Stack do
  let(:stack) { Stack.new.push(1).push(2) }

  describe '#empty?' do
    describe 'when no items are in the stack' do
      let(:stack) { Stack.new }

      it 'returns true' do
        assert stack.empty?
      end
    end

    describe 'when at least one item is in the stack' do
      it 'returns false' do
        assert !stack.empty?
      end
    end
  end

  describe '#push' do
    describe 'when no items are in the stack' do
      let(:stack) { Stack.new }

      it 'adds item to front of stack' do
        stack.push(3)
        assert_equal [3], stack.to_a
      end
    end

    describe 'when at least one item is in the stack' do
      it 'adds item to front of stack' do
        stack.push(3)
        assert_equal [3, 2, 1], stack.to_a
      end
    end
  end

  describe '#pop' do
    describe 'when no items are in the stack' do
      let(:stack) { Stack.new }

      it 'returns nil' do
        assert_nil stack.pop
      end
    end

    describe 'when at least one item is in the stack' do
      it 'removes first item from stack' do
        stack.pop
        assert_equal [1], stack.to_a
      end

      it 'returns the data from first item in stack' do
        assert_equal 2, stack.pop
      end
    end

    describe 'when popping the last node from the stack' do
      let(:stack) { Stack.new.push(1) }

      it 'removes first item from stack' do
        stack.pop
        assert_equal [], stack.to_a
      end

      it 'returns the data from first item in stack' do
        assert_equal 1, stack.pop
      end
    end
  end

  describe '#peek' do
    describe 'when no items are in the stack' do
      let(:stack) { Stack.new }

      it 'returns nil' do
        assert_nil stack.peek
      end
    end

    describe 'when at least one item is in the stack' do
      it 'returns the data from first item in stack' do
        assert_equal 2, stack.peek
      end

      it 'does not remove first item from stack' do
        stack.peek
        assert_equal [2, 1], stack.to_a
      end
    end
  end
end
