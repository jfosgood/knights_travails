class Node
  attr_accessor :coordinates
  def initialize(row, column)
    @coordinates = [row, column]
  end 
  
  def is_valid?
    row_valid = self.coordinates[0] <= 7 && self.coordinates[0] >= 0
    column_valid = self.coordinates[1] <= 7 && self.coordinates[1] >= 0 
    
    return row_valid && column_valid
  end
  
  def generate_moves
    possible_moves = [
                      Node.new(@coordinates[0]+2, @coordinates[1]+1),
                      Node.new(@coordinates[0]+1, @coordinates[1]+2),
                      Node.new(@coordinates[0]-1, @coordinates[1]+2),
                      Node.new(@coordinates[0]-2, @coordinates[1]+1),
                      Node.new(@coordinates[0]-2, @coordinates[1]-1),
                      Node.new(@coordinates[0]-1, @coordinates[1]-2),
                      Node.new(@coordinates[0]+1, @coordinates[1]-2),
                      Node.new(@coordinates[0]+2, @coordinates[1]-1),
                      ]
    return possible_moves.select {|node| node.is_valid?} 
  end
end 

