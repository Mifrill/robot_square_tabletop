require_relative 'table'

module Toy
  class Robot
    attr_accessor :direction

    def orientation(direction)
      puts direction
    end

    def initialize
      class << self
        def settings
          Toy.config['commands'].each do |command|
            instance_variable_set("@#{command}".downcase.split(' ')[0], command.to_s)
          end
        end
      end
      settings
    end

    def place
      puts @place
      class << self
        def args(coordinate, num)
          instance_variable_set("@#{coordinate}", (@place.split(' ')[1].split(',')[num]).to_s)
        end
      end

      args('x', 0)
      args('y', 1)
      args('facing', 2)

      place = []
      place << @x << @y << @facing
    end

    def turn_left
      puts self
    end

    def turn_right
      puts self
    end
  end
end
