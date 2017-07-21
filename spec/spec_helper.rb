if ENV['ROBOT_ENV'] == 'test'
  require 'simplecov'
  SimpleCov.minimum_coverage 100
  SimpleCov.refuse_coverage_drop
  puts 'CodeCoverage Enabled'
  if ENV['CI']
    require 'codeclimate-test-reporter'
    require 'codecov'
    SimpleCov.start
    SimpleCov.formatter = SimpleCov::Formatter::Codecov
  else
    SimpleCov.start
  end
end

require './app/simulator'

RSpec.configure do |config|
  config.filter_run_when_matching :focus
end
