# A stack is a FIFO data structure.
class QueueDS
  attr_reader :head, :tail

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

  # Add Node to back of Queue.
  # Time Complexity: O(1)
  # Space Complexity: O(1)
  def add(data)
    node = Node.new(data: data)
    if head
      tail.next_node = node
    else
      @head = node
    end

    @tail = node
  end

  # Remove first Node from Queue and return the data in it.
  # Time Complexity: O(1)
  # Space Complexity: O(1)
  def remove
    node = @head

    if node
      @head = node.next_node
      @tail = nil unless @head

      node.data
    end
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
    @tail = nil
  end
end
