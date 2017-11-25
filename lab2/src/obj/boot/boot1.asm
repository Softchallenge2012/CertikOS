
obj/boot/boot1.elf:     file format elf32-i386


Disassembly of section .text:

00007e00 <start>:
     *  - Clear the direction flag, to configure auto-increment mode.
	 *
	 * 	Hint: see the cli/sti and cld/std instructions.
     */

     cli
    7e00:	fa                   	cli    
     cld
    7e01:	fc                   	cld    

00007e02 <seta20.1>:
	/* enable A20
     * This is done because of a quirk in the x86 architecture.
     * See http://wiki.osdev.org/A20 for more information.
     */
seta20.1:
	inb	$0x64, %al
    7e02:	e4 64                	in     $0x64,%al
	testb	$0x2, %al
    7e04:	a8 02                	test   $0x2,%al
	jnz	seta20.1
    7e06:	75 fa                	jne    7e02 <seta20.1>
	movb	$0xd1, %al
    7e08:	b0 d1                	mov    $0xd1,%al
	outb	%al, $0x64
    7e0a:	e6 64                	out    %al,$0x64

00007e0c <seta20.2>:
seta20.2:
	inb	$0x64, %al
    7e0c:	e4 64                	in     $0x64,%al
	testb	$0x2, %al
    7e0e:	a8 02                	test   $0x2,%al
	jnz	seta20.2
    7e10:	75 fa                	jne    7e0c <seta20.2>
	movb	$0xdf, %al
    7e12:	b0 df                	mov    $0xdf,%al
	outb	%al, $0x60
    7e14:	e6 60                	out    %al,$0x60
     *  Hint 3: putstr needs a reference to the string loaded into the %si register.
     */



    movw	$STARTUP_MSG, %si
    7e16:	be ae 7e e8 84       	mov    $0x84e87eae,%esi
	call	putstr
    7e1b:	00 66 31             	add    %ah,0x31(%esi)

00007e1c <e820>:
     * memory is usable, reserved, or possibly bad.
     *
     * For more information: http://wiki.osdev.org/Detecting_Memory_(x86)
	 */
e820:
	xorl	%ebx, %ebx		# ebx must be 0 when first calling e820
    7e1c:	66 31 db             	xor    %bx,%bx
	movl	$SMAP_SIG, %edx		# edx must be 'SMAP' when calling e820
    7e1f:	66 ba 50 41          	mov    $0x4150,%dx
    7e23:	4d                   	dec    %ebp
    7e24:	53                   	push   %ebx
	movw	$(smap+4), %di		# set the address of the output buffer
    7e25:	bf 2e 7f 66 b9       	mov    $0xb9667f2e,%edi

00007e28 <e820.1>:
e820.1:
	movl	$20, %ecx		# set the size of the output buffer
    7e28:	66 b9 14 00          	mov    $0x14,%cx
    7e2c:	00 00                	add    %al,(%eax)
	movl	$0xe820, %eax		# set the BIOS service code
    7e2e:	66 b8 20 e8          	mov    $0xe820,%ax
    7e32:	00 00                	add    %al,(%eax)
	int	$0x15			# call BIOS service e820h
    7e34:	cd 15                	int    $0x15

00007e36 <e820.2>:
e820.2:
	jc	e820.fail		# error during e820h
    7e36:	72 24                	jb     7e5c <e820.fail>
	cmpl	$SMAP_SIG, %eax		# check eax, which should be 'SMAP'
    7e38:	66 3d 50 41          	cmp    $0x4150,%ax
    7e3c:	4d                   	dec    %ebp
    7e3d:	53                   	push   %ebx
	jne	e820.fail
    7e3e:	75 1c                	jne    7e5c <e820.fail>

00007e40 <e820.3>:
e820.3:
	movl	$20, -4(%di)
    7e40:	66 c7 45 fc 14 00    	movw   $0x14,-0x4(%ebp)
    7e46:	00 00                	add    %al,(%eax)
	addw	$24, %di
    7e48:	83 c7 18             	add    $0x18,%edi
	cmpl	$0x0, %ebx		# whether it's the last descriptor
    7e4b:	66 83 fb 00          	cmp    $0x0,%bx
	je	e820.4
    7e4f:	74 02                	je     7e53 <e820.4>
	jmp	e820.1
    7e51:	eb d5                	jmp    7e28 <e820.1>

00007e53 <e820.4>:
e820.4:					# zero the descriptor after the last one
	xorb	%al, %al
    7e53:	30 c0                	xor    %al,%al
	movw	$20, %cx
    7e55:	b9 14 00 f3 aa       	mov    $0xaaf30014,%ecx
	rep	stosb
	jmp	switch_prot
    7e5a:	eb 09                	jmp    7e65 <switch_prot>

00007e5c <e820.fail>:
e820.fail:
	movw	$E820_FAIL_MSG, %si
    7e5c:	be c0 7e e8 3e       	mov    $0x3ee87ec0,%esi
	call	putstr
    7e61:	00 eb                	add    %ch,%bl
	jmp	spin16
    7e63:	00 f4                	add    %dh,%ah

00007e64 <spin16>:

spin16:
	hlt
    7e64:	f4                   	hlt    

00007e65 <switch_prot>:
     *  Hint 1: there is a special instruction to load the GDT (GDT is defined at the end of this file).
     *  Hint 2: Use the GDT descriptor (a wrapper for the GDT, also defined at the end of this file).
     */


	lgdt gdtdesc
    7e65:	0f 01 16             	lgdtl  (%esi)
    7e68:	24 7f                	and    $0x7f,%al
     *      - The definition of the GDT is below.
     *      - Even though we aren't jumping anywhere significant, the ljmp excutes the CPU state switch.
     */


	movl %cr0, %eax
    7e6a:	0f 20 c0             	mov    %cr0,%eax
	orl $0x1, %eax
    7e6d:	66 83 c8 01          	or     $0x1,%ax
	movl %eax, %cr0
    7e71:	0f 22 c0             	mov    %eax,%cr0
	ljmp $PROT_MODE_CSEG, $protcseg
    7e74:	ea 79 7e 08 00 66 31 	ljmp   $0x3166,$0x87e79

00007e79 <protcseg>:

    /* TASK 6:
     *  - Set the %ds, %es, %fs, %gs, and %ss segmentation registers to the PROT_MODE_DSEG selector.
     */

     xorw %ax, %ax
    7e79:	66 31 c0             	xor    %ax,%ax
     movw $PROT_MODE_DSEG, %ax
    7e7c:	66 b8 10 00          	mov    $0x10,%ax
     movw %ax, %ds
    7e80:	8e d8                	mov    %eax,%ds
     movw %ax, %es
    7e82:	8e c0                	mov    %eax,%es
     movw %ax, %fs
    7e84:	8e e0                	mov    %eax,%fs
     movw %ax, %gs
    7e86:	8e e8                	mov    %eax,%gs
     movw %ax, %ss
    7e88:	8e d0                	mov    %eax,%ss
     * Hint 3: Remember that the device id (dev) is stored at BOOT0-4. Also remember that we want to pass the device ID itself NOT its address.
     * Hint 4: After pushing all the arguments, call boot1main
	 */


	pushl $smap
    7e8a:	68 2a 7f 00 00       	push   $0x7f2a
	pushl $0x7c00
    7e8f:	68 00 7c 00 00       	push   $0x7c00
	pushl (BOOT0-4)
    7e94:	ff 35 fc 7b 00 00    	pushl  0x7bfc

	call boot1main
    7e9a:	e8 2f 10 00 00       	call   8ece <boot1main>

00007e9f <spin>:



    /* boot1main should never return! */
spin:
	hlt
    7e9f:	f4                   	hlt    

00007ea0 <putstr>:
/*
 * print a string (@ %si) to the screen
 */
	.globl putstr
putstr:
	pusha
    7ea0:	60                   	pusha  
	movb	$0xe, %ah
    7ea1:	b4 0e                	mov    $0xe,%ah

00007ea3 <putstr.1>:
putstr.1:
	lodsb
    7ea3:	ac                   	lods   %ds:(%esi),%al
	cmp	$0, %al
    7ea4:	3c 00                	cmp    $0x0,%al
	je	putstr.2
    7ea6:	74 04                	je     7eac <putstr.2>
	int	$0x10
    7ea8:	cd 10                	int    $0x10
	jmp	putstr.1
    7eaa:	eb f7                	jmp    7ea3 <putstr.1>

00007eac <putstr.2>:
putstr.2:
	popa
    7eac:	61                   	popa   
	ret
    7ead:	c3                   	ret    

00007eae <STARTUP_MSG>:
    7eae:	53                   	push   %ebx
    7eaf:	74 61                	je     7f12 <gdt+0x16>
    7eb1:	72 74                	jb     7f27 <gdtdesc+0x3>
    7eb3:	20 62 6f             	and    %ah,0x6f(%edx)
    7eb6:	6f                   	outsl  %ds:(%esi),(%dx)
    7eb7:	74 31                	je     7eea <NO_BOOTABLE_MSG+0x8>
    7eb9:	20 2e                	and    %ch,(%esi)
    7ebb:	2e 2e 0d 0a 00 65 72 	cs cs or $0x7265000a,%eax

00007ec0 <E820_FAIL_MSG>:
    7ec0:	65 72 72             	gs jb  7f35 <smap+0xb>
    7ec3:	6f                   	outsl  %ds:(%esi),(%dx)
    7ec4:	72 20                	jb     7ee6 <NO_BOOTABLE_MSG+0x4>
    7ec6:	77 68                	ja     7f30 <smap+0x6>
    7ec8:	65 6e                	outsb  %gs:(%esi),(%dx)
    7eca:	20 64 65 74          	and    %ah,0x74(%ebp,%eiz,2)
    7ece:	65 63 74 69 6e       	arpl   %si,%gs:0x6e(%ecx,%ebp,2)
    7ed3:	67 20 6d 65          	and    %ch,0x65(%di)
    7ed7:	6d                   	insl   (%dx),%es:(%edi)
    7ed8:	6f                   	outsl  %ds:(%esi),(%dx)
    7ed9:	72 79                	jb     7f54 <smap+0x2a>
    7edb:	20 6d 61             	and    %ch,0x61(%ebp)
    7ede:	70 0d                	jo     7eed <NO_BOOTABLE_MSG+0xb>
    7ee0:	0a 00                	or     (%eax),%al

00007ee2 <NO_BOOTABLE_MSG>:
    7ee2:	4e                   	dec    %esi
    7ee3:	6f                   	outsl  %ds:(%esi),(%dx)
    7ee4:	20 62 6f             	and    %ah,0x6f(%edx)
    7ee7:	6f                   	outsl  %ds:(%esi),(%dx)
    7ee8:	74 61                	je     7f4b <smap+0x21>
    7eea:	62 6c 65 20          	bound  %ebp,0x20(%ebp,%eiz,2)
    7eee:	70 61                	jo     7f51 <smap+0x27>
    7ef0:	72 74                	jb     7f66 <smap+0x3c>
    7ef2:	69 74 69 6f 6e 2e 0d 	imul   $0xa0d2e6e,0x6f(%ecx,%ebp,2),%esi
    7ef9:	0a 
    7efa:	00 90 00 00 00 00    	add    %dl,0x0(%eax)

00007efc <gdt>:
    7efc:	00 00                	add    %al,(%eax)
    7efe:	00 00                	add    %al,(%eax)
    7f00:	00 00                	add    %al,(%eax)
    7f02:	00 00                	add    %al,(%eax)
    7f04:	ff                   	(bad)  
    7f05:	ff 00                	incl   (%eax)
    7f07:	00 00                	add    %al,(%eax)
    7f09:	9a cf 00 ff ff 00 00 	lcall  $0x0,$0xffff00cf
    7f10:	00 92 cf 00 ff ff    	add    %dl,-0xff31(%edx)
    7f16:	00 00                	add    %al,(%eax)
    7f18:	00 9e 00 00 ff ff    	add    %bl,-0x10000(%esi)
    7f1e:	00 00                	add    %al,(%eax)
    7f20:	00 92 00 00 27 00    	add    %dl,0x270000(%edx)

00007f24 <gdtdesc>:
    7f24:	27                   	daa    
    7f25:	00 fc                	add    %bh,%ah
    7f27:	7e 00                	jle    7f29 <gdtdesc+0x5>
    7f29:	00 00                	add    %al,(%eax)

00007f2a <smap>:
    7f2a:	00 00                	add    %al,(%eax)
    7f2c:	00 00                	add    %al,(%eax)
    7f2e:	00 00                	add    %al,(%eax)
    7f30:	00 00                	add    %al,(%eax)
    7f32:	00 00                	add    %al,(%eax)
    7f34:	00 00                	add    %al,(%eax)
    7f36:	00 00                	add    %al,(%eax)
    7f38:	00 00                	add    %al,(%eax)
    7f3a:	00 00                	add    %al,(%eax)
    7f3c:	00 00                	add    %al,(%eax)
    7f3e:	00 00                	add    %al,(%eax)
    7f40:	00 00                	add    %al,(%eax)
    7f42:	00 00                	add    %al,(%eax)
    7f44:	00 00                	add    %al,(%eax)
    7f46:	00 00                	add    %al,(%eax)
    7f48:	00 00                	add    %al,(%eax)
    7f4a:	00 00                	add    %al,(%eax)
    7f4c:	00 00                	add    %al,(%eax)
    7f4e:	00 00                	add    %al,(%eax)
    7f50:	00 00                	add    %al,(%eax)
    7f52:	00 00                	add    %al,(%eax)
    7f54:	00 00                	add    %al,(%eax)
    7f56:	00 00                	add    %al,(%eax)
    7f58:	00 00                	add    %al,(%eax)
    7f5a:	00 00                	add    %al,(%eax)
    7f5c:	00 00                	add    %al,(%eax)
    7f5e:	00 00                	add    %al,(%eax)
    7f60:	00 00                	add    %al,(%eax)
    7f62:	00 00                	add    %al,(%eax)
    7f64:	00 00                	add    %al,(%eax)
    7f66:	00 00                	add    %al,(%eax)
    7f68:	00 00                	add    %al,(%eax)
    7f6a:	00 00                	add    %al,(%eax)
    7f6c:	00 00                	add    %al,(%eax)
    7f6e:	00 00                	add    %al,(%eax)
    7f70:	00 00                	add    %al,(%eax)
    7f72:	00 00                	add    %al,(%eax)
    7f74:	00 00                	add    %al,(%eax)
    7f76:	00 00                	add    %al,(%eax)
    7f78:	00 00                	add    %al,(%eax)
    7f7a:	00 00                	add    %al,(%eax)
    7f7c:	00 00                	add    %al,(%eax)
    7f7e:	00 00                	add    %al,(%eax)
    7f80:	00 00                	add    %al,(%eax)
    7f82:	00 00                	add    %al,(%eax)
    7f84:	00 00                	add    %al,(%eax)
    7f86:	00 00                	add    %al,(%eax)
    7f88:	00 00                	add    %al,(%eax)
    7f8a:	00 00                	add    %al,(%eax)
    7f8c:	00 00                	add    %al,(%eax)
    7f8e:	00 00                	add    %al,(%eax)
    7f90:	00 00                	add    %al,(%eax)
    7f92:	00 00                	add    %al,(%eax)
    7f94:	00 00                	add    %al,(%eax)
    7f96:	00 00                	add    %al,(%eax)
    7f98:	00 00                	add    %al,(%eax)
    7f9a:	00 00                	add    %al,(%eax)
    7f9c:	00 00                	add    %al,(%eax)
    7f9e:	00 00                	add    %al,(%eax)
    7fa0:	00 00                	add    %al,(%eax)
    7fa2:	00 00                	add    %al,(%eax)
    7fa4:	00 00                	add    %al,(%eax)
    7fa6:	00 00                	add    %al,(%eax)
    7fa8:	00 00                	add    %al,(%eax)
    7faa:	00 00                	add    %al,(%eax)
    7fac:	00 00                	add    %al,(%eax)
    7fae:	00 00                	add    %al,(%eax)
    7fb0:	00 00                	add    %al,(%eax)
    7fb2:	00 00                	add    %al,(%eax)
    7fb4:	00 00                	add    %al,(%eax)
    7fb6:	00 00                	add    %al,(%eax)
    7fb8:	00 00                	add    %al,(%eax)
    7fba:	00 00                	add    %al,(%eax)
    7fbc:	00 00                	add    %al,(%eax)
    7fbe:	00 00                	add    %al,(%eax)
    7fc0:	00 00                	add    %al,(%eax)
    7fc2:	00 00                	add    %al,(%eax)
    7fc4:	00 00                	add    %al,(%eax)
    7fc6:	00 00                	add    %al,(%eax)
    7fc8:	00 00                	add    %al,(%eax)
    7fca:	00 00                	add    %al,(%eax)
    7fcc:	00 00                	add    %al,(%eax)
    7fce:	00 00                	add    %al,(%eax)
    7fd0:	00 00                	add    %al,(%eax)
    7fd2:	00 00                	add    %al,(%eax)
    7fd4:	00 00                	add    %al,(%eax)
    7fd6:	00 00                	add    %al,(%eax)
    7fd8:	00 00                	add    %al,(%eax)
    7fda:	00 00                	add    %al,(%eax)
    7fdc:	00 00                	add    %al,(%eax)
    7fde:	00 00                	add    %al,(%eax)
    7fe0:	00 00                	add    %al,(%eax)
    7fe2:	00 00                	add    %al,(%eax)
    7fe4:	00 00                	add    %al,(%eax)
    7fe6:	00 00                	add    %al,(%eax)
    7fe8:	00 00                	add    %al,(%eax)
    7fea:	00 00                	add    %al,(%eax)
    7fec:	00 00                	add    %al,(%eax)
    7fee:	00 00                	add    %al,(%eax)
    7ff0:	00 00                	add    %al,(%eax)
    7ff2:	00 00                	add    %al,(%eax)
    7ff4:	00 00                	add    %al,(%eax)
    7ff6:	00 00                	add    %al,(%eax)
    7ff8:	00 00                	add    %al,(%eax)
    7ffa:	00 00                	add    %al,(%eax)
    7ffc:	00 00                	add    %al,(%eax)
    7ffe:	00 00                	add    %al,(%eax)
    8000:	00 00                	add    %al,(%eax)
    8002:	00 00                	add    %al,(%eax)
    8004:	00 00                	add    %al,(%eax)
    8006:	00 00                	add    %al,(%eax)
    8008:	00 00                	add    %al,(%eax)
    800a:	00 00                	add    %al,(%eax)
    800c:	00 00                	add    %al,(%eax)
    800e:	00 00                	add    %al,(%eax)
    8010:	00 00                	add    %al,(%eax)
    8012:	00 00                	add    %al,(%eax)
    8014:	00 00                	add    %al,(%eax)
    8016:	00 00                	add    %al,(%eax)
    8018:	00 00                	add    %al,(%eax)
    801a:	00 00                	add    %al,(%eax)
    801c:	00 00                	add    %al,(%eax)
    801e:	00 00                	add    %al,(%eax)
    8020:	00 00                	add    %al,(%eax)
    8022:	00 00                	add    %al,(%eax)
    8024:	00 00                	add    %al,(%eax)
    8026:	00 00                	add    %al,(%eax)
    8028:	00 00                	add    %al,(%eax)
    802a:	00 00                	add    %al,(%eax)
    802c:	00 00                	add    %al,(%eax)
    802e:	00 00                	add    %al,(%eax)
    8030:	00 00                	add    %al,(%eax)
    8032:	00 00                	add    %al,(%eax)
    8034:	00 00                	add    %al,(%eax)
    8036:	00 00                	add    %al,(%eax)
    8038:	00 00                	add    %al,(%eax)
    803a:	00 00                	add    %al,(%eax)
    803c:	00 00                	add    %al,(%eax)
    803e:	00 00                	add    %al,(%eax)
    8040:	00 00                	add    %al,(%eax)
    8042:	00 00                	add    %al,(%eax)
    8044:	00 00                	add    %al,(%eax)
    8046:	00 00                	add    %al,(%eax)
    8048:	00 00                	add    %al,(%eax)
    804a:	00 00                	add    %al,(%eax)
    804c:	00 00                	add    %al,(%eax)
    804e:	00 00                	add    %al,(%eax)
    8050:	00 00                	add    %al,(%eax)
    8052:	00 00                	add    %al,(%eax)
    8054:	00 00                	add    %al,(%eax)
    8056:	00 00                	add    %al,(%eax)
    8058:	00 00                	add    %al,(%eax)
    805a:	00 00                	add    %al,(%eax)
    805c:	00 00                	add    %al,(%eax)
    805e:	00 00                	add    %al,(%eax)
    8060:	00 00                	add    %al,(%eax)
    8062:	00 00                	add    %al,(%eax)
    8064:	00 00                	add    %al,(%eax)
    8066:	00 00                	add    %al,(%eax)
    8068:	00 00                	add    %al,(%eax)
    806a:	00 00                	add    %al,(%eax)
    806c:	00 00                	add    %al,(%eax)
    806e:	00 00                	add    %al,(%eax)
    8070:	00 00                	add    %al,(%eax)
    8072:	00 00                	add    %al,(%eax)
    8074:	00 00                	add    %al,(%eax)
    8076:	00 00                	add    %al,(%eax)
    8078:	00 00                	add    %al,(%eax)
    807a:	00 00                	add    %al,(%eax)
    807c:	00 00                	add    %al,(%eax)
    807e:	00 00                	add    %al,(%eax)
    8080:	00 00                	add    %al,(%eax)
    8082:	00 00                	add    %al,(%eax)
    8084:	00 00                	add    %al,(%eax)
    8086:	00 00                	add    %al,(%eax)
    8088:	00 00                	add    %al,(%eax)
    808a:	00 00                	add    %al,(%eax)
    808c:	00 00                	add    %al,(%eax)
    808e:	00 00                	add    %al,(%eax)
    8090:	00 00                	add    %al,(%eax)
    8092:	00 00                	add    %al,(%eax)
    8094:	00 00                	add    %al,(%eax)
    8096:	00 00                	add    %al,(%eax)
    8098:	00 00                	add    %al,(%eax)
    809a:	00 00                	add    %al,(%eax)
    809c:	00 00                	add    %al,(%eax)
    809e:	00 00                	add    %al,(%eax)
    80a0:	00 00                	add    %al,(%eax)
    80a2:	00 00                	add    %al,(%eax)
    80a4:	00 00                	add    %al,(%eax)
    80a6:	00 00                	add    %al,(%eax)
    80a8:	00 00                	add    %al,(%eax)
    80aa:	00 00                	add    %al,(%eax)
    80ac:	00 00                	add    %al,(%eax)
    80ae:	00 00                	add    %al,(%eax)
    80b0:	00 00                	add    %al,(%eax)
    80b2:	00 00                	add    %al,(%eax)
    80b4:	00 00                	add    %al,(%eax)
    80b6:	00 00                	add    %al,(%eax)
    80b8:	00 00                	add    %al,(%eax)
    80ba:	00 00                	add    %al,(%eax)
    80bc:	00 00                	add    %al,(%eax)
    80be:	00 00                	add    %al,(%eax)
    80c0:	00 00                	add    %al,(%eax)
    80c2:	00 00                	add    %al,(%eax)
    80c4:	00 00                	add    %al,(%eax)
    80c6:	00 00                	add    %al,(%eax)
    80c8:	00 00                	add    %al,(%eax)
    80ca:	00 00                	add    %al,(%eax)
    80cc:	00 00                	add    %al,(%eax)
    80ce:	00 00                	add    %al,(%eax)
    80d0:	00 00                	add    %al,(%eax)
    80d2:	00 00                	add    %al,(%eax)
    80d4:	00 00                	add    %al,(%eax)
    80d6:	00 00                	add    %al,(%eax)
    80d8:	00 00                	add    %al,(%eax)
    80da:	00 00                	add    %al,(%eax)
    80dc:	00 00                	add    %al,(%eax)
    80de:	00 00                	add    %al,(%eax)
    80e0:	00 00                	add    %al,(%eax)
    80e2:	00 00                	add    %al,(%eax)
    80e4:	00 00                	add    %al,(%eax)
    80e6:	00 00                	add    %al,(%eax)
    80e8:	00 00                	add    %al,(%eax)
    80ea:	00 00                	add    %al,(%eax)
    80ec:	00 00                	add    %al,(%eax)
    80ee:	00 00                	add    %al,(%eax)
    80f0:	00 00                	add    %al,(%eax)
    80f2:	00 00                	add    %al,(%eax)
    80f4:	00 00                	add    %al,(%eax)
    80f6:	00 00                	add    %al,(%eax)
    80f8:	00 00                	add    %al,(%eax)
    80fa:	00 00                	add    %al,(%eax)
    80fc:	00 00                	add    %al,(%eax)
    80fe:	00 00                	add    %al,(%eax)
    8100:	00 00                	add    %al,(%eax)
    8102:	00 00                	add    %al,(%eax)
    8104:	00 00                	add    %al,(%eax)
    8106:	00 00                	add    %al,(%eax)
    8108:	00 00                	add    %al,(%eax)
    810a:	00 00                	add    %al,(%eax)
    810c:	00 00                	add    %al,(%eax)
    810e:	00 00                	add    %al,(%eax)
    8110:	00 00                	add    %al,(%eax)
    8112:	00 00                	add    %al,(%eax)
    8114:	00 00                	add    %al,(%eax)
    8116:	00 00                	add    %al,(%eax)
    8118:	00 00                	add    %al,(%eax)
    811a:	00 00                	add    %al,(%eax)
    811c:	00 00                	add    %al,(%eax)
    811e:	00 00                	add    %al,(%eax)
    8120:	00 00                	add    %al,(%eax)
    8122:	00 00                	add    %al,(%eax)
    8124:	00 00                	add    %al,(%eax)
    8126:	00 00                	add    %al,(%eax)
    8128:	00 00                	add    %al,(%eax)
    812a:	00 00                	add    %al,(%eax)
    812c:	00 00                	add    %al,(%eax)
    812e:	00 00                	add    %al,(%eax)
    8130:	00 00                	add    %al,(%eax)
    8132:	00 00                	add    %al,(%eax)
    8134:	00 00                	add    %al,(%eax)
    8136:	00 00                	add    %al,(%eax)
    8138:	00 00                	add    %al,(%eax)
    813a:	00 00                	add    %al,(%eax)
    813c:	00 00                	add    %al,(%eax)
    813e:	00 00                	add    %al,(%eax)
    8140:	00 00                	add    %al,(%eax)
    8142:	00 00                	add    %al,(%eax)
    8144:	00 00                	add    %al,(%eax)
    8146:	00 00                	add    %al,(%eax)
    8148:	00 00                	add    %al,(%eax)
    814a:	00 00                	add    %al,(%eax)
    814c:	00 00                	add    %al,(%eax)
    814e:	00 00                	add    %al,(%eax)
    8150:	00 00                	add    %al,(%eax)
    8152:	00 00                	add    %al,(%eax)
    8154:	00 00                	add    %al,(%eax)
    8156:	00 00                	add    %al,(%eax)
    8158:	00 00                	add    %al,(%eax)
    815a:	00 00                	add    %al,(%eax)
    815c:	00 00                	add    %al,(%eax)
    815e:	00 00                	add    %al,(%eax)
    8160:	00 00                	add    %al,(%eax)
    8162:	00 00                	add    %al,(%eax)
    8164:	00 00                	add    %al,(%eax)
    8166:	00 00                	add    %al,(%eax)
    8168:	00 00                	add    %al,(%eax)
    816a:	00 00                	add    %al,(%eax)
    816c:	00 00                	add    %al,(%eax)
    816e:	00 00                	add    %al,(%eax)
    8170:	00 00                	add    %al,(%eax)
    8172:	00 00                	add    %al,(%eax)
    8174:	00 00                	add    %al,(%eax)
    8176:	00 00                	add    %al,(%eax)
    8178:	00 00                	add    %al,(%eax)
    817a:	00 00                	add    %al,(%eax)
    817c:	00 00                	add    %al,(%eax)
    817e:	00 00                	add    %al,(%eax)
    8180:	00 00                	add    %al,(%eax)
    8182:	00 00                	add    %al,(%eax)
    8184:	00 00                	add    %al,(%eax)
    8186:	00 00                	add    %al,(%eax)
    8188:	00 00                	add    %al,(%eax)
    818a:	00 00                	add    %al,(%eax)
    818c:	00 00                	add    %al,(%eax)
    818e:	00 00                	add    %al,(%eax)
    8190:	00 00                	add    %al,(%eax)
    8192:	00 00                	add    %al,(%eax)
    8194:	00 00                	add    %al,(%eax)
    8196:	00 00                	add    %al,(%eax)
    8198:	00 00                	add    %al,(%eax)
    819a:	00 00                	add    %al,(%eax)
    819c:	00 00                	add    %al,(%eax)
    819e:	00 00                	add    %al,(%eax)
    81a0:	00 00                	add    %al,(%eax)
    81a2:	00 00                	add    %al,(%eax)
    81a4:	00 00                	add    %al,(%eax)
    81a6:	00 00                	add    %al,(%eax)
    81a8:	00 00                	add    %al,(%eax)
    81aa:	00 00                	add    %al,(%eax)
    81ac:	00 00                	add    %al,(%eax)
    81ae:	00 00                	add    %al,(%eax)
    81b0:	00 00                	add    %al,(%eax)
    81b2:	00 00                	add    %al,(%eax)
    81b4:	00 00                	add    %al,(%eax)
    81b6:	00 00                	add    %al,(%eax)
    81b8:	00 00                	add    %al,(%eax)
    81ba:	00 00                	add    %al,(%eax)
    81bc:	00 00                	add    %al,(%eax)
    81be:	00 00                	add    %al,(%eax)
    81c0:	00 00                	add    %al,(%eax)
    81c2:	00 00                	add    %al,(%eax)
    81c4:	00 00                	add    %al,(%eax)
    81c6:	00 00                	add    %al,(%eax)
    81c8:	00 00                	add    %al,(%eax)
    81ca:	00 00                	add    %al,(%eax)
    81cc:	00 00                	add    %al,(%eax)
    81ce:	00 00                	add    %al,(%eax)
    81d0:	00 00                	add    %al,(%eax)
    81d2:	00 00                	add    %al,(%eax)
    81d4:	00 00                	add    %al,(%eax)
    81d6:	00 00                	add    %al,(%eax)
    81d8:	00 00                	add    %al,(%eax)
    81da:	00 00                	add    %al,(%eax)
    81dc:	00 00                	add    %al,(%eax)
    81de:	00 00                	add    %al,(%eax)
    81e0:	00 00                	add    %al,(%eax)
    81e2:	00 00                	add    %al,(%eax)
    81e4:	00 00                	add    %al,(%eax)
    81e6:	00 00                	add    %al,(%eax)
    81e8:	00 00                	add    %al,(%eax)
    81ea:	00 00                	add    %al,(%eax)
    81ec:	00 00                	add    %al,(%eax)
    81ee:	00 00                	add    %al,(%eax)
    81f0:	00 00                	add    %al,(%eax)
    81f2:	00 00                	add    %al,(%eax)
    81f4:	00 00                	add    %al,(%eax)
    81f6:	00 00                	add    %al,(%eax)
    81f8:	00 00                	add    %al,(%eax)
    81fa:	00 00                	add    %al,(%eax)
    81fc:	00 00                	add    %al,(%eax)
    81fe:	00 00                	add    %al,(%eax)
    8200:	00 00                	add    %al,(%eax)
    8202:	00 00                	add    %al,(%eax)
    8204:	00 00                	add    %al,(%eax)
    8206:	00 00                	add    %al,(%eax)
    8208:	00 00                	add    %al,(%eax)
    820a:	00 00                	add    %al,(%eax)
    820c:	00 00                	add    %al,(%eax)
    820e:	00 00                	add    %al,(%eax)
    8210:	00 00                	add    %al,(%eax)
    8212:	00 00                	add    %al,(%eax)
    8214:	00 00                	add    %al,(%eax)
    8216:	00 00                	add    %al,(%eax)
    8218:	00 00                	add    %al,(%eax)
    821a:	00 00                	add    %al,(%eax)
    821c:	00 00                	add    %al,(%eax)
    821e:	00 00                	add    %al,(%eax)
    8220:	00 00                	add    %al,(%eax)
    8222:	00 00                	add    %al,(%eax)
    8224:	00 00                	add    %al,(%eax)
    8226:	00 00                	add    %al,(%eax)
    8228:	00 00                	add    %al,(%eax)
    822a:	00 00                	add    %al,(%eax)
    822c:	00 00                	add    %al,(%eax)
    822e:	00 00                	add    %al,(%eax)
    8230:	00 00                	add    %al,(%eax)
    8232:	00 00                	add    %al,(%eax)
    8234:	00 00                	add    %al,(%eax)
    8236:	00 00                	add    %al,(%eax)
    8238:	00 00                	add    %al,(%eax)
    823a:	00 00                	add    %al,(%eax)
    823c:	00 00                	add    %al,(%eax)
    823e:	00 00                	add    %al,(%eax)
    8240:	00 00                	add    %al,(%eax)
    8242:	00 00                	add    %al,(%eax)
    8244:	00 00                	add    %al,(%eax)
    8246:	00 00                	add    %al,(%eax)
    8248:	00 00                	add    %al,(%eax)
    824a:	00 00                	add    %al,(%eax)
    824c:	00 00                	add    %al,(%eax)
    824e:	00 00                	add    %al,(%eax)
    8250:	00 00                	add    %al,(%eax)
    8252:	00 00                	add    %al,(%eax)
    8254:	00 00                	add    %al,(%eax)
    8256:	00 00                	add    %al,(%eax)
    8258:	00 00                	add    %al,(%eax)
    825a:	00 00                	add    %al,(%eax)
    825c:	00 00                	add    %al,(%eax)
    825e:	00 00                	add    %al,(%eax)
    8260:	00 00                	add    %al,(%eax)
    8262:	00 00                	add    %al,(%eax)
    8264:	00 00                	add    %al,(%eax)
    8266:	00 00                	add    %al,(%eax)
    8268:	00 00                	add    %al,(%eax)
    826a:	00 00                	add    %al,(%eax)
    826c:	00 00                	add    %al,(%eax)
    826e:	00 00                	add    %al,(%eax)
    8270:	00 00                	add    %al,(%eax)
    8272:	00 00                	add    %al,(%eax)
    8274:	00 00                	add    %al,(%eax)
    8276:	00 00                	add    %al,(%eax)
    8278:	00 00                	add    %al,(%eax)
    827a:	00 00                	add    %al,(%eax)
    827c:	00 00                	add    %al,(%eax)
    827e:	00 00                	add    %al,(%eax)
    8280:	00 00                	add    %al,(%eax)
    8282:	00 00                	add    %al,(%eax)
    8284:	00 00                	add    %al,(%eax)
    8286:	00 00                	add    %al,(%eax)
    8288:	00 00                	add    %al,(%eax)
    828a:	00 00                	add    %al,(%eax)
    828c:	00 00                	add    %al,(%eax)
    828e:	00 00                	add    %al,(%eax)
    8290:	00 00                	add    %al,(%eax)
    8292:	00 00                	add    %al,(%eax)
    8294:	00 00                	add    %al,(%eax)
    8296:	00 00                	add    %al,(%eax)
    8298:	00 00                	add    %al,(%eax)
    829a:	00 00                	add    %al,(%eax)
    829c:	00 00                	add    %al,(%eax)
    829e:	00 00                	add    %al,(%eax)
    82a0:	00 00                	add    %al,(%eax)
    82a2:	00 00                	add    %al,(%eax)
    82a4:	00 00                	add    %al,(%eax)
    82a6:	00 00                	add    %al,(%eax)
    82a8:	00 00                	add    %al,(%eax)
    82aa:	00 00                	add    %al,(%eax)
    82ac:	00 00                	add    %al,(%eax)
    82ae:	00 00                	add    %al,(%eax)
    82b0:	00 00                	add    %al,(%eax)
    82b2:	00 00                	add    %al,(%eax)
    82b4:	00 00                	add    %al,(%eax)
    82b6:	00 00                	add    %al,(%eax)
    82b8:	00 00                	add    %al,(%eax)
    82ba:	00 00                	add    %al,(%eax)
    82bc:	00 00                	add    %al,(%eax)
    82be:	00 00                	add    %al,(%eax)
    82c0:	00 00                	add    %al,(%eax)
    82c2:	00 00                	add    %al,(%eax)
    82c4:	00 00                	add    %al,(%eax)
    82c6:	00 00                	add    %al,(%eax)
    82c8:	00 00                	add    %al,(%eax)
    82ca:	00 00                	add    %al,(%eax)
    82cc:	00 00                	add    %al,(%eax)
    82ce:	00 00                	add    %al,(%eax)
    82d0:	00 00                	add    %al,(%eax)
    82d2:	00 00                	add    %al,(%eax)
    82d4:	00 00                	add    %al,(%eax)
    82d6:	00 00                	add    %al,(%eax)
    82d8:	00 00                	add    %al,(%eax)
    82da:	00 00                	add    %al,(%eax)
    82dc:	00 00                	add    %al,(%eax)
    82de:	00 00                	add    %al,(%eax)
    82e0:	00 00                	add    %al,(%eax)
    82e2:	00 00                	add    %al,(%eax)
    82e4:	00 00                	add    %al,(%eax)
    82e6:	00 00                	add    %al,(%eax)
    82e8:	00 00                	add    %al,(%eax)
    82ea:	00 00                	add    %al,(%eax)
    82ec:	00 00                	add    %al,(%eax)
    82ee:	00 00                	add    %al,(%eax)
    82f0:	00 00                	add    %al,(%eax)
    82f2:	00 00                	add    %al,(%eax)
    82f4:	00 00                	add    %al,(%eax)
    82f6:	00 00                	add    %al,(%eax)
    82f8:	00 00                	add    %al,(%eax)
    82fa:	00 00                	add    %al,(%eax)
    82fc:	00 00                	add    %al,(%eax)
    82fe:	00 00                	add    %al,(%eax)
    8300:	00 00                	add    %al,(%eax)
    8302:	00 00                	add    %al,(%eax)
    8304:	00 00                	add    %al,(%eax)
    8306:	00 00                	add    %al,(%eax)
    8308:	00 00                	add    %al,(%eax)
    830a:	00 00                	add    %al,(%eax)
    830c:	00 00                	add    %al,(%eax)
    830e:	00 00                	add    %al,(%eax)
    8310:	00 00                	add    %al,(%eax)
    8312:	00 00                	add    %al,(%eax)
    8314:	00 00                	add    %al,(%eax)
    8316:	00 00                	add    %al,(%eax)
    8318:	00 00                	add    %al,(%eax)
    831a:	00 00                	add    %al,(%eax)
    831c:	00 00                	add    %al,(%eax)
    831e:	00 00                	add    %al,(%eax)
    8320:	00 00                	add    %al,(%eax)
    8322:	00 00                	add    %al,(%eax)
    8324:	00 00                	add    %al,(%eax)
    8326:	00 00                	add    %al,(%eax)
    8328:	00 00                	add    %al,(%eax)
    832a:	00 00                	add    %al,(%eax)
    832c:	00 00                	add    %al,(%eax)
    832e:	00 00                	add    %al,(%eax)
    8330:	00 00                	add    %al,(%eax)
    8332:	00 00                	add    %al,(%eax)
    8334:	00 00                	add    %al,(%eax)
    8336:	00 00                	add    %al,(%eax)
    8338:	00 00                	add    %al,(%eax)
    833a:	00 00                	add    %al,(%eax)
    833c:	00 00                	add    %al,(%eax)
    833e:	00 00                	add    %al,(%eax)
    8340:	00 00                	add    %al,(%eax)
    8342:	00 00                	add    %al,(%eax)
    8344:	00 00                	add    %al,(%eax)
    8346:	00 00                	add    %al,(%eax)
    8348:	00 00                	add    %al,(%eax)
    834a:	00 00                	add    %al,(%eax)
    834c:	00 00                	add    %al,(%eax)
    834e:	00 00                	add    %al,(%eax)
    8350:	00 00                	add    %al,(%eax)
    8352:	00 00                	add    %al,(%eax)
    8354:	00 00                	add    %al,(%eax)
    8356:	00 00                	add    %al,(%eax)
    8358:	00 00                	add    %al,(%eax)
    835a:	00 00                	add    %al,(%eax)
    835c:	00 00                	add    %al,(%eax)
    835e:	00 00                	add    %al,(%eax)
    8360:	00 00                	add    %al,(%eax)
    8362:	00 00                	add    %al,(%eax)
    8364:	00 00                	add    %al,(%eax)
    8366:	00 00                	add    %al,(%eax)
    8368:	00 00                	add    %al,(%eax)
    836a:	00 00                	add    %al,(%eax)
    836c:	00 00                	add    %al,(%eax)
    836e:	00 00                	add    %al,(%eax)
    8370:	00 00                	add    %al,(%eax)
    8372:	00 00                	add    %al,(%eax)
    8374:	00 00                	add    %al,(%eax)
    8376:	00 00                	add    %al,(%eax)
    8378:	00 00                	add    %al,(%eax)
    837a:	00 00                	add    %al,(%eax)
    837c:	00 00                	add    %al,(%eax)
    837e:	00 00                	add    %al,(%eax)
    8380:	00 00                	add    %al,(%eax)
    8382:	00 00                	add    %al,(%eax)
    8384:	00 00                	add    %al,(%eax)
    8386:	00 00                	add    %al,(%eax)
    8388:	00 00                	add    %al,(%eax)
    838a:	00 00                	add    %al,(%eax)
    838c:	00 00                	add    %al,(%eax)
    838e:	00 00                	add    %al,(%eax)
    8390:	00 00                	add    %al,(%eax)
    8392:	00 00                	add    %al,(%eax)
    8394:	00 00                	add    %al,(%eax)
    8396:	00 00                	add    %al,(%eax)
    8398:	00 00                	add    %al,(%eax)
    839a:	00 00                	add    %al,(%eax)
    839c:	00 00                	add    %al,(%eax)
    839e:	00 00                	add    %al,(%eax)
    83a0:	00 00                	add    %al,(%eax)
    83a2:	00 00                	add    %al,(%eax)
    83a4:	00 00                	add    %al,(%eax)
    83a6:	00 00                	add    %al,(%eax)
    83a8:	00 00                	add    %al,(%eax)
    83aa:	00 00                	add    %al,(%eax)
    83ac:	00 00                	add    %al,(%eax)
    83ae:	00 00                	add    %al,(%eax)
    83b0:	00 00                	add    %al,(%eax)
    83b2:	00 00                	add    %al,(%eax)
    83b4:	00 00                	add    %al,(%eax)
    83b6:	00 00                	add    %al,(%eax)
    83b8:	00 00                	add    %al,(%eax)
    83ba:	00 00                	add    %al,(%eax)
    83bc:	00 00                	add    %al,(%eax)
    83be:	00 00                	add    %al,(%eax)
    83c0:	00 00                	add    %al,(%eax)
    83c2:	00 00                	add    %al,(%eax)
    83c4:	00 00                	add    %al,(%eax)
    83c6:	00 00                	add    %al,(%eax)
    83c8:	00 00                	add    %al,(%eax)
    83ca:	00 00                	add    %al,(%eax)
    83cc:	00 00                	add    %al,(%eax)
    83ce:	00 00                	add    %al,(%eax)
    83d0:	00 00                	add    %al,(%eax)
    83d2:	00 00                	add    %al,(%eax)
    83d4:	00 00                	add    %al,(%eax)
    83d6:	00 00                	add    %al,(%eax)
    83d8:	00 00                	add    %al,(%eax)
    83da:	00 00                	add    %al,(%eax)
    83dc:	00 00                	add    %al,(%eax)
    83de:	00 00                	add    %al,(%eax)
    83e0:	00 00                	add    %al,(%eax)
    83e2:	00 00                	add    %al,(%eax)
    83e4:	00 00                	add    %al,(%eax)
    83e6:	00 00                	add    %al,(%eax)
    83e8:	00 00                	add    %al,(%eax)
    83ea:	00 00                	add    %al,(%eax)
    83ec:	00 00                	add    %al,(%eax)
    83ee:	00 00                	add    %al,(%eax)
    83f0:	00 00                	add    %al,(%eax)
    83f2:	00 00                	add    %al,(%eax)
    83f4:	00 00                	add    %al,(%eax)
    83f6:	00 00                	add    %al,(%eax)
    83f8:	00 00                	add    %al,(%eax)
    83fa:	00 00                	add    %al,(%eax)
    83fc:	00 00                	add    %al,(%eax)
    83fe:	00 00                	add    %al,(%eax)
    8400:	00 00                	add    %al,(%eax)
    8402:	00 00                	add    %al,(%eax)
    8404:	00 00                	add    %al,(%eax)
    8406:	00 00                	add    %al,(%eax)
    8408:	00 00                	add    %al,(%eax)
    840a:	00 00                	add    %al,(%eax)
    840c:	00 00                	add    %al,(%eax)
    840e:	00 00                	add    %al,(%eax)
    8410:	00 00                	add    %al,(%eax)
    8412:	00 00                	add    %al,(%eax)
    8414:	00 00                	add    %al,(%eax)
    8416:	00 00                	add    %al,(%eax)
    8418:	00 00                	add    %al,(%eax)
    841a:	00 00                	add    %al,(%eax)
    841c:	00 00                	add    %al,(%eax)
    841e:	00 00                	add    %al,(%eax)
    8420:	00 00                	add    %al,(%eax)
    8422:	00 00                	add    %al,(%eax)
    8424:	00 00                	add    %al,(%eax)
    8426:	00 00                	add    %al,(%eax)
    8428:	00 00                	add    %al,(%eax)
    842a:	00 00                	add    %al,(%eax)
    842c:	00 00                	add    %al,(%eax)
    842e:	00 00                	add    %al,(%eax)
    8430:	00 00                	add    %al,(%eax)
    8432:	00 00                	add    %al,(%eax)
    8434:	00 00                	add    %al,(%eax)
    8436:	00 00                	add    %al,(%eax)
    8438:	00 00                	add    %al,(%eax)
    843a:	00 00                	add    %al,(%eax)
    843c:	00 00                	add    %al,(%eax)
    843e:	00 00                	add    %al,(%eax)
    8440:	00 00                	add    %al,(%eax)
    8442:	00 00                	add    %al,(%eax)
    8444:	00 00                	add    %al,(%eax)
    8446:	00 00                	add    %al,(%eax)
    8448:	00 00                	add    %al,(%eax)
    844a:	00 00                	add    %al,(%eax)
    844c:	00 00                	add    %al,(%eax)
    844e:	00 00                	add    %al,(%eax)
    8450:	00 00                	add    %al,(%eax)
    8452:	00 00                	add    %al,(%eax)
    8454:	00 00                	add    %al,(%eax)
    8456:	00 00                	add    %al,(%eax)
    8458:	00 00                	add    %al,(%eax)
    845a:	00 00                	add    %al,(%eax)
    845c:	00 00                	add    %al,(%eax)
    845e:	00 00                	add    %al,(%eax)
    8460:	00 00                	add    %al,(%eax)
    8462:	00 00                	add    %al,(%eax)
    8464:	00 00                	add    %al,(%eax)
    8466:	00 00                	add    %al,(%eax)
    8468:	00 00                	add    %al,(%eax)
    846a:	00 00                	add    %al,(%eax)
    846c:	00 00                	add    %al,(%eax)
    846e:	00 00                	add    %al,(%eax)
    8470:	00 00                	add    %al,(%eax)
    8472:	00 00                	add    %al,(%eax)
    8474:	00 00                	add    %al,(%eax)
    8476:	00 00                	add    %al,(%eax)
    8478:	00 00                	add    %al,(%eax)
    847a:	00 00                	add    %al,(%eax)
    847c:	00 00                	add    %al,(%eax)
    847e:	00 00                	add    %al,(%eax)
    8480:	00 00                	add    %al,(%eax)
    8482:	00 00                	add    %al,(%eax)
    8484:	00 00                	add    %al,(%eax)
    8486:	00 00                	add    %al,(%eax)
    8488:	00 00                	add    %al,(%eax)
    848a:	00 00                	add    %al,(%eax)
    848c:	00 00                	add    %al,(%eax)
    848e:	00 00                	add    %al,(%eax)
    8490:	00 00                	add    %al,(%eax)
    8492:	00 00                	add    %al,(%eax)
    8494:	00 00                	add    %al,(%eax)
    8496:	00 00                	add    %al,(%eax)
    8498:	00 00                	add    %al,(%eax)
    849a:	00 00                	add    %al,(%eax)
    849c:	00 00                	add    %al,(%eax)
    849e:	00 00                	add    %al,(%eax)
    84a0:	00 00                	add    %al,(%eax)
    84a2:	00 00                	add    %al,(%eax)
    84a4:	00 00                	add    %al,(%eax)
    84a6:	00 00                	add    %al,(%eax)
    84a8:	00 00                	add    %al,(%eax)
    84aa:	00 00                	add    %al,(%eax)
    84ac:	00 00                	add    %al,(%eax)
    84ae:	00 00                	add    %al,(%eax)
    84b0:	00 00                	add    %al,(%eax)
    84b2:	00 00                	add    %al,(%eax)
    84b4:	00 00                	add    %al,(%eax)
    84b6:	00 00                	add    %al,(%eax)
    84b8:	00 00                	add    %al,(%eax)
    84ba:	00 00                	add    %al,(%eax)
    84bc:	00 00                	add    %al,(%eax)
    84be:	00 00                	add    %al,(%eax)
    84c0:	00 00                	add    %al,(%eax)
    84c2:	00 00                	add    %al,(%eax)
    84c4:	00 00                	add    %al,(%eax)
    84c6:	00 00                	add    %al,(%eax)
    84c8:	00 00                	add    %al,(%eax)
    84ca:	00 00                	add    %al,(%eax)
    84cc:	00 00                	add    %al,(%eax)
    84ce:	00 00                	add    %al,(%eax)
    84d0:	00 00                	add    %al,(%eax)
    84d2:	00 00                	add    %al,(%eax)
    84d4:	00 00                	add    %al,(%eax)
    84d6:	00 00                	add    %al,(%eax)
    84d8:	00 00                	add    %al,(%eax)
    84da:	00 00                	add    %al,(%eax)
    84dc:	00 00                	add    %al,(%eax)
    84de:	00 00                	add    %al,(%eax)
    84e0:	00 00                	add    %al,(%eax)
    84e2:	00 00                	add    %al,(%eax)
    84e4:	00 00                	add    %al,(%eax)
    84e6:	00 00                	add    %al,(%eax)
    84e8:	00 00                	add    %al,(%eax)
    84ea:	00 00                	add    %al,(%eax)
    84ec:	00 00                	add    %al,(%eax)
    84ee:	00 00                	add    %al,(%eax)
    84f0:	00 00                	add    %al,(%eax)
    84f2:	00 00                	add    %al,(%eax)
    84f4:	00 00                	add    %al,(%eax)
    84f6:	00 00                	add    %al,(%eax)
    84f8:	00 00                	add    %al,(%eax)
    84fa:	00 00                	add    %al,(%eax)
    84fc:	00 00                	add    %al,(%eax)
    84fe:	00 00                	add    %al,(%eax)
    8500:	00 00                	add    %al,(%eax)
    8502:	00 00                	add    %al,(%eax)
    8504:	00 00                	add    %al,(%eax)
    8506:	00 00                	add    %al,(%eax)
    8508:	00 00                	add    %al,(%eax)
    850a:	00 00                	add    %al,(%eax)
    850c:	00 00                	add    %al,(%eax)
    850e:	00 00                	add    %al,(%eax)
    8510:	00 00                	add    %al,(%eax)
    8512:	00 00                	add    %al,(%eax)
    8514:	00 00                	add    %al,(%eax)
    8516:	00 00                	add    %al,(%eax)
    8518:	00 00                	add    %al,(%eax)
    851a:	00 00                	add    %al,(%eax)
    851c:	00 00                	add    %al,(%eax)
    851e:	00 00                	add    %al,(%eax)
    8520:	00 00                	add    %al,(%eax)
    8522:	00 00                	add    %al,(%eax)
    8524:	00 00                	add    %al,(%eax)
    8526:	00 00                	add    %al,(%eax)
    8528:	00 00                	add    %al,(%eax)
    852a:	00 00                	add    %al,(%eax)
    852c:	00 00                	add    %al,(%eax)
    852e:	00 00                	add    %al,(%eax)
    8530:	00 00                	add    %al,(%eax)
    8532:	00 00                	add    %al,(%eax)
    8534:	00 00                	add    %al,(%eax)
    8536:	00 00                	add    %al,(%eax)
    8538:	00 00                	add    %al,(%eax)
    853a:	00 00                	add    %al,(%eax)
    853c:	00 00                	add    %al,(%eax)
    853e:	00 00                	add    %al,(%eax)
    8540:	00 00                	add    %al,(%eax)
    8542:	00 00                	add    %al,(%eax)
    8544:	00 00                	add    %al,(%eax)
    8546:	00 00                	add    %al,(%eax)
    8548:	00 00                	add    %al,(%eax)
    854a:	00 00                	add    %al,(%eax)
    854c:	00 00                	add    %al,(%eax)
    854e:	00 00                	add    %al,(%eax)
    8550:	00 00                	add    %al,(%eax)
    8552:	00 00                	add    %al,(%eax)
    8554:	00 00                	add    %al,(%eax)
    8556:	00 00                	add    %al,(%eax)
    8558:	00 00                	add    %al,(%eax)
    855a:	00 00                	add    %al,(%eax)
    855c:	00 00                	add    %al,(%eax)
    855e:	00 00                	add    %al,(%eax)
    8560:	00 00                	add    %al,(%eax)
    8562:	00 00                	add    %al,(%eax)
    8564:	00 00                	add    %al,(%eax)
    8566:	00 00                	add    %al,(%eax)
    8568:	00 00                	add    %al,(%eax)
    856a:	00 00                	add    %al,(%eax)
    856c:	00 00                	add    %al,(%eax)
    856e:	00 00                	add    %al,(%eax)
    8570:	00 00                	add    %al,(%eax)
    8572:	00 00                	add    %al,(%eax)
    8574:	00 00                	add    %al,(%eax)
    8576:	00 00                	add    %al,(%eax)
    8578:	00 00                	add    %al,(%eax)
    857a:	00 00                	add    %al,(%eax)
    857c:	00 00                	add    %al,(%eax)
    857e:	00 00                	add    %al,(%eax)
    8580:	00 00                	add    %al,(%eax)
    8582:	00 00                	add    %al,(%eax)
    8584:	00 00                	add    %al,(%eax)
    8586:	00 00                	add    %al,(%eax)
    8588:	00 00                	add    %al,(%eax)
    858a:	00 00                	add    %al,(%eax)
    858c:	00 00                	add    %al,(%eax)
    858e:	00 00                	add    %al,(%eax)
    8590:	00 00                	add    %al,(%eax)
    8592:	00 00                	add    %al,(%eax)
    8594:	00 00                	add    %al,(%eax)
    8596:	00 00                	add    %al,(%eax)
    8598:	00 00                	add    %al,(%eax)
    859a:	00 00                	add    %al,(%eax)
    859c:	00 00                	add    %al,(%eax)
    859e:	00 00                	add    %al,(%eax)
    85a0:	00 00                	add    %al,(%eax)
    85a2:	00 00                	add    %al,(%eax)
    85a4:	00 00                	add    %al,(%eax)
    85a6:	00 00                	add    %al,(%eax)
    85a8:	00 00                	add    %al,(%eax)
    85aa:	00 00                	add    %al,(%eax)
    85ac:	00 00                	add    %al,(%eax)
    85ae:	00 00                	add    %al,(%eax)
    85b0:	00 00                	add    %al,(%eax)
    85b2:	00 00                	add    %al,(%eax)
    85b4:	00 00                	add    %al,(%eax)
    85b6:	00 00                	add    %al,(%eax)
    85b8:	00 00                	add    %al,(%eax)
    85ba:	00 00                	add    %al,(%eax)
    85bc:	00 00                	add    %al,(%eax)
    85be:	00 00                	add    %al,(%eax)
    85c0:	00 00                	add    %al,(%eax)
    85c2:	00 00                	add    %al,(%eax)
    85c4:	00 00                	add    %al,(%eax)
    85c6:	00 00                	add    %al,(%eax)
    85c8:	00 00                	add    %al,(%eax)
    85ca:	00 00                	add    %al,(%eax)
    85cc:	00 00                	add    %al,(%eax)
    85ce:	00 00                	add    %al,(%eax)
    85d0:	00 00                	add    %al,(%eax)
    85d2:	00 00                	add    %al,(%eax)
    85d4:	00 00                	add    %al,(%eax)
    85d6:	00 00                	add    %al,(%eax)
    85d8:	00 00                	add    %al,(%eax)
    85da:	00 00                	add    %al,(%eax)
    85dc:	00 00                	add    %al,(%eax)
    85de:	00 00                	add    %al,(%eax)
    85e0:	00 00                	add    %al,(%eax)
    85e2:	00 00                	add    %al,(%eax)
    85e4:	00 00                	add    %al,(%eax)
    85e6:	00 00                	add    %al,(%eax)
    85e8:	00 00                	add    %al,(%eax)
    85ea:	00 00                	add    %al,(%eax)
    85ec:	00 00                	add    %al,(%eax)
    85ee:	00 00                	add    %al,(%eax)
    85f0:	00 00                	add    %al,(%eax)
    85f2:	00 00                	add    %al,(%eax)
    85f4:	00 00                	add    %al,(%eax)
    85f6:	00 00                	add    %al,(%eax)
    85f8:	00 00                	add    %al,(%eax)
    85fa:	00 00                	add    %al,(%eax)
    85fc:	00 00                	add    %al,(%eax)
    85fe:	00 00                	add    %al,(%eax)
    8600:	00 00                	add    %al,(%eax)
    8602:	00 00                	add    %al,(%eax)
    8604:	00 00                	add    %al,(%eax)
    8606:	00 00                	add    %al,(%eax)
    8608:	00 00                	add    %al,(%eax)
    860a:	00 00                	add    %al,(%eax)
    860c:	00 00                	add    %al,(%eax)
    860e:	00 00                	add    %al,(%eax)
    8610:	00 00                	add    %al,(%eax)
    8612:	00 00                	add    %al,(%eax)
    8614:	00 00                	add    %al,(%eax)
    8616:	00 00                	add    %al,(%eax)
    8618:	00 00                	add    %al,(%eax)
    861a:	00 00                	add    %al,(%eax)
    861c:	00 00                	add    %al,(%eax)
    861e:	00 00                	add    %al,(%eax)
    8620:	00 00                	add    %al,(%eax)
    8622:	00 00                	add    %al,(%eax)
    8624:	00 00                	add    %al,(%eax)
    8626:	00 00                	add    %al,(%eax)
    8628:	00 00                	add    %al,(%eax)
    862a:	00 00                	add    %al,(%eax)
    862c:	00 00                	add    %al,(%eax)
    862e:	00 00                	add    %al,(%eax)
    8630:	00 00                	add    %al,(%eax)
    8632:	00 00                	add    %al,(%eax)
    8634:	00 00                	add    %al,(%eax)
    8636:	00 00                	add    %al,(%eax)
    8638:	00 00                	add    %al,(%eax)
    863a:	00 00                	add    %al,(%eax)
    863c:	00 00                	add    %al,(%eax)
    863e:	00 00                	add    %al,(%eax)
    8640:	00 00                	add    %al,(%eax)
    8642:	00 00                	add    %al,(%eax)
    8644:	00 00                	add    %al,(%eax)
    8646:	00 00                	add    %al,(%eax)
    8648:	00 00                	add    %al,(%eax)
    864a:	00 00                	add    %al,(%eax)
    864c:	00 00                	add    %al,(%eax)
    864e:	00 00                	add    %al,(%eax)
    8650:	00 00                	add    %al,(%eax)
    8652:	00 00                	add    %al,(%eax)
    8654:	00 00                	add    %al,(%eax)
    8656:	00 00                	add    %al,(%eax)
    8658:	00 00                	add    %al,(%eax)
    865a:	00 00                	add    %al,(%eax)
    865c:	00 00                	add    %al,(%eax)
    865e:	00 00                	add    %al,(%eax)
    8660:	00 00                	add    %al,(%eax)
    8662:	00 00                	add    %al,(%eax)
    8664:	00 00                	add    %al,(%eax)
    8666:	00 00                	add    %al,(%eax)
    8668:	00 00                	add    %al,(%eax)
    866a:	00 00                	add    %al,(%eax)
    866c:	00 00                	add    %al,(%eax)
    866e:	00 00                	add    %al,(%eax)
    8670:	00 00                	add    %al,(%eax)
    8672:	00 00                	add    %al,(%eax)
    8674:	00 00                	add    %al,(%eax)
    8676:	00 00                	add    %al,(%eax)
    8678:	00 00                	add    %al,(%eax)
    867a:	00 00                	add    %al,(%eax)
    867c:	00 00                	add    %al,(%eax)
    867e:	00 00                	add    %al,(%eax)
    8680:	00 00                	add    %al,(%eax)
    8682:	00 00                	add    %al,(%eax)
    8684:	00 00                	add    %al,(%eax)
    8686:	00 00                	add    %al,(%eax)
    8688:	00 00                	add    %al,(%eax)
    868a:	00 00                	add    %al,(%eax)
    868c:	00 00                	add    %al,(%eax)
    868e:	00 00                	add    %al,(%eax)
    8690:	00 00                	add    %al,(%eax)
    8692:	00 00                	add    %al,(%eax)
    8694:	00 00                	add    %al,(%eax)
    8696:	00 00                	add    %al,(%eax)
    8698:	00 00                	add    %al,(%eax)
    869a:	00 00                	add    %al,(%eax)
    869c:	00 00                	add    %al,(%eax)
    869e:	00 00                	add    %al,(%eax)
    86a0:	00 00                	add    %al,(%eax)
    86a2:	00 00                	add    %al,(%eax)
    86a4:	00 00                	add    %al,(%eax)
    86a6:	00 00                	add    %al,(%eax)
    86a8:	00 00                	add    %al,(%eax)
    86aa:	00 00                	add    %al,(%eax)
    86ac:	00 00                	add    %al,(%eax)
    86ae:	00 00                	add    %al,(%eax)
    86b0:	00 00                	add    %al,(%eax)
    86b2:	00 00                	add    %al,(%eax)
    86b4:	00 00                	add    %al,(%eax)
    86b6:	00 00                	add    %al,(%eax)
    86b8:	00 00                	add    %al,(%eax)
    86ba:	00 00                	add    %al,(%eax)
    86bc:	00 00                	add    %al,(%eax)
    86be:	00 00                	add    %al,(%eax)
    86c0:	00 00                	add    %al,(%eax)
    86c2:	00 00                	add    %al,(%eax)
    86c4:	00 00                	add    %al,(%eax)
    86c6:	00 00                	add    %al,(%eax)
    86c8:	00 00                	add    %al,(%eax)
    86ca:	00 00                	add    %al,(%eax)
    86cc:	00 00                	add    %al,(%eax)
    86ce:	00 00                	add    %al,(%eax)
    86d0:	00 00                	add    %al,(%eax)
    86d2:	00 00                	add    %al,(%eax)
    86d4:	00 00                	add    %al,(%eax)
    86d6:	00 00                	add    %al,(%eax)
    86d8:	00 00                	add    %al,(%eax)
    86da:	00 00                	add    %al,(%eax)
    86dc:	00 00                	add    %al,(%eax)
    86de:	00 00                	add    %al,(%eax)
    86e0:	00 00                	add    %al,(%eax)
    86e2:	00 00                	add    %al,(%eax)
    86e4:	00 00                	add    %al,(%eax)
    86e6:	00 00                	add    %al,(%eax)
    86e8:	00 00                	add    %al,(%eax)
    86ea:	00 00                	add    %al,(%eax)
    86ec:	00 00                	add    %al,(%eax)
    86ee:	00 00                	add    %al,(%eax)
    86f0:	00 00                	add    %al,(%eax)
    86f2:	00 00                	add    %al,(%eax)
    86f4:	00 00                	add    %al,(%eax)
    86f6:	00 00                	add    %al,(%eax)
    86f8:	00 00                	add    %al,(%eax)
    86fa:	00 00                	add    %al,(%eax)
    86fc:	00 00                	add    %al,(%eax)
    86fe:	00 00                	add    %al,(%eax)
    8700:	00 00                	add    %al,(%eax)
    8702:	00 00                	add    %al,(%eax)
    8704:	00 00                	add    %al,(%eax)
    8706:	00 00                	add    %al,(%eax)
    8708:	00 00                	add    %al,(%eax)
    870a:	00 00                	add    %al,(%eax)
    870c:	00 00                	add    %al,(%eax)
    870e:	00 00                	add    %al,(%eax)
    8710:	00 00                	add    %al,(%eax)
    8712:	00 00                	add    %al,(%eax)
    8714:	00 00                	add    %al,(%eax)
    8716:	00 00                	add    %al,(%eax)
    8718:	00 00                	add    %al,(%eax)
    871a:	00 00                	add    %al,(%eax)
    871c:	00 00                	add    %al,(%eax)
    871e:	00 00                	add    %al,(%eax)
    8720:	00 00                	add    %al,(%eax)
    8722:	00 00                	add    %al,(%eax)
    8724:	00 00                	add    %al,(%eax)
    8726:	00 00                	add    %al,(%eax)
    8728:	00 00                	add    %al,(%eax)
    872a:	00 00                	add    %al,(%eax)
    872c:	00 00                	add    %al,(%eax)
    872e:	00 00                	add    %al,(%eax)
    8730:	00 00                	add    %al,(%eax)
    8732:	00 00                	add    %al,(%eax)
    8734:	00 00                	add    %al,(%eax)
    8736:	00 00                	add    %al,(%eax)
    8738:	00 00                	add    %al,(%eax)
    873a:	00 00                	add    %al,(%eax)
    873c:	00 00                	add    %al,(%eax)
    873e:	00 00                	add    %al,(%eax)
    8740:	00 00                	add    %al,(%eax)
    8742:	00 00                	add    %al,(%eax)
    8744:	00 00                	add    %al,(%eax)
    8746:	00 00                	add    %al,(%eax)
    8748:	00 00                	add    %al,(%eax)
    874a:	00 00                	add    %al,(%eax)
    874c:	00 00                	add    %al,(%eax)
    874e:	00 00                	add    %al,(%eax)
    8750:	00 00                	add    %al,(%eax)
    8752:	00 00                	add    %al,(%eax)
    8754:	00 00                	add    %al,(%eax)
    8756:	00 00                	add    %al,(%eax)
    8758:	00 00                	add    %al,(%eax)
    875a:	00 00                	add    %al,(%eax)
    875c:	00 00                	add    %al,(%eax)
    875e:	00 00                	add    %al,(%eax)
    8760:	00 00                	add    %al,(%eax)
    8762:	00 00                	add    %al,(%eax)
    8764:	00 00                	add    %al,(%eax)
    8766:	00 00                	add    %al,(%eax)
    8768:	00 00                	add    %al,(%eax)
    876a:	00 00                	add    %al,(%eax)
    876c:	00 00                	add    %al,(%eax)
    876e:	00 00                	add    %al,(%eax)
    8770:	00 00                	add    %al,(%eax)
    8772:	00 00                	add    %al,(%eax)
    8774:	00 00                	add    %al,(%eax)
    8776:	00 00                	add    %al,(%eax)
    8778:	00 00                	add    %al,(%eax)
    877a:	00 00                	add    %al,(%eax)
    877c:	00 00                	add    %al,(%eax)
    877e:	00 00                	add    %al,(%eax)
    8780:	00 00                	add    %al,(%eax)
    8782:	00 00                	add    %al,(%eax)
    8784:	00 00                	add    %al,(%eax)
    8786:	00 00                	add    %al,(%eax)
    8788:	00 00                	add    %al,(%eax)
    878a:	00 00                	add    %al,(%eax)
    878c:	00 00                	add    %al,(%eax)
    878e:	00 00                	add    %al,(%eax)
    8790:	00 00                	add    %al,(%eax)
    8792:	00 00                	add    %al,(%eax)
    8794:	00 00                	add    %al,(%eax)
    8796:	00 00                	add    %al,(%eax)
    8798:	00 00                	add    %al,(%eax)
    879a:	00 00                	add    %al,(%eax)
    879c:	00 00                	add    %al,(%eax)
    879e:	00 00                	add    %al,(%eax)
    87a0:	00 00                	add    %al,(%eax)
    87a2:	00 00                	add    %al,(%eax)
    87a4:	00 00                	add    %al,(%eax)
    87a6:	00 00                	add    %al,(%eax)
    87a8:	00 00                	add    %al,(%eax)
    87aa:	00 00                	add    %al,(%eax)
    87ac:	00 00                	add    %al,(%eax)
    87ae:	00 00                	add    %al,(%eax)
    87b0:	00 00                	add    %al,(%eax)
    87b2:	00 00                	add    %al,(%eax)
    87b4:	00 00                	add    %al,(%eax)
    87b6:	00 00                	add    %al,(%eax)
    87b8:	00 00                	add    %al,(%eax)
    87ba:	00 00                	add    %al,(%eax)
    87bc:	00 00                	add    %al,(%eax)
    87be:	00 00                	add    %al,(%eax)
    87c0:	00 00                	add    %al,(%eax)
    87c2:	00 00                	add    %al,(%eax)
    87c4:	00 00                	add    %al,(%eax)
    87c6:	00 00                	add    %al,(%eax)
    87c8:	00 00                	add    %al,(%eax)
    87ca:	00 00                	add    %al,(%eax)
    87cc:	00 00                	add    %al,(%eax)
    87ce:	00 00                	add    %al,(%eax)
    87d0:	00 00                	add    %al,(%eax)
    87d2:	00 00                	add    %al,(%eax)
    87d4:	00 00                	add    %al,(%eax)
    87d6:	00 00                	add    %al,(%eax)
    87d8:	00 00                	add    %al,(%eax)
    87da:	00 00                	add    %al,(%eax)
    87dc:	00 00                	add    %al,(%eax)
    87de:	00 00                	add    %al,(%eax)
    87e0:	00 00                	add    %al,(%eax)
    87e2:	00 00                	add    %al,(%eax)
    87e4:	00 00                	add    %al,(%eax)
    87e6:	00 00                	add    %al,(%eax)
    87e8:	00 00                	add    %al,(%eax)
    87ea:	00 00                	add    %al,(%eax)
    87ec:	00 00                	add    %al,(%eax)
    87ee:	00 00                	add    %al,(%eax)
    87f0:	00 00                	add    %al,(%eax)
    87f2:	00 00                	add    %al,(%eax)
    87f4:	00 00                	add    %al,(%eax)
    87f6:	00 00                	add    %al,(%eax)
    87f8:	00 00                	add    %al,(%eax)
    87fa:	00 00                	add    %al,(%eax)
    87fc:	00 00                	add    %al,(%eax)
    87fe:	00 00                	add    %al,(%eax)
    8800:	00 00                	add    %al,(%eax)
    8802:	00 00                	add    %al,(%eax)
    8804:	00 00                	add    %al,(%eax)
    8806:	00 00                	add    %al,(%eax)
    8808:	00 00                	add    %al,(%eax)
    880a:	00 00                	add    %al,(%eax)
    880c:	00 00                	add    %al,(%eax)
    880e:	00 00                	add    %al,(%eax)
    8810:	00 00                	add    %al,(%eax)
    8812:	00 00                	add    %al,(%eax)
    8814:	00 00                	add    %al,(%eax)
    8816:	00 00                	add    %al,(%eax)
    8818:	00 00                	add    %al,(%eax)
    881a:	00 00                	add    %al,(%eax)
    881c:	00 00                	add    %al,(%eax)
    881e:	00 00                	add    %al,(%eax)
    8820:	00 00                	add    %al,(%eax)
    8822:	00 00                	add    %al,(%eax)
    8824:	00 00                	add    %al,(%eax)
    8826:	00 00                	add    %al,(%eax)
    8828:	00 00                	add    %al,(%eax)
    882a:	00 00                	add    %al,(%eax)
    882c:	00 00                	add    %al,(%eax)
    882e:	00 00                	add    %al,(%eax)
    8830:	00 00                	add    %al,(%eax)
    8832:	00 00                	add    %al,(%eax)
    8834:	00 00                	add    %al,(%eax)
    8836:	00 00                	add    %al,(%eax)
    8838:	00 00                	add    %al,(%eax)
    883a:	00 00                	add    %al,(%eax)
    883c:	00 00                	add    %al,(%eax)
    883e:	00 00                	add    %al,(%eax)
    8840:	00 00                	add    %al,(%eax)
    8842:	00 00                	add    %al,(%eax)
    8844:	00 00                	add    %al,(%eax)
    8846:	00 00                	add    %al,(%eax)
    8848:	00 00                	add    %al,(%eax)
    884a:	00 00                	add    %al,(%eax)
    884c:	00 00                	add    %al,(%eax)
    884e:	00 00                	add    %al,(%eax)
    8850:	00 00                	add    %al,(%eax)
    8852:	00 00                	add    %al,(%eax)
    8854:	00 00                	add    %al,(%eax)
    8856:	00 00                	add    %al,(%eax)
    8858:	00 00                	add    %al,(%eax)
    885a:	00 00                	add    %al,(%eax)
    885c:	00 00                	add    %al,(%eax)
    885e:	00 00                	add    %al,(%eax)
    8860:	00 00                	add    %al,(%eax)
    8862:	00 00                	add    %al,(%eax)
    8864:	00 00                	add    %al,(%eax)
    8866:	00 00                	add    %al,(%eax)
    8868:	00 00                	add    %al,(%eax)
    886a:	00 00                	add    %al,(%eax)
    886c:	00 00                	add    %al,(%eax)
    886e:	00 00                	add    %al,(%eax)
    8870:	00 00                	add    %al,(%eax)
    8872:	00 00                	add    %al,(%eax)
    8874:	00 00                	add    %al,(%eax)
    8876:	00 00                	add    %al,(%eax)
    8878:	00 00                	add    %al,(%eax)
    887a:	00 00                	add    %al,(%eax)
    887c:	00 00                	add    %al,(%eax)
    887e:	00 00                	add    %al,(%eax)
    8880:	00 00                	add    %al,(%eax)
    8882:	00 00                	add    %al,(%eax)
    8884:	00 00                	add    %al,(%eax)
    8886:	00 00                	add    %al,(%eax)
    8888:	00 00                	add    %al,(%eax)
    888a:	00 00                	add    %al,(%eax)
    888c:	00 00                	add    %al,(%eax)
    888e:	00 00                	add    %al,(%eax)
    8890:	00 00                	add    %al,(%eax)
    8892:	00 00                	add    %al,(%eax)
    8894:	00 00                	add    %al,(%eax)
    8896:	00 00                	add    %al,(%eax)
    8898:	00 00                	add    %al,(%eax)
    889a:	00 00                	add    %al,(%eax)
    889c:	00 00                	add    %al,(%eax)
    889e:	00 00                	add    %al,(%eax)
    88a0:	00 00                	add    %al,(%eax)
    88a2:	00 00                	add    %al,(%eax)
    88a4:	00 00                	add    %al,(%eax)
    88a6:	00 00                	add    %al,(%eax)
    88a8:	00 00                	add    %al,(%eax)
    88aa:	00 00                	add    %al,(%eax)
    88ac:	00 00                	add    %al,(%eax)
    88ae:	00 00                	add    %al,(%eax)
    88b0:	00 00                	add    %al,(%eax)
    88b2:	00 00                	add    %al,(%eax)
    88b4:	00 00                	add    %al,(%eax)
    88b6:	00 00                	add    %al,(%eax)
    88b8:	00 00                	add    %al,(%eax)
    88ba:	00 00                	add    %al,(%eax)
    88bc:	00 00                	add    %al,(%eax)
    88be:	00 00                	add    %al,(%eax)
    88c0:	00 00                	add    %al,(%eax)
    88c2:	00 00                	add    %al,(%eax)
    88c4:	00 00                	add    %al,(%eax)
    88c6:	00 00                	add    %al,(%eax)
    88c8:	00 00                	add    %al,(%eax)
    88ca:	00 00                	add    %al,(%eax)
    88cc:	00 00                	add    %al,(%eax)
    88ce:	00 00                	add    %al,(%eax)
    88d0:	00 00                	add    %al,(%eax)
    88d2:	00 00                	add    %al,(%eax)
    88d4:	00 00                	add    %al,(%eax)
    88d6:	00 00                	add    %al,(%eax)
    88d8:	00 00                	add    %al,(%eax)
    88da:	00 00                	add    %al,(%eax)
    88dc:	00 00                	add    %al,(%eax)
    88de:	00 00                	add    %al,(%eax)
    88e0:	00 00                	add    %al,(%eax)
    88e2:	00 00                	add    %al,(%eax)
    88e4:	00 00                	add    %al,(%eax)
    88e6:	00 00                	add    %al,(%eax)
    88e8:	00 00                	add    %al,(%eax)
    88ea:	00 00                	add    %al,(%eax)
    88ec:	00 00                	add    %al,(%eax)
    88ee:	00 00                	add    %al,(%eax)
    88f0:	00 00                	add    %al,(%eax)
    88f2:	00 00                	add    %al,(%eax)
    88f4:	00 00                	add    %al,(%eax)
    88f6:	00 00                	add    %al,(%eax)
    88f8:	00 00                	add    %al,(%eax)
    88fa:	00 00                	add    %al,(%eax)
    88fc:	00 00                	add    %al,(%eax)
    88fe:	00 00                	add    %al,(%eax)
    8900:	00 00                	add    %al,(%eax)
    8902:	00 00                	add    %al,(%eax)
    8904:	00 00                	add    %al,(%eax)
    8906:	00 00                	add    %al,(%eax)
    8908:	00 00                	add    %al,(%eax)
    890a:	00 00                	add    %al,(%eax)
    890c:	00 00                	add    %al,(%eax)
    890e:	00 00                	add    %al,(%eax)
    8910:	00 00                	add    %al,(%eax)
    8912:	00 00                	add    %al,(%eax)
    8914:	00 00                	add    %al,(%eax)
    8916:	00 00                	add    %al,(%eax)
    8918:	00 00                	add    %al,(%eax)
    891a:	00 00                	add    %al,(%eax)
    891c:	00 00                	add    %al,(%eax)
    891e:	00 00                	add    %al,(%eax)
    8920:	00 00                	add    %al,(%eax)
    8922:	00 00                	add    %al,(%eax)
    8924:	00 00                	add    %al,(%eax)
    8926:	00 00                	add    %al,(%eax)
    8928:	00 00                	add    %al,(%eax)
    892a:	00 00                	add    %al,(%eax)
    892c:	00 00                	add    %al,(%eax)
    892e:	00 00                	add    %al,(%eax)
    8930:	00 00                	add    %al,(%eax)
    8932:	00 00                	add    %al,(%eax)
    8934:	00 00                	add    %al,(%eax)
    8936:	00 00                	add    %al,(%eax)
    8938:	00 00                	add    %al,(%eax)
    893a:	00 00                	add    %al,(%eax)
    893c:	00 00                	add    %al,(%eax)
    893e:	00 00                	add    %al,(%eax)
    8940:	00 00                	add    %al,(%eax)
    8942:	00 00                	add    %al,(%eax)
    8944:	00 00                	add    %al,(%eax)
    8946:	00 00                	add    %al,(%eax)
    8948:	00 00                	add    %al,(%eax)
    894a:	00 00                	add    %al,(%eax)
    894c:	00 00                	add    %al,(%eax)
    894e:	00 00                	add    %al,(%eax)
    8950:	00 00                	add    %al,(%eax)
    8952:	00 00                	add    %al,(%eax)
    8954:	00 00                	add    %al,(%eax)
    8956:	00 00                	add    %al,(%eax)
    8958:	00 00                	add    %al,(%eax)
    895a:	00 00                	add    %al,(%eax)
    895c:	00 00                	add    %al,(%eax)
    895e:	00 00                	add    %al,(%eax)
    8960:	00 00                	add    %al,(%eax)
    8962:	00 00                	add    %al,(%eax)
    8964:	00 00                	add    %al,(%eax)
    8966:	00 00                	add    %al,(%eax)
    8968:	00 00                	add    %al,(%eax)
    896a:	00 00                	add    %al,(%eax)
    896c:	00 00                	add    %al,(%eax)
    896e:	00 00                	add    %al,(%eax)
    8970:	00 00                	add    %al,(%eax)
    8972:	00 00                	add    %al,(%eax)
    8974:	00 00                	add    %al,(%eax)
    8976:	00 00                	add    %al,(%eax)
    8978:	00 00                	add    %al,(%eax)
    897a:	00 00                	add    %al,(%eax)
    897c:	00 00                	add    %al,(%eax)
    897e:	00 00                	add    %al,(%eax)
    8980:	00 00                	add    %al,(%eax)
    8982:	00 00                	add    %al,(%eax)
    8984:	00 00                	add    %al,(%eax)
    8986:	00 00                	add    %al,(%eax)
    8988:	00 00                	add    %al,(%eax)
    898a:	00 00                	add    %al,(%eax)
    898c:	00 00                	add    %al,(%eax)
    898e:	00 00                	add    %al,(%eax)
    8990:	00 00                	add    %al,(%eax)
    8992:	00 00                	add    %al,(%eax)
    8994:	00 00                	add    %al,(%eax)
    8996:	00 00                	add    %al,(%eax)
    8998:	00 00                	add    %al,(%eax)
    899a:	00 00                	add    %al,(%eax)
    899c:	00 00                	add    %al,(%eax)
    899e:	00 00                	add    %al,(%eax)
    89a0:	00 00                	add    %al,(%eax)
    89a2:	00 00                	add    %al,(%eax)
    89a4:	00 00                	add    %al,(%eax)
    89a6:	00 00                	add    %al,(%eax)
    89a8:	00 00                	add    %al,(%eax)
    89aa:	00 00                	add    %al,(%eax)
    89ac:	00 00                	add    %al,(%eax)
    89ae:	00 00                	add    %al,(%eax)
    89b0:	00 00                	add    %al,(%eax)
    89b2:	00 00                	add    %al,(%eax)
    89b4:	00 00                	add    %al,(%eax)
    89b6:	00 00                	add    %al,(%eax)
    89b8:	00 00                	add    %al,(%eax)
    89ba:	00 00                	add    %al,(%eax)
    89bc:	00 00                	add    %al,(%eax)
    89be:	00 00                	add    %al,(%eax)
    89c0:	00 00                	add    %al,(%eax)
    89c2:	00 00                	add    %al,(%eax)
    89c4:	00 00                	add    %al,(%eax)
    89c6:	00 00                	add    %al,(%eax)
    89c8:	00 00                	add    %al,(%eax)
    89ca:	00 00                	add    %al,(%eax)
    89cc:	00 00                	add    %al,(%eax)
    89ce:	00 00                	add    %al,(%eax)
    89d0:	00 00                	add    %al,(%eax)
    89d2:	00 00                	add    %al,(%eax)
    89d4:	00 00                	add    %al,(%eax)
    89d6:	00 00                	add    %al,(%eax)
    89d8:	00 00                	add    %al,(%eax)
    89da:	00 00                	add    %al,(%eax)
    89dc:	00 00                	add    %al,(%eax)
    89de:	00 00                	add    %al,(%eax)
    89e0:	00 00                	add    %al,(%eax)
    89e2:	00 00                	add    %al,(%eax)
    89e4:	00 00                	add    %al,(%eax)
    89e6:	00 00                	add    %al,(%eax)
    89e8:	00 00                	add    %al,(%eax)
    89ea:	00 00                	add    %al,(%eax)
    89ec:	00 00                	add    %al,(%eax)
    89ee:	00 00                	add    %al,(%eax)
    89f0:	00 00                	add    %al,(%eax)
    89f2:	00 00                	add    %al,(%eax)
    89f4:	00 00                	add    %al,(%eax)
    89f6:	00 00                	add    %al,(%eax)
    89f8:	00 00                	add    %al,(%eax)
    89fa:	00 00                	add    %al,(%eax)
    89fc:	00 00                	add    %al,(%eax)
    89fe:	00 00                	add    %al,(%eax)
    8a00:	00 00                	add    %al,(%eax)
    8a02:	00 00                	add    %al,(%eax)
    8a04:	00 00                	add    %al,(%eax)
    8a06:	00 00                	add    %al,(%eax)
    8a08:	00 00                	add    %al,(%eax)
    8a0a:	00 00                	add    %al,(%eax)
    8a0c:	00 00                	add    %al,(%eax)
    8a0e:	00 00                	add    %al,(%eax)
    8a10:	00 00                	add    %al,(%eax)
    8a12:	00 00                	add    %al,(%eax)
    8a14:	00 00                	add    %al,(%eax)
    8a16:	00 00                	add    %al,(%eax)
    8a18:	00 00                	add    %al,(%eax)
    8a1a:	00 00                	add    %al,(%eax)
    8a1c:	00 00                	add    %al,(%eax)
    8a1e:	00 00                	add    %al,(%eax)
    8a20:	00 00                	add    %al,(%eax)
    8a22:	00 00                	add    %al,(%eax)
    8a24:	00 00                	add    %al,(%eax)
    8a26:	00 00                	add    %al,(%eax)
    8a28:	00 00                	add    %al,(%eax)
    8a2a:	00 00                	add    %al,(%eax)
    8a2c:	00 00                	add    %al,(%eax)
    8a2e:	00 00                	add    %al,(%eax)
    8a30:	00 00                	add    %al,(%eax)
    8a32:	00 00                	add    %al,(%eax)
    8a34:	00 00                	add    %al,(%eax)
    8a36:	00 00                	add    %al,(%eax)
    8a38:	00 00                	add    %al,(%eax)
    8a3a:	00 00                	add    %al,(%eax)
    8a3c:	00 00                	add    %al,(%eax)
    8a3e:	00 00                	add    %al,(%eax)
    8a40:	00 00                	add    %al,(%eax)
    8a42:	00 00                	add    %al,(%eax)
    8a44:	00 00                	add    %al,(%eax)
    8a46:	00 00                	add    %al,(%eax)
    8a48:	00 00                	add    %al,(%eax)
    8a4a:	00 00                	add    %al,(%eax)
    8a4c:	00 00                	add    %al,(%eax)
    8a4e:	00 00                	add    %al,(%eax)
    8a50:	00 00                	add    %al,(%eax)
    8a52:	00 00                	add    %al,(%eax)
    8a54:	00 00                	add    %al,(%eax)
    8a56:	00 00                	add    %al,(%eax)
    8a58:	00 00                	add    %al,(%eax)
    8a5a:	00 00                	add    %al,(%eax)
    8a5c:	00 00                	add    %al,(%eax)
    8a5e:	00 00                	add    %al,(%eax)
    8a60:	00 00                	add    %al,(%eax)
    8a62:	00 00                	add    %al,(%eax)
    8a64:	00 00                	add    %al,(%eax)
    8a66:	00 00                	add    %al,(%eax)
    8a68:	00 00                	add    %al,(%eax)
    8a6a:	00 00                	add    %al,(%eax)
    8a6c:	00 00                	add    %al,(%eax)
    8a6e:	00 00                	add    %al,(%eax)
    8a70:	00 00                	add    %al,(%eax)
    8a72:	00 00                	add    %al,(%eax)
    8a74:	00 00                	add    %al,(%eax)
    8a76:	00 00                	add    %al,(%eax)
    8a78:	00 00                	add    %al,(%eax)
    8a7a:	00 00                	add    %al,(%eax)
    8a7c:	00 00                	add    %al,(%eax)
    8a7e:	00 00                	add    %al,(%eax)
    8a80:	00 00                	add    %al,(%eax)
    8a82:	00 00                	add    %al,(%eax)
    8a84:	00 00                	add    %al,(%eax)
    8a86:	00 00                	add    %al,(%eax)
    8a88:	00 00                	add    %al,(%eax)
    8a8a:	00 00                	add    %al,(%eax)
    8a8c:	00 00                	add    %al,(%eax)
    8a8e:	00 00                	add    %al,(%eax)
    8a90:	00 00                	add    %al,(%eax)
    8a92:	00 00                	add    %al,(%eax)
    8a94:	00 00                	add    %al,(%eax)
    8a96:	00 00                	add    %al,(%eax)
    8a98:	00 00                	add    %al,(%eax)
    8a9a:	00 00                	add    %al,(%eax)
    8a9c:	00 00                	add    %al,(%eax)
    8a9e:	00 00                	add    %al,(%eax)
    8aa0:	00 00                	add    %al,(%eax)
    8aa2:	00 00                	add    %al,(%eax)
    8aa4:	00 00                	add    %al,(%eax)
    8aa6:	00 00                	add    %al,(%eax)
    8aa8:	00 00                	add    %al,(%eax)
    8aaa:	00 00                	add    %al,(%eax)
    8aac:	00 00                	add    %al,(%eax)
    8aae:	00 00                	add    %al,(%eax)
    8ab0:	00 00                	add    %al,(%eax)
    8ab2:	00 00                	add    %al,(%eax)
    8ab4:	00 00                	add    %al,(%eax)
    8ab6:	00 00                	add    %al,(%eax)
    8ab8:	00 00                	add    %al,(%eax)
    8aba:	00 00                	add    %al,(%eax)
    8abc:	00 00                	add    %al,(%eax)
    8abe:	00 00                	add    %al,(%eax)
    8ac0:	00 00                	add    %al,(%eax)
    8ac2:	00 00                	add    %al,(%eax)
    8ac4:	00 00                	add    %al,(%eax)
    8ac6:	00 00                	add    %al,(%eax)
    8ac8:	00 00                	add    %al,(%eax)
    8aca:	00 00                	add    %al,(%eax)
    8acc:	00 00                	add    %al,(%eax)
    8ace:	00 00                	add    %al,(%eax)
    8ad0:	00 00                	add    %al,(%eax)
    8ad2:	00 00                	add    %al,(%eax)
    8ad4:	00 00                	add    %al,(%eax)
    8ad6:	00 00                	add    %al,(%eax)
    8ad8:	00 00                	add    %al,(%eax)
    8ada:	00 00                	add    %al,(%eax)
    8adc:	00 00                	add    %al,(%eax)
    8ade:	00 00                	add    %al,(%eax)
    8ae0:	00 00                	add    %al,(%eax)
    8ae2:	00 00                	add    %al,(%eax)
    8ae4:	00 00                	add    %al,(%eax)
    8ae6:	00 00                	add    %al,(%eax)
    8ae8:	00 00                	add    %al,(%eax)
    8aea:	00 00                	add    %al,(%eax)
    8aec:	00 00                	add    %al,(%eax)
    8aee:	00 00                	add    %al,(%eax)
    8af0:	00 00                	add    %al,(%eax)
    8af2:	00 00                	add    %al,(%eax)
    8af4:	00 00                	add    %al,(%eax)
    8af6:	00 00                	add    %al,(%eax)
    8af8:	00 00                	add    %al,(%eax)
    8afa:	00 00                	add    %al,(%eax)
    8afc:	00 00                	add    %al,(%eax)
    8afe:	00 00                	add    %al,(%eax)
    8b00:	00 00                	add    %al,(%eax)
    8b02:	00 00                	add    %al,(%eax)
    8b04:	00 00                	add    %al,(%eax)
    8b06:	00 00                	add    %al,(%eax)
    8b08:	00 00                	add    %al,(%eax)
    8b0a:	00 00                	add    %al,(%eax)
    8b0c:	00 00                	add    %al,(%eax)
    8b0e:	00 00                	add    %al,(%eax)
    8b10:	00 00                	add    %al,(%eax)
    8b12:	00 00                	add    %al,(%eax)
    8b14:	00 00                	add    %al,(%eax)
    8b16:	00 00                	add    %al,(%eax)
    8b18:	00 00                	add    %al,(%eax)
    8b1a:	00 00                	add    %al,(%eax)
    8b1c:	00 00                	add    %al,(%eax)
    8b1e:	00 00                	add    %al,(%eax)
    8b20:	00 00                	add    %al,(%eax)
    8b22:	00 00                	add    %al,(%eax)
    8b24:	00 00                	add    %al,(%eax)
    8b26:	00 00                	add    %al,(%eax)
    8b28:	00 00                	add    %al,(%eax)

00008b2a <putc>:
 */
volatile char *video = (volatile char*) 0xB8000;

void
putc (int l, int color, char ch)
{
    8b2a:	55                   	push   %ebp
    8b2b:	e8 9b 02 00 00       	call   8dcb <__x86.get_pc_thunk.dx>
    8b30:	81 c2 9c 07 00 00    	add    $0x79c,%edx
    8b36:	89 e5                	mov    %esp,%ebp
    8b38:	8b 45 08             	mov    0x8(%ebp),%eax
	volatile char * p = video + l * 2;
    8b3b:	01 c0                	add    %eax,%eax
    8b3d:	03 82 34 00 00 00    	add    0x34(%edx),%eax
	* p = ch;
    8b43:	8b 55 10             	mov    0x10(%ebp),%edx
    8b46:	88 10                	mov    %dl,(%eax)
	* (p + 1) = color;
    8b48:	8b 55 0c             	mov    0xc(%ebp),%edx
    8b4b:	88 50 01             	mov    %dl,0x1(%eax)
}
    8b4e:	5d                   	pop    %ebp
    8b4f:	c3                   	ret    

00008b50 <puts>:


int
puts (int r, int c, int color, const char *string)
{
    8b50:	55                   	push   %ebp
    8b51:	89 e5                	mov    %esp,%ebp
    8b53:	56                   	push   %esi
    8b54:	53                   	push   %ebx
	int l = r * 80 + c;
    8b55:	6b 45 08 50          	imul   $0x50,0x8(%ebp),%eax
	while (*string != 0)
    8b59:	8b 4d 14             	mov    0x14(%ebp),%ecx
	int l = r * 80 + c;
    8b5c:	03 45 0c             	add    0xc(%ebp),%eax
	while (*string != 0)
    8b5f:	29 c1                	sub    %eax,%ecx
    8b61:	89 ce                	mov    %ecx,%esi
    8b63:	0f be 14 06          	movsbl (%esi,%eax,1),%edx
    8b67:	84 d2                	test   %dl,%dl
    8b69:	74 14                	je     8b7f <puts+0x2f>
	{
		putc (l++, color, *string++);
    8b6b:	52                   	push   %edx
    8b6c:	8d 58 01             	lea    0x1(%eax),%ebx
    8b6f:	ff 75 10             	pushl  0x10(%ebp)
    8b72:	50                   	push   %eax
    8b73:	e8 b2 ff ff ff       	call   8b2a <putc>
    8b78:	83 c4 0c             	add    $0xc,%esp
    8b7b:	89 d8                	mov    %ebx,%eax
    8b7d:	eb e4                	jmp    8b63 <puts+0x13>
	}
	return l;
}
    8b7f:	8d 65 f8             	lea    -0x8(%ebp),%esp
    8b82:	5b                   	pop    %ebx
    8b83:	5e                   	pop    %esi
    8b84:	5d                   	pop    %ebp
    8b85:	c3                   	ret    

00008b86 <putline>:
char * blank =
"                                                                                ";

void
putline (char * s)
{
    8b86:	e8 3c 02 00 00       	call   8dc7 <__x86.get_pc_thunk.ax>
    8b8b:	05 41 07 00 00       	add    $0x741,%eax
    8b90:	55                   	push   %ebp
	puts (row = (row >= CRT_ROWS) ? 0 : row + 1, 0, VGA_CLR_BLACK, blank);
    8b91:	8b 90 dc 00 00 00    	mov    0xdc(%eax),%edx
    8b97:	8b 88 38 00 00 00    	mov    0x38(%eax),%ecx
{
    8b9d:	89 e5                	mov    %esp,%ebp
    8b9f:	53                   	push   %ebx
	puts (row = (row >= CRT_ROWS) ? 0 : row + 1, 0, VGA_CLR_BLACK, blank);
    8ba0:	8d 5a 01             	lea    0x1(%edx),%ebx
    8ba3:	83 fa 18             	cmp    $0x18,%edx
    8ba6:	ba 00 00 00 00       	mov    $0x0,%edx
    8bab:	51                   	push   %ecx
    8bac:	6a 00                	push   $0x0
    8bae:	0f 4f da             	cmovg  %edx,%ebx
    8bb1:	6a 00                	push   $0x0
    8bb3:	53                   	push   %ebx
    8bb4:	89 98 dc 00 00 00    	mov    %ebx,0xdc(%eax)
    8bba:	e8 91 ff ff ff       	call   8b50 <puts>
	puts (row, 0, VGA_CLR_WHITE, s);
    8bbf:	ff 75 08             	pushl  0x8(%ebp)
    8bc2:	6a 0f                	push   $0xf
    8bc4:	6a 00                	push   $0x0
    8bc6:	53                   	push   %ebx
    8bc7:	e8 84 ff ff ff       	call   8b50 <puts>
}
    8bcc:	83 c4 20             	add    $0x20,%esp
    8bcf:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    8bd2:	c9                   	leave  
    8bd3:	c3                   	ret    

00008bd4 <roll>:

void
roll (int r)
{
    8bd4:	55                   	push   %ebp
    8bd5:	e8 ed 01 00 00       	call   8dc7 <__x86.get_pc_thunk.ax>
    8bda:	05 f2 06 00 00       	add    $0x6f2,%eax
    8bdf:	89 e5                	mov    %esp,%ebp
	row = r;
    8be1:	8b 55 08             	mov    0x8(%ebp),%edx
}
    8be4:	5d                   	pop    %ebp
	row = r;
    8be5:	89 90 dc 00 00 00    	mov    %edx,0xdc(%eax)
}
    8beb:	c3                   	ret    

00008bec <panic>:

void
panic (char * m)
{
    8bec:	55                   	push   %ebp
    8bed:	89 e5                	mov    %esp,%ebp
	puts (0, 0, VGA_CLR_RED, m);
    8bef:	ff 75 08             	pushl  0x8(%ebp)
    8bf2:	6a 04                	push   $0x4
    8bf4:	6a 00                	push   $0x0
    8bf6:	6a 00                	push   $0x0
    8bf8:	e8 53 ff ff ff       	call   8b50 <puts>
    8bfd:	83 c4 10             	add    $0x10,%esp
	while (1)
	{
		asm volatile("hlt");
    8c00:	f4                   	hlt    
    8c01:	eb fd                	jmp    8c00 <panic+0x14>

00008c03 <strlen>:
 * string
 */

int
strlen (const char *s)
{
    8c03:	55                   	push   %ebp
	int n;

	for (n = 0; *s != '\0'; s++)
    8c04:	31 c0                	xor    %eax,%eax
{
    8c06:	89 e5                	mov    %esp,%ebp
    8c08:	8b 55 08             	mov    0x8(%ebp),%edx
	for (n = 0; *s != '\0'; s++)
    8c0b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    8c0f:	74 03                	je     8c14 <strlen+0x11>
		n++;
    8c11:	40                   	inc    %eax
    8c12:	eb f7                	jmp    8c0b <strlen+0x8>
	return n;
}
    8c14:	5d                   	pop    %ebp
    8c15:	c3                   	ret    

00008c16 <reverse>:

/* reverse:  reverse string s in place */
void
reverse (char s[])
{
    8c16:	55                   	push   %ebp
    8c17:	89 e5                	mov    %esp,%ebp
    8c19:	56                   	push   %esi
    8c1a:	53                   	push   %ebx
    8c1b:	8b 75 08             	mov    0x8(%ebp),%esi
	int i, j;
	char c;

	for (i = 0, j = strlen (s) - 1; i < j; i++, j--)
    8c1e:	56                   	push   %esi
    8c1f:	e8 df ff ff ff       	call   8c03 <strlen>
    8c24:	5a                   	pop    %edx
    8c25:	48                   	dec    %eax
    8c26:	31 d2                	xor    %edx,%edx
    8c28:	39 c2                	cmp    %eax,%edx
    8c2a:	7d 10                	jge    8c3c <reverse+0x26>
	{
		c = s[i];
    8c2c:	8a 1c 16             	mov    (%esi,%edx,1),%bl
		s[i] = s[j];
    8c2f:	8a 0c 06             	mov    (%esi,%eax,1),%cl
    8c32:	88 0c 16             	mov    %cl,(%esi,%edx,1)
		s[j] = c;
    8c35:	88 1c 06             	mov    %bl,(%esi,%eax,1)
	for (i = 0, j = strlen (s) - 1; i < j; i++, j--)
    8c38:	42                   	inc    %edx
    8c39:	48                   	dec    %eax
    8c3a:	eb ec                	jmp    8c28 <reverse+0x12>
	}
}
    8c3c:	8d 65 f8             	lea    -0x8(%ebp),%esp
    8c3f:	5b                   	pop    %ebx
    8c40:	5e                   	pop    %esi
    8c41:	5d                   	pop    %ebp
    8c42:	c3                   	ret    

00008c43 <itox>:

/* itoa:  convert n to characters in s */
void
itox (int n, char s[], int root, char * table)
{
    8c43:	55                   	push   %ebp
    8c44:	89 e5                	mov    %esp,%ebp
    8c46:	57                   	push   %edi
    8c47:	56                   	push   %esi
    8c48:	53                   	push   %ebx
    8c49:	31 f6                	xor    %esi,%esi
    8c4b:	83 ec 08             	sub    $0x8,%esp
    8c4e:	8b 45 08             	mov    0x8(%ebp),%eax
    8c51:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8c54:	8b 7d 14             	mov    0x14(%ebp),%edi
    8c57:	89 45 f0             	mov    %eax,-0x10(%ebp)
    8c5a:	8b 45 10             	mov    0x10(%ebp),%eax
    8c5d:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8c60:	89 45 ec             	mov    %eax,-0x14(%ebp)
    8c63:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8c66:	c1 fa 1f             	sar    $0x1f,%edx
    8c69:	31 d0                	xor    %edx,%eax
    8c6b:	29 d0                	sub    %edx,%eax
	if ((sign = n) < 0) /* record sign */
		n = -n; /* make n positive */
	i = 0;
	do
	{ /* generate digits in reverse order */
		s[i++] = table[n % root]; /* get next digit */
    8c6d:	99                   	cltd   
    8c6e:	8d 4e 01             	lea    0x1(%esi),%ecx
    8c71:	f7 7d ec             	idivl  -0x14(%ebp)
    8c74:	8a 14 17             	mov    (%edi,%edx,1),%dl
	} while ((n /= root) > 0); /* delete it */
    8c77:	85 c0                	test   %eax,%eax
		s[i++] = table[n % root]; /* get next digit */
    8c79:	88 54 0b ff          	mov    %dl,-0x1(%ebx,%ecx,1)
    8c7d:	89 ca                	mov    %ecx,%edx
	} while ((n /= root) > 0); /* delete it */
    8c7f:	7e 04                	jle    8c85 <itox+0x42>
		s[i++] = table[n % root]; /* get next digit */
    8c81:	89 ce                	mov    %ecx,%esi
    8c83:	eb e8                	jmp    8c6d <itox+0x2a>
	if (sign < 0)
    8c85:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    8c89:	79 07                	jns    8c92 <itox+0x4f>
		s[i++] = '-';
    8c8b:	8d 4e 02             	lea    0x2(%esi),%ecx
    8c8e:	c6 04 13 2d          	movb   $0x2d,(%ebx,%edx,1)
	s[i] = '\0';
    8c92:	c6 04 0b 00          	movb   $0x0,(%ebx,%ecx,1)
	reverse (s);
    8c96:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
    8c99:	58                   	pop    %eax
    8c9a:	5a                   	pop    %edx
    8c9b:	5b                   	pop    %ebx
    8c9c:	5e                   	pop    %esi
    8c9d:	5f                   	pop    %edi
    8c9e:	5d                   	pop    %ebp
	reverse (s);
    8c9f:	e9 72 ff ff ff       	jmp    8c16 <reverse>

00008ca4 <itoa>:

void
itoa (int n, char s[])
{
    8ca4:	e8 1e 01 00 00       	call   8dc7 <__x86.get_pc_thunk.ax>
    8ca9:	05 23 06 00 00       	add    $0x623,%eax
    8cae:	55                   	push   %ebp
	static char dec[] = "0123456789";
	itox(n, s, 10, dec);
    8caf:	8d 80 28 00 00 00    	lea    0x28(%eax),%eax
{
    8cb5:	89 e5                	mov    %esp,%ebp
	itox(n, s, 10, dec);
    8cb7:	50                   	push   %eax
    8cb8:	6a 0a                	push   $0xa
    8cba:	ff 75 0c             	pushl  0xc(%ebp)
    8cbd:	ff 75 08             	pushl  0x8(%ebp)
    8cc0:	e8 7e ff ff ff       	call   8c43 <itox>
}
    8cc5:	83 c4 10             	add    $0x10,%esp
    8cc8:	c9                   	leave  
    8cc9:	c3                   	ret    

00008cca <itoh>:


void
itoh (int n, char* s)
{
    8cca:	e8 f8 00 00 00       	call   8dc7 <__x86.get_pc_thunk.ax>
    8ccf:	05 fd 05 00 00       	add    $0x5fd,%eax
    8cd4:	55                   	push   %ebp
	static char hex[] = "0123456789abcdef";
	itox(n, s, 16, hex);
    8cd5:	8d 80 14 00 00 00    	lea    0x14(%eax),%eax
{
    8cdb:	89 e5                	mov    %esp,%ebp
	itox(n, s, 16, hex);
    8cdd:	50                   	push   %eax
    8cde:	6a 10                	push   $0x10
    8ce0:	ff 75 0c             	pushl  0xc(%ebp)
    8ce3:	ff 75 08             	pushl  0x8(%ebp)
    8ce6:	e8 58 ff ff ff       	call   8c43 <itox>
}
    8ceb:	83 c4 10             	add    $0x10,%esp
    8cee:	c9                   	leave  
    8cef:	c3                   	ret    

00008cf0 <puti>:
{
    8cf0:	55                   	push   %ebp
    8cf1:	e8 d1 00 00 00       	call   8dc7 <__x86.get_pc_thunk.ax>
    8cf6:	05 d6 05 00 00       	add    $0x5d6,%eax
    8cfb:	89 e5                	mov    %esp,%ebp
    8cfd:	53                   	push   %ebx
	itoh (i, puti_str);
    8cfe:	8d 98 b4 00 00 00    	lea    0xb4(%eax),%ebx
    8d04:	53                   	push   %ebx
    8d05:	ff 75 08             	pushl  0x8(%ebp)
    8d08:	e8 bd ff ff ff       	call   8cca <itoh>
	putline (puti_str);
    8d0d:	58                   	pop    %eax
    8d0e:	5a                   	pop    %edx
    8d0f:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
    8d12:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    8d15:	c9                   	leave  
	putline (puti_str);
    8d16:	e9 6b fe ff ff       	jmp    8b86 <putline>

00008d1b <readsector>:
		/* do nothing */;
}

void
readsector (void *dst, uint32_t offset)
{
    8d1b:	55                   	push   %ebp

static inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
    8d1c:	ba f7 01 00 00       	mov    $0x1f7,%edx
    8d21:	89 e5                	mov    %esp,%ebp
    8d23:	57                   	push   %edi
    8d24:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    8d27:	ec                   	in     (%dx),%al
	while ((inb (0x1F7) & 0xC0) != 0x40)
    8d28:	83 e0 c0             	and    $0xffffffc0,%eax
    8d2b:	3c 40                	cmp    $0x40,%al
    8d2d:	75 f8                	jne    8d27 <readsector+0xc>
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
    8d2f:	ba f2 01 00 00       	mov    $0x1f2,%edx
    8d34:	b0 01                	mov    $0x1,%al
    8d36:	ee                   	out    %al,(%dx)
    8d37:	ba f3 01 00 00       	mov    $0x1f3,%edx
    8d3c:	88 c8                	mov    %cl,%al
    8d3e:	ee                   	out    %al,(%dx)
	// wait for disk to be ready
	waitdisk ();

	outb (0x1F2, 1);		// count = 1
	outb (0x1F3, offset);
	outb (0x1F4, offset >> 8);
    8d3f:	89 c8                	mov    %ecx,%eax
    8d41:	ba f4 01 00 00       	mov    $0x1f4,%edx
    8d46:	c1 e8 08             	shr    $0x8,%eax
    8d49:	ee                   	out    %al,(%dx)
	outb (0x1F5, offset >> 16);
    8d4a:	89 c8                	mov    %ecx,%eax
    8d4c:	ba f5 01 00 00       	mov    $0x1f5,%edx
    8d51:	c1 e8 10             	shr    $0x10,%eax
    8d54:	ee                   	out    %al,(%dx)
	outb (0x1F6, (offset >> 24) | 0xE0);
    8d55:	89 c8                	mov    %ecx,%eax
    8d57:	ba f6 01 00 00       	mov    $0x1f6,%edx
    8d5c:	c1 e8 18             	shr    $0x18,%eax
    8d5f:	83 c8 e0             	or     $0xffffffe0,%eax
    8d62:	ee                   	out    %al,(%dx)
    8d63:	ba f7 01 00 00       	mov    $0x1f7,%edx
    8d68:	b0 20                	mov    $0x20,%al
    8d6a:	ee                   	out    %al,(%dx)
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
    8d6b:	ec                   	in     (%dx),%al
	while ((inb (0x1F7) & 0xC0) != 0x40)
    8d6c:	83 e0 c0             	and    $0xffffffc0,%eax
    8d6f:	3c 40                	cmp    $0x40,%al
    8d71:	75 f8                	jne    8d6b <readsector+0x50>
}

static inline void
insl(int port, void *addr, int cnt)
{
	__asm __volatile("cld\n\trepne\n\tinsl"			:
    8d73:	8b 7d 08             	mov    0x8(%ebp),%edi
    8d76:	b9 80 00 00 00       	mov    $0x80,%ecx
    8d7b:	ba f0 01 00 00       	mov    $0x1f0,%edx
    8d80:	fc                   	cld    
    8d81:	f2 6d                	repnz insl (%dx),%es:(%edi)
	// wait for disk to be ready
	waitdisk ();

	// read a sector
	insl (0x1F0, dst, SECTOR_SIZE / 4);
}
    8d83:	5f                   	pop    %edi
    8d84:	5d                   	pop    %ebp
    8d85:	c3                   	ret    

00008d86 <readsection>:

// Read 'count' bytes at 'offset' from kernel into virtual address 'va'.
// Might copy more than asked
void
readsection (uint32_t va, uint32_t count, uint32_t offset, uint32_t lba)
{
    8d86:	55                   	push   %ebp
    8d87:	89 e5                	mov    %esp,%ebp
    8d89:	57                   	push   %edi
    8d8a:	56                   	push   %esi
    8d8b:	53                   	push   %ebx
    8d8c:	8b 5d 08             	mov    0x8(%ebp),%ebx
	end_va = va + count;
	// round down to sector boundary
	va &= ~(SECTOR_SIZE - 1);

	// translate from bytes to sectors, and kernel starts at sector 1
	offset = (offset / SECTOR_SIZE) + lba;
    8d8f:	8b 7d 10             	mov    0x10(%ebp),%edi
	va &= 0xFFFFFF;
    8d92:	89 de                	mov    %ebx,%esi
	va &= ~(SECTOR_SIZE - 1);
    8d94:	81 e3 00 fe ff 00    	and    $0xfffe00,%ebx
	va &= 0xFFFFFF;
    8d9a:	81 e6 ff ff ff 00    	and    $0xffffff,%esi
	offset = (offset / SECTOR_SIZE) + lba;
    8da0:	c1 ef 09             	shr    $0x9,%edi
	end_va = va + count;
    8da3:	03 75 0c             	add    0xc(%ebp),%esi
	offset = (offset / SECTOR_SIZE) + lba;
    8da6:	03 7d 14             	add    0x14(%ebp),%edi

	// If this is too slow, we could read lots of sectors at a time.
	// We'd write more to memory than asked, but it doesn't matter --
	// we load in increasing order.
	while (va < end_va)
    8da9:	39 f3                	cmp    %esi,%ebx
    8dab:	73 12                	jae    8dbf <readsection+0x39>
	{
		readsector ((uint8_t*) va, offset);
    8dad:	57                   	push   %edi
    8dae:	53                   	push   %ebx
		va += SECTOR_SIZE;
		offset++;
    8daf:	47                   	inc    %edi
		va += SECTOR_SIZE;
    8db0:	81 c3 00 02 00 00    	add    $0x200,%ebx
		readsector ((uint8_t*) va, offset);
    8db6:	e8 60 ff ff ff       	call   8d1b <readsector>
		offset++;
    8dbb:	58                   	pop    %eax
    8dbc:	5a                   	pop    %edx
    8dbd:	eb ea                	jmp    8da9 <readsection+0x23>
	}
}
    8dbf:	8d 65 f4             	lea    -0xc(%ebp),%esp
    8dc2:	5b                   	pop    %ebx
    8dc3:	5e                   	pop    %esi
    8dc4:	5f                   	pop    %edi
    8dc5:	5d                   	pop    %ebp
    8dc6:	c3                   	ret    

00008dc7 <__x86.get_pc_thunk.ax>:
    8dc7:	8b 04 24             	mov    (%esp),%eax
    8dca:	c3                   	ret    

00008dcb <__x86.get_pc_thunk.dx>:
    8dcb:	8b 14 24             	mov    (%esp),%edx
    8dce:	c3                   	ret    

00008dcf <load_kernel>:

#define ELFHDR		((elfhdr *) 0x20000)

uint32_t
load_kernel(uint32_t dkernel)
{
    8dcf:	55                   	push   %ebp
    8dd0:	89 e5                	mov    %esp,%ebp
    8dd2:	57                   	push   %edi
    8dd3:	56                   	push   %esi
    8dd4:	53                   	push   %ebx
    8dd5:	e8 89 01 00 00       	call   8f63 <__x86.get_pc_thunk.bx>
    8dda:	81 c3 f2 04 00 00    	add    $0x4f2,%ebx
    8de0:	83 ec 0c             	sub    $0xc,%esp
	// load kernel from the beginning of the first bootable partition
	proghdr *ph, *eph;

	readsection((uint32_t) ELFHDR, SECTOR_SIZE * 8, 0, dkernel);
    8de3:	ff 75 08             	pushl  0x8(%ebp)
    8de6:	6a 00                	push   $0x0
    8de8:	68 00 10 00 00       	push   $0x1000
    8ded:	68 00 00 02 00       	push   $0x20000
    8df2:	e8 8f ff ff ff       	call   8d86 <readsection>

	// is this a valid ELF?
	if (ELFHDR->e_magic != ELF_MAGIC)
    8df7:	83 c4 10             	add    $0x10,%esp
    8dfa:	81 3d 00 00 02 00 7f 	cmpl   $0x464c457f,0x20000
    8e01:	45 4c 46 
    8e04:	74 12                	je     8e18 <load_kernel+0x49>
		panic ("Kernel is not a valid elf.");
    8e06:	8d 83 fc fc ff ff    	lea    -0x304(%ebx),%eax
    8e0c:	83 ec 0c             	sub    $0xc,%esp
    8e0f:	50                   	push   %eax
    8e10:	e8 d7 fd ff ff       	call   8bec <panic>
    8e15:	83 c4 10             	add    $0x10,%esp

	// load each program segment (ignores ph flags)
	ph = (proghdr *) ((uint8_t *) ELFHDR + ELFHDR->e_phoff);
    8e18:	a1 1c 00 02 00       	mov    0x2001c,%eax
	eph = ph + ELFHDR->e_phnum;
    8e1d:	0f b7 35 2c 00 02 00 	movzwl 0x2002c,%esi
	ph = (proghdr *) ((uint8_t *) ELFHDR + ELFHDR->e_phoff);
    8e24:	8d b8 00 00 02 00    	lea    0x20000(%eax),%edi
	eph = ph + ELFHDR->e_phnum;
    8e2a:	c1 e6 05             	shl    $0x5,%esi
    8e2d:	01 fe                	add    %edi,%esi

	for (; ph < eph; ph++)
    8e2f:	39 f7                	cmp    %esi,%edi
    8e31:	73 19                	jae    8e4c <load_kernel+0x7d>
	{
		readsection(ph->p_va, ph->p_memsz, ph->p_offset, dkernel);
    8e33:	ff 75 08             	pushl  0x8(%ebp)
    8e36:	ff 77 04             	pushl  0x4(%edi)
	for (; ph < eph; ph++)
    8e39:	83 c7 20             	add    $0x20,%edi
		readsection(ph->p_va, ph->p_memsz, ph->p_offset, dkernel);
    8e3c:	ff 77 f4             	pushl  -0xc(%edi)
    8e3f:	ff 77 e8             	pushl  -0x18(%edi)
    8e42:	e8 3f ff ff ff       	call   8d86 <readsection>
	for (; ph < eph; ph++)
    8e47:	83 c4 10             	add    $0x10,%esp
    8e4a:	eb e3                	jmp    8e2f <load_kernel+0x60>
	}

	return (ELFHDR->e_entry & 0xFFFFFF);
    8e4c:	a1 18 00 02 00       	mov    0x20018,%eax
}
    8e51:	8d 65 f4             	lea    -0xc(%ebp),%esp
    8e54:	5b                   	pop    %ebx
	return (ELFHDR->e_entry & 0xFFFFFF);
    8e55:	25 ff ff ff 00       	and    $0xffffff,%eax
}
    8e5a:	5e                   	pop    %esi
    8e5b:	5f                   	pop    %edi
    8e5c:	5d                   	pop    %ebp
    8e5d:	c3                   	ret    

00008e5e <parse_e820>:

mboot_info_t *
parse_e820 (bios_smap_t *smap)
{
    8e5e:	55                   	push   %ebp
    8e5f:	89 e5                	mov    %esp,%ebp
    8e61:	57                   	push   %edi
    8e62:	56                   	push   %esi
    8e63:	53                   	push   %ebx
	bios_smap_t *p;
	uint32_t mmap_len;
	p = smap;
	mmap_len = 0;
    8e64:	31 f6                	xor    %esi,%esi
    8e66:	e8 f8 00 00 00       	call   8f63 <__x86.get_pc_thunk.bx>
    8e6b:	81 c3 61 04 00 00    	add    $0x461,%ebx
{
    8e71:	83 ec 18             	sub    $0x18,%esp
    8e74:	8b 7d 08             	mov    0x8(%ebp),%edi
	putline ("* E820 Memory Map *");
    8e77:	8d 83 17 fd ff ff    	lea    -0x2e9(%ebx),%eax
    8e7d:	50                   	push   %eax
    8e7e:	e8 03 fd ff ff       	call   8b86 <putline>
	while (p->base_addr != 0 || p->length != 0 || p->type != 0)
    8e83:	83 c4 10             	add    $0x10,%esp
    8e86:	8b 44 37 04          	mov    0x4(%edi,%esi,1),%eax
    8e8a:	89 c1                	mov    %eax,%ecx
    8e8c:	0b 4c 37 08          	or     0x8(%edi,%esi,1),%ecx
    8e90:	74 11                	je     8ea3 <parse_e820+0x45>
	{
		puti (p->base_addr);
    8e92:	83 ec 0c             	sub    $0xc,%esp
		p ++;
		mmap_len += sizeof(bios_smap_t);
    8e95:	83 c6 18             	add    $0x18,%esi
		puti (p->base_addr);
    8e98:	50                   	push   %eax
    8e99:	e8 52 fe ff ff       	call   8cf0 <puti>
		mmap_len += sizeof(bios_smap_t);
    8e9e:	83 c4 10             	add    $0x10,%esp
    8ea1:	eb e3                	jmp    8e86 <parse_e820+0x28>
	while (p->base_addr != 0 || p->length != 0 || p->type != 0)
    8ea3:	8b 54 37 10          	mov    0x10(%edi,%esi,1),%edx
    8ea7:	0b 54 37 0c          	or     0xc(%edi,%esi,1),%edx
    8eab:	75 e5                	jne    8e92 <parse_e820+0x34>
    8ead:	83 7c 37 14 00       	cmpl   $0x0,0x14(%edi,%esi,1)
    8eb2:	75 de                	jne    8e92 <parse_e820+0x34>
	}
	mboot_info.mmap_length = mmap_len;
    8eb4:	89 b3 80 00 00 00    	mov    %esi,0x80(%ebx)
	mboot_info.mmap_addr = (uint32_t) smap;
    8eba:	89 bb 84 00 00 00    	mov    %edi,0x84(%ebx)
	return &mboot_info;
}
    8ec0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    8ec3:	8d 83 54 00 00 00    	lea    0x54(%ebx),%eax
    8ec9:	5b                   	pop    %ebx
    8eca:	5e                   	pop    %esi
    8ecb:	5f                   	pop    %edi
    8ecc:	5d                   	pop    %ebp
    8ecd:	c3                   	ret    

00008ece <boot1main>:
{
    8ece:	55                   	push   %ebp
    8ecf:	89 e5                	mov    %esp,%ebp
    8ed1:	57                   	push   %edi
    8ed2:	56                   	push   %esi
    8ed3:	53                   	push   %ebx
	for(i = 0; i < 4; i++){
    8ed4:	31 f6                	xor    %esi,%esi
    8ed6:	e8 88 00 00 00       	call   8f63 <__x86.get_pc_thunk.bx>
    8edb:	81 c3 f1 03 00 00    	add    $0x3f1,%ebx
{
    8ee1:	83 ec 18             	sub    $0x18,%esp
    8ee4:	8b 7d 10             	mov    0x10(%ebp),%edi
	roll(3);
    8ee7:	6a 03                	push   $0x3
    8ee9:	e8 e6 fc ff ff       	call   8bd4 <roll>
	putline("Start boot1 main ...");
    8eee:	8d 83 2b fd ff ff    	lea    -0x2d5(%ebx),%eax
    8ef4:	89 04 24             	mov    %eax,(%esp)
    8ef7:	e8 8a fc ff ff       	call   8b86 <putline>
	parse_e820 (smap);
    8efc:	89 3c 24             	mov    %edi,(%esp)
    8eff:	e8 5a ff ff ff       	call   8e5e <parse_e820>
    8f04:	83 c4 10             	add    $0x10,%esp
		if(mbr->partition[i].bootable == BOOTABLE_PARTITION) break;
    8f07:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    8f0a:	89 f0                	mov    %esi,%eax
    8f0c:	c1 e0 04             	shl    $0x4,%eax
    8f0f:	80 bc 01 be 01 00 00 	cmpb   $0x80,0x1be(%ecx,%eax,1)
    8f16:	80 
    8f17:	74 06                	je     8f1f <boot1main+0x51>
	for(i = 0; i < 4; i++){
    8f19:	46                   	inc    %esi
    8f1a:	83 fe 04             	cmp    $0x4,%esi
    8f1d:	75 e8                	jne    8f07 <boot1main+0x39>
	parse_e820 (smap);
    8f1f:	83 ec 0c             	sub    $0xc,%esp
    8f22:	57                   	push   %edi
    8f23:	e8 36 ff ff ff       	call   8e5e <parse_e820>
	uint32_t header = load_kernel(mbr->partition[i].first_lba);
    8f28:	58                   	pop    %eax
    8f29:	8d 56 1b             	lea    0x1b(%esi),%edx
    8f2c:	8b 45 0c             	mov    0xc(%ebp),%eax
    8f2f:	c1 e2 04             	shl    $0x4,%edx
    8f32:	ff 74 10 16          	pushl  0x16(%eax,%edx,1)
    8f36:	e8 94 fe ff ff       	call   8dcf <load_kernel>
	exec_kernel(header, mboot_info_pointer);
    8f3b:	5a                   	pop    %edx
    8f3c:	8d 93 54 00 00 00    	lea    0x54(%ebx),%edx
    8f42:	59                   	pop    %ecx
    8f43:	52                   	push   %edx
    8f44:	50                   	push   %eax
    8f45:	e8 1d 00 00 00       	call   8f67 <exec_kernel>
	panic ("Fail to load kernel.");
    8f4a:	8d 83 40 fd ff ff    	lea    -0x2c0(%ebx),%eax
    8f50:	89 04 24             	mov    %eax,(%esp)
    8f53:	e8 94 fc ff ff       	call   8bec <panic>
}
    8f58:	83 c4 10             	add    $0x10,%esp
    8f5b:	8d 65 f4             	lea    -0xc(%ebp),%esp
    8f5e:	5b                   	pop    %ebx
    8f5f:	5e                   	pop    %esi
    8f60:	5f                   	pop    %edi
    8f61:	5d                   	pop    %ebp
    8f62:	c3                   	ret    

00008f63 <__x86.get_pc_thunk.bx>:
    8f63:	8b 1c 24             	mov    (%esp),%ebx
    8f66:	c3                   	ret    

00008f67 <exec_kernel>:
	.set  MBOOT_INFO_MAGIC, 0x2badb002

	.globl	exec_kernel
	.code32
exec_kernel:
	cli
    8f67:	fa                   	cli    
	movl	$MBOOT_INFO_MAGIC, %eax
    8f68:	b8 02 b0 ad 2b       	mov    $0x2badb002,%eax
	movl	8(%esp), %ebx
    8f6d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
	movl	4(%esp), %edx
    8f71:	8b 54 24 04          	mov    0x4(%esp),%edx
    8f75:	ff e2                	jmp    *%edx

Disassembly of section .rodata:

00008f77 <.rodata>:
    8f77:	20 20                	and    %ah,(%eax)
    8f79:	20 20                	and    %ah,(%eax)
    8f7b:	20 20                	and    %ah,(%eax)
    8f7d:	20 20                	and    %ah,(%eax)
    8f7f:	20 20                	and    %ah,(%eax)
    8f81:	20 20                	and    %ah,(%eax)
    8f83:	20 20                	and    %ah,(%eax)
    8f85:	20 20                	and    %ah,(%eax)
    8f87:	20 20                	and    %ah,(%eax)
    8f89:	20 20                	and    %ah,(%eax)
    8f8b:	20 20                	and    %ah,(%eax)
    8f8d:	20 20                	and    %ah,(%eax)
    8f8f:	20 20                	and    %ah,(%eax)
    8f91:	20 20                	and    %ah,(%eax)
    8f93:	20 20                	and    %ah,(%eax)
    8f95:	20 20                	and    %ah,(%eax)
    8f97:	20 20                	and    %ah,(%eax)
    8f99:	20 20                	and    %ah,(%eax)
    8f9b:	20 20                	and    %ah,(%eax)
    8f9d:	20 20                	and    %ah,(%eax)
    8f9f:	20 20                	and    %ah,(%eax)
    8fa1:	20 20                	and    %ah,(%eax)
    8fa3:	20 20                	and    %ah,(%eax)
    8fa5:	20 20                	and    %ah,(%eax)
    8fa7:	20 20                	and    %ah,(%eax)
    8fa9:	20 20                	and    %ah,(%eax)
    8fab:	20 20                	and    %ah,(%eax)
    8fad:	20 20                	and    %ah,(%eax)
    8faf:	20 20                	and    %ah,(%eax)
    8fb1:	20 20                	and    %ah,(%eax)
    8fb3:	20 20                	and    %ah,(%eax)
    8fb5:	20 20                	and    %ah,(%eax)
    8fb7:	20 20                	and    %ah,(%eax)
    8fb9:	20 20                	and    %ah,(%eax)
    8fbb:	20 20                	and    %ah,(%eax)
    8fbd:	20 20                	and    %ah,(%eax)
    8fbf:	20 20                	and    %ah,(%eax)
    8fc1:	20 20                	and    %ah,(%eax)
    8fc3:	20 20                	and    %ah,(%eax)
    8fc5:	20 20                	and    %ah,(%eax)
    8fc7:	00 4b 65             	add    %cl,0x65(%ebx)
    8fca:	72 6e                	jb     903a <exec_kernel+0xd3>
    8fcc:	65 6c                	gs insb (%dx),%es:(%edi)
    8fce:	20 69 73             	and    %ch,0x73(%ecx)
    8fd1:	20 6e 6f             	and    %ch,0x6f(%esi)
    8fd4:	74 20                	je     8ff6 <exec_kernel+0x8f>
    8fd6:	61                   	popa   
    8fd7:	20 76 61             	and    %dh,0x61(%esi)
    8fda:	6c                   	insb   (%dx),%es:(%edi)
    8fdb:	69 64 20 65 6c 66 2e 	imul   $0x2e666c,0x65(%eax,%eiz,1),%esp
    8fe2:	00 
    8fe3:	2a 20                	sub    (%eax),%ah
    8fe5:	45                   	inc    %ebp
    8fe6:	38 32                	cmp    %dh,(%edx)
    8fe8:	30 20                	xor    %ah,(%eax)
    8fea:	4d                   	dec    %ebp
    8feb:	65 6d                	gs insl (%dx),%es:(%edi)
    8fed:	6f                   	outsl  %ds:(%esi),(%dx)
    8fee:	72 79                	jb     9069 <exec_kernel+0x102>
    8ff0:	20 4d 61             	and    %cl,0x61(%ebp)
    8ff3:	70 20                	jo     9015 <exec_kernel+0xae>
    8ff5:	2a 00                	sub    (%eax),%al
    8ff7:	53                   	push   %ebx
    8ff8:	74 61                	je     905b <exec_kernel+0xf4>
    8ffa:	72 74                	jb     9070 <exec_kernel+0x109>
    8ffc:	20 62 6f             	and    %ah,0x6f(%edx)
    8fff:	6f                   	outsl  %ds:(%esi),(%dx)
    9000:	74 31                	je     9033 <exec_kernel+0xcc>
    9002:	20 6d 61             	and    %ch,0x61(%ebp)
    9005:	69 6e 20 2e 2e 2e 00 	imul   $0x2e2e2e,0x20(%esi),%ebp
    900c:	46                   	inc    %esi
    900d:	61                   	popa   
    900e:	69 6c 20 74 6f 20 6c 	imul   $0x6f6c206f,0x74(%eax,%eiz,1),%ebp
    9015:	6f 
    9016:	61                   	popa   
    9017:	64 20 6b 65          	and    %ch,%fs:0x65(%ebx)
    901b:	72 6e                	jb     908b <exec_kernel+0x124>
    901d:	65 6c                	gs insb (%dx),%es:(%edi)
    901f:	2e                   	cs
    9020:	00                   	.byte 0x0

Disassembly of section .eh_frame:

00009024 <.eh_frame>:
    9024:	14 00                	adc    $0x0,%al
    9026:	00 00                	add    %al,(%eax)
    9028:	00 00                	add    %al,(%eax)
    902a:	00 00                	add    %al,(%eax)
    902c:	01 7a 52             	add    %edi,0x52(%edx)
    902f:	00 01                	add    %al,(%ecx)
    9031:	7c 08                	jl     903b <exec_kernel+0xd4>
    9033:	01 1b                	add    %ebx,(%ebx)
    9035:	0c 04                	or     $0x4,%al
    9037:	04 88                	add    $0x88,%al
    9039:	01 00                	add    %eax,(%eax)
    903b:	00 1c 00             	add    %bl,(%eax,%eax,1)
    903e:	00 00                	add    %al,(%eax)
    9040:	1c 00                	sbb    $0x0,%al
    9042:	00 00                	add    %al,(%eax)
    9044:	e6 fa                	out    %al,$0xfa
    9046:	ff                   	(bad)  
    9047:	ff 26                	jmp    *(%esi)
    9049:	00 00                	add    %al,(%eax)
    904b:	00 00                	add    %al,(%eax)
    904d:	41                   	inc    %ecx
    904e:	0e                   	push   %cs
    904f:	08 85 02 4d 0d 05    	or     %al,0x50d4d02(%ebp)
    9055:	57                   	push   %edi
    9056:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
    9059:	04 00                	add    $0x0,%al
    905b:	00 24 00             	add    %ah,(%eax,%eax,1)
    905e:	00 00                	add    %al,(%eax)
    9060:	3c 00                	cmp    $0x0,%al
    9062:	00 00                	add    %al,(%eax)
    9064:	ec                   	in     (%dx),%al
    9065:	fa                   	cli    
    9066:	ff                   	(bad)  
    9067:	ff 36                	pushl  (%esi)
    9069:	00 00                	add    %al,(%eax)
    906b:	00 00                	add    %al,(%eax)
    906d:	41                   	inc    %ecx
    906e:	0e                   	push   %cs
    906f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
    9075:	42                   	inc    %edx
    9076:	86 03                	xchg   %al,(%ebx)
    9078:	83 04 6e c3          	addl   $0xffffffc3,(%esi,%ebp,2)
    907c:	41                   	inc    %ecx
    907d:	c6 41 c5 0c          	movb   $0xc,-0x3b(%ecx)
    9081:	04 04                	add    $0x4,%al
    9083:	00 20                	add    %ah,(%eax)
    9085:	00 00                	add    %al,(%eax)
    9087:	00 64 00 00          	add    %ah,0x0(%eax,%eax,1)
    908b:	00 fa                	add    %bh,%dl
    908d:	fa                   	cli    
    908e:	ff                   	(bad)  
    908f:	ff 4e 00             	decl   0x0(%esi)
    9092:	00 00                	add    %al,(%eax)
    9094:	00 4b 0e             	add    %cl,0xe(%ebx)
    9097:	08 85 02 4e 0d 05    	or     %al,0x50d4e02(%ebp)
    909d:	41                   	inc    %ecx
    909e:	83 03 73             	addl   $0x73,(%ebx)
    90a1:	c5 c3 0c             	(bad)  
    90a4:	04 04                	add    $0x4,%al
    90a6:	00 00                	add    %al,(%eax)
    90a8:	1c 00                	sbb    $0x0,%al
    90aa:	00 00                	add    %al,(%eax)
    90ac:	88 00                	mov    %al,(%eax)
    90ae:	00 00                	add    %al,(%eax)
    90b0:	24 fb                	and    $0xfb,%al
    90b2:	ff                   	(bad)  
    90b3:	ff 18                	lcall  *(%eax)
    90b5:	00 00                	add    %al,(%eax)
    90b7:	00 00                	add    %al,(%eax)
    90b9:	41                   	inc    %ecx
    90ba:	0e                   	push   %cs
    90bb:	08 85 02 4c 0d 05    	or     %al,0x50d4c02(%ebp)
    90c1:	44                   	inc    %esp
    90c2:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
    90c5:	04 00                	add    $0x0,%al
    90c7:	00 18                	add    %bl,(%eax)
    90c9:	00 00                	add    %al,(%eax)
    90cb:	00 a8 00 00 00 1c    	add    %ch,0x1c000000(%eax)
    90d1:	fb                   	sti    
    90d2:	ff                   	(bad)  
    90d3:	ff 17                	call   *(%edi)
    90d5:	00 00                	add    %al,(%eax)
    90d7:	00 00                	add    %al,(%eax)
    90d9:	41                   	inc    %ecx
    90da:	0e                   	push   %cs
    90db:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
    90e1:	00 00                	add    %al,(%eax)
    90e3:	00 1c 00             	add    %bl,(%eax,%eax,1)
    90e6:	00 00                	add    %al,(%eax)
    90e8:	c4 00                	les    (%eax),%eax
    90ea:	00 00                	add    %al,(%eax)
    90ec:	17                   	pop    %ss
    90ed:	fb                   	sti    
    90ee:	ff                   	(bad)  
    90ef:	ff 13                	call   *(%ebx)
    90f1:	00 00                	add    %al,(%eax)
    90f3:	00 00                	add    %al,(%eax)
    90f5:	41                   	inc    %ecx
    90f6:	0e                   	push   %cs
    90f7:	08 85 02 44 0d 05    	or     %al,0x50d4402(%ebp)
    90fd:	4d                   	dec    %ebp
    90fe:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
    9101:	04 00                	add    $0x0,%al
    9103:	00 24 00             	add    %ah,(%eax,%eax,1)
    9106:	00 00                	add    %al,(%eax)
    9108:	e4 00                	in     $0x0,%al
    910a:	00 00                	add    %al,(%eax)
    910c:	0a fb                	or     %bl,%bh
    910e:	ff                   	(bad)  
    910f:	ff 2d 00 00 00 00    	ljmp   *0x0
    9115:	41                   	inc    %ecx
    9116:	0e                   	push   %cs
    9117:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
    911d:	42                   	inc    %edx
    911e:	86 03                	xchg   %al,(%ebx)
    9120:	83 04 65 c3 41 c6 41 	addl   $0xffffffc5,0x41c641c3(,%eiz,2)
    9127:	c5 
    9128:	0c 04                	or     $0x4,%al
    912a:	04 00                	add    $0x0,%al
    912c:	28 00                	sub    %al,(%eax)
    912e:	00 00                	add    %al,(%eax)
    9130:	0c 01                	or     $0x1,%al
    9132:	00 00                	add    %al,(%eax)
    9134:	0f fb ff             	psubq  %mm7,%mm7
    9137:	ff 61 00             	jmp    *0x0(%ecx)
    913a:	00 00                	add    %al,(%eax)
    913c:	00 41 0e             	add    %al,0xe(%ecx)
    913f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
    9145:	43                   	inc    %ebx
    9146:	87 03                	xchg   %eax,(%ebx)
    9148:	86 04 83             	xchg   %al,(%ebx,%eax,4)
    914b:	05 02 53 c3 41       	add    $0x41c35302,%eax
    9150:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
    9154:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
    9157:	04 1c                	add    $0x1c,%al
    9159:	00 00                	add    %al,(%eax)
    915b:	00 38                	add    %bh,(%eax)
    915d:	01 00                	add    %eax,(%eax)
    915f:	00 44 fb ff          	add    %al,-0x1(%ebx,%edi,8)
    9163:	ff 26                	jmp    *(%esi)
    9165:	00 00                	add    %al,(%eax)
    9167:	00 00                	add    %al,(%eax)
    9169:	4b                   	dec    %ebx
    916a:	0e                   	push   %cs
    916b:	08 85 02 48 0d 05    	or     %al,0x50d4802(%ebp)
    9171:	52                   	push   %edx
    9172:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
    9175:	04 00                	add    $0x0,%al
    9177:	00 1c 00             	add    %bl,(%eax,%eax,1)
    917a:	00 00                	add    %al,(%eax)
    917c:	58                   	pop    %eax
    917d:	01 00                	add    %eax,(%eax)
    917f:	00 4a fb             	add    %cl,-0x5(%edx)
    9182:	ff                   	(bad)  
    9183:	ff 26                	jmp    *(%esi)
    9185:	00 00                	add    %al,(%eax)
    9187:	00 00                	add    %al,(%eax)
    9189:	4b                   	dec    %ebx
    918a:	0e                   	push   %cs
    918b:	08 85 02 48 0d 05    	or     %al,0x50d4802(%ebp)
    9191:	52                   	push   %edx
    9192:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
    9195:	04 00                	add    $0x0,%al
    9197:	00 20                	add    %ah,(%eax)
    9199:	00 00                	add    %al,(%eax)
    919b:	00 78 01             	add    %bh,0x1(%eax)
    919e:	00 00                	add    %al,(%eax)
    91a0:	50                   	push   %eax
    91a1:	fb                   	sti    
    91a2:	ff                   	(bad)  
    91a3:	ff 2b                	ljmp   *(%ebx)
    91a5:	00 00                	add    %al,(%eax)
    91a7:	00 00                	add    %al,(%eax)
    91a9:	41                   	inc    %ecx
    91aa:	0e                   	push   %cs
    91ab:	08 85 02 4c 0d 05    	or     %al,0x50d4c02(%ebp)
    91b1:	41                   	inc    %ecx
    91b2:	83 03 58             	addl   $0x58,(%ebx)
    91b5:	c5 c3 0c             	(bad)  
    91b8:	04 04                	add    $0x4,%al
    91ba:	00 00                	add    %al,(%eax)
    91bc:	20 00                	and    %al,(%eax)
    91be:	00 00                	add    %al,(%eax)
    91c0:	9c                   	pushf  
    91c1:	01 00                	add    %eax,(%eax)
    91c3:	00 57 fb             	add    %dl,-0x5(%edi)
    91c6:	ff                   	(bad)  
    91c7:	ff 6b 00             	ljmp   *0x0(%ebx)
    91ca:	00 00                	add    %al,(%eax)
    91cc:	00 41 0e             	add    %al,0xe(%ecx)
    91cf:	08 85 02 47 0d 05    	or     %al,0x50d4702(%ebp)
    91d5:	41                   	inc    %ecx
    91d6:	87 03                	xchg   %eax,(%ebx)
    91d8:	02 60 c7             	add    -0x39(%eax),%ah
    91db:	41                   	inc    %ecx
    91dc:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
    91df:	04 28                	add    $0x28,%al
    91e1:	00 00                	add    %al,(%eax)
    91e3:	00 c0                	add    %al,%al
    91e5:	01 00                	add    %eax,(%eax)
    91e7:	00 9e fb ff ff 41    	add    %bl,0x41fffffb(%esi)
    91ed:	00 00                	add    %al,(%eax)
    91ef:	00 00                	add    %al,(%eax)
    91f1:	41                   	inc    %ecx
    91f2:	0e                   	push   %cs
    91f3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
    91f9:	43                   	inc    %ebx
    91fa:	87 03                	xchg   %eax,(%ebx)
    91fc:	86 04 83             	xchg   %al,(%ebx,%eax,4)
    91ff:	05 77 c3 41 c6       	add    $0xc641c377,%eax
    9204:	41                   	inc    %ecx
    9205:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
    920c:	10 00                	adc    %al,(%eax)
    920e:	00 00                	add    %al,(%eax)
    9210:	ec                   	in     (%dx),%al
    9211:	01 00                	add    %eax,(%eax)
    9213:	00 b3 fb ff ff 04    	add    %dh,0x4fffffb(%ebx)
    9219:	00 00                	add    %al,(%eax)
    921b:	00 00                	add    %al,(%eax)
    921d:	00 00                	add    %al,(%eax)
    921f:	00 10                	add    %dl,(%eax)
    9221:	00 00                	add    %al,(%eax)
    9223:	00 00                	add    %al,(%eax)
    9225:	02 00                	add    (%eax),%al
    9227:	00 a3 fb ff ff 04    	add    %ah,0x4fffffb(%ebx)
    922d:	00 00                	add    %al,(%eax)
    922f:	00 00                	add    %al,(%eax)
    9231:	00 00                	add    %al,(%eax)
    9233:	00 28                	add    %ch,(%eax)
    9235:	00 00                	add    %al,(%eax)
    9237:	00 14 02             	add    %dl,(%edx,%eax,1)
    923a:	00 00                	add    %al,(%eax)
    923c:	93                   	xchg   %eax,%ebx
    923d:	fb                   	sti    
    923e:	ff                   	(bad)  
    923f:	ff 8f 00 00 00 00    	decl   0x0(%edi)
    9245:	41                   	inc    %ecx
    9246:	0e                   	push   %cs
    9247:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
    924d:	43                   	inc    %ebx
    924e:	87 03                	xchg   %eax,(%ebx)
    9250:	86 04 83             	xchg   %al,(%ebx,%eax,4)
    9253:	05 02 80 c3 46       	add    $0x46c38002,%eax
    9258:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
    925c:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
    925f:	04 28                	add    $0x28,%al
    9261:	00 00                	add    %al,(%eax)
    9263:	00 40 02             	add    %al,0x2(%eax)
    9266:	00 00                	add    %al,(%eax)
    9268:	f6 fb                	idiv   %bl
    926a:	ff                   	(bad)  
    926b:	ff 70 00             	pushl  0x0(%eax)
    926e:	00 00                	add    %al,(%eax)
    9270:	00 41 0e             	add    %al,0xe(%ecx)
    9273:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
    9279:	43                   	inc    %ebx
    927a:	87 03                	xchg   %eax,(%ebx)
    927c:	86 04 83             	xchg   %al,(%ebx,%eax,4)
    927f:	05 02 66 c3 41       	add    $0x41c36602,%eax
    9284:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
    9288:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
    928b:	04 28                	add    $0x28,%al
    928d:	00 00                	add    %al,(%eax)
    928f:	00 6c 02 00          	add    %ch,0x0(%edx,%eax,1)
    9293:	00 3a                	add    %bh,(%edx)
    9295:	fc                   	cld    
    9296:	ff                   	(bad)  
    9297:	ff 95 00 00 00 00    	call   *0x0(%ebp)
    929d:	41                   	inc    %ecx
    929e:	0e                   	push   %cs
    929f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
    92a5:	43                   	inc    %ebx
    92a6:	87 03                	xchg   %eax,(%ebx)
    92a8:	86 04 83             	xchg   %al,(%ebx,%eax,4)
    92ab:	05 02 8b c3 41       	add    $0x41c38b02,%eax
    92b0:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
    92b4:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
    92b7:	04 10                	add    $0x10,%al
    92b9:	00 00                	add    %al,(%eax)
    92bb:	00 98 02 00 00 a3    	add    %bl,-0x5cfffffe(%eax)
    92c1:	fc                   	cld    
    92c2:	ff                   	(bad)  
    92c3:	ff 04 00             	incl   (%eax,%eax,1)
    92c6:	00 00                	add    %al,(%eax)
    92c8:	00 00                	add    %al,(%eax)
    92ca:	00 00                	add    %al,(%eax)

Disassembly of section .got.plt:

000092cc <_GLOBAL_OFFSET_TABLE_>:
    92cc:	00 00                	add    %al,(%eax)
    92ce:	00 00                	add    %al,(%eax)
    92d0:	00 00                	add    %al,(%eax)
    92d2:	00 00                	add    %al,(%eax)
    92d4:	00 00                	add    %al,(%eax)
    92d6:	00 00                	add    %al,(%eax)

Disassembly of section .data:

000092e0 <hex.1136>:
    92e0:	30 31                	xor    %dh,(%ecx)
    92e2:	32 33                	xor    (%ebx),%dh
    92e4:	34 35                	xor    $0x35,%al
    92e6:	36 37                	ss aaa 
    92e8:	38 39                	cmp    %bh,(%ecx)
    92ea:	61                   	popa   
    92eb:	62 63 64             	bound  %esp,0x64(%ebx)
    92ee:	65 66 00 00          	data16 add %al,%gs:(%eax)
    92f2:	00 00                	add    %al,(%eax)

000092f4 <dec.1131>:
    92f4:	30 31                	xor    %dh,(%ecx)
    92f6:	32 33                	xor    (%ebx),%dh
    92f8:	34 35                	xor    $0x35,%al
    92fa:	36 37                	ss aaa 
    92fc:	38 39                	cmp    %bh,(%ecx)
    92fe:	00 00                	add    %al,(%eax)

00009300 <video>:
    9300:	00 80 0b 00 77 8f    	add    %al,-0x7088fff5(%eax)

00009304 <blank>:
    9304:	77 8f                	ja     9295 <exec_kernel+0x32e>
    9306:	00 00                	add    %al,(%eax)
    9308:	00 00                	add    %al,(%eax)
    930a:	00 00                	add    %al,(%eax)
    930c:	00 00                	add    %al,(%eax)
    930e:	00 00                	add    %al,(%eax)
    9310:	00 00                	add    %al,(%eax)
    9312:	00 00                	add    %al,(%eax)
    9314:	00 00                	add    %al,(%eax)
    9316:	00 00                	add    %al,(%eax)
    9318:	00 00                	add    %al,(%eax)
    931a:	00 00                	add    %al,(%eax)
    931c:	00 00                	add    %al,(%eax)
    931e:	00 00                	add    %al,(%eax)

00009320 <mboot_info>:
    9320:	40                   	inc    %eax
    9321:	00 00                	add    %al,(%eax)
    9323:	00 00                	add    %al,(%eax)
    9325:	00 00                	add    %al,(%eax)
    9327:	00 00                	add    %al,(%eax)
    9329:	00 00                	add    %al,(%eax)
    932b:	00 00                	add    %al,(%eax)
    932d:	00 00                	add    %al,(%eax)
    932f:	00 00                	add    %al,(%eax)
    9331:	00 00                	add    %al,(%eax)
    9333:	00 00                	add    %al,(%eax)
    9335:	00 00                	add    %al,(%eax)
    9337:	00 00                	add    %al,(%eax)
    9339:	00 00                	add    %al,(%eax)
    933b:	00 00                	add    %al,(%eax)
    933d:	00 00                	add    %al,(%eax)
    933f:	00 00                	add    %al,(%eax)
    9341:	00 00                	add    %al,(%eax)
    9343:	00 00                	add    %al,(%eax)
    9345:	00 00                	add    %al,(%eax)
    9347:	00 00                	add    %al,(%eax)
    9349:	00 00                	add    %al,(%eax)
    934b:	00 00                	add    %al,(%eax)
    934d:	00 00                	add    %al,(%eax)
    934f:	00 00                	add    %al,(%eax)
    9351:	00 00                	add    %al,(%eax)
    9353:	00 00                	add    %al,(%eax)
    9355:	00 00                	add    %al,(%eax)
    9357:	00 00                	add    %al,(%eax)
    9359:	00 00                	add    %al,(%eax)
    935b:	00 00                	add    %al,(%eax)
    935d:	00 00                	add    %al,(%eax)
    935f:	00 00                	add    %al,(%eax)
    9361:	00 00                	add    %al,(%eax)
    9363:	00 00                	add    %al,(%eax)
    9365:	00 00                	add    %al,(%eax)
    9367:	00 00                	add    %al,(%eax)
    9369:	00 00                	add    %al,(%eax)
    936b:	00 00                	add    %al,(%eax)
    936d:	00 00                	add    %al,(%eax)
    936f:	00 00                	add    %al,(%eax)
    9371:	00 00                	add    %al,(%eax)
    9373:	00 00                	add    %al,(%eax)
    9375:	00 00                	add    %al,(%eax)
    9377:	00 00                	add    %al,(%eax)
    9379:	00 00                	add    %al,(%eax)
    937b:	00 00                	add    %al,(%eax)
    937d:	00 00                	add    %al,(%eax)
    937f:	00                   	.byte 0x0

Disassembly of section .bss:

00009380 <__bss_start>:
    9380:	00 00                	add    %al,(%eax)
    9382:	00 00                	add    %al,(%eax)
    9384:	00 00                	add    %al,(%eax)
    9386:	00 00                	add    %al,(%eax)
    9388:	00 00                	add    %al,(%eax)
    938a:	00 00                	add    %al,(%eax)
    938c:	00 00                	add    %al,(%eax)
    938e:	00 00                	add    %al,(%eax)
    9390:	00 00                	add    %al,(%eax)
    9392:	00 00                	add    %al,(%eax)
    9394:	00 00                	add    %al,(%eax)
    9396:	00 00                	add    %al,(%eax)
    9398:	00 00                	add    %al,(%eax)
    939a:	00 00                	add    %al,(%eax)
    939c:	00 00                	add    %al,(%eax)
    939e:	00 00                	add    %al,(%eax)
    93a0:	00 00                	add    %al,(%eax)
    93a2:	00 00                	add    %al,(%eax)
    93a4:	00 00                	add    %al,(%eax)
    93a6:	00 00                	add    %al,(%eax)

000093a8 <row>:
    93a8:	00 00                	add    %al,(%eax)
    93aa:	00 00                	add    %al,(%eax)

Disassembly of section .comment:

00000000 <.comment>:
   0:	47                   	inc    %edi
   1:	43                   	inc    %ebx
   2:	43                   	inc    %ebx
   3:	3a 20                	cmp    (%eax),%ah
   5:	28 55 62             	sub    %dl,0x62(%ebp)
   8:	75 6e                	jne    78 <PROT_MODE_DSEG+0x68>
   a:	74 75                	je     81 <PROT_MODE_DSEG+0x71>
   c:	20 36                	and    %dh,(%esi)
   e:	2e 33 2e             	xor    %cs:(%esi),%ebp
  11:	30 2d 31 32 75 62    	xor    %ch,0x62753231
  17:	75 6e                	jne    87 <PROT_MODE_DSEG+0x77>
  19:	74 75                	je     90 <PROT_MODE_DSEG+0x80>
  1b:	32 29                	xor    (%ecx),%ch
  1d:	20 36                	and    %dh,(%esi)
  1f:	2e 33 2e             	xor    %cs:(%esi),%ebp
  22:	30 20                	xor    %ah,(%eax)
  24:	32 30                	xor    (%eax),%dh
  26:	31 37                	xor    %esi,(%edi)
  28:	30 34 30             	xor    %dh,(%eax,%esi,1)
  2b:	36                   	ss
  2c:	00                   	.byte 0x0

Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
   0:	1c 00                	sbb    $0x0,%al
   2:	00 00                	add    %al,(%eax)
   4:	02 00                	add    (%eax),%al
   6:	00 00                	add    %al,(%eax)
   8:	00 00                	add    %al,(%eax)
   a:	04 00                	add    $0x0,%al
   c:	00 00                	add    %al,(%eax)
   e:	00 00                	add    %al,(%eax)
  10:	00 7e 00             	add    %bh,0x0(%esi)
  13:	00 2a                	add    %ch,(%edx)
  15:	0d 00 00 00 00       	or     $0x0,%eax
  1a:	00 00                	add    %al,(%eax)
  1c:	00 00                	add    %al,(%eax)
  1e:	00 00                	add    %al,(%eax)
  20:	1c 00                	sbb    $0x0,%al
  22:	00 00                	add    %al,(%eax)
  24:	02 00                	add    (%eax),%al
  26:	6d                   	insl   (%dx),%es:(%edi)
  27:	00 00                	add    %al,(%eax)
  29:	00 04 00             	add    %al,(%eax,%eax,1)
  2c:	00 00                	add    %al,(%eax)
  2e:	00 00                	add    %al,(%eax)
  30:	2a 8b 00 00 9d 02    	sub    0x29d0000(%ebx),%cl
  36:	00 00                	add    %al,(%eax)
  38:	00 00                	add    %al,(%eax)
  3a:	00 00                	add    %al,(%eax)
  3c:	00 00                	add    %al,(%eax)
  3e:	00 00                	add    %al,(%eax)
  40:	1c 00                	sbb    $0x0,%al
  42:	00 00                	add    %al,(%eax)
  44:	02 00                	add    (%eax),%al
  46:	0b 07                	or     (%edi),%eax
  48:	00 00                	add    %al,(%eax)
  4a:	04 00                	add    $0x0,%al
  4c:	00 00                	add    %al,(%eax)
  4e:	00 00                	add    %al,(%eax)
  50:	cf                   	iret   
  51:	8d 00                	lea    (%eax),%eax
  53:	00 94 01 00 00 00 00 	add    %dl,0x0(%ecx,%eax,1)
  5a:	00 00                	add    %al,(%eax)
  5c:	00 00                	add    %al,(%eax)
  5e:	00 00                	add    %al,(%eax)
  60:	1c 00                	sbb    $0x0,%al
  62:	00 00                	add    %al,(%eax)
  64:	02 00                	add    (%eax),%al
  66:	d1 0d 00 00 04 00    	rorl   0x40000
  6c:	00 00                	add    %al,(%eax)
  6e:	00 00                	add    %al,(%eax)
  70:	67 8f 00             	popl   (%bx,%si)
  73:	00 10                	add    %dl,(%eax)
  75:	00 00                	add    %al,(%eax)
  77:	00 00                	add    %al,(%eax)
  79:	00 00                	add    %al,(%eax)
  7b:	00 00                	add    %al,(%eax)
  7d:	00 00                	add    %al,(%eax)
  7f:	00                   	.byte 0x0

Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	69 00 00 00 02 00    	imul   $0x20000,(%eax),%eax
   6:	00 00                	add    %al,(%eax)
   8:	00 00                	add    %al,(%eax)
   a:	04 01                	add    $0x1,%al
   c:	00 00                	add    %al,(%eax)
   e:	00 00                	add    %al,(%eax)
  10:	00 7e 00             	add    %bh,0x0(%esi)
  13:	00 2a                	add    %ch,(%edx)
  15:	8b 00                	mov    (%eax),%eax
  17:	00 62 6f             	add    %ah,0x6f(%edx)
  1a:	6f                   	outsl  %ds:(%esi),(%dx)
  1b:	74 2f                	je     4c <PROT_MODE_DSEG+0x3c>
  1d:	62 6f 6f             	bound  %ebp,0x6f(%edi)
  20:	74 31                	je     53 <PROT_MODE_DSEG+0x43>
  22:	2f                   	das    
  23:	62 6f 6f             	bound  %ebp,0x6f(%edi)
  26:	74 31                	je     59 <PROT_MODE_DSEG+0x49>
  28:	2e 53                	cs push %ebx
  2a:	00 2f                	add    %ch,(%edi)
  2c:	68 6f 6d 65 2f       	push   $0x2f656d6f
  31:	73 74                	jae    a7 <PROT_MODE_DSEG+0x97>
  33:	75 64                	jne    99 <PROT_MODE_DSEG+0x89>
  35:	65 6e                	outsb  %gs:(%esi),(%dx)
  37:	74 2f                	je     68 <PROT_MODE_DSEG+0x58>
  39:	6f                   	outsl  %ds:(%esi),(%dx)
  3a:	73 2d                	jae    69 <PROT_MODE_DSEG+0x59>
  3c:	63 6c 61 73          	arpl   %bp,0x73(%ecx,%eiz,2)
  40:	73 2d                	jae    6f <PROT_MODE_DSEG+0x5f>
  42:	70 72                	jo     b6 <PROT_MODE_DSEG+0xa6>
  44:	6f                   	outsl  %ds:(%esi),(%dx)
  45:	6a 65                	push   $0x65
  47:	63 74 2e 72          	arpl   %si,0x72(%esi,%ebp,1)
  4b:	65 70 6f             	gs jo  bd <PROT_MODE_DSEG+0xad>
  4e:	2f                   	das    
  4f:	6c                   	insb   (%dx),%es:(%edi)
  50:	61                   	popa   
  51:	62 32                	bound  %esi,(%edx)
  53:	2f                   	das    
  54:	73 68                	jae    be <PROT_MODE_DSEG+0xae>
  56:	65 6e                	outsb  %gs:(%esi),(%dx)
  58:	6c                   	insb   (%dx),%es:(%edi)
  59:	75 2f                	jne    8a <PROT_MODE_DSEG+0x7a>
  5b:	73 72                	jae    cf <PROT_MODE_DSEG+0xbf>
  5d:	63 00                	arpl   %ax,(%eax)
  5f:	47                   	inc    %edi
  60:	4e                   	dec    %esi
  61:	55                   	push   %ebp
  62:	20 41 53             	and    %al,0x53(%ecx)
  65:	20 32                	and    %dh,(%edx)
  67:	2e 32 38             	xor    %cs:(%eax),%bh
  6a:	00 01                	add    %al,(%ecx)
  6c:	80 9a 06 00 00 04 00 	sbbb   $0x0,0x4000006(%edx)
  73:	14 00                	adc    $0x0,%al
  75:	00 00                	add    %al,(%eax)
  77:	04 01                	add    $0x1,%al
  79:	a9 00 00 00 0c       	test   $0xc000000,%eax
  7e:	81 00 00 00 2b 00    	addl   $0x2b0000,(%eax)
  84:	00 00                	add    %al,(%eax)
  86:	2a 8b 00 00 9d 02    	sub    0x29d0000(%ebx),%cl
  8c:	00 00                	add    %al,(%eax)
  8e:	91                   	xchg   %eax,%ecx
  8f:	00 00                	add    %al,(%eax)
  91:	00 02                	add    %al,(%edx)
  93:	01 06                	add    %eax,(%esi)
  95:	2e 01 00             	add    %eax,%cs:(%eax)
  98:	00 03                	add    %al,(%ebx)
  9a:	97                   	xchg   %eax,%edi
  9b:	00 00                	add    %al,(%eax)
  9d:	00 02                	add    %al,(%edx)
  9f:	0d 37 00 00 00       	or     $0x37,%eax
  a4:	02 01                	add    (%ecx),%al
  a6:	08 2c 01             	or     %ch,(%ecx,%eax,1)
  a9:	00 00                	add    %al,(%eax)
  ab:	02 02                	add    (%edx),%al
  ad:	05 18 00 00 00       	add    $0x18,%eax
  b2:	02 02                	add    (%edx),%al
  b4:	07                   	pop    %es
  b5:	74 01                	je     b8 <PROT_MODE_DSEG+0xa8>
  b7:	00 00                	add    %al,(%eax)
  b9:	03 5c 01 00          	add    0x0(%ecx,%eax,1),%ebx
  bd:	00 02                	add    %al,(%edx)
  bf:	10 57 00             	adc    %dl,0x0(%edi)
  c2:	00 00                	add    %al,(%eax)
  c4:	04 04                	add    $0x4,%al
  c6:	05 69 6e 74 00       	add    $0x746e69,%eax
  cb:	03 5b 01             	add    0x1(%ebx),%ebx
  ce:	00 00                	add    %al,(%eax)
  d0:	02 11                	add    (%ecx),%dl
  d2:	69 00 00 00 02 04    	imul   $0x4020000,(%eax),%eax
  d8:	07                   	pop    %es
  d9:	4e                   	dec    %esi
  da:	01 00                	add    %eax,(%eax)
  dc:	00 02                	add    %al,(%edx)
  de:	08 05 0d 01 00 00    	or     %al,0x10d
  e4:	02 08                	add    (%eax),%cl
  e6:	07                   	pop    %es
  e7:	44                   	inc    %esp
  e8:	01 00                	add    %eax,(%eax)
  ea:	00 02                	add    %al,(%edx)
  ec:	04 07                	add    $0x7,%al
  ee:	22 00                	and    (%eax),%al
  f0:	00 00                	add    %al,(%eax)
  f2:	05 b9 01 00 00       	add    $0x1b9,%eax
  f7:	01 06                	add    %eax,(%esi)
  f9:	96                   	xchg   %eax,%esi
  fa:	00 00                	add    %al,(%eax)
  fc:	00 05 03 00 93 00    	add    %al,0x930003
 102:	00 06                	add    %al,(%esi)
 104:	04 a3                	add    $0xa3,%al
 106:	00 00                	add    %al,(%eax)
 108:	00 02                	add    %al,(%edx)
 10a:	01 06                	add    %eax,(%esi)
 10c:	35 01 00 00 07       	xor    $0x7000001,%eax
 111:	9c                   	pushf  
 112:	00 00                	add    %al,(%eax)
 114:	00 08                	add    %cl,(%eax)
 116:	9c                   	pushf  
 117:	00 00                	add    %al,(%eax)
 119:	00 09                	add    %cl,(%ecx)
 11b:	72 6f                	jb     18c <PROT_MODE_DSEG+0x17c>
 11d:	77 00                	ja     11f <PROT_MODE_DSEG+0x10f>
 11f:	01 1c 57             	add    %ebx,(%edi,%edx,2)
 122:	00 00                	add    %al,(%eax)
 124:	00 05 03 a8 93 00    	add    %al,0x93a803
 12a:	00 05 ae 01 00 00    	add    %al,0x1ae
 130:	01 1e                	add    %ebx,(%esi)
 132:	cf                   	iret   
 133:	00 00                	add    %al,(%eax)
 135:	00 05 03 04 93 00    	add    %al,0x930403
 13b:	00 06                	add    %al,(%esi)
 13d:	04 9c                	add    $0x9c,%al
 13f:	00 00                	add    %al,(%eax)
 141:	00 0a                	add    %cl,(%edx)
 143:	9c                   	pushf  
 144:	00 00                	add    %al,(%eax)
 146:	00 e5                	add    %ah,%ch
 148:	00 00                	add    %al,(%eax)
 14a:	00 0b                	add    %cl,(%ebx)
 14c:	7e 00                	jle    14e <PROT_MODE_DSEG+0x13e>
 14e:	00 00                	add    %al,(%eax)
 150:	27                   	daa    
 151:	00 0c a5 01 00 00 01 	add    %cl,0x1000001(,%eiz,4)
 158:	38 d5                	cmp    %dl,%ch
 15a:	00 00                	add    %al,(%eax)
 15c:	00 05 03 80 93 00    	add    %al,0x938003
 162:	00 0d 1b 01 00 00    	add    %cl,0x11b
 168:	01 a4 86 8d 00 00 41 	add    %esp,0x4100008d(%esi,%eax,4)
 16f:	00 00                	add    %al,(%eax)
 171:	00 01                	add    %al,(%ecx)
 173:	9c                   	pushf  
 174:	5d                   	pop    %ebp
 175:	01 00                	add    %eax,(%eax)
 177:	00 0e                	add    %cl,(%esi)
 179:	76 61                	jbe    1dc <PROT_MODE_DSEG+0x1cc>
 17b:	00 01                	add    %al,(%ecx)
 17d:	a4                   	movsb  %ds:(%esi),%es:(%edi)
 17e:	5e                   	pop    %esi
 17f:	00 00                	add    %al,(%eax)
 181:	00 00                	add    %al,(%eax)
 183:	00 00                	add    %al,(%eax)
 185:	00 0f                	add    %cl,(%edi)
 187:	85 04 00             	test   %eax,(%eax,%eax,1)
 18a:	00 01                	add    %al,(%ecx)
 18c:	a4                   	movsb  %ds:(%esi),%es:(%edi)
 18d:	5e                   	pop    %esi
 18e:	00 00                	add    %al,(%eax)
 190:	00 02                	add    %al,(%edx)
 192:	91                   	xchg   %eax,%ecx
 193:	04 10                	add    $0x10,%al
 195:	31 02                	xor    %eax,(%edx)
 197:	00 00                	add    %al,(%eax)
 199:	01 a4 5e 00 00 00 63 	add    %esp,0x63000000(%esi,%ebx,2)
 1a0:	00 00                	add    %al,(%eax)
 1a2:	00 11                	add    %dl,(%ecx)
 1a4:	6c                   	insb   (%dx),%es:(%edi)
 1a5:	62 61 00             	bound  %esp,0x0(%ecx)
 1a8:	01 a4 5e 00 00 00 02 	add    %esp,0x2000000(%esi,%ebx,2)
 1af:	91                   	xchg   %eax,%ecx
 1b0:	0c 12                	or     $0x12,%al
 1b2:	00 00                	add    %al,(%eax)
 1b4:	00 00                	add    %al,(%eax)
 1b6:	01 a6 5e 00 00 00    	add    %esp,0x5e(%esi)
 1bc:	a6                   	cmpsb  %es:(%edi),%ds:(%esi)
 1bd:	00 00                	add    %al,(%eax)
 1bf:	00 13                	add    %dl,(%ebx)
 1c1:	bb 8d 00 00 5d       	mov    $0x5d00008d,%ebx
 1c6:	01 00                	add    %eax,(%eax)
 1c8:	00 00                	add    %al,(%eax)
 1ca:	0d 76 00 00 00       	or     $0x76,%eax
 1cf:	01 8e 1b 8d 00 00    	add    %ecx,0x8d1b(%esi)
 1d5:	6b 00 00             	imul   $0x0,(%eax),%eax
 1d8:	00 01                	add    %al,(%ecx)
 1da:	9c                   	pushf  
 1db:	12 03                	adc    (%ebx),%al
 1dd:	00 00                	add    %al,(%eax)
 1df:	11 64 73 74          	adc    %esp,0x74(%ebx,%esi,2)
 1e3:	00 01                	add    %al,(%ecx)
 1e5:	8e 12                	mov    (%edx),%ss
 1e7:	03 00                	add    (%eax),%eax
 1e9:	00 02                	add    %al,(%edx)
 1eb:	91                   	xchg   %eax,%ecx
 1ec:	00 0f                	add    %cl,(%edi)
 1ee:	31 02                	xor    %eax,(%edx)
 1f0:	00 00                	add    %al,(%eax)
 1f2:	01 8e 5e 00 00 00    	add    %ecx,0x5e(%esi)
 1f8:	02 91 04 14 14 03    	add    0x3141404(%ecx),%dl
 1fe:	00 00                	add    %al,(%eax)
 200:	1c 8d                	sbb    $0x8d,%al
 202:	00 00                	add    %al,(%eax)
 204:	00 00                	add    %al,(%eax)
 206:	00 00                	add    %al,(%eax)
 208:	01 91 c6 01 00 00    	add    %edx,0x1c6(%ecx)
 20e:	15 57 06 00 00       	adc    $0x657,%eax
 213:	1c 8d                	sbb    $0x8d,%al
 215:	00 00                	add    %al,(%eax)
 217:	18 00                	sbb    %al,(%eax)
 219:	00 00                	add    %al,(%eax)
 21b:	01 89 16 67 06 00    	add    %ecx,0x66716(%ecx)
 221:	00 d1                	add    %dl,%cl
 223:	00 00                	add    %al,(%eax)
 225:	00 17                	add    %dl,(%edi)
 227:	18 00                	sbb    %al,(%eax)
 229:	00 00                	add    %al,(%eax)
 22b:	18 72 06             	sbb    %dh,0x6(%edx)
 22e:	00 00                	add    %al,(%eax)
 230:	00 00                	add    %al,(%eax)
 232:	00 19                	add    %bl,(%ecx)
 234:	7e 06                	jle    23c <PROT_MODE_DSEG+0x22c>
 236:	00 00                	add    %al,(%eax)
 238:	2f                   	das    
 239:	8d 00                	lea    (%eax),%eax
 23b:	00 08                	add    %cl,(%eax)
 23d:	00 00                	add    %al,(%eax)
 23f:	00 01                	add    %al,(%ecx)
 241:	93                   	xchg   %eax,%ebx
 242:	ec                   	in     (%dx),%al
 243:	01 00                	add    %eax,(%eax)
 245:	00 16                	add    %dl,(%esi)
 247:	91                   	xchg   %eax,%ecx
 248:	06                   	push   %es
 249:	00 00                	add    %al,(%eax)
 24b:	e7 00                	out    %eax,$0x0
 24d:	00 00                	add    %al,(%eax)
 24f:	16                   	push   %ss
 250:	86 06                	xchg   %al,(%esi)
 252:	00 00                	add    %al,(%eax)
 254:	fb                   	sti    
 255:	00 00                	add    %al,(%eax)
 257:	00 00                	add    %al,(%eax)
 259:	19 7e 06             	sbb    %edi,0x6(%esi)
 25c:	00 00                	add    %al,(%eax)
 25e:	37                   	aaa    
 25f:	8d 00                	lea    (%eax),%eax
 261:	00 08                	add    %cl,(%eax)
 263:	00 00                	add    %al,(%eax)
 265:	00 01                	add    %al,(%ecx)
 267:	94                   	xchg   %eax,%esp
 268:	12 02                	adc    (%edx),%al
 26a:	00 00                	add    %al,(%eax)
 26c:	16                   	push   %ss
 26d:	91                   	xchg   %eax,%ecx
 26e:	06                   	push   %es
 26f:	00 00                	add    %al,(%eax)
 271:	11 01                	adc    %eax,(%ecx)
 273:	00 00                	add    %al,(%eax)
 275:	16                   	push   %ss
 276:	86 06                	xchg   %al,(%esi)
 278:	00 00                	add    %al,(%eax)
 27a:	24 01                	and    $0x1,%al
 27c:	00 00                	add    %al,(%eax)
 27e:	00 14 7e             	add    %dl,(%esi,%edi,2)
 281:	06                   	push   %es
 282:	00 00                	add    %al,(%eax)
 284:	41                   	inc    %ecx
 285:	8d 00                	lea    (%eax),%eax
 287:	00 30                	add    %dh,(%eax)
 289:	00 00                	add    %al,(%eax)
 28b:	00 01                	add    %al,(%ecx)
 28d:	95                   	xchg   %eax,%ebp
 28e:	38 02                	cmp    %al,(%edx)
 290:	00 00                	add    %al,(%eax)
 292:	16                   	push   %ss
 293:	91                   	xchg   %eax,%ecx
 294:	06                   	push   %es
 295:	00 00                	add    %al,(%eax)
 297:	3a 01                	cmp    (%ecx),%al
 299:	00 00                	add    %al,(%eax)
 29b:	16                   	push   %ss
 29c:	86 06                	xchg   %al,(%esi)
 29e:	00 00                	add    %al,(%eax)
 2a0:	4e                   	dec    %esi
 2a1:	01 00                	add    %eax,(%eax)
 2a3:	00 00                	add    %al,(%eax)
 2a5:	14 7e                	adc    $0x7e,%al
 2a7:	06                   	push   %es
 2a8:	00 00                	add    %al,(%eax)
 2aa:	4c                   	dec    %esp
 2ab:	8d 00                	lea    (%eax),%eax
 2ad:	00 48 00             	add    %cl,0x0(%eax)
 2b0:	00 00                	add    %al,(%eax)
 2b2:	01 96 5e 02 00 00    	add    %edx,0x25e(%esi)
 2b8:	16                   	push   %ss
 2b9:	91                   	xchg   %eax,%ecx
 2ba:	06                   	push   %es
 2bb:	00 00                	add    %al,(%eax)
 2bd:	64 01 00             	add    %eax,%fs:(%eax)
 2c0:	00 16                	add    %dl,(%esi)
 2c2:	86 06                	xchg   %al,(%esi)
 2c4:	00 00                	add    %al,(%eax)
 2c6:	78 01                	js     2c9 <PROT_MODE_DSEG+0x2b9>
 2c8:	00 00                	add    %al,(%eax)
 2ca:	00 14 7e             	add    %dl,(%esi,%edi,2)
 2cd:	06                   	push   %es
 2ce:	00 00                	add    %al,(%eax)
 2d0:	57                   	push   %edi
 2d1:	8d 00                	lea    (%eax),%eax
 2d3:	00 60 00             	add    %ah,0x0(%eax)
 2d6:	00 00                	add    %al,(%eax)
 2d8:	01 97 84 02 00 00    	add    %edx,0x284(%edi)
 2de:	16                   	push   %ss
 2df:	91                   	xchg   %eax,%ecx
 2e0:	06                   	push   %es
 2e1:	00 00                	add    %al,(%eax)
 2e3:	8e 01                	mov    (%ecx),%es
 2e5:	00 00                	add    %al,(%eax)
 2e7:	16                   	push   %ss
 2e8:	86 06                	xchg   %al,(%esi)
 2ea:	00 00                	add    %al,(%eax)
 2ec:	a8 01                	test   $0x1,%al
 2ee:	00 00                	add    %al,(%eax)
 2f0:	00 19                	add    %bl,(%ecx)
 2f2:	7e 06                	jle    2fa <PROT_MODE_DSEG+0x2ea>
 2f4:	00 00                	add    %al,(%eax)
 2f6:	63 8d 00 00 08 00    	arpl   %cx,0x80000(%ebp)
 2fc:	00 00                	add    %al,(%eax)
 2fe:	01 98 aa 02 00 00    	add    %ebx,0x2aa(%eax)
 304:	16                   	push   %ss
 305:	91                   	xchg   %eax,%ecx
 306:	06                   	push   %es
 307:	00 00                	add    %al,(%eax)
 309:	be 01 00 00 16       	mov    $0x16000001,%esi
 30e:	86 06                	xchg   %al,(%esi)
 310:	00 00                	add    %al,(%eax)
 312:	d3 01                	roll   %cl,(%ecx)
 314:	00 00                	add    %al,(%eax)
 316:	00 19                	add    %bl,(%ecx)
 318:	14 03                	adc    $0x3,%al
 31a:	00 00                	add    %al,(%eax)
 31c:	6b 8d 00 00 08 00 00 	imul   $0x0,0x80000(%ebp),%ecx
 323:	00 01                	add    %al,(%ecx)
 325:	9b                   	fwait
 326:	e6 02                	out    %al,$0x2
 328:	00 00                	add    %al,(%eax)
 32a:	1a 57 06             	sbb    0x6(%edi),%dl
 32d:	00 00                	add    %al,(%eax)
 32f:	6b 8d 00 00 01 00 00 	imul   $0x0,0x10000(%ebp),%ecx
 336:	00 01                	add    %al,(%ecx)
 338:	89 16                	mov    %edx,(%esi)
 33a:	67 06                	addr16 push %es
 33c:	00 00                	add    %al,(%eax)
 33e:	e9 01 00 00 1b       	jmp    1b000344 <_end+0x1aff6f98>
 343:	6b 8d 00 00 01 00 00 	imul   $0x0,0x10000(%ebp),%ecx
 34a:	00 18                	add    %bl,(%eax)
 34c:	72 06                	jb     354 <PROT_MODE_DSEG+0x344>
 34e:	00 00                	add    %al,(%eax)
 350:	00 00                	add    %al,(%eax)
 352:	00 1a                	add    %bl,(%edx)
 354:	29 06                	sub    %eax,(%esi)
 356:	00 00                	add    %al,(%eax)
 358:	73 8d                	jae    2e7 <PROT_MODE_DSEG+0x2d7>
 35a:	00 00                	add    %al,(%eax)
 35c:	10 00                	adc    %al,(%eax)
 35e:	00 00                	add    %al,(%eax)
 360:	01 9e 16 4b 06 00    	add    %ebx,0x64b16(%esi)
 366:	00 ff                	add    %bh,%bh
 368:	01 00                	add    %eax,(%eax)
 36a:	00 16                	add    %dl,(%esi)
 36c:	40                   	inc    %eax
 36d:	06                   	push   %es
 36e:	00 00                	add    %al,(%eax)
 370:	14 02                	adc    $0x2,%al
 372:	00 00                	add    %al,(%eax)
 374:	16                   	push   %ss
 375:	35 06 00 00 28       	xor    $0x28000006,%eax
 37a:	02 00                	add    (%eax),%al
 37c:	00 00                	add    %al,(%eax)
 37e:	00 1c 04             	add    %bl,(%esp,%eax,1)
 381:	1d 07 00 00 00       	sbb    $0x7,%eax
 386:	01 86 01 0d 3a 01    	add    %eax,0x13a0d01(%esi)
 38c:	00 00                	add    %al,(%eax)
 38e:	01 7b ca             	add    %edi,-0x36(%ebx)
 391:	8c 00                	mov    %es,(%eax)
 393:	00 26                	add    %ah,(%esi)
 395:	00 00                	add    %al,(%eax)
 397:	00 01                	add    %al,(%ecx)
 399:	9c                   	pushf  
 39a:	64 03 00             	add    %fs:(%eax),%eax
 39d:	00 11                	add    %dl,(%ecx)
 39f:	6e                   	outsb  %ds:(%esi),(%dx)
 3a0:	00 01                	add    %al,(%ecx)
 3a2:	7b 57                	jnp    3fb <PROT_MODE_DSEG+0x3eb>
 3a4:	00 00                	add    %al,(%eax)
 3a6:	00 02                	add    %al,(%edx)
 3a8:	91                   	xchg   %eax,%ecx
 3a9:	00 11                	add    %dl,(%ecx)
 3ab:	73 00                	jae    3ad <PROT_MODE_DSEG+0x39d>
 3ad:	01 7b cf             	add    %edi,-0x31(%ebx)
 3b0:	00 00                	add    %al,(%eax)
 3b2:	00 02                	add    %al,(%edx)
 3b4:	91                   	xchg   %eax,%ecx
 3b5:	04 09                	add    $0x9,%al
 3b7:	68 65 78 00 01       	push   $0x1007865
 3bc:	7d 64                	jge    422 <PROT_MODE_DSEG+0x412>
 3be:	03 00                	add    (%eax),%eax
 3c0:	00 05 03 e0 92 00    	add    %al,0x92e003
 3c6:	00 13                	add    %dl,(%ebx)
 3c8:	eb 8c                	jmp    356 <PROT_MODE_DSEG+0x346>
 3ca:	00 00                	add    %al,(%eax)
 3cc:	cc                   	int3   
 3cd:	03 00                	add    (%eax),%eax
 3cf:	00 00                	add    %al,(%eax)
 3d1:	0a 9c 00 00 00 74 03 	or     0x3740000(%eax,%eax,1),%bl
 3d8:	00 00                	add    %al,(%eax)
 3da:	0b 7e 00             	or     0x0(%esi),%edi
 3dd:	00 00                	add    %al,(%eax)
 3df:	10 00                	adc    %al,(%eax)
 3e1:	0d 27 01 00 00       	or     $0x127,%eax
 3e6:	01 73 a4             	add    %esi,-0x5c(%ebx)
 3e9:	8c 00                	mov    %es,(%eax)
 3eb:	00 26                	add    %ah,(%esi)
 3ed:	00 00                	add    %al,(%eax)
 3ef:	00 01                	add    %al,(%ecx)
 3f1:	9c                   	pushf  
 3f2:	bc 03 00 00 11       	mov    $0x11000003,%esp
 3f7:	6e                   	outsb  %ds:(%esi),(%dx)
 3f8:	00 01                	add    %al,(%ecx)
 3fa:	73 57                	jae    453 <PROT_MODE_DSEG+0x443>
 3fc:	00 00                	add    %al,(%eax)
 3fe:	00 02                	add    %al,(%edx)
 400:	91                   	xchg   %eax,%ecx
 401:	00 11                	add    %dl,(%ecx)
 403:	73 00                	jae    405 <PROT_MODE_DSEG+0x3f5>
 405:	01 73 cf             	add    %esi,-0x31(%ebx)
 408:	00 00                	add    %al,(%eax)
 40a:	00 02                	add    %al,(%edx)
 40c:	91                   	xchg   %eax,%ecx
 40d:	04 09                	add    $0x9,%al
 40f:	64 65 63 00          	fs arpl %ax,%gs:(%eax)
 413:	01 75 bc             	add    %esi,-0x44(%ebp)
 416:	03 00                	add    (%eax),%eax
 418:	00 05 03 f4 92 00    	add    %al,0x92f403
 41e:	00 13                	add    %dl,(%ebx)
 420:	c5 8c 00 00 cc 03 00 	lds    0x3cc00(%eax,%eax,1),%ecx
 427:	00 00                	add    %al,(%eax)
 429:	0a 9c 00 00 00 cc 03 	or     0x3cc0000(%eax,%eax,1),%bl
 430:	00 00                	add    %al,(%eax)
 432:	0b 7e 00             	or     0x0(%esi),%edi
 435:	00 00                	add    %al,(%eax)
 437:	0a 00                	or     (%eax),%al
 439:	0d 6a 01 00 00       	or     $0x16a,%eax
 43e:	01 61 43             	add    %esp,0x43(%ecx)
 441:	8c 00                	mov    %es,(%eax)
 443:	00 61 00             	add    %ah,0x0(%ecx)
 446:	00 00                	add    %al,(%eax)
 448:	01 9c 3c 04 00 00 0e 	add    %ebx,0xe000004(%esp,%edi,1)
 44f:	6e                   	outsb  %ds:(%esi),(%dx)
 450:	00 01                	add    %al,(%ecx)
 452:	61                   	popa   
 453:	57                   	push   %edi
 454:	00 00                	add    %al,(%eax)
 456:	00 3e                	add    %bh,(%esi)
 458:	02 00                	add    (%eax),%al
 45a:	00 11                	add    %dl,(%ecx)
 45c:	73 00                	jae    45e <PROT_MODE_DSEG+0x44e>
 45e:	01 61 cf             	add    %esp,-0x31(%ecx)
 461:	00 00                	add    %al,(%eax)
 463:	00 02                	add    %al,(%edx)
 465:	91                   	xchg   %eax,%ecx
 466:	04 0f                	add    $0xf,%al
 468:	b4 01                	mov    $0x1,%ah
 46a:	00 00                	add    %al,(%eax)
 46c:	01 61 57             	add    %esp,0x57(%ecx)
 46f:	00 00                	add    %al,(%eax)
 471:	00 02                	add    %al,(%edx)
 473:	91                   	xchg   %eax,%ecx
 474:	08 0f                	or     %cl,(%edi)
 476:	ca 03 00             	lret   $0x3
 479:	00 01                	add    %al,(%ecx)
 47b:	61                   	popa   
 47c:	cf                   	iret   
 47d:	00 00                	add    %al,(%eax)
 47f:	00 02                	add    %al,(%edx)
 481:	91                   	xchg   %eax,%ecx
 482:	0c 1e                	or     $0x1e,%al
 484:	69 00 01 63 57 00    	imul   $0x576301,(%eax),%eax
 48a:	00 00                	add    %al,(%eax)
 48c:	5d                   	pop    %ebp
 48d:	02 00                	add    (%eax),%al
 48f:	00 12                	add    %dl,(%edx)
 491:	98                   	cwtl   
 492:	01 00                	add    %eax,(%eax)
 494:	00 01                	add    %al,(%ecx)
 496:	63 57 00             	arpl   %dx,0x0(%edi)
 499:	00 00                	add    %al,(%eax)
 49b:	91                   	xchg   %eax,%ecx
 49c:	02 00                	add    (%eax),%al
 49e:	00 1f                	add    %bl,(%edi)
 4a0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
 4a1:	8c 00                	mov    %es,(%eax)
 4a3:	00 3c 04             	add    %bh,(%esp,%eax,1)
 4a6:	00 00                	add    %al,(%eax)
 4a8:	00 0d 9d 01 00 00    	add    %cl,0x19d
 4ae:	01 52 16             	add    %edx,0x16(%edx)
 4b1:	8c 00                	mov    %es,(%eax)
 4b3:	00 2d 00 00 00 01    	add    %ch,0x1000000
 4b9:	9c                   	pushf  
 4ba:	8c 04 00             	mov    %es,(%eax,%eax,1)
 4bd:	00 11                	add    %dl,(%ecx)
 4bf:	73 00                	jae    4c1 <PROT_MODE_DSEG+0x4b1>
 4c1:	01 52 cf             	add    %edx,-0x31(%edx)
 4c4:	00 00                	add    %al,(%eax)
 4c6:	00 02                	add    %al,(%edx)
 4c8:	91                   	xchg   %eax,%ecx
 4c9:	00 1e                	add    %bl,(%esi)
 4cb:	69 00 01 54 57 00    	imul   $0x575401,(%eax),%eax
 4d1:	00 00                	add    %al,(%eax)
 4d3:	a5                   	movsl  %ds:(%esi),%es:(%edi)
 4d4:	02 00                	add    (%eax),%al
 4d6:	00 09                	add    %cl,(%ecx)
 4d8:	6a 00                	push   $0x0
 4da:	01 54 57 00          	add    %edx,0x0(%edi,%edx,2)
 4de:	00 00                	add    %al,(%eax)
 4e0:	01 50 1e             	add    %edx,0x1e(%eax)
 4e3:	63 00                	arpl   %ax,(%eax)
 4e5:	01 55 9c             	add    %edx,-0x64(%ebp)
 4e8:	00 00                	add    %al,(%eax)
 4ea:	00 c4                	add    %al,%ah
 4ec:	02 00                	add    (%eax),%al
 4ee:	00 13                	add    %dl,(%ebx)
 4f0:	24 8c                	and    $0x8c,%al
 4f2:	00 00                	add    %al,(%eax)
 4f4:	8c 04 00             	mov    %es,(%eax,%eax,1)
 4f7:	00 00                	add    %al,(%eax)
 4f9:	20 87 01 00 00 01    	and    %al,0x1000001(%edi)
 4ff:	47                   	inc    %edi
 500:	57                   	push   %edi
 501:	00 00                	add    %al,(%eax)
 503:	00 03                	add    %al,(%ebx)
 505:	8c 00                	mov    %es,(%eax)
 507:	00 13                	add    %dl,(%ebx)
 509:	00 00                	add    %al,(%eax)
 50b:	00 01                	add    %al,(%ecx)
 50d:	9c                   	pushf  
 50e:	c0 04 00 00          	rolb   $0x0,(%eax,%eax,1)
 512:	0e                   	push   %cs
 513:	73 00                	jae    515 <PROT_MODE_DSEG+0x505>
 515:	01 47 c0             	add    %eax,-0x40(%edi)
 518:	04 00                	add    $0x0,%al
 51a:	00 d7                	add    %dl,%bh
 51c:	02 00                	add    (%eax),%al
 51e:	00 1e                	add    %bl,(%esi)
 520:	6e                   	outsb  %ds:(%esi),(%dx)
 521:	00 01                	add    %al,(%ecx)
 523:	49                   	dec    %ecx
 524:	57                   	push   %edi
 525:	00 00                	add    %al,(%eax)
 527:	00 fc                	add    %bh,%ah
 529:	02 00                	add    (%eax),%al
 52b:	00 00                	add    %al,(%eax)
 52d:	06                   	push   %es
 52e:	04 a8                	add    $0xa8,%al
 530:	00 00                	add    %al,(%eax)
 532:	00 0d 71 00 00 00    	add    %cl,0x71
 538:	01 3b                	add    %edi,(%ebx)
 53a:	f0 8c 00             	lock mov %es,(%eax)
 53d:	00 2b                	add    %ch,(%ebx)
 53f:	00 00                	add    %al,(%eax)
 541:	00 01                	add    %al,(%ecx)
 543:	9c                   	pushf  
 544:	fb                   	sti    
 545:	04 00                	add    $0x0,%al
 547:	00 0e                	add    %cl,(%esi)
 549:	69 00 01 3b 4c 00    	imul   $0x4c3b01,(%eax),%eax
 54f:	00 00                	add    %al,(%eax)
 551:	1b 03                	sbb    (%ebx),%eax
 553:	00 00                	add    %al,(%eax)
 555:	13 0d 8d 00 00 1c    	adc    0x1c00008d,%ecx
 55b:	03 00                	add    (%eax),%eax
 55d:	00 1f                	add    %bl,(%edi)
 55f:	1b 8d 00 00 48 05    	sbb    0x5480000(%ebp),%ecx
 565:	00 00                	add    %al,(%eax)
 567:	00 0d 6b 00 00 00    	add    %cl,0x6b
 56d:	01 2f                	add    %ebp,(%edi)
 56f:	ec                   	in     (%dx),%al
 570:	8b 00                	mov    (%eax),%eax
 572:	00 17                	add    %dl,(%edi)
 574:	00 00                	add    %al,(%eax)
 576:	00 01                	add    %al,(%ecx)
 578:	9c                   	pushf  
 579:	26 05 00 00 11 6d    	es add $0x6d110000,%eax
 57f:	00 01                	add    %al,(%ecx)
 581:	2f                   	das    
 582:	cf                   	iret   
 583:	00 00                	add    %al,(%eax)
 585:	00 02                	add    %al,(%edx)
 587:	91                   	xchg   %eax,%ecx
 588:	00 13                	add    %dl,(%ebx)
 58a:	fd                   	std    
 58b:	8b 00                	mov    (%eax),%eax
 58d:	00 7c 05 00          	add    %bh,0x0(%ebp,%eax,1)
 591:	00 00                	add    %al,(%eax)
 593:	0d 5f 00 00 00       	or     $0x5f,%eax
 598:	01 29                	add    %ebp,(%ecx)
 59a:	d4 8b                	aam    $0x8b
 59c:	00 00                	add    %al,(%eax)
 59e:	18 00                	sbb    %al,(%eax)
 5a0:	00 00                	add    %al,(%eax)
 5a2:	01 9c 48 05 00 00 11 	add    %ebx,0x11000005(%eax,%ecx,2)
 5a9:	72 00                	jb     5ab <PROT_MODE_DSEG+0x59b>
 5ab:	01 29                	add    %ebp,(%ecx)
 5ad:	57                   	push   %edi
 5ae:	00 00                	add    %al,(%eax)
 5b0:	00 02                	add    %al,(%edx)
 5b2:	91                   	xchg   %eax,%ecx
 5b3:	00 00                	add    %al,(%eax)
 5b5:	0d 10 00 00 00       	or     $0x10,%eax
 5ba:	01 22                	add    %esp,(%edx)
 5bc:	86 8b 00 00 4e 00    	xchg   %cl,0x4e0000(%ebx)
 5c2:	00 00                	add    %al,(%eax)
 5c4:	01 9c 7c 05 00 00 11 	add    %ebx,0x11000005(%esp,%edi,2)
 5cb:	73 00                	jae    5cd <PROT_MODE_DSEG+0x5bd>
 5cd:	01 22                	add    %esp,(%edx)
 5cf:	cf                   	iret   
 5d0:	00 00                	add    %al,(%eax)
 5d2:	00 02                	add    %al,(%edx)
 5d4:	91                   	xchg   %eax,%ecx
 5d5:	00 13                	add    %dl,(%ebx)
 5d7:	bf 8b 00 00 7c       	mov    $0x7c00008b,%edi
 5dc:	05 00 00 13 cc       	add    $0xcc130000,%eax
 5e1:	8b 00                	mov    (%eax),%eax
 5e3:	00 7c 05 00          	add    %bh,0x0(%ebp,%eax,1)
 5e7:	00 00                	add    %al,(%eax)
 5e9:	20 6f 01             	and    %ch,0x1(%edi)
 5ec:	00 00                	add    %al,(%eax)
 5ee:	01 12                	add    %edx,(%edx)
 5f0:	57                   	push   %edi
 5f1:	00 00                	add    %al,(%eax)
 5f3:	00 50 8b             	add    %dl,-0x75(%eax)
 5f6:	00 00                	add    %al,(%eax)
 5f8:	36 00 00             	add    %al,%ss:(%eax)
 5fb:	00 01                	add    %al,(%ecx)
 5fd:	9c                   	pushf  
 5fe:	e1 05                	loope  605 <PROT_MODE_DSEG+0x5f5>
 600:	00 00                	add    %al,(%eax)
 602:	11 72 00             	adc    %esi,0x0(%edx)
 605:	01 12                	add    %edx,(%edx)
 607:	57                   	push   %edi
 608:	00 00                	add    %al,(%eax)
 60a:	00 02                	add    %al,(%edx)
 60c:	91                   	xchg   %eax,%ecx
 60d:	00 11                	add    %dl,(%ecx)
 60f:	63 00                	arpl   %ax,(%eax)
 611:	01 12                	add    %edx,(%edx)
 613:	57                   	push   %edi
 614:	00 00                	add    %al,(%eax)
 616:	00 02                	add    %al,(%edx)
 618:	91                   	xchg   %eax,%ecx
 619:	04 0f                	add    $0xf,%al
 61b:	64 01 00             	add    %eax,%fs:(%eax)
 61e:	00 01                	add    %al,(%ecx)
 620:	12 57 00             	adc    0x0(%edi),%dl
 623:	00 00                	add    %al,(%eax)
 625:	02 91 08 10 64 00    	add    0x641008(%ecx),%dl
 62b:	00 00                	add    %al,(%eax)
 62d:	01 12                	add    %edx,(%edx)
 62f:	c0 04 00 00          	rolb   $0x0,(%eax,%eax,1)
 633:	2f                   	das    
 634:	03 00                	add    (%eax),%eax
 636:	00 1e                	add    %bl,(%esi)
 638:	6c                   	insb   (%dx),%es:(%edi)
 639:	00 01                	add    %al,(%ecx)
 63b:	14 57                	adc    $0x57,%al
 63d:	00 00                	add    %al,(%eax)
 63f:	00 b5 03 00 00 13    	add    %dh,0x13000003(%ebp)
 645:	78 8b                	js     5d2 <PROT_MODE_DSEG+0x5c2>
 647:	00 00                	add    %al,(%eax)
 649:	e1 05                	loope  650 <PROT_MODE_DSEG+0x640>
 64b:	00 00                	add    %al,(%eax)
 64d:	00 0d 3f 01 00 00    	add    %cl,0x13f
 653:	01 09                	add    %ecx,(%ecx)
 655:	2a 8b 00 00 26 00    	sub    0x260000(%ebx),%cl
 65b:	00 00                	add    %al,(%eax)
 65d:	01 9c 29 06 00 00 11 	add    %ebx,0x11000006(%ecx,%ebp,1)
 664:	6c                   	insb   (%dx),%es:(%edi)
 665:	00 01                	add    %al,(%ecx)
 667:	09 57 00             	or     %edx,0x0(%edi)
 66a:	00 00                	add    %al,(%eax)
 66c:	02 91 00 0f 64 01    	add    0x1640f00(%ecx),%dl
 672:	00 00                	add    %al,(%eax)
 674:	01 09                	add    %ecx,(%ecx)
 676:	57                   	push   %edi
 677:	00 00                	add    %al,(%eax)
 679:	00 02                	add    %al,(%edx)
 67b:	91                   	xchg   %eax,%ecx
 67c:	04 11                	add    $0x11,%al
 67e:	63 68 00             	arpl   %bp,0x0(%eax)
 681:	01 09                	add    %ecx,(%ecx)
 683:	9c                   	pushf  
 684:	00 00                	add    %al,(%eax)
 686:	00 02                	add    %al,(%edx)
 688:	91                   	xchg   %eax,%ecx
 689:	08 09                	or     %cl,(%ecx)
 68b:	70 00                	jo     68d <PROT_MODE_DSEG+0x67d>
 68d:	01 0b                	add    %ecx,(%ebx)
 68f:	96                   	xchg   %eax,%esi
 690:	00 00                	add    %al,(%eax)
 692:	00 01                	add    %al,(%ecx)
 694:	50                   	push   %eax
 695:	00 21                	add    %ah,(%ecx)
 697:	a4                   	movsb  %ds:(%esi),%es:(%edi)
 698:	00 00                	add    %al,(%eax)
 69a:	00 02                	add    %al,(%edx)
 69c:	2d 03 57 06 00       	sub    $0x65703,%eax
 6a1:	00 22                	add    %ah,(%edx)
 6a3:	93                   	xchg   %eax,%ebx
 6a4:	01 00                	add    %eax,(%eax)
 6a6:	00 02                	add    %al,(%edx)
 6a8:	2d 57 00 00 00       	sub    $0x57,%eax
 6ad:	22 e6                	and    %dh,%ah
 6af:	03 00                	add    (%eax),%eax
 6b1:	00 02                	add    %al,(%edx)
 6b3:	2d 12 03 00 00       	sub    $0x312,%eax
 6b8:	23 63 6e             	and    0x6e(%ebx),%esp
 6bb:	74 00                	je     6bd <PROT_MODE_DSEG+0x6ad>
 6bd:	02 2d 57 00 00 00    	add    0x57,%ch
 6c3:	00 24 69             	add    %ah,(%ecx,%ebp,2)
 6c6:	6e                   	outsb  %ds:(%esi),(%dx)
 6c7:	62 00                	bound  %eax,(%eax)
 6c9:	02 25 2c 00 00 00    	add    0x2c,%ah
 6cf:	03 7e 06             	add    0x6(%esi),%edi
 6d2:	00 00                	add    %al,(%eax)
 6d4:	22 93 01 00 00 02    	and    0x2000001(%ebx),%dl
 6da:	25 57 00 00 00       	and    $0x57,%eax
 6df:	25 8e 01 00 00       	and    $0x18e,%eax
 6e4:	02 27                	add    (%edi),%ah
 6e6:	2c 00                	sub    $0x0,%al
 6e8:	00 00                	add    %al,(%eax)
 6ea:	00 26                	add    %ah,(%esi)
 6ec:	9f                   	lahf   
 6ed:	00 00                	add    %al,(%eax)
 6ef:	00 02                	add    %al,(%edx)
 6f1:	19 03                	sbb    %eax,(%ebx)
 6f3:	22 93 01 00 00 02    	and    0x2000001(%ebx),%dl
 6f9:	19 57 00             	sbb    %edx,0x0(%edi)
 6fc:	00 00                	add    %al,(%eax)
 6fe:	22 8e 01 00 00 02    	and    0x2000001(%esi),%cl
 704:	19 2c 00             	sbb    %ebp,(%eax,%eax,1)
 707:	00 00                	add    %al,(%eax)
 709:	00 00                	add    %al,(%eax)
 70b:	c2 06 00             	ret    $0x6
 70e:	00 04 00             	add    %al,(%eax,%eax,1)
 711:	1c 02                	sbb    $0x2,%al
 713:	00 00                	add    %al,(%eax)
 715:	04 01                	add    $0x1,%al
 717:	a9 00 00 00 0c       	test   $0xc000000,%eax
 71c:	69 04 00 00 2b 00 00 	imul   $0x2b00,(%eax,%eax,1),%eax
 723:	00 cf                	add    %cl,%bh
 725:	8d 00                	lea    (%eax),%eax
 727:	00 94 01 00 00 fb 01 	add    %dl,0x1fb0000(%ecx,%eax,1)
 72e:	00 00                	add    %al,(%eax)
 730:	02 01                	add    (%ecx),%al
 732:	06                   	push   %es
 733:	2e 01 00             	add    %eax,%cs:(%eax)
 736:	00 03                	add    %al,(%ebx)
 738:	97                   	xchg   %eax,%edi
 739:	00 00                	add    %al,(%eax)
 73b:	00 02                	add    %al,(%edx)
 73d:	0d 37 00 00 00       	or     $0x37,%eax
 742:	02 01                	add    (%ecx),%al
 744:	08 2c 01             	or     %ch,(%ecx,%eax,1)
 747:	00 00                	add    %al,(%eax)
 749:	02 02                	add    (%edx),%al
 74b:	05 18 00 00 00       	add    $0x18,%eax
 750:	03 53 03             	add    0x3(%ebx),%edx
 753:	00 00                	add    %al,(%eax)
 755:	02 0f                	add    (%edi),%cl
 757:	50                   	push   %eax
 758:	00 00                	add    %al,(%eax)
 75a:	00 02                	add    %al,(%edx)
 75c:	02 07                	add    (%edi),%al
 75e:	74 01                	je     761 <PROT_MODE_DSEG+0x751>
 760:	00 00                	add    %al,(%eax)
 762:	04 04                	add    $0x4,%al
 764:	05 69 6e 74 00       	add    $0x746e69,%eax
 769:	03 5b 01             	add    0x1(%ebx),%ebx
 76c:	00 00                	add    %al,(%eax)
 76e:	02 11                	add    (%ecx),%dl
 770:	69 00 00 00 02 04    	imul   $0x4020000,(%eax),%eax
 776:	07                   	pop    %es
 777:	4e                   	dec    %esi
 778:	01 00                	add    %eax,(%eax)
 77a:	00 02                	add    %al,(%edx)
 77c:	08 05 0d 01 00 00    	or     %al,0x10d
 782:	03 0c 02             	add    (%edx,%eax,1),%ecx
 785:	00 00                	add    %al,(%eax)
 787:	02 13                	add    (%ebx),%dl
 789:	82 00 00             	addb   $0x0,(%eax)
 78c:	00 02                	add    %al,(%edx)
 78e:	08 07                	or     %al,(%edi)
 790:	44                   	inc    %esp
 791:	01 00                	add    %eax,(%eax)
 793:	00 05 10 02 65 d9    	add    %al,0xd9650210
 799:	00 00                	add    %al,(%eax)
 79b:	00 06                	add    %al,(%esi)
 79d:	45                   	inc    %ebp
 79e:	03 00                	add    (%eax),%eax
 7a0:	00 02                	add    %al,(%edx)
 7a2:	67 2c 00             	addr16 sub $0x0,%al
 7a5:	00 00                	add    %al,(%eax)
 7a7:	00 06                	add    %al,(%esi)
 7a9:	27                   	daa    
 7aa:	03 00                	add    (%eax),%eax
 7ac:	00 02                	add    %al,(%edx)
 7ae:	6a d9                	push   $0xffffffd9
 7b0:	00 00                	add    %al,(%eax)
 7b2:	00 01                	add    %al,(%ecx)
 7b4:	07                   	pop    %es
 7b5:	69 64 00 02 6b 2c 00 	imul   $0x2c6b,0x2(%eax,%eax,1),%esp
 7bc:	00 
 7bd:	00 04 06             	add    %al,(%esi,%eax,1)
 7c0:	d8 03                	fadds  (%ebx)
 7c2:	00 00                	add    %al,(%eax)
 7c4:	02 6f d9             	add    -0x27(%edi),%ch
 7c7:	00 00                	add    %al,(%eax)
 7c9:	00 05 06 1c 04 00    	add    %al,0x41c06
 7cf:	00 02                	add    %al,(%edx)
 7d1:	70 5e                	jo     831 <PROT_MODE_DSEG+0x821>
 7d3:	00 00                	add    %al,(%eax)
 7d5:	00 08                	add    %cl,(%eax)
 7d7:	06                   	push   %es
 7d8:	d8 04 00             	fadds  (%eax,%eax,1)
 7db:	00 02                	add    %al,(%edx)
 7dd:	71 5e                	jno    83d <PROT_MODE_DSEG+0x82d>
 7df:	00 00                	add    %al,(%eax)
 7e1:	00 0c 00             	add    %cl,(%eax,%eax,1)
 7e4:	08 2c 00             	or     %ch,(%eax,%eax,1)
 7e7:	00 00                	add    %al,(%eax)
 7e9:	e9 00 00 00 09       	jmp    90007ee <_end+0x8ff7442>
 7ee:	e9 00 00 00 02       	jmp    20007f3 <_end+0x1ff7447>
 7f3:	00 02                	add    %al,(%edx)
 7f5:	04 07                	add    $0x7,%al
 7f7:	22 00                	and    (%eax),%al
 7f9:	00 00                	add    %al,(%eax)
 7fb:	0a 6d 62             	or     0x62(%ebp),%ch
 7fe:	72 00                	jb     800 <PROT_MODE_DSEG+0x7f0>
 800:	00 02                	add    %al,(%edx)
 802:	02 61 31             	add    0x31(%ecx),%ah
 805:	01 00                	add    %eax,(%eax)
 807:	00 06                	add    %al,(%esi)
 809:	38 02                	cmp    %al,(%edx)
 80b:	00 00                	add    %al,(%eax)
 80d:	02 63 31             	add    0x31(%ebx),%ah
 810:	01 00                	add    %eax,(%eax)
 812:	00 00                	add    %al,(%eax)
 814:	0b bf 01 00 00 02    	or     0x2000001(%edi),%edi
 81a:	64 42                	fs inc %edx
 81c:	01 00                	add    %eax,(%eax)
 81e:	00 b4 01 0b ca 02 00 	add    %dh,0x2ca0b(%ecx,%eax,1)
 825:	00 02                	add    %al,(%edx)
 827:	72 52                	jb     87b <PROT_MODE_DSEG+0x86b>
 829:	01 00                	add    %eax,(%eax)
 82b:	00 be 01 0b 45 04    	add    %bh,0x4450b01(%esi)
 831:	00 00                	add    %al,(%eax)
 833:	02 73 62             	add    0x62(%ebx),%dh
 836:	01 00                	add    %eax,(%eax)
 838:	00 fe                	add    %bh,%dh
 83a:	01 00                	add    %eax,(%eax)
 83c:	08 2c 00             	or     %ch,(%eax,%eax,1)
 83f:	00 00                	add    %al,(%eax)
 841:	42                   	inc    %edx
 842:	01 00                	add    %eax,(%eax)
 844:	00 0c e9             	add    %cl,(%ecx,%ebp,8)
 847:	00 00                	add    %al,(%eax)
 849:	00 b3 01 00 08 2c    	add    %dh,0x2c080001(%ebx)
 84f:	00 00                	add    %al,(%eax)
 851:	00 52 01             	add    %dl,0x1(%edx)
 854:	00 00                	add    %al,(%eax)
 856:	09 e9                	or     %ebp,%ecx
 858:	00 00                	add    %al,(%eax)
 85a:	00 09                	add    %cl,(%ecx)
 85c:	00 08                	add    %cl,(%eax)
 85e:	89 00                	mov    %eax,(%eax)
 860:	00 00                	add    %al,(%eax)
 862:	62 01                	bound  %eax,(%ecx)
 864:	00 00                	add    %al,(%eax)
 866:	09 e9                	or     %ebp,%ecx
 868:	00 00                	add    %al,(%eax)
 86a:	00 03                	add    %al,(%ebx)
 86c:	00 08                	add    %cl,(%eax)
 86e:	2c 00                	sub    $0x0,%al
 870:	00 00                	add    %al,(%eax)
 872:	72 01                	jb     875 <PROT_MODE_DSEG+0x865>
 874:	00 00                	add    %al,(%eax)
 876:	09 e9                	or     %ebp,%ecx
 878:	00 00                	add    %al,(%eax)
 87a:	00 01                	add    %al,(%ecx)
 87c:	00 03                	add    %al,(%ebx)
 87e:	21 02                	and    %eax,(%edx)
 880:	00 00                	add    %al,(%eax)
 882:	02 74 f0 00          	add    0x0(%eax,%esi,8),%dh
 886:	00 00                	add    %al,(%eax)
 888:	0d 31 03 00 00       	or     $0x331,%eax
 88d:	18 02                	sbb    %al,(%edx)
 88f:	7e ba                	jle    84b <PROT_MODE_DSEG+0x83b>
 891:	01 00                	add    %eax,(%eax)
 893:	00 06                	add    %al,(%esi)
 895:	17                   	pop    %ss
 896:	04 00                	add    $0x0,%al
 898:	00 02                	add    %al,(%edx)
 89a:	7f 5e                	jg     8fa <PROT_MODE_DSEG+0x8ea>
 89c:	00 00                	add    %al,(%eax)
 89e:	00 00                	add    %al,(%eax)
 8a0:	06                   	push   %es
 8a1:	e1 03                	loope  8a6 <PROT_MODE_DSEG+0x896>
 8a3:	00 00                	add    %al,(%eax)
 8a5:	02 80 77 00 00 00    	add    0x77(%eax),%al
 8ab:	04 06                	add    $0x6,%al
 8ad:	61                   	popa   
 8ae:	03 00                	add    (%eax),%eax
 8b0:	00 02                	add    %al,(%edx)
 8b2:	81 77 00 00 00 0c 06 	xorl   $0x60c0000,0x0(%edi)
 8b9:	b0 02                	mov    $0x2,%al
 8bb:	00 00                	add    %al,(%eax)
 8bd:	02 82 5e 00 00 00    	add    0x5e(%edx),%al
 8c3:	14 00                	adc    $0x0,%al
 8c5:	03 d4                	add    %esp,%edx
 8c7:	02 00                	add    (%eax),%al
 8c9:	00 02                	add    %al,(%edx)
 8cb:	83 7d 01 00          	cmpl   $0x0,0x1(%ebp)
 8cf:	00 0d c8 01 00 00    	add    %cl,0x1c8
 8d5:	34 02                	xor    $0x2,%al
 8d7:	8b 86 02 00 00 06    	mov    0x6000002(%esi),%eax
 8dd:	d0 03                	rolb   (%ebx)
 8df:	00 00                	add    %al,(%eax)
 8e1:	02 8c 5e 00 00 00 00 	add    0x0(%esi,%ebx,2),%cl
 8e8:	06                   	push   %es
 8e9:	9c                   	pushf  
 8ea:	03 00                	add    (%eax),%eax
 8ec:	00 02                	add    %al,(%edx)
 8ee:	8d 86 02 00 00 04    	lea    0x4000002(%esi),%eax
 8f4:	06                   	push   %es
 8f5:	ae                   	scas   %es:(%edi),%al
 8f6:	02 00                	add    (%eax),%al
 8f8:	00 02                	add    %al,(%edx)
 8fa:	8e 45 00             	mov    0x0(%ebp),%es
 8fd:	00 00                	add    %al,(%eax)
 8ff:	10 06                	adc    %al,(%esi)
 901:	53                   	push   %ebx
 902:	02 00                	add    (%eax),%al
 904:	00 02                	add    %al,(%edx)
 906:	8f 45 00             	popl   0x0(%ebp)
 909:	00 00                	add    %al,(%eax)
 90b:	12 06                	adc    (%esi),%al
 90d:	f7 02 00 00 02 90    	testl  $0x90020000,(%edx)
 913:	5e                   	pop    %esi
 914:	00 00                	add    %al,(%eax)
 916:	00 14 06             	add    %dl,(%esi,%eax,1)
 919:	04 02                	add    $0x2,%al
 91b:	00 00                	add    %al,(%eax)
 91d:	02 91 5e 00 00 00    	add    0x5e(%ecx),%dl
 923:	18 06                	sbb    %al,(%esi)
 925:	bb 03 00 00 02       	mov    $0x2000003,%ebx
 92a:	92                   	xchg   %eax,%edx
 92b:	5e                   	pop    %esi
 92c:	00 00                	add    %al,(%eax)
 92e:	00 1c 06             	add    %bl,(%esi,%eax,1)
 931:	f4                   	hlt    
 932:	03 00                	add    (%eax),%eax
 934:	00 02                	add    %al,(%edx)
 936:	93                   	xchg   %eax,%ebx
 937:	5e                   	pop    %esi
 938:	00 00                	add    %al,(%eax)
 93a:	00 20                	add    %ah,(%eax)
 93c:	06                   	push   %es
 93d:	43                   	inc    %ebx
 93e:	02 00                	add    (%eax),%al
 940:	00 02                	add    %al,(%edx)
 942:	94                   	xchg   %eax,%esp
 943:	5e                   	pop    %esi
 944:	00 00                	add    %al,(%eax)
 946:	00 24 06             	add    %ah,(%esi,%eax,1)
 949:	c1 02 00             	roll   $0x0,(%edx)
 94c:	00 02                	add    %al,(%edx)
 94e:	95                   	xchg   %eax,%ebp
 94f:	45                   	inc    %ebp
 950:	00 00                	add    %al,(%eax)
 952:	00 28                	add    %ch,(%eax)
 954:	06                   	push   %es
 955:	5d                   	pop    %ebp
 956:	02 00                	add    (%eax),%al
 958:	00 02                	add    %al,(%edx)
 95a:	96                   	xchg   %eax,%esi
 95b:	45                   	inc    %ebp
 95c:	00 00                	add    %al,(%eax)
 95e:	00 2a                	add    %ch,(%edx)
 960:	06                   	push   %es
 961:	3d 04 00 00 02       	cmp    $0x2000004,%eax
 966:	97                   	xchg   %eax,%edi
 967:	45                   	inc    %ebp
 968:	00 00                	add    %al,(%eax)
 96a:	00 2c 06             	add    %ch,(%esi,%eax,1)
 96d:	9c                   	pushf  
 96e:	02 00                	add    (%eax),%al
 970:	00 02                	add    %al,(%edx)
 972:	98                   	cwtl   
 973:	45                   	inc    %ebp
 974:	00 00                	add    %al,(%eax)
 976:	00 2e                	add    %ch,(%esi)
 978:	06                   	push   %es
 979:	4f                   	dec    %edi
 97a:	04 00                	add    $0x0,%al
 97c:	00 02                	add    %al,(%edx)
 97e:	99                   	cltd   
 97f:	45                   	inc    %ebp
 980:	00 00                	add    %al,(%eax)
 982:	00 30                	add    %dh,(%eax)
 984:	06                   	push   %es
 985:	d6                   	(bad)  
 986:	01 00                	add    %eax,(%eax)
 988:	00 02                	add    %al,(%edx)
 98a:	9a 45 00 00 00 32 00 	lcall  $0x32,$0x45
 991:	08 2c 00             	or     %ch,(%eax,%eax,1)
 994:	00 00                	add    %al,(%eax)
 996:	96                   	xchg   %eax,%esi
 997:	02 00                	add    (%eax),%al
 999:	00 09                	add    %cl,(%ecx)
 99b:	e9 00 00 00 0b       	jmp    b0009a0 <_end+0xaff75f4>
 9a0:	00 03                	add    %al,(%ebx)
 9a2:	eb 01                	jmp    9a5 <PROT_MODE_DSEG+0x995>
 9a4:	00 00                	add    %al,(%eax)
 9a6:	02 9b c5 01 00 00    	add    0x1c5(%ebx),%bl
 9ac:	0d 94 02 00 00       	or     $0x294,%eax
 9b1:	20 02                	and    %al,(%edx)
 9b3:	9e                   	sahf   
 9b4:	0e                   	push   %cs
 9b5:	03 00                	add    (%eax),%eax
 9b7:	00 06                	add    %al,(%esi)
 9b9:	8d 02                	lea    (%edx),%eax
 9bb:	00 00                	add    %al,(%eax)
 9bd:	02 9f 5e 00 00 00    	add    0x5e(%edi),%bl
 9c3:	00 06                	add    %al,(%esi)
 9c5:	2f                   	das    
 9c6:	02 00                	add    (%eax),%al
 9c8:	00 02                	add    %al,(%edx)
 9ca:	a0 5e 00 00 00       	mov    0x5e,%al
 9cf:	04 06                	add    $0x6,%al
 9d1:	73 03                	jae    9d6 <PROT_MODE_DSEG+0x9c6>
 9d3:	00 00                	add    %al,(%eax)
 9d5:	02 a1 5e 00 00 00    	add    0x5e(%ecx),%ah
 9db:	08 06                	or     %al,(%esi)
 9dd:	d3 04 00             	roll   %cl,(%eax,%eax,1)
 9e0:	00 02                	add    %al,(%edx)
 9e2:	a2 5e 00 00 00       	mov    %al,0x5e
 9e7:	0c 06                	or     $0x6,%al
 9e9:	34 04                	xor    $0x4,%al
 9eb:	00 00                	add    %al,(%eax)
 9ed:	02 a3 5e 00 00 00    	add    0x5e(%ebx),%ah
 9f3:	10 06                	adc    %al,(%esi)
 9f5:	27                   	daa    
 9f6:	02 00                	add    (%eax),%al
 9f8:	00 02                	add    %al,(%edx)
 9fa:	a4                   	movsb  %ds:(%esi),%es:(%edi)
 9fb:	5e                   	pop    %esi
 9fc:	00 00                	add    %al,(%eax)
 9fe:	00 14 06             	add    %dl,(%esi,%eax,1)
 a01:	89 03                	mov    %eax,(%ebx)
 a03:	00 00                	add    %al,(%eax)
 a05:	02 a5 5e 00 00 00    	add    0x5e(%ebp),%ah
 a0b:	18 06                	sbb    %al,(%esi)
 a0d:	c1 04 00 00          	roll   $0x0,(%eax,%eax,1)
 a11:	02 a6 5e 00 00 00    	add    0x5e(%esi),%ah
 a17:	1c 00                	sbb    $0x0,%al
 a19:	03 94 02 00 00 02 a7 	add    -0x58fe0000(%edx,%eax,1),%edx
 a20:	a1 02 00 00 05       	mov    0x5000002,%eax
 a25:	04 02                	add    $0x2,%al
 a27:	b6 52                	mov    $0x52,%dh
 a29:	03 00                	add    (%eax),%eax
 a2b:	00 06                	add    %al,(%esi)
 a2d:	0d 03 00 00 02       	or     $0x2000003,%eax
 a32:	b7 2c                	mov    $0x2c,%bh
 a34:	00 00                	add    %al,(%eax)
 a36:	00 00                	add    %al,(%eax)
 a38:	06                   	push   %es
 a39:	01 03                	add    %eax,(%ebx)
 a3b:	00 00                	add    %al,(%eax)
 a3d:	02 b8 2c 00 00 00    	add    0x2c(%eax),%bh
 a43:	01 06                	add    %eax,(%esi)
 a45:	07                   	pop    %es
 a46:	03 00                	add    (%eax),%eax
 a48:	00 02                	add    %al,(%edx)
 a4a:	b9 2c 00 00 00       	mov    $0x2c,%ecx
 a4f:	02 06                	add    (%esi),%al
 a51:	87 02                	xchg   %eax,(%edx)
 a53:	00 00                	add    %al,(%eax)
 a55:	02 ba 2c 00 00 00    	add    0x2c(%edx),%bh
 a5b:	03 00                	add    (%eax),%eax
 a5d:	05 10 02 c7 8b       	add    $0x8bc70210,%eax
 a62:	03 00                	add    (%eax),%eax
 a64:	00 06                	add    %al,(%esi)
 a66:	14 04                	adc    $0x4,%al
 a68:	00 00                	add    %al,(%eax)
 a6a:	02 c8                	add    %al,%cl
 a6c:	5e                   	pop    %esi
 a6d:	00 00                	add    %al,(%eax)
 a6f:	00 00                	add    %al,(%eax)
 a71:	06                   	push   %es
 a72:	7f 02                	jg     a76 <PROT_MODE_DSEG+0xa66>
 a74:	00 00                	add    %al,(%eax)
 a76:	02 c9                	add    %cl,%cl
 a78:	5e                   	pop    %esi
 a79:	00 00                	add    %al,(%eax)
 a7b:	00 04 06             	add    %al,(%esi,%eax,1)
 a7e:	e6 03                	out    %al,$0x3
 a80:	00 00                	add    %al,(%eax)
 a82:	02 ca                	add    %dl,%cl
 a84:	5e                   	pop    %esi
 a85:	00 00                	add    %al,(%eax)
 a87:	00 08                	add    %cl,(%eax)
 a89:	06                   	push   %es
 a8a:	8b 04 00             	mov    (%eax,%eax,1),%eax
 a8d:	00 02                	add    %al,(%edx)
 a8f:	cb                   	lret   
 a90:	5e                   	pop    %esi
 a91:	00 00                	add    %al,(%eax)
 a93:	00 0c 00             	add    %cl,(%eax,%eax,1)
 a96:	05 10 02 cd c4       	add    $0xc4cd0210,%eax
 a9b:	03 00                	add    (%eax),%eax
 a9d:	00 07                	add    %al,(%edi)
 a9f:	6e                   	outsb  %ds:(%esi),(%dx)
 aa0:	75 6d                	jne    b0f <PROT_MODE_DSEG+0xaff>
 aa2:	00 02                	add    %al,(%edx)
 aa4:	ce                   	into   
 aa5:	5e                   	pop    %esi
 aa6:	00 00                	add    %al,(%eax)
 aa8:	00 00                	add    %al,(%eax)
 aaa:	06                   	push   %es
 aab:	17                   	pop    %ss
 aac:	04 00                	add    $0x0,%al
 aae:	00 02                	add    %al,(%edx)
 ab0:	cf                   	iret   
 ab1:	5e                   	pop    %esi
 ab2:	00 00                	add    %al,(%eax)
 ab4:	00 04 06             	add    %al,(%esi,%eax,1)
 ab7:	e6 03                	out    %al,$0x3
 ab9:	00 00                	add    %al,(%eax)
 abb:	02 d0                	add    %al,%dl
 abd:	5e                   	pop    %esi
 abe:	00 00                	add    %al,(%eax)
 ac0:	00 08                	add    %cl,(%eax)
 ac2:	06                   	push   %es
 ac3:	a8 02                	test   $0x2,%al
 ac5:	00 00                	add    %al,(%eax)
 ac7:	02 d1                	add    %cl,%dl
 ac9:	5e                   	pop    %esi
 aca:	00 00                	add    %al,(%eax)
 acc:	00 0c 00             	add    %cl,(%eax,%eax,1)
 acf:	0e                   	push   %cs
 ad0:	10 02                	adc    %al,(%edx)
 ad2:	c6                   	(bad)  
 ad3:	e3 03                	jecxz  ad8 <PROT_MODE_DSEG+0xac8>
 ad5:	00 00                	add    %al,(%eax)
 ad7:	0f ae 03             	fxsave (%ebx)
 ada:	00 00                	add    %al,(%eax)
 adc:	02 cc                	add    %ah,%cl
 ade:	52                   	push   %edx
 adf:	03 00                	add    (%eax),%eax
 ae1:	00 10                	add    %dl,(%eax)
 ae3:	65 6c                	gs insb (%dx),%es:(%edi)
 ae5:	66 00 02             	data16 add %al,(%edx)
 ae8:	d2 8b 03 00 00 00    	rorb   %cl,0x3(%ebx)
 aee:	0d 68 03 00 00       	or     $0x368,%eax
 af3:	60                   	pusha  
 af4:	02 ae ec 04 00 00    	add    0x4ec(%esi),%ch
 afa:	06                   	push   %es
 afb:	45                   	inc    %ebp
 afc:	02 00                	add    (%eax),%al
 afe:	00 02                	add    %al,(%edx)
 b00:	af                   	scas   %es:(%edi),%eax
 b01:	5e                   	pop    %esi
 b02:	00 00                	add    %al,(%eax)
 b04:	00 00                	add    %al,(%eax)
 b06:	06                   	push   %es
 b07:	3b 03                	cmp    (%ebx),%eax
 b09:	00 00                	add    %al,(%eax)
 b0b:	02 b2 5e 00 00 00    	add    0x5e(%edx),%dh
 b11:	04 06                	add    $0x6,%al
 b13:	fc                   	cld    
 b14:	03 00                	add    (%eax),%eax
 b16:	00 02                	add    %al,(%edx)
 b18:	b3 5e                	mov    $0x5e,%bl
 b1a:	00 00                	add    %al,(%eax)
 b1c:	00 08                	add    %cl,(%eax)
 b1e:	06                   	push   %es
 b1f:	a2 03 00 00 02       	mov    %al,0x2000003
 b24:	bb 19 03 00 00       	mov    $0x319,%ebx
 b29:	0c 06                	or     $0x6,%al
 b2b:	4b                   	dec    %ebx
 b2c:	02 00                	add    (%eax),%al
 b2e:	00 02                	add    %al,(%edx)
 b30:	be 5e 00 00 00       	mov    $0x5e,%esi
 b35:	10 06                	adc    %al,(%esi)
 b37:	80 04 00 00          	addb   $0x0,(%eax,%eax,1)
 b3b:	02 c2                	add    %dl,%al
 b3d:	5e                   	pop    %esi
 b3e:	00 00                	add    %al,(%eax)
 b40:	00 14 06             	add    %dl,(%esi,%eax,1)
 b43:	75 02                	jne    b47 <PROT_MODE_DSEG+0xb37>
 b45:	00 00                	add    %al,(%eax)
 b47:	02 c3                	add    %bl,%al
 b49:	5e                   	pop    %esi
 b4a:	00 00                	add    %al,(%eax)
 b4c:	00 18                	add    %bl,(%eax)
 b4e:	06                   	push   %es
 b4f:	4e                   	dec    %esi
 b50:	03 00                	add    (%eax),%eax
 b52:	00 02                	add    %al,(%edx)
 b54:	d3 c4                	rol    %cl,%esp
 b56:	03 00                	add    (%eax),%eax
 b58:	00 1c 06             	add    %bl,(%esi,%eax,1)
 b5b:	5c                   	pop    %esp
 b5c:	03 00                	add    (%eax),%eax
 b5e:	00 02                	add    %al,(%edx)
 b60:	d6                   	(bad)  
 b61:	5e                   	pop    %esi
 b62:	00 00                	add    %al,(%eax)
 b64:	00 2c 06             	add    %ch,(%esi,%eax,1)
 b67:	e1 01                	loope  b6a <PROT_MODE_DSEG+0xb5a>
 b69:	00 00                	add    %al,(%eax)
 b6b:	02 d8                	add    %al,%bl
 b6d:	5e                   	pop    %esi
 b6e:	00 00                	add    %al,(%eax)
 b70:	00 30                	add    %dh,(%eax)
 b72:	06                   	push   %es
 b73:	26 04 00             	es add $0x0,%al
 b76:	00 02                	add    %al,(%edx)
 b78:	dc 5e 00             	fcompl 0x0(%esi)
 b7b:	00 00                	add    %al,(%eax)
 b7d:	34 06                	xor    $0x6,%al
 b7f:	b5 02                	mov    $0x2,%ch
 b81:	00 00                	add    %al,(%eax)
 b83:	02 dd                	add    %ch,%bl
 b85:	5e                   	pop    %esi
 b86:	00 00                	add    %al,(%eax)
 b88:	00 38                	add    %bh,(%eax)
 b8a:	06                   	push   %es
 b8b:	c3                   	ret    
 b8c:	03 00                	add    (%eax),%eax
 b8e:	00 02                	add    %al,(%edx)
 b90:	e0 5e                	loopne bf0 <PROT_MODE_DSEG+0xbe0>
 b92:	00 00                	add    %al,(%eax)
 b94:	00 3c 06             	add    %bh,(%esi,%eax,1)
 b97:	95                   	xchg   %eax,%ebp
 b98:	04 00                	add    $0x0,%al
 b9a:	00 02                	add    %al,(%edx)
 b9c:	e3 5e                	jecxz  bfc <PROT_MODE_DSEG+0xbec>
 b9e:	00 00                	add    %al,(%eax)
 ba0:	00 40 06             	add    %al,0x6(%eax)
 ba3:	c9                   	leave  
 ba4:	04 00                	add    $0x0,%al
 ba6:	00 02                	add    %al,(%edx)
 ba8:	e6 5e                	out    %al,$0x5e
 baa:	00 00                	add    %al,(%eax)
 bac:	00 44 06 78          	add    %al,0x78(%esi,%eax,1)
 bb0:	03 00                	add    (%eax),%eax
 bb2:	00 02                	add    %al,(%edx)
 bb4:	e9 5e 00 00 00       	jmp    c17 <PROT_MODE_DSEG+0xc07>
 bb9:	48                   	dec    %eax
 bba:	06                   	push   %es
 bbb:	06                   	push   %es
 bbc:	04 00                	add    $0x0,%al
 bbe:	00 02                	add    %al,(%edx)
 bc0:	ea 5e 00 00 00 4c 06 	ljmp   $0x64c,$0x5e
 bc7:	eb 03                	jmp    bcc <PROT_MODE_DSEG+0xbbc>
 bc9:	00 00                	add    %al,(%eax)
 bcb:	02 eb                	add    %bl,%ch
 bcd:	5e                   	pop    %esi
 bce:	00 00                	add    %al,(%eax)
 bd0:	00 50 06             	add    %dl,0x6(%eax)
 bd3:	a6                   	cmpsb  %es:(%edi),%ds:(%esi)
 bd4:	04 00                	add    $0x0,%al
 bd6:	00 02                	add    %al,(%edx)
 bd8:	ec                   	in     (%dx),%al
 bd9:	5e                   	pop    %esi
 bda:	00 00                	add    %al,(%eax)
 bdc:	00 54 06 f2          	add    %dl,-0xe(%esi,%eax,1)
 be0:	01 00                	add    %eax,(%eax)
 be2:	00 02                	add    %al,(%edx)
 be4:	ed                   	in     (%dx),%eax
 be5:	5e                   	pop    %esi
 be6:	00 00                	add    %al,(%eax)
 be8:	00 58 06             	add    %bl,0x6(%eax)
 beb:	57                   	push   %edi
 bec:	04 00                	add    $0x0,%al
 bee:	00 02                	add    %al,(%edx)
 bf0:	ee                   	out    %al,(%dx)
 bf1:	5e                   	pop    %esi
 bf2:	00 00                	add    %al,(%eax)
 bf4:	00 5c 00 03          	add    %bl,0x3(%eax,%eax,1)
 bf8:	e0 02                	loopne bfc <PROT_MODE_DSEG+0xbec>
 bfa:	00 00                	add    %al,(%eax)
 bfc:	02 ef                	add    %bh,%ch
 bfe:	e3 03                	jecxz  c03 <PROT_MODE_DSEG+0xbf3>
 c00:	00 00                	add    %al,(%eax)
 c02:	11 68 03             	adc    %ebp,0x3(%eax)
 c05:	00 00                	add    %al,(%eax)
 c07:	01 12                	add    %edx,(%edx)
 c09:	ec                   	in     (%dx),%al
 c0a:	04 00                	add    $0x0,%al
 c0c:	00 05 03 20 93 00    	add    %al,0x932003
 c12:	00 12                	add    %dl,(%edx)
 c14:	91                   	xchg   %eax,%ecx
 c15:	03 00                	add    (%eax),%eax
 c17:	00 01                	add    %al,(%ecx)
 c19:	66 5e                	pop    %si
 c1b:	05 00 00 5e 8e       	add    $0x8e5e0000,%eax
 c20:	00 00                	add    %al,(%eax)
 c22:	70 00                	jo     c24 <PROT_MODE_DSEG+0xc14>
 c24:	00 00                	add    %al,(%eax)
 c26:	01 9c 5e 05 00 00 13 	add    %ebx,0x13000005(%esi,%ebx,2)
 c2d:	36 03 00             	add    %ss:(%eax),%eax
 c30:	00 01                	add    %al,(%ecx)
 c32:	66 64 05 00 00       	fs add $0x0,%ax
 c37:	02 91 00 14 70 00    	add    0x701400(%ecx),%dl
 c3d:	01 68 64             	add    %ebp,0x64(%eax)
 c40:	05 00 00 ef 03       	add    $0x3ef0000,%eax
 c45:	00 00                	add    %al,(%eax)
 c47:	15 b8 04 00 00       	adc    $0x4b8,%eax
 c4c:	01 69 5e             	add    %ebp,0x5e(%ecx)
 c4f:	00 00                	add    %al,(%eax)
 c51:	00 5d 04             	add    %bl,0x4(%ebp)
 c54:	00 00                	add    %al,(%eax)
 c56:	16                   	push   %ss
 c57:	83 8e 00 00 83 06 00 	orl    $0x0,0x6830000(%esi)
 c5e:	00 16                	add    %dl,(%esi)
 c60:	9e                   	sahf   
 c61:	8e 00                	mov    (%eax),%es
 c63:	00 8e 06 00 00 00    	add    %cl,0x6(%esi)
 c69:	17                   	pop    %ss
 c6a:	04 ec                	add    $0xec,%al
 c6c:	04 00                	add    $0x0,%al
 c6e:	00 17                	add    %dl,(%edi)
 c70:	04 ba                	add    $0xba,%al
 c72:	01 00                	add    %eax,(%eax)
 c74:	00 12                	add    %dl,(%edx)
 c76:	15 02 00 00 01       	adc    $0x1000002,%eax
 c7b:	4e                   	dec    %esi
 c7c:	5e                   	pop    %esi
 c7d:	00 00                	add    %al,(%eax)
 c7f:	00 cf                	add    %cl,%bh
 c81:	8d 00                	lea    (%eax),%eax
 c83:	00 8f 00 00 00 01    	add    %cl,0x1000000(%edi)
 c89:	9c                   	pushf  
 c8a:	ca 05 00             	lret   $0x5
 c8d:	00 13                	add    %dl,(%ebx)
 c8f:	b3 03                	mov    $0x3,%bl
 c91:	00 00                	add    %al,(%eax)
 c93:	01 4e 5e             	add    %ecx,0x5e(%esi)
 c96:	00 00                	add    %al,(%eax)
 c98:	00 02                	add    %al,(%edx)
 c9a:	91                   	xchg   %eax,%ecx
 c9b:	00 14 70             	add    %dl,(%eax,%esi,2)
 c9e:	68 00 01 51 ca       	push   $0xca510100
 ca3:	05 00 00 a3 04       	add    $0x4a30000,%eax
 ca8:	00 00                	add    %al,(%eax)
 caa:	14 65                	adc    $0x65,%al
 cac:	70 68                	jo     d16 <PROT_MODE_DSEG+0xd06>
 cae:	00 01                	add    %al,(%ecx)
 cb0:	51                   	push   %ecx
 cb1:	ca 05 00             	lret   $0x5
 cb4:	00 ce                	add    %cl,%dh
 cb6:	04 00                	add    $0x0,%al
 cb8:	00 16                	add    %dl,(%esi)
 cba:	f7                   	(bad)  
 cbb:	8d 00                	lea    (%eax),%eax
 cbd:	00 99 06 00 00 16    	add    %bl,0x16000006(%ecx)
 cc3:	15 8e 00 00 a4       	adc    $0xa400008e,%eax
 cc8:	06                   	push   %es
 cc9:	00 00                	add    %al,(%eax)
 ccb:	16                   	push   %ss
 ccc:	47                   	inc    %edi
 ccd:	8e 00                	mov    (%eax),%es
 ccf:	00 99 06 00 00 00    	add    %bl,0x6(%ecx)
 cd5:	17                   	pop    %ss
 cd6:	04 0e                	add    $0xe,%al
 cd8:	03 00                	add    (%eax),%eax
 cda:	00 18                	add    %bl,(%eax)
 cdc:	ed                   	in     (%dx),%eax
 cdd:	02 00                	add    (%eax),%al
 cdf:	00 01                	add    %al,(%ecx)
 ce1:	1d ce 8e 00 00       	sbb    $0x8ece,%eax
 ce6:	95                   	xchg   %eax,%ebp
 ce7:	00 00                	add    %al,(%eax)
 ce9:	00 01                	add    %al,(%ecx)
 ceb:	9c                   	pushf  
 cec:	7d 06                	jge    cf4 <PROT_MODE_DSEG+0xce4>
 cee:	00 00                	add    %al,(%eax)
 cf0:	19 64 65 76          	sbb    %esp,0x76(%ebp,%eiz,2)
 cf4:	00 01                	add    %al,(%ecx)
 cf6:	1d 5e 00 00 00       	sbb    $0x5e,%eax
 cfb:	02 91 00 19 6d 62    	add    0x626d1900(%ecx),%dl
 d01:	72 00                	jb     d03 <PROT_MODE_DSEG+0xcf3>
 d03:	01 1d 7d 06 00 00    	add    %ebx,0x67d
 d09:	02 91 04 13 36 03    	add    0x3361304(%ecx),%dl
 d0f:	00 00                	add    %al,(%eax)
 d11:	01 1d 64 05 00 00    	add    %ebx,0x564
 d17:	02 91 08 14 69 00    	add    0x691408(%ecx),%dl
 d1d:	01 32                	add    %esi,(%edx)
 d1f:	57                   	push   %edi
 d20:	00 00                	add    %al,(%eax)
 d22:	00 e1                	add    %ah,%cl
 d24:	04 00                	add    $0x0,%al
 d26:	00 15 cf 01 00 00    	add    %dl,0x1cf
 d2c:	01 40 5e             	add    %eax,0x5e(%eax)
 d2f:	00 00                	add    %al,(%eax)
 d31:	00 00                	add    %al,(%eax)
 d33:	05 00 00 1a 14       	add    $0x141a0000,%eax
 d38:	03 00                	add    (%eax),%eax
 d3a:	00 01                	add    %al,(%ecx)
 d3c:	41                   	inc    %ecx
 d3d:	5e                   	pop    %esi
 d3e:	05 00 00 06 03       	add    $0x3060000,%eax
 d43:	20 93 00 00 9f 16    	and    %dl,0x169f0000(%ebx)
 d49:	ee                   	out    %al,(%dx)
 d4a:	8e 00                	mov    (%eax),%es
 d4c:	00 af 06 00 00 16    	add    %ch,0x16000006(%edi)
 d52:	fc                   	cld    
 d53:	8e 00                	mov    (%eax),%es
 d55:	00 83 06 00 00 16    	add    %al,0x16000006(%ebx)
 d5b:	04 8f                	add    $0x8f,%al
 d5d:	00 00                	add    %al,(%eax)
 d5f:	08 05 00 00 16 28    	or     %al,0x28160000
 d65:	8f 00                	popl   (%eax)
 d67:	00 08                	add    %cl,(%eax)
 d69:	05 00 00 16 3b       	add    $0x3b160000,%eax
 d6e:	8f 00                	popl   (%eax)
 d70:	00 6a 05             	add    %ch,0x5(%edx)
 d73:	00 00                	add    %al,(%eax)
 d75:	16                   	push   %ss
 d76:	4a                   	dec    %edx
 d77:	8f 00                	popl   (%eax)
 d79:	00 ba 06 00 00 16    	add    %bh,0x16000006(%edx)
 d7f:	58                   	pop    %eax
 d80:	8f 00                	popl   (%eax)
 d82:	00 a4 06 00 00 00 17 	add    %ah,0x17000000(%esi,%eax,1)
 d89:	04 72                	add    $0x72,%al
 d8b:	01 00                	add    %eax,(%eax)
 d8d:	00 1b                	add    %bl,(%ebx)
 d8f:	10 00                	adc    %al,(%eax)
 d91:	00 00                	add    %al,(%eax)
 d93:	10 00                	adc    %al,(%eax)
 d95:	00 00                	add    %al,(%eax)
 d97:	02 4f 1b             	add    0x1b(%edi),%cl
 d9a:	71 00                	jno    d9c <PROT_MODE_DSEG+0xd8c>
 d9c:	00 00                	add    %al,(%eax)
 d9e:	71 00                	jno    da0 <PROT_MODE_DSEG+0xd90>
 da0:	00 00                	add    %al,(%eax)
 da2:	02 50 1b             	add    0x1b(%eax),%dl
 da5:	1b 01                	sbb    (%ecx),%eax
 da7:	00 00                	add    %al,(%eax)
 da9:	1b 01                	sbb    (%ecx),%eax
 dab:	00 00                	add    %al,(%eax)
 dad:	02 78 1b             	add    0x1b(%eax),%bh
 db0:	6b 00 00             	imul   $0x0,(%eax),%eax
 db3:	00 6b 00             	add    %ch,0x0(%ebx)
 db6:	00 00                	add    %al,(%eax)
 db8:	02 52 1b             	add    0x1b(%edx),%dl
 dbb:	5f                   	pop    %edi
 dbc:	00 00                	add    %al,(%eax)
 dbe:	00 5f 00             	add    %bl,0x0(%edi)
 dc1:	00 00                	add    %al,(%eax)
 dc3:	02 51 1b             	add    0x1b(%ecx),%dl
 dc6:	69 02 00 00 69 02    	imul   $0x2690000,(%edx),%eax
 dcc:	00 00                	add    %al,(%eax)
 dce:	01 10                	add    %edx,(%eax)
 dd0:	00 6f 00             	add    %ch,0x0(%edi)
 dd3:	00 00                	add    %al,(%eax)
 dd5:	02 00                	add    (%eax),%al
 dd7:	a4                   	movsb  %ds:(%esi),%es:(%edi)
 dd8:	03 00                	add    (%eax),%eax
 dda:	00 04 01             	add    %al,(%ecx,%eax,1)
 ddd:	ad                   	lods   %ds:(%esi),%eax
 dde:	02 00                	add    (%eax),%al
 de0:	00 67 8f             	add    %ah,-0x71(%edi)
 de3:	00 00                	add    %al,(%eax)
 de5:	77 8f                	ja     d76 <PROT_MODE_DSEG+0xd66>
 de7:	00 00                	add    %al,(%eax)
 de9:	62 6f 6f             	bound  %ebp,0x6f(%edi)
 dec:	74 2f                	je     e1d <PROT_MODE_DSEG+0xe0d>
 dee:	62 6f 6f             	bound  %ebp,0x6f(%edi)
 df1:	74 31                	je     e24 <PROT_MODE_DSEG+0xe14>
 df3:	2f                   	das    
 df4:	65 78 65             	gs js  e5c <PROT_MODE_DSEG+0xe4c>
 df7:	63 5f 6b             	arpl   %bx,0x6b(%edi)
 dfa:	65 72 6e             	gs jb  e6b <PROT_MODE_DSEG+0xe5b>
 dfd:	65 6c                	gs insb (%dx),%es:(%edi)
 dff:	2e 53                	cs push %ebx
 e01:	00 2f                	add    %ch,(%edi)
 e03:	68 6f 6d 65 2f       	push   $0x2f656d6f
 e08:	73 74                	jae    e7e <PROT_MODE_DSEG+0xe6e>
 e0a:	75 64                	jne    e70 <PROT_MODE_DSEG+0xe60>
 e0c:	65 6e                	outsb  %gs:(%esi),(%dx)
 e0e:	74 2f                	je     e3f <PROT_MODE_DSEG+0xe2f>
 e10:	6f                   	outsl  %ds:(%esi),(%dx)
 e11:	73 2d                	jae    e40 <PROT_MODE_DSEG+0xe30>
 e13:	63 6c 61 73          	arpl   %bp,0x73(%ecx,%eiz,2)
 e17:	73 2d                	jae    e46 <PROT_MODE_DSEG+0xe36>
 e19:	70 72                	jo     e8d <PROT_MODE_DSEG+0xe7d>
 e1b:	6f                   	outsl  %ds:(%esi),(%dx)
 e1c:	6a 65                	push   $0x65
 e1e:	63 74 2e 72          	arpl   %si,0x72(%esi,%ebp,1)
 e22:	65 70 6f             	gs jo  e94 <PROT_MODE_DSEG+0xe84>
 e25:	2f                   	das    
 e26:	6c                   	insb   (%dx),%es:(%edi)
 e27:	61                   	popa   
 e28:	62 32                	bound  %esi,(%edx)
 e2a:	2f                   	das    
 e2b:	73 68                	jae    e95 <PROT_MODE_DSEG+0xe85>
 e2d:	65 6e                	outsb  %gs:(%esi),(%dx)
 e2f:	6c                   	insb   (%dx),%es:(%edi)
 e30:	75 2f                	jne    e61 <PROT_MODE_DSEG+0xe51>
 e32:	73 72                	jae    ea6 <PROT_MODE_DSEG+0xe96>
 e34:	63 00                	arpl   %ax,(%eax)
 e36:	47                   	inc    %edi
 e37:	4e                   	dec    %esi
 e38:	55                   	push   %ebp
 e39:	20 41 53             	and    %al,0x53(%ecx)
 e3c:	20 32                	and    %dh,(%edx)
 e3e:	2e 32 38             	xor    %cs:(%eax),%bh
 e41:	00 01                	add    %al,(%ecx)
 e43:	80                   	.byte 0x80

Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	01 11                	add    %edx,(%ecx)
   2:	00 10                	add    %dl,(%eax)
   4:	06                   	push   %es
   5:	11 01                	adc    %eax,(%ecx)
   7:	12 01                	adc    (%ecx),%al
   9:	03 08                	add    (%eax),%ecx
   b:	1b 08                	sbb    (%eax),%ecx
   d:	25 08 13 05 00       	and    $0x51308,%eax
  12:	00 00                	add    %al,(%eax)
  14:	01 11                	add    %edx,(%ecx)
  16:	01 25 0e 13 0b 03    	add    %esp,0x30b130e
  1c:	0e                   	push   %cs
  1d:	1b 0e                	sbb    (%esi),%ecx
  1f:	11 01                	adc    %eax,(%ecx)
  21:	12 06                	adc    (%esi),%al
  23:	10 17                	adc    %dl,(%edi)
  25:	00 00                	add    %al,(%eax)
  27:	02 24 00             	add    (%eax,%eax,1),%ah
  2a:	0b 0b                	or     (%ebx),%ecx
  2c:	3e 0b 03             	or     %ds:(%ebx),%eax
  2f:	0e                   	push   %cs
  30:	00 00                	add    %al,(%eax)
  32:	03 16                	add    (%esi),%edx
  34:	00 03                	add    %al,(%ebx)
  36:	0e                   	push   %cs
  37:	3a 0b                	cmp    (%ebx),%cl
  39:	3b 0b                	cmp    (%ebx),%ecx
  3b:	49                   	dec    %ecx
  3c:	13 00                	adc    (%eax),%eax
  3e:	00 04 24             	add    %al,(%esp)
  41:	00 0b                	add    %cl,(%ebx)
  43:	0b 3e                	or     (%esi),%edi
  45:	0b 03                	or     (%ebx),%eax
  47:	08 00                	or     %al,(%eax)
  49:	00 05 34 00 03 0e    	add    %al,0xe030034
  4f:	3a 0b                	cmp    (%ebx),%cl
  51:	3b 0b                	cmp    (%ebx),%ecx
  53:	49                   	dec    %ecx
  54:	13 3f                	adc    (%edi),%edi
  56:	19 02                	sbb    %eax,(%edx)
  58:	18 00                	sbb    %al,(%eax)
  5a:	00 06                	add    %al,(%esi)
  5c:	0f 00 0b             	str    (%ebx)
  5f:	0b 49 13             	or     0x13(%ecx),%ecx
  62:	00 00                	add    %al,(%eax)
  64:	07                   	pop    %es
  65:	35 00 49 13 00       	xor    $0x134900,%eax
  6a:	00 08                	add    %cl,(%eax)
  6c:	26 00 49 13          	add    %cl,%es:0x13(%ecx)
  70:	00 00                	add    %al,(%eax)
  72:	09 34 00             	or     %esi,(%eax,%eax,1)
  75:	03 08                	add    (%eax),%ecx
  77:	3a 0b                	cmp    (%ebx),%cl
  79:	3b 0b                	cmp    (%ebx),%ecx
  7b:	49                   	dec    %ecx
  7c:	13 02                	adc    (%edx),%eax
  7e:	18 00                	sbb    %al,(%eax)
  80:	00 0a                	add    %cl,(%edx)
  82:	01 01                	add    %eax,(%ecx)
  84:	49                   	dec    %ecx
  85:	13 01                	adc    (%ecx),%eax
  87:	13 00                	adc    (%eax),%eax
  89:	00 0b                	add    %cl,(%ebx)
  8b:	21 00                	and    %eax,(%eax)
  8d:	49                   	dec    %ecx
  8e:	13 2f                	adc    (%edi),%ebp
  90:	0b 00                	or     (%eax),%eax
  92:	00 0c 34             	add    %cl,(%esp,%esi,1)
  95:	00 03                	add    %al,(%ebx)
  97:	0e                   	push   %cs
  98:	3a 0b                	cmp    (%ebx),%cl
  9a:	3b 0b                	cmp    (%ebx),%ecx
  9c:	49                   	dec    %ecx
  9d:	13 02                	adc    (%edx),%eax
  9f:	18 00                	sbb    %al,(%eax)
  a1:	00 0d 2e 01 3f 19    	add    %cl,0x193f012e
  a7:	03 0e                	add    (%esi),%ecx
  a9:	3a 0b                	cmp    (%ebx),%cl
  ab:	3b 0b                	cmp    (%ebx),%ecx
  ad:	27                   	daa    
  ae:	19 11                	sbb    %edx,(%ecx)
  b0:	01 12                	add    %edx,(%edx)
  b2:	06                   	push   %es
  b3:	40                   	inc    %eax
  b4:	18 97 42 19 01 13    	sbb    %dl,0x13011942(%edi)
  ba:	00 00                	add    %al,(%eax)
  bc:	0e                   	push   %cs
  bd:	05 00 03 08 3a       	add    $0x3a080300,%eax
  c2:	0b 3b                	or     (%ebx),%edi
  c4:	0b 49 13             	or     0x13(%ecx),%ecx
  c7:	02 17                	add    (%edi),%dl
  c9:	00 00                	add    %al,(%eax)
  cb:	0f 05                	syscall 
  cd:	00 03                	add    %al,(%ebx)
  cf:	0e                   	push   %cs
  d0:	3a 0b                	cmp    (%ebx),%cl
  d2:	3b 0b                	cmp    (%ebx),%ecx
  d4:	49                   	dec    %ecx
  d5:	13 02                	adc    (%edx),%eax
  d7:	18 00                	sbb    %al,(%eax)
  d9:	00 10                	add    %dl,(%eax)
  db:	05 00 03 0e 3a       	add    $0x3a0e0300,%eax
  e0:	0b 3b                	or     (%ebx),%edi
  e2:	0b 49 13             	or     0x13(%ecx),%ecx
  e5:	02 17                	add    (%edi),%dl
  e7:	00 00                	add    %al,(%eax)
  e9:	11 05 00 03 08 3a    	adc    %eax,0x3a080300
  ef:	0b 3b                	or     (%ebx),%edi
  f1:	0b 49 13             	or     0x13(%ecx),%ecx
  f4:	02 18                	add    (%eax),%bl
  f6:	00 00                	add    %al,(%eax)
  f8:	12 34 00             	adc    (%eax,%eax,1),%dh
  fb:	03 0e                	add    (%esi),%ecx
  fd:	3a 0b                	cmp    (%ebx),%cl
  ff:	3b 0b                	cmp    (%ebx),%ecx
 101:	49                   	dec    %ecx
 102:	13 02                	adc    (%edx),%eax
 104:	17                   	pop    %ss
 105:	00 00                	add    %al,(%eax)
 107:	13 89 82 01 00 11    	adc    0x11000182(%ecx),%ecx
 10d:	01 31                	add    %esi,(%ecx)
 10f:	13 00                	adc    (%eax),%eax
 111:	00 14 1d 01 31 13 52 	add    %dl,0x52133101(,%ebx,1)
 118:	01 55 17             	add    %edx,0x17(%ebp)
 11b:	58                   	pop    %eax
 11c:	0b 59 0b             	or     0xb(%ecx),%ebx
 11f:	01 13                	add    %edx,(%ebx)
 121:	00 00                	add    %al,(%eax)
 123:	15 1d 01 31 13       	adc    $0x1331011d,%eax
 128:	52                   	push   %edx
 129:	01 55 17             	add    %edx,0x17(%ebp)
 12c:	58                   	pop    %eax
 12d:	0b 59 0b             	or     0xb(%ecx),%ebx
 130:	00 00                	add    %al,(%eax)
 132:	16                   	push   %ss
 133:	05 00 31 13 02       	add    $0x2133100,%eax
 138:	17                   	pop    %ss
 139:	00 00                	add    %al,(%eax)
 13b:	17                   	pop    %ss
 13c:	0b 01                	or     (%ecx),%eax
 13e:	55                   	push   %ebp
 13f:	17                   	pop    %ss
 140:	00 00                	add    %al,(%eax)
 142:	18 34 00             	sbb    %dh,(%eax,%eax,1)
 145:	31 13                	xor    %edx,(%ebx)
 147:	00 00                	add    %al,(%eax)
 149:	19 1d 01 31 13 11    	sbb    %ebx,0x11133101
 14f:	01 12                	add    %edx,(%edx)
 151:	06                   	push   %es
 152:	58                   	pop    %eax
 153:	0b 59 0b             	or     0xb(%ecx),%ebx
 156:	01 13                	add    %edx,(%ebx)
 158:	00 00                	add    %al,(%eax)
 15a:	1a 1d 01 31 13 11    	sbb    0x11133101,%bl
 160:	01 12                	add    %edx,(%edx)
 162:	06                   	push   %es
 163:	58                   	pop    %eax
 164:	0b 59 0b             	or     0xb(%ecx),%ebx
 167:	00 00                	add    %al,(%eax)
 169:	1b 0b                	sbb    (%ebx),%ecx
 16b:	01 11                	add    %edx,(%ecx)
 16d:	01 12                	add    %edx,(%edx)
 16f:	06                   	push   %es
 170:	00 00                	add    %al,(%eax)
 172:	1c 0f                	sbb    $0xf,%al
 174:	00 0b                	add    %cl,(%ebx)
 176:	0b 00                	or     (%eax),%eax
 178:	00 1d 2e 00 03 0e    	add    %bl,0xe03002e
 17e:	3a 0b                	cmp    (%ebx),%cl
 180:	3b 0b                	cmp    (%ebx),%ecx
 182:	27                   	daa    
 183:	19 20                	sbb    %esp,(%eax)
 185:	0b 00                	or     (%eax),%eax
 187:	00 1e                	add    %bl,(%esi)
 189:	34 00                	xor    $0x0,%al
 18b:	03 08                	add    (%eax),%ecx
 18d:	3a 0b                	cmp    (%ebx),%cl
 18f:	3b 0b                	cmp    (%ebx),%ecx
 191:	49                   	dec    %ecx
 192:	13 02                	adc    (%edx),%eax
 194:	17                   	pop    %ss
 195:	00 00                	add    %al,(%eax)
 197:	1f                   	pop    %ds
 198:	89 82 01 00 11 01    	mov    %eax,0x1110001(%edx)
 19e:	95                   	xchg   %eax,%ebp
 19f:	42                   	inc    %edx
 1a0:	19 31                	sbb    %esi,(%ecx)
 1a2:	13 00                	adc    (%eax),%eax
 1a4:	00 20                	add    %ah,(%eax)
 1a6:	2e 01 3f             	add    %edi,%cs:(%edi)
 1a9:	19 03                	sbb    %eax,(%ebx)
 1ab:	0e                   	push   %cs
 1ac:	3a 0b                	cmp    (%ebx),%cl
 1ae:	3b 0b                	cmp    (%ebx),%ecx
 1b0:	27                   	daa    
 1b1:	19 49 13             	sbb    %ecx,0x13(%ecx)
 1b4:	11 01                	adc    %eax,(%ecx)
 1b6:	12 06                	adc    (%esi),%al
 1b8:	40                   	inc    %eax
 1b9:	18 97 42 19 01 13    	sbb    %dl,0x13011942(%edi)
 1bf:	00 00                	add    %al,(%eax)
 1c1:	21 2e                	and    %ebp,(%esi)
 1c3:	01 03                	add    %eax,(%ebx)
 1c5:	0e                   	push   %cs
 1c6:	3a 0b                	cmp    (%ebx),%cl
 1c8:	3b 0b                	cmp    (%ebx),%ecx
 1ca:	27                   	daa    
 1cb:	19 20                	sbb    %esp,(%eax)
 1cd:	0b 01                	or     (%ecx),%eax
 1cf:	13 00                	adc    (%eax),%eax
 1d1:	00 22                	add    %ah,(%edx)
 1d3:	05 00 03 0e 3a       	add    $0x3a0e0300,%eax
 1d8:	0b 3b                	or     (%ebx),%edi
 1da:	0b 49 13             	or     0x13(%ecx),%ecx
 1dd:	00 00                	add    %al,(%eax)
 1df:	23 05 00 03 08 3a    	and    0x3a080300,%eax
 1e5:	0b 3b                	or     (%ebx),%edi
 1e7:	0b 49 13             	or     0x13(%ecx),%ecx
 1ea:	00 00                	add    %al,(%eax)
 1ec:	24 2e                	and    $0x2e,%al
 1ee:	01 03                	add    %eax,(%ebx)
 1f0:	08 3a                	or     %bh,(%edx)
 1f2:	0b 3b                	or     (%ebx),%edi
 1f4:	0b 27                	or     (%edi),%esp
 1f6:	19 49 13             	sbb    %ecx,0x13(%ecx)
 1f9:	20 0b                	and    %cl,(%ebx)
 1fb:	01 13                	add    %edx,(%ebx)
 1fd:	00 00                	add    %al,(%eax)
 1ff:	25 34 00 03 0e       	and    $0xe030034,%eax
 204:	3a 0b                	cmp    (%ebx),%cl
 206:	3b 0b                	cmp    (%ebx),%ecx
 208:	49                   	dec    %ecx
 209:	13 00                	adc    (%eax),%eax
 20b:	00 26                	add    %ah,(%esi)
 20d:	2e 01 03             	add    %eax,%cs:(%ebx)
 210:	0e                   	push   %cs
 211:	3a 0b                	cmp    (%ebx),%cl
 213:	3b 0b                	cmp    (%ebx),%ecx
 215:	27                   	daa    
 216:	19 20                	sbb    %esp,(%eax)
 218:	0b 00                	or     (%eax),%eax
 21a:	00 00                	add    %al,(%eax)
 21c:	01 11                	add    %edx,(%ecx)
 21e:	01 25 0e 13 0b 03    	add    %esp,0x30b130e
 224:	0e                   	push   %cs
 225:	1b 0e                	sbb    (%esi),%ecx
 227:	11 01                	adc    %eax,(%ecx)
 229:	12 06                	adc    (%esi),%al
 22b:	10 17                	adc    %dl,(%edi)
 22d:	00 00                	add    %al,(%eax)
 22f:	02 24 00             	add    (%eax,%eax,1),%ah
 232:	0b 0b                	or     (%ebx),%ecx
 234:	3e 0b 03             	or     %ds:(%ebx),%eax
 237:	0e                   	push   %cs
 238:	00 00                	add    %al,(%eax)
 23a:	03 16                	add    (%esi),%edx
 23c:	00 03                	add    %al,(%ebx)
 23e:	0e                   	push   %cs
 23f:	3a 0b                	cmp    (%ebx),%cl
 241:	3b 0b                	cmp    (%ebx),%ecx
 243:	49                   	dec    %ecx
 244:	13 00                	adc    (%eax),%eax
 246:	00 04 24             	add    %al,(%esp)
 249:	00 0b                	add    %cl,(%ebx)
 24b:	0b 3e                	or     (%esi),%edi
 24d:	0b 03                	or     (%ebx),%eax
 24f:	08 00                	or     %al,(%eax)
 251:	00 05 13 01 0b 0b    	add    %al,0xb0b0113
 257:	3a 0b                	cmp    (%ebx),%cl
 259:	3b 0b                	cmp    (%ebx),%ecx
 25b:	01 13                	add    %edx,(%ebx)
 25d:	00 00                	add    %al,(%eax)
 25f:	06                   	push   %es
 260:	0d 00 03 0e 3a       	or     $0x3a0e0300,%eax
 265:	0b 3b                	or     (%ebx),%edi
 267:	0b 49 13             	or     0x13(%ecx),%ecx
 26a:	38 0b                	cmp    %cl,(%ebx)
 26c:	00 00                	add    %al,(%eax)
 26e:	07                   	pop    %es
 26f:	0d 00 03 08 3a       	or     $0x3a080300,%eax
 274:	0b 3b                	or     (%ebx),%edi
 276:	0b 49 13             	or     0x13(%ecx),%ecx
 279:	38 0b                	cmp    %cl,(%ebx)
 27b:	00 00                	add    %al,(%eax)
 27d:	08 01                	or     %al,(%ecx)
 27f:	01 49 13             	add    %ecx,0x13(%ecx)
 282:	01 13                	add    %edx,(%ebx)
 284:	00 00                	add    %al,(%eax)
 286:	09 21                	or     %esp,(%ecx)
 288:	00 49 13             	add    %cl,0x13(%ecx)
 28b:	2f                   	das    
 28c:	0b 00                	or     (%eax),%eax
 28e:	00 0a                	add    %cl,(%edx)
 290:	13 01                	adc    (%ecx),%eax
 292:	03 08                	add    (%eax),%ecx
 294:	0b 05 3a 0b 3b 0b    	or     0xb3b0b3a,%eax
 29a:	01 13                	add    %edx,(%ebx)
 29c:	00 00                	add    %al,(%eax)
 29e:	0b 0d 00 03 0e 3a    	or     0x3a0e0300,%ecx
 2a4:	0b 3b                	or     (%ebx),%edi
 2a6:	0b 49 13             	or     0x13(%ecx),%ecx
 2a9:	38 05 00 00 0c 21    	cmp    %al,0x210c0000
 2af:	00 49 13             	add    %cl,0x13(%ecx)
 2b2:	2f                   	das    
 2b3:	05 00 00 0d 13       	add    $0x130d0000,%eax
 2b8:	01 03                	add    %eax,(%ebx)
 2ba:	0e                   	push   %cs
 2bb:	0b 0b                	or     (%ebx),%ecx
 2bd:	3a 0b                	cmp    (%ebx),%cl
 2bf:	3b 0b                	cmp    (%ebx),%ecx
 2c1:	01 13                	add    %edx,(%ebx)
 2c3:	00 00                	add    %al,(%eax)
 2c5:	0e                   	push   %cs
 2c6:	17                   	pop    %ss
 2c7:	01 0b                	add    %ecx,(%ebx)
 2c9:	0b 3a                	or     (%edx),%edi
 2cb:	0b 3b                	or     (%ebx),%edi
 2cd:	0b 01                	or     (%ecx),%eax
 2cf:	13 00                	adc    (%eax),%eax
 2d1:	00 0f                	add    %cl,(%edi)
 2d3:	0d 00 03 0e 3a       	or     $0x3a0e0300,%eax
 2d8:	0b 3b                	or     (%ebx),%edi
 2da:	0b 49 13             	or     0x13(%ecx),%ecx
 2dd:	00 00                	add    %al,(%eax)
 2df:	10 0d 00 03 08 3a    	adc    %cl,0x3a080300
 2e5:	0b 3b                	or     (%ebx),%edi
 2e7:	0b 49 13             	or     0x13(%ecx),%ecx
 2ea:	00 00                	add    %al,(%eax)
 2ec:	11 34 00             	adc    %esi,(%eax,%eax,1)
 2ef:	03 0e                	add    (%esi),%ecx
 2f1:	3a 0b                	cmp    (%ebx),%cl
 2f3:	3b 0b                	cmp    (%ebx),%ecx
 2f5:	49                   	dec    %ecx
 2f6:	13 3f                	adc    (%edi),%edi
 2f8:	19 02                	sbb    %eax,(%edx)
 2fa:	18 00                	sbb    %al,(%eax)
 2fc:	00 12                	add    %dl,(%edx)
 2fe:	2e 01 3f             	add    %edi,%cs:(%edi)
 301:	19 03                	sbb    %eax,(%ebx)
 303:	0e                   	push   %cs
 304:	3a 0b                	cmp    (%ebx),%cl
 306:	3b 0b                	cmp    (%ebx),%ecx
 308:	27                   	daa    
 309:	19 49 13             	sbb    %ecx,0x13(%ecx)
 30c:	11 01                	adc    %eax,(%ecx)
 30e:	12 06                	adc    (%esi),%al
 310:	40                   	inc    %eax
 311:	18 97 42 19 01 13    	sbb    %dl,0x13011942(%edi)
 317:	00 00                	add    %al,(%eax)
 319:	13 05 00 03 0e 3a    	adc    0x3a0e0300,%eax
 31f:	0b 3b                	or     (%ebx),%edi
 321:	0b 49 13             	or     0x13(%ecx),%ecx
 324:	02 18                	add    (%eax),%bl
 326:	00 00                	add    %al,(%eax)
 328:	14 34                	adc    $0x34,%al
 32a:	00 03                	add    %al,(%ebx)
 32c:	08 3a                	or     %bh,(%edx)
 32e:	0b 3b                	or     (%ebx),%edi
 330:	0b 49 13             	or     0x13(%ecx),%ecx
 333:	02 17                	add    (%edi),%dl
 335:	00 00                	add    %al,(%eax)
 337:	15 34 00 03 0e       	adc    $0xe030034,%eax
 33c:	3a 0b                	cmp    (%ebx),%cl
 33e:	3b 0b                	cmp    (%ebx),%ecx
 340:	49                   	dec    %ecx
 341:	13 02                	adc    (%edx),%eax
 343:	17                   	pop    %ss
 344:	00 00                	add    %al,(%eax)
 346:	16                   	push   %ss
 347:	89 82 01 00 11 01    	mov    %eax,0x1110001(%edx)
 34d:	31 13                	xor    %edx,(%ebx)
 34f:	00 00                	add    %al,(%eax)
 351:	17                   	pop    %ss
 352:	0f 00 0b             	str    (%ebx)
 355:	0b 49 13             	or     0x13(%ecx),%ecx
 358:	00 00                	add    %al,(%eax)
 35a:	18 2e                	sbb    %ch,(%esi)
 35c:	01 3f                	add    %edi,(%edi)
 35e:	19 03                	sbb    %eax,(%ebx)
 360:	0e                   	push   %cs
 361:	3a 0b                	cmp    (%ebx),%cl
 363:	3b 0b                	cmp    (%ebx),%ecx
 365:	27                   	daa    
 366:	19 11                	sbb    %edx,(%ecx)
 368:	01 12                	add    %edx,(%edx)
 36a:	06                   	push   %es
 36b:	40                   	inc    %eax
 36c:	18 97 42 19 01 13    	sbb    %dl,0x13011942(%edi)
 372:	00 00                	add    %al,(%eax)
 374:	19 05 00 03 08 3a    	sbb    %eax,0x3a080300
 37a:	0b 3b                	or     (%ebx),%edi
 37c:	0b 49 13             	or     0x13(%ecx),%ecx
 37f:	02 18                	add    (%eax),%bl
 381:	00 00                	add    %al,(%eax)
 383:	1a 34 00             	sbb    (%eax,%eax,1),%dh
 386:	03 0e                	add    (%esi),%ecx
 388:	3a 0b                	cmp    (%ebx),%cl
 38a:	3b 0b                	cmp    (%ebx),%ecx
 38c:	49                   	dec    %ecx
 38d:	13 02                	adc    (%edx),%eax
 38f:	18 00                	sbb    %al,(%eax)
 391:	00 1b                	add    %bl,(%ebx)
 393:	2e 00 3f             	add    %bh,%cs:(%edi)
 396:	19 3c 19             	sbb    %edi,(%ecx,%ebx,1)
 399:	6e                   	outsb  %ds:(%esi),(%dx)
 39a:	0e                   	push   %cs
 39b:	03 0e                	add    (%esi),%ecx
 39d:	3a 0b                	cmp    (%ebx),%cl
 39f:	3b 0b                	cmp    (%ebx),%ecx
 3a1:	00 00                	add    %al,(%eax)
 3a3:	00 01                	add    %al,(%ecx)
 3a5:	11 00                	adc    %eax,(%eax)
 3a7:	10 06                	adc    %al,(%esi)
 3a9:	11 01                	adc    %eax,(%ecx)
 3ab:	12 01                	adc    (%ecx),%al
 3ad:	03 08                	add    (%eax),%ecx
 3af:	1b 08                	sbb    (%eax),%ecx
 3b1:	25 08 13 05 00       	and    $0x51308,%eax
 3b6:	00 00                	add    %al,(%eax)

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	8d 00                	lea    (%eax),%eax
   2:	00 00                	add    %al,(%eax)
   4:	02 00                	add    (%eax),%al
   6:	29 00                	sub    %eax,(%eax)
   8:	00 00                	add    %al,(%eax)
   a:	01 01                	add    %eax,(%ecx)
   c:	fb                   	sti    
   d:	0e                   	push   %cs
   e:	0d 00 01 01 01       	or     $0x1010100,%eax
  13:	01 00                	add    %eax,(%eax)
  15:	00 00                	add    %al,(%eax)
  17:	01 00                	add    %eax,(%eax)
  19:	00 01                	add    %al,(%ecx)
  1b:	62 6f 6f             	bound  %ebp,0x6f(%edi)
  1e:	74 2f                	je     4f <PROT_MODE_DSEG+0x3f>
  20:	62 6f 6f             	bound  %ebp,0x6f(%edi)
  23:	74 31                	je     56 <PROT_MODE_DSEG+0x46>
  25:	00 00                	add    %al,(%eax)
  27:	62 6f 6f             	bound  %ebp,0x6f(%edi)
  2a:	74 31                	je     5d <PROT_MODE_DSEG+0x4d>
  2c:	2e 53                	cs push %ebx
  2e:	00 01                	add    %al,(%ecx)
  30:	00 00                	add    %al,(%eax)
  32:	00 00                	add    %al,(%eax)
  34:	05 02 00 7e 00       	add    $0x7e0002,%eax
  39:	00 03                	add    %al,(%ebx)
  3b:	c7 00 01 21 03 0a    	movl   $0xa032101,(%eax)
  41:	20 2f                	and    %ch,(%edi)
  43:	2f                   	das    
  44:	2f                   	das    
  45:	2f                   	das    
  46:	30 2f                	xor    %ch,(%edi)
  48:	2f                   	das    
  49:	2f                   	das    
  4a:	2f                   	das    
  4b:	03 0d 2e 3d 03 0d    	add    0xd033d2e,%ecx
  51:	3c 3d                	cmp    $0x3d,%al
  53:	67 3e 67 67 30 2f    	addr16 addr16 xor %ch,%ds:(%bx)
  59:	67 30 83 3d 4b       	xor    %al,0x4b3d(%bp,%di)
  5e:	2f                   	das    
  5f:	30 2f                	xor    %ch,(%edi)
  61:	3d 2f 30 3d 3d       	cmp    $0x3d3d302f,%eax
  66:	31 03                	xor    %eax,(%ebx)
  68:	0b 20                	or     (%eax),%esp
  6a:	03 17                	add    (%edi),%edx
  6c:	58                   	pop    %eax
  6d:	3d 4b 3d 03 0c       	cmp    $0xc033d4b,%eax
  72:	58                   	pop    %eax
  73:	3d 4b 2f 2f 2f       	cmp    $0x2f2f2f4b,%eax
  78:	2f                   	das    
  79:	03 0d 2e 59 59 68    	add    0x6859592e,%ecx
  7f:	5e                   	pop    %esi
  80:	03 0a                	add    (%edx),%ecx
  82:	20 21                	and    %ah,(%ecx)
  84:	30 21                	xor    %ah,(%ecx)
  86:	2f                   	das    
  87:	2f                   	das    
  88:	2f                   	das    
  89:	30 21                	xor    %ah,(%ecx)
  8b:	02 fd                	add    %ch,%bh
  8d:	18 00                	sbb    %al,(%eax)
  8f:	01 01                	add    %eax,(%ecx)
  91:	66 01 00             	add    %ax,(%eax)
  94:	00 02                	add    %al,(%edx)
  96:	00 3a                	add    %bh,(%edx)
  98:	00 00                	add    %al,(%eax)
  9a:	00 01                	add    %al,(%ecx)
  9c:	01 fb                	add    %edi,%ebx
  9e:	0e                   	push   %cs
  9f:	0d 00 01 01 01       	or     $0x1010100,%eax
  a4:	01 00                	add    %eax,(%eax)
  a6:	00 00                	add    %al,(%eax)
  a8:	01 00                	add    %eax,(%eax)
  aa:	00 01                	add    %al,(%ecx)
  ac:	62 6f 6f             	bound  %ebp,0x6f(%edi)
  af:	74 2f                	je     e0 <PROT_MODE_DSEG+0xd0>
  b1:	62 6f 6f             	bound  %ebp,0x6f(%edi)
  b4:	74 31                	je     e7 <PROT_MODE_DSEG+0xd7>
  b6:	00 00                	add    %al,(%eax)
  b8:	62 6f 6f             	bound  %ebp,0x6f(%edi)
  bb:	74 31                	je     ee <PROT_MODE_DSEG+0xde>
  bd:	6c                   	insb   (%dx),%es:(%edi)
  be:	69 62 2e 63 00 01 00 	imul   $0x10063,0x2e(%edx),%esp
  c5:	00 62 6f             	add    %ah,0x6f(%edx)
  c8:	6f                   	outsl  %ds:(%esi),(%dx)
  c9:	74 31                	je     fc <PROT_MODE_DSEG+0xec>
  cb:	6c                   	insb   (%dx),%es:(%edi)
  cc:	69 62 2e 68 00 01 00 	imul   $0x10068,0x2e(%edx),%esp
  d3:	00 00                	add    %al,(%eax)
  d5:	00 05 02 2a 8b 00    	add    %al,0x8b2a02
  db:	00 03                	add    %al,(%ebx)
  dd:	09 01                	or     %eax,(%ecx)
  df:	d6                   	(bad)  
  e0:	3d 83 59 67 33       	cmp    $0x33675983,%eax
  e5:	59                   	pop    %ecx
  e6:	4b                   	dec    %ebx
  e7:	3b 3d bc 08 3f 03    	cmp    0x33f08bc,%edi
  ed:	09 74 ad b9          	or     %esi,-0x47(%ebp,%ebp,4)
  f1:	3d 08 d7 c9 86       	cmp    $0x86c9d708,%eax
  f6:	c9                   	leave  
  f7:	3d 1f 67 24 3d       	cmp    $0x3d24671f,%eax
  fc:	00 02                	add    %al,(%edx)
  fe:	04 01                	add    $0x1,%al
 100:	08 15 03 14 3c 23    	or     %dl,0x233c1403
 106:	2b 2e                	sub    (%esi),%ebp
 108:	00 02                	add    %al,(%edx)
 10a:	04 01                	add    $0x1,%al
 10c:	3f                   	aas    
 10d:	00 02                	add    %al,(%edx)
 10f:	04 03                	add    $0x3,%al
 111:	67 3e 33 58 40       	xor    %ds:0x40(%bx,%si),%ebx
 116:	00 02                	add    %al,(%edx)
 118:	04 01                	add    $0x1,%al
 11a:	06                   	push   %es
 11b:	9e                   	sahf   
 11c:	00 02                	add    %al,(%edx)
 11e:	04 03                	add    $0x3,%al
 120:	06                   	push   %es
 121:	4c                   	dec    %esp
 122:	00 02                	add    %al,(%edx)
 124:	04 03                	add    $0x3,%al
 126:	3d 00 02 04 03       	cmp    $0x3040200,%eax
 12b:	67 00 02             	add    %al,(%bp,%si)
 12e:	04 03                	add    $0x3,%al
 130:	38 50 79             	cmp    %dl,0x79(%eax)
 133:	ac                   	lods   %ds:(%esi),%al
 134:	00 02                	add    %al,(%edx)
 136:	04 01                	add    $0x1,%al
 138:	08 de                	or     %bl,%dh
 13a:	00 02                	add    %al,(%edx)
 13c:	04 01                	add    $0x1,%al
 13e:	9f                   	lahf   
 13f:	00 02                	add    %al,(%edx)
 141:	04 01                	add    $0x1,%al
 143:	2d 00 02 04 01       	sub    $0x1040200,%eax
 148:	67 2d 4c 67 75 4b    	addr16 sub $0x4b75674c,%eax
 14e:	3d 65 5d ae 64       	cmp    $0x64ae5d65,%eax
 153:	30 d7                	xor    %dl,%bh
 155:	5d                   	pop    %ebp
 156:	ae                   	scas   %es:(%edi),%al
 157:	64 30 d7             	fs xor %dl,%bh
 15a:	03 bd 7f 58 d7 e5    	add    -0x1a28a781(%ebp),%edi
 160:	59                   	pop    %ecx
 161:	49                   	dec    %ecx
 162:	03 d1                	add    %ecx,%edx
 164:	00 58 04             	add    %bl,0x4(%eax)
 167:	02 03                	add    (%ebx),%al
 169:	99                   	cltd   
 16a:	7f 20                	jg     18c <PROT_MODE_DSEG+0x17c>
 16c:	04 01                	add    $0x1,%al
 16e:	03 e7                	add    %edi,%esp
 170:	00 58 3c             	add    %bl,0x3c(%eax)
 173:	04 02                	add    $0x2,%al
 175:	03 99 7f 3c 04 01    	add    0x1043c7f(%ecx),%ebx
 17b:	03 e1                	add    %ecx,%esp
 17d:	00 20                	add    %ah,(%eax)
 17f:	04 02                	add    $0x2,%al
 181:	03 92 7f 74 04 01    	add    0x104747f(%edx),%edx
 187:	03 fa                	add    %edx,%edi
 189:	00 f2                	add    %dh,%dl
 18b:	04 02                	add    $0x2,%al
 18d:	03 86 7f 2e 04 01    	add    0x1042e7f(%esi),%eax
 193:	03 fa                	add    %edx,%edi
 195:	00 58 04             	add    %bl,0x4(%eax)
 198:	02 03                	add    (%ebx),%al
 19a:	86 7f 3c             	xchg   %bh,0x3c(%edi)
 19d:	04 01                	add    $0x1,%al
 19f:	03 fb                	add    %ebx,%edi
 1a1:	00 20                	add    %ah,(%eax)
 1a3:	04 02                	add    $0x2,%al
 1a5:	03 85 7f 2e 04 01    	add    0x1042e7f(%ebp),%eax
 1ab:	03 fb                	add    %ebx,%edi
 1ad:	00 58 04             	add    %bl,0x4(%eax)
 1b0:	02 03                	add    (%ebx),%al
 1b2:	85 7f 3c             	test   %edi,0x3c(%edi)
 1b5:	04 01                	add    $0x1,%al
 1b7:	03 fc                	add    %esp,%edi
 1b9:	00 20                	add    %ah,(%eax)
 1bb:	04 02                	add    $0x2,%al
 1bd:	03 84 7f 2e 04 01 03 	add    0x301042e(%edi,%edi,2),%eax
 1c4:	fc                   	cld    
 1c5:	00 58 04             	add    %bl,0x4(%eax)
 1c8:	02 03                	add    (%ebx),%al
 1ca:	84 7f 66             	test   %bh,0x66(%edi)
 1cd:	03 0d 90 04 01 03    	add    0x3010490,%ecx
 1d3:	e1 00                	loope  1d5 <PROT_MODE_DSEG+0x1c5>
 1d5:	20 04 02             	and    %al,(%edx,%eax,1)
 1d8:	03 a6 7f 74 04 01    	add    0x104747f(%esi),%esp
 1de:	03 f0                	add    %eax,%esi
 1e0:	00 f2                	add    %dh,%dl
 1e2:	42                   	inc    %edx
 1e3:	66 03 09             	add    (%ecx),%cx
 1e6:	3c 03                	cmp    $0x3,%al
 1e8:	7a 3c                	jp     226 <PROT_MODE_DSEG+0x216>
 1ea:	31 63 6c             	xor    %esp,0x6c(%ebx)
 1ed:	37                   	aaa    
 1ee:	41                   	inc    %ecx
 1ef:	41                   	inc    %ecx
 1f0:	4c                   	dec    %esp
 1f1:	30 1f                	xor    %bl,(%edi)
 1f3:	65 5a                	gs pop %edx
 1f5:	4c                   	dec    %esp
 1f6:	02 08                	add    (%eax),%cl
 1f8:	00 01                	add    %al,(%ecx)
 1fa:	01 ae 00 00 00 02    	add    %ebp,0x2000000(%esi)
 200:	00 3b                	add    %bh,(%ebx)
 202:	00 00                	add    %al,(%eax)
 204:	00 01                	add    %al,(%ecx)
 206:	01 fb                	add    %edi,%ebx
 208:	0e                   	push   %cs
 209:	0d 00 01 01 01       	or     $0x1010100,%eax
 20e:	01 00                	add    %eax,(%eax)
 210:	00 00                	add    %al,(%eax)
 212:	01 00                	add    %eax,(%eax)
 214:	00 01                	add    %al,(%ecx)
 216:	62 6f 6f             	bound  %ebp,0x6f(%edi)
 219:	74 2f                	je     24a <PROT_MODE_DSEG+0x23a>
 21b:	62 6f 6f             	bound  %ebp,0x6f(%edi)
 21e:	74 31                	je     251 <PROT_MODE_DSEG+0x241>
 220:	00 00                	add    %al,(%eax)
 222:	62 6f 6f             	bound  %ebp,0x6f(%edi)
 225:	74 31                	je     258 <PROT_MODE_DSEG+0x248>
 227:	6d                   	insl   (%dx),%es:(%edi)
 228:	61                   	popa   
 229:	69 6e 2e 63 00 01 00 	imul   $0x10063,0x2e(%esi),%ebp
 230:	00 62 6f             	add    %ah,0x6f(%edx)
 233:	6f                   	outsl  %ds:(%esi),(%dx)
 234:	74 31                	je     267 <PROT_MODE_DSEG+0x257>
 236:	6c                   	insb   (%dx),%es:(%edi)
 237:	69 62 2e 68 00 01 00 	imul   $0x10068,0x2e(%edx),%esp
 23e:	00 00                	add    %al,(%eax)
 240:	00 05 02 cf 8d 00    	add    %al,0x8dcf02
 246:	00 03                	add    %al,(%ebx)
 248:	ce                   	into   
 249:	00 01                	add    %al,(%ecx)
 24b:	08 40 08             	or     %al,0x8(%eax)
 24e:	3f                   	aas    
 24f:	e5 08                	in     $0x8,%eax
 251:	23 59 73             	and    0x73(%ecx),%ebx
 254:	67 00 02             	add    %al,(%bp,%si)
 257:	04 01                	add    $0x1,%al
 259:	5a                   	pop    %edx
 25a:	00 02                	add    %al,(%edx)
 25c:	04 02                	add    $0x2,%al
 25e:	4c                   	dec    %esp
 25f:	00 02                	add    %al,(%edx)
 261:	04 02                	add    $0x2,%al
 263:	64 00 02             	add    %al,%fs:(%edx)
 266:	04 02                	add    $0x2,%al
 268:	3e 00 02             	add    %al,%ds:(%edx)
 26b:	04 02                	add    $0x2,%al
 26d:	aa                   	stos   %al,%es:(%edi)
 26e:	5d                   	pop    %ebp
 26f:	59                   	pop    %ecx
 270:	49                   	dec    %ecx
 271:	59                   	pop    %ecx
 272:	4e                   	dec    %esi
 273:	6a c4                	push   $0xffffffc4
 275:	3c 41                	cmp    $0x41,%al
 277:	bb e6 3e 3a 68       	mov    $0x683a3ee6,%ebx
 27c:	00 02                	add    %al,(%edx)
 27e:	04 01                	add    $0x1,%al
 280:	54                   	push   %esp
 281:	00 02                	add    %al,(%edx)
 283:	04 02                	add    $0x2,%al
 285:	06                   	push   %es
 286:	9e                   	sahf   
 287:	06                   	push   %es
 288:	7a 67                	jp     2f1 <PROT_MODE_DSEG+0x2e1>
 28a:	68 03 a8 7f d6       	push   $0xd67fa803
 28f:	03 15 66 03 6b c8    	add    0xc86b0366,%edx
 295:	3c 3e                	cmp    $0x3e,%al
 297:	76 03                	jbe    29c <PROT_MODE_DSEG+0x28c>
 299:	0e                   	push   %cs
 29a:	d6                   	(bad)  
 29b:	b0 00                	mov    $0x0,%al
 29d:	02 04 02             	add    (%edx,%eax,1),%al
 2a0:	08 1f                	or     %bl,(%edi)
 2a2:	6b 98 08 30 e9 d8 02 	imul   $0x2,-0x2716cff8(%eax),%ebx
 2a9:	0b 00                	or     (%eax),%eax
 2ab:	01 01                	add    %eax,(%ecx)
 2ad:	46                   	inc    %esi
 2ae:	00 00                	add    %al,(%eax)
 2b0:	00 02                	add    %al,(%edx)
 2b2:	00 2f                	add    %ch,(%edi)
 2b4:	00 00                	add    %al,(%eax)
 2b6:	00 01                	add    %al,(%ecx)
 2b8:	01 fb                	add    %edi,%ebx
 2ba:	0e                   	push   %cs
 2bb:	0d 00 01 01 01       	or     $0x1010100,%eax
 2c0:	01 00                	add    %eax,(%eax)
 2c2:	00 00                	add    %al,(%eax)
 2c4:	01 00                	add    %eax,(%eax)
 2c6:	00 01                	add    %al,(%ecx)
 2c8:	62 6f 6f             	bound  %ebp,0x6f(%edi)
 2cb:	74 2f                	je     2fc <PROT_MODE_DSEG+0x2ec>
 2cd:	62 6f 6f             	bound  %ebp,0x6f(%edi)
 2d0:	74 31                	je     303 <PROT_MODE_DSEG+0x2f3>
 2d2:	00 00                	add    %al,(%eax)
 2d4:	65 78 65             	gs js  33c <PROT_MODE_DSEG+0x32c>
 2d7:	63 5f 6b             	arpl   %bx,0x6b(%edi)
 2da:	65 72 6e             	gs jb  34b <PROT_MODE_DSEG+0x33b>
 2dd:	65 6c                	gs insb (%dx),%es:(%edi)
 2df:	2e 53                	cs push %ebx
 2e1:	00 01                	add    %al,(%ecx)
 2e3:	00 00                	add    %al,(%eax)
 2e5:	00 00                	add    %al,(%eax)
 2e7:	05 02 67 8f 00       	add    $0x8f6702,%eax
 2ec:	00 17                	add    %dl,(%edi)
 2ee:	21 59 4b             	and    %ebx,0x4b(%ecx)
 2f1:	4b                   	dec    %ebx
 2f2:	02 02                	add    (%edx),%al
 2f4:	00 01                	add    %al,(%ecx)
 2f6:	01                   	.byte 0x1

Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	65 6e                	outsb  %gs:(%esi),(%dx)
   2:	64 5f                	fs pop %edi
   4:	76 61                	jbe    67 <PROT_MODE_DSEG+0x57>
   6:	00 77 61             	add    %dh,0x61(%edi)
   9:	69 74 64 69 73 6b 00 	imul   $0x70006b73,0x69(%esp,%eiz,2),%esi
  10:	70 
  11:	75 74                	jne    87 <PROT_MODE_DSEG+0x77>
  13:	6c                   	insb   (%dx),%es:(%edi)
  14:	69 6e 65 00 73 68 6f 	imul   $0x6f687300,0x65(%esi),%ebp
  1b:	72 74                	jb     91 <PROT_MODE_DSEG+0x81>
  1d:	20 69 6e             	and    %ch,0x6e(%ecx)
  20:	74 00                	je     22 <PROT_MODE_DSEG+0x12>
  22:	73 69                	jae    8d <PROT_MODE_DSEG+0x7d>
  24:	7a 65                	jp     8b <PROT_MODE_DSEG+0x7b>
  26:	74 79                	je     a1 <PROT_MODE_DSEG+0x91>
  28:	70 65                	jo     8f <PROT_MODE_DSEG+0x7f>
  2a:	00 2f                	add    %ch,(%edi)
  2c:	68 6f 6d 65 2f       	push   $0x2f656d6f
  31:	73 74                	jae    a7 <PROT_MODE_DSEG+0x97>
  33:	75 64                	jne    99 <PROT_MODE_DSEG+0x89>
  35:	65 6e                	outsb  %gs:(%esi),(%dx)
  37:	74 2f                	je     68 <PROT_MODE_DSEG+0x58>
  39:	6f                   	outsl  %ds:(%esi),(%dx)
  3a:	73 2d                	jae    69 <PROT_MODE_DSEG+0x59>
  3c:	63 6c 61 73          	arpl   %bp,0x73(%ecx,%eiz,2)
  40:	73 2d                	jae    6f <PROT_MODE_DSEG+0x5f>
  42:	70 72                	jo     b6 <PROT_MODE_DSEG+0xa6>
  44:	6f                   	outsl  %ds:(%esi),(%dx)
  45:	6a 65                	push   $0x65
  47:	63 74 2e 72          	arpl   %si,0x72(%esi,%ebp,1)
  4b:	65 70 6f             	gs jo  bd <PROT_MODE_DSEG+0xad>
  4e:	2f                   	das    
  4f:	6c                   	insb   (%dx),%es:(%edi)
  50:	61                   	popa   
  51:	62 32                	bound  %esi,(%edx)
  53:	2f                   	das    
  54:	73 68                	jae    be <PROT_MODE_DSEG+0xae>
  56:	65 6e                	outsb  %gs:(%esi),(%dx)
  58:	6c                   	insb   (%dx),%es:(%edi)
  59:	75 2f                	jne    8a <PROT_MODE_DSEG+0x7a>
  5b:	73 72                	jae    cf <PROT_MODE_DSEG+0xbf>
  5d:	63 00                	arpl   %ax,(%eax)
  5f:	72 6f                	jb     d0 <PROT_MODE_DSEG+0xc0>
  61:	6c                   	insb   (%dx),%es:(%edi)
  62:	6c                   	insb   (%dx),%es:(%edi)
  63:	00 73 74             	add    %dh,0x74(%ebx)
  66:	72 69                	jb     d1 <PROT_MODE_DSEG+0xc1>
  68:	6e                   	outsb  %ds:(%esi),(%dx)
  69:	67 00 70 61          	add    %dh,0x61(%bx,%si)
  6d:	6e                   	outsb  %ds:(%esi),(%dx)
  6e:	69 63 00 70 75 74 69 	imul   $0x69747570,0x0(%ebx),%esp
  75:	00 72 65             	add    %dh,0x65(%edx)
  78:	61                   	popa   
  79:	64 73 65             	fs jae e1 <PROT_MODE_DSEG+0xd1>
  7c:	63 74 6f 72          	arpl   %si,0x72(%edi,%ebp,2)
  80:	00 62 6f             	add    %ah,0x6f(%edx)
  83:	6f                   	outsl  %ds:(%esi),(%dx)
  84:	74 2f                	je     b5 <PROT_MODE_DSEG+0xa5>
  86:	62 6f 6f             	bound  %ebp,0x6f(%edi)
  89:	74 31                	je     bc <PROT_MODE_DSEG+0xac>
  8b:	2f                   	das    
  8c:	62 6f 6f             	bound  %ebp,0x6f(%edi)
  8f:	74 31                	je     c2 <PROT_MODE_DSEG+0xb2>
  91:	6c                   	insb   (%dx),%es:(%edi)
  92:	69 62 2e 63 00 75 69 	imul   $0x69750063,0x2e(%edx),%esp
  99:	6e                   	outsb  %ds:(%esi),(%dx)
  9a:	74 38                	je     d4 <PROT_MODE_DSEG+0xc4>
  9c:	5f                   	pop    %edi
  9d:	74 00                	je     9f <PROT_MODE_DSEG+0x8f>
  9f:	6f                   	outsl  %ds:(%esi),(%dx)
  a0:	75 74                	jne    116 <PROT_MODE_DSEG+0x106>
  a2:	62 00                	bound  %eax,(%eax)
  a4:	69 6e 73 6c 00 47 4e 	imul   $0x4e47006c,0x73(%esi),%ebp
  ab:	55                   	push   %ebp
  ac:	20 43 31             	and    %al,0x31(%ebx)
  af:	31 20                	xor    %esp,(%eax)
  b1:	36 2e 33 2e          	ss xor %cs:(%esi),%ebp
  b5:	30 20                	xor    %ah,(%eax)
  b7:	32 30                	xor    (%eax),%dh
  b9:	31 37                	xor    %esi,(%edi)
  bb:	30 34 30             	xor    %dh,(%eax,%esi,1)
  be:	36 20 2d 6d 33 32 20 	and    %ch,%ss:0x2032336d
  c5:	2d 6d 74 75 6e       	sub    $0x6e75746d,%eax
  ca:	65 3d 67 65 6e 65    	gs cmp $0x656e6567,%eax
  d0:	72 69                	jb     13b <PROT_MODE_DSEG+0x12b>
  d2:	63 20                	arpl   %sp,(%eax)
  d4:	2d 6d 61 72 63       	sub    $0x6372616d,%eax
  d9:	68 3d 69 36 38       	push   $0x3836693d
  de:	36 20 2d 67 20 2d 4f 	and    %ch,%ss:0x4f2d2067
  e5:	73 20                	jae    107 <PROT_MODE_DSEG+0xf7>
  e7:	2d 4f 73 20 2d       	sub    $0x2d20734f,%eax
  ec:	66 6e                	data16 outsb %ds:(%esi),(%dx)
  ee:	6f                   	outsl  %ds:(%esi),(%dx)
  ef:	2d 62 75 69 6c       	sub    $0x6c697562,%eax
  f4:	74 69                	je     15f <PROT_MODE_DSEG+0x14f>
  f6:	6e                   	outsb  %ds:(%esi),(%dx)
  f7:	20 2d 66 6e 6f 2d    	and    %ch,0x2d6f6e66
  fd:	73 74                	jae    173 <PROT_MODE_DSEG+0x163>
  ff:	61                   	popa   
 100:	63 6b 2d             	arpl   %bp,0x2d(%ebx)
 103:	70 72                	jo     177 <PROT_MODE_DSEG+0x167>
 105:	6f                   	outsl  %ds:(%esi),(%dx)
 106:	74 65                	je     16d <PROT_MODE_DSEG+0x15d>
 108:	63 74 6f 72          	arpl   %si,0x72(%edi,%ebp,2)
 10c:	00 6c 6f 6e          	add    %ch,0x6e(%edi,%ebp,2)
 110:	67 20 6c 6f          	and    %ch,0x6f(%si)
 114:	6e                   	outsb  %ds:(%esi),(%dx)
 115:	67 20 69 6e          	and    %ch,0x6e(%bx,%di)
 119:	74 00                	je     11b <PROT_MODE_DSEG+0x10b>
 11b:	72 65                	jb     182 <PROT_MODE_DSEG+0x172>
 11d:	61                   	popa   
 11e:	64 73 65             	fs jae 186 <PROT_MODE_DSEG+0x176>
 121:	63 74 69 6f          	arpl   %si,0x6f(%ecx,%ebp,2)
 125:	6e                   	outsb  %ds:(%esi),(%dx)
 126:	00 69 74             	add    %ch,0x74(%ecx)
 129:	6f                   	outsl  %ds:(%esi),(%dx)
 12a:	61                   	popa   
 12b:	00 75 6e             	add    %dh,0x6e(%ebp)
 12e:	73 69                	jae    199 <PROT_MODE_DSEG+0x189>
 130:	67 6e                	outsb  %ds:(%si),(%dx)
 132:	65 64 20 63 68       	gs and %ah,%fs:0x68(%ebx)
 137:	61                   	popa   
 138:	72 00                	jb     13a <PROT_MODE_DSEG+0x12a>
 13a:	69 74 6f 68 00 70 75 	imul   $0x74757000,0x68(%edi,%ebp,2),%esi
 141:	74 
 142:	63 00                	arpl   %ax,(%eax)
 144:	6c                   	insb   (%dx),%es:(%edi)
 145:	6f                   	outsl  %ds:(%esi),(%dx)
 146:	6e                   	outsb  %ds:(%esi),(%dx)
 147:	67 20 6c 6f          	and    %ch,0x6f(%si)
 14b:	6e                   	outsb  %ds:(%esi),(%dx)
 14c:	67 20 75 6e          	and    %dh,0x6e(%di)
 150:	73 69                	jae    1bb <PROT_MODE_DSEG+0x1ab>
 152:	67 6e                	outsb  %ds:(%si),(%dx)
 154:	65 64 20 69 6e       	gs and %ch,%fs:0x6e(%ecx)
 159:	74 00                	je     15b <PROT_MODE_DSEG+0x14b>
 15b:	75 69                	jne    1c6 <PROT_MODE_DSEG+0x1b6>
 15d:	6e                   	outsb  %ds:(%esi),(%dx)
 15e:	74 33                	je     193 <PROT_MODE_DSEG+0x183>
 160:	32 5f 74             	xor    0x74(%edi),%bl
 163:	00 63 6f             	add    %ah,0x6f(%ebx)
 166:	6c                   	insb   (%dx),%es:(%edi)
 167:	6f                   	outsl  %ds:(%esi),(%dx)
 168:	72 00                	jb     16a <PROT_MODE_DSEG+0x15a>
 16a:	69 74 6f 78 00 70 75 	imul   $0x74757000,0x78(%edi,%ebp,2),%esi
 171:	74 
 172:	73 00                	jae    174 <PROT_MODE_DSEG+0x164>
 174:	73 68                	jae    1de <PROT_MODE_DSEG+0x1ce>
 176:	6f                   	outsl  %ds:(%esi),(%dx)
 177:	72 74                	jb     1ed <PROT_MODE_DSEG+0x1dd>
 179:	20 75 6e             	and    %dh,0x6e(%ebp)
 17c:	73 69                	jae    1e7 <PROT_MODE_DSEG+0x1d7>
 17e:	67 6e                	outsb  %ds:(%si),(%dx)
 180:	65 64 20 69 6e       	gs and %ch,%fs:0x6e(%ecx)
 185:	74 00                	je     187 <PROT_MODE_DSEG+0x177>
 187:	73 74                	jae    1fd <PROT_MODE_DSEG+0x1ed>
 189:	72 6c                	jb     1f7 <PROT_MODE_DSEG+0x1e7>
 18b:	65 6e                	outsb  %gs:(%esi),(%dx)
 18d:	00 64 61 74          	add    %ah,0x74(%ecx,%eiz,2)
 191:	61                   	popa   
 192:	00 70 6f             	add    %dh,0x6f(%eax)
 195:	72 74                	jb     20b <PROT_MODE_DSEG+0x1fb>
 197:	00 73 69             	add    %dh,0x69(%ebx)
 19a:	67 6e                	outsb  %ds:(%si),(%dx)
 19c:	00 72 65             	add    %dh,0x65(%edx)
 19f:	76 65                	jbe    206 <PROT_MODE_DSEG+0x1f6>
 1a1:	72 73                	jb     216 <PROT_MODE_DSEG+0x206>
 1a3:	65 00 70 75          	add    %dh,%gs:0x75(%eax)
 1a7:	74 69                	je     212 <PROT_MODE_DSEG+0x202>
 1a9:	5f                   	pop    %edi
 1aa:	73 74                	jae    220 <PROT_MODE_DSEG+0x210>
 1ac:	72 00                	jb     1ae <PROT_MODE_DSEG+0x19e>
 1ae:	62 6c 61 6e          	bound  %ebp,0x6e(%ecx,%eiz,2)
 1b2:	6b 00 72             	imul   $0x72,(%eax),%eax
 1b5:	6f                   	outsl  %ds:(%esi),(%dx)
 1b6:	6f                   	outsl  %ds:(%esi),(%dx)
 1b7:	74 00                	je     1b9 <PROT_MODE_DSEG+0x1a9>
 1b9:	76 69                	jbe    224 <PROT_MODE_DSEG+0x214>
 1bb:	64 65 6f             	fs outsl %gs:(%esi),(%dx)
 1be:	00 64 69 73          	add    %ah,0x73(%ecx,%ebp,2)
 1c2:	6b 5f 73 69          	imul   $0x69,0x73(%edi),%ebx
 1c6:	67 00 65 6c          	add    %ah,0x6c(%di)
 1ca:	66 68 64 66          	pushw  $0x6664
 1ce:	00 68 65             	add    %ch,0x65(%eax)
 1d1:	61                   	popa   
 1d2:	64 65 72 00          	fs gs jb 1d6 <PROT_MODE_DSEG+0x1c6>
 1d6:	65 5f                	gs pop %edi
 1d8:	73 68                	jae    242 <PROT_MODE_DSEG+0x232>
 1da:	73 74                	jae    250 <PROT_MODE_DSEG+0x240>
 1dc:	72 6e                	jb     24c <PROT_MODE_DSEG+0x23c>
 1de:	64 78 00             	fs js  1e1 <PROT_MODE_DSEG+0x1d1>
 1e1:	6d                   	insl   (%dx),%es:(%edi)
 1e2:	6d                   	insl   (%dx),%es:(%edi)
 1e3:	61                   	popa   
 1e4:	70 5f                	jo     245 <PROT_MODE_DSEG+0x235>
 1e6:	61                   	popa   
 1e7:	64 64 72 00          	fs fs jb 1eb <PROT_MODE_DSEG+0x1db>
 1eb:	65 6c                	gs insb (%dx),%es:(%edi)
 1ed:	66 68 64 72          	pushw  $0x7264
 1f1:	00 76 62             	add    %dh,0x62(%esi)
 1f4:	65 5f                	gs pop %edi
 1f6:	69 6e 74 65 72 66 61 	imul   $0x61667265,0x74(%esi),%ebp
 1fd:	63 65 5f             	arpl   %sp,0x5f(%ebp)
 200:	6f                   	outsl  %ds:(%esi),(%dx)
 201:	66 66 00 65 5f       	data16 data16 add %ah,0x5f(%ebp)
 206:	65 6e                	outsb  %gs:(%esi),(%dx)
 208:	74 72                	je     27c <PROT_MODE_DSEG+0x26c>
 20a:	79 00                	jns    20c <PROT_MODE_DSEG+0x1fc>
 20c:	75 69                	jne    277 <PROT_MODE_DSEG+0x267>
 20e:	6e                   	outsb  %ds:(%esi),(%dx)
 20f:	74 36                	je     247 <PROT_MODE_DSEG+0x237>
 211:	34 5f                	xor    $0x5f,%al
 213:	74 00                	je     215 <PROT_MODE_DSEG+0x205>
 215:	6c                   	insb   (%dx),%es:(%edi)
 216:	6f                   	outsl  %ds:(%esi),(%dx)
 217:	61                   	popa   
 218:	64 5f                	fs pop %edi
 21a:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
 21e:	65 6c                	gs insb (%dx),%es:(%edi)
 220:	00 6d 62             	add    %ch,0x62(%ebp)
 223:	72 5f                	jb     284 <PROT_MODE_DSEG+0x274>
 225:	74 00                	je     227 <PROT_MODE_DSEG+0x217>
 227:	70 5f                	jo     288 <PROT_MODE_DSEG+0x278>
 229:	6d                   	insl   (%dx),%es:(%edi)
 22a:	65 6d                	gs insl (%dx),%es:(%edi)
 22c:	73 7a                	jae    2a8 <PROT_MODE_DSEG+0x298>
 22e:	00 70 5f             	add    %dh,0x5f(%eax)
 231:	6f                   	outsl  %ds:(%esi),(%dx)
 232:	66 66 73 65          	data16 data16 jae 29b <PROT_MODE_DSEG+0x28b>
 236:	74 00                	je     238 <PROT_MODE_DSEG+0x228>
 238:	62 6f 6f             	bound  %ebp,0x6f(%edi)
 23b:	74 6c                	je     2a9 <PROT_MODE_DSEG+0x299>
 23d:	6f                   	outsl  %ds:(%esi),(%dx)
 23e:	61                   	popa   
 23f:	64 65 72 00          	fs gs jb 243 <PROT_MODE_DSEG+0x233>
 243:	65 5f                	gs pop %edi
 245:	66 6c                	data16 insb (%dx),%es:(%edi)
 247:	61                   	popa   
 248:	67 73 00             	addr16 jae 24b <PROT_MODE_DSEG+0x23b>
 24b:	63 6d 64             	arpl   %bp,0x64(%ebp)
 24e:	6c                   	insb   (%dx),%es:(%edi)
 24f:	69 6e 65 00 65 5f 6d 	imul   $0x6d5f6500,0x65(%esi),%ebp
 256:	61                   	popa   
 257:	63 68 69             	arpl   %bp,0x69(%eax)
 25a:	6e                   	outsb  %ds:(%esi),(%dx)
 25b:	65 00 65 5f          	add    %ah,%gs:0x5f(%ebp)
 25f:	70 68                	jo     2c9 <PROT_MODE_DSEG+0x2b9>
 261:	65 6e                	outsb  %gs:(%esi),(%dx)
 263:	74 73                	je     2d8 <PROT_MODE_DSEG+0x2c8>
 265:	69 7a 65 00 65 78 65 	imul   $0x65786500,0x65(%edx),%edi
 26c:	63 5f 6b             	arpl   %bx,0x6b(%edi)
 26f:	65 72 6e             	gs jb  2e0 <PROT_MODE_DSEG+0x2d0>
 272:	65 6c                	gs insb (%dx),%es:(%edi)
 274:	00 6d 6f             	add    %ch,0x6f(%ebp)
 277:	64 73 5f             	fs jae 2d9 <PROT_MODE_DSEG+0x2c9>
 27a:	61                   	popa   
 27b:	64 64 72 00          	fs fs jb 27f <PROT_MODE_DSEG+0x26f>
 27f:	73 74                	jae    2f5 <PROT_MODE_DSEG+0x2e5>
 281:	72 73                	jb     2f6 <PROT_MODE_DSEG+0x2e6>
 283:	69 7a 65 00 70 61 72 	imul   $0x72617000,0x65(%edx),%edi
 28a:	74 33                	je     2bf <PROT_MODE_DSEG+0x2af>
 28c:	00 70 5f             	add    %dh,0x5f(%eax)
 28f:	74 79                	je     30a <PROT_MODE_DSEG+0x2fa>
 291:	70 65                	jo     2f8 <PROT_MODE_DSEG+0x2e8>
 293:	00 70 72             	add    %dh,0x72(%eax)
 296:	6f                   	outsl  %ds:(%esi),(%dx)
 297:	67 68 64 72 00 65    	addr16 push $0x65007264
 29d:	5f                   	pop    %edi
 29e:	73 68                	jae    308 <PROT_MODE_DSEG+0x2f8>
 2a0:	65 6e                	outsb  %gs:(%esi),(%dx)
 2a2:	74 73                	je     317 <PROT_MODE_DSEG+0x307>
 2a4:	69 7a 65 00 73 68 6e 	imul   $0x6e687300,0x65(%edx),%edi
 2ab:	64 78 00             	fs js  2ae <PROT_MODE_DSEG+0x29e>
 2ae:	65 5f                	gs pop %edi
 2b0:	74 79                	je     32b <PROT_MODE_DSEG+0x31b>
 2b2:	70 65                	jo     319 <PROT_MODE_DSEG+0x309>
 2b4:	00 64 72 69          	add    %ah,0x69(%edx,%esi,2)
 2b8:	76 65                	jbe    31f <PROT_MODE_DSEG+0x30f>
 2ba:	73 5f                	jae    31b <PROT_MODE_DSEG+0x30b>
 2bc:	61                   	popa   
 2bd:	64 64 72 00          	fs fs jb 2c1 <PROT_MODE_DSEG+0x2b1>
 2c1:	65 5f                	gs pop %edi
 2c3:	65 68 73 69 7a 65    	gs push $0x657a6973
 2c9:	00 70 61             	add    %dh,0x61(%eax)
 2cc:	72 74                	jb     342 <PROT_MODE_DSEG+0x332>
 2ce:	69 74 69 6f 6e 00 62 	imul   $0x6962006e,0x6f(%ecx,%ebp,2),%esi
 2d5:	69 
 2d6:	6f                   	outsl  %ds:(%esi),(%dx)
 2d7:	73 5f                	jae    338 <PROT_MODE_DSEG+0x328>
 2d9:	73 6d                	jae    348 <PROT_MODE_DSEG+0x338>
 2db:	61                   	popa   
 2dc:	70 5f                	jo     33d <PROT_MODE_DSEG+0x32d>
 2de:	74 00                	je     2e0 <PROT_MODE_DSEG+0x2d0>
 2e0:	6d                   	insl   (%dx),%es:(%edi)
 2e1:	62 6f 6f             	bound  %ebp,0x6f(%edi)
 2e4:	74 5f                	je     345 <PROT_MODE_DSEG+0x335>
 2e6:	69 6e 66 6f 5f 74 00 	imul   $0x745f6f,0x66(%esi),%ebp
 2ed:	62 6f 6f             	bound  %ebp,0x6f(%edi)
 2f0:	74 31                	je     323 <PROT_MODE_DSEG+0x313>
 2f2:	6d                   	insl   (%dx),%es:(%edi)
 2f3:	61                   	popa   
 2f4:	69 6e 00 65 5f 76 65 	imul   $0x65765f65,0x0(%esi),%ebp
 2fb:	72 73                	jb     370 <PROT_MODE_DSEG+0x360>
 2fd:	69 6f 6e 00 70 61 72 	imul   $0x72617000,0x6e(%edi),%ebp
 304:	74 31                	je     337 <PROT_MODE_DSEG+0x327>
 306:	00 70 61             	add    %dh,0x61(%eax)
 309:	72 74                	jb     37f <PROT_MODE_DSEG+0x36f>
 30b:	32 00                	xor    (%eax),%al
 30d:	64 72 69             	fs jb  379 <PROT_MODE_DSEG+0x369>
 310:	76 65                	jbe    377 <PROT_MODE_DSEG+0x367>
 312:	72 00                	jb     314 <PROT_MODE_DSEG+0x304>
 314:	6d                   	insl   (%dx),%es:(%edi)
 315:	62 6f 6f             	bound  %ebp,0x6f(%edi)
 318:	74 5f                	je     379 <PROT_MODE_DSEG+0x369>
 31a:	69 6e 66 6f 5f 70 6f 	imul   $0x6f705f6f,0x66(%esi),%ebp
 321:	69 6e 74 65 72 00 66 	imul   $0x66007265,0x74(%esi),%ebp
 328:	69 72 73 74 5f 63 68 	imul   $0x68635f74,0x73(%edx),%esi
 32f:	73 00                	jae    331 <PROT_MODE_DSEG+0x321>
 331:	62 69 6f             	bound  %ebp,0x6f(%ecx)
 334:	73 5f                	jae    395 <PROT_MODE_DSEG+0x385>
 336:	73 6d                	jae    3a5 <PROT_MODE_DSEG+0x395>
 338:	61                   	popa   
 339:	70 00                	jo     33b <PROT_MODE_DSEG+0x32b>
 33b:	6d                   	insl   (%dx),%es:(%edi)
 33c:	65 6d                	gs insl (%dx),%es:(%edi)
 33e:	5f                   	pop    %edi
 33f:	6c                   	insb   (%dx),%es:(%edi)
 340:	6f                   	outsl  %ds:(%esi),(%dx)
 341:	77 65                	ja     3a8 <PROT_MODE_DSEG+0x398>
 343:	72 00                	jb     345 <PROT_MODE_DSEG+0x335>
 345:	62 6f 6f             	bound  %ebp,0x6f(%edi)
 348:	74 61                	je     3ab <PROT_MODE_DSEG+0x39b>
 34a:	62 6c 65 00          	bound  %ebp,0x0(%ebp,%eiz,2)
 34e:	73 79                	jae    3c9 <PROT_MODE_DSEG+0x3b9>
 350:	6d                   	insl   (%dx),%es:(%edi)
 351:	73 00                	jae    353 <PROT_MODE_DSEG+0x343>
 353:	75 69                	jne    3be <PROT_MODE_DSEG+0x3ae>
 355:	6e                   	outsb  %ds:(%esi),(%dx)
 356:	74 31                	je     389 <PROT_MODE_DSEG+0x379>
 358:	36 5f                	ss pop %edi
 35a:	74 00                	je     35c <PROT_MODE_DSEG+0x34c>
 35c:	6d                   	insl   (%dx),%es:(%edi)
 35d:	6d                   	insl   (%dx),%es:(%edi)
 35e:	61                   	popa   
 35f:	70 5f                	jo     3c0 <PROT_MODE_DSEG+0x3b0>
 361:	6c                   	insb   (%dx),%es:(%edi)
 362:	65 6e                	outsb  %gs:(%esi),(%dx)
 364:	67 74 68             	addr16 je 3cf <PROT_MODE_DSEG+0x3bf>
 367:	00 6d 62             	add    %ch,0x62(%ebp)
 36a:	6f                   	outsl  %ds:(%esi),(%dx)
 36b:	6f                   	outsl  %ds:(%esi),(%dx)
 36c:	74 5f                	je     3cd <PROT_MODE_DSEG+0x3bd>
 36e:	69 6e 66 6f 00 70 5f 	imul   $0x5f70006f,0x66(%esi),%ebp
 375:	76 61                	jbe    3d8 <PROT_MODE_DSEG+0x3c8>
 377:	00 76 62             	add    %dh,0x62(%esi)
 37a:	65 5f                	gs pop %edi
 37c:	63 6f 6e             	arpl   %bp,0x6e(%edi)
 37f:	74 72                	je     3f3 <PROT_MODE_DSEG+0x3e3>
 381:	6f                   	outsl  %ds:(%esi),(%dx)
 382:	6c                   	insb   (%dx),%es:(%edi)
 383:	5f                   	pop    %edi
 384:	69 6e 66 6f 00 70 5f 	imul   $0x5f70006f,0x66(%esi),%ebp
 38b:	66 6c                	data16 insb (%dx),%es:(%edi)
 38d:	61                   	popa   
 38e:	67 73 00             	addr16 jae 391 <PROT_MODE_DSEG+0x381>
 391:	70 61                	jo     3f4 <PROT_MODE_DSEG+0x3e4>
 393:	72 73                	jb     408 <PROT_MODE_DSEG+0x3f8>
 395:	65 5f                	gs pop %edi
 397:	65 38 32             	cmp    %dh,%gs:(%edx)
 39a:	30 00                	xor    %al,(%eax)
 39c:	65 5f                	gs pop %edi
 39e:	65 6c                	gs insb (%dx),%es:(%edi)
 3a0:	66 00 62 6f          	data16 add %ah,0x6f(%edx)
 3a4:	6f                   	outsl  %ds:(%esi),(%dx)
 3a5:	74 5f                	je     406 <PROT_MODE_DSEG+0x3f6>
 3a7:	64 65 76 69          	fs gs jbe 414 <PROT_MODE_DSEG+0x404>
 3ab:	63 65 00             	arpl   %sp,0x0(%ebp)
 3ae:	61                   	popa   
 3af:	6f                   	outsl  %ds:(%esi),(%dx)
 3b0:	75 74                	jne    426 <PROT_MODE_DSEG+0x416>
 3b2:	00 64 6b 65          	add    %ah,0x65(%ebx,%ebp,2)
 3b6:	72 6e                	jb     426 <PROT_MODE_DSEG+0x416>
 3b8:	65 6c                	gs insb (%dx),%es:(%edi)
 3ba:	00 65 5f             	add    %ah,0x5f(%ebp)
 3bd:	70 68                	jo     427 <PROT_MODE_DSEG+0x417>
 3bf:	6f                   	outsl  %ds:(%esi),(%dx)
 3c0:	66 66 00 63 6f       	data16 data16 add %ah,0x6f(%ebx)
 3c5:	6e                   	outsb  %ds:(%esi),(%dx)
 3c6:	66 69 67 5f 74 61    	imul   $0x6174,0x5f(%edi),%sp
 3cc:	62 6c 65 00          	bound  %ebp,0x0(%ebp,%eiz,2)
 3d0:	65 5f                	gs pop %edi
 3d2:	6d                   	insl   (%dx),%es:(%edi)
 3d3:	61                   	popa   
 3d4:	67 69 63 00 6c 61 73 	imul   $0x7473616c,0x0(%bp,%di),%esp
 3db:	74 
 3dc:	5f                   	pop    %edi
 3dd:	63 68 73             	arpl   %bp,0x73(%eax)
 3e0:	00 62 61             	add    %ah,0x61(%edx)
 3e3:	73 65                	jae    44a <PROT_MODE_DSEG+0x43a>
 3e5:	5f                   	pop    %edi
 3e6:	61                   	popa   
 3e7:	64 64 72 00          	fs fs jb 3eb <PROT_MODE_DSEG+0x3db>
 3eb:	76 62                	jbe    44f <PROT_MODE_DSEG+0x43f>
 3ed:	65 5f                	gs pop %edi
 3ef:	6d                   	insl   (%dx),%es:(%edi)
 3f0:	6f                   	outsl  %ds:(%esi),(%dx)
 3f1:	64 65 00 65 5f       	fs add %ah,%gs:0x5f(%ebp)
 3f6:	73 68                	jae    460 <PROT_MODE_DSEG+0x450>
 3f8:	6f                   	outsl  %ds:(%esi),(%dx)
 3f9:	66 66 00 6d 65       	data16 data16 add %ch,0x65(%ebp)
 3fe:	6d                   	insl   (%dx),%es:(%edi)
 3ff:	5f                   	pop    %edi
 400:	75 70                	jne    472 <PROT_MODE_DSEG+0x462>
 402:	70 65                	jo     469 <PROT_MODE_DSEG+0x459>
 404:	72 00                	jb     406 <PROT_MODE_DSEG+0x3f6>
 406:	76 62                	jbe    46a <PROT_MODE_DSEG+0x45a>
 408:	65 5f                	gs pop %edi
 40a:	6d                   	insl   (%dx),%es:(%edi)
 40b:	6f                   	outsl  %ds:(%esi),(%dx)
 40c:	64 65 5f             	fs gs pop %edi
 40f:	69 6e 66 6f 00 74 61 	imul   $0x6174006f,0x66(%esi),%ebp
 416:	62 73 69             	bound  %esi,0x69(%ebx)
 419:	7a 65                	jp     480 <PROT_MODE_DSEG+0x470>
 41b:	00 66 69             	add    %ah,0x69(%esi)
 41e:	72 73                	jb     493 <PROT_MODE_DSEG+0x483>
 420:	74 5f                	je     481 <PROT_MODE_DSEG+0x471>
 422:	6c                   	insb   (%dx),%es:(%edi)
 423:	62 61 00             	bound  %esp,0x0(%ecx)
 426:	64 72 69             	fs jb  492 <PROT_MODE_DSEG+0x482>
 429:	76 65                	jbe    490 <PROT_MODE_DSEG+0x480>
 42b:	73 5f                	jae    48c <PROT_MODE_DSEG+0x47c>
 42d:	6c                   	insb   (%dx),%es:(%edi)
 42e:	65 6e                	outsb  %gs:(%esi),(%dx)
 430:	67 74 68             	addr16 je 49b <PROT_MODE_DSEG+0x48b>
 433:	00 70 5f             	add    %dh,0x5f(%eax)
 436:	66 69 6c 65 73 7a 00 	imul   $0x7a,0x73(%ebp,%eiz,2),%bp
 43d:	65 5f                	gs pop %edi
 43f:	70 68                	jo     4a9 <PROT_MODE_DSEG+0x499>
 441:	6e                   	outsb  %ds:(%esi),(%dx)
 442:	75 6d                	jne    4b1 <PROT_MODE_DSEG+0x4a1>
 444:	00 73 69             	add    %dh,0x69(%ebx)
 447:	67 6e                	outsb  %ds:(%si),(%dx)
 449:	61                   	popa   
 44a:	74 75                	je     4c1 <PROT_MODE_DSEG+0x4b1>
 44c:	72 65                	jb     4b3 <PROT_MODE_DSEG+0x4a3>
 44e:	00 65 5f             	add    %ah,0x5f(%ebp)
 451:	73 68                	jae    4bb <PROT_MODE_DSEG+0x4ab>
 453:	6e                   	outsb  %ds:(%esi),(%dx)
 454:	75 6d                	jne    4c3 <PROT_MODE_DSEG+0x4b3>
 456:	00 76 62             	add    %dh,0x62(%esi)
 459:	65 5f                	gs pop %edi
 45b:	69 6e 74 65 72 66 61 	imul   $0x61667265,0x74(%esi),%ebp
 462:	63 65 5f             	arpl   %sp,0x5f(%ebp)
 465:	6c                   	insb   (%dx),%es:(%edi)
 466:	65 6e                	outsb  %gs:(%esi),(%dx)
 468:	00 62 6f             	add    %ah,0x6f(%edx)
 46b:	6f                   	outsl  %ds:(%esi),(%dx)
 46c:	74 2f                	je     49d <PROT_MODE_DSEG+0x48d>
 46e:	62 6f 6f             	bound  %ebp,0x6f(%edi)
 471:	74 31                	je     4a4 <PROT_MODE_DSEG+0x494>
 473:	2f                   	das    
 474:	62 6f 6f             	bound  %ebp,0x6f(%edi)
 477:	74 31                	je     4aa <PROT_MODE_DSEG+0x49a>
 479:	6d                   	insl   (%dx),%es:(%edi)
 47a:	61                   	popa   
 47b:	69 6e 2e 63 00 6d 6f 	imul   $0x6f6d0063,0x2e(%esi),%ebp
 482:	64 73 5f             	fs jae 4e4 <PROT_MODE_DSEG+0x4d4>
 485:	63 6f 75             	arpl   %bp,0x75(%edi)
 488:	6e                   	outsb  %ds:(%esi),(%dx)
 489:	74 00                	je     48b <PROT_MODE_DSEG+0x47b>
 48b:	5f                   	pop    %edi
 48c:	72 65                	jb     4f3 <PROT_MODE_DSEG+0x4e3>
 48e:	73 65                	jae    4f5 <PROT_MODE_DSEG+0x4e5>
 490:	72 76                	jb     508 <PROT_MODE_DSEG+0x4f8>
 492:	65 64 00 62 6f       	gs add %ah,%fs:0x6f(%edx)
 497:	6f                   	outsl  %ds:(%esi),(%dx)
 498:	74 5f                	je     4f9 <PROT_MODE_DSEG+0x4e9>
 49a:	6c                   	insb   (%dx),%es:(%edi)
 49b:	6f                   	outsl  %ds:(%esi),(%dx)
 49c:	61                   	popa   
 49d:	64 65 72 5f          	fs gs jb 500 <PROT_MODE_DSEG+0x4f0>
 4a1:	6e                   	outsb  %ds:(%esi),(%dx)
 4a2:	61                   	popa   
 4a3:	6d                   	insl   (%dx),%es:(%edi)
 4a4:	65 00 76 62          	add    %dh,%gs:0x62(%esi)
 4a8:	65 5f                	gs pop %edi
 4aa:	69 6e 74 65 72 66 61 	imul   $0x61667265,0x74(%esi),%ebp
 4b1:	63 65 5f             	arpl   %sp,0x5f(%ebp)
 4b4:	73 65                	jae    51b <PROT_MODE_DSEG+0x50b>
 4b6:	67 00 6d 6d          	add    %ch,0x6d(%di)
 4ba:	61                   	popa   
 4bb:	70 5f                	jo     51c <PROT_MODE_DSEG+0x50c>
 4bd:	6c                   	insb   (%dx),%es:(%edi)
 4be:	65 6e                	outsb  %gs:(%esi),(%dx)
 4c0:	00 70 5f             	add    %dh,0x5f(%eax)
 4c3:	61                   	popa   
 4c4:	6c                   	insb   (%dx),%es:(%edi)
 4c5:	69 67 6e 00 61 70 6d 	imul   $0x6d706100,0x6e(%edi),%esp
 4cc:	5f                   	pop    %edi
 4cd:	74 61                	je     530 <PROT_MODE_DSEG+0x520>
 4cf:	62 6c 65 00          	bound  %ebp,0x0(%ebp,%eiz,2)
 4d3:	70 5f                	jo     534 <PROT_MODE_DSEG+0x524>
 4d5:	70 61                	jo     538 <PROT_MODE_DSEG+0x528>
 4d7:	00 73 65             	add    %dh,0x65(%ebx)
 4da:	63 74 6f 72          	arpl   %si,0x72(%edi,%ebp,2)
 4de:	73 5f                	jae    53f <PROT_MODE_DSEG+0x52f>
 4e0:	63 6f 75             	arpl   %bp,0x75(%edi)
 4e3:	6e                   	outsb  %ds:(%esi),(%dx)
 4e4:	74 00                	je     4e6 <PROT_MODE_DSEG+0x4d6>

Disassembly of section .debug_loc:

00000000 <.debug_loc>:
   0:	5c                   	pop    %esp
   1:	02 00                	add    (%eax),%al
   3:	00 65 02             	add    %ah,0x2(%ebp)
   6:	00 00                	add    %al,(%eax)
   8:	02 00                	add    (%eax),%al
   a:	91                   	xchg   %eax,%ecx
   b:	00 65 02             	add    %ah,0x2(%ebp)
   e:	00 00                	add    %al,(%eax)
  10:	76 02                	jbe    14 <PROT_MODE_DSEG+0x4>
  12:	00 00                	add    %al,(%eax)
  14:	0a 00                	or     (%eax),%al
  16:	91                   	xchg   %eax,%ecx
  17:	00 06                	add    %al,(%esi)
  19:	0c ff                	or     $0xff,%al
  1b:	ff                   	(bad)  
  1c:	ff 00                	incl   (%eax)
  1e:	1a 9f 76 02 00 00    	sbb    0x276(%edi),%bl
  24:	7c 02                	jl     28 <PROT_MODE_DSEG+0x18>
  26:	00 00                	add    %al,(%eax)
  28:	01 00                	add    %eax,(%eax)
  2a:	56                   	push   %esi
  2b:	7c 02                	jl     2f <PROT_MODE_DSEG+0x1f>
  2d:	00 00                	add    %al,(%eax)
  2f:	8c 02                	mov    %es,(%edx)
  31:	00 00                	add    %al,(%eax)
  33:	01 00                	add    %eax,(%eax)
  35:	53                   	push   %ebx
  36:	8c 02                	mov    %es,(%edx)
  38:	00 00                	add    %al,(%eax)
  3a:	90                   	nop
  3b:	02 00                	add    (%eax),%al
  3d:	00 02                	add    %al,(%edx)
  3f:	00 74 00 90          	add    %dh,-0x70(%eax,%eax,1)
  43:	02 00                	add    (%eax),%al
  45:	00 91 02 00 00 04    	add    %dl,0x4000002(%ecx)
  4b:	00 73 80             	add    %dh,-0x80(%ebx)
  4e:	7c 9f                	jl     ffffffef <SMAP_SIG+0xacb2be9f>
  50:	91                   	xchg   %eax,%ecx
  51:	02 00                	add    (%eax),%al
  53:	00 99 02 00 00 01    	add    %bl,0x1000002(%ecx)
  59:	00 53 00             	add    %dl,0x0(%ebx)
  5c:	00 00                	add    %al,(%eax)
  5e:	00 00                	add    %al,(%eax)
  60:	00 00                	add    %al,(%eax)
  62:	00 5c 02 00          	add    %bl,0x0(%edx,%eax,1)
  66:	00 7f 02             	add    %bh,0x2(%edi)
  69:	00 00                	add    %al,(%eax)
  6b:	02 00                	add    (%eax),%al
  6d:	91                   	xchg   %eax,%ecx
  6e:	08 7f 02             	or     %bh,0x2(%edi)
  71:	00 00                	add    %al,(%eax)
  73:	86 02                	xchg   %al,(%edx)
  75:	00 00                	add    %al,(%eax)
  77:	01 00                	add    %eax,(%eax)
  79:	57                   	push   %edi
  7a:	86 02                	xchg   %al,(%edx)
  7c:	00 00                	add    %al,(%eax)
  7e:	90                   	nop
  7f:	02 00                	add    (%eax),%al
  81:	00 02                	add    %al,(%edx)
  83:	00 74 04 90          	add    %dh,-0x70(%esp,%eax,1)
  87:	02 00                	add    (%eax),%al
  89:	00 91 02 00 00 03    	add    %dl,0x3000002(%ecx)
  8f:	00 77 7f             	add    %dh,0x7f(%edi)
  92:	9f                   	lahf   
  93:	91                   	xchg   %eax,%ecx
  94:	02 00                	add    (%eax),%al
  96:	00 9b 02 00 00 01    	add    %bl,0x1000002(%ebx)
  9c:	00 57 00             	add    %dl,0x0(%edi)
  9f:	00 00                	add    %al,(%eax)
  a1:	00 00                	add    %al,(%eax)
  a3:	00 00                	add    %al,(%eax)
  a5:	00 7c 02 00          	add    %bh,0x0(%edx,%eax,1)
  a9:	00 9a 02 00 00 01    	add    %bl,0x1000002(%edx)
  af:	00 56 9a             	add    %dl,-0x66(%esi)
  b2:	02 00                	add    (%eax),%al
  b4:	00 9d 02 00 00 0e    	add    %bl,0xe000002(%ebp)
  ba:	00 91 00 06 0c ff    	add    %dl,-0xf3fa00(%ecx)
  c0:	ff                   	(bad)  
  c1:	ff 00                	incl   (%eax)
  c3:	1a 91 04 06 22 9f    	sbb    -0x60ddf9fc(%ecx),%dl
  c9:	00 00                	add    %al,(%eax)
  cb:	00 00                	add    %al,(%eax)
  cd:	00 00                	add    %al,(%eax)
  cf:	00 00                	add    %al,(%eax)
  d1:	fd                   	std    
  d2:	01 00                	add    %eax,(%eax)
  d4:	00 fe                	add    %bh,%dh
  d6:	01 00                	add    %eax,(%eax)
  d8:	00 04 00             	add    %al,(%eax,%eax,1)
  db:	0a f7                	or     %bh,%dh
  dd:	01 9f 00 00 00 00    	add    %ebx,0x0(%edi)
  e3:	00 00                	add    %al,(%eax)
  e5:	00 00                	add    %al,(%eax)
  e7:	05 02 00 00 0d       	add    $0xd000002,%eax
  ec:	02 00                	add    (%eax),%al
  ee:	00 02                	add    %al,(%edx)
  f0:	00 31                	add    %dh,(%ecx)
  f2:	9f                   	lahf   
  f3:	00 00                	add    %al,(%eax)
  f5:	00 00                	add    %al,(%eax)
  f7:	00 00                	add    %al,(%eax)
  f9:	00 00                	add    %al,(%eax)
  fb:	05 02 00 00 0d       	add    $0xd000002,%eax
 100:	02 00                	add    (%eax),%al
 102:	00 04 00             	add    %al,(%eax,%eax,1)
 105:	0a f2                	or     %dl,%dh
 107:	01 9f 00 00 00 00    	add    %ebx,0x0(%edi)
 10d:	00 00                	add    %al,(%eax)
 10f:	00 00                	add    %al,(%eax)
 111:	0d 02 00 00 15       	or     $0x15000002,%eax
 116:	02 00                	add    (%eax),%al
 118:	00 01                	add    %al,(%ecx)
 11a:	00 51 00             	add    %dl,0x0(%ecx)
 11d:	00 00                	add    %al,(%eax)
 11f:	00 00                	add    %al,(%eax)
 121:	00 00                	add    %al,(%eax)
 123:	00 0d 02 00 00 15    	add    %cl,0x15000002
 129:	02 00                	add    (%eax),%al
 12b:	00 04 00             	add    %al,(%eax,%eax,1)
 12e:	0a f3                	or     %bl,%dh
 130:	01 9f 00 00 00 00    	add    %ebx,0x0(%edi)
 136:	00 00                	add    %al,(%eax)
 138:	00 00                	add    %al,(%eax)
 13a:	15 02 00 00 20       	adc    $0x20000002,%eax
 13f:	02 00                	add    (%eax),%al
 141:	00 02                	add    %al,(%edx)
 143:	00 91 05 00 00 00    	add    %dl,0x5(%ecx)
 149:	00 00                	add    %al,(%eax)
 14b:	00 00                	add    %al,(%eax)
 14d:	00 15 02 00 00 20    	add    %dl,0x20000002
 153:	02 00                	add    (%eax),%al
 155:	00 04 00             	add    %al,(%eax,%eax,1)
 158:	0a f4                	or     %ah,%dh
 15a:	01 9f 00 00 00 00    	add    %ebx,0x0(%edi)
 160:	00 00                	add    %al,(%eax)
 162:	00 00                	add    %al,(%eax)
 164:	20 02                	and    %al,(%edx)
 166:	00 00                	add    %al,(%eax)
 168:	2b 02                	sub    (%edx),%eax
 16a:	00 00                	add    %al,(%eax)
 16c:	02 00                	add    (%eax),%al
 16e:	91                   	xchg   %eax,%ecx
 16f:	06                   	push   %es
 170:	00 00                	add    %al,(%eax)
 172:	00 00                	add    %al,(%eax)
 174:	00 00                	add    %al,(%eax)
 176:	00 00                	add    %al,(%eax)
 178:	20 02                	and    %al,(%edx)
 17a:	00 00                	add    %al,(%eax)
 17c:	2b 02                	sub    (%edx),%eax
 17e:	00 00                	add    %al,(%eax)
 180:	04 00                	add    $0x0,%al
 182:	0a f5                	or     %ch,%dh
 184:	01 9f 00 00 00 00    	add    %ebx,0x0(%edi)
 18a:	00 00                	add    %al,(%eax)
 18c:	00 00                	add    %al,(%eax)
 18e:	2b 02                	sub    (%edx),%eax
 190:	00 00                	add    %al,(%eax)
 192:	39 02                	cmp    %eax,(%edx)
 194:	00 00                	add    %al,(%eax)
 196:	08 00                	or     %al,(%eax)
 198:	91                   	xchg   %eax,%ecx
 199:	07                   	pop    %es
 19a:	94                   	xchg   %eax,%esp
 19b:	01 09                	add    %ecx,(%ecx)
 19d:	e0 21                	loopne 1c0 <PROT_MODE_DSEG+0x1b0>
 19f:	9f                   	lahf   
 1a0:	00 00                	add    %al,(%eax)
 1a2:	00 00                	add    %al,(%eax)
 1a4:	00 00                	add    %al,(%eax)
 1a6:	00 00                	add    %al,(%eax)
 1a8:	2b 02                	sub    (%edx),%eax
 1aa:	00 00                	add    %al,(%eax)
 1ac:	39 02                	cmp    %eax,(%edx)
 1ae:	00 00                	add    %al,(%eax)
 1b0:	04 00                	add    $0x0,%al
 1b2:	0a f6                	or     %dh,%dh
 1b4:	01 9f 00 00 00 00    	add    %ebx,0x0(%edi)
 1ba:	00 00                	add    %al,(%eax)
 1bc:	00 00                	add    %al,(%eax)
 1be:	39 02                	cmp    %eax,(%edx)
 1c0:	00 00                	add    %al,(%eax)
 1c2:	41                   	inc    %ecx
 1c3:	02 00                	add    (%eax),%al
 1c5:	00 03                	add    %al,(%ebx)
 1c7:	00 08                	add    %cl,(%eax)
 1c9:	20 9f 00 00 00 00    	and    %bl,0x0(%edi)
 1cf:	00 00                	add    %al,(%eax)
 1d1:	00 00                	add    %al,(%eax)
 1d3:	39 02                	cmp    %eax,(%edx)
 1d5:	00 00                	add    %al,(%eax)
 1d7:	41                   	inc    %ecx
 1d8:	02 00                	add    (%eax),%al
 1da:	00 04 00             	add    %al,(%eax,%eax,1)
 1dd:	0a f7                	or     %bh,%dh
 1df:	01 9f 00 00 00 00    	add    %ebx,0x0(%edi)
 1e5:	00 00                	add    %al,(%eax)
 1e7:	00 00                	add    %al,(%eax)
 1e9:	41                   	inc    %ecx
 1ea:	02 00                	add    (%eax),%al
 1ec:	00 42 02             	add    %al,0x2(%edx)
 1ef:	00 00                	add    %al,(%eax)
 1f1:	04 00                	add    $0x0,%al
 1f3:	0a f7                	or     %bh,%dh
 1f5:	01 9f 00 00 00 00    	add    %ebx,0x0(%edi)
 1fb:	00 00                	add    %al,(%eax)
 1fd:	00 00                	add    %al,(%eax)
 1ff:	49                   	dec    %ecx
 200:	02 00                	add    (%eax),%al
 202:	00 59 02             	add    %bl,0x2(%ecx)
 205:	00 00                	add    %al,(%eax)
 207:	03 00                	add    (%eax),%eax
 209:	08 80 9f 00 00 00    	or     %al,0x9f(%eax)
 20f:	00 00                	add    %al,(%eax)
 211:	00 00                	add    %al,(%eax)
 213:	00 49 02             	add    %cl,0x2(%ecx)
 216:	00 00                	add    %al,(%eax)
 218:	59                   	pop    %ecx
 219:	02 00                	add    (%eax),%al
 21b:	00 02                	add    %al,(%edx)
 21d:	00 91 00 00 00 00    	add    %dl,0x0(%ecx)
 223:	00 00                	add    %al,(%eax)
 225:	00 00                	add    %al,(%eax)
 227:	00 49 02             	add    %cl,0x2(%ecx)
 22a:	00 00                	add    %al,(%eax)
 22c:	59                   	pop    %ecx
 22d:	02 00                	add    (%eax),%al
 22f:	00 04 00             	add    %al,(%eax,%eax,1)
 232:	0a f0                	or     %al,%dh
 234:	01 9f 00 00 00 00    	add    %ebx,0x0(%edi)
 23a:	00 00                	add    %al,(%eax)
 23c:	00 00                	add    %al,(%eax)
 23e:	19 01                	sbb    %eax,(%ecx)
 240:	00 00                	add    %al,(%eax)
 242:	43                   	inc    %ebx
 243:	01 00                	add    %eax,(%eax)
 245:	00 02                	add    %al,(%edx)
 247:	00 91 00 43 01 00    	add    %dl,0x14300(%ecx)
 24d:	00 70 01             	add    %dh,0x1(%eax)
 250:	00 00                	add    %al,(%eax)
 252:	01 00                	add    %eax,(%eax)
 254:	50                   	push   %eax
 255:	00 00                	add    %al,(%eax)
 257:	00 00                	add    %al,(%eax)
 259:	00 00                	add    %al,(%eax)
 25b:	00 00                	add    %al,(%eax)
 25d:	43                   	inc    %ebx
 25e:	01 00                	add    %eax,(%eax)
 260:	00 47 01             	add    %al,0x1(%edi)
 263:	00 00                	add    %al,(%eax)
 265:	01 00                	add    %eax,(%eax)
 267:	56                   	push   %esi
 268:	47                   	inc    %edi
 269:	01 00                	add    %eax,(%eax)
 26b:	00 5b 01             	add    %bl,0x1(%ebx)
 26e:	00 00                	add    %al,(%eax)
 270:	01 00                	add    %eax,(%eax)
 272:	51                   	push   %ecx
 273:	5b                   	pop    %ebx
 274:	01 00                	add    %eax,(%eax)
 276:	00 64 01 00          	add    %ah,0x0(%ecx,%eax,1)
 27a:	00 01                	add    %al,(%ecx)
 27c:	00 52 64             	add    %dl,0x64(%edx)
 27f:	01 00                	add    %eax,(%eax)
 281:	00 79 01             	add    %bh,0x1(%ecx)
 284:	00 00                	add    %al,(%eax)
 286:	01 00                	add    %eax,(%eax)
 288:	51                   	push   %ecx
 289:	00 00                	add    %al,(%eax)
 28b:	00 00                	add    %al,(%eax)
 28d:	00 00                	add    %al,(%eax)
 28f:	00 00                	add    %al,(%eax)
 291:	1c 01                	sbb    $0x1,%al
 293:	00 00                	add    %al,(%eax)
 295:	30 01                	xor    %al,(%ecx)
 297:	00 00                	add    %al,(%eax)
 299:	02 00                	add    (%eax),%al
 29b:	91                   	xchg   %eax,%ecx
 29c:	68 00 00 00 00       	push   $0x0
 2a1:	00 00                	add    %al,(%eax)
 2a3:	00 00                	add    %al,(%eax)
 2a5:	ec                   	in     (%dx),%al
 2a6:	00 00                	add    %al,(%eax)
 2a8:	00 fe                	add    %bh,%dh
 2aa:	00 00                	add    %al,(%eax)
 2ac:	00 02                	add    %al,(%edx)
 2ae:	00 30                	add    %dh,(%eax)
 2b0:	9f                   	lahf   
 2b1:	fe 00                	incb   (%eax)
 2b3:	00 00                	add    %al,(%eax)
 2b5:	19 01                	sbb    %eax,(%ecx)
 2b7:	00 00                	add    %al,(%eax)
 2b9:	01 00                	add    %eax,(%eax)
 2bb:	52                   	push   %edx
 2bc:	00 00                	add    %al,(%eax)
 2be:	00 00                	add    %al,(%eax)
 2c0:	00 00                	add    %al,(%eax)
 2c2:	00 00                	add    %al,(%eax)
 2c4:	05 01 00 00 12       	add    $0x12000001,%eax
 2c9:	01 00                	add    %eax,(%eax)
 2cb:	00 01                	add    %al,(%ecx)
 2cd:	00 53 00             	add    %dl,0x0(%ebx)
 2d0:	00 00                	add    %al,(%eax)
 2d2:	00 00                	add    %al,(%eax)
 2d4:	00 00                	add    %al,(%eax)
 2d6:	00 d9                	add    %bl,%cl
 2d8:	00 00                	add    %al,(%eax)
 2da:	00 e1                	add    %ah,%cl
 2dc:	00 00                	add    %al,(%eax)
 2de:	00 02                	add    %al,(%edx)
 2e0:	00 91 00 e1 00 00    	add    %dl,0xe100(%ecx)
 2e6:	00 ec                	add    %ch,%ah
 2e8:	00 00                	add    %al,(%eax)
 2ea:	00 07                	add    %al,(%edi)
 2ec:	00 91 00 06 70 00    	add    %dl,0x700600(%ecx)
 2f2:	22 9f 00 00 00 00    	and    0x0(%edi),%bl
 2f8:	00 00                	add    %al,(%eax)
 2fa:	00 00                	add    %al,(%eax)
 2fc:	d9 00                	flds   (%eax)
 2fe:	00 00                	add    %al,(%eax)
 300:	e1 00                	loope  302 <PROT_MODE_DSEG+0x2f2>
 302:	00 00                	add    %al,(%eax)
 304:	02 00                	add    (%eax),%al
 306:	30 9f e1 00 00 00    	xor    %bl,0xe1(%edi)
 30c:	ec                   	in     (%dx),%al
 30d:	00 00                	add    %al,(%eax)
 30f:	00 01                	add    %al,(%ecx)
 311:	00 50 00             	add    %dl,0x0(%eax)
 314:	00 00                	add    %al,(%eax)
 316:	00 00                	add    %al,(%eax)
 318:	00 00                	add    %al,(%eax)
 31a:	00 c6                	add    %al,%dh
 31c:	01 00                	add    %eax,(%eax)
 31e:	00 e8                	add    %ch,%al
 320:	01 00                	add    %eax,(%eax)
 322:	00 02                	add    %al,(%edx)
 324:	00 91 00 00 00 00    	add    %dl,0x0(%ecx)
 32a:	00 00                	add    %al,(%eax)
 32c:	00 00                	add    %al,(%eax)
 32e:	00 26                	add    %ah,(%esi)
 330:	00 00                	add    %al,(%eax)
 332:	00 39                	add    %bh,(%ecx)
 334:	00 00                	add    %al,(%eax)
 336:	00 02                	add    %al,(%edx)
 338:	00 91 0c 39 00 00    	add    %dl,0x390c(%ecx)
 33e:	00 41 00             	add    %al,0x0(%ecx)
 341:	00 00                	add    %al,(%eax)
 343:	12 00                	adc    (%eax),%al
 345:	91                   	xchg   %eax,%ecx
 346:	0c 06                	or     $0x6,%al
 348:	91                   	xchg   %eax,%ecx
 349:	00 06                	add    %al,(%esi)
 34b:	08 50 1e             	or     %dl,0x1e(%eax)
 34e:	1c 70                	sbb    $0x70,%al
 350:	00 22                	add    %ah,(%edx)
 352:	91                   	xchg   %eax,%ecx
 353:	04 06                	add    $0x6,%al
 355:	1c 9f                	sbb    $0x9f,%al
 357:	41                   	inc    %ecx
 358:	00 00                	add    %al,(%eax)
 35a:	00 4d 00             	add    %cl,0x0(%ebp)
 35d:	00 00                	add    %al,(%eax)
 35f:	14 00                	adc    $0x0,%al
 361:	91                   	xchg   %eax,%ecx
 362:	0c 06                	or     $0x6,%al
 364:	91                   	xchg   %eax,%ecx
 365:	00 06                	add    %al,(%esi)
 367:	08 50 1e             	or     %dl,0x1e(%eax)
 36a:	1c 91                	sbb    $0x91,%al
 36c:	04 06                	add    $0x6,%al
 36e:	1c 70                	sbb    $0x70,%al
 370:	00 22                	add    %ah,(%edx)
 372:	23 01                	and    (%ecx),%eax
 374:	9f                   	lahf   
 375:	4d                   	dec    %ebp
 376:	00 00                	add    %al,(%eax)
 378:	00 55 00             	add    %dl,0x0(%ebp)
 37b:	00 00                	add    %al,(%eax)
 37d:	12 00                	adc    (%eax),%al
 37f:	91                   	xchg   %eax,%ecx
 380:	0c 06                	or     $0x6,%al
 382:	91                   	xchg   %eax,%ecx
 383:	00 06                	add    %al,(%esi)
 385:	08 50 1e             	or     %dl,0x1e(%eax)
 388:	1c 91                	sbb    $0x91,%al
 38a:	04 06                	add    $0x6,%al
 38c:	1c 73                	sbb    $0x73,%al
 38e:	00 22                	add    %ah,(%edx)
 390:	9f                   	lahf   
 391:	55                   	push   %ebp
 392:	00 00                	add    %al,(%eax)
 394:	00 5c 00 00          	add    %bl,0x0(%eax,%eax,1)
 398:	00 12                	add    %dl,(%edx)
 39a:	00 91 0c 06 91 00    	add    %dl,0x91060c(%ecx)
 3a0:	06                   	push   %es
 3a1:	08 50 1e             	or     %dl,0x1e(%eax)
 3a4:	1c 70                	sbb    $0x70,%al
 3a6:	00 22                	add    %ah,(%edx)
 3a8:	91                   	xchg   %eax,%ecx
 3a9:	04 06                	add    $0x6,%al
 3ab:	1c 9f                	sbb    $0x9f,%al
 3ad:	00 00                	add    %al,(%eax)
 3af:	00 00                	add    %al,(%eax)
 3b1:	00 00                	add    %al,(%eax)
 3b3:	00 00                	add    %al,(%eax)
 3b5:	2f                   	das    
 3b6:	00 00                	add    %al,(%eax)
 3b8:	00 35 00 00 00 07    	add    %dh,0x7000000
 3be:	00 70 00             	add    %dh,0x0(%eax)
 3c1:	91                   	xchg   %eax,%ecx
 3c2:	04 06                	add    $0x6,%al
 3c4:	22 9f 35 00 00 00    	and    0x35(%edi),%bl
 3ca:	45                   	inc    %ebp
 3cb:	00 00                	add    %al,(%eax)
 3cd:	00 01                	add    %al,(%ecx)
 3cf:	00 50 45             	add    %dl,0x45(%eax)
 3d2:	00 00                	add    %al,(%eax)
 3d4:	00 55 00             	add    %dl,0x0(%ebp)
 3d7:	00 00                	add    %al,(%eax)
 3d9:	01 00                	add    %eax,(%eax)
 3db:	53                   	push   %ebx
 3dc:	55                   	push   %ebp
 3dd:	00 00                	add    %al,(%eax)
 3df:	00 5c 00 00          	add    %bl,0x0(%eax,%eax,1)
 3e3:	00 01                	add    %al,(%ecx)
 3e5:	00 50 00             	add    %dl,0x0(%eax)
 3e8:	00 00                	add    %al,(%eax)
 3ea:	00 00                	add    %al,(%eax)
 3ec:	00 00                	add    %al,(%eax)
 3ee:	00 a8 00 00 00 b7    	add    %ch,-0x49000000(%eax)
 3f4:	00 00                	add    %al,(%eax)
 3f6:	00 01                	add    %al,(%ecx)
 3f8:	00 57 b7             	add    %dl,-0x49(%edi)
 3fb:	00 00                	add    %al,(%eax)
 3fd:	00 c9                	add    %cl,%cl
 3ff:	00 00                	add    %al,(%eax)
 401:	00 06                	add    %al,(%esi)
 403:	00 77 00             	add    %dh,0x0(%edi)
 406:	76 00                	jbe    408 <PROT_MODE_DSEG+0x3f8>
 408:	22 9f c9 00 00 00    	and    0xc9(%edi),%bl
 40e:	cf                   	iret   
 40f:	00 00                	add    %al,(%eax)
 411:	00 08                	add    %cl,(%eax)
 413:	00 77 00             	add    %dh,0x0(%edi)
 416:	76 00                	jbe    418 <PROT_MODE_DSEG+0x408>
 418:	22 48 1c             	and    0x1c(%eax),%cl
 41b:	9f                   	lahf   
 41c:	d4 00                	aam    $0x0
 41e:	00 00                	add    %al,(%eax)
 420:	fc                   	cld    
 421:	00 00                	add    %al,(%eax)
 423:	00 06                	add    %al,(%esi)
 425:	00 77 00             	add    %dh,0x0(%edi)
 428:	76 00                	jbe    42a <PROT_MODE_DSEG+0x41a>
 42a:	22 9f fc 00 00 00    	and    0xfc(%edi),%bl
 430:	fd                   	std    
 431:	00 00                	add    %al,(%eax)
 433:	00 0a                	add    %cl,(%edx)
 435:	00 77 00             	add    %dh,0x0(%edi)
 438:	03 4c 93 00          	add    0x0(%ebx,%edx,4),%ecx
 43c:	00 06                	add    %al,(%esi)
 43e:	22 9f fd 00 00 00    	and    0xfd(%edi),%bl
 444:	ff 00                	incl   (%eax)
 446:	00 00                	add    %al,(%eax)
 448:	0b 00                	or     (%eax),%eax
 44a:	91                   	xchg   %eax,%ecx
 44b:	00 06                	add    %al,(%esi)
 44d:	03 4c 93 00          	add    0x0(%ebx,%edx,4),%ecx
 451:	00 06                	add    %al,(%esi)
 453:	22 9f 00 00 00 00    	and    0x0(%edi),%bl
 459:	00 00                	add    %al,(%eax)
 45b:	00 00                	add    %al,(%eax)
 45d:	a8 00                	test   $0x0,%al
 45f:	00 00                	add    %al,(%eax)
 461:	b7 00                	mov    $0x0,%bh
 463:	00 00                	add    %al,(%eax)
 465:	02 00                	add    (%eax),%al
 467:	30 9f b7 00 00 00    	xor    %bl,0xb7(%edi)
 46d:	c9                   	leave  
 46e:	00 00                	add    %al,(%eax)
 470:	00 01                	add    %al,(%ecx)
 472:	00 56 c9             	add    %dl,-0x37(%esi)
 475:	00 00                	add    %al,(%eax)
 477:	00 cf                	add    %cl,%bh
 479:	00 00                	add    %al,(%eax)
 47b:	00 03                	add    %al,(%ebx)
 47d:	00 76 68             	add    %dh,0x68(%esi)
 480:	9f                   	lahf   
 481:	cf                   	iret   
 482:	00 00                	add    %al,(%eax)
 484:	00 fc                	add    %bh,%ah
 486:	00 00                	add    %al,(%eax)
 488:	00 01                	add    %al,(%ecx)
 48a:	00 56 fc             	add    %dl,-0x4(%esi)
 48d:	00 00                	add    %al,(%eax)
 48f:	00 ff                	add    %bh,%bh
 491:	00 00                	add    %al,(%eax)
 493:	00 05 00 03 4c 93    	add    %al,0x934c0300
 499:	00 00                	add    %al,(%eax)
 49b:	00 00                	add    %al,(%eax)
 49d:	00 00                	add    %al,(%eax)
 49f:	00 00                	add    %al,(%eax)
 4a1:	00 00                	add    %al,(%eax)
 4a3:	5b                   	pop    %ebx
 4a4:	00 00                	add    %al,(%eax)
 4a6:	00 6d 00             	add    %ch,0x0(%ebp)
 4a9:	00 00                	add    %al,(%eax)
 4ab:	01 00                	add    %eax,(%eax)
 4ad:	57                   	push   %edi
 4ae:	6d                   	insl   (%dx),%es:(%edi)
 4af:	00 00                	add    %al,(%eax)
 4b1:	00 78 00             	add    %bh,0x0(%eax)
 4b4:	00 00                	add    %al,(%eax)
 4b6:	03 00                	add    (%eax),%eax
 4b8:	77 60                	ja     51a <PROT_MODE_DSEG+0x50a>
 4ba:	9f                   	lahf   
 4bb:	78 00                	js     4bd <PROT_MODE_DSEG+0x4ad>
 4bd:	00 00                	add    %al,(%eax)
 4bf:	8d 00                	lea    (%eax),%eax
 4c1:	00 00                	add    %al,(%eax)
 4c3:	01 00                	add    %eax,(%eax)
 4c5:	57                   	push   %edi
 4c6:	00 00                	add    %al,(%eax)
 4c8:	00 00                	add    %al,(%eax)
 4ca:	00 00                	add    %al,(%eax)
 4cc:	00 00                	add    %al,(%eax)
 4ce:	60                   	pusha  
 4cf:	00 00                	add    %al,(%eax)
 4d1:	00 8c 00 00 00 01 00 	add    %cl,0x10000(%eax,%eax,1)
 4d8:	56                   	push   %esi
 4d9:	00 00                	add    %al,(%eax)
 4db:	00 00                	add    %al,(%eax)
 4dd:	00 00                	add    %al,(%eax)
 4df:	00 00                	add    %al,(%eax)
 4e1:	35 01 00 00 38       	xor    $0x38000001,%eax
 4e6:	01 00                	add    %eax,(%eax)
 4e8:	00 02                	add    %al,(%edx)
 4ea:	00 30                	add    %dh,(%eax)
 4ec:	9f                   	lahf   
 4ed:	38 01                	cmp    %al,(%ecx)
 4ef:	00 00                	add    %al,(%eax)
 4f1:	91                   	xchg   %eax,%ecx
 4f2:	01 00                	add    %eax,(%eax)
 4f4:	00 01                	add    %al,(%ecx)
 4f6:	00 56 00             	add    %dl,0x0(%esi)
 4f9:	00 00                	add    %al,(%eax)
 4fb:	00 00                	add    %al,(%eax)
 4fd:	00 00                	add    %al,(%eax)
 4ff:	00 6c 01 00          	add    %ch,0x0(%ecx,%eax,1)
 503:	00 7a 01             	add    %bh,0x1(%edx)
 506:	00 00                	add    %al,(%eax)
 508:	01 00                	add    %eax,(%eax)
 50a:	50                   	push   %eax
 50b:	00 00                	add    %al,(%eax)
 50d:	00 00                	add    %al,(%eax)
 50f:	00 00                	add    %al,(%eax)
 511:	00 00                	add    %al,(%eax)

Disassembly of section .debug_ranges:

00000000 <.debug_ranges>:
   0:	f2 01 00             	repnz add %eax,(%eax)
   3:	00 f7                	add    %dh,%bh
   5:	01 00                	add    %eax,(%eax)
   7:	00 fd                	add    %bh,%ch
   9:	01 00                	add    %eax,(%eax)
   b:	00 05 02 00 00 00    	add    %al,0x2
  11:	00 00                	add    %al,(%eax)
  13:	00 00                	add    %al,(%eax)
  15:	00 00                	add    %al,(%eax)
  17:	00 f2                	add    %dh,%dl
  19:	01 00                	add    %eax,(%eax)
  1b:	00 f7                	add    %dh,%bh
  1d:	01 00                	add    %eax,(%eax)
  1f:	00 fd                	add    %bh,%ch
  21:	01 00                	add    %eax,(%eax)
  23:	00 fe                	add    %bh,%dh
  25:	01 00                	add    %eax,(%eax)
  27:	00 00                	add    %al,(%eax)
  29:	00 00                	add    %al,(%eax)
  2b:	00 00                	add    %al,(%eax)
  2d:	00 00                	add    %al,(%eax)
  2f:	00 17                	add    %dl,(%edi)
  31:	02 00                	add    (%eax),%al
  33:	00 1c 02             	add    %bl,(%edx,%eax,1)
  36:	00 00                	add    %al,(%eax)
  38:	1f                   	pop    %ds
  39:	02 00                	add    (%eax),%al
  3b:	00 20                	add    %ah,(%eax)
  3d:	02 00                	add    (%eax),%al
  3f:	00 00                	add    %al,(%eax)
  41:	00 00                	add    %al,(%eax)
  43:	00 00                	add    %al,(%eax)
  45:	00 00                	add    %al,(%eax)
  47:	00 22                	add    %ah,(%edx)
  49:	02 00                	add    (%eax),%al
  4b:	00 27                	add    %ah,(%edi)
  4d:	02 00                	add    (%eax),%al
  4f:	00 2a                	add    %ch,(%edx)
  51:	02 00                	add    (%eax),%al
  53:	00 2b                	add    %ch,(%ebx)
  55:	02 00                	add    (%eax),%al
  57:	00 00                	add    %al,(%eax)
  59:	00 00                	add    %al,(%eax)
  5b:	00 00                	add    %al,(%eax)
  5d:	00 00                	add    %al,(%eax)
  5f:	00 2d 02 00 00 32    	add    %ch,0x32000002
  65:	02 00                	add    (%eax),%al
  67:	00 38                	add    %bh,(%eax)
  69:	02 00                	add    (%eax),%al
  6b:	00 39                	add    %bh,(%ecx)
  6d:	02 00                	add    (%eax),%al
  6f:	00 00                	add    %al,(%eax)
  71:	00 00                	add    %al,(%eax)
  73:	00 00                	add    %al,(%eax)
  75:	00 00                	add    %al,(%eax)
  77:	00                   	.byte 0x0
