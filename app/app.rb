require_relative 'simulator'

if ARGV[0] == 'file'
  Toy.execute_from_file(ARGV[1])
else
  return if ENV['ROBOT_ENV'] == 'test'
  Toy.execute_by_hand
end
