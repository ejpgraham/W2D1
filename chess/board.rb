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
          row[index2] = Piece.new("P").name
        elsif index == 7
          row[index2] = Piece.new("P").name
        else
          row[index2] = nil
        end
      end
    end
  end

  def move_piece
  end
end



new_board = Board.new
p new_board.populate_grid
