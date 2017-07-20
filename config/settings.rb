require 'rubygems'
require 'json'

module Toy
  def config
    JSON.parse(File.read './settings.json')
  end

  module_function :config
end
