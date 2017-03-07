require "byebug"
require_relative "rook"
require_relative "knight"
require_relative "king"
require_relative "pawn"
require_relative "queen"
require_relative "nullpiece"
require_relative "bishop"

class Board
  attr_accessor :grid
  def initialize
    @grid = Array.new(8){Array.new(8)}
    populate_grid
  end

  def populate_grid
    @grid.each_with_index do |row, index|
      row.each_with_index do |tile, index2|
        # debugger
        case index
        when 0
          case index2
          when 0,7
          row[index2] = Rook.new("Rook", "R",[index,index2],"White")
          when 1,6
          row[index2] = Knight.new("Knight", "K", [index,index2], "White")
          when 2,5
          row[index2] = Bishop.new("Bishop", "B", [index,index2], "White")
          when 3
          row[index2] = Queen.new("Queen", "Q", [index,index2], "White")
          when 4
          row[index2] = King.new("King", "$", [index,index2], "White")
          end
        when 1
          row[index2] = Pawn.new("Pawn", "P",[index,index2],"White")
        when 6
          row[index2] = Pawn.new("Pawn", "P",[index,index2],"Black")
        when 7
          case index2
          when 0,7
          row[index2] = Rook.new("Rook", "R",[index,index2],"Black")
          when 1,6
          row[index2] = Knight.new("Knight", "K", [index,index2], "Black")
          when 2,5
          row[index2] = Bishop.new("Bishop", "B", [index,index2], "Black")
          when 3
          row[index2] = Queen.new("Queen", "Q", [index,index2], "Black")
          when 4
          row[index2] = King.new("King", "$", [index,index2], "Black")
          end
        else
          row[index2] = NullPiece.new("NullPiece", " ",[index,index2])
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
      self[start_pos] = NullPiece.new("NullPiece", " ",[start_pos])
    end
  end

  def in_bounds?(pos)
    # [x,y]
    return true if (pos[0] < 8 && pos[0] >= 0) && (pos[1] < 8 && pos[1] >= 0)
    false
  end
end
