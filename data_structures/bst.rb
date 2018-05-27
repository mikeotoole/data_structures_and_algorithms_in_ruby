require_relative 'binary_search_node' 

# A binary search tree (BST) is a tree data structure where each node has no
# more then 2 children. It also is built so the left node is always less then
# the root that is less then the right.
# Note that this implementation does not try to balance the tree.
class BST
  attr_reader :head

  # Check if a value is in the Tree
  # Time Complexity (when unbalanced): O(n)
  # Time Complexity (when balanced): O(log n)
  # Space Complexity: O(1)
  def contains?(data)
    return false unless head
    
    head.contains?(data)
  end

  # Add a value to the Tree
  # Time Complexity (when unbalanced): O(n)
  # Time Complexity (when balanced): O(log n)
  # Space Complexity: O(1)
  def insert(data)
    if head
      head.insert(data)
    else
      @head = BinarySearchNode.new(data: data)
    end
    self
  end

  # Return an Array with the data in all Nodes.
  # Supports three orders:
  #   inorder: Print left then root then right values.
  #   preorder: Print root then left then right values.
  #   postorder: Print left then right then root values.
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def to_a(order: :inorder)
    unless BinarySearchNode::VALID_ORDERS.include?(order)
      raise "invalid order #{order}"
    end
    return [] unless head

    head.to_a(order: order)
  end
end
