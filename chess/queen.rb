require_relative "piece"
require_relative "slidingpiece"

class Queen < Piece
  include SlidingPiece

  protected
  def move_dirs
    possible_directions = []
    SlidingPiece.ALL.each {|k,v| possible_directions << v}
    possible_directions
  end
end
