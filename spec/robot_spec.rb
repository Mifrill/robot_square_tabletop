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
end
