require './config/settings'
require_relative 'table'
require_relative 'robot'

module Toy
  class Simulator
    attr_accessor :command

    def initialize
      @robot = Toy::Robot.new
      @table = Toy::Table::Square.new
    end

    def execute(input)
      input = input.split(/\s+/)
      command = input.first
      args = input.last

      case command
      when truthy_command(command)
        send(command.downcase)
      else
        "Invalid command #{command} -- ignore that --"
      end
    end

    private

    def truthy_command(command)
      Toy.config['commands'].include?(command) ? (self.command = command) : nil
    end

    def move
      position = @table.position
      position
    end

    def left
      @robot.turn_left
    end

    def right
      @robot.turn_right
    end

    def report
      position = @table.position
      direction = @robot.direction

      "#{position[:x]},#{position[:y]},#{direction.to_s.upcase}"
    end
  end
end
