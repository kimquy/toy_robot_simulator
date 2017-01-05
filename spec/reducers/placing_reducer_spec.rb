require 'spec_helper'

RSpec.describe PlacingReducer do
  let(:board) { Board.new(5, 5) }
  let(:state) { State.new }

  context "nil location" do
    let(:location) { nil }

    it "returns error state" do
      expect(PlacingReducer.exec(state, location, board).error).to eq(true)
    end
  end

  context "invalid placing (off-board)" do
    context "location at '5,5,NORTH'" do
      let(:location) { "5,5,NORTH" }

      it "returns error state" do
        expect(PlacingReducer.exec(state, location, board).error).to eq(true)
      end
    end

    context "location at '0,5,NORTH'" do
      let(:location) { "0,5,NORTH" }

      it "returns error state" do
        expect(PlacingReducer.exec(state, location, board).error).to eq(true)
      end
    end

    context "location at '5,0,NORTH'" do
      let(:location) { "5,0,NORTH" }

      it "returns error state" do
        expect(PlacingReducer.exec(state, location, board).error).to eq(true)
      end
    end
  end

  context "valid placing" do
    context "location at '2,2,SOUTH'" do
      let(:location) { "2,2,SOUTH" }

      it "returns new state" do
        new_state = PlacingReducer.exec(state, location, board)
        expect(new_state.error).to eq(false)
        expect(new_state.x).to eq(2)
        expect(new_state.y).to eq(2)
        expect(new_state.facing).to eq("SOUTH")
      end
    end

    context "location at '0,2,WEST'" do
      let(:location) { "0,2,WEST" }

      it "returns new state" do
        new_state = PlacingReducer.exec(state, location, board)
        expect(new_state.error).to eq(false)
        expect(new_state.x).to eq(0)
        expect(new_state.y).to eq(2)
        expect(new_state.facing).to eq("WEST")
      end
    end

    context "location at '4,4,EAST'" do
      let(:location) { "4,4,EAST" }

      it "returns new state" do
        new_state = PlacingReducer.exec(state, location, board)
        expect(new_state.error).to eq(false)
        expect(new_state.x).to eq(4)
        expect(new_state.y).to eq(4)
        expect(new_state.facing).to eq("EAST")
      end
    end
  end
end
