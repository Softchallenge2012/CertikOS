#include <lib/trap.h>
#include <lib/x86.h>

#include "import.h"

extern tf_t uctx_pool[NUM_IDS];

/** TASK 1: 
  * * Retrieve the system call arguments from uctx_pool that gets
  *   passed in from the current running process's system call.
  *
  *  Hint 1: Remember the calling convention
  *  - The application will pass the system call number in %eax register
  *  - The arguments (up to five of them) will go in %ebx, %ecx, %edx, %esi, and %edi, respectively. 
  *  Hint 2: 
  *  - Remember that syscall_get_arg1 should return the system call number stored in %eax,
  *    not the actual first argument of the function (ebx).
  *  Hint 3: Review the structures tf_t and pushregs defined in lib/trap.h
  *  - In the following functions, you will have to get the fields from the corresponding user context in uctx_pool.
  *  - The get functions will retrieve a field (corresponding to the argument number) of the regs field in the uctx_pool array.
  */

unsigned int syscall_get_arg1(void)
{
  // TODO
  int curid = get_curid();
  return uctx_pool[curid].regs.eax;
  return 0;
}

unsigned int syscall_get_arg2(void)
{
  // TODO
  int curid = get_curid();
  return uctx_pool[curid].regs.ebx;
  return 0;
}

unsigned int syscall_get_arg3(void)
{
  // TODO

  int curid = get_curid();
  return uctx_pool[curid].regs.ecx;
  return 0;
}

unsigned int syscall_get_arg4(void)
{
  // TODO

  int curid = get_curid();
  return uctx_pool[curid].regs.edx;

  return 0;
}

unsigned int syscall_get_arg5(void)
{
  // TODO

  int curid = get_curid();
  return uctx_pool[curid].regs.esi;
  return 0;
}

unsigned int syscall_get_arg6(void)
{
  // TODO

  int curid = get_curid();
  return uctx_pool[curid].regs.edi;
  return 0;
}

/** TASK 2:
  * * Set the error number in uctx_pool which gets passed
  *   to the current running process when we return to it.
  *
  *  Hint 1:
  *  - Set the err field of uctx_pool to errno.
  */
void syscall_set_errno(unsigned int errno)
{
  // TODO
  int curid = get_curid();
  uctx_pool[curid].regs.eax = errno;
}

/** TASK 3: 
  * * Set the return values in uctx_pool which gets passed
  *   to the current running process when we return to it.
  *
  *  Hint 1: Same as TASK 1. Note that we only have setters for the return values (i.e. there is no setter for the system call number).
  *  Hint 2: Here you will be setting the fields of the corresponding user context in uctx_pool.
  *  - The set functions will set a field (corresponding to the argument number) of the regs field in the uctx_pool array.
  */

void syscall_set_retval1(unsigned int retval)
{
  // TODO
  int curid = get_curid();
  uctx_pool[curid].regs.ebx = retval;
}

void syscall_set_retval2(unsigned int retval)
{
  // TODO
  int curid = get_curid();
  uctx_pool[curid].regs.ecx = retval;
}

void syscall_set_retval3(unsigned int retval)
{
  // TODO
  int curid = get_curid();
  uctx_pool[curid].regs.edx = retval;
}

void syscall_set_retval4(unsigned int retval)
{
  // TODO
  int curid = get_curid();
  uctx_pool[curid].regs.esi = retval;
}

void syscall_set_retval5(unsigned int retval)
{
  // TODO
  int curid = get_curid();
  uctx_pool[curid].regs.edi = retval;
}
