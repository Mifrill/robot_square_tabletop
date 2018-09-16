require 'spec_helper'

describe Toy::Simulator do
  let(:simulator) { Toy::Simulator.new }
  let(:table) { simulator.instance_variable_get(:@table) }
  let(:robot) { simulator.instance_variable_get(:@robot) }

  it 'truthy_command' do
    truthy_command = Toy.config['commands']
    truthy_command.each do |command|
      expect(simulator.send(:truthy_command, command)).to eq(command)
    end
  end

  describe 'PLACE' do
    it 'Robot is placed' do
      simulator.execute('PLACE 0,0,NORTH')
      expect(simulator.execute('REPORT')).to eq('0,0,NORTH')
    end

    it 'ignore spaces, example: "   PLACE 3 ,   4   ,  WEST "' do
      command = '   PLACE 3 , 4,  WEST '
      expect(simulator.execute(command)).to eq('Robot has been placed')
    end

    it 'Robot is not placed if invalid arguments' do
      expect(simulator.execute('PLACE (0,0,west)')).to eq('Invalid arguments')
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

  describe 'LEFT/RIGHT' do
    before do
      robot.orientation(:north)
      table.place(0, 0)
    end

    it 'Robot to turn left' do
      simulator.execute('LEFT')
      expect(simulator.execute('REPORT')).to eq('0,0,WEST')
    end

    it 'Robot to turn right' do
      simulator.execute('RIGHT')
      expect(simulator.execute('REPORT')).to eq('0,0,EAST')
    end
  end

  describe 'REPORT' do
    it 'returns the result in specified format' do
      allow(table).to receive(:position).and_return(x: 2, y: 3)
      allow(robot).to receive(:direction).and_return(:south)

      expect(simulator.execute('REPORT')).to eq('2,3,SOUTH')
    end
  end

  describe 'Exceptions' do
    it 'Some invalid command' do
      command = 'some_command'
      expect(simulator.execute(command)).to eq("#{Toy.config['system_messages']['invalid_command']} #{command}")
    end

    it 'Space handler (empty input)' do
      expect(simulator.execute(' ')).to be_nil
    end

    it 'Robot ignore commands until is placed' do
      Toy.config['commands'].drop(1).each do |command|
        expect(simulator.execute(command)).to  eq(Toy.config['system_messages']['place_failed'])
      end
    end

    it 'Robot say: "already placed" when command place for already placed robot' do
      simulator.execute('PLACE 0,0,WEST')

      expect(table.placed?).to be_truthy
      expect(simulator.execute('PLACE 0,0,WEST')).to eq(Toy.config['system_messages']['already_placed'])
    end
  end
end
