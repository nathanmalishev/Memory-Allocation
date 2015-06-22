#include <stdio.h>	
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "headerfiles/memswap.h"
#include "headerfiles/mem_node.h"
#include "headerfiles/utilities.h"
#include "headerfiles/queue.h"


int main(int argc, char **argv)
{
	char input;
	char *file_name, *algorithm_name;
	int memory_size;

	file_name      = (char *)salloc(sizeof(char)*ARGUMENT_NAME_SIZE);
	algorithm_name = (char *)salloc(sizeof(char)*ARGUMENT_NAME_SIZE);
	// get values for each option
	while((input   = getopt(argc, argv, "f:m:a:")) != EOF)
	{
		switch(input)
		{
			case 'f':
				file_name = optarg;
				continue;
			case 'm':
				memory_size = atoi(optarg);
				continue;
			case 'a':
				algorithm_name = optarg;
				continue;
		}
	}

	//read in data here and create process queue
	struct processes *processes_queue;
	processes_queue = create_process_list(file_name);

	//create initial memory list	
	struct memory_list_info *mem_info_node = create_memory_list( memory_size );

	//process the processes
	process_queue(  processes_queue , mem_info_node , algorithm_name );
	
	return 0;
}
