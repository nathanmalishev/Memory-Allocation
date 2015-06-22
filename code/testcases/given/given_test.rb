#!/usr/bin/env ruby

#Compares generated tests outputs to given test cases


require 'csv'
#Will store each line of each file as an array of fields (so an array of arrays).


def compare(input_file , output_file)

	file1_lines = CSV.read(input_file)
	file2_lines = CSV.read(output_file)
	error_count =0;

	for i in 0..file1_lines.size
	  if (file1_lines[i] == file2_lines[i])
	    #puts "Same #{file1_lines[i]}"
	  else
	    puts "#{file1_lines[i]} != #{file2_lines[i]}"
	    error_count += 1;
	  end
	end

	puts "Your out put has #{error_count} error(s) for #{input_file} & #{output_file}"
end


Dir.chdir('../')

system('make clobber')
system('make')



system('./memswap -f testcases/given/m200_in.txt -a first -m 200 > testcases/given/my200_first.txt')
system('./memswap -f testcases/given/m300_in.txt -a first -m 300 > testcases/given/my300_first.txt')

system('./memswap -f testcases/given/m200_in.txt -a next -m 200 > testcases/given/my200_next.txt')
system('./memswap -f testcases/given/m300_in.txt -a next -m 300 > testcases/given/my300_next.txt')

system('./memswap -f testcases/given/m200_in.txt -a worst -m 200 > testcases/given/my200_worst.txt')
system('./memswap -f testcases/given/m300_in.txt -a worst -m 300 > testcases/given/my300_worst.txt')

system('./memswap -f testcases/given/m200_in.txt -a best -m 200 > testcases/given/my200_best.txt')
system('./memswap -f testcases/given/m300_in.txt -a best -m 300 > testcases/given/my300_best.txt')


compare( "testcases/given/m200_first_out.txt" , "testcases/given/my200_first.txt")
compare( "testcases/given/m300_first_out.txt" , "testcases/given/my300_first.txt")

compare( "testcases/given/m200_next_out.txt" , "testcases/given/my200_next.txt")
compare( "testcases/given/m300_next_out.txt" , "testcases/given/my300_next.txt")

compare( "testcases/given/m200_worst_out.txt" , "testcases/given/my200_worst.txt")
compare( "testcases/given/m300_worst_out.txt" , "testcases/given/my300_worst.txt")

compare( "testcases/given/m200_best_out.txt" , "testcases/given/my200_best.txt")
compare( "testcases/given/m300_best_out.txt" , "testcases/given/my300_best.txt")








