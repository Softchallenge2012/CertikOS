	.text
	.globl	start
start:
  cli
  call putstr
  jmp hang

hang:
  jmp hang              # at: spin


/*
 * print a string (@ %esi) to screen by directly writing to video memory
 */
putstr:
  movb  $0x07, %al      # at: select foreground color.
  movl  $MSG, %esi      # at: %esi = starting address of msg string.
  movl  $0xb8640, %edi  # at: calculating the location of the cursor -> b80000 + (80*2*<line_number>). screen size = 80 x 25
putstr.1:
  movl (%esi), %ebx
  cmpl   $0x00, %ebx    # at: check end of string.
  je    putstr.end
  movsb                 # at: copies a single byte from the source string, at address DS:SI,
                        # to the destination string, at ES:DI, then increments (or decrements, if the Direction flag is set) both SI and DI
  stosb                 # at: similar to MOVSB and MOVSW, except the source byte or word comes from AL or AX instead of the memory address in DS:SI.
  jmp     putstr.1
putstr.end:
  ret

.data
MSG:
  .asciz "Successfully loaded the Kernel ..."  # at: asciz null terminates the string.
