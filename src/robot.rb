require_relative './state'
require_relative './reducers/direction_reducer'
require_relative './reducers/movement_reducer'
require_relative './reducers/placing_reducer'

class Robot
  def self.perform(board:, instruction:)
    new(board, instruction).perform
  end

  attr_reader :board, :instruction, :state, :moves

  def initialize(board, instruction, state = State.new)
    @state = state
    @board = board
    @instruction = instruction
    @moves = @instruction.moves
  end

  def perform
    while moves.size.positive? && state.facing.nil?
      place_robot(moves.first)
      @moves = @moves.drop(1) if state.facing.nil?
    end

    moves.each do |move|
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
    @state = PlacingReducer.exec(state, location, board)
  end

  def turn_to(direction)
    @state = DirectionReducer.exec(state, direction)
  end

  def move_robot
    @state = MovementReducer.exec(state, board)
  end
end
