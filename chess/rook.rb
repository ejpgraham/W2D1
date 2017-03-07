require_relative "piece"
require_relative "slidingpiece"

class Rook < Piece

  include SlidingPiece

  # def initialize(name, symbol, position, color)
  #   super(name, symbol, position, color)
  # end

  protected
  def move_dirs
    possible_directions = [] # [1,1]
    SlidingPiece.VERTICAL.each {|k,v| possible_directions << v}
    SlidingPiece.HORIZONTAL.each {|k,v| possible_directions << v}
    possible_directions
  end
end
