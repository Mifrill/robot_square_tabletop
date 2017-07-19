require_relative 'app'

module Robot
  class Square < Table
    def place
      class << self
        def args(var, num)
          instance_variable_set("@#{var}", (@place.split(' ')[1].split(',')[num]).to_s)
        end
      end

      puts @place

      args('x', 0)
      args('y', 1)
      args('facing', 2)

      puts @x
      puts @y
      puts @facing
    end

    def move
      puts @move
    end

    def left
      puts @left
    end

    def right
      puts @right
    end
  end
end
