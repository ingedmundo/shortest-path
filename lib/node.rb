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
    @relations.min_by { |n| n[:distance] }[:node]
  end

end
