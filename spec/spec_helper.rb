if ENV['ROBOT_ENV'] == 'test'
  require 'simplecov'
  SimpleCov.start
  puts 'required simplecov'
end

require './app/simulator'

RSpec.configure do |config|
  config.filter_run_when_matching :focus
end
