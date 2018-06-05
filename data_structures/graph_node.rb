class GraphNode
  attr_reader :id, :adjacent

  def initialize(id)
    @id = id
    @adjacent = []
  end
end
