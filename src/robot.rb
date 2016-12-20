class Robot
  def self.perform(board:, instruction:)
    new(board, instruction).perform
  end

  attr_reader :board, :instruction, :state

  def initialize(state = State.new, board, instruction)
    @state = state
    @board = board
    @instruction = instruction
  end

  def perform
    instruction.moves.each do |move|
      case move.split(" ").first
        when "MOVE" then move_robot
        when "LEFT" then turn_left
        when "RIGHT" then turn_right
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

  def turn_left
    case state.facing
      when "NORTH" then state.facing = "WEST"
      when "SOUTH" then state.facing = "EAST"
      when "WEST" then state.facing = "SOUTH"
      when "EAST" then state.facing = "NORTH"
      else "Invalid"
    end
  end

  def turn_right
    case state.facing
      when "NORTH" then state.facing = "EAST"
      when "SOUTH" then state.facing = "WEST"
      when "WEST" then state.facing = "NORTH"
      when "EAST" then state.facing = "SOUTH"
      else "Invalid"
    end
  end

  def move_robot
    case state.facing
      when "NORTH"
        state.y += 1 unless board.off_board?(state.x, state.y + 1)
      when "SOUTH"
        state.y -= 1 unless board.off_board?(state.x, state.y - 1)
      when "WEST"
        state.x -= 1 unless board.off_board?(state.x - 1, state.y)
      when "EAST"
        state.x += 1 unless board.off_board?(state.x + 1, state.y)
      else
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
