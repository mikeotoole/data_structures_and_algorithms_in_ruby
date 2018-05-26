# Nodes used by LinkedList.
class Node
  attr_accessor :next_node
  attr_reader :data

  def to_a
    if next_node
      [data].concat(next_node.to_a)
    else
      [data]
    end
  end

  private

  def initialize(data:, next_node: nil)
    @data = data
    @next_node = next_node
  end
end
