class Node
  attr_accessor :visited, :id
  
  def initialize(id)
    @id = id
    @visited = false
  end

end
