//code will be in here
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "queue.h"
#include "math.h"
#include "algorithms.h"
#include "mem_node.h"
#include "utilities.h"


#define T 0
//Function that processes the process queue & prints results
// processes based on algorithm selected
void process_queue(struct processes *process, struct memory_list_info *info_node ,char *algorithm)
{
	struct memory_lists *memory_spot= NULL, *last_mem = NULL;
	struct memory_lists *tmp;
	struct processes *next;
	//Process each proccess in the list
	while( process )
	{	
		next = process->next;
		//can we find a spot for the process in memory?
		while( !memory_spot )
		{
			if (strcmp( algorithm, "first") == 0)
			{		
				memory_spot = find_first(info_node, process);
			} 
			else if (strcmp( algorithm, "best") == 0)
			{
				memory_spot = find_best(info_node, process);
			}
			else if (strcmp( algorithm, "worst") == 0)
			{
				memory_spot = find_worst(info_node, process);
			}
			else if (strcmp( algorithm, "next") == 0)
			{
				// if we have a last mem its actually the one before due to split function
				if(last_mem)
				{
					last_mem = last_mem->prev;
				}
				memory_spot = find_next(info_node, process, last_mem);
				if(memory_spot)
				{	
					last_mem = memory_spot->next;
				}
			}
			else{
				perror("algorithm not defined please enter best/first/worst/next");
				exit(1);
			}
			
			if(memory_spot){break;} //break on first iteration

			//ok nothing was found dame
			//time to take matters into our own hands and remove stuff
			
			//remove function
			tmp = remove_memory_node(info_node, process);
			//my own error check
			if(!tmp)
			{
				perror("error queue.c line 52");
				exit(1);
			}
			//join function
			free_memory_node(info_node, tmp);
		}

		//okay great we have a bit of memory lets use it!
		split_memory_node(info_node, memory_spot, process->size);
		//use this memory spot to a process
		use_memory_node(info_node, memory_spot, process);
		//output printing
		printf("%d loaded, numprocesses=%d, numholes=%d, memusage=%.f%%\n",
			process->pid, info_node->num_processes, info_node->holes,
				round(((info_node->mem_usage*1.0 / info_node->mem) * 100)+0.49) );
		
		//send in next process
		process = next;
		//reset memory spot
		memory_spot = NULL;
	}
}

//Creates the initial queue of processes
struct processes * create_process_list(char *file_name)
{
	struct processes *first_node;
	first_node     = (struct processes *)salloc(sizeof(struct processes));
	initialize_process( first_node );
	int read_count =0, tmp_pid, tmp_size;

	FILE *fp;
	fp = fopen(file_name, "r");
	if( fp == NULL )
	{
		perror("Error opening file");
		exit(1);
	}
	while(fscanf(fp, "%d %d", &tmp_pid, &tmp_size) != EOF)
	{
		struct processes *prev_node_add;
		if(read_count == 0)
		{
			read_count++;
			first_node->pid  = tmp_pid;
			first_node->size = tmp_size;
			prev_node_add    = first_node;
		}
		else
		{
			struct processes *new_node;
			new_node            = (struct processes *)salloc(sizeof(struct processes));
			initialize_process( new_node);
			new_node->pid       = tmp_pid;
			new_node->size      = tmp_size;
			
			prev_node_add->next = new_node;
			prev_node_add       = new_node;
		}
	}
	fclose(fp);
	return first_node; 	
}