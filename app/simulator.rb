require './config/settings'
require_relative 'table'
require_relative 'robot'

module Toy
  class Simulator
    attr_accessor :command

    def initialize
      @table = Toy::Table::Square.new
      @robot = Toy::Robot.new
    end

    def execute(input)
      input = input.split(/\s+/)
      command = input.first
      args = input.last

      case command
      when truthy_command(command)
        send(command.downcase, args)
      else
        "Invalid command #{command}"
      end
    end

    private

    def truthy_command(command)
      Toy.config['commands'].include?(command) ? (self.command = command) : nil
    end

    def place(args)
      args
    end

    def move(_arg = nil)
      step = @robot.step
      position = @table.position
      @table.place(position[:x] + step[:x], position[:y] + step[:y]) ? 'Movement implemented' : 'out of table'
    end

    def left(_arg = nil)
      @robot.turn_left
    end

    def right(_arg = nil)
      @robot.turn_right
    end

    def report(_arg = nil)
      position = @table.position
      direction = @robot.direction

      "#{position[:x]},#{position[:y]},#{direction.to_s.upcase}"
    end
  end
end
