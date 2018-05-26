class QueueDS
  attr_reader :head, :tail

  def empty?
    !head
  end

  def peek
    head.data if head
  end

  def add(data)
    node = Node.new(data: data)
    if head
      tail.next_node = node
    else
      @head = node
    end

    @tail = node
  end

  def remove
    node = @head

    if node
      @head = node.next_node
      @tail = nil unless @head

      node.data
    end
  end

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
