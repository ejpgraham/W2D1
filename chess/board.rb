require "byebug"
require_relative "piece"
class Board
  attr_accessor :grid
  def initialize
    @grid = Array.new(8){Array.new(8)}
  end

  def populate_grid
    @grid.each_with_index do |row, index|
      row.each_with_index do |tile, index2|
        # debugger
        if index == 0
          row[index2] = Piece.new("P").name
        elsif index == 1
          row[index2] = Piece.new("P").name
        elsif index == 6
          row[index2] = Piece.new("B").name
        elsif index == 7
          row[index2] = Piece.new("B").name
        else
          row[index2] = nil
        end
      end
    end
  end

  def [](pos)
   row, col = pos
   @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

  def move_piece(start_pos,end_pos)
    if self[start_pos] == nil
      raise "No piece found"
    elsif self[end_pos] == self[start_pos]
      raise "Can't take your own piece"
    else
      self[end_pos] = self[start_pos]
      self[start_pos] = nil
    end
  end

  def in_bounds?(pos)
    # [x,y]
    return true if (pos[0] < 8 && pos[0] >= 0) && (pos[1] < 8 && pos[1] >= 0)
    false
  end
end



# new_board = Board.new
# new_board.populate_grid
# new_board.move_piece([0,0],[3,3])
# p new_board
