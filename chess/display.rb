require_relative "board"
require "colorize"
require_relative "cursor"

class Display
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    @board.grid.each_with_index do |row, index|
      row.each_with_index do |tile, index2|
        row[index2] = "X"
        puts row[index2]
      end
    end
  end
end

display = Display.new(Board.new)
display.render
