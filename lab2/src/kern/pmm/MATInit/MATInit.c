#include <lib/debug.h>
#include "import.h"

#define PAGESIZE	4096
#define VM_USERLO	0x40000000
#define VM_USERHI	0xF0000000
#define VM_USERLO_PI	(VM_USERLO / PAGESIZE)   // VM_USERLO page index
#define VM_USERHI_PI	(VM_USERHI / PAGESIZE)   // VM_USERHI page index

/** ASSIGNMENT INFO:
  * * Implement the initialization function for the allocation table AT.
  * - It contains two major parts:
  *   1. Calculate the actual physical memory of the machine, and set the number of physical pages (NUM_PAGES).
  *   2. Initialize the physical allocation table (AT) implemented in MATIntro layer, based on the
  *      information available in the physical memory map table.  
  *
  *  - Review import.h in the current directory for the list of available getter and setter functions.
  */
void
pmem_init(unsigned int mbi_addr)
{
  unsigned int nps;

  // TODO: Define your local variables here.

  //Calls the lower layer initializatin primitives.
  //The parameter mbi_addr shell not be used in the further code.

  dprintf("start physical mm init.\n");
	devinit(mbi_addr);

  /** TASK 1:
    * Calculate the number of actual number of available physical pages and store it into the local varaible nps.
    * 
    * Hint 1: Review the import.h file for available functions.
    * Hint 2: Think of it as the highest address possible in the ranges of the memory map table,
    *         divided by the page size plus 1.
    */
  // TODO

  int numRows = get_size();


  //nps = 2^20 / (2^10*2^2) + 1;

  int i ;
  nps = 0;
  for(i=0; i < numRows; i++){


      if(nps < (get_mms(i)+get_mml(i))){

        nps = get_mms(i) + get_mml(i); 

      }
      
  }

  if(nps % PAGESIZE == 0){
    nps = nps / PAGESIZE;
  }
  else
    nps = nps / PAGESIZE + 1;




	set_nps(nps); // Setting the value computed above to NUM_PAGES.

  /** TASK 2:
    * Initialization of the physical allocation table (AT).
    *
    * In CertiKOS, the entire addresses < VM_USERLO or >= VM_USERHI are reserved by the kernel.
    * That corresponds to the physical pages from 0 to VM_USERLO_PI-1, and from VM_USERHI_PI to NUM_PAGES-1.
    * The rest of pages that correspond to addresses [VM_USERLO, VM_USERHI), can be used freely ONLY IF
    * the entire page falls into one of the ranges in the memory map table with the permission marked as usable.
    *
    * Hints:
    * 1. You have to initialize AT for all the page indices from 0 to NPS - 1.
    * 2. For the pages that are reserved by the kernel, simply set its permission to 1.
    *    Recall that the setter at_set_perm also marks the page as unallocated. 
    *    Thus, you don't have to call another function to set the allocation flag.
    * 3. For the rest of the pages, explore the memory map table to find the information about the corresponding physical page
    *    and set its permission accordingly.
    *    The permission should be set to 2 only if there is a range containing the entire page that
    *    is marked as available in the memory map table. Otherwise, it should be set to 0.
    *    Note that the ranges in the memory map are not aligned by pages.
    *    So it may be possible that for some pages, only part of the addresses are in the ranges.
    *    Currently, we do not utilize partial pages, so in that case, you should consider those pages as unavailble.
    * 4. Every page in the allocation table should be initialized.
    *    But the ranges in the momory map table may not cover the entire available address space.
    *    That means there may be some gaps between the ranges.
    *    You should still set the permission of those pages in allocation table to 0.
    */
  // TODO

  //int i;
  for(i = 0; i < VM_USERLO_PI; i++)
    at_set_perm(i, 1);
 
  for(i = VM_USERHI_PI; i < nps; i++)
    at_set_perm(i, 1);

  for(i = VM_USERLO_PI; i < VM_USERHI_PI; i++){
        at_set_perm(i, 2); 
  }

  

  


}


