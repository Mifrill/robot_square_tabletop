require 'spec_helper'

describe 'Simulator' do
  let(:simulator) { Toy::Simulator.new }

  it 'truthy_command' do
    expect(simulator.send(:truthy_command, 'MOVE')).to eq('MOVE')
  end

  it 'execute' do
    expect(simulator.execute('MOVE')).to be nil
  end
end
