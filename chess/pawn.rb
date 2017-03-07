require_relative "piece"

class Pawn < Piece

  protected

  def at_start_row?
    return true if self.position[0] == 1
    false
  end

  def forward_dir
    if self.color == "White"
      [1,0]
    else
      [-1,0]
    end 

  end

  def forward_steps
    if self.at_start_row?
      2
    else
      1
    end
  end

  def side_attacks

  end

end
