class PlacingReducer
  VALID_FACING = %w(NORTH SOUTH EAST WEST)

  def self.exec(state, location, board)
    new_state = state.clone
    unless location
      new_state.error = true
      return new_state
    end

    x, y, facing = location.split(",")
    x = x.to_i
    y = y.to_i

    if board.off_board?(x, y) || !VALID_FACING.include?(facing)
      new_state.error = true
    else
      new_state.x = x
      new_state.y = y
      new_state.facing = facing
    end

    new_state
  end
end
