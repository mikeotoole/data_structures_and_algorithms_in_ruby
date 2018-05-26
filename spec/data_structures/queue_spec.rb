require 'minitest/autorun'
require './data_structures/queue'

describe QueueDS do
  describe 'when queue is empty' do
    let(:queue) { QueueDS.new }

    describe '#empty?' do
      it 'returns true' do
        assert queue.empty?
      end
    end

    describe '#peek' do
      it 'returns nil' do
        assert_nil queue.peek
      end
    end

    describe '#add' do
      it 'adds the data to the end of the queue' do
        queue.add(1)
        assert_equal [1], queue.to_a
      end
    end

    describe '#remove' do
      it 'returns nil' do
        assert_nil queue.remove
      end
    end
  end

  describe 'when queue has multiple nodes' do
    let(:queue) do
      QueueDS.new.tap do |q|
        q.add(1)
        q.add(2)
      end
    end

    describe '#empty?' do
      it 'returns false' do
        assert !queue.empty?
      end
    end

    describe '#peek' do
      it 'returns the data in the first item added to the queue' do
        assert_equal 1, queue.peek
      end

      it 'does not remove the node from the queue' do
        queue.peek
        assert_equal [1, 2], queue.to_a
      end
    end

    describe '#add' do
      it 'adds the data to the end of the queue' do
        queue.add(3)
        assert_equal [1, 2, 3], queue.to_a
      end
    end

    describe '#remove' do
      it 'returns the data in the first item added to the queue' do
        assert_equal 1, queue.remove
      end

      it 'removes the first node in the queue' do
        queue.remove
        assert_equal [2], queue.to_a
      end
    end
  end

  describe 'when queue has one node' do
    let(:queue) { QueueDS.new.tap { |n| n.add(1) } }

    it 'returns the data in the first item added to the queue' do
      assert_equal 1, queue.remove
    end

    it 'a second call returns nil' do
      queue.remove
      assert_nil queue.remove
    end

    it 'removes the first node in the queue' do
      queue.remove
      assert_equal [], queue.to_a
    end
  end
end