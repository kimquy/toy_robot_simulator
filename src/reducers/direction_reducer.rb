class DirectionReducer
  def self.exec(state, direction)
    facing_direction = state.facing + "_" + direction
    new_state = state.clone

    case facing_direction
    when "NORTH_LEFT" then new_state.facing = "WEST"
    when "NORTH_RIGHT" then new_state.facing = "EAST"
    when "SOUTH_LEFT" then new_state.facing = "EAST"
    when "SOUTH_RIGHT" then new_state.facing = "WEST"
    when "WEST_LEFT" then new_state.facing = "SOUTH"
    when "WEST_RIGHT" then new_state.facing = "NORTH"
    when "EAST_LEFT" then new_state.facing = "NORTH"
    when "EAST_RIGHT" then new_state.facing = "SOUTH"
    end

    new_state
  end
end
