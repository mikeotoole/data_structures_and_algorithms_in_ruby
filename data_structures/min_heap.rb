# A min Heap is a tree like data structure where smaller elements are always
# above larger ones.
class MinHeap
  # Add a value to the Heap.
  # Time Complexity: O(log n)
  # Space Complexity: O(1)
  def add(data)
    @items[@size] = data # Add data to "end" of heap.
    @size += 1
    bubble_up # Bubble the new value up so smaller values are above larger ones. 
    self # Return self so we can chain like other Ruby data structures.
  end

  # Return value at top of heap but don't remove it.
  # Time Complexity: O(1)
  # Space Complexity: O(1)
  def peek
    return nil if @size == 0 # Heap is empty when size is zero.
    @items[0]
  end

  # Remove value at top of heap and return it.
  # Time Complexity: O(log n)
  # Space Complexity: O(1)
  def poll
    return nil if @size == 0 # Heap is empty when size is zero.
    data = @items[0] # Get value at top of heap.
    @items[0] = @items[@size - 1] # Copy value from end of heap to top.
    # We removed something so decrease size. Note that we didn't actually
    # remove the value we copied from the end of the heap. Decrementing size
    # makes sure we don't look at it.
    @size -= 1 
    # Bubble the value we copied down so smaller values are above larger ones.
    bubble_down
    data # Return value from top of heap.
  end

  # Return an Array with all values in heap.
  # Time Complexity: O(1)
  # Space Complexity: O(n)
  def to_a
    @items[0..@size - 1]
  end

  private

  def initialize
    @items = []
    @size = 0
  end

  def bubble_up
    index = @size - 1 # Start at the end of the heap.

    # If the current index has a parent and the parent value is larger then
    # the current value then swap them. Do this till we hit the root.
    while parent?(index: index) && parent_data(index: index) > @items[index]
      swap(index, parent_index(index: index))
      index = parent_index(index: index)
    end
  end

  # The value at the "end" of the heap was copied to the root. We now want to
  # move it down to where it should go.
  def bubble_down
    index = 0 # start at the root.

    # Loop over till we get to the end or parent is smaller then both children.
    # If there is no left we know there is no right.
    while left?(index: index)
      # Find out if the left or right child has a smaller value.
      smaller_child_index = left_index(index: index)
      if right?(index: index) && right_data(index: index) < left_data(index: index)
        smaller_child_index = right_index(index: index)
      end

      # Parent is smaller then both children so we are done.
      if @items[index] <= @items[smaller_child_index]
        break
      else # Parent is larger then child so swap them.
        swap(index, smaller_child_index)
      end

      # Update index to point to new location of the value we copied.
      # Note index always points to the value that was in root.
      index = smaller_child_index
    end
  end

  def swap(index_one, index_two)
    data_in_one = @items[index_one]
    @items[index_one] = @items[index_two]
    @items[index_two] = data_in_one
  end

  def left_index(index:)
    2 * index + 1
  end

  def right_index(index:)
    2 * index + 2
  end

  def parent_index(index:)
    (index - 1) / 2
  end

  def left?(index:)
    left_index(index: index) < @size
  end

  def right?(index:)
    right_index(index: index) < @size
  end

  def parent?(index:)
    parent_index(index: index) >= 0
  end

  def left_data(index:)
    @items[left_index(index: index)]
  end

  def right_data(index:)
    @items[right_index(index: index)]
  end

  def parent_data(index:)
    @items[parent_index(index: index)]
  end
end
