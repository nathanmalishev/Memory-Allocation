#ifndef ALGORITHMS_H
#define ALGORITHMS_H
//header files with all the different algorithms
#include "mem_node.h"

//first algorithm - returns first hole that fits and uses it
struct memory_lists* find_first(struct memory_list_info *info_node,struct processes* process);
//best algorithm - takes smallest hole and returns it
struct memory_lists *find_best(struct memory_list_info *info_node, struct processes *process);
//worst algorithm - takes largest memory spot and returns it
struct memory_lists* find_worst(struct memory_list_info *info_node,struct processes* process);
//next algorithm like first, but keeps track of where it is
struct memory_lists* find_next(struct memory_list_info *info_node,struct processes* process, struct memory_lists *last_mem);



#endif