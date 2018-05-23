# A LinkedList is a data structure consisting of a group of nodes.
# Each node contains data and a pointer to another node.
class LinkedList
  attr_reader :head

  # Add data to the beginning of the linked list.
  def prepend(data)
    new_node = LinkedListNode.new(data: data)
    new_node.next = @head
    @head = LinkedListNode.new(data: data, next_node: @head)
  end

  # Add data to the end of the linked list.
  def append(data)
    if head
      next_node = head
      next_node = next_node.next while next_node.next
      next_node.next = LinkedListNode.new(data: data)
    else
      @head = LinkedListNode.new(data: data)
    end
  end

  # Remove the node with the given data from the list.
  def delete(data)
    return false unless head

    if head.data == data
      @head = head.next
      true
    else
      next_node = head

      while next_node.next
        if next_node.next.data == data
          next_node.next = next_node.next.next
          return true
        end
        next_node = next_node.next
      end
      false
    end
  end

  def to_a
    return [] unless head
    next_node = head
    nodes = []

    while next_node
      nodes << next_node.data
      next_node = next_node.next
    end

    nodes
  end

  private

  def initialize(values = [])
    @head = nil
    values.reverse.each do |data|
      prepend(data)
    end
  end
end
