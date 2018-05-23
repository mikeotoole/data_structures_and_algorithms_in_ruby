# Nodes used by LinkedList.
class LinkedListNode
  attr_accessor :data, :next

  private

  def initialize(data:, next_node: nil)
    @data = data
    @next = next_node
  end
end
