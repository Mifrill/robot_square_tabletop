require './config/application'
require_relative 'table'
require_relative 'robot'

module Toy
  class Simulator
    require 'forwardable'

    extend Forwardable

    delegate %i(turn_left turn_right direction step) => :@robot
    delegate %i(placed? position) => :@table

    attr_accessor :command
    PLACE_FAILED = SYSTEM_MESSAGES['place_failed']

    def initialize
      @table = Toy::Table::Square.new
      @robot = Toy::Robot.new
    end

    def execute(input)
      return if input.strip.empty?

      input   = input.strip.split(/\s+/)
      command = input.first
      args    = input.last

      truthy_command(command) ? send(command.downcase, args) : "#{SYSTEM_MESSAGES['invalid_command']} #{command}"
    end

    private

    def truthy_command(command)
      self.command = command if Toy.config['commands'].include?(command)
    end

    def place(args)
      args      = args.split(/,/)
      x         = args[0].to_i
      y         = args[1].to_i
      direction = args[2]&.downcase&.to_sym

      @robot.orientation(direction) && @table.place(x, y) ? SYSTEM_MESSAGES['place_success'] : SYSTEM_MESSAGES['invalid_arguments']
    end

    def move(_args = nil)
      return PLACE_FAILED unless placed?
      @table.place(position[:x] + step[:x], position[:y] + step[:y]) ? SYSTEM_MESSAGES['move_success'] : SYSTEM_MESSAGES['move_failed']
    end

    def left(_args = nil)
      return PLACE_FAILED unless placed?
      turn_left
    end

    def right(_args = nil)
      return PLACE_FAILED unless placed?
      turn_right
    end

    def report(_args = nil)
      return PLACE_FAILED unless placed?
      "#{position[:x]},#{position[:y]},#{direction.to_s.upcase}"
    end
  end
end
