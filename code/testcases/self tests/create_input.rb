#!/usr/bin/env ruby

#creates input file based on maximum size memory & total number of processes


pid = Array.new
numbers = Array.new

i=1



max_mem = ARGV[1]
total_proc = ARGV[0]

until i > total_proc.to_i do
	pid << i.to_s + " " + rand(0..max_mem.to_i).to_s
	i+=1
end


File.open("test_input.txt", "w+") do |f|
  f.puts(pid)
  
end