require_relative "piece"
require_relative "steppingpiece"

class King
  include SteppingPiece

  protected
  def move_dirs
    possible_directions = []
    SteppingPiece.ALL.each {|k,v| possible_directions << v}
    possible_directions
  end
end
