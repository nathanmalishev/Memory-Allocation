//code will also be present here

#ifndef QUEUE_H
#define QUEUE_H

#include "mem_node.h"

 
void process_queue(struct processes *node, struct memory_list_info *info_node,char *algorithm);
struct processes * create_process_list(char *file_name);


#endif