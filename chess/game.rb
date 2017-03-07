require_relative "display"
require_relative "board"

class Game
  attr_accessor :checkmate, :display
  def initialize
    @display = Display.new(Board.new)
    @checkmate = false
    play
  end

  def play
    until checkmate
      display.test_display
    end
  end
end

Game.new
