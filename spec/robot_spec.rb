require 'spec_helper'

describe 'Robot' do
  let(:robot) { Toy::Robot.new }

  describe 'orientation' do
    context 'allows direction' do
      it 'NORTH' do
        expect(robot.orientation(:north)).to be(:north)
      end

      it 'SOUTH' do
        expect(robot.orientation(:south)).to be(:south)
      end

      it 'WEST' do
        expect(robot.orientation(:west)).to be(:west)
      end

      it 'EAST' do
        expect(robot.orientation(:east)).to be(:east)
      end
    end

    it 'disallows mistaken direction' do
      expect(robot.orientation(:some_direction)).to be_nil
    end
  end

  scenario = <<~HEREDOC
    Given robot is on directed to the some side of the world
    When he getting command: "turn_right"/"turn_left"
    Then robot direction will be changed by right/left side of the world
  HEREDOC

  describe scenario do
    context 'Right side' do
      it 'north -> east' do
        robot.orientation(:north)

        robot.turn_right

        expect(robot.direction).to eq(:east)
      end

      it 'south -> west' do
        robot.orientation(:south)

        robot.turn_right

        expect(robot.direction).to eq(:west)
      end

      it 'west -> north' do
        robot.orientation(:west)

        robot.turn_right

        expect(robot.direction).to eq(:north)
      end

      it 'east -> south' do
        robot.orientation(:east)

        robot.turn_right

        expect(robot.direction).to eq(:south)
      end
    end

    context 'Left side' do
      it 'north -> east' do
        robot.orientation(:north)

        robot.turn_left

        expect(robot.direction).to eq(:west)
      end

      it 'south -> west' do
        robot.orientation(:south)

        robot.turn_left

        expect(robot.direction).to eq(:east)
      end

      it 'west -> north' do
        robot.orientation(:west)

        robot.turn_left

        expect(robot.direction).to eq(:south)
      end

      it 'east -> south' do
        robot.orientation(:east)

        robot.turn_left

        expect(robot.direction).to eq(:north)
      end
    end
  end

  describe 'Step' do
    it 'facing north -> moves up' do
      robot.orientation(:north)

      expect(robot.step).to eq(x: 0, y: 1)
    end

    it 'facing south -> moves down' do
      robot.orientation(:south)

      expect(robot.step).to eq(x: 0, y: -1)
    end

    it 'facing west -> moves left' do
      robot.orientation(:west)

      expect(robot.step).to eq(x: -1, y: 0)
    end

    it 'facing east -> moves right' do
      robot.orientation(:east)

      expect(robot.step).to eq(x: 1, y: 0)
    end

    it 'Raise error when unknown direction' do
      robot.orientation(:some_direction)

      expect { robot.step }.to raise_error(RuntimeError, 'Unknown direction')
    end
  end
end
