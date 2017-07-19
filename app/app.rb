require './config/settings'
require_relative 'square'

module Robot
  def config
    puts self
  end

  class Table
    def action
      puts self
    end

    def report
      puts self
    end
  end
end
