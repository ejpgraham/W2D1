require_relative "piece" 
require_relative "slidingpiece"

class Bishop < Piece
  include SlidingPiece

  protected
  def move_dirs
    possible_directions = []

    SlidingPiece.DIAGONAL.each {|k,v| possible_directions << v}
    possible_directions
    end

  end
end
