# QuickSort is an efficient sorting algorithm. It uses a "pivot" point
# to systematically move items that are greater then or less then the pivot.
# It then uses recursion to sort each half. It does this without needing to
# create a new array.
#
# Time Complexity (when a "good" pivot is picked): O(n log n)
# Time Complexity (when the pivot was less then all elements): O(n^2)
# Space Complexity: O(1)
class QuickSort
  def sort
    sort_half(0, @array.length - 1)

    @array
  end

  private

  def sort_half(left_i, right_i)
    return if left_i >= right_i # Base case. We are down to one element.

    pivot_i = (left_i + right_i) / 2 # Pick mid point as pivot.
    pivot_value = @array[pivot_i]

    index = partition(left_i, right_i, pivot_value)

    sort_half(left_i, index - 1) # Now sort left half
    sort_half(index, right_i) # Now sort right half
  end

  def partition(left_i, right_i, pivot_value)
    while left_i <= right_i # While we have not looked at all elements in array.

      # Look for a left value that is greater then the pivot.
      while @array[left_i] < pivot_value
        left_i += 1
      end

      # Look for a right value that is less then the pivot.
      while @array[right_i] > pivot_value
        right_i -= 1
      end

      # If our left and right indexes are not the same.
      if left_i <= right_i
        swap(left_i, right_i) # Swap the values.
        left_i += 1 # Move left one place.
        right_i -= 1 # Move right one place.
      end
    end

    left_i # Return where we stopped for left.
  end

  def swap(index_one, index_two)
    temp = @array[index_one]
    @array[index_one] = @array[index_two]
    @array[index_two] = temp
  end

  def initialize(array)
    @array = array
  end
end
