require 'spec_helper'
require './app/app'

describe Toy do
  it 'Execute from file' do
    expect(Toy.execute_from_file('./example.json')).to eq(Toy.config['system_messages']['done'])
  end
end
