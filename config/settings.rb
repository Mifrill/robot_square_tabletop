require 'rubygems'
require 'json'

module Toy
  def config
    JSON.parse(File.read './data.json')
  end

  module_function :config
end
