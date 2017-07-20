require_relative 'simulator'

simulator = Toy::Simulator.new

command = STDIN.gets
while command
  output = simulator.execute(command)
  puts output if output
  command = STDIN.gets
end
