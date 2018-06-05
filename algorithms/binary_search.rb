# Binary search is an efficient search algorithm. I only works on sorted data.
# It compares the target value to the middle element of the array; if they are
# unequal, the half in which the target cannot lie is eliminated and the search
# continues on the remaining half until it is successful.
#
# Time Complexity: O(log n)
# Space Complexity: O(1)
class BinarySearch
  # Note: `array` must be ordered.
  def initialize(array)
    @array = array
  end

  def contains?(value)
    check_half(value, 0, @array.length - 1)
  end

  private

  def check_half(value, start_index, end_index)
    if start_index >= end_index
      return false
    end

    mid = (start_index + end_index) / 2
    if @array[mid] == value
      return true
    elsif value < @array[mid]
      check_half(value, start_index, mid - 1)
    else
      check_half(value, mid + 1, end_index)
    end
  end
end
