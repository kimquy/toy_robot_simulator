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

  def init_moves
    @moves = instructions.slice(
      instructions.index { |item| item.include?("PLACE") }.to_i,
      instructions.size
    ).map(&:strip)
  end
end
