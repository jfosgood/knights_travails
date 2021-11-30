class Cell
  attr_accessor :coordinates
  def initialize(x, y)
    @coordinates = [x, y]
  end
  
  def print_cell
    print " | #{coordinates} | "
  end
end 

class Board
  def initialize(size=8)
    @game_space = build_board(size)
    @size = size
  end
  
  def build_board(size)
    cells_arr = []
    for row in 0...size do
      for column in 0...size do 
        cells_arr.push(Cell.new(row, column))
      end 
    end
    return cells_arr
  end
  
  def print_board
    cells = @game_space
    for row in 0...@size
      puts " "
      for column in 0...@size
        cells.shift.print_cell
      end 
    end 
  end 
    
end

