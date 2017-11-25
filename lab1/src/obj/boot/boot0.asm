
obj/boot/boot0.elf:     file format elf32-i386


Disassembly of section .text:

00007c00 <start>:
     *  - Clear the direction flag, to configure auto-increment mode.
	 *
	 * 	Hint: see the cli/sti and cld/std instructions.
     */

     cli
    7c00:	fa                   	cli    
     cld
    7c01:	fc                   	cld    
	 *	Hint 2: These are 16-bit registers so use "w" instruction suffix (e.g. xorw, movw).
	 *	Hint 3: When referencing a register, the register needs to be prefixed with a "%".
	 *
	 */

	 xorw %ax, %ax
    7c02:	31 c0                	xor    %ax,%ax
	 movw %ax, %ds
    7c04:	8e d8                	mov    %ax,%ds
	 movw %ax, %es
    7c06:	8e c0                	mov    %ax,%es
	 movw %ax, %ss
    7c08:	8e d0                	mov    %ax,%ss
 	 * Hint 3: The same instruction can MOVE data between registers or between a register and memory.
     *
     * Info: We will use this information in boot1.
	 */

	 xorl %eax, %eax
    7c0a:	66 31 c0             	xor    %eax,%eax
	 movl %edx, %eax
    7c0d:	66 89 d0             	mov    %edx,%eax
	 andl $0xff, %eax
    7c10:	66 25 ff 00 00 00    	and    $0xff,%eax
	 movl %eax, (BOOT0 -4)
    7c16:	66 a3 fc 7b          	mov    %eax,0x7bfc
	 *		- Remember that the stack grows downward on x86 processors.
	 *		- This stack will grow just below the device id we stored in task 4.
	 *		- 32-bit code would use %ebp and %esp instead of %bp and %sp.
	 */

	 movw $0x7bfc, %bp
    7c1a:	bd fc 7b             	mov    $0x7bfc,%bp
	 movw $0x7bfc, %sp
    7c1d:	bc fc 7b             	mov    $0x7bfc,%sp

00007c20 <set_video_mode>:


	/* set to normal (80x25 text) video mode */
set_video_mode:
	movw	$0x03, %ax
    7c20:	b8 03 00             	mov    $0x3,%ax
	int	$0x10
    7c23:	cd 10                	int    $0x10


	/* print starting message */
	movw	$STARTUP_MSG, %si
    7c25:	be 56 7c             	mov    $0x7c56,%si
	call	putstr
    7c28:	e8 1d 00             	call   7c48 <putstr>

00007c2b <load_boot1>:
	 *	Hint 5: Set the %si register to the %sp register.
	 *	Hint 6: Use the "int" instruction to trigger an intterupt after all the arguments and registers have been configured.
	 *  Hint 7: Use the "jmp" to unconditionally jump.
	 */

	 pushl $0x0
    7c2b:	66 6a 00             	pushl  $0x0
	 pushl $0x1
    7c2e:	66 6a 01             	pushl  $0x1
	 pushl $0x7e00
    7c31:	66 68 00 7e 00 00    	pushl  $0x7e00
	 pushw $62
    7c37:	6a 3e                	push   $0x3e
	 pushw $0x10
    7c39:	6a 10                	push   $0x10


	 xorl %eax, %eax
    7c3b:	66 31 c0             	xor    %eax,%eax
	 movb $0x42, %ah
    7c3e:	b4 42                	mov    $0x42,%ah
	 movw %sp, %si
    7c40:	89 e6                	mov    %sp,%si

	 
	 int $0x13
    7c42:	cd 13                	int    $0x13
	 jmp BOOT1
    7c44:	e9 b9 01             	jmp    7e00 <BOOT1>

00007c47 <spin>:



	 /* Execution should never get here */
spin:	
	hlt
    7c47:	f4                   	hlt    

00007c48 <putstr>:

/*
 * print a string (@ %si) to the screen
 */
putstr:
	pusha
    7c48:	60                   	pusha  
	movb	$0xe, %ah
    7c49:	b4 0e                	mov    $0xe,%ah

00007c4b <putstr.1>:
putstr.1:
	lodsb
    7c4b:	ac                   	lods   %ds:(%si),%al
	cmp	$0, %al
    7c4c:	3c 00                	cmp    $0x0,%al
	je	putstr.2
    7c4e:	74 04                	je     7c54 <putstr.2>
	int	$0x10
    7c50:	cd 10                	int    $0x10
	jmp	putstr.1
    7c52:	eb f7                	jmp    7c4b <putstr.1>

00007c54 <putstr.2>:
putstr.2:
	popa
    7c54:	61                   	popa   
	ret
    7c55:	c3                   	ret    

00007c56 <STARTUP_MSG>:
    7c56:	53                   	push   %bx
    7c57:	74 61                	je     7cba <_end+0x32>
    7c59:	72 74                	jb     7ccf <_end+0x47>
    7c5b:	20 62 6f             	and    %ah,0x6f(%bp,%si)
    7c5e:	6f                   	outsw  %ds:(%si),(%dx)
    7c5f:	74 30                	je     7c91 <_end+0x9>
    7c61:	20 2e 2e 2e          	and    %ch,0x2e2e
    7c65:	0d 0a 00             	or     $0xa,%ax

00007c68 <LOAD_FAIL_MSG>:
    7c68:	45                   	inc    %bp
    7c69:	72 72                	jb     7cdd <_end+0x55>
    7c6b:	6f                   	outsw  %ds:(%si),(%dx)
    7c6c:	72 20                	jb     7c8e <_end+0x6>
    7c6e:	64 75 72             	fs jne 7ce3 <_end+0x5b>
    7c71:	69 6e 67 20 6c       	imul   $0x6c20,0x67(%bp),%bp
    7c76:	6f                   	outsw  %ds:(%si),(%dx)
    7c77:	61                   	popa   
    7c78:	64 69 6e 67 20 62    	imul   $0x6220,%fs:0x67(%bp),%bp
    7c7e:	6f                   	outsw  %ds:(%si),(%dx)
    7c7f:	6f                   	outsw  %ds:(%si),(%dx)
    7c80:	74 31                	je     7cb3 <_end+0x2b>
    7c82:	2e 0d 0a 00          	cs or  $0xa,%ax
