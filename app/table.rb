require_relative 'robot'

module Toy
  class Table
    def limit
      Toy.config['units']
    end

    class Square < Table
      def min_x
        puts self
      end

      def max_x
        puts self
      end

      def min_y
        puts self
      end

      def max_y
        puts self
      end
    end
  end
end
