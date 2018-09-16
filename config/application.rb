require 'rubygems'
require 'json'

module Toy
  def config
    JSON.parse(File.read('./settings.json'))
  end

  def execute_from_file(filename)
    simulator = Toy::Simulator.new

    puts "#{Toy.config['system_messages']['file']} #{filename}"
    inputs = JSON.parse(File.read(filename))

    inputs.each do |input|
      input.drop(1).each do |commands|
        commands.each do |command|
          output = simulator.execute(command)
          puts output if output
        end
      end
    end

    puts success = Toy.config['system_messages']['done']
    success
  end

  def execute_by_hand
    simulator = Toy::Simulator.new

    command = STDIN.gets
    while command
      output = simulator.execute(command)
      puts output if output
      command = STDIN.gets
    end
  end

  module_function :config, :execute_from_file, :execute_by_hand

  SYSTEM_MESSAGES = Toy.config['system_messages']
end
