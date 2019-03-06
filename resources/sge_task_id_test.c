/* sge_task_id_test.c */
#include <stdio.h>
#include <stdlib.h>

int main (int argc, char ** argv){
  char * taskID_string;
  int taskID;

  /* this is the key call, see the documentation with 
     man 3 getenv or man 3p getenv */
  taskID_string = getenv("SGE_TASK_ID");

  // Now we make sure we got something
  if (taskID_string == NULL){
    exit(EXIT_FAILURE);
  }
  if (1 != sscanf(taskID_string,  "%d", &taskID)){
    exit(EXIT_FAILURE);
  }

  printf("The value of SGE_TASK_ID is: %d\n", taskID);

  return EXIT_SUCCESS;
}
