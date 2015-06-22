#Program to scrap test output to see results

require 'csv'


pid = Array.new
numprocesses = Array.new
holes  = Array.new
memusage = Array.new

CSV.foreach(File.path("test_output.txt")) do |csv|
	
	pid.push( /[0-9]*/.match(csv[0]))
	numprocesses.push((/[0-9]+/.match(csv[1]))[0].to_i)
	holes.push((/[0-9]+/.match(csv[2]))[0].to_i)
	memusage.push((/[0-9]+/.match(csv[3]))[0].to_i) 
	
end

puts "The algorithm ran #{pid.count} times"
puts "The average number of process was #{(numprocesses.reduce(:+)*1.0/numprocesses.count).round(2) }"
puts "The average number of holes was #{(holes.reduce(:+)*1.0/holes.count).round(2)}"
puts "mem_usage:  was #{(memusage.reduce(:+)*1.0 /memusage.count).round(2) }"