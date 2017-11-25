#include <lib/debug.h>
#include <lib/types.h>
#include <lib/x86.h>
#include <lib/trap.h>
#include <lib/syscall.h>

#include "import.h"

static char sys_buf[NUM_IDS][PAGESIZE];

/**
 * Copies a string from user into buffer and prints it to the screen.
 * This is called by the user level "printf" library as a system call.
 */
void sys_puts(void)
{
	unsigned int cur_pid;
	unsigned int str_uva, str_len;
	unsigned int remain, cur_pos, nbytes;


	cur_pid = get_curid();
	str_uva = syscall_get_arg2();
	str_len = syscall_get_arg3();

	if (!(VM_USERLO <= str_uva && str_uva + str_len <= VM_USERHI)) {
		syscall_set_errno(E_INVAL_ADDR);
		return;
	}

	remain = str_len;
	cur_pos = str_uva;

	while (remain) {
		if (remain < PAGESIZE - 1)
			nbytes = remain;
		else
			nbytes = PAGESIZE - 1;

		if (pt_copyin(cur_pid,
			      cur_pos, sys_buf[cur_pid], nbytes) != nbytes) {
			syscall_set_errno(E_MEM);
			return;
		}

		sys_buf[cur_pid][nbytes] = '\0';
		KERN_INFO("%s", sys_buf[cur_pid]);

		remain -= nbytes;
		cur_pos += nbytes;
	}

	syscall_set_errno(E_SUCC);
}

extern uint8_t _binary___obj_user_pingpong_ping_start[];
extern uint8_t _binary___obj_user_pingpong_pong_start[];
extern uint8_t _binary___obj_user_pingpong_ding_start[];
extern uint8_t _binary___obj_user_fork_fork_start[];

/** TASK 1:
  * * Spawn a new child process.
  *   - The user level library function sys_spawn (defined in user/include/syscall.h)
  *     takes two arguments [elf_id] and [quota], and returns the new child process id
  *     or NUM_IDS (as failure), with appropriate error number.
  *   - Currently, we have three user processes defined in user/pingpong/ directory,
  *     ping, pong, and ding.
  *   - The linker ELF addresses for those compiled binaries are defined above.
  *     Since we do not yet have a file system implemented in mCertiKOS,
  *     we statically load the ELF binraries in to the memory based on the
  *     first parameter [elf_id], i.e., ping, pong, ding and fork corresponds to
  *     the elf_id of 1, 2, 3, and 4, respectively.
  *     If the parameter [elf_id] is none of those three, then it should return
  *     NUM_IDS with the error number E_INVAL_PID. The same error case apply
  *     when the proc_create fails.
  *     Otherwise, you mark it as successful, and return the new child process id.
  *
  *  Hint 1: You will use the proc_create function defined in PProc.c to create a new process.
  *  - This function takes 2 arguments. 
  *    1. *elf_addr => Pass the ELF address corresponding to elf_id. 
  *                    elf_id is the first argument passed to the system call.
  *    2. quota => This is the second argument passed to the system call.
  *  Hint 2: Set the return values.
  *  - If successful, errno = E_SUCC else E_INVAL_PID
  *  - If successful, retval1 = pid (return value of proc_create) else NUM_IDS
  */
void sys_spawn(void)
{
  // TODO

  //dprintf("start user process \n");
  int exec = syscall_get_arg2(); //_binary___obj_user_fork_fork_start;// _binary___obj_user_pingpong_ding_start;
  int quota =  syscall_get_arg3();

  int elf_id =0;
  uint8_t *id;
  if(exec==1){
    id =  _binary___obj_user_pingpong_ping_start;
    elf_id =  proc_create(id, quota);
  //extern uint8_t _binary___obj_user_pingpong_ping_start[];
  }
  else if(exec == 2){
    id = _binary___obj_user_pingpong_pong_start;
    elf_id = proc_create(id, quota);
  //extern uint8_t _binary___obj_user_pingpong_pong_start[];
  }
  else if(exec == 3){
    id = _binary___obj_user_pingpong_ding_start;
    elf_id = proc_create(id, quota);
  //extern uint8_t _binary___obj_user_pingpong_ding_start[];
  }
  else if(exec ==4){
    id = _binary___obj_user_fork_fork_start;
    elf_id  = proc_create(id, quota);
    //extern uint8_t _binary___obj_user_fork_fork_start[];

    }




  if(elf_id != NUM_IDS){
    //dprintf("user process is successful. pid=%d \n", elf_id);
    syscall_set_errno(E_SUCC);
    syscall_set_retval1(elf_id);


  }
  else{
    //dprintf("user process failed \n");
    syscall_set_errno(E_INVAL_PID);
    syscall_set_retval1(NUM_IDS);
  }

}

/** TASK 2:
  * * Yield to another thread/process.
  *   The user level library function sys_yield (defined in user/include/syscall.h)
  *   does not take any argument and does not have any return values.
  * 
  *  Hint 1: Very simple
  *  - Simply yield.
  *  Hint 2:
  *  - Do not forget to set the error number as E_SUCC.
  */
void sys_yield(void)
{
  // TODO
  thread_yield();

  syscall_set_errno(E_SUCC);
}

void sys_fork()
{

}
