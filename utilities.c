#include <stdlib.h>
#include <stdio.h>
#include <stddef.h>

#include "utilities.h"

//safe version of malloc
void * salloc(size_t size){
	void *data = malloc(size);
	if(!data)
	{
		perror("Failed to alocate memoery");
		exit(1);
	}
	return data;
} 