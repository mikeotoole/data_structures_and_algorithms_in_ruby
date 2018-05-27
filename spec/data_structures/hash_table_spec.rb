require 'minitest/autorun'
require './data_structures/hash_table'

describe HashTable do
  let(:hash_table) { HashTable.new }

  describe '#add' do
    describe 'When key does not have a collision' do
      it 'adds key and value' do
        hash_table.add(:two, 2)
        assert_equal [[{ key: :two, value: 2 }]], hash_table.to_a
      end
    end

    describe 'When key has a collision' do
      it 'adds key and value' do
        hash_table.stub :key_index, 0 do
          hash_table.add(:two, 2)
          hash_table.add(:three, 3)
        end
        expected = [[{key: :two, value: 2}, {key: :three, value: 3}]]
        assert_equal expected, hash_table.to_a
      end
    end

    describe 'when key is already present' do
      it 'replaces the value at key' do
        hash_table.add(:one, 1)
        hash_table.add(:one, 2)
        assert_equal [[{key: :one, value: 2}]], hash_table.to_a
      end
    end
  end

  describe '#get' do
    let(:hash_table) { HashTable.new.add(:one, 1) }

    describe 'when key is present' do
      it 'returns the value' do
        assert_equal 1, hash_table.get(:one)
      end

      describe 'and key is part of a collision' do
        it 'returns the value' do
          hash_table.stub :key_index, 0 do
            hash_table.add(:two, 2)
            hash_table.add(:three, 3)

            assert_equal 3, hash_table.get(:three)
          end          
        end
      end
    end

    describe 'when key is not present' do
      it 'returns nil' do
        assert_nil hash_table.get(:two)
      end
    end
  end
end
