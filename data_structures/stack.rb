require_relative 'node'

# A stack is a LIFO data structure.
class Stack
  attr_reader :head

  # Check if Queue is empty.
  # Time Complexity: O(1)
  # Space Complexity: O(1)
  def empty?
    !head
  end

  # Get data in first node but don't remove the node.
  # Time Complexity: O(1)
  # Space Complexity: O(1)
  def peek
    head.data if head
  end

  # Add data to top of Stack.
  # Time Complexity: O(1)
  # Space Complexity: O(1)
  def push(data)
    @head = Node.new(data: data, next_node: head)
    self
  end

  # Remove Node on top of Stack and return the data in it.
  # Time Complexity: O(1)
  # Space Complexity: O(1)
  def pop
    if head
      data = head.data
      @head = head.next_node
    end

    data
  end

  # Return an Array with the data in all Nodes.
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def to_a
    return [] unless head
    head.to_a
  end

  private

  def initialize
    @head = nil
  end
end
