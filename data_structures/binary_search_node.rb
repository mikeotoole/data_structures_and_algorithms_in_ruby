class BinarySearchNode
  attr_reader :data, :left, :right

  VALID_ORDERS = [:inorder, :preorder, :postorder]

  def contains?(data)
    if data == @data
      return true
    elsif data > @data
      return false unless right
      right.contains?(data)
    else
      return false unless left
      left.contains?(data)
    end 
  end

  def insert(data)
    if data > @data
      if right
        right.insert(data)
      else
        @right = BinarySearchNode.new(data: data)
      end
    else
      if left
        left.insert(data)
      else
        @left = BinarySearchNode.new(data: data)
      end
    end 
  end

  def to_a(order: :inorder)
    left_array = left ? left.to_a(order: order) : []
    right_array = right ? right.to_a(order: order) : []

    case order
    when :inorder # Visit left then root then right.
      left_array + [data] + right_array
    when :preorder # Visit root then left then right.
      [data] + left_array + right_array
    when :postorder # Visit left then right then root.
      left_array + right_array + [data]
    else
      raise "order is not a valid order"
    end
  end

  private

  def initialize(data:, left: nil, right: nil)
    @data = data
    @left = left
    @right = right
  end
end
