# BubbleSort is very naive sorting algorithm. Not something one should use in
# the real world. It just walks through the array and swaps elements as needed.
# It does this n * n times to make sure they are all sorted.
#
# Time Complexity: O(n^2)
# Space Complexity: O(1)
class BubbleSort
  def initialize(array)
    @array = array
  end

  def sort
    is_sorted = false

    # If we have to swap an element we will keep is_sorted false to do another
    # iteration.
    while !is_sorted do
      is_sorted = true # We will mark this false below if we needed to sort.
      # Since we will look at the current index + 1 we can stop at the element
      # before the last.
      last_sorted = @array.length - 2 

      # Iterate from the start of the array to the last one we had to swap.
      (0..last_sorted).each do |i|
        if @array[i] > @array[i + 1] # Elements are out of order.
          swap(i, i + 1) # Swap them.
          last_sorted = i + 1 # Mark that we swapped it.

          # We had to swap something so can't be sure we are done.
          is_sorted = false
        end
      end
      
    end
    
    @array
  end

  private

  def swap(index_one, index_two)
    temp = @array[index_one]
    @array[index_one] = @array[index_two]
    @array[index_two] = temp
  end
end
