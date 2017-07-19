require 'spec_helper'

describe Robot::Square do
  let!(:robot) { Robot::Square.new }

  it 'initialize' do
    robot.settings
    expect(robot.move).to eq('MOVE')
  end
end
