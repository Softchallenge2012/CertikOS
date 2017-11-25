/*
 * boot1
 *
 * ASSIGNMENT OVERVIEW:
 *  - Fill out and complete the TASKS 1-6 below to build the 2nd stage bootloader.
 *  - It is recommended to start on boot0 first.
 *  - Make sure you have read up on the assignment pre reading before starting.
 *
 * ASSIGNMENT INFO:
 * - boot1 is put just after MBR and before the first partition, i.e. from
 *   sector 2 to sector 63.
 *
 * - boot1 is loaded at 0x7e00 by boot0. boot0 passes one parameters to boot1,
 *   which is the booting device id.
 *
 * - boot1 loads kernel on the first bootable partition.
 *
 *   the memory layout at start is as described in following figure:
 *      :                              : (stack starts from here)
 *      +------------------------------+ <- BOOT0 - 4
 *      |   the booting device id      |
 *      +------------------------------+ <- BOOT0 (0x7c00)
 *      |             BOOT0            |
 *      |     (partition table)  0x55aa|
 *      +------------------------------+ <- BOOT1 (0x7e00)
 *      |                              |
 *      |                        [smap]|
 *      +------------------------------+
 *      :                              :
 *
 * HELPFUL LINKS (If you get stuck):
 *  - Segmentation (Protected Mode part) http://wiki.osdev.org/Segmentation
 *
 */

    /* TASK 1:
     *  - Define a symbol for the physical start address of boot0.
     *  - Define a symbol for the physical start address of boot1.
     *
     *  Hint: should be the same as boot0.
     */

     .set BOOT0, 0x7c00
     .set BOOT1, 0x7e00



    /* Definitions you will use in your code below. */
    .set PROT_MODE_CSEG, 0x8	# GDT code segment selector
    .set PROT_MODE_DSEG, 0x10	# GDT data segment selector

    /* Definition used in provided code below. */
	.set SMAP_SIG, 0x0534D4150


    /* define the global start symbol, code execution will begin here. */
	.globl start
start:
    /* assemble the following instructions in 16-bit mode */
	.code16




    /* TASK 2:
     *  - Clear the interrupts flag, disabling the interrupts.
     *  - Clear the direction flag, to configure auto-increment mode.
	 *
	 * 	Hint: see the cli/sti and cld/std instructions.
     */

     cli
     cld




	/* enable A20
     * This is done because of a quirk in the x86 architecture.
     * See http://wiki.osdev.org/A20 for more information.
     */
seta20.1:
	inb	$0x64, %al
	testb	$0x2, %al
	jnz	seta20.1
	movb	$0xd1, %al
	outb	%al, $0x64
seta20.2:
	inb	$0x64, %al
	testb	$0x2, %al
	jnz	seta20.2
	movb	$0xdf, %al
	outb	%al, $0x60


    /* TASK 3:
     *  - print a starting message
     *
     * 	Hint 1: Use the call instruction to use the putstr subroutine below.
     *  Hint 2: We will define a startup message below.
     *  Hint 3: putstr needs a reference to the string loaded into the %si register.
     */



    movw	$STARTUP_MSG, %si
	call	putstr


	/*
	 * detect the physical memory map
     *
     * This code is making a series of calls to the BIOS to retrieve a map
     * of the physical memory. This is how the kernel will know what
     * memory is usable, reserved, or possibly bad.
     *
     * For more information: http://wiki.osdev.org/Detecting_Memory_(x86)
	 */
e820:
	xorl	%ebx, %ebx		# ebx must be 0 when first calling e820
	movl	$SMAP_SIG, %edx		# edx must be 'SMAP' when calling e820
	movw	$(smap+4), %di		# set the address of the output buffer
e820.1:
	movl	$20, %ecx		# set the size of the output buffer
	movl	$0xe820, %eax		# set the BIOS service code
	int	$0x15			# call BIOS service e820h
e820.2:
	jc	e820.fail		# error during e820h
	cmpl	$SMAP_SIG, %eax		# check eax, which should be 'SMAP'
	jne	e820.fail
e820.3:
	movl	$20, -4(%di)
	addw	$24, %di
	cmpl	$0x0, %ebx		# whether it's the last descriptor
	je	e820.4
	jmp	e820.1
e820.4:					# zero the descriptor after the last one
	xorb	%al, %al
	movw	$20, %cx
	rep	stosb
	jmp	switch_prot
e820.fail:
	movw	$E820_FAIL_MSG, %si
	call	putstr
	jmp	spin16

spin16:
	hlt

switch_prot:
    /* TASK 4:
     *  - Configure the CPU to use our GDT
     *
     *  Hint 1: there is a special instruction to load the GDT (GDT is defined at the end of this file).
     *  Hint 2: Use the GDT descriptor (a wrapper for the GDT, also defined at the end of this file).
     */


	lgdt gdtdesc


    /* TASK 5:
     *  - configure the CPU control control register 0 to be in PROTECTED mode.
     *  - long jump to the "code segment" to execute the switch to protected mdoe.
     *
     *  Hint 1: %cr0 is the register we want to update.
     *  Hint 2: We want to save its contents (perhaps in %eax), set the Protected Mode bit, and restore the new control settings.
     *  Hint 3: The protected mode enable bit is the LSB.
     *
     *  Hint 4: ljmp (or long jump) takes two operands; 1) the selector into the GDT, 2) the destination address.
     *  Hint 5: For the selector use the PROT_MODE_CSEG symbol defined earlier, this selects the code segment in the GDT.
     *  Hint 6: use protcseg as the destination address. Remember both operands are immediate!
     *
     * Info:
     *      - The GDT defines what segments are used and their sizes.
     *      - Below we have effectively disabled segmentation by forcing all segments to span the full memory space 0-4GB, this is called Flat memory layout.
     *      - The definition of the GDT is below.
     *      - Even though we aren't jumping anywhere significant, the ljmp excutes the CPU state switch.
     */


	movl %cr0, %eax
	orl $0x1, %eax
	movl %eax, %cr0
	ljmp $PROT_MODE_CSEG, $protcseg


    /* assemble the following instructions in 32-bit mode */
	.code32
protcseg:
    /* We are now in protected mode! */

    /* TASK 6:
     *  - Set the %ds, %es, %fs, %gs, and %ss segmentation registers to the PROT_MODE_DSEG selector.
     */

     xorw %ax, %ax
     movw $PROT_MODE_DSEG, %ax
     movw %ax, %ds
     movw %ax, %es
     movw %ax, %fs
     movw %ax, %gs
     movw %ax, %ss


	/* TASK 7:
	 * - jump to the C part (boot1main)
     *
     * Hint 1: the function signature is boot1main(uint32_t dev, mbr_t * mbr, bios_smap_t *smap)
     * Hint 2: the arguments should be pushed to the stack, IN REVERSE ORDER.
     * Hint 3: Remember that the device id (dev) is stored at BOOT0-4. Also remember that we want to pass the device ID itself NOT its address.
     * Hint 4: After pushing all the arguments, call boot1main
	 */


	pushl $smap
	pushl $0x7c00
	pushl (BOOT0-4)

	call boot1main



    /* boot1main should never return! */
spin:
	hlt




/*
 * print a string (@ %si) to the screen
 */
	.globl putstr
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
	.ascii	"Start boot1 ...\r\n\0"

E820_FAIL_MSG:
	.ascii	"error when detecting memory map\r\n\0"

NO_BOOTABLE_MSG:
	.ascii	"No bootable partition.\r\n\0"

	.p2align	2	/* force 4-byte alignment */



/* The Global Descriptor Table (GDT)
 *
 * Reference this table by using the gdt label.
 *
 * This data structure tells the processor where the code segments are located in memory.
 * However, since segmentation is a depricated feature for physical memory management we want to just use paging.
 * So to effectively "disable" hardware segmentation, we setup a "flat" memory layout.
 * This is done by setting all the segments to fill all of the 4GB of memory space we have.
 *
 * The following table has several rows, each row configuring the
 *
 * More information:
 *      - http://wiki.osdev.org/Global_Descriptor_Table
 *      - http://wiki.osdev.org/GDT_Tutorial
 *      - http://wiki.osdev.org/Segmentation
 */
gdt:
    /* null segment */
	.word	0, 0
	.byte	0, 0, 0, 0

	/* code segment */
	.word	0xFFFF, 0
	.byte	0, 0x9A, 0xCF, 0

	/* data segment */
	.word	0xFFFF, 0
	.byte	0, 0x92, 0xCF, 0

	/* 16 bit real mode CS */
	.word	0xFFFF, 0
	.byte	0, 0x9E, 0, 0

	/* 16 bit real mode DS */
	.word	0xFFFF, 0
	.byte	0, 0x92, 0, 0



/* GDT descriptor */
gdtdesc:
	.word	0x27			/* limit */
	.long	gdt			/* addr */


/* reserve space for memory map */
smap:
	.space 0xc00, 0
