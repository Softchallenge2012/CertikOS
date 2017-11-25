/*
 * boot0
 *
 *
 * ASSIGNMENT OVERVIEW:
 *  - Fill out and complete the TASKS 1-6 below to build the 1st stage bootloader.
 *  - Make sure you have read up on the assignment pre reading before starting.
 *
 * ASSIGNMENT INFO:
 * 	- boot0 is put in the MBR and therefore should be smaller than 446 bytes.
 *
 * 	- boot0 is loaded to physical memory address 0x7c00 and the invoked by BIOS.
 *
 * 	- boot0 should load boot1 to 0x7e00. boot1 is put in the sectors after MBR and
 *	before the first partition, which are usually from sector 2 to sector 63.
 *
 * 	- boot0 requires
 *		1. boot0, boot1 and OS kernel are on the same disk;
 *   	2. the first 63 sectors of the disk is out of any partition;
 *   	3. kernel is on the beginning of the first bootable partition.
 *
 * 	- boot0 is running in the real mode and does not switch to the
 *	protected mode.
 *
 *
 * HELPFUL LINKS ON ASSEMBLY:
 * 	- x86 Assembly Guide: http://flint.cs.yale.edu/cs421/papers/x86-asm/asm.html
 *	- Assembler Directives: http://web.mit.edu/gnu/doc/html/as_7.html
 *
 * HELPFUL LINKS ON BOOTLOADERS:
 * 	- OSDevWiki Bootloader: http://wiki.osdev.org/Bootloader
 */



	/* TASK 1:
	 *  - Define a symbol for the physical start address of boot0.
	 *  - Define a symbol for the physical start address of boot1.
	 *
	 *  Hint: use the assembly directive .set to assign a symbol to an expression.
	 */


    /* define the global start symbol, code execution will begin here. */
	.globl start
start:
    /* assemble the file in 16-bit mode */
	.code16

    /* TASK 2:
     *  - Clear the interrupts flag, disabling the interrupts.
     *  - Clear the direction flag, to configure auto-increment mode.
	 *
	 * 	Hint: see the cli/sti and cld/std instructions.
     */


	/* TASK 3:
	 *	- Clear segment registers (by setting them to zero): %ax, %ds, %es, %ss
	 *
	 *	Hint 1: XORing a register with itself will set it to zero.
	 *	Hint 2: These are 16-bit registers so use "w" instruction suffix (e.g. xorw, movw).
	 *	Hint 3: When referencing a register, the register needs to be prefixed with a "%".
	 *
	 */


	/* TASK 4:
	 *	- store the booting device id at the address of boot0 - 4.
	 *
	 * Hint 1: The booting device id is located in the lower byte of the %edx register at boot time (aka %dl).
	 * Hint 2: Clear the 32-bit %eax register, and then move the lower byte of the %edx into the lower byte of the %eax.
 	 * Hint 3: The same instruction can MOVE data between registers or between a register and memory.
     *
     * Info: We will use this information in boot1.
	 */


	/* TASK 5:
	 *	- Setup the stack to start at boot0 - 4.
	 *
	 * 	Hint 1: Two 16-bit registers define the stack, the base pointer (%bp) and the stack pointer (%sp).
	 * 	Hint 2: Since the stack starts empty both registers should point to the same address.
	 *  Hint 3: Constant numbers need to be prefixed with a "$" e.g. $(BOOT0 - 4)
	 *
	 * 	Info:
	 *		- Remember that the stack grows downward on x86 processors.
	 *		- This stack will grow just below the device id we stored in task 4.
	 *		- 32-bit code would use %ebp and %esp instead of %bp and %sp.
	 */



	/* set to normal (80x25 text) video mode */
set_video_mode:
	movw	$0x03, %ax
	int	$0x10


	/* print starting message */
	movw	$STARTUP_MSG, %si
	call	putstr


	/* load boot1 from sector 2 to sector 63 */
load_boot1:
	/* TASK 6:
	 *	- Call BIOS interrupt 0x13 to read boot1 from disk.
	 *	- Jump to boot1
	 *
	 *	Hint 1: interrupt 0x13 requires some arguments to be pushed to the stack. These are called the Disk Address Packet (DAP).
	 *	Hint 2: DAP structure
	 *		---------------------------------------------------------
	 *		| Field Name					| Size		| Value		|
	 *		---------------------------------------------------------
	 * 		| Size of DAP					| 2 bytes	| 0x10		|
	 *		| Number of sectors to read		| 2 bytes	| 62		|
	 *		| Destination address			| 4 bytes	| 0x7e00	|
	 *		| Logical block address	(LBA)	| 8 bytes	| 1			|
	 *		---------------------------------------------------------
	 *	Hint 3: The DAP arguments need to be pushed in reverse order. For the LBA, push two (4-byte) longs starting with the higher-end long.
	 *	Hint 4: Clear the %eax register, then set %ah to 0x42 (this indicates to the BIOS to read).
	 *	Hint 5: Set the %si register to the %sp register.
	 *	Hint 6: Use the "int" instruction to trigger an intterupt after all the arguments and registers have been configured.
	 *  Hint 7: Use the "jmp" to unconditionally jump.
	 */




	 /* Execution should never get here */
spin:
	hlt

/*
 * print a string (@ %si) to the screen
 */
putstr:
	pusha
	movb	$0xe, %ah
putstr.1:
	lodsb
	cmp	$0, %al
	je	putstr.2
	int	$0x10
	jmp	putstr.1
putstr.2:
	popa
	ret


/*******************************************************************************
*   DATA STRUCTURES
*******************************************************************************/

STARTUP_MSG:
	.ascii	"Start boot0 ...\r\n\0"

LOAD_FAIL_MSG:
	.ascii	"Error during loading boot1.\r\n\0"
