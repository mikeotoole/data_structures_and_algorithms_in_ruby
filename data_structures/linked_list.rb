# A LinkedList is a data structure consisting of a group of nodes.
# Each node contains data and a pointer to another node.
class LinkedList
  attr_reader :head

  # Add data to the beginning of the linked list.
  # Time Complexity: O(1)
  # Space Complexity: O(1)
  def prepend(data)
    new_node = Node.new(data: data)
    new_node.next_node = @head
    @head = Node.new(data: data, next_node: @head)
  end

  # Add data to the end of the linked list.
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def append(data)
    if head
      next_node = head
      next_node = next_node.next_node while next_node.next_node
      next_node.next_node = Node.new(data: data)
    else
      @head = Node.new(data: data)
    end
  end

  # Remove the node with the given data from the list.
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def delete(data)
    return false unless head

    if head.data == data
      @head = head.next_node
      true
    else
      next_node = head

      while next_node.next_node
        if next_node.next_node.data == data
          next_node.next_node = next_node.next.next_node
          return true
        end
        next_node = next_node.next_node
      end
      false
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

  # Time Complexity: O(values)
  # Space Complexity: O(values)
  def initialize(values = [])
    @head = nil
    values.reverse.each do |data|
      prepend(data)
    end
  end
end
