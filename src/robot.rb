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
    instruction.moves.each do |move|
      case move.split(" ").first
        when "MOVE" then move_robot
        when "LEFT" then turn_to(:left)
        when "RIGHT" then turn_to(:right)
        when "PLACE" then place_robot(move.split(" ")[1])
        when "REPORT" then report
        else puts "Invalid move #{move}"
      end
    end

    report
  end

  private

  def report
    state.to_s
  end

  def place_robot(location)
    x, y, facing = location.split(",")
    x = x.to_i
    y = y.to_i
    state.update(x: x, y: y, facing: facing) unless board.off_board?(x, y)
  end

  def turn_to(direction)
    state.facing =
      case state.facing
        when "NORTH" then direction == :left ? "WEST" : "EAST"
        when "SOUTH" then direction == :left ? "EAST" : "WEST"
        when "WEST" then direction == :left ? "SOUTH" : "NORTH"
        when "EAST" then direction == :left ? "NORTH" : "SOUTH"
      end
  end

  def move_robot
    case state.facing
    when "NORTH" then update_position(state.x, state.y + 1)
    when "SOUTH" then update_position(state.x, state.y - 1)
    when "WEST" then update_position(state.x - 1, state.y)
    when "EAST" then update_position(state.x + 1, state.y)
    end
  end

  def update_position(x, y)
    unless board.off_board?(x, y)
      state.x = x
      state.y = y
    end
  end

  class State
    attr_accessor :x, :y, :facing

    def initialize
      @x = 0
      @y = 0
      @facing = 'NORTH'
    end

    def update(x:, y:, facing:)
      @x = x
      @y = y
      @facing = facing
    end

    def to_s
      "#{x},#{y},#{facing}"
    end
  end
end
