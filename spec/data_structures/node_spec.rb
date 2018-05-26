require 'minitest/autorun'
require './data_structures/node'

describe Node do
  let(:next_node) { Node.new(data: 1) }
  let(:node) { Node.new(data: 1, next_node: next_node) }

  describe '#data' do
    it 'returns the data the node is initialized with' do
      assert_equal 1, node.data
    end
  end

  describe '#next' do
    it 'returns the next node the node is initialized with' do
      assert_equal next_node, node.next_node
    end
  end
end
