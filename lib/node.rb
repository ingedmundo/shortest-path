class Node
  attr_accessor :visited, :distance, :cost
  attr_reader :id, :relations

  def initialize(id)
    @id = id
    @visited = false
    @relations = []
    @cost = nil
  end

  def add(node, distance)
    @relations << { node: node, distance: distance }
  end

  def closest
    not_visited.min_by { |n| n[:distance] }[:node]
  end

  def calculate_costs
    @relations.each do |n|
      new_cost = @cost.to_i + n[:distance]
      if n[:node].cost.nil? || n[:node].cost > new_cost
        n[:node].cost = new_cost
      end
    end
  end

  def unvisited?
    @visited == false
  end

  private

  def not_visited
    @relations.select { |n|  n[:node].unvisited? }
  end

end
