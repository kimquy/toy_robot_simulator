class Instruction
  def self.load(file_path:)
    new(file_path).load
  end

  attr_reader :instructions, :moves

  def initialize(file_path)
    file = File.new(file_path)
    @instructions = file.readlines

    init_moves
  end

  def load
    self
  end

  private

  # init_moves()
  # The first valid command to the robot is a PLACE command, after that,
  # any sequence of commands may be issued, in any order, including another
  # PLACE command. The application should discard all commands in the sequence
  # until a valid PLACE command has been executed.
  def init_moves
    @moves = instructions.slice(
      instructions.index { |item| item.include?("PLACE") },
      instructions.size
    ).map(&:strip)
  end
end
