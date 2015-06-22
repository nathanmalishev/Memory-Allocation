#!/usr/bin/env ruby

#program creates test data based both on memory and number of processes
# ruby run.rb alogirthm memory_size no_processes

algorithm = ARGV[0]
memory    = ARGV[1]
pid       = ARGV[2]


#create some input
system("ruby create_input.rb #{pid} #{memory}")

system("./mem -f test_input.txt -a #{algorithm} -m #{memory} > test_output.txt")

puts "-----------------------------"
puts
puts "Stats for #{algorithm.upcase} with #{memory}mb and #{pid} processes"

system("ruby scrap.rb")


