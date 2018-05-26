# A stack is a LIFO data structure.
class Stack
  attr_reader :head

  def empty?
    !head
  end

  def peek
    head.data if head
  end

  def push(data)
    @head = Node.new(data: data, next_node: head)
  end

  def pop
    if head
      data = head.data
      @head = head.next_node
    end

    data
  end

  def to_a
    return [] unless head
    head.to_a
  end

  private

  def initialize
    @head = nil
  end
end
