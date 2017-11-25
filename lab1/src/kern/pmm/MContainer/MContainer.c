#include <lib/debug.h>
#include <lib/x86.h>
#include "import.h"

/** - SContainer is an object used to keep track of the resource usage of each process, 
  *    as well as the parent/child relationships between processes.
  * - To describe containers in more detail, we first need to define a way to 
  *   distinguish a particular process. We do this via unique IDs. Whenever a 
  *   process is spawned, it is assigned an unused ID in some range [0, NUM_IDS). 
  *   Every ID has an associated container. ID 0 is reserved for the kernel itself.
  * - For our kernel, we will define a parent/child relationship between IDs, 
  *   and we require that parents choose resources to pass on to their children. 
  *   Each ID has a single parent, and potentially multiple children. 
  *   ID 0 is called the "root", as it is the root of the parent/child tree and thus
  *   the only container without a parent.
  *
  * - Like with ATStruct, we create an array of SContainer data-structure to keep track 
  *   of resources for all processes.
  * - For more information check the project description.
  */
struct SContainer {
  int quota;      //maximum memory quota of the process
  int usage;      //the current memory usage of the process
  int parent;     //the id of the parent process
  int nchildren;  //the number of child processes
  int used;       //whether current container is used by a process
};

// We will support up to NUM_IDS processes
static struct SContainer CONTAINER[NUM_IDS]; 

/**
  * Initializes the container data for the root process (the one with index 0).
  * The root process is the one that gets spawned first by the kernel.
  */
void container_init(unsigned int mbi_addr)
{
  unsigned int real_quota;
  // TODO: define your local variables here.

  pmem_init(mbi_addr);
  real_quota = 0;

  /** TASK 1:
    * * Compute the available quota and store it into the variable real_quota.
    * Hint 1: 
    *  - It should be the number of the unallocated pages with the normal permission
    *    in the physical memory allocation table (AT).
    *  - We have already implemented functions that deal with AT data-structure in MATIntro layer.
    *    (see import.h for available functions)
    */

  int i, j;
  j = get_nps();
  for(i = 0; i < j; i++){
    if(at_is_norm(i)==1 && at_is_allocated(i)==0)
      real_quota++;
  }


  KERN_DEBUG("\nreal quota: %d\n\n", real_quota);

  CONTAINER[0].quota = real_quota;
  CONTAINER[0].usage = 0;
  CONTAINER[0].parent = 0;
  CONTAINER[0].nchildren = 0;
  CONTAINER[0].used = 1;
}


/** TASK 2:
  * * Get the id of parent process of process # [id]
  * Hint: Simply return the parent field from CONTAINER for process id.
  */
unsigned int container_get_parent(unsigned int id)
{
  // TODO
  return CONTAINER[id].parent;
  return 0;
}


/** TASK 3:
  * * Get the number of children of process # [id]
  */
unsigned int container_get_nchildren(unsigned int id)
{
  // TODO
  return CONTAINER[id].nchildren;
  return 0;
}


/** TASK 4:
  * * Get the maximum memory quota of process # [id]
  */
unsigned int container_get_quota(unsigned int id)
{
  // TODO
  return CONTAINER[id].quota;
  return 0;
}


/** TASK 5:
  * * Get the current memory usage of process # [id]
  */
unsigned int container_get_usage(unsigned int id)
{
  // TODO
  return CONTAINER[id].usage;
  return 0;
}


/** TASK 6:
  * * Determine whether the process # [id] can consume extra
  *   [n] pages of memory. If so, return 1, otherwise, return 0.
  * Hint 1: Check the definition of available fields in SContainer data-structure.
  */
unsigned int container_can_consume(unsigned int id, unsigned int n)
{
  // TODO
  if((CONTAINER[id].quota - CONTAINER[id].usage)>n) return 1;
  return 0;
}

/**
 * Dedicates [quota] pages of memory for a new child process.
 * returns the container index for the new child process.
 */
unsigned int container_split(unsigned int id, unsigned int quota)
{
  unsigned int child, nc;

  nc = CONTAINER[id].nchildren;
  child = id * MAX_CHILDREN + 1 + nc; //container index for the child process

  /** TASK 7:
    * *  Update the container structure of both parent and child process appropriately, to
    *    dedicate [quota] pages of memory for a new child process.
    *  - You can assume it is safe to allocate [quota] pages 
    *    (i.e., the check is already done outside before calling this function)
    *  - Return the container index for the new child process.
    *
    * Hint 1: Read about the parent/child relationship maintained in you kernel 
    *         (available at the top of this page and handout)
    */

  CONTAINER[id].nchildren++;
  CONTAINER[id].usage += quota;
  CONTAINER[child].quota= quota;
  CONTAINER[child].usage = 0;
  CONTAINER[child].parent = id;
  CONTAINER[child].nchildren  = 0;
  CONTAINER[child].used = 1;

  return child;
}


/** TASK 8:
  * * 1. Allocates one more page for process # [id], given that its usage would not exceed the quota.
  * * 2. Update the contained structure to reflect the container structure should be updated accordingly after the allocation.
  * returns the page index of the allocated page, or 0 in the case of failure.
  */
unsigned int container_alloc(unsigned int id)
{
  /*
   * TODO: implement the function here.
   */


  if((CONTAINER[id].usage) < CONTAINER[id].quota){
    
     int pageindex = palloc();
  
     CONTAINER[id].usage++;
    return pageindex;
  }


  return 0;
}

/** TASK 9:
  * * Free the physical page and reduce the usage by 1 in the container.
  * Hint: You have already implemented functions:
  *  - to check if a page_index is allocated
  *  - to free a page_index in MATOp layer.
  */
void container_free(unsigned int id, unsigned int page_index)
{
  // TODO
  CONTAINER[id].usage--;
  pfree(page_index);
  
}
