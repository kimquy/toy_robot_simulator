require 'spec_helper'

RSpec.describe Robot do
  let(:board) { Board.new(5, 5) }
  let(:instruction1) { Instruction.load(file_path: "./test_files/1.txt") }
  let(:instruction2) { Instruction.load(file_path: "./test_files/2.txt") }
  let(:instruction3) { Instruction.load(file_path: "./test_files/3.txt") }

  describe ".perform" do
    it "report correct value" do
      expect(Robot.perform(board: board, instruction: instruction1)).to eq("0,1,NORTH")
      expect(Robot.perform(board: board, instruction: instruction2)).to eq("0,0,WEST")
      expect(Robot.perform(board: board, instruction: instruction3)).to eq("3,3,NORTH")
    end
  end
end
