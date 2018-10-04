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

    delegate %i[turn_left turn_right direction step] => :@robot
    delegate %i[placed? position] => :@table

    def initialize
      @table ||= Toy::Table::Square.new
      @robot ||= Toy::Robot.new
    end

    def execute(input)
      command, *args = begin
        input.gsub(/\s+/, ' ')
             .gsub(/(?<=\d)\s+/, '')
             .strip.split(/\s+/)
      end

      return if command.to_s.empty?

      if truthy_command(command)
        if self.command == 'PLACE'
          return ALREADY_PLACED if placed?

          place(args)
        else
          return PLACE_FAILED unless placed?

          send(self.command.downcase, args)
        end
      else
        "#{SYSTEM_MESSAGES['invalid_command']} #{command}"
      end
    end

    protected

    def place(args)
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
      turn_left
    end

    def right(*)
      turn_right
    end

    def report(*)
      "#{position[:x]},#{position[:y]},#{direction.to_s.upcase}"
    end

    private

    def truthy_command(command)
      self.command = command if Toy.config['commands'].include?(command)
    end
  end
end
