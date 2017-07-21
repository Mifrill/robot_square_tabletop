require 'spec_helper'

describe 'Simulator' do
  let(:simulator) { Toy::Simulator.new }
  let(:table) { simulator.instance_variable_get(:@table) }
  let(:robot) { simulator.instance_variable_get(:@robot) }

  it 'truthy_command' do
    expect(simulator.send(:truthy_command, 'MOVE')).to eq('MOVE')
  end

  describe 'REPORT' do
    it 'returns the result in specified format' do
      allow(table).to receive(:position).and_return(x: 2, y: 3)
      allow(robot).to receive(:direction).and_return(:south)

      expect(simulator.execute('REPORT')).to eq('2,3,SOUTH')
    end
  end

  describe 'MOVE' do
    describe 'Movement within the table' do
      it 'use a movement step from the robot and applies it to the table' do
        robot.orientation(:north)
        table.place(0, 0)

        expect(simulator.execute('MOVE')).to eq('Movement implemented')
      end
    end

    describe 'Off-site movement' do
      it 'does not move the robot off the table' do
        robot.orientation(:south)
        table.place(0, 0)

        expect(simulator.execute('MOVE')).to eq('out of table')
        expect(simulator.execute('REPORT')).to eq('0,0,SOUTH')
      end
    end
  end
end
