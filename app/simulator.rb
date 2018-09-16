require 'forwardable'
require './config/application'
require_relative 'table'
require_relative 'robot'

module Toy
  class Simulator
    extend Forwardable

    PLACE_FAILED   = SYSTEM_MESSAGES['place_failed']
    ALREADY_PLACED = SYSTEM_MESSAGES['already_placed']

    attr_accessor :command
    attr_reader :robot, :table

    delegate %i[turn_left turn_right direction step direction=] => :@robot
    delegate %i[placed? position] => :@table

    def initialize
      @table ||= Toy::Table::Square.new
      @robot ||= Toy::Robot.new
    end

    def execute(input)
      return if input.strip.empty?

      command, *args = begin
        input.gsub(/\s+/, ' ')
             .gsub(/(?<=\d)\s+/, '')
             .strip.split(/\s+/)
      end

      if truthy_command(command)
        send(command.downcase, args)
      else
        "#{SYSTEM_MESSAGES['invalid_command']} #{command}"
      end
    end

    protected

    def truthy_command(command)
      self.command = command if Toy.config['commands'].include?(command)
    end

    def place(args)
      return ALREADY_PLACED if placed?

      args = args.join.split(/,/)
      x, y = args.first(2).map(&:to_i)

      robot.direction = args[2]&.downcase&.to_sym

      if direction && @table.place(x, y)
        SYSTEM_MESSAGES['place_success']
      else
        SYSTEM_MESSAGES['invalid_arguments']
      end
    end

    def move(*)
      return PLACE_FAILED unless placed?

      success_move = begin
        @table.place(
          position[:x] + step[:x],
          position[:y] + step[:y]
        )
      end

      if success_move
        SYSTEM_MESSAGES['move_success']
      else
        SYSTEM_MESSAGES['move_failed']
      end
    end

    def left(*)
      return PLACE_FAILED unless placed?

      turn_left
    end

    def right(*)
      return PLACE_FAILED unless placed?

      turn_right
    end

    def report(*)
      return PLACE_FAILED unless placed?

      "#{position[:x]},#{position[:y]},#{direction.to_s.upcase}"
    end
  end
end
