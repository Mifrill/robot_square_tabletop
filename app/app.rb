require './config/settings'
require_relative 'table'
require_relative 'robot'

robot = Toy::Robot.new
puts robot.limit
