#include <lib/x86.h>

#include "import.h"



#define PAGESIZE  4096
#define VM_USERLO 0x40000000
#define VM_USERHI 0xF0000000
#define VM_USERLO_PI  (VM_USERLO / PAGESIZE)   // VM_USERLO page index
#define VM_USERHI_PI  (VM_USERHI / PAGESIZE)   // VM_USERHI page index


#define DIR_MASK    0xffc00000
#define PAGE_MASK   0x003ff000
#define OFFSET_MASK 0x00000fff
#define NUM_IDS 64

/** TASK 1:
  * * For each process from id 0 to NUM_IDS -1,
  *   set the page directory entries so that the kernel portion of the map as identity map,
  *   and the rest of page directories are unmmaped.
  * 
  * Hint 1: Recall which portions are reserved for the kernel and calculate the pde_index.       
  * Hint 2: Recall which function in MPTIntro layer is used to set identity map. (See import.h) 
  * Hint 3: Remove the page directory entry to unmap it.
  */
void pdir_init(unsigned int mbi_adr)
{
    // TODO: define your local variables here.
    int i ,j;

    idptbl_init(mbi_adr);

    // TODO
    for(i = 0; i < NUM_IDS; i++){
      for(j = 0; j< 1024; j++){

	int proc_index  = i;
	int pde_index = j;
	if(pde_index*1024 < VM_USERLO_PI || pde_index*1024 >= VM_USERHI_PI){
	  set_pdir_entry_identity(proc_index, pde_index);
	}else{
	  rmv_pdir_entry(proc_index, pde_index);
	}

      }
    }

}

/** TASK 2:
  * * 1. Allocate a page (with container_alloc) for the page table,
  * * 2. Check if the page was allocated and register the allocated page in page directory for the given virtual address.
  * * 3. Clear (set to 0) all the page table entries for this newly mapped page table.
  * * 4. Return the page index of the newly allocated physical page.
  * 	 In the case when there's no physical page available, it returns 0.
  */
unsigned int alloc_ptbl(unsigned int proc_index, unsigned int vaddr)
{
  // TODO
  
  int pageDirectoryIndex = (DIR_MASK & vaddr)>>22;
  int pageTableIndex = (PAGE_MASK & vaddr)>>12;
  int offset = (OFFSET_MASK & vaddr);

  int pageIndex = container_alloc(proc_index);
  if(pageIndex!=0)  //not allocated
  {
   
    set_pdir_entry_by_va(proc_index, vaddr, pageIndex);

    for(int i = 0; i < 1024; i++)
    rmv_ptbl_entry(proc_index, pageDirectoryIndex, i);

    return pageIndex;

  }

  return 0;
}

/** TASK 3:
  * * Reverse operation of alloc_ptbl.
  *   - Remove corresponding page directory entry
  *   - Free the page for the page table entries (with container_free).
  * Hint 1: Find the pde corresponding to vadr (MPTOp layer)
  * Hint 2: Remove the pde (MPTOp layer)
  * Hint 3: Use container free
  */
void free_ptbl(unsigned int proc_index, unsigned int vaddr)
{
  // TODO

  int pageDirectoryIndex = DIR_MASK & vaddr>>22;
  int pageTableIndex = PAGE_MASK & vaddr>>12;
  

  rmv_pdir_entry_by_va(proc_index, vaddr);
  container_free(proc_index, pageDirectoryIndex);

}
