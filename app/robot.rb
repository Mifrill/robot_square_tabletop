module Toy
  class Robot
    DIRECTIONS = %i[north west south east].freeze

    attr_reader :config, :facing, :shift_step
    attr_reader :direction

    def initialize
      @config     ||= Toy.config
      @shift_step ||= config['step'].to_i

      @facing     ||= begin
        config['facing'].map do |face|
          face.downcase.to_sym
        end
      end
    end

    def direction=(direction)
      # it return assignment value for the invalid direction
      # coz we cant chain assignment like methods (surprise for me)
      @direction = direction if facing.include?(direction)
    end

    def turn_left
      self.direction = begin
        DIRECTIONS[DIRECTIONS.index(direction) + 1]
      end
    end

    def turn_right
      self.direction = begin
        DIRECTIONS[DIRECTIONS.index(direction) - 1]
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
