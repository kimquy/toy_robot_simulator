require_relative "../src/board"
require_relative "../src/instruction"
require_relative "../src/robot"

file_path = File.absolute_path(ARGV[0])

begin
  board = Board.new(5, 5)
  instruction = Instruction.load(file_path: file_path)
  puts Robot.perform(board: board, instruction: instruction)
rescue
  puts "Invalid file path: #{file_path}"
end
