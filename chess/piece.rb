require_relative "board"
class Piece
  attr_accessor :name, :symbol, :color, :position

  def initialize(name, symbol, position, color)
    @name, @symbol, @position, @color = name, symbol, position, color
  end

  def moves
    #gets all possible MOVES
    #Makes the move

  end

  def display_symbol
    @symbol
  end

  def valid_moves(possible_moves)
    legal_moves = possible_moves.select do |move|
      board.in_bounds?(move)
    end
    legal_moves
  end


  private
  def move_into_check(to_pos)
  end
end
