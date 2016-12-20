require 'spec_helper'

RSpec.describe Instruction do
  let(:file_path1) { "./test_files/1.txt" }
  let(:file_path2) { "./test_files/2.txt" }
  let(:file_path3) { "./test_files/3.txt" }

  describe ".load" do
    it "be able to load instruction from file" do
      expect(Instruction.load(file_path: file_path1).moves).to eq(["PLACE 0,0,NORTH", "MOVE", "REPORT"])
      expect(Instruction.load(file_path: file_path2).moves).to eq(["PLACE 0,0,NORTH", "LEFT", "REPORT"])
      expect(Instruction.load(file_path: file_path3).moves).to eq(["PLACE 1,2,EAST", "MOVE", "MOVE", "LEFT", "MOVE", "REPORT"])
    end
  end
end
