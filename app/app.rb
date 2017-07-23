require_relative 'simulator'

puts Toy.config['system_messages']['hello']

if ARGV[0] == 'file'
  Toy.execute_from_file(ARGV[1])
else
  Toy.execute_by_hand
end
