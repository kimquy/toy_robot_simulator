class MovementReducer
  def self.exec(state, board)
    new_state = state.clone
    case state.facing
    when "NORTH" then update_position(new_state, state.x, state.y + 1, board)
    when "SOUTH" then update_position(new_state, state.x, state.y - 1, board)
    when "WEST" then update_position(new_state, state.x - 1, state.y, board)
    when "EAST" then update_position(new_state, state.x + 1, state.y, board)
    end
    new_state
  end

  def self.update_position(new_state, x, y, board)
    unless board.off_board?(x, y)
      new_state.x = x
      new_state.y = y
    end
  end
end
