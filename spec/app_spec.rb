require 'spec_helper'

describe Toy do
  it 'Execute from file' do
    expect(Toy.execute_from_file('./test.example.json')).to eq(Toy.config['system_messages']['done'])
  end

  # https://stackoverflow.com/questions/35737695/testing-ruby-with-rspec-for-file-name-and-stdin-with-while-gets
  it 'Execute by hand'
end
