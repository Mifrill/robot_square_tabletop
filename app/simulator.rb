require './config/settings'
require_relative 'table'
require_relative 'robot'

module Toy
  class Simulator
    def initialize
      @robot = Toy::Robot.new
      @table = Toy::Table::Square.new
    end

    def execute(input)
      input = input.split(/\s+/)
      command = input.first
      args = input.last
      true_command = Toy.config['commands']

      case command
      when true_command[0]
        puts "execute command: #{true_command[0]}"
        place(args)
      when true_command[1]
        puts "execute command: #{true_command[1]}"
        move
      when true_command[2]
        puts "execute command: #{true_command[2]}"
        left
      when true_command[3]
        puts "execute command: #{true_command[3]}"
        right
      when true_command[4]
        puts "execute command: #{true_command[4]}"
        report
      else
        "Invalid command #{command} -- ignore that --"
      end
    end

    private

    def move
      position = @table.position
      puts position
    end
  end
end
