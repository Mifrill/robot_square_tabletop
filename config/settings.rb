require 'rubygems'
require 'json'

module Robot
  class Table
    def config
      file = File.read './data.json'
      @data = JSON.parse(file)
    end
  end
end
