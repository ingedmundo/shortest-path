class Graph

  attr_accessor :nodes

  def initialize
    @nodes = []
    @solution = { cost: nil, path: [] }
  end

  def add(node)
    @nodes << node
  end

  def shortest_path_to(target_id)
    current_node = @nodes.first

    while current_node.id != target_id
      current_node.calculate_costs
      current_node.visited = true

      next_node = current_node.closest
      current_node = next_node

      @solution[:path] << current_node.id
      @solution[:cost] = current_node.cost
    end

    @solution
  end

end
