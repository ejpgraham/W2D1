module SlidingPiece

  def moves
    possible_moves = []
    directions = self.move_dirs
    #[1,1]
    directions.each do |direction|
      possible_moves << grow_unblocked_moves_in_dir(direction.first, direction.last)
    end
    possible_moves
  end

  VERTICAL = {
    up: [-1, 0],
    down: [1, 0]
  }
  HORIZONTAL = {
    left: [0, -1],
    right: [0, 1],
  }
  DIAGONAL = {
    right_up: [1, -1],
    right_down: [1, 1],
    left_up: [-1, -1],
    left_down: [-1, 1]
  }

  ALL = {
    up: [-1, 0],
    down: [1, 0],
    left: [0, -1],
    right: [0, 1],
    right_up: [1, -1],
    right_down: [1, 1],
    left_up: [-1, -1],
    left_down: [-1, 1]
  }
def grow_unblocked_moves_in_dir(dx,dy)
  #[1,1]
  unblocked_moves_in_direction = []

  pos = @self.position.dup

  while self.board.in_bounds?(pos)

    pos[0] += dx
    pos[1] += dy
    unblocked_moves_in_direction << start_pos if pos.nil?
  end

  unblocked_moves_in_direction


  end
end
