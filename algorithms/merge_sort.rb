# MergeSort is an efficient sorting algorithm. It has a constant O(n log n)
# runtime but needs to use memory to do it. It uses recursion to sort each half.
#
# Time Complexity: O(n log n)
# Space Complexity: O(n)
class MergeSort
  def initialize(array)
    @array = array

    # When comparing items an extra array is used to copy the smaller elements
    # into.
    @temp_array = Array.new(@array.length) 
  end

  def sort
    # Call the recursive sort_half method with indexes spanning the whole array.
    sort_half(0, @array.length - 1)

    @array
  end

  private

  def sort_half(left_start, right_end)
    return if left_start >= right_end # Base case. We are down to one element.

    # Split array and call sort_half on each side.
    middle = (left_start + right_end) / 2 
    sort_half(left_start, middle)
    sort_half(middle + 1, right_end)
    merge(left_start, right_end)
  end

  def merge(left_start, right_end)
    left_end = (right_end + left_start) / 2
    right_start = left_end + 1
    size = right_end - left_start + 1

    left = left_start
    right = right_start
    temp_array_index = left_start

    # While we are within our left and right ends.
    while left <= left_end && right <= right_end do
      # If the left value is less then right move it to temp.
      if @array[left] <= @array[right]
        @temp_array[temp_array_index] = @array[left]
        left += 1 # We moved left so increment left index.
      else # Otherwise move th right value to temp.
        @temp_array[temp_array_index] = @array[right]
        right += 1 # We moved right so increment right index.
      end
      temp_array_index += 1 # We put something in temp at this index so increment it.
    end

    # After the above is down we either moved all the left or right values.
    # Now we need to copy the ones we didn't move. Only one of the below
    # while loops will run.

    # If left is <= left end we still have values to move. So move them.
    while left <= left_end
      # puts "left < left_end"
      @temp_array[temp_array_index] = @array[left]
      temp_array_index += 1
      left += 1
    end

    # If right is <= right end we still have values to move. So move them.
    while right <= right_end
      # puts "right < right_end"
      @temp_array[temp_array_index] = @array[right]
      temp_array_index += 1
      right += 1
    end

    # Values in temp_array are sorted so overwrite the ones in array.
    @array[left_start..right_end] = @temp_array[left_start..right_end]
  end
end
