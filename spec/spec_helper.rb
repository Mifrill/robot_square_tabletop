RSpec.configuration do |config|
end

if ENV['ROBOT_ENV'] == 'test'
  require 'simplecov'
  SimpleCov.start
  puts 'required simplecov'
end

require './app/app'
