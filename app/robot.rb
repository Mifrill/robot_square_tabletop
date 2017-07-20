module Toy
  class Robot
    attr_accessor :direction

    def orientation(direction)
      Toy.config['facing'].collect { |x| x.downcase.to_sym }.include?(direction) ? (self.direction = direction) : nil
    end

    def turn_left
      self.direction = { north: :west, west: :south, south: :east, east: :north }[direction]
    end

    def turn_right
      self.direction = { north: :east, west: :north, south: :west, east: :south }[direction]
    end

    def step
      puts self
    end
  end
end
