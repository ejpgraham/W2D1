require_relative "board"
require_relative "cursor"
require "byebug"
require "colorize"


class Display
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    @board.grid.each_with_index do |row, index|
      display_row = "#{index} | "
      row.each_with_index do |tile, index2|
        if index == 0 && index2 == 0
          puts "   | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7"
          puts "----------------------------------"
        end
        # debugger
        if [index, index2] == @cursor.cursor_pos
          if @board.grid[index][index2].symbol == " "
            display_row += "X".red + " | "
          else
            display_row += @board.grid[index][index2].symbol.red + " | "
          end
        else
          display_row += @board.grid[index][index2].symbol + " | "
        end


      end
      puts display_row
      puts "----------------------------------"
    end
  end

  def test_display
    # render
    # debugger
    input = nil
    until input
      render
      input = @cursor.get_input
      system("clear")
    end
    input
  end
end
