require_relative 'node'

class HashTable
  # Add a key and value to the HashTable
  # Time Complexity (when everything is a collision): O(n)
  # Time Complexity (when nothing is a collision): O(1)
  # Space Complexity: O(1)
  def add(key, value)
    i = key_index(key)

    if (node = @table[i])
      node = node.next_node while node.next_node && node.data[:key] != key

      if node.data[:key] != key
        # Yep using a Hash in my HashTable so I can reuse Node :)
        node.next_node = Node.new(data: { key: key, value: value })
      else
        node.data[:value] = value
      end
    else
      @table[i] = Node.new(data: { key: key, value: value })
    end

    # Ideally when the density (number of items at a single index) grows 
    # too large we would grow the table and rehash everything.

    self
  end

  # Get value for a given key.
  # Time Complexity (when everything is a collision): O(n)
  # Time Complexity (when nothing is a collision): O(1)
  # Space Complexity: O(1)
  def get(key)
    node = @table[key_index(key)]
    value = nil

    while node do
      if node.data[:key] == key
        value = node.data[:value]
        break
      end

      node = node.next_node
    end

    value
  end

  # Get an array with contents of HashTable.
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def to_a
    @table.each_with_object([]) do |value, array|
      array << value.to_a if value
    end
  end

  private

  # Default starting size of table.
  DEFAULT_SIZE = 13 # Ideally a prime number.
  private_constant :DEFAULT_SIZE

  def initialize
    @size = DEFAULT_SIZE
    @table = Array.new(@size)
  end

  def key_index(key)
    # Hash key to create an integer value then mod with size so it points to an
    # index into our array.
    key.hash % @size
  end
end
