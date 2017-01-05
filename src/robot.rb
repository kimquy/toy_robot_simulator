require_relative './state'
require_relative './reducers/direction_reducer'
require_relative './reducers/movement_reducer'
require_relative './reducers/placing_reducer'

class Robot
  def self.perform(board:, instruction:)
    new(board, instruction).perform
  end

  attr_reader :board, :instruction, :state

  def initialize(board, instruction, state = State.new)
    @state = state
    @board = board
    @instruction = instruction
  end

  def perform
    place_robot(instruction.first_move)

    instruction.other_moves.each do |move|
      action, location = move.split(" ")
      case action
        when "MOVE" then move_robot
        when "LEFT" || "RIGHT" then turn_to(action)
        when "PLACE" then place_robot(location)
        when "REPORT" then report
      end
    end

    report
  end

  private

  def report
    state.to_s
  end

  def place_robot(location)
    return if state.error
    @state = PlacingReducer.exec(state, location, board)
  end

  def turn_to(direction)
    return if state.error
    @state = DirectionReducer.exec(state, direction)
  end

  def move_robot
    return if state.error
    @state = MovementReducer.exec(state, board)
  end
end
