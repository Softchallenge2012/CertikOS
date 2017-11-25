#ifndef _KERN_TRAP_TTRAPHANDLER_H_
#define _KERN_TRAP_TTRAPHANDLER_H_

#ifdef _KERN_

unsigned int syscall_get_arg1(void);
void set_pdir_base(unsigned int);
void proc_start_user(void);
unsigned int get_ptbl_entry_by_va(unsigned int proc_index, unsigned int vaddr);


#endif /* _KERN_ */

#endif /* !_KERN_TRAP_TTRAPHANDLER_H_ */
