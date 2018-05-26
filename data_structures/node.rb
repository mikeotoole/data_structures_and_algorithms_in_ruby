# Nodes used by the LinkedList, Queue, and Stack data structures.
class Node
  attr_accessor :next_node
  attr_reader :data

  # Recursively call to_a on all connected Nodes and return an Array with their data.
  # Time Complexity: O(n)
  # Space Complexity: O(n)
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
