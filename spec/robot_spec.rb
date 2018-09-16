require 'spec_helper'

describe Toy::Robot do
  let(:robot) { Toy::Robot.new }

  describe 'direction=' do
    context 'allows direction' do
      it 'NORTH' do
        robot.direction = :north
        expect(robot.direction).to be(:north)
      end

      it 'SOUTH' do
        robot.direction = :south
        expect(robot.direction).to be(:south)
      end

      it 'WEST' do
        robot.direction = :west
        expect(robot.direction).to be(:west)
      end

      it 'EAST' do
        robot.direction = :east
        expect(robot.direction).to be(:east)
      end
    end

    it 'disallows mistaken direction' do
      robot.direction = :some_direction
      expect(robot.direction).to be_nil
    end
  end

  scenario = <<~HEREDOC
    Given robot is on directed to the some side of the world
    When he getting command: "turn_right"/"turn_left"
    Then robot direction will be changed by right/left side of the world
  HEREDOC

  describe scenario do
    context 'Turn right' do
      let(:right) { robot.turn_right }

      it 'north -> east' do
        robot.direction = :north

        right

        expect(robot.direction).to eq(:east)
      end

      it 'south -> west' do
        robot.direction = :south

        right

        expect(robot.direction).to eq(:west)
      end

      it 'west -> north' do
        robot.direction = :west

        right

        expect(robot.direction).to eq(:north)
      end

      it 'east -> south' do
        robot.direction = :east

        right

        expect(robot.direction).to eq(:south)
      end
    end

    context 'Turn left' do
      let(:left) { robot.turn_left }

      it 'south -> east' do
        robot.direction = :south

        left

        expect(robot.direction).to eq(:east)
      end

      it 'north -> west' do
        robot.direction = :north

        left

        expect(robot.direction).to eq(:west)
      end

      it 'west -> south' do
        robot.direction = :west

        left

        expect(robot.direction).to eq(:south)
      end

      it 'west -> south' do
        robot.direction = :west

        left

        expect(robot.direction).to eq(:south)
      end
    end
  end

  describe 'Step' do
    let(:step) { Toy.config['step'].to_f }

    it 'facing north -> moves up' do
      robot.direction = :north

      expect(robot.step).to eq(x: 0, y: step)
    end

    it 'facing south -> moves down' do
      robot.direction = :south

      expect(robot.step).to eq(x: 0, y: -step)
    end

    it 'facing west -> moves left' do
      robot.direction = :west

      expect(robot.step).to eq(x: -step, y: 0)
    end

    it 'facing east -> moves right' do
      robot.direction = :east

      expect(robot.step).to eq(x: 1, y: 0)
    end

    it 'Raise error when unknown direction' do
      robot.direction = :some_direction

      expect { robot.step }.to raise_error(RuntimeError, Toy.config['system_messages']['unknown_direction'])
    end
  end
end
