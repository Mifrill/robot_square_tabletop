require './config/settings'
require_relative 'square'

module Robot
  class Table
    def action
      settings
      puts self
    end

    def report
      puts @report
    end
  end
end
