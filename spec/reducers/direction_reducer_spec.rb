require 'spec_helper'

RSpec.describe DirectionReducer do
  let(:state) { State.new }

  context "turns 'Left'" do
    let(:direction) { "LEFT" }

    context "facing 'North'" do
      it "return new correct state" do
        state.facing = "NORTH"
        expect(DirectionReducer.exec(state, direction).facing).to eq("WEST")
      end
    end

    context "facing 'SOUTH'" do
      it "return new correct state" do
        state.facing = "SOUTH"
        expect(DirectionReducer.exec(state, direction).facing).to eq("EAST")
      end
    end

    context "facing 'WEST'" do
      it "return new correct state" do
        state.facing = "WEST"
        expect(DirectionReducer.exec(state, direction).facing).to eq("SOUTH")
      end
    end

    context "facing 'EAST'" do
      it "return new correct state" do
        state.facing = "EAST"
        expect(DirectionReducer.exec(state, direction).facing).to eq("NORTH")
      end
    end
  end

  context "turns 'Right'" do
    let(:direction) { "RIGHT" }

    context "facing 'North'" do
      it "return new correct state" do
        state.facing = "NORTH"
        expect(DirectionReducer.exec(state, direction).facing).to eq("EAST")
      end
    end

    context "facing 'SOUTH'" do
      it "return new correct state" do
        state.facing = "SOUTH"
        expect(DirectionReducer.exec(state, direction).facing).to eq("WEST")
      end
    end

    context "facing 'WEST'" do
      it "return new correct state" do
        state.facing = "WEST"
        expect(DirectionReducer.exec(state, direction).facing).to eq("NORTH")
      end
    end

    context "facing 'EAST'" do
      it "return new correct state" do
        state.facing = "EAST"
        expect(DirectionReducer.exec(state, direction).facing).to eq("SOUTH")
      end
    end
  end
end
