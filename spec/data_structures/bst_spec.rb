require 'minitest/autorun'
require './data_structures/bst'

describe BST do
  let(:bst) { BST.new.insert(2).insert(3).insert(1) }

  describe '#insert' do
    describe 'when tree is empty' do
      let(:bst) { BST.new }

      it 'adds the node' do
        bst.insert(4)
        assert_equal [4], bst.to_a
      end
    end

    describe 'when tree has nodes in it' do
      it 'adds the node' do
        bst.insert(4)
        assert_equal [1, 2, 3, 4], bst.to_a
      end
    end

    describe 'when value is already in tree' do
      it 'adds the node' do
        bst.insert(3)
        assert_equal [1, 2, 3, 3], bst.to_a
      end
    end
  end

  describe '#contains?' do
    describe 'when value is in left side of tree' do
      it 'returns true' do
        assert bst.contains?(1)
      end
    end

    describe 'when value is in right side of tree' do
      it 'returns true' do
        assert bst.contains?(3)
      end
    end

    describe 'when value is in root of tree' do
      it 'returns true' do
        assert bst.contains?(2)
      end
    end

    describe 'when value is not in the tree' do
      it 'returns false' do
        assert !bst.contains?(4)
      end
    end

    describe 'when the tree is empty' do
      let(:bst) { BST.new }

      it 'returns false' do
        assert !bst.contains?(1)
      end
    end
  end

  describe '#to_a' do
    describe 'with inorder order' do
      it 'returns and Array with the node data in the expected order' do
        assert_equal [1, 2, 3], bst.to_a(order: :inorder)
      end
    end

    describe 'with preorder order' do
      it 'returns and Array with the node data in the expected order' do
        assert_equal [2, 1, 3], bst.to_a(order: :preorder)
      end
    end

    describe 'with postorder order' do
      it 'returns and Array with the node data in the expected order' do
        assert_equal [1, 3, 2], bst.to_a(order: :postorder)
      end
    end
  end
end
