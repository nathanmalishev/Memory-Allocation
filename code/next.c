//next fit algorithm

#include <stdio.h>
#include "headerfiles/algorithms.h"
#include "headerfiles/mem_node.h"


//algorithm searches through list remembers where it last was.
//im allowing one loop
struct memory_lists* find_next(struct memory_list_info *info_node,
	struct processes* process, struct memory_lists *last_mem)
{	

	struct memory_lists *current_memory, *first_mem;
	int first_flag=0;


	if( !info_node->free_list)
	{
		//means list is 100% full
		return NULL;
	}
	//is this the nodes first time?
	if(last_mem)
	{
		current_memory = last_mem;		
	}
	else
	{
		current_memory = info_node->free_list;
	}
	//set what the first memory was to know if we have done a loop
	first_mem = current_memory;
	//printf("in next function\n");
	//memory_list_testing(info_node,1);
	while( first_mem != current_memory || first_flag == 0 )
	{	

		//printf("current_memory\n");
		//printf("%p\n", current_memory);
		//printf("%d\n", current_memory->size);
		first_flag = 1;
		if(current_memory->size >= process->size)
		{
			return current_memory;
		}

		if(current_memory->next)
		{
			current_memory = current_memory->next;
		}
		else
		{
			current_memory = info_node->free_list;
		}
	}
	
	return NULL;
}

