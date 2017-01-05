class PlacingReducer
  VALID_FACING = %w(NORTH SOUTH EAST WEST)

  def self.exec(state, location, board)
    new_state = state.clone
    return new_state unless location

    x, y, facing = location.split(",")
    x = x.to_i
    y = y.to_i

    if !board.off_board?(x, y) && VALID_FACING.include?(facing)
      new_state.x = x
      new_state.y = y
      new_state.facing = facing
    end

    new_state
  end
end
