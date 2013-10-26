class Graph

  attr_accessor :nodes

  def initialize
    @nodes = []
  end
  
  def add(node)
    @nodes << node
  end

  def shortest_path_to(id)
    #set the initial node to 0 cost
    @nodes.first.cost = 0

    current_node = @nodes.first
    target_node = @nodes.select { |n| n.id == id }[0]
    while current_node.id != target_node.id
      current_node.calculate_costs
      next_node = current_node.closest

      current_node.visited = true

      current_node = next_node
    end

    current_node.cost
  end

end
