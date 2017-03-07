require_relative "display"
require_relative "board"
require_relative "player"

class Game
  attr_accessor :checkmate, :display, :board
  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @checkmate = false
    @player = Player.new("John")
    play
  end

  def play
    until checkmate
      # display.test_display
      @player.make_move
      board.move_piece([1,1],[2,1])

    end
  end
end

Game.new

board.render
