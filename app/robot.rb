require_relative 'table'

module Toy
  class Robot
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

    def limit
      @table.limit
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

    attr_reader :move

    attr_reader :left

    attr_reader :right

    attr_reader :report
  end
end
