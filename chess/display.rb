require "byebug"
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
      display_row = "#{index} "
      row.each_with_index do |tile, index2|
        if index == 0 && index2 == 0
          puts "  0 1 2 3 4 5 6 7"
        end
        # debugger
        if [index, index2] == @cursor.cursor_pos
          display_row += "#{@board.grid[index][index2]} ".red
        else
          display_row += "#{@board.grid[index][index2]} "
        end
      end
      puts display_row
    end
  end

  def test_display
    while true
      render
      sleep(1)
      @cursor.get_input
    end
  end
end
display = Display.new(Board.new)
display.test_display
