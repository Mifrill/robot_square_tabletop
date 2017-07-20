require 'spec_helper'

describe Toy::Simulator do
  let!(:robot) { Toy::Simulator.new }

  it 'initialize' do
    expect(robot.move).to eq('MOVE')
    expect(robot.limit).to eq('5')
    expect(robot.place).to match_array(%w[0 0 FACING])
  end
end
