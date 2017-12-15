require_relative 'simulator'

puts Toy::SYSTEM_MESSAGES['hello']

ARGV[0] == 'file' ? Toy.execute_from_file(ARGV[1]) : Toy.execute_by_hand
