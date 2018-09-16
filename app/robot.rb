module Toy
  class Robot
    attr_reader :config, :facing, :shift_step
    attr_accessor :direction

    def initialize
      @config     ||= Toy.config

      @facing     ||= config['facing']
      @shift_step ||= config['step'].to_i
    end

    def orientation(direction)
      self.direction = begin
        direction if facing.find { |face| face.downcase.to_sym == direction }
      end
    end

    def turn_left
      self.direction = begin
        { north: :west, west: :south, south: :east, east: :north }[direction]
      end
    end

    def turn_right
      self.direction = begin
        { north: :east, west: :north, south: :west, east: :south }[direction]
      end
    end

    def step
      case direction
      when :north
        { x: 0, y: shift_step }
      when :south
        { x: 0, y: -shift_step }
      when :west
        { x: -shift_step, y: 0 }
      when :east
        { x: shift_step, y: 0 }
      else
        raise SYSTEM_MESSAGES['unknown_direction']
      end
    end
  end
end
