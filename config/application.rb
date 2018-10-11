require 'rubygems'
require 'json'

module Toy
  CONFIGURATION   = JSON.parse(File.read('./settings.json')).freeze
  SYSTEM_MESSAGES = CONFIGURATION['system_messages']

  class << self
    def simulator
      @simulator ||= Toy::Simulator.new
    end

    def config
      @config ||= CONFIGURATION
    end
  end

  module_function

  def execute_from_file(filename)
    puts "#{config['system_messages']['file']} #{filename}"
    inputs = JSON.parse(File.read(filename))

    inputs.each do |_example, commands|
      commands.each do |command|
        output = simulator.execute(command)
        puts output if output
      end
    end

    puts success = config['system_messages']['done']
    success
  end

  def execute_by_hand
    command = STDIN.gets
    while command
      output = simulator.execute(command)
      puts output if output
      command = STDIN.gets
    end
  end
end
