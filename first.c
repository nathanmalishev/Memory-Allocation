//first.c
#include <stdio.h>
#include <stdlib.h>
#include "algorithms.h"


//trys to add the process to the memory list based on algorithm
struct memory_lists* find_first(struct memory_list_info *info_node,struct processes* process)
{
	struct memory_lists *current_memory = info_node->free_list;
	if( !info_node->free_list)
	{
		//means list is 100% full
		return NULL;
	}
	while(current_memory != NULL)
	{	
		
		if (current_memory->size >= process->size)
		{
			return current_memory;
		}
		current_memory = current_memory->next;
	}
	return NULL;
}


