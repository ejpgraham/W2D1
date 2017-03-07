require_relative "display"

class Player
  def initialize(name)
    @name = name
    @display = Display.new(Board.new)

  end

  def make_move
    start = @display.test_display
    end_pos = @display.test_display
  end

end
