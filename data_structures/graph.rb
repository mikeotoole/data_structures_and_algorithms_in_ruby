require_relative 'graph_node'
require 'set'

class Graph
  # `node_hash` should be a Hash with node ids as keys and an Array of the
  # node's adjacent node ids as value.
  def initialize(node_hash)
    @nodes = {}

    node_hash.keys.each do |node_id|
      @nodes[node_id] = GraphNode.new(node_id)
    end

    node_hash.each do |node_id, adjacent_ids|
      node = @nodes[node_id]

      adjacent_ids.each do |adjacent_id|
        adjacent_node = @nodes[adjacent_id]
        node.adjacent << adjacent_node
      end
    end
  end

  def get_node(id)
    @nodes[id]
  end

  def to_s
    @nodes.each do |id, node|
      adjacent_ids = node.adjacent.map(&:id)
      puts "id:#{id} adjacent_ids:#{adjacent_ids}"
    end
  end

  # Check for path between two nodes using depth first search.
  #
  # Time Complexity: O(b^d)
  # Space Complexity: O(bd)
  # Here 'b' is the branching factor (the average out-degree) and 'd' is the
  # distance from source to dest (measured in number of edge traversals).
  def has_path_dfs?(source_id, dest_id)
    visited = Set.new
    source = get_node(source_id)
    dest = get_node(dest_id)

    recursive_dfs(source, dest, visited)
  end

  # Check for path between two nodes using breadth first search.
  #
  # Time Complexity: O(b^(d + 1))
  # Space Complexity: O(b^(d + 1))
  # Here 'b' is the branching factor (the average out-degree) and 'd' is the
  # distance from source to dest (measured in number of edge traversals).
  def has_path_bfs?(source_id, dest_id)
    visited = Set.new
    source = get_node(source_id)
    dest = get_node(dest_id)

    to_visit = [source].concat(source.adjacent)

    to_visit.each do |node|
      unless visited.include?(node.id)
        return true if node.id == dest.id
        visited << node.id
        to_visit.concat(node.adjacent)
      end
    end

    return false
  end

  private

  # def recursive_bfs(source, dest, visited)
  # end

  def recursive_dfs(source, dest, visited)
    return false if visited.include?(source.id)
    visited << source.id
    return true if source.id == dest.id

    source.adjacent.each do |node|
      return true if recursive_dfs(node, dest, visited)
    end

    return false
  end
end
