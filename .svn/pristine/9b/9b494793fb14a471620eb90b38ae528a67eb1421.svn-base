//worst fit algorithm

#include <stdio.h>
#include "algorithms.h"
#include "utilities.h"

struct memory_lists* find_worst(struct memory_list_info *info_node,struct processes* process)
{
	struct memory_lists *current_memory = info_node->free_list;
	struct memory_lists *worst = (struct memory_lists *)salloc(sizeof(struct memory_lists));
	worst->size = 0;
	if( !info_node->free_list)
	{
		//means list is 100% full
		return NULL;
	}
	while(current_memory != NULL)
	{	
		// worst algorithm looks for the biggest hole that i can find
		if(current_memory->size > worst->size && current_memory->size >= process->size )
		{
			worst = current_memory;
		}
		current_memory = current_memory->next;
	}
	if(worst->size == 0)
	{
		return NULL;
	}
	return worst;
	
}
