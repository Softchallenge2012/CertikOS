#include <lib/x86.h>

#include "import.h"

/** TASK 1: 
  * * Initialize the TCB for all NUM_IDS threads with the
  *   state TSTATE_DEAD, and with two indices being NUM_IDS (which represents NULL).
  * 
  *  Hint 1:
  *  - Use function tcb_init_at_id, defined in PTCBIntro.c
  */
void tcb_init(unsigned int mbi_addr)
{
  // TODO: define your local variables here.

	paging_init(mbi_addr);

	int i;
	for(i = 0; i < NUM_IDS; i++){

		tcb_init_at_id(i);
	}

	

  // TODO
}
