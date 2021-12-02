class Node
  attr_reader :possition, :parent
  
  TRANSFORMATIONS = [[1, 2], [-2, -1], [-1, 2], [2, -1],
                     [1, -2], [-2, 1], [-1, -2], [2, 1]].freeze
  
  @@history = []
  
  def initialize(possition, parent)
    @possition = possition
    @parent = parent
    @@history.push(possition)
  end 
  
  def children
    TRANSFORMATIONS.map { |t| [@possition[0] + t[0], @possition[1] + t[1]] }
                        .keep_if { |e| Node.valid?(e) }
                        .reject { |e| @@history.include?(e) }
                        .map { |e| Node.new(e, self) }
  end
  
  def self.valid?(possition)
    possition[0].between?(0, 7) && possition[1].between?(0, 7)
  end 
end 

def display_parent(node, num_moves=0)
  unless node.parent.nil?
    num_moves += 1
    display_parent(node.parent, num_moves)
  end 
  if node.parent.nil?
    puts "You made it in #{num_moves} moves!"
    puts "Here is the path: "
  end
  p node.possition
      
end
  
def knight_moves(start_possition, end_possition)
  queue = []
  current_node = Node.new(start_possition, nil)
  until current_node.possition == end_possition
    current_node.children.each { |child| queue.push(child) }
    current_node = queue.shift
  end 
  display_parent(current_node)
end 


knight_moves([1,2], [5,6])

  