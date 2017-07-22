require_relative 'simulator'

simulator = Toy::Simulator.new

if ARGV[0] == 'file'
  puts "#{Toy.config['system_messages']['file']} #{ARGV[1]}"
  inputs = JSON.parse(File.read ARGV[1])
  inputs.each do |input|
    input.drop(1).each do |commands|
      commands.each do |command|
        output = simulator.execute(command)
        puts output if output
      end
      simulator = Toy::Simulator.new
    end
  end
  puts Toy.config['system_messages']['done']
else
  command = STDIN.gets
  while command
    output = simulator.execute(command)
    puts output if output
    command = STDIN.gets
  end
end
