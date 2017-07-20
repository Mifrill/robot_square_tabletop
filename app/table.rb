require_relative 'robot'

module Toy
  class Table
    class Square < Table
      def initialize
        units
      end

      private

      def units
        @limit = (Toy.config['units'].to_f - 1)
      end
    end

    attr_accessor :position

    def place(x, y)
      self.position = { x: x, y: y } if valid_coordinates?(x, y)
    end

    def placed?
      position != nil
    end

    private

    def valid_coordinates?(x, y)
      (x >= 0 && x <= @limit && y >= 0 && y <= @limit)
    end
  end
end
