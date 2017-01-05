require 'spec_helper'

RSpec.describe Board do
  let(:board) { Board.new(5, 5) }

  describe "#off_board?" do
    it do
      expect(board.off_board?(0, 0)).to eq(false)
      expect(board.off_board?(1, 0)).to eq(false)
      expect(board.off_board?(3, 4)).to eq(false)
      expect(board.off_board?(5, 4)).to eq(true)
      expect(board.off_board?(1, 7)).to eq(true)
      expect(board.off_board?(-1, 5)).to eq(true)
    end
  end
end
