#include <lib/gcc.h>

/** ASSIGNMENT OVERVIEW:
  * - Fill out and complete the TASKS 1-4 below. Description of each task and 
  *   helpful hints are also provided.
  * - The following structure is followed for each layer that you will be implementing.
  *   The parent folder (MATIntro) contains the following files:
  *   -- export.h => These functions will be exposed to other layers of the
  *                  kernel for use.
  *   -- test.c => Contains the test cases for the tasks in this layer (MATIntro).
  *                Make sure you pass all of the test cases before moving on to the
  *                next layer.
  *   -- Makefile.inc => Contains the build information for this layer.
  *   Note: Other layers may consist of the following file:
  *   -- import.h => Contains the functions that are available to you to complete the 
  *                  tasks in that layer. 
  *                    
  * ASSIGNMENT INFO:
  * - In this section, you will implement the getter and setter functions
  *   for manipulating the Allocation Table (AT) data-structure.
  * - AT data-structure represents represents one physical page (AKA frame)
  *   of physical memory. Hence an array of AT is used to represent the 
  *    entire physical memory.
  */

//Number of physical pages that are actually available in the machine.
static unsigned int NUM_PAGES;

/**
 * Structure representing information for one physical page.
 */
struct ATStruct {
  /**
   * The permission of the page.
   * 0: Reserved by the BIOS.
   * 1: Kernel only.
   * >1: Normal (available).
   */
	unsigned int perm; 
  /**
   * Whether the page is allocated.
   * 0: unallocated
   * >0: allocated
   */
	unsigned int allocated;
};

/**
 * - A 32 bit machine may have up to 4GB of memory.
 * - So it may have up to 2^20 physical pages,
 *   with the page size being 4KB.
 * - AT is an array of size 2^20 (1 << 20 = 2^20) and represents 
 *   the entire 4GB physical memory.
 */
static struct ATStruct AT[1 << 20];  

//The getter function for NUM_PAGES.
unsigned int
get_nps(void)
{
	return NUM_PAGES;
}

//The setter function for NUM_PAGES.
void
set_nps(unsigned int nps)
{
	NUM_PAGES = nps;
}

/** TASK 1:
  *  * Implement the getting function for the page permission.
  *  - If the page with the given page_index has the normal permission,
  *    then return 1, otherwise return 0 
  *
  *  Hint: The types of permissions are defined in ATStruct above. 
  */
unsigned int
at_is_norm(unsigned int page_index)
{
  //TODO
  if(AT[page_index].perm > 1)
    return 1;
  return 0;
}

/** TASK 2:
  *  * Implement the setter function for the physical page permission.
  *  - Set the permission of the page with given page_index to norm_val.
  *  - It also marks the page as unallocated.
  * Hint: See the definition of ATStruct for allocated.
  */
void
at_set_perm(unsigned int page_index, unsigned int norm_val)
{
  //TODO
  AT[page_index].perm = norm_val;
  AT[page_index].allocated = 0;
}

/** TASK 3: 
  *  * Implement the getter function for the physical page allocation flag.
  *  - Return 0 if the page is not allocated. Otherwise, return 1.
  */
unsigned int
at_is_allocated(unsigned int page_index)
{
  //TODO

  if(AT[page_index].allocated > 0)
    return 1;
  return 0;
}

/** TASK 4:
  *  * The setter function for the physical page allocation flag.
  *  - Set the flag of the page with given page_index to the given value.
  */
void
at_set_allocated(unsigned int page_index, unsigned int allocated)
{
  //TODO
  AT[page_index].allocated = allocated;
}
