require 'rubygems'
require 'json'

module Robot
  class Table
    def config
      file = File.read './data.json'
      @data = JSON.parse(file)
    end

    def settings
      config
      @data['commands'].each do |command|
        instance_variable_set("@#{command}".downcase.split(' ')[0], "#{command}")
      end
    end
  end
end
