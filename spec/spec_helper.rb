RSpec.configuration do |config|
end

if ENV['ROBOT_ENV'] == 'test'
  require 'simplecov'
  SimpleCov.start do
    use_merging true
    add_group 'app', 'app/app'
  end
  puts 'required simplecov'
end

require './app/app'
