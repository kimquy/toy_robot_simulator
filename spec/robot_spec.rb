require 'spec_helper'

RSpec.describe Robot do
  let(:board) { Board.new(5, 5) }
  let(:instruction1) { Instruction.load(file_path: "./test_files/1.txt") }
  let(:instruction2) { Instruction.load(file_path: "./test_files/2.txt") }
  let(:instruction3) { Instruction.load(file_path: "./test_files/3.txt") }
  let(:instruction4) { Instruction.load(file_path: "./test_files/4.txt") }
  let(:instruction5) { Instruction.load(file_path: "./test_files/5.txt") }
  let(:instruction6) { Instruction.load(file_path: "./test_files/6.txt") }
  let(:instruction7) { Instruction.load(file_path: "./test_files/7.txt") }

  describe ".perform" do
    it "report correct value" do
      expect(Robot.perform(board: board, instruction: instruction1)).to eq("0,1,NORTH")
      expect(Robot.perform(board: board, instruction: instruction2)).to eq("0,0,WEST")
      expect(Robot.perform(board: board, instruction: instruction3)).to eq("3,3,NORTH")
      expect(Robot.perform(board: board, instruction: instruction4)).to eq("")
      expect(Robot.perform(board: board, instruction: instruction5)).to eq("")
      expect(Robot.perform(board: board, instruction: instruction6)).to eq("")
      expect(Robot.perform(board: board, instruction: instruction7)).to eq("3,2,EAST")
    end
  end
end
