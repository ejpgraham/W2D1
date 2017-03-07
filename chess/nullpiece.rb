require_relative "piece"

class NullPiece < Piece
  attr_accessor :name, :symbol, :position
  def initialize(name,symbol,position)
    @name, @symbol, @position = name, symbol, position
  end
end
