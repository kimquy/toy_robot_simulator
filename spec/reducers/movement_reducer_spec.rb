require 'spec_helper'

RSpec.describe MovementReducer do
  let(:board) { Board.new(5, 5) }

  context "valid moves" do
    context "state at (0,0) and facing North" do
      let(:state) { State.new(0, 0, "NORTH") }

      it "returns new correct state" do
        expect(MovementReducer.exec(state, board).to_s).to eq("0,1,NORTH")
      end
    end

    context "state at (0,0) and facing East" do
      let(:state) { State.new(0, 0, "EAST") }

      it "returns new correct state" do
        expect(MovementReducer.exec(state, board).to_s).to eq("1,0,EAST")
      end
    end

    context "state at (3,2) and facing West" do
      let(:state) { State.new(3, 2, "WEST") }

      it "returns new correct state" do
        expect(MovementReducer.exec(state, board).to_s).to eq("2,2,WEST")
      end
    end
  end

  context "invalid moves" do
    context "state at (0,0) and facing South" do
      let(:state) { State.new(0, 0, "SOUTH") }

      it "returns new state with the same old location and facing" do
        expect(MovementReducer.exec(state, board).to_s).to eq("0,0,SOUTH")
      end
    end

    context "state at (5,5) and facing North" do
      let(:state) { State.new(5, 5, "NORTH") }

      it "returns new state with the same old location and facing" do
        expect(MovementReducer.exec(state, board).to_s).to eq("5,5,NORTH")
      end
    end

    context "state at (0,5) and facing North" do
      let(:state) { State.new(0, 5, "NORTH") }

      it "returns new state with the same old location and facing" do
        expect(MovementReducer.exec(state, board).to_s).to eq("0,5,NORTH")
      end
    end

    context "state at (5,0) and facing East" do
      let(:state) { State.new(5, 0, "EAST") }

      it "returns new state with the same old location and facing" do
        expect(MovementReducer.exec(state, board).to_s).to eq("5,0,EAST")
      end
    end
  end
end
