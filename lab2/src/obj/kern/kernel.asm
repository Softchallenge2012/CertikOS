
obj/kern/kernel:     file format elf32-i386


Disassembly of section .text:

00100000 <video_init>:
#include "video.h"
//tmphack
//#include<dev/serial.h>
void
video_init(void)
{
  100000:	55                   	push   %ebp
  100001:	57                   	push   %edi
  100002:	56                   	push   %esi
  100003:	53                   	push   %ebx
  100004:	83 ec 0c             	sub    $0xc,%esp
  100007:	e8 0f 03 00 00       	call   10031b <__x86.get_pc_thunk.bx>
  10000c:	81 c3 f4 9f 00 00    	add    $0x9ff4,%ebx
	uint16_t was;
	unsigned pos;

	/* Get a pointer to the memory-mapped text display buffer. */
	cp = (uint16_t*) CGA_BUF;
	was = *cp;
  100012:	0f b7 15 00 80 0b 00 	movzwl 0xb8000,%edx
	*cp = (uint16_t) 0xA55A;
  100019:	66 c7 05 00 80 0b 00 	movw   $0xa55a,0xb8000
  100020:	5a a5 
	if (*cp != 0xA55A) {
  100022:	0f b7 05 00 80 0b 00 	movzwl 0xb8000,%eax
  100029:	66 3d 5a a5          	cmp    $0xa55a,%ax
  10002d:	0f 84 86 00 00 00    	je     1000b9 <video_init+0xb9>
		cp = (uint16_t*) MONO_BUF;
		addr_6845 = MONO_BASE;
  100033:	c7 c0 8c 14 97 00    	mov    $0x97148c,%eax
  100039:	c7 00 b4 03 00 00    	movl   $0x3b4,(%eax)
		dprintf("addr_6845:%x\n",addr_6845);
  10003f:	83 ec 08             	sub    $0x8,%esp
  100042:	68 b4 03 00 00       	push   $0x3b4
  100047:	8d 83 a0 b2 ff ff    	lea    -0x4d60(%ebx),%eax
  10004d:	50                   	push   %eax
  10004e:	e8 d1 21 00 00       	call   102224 <dprintf>
  100053:	83 c4 10             	add    $0x10,%esp
		cp = (uint16_t*) MONO_BUF;
  100056:	bd 00 00 0b 00       	mov    $0xb0000,%ebp
		addr_6845 = CGA_BASE;
		dprintf("addr_6845:%x\n",addr_6845);
	}
	
	/* Extract cursor location */
	outb(addr_6845, 14);
  10005b:	83 ec 08             	sub    $0x8,%esp
  10005e:	6a 0e                	push   $0xe
  100060:	c7 c7 8c 14 97 00    	mov    $0x97148c,%edi
  100066:	ff 37                	pushl  (%edi)
  100068:	e8 30 2a 00 00       	call   102a9d <outb>
	pos = inb(addr_6845 + 1) << 8;
  10006d:	8b 07                	mov    (%edi),%eax
  10006f:	83 c0 01             	add    $0x1,%eax
  100072:	89 04 24             	mov    %eax,(%esp)
  100075:	e8 0b 2a 00 00       	call   102a85 <inb>
  10007a:	0f b6 f0             	movzbl %al,%esi
  10007d:	c1 e6 08             	shl    $0x8,%esi
	outb(addr_6845, 15);
  100080:	83 c4 08             	add    $0x8,%esp
  100083:	6a 0f                	push   $0xf
  100085:	ff 37                	pushl  (%edi)
  100087:	e8 11 2a 00 00       	call   102a9d <outb>
	pos |= inb(addr_6845 + 1);
  10008c:	8b 07                	mov    (%edi),%eax
  10008e:	83 c0 01             	add    $0x1,%eax
  100091:	89 04 24             	mov    %eax,(%esp)
  100094:	e8 ec 29 00 00       	call   102a85 <inb>
  100099:	0f b6 c0             	movzbl %al,%eax
  10009c:	09 c6                	or     %eax,%esi

	terminal.crt_buf = (uint16_t*) cp;
  10009e:	c7 c2 80 14 97 00    	mov    $0x971480,%edx
  1000a4:	89 2a                	mov    %ebp,(%edx)
	terminal.crt_pos = pos;
  1000a6:	66 89 72 04          	mov    %si,0x4(%edx)
	terminal.active_console = 0;
  1000aa:	c7 42 08 00 00 00 00 	movl   $0x0,0x8(%edx)
//  video_clear_screen();
}
  1000b1:	83 c4 1c             	add    $0x1c,%esp
  1000b4:	5b                   	pop    %ebx
  1000b5:	5e                   	pop    %esi
  1000b6:	5f                   	pop    %edi
  1000b7:	5d                   	pop    %ebp
  1000b8:	c3                   	ret    
		*cp = was;
  1000b9:	66 89 15 00 80 0b 00 	mov    %dx,0xb8000
		addr_6845 = CGA_BASE;
  1000c0:	c7 c0 8c 14 97 00    	mov    $0x97148c,%eax
  1000c6:	c7 00 d4 03 00 00    	movl   $0x3d4,(%eax)
		dprintf("addr_6845:%x\n",addr_6845);
  1000cc:	83 ec 08             	sub    $0x8,%esp
  1000cf:	68 d4 03 00 00       	push   $0x3d4
  1000d4:	8d 83 a0 b2 ff ff    	lea    -0x4d60(%ebx),%eax
  1000da:	50                   	push   %eax
  1000db:	e8 44 21 00 00       	call   102224 <dprintf>
  1000e0:	83 c4 10             	add    $0x10,%esp
	cp = (uint16_t*) CGA_BUF;
  1000e3:	bd 00 80 0b 00       	mov    $0xb8000,%ebp
  1000e8:	e9 6e ff ff ff       	jmp    10005b <video_init+0x5b>

001000ed <video_putc>:

void
video_putc(int c)
{
  1000ed:	57                   	push   %edi
  1000ee:	56                   	push   %esi
  1000ef:	53                   	push   %ebx
  1000f0:	e8 26 02 00 00       	call   10031b <__x86.get_pc_thunk.bx>
  1000f5:	81 c3 0b 9f 00 00    	add    $0x9f0b,%ebx
  1000fb:	8b 44 24 10          	mov    0x10(%esp),%eax

	// if no attribute given, then use black on white
	if (!(c & ~0xFF))
  1000ff:	a9 00 ff ff ff       	test   $0xffffff00,%eax
  100104:	75 03                	jne    100109 <video_putc+0x1c>
		c |= 0x0700;
  100106:	80 cc 07             	or     $0x7,%ah

	switch (c & 0xff) {
  100109:	0f b6 d0             	movzbl %al,%edx
  10010c:	83 fa 09             	cmp    $0x9,%edx
  10010f:	0f 84 f4 00 00 00    	je     100209 <video_putc+0x11c>
  100115:	83 fa 09             	cmp    $0x9,%edx
  100118:	0f 8e 9c 00 00 00    	jle    1001ba <video_putc+0xcd>
  10011e:	83 fa 0a             	cmp    $0xa,%edx
  100121:	0f 84 cc 00 00 00    	je     1001f3 <video_putc+0x106>
  100127:	83 fa 0d             	cmp    $0xd,%edx
  10012a:	0f 85 1b 01 00 00    	jne    10024b <video_putc+0x15e>
		break;
	case '\n':
		terminal.crt_pos += CRT_COLS;
		/* fallthru */
	case '\r':
		terminal.crt_pos -= (terminal.crt_pos % CRT_COLS);
  100130:	c7 c2 80 14 97 00    	mov    $0x971480,%edx
  100136:	0f b7 42 04          	movzwl 0x4(%edx),%eax
  10013a:	69 c0 cd cc 00 00    	imul   $0xcccd,%eax,%eax
  100140:	c1 e8 10             	shr    $0x10,%eax
  100143:	66 c1 e8 06          	shr    $0x6,%ax
  100147:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
  10014e:	01 c8                	add    %ecx,%eax
  100150:	c1 e0 04             	shl    $0x4,%eax
  100153:	66 89 42 04          	mov    %ax,0x4(%edx)
	default:
		terminal.crt_buf[terminal.crt_pos++] = c;		/* write the character */
		break;
	}

	if (terminal.crt_pos >= CRT_SIZE) {
  100157:	c7 c0 80 14 97 00    	mov    $0x971480,%eax
  10015d:	66 81 78 04 cf 07    	cmpw   $0x7cf,0x4(%eax)
  100163:	0f 87 01 01 00 00    	ja     10026a <video_putc+0x17d>
		terminal.crt_pos -= CRT_COLS;
	}


	/* move that little blinky thing */
	outb(addr_6845, 14);
  100169:	83 ec 08             	sub    $0x8,%esp
  10016c:	6a 0e                	push   $0xe
  10016e:	c7 c6 8c 14 97 00    	mov    $0x97148c,%esi
  100174:	ff 36                	pushl  (%esi)
  100176:	e8 22 29 00 00       	call   102a9d <outb>
	outb(addr_6845 + 1, terminal.crt_pos >> 8);
  10017b:	c7 c7 80 14 97 00    	mov    $0x971480,%edi
  100181:	8b 06                	mov    (%esi),%eax
  100183:	83 c0 01             	add    $0x1,%eax
  100186:	83 c4 08             	add    $0x8,%esp
  100189:	0f b6 57 05          	movzbl 0x5(%edi),%edx
  10018d:	52                   	push   %edx
  10018e:	50                   	push   %eax
  10018f:	e8 09 29 00 00       	call   102a9d <outb>
	outb(addr_6845, 15);
  100194:	83 c4 08             	add    $0x8,%esp
  100197:	6a 0f                	push   $0xf
  100199:	ff 36                	pushl  (%esi)
  10019b:	e8 fd 28 00 00       	call   102a9d <outb>
	outb(addr_6845 + 1, terminal.crt_pos);
  1001a0:	8b 06                	mov    (%esi),%eax
  1001a2:	83 c0 01             	add    $0x1,%eax
  1001a5:	83 c4 08             	add    $0x8,%esp
  1001a8:	0f b6 57 04          	movzbl 0x4(%edi),%edx
  1001ac:	52                   	push   %edx
  1001ad:	50                   	push   %eax
  1001ae:	e8 ea 28 00 00       	call   102a9d <outb>
       	  }
       outb(COM1+COM_TX, c);
       tmpcount++;
	  }
	*/
}
  1001b3:	83 c4 10             	add    $0x10,%esp
  1001b6:	5b                   	pop    %ebx
  1001b7:	5e                   	pop    %esi
  1001b8:	5f                   	pop    %edi
  1001b9:	c3                   	ret    
	switch (c & 0xff) {
  1001ba:	83 fa 08             	cmp    $0x8,%edx
  1001bd:	0f 85 88 00 00 00    	jne    10024b <video_putc+0x15e>
		if (terminal.crt_pos > 0) {
  1001c3:	c7 c2 80 14 97 00    	mov    $0x971480,%edx
  1001c9:	0f b7 52 04          	movzwl 0x4(%edx),%edx
  1001cd:	66 85 d2             	test   %dx,%dx
  1001d0:	74 85                	je     100157 <video_putc+0x6a>
			terminal.crt_pos--;
  1001d2:	83 ea 01             	sub    $0x1,%edx
  1001d5:	c7 c1 80 14 97 00    	mov    $0x971480,%ecx
  1001db:	66 89 51 04          	mov    %dx,0x4(%ecx)
			terminal.crt_buf[terminal.crt_pos] = (c & ~0xff) | ' ';
  1001df:	0f b7 d2             	movzwl %dx,%edx
  1001e2:	01 d2                	add    %edx,%edx
  1001e4:	03 11                	add    (%ecx),%edx
  1001e6:	b0 00                	mov    $0x0,%al
  1001e8:	83 c8 20             	or     $0x20,%eax
  1001eb:	66 89 02             	mov    %ax,(%edx)
  1001ee:	e9 64 ff ff ff       	jmp    100157 <video_putc+0x6a>
		terminal.crt_pos += CRT_COLS;
  1001f3:	c7 c2 80 14 97 00    	mov    $0x971480,%edx
  1001f9:	0f b7 42 04          	movzwl 0x4(%edx),%eax
  1001fd:	83 c0 50             	add    $0x50,%eax
  100200:	66 89 42 04          	mov    %ax,0x4(%edx)
  100204:	e9 27 ff ff ff       	jmp    100130 <video_putc+0x43>
		video_putc(' ');
  100209:	83 ec 0c             	sub    $0xc,%esp
  10020c:	6a 20                	push   $0x20
  10020e:	e8 da fe ff ff       	call   1000ed <video_putc>
		video_putc(' ');
  100213:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  10021a:	e8 ce fe ff ff       	call   1000ed <video_putc>
		video_putc(' ');
  10021f:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  100226:	e8 c2 fe ff ff       	call   1000ed <video_putc>
		video_putc(' ');
  10022b:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  100232:	e8 b6 fe ff ff       	call   1000ed <video_putc>
		video_putc(' ');
  100237:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  10023e:	e8 aa fe ff ff       	call   1000ed <video_putc>
		break;
  100243:	83 c4 10             	add    $0x10,%esp
  100246:	e9 0c ff ff ff       	jmp    100157 <video_putc+0x6a>
		terminal.crt_buf[terminal.crt_pos++] = c;		/* write the character */
  10024b:	c7 c1 80 14 97 00    	mov    $0x971480,%ecx
  100251:	8b 31                	mov    (%ecx),%esi
  100253:	0f b7 51 04          	movzwl 0x4(%ecx),%edx
  100257:	8d 7a 01             	lea    0x1(%edx),%edi
  10025a:	66 89 79 04          	mov    %di,0x4(%ecx)
  10025e:	0f b7 d2             	movzwl %dx,%edx
  100261:	66 89 04 56          	mov    %ax,(%esi,%edx,2)
		break;
  100265:	e9 ed fe ff ff       	jmp    100157 <video_putc+0x6a>
		memmove(terminal.crt_buf, terminal.crt_buf + CRT_COLS,
  10026a:	8b 00                	mov    (%eax),%eax
  10026c:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  100272:	83 ec 04             	sub    $0x4,%esp
  100275:	68 00 0f 00 00       	push   $0xf00
  10027a:	52                   	push   %edx
  10027b:	50                   	push   %eax
  10027c:	e8 43 1c 00 00       	call   101ec4 <memmove>
		for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i++)
  100281:	83 c4 10             	add    $0x10,%esp
  100284:	b8 80 07 00 00       	mov    $0x780,%eax
  100289:	eb 13                	jmp    10029e <video_putc+0x1b1>
			terminal.crt_buf[i] = 0x0700 | ' ';
  10028b:	8d 14 00             	lea    (%eax,%eax,1),%edx
  10028e:	c7 c1 80 14 97 00    	mov    $0x971480,%ecx
  100294:	03 11                	add    (%ecx),%edx
  100296:	66 c7 02 20 07       	movw   $0x720,(%edx)
		for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i++)
  10029b:	83 c0 01             	add    $0x1,%eax
  10029e:	3d cf 07 00 00       	cmp    $0x7cf,%eax
  1002a3:	7e e6                	jle    10028b <video_putc+0x19e>
		terminal.crt_pos -= CRT_COLS;
  1002a5:	c7 c2 80 14 97 00    	mov    $0x971480,%edx
  1002ab:	0f b7 42 04          	movzwl 0x4(%edx),%eax
  1002af:	83 e8 50             	sub    $0x50,%eax
  1002b2:	66 89 42 04          	mov    %ax,0x4(%edx)
  1002b6:	e9 ae fe ff ff       	jmp    100169 <video_putc+0x7c>

001002bb <video_set_cursor>:

void
video_set_cursor (int x, int y)
{
  1002bb:	e8 57 00 00 00       	call   100317 <__x86.get_pc_thunk.cx>
  1002c0:	81 c1 40 9d 00 00    	add    $0x9d40,%ecx
  1002c6:	8b 44 24 04          	mov    0x4(%esp),%eax
    terminal.crt_pos = x * CRT_COLS + y;
  1002ca:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  1002d1:	01 c2                	add    %eax,%edx
  1002d3:	89 d0                	mov    %edx,%eax
  1002d5:	c1 e0 04             	shl    $0x4,%eax
  1002d8:	66 03 44 24 08       	add    0x8(%esp),%ax
  1002dd:	c7 c2 80 14 97 00    	mov    $0x971480,%edx
  1002e3:	66 89 42 04          	mov    %ax,0x4(%edx)
  1002e7:	c3                   	ret    

001002e8 <video_clear_screen>:
}

void
video_clear_screen ()
{
  1002e8:	53                   	push   %ebx
  1002e9:	e8 2d 00 00 00       	call   10031b <__x86.get_pc_thunk.bx>
  1002ee:	81 c3 12 9d 00 00    	add    $0x9d12,%ebx
    int i;
    for (i = 0; i < CRT_SIZE; i++)
  1002f4:	b8 00 00 00 00       	mov    $0x0,%eax
  1002f9:	eb 13                	jmp    10030e <video_clear_screen+0x26>
    {
        terminal.crt_buf[i] = ' ';
  1002fb:	8d 14 00             	lea    (%eax,%eax,1),%edx
  1002fe:	c7 c1 80 14 97 00    	mov    $0x971480,%ecx
  100304:	03 11                	add    (%ecx),%edx
  100306:	66 c7 02 20 00       	movw   $0x20,(%edx)
    for (i = 0; i < CRT_SIZE; i++)
  10030b:	83 c0 01             	add    $0x1,%eax
  10030e:	3d cf 07 00 00       	cmp    $0x7cf,%eax
  100313:	7e e6                	jle    1002fb <video_clear_screen+0x13>
    }
}
  100315:	5b                   	pop    %ebx
  100316:	c3                   	ret    

00100317 <__x86.get_pc_thunk.cx>:
  100317:	8b 0c 24             	mov    (%esp),%ecx
  10031a:	c3                   	ret    

0010031b <__x86.get_pc_thunk.bx>:
  10031b:	8b 1c 24             	mov    (%esp),%ebx
  10031e:	c3                   	ret    

0010031f <cons_init>:
	uint32_t rpos, wpos;
} cons;

void
cons_init()
{
  10031f:	53                   	push   %ebx
  100320:	83 ec 0c             	sub    $0xc,%esp
  100323:	e8 f3 ff ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  100328:	81 c3 d8 9c 00 00    	add    $0x9cd8,%ebx
	memset(&cons, 0x0, sizeof(cons));
  10032e:	68 08 02 00 00       	push   $0x208
  100333:	6a 00                	push   $0x0
  100335:	ff b3 e4 ff ff ff    	pushl  -0x1c(%ebx)
  10033b:	e8 3b 1b 00 00       	call   101e7b <memset>
	serial_init();
  100340:	e8 57 03 00 00       	call   10069c <serial_init>
	video_init();
  100345:	e8 b6 fc ff ff       	call   100000 <video_init>
}
  10034a:	83 c4 18             	add    $0x18,%esp
  10034d:	5b                   	pop    %ebx
  10034e:	c3                   	ret    

0010034f <cons_intr>:

void
cons_intr(int (*proc)(void))
{
  10034f:	57                   	push   %edi
  100350:	56                   	push   %esi
  100351:	53                   	push   %ebx
  100352:	e8 d0 01 00 00       	call   100527 <__x86.get_pc_thunk.si>
  100357:	81 c6 a9 9c 00 00    	add    $0x9ca9,%esi
  10035d:	8b 5c 24 10          	mov    0x10(%esp),%ebx
	int c;

	while ((c = (*proc)()) != -1) {
  100361:	ff d3                	call   *%ebx
  100363:	83 f8 ff             	cmp    $0xffffffff,%eax
  100366:	74 30                	je     100398 <cons_intr+0x49>
		if (c == 0)
  100368:	85 c0                	test   %eax,%eax
  10036a:	74 f5                	je     100361 <cons_intr+0x12>
			continue;
		cons.buf[cons.wpos++] = c;
  10036c:	c7 c2 a0 14 97 00    	mov    $0x9714a0,%edx
  100372:	8b ba 04 02 00 00    	mov    0x204(%edx),%edi
  100378:	8d 4f 01             	lea    0x1(%edi),%ecx
  10037b:	89 8a 04 02 00 00    	mov    %ecx,0x204(%edx)
  100381:	88 04 3a             	mov    %al,(%edx,%edi,1)
		if (cons.wpos == CONSOLE_BUFFER_SIZE)
  100384:	81 f9 00 02 00 00    	cmp    $0x200,%ecx
  10038a:	75 d5                	jne    100361 <cons_intr+0x12>
			cons.wpos = 0;
  10038c:	c7 82 04 02 00 00 00 	movl   $0x0,0x204(%edx)
  100393:	00 00 00 
  100396:	eb c9                	jmp    100361 <cons_intr+0x12>
	}
}
  100398:	5b                   	pop    %ebx
  100399:	5e                   	pop    %esi
  10039a:	5f                   	pop    %edi
  10039b:	c3                   	ret    

0010039c <cons_getc>:

char
cons_getc(void)
{
  10039c:	53                   	push   %ebx
  10039d:	83 ec 08             	sub    $0x8,%esp
  1003a0:	e8 76 ff ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  1003a5:	81 c3 5b 9c 00 00    	add    $0x9c5b,%ebx
  int c;

  // poll for any pending input characters,
  // so that this function works even when interrupts are disabled
  // (e.g., when called from the kernel monitor).
  serial_intr();
  1003ab:	e8 42 02 00 00       	call   1005f2 <serial_intr>
  keyboard_intr();
  1003b0:	e8 f6 04 00 00       	call   1008ab <keyboard_intr>

  // grab the next character from the input buffer.
  if (cons.rpos != cons.wpos) {
  1003b5:	c7 c2 a0 14 97 00    	mov    $0x9714a0,%edx
  1003bb:	8b 82 00 02 00 00    	mov    0x200(%edx),%eax
  1003c1:	3b 82 04 02 00 00    	cmp    0x204(%edx),%eax
  1003c7:	74 2c                	je     1003f5 <cons_getc+0x59>
    c = cons.buf[cons.rpos++];
  1003c9:	8d 50 01             	lea    0x1(%eax),%edx
  1003cc:	c7 c1 a0 14 97 00    	mov    $0x9714a0,%ecx
  1003d2:	89 91 00 02 00 00    	mov    %edx,0x200(%ecx)
  1003d8:	0f b6 04 01          	movzbl (%ecx,%eax,1),%eax
    if (cons.rpos == CONSOLE_BUFFER_SIZE)
  1003dc:	81 fa 00 02 00 00    	cmp    $0x200,%edx
  1003e2:	74 05                	je     1003e9 <cons_getc+0x4d>
      cons.rpos = 0;
    return c;
  }
  return 0;
}
  1003e4:	83 c4 08             	add    $0x8,%esp
  1003e7:	5b                   	pop    %ebx
  1003e8:	c3                   	ret    
      cons.rpos = 0;
  1003e9:	c7 81 00 02 00 00 00 	movl   $0x0,0x200(%ecx)
  1003f0:	00 00 00 
  1003f3:	eb ef                	jmp    1003e4 <cons_getc+0x48>
  return 0;
  1003f5:	b8 00 00 00 00       	mov    $0x0,%eax
  1003fa:	eb e8                	jmp    1003e4 <cons_getc+0x48>

001003fc <cons_putc>:

void
cons_putc(char c)
{
  1003fc:	56                   	push   %esi
  1003fd:	53                   	push   %ebx
  1003fe:	83 ec 10             	sub    $0x10,%esp
  100401:	e8 15 ff ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  100406:	81 c3 fa 9b 00 00    	add    $0x9bfa,%ebx
	serial_putc(c);
  10040c:	0f be 74 24 1c       	movsbl 0x1c(%esp),%esi
  100411:	56                   	push   %esi
  100412:	e8 0e 02 00 00       	call   100625 <serial_putc>
  video_putc(c);
  100417:	89 34 24             	mov    %esi,(%esp)
  10041a:	e8 ce fc ff ff       	call   1000ed <video_putc>
}
  10041f:	83 c4 14             	add    $0x14,%esp
  100422:	5b                   	pop    %ebx
  100423:	5e                   	pop    %esi
  100424:	c3                   	ret    

00100425 <getchar>:

char
getchar(void)
{
  100425:	83 ec 0c             	sub    $0xc,%esp
  char c;

  while ((c = cons_getc()) == 0)
  100428:	e8 6f ff ff ff       	call   10039c <cons_getc>
  10042d:	84 c0                	test   %al,%al
  10042f:	74 f7                	je     100428 <getchar+0x3>
    /* do nothing */;
  return c;
}
  100431:	83 c4 0c             	add    $0xc,%esp
  100434:	c3                   	ret    

00100435 <putchar>:

void
putchar(char c)
{
  100435:	83 ec 18             	sub    $0x18,%esp
  cons_putc(c);
  100438:	0f be 44 24 1c       	movsbl 0x1c(%esp),%eax
  10043d:	50                   	push   %eax
  10043e:	e8 b9 ff ff ff       	call   1003fc <cons_putc>
}
  100443:	83 c4 1c             	add    $0x1c,%esp
  100446:	c3                   	ret    

00100447 <readline>:

char *
readline(const char *prompt)
{
  100447:	57                   	push   %edi
  100448:	56                   	push   %esi
  100449:	53                   	push   %ebx
  10044a:	e8 dc 00 00 00       	call   10052b <__x86.get_pc_thunk.di>
  10044f:	81 c7 b1 9b 00 00    	add    $0x9bb1,%edi
  100455:	8b 44 24 10          	mov    0x10(%esp),%eax
  int i;
  char c;

  if (prompt != NULL)
  100459:	85 c0                	test   %eax,%eax
  10045b:	74 15                	je     100472 <readline+0x2b>
    dprintf("%s", prompt);
  10045d:	83 ec 08             	sub    $0x8,%esp
  100460:	50                   	push   %eax
  100461:	8d 87 ae b2 ff ff    	lea    -0x4d52(%edi),%eax
  100467:	50                   	push   %eax
  100468:	89 fb                	mov    %edi,%ebx
  10046a:	e8 b5 1d 00 00       	call   102224 <dprintf>
  10046f:	83 c4 10             	add    $0x10,%esp
    } else if ((c == '\b' || c == '\x7f') && i > 0) {
      putchar('\b');
      i--;
    } else if (c >= ' ' && i < BUFLEN-1) {
      putchar(c);
      linebuf[i++] = c;
  100472:	be 00 00 00 00       	mov    $0x0,%esi
  100477:	eb 44                	jmp    1004bd <readline+0x76>
      dprintf("read error: %e\n", c);
  100479:	83 ec 08             	sub    $0x8,%esp
  10047c:	0f be c0             	movsbl %al,%eax
  10047f:	50                   	push   %eax
  100480:	8d 87 b1 b2 ff ff    	lea    -0x4d4f(%edi),%eax
  100486:	50                   	push   %eax
  100487:	89 fb                	mov    %edi,%ebx
  100489:	e8 96 1d 00 00       	call   102224 <dprintf>
      return NULL;
  10048e:	83 c4 10             	add    $0x10,%esp
  100491:	b8 00 00 00 00       	mov    $0x0,%eax
      putchar('\n');
      linebuf[i] = 0;
      return linebuf;
    }
  }
}
  100496:	5b                   	pop    %ebx
  100497:	5e                   	pop    %esi
  100498:	5f                   	pop    %edi
  100499:	c3                   	ret    
    } else if (c >= ' ' && i < BUFLEN-1) {
  10049a:	80 fb 1f             	cmp    $0x1f,%bl
  10049d:	0f 9f c2             	setg   %dl
  1004a0:	81 fe fe 03 00 00    	cmp    $0x3fe,%esi
  1004a6:	0f 9e c0             	setle  %al
  1004a9:	84 c2                	test   %al,%dl
  1004ab:	75 3f                	jne    1004ec <readline+0xa5>
    } else if (c == '\n' || c == '\r') {
  1004ad:	80 fb 0a             	cmp    $0xa,%bl
  1004b0:	0f 94 c2             	sete   %dl
  1004b3:	80 fb 0d             	cmp    $0xd,%bl
  1004b6:	0f 94 c0             	sete   %al
  1004b9:	08 c2                	or     %al,%dl
  1004bb:	75 4a                	jne    100507 <readline+0xc0>
    c = getchar();
  1004bd:	e8 63 ff ff ff       	call   100425 <getchar>
  1004c2:	89 c3                	mov    %eax,%ebx
    if (c < 0) {
  1004c4:	84 c0                	test   %al,%al
  1004c6:	78 b1                	js     100479 <readline+0x32>
    } else if ((c == '\b' || c == '\x7f') && i > 0) {
  1004c8:	3c 08                	cmp    $0x8,%al
  1004ca:	0f 94 c2             	sete   %dl
  1004cd:	3c 7f                	cmp    $0x7f,%al
  1004cf:	0f 94 c0             	sete   %al
  1004d2:	08 c2                	or     %al,%dl
  1004d4:	74 c4                	je     10049a <readline+0x53>
  1004d6:	85 f6                	test   %esi,%esi
  1004d8:	7e c0                	jle    10049a <readline+0x53>
      putchar('\b');
  1004da:	83 ec 0c             	sub    $0xc,%esp
  1004dd:	6a 08                	push   $0x8
  1004df:	e8 51 ff ff ff       	call   100435 <putchar>
      i--;
  1004e4:	83 ee 01             	sub    $0x1,%esi
  1004e7:	83 c4 10             	add    $0x10,%esp
  1004ea:	eb d1                	jmp    1004bd <readline+0x76>
      putchar(c);
  1004ec:	83 ec 0c             	sub    $0xc,%esp
  1004ef:	0f be c3             	movsbl %bl,%eax
  1004f2:	50                   	push   %eax
  1004f3:	e8 3d ff ff ff       	call   100435 <putchar>
      linebuf[i++] = c;
  1004f8:	88 9c 37 00 60 02 00 	mov    %bl,0x26000(%edi,%esi,1)
  1004ff:	83 c4 10             	add    $0x10,%esp
  100502:	8d 76 01             	lea    0x1(%esi),%esi
  100505:	eb b6                	jmp    1004bd <readline+0x76>
      putchar('\n');
  100507:	83 ec 0c             	sub    $0xc,%esp
  10050a:	6a 0a                	push   $0xa
  10050c:	e8 24 ff ff ff       	call   100435 <putchar>
      linebuf[i] = 0;
  100511:	c6 84 37 00 60 02 00 	movb   $0x0,0x26000(%edi,%esi,1)
  100518:	00 
      return linebuf;
  100519:	83 c4 10             	add    $0x10,%esp
  10051c:	8d 87 00 60 02 00    	lea    0x26000(%edi),%eax
  100522:	e9 6f ff ff ff       	jmp    100496 <readline+0x4f>

00100527 <__x86.get_pc_thunk.si>:
  100527:	8b 34 24             	mov    (%esp),%esi
  10052a:	c3                   	ret    

0010052b <__x86.get_pc_thunk.di>:
  10052b:	8b 3c 24             	mov    (%esp),%edi
  10052e:	c3                   	ret    

0010052f <serial_proc_data>:
	inb(0x84);
}

static int
serial_proc_data(void)
{
  10052f:	53                   	push   %ebx
  100530:	83 ec 14             	sub    $0x14,%esp
  100533:	e8 e3 fd ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  100538:	81 c3 c8 9a 00 00    	add    $0x9ac8,%ebx
	if (!(inb(COM1+COM_LSR) & COM_LSR_DATA))
  10053e:	68 fd 03 00 00       	push   $0x3fd
  100543:	e8 3d 25 00 00       	call   102a85 <inb>
  100548:	83 c4 10             	add    $0x10,%esp
  10054b:	a8 01                	test   $0x1,%al
  10054d:	74 18                	je     100567 <serial_proc_data+0x38>
		return -1;
	return inb(COM1+COM_RX);
  10054f:	83 ec 0c             	sub    $0xc,%esp
  100552:	68 f8 03 00 00       	push   $0x3f8
  100557:	e8 29 25 00 00       	call   102a85 <inb>
  10055c:	0f b6 c0             	movzbl %al,%eax
  10055f:	83 c4 10             	add    $0x10,%esp
}
  100562:	83 c4 08             	add    $0x8,%esp
  100565:	5b                   	pop    %ebx
  100566:	c3                   	ret    
		return -1;
  100567:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10056c:	eb f4                	jmp    100562 <serial_proc_data+0x33>

0010056e <delay>:
{
  10056e:	53                   	push   %ebx
  10056f:	83 ec 14             	sub    $0x14,%esp
  100572:	e8 a4 fd ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  100577:	81 c3 89 9a 00 00    	add    $0x9a89,%ebx
	inb(0x84);
  10057d:	68 84 00 00 00       	push   $0x84
  100582:	e8 fe 24 00 00       	call   102a85 <inb>
	inb(0x84);
  100587:	c7 04 24 84 00 00 00 	movl   $0x84,(%esp)
  10058e:	e8 f2 24 00 00       	call   102a85 <inb>
	inb(0x84);
  100593:	c7 04 24 84 00 00 00 	movl   $0x84,(%esp)
  10059a:	e8 e6 24 00 00       	call   102a85 <inb>
	inb(0x84);
  10059f:	c7 04 24 84 00 00 00 	movl   $0x84,(%esp)
  1005a6:	e8 da 24 00 00       	call   102a85 <inb>
}
  1005ab:	83 c4 18             	add    $0x18,%esp
  1005ae:	5b                   	pop    %ebx
  1005af:	c3                   	ret    

001005b0 <serial_reformatnewline>:
		cons_intr(serial_proc_data);
}

static int
serial_reformatnewline(int c, int p)
{
  1005b0:	56                   	push   %esi
  1005b1:	53                   	push   %ebx
  1005b2:	83 ec 04             	sub    $0x4,%esp
  1005b5:	e8 61 fd ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  1005ba:	81 c3 46 9a 00 00    	add    $0x9a46,%ebx
	int nl = '\n';
	/* POSIX requires newline on the serial line to
	 * be a CR-LF pair. Without this, you get a malformed output
	 * with clients like minicom or screen
	 */
	if (c == nl) {
  1005c0:	83 f8 0a             	cmp    $0xa,%eax
  1005c3:	74 0b                	je     1005d0 <serial_reformatnewline+0x20>
		outb(p, cr);
		outb(p, nl);
		return 1;
	}
	else
		return 0;
  1005c5:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1005ca:	83 c4 04             	add    $0x4,%esp
  1005cd:	5b                   	pop    %ebx
  1005ce:	5e                   	pop    %esi
  1005cf:	c3                   	ret    
  1005d0:	89 d6                	mov    %edx,%esi
		outb(p, cr);
  1005d2:	83 ec 08             	sub    $0x8,%esp
  1005d5:	6a 0d                	push   $0xd
  1005d7:	52                   	push   %edx
  1005d8:	e8 c0 24 00 00       	call   102a9d <outb>
		outb(p, nl);
  1005dd:	83 c4 08             	add    $0x8,%esp
  1005e0:	6a 0a                	push   $0xa
  1005e2:	56                   	push   %esi
  1005e3:	e8 b5 24 00 00       	call   102a9d <outb>
		return 1;
  1005e8:	83 c4 10             	add    $0x10,%esp
  1005eb:	b8 01 00 00 00       	mov    $0x1,%eax
  1005f0:	eb d8                	jmp    1005ca <serial_reformatnewline+0x1a>

001005f2 <serial_intr>:
{
  1005f2:	53                   	push   %ebx
  1005f3:	83 ec 08             	sub    $0x8,%esp
  1005f6:	e8 20 fd ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  1005fb:	81 c3 05 9a 00 00    	add    $0x9a05,%ebx
	if (serial_exists)
  100601:	c7 c0 a8 16 97 00    	mov    $0x9716a8,%eax
  100607:	80 38 00             	cmpb   $0x0,(%eax)
  10060a:	75 05                	jne    100611 <serial_intr+0x1f>
}
  10060c:	83 c4 08             	add    $0x8,%esp
  10060f:	5b                   	pop    %ebx
  100610:	c3                   	ret    
		cons_intr(serial_proc_data);
  100611:	83 ec 0c             	sub    $0xc,%esp
  100614:	8d 83 2f 65 ff ff    	lea    -0x9ad1(%ebx),%eax
  10061a:	50                   	push   %eax
  10061b:	e8 2f fd ff ff       	call   10034f <cons_intr>
  100620:	83 c4 10             	add    $0x10,%esp
}
  100623:	eb e7                	jmp    10060c <serial_intr+0x1a>

00100625 <serial_putc>:

void
serial_putc(char c)
{
  100625:	57                   	push   %edi
  100626:	56                   	push   %esi
  100627:	53                   	push   %ebx
  100628:	e8 ee fc ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  10062d:	81 c3 d3 99 00 00    	add    $0x99d3,%ebx
  100633:	8b 7c 24 10          	mov    0x10(%esp),%edi
	if (!serial_exists)
  100637:	c7 c0 a8 16 97 00    	mov    $0x9716a8,%eax
  10063d:	80 38 00             	cmpb   $0x0,(%eax)
  100640:	74 3e                	je     100680 <serial_putc+0x5b>
  100642:	be 00 00 00 00       	mov    $0x0,%esi
		return;

	int i;
	for (i = 0;
	     !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800;
  100647:	83 ec 0c             	sub    $0xc,%esp
  10064a:	68 fd 03 00 00       	push   $0x3fd
  10064f:	e8 31 24 00 00       	call   102a85 <inb>
	for (i = 0;
  100654:	83 c4 10             	add    $0x10,%esp
  100657:	a8 20                	test   $0x20,%al
  100659:	75 12                	jne    10066d <serial_putc+0x48>
	     !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800;
  10065b:	81 fe ff 31 00 00    	cmp    $0x31ff,%esi
  100661:	7f 0a                	jg     10066d <serial_putc+0x48>
	     i++)
		delay();
  100663:	e8 06 ff ff ff       	call   10056e <delay>
	     i++)
  100668:	83 c6 01             	add    $0x1,%esi
  10066b:	eb da                	jmp    100647 <serial_putc+0x22>

	if (!serial_reformatnewline(c, COM1 + COM_TX))
  10066d:	89 f8                	mov    %edi,%eax
  10066f:	0f be c0             	movsbl %al,%eax
  100672:	ba f8 03 00 00       	mov    $0x3f8,%edx
  100677:	e8 34 ff ff ff       	call   1005b0 <serial_reformatnewline>
  10067c:	85 c0                	test   %eax,%eax
  10067e:	74 04                	je     100684 <serial_putc+0x5f>
		outb(COM1 + COM_TX, c);
}
  100680:	5b                   	pop    %ebx
  100681:	5e                   	pop    %esi
  100682:	5f                   	pop    %edi
  100683:	c3                   	ret    
		outb(COM1 + COM_TX, c);
  100684:	83 ec 08             	sub    $0x8,%esp
  100687:	89 f8                	mov    %edi,%eax
  100689:	0f b6 f8             	movzbl %al,%edi
  10068c:	57                   	push   %edi
  10068d:	68 f8 03 00 00       	push   $0x3f8
  100692:	e8 06 24 00 00       	call   102a9d <outb>
  100697:	83 c4 10             	add    $0x10,%esp
  10069a:	eb e4                	jmp    100680 <serial_putc+0x5b>

0010069c <serial_init>:

void
serial_init(void)
{
  10069c:	53                   	push   %ebx
  10069d:	83 ec 10             	sub    $0x10,%esp
  1006a0:	e8 76 fc ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  1006a5:	81 c3 5b 99 00 00    	add    $0x995b,%ebx
	/* turn off interrupt */
	outb(COM1 + COM_IER, 0);
  1006ab:	6a 00                	push   $0x0
  1006ad:	68 f9 03 00 00       	push   $0x3f9
  1006b2:	e8 e6 23 00 00       	call   102a9d <outb>

	/* set DLAB */
	outb(COM1 + COM_LCR, COM_LCR_DLAB);
  1006b7:	83 c4 08             	add    $0x8,%esp
  1006ba:	68 80 00 00 00       	push   $0x80
  1006bf:	68 fb 03 00 00       	push   $0x3fb
  1006c4:	e8 d4 23 00 00       	call   102a9d <outb>

	/* set baud rate */
	outb(COM1 + COM_DLL, 0x0001 & 0xff);
  1006c9:	83 c4 08             	add    $0x8,%esp
  1006cc:	6a 01                	push   $0x1
  1006ce:	68 f8 03 00 00       	push   $0x3f8
  1006d3:	e8 c5 23 00 00       	call   102a9d <outb>
	outb(COM1 + COM_DLM, 0x0001 >> 8);
  1006d8:	83 c4 08             	add    $0x8,%esp
  1006db:	6a 00                	push   $0x0
  1006dd:	68 f9 03 00 00       	push   $0x3f9
  1006e2:	e8 b6 23 00 00       	call   102a9d <outb>

	/* Set the line status.  */
	outb(COM1 + COM_LCR, COM_LCR_WLEN8 & ~COM_LCR_DLAB);
  1006e7:	83 c4 08             	add    $0x8,%esp
  1006ea:	6a 03                	push   $0x3
  1006ec:	68 fb 03 00 00       	push   $0x3fb
  1006f1:	e8 a7 23 00 00       	call   102a9d <outb>

	/* Enable the FIFO.  */
	outb(COM1 + COM_FCR, 0xc7);
  1006f6:	83 c4 08             	add    $0x8,%esp
  1006f9:	68 c7 00 00 00       	push   $0xc7
  1006fe:	68 fa 03 00 00       	push   $0x3fa
  100703:	e8 95 23 00 00       	call   102a9d <outb>

	/* Turn on DTR, RTS, and OUT2.  */
	outb(COM1 + COM_MCR, 0x0b);
  100708:	83 c4 08             	add    $0x8,%esp
  10070b:	6a 0b                	push   $0xb
  10070d:	68 fc 03 00 00       	push   $0x3fc
  100712:	e8 86 23 00 00       	call   102a9d <outb>

	// Clear any preexisting overrun indications and interrupts
	// Serial COM1 doesn't exist if COM_LSR returns 0xFF
	serial_exists = (inb(COM1+COM_LSR) != 0xFF);
  100717:	c7 04 24 fd 03 00 00 	movl   $0x3fd,(%esp)
  10071e:	e8 62 23 00 00       	call   102a85 <inb>
  100723:	3c ff                	cmp    $0xff,%al
  100725:	c7 c0 a8 16 97 00    	mov    $0x9716a8,%eax
  10072b:	0f 95 00             	setne  (%eax)
	(void) inb(COM1+COM_IIR);
  10072e:	c7 04 24 fa 03 00 00 	movl   $0x3fa,(%esp)
  100735:	e8 4b 23 00 00       	call   102a85 <inb>
	(void) inb(COM1+COM_RX);
  10073a:	c7 04 24 f8 03 00 00 	movl   $0x3f8,(%esp)
  100741:	e8 3f 23 00 00       	call   102a85 <inb>
}
  100746:	83 c4 18             	add    $0x18,%esp
  100749:	5b                   	pop    %ebx
  10074a:	c3                   	ret    

0010074b <serial_intenable>:

void
serial_intenable(void)
{
  10074b:	53                   	push   %ebx
  10074c:	83 ec 08             	sub    $0x8,%esp
  10074f:	e8 c7 fb ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  100754:	81 c3 ac 98 00 00    	add    $0x98ac,%ebx
	if (serial_exists) {
  10075a:	c7 c0 a8 16 97 00    	mov    $0x9716a8,%eax
  100760:	80 38 00             	cmpb   $0x0,(%eax)
  100763:	75 05                	jne    10076a <serial_intenable+0x1f>
		outb(COM1+COM_IER, 1);
		//intr_enable(IRQ_SERIAL13);
		serial_intr();
	}
}
  100765:	83 c4 08             	add    $0x8,%esp
  100768:	5b                   	pop    %ebx
  100769:	c3                   	ret    
		outb(COM1+COM_IER, 1);
  10076a:	83 ec 08             	sub    $0x8,%esp
  10076d:	6a 01                	push   $0x1
  10076f:	68 f9 03 00 00       	push   $0x3f9
  100774:	e8 24 23 00 00       	call   102a9d <outb>
		serial_intr();
  100779:	e8 74 fe ff ff       	call   1005f2 <serial_intr>
  10077e:	83 c4 10             	add    $0x10,%esp
}
  100781:	eb e2                	jmp    100765 <serial_intenable+0x1a>

00100783 <kbd_proc_data>:
 * Get data from the keyboard.  If we finish a character, return it.  Else 0.
 * Return -1 if no data.
 */
static int
kbd_proc_data(void)
{
  100783:	56                   	push   %esi
  100784:	53                   	push   %ebx
  100785:	83 ec 10             	sub    $0x10,%esp
  100788:	e8 8e fb ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  10078d:	81 c3 73 98 00 00    	add    $0x9873,%ebx
  int c;
  uint8_t data;
  static uint32_t shift;

  if ((inb(KBSTATP) & KBS_DIB) == 0)
  100793:	6a 64                	push   $0x64
  100795:	e8 eb 22 00 00       	call   102a85 <inb>
  10079a:	83 c4 10             	add    $0x10,%esp
  10079d:	a8 01                	test   $0x1,%al
  10079f:	0f 84 ff 00 00 00    	je     1008a4 <kbd_proc_data+0x121>
    return -1;

  data = inb(KBDATAP);
  1007a5:	83 ec 0c             	sub    $0xc,%esp
  1007a8:	6a 60                	push   $0x60
  1007aa:	e8 d6 22 00 00       	call   102a85 <inb>
  1007af:	89 c2                	mov    %eax,%edx

  if (data == 0xE0) {
  1007b1:	83 c4 10             	add    $0x10,%esp
  1007b4:	3c e0                	cmp    $0xe0,%al
  1007b6:	74 7c                	je     100834 <kbd_proc_data+0xb1>
    // E0 escape character
    shift |= E0ESC;
    return 0;
  } else if (data & 0x80) {
  1007b8:	84 c0                	test   %al,%al
  1007ba:	0f 88 82 00 00 00    	js     100842 <kbd_proc_data+0xbf>
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
    shift &= ~(shiftcode[data] | E0ESC);
    return 0;
  } else if (shift & E0ESC) {
  1007c0:	8b 8b 00 64 02 00    	mov    0x26400(%ebx),%ecx
  1007c6:	f6 c1 40             	test   $0x40,%cl
  1007c9:	74 0e                	je     1007d9 <kbd_proc_data+0x56>
    // Last character was an E0 escape; or with 0x80
    data |= 0x80;
  1007cb:	89 c2                	mov    %eax,%edx
  1007cd:	83 ca 80             	or     $0xffffff80,%edx
    shift &= ~E0ESC;
  1007d0:	83 e1 bf             	and    $0xffffffbf,%ecx
  1007d3:	89 8b 00 64 02 00    	mov    %ecx,0x26400(%ebx)
  }

  shift |= shiftcode[data];
  1007d9:	0f b6 d2             	movzbl %dl,%edx
  1007dc:	0f b6 84 13 e0 b3 ff 	movzbl -0x4c20(%ebx,%edx,1),%eax
  1007e3:	ff 
  1007e4:	0b 83 00 64 02 00    	or     0x26400(%ebx),%eax
  shift ^= togglecode[data];
  1007ea:	0f b6 8c 13 e0 b2 ff 	movzbl -0x4d20(%ebx,%edx,1),%ecx
  1007f1:	ff 
  1007f2:	31 c8                	xor    %ecx,%eax
  1007f4:	89 83 00 64 02 00    	mov    %eax,0x26400(%ebx)

  c = charcode[shift & (CTL | SHIFT)][data];
  1007fa:	89 c1                	mov    %eax,%ecx
  1007fc:	83 e1 03             	and    $0x3,%ecx
  1007ff:	8b 8c 8b 80 ff ff ff 	mov    -0x80(%ebx,%ecx,4),%ecx
  100806:	0f b6 14 11          	movzbl (%ecx,%edx,1),%edx
  10080a:	0f b6 f2             	movzbl %dl,%esi
  if (shift & CAPSLOCK) {
  10080d:	a8 08                	test   $0x8,%al
  10080f:	74 0d                	je     10081e <kbd_proc_data+0x9b>
    if ('a' <= c && c <= 'z')
  100811:	89 f2                	mov    %esi,%edx
  100813:	8d 4e 9f             	lea    -0x61(%esi),%ecx
  100816:	83 f9 19             	cmp    $0x19,%ecx
  100819:	77 59                	ja     100874 <kbd_proc_data+0xf1>
      c += 'A' - 'a';
  10081b:	83 ee 20             	sub    $0x20,%esi
      c += 'a' - 'A';
  }

  // Process special keys
  // Ctrl-Alt-Del: reboot
  if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  10081e:	f7 d0                	not    %eax
  100820:	a8 06                	test   $0x6,%al
  100822:	75 08                	jne    10082c <kbd_proc_data+0xa9>
  100824:	81 fe e9 00 00 00    	cmp    $0xe9,%esi
  10082a:	74 55                	je     100881 <kbd_proc_data+0xfe>
    dprintf("Rebooting!\n");
    outb(0x92, 0x3); // courtesy of Chris Frost
  }

  return c;
}
  10082c:	89 f0                	mov    %esi,%eax
  10082e:	83 c4 04             	add    $0x4,%esp
  100831:	5b                   	pop    %ebx
  100832:	5e                   	pop    %esi
  100833:	c3                   	ret    
    shift |= E0ESC;
  100834:	83 8b 00 64 02 00 40 	orl    $0x40,0x26400(%ebx)
    return 0;
  10083b:	be 00 00 00 00       	mov    $0x0,%esi
  100840:	eb ea                	jmp    10082c <kbd_proc_data+0xa9>
    data = (shift & E0ESC ? data : data & 0x7F);
  100842:	8b 8b 00 64 02 00    	mov    0x26400(%ebx),%ecx
  100848:	f6 c1 40             	test   $0x40,%cl
  10084b:	75 05                	jne    100852 <kbd_proc_data+0xcf>
  10084d:	89 c2                	mov    %eax,%edx
  10084f:	83 e2 7f             	and    $0x7f,%edx
    shift &= ~(shiftcode[data] | E0ESC);
  100852:	0f b6 d2             	movzbl %dl,%edx
  100855:	0f b6 84 13 e0 b3 ff 	movzbl -0x4c20(%ebx,%edx,1),%eax
  10085c:	ff 
  10085d:	83 c8 40             	or     $0x40,%eax
  100860:	0f b6 c0             	movzbl %al,%eax
  100863:	f7 d0                	not    %eax
  100865:	21 c8                	and    %ecx,%eax
  100867:	89 83 00 64 02 00    	mov    %eax,0x26400(%ebx)
    return 0;
  10086d:	be 00 00 00 00       	mov    $0x0,%esi
  100872:	eb b8                	jmp    10082c <kbd_proc_data+0xa9>
    else if ('A' <= c && c <= 'Z')
  100874:	83 ea 41             	sub    $0x41,%edx
  100877:	83 fa 19             	cmp    $0x19,%edx
  10087a:	77 a2                	ja     10081e <kbd_proc_data+0x9b>
      c += 'a' - 'A';
  10087c:	83 c6 20             	add    $0x20,%esi
  10087f:	eb 9d                	jmp    10081e <kbd_proc_data+0x9b>
    dprintf("Rebooting!\n");
  100881:	83 ec 0c             	sub    $0xc,%esp
  100884:	8d 83 c1 b2 ff ff    	lea    -0x4d3f(%ebx),%eax
  10088a:	50                   	push   %eax
  10088b:	e8 94 19 00 00       	call   102224 <dprintf>
    outb(0x92, 0x3); // courtesy of Chris Frost
  100890:	83 c4 08             	add    $0x8,%esp
  100893:	6a 03                	push   $0x3
  100895:	68 92 00 00 00       	push   $0x92
  10089a:	e8 fe 21 00 00       	call   102a9d <outb>
  10089f:	83 c4 10             	add    $0x10,%esp
  1008a2:	eb 88                	jmp    10082c <kbd_proc_data+0xa9>
    return -1;
  1008a4:	be ff ff ff ff       	mov    $0xffffffff,%esi
  1008a9:	eb 81                	jmp    10082c <kbd_proc_data+0xa9>

001008ab <keyboard_intr>:

void
keyboard_intr(void)
{
  1008ab:	53                   	push   %ebx
  1008ac:	83 ec 14             	sub    $0x14,%esp
  1008af:	e8 67 fa ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  1008b4:	81 c3 4c 97 00 00    	add    $0x974c,%ebx
  cons_intr(kbd_proc_data);
  1008ba:	8d 83 83 67 ff ff    	lea    -0x987d(%ebx),%eax
  1008c0:	50                   	push   %eax
  1008c1:	e8 89 fa ff ff       	call   10034f <cons_intr>
}
  1008c6:	83 c4 18             	add    $0x18,%esp
  1008c9:	5b                   	pop    %ebx
  1008ca:	c3                   	ret    

001008cb <devinit>:

void intr_init(void);

void
devinit (uintptr_t mbi_addr)
{
  1008cb:	57                   	push   %edi
  1008cc:	56                   	push   %esi
  1008cd:	53                   	push   %ebx
  1008ce:	e8 48 fa ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  1008d3:	81 c3 2d 97 00 00    	add    $0x972d,%ebx
  1008d9:	8b 74 24 10          	mov    0x10(%esp),%esi
	seg_init ();
  1008dd:	e8 5f 1e 00 00       	call   102741 <seg_init>

	enable_sse ();
  1008e2:	e8 0f 21 00 00       	call   1029f6 <enable_sse>

	cons_init ();
  1008e7:	e8 33 fa ff ff       	call   10031f <cons_init>
	KERN_DEBUG("cons initialized.\n");
  1008ec:	83 ec 04             	sub    $0x4,%esp
  1008ef:	8d 83 e0 b4 ff ff    	lea    -0x4b20(%ebx),%eax
  1008f5:	50                   	push   %eax
  1008f6:	6a 15                	push   $0x15
  1008f8:	8d bb f3 b4 ff ff    	lea    -0x4b0d(%ebx),%edi
  1008fe:	57                   	push   %edi
  1008ff:	e8 54 17 00 00       	call   102058 <debug_normal>
	KERN_DEBUG("devinit mbi_adr: %d\n", mbi_addr);
  100904:	56                   	push   %esi
  100905:	8d 83 06 b5 ff ff    	lea    -0x4afa(%ebx),%eax
  10090b:	50                   	push   %eax
  10090c:	6a 16                	push   $0x16
  10090e:	57                   	push   %edi
  10090f:	e8 44 17 00 00       	call   102058 <debug_normal>

  tsc_init();
  100914:	83 c4 20             	add    $0x20,%esp
  100917:	e8 05 12 00 00       	call   101b21 <tsc_init>

	intr_init();
  10091c:	e8 09 0d 00 00       	call   10162a <intr_init>

  /* enable interrupts */
  intr_enable (IRQ_TIMER);
  100921:	83 ec 0c             	sub    $0xc,%esp
  100924:	6a 00                	push   $0x0
  100926:	e8 2f 0d 00 00       	call   10165a <intr_enable>
  intr_enable (IRQ_KBD);
  10092b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  100932:	e8 23 0d 00 00       	call   10165a <intr_enable>
  intr_enable (IRQ_SERIAL13);
  100937:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  10093e:	e8 17 0d 00 00       	call   10165a <intr_enable>

	pmmap_init (mbi_addr);
  100943:	89 34 24             	mov    %esi,(%esp)
  100946:	e8 6f 02 00 00       	call   100bba <pmmap_init>

}
  10094b:	83 c4 10             	add    $0x10,%esp
  10094e:	5b                   	pop    %ebx
  10094f:	5e                   	pop    %esi
  100950:	5f                   	pop    %edi
  100951:	c3                   	ret    

00100952 <pmmap_dump>:
		max_usable_memory = last_slot[PMMAP_USABLE]->end;
}

static void
pmmap_dump(void)
{
  100952:	56                   	push   %esi
  100953:	53                   	push   %ebx
  100954:	83 ec 04             	sub    $0x4,%esp
  100957:	e8 bf f9 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  10095c:	81 c3 a4 96 00 00    	add    $0x96a4,%ebx
	struct pmmap *slot;
	SLIST_FOREACH(slot, &pmmap_list, next) {
  100962:	8b b3 38 64 02 00    	mov    0x26438(%ebx),%esi
  100968:	eb 34                	jmp    10099e <pmmap_dump+0x4c>
		KERN_INFO("BIOS-e820: 0x%08x - 0x%08x (%s)\n",
  10096a:	8d 8b 3d b5 ff ff    	lea    -0x4ac3(%ebx),%ecx
  100970:	eb 06                	jmp    100978 <pmmap_dump+0x26>
  100972:	8d 8b 24 b5 ff ff    	lea    -0x4adc(%ebx),%ecx
  100978:	8b 16                	mov    (%esi),%edx
  10097a:	8b 46 04             	mov    0x4(%esi),%eax
  10097d:	39 c2                	cmp    %eax,%edx
  10097f:	74 08                	je     100989 <pmmap_dump+0x37>
  100981:	83 f8 ff             	cmp    $0xffffffff,%eax
  100984:	74 03                	je     100989 <pmmap_dump+0x37>
  100986:	83 e8 01             	sub    $0x1,%eax
  100989:	51                   	push   %ecx
  10098a:	50                   	push   %eax
  10098b:	52                   	push   %edx
  10098c:	8d 83 a4 b5 ff ff    	lea    -0x4a5c(%ebx),%eax
  100992:	50                   	push   %eax
  100993:	e8 9b 16 00 00       	call   102033 <debug_info>
	SLIST_FOREACH(slot, &pmmap_list, next) {
  100998:	8b 76 0c             	mov    0xc(%esi),%esi
  10099b:	83 c4 10             	add    $0x10,%esp
  10099e:	85 f6                	test   %esi,%esi
  1009a0:	74 2f                	je     1009d1 <pmmap_dump+0x7f>
		KERN_INFO("BIOS-e820: 0x%08x - 0x%08x (%s)\n",
  1009a2:	8b 46 08             	mov    0x8(%esi),%eax
  1009a5:	83 f8 01             	cmp    $0x1,%eax
  1009a8:	74 c8                	je     100972 <pmmap_dump+0x20>
  1009aa:	83 f8 02             	cmp    $0x2,%eax
  1009ad:	74 12                	je     1009c1 <pmmap_dump+0x6f>
  1009af:	83 f8 03             	cmp    $0x3,%eax
  1009b2:	74 15                	je     1009c9 <pmmap_dump+0x77>
  1009b4:	83 f8 04             	cmp    $0x4,%eax
  1009b7:	74 b1                	je     10096a <pmmap_dump+0x18>
  1009b9:	8d 8b 35 b5 ff ff    	lea    -0x4acb(%ebx),%ecx
  1009bf:	eb b7                	jmp    100978 <pmmap_dump+0x26>
  1009c1:	8d 8b 1b b5 ff ff    	lea    -0x4ae5(%ebx),%ecx
  1009c7:	eb af                	jmp    100978 <pmmap_dump+0x26>
  1009c9:	8d 8b 2b b5 ff ff    	lea    -0x4ad5(%ebx),%ecx
  1009cf:	eb a7                	jmp    100978 <pmmap_dump+0x26>
			  (slot->type == MEM_RESERVED) ? "reserved" :
			  (slot->type == MEM_ACPI) ? "ACPI data" :
			  (slot->type == MEM_NVS) ? "ACPI NVS" :
			  "unknown");
	}
}
  1009d1:	83 c4 04             	add    $0x4,%esp
  1009d4:	5b                   	pop    %ebx
  1009d5:	5e                   	pop    %esi
  1009d6:	c3                   	ret    

001009d7 <pmmap_merge>:
{
  1009d7:	57                   	push   %edi
  1009d8:	56                   	push   %esi
  1009d9:	53                   	push   %ebx
  1009da:	83 ec 10             	sub    $0x10,%esp
  1009dd:	e8 39 f9 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  1009e2:	81 c3 1e 96 00 00    	add    $0x961e,%ebx
	struct pmmap *last_slot[4] = { NULL, NULL, NULL, NULL };
  1009e8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1009ef:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  1009f6:	00 
  1009f7:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  1009fe:	00 
  1009ff:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  100a06:	00 
	SLIST_FOREACH(slot, &pmmap_list, next) {
  100a07:	8b b3 38 64 02 00    	mov    0x26438(%ebx),%esi
  100a0d:	eb 03                	jmp    100a12 <pmmap_merge+0x3b>
  100a0f:	8b 76 0c             	mov    0xc(%esi),%esi
  100a12:	85 f6                	test   %esi,%esi
  100a14:	74 39                	je     100a4f <pmmap_merge+0x78>
		if ((next_slot = SLIST_NEXT(slot, next)) == NULL)
  100a16:	8b 46 0c             	mov    0xc(%esi),%eax
  100a19:	85 c0                	test   %eax,%eax
  100a1b:	74 32                	je     100a4f <pmmap_merge+0x78>
		if (slot->start <= next_slot->start &&
  100a1d:	8b 10                	mov    (%eax),%edx
  100a1f:	39 16                	cmp    %edx,(%esi)
  100a21:	77 ec                	ja     100a0f <pmmap_merge+0x38>
		    slot->end >= next_slot->start &&
  100a23:	8b 4e 04             	mov    0x4(%esi),%ecx
		if (slot->start <= next_slot->start &&
  100a26:	39 ca                	cmp    %ecx,%edx
  100a28:	77 e5                	ja     100a0f <pmmap_merge+0x38>
		    slot->end >= next_slot->start &&
  100a2a:	8b 78 08             	mov    0x8(%eax),%edi
  100a2d:	39 7e 08             	cmp    %edi,0x8(%esi)
  100a30:	75 dd                	jne    100a0f <pmmap_merge+0x38>
			slot->end = max(slot->end, next_slot->end);
  100a32:	83 ec 08             	sub    $0x8,%esp
  100a35:	ff 70 04             	pushl  0x4(%eax)
  100a38:	51                   	push   %ecx
  100a39:	e8 48 1f 00 00       	call   102986 <max>
  100a3e:	89 46 04             	mov    %eax,0x4(%esi)
			SLIST_REMOVE_AFTER(slot, next);
  100a41:	8b 46 0c             	mov    0xc(%esi),%eax
  100a44:	8b 40 0c             	mov    0xc(%eax),%eax
  100a47:	89 46 0c             	mov    %eax,0xc(%esi)
  100a4a:	83 c4 10             	add    $0x10,%esp
  100a4d:	eb c0                	jmp    100a0f <pmmap_merge+0x38>
	SLIST_FOREACH(slot, &pmmap_list, next) {
  100a4f:	8b b3 38 64 02 00    	mov    0x26438(%ebx),%esi
  100a55:	eb 27                	jmp    100a7e <pmmap_merge+0xa7>
		sublist_nr = PMMAP_SUBLIST_NR(slot->type);
  100a57:	bf 03 00 00 00       	mov    $0x3,%edi
  100a5c:	eb 05                	jmp    100a63 <pmmap_merge+0x8c>
  100a5e:	bf 00 00 00 00       	mov    $0x0,%edi
    KERN_ASSERT(sublist_nr != -1);
  100a63:	83 ff ff             	cmp    $0xffffffff,%edi
  100a66:	74 46                	je     100aae <pmmap_merge+0xd7>
		if (last_slot[sublist_nr] != NULL)
  100a68:	8b 04 bc             	mov    (%esp,%edi,4),%eax
  100a6b:	85 c0                	test   %eax,%eax
  100a6d:	74 60                	je     100acf <pmmap_merge+0xf8>
			SLIST_INSERT_AFTER(last_slot[sublist_nr], slot,
  100a6f:	8b 50 10             	mov    0x10(%eax),%edx
  100a72:	89 56 10             	mov    %edx,0x10(%esi)
  100a75:	89 70 10             	mov    %esi,0x10(%eax)
		last_slot[sublist_nr] = slot;
  100a78:	89 34 bc             	mov    %esi,(%esp,%edi,4)
	SLIST_FOREACH(slot, &pmmap_list, next) {
  100a7b:	8b 76 0c             	mov    0xc(%esi),%esi
  100a7e:	85 f6                	test   %esi,%esi
  100a80:	74 5e                	je     100ae0 <pmmap_merge+0x109>
		sublist_nr = PMMAP_SUBLIST_NR(slot->type);
  100a82:	8b 46 08             	mov    0x8(%esi),%eax
  100a85:	83 f8 01             	cmp    $0x1,%eax
  100a88:	74 d4                	je     100a5e <pmmap_merge+0x87>
  100a8a:	83 f8 02             	cmp    $0x2,%eax
  100a8d:	74 11                	je     100aa0 <pmmap_merge+0xc9>
  100a8f:	83 f8 03             	cmp    $0x3,%eax
  100a92:	74 13                	je     100aa7 <pmmap_merge+0xd0>
  100a94:	83 f8 04             	cmp    $0x4,%eax
  100a97:	74 be                	je     100a57 <pmmap_merge+0x80>
  100a99:	bf ff ff ff ff       	mov    $0xffffffff,%edi
  100a9e:	eb c3                	jmp    100a63 <pmmap_merge+0x8c>
  100aa0:	bf 01 00 00 00       	mov    $0x1,%edi
  100aa5:	eb bc                	jmp    100a63 <pmmap_merge+0x8c>
  100aa7:	bf 02 00 00 00       	mov    $0x2,%edi
  100aac:	eb b5                	jmp    100a63 <pmmap_merge+0x8c>
    KERN_ASSERT(sublist_nr != -1);
  100aae:	8d 83 46 b5 ff ff    	lea    -0x4aba(%ebx),%eax
  100ab4:	50                   	push   %eax
  100ab5:	8d 83 57 b5 ff ff    	lea    -0x4aa9(%ebx),%eax
  100abb:	50                   	push   %eax
  100abc:	6a 71                	push   $0x71
  100abe:	8d 83 74 b5 ff ff    	lea    -0x4a8c(%ebx),%eax
  100ac4:	50                   	push   %eax
  100ac5:	e8 c7 15 00 00       	call   102091 <debug_panic>
  100aca:	83 c4 10             	add    $0x10,%esp
  100acd:	eb 99                	jmp    100a68 <pmmap_merge+0x91>
			SLIST_INSERT_HEAD(&pmmap_sublist[sublist_nr], slot,
  100acf:	8d 83 28 64 02 00    	lea    0x26428(%ebx),%eax
  100ad5:	8b 14 b8             	mov    (%eax,%edi,4),%edx
  100ad8:	89 56 10             	mov    %edx,0x10(%esi)
  100adb:	89 34 b8             	mov    %esi,(%eax,%edi,4)
  100ade:	eb 98                	jmp    100a78 <pmmap_merge+0xa1>
	if (last_slot[PMMAP_USABLE] != NULL)
  100ae0:	8b 04 24             	mov    (%esp),%eax
  100ae3:	85 c0                	test   %eax,%eax
  100ae5:	74 09                	je     100af0 <pmmap_merge+0x119>
		max_usable_memory = last_slot[PMMAP_USABLE]->end;
  100ae7:	8b 40 04             	mov    0x4(%eax),%eax
  100aea:	89 83 24 64 02 00    	mov    %eax,0x26424(%ebx)
}
  100af0:	83 c4 10             	add    $0x10,%esp
  100af3:	5b                   	pop    %ebx
  100af4:	5e                   	pop    %esi
  100af5:	5f                   	pop    %edi
  100af6:	c3                   	ret    

00100af7 <pmmap_alloc_slot>:
{
  100af7:	e8 e9 02 00 00       	call   100de5 <__x86.get_pc_thunk.dx>
  100afc:	81 c2 04 95 00 00    	add    $0x9504,%edx
	if (unlikely(pmmap_slots_next_free == 128))
  100b02:	8b 82 3c 64 02 00    	mov    0x2643c(%edx),%eax
  100b08:	3d 80 00 00 00       	cmp    $0x80,%eax
  100b0d:	74 1b                	je     100b2a <pmmap_alloc_slot+0x33>
	return &pmmap_slots[pmmap_slots_next_free++];
  100b0f:	8d 48 01             	lea    0x1(%eax),%ecx
  100b12:	89 8a 3c 64 02 00    	mov    %ecx,0x2643c(%edx)
  100b18:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
  100b1b:	8d 04 8d 00 00 00 00 	lea    0x0(,%ecx,4),%eax
  100b22:	8d 84 02 40 64 02 00 	lea    0x26440(%edx,%eax,1),%eax
  100b29:	c3                   	ret    
		return NULL;
  100b2a:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100b2f:	c3                   	ret    

00100b30 <pmmap_insert>:
{
  100b30:	55                   	push   %ebp
  100b31:	57                   	push   %edi
  100b32:	56                   	push   %esi
  100b33:	53                   	push   %ebx
  100b34:	83 ec 1c             	sub    $0x1c,%esp
  100b37:	e8 df f7 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  100b3c:	81 c3 c4 94 00 00    	add    $0x94c4,%ebx
  100b42:	89 c6                	mov    %eax,%esi
  100b44:	89 d5                	mov    %edx,%ebp
  100b46:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
	if ((free_slot = pmmap_alloc_slot()) == NULL)
  100b4a:	e8 a8 ff ff ff       	call   100af7 <pmmap_alloc_slot>
  100b4f:	89 c7                	mov    %eax,%edi
  100b51:	85 c0                	test   %eax,%eax
  100b53:	74 28                	je     100b7d <pmmap_insert+0x4d>
	free_slot->start = start;
  100b55:	89 37                	mov    %esi,(%edi)
	free_slot->end = end;
  100b57:	89 6f 04             	mov    %ebp,0x4(%edi)
	free_slot->type = type;
  100b5a:	8b 44 24 0c          	mov    0xc(%esp),%eax
  100b5e:	89 47 08             	mov    %eax,0x8(%edi)
	SLIST_FOREACH(slot, &pmmap_list, next) {
  100b61:	8b 8b 38 64 02 00    	mov    0x26438(%ebx),%ecx
  100b67:	89 c8                	mov    %ecx,%eax
	last_slot = NULL;
  100b69:	ba 00 00 00 00       	mov    $0x0,%edx
	SLIST_FOREACH(slot, &pmmap_list, next) {
  100b6e:	85 c0                	test   %eax,%eax
  100b70:	74 28                	je     100b9a <pmmap_insert+0x6a>
		if (start < slot->start)
  100b72:	3b 30                	cmp    (%eax),%esi
  100b74:	72 24                	jb     100b9a <pmmap_insert+0x6a>
		last_slot = slot;
  100b76:	89 c2                	mov    %eax,%edx
	SLIST_FOREACH(slot, &pmmap_list, next) {
  100b78:	8b 40 0c             	mov    0xc(%eax),%eax
  100b7b:	eb f1                	jmp    100b6e <pmmap_insert+0x3e>
		KERN_PANIC("More than 128 E820 entries.\n");
  100b7d:	83 ec 04             	sub    $0x4,%esp
  100b80:	8d 83 85 b5 ff ff    	lea    -0x4a7b(%ebx),%eax
  100b86:	50                   	push   %eax
  100b87:	6a 3e                	push   $0x3e
  100b89:	8d 83 74 b5 ff ff    	lea    -0x4a8c(%ebx),%eax
  100b8f:	50                   	push   %eax
  100b90:	e8 fc 14 00 00       	call   102091 <debug_panic>
  100b95:	83 c4 10             	add    $0x10,%esp
  100b98:	eb bb                	jmp    100b55 <pmmap_insert+0x25>
	if (last_slot == NULL)
  100b9a:	85 d2                	test   %edx,%edx
  100b9c:	74 11                	je     100baf <pmmap_insert+0x7f>
		SLIST_INSERT_AFTER(last_slot, free_slot, next);
  100b9e:	8b 42 0c             	mov    0xc(%edx),%eax
  100ba1:	89 47 0c             	mov    %eax,0xc(%edi)
  100ba4:	89 7a 0c             	mov    %edi,0xc(%edx)
}
  100ba7:	83 c4 1c             	add    $0x1c,%esp
  100baa:	5b                   	pop    %ebx
  100bab:	5e                   	pop    %esi
  100bac:	5f                   	pop    %edi
  100bad:	5d                   	pop    %ebp
  100bae:	c3                   	ret    
		SLIST_INSERT_HEAD(&pmmap_list, free_slot, next);
  100baf:	89 4f 0c             	mov    %ecx,0xc(%edi)
  100bb2:	89 bb 38 64 02 00    	mov    %edi,0x26438(%ebx)
  100bb8:	eb ed                	jmp    100ba7 <pmmap_insert+0x77>

00100bba <pmmap_init>:

void
pmmap_init(uintptr_t mbi_addr)
{
  100bba:	55                   	push   %ebp
  100bbb:	57                   	push   %edi
  100bbc:	56                   	push   %esi
  100bbd:	53                   	push   %ebx
  100bbe:	83 ec 18             	sub    $0x18,%esp
  100bc1:	e8 55 f7 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  100bc6:	81 c3 3a 94 00 00    	add    $0x943a,%ebx
  100bcc:	8b 7c 24 2c          	mov    0x2c(%esp),%edi
	KERN_INFO("\n");
  100bd0:	8d 83 f7 ba ff ff    	lea    -0x4509(%ebx),%eax
  100bd6:	50                   	push   %eax
  100bd7:	e8 57 14 00 00       	call   102033 <debug_info>

	mboot_info_t *mbi = (mboot_info_t *) mbi_addr;
  100bdc:	89 fe                	mov    %edi,%esi
	mboot_mmap_t *p = (mboot_mmap_t *) mbi->mmap_addr;
  100bde:	8b 4f 30             	mov    0x30(%edi),%ecx

	SLIST_INIT(&pmmap_list);
  100be1:	c7 83 38 64 02 00 00 	movl   $0x0,0x26438(%ebx)
  100be8:	00 00 00 
	SLIST_INIT(&pmmap_sublist[PMMAP_USABLE]);
  100beb:	c7 83 28 64 02 00 00 	movl   $0x0,0x26428(%ebx)
  100bf2:	00 00 00 
	SLIST_INIT(&pmmap_sublist[PMMAP_RESV]);
  100bf5:	c7 83 2c 64 02 00 00 	movl   $0x0,0x2642c(%ebx)
  100bfc:	00 00 00 
	SLIST_INIT(&pmmap_sublist[PMMAP_ACPI]);
  100bff:	c7 83 30 64 02 00 00 	movl   $0x0,0x26430(%ebx)
  100c06:	00 00 00 
	SLIST_INIT(&pmmap_sublist[PMMAP_NVS]);
  100c09:	c7 83 34 64 02 00 00 	movl   $0x0,0x26434(%ebx)
  100c10:	00 00 00 

	/*
	 * Copy memory map information from multiboot information mbi to pmmap.
	 */
	while ((uintptr_t) p - (uintptr_t) mbi->mmap_addr < mbi->mmap_length) {
  100c13:	83 c4 10             	add    $0x10,%esp
  100c16:	eb 10                	jmp    100c28 <pmmap_init+0x6e>
		else
			start = p->base_addr_low;

		if (p->length_high != 0 ||
		    p->length_low >= 0xffffffff - start)
			end = 0xffffffff;
  100c18:	ba ff ff ff ff       	mov    $0xffffffff,%edx
		else
			end = start + p->length_low;

		type = p->type;
  100c1d:	8b 49 14             	mov    0x14(%ecx),%ecx

		pmmap_insert(start, end, type);
  100c20:	e8 0b ff ff ff       	call   100b30 <pmmap_insert>
    //pmmap_dump();

	next:
		p = (mboot_mmap_t *) (((uint32_t) p) + sizeof(mboot_mmap_t)/* p->size */);
  100c25:	8d 4f 18             	lea    0x18(%edi),%ecx
	while ((uintptr_t) p - (uintptr_t) mbi->mmap_addr < mbi->mmap_length) {
  100c28:	89 cf                	mov    %ecx,%edi
  100c2a:	89 c8                	mov    %ecx,%eax
  100c2c:	2b 46 30             	sub    0x30(%esi),%eax
  100c2f:	3b 46 2c             	cmp    0x2c(%esi),%eax
  100c32:	73 25                	jae    100c59 <pmmap_init+0x9f>
		if (p->base_addr_high != 0)	/* ignore address above 4G */
  100c34:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
  100c38:	75 eb                	jne    100c25 <pmmap_init+0x6b>
			start = p->base_addr_low;
  100c3a:	8b 41 04             	mov    0x4(%ecx),%eax
		if (p->length_high != 0 ||
  100c3d:	83 79 10 00          	cmpl   $0x0,0x10(%ecx)
  100c41:	75 d5                	jne    100c18 <pmmap_init+0x5e>
		    p->length_low >= 0xffffffff - start)
  100c43:	8b 51 0c             	mov    0xc(%ecx),%edx
  100c46:	89 c5                	mov    %eax,%ebp
  100c48:	f7 d5                	not    %ebp
		if (p->length_high != 0 ||
  100c4a:	39 ea                	cmp    %ebp,%edx
  100c4c:	73 04                	jae    100c52 <pmmap_init+0x98>
			end = start + p->length_low;
  100c4e:	01 c2                	add    %eax,%edx
  100c50:	eb cb                	jmp    100c1d <pmmap_init+0x63>
			end = 0xffffffff;
  100c52:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  100c57:	eb c4                	jmp    100c1d <pmmap_init+0x63>
	}

	/* merge overlapped memory regions */
	pmmap_merge();
  100c59:	e8 79 fd ff ff       	call   1009d7 <pmmap_merge>
	pmmap_dump();
  100c5e:	e8 ef fc ff ff       	call   100952 <pmmap_dump>

	/* count the number of pmmap entries */
	struct pmmap *slot;
	SLIST_FOREACH(slot, &pmmap_list, next) {
  100c63:	8b 83 38 64 02 00    	mov    0x26438(%ebx),%eax
  100c69:	eb 0a                	jmp    100c75 <pmmap_init+0xbb>
		pmmap_nentries++;
  100c6b:	83 83 20 64 02 00 01 	addl   $0x1,0x26420(%ebx)
	SLIST_FOREACH(slot, &pmmap_list, next) {
  100c72:	8b 40 0c             	mov    0xc(%eax),%eax
  100c75:	85 c0                	test   %eax,%eax
  100c77:	75 f2                	jne    100c6b <pmmap_init+0xb1>
	}

	/* Calculate the maximum page number */
	mem_npages = rounddown(max_usable_memory, PAGESIZE) / PAGESIZE;
  100c79:	83 ec 08             	sub    $0x8,%esp
  100c7c:	68 00 10 00 00       	push   $0x1000
  100c81:	ff b3 24 64 02 00    	pushl  0x26424(%ebx)
  100c87:	e8 16 1d 00 00       	call   1029a2 <rounddown>
}
  100c8c:	83 c4 1c             	add    $0x1c,%esp
  100c8f:	5b                   	pop    %ebx
  100c90:	5e                   	pop    %esi
  100c91:	5f                   	pop    %edi
  100c92:	5d                   	pop    %ebp
  100c93:	c3                   	ret    

00100c94 <get_size>:

int
get_size(void)
{
  100c94:	e8 48 01 00 00       	call   100de1 <__x86.get_pc_thunk.ax>
  100c99:	05 67 93 00 00       	add    $0x9367,%eax
	return pmmap_nentries;
  100c9e:	8b 80 20 64 02 00    	mov    0x26420(%eax),%eax
}
  100ca4:	c3                   	ret    

00100ca5 <get_mms>:

uint32_t
get_mms(int idx)
{
  100ca5:	53                   	push   %ebx
  100ca6:	e8 70 f6 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  100cab:	81 c3 55 93 00 00    	add    $0x9355,%ebx
  100cb1:	8b 4c 24 08          	mov    0x8(%esp),%ecx
	int i = 0;
	struct pmmap *slot = NULL;

	SLIST_FOREACH(slot, &pmmap_list, next) {
  100cb5:	8b 83 38 64 02 00    	mov    0x26438(%ebx),%eax
	int i = 0;
  100cbb:	ba 00 00 00 00       	mov    $0x0,%edx
	SLIST_FOREACH(slot, &pmmap_list, next) {
  100cc0:	85 c0                	test   %eax,%eax
  100cc2:	74 0c                	je     100cd0 <get_mms+0x2b>
		if (i == idx)
  100cc4:	39 ca                	cmp    %ecx,%edx
  100cc6:	74 08                	je     100cd0 <get_mms+0x2b>
			break;
		i++;
  100cc8:	83 c2 01             	add    $0x1,%edx
	SLIST_FOREACH(slot, &pmmap_list, next) {
  100ccb:	8b 40 0c             	mov    0xc(%eax),%eax
  100cce:	eb f0                	jmp    100cc0 <get_mms+0x1b>
	}

	if (slot == NULL || i == pmmap_nentries)
  100cd0:	85 c0                	test   %eax,%eax
  100cd2:	74 0c                	je     100ce0 <get_mms+0x3b>
  100cd4:	3b 93 20 64 02 00    	cmp    0x26420(%ebx),%edx
  100cda:	74 0b                	je     100ce7 <get_mms+0x42>
		return 0;

	return slot->start;
  100cdc:	8b 00                	mov    (%eax),%eax
}
  100cde:	5b                   	pop    %ebx
  100cdf:	c3                   	ret    
		return 0;
  100ce0:	b8 00 00 00 00       	mov    $0x0,%eax
  100ce5:	eb f7                	jmp    100cde <get_mms+0x39>
  100ce7:	b8 00 00 00 00       	mov    $0x0,%eax
  100cec:	eb f0                	jmp    100cde <get_mms+0x39>

00100cee <get_mml>:

uint32_t
get_mml(int idx)
{
  100cee:	53                   	push   %ebx
  100cef:	e8 27 f6 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  100cf4:	81 c3 0c 93 00 00    	add    $0x930c,%ebx
  100cfa:	8b 4c 24 08          	mov    0x8(%esp),%ecx
	int i = 0;
	struct pmmap *slot = NULL;

	SLIST_FOREACH(slot, &pmmap_list, next) {
  100cfe:	8b 93 38 64 02 00    	mov    0x26438(%ebx),%edx
	int i = 0;
  100d04:	b8 00 00 00 00       	mov    $0x0,%eax
	SLIST_FOREACH(slot, &pmmap_list, next) {
  100d09:	85 d2                	test   %edx,%edx
  100d0b:	74 0c                	je     100d19 <get_mml+0x2b>
		if (i == idx)
  100d0d:	39 c8                	cmp    %ecx,%eax
  100d0f:	74 08                	je     100d19 <get_mml+0x2b>
			break;
		i++;
  100d11:	83 c0 01             	add    $0x1,%eax
	SLIST_FOREACH(slot, &pmmap_list, next) {
  100d14:	8b 52 0c             	mov    0xc(%edx),%edx
  100d17:	eb f0                	jmp    100d09 <get_mml+0x1b>
	}

	if (slot == NULL || i == pmmap_nentries)
  100d19:	85 d2                	test   %edx,%edx
  100d1b:	74 0f                	je     100d2c <get_mml+0x3e>
  100d1d:	3b 83 20 64 02 00    	cmp    0x26420(%ebx),%eax
  100d23:	74 0e                	je     100d33 <get_mml+0x45>
		return 0;

	return slot->end - slot->start;
  100d25:	8b 42 04             	mov    0x4(%edx),%eax
  100d28:	2b 02                	sub    (%edx),%eax
}
  100d2a:	5b                   	pop    %ebx
  100d2b:	c3                   	ret    
		return 0;
  100d2c:	b8 00 00 00 00       	mov    $0x0,%eax
  100d31:	eb f7                	jmp    100d2a <get_mml+0x3c>
  100d33:	b8 00 00 00 00       	mov    $0x0,%eax
  100d38:	eb f0                	jmp    100d2a <get_mml+0x3c>

00100d3a <is_usable>:

int
is_usable(int idx)
{
  100d3a:	53                   	push   %ebx
  100d3b:	e8 db f5 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  100d40:	81 c3 c0 92 00 00    	add    $0x92c0,%ebx
  100d46:	8b 4c 24 08          	mov    0x8(%esp),%ecx
	int i = 0;
	struct pmmap *slot = NULL;

	SLIST_FOREACH(slot, &pmmap_list, next) {
  100d4a:	8b 83 38 64 02 00    	mov    0x26438(%ebx),%eax
	int i = 0;
  100d50:	ba 00 00 00 00       	mov    $0x0,%edx
	SLIST_FOREACH(slot, &pmmap_list, next) {
  100d55:	85 c0                	test   %eax,%eax
  100d57:	74 0c                	je     100d65 <is_usable+0x2b>
		if (i == idx)
  100d59:	39 ca                	cmp    %ecx,%edx
  100d5b:	74 08                	je     100d65 <is_usable+0x2b>
			break;
		i++;
  100d5d:	83 c2 01             	add    $0x1,%edx
	SLIST_FOREACH(slot, &pmmap_list, next) {
  100d60:	8b 40 0c             	mov    0xc(%eax),%eax
  100d63:	eb f0                	jmp    100d55 <is_usable+0x1b>
	}

	if (slot == NULL || i == pmmap_nentries)
  100d65:	85 c0                	test   %eax,%eax
  100d67:	74 14                	je     100d7d <is_usable+0x43>
  100d69:	3b 93 20 64 02 00    	cmp    0x26420(%ebx),%edx
  100d6f:	74 13                	je     100d84 <is_usable+0x4a>
		return 0;

	return slot->type == MEM_RAM;
  100d71:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
  100d75:	0f 94 c0             	sete   %al
  100d78:	0f b6 c0             	movzbl %al,%eax
}
  100d7b:	5b                   	pop    %ebx
  100d7c:	c3                   	ret    
		return 0;
  100d7d:	b8 00 00 00 00       	mov    $0x0,%eax
  100d82:	eb f7                	jmp    100d7b <is_usable+0x41>
  100d84:	b8 00 00 00 00       	mov    $0x0,%eax
  100d89:	eb f0                	jmp    100d7b <is_usable+0x41>

00100d8b <set_cr3>:

void
set_cr3(char **pdir)
{
  100d8b:	53                   	push   %ebx
  100d8c:	83 ec 14             	sub    $0x14,%esp
  100d8f:	e8 87 f5 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  100d94:	81 c3 6c 92 00 00    	add    $0x926c,%ebx
	lcr3((uint32_t) pdir);
  100d9a:	ff 74 24 1c          	pushl  0x1c(%esp)
  100d9e:	e8 ce 1c 00 00       	call   102a71 <lcr3>
}
  100da3:	83 c4 18             	add    $0x18,%esp
  100da6:	5b                   	pop    %ebx
  100da7:	c3                   	ret    

00100da8 <enable_paging>:

void
enable_paging(void)
{
  100da8:	53                   	push   %ebx
  100da9:	83 ec 08             	sub    $0x8,%esp
  100dac:	e8 6a f5 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  100db1:	81 c3 4f 92 00 00    	add    $0x924f,%ebx
	/* enable global pages (Sec 4.10.2.4, Intel ASDM Vol3) */
	uint32_t cr4 = rcr4();
  100db7:	e8 c5 1c 00 00       	call   102a81 <rcr4>
	cr4 |= CR4_PGE;
  100dbc:	0c 80                	or     $0x80,%al
	lcr4(cr4);
  100dbe:	83 ec 0c             	sub    $0xc,%esp
  100dc1:	50                   	push   %eax
  100dc2:	e8 b2 1c 00 00       	call   102a79 <lcr4>

	/* turn on paging */
	uint32_t cr0 = rcr0();
  100dc7:	e8 9d 1c 00 00       	call   102a69 <rcr0>
  100dcc:	83 e0 f3             	and    $0xfffffff3,%eax
	cr0 |= CR0_PE | CR0_PG | CR0_AM | CR0_WP | CR0_NE | CR0_MP;
	cr0 &= ~(CR0_EM | CR0_TS);
  100dcf:	0d 23 00 05 80       	or     $0x80050023,%eax
	lcr0(cr0);
  100dd4:	89 04 24             	mov    %eax,(%esp)
  100dd7:	e8 85 1c 00 00       	call   102a61 <lcr0>
}
  100ddc:	83 c4 18             	add    $0x18,%esp
  100ddf:	5b                   	pop    %ebx
  100de0:	c3                   	ret    

00100de1 <__x86.get_pc_thunk.ax>:
  100de1:	8b 04 24             	mov    (%esp),%eax
  100de4:	c3                   	ret    

00100de5 <__x86.get_pc_thunk.dx>:
  100de5:	8b 14 24             	mov    (%esp),%edx
  100de8:	c3                   	ret    

00100de9 <intr_init_idt>:
pseudodesc_t idt_pd =
	{ .pd_lim = sizeof(idt) - 1, .pd_base = (uint32_t) idt };

static void
intr_init_idt(void)
{
  100de9:	55                   	push   %ebp
  100dea:	57                   	push   %edi
  100deb:	56                   	push   %esi
  100dec:	53                   	push   %ebx
  100ded:	83 ec 04             	sub    $0x4,%esp
  100df0:	e8 32 f7 ff ff       	call   100527 <__x86.get_pc_thunk.si>
  100df5:	81 c6 0b 92 00 00    	add    $0x920b,%esi

	/* check that T_IRQ0 is a multiple of 8 */
	KERN_ASSERT((T_IRQ0 & 7) == 0);

	/* install a default handler */
	for (i = 0; i < sizeof(idt)/sizeof(idt[0]); i++)
  100dfb:	b8 00 00 00 00       	mov    $0x0,%eax
  100e00:	eb 3e                	jmp    100e40 <intr_init_idt+0x57>
		SETGATE(idt[i], 0, CPU_GDT_KCODE, &Xdefault, 0);
  100e02:	c7 c1 c0 16 97 00    	mov    $0x9716c0,%ecx
  100e08:	c7 c5 3e 1e 10 00    	mov    $0x101e3e,%ebp
  100e0e:	66 89 2c c1          	mov    %bp,(%ecx,%eax,8)
  100e12:	66 c7 44 c1 02 08 00 	movw   $0x8,0x2(%ecx,%eax,8)
  100e19:	c6 44 c1 04 00       	movb   $0x0,0x4(%ecx,%eax,8)
  100e1e:	0f b6 54 c1 05       	movzbl 0x5(%ecx,%eax,8),%edx
  100e23:	83 e2 f0             	and    $0xfffffff0,%edx
  100e26:	83 ca 0e             	or     $0xe,%edx
  100e29:	83 e2 8f             	and    $0xffffff8f,%edx
  100e2c:	83 ca 80             	or     $0xffffff80,%edx
  100e2f:	88 54 c1 05          	mov    %dl,0x5(%ecx,%eax,8)
  100e33:	89 eb                	mov    %ebp,%ebx
  100e35:	c1 eb 10             	shr    $0x10,%ebx
  100e38:	66 89 5c c1 06       	mov    %bx,0x6(%ecx,%eax,8)
	for (i = 0; i < sizeof(idt)/sizeof(idt[0]); i++)
  100e3d:	83 c0 01             	add    $0x1,%eax
  100e40:	3d ff 00 00 00       	cmp    $0xff,%eax
  100e45:	76 bb                	jbe    100e02 <intr_init_idt+0x19>

	SETGATE(idt[T_DIVIDE],            0, CPU_GDT_KCODE, &Xdivide,       0);
  100e47:	c7 c0 c0 16 97 00    	mov    $0x9716c0,%eax
  100e4d:	c7 c1 30 1d 10 00    	mov    $0x101d30,%ecx
  100e53:	66 89 08             	mov    %cx,(%eax)
  100e56:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  100e5c:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  100e60:	0f b6 50 05          	movzbl 0x5(%eax),%edx
  100e64:	83 e2 f0             	and    $0xfffffff0,%edx
  100e67:	83 ca 0e             	or     $0xe,%edx
  100e6a:	83 e2 8f             	and    $0xffffff8f,%edx
  100e6d:	83 ca 80             	or     $0xffffff80,%edx
  100e70:	88 50 05             	mov    %dl,0x5(%eax)
  100e73:	c1 e9 10             	shr    $0x10,%ecx
  100e76:	66 89 48 06          	mov    %cx,0x6(%eax)
	SETGATE(idt[T_DEBUG],             0, CPU_GDT_KCODE, &Xdebug,        0);
  100e7a:	c7 c1 3a 1d 10 00    	mov    $0x101d3a,%ecx
  100e80:	66 89 48 08          	mov    %cx,0x8(%eax)
  100e84:	66 c7 40 0a 08 00    	movw   $0x8,0xa(%eax)
  100e8a:	c6 40 0c 00          	movb   $0x0,0xc(%eax)
  100e8e:	0f b6 50 0d          	movzbl 0xd(%eax),%edx
  100e92:	83 e2 f0             	and    $0xfffffff0,%edx
  100e95:	83 ca 0e             	or     $0xe,%edx
  100e98:	83 e2 8f             	and    $0xffffff8f,%edx
  100e9b:	83 ca 80             	or     $0xffffff80,%edx
  100e9e:	88 50 0d             	mov    %dl,0xd(%eax)
  100ea1:	c1 e9 10             	shr    $0x10,%ecx
  100ea4:	66 89 48 0e          	mov    %cx,0xe(%eax)
	SETGATE(idt[T_NMI],               0, CPU_GDT_KCODE, &Xnmi,          0);
  100ea8:	c7 c1 44 1d 10 00    	mov    $0x101d44,%ecx
  100eae:	66 89 48 10          	mov    %cx,0x10(%eax)
  100eb2:	66 c7 40 12 08 00    	movw   $0x8,0x12(%eax)
  100eb8:	c6 40 14 00          	movb   $0x0,0x14(%eax)
  100ebc:	0f b6 50 15          	movzbl 0x15(%eax),%edx
  100ec0:	83 e2 f0             	and    $0xfffffff0,%edx
  100ec3:	83 ca 0e             	or     $0xe,%edx
  100ec6:	83 e2 8f             	and    $0xffffff8f,%edx
  100ec9:	83 ca 80             	or     $0xffffff80,%edx
  100ecc:	88 50 15             	mov    %dl,0x15(%eax)
  100ecf:	c1 e9 10             	shr    $0x10,%ecx
  100ed2:	66 89 48 16          	mov    %cx,0x16(%eax)
	SETGATE(idt[T_BRKPT],             0, CPU_GDT_KCODE, &Xbrkpt,        3);
  100ed6:	c7 c1 4e 1d 10 00    	mov    $0x101d4e,%ecx
  100edc:	66 89 48 18          	mov    %cx,0x18(%eax)
  100ee0:	66 c7 40 1a 08 00    	movw   $0x8,0x1a(%eax)
  100ee6:	c6 40 1c 00          	movb   $0x0,0x1c(%eax)
  100eea:	0f b6 50 1d          	movzbl 0x1d(%eax),%edx
  100eee:	83 e2 f0             	and    $0xfffffff0,%edx
  100ef1:	83 ca 0e             	or     $0xe,%edx
  100ef4:	83 e2 ef             	and    $0xffffffef,%edx
  100ef7:	83 ca e0             	or     $0xffffffe0,%edx
  100efa:	88 50 1d             	mov    %dl,0x1d(%eax)
  100efd:	c1 e9 10             	shr    $0x10,%ecx
  100f00:	66 89 48 1e          	mov    %cx,0x1e(%eax)
	SETGATE(idt[T_OFLOW],             0, CPU_GDT_KCODE, &Xoflow,        3);
  100f04:	c7 c1 58 1d 10 00    	mov    $0x101d58,%ecx
  100f0a:	66 89 48 20          	mov    %cx,0x20(%eax)
  100f0e:	66 c7 40 22 08 00    	movw   $0x8,0x22(%eax)
  100f14:	c6 40 24 00          	movb   $0x0,0x24(%eax)
  100f18:	0f b6 50 25          	movzbl 0x25(%eax),%edx
  100f1c:	83 e2 f0             	and    $0xfffffff0,%edx
  100f1f:	83 ca 0e             	or     $0xe,%edx
  100f22:	83 e2 ef             	and    $0xffffffef,%edx
  100f25:	83 ca e0             	or     $0xffffffe0,%edx
  100f28:	88 50 25             	mov    %dl,0x25(%eax)
  100f2b:	c1 e9 10             	shr    $0x10,%ecx
  100f2e:	66 89 48 26          	mov    %cx,0x26(%eax)
	SETGATE(idt[T_BOUND],             0, CPU_GDT_KCODE, &Xbound,        0);
  100f32:	c7 c1 62 1d 10 00    	mov    $0x101d62,%ecx
  100f38:	66 89 48 28          	mov    %cx,0x28(%eax)
  100f3c:	66 c7 40 2a 08 00    	movw   $0x8,0x2a(%eax)
  100f42:	c6 40 2c 00          	movb   $0x0,0x2c(%eax)
  100f46:	0f b6 50 2d          	movzbl 0x2d(%eax),%edx
  100f4a:	83 e2 f0             	and    $0xfffffff0,%edx
  100f4d:	83 ca 0e             	or     $0xe,%edx
  100f50:	83 e2 8f             	and    $0xffffff8f,%edx
  100f53:	83 ca 80             	or     $0xffffff80,%edx
  100f56:	88 50 2d             	mov    %dl,0x2d(%eax)
  100f59:	c1 e9 10             	shr    $0x10,%ecx
  100f5c:	66 89 48 2e          	mov    %cx,0x2e(%eax)
	SETGATE(idt[T_ILLOP],             0, CPU_GDT_KCODE, &Xillop,        0);
  100f60:	c7 c1 6c 1d 10 00    	mov    $0x101d6c,%ecx
  100f66:	66 89 48 30          	mov    %cx,0x30(%eax)
  100f6a:	66 c7 40 32 08 00    	movw   $0x8,0x32(%eax)
  100f70:	c6 40 34 00          	movb   $0x0,0x34(%eax)
  100f74:	0f b6 50 35          	movzbl 0x35(%eax),%edx
  100f78:	83 e2 f0             	and    $0xfffffff0,%edx
  100f7b:	83 ca 0e             	or     $0xe,%edx
  100f7e:	83 e2 8f             	and    $0xffffff8f,%edx
  100f81:	83 ca 80             	or     $0xffffff80,%edx
  100f84:	88 50 35             	mov    %dl,0x35(%eax)
  100f87:	c1 e9 10             	shr    $0x10,%ecx
  100f8a:	66 89 48 36          	mov    %cx,0x36(%eax)
	SETGATE(idt[T_DEVICE],            0, CPU_GDT_KCODE, &Xdevice,       0);
  100f8e:	c7 c1 76 1d 10 00    	mov    $0x101d76,%ecx
  100f94:	66 89 48 38          	mov    %cx,0x38(%eax)
  100f98:	66 c7 40 3a 08 00    	movw   $0x8,0x3a(%eax)
  100f9e:	c6 40 3c 00          	movb   $0x0,0x3c(%eax)
  100fa2:	0f b6 50 3d          	movzbl 0x3d(%eax),%edx
  100fa6:	83 e2 f0             	and    $0xfffffff0,%edx
  100fa9:	83 ca 0e             	or     $0xe,%edx
  100fac:	83 e2 8f             	and    $0xffffff8f,%edx
  100faf:	83 ca 80             	or     $0xffffff80,%edx
  100fb2:	88 50 3d             	mov    %dl,0x3d(%eax)
  100fb5:	c1 e9 10             	shr    $0x10,%ecx
  100fb8:	66 89 48 3e          	mov    %cx,0x3e(%eax)
	SETGATE(idt[T_DBLFLT],            0, CPU_GDT_KCODE, &Xdblflt,       0);
  100fbc:	c7 c1 80 1d 10 00    	mov    $0x101d80,%ecx
  100fc2:	66 89 48 40          	mov    %cx,0x40(%eax)
  100fc6:	66 c7 40 42 08 00    	movw   $0x8,0x42(%eax)
  100fcc:	c6 40 44 00          	movb   $0x0,0x44(%eax)
  100fd0:	0f b6 50 45          	movzbl 0x45(%eax),%edx
  100fd4:	83 e2 f0             	and    $0xfffffff0,%edx
  100fd7:	83 ca 0e             	or     $0xe,%edx
  100fda:	83 e2 8f             	and    $0xffffff8f,%edx
  100fdd:	83 ca 80             	or     $0xffffff80,%edx
  100fe0:	88 50 45             	mov    %dl,0x45(%eax)
  100fe3:	c1 e9 10             	shr    $0x10,%ecx
  100fe6:	66 89 48 46          	mov    %cx,0x46(%eax)
	SETGATE(idt[T_TSS],               0, CPU_GDT_KCODE, &Xtss,          0);
  100fea:	c7 c1 92 1d 10 00    	mov    $0x101d92,%ecx
  100ff0:	66 89 48 50          	mov    %cx,0x50(%eax)
  100ff4:	66 c7 40 52 08 00    	movw   $0x8,0x52(%eax)
  100ffa:	c6 40 54 00          	movb   $0x0,0x54(%eax)
  100ffe:	0f b6 50 55          	movzbl 0x55(%eax),%edx
  101002:	83 e2 f0             	and    $0xfffffff0,%edx
  101005:	83 ca 0e             	or     $0xe,%edx
  101008:	83 e2 8f             	and    $0xffffff8f,%edx
  10100b:	83 ca 80             	or     $0xffffff80,%edx
  10100e:	88 50 55             	mov    %dl,0x55(%eax)
  101011:	c1 e9 10             	shr    $0x10,%ecx
  101014:	66 89 48 56          	mov    %cx,0x56(%eax)
	SETGATE(idt[T_SEGNP],             0, CPU_GDT_KCODE, &Xsegnp,        0);
  101018:	c7 c1 9a 1d 10 00    	mov    $0x101d9a,%ecx
  10101e:	66 89 48 58          	mov    %cx,0x58(%eax)
  101022:	66 c7 40 5a 08 00    	movw   $0x8,0x5a(%eax)
  101028:	c6 40 5c 00          	movb   $0x0,0x5c(%eax)
  10102c:	0f b6 50 5d          	movzbl 0x5d(%eax),%edx
  101030:	83 e2 f0             	and    $0xfffffff0,%edx
  101033:	83 ca 0e             	or     $0xe,%edx
  101036:	83 e2 8f             	and    $0xffffff8f,%edx
  101039:	83 ca 80             	or     $0xffffff80,%edx
  10103c:	88 50 5d             	mov    %dl,0x5d(%eax)
  10103f:	c1 e9 10             	shr    $0x10,%ecx
  101042:	66 89 48 5e          	mov    %cx,0x5e(%eax)
	SETGATE(idt[T_STACK],             0, CPU_GDT_KCODE, &Xstack,        0);
  101046:	c7 c1 a2 1d 10 00    	mov    $0x101da2,%ecx
  10104c:	66 89 48 60          	mov    %cx,0x60(%eax)
  101050:	66 c7 40 62 08 00    	movw   $0x8,0x62(%eax)
  101056:	c6 40 64 00          	movb   $0x0,0x64(%eax)
  10105a:	0f b6 50 65          	movzbl 0x65(%eax),%edx
  10105e:	83 e2 f0             	and    $0xfffffff0,%edx
  101061:	83 ca 0e             	or     $0xe,%edx
  101064:	83 e2 8f             	and    $0xffffff8f,%edx
  101067:	83 ca 80             	or     $0xffffff80,%edx
  10106a:	88 50 65             	mov    %dl,0x65(%eax)
  10106d:	c1 e9 10             	shr    $0x10,%ecx
  101070:	66 89 48 66          	mov    %cx,0x66(%eax)
	SETGATE(idt[T_GPFLT],             0, CPU_GDT_KCODE, &Xgpflt,        0);
  101074:	c7 c1 aa 1d 10 00    	mov    $0x101daa,%ecx
  10107a:	66 89 48 68          	mov    %cx,0x68(%eax)
  10107e:	66 c7 40 6a 08 00    	movw   $0x8,0x6a(%eax)
  101084:	c6 40 6c 00          	movb   $0x0,0x6c(%eax)
  101088:	0f b6 50 6d          	movzbl 0x6d(%eax),%edx
  10108c:	83 e2 f0             	and    $0xfffffff0,%edx
  10108f:	83 ca 0e             	or     $0xe,%edx
  101092:	83 e2 8f             	and    $0xffffff8f,%edx
  101095:	83 ca 80             	or     $0xffffff80,%edx
  101098:	88 50 6d             	mov    %dl,0x6d(%eax)
  10109b:	c1 e9 10             	shr    $0x10,%ecx
  10109e:	66 89 48 6e          	mov    %cx,0x6e(%eax)
	SETGATE(idt[T_PGFLT],             0, CPU_GDT_KCODE, &Xpgflt,        0);
  1010a2:	c7 c1 b2 1d 10 00    	mov    $0x101db2,%ecx
  1010a8:	66 89 48 70          	mov    %cx,0x70(%eax)
  1010ac:	66 c7 40 72 08 00    	movw   $0x8,0x72(%eax)
  1010b2:	c6 40 74 00          	movb   $0x0,0x74(%eax)
  1010b6:	0f b6 50 75          	movzbl 0x75(%eax),%edx
  1010ba:	83 e2 f0             	and    $0xfffffff0,%edx
  1010bd:	83 ca 0e             	or     $0xe,%edx
  1010c0:	83 e2 8f             	and    $0xffffff8f,%edx
  1010c3:	83 ca 80             	or     $0xffffff80,%edx
  1010c6:	88 50 75             	mov    %dl,0x75(%eax)
  1010c9:	c1 e9 10             	shr    $0x10,%ecx
  1010cc:	66 89 48 76          	mov    %cx,0x76(%eax)
	SETGATE(idt[T_FPERR],             0, CPU_GDT_KCODE, &Xfperr,        0);
  1010d0:	c7 c1 c4 1d 10 00    	mov    $0x101dc4,%ecx
  1010d6:	66 89 88 80 00 00 00 	mov    %cx,0x80(%eax)
  1010dd:	66 c7 80 82 00 00 00 	movw   $0x8,0x82(%eax)
  1010e4:	08 00 
  1010e6:	c6 80 84 00 00 00 00 	movb   $0x0,0x84(%eax)
  1010ed:	0f b6 90 85 00 00 00 	movzbl 0x85(%eax),%edx
  1010f4:	83 e2 f0             	and    $0xfffffff0,%edx
  1010f7:	83 ca 0e             	or     $0xe,%edx
  1010fa:	83 e2 8f             	and    $0xffffff8f,%edx
  1010fd:	83 ca 80             	or     $0xffffff80,%edx
  101100:	88 90 85 00 00 00    	mov    %dl,0x85(%eax)
  101106:	c1 e9 10             	shr    $0x10,%ecx
  101109:	66 89 88 86 00 00 00 	mov    %cx,0x86(%eax)
	SETGATE(idt[T_ALIGN],             0, CPU_GDT_KCODE, &Xalign,        0);
  101110:	c7 c1 ce 1d 10 00    	mov    $0x101dce,%ecx
  101116:	66 89 88 88 00 00 00 	mov    %cx,0x88(%eax)
  10111d:	66 c7 80 8a 00 00 00 	movw   $0x8,0x8a(%eax)
  101124:	08 00 
  101126:	c6 80 8c 00 00 00 00 	movb   $0x0,0x8c(%eax)
  10112d:	0f b6 90 8d 00 00 00 	movzbl 0x8d(%eax),%edx
  101134:	83 e2 f0             	and    $0xfffffff0,%edx
  101137:	83 ca 0e             	or     $0xe,%edx
  10113a:	83 e2 8f             	and    $0xffffff8f,%edx
  10113d:	83 ca 80             	or     $0xffffff80,%edx
  101140:	88 90 8d 00 00 00    	mov    %dl,0x8d(%eax)
  101146:	c1 e9 10             	shr    $0x10,%ecx
  101149:	66 89 88 8e 00 00 00 	mov    %cx,0x8e(%eax)
	SETGATE(idt[T_MCHK],              0, CPU_GDT_KCODE, &Xmchk,         0);
  101150:	c7 c1 d2 1d 10 00    	mov    $0x101dd2,%ecx
  101156:	66 89 88 90 00 00 00 	mov    %cx,0x90(%eax)
  10115d:	66 c7 80 92 00 00 00 	movw   $0x8,0x92(%eax)
  101164:	08 00 
  101166:	c6 80 94 00 00 00 00 	movb   $0x0,0x94(%eax)
  10116d:	0f b6 90 95 00 00 00 	movzbl 0x95(%eax),%edx
  101174:	83 e2 f0             	and    $0xfffffff0,%edx
  101177:	83 ca 0e             	or     $0xe,%edx
  10117a:	83 e2 8f             	and    $0xffffff8f,%edx
  10117d:	83 ca 80             	or     $0xffffff80,%edx
  101180:	88 90 95 00 00 00    	mov    %dl,0x95(%eax)
  101186:	c1 e9 10             	shr    $0x10,%ecx
  101189:	66 89 88 96 00 00 00 	mov    %cx,0x96(%eax)

	SETGATE(idt[T_IRQ0+IRQ_TIMER],    0, CPU_GDT_KCODE, &Xirq_timer,    0);
  101190:	c7 c1 d8 1d 10 00    	mov    $0x101dd8,%ecx
  101196:	66 89 88 00 01 00 00 	mov    %cx,0x100(%eax)
  10119d:	66 c7 80 02 01 00 00 	movw   $0x8,0x102(%eax)
  1011a4:	08 00 
  1011a6:	c6 80 04 01 00 00 00 	movb   $0x0,0x104(%eax)
  1011ad:	0f b6 90 05 01 00 00 	movzbl 0x105(%eax),%edx
  1011b4:	83 e2 f0             	and    $0xfffffff0,%edx
  1011b7:	83 ca 0e             	or     $0xe,%edx
  1011ba:	83 e2 8f             	and    $0xffffff8f,%edx
  1011bd:	83 ca 80             	or     $0xffffff80,%edx
  1011c0:	88 90 05 01 00 00    	mov    %dl,0x105(%eax)
  1011c6:	c1 e9 10             	shr    $0x10,%ecx
  1011c9:	66 89 88 06 01 00 00 	mov    %cx,0x106(%eax)
	SETGATE(idt[T_IRQ0+IRQ_KBD],      0, CPU_GDT_KCODE, &Xirq_kbd,      0);
  1011d0:	c7 c1 de 1d 10 00    	mov    $0x101dde,%ecx
  1011d6:	66 89 88 08 01 00 00 	mov    %cx,0x108(%eax)
  1011dd:	66 c7 80 0a 01 00 00 	movw   $0x8,0x10a(%eax)
  1011e4:	08 00 
  1011e6:	c6 80 0c 01 00 00 00 	movb   $0x0,0x10c(%eax)
  1011ed:	0f b6 90 0d 01 00 00 	movzbl 0x10d(%eax),%edx
  1011f4:	83 e2 f0             	and    $0xfffffff0,%edx
  1011f7:	83 ca 0e             	or     $0xe,%edx
  1011fa:	83 e2 8f             	and    $0xffffff8f,%edx
  1011fd:	83 ca 80             	or     $0xffffff80,%edx
  101200:	88 90 0d 01 00 00    	mov    %dl,0x10d(%eax)
  101206:	c1 e9 10             	shr    $0x10,%ecx
  101209:	66 89 88 0e 01 00 00 	mov    %cx,0x10e(%eax)
	SETGATE(idt[T_IRQ0+IRQ_SLAVE],    0, CPU_GDT_KCODE, &Xirq_slave,    0);
  101210:	c7 c1 e4 1d 10 00    	mov    $0x101de4,%ecx
  101216:	66 89 88 10 01 00 00 	mov    %cx,0x110(%eax)
  10121d:	66 c7 80 12 01 00 00 	movw   $0x8,0x112(%eax)
  101224:	08 00 
  101226:	c6 80 14 01 00 00 00 	movb   $0x0,0x114(%eax)
  10122d:	0f b6 90 15 01 00 00 	movzbl 0x115(%eax),%edx
  101234:	83 e2 f0             	and    $0xfffffff0,%edx
  101237:	83 ca 0e             	or     $0xe,%edx
  10123a:	83 e2 8f             	and    $0xffffff8f,%edx
  10123d:	83 ca 80             	or     $0xffffff80,%edx
  101240:	88 90 15 01 00 00    	mov    %dl,0x115(%eax)
  101246:	c1 e9 10             	shr    $0x10,%ecx
  101249:	66 89 88 16 01 00 00 	mov    %cx,0x116(%eax)
	SETGATE(idt[T_IRQ0+IRQ_SERIAL24], 0, CPU_GDT_KCODE, &Xirq_serial2,  0);
  101250:	c7 c1 ea 1d 10 00    	mov    $0x101dea,%ecx
  101256:	66 89 88 18 01 00 00 	mov    %cx,0x118(%eax)
  10125d:	66 c7 80 1a 01 00 00 	movw   $0x8,0x11a(%eax)
  101264:	08 00 
  101266:	c6 80 1c 01 00 00 00 	movb   $0x0,0x11c(%eax)
  10126d:	0f b6 90 1d 01 00 00 	movzbl 0x11d(%eax),%edx
  101274:	83 e2 f0             	and    $0xfffffff0,%edx
  101277:	83 ca 0e             	or     $0xe,%edx
  10127a:	83 e2 8f             	and    $0xffffff8f,%edx
  10127d:	83 ca 80             	or     $0xffffff80,%edx
  101280:	88 90 1d 01 00 00    	mov    %dl,0x11d(%eax)
  101286:	c1 e9 10             	shr    $0x10,%ecx
  101289:	66 89 88 1e 01 00 00 	mov    %cx,0x11e(%eax)
	SETGATE(idt[T_IRQ0+IRQ_SERIAL13], 0, CPU_GDT_KCODE, &Xirq_serial1,  0);
  101290:	c7 c1 f0 1d 10 00    	mov    $0x101df0,%ecx
  101296:	66 89 88 20 01 00 00 	mov    %cx,0x120(%eax)
  10129d:	66 c7 80 22 01 00 00 	movw   $0x8,0x122(%eax)
  1012a4:	08 00 
  1012a6:	c6 80 24 01 00 00 00 	movb   $0x0,0x124(%eax)
  1012ad:	0f b6 90 25 01 00 00 	movzbl 0x125(%eax),%edx
  1012b4:	83 e2 f0             	and    $0xfffffff0,%edx
  1012b7:	83 ca 0e             	or     $0xe,%edx
  1012ba:	83 e2 8f             	and    $0xffffff8f,%edx
  1012bd:	83 ca 80             	or     $0xffffff80,%edx
  1012c0:	88 90 25 01 00 00    	mov    %dl,0x125(%eax)
  1012c6:	c1 e9 10             	shr    $0x10,%ecx
  1012c9:	66 89 88 26 01 00 00 	mov    %cx,0x126(%eax)
	SETGATE(idt[T_IRQ0+IRQ_LPT2],     0, CPU_GDT_KCODE, &Xirq_lpt,      0);
  1012d0:	c7 c1 f6 1d 10 00    	mov    $0x101df6,%ecx
  1012d6:	66 89 88 28 01 00 00 	mov    %cx,0x128(%eax)
  1012dd:	66 c7 80 2a 01 00 00 	movw   $0x8,0x12a(%eax)
  1012e4:	08 00 
  1012e6:	c6 80 2c 01 00 00 00 	movb   $0x0,0x12c(%eax)
  1012ed:	0f b6 90 2d 01 00 00 	movzbl 0x12d(%eax),%edx
  1012f4:	83 e2 f0             	and    $0xfffffff0,%edx
  1012f7:	83 ca 0e             	or     $0xe,%edx
  1012fa:	83 e2 8f             	and    $0xffffff8f,%edx
  1012fd:	83 ca 80             	or     $0xffffff80,%edx
  101300:	88 90 2d 01 00 00    	mov    %dl,0x12d(%eax)
  101306:	c1 e9 10             	shr    $0x10,%ecx
  101309:	66 89 88 2e 01 00 00 	mov    %cx,0x12e(%eax)
	SETGATE(idt[T_IRQ0+IRQ_FLOPPY],   0, CPU_GDT_KCODE, &Xirq_floppy,   0);
  101310:	c7 c1 fc 1d 10 00    	mov    $0x101dfc,%ecx
  101316:	66 89 88 30 01 00 00 	mov    %cx,0x130(%eax)
  10131d:	66 c7 80 32 01 00 00 	movw   $0x8,0x132(%eax)
  101324:	08 00 
  101326:	c6 80 34 01 00 00 00 	movb   $0x0,0x134(%eax)
  10132d:	0f b6 90 35 01 00 00 	movzbl 0x135(%eax),%edx
  101334:	83 e2 f0             	and    $0xfffffff0,%edx
  101337:	83 ca 0e             	or     $0xe,%edx
  10133a:	83 e2 8f             	and    $0xffffff8f,%edx
  10133d:	83 ca 80             	or     $0xffffff80,%edx
  101340:	88 90 35 01 00 00    	mov    %dl,0x135(%eax)
  101346:	c1 e9 10             	shr    $0x10,%ecx
  101349:	66 89 88 36 01 00 00 	mov    %cx,0x136(%eax)
	SETGATE(idt[T_IRQ0+IRQ_SPURIOUS], 0, CPU_GDT_KCODE, &Xirq_spurious, 0);
  101350:	c7 c1 02 1e 10 00    	mov    $0x101e02,%ecx
  101356:	66 89 88 38 01 00 00 	mov    %cx,0x138(%eax)
  10135d:	66 c7 80 3a 01 00 00 	movw   $0x8,0x13a(%eax)
  101364:	08 00 
  101366:	c6 80 3c 01 00 00 00 	movb   $0x0,0x13c(%eax)
  10136d:	0f b6 90 3d 01 00 00 	movzbl 0x13d(%eax),%edx
  101374:	83 e2 f0             	and    $0xfffffff0,%edx
  101377:	83 ca 0e             	or     $0xe,%edx
  10137a:	83 e2 8f             	and    $0xffffff8f,%edx
  10137d:	83 ca 80             	or     $0xffffff80,%edx
  101380:	88 90 3d 01 00 00    	mov    %dl,0x13d(%eax)
  101386:	c1 e9 10             	shr    $0x10,%ecx
  101389:	66 89 88 3e 01 00 00 	mov    %cx,0x13e(%eax)
	SETGATE(idt[T_IRQ0+IRQ_RTC],      0, CPU_GDT_KCODE, &Xirq_rtc,      0);
  101390:	c7 c1 08 1e 10 00    	mov    $0x101e08,%ecx
  101396:	66 89 88 40 01 00 00 	mov    %cx,0x140(%eax)
  10139d:	66 c7 80 42 01 00 00 	movw   $0x8,0x142(%eax)
  1013a4:	08 00 
  1013a6:	c6 80 44 01 00 00 00 	movb   $0x0,0x144(%eax)
  1013ad:	0f b6 90 45 01 00 00 	movzbl 0x145(%eax),%edx
  1013b4:	83 e2 f0             	and    $0xfffffff0,%edx
  1013b7:	83 ca 0e             	or     $0xe,%edx
  1013ba:	83 e2 8f             	and    $0xffffff8f,%edx
  1013bd:	83 ca 80             	or     $0xffffff80,%edx
  1013c0:	88 90 45 01 00 00    	mov    %dl,0x145(%eax)
  1013c6:	c1 e9 10             	shr    $0x10,%ecx
  1013c9:	66 89 88 46 01 00 00 	mov    %cx,0x146(%eax)
	SETGATE(idt[T_IRQ0+9],            0, CPU_GDT_KCODE, &Xirq9,         0);
  1013d0:	c7 c1 0e 1e 10 00    	mov    $0x101e0e,%ecx
  1013d6:	66 89 88 48 01 00 00 	mov    %cx,0x148(%eax)
  1013dd:	66 c7 80 4a 01 00 00 	movw   $0x8,0x14a(%eax)
  1013e4:	08 00 
  1013e6:	c6 80 4c 01 00 00 00 	movb   $0x0,0x14c(%eax)
  1013ed:	0f b6 90 4d 01 00 00 	movzbl 0x14d(%eax),%edx
  1013f4:	83 e2 f0             	and    $0xfffffff0,%edx
  1013f7:	83 ca 0e             	or     $0xe,%edx
  1013fa:	83 e2 8f             	and    $0xffffff8f,%edx
  1013fd:	83 ca 80             	or     $0xffffff80,%edx
  101400:	88 90 4d 01 00 00    	mov    %dl,0x14d(%eax)
  101406:	c1 e9 10             	shr    $0x10,%ecx
  101409:	66 89 88 4e 01 00 00 	mov    %cx,0x14e(%eax)
	SETGATE(idt[T_IRQ0+10],           0, CPU_GDT_KCODE, &Xirq10,        0);
  101410:	c7 c2 14 1e 10 00    	mov    $0x101e14,%edx
  101416:	66 89 90 50 01 00 00 	mov    %dx,0x150(%eax)
  10141d:	66 c7 80 52 01 00 00 	movw   $0x8,0x152(%eax)
  101424:	08 00 
  101426:	c6 80 54 01 00 00 00 	movb   $0x0,0x154(%eax)
  10142d:	0f b6 90 55 01 00 00 	movzbl 0x155(%eax),%edx
  101434:	83 e2 f0             	and    $0xfffffff0,%edx
  101437:	83 ca 0e             	or     $0xe,%edx
  10143a:	83 e2 8f             	and    $0xffffff8f,%edx
  10143d:	83 ca 80             	or     $0xffffff80,%edx
  101440:	88 90 55 01 00 00    	mov    %dl,0x155(%eax)
  101446:	c7 c7 14 1e 10 00    	mov    $0x101e14,%edi
  10144c:	89 3c 24             	mov    %edi,(%esp)
  10144f:	89 fa                	mov    %edi,%edx
  101451:	c1 ea 10             	shr    $0x10,%edx
  101454:	66 89 90 56 01 00 00 	mov    %dx,0x156(%eax)
	SETGATE(idt[T_IRQ0+11],           0, CPU_GDT_KCODE, &Xirq11,        0);
  10145b:	c7 c1 1a 1e 10 00    	mov    $0x101e1a,%ecx
  101461:	66 89 88 58 01 00 00 	mov    %cx,0x158(%eax)
  101468:	66 c7 80 5a 01 00 00 	movw   $0x8,0x15a(%eax)
  10146f:	08 00 
  101471:	c6 80 5c 01 00 00 00 	movb   $0x0,0x15c(%eax)
  101478:	0f b6 90 5d 01 00 00 	movzbl 0x15d(%eax),%edx
  10147f:	83 e2 f0             	and    $0xfffffff0,%edx
  101482:	83 ca 0e             	or     $0xe,%edx
  101485:	83 e2 8f             	and    $0xffffff8f,%edx
  101488:	83 ca 80             	or     $0xffffff80,%edx
  10148b:	88 90 5d 01 00 00    	mov    %dl,0x15d(%eax)
  101491:	c1 e9 10             	shr    $0x10,%ecx
  101494:	66 89 88 5e 01 00 00 	mov    %cx,0x15e(%eax)
	SETGATE(idt[T_IRQ0+IRQ_MOUSE],    0, CPU_GDT_KCODE, &Xirq_mouse,    0);
  10149b:	c7 c1 20 1e 10 00    	mov    $0x101e20,%ecx
  1014a1:	66 89 88 60 01 00 00 	mov    %cx,0x160(%eax)
  1014a8:	66 c7 80 62 01 00 00 	movw   $0x8,0x162(%eax)
  1014af:	08 00 
  1014b1:	c6 80 64 01 00 00 00 	movb   $0x0,0x164(%eax)
  1014b8:	0f b6 90 65 01 00 00 	movzbl 0x165(%eax),%edx
  1014bf:	83 e2 f0             	and    $0xfffffff0,%edx
  1014c2:	83 ca 0e             	or     $0xe,%edx
  1014c5:	83 e2 8f             	and    $0xffffff8f,%edx
  1014c8:	83 ca 80             	or     $0xffffff80,%edx
  1014cb:	88 90 65 01 00 00    	mov    %dl,0x165(%eax)
  1014d1:	c1 e9 10             	shr    $0x10,%ecx
  1014d4:	66 89 88 66 01 00 00 	mov    %cx,0x166(%eax)
	SETGATE(idt[T_IRQ0+IRQ_COPROCESSOR], 0, CPU_GDT_KCODE, &Xirq_coproc, 0);
  1014db:	c7 c1 26 1e 10 00    	mov    $0x101e26,%ecx
  1014e1:	66 89 88 68 01 00 00 	mov    %cx,0x168(%eax)
  1014e8:	66 c7 80 6a 01 00 00 	movw   $0x8,0x16a(%eax)
  1014ef:	08 00 
  1014f1:	c6 80 6c 01 00 00 00 	movb   $0x0,0x16c(%eax)
  1014f8:	0f b6 90 6d 01 00 00 	movzbl 0x16d(%eax),%edx
  1014ff:	83 e2 f0             	and    $0xfffffff0,%edx
  101502:	83 ca 0e             	or     $0xe,%edx
  101505:	83 e2 8f             	and    $0xffffff8f,%edx
  101508:	83 ca 80             	or     $0xffffff80,%edx
  10150b:	88 90 6d 01 00 00    	mov    %dl,0x16d(%eax)
  101511:	c1 e9 10             	shr    $0x10,%ecx
  101514:	66 89 88 6e 01 00 00 	mov    %cx,0x16e(%eax)
	SETGATE(idt[T_IRQ0+IRQ_IDE1],     0, CPU_GDT_KCODE, &Xirq_ide1,     0);
  10151b:	c7 c1 2c 1e 10 00    	mov    $0x101e2c,%ecx
  101521:	66 89 88 70 01 00 00 	mov    %cx,0x170(%eax)
  101528:	66 c7 80 72 01 00 00 	movw   $0x8,0x172(%eax)
  10152f:	08 00 
  101531:	c6 80 74 01 00 00 00 	movb   $0x0,0x174(%eax)
  101538:	0f b6 90 75 01 00 00 	movzbl 0x175(%eax),%edx
  10153f:	83 e2 f0             	and    $0xfffffff0,%edx
  101542:	83 ca 0e             	or     $0xe,%edx
  101545:	83 e2 8f             	and    $0xffffff8f,%edx
  101548:	83 ca 80             	or     $0xffffff80,%edx
  10154b:	88 90 75 01 00 00    	mov    %dl,0x175(%eax)
  101551:	c1 e9 10             	shr    $0x10,%ecx
  101554:	66 89 88 76 01 00 00 	mov    %cx,0x176(%eax)
	SETGATE(idt[T_IRQ0+IRQ_IDE2],     0, CPU_GDT_KCODE, &Xirq_ide2,     0);
  10155b:	c7 c1 32 1e 10 00    	mov    $0x101e32,%ecx
  101561:	66 89 88 78 01 00 00 	mov    %cx,0x178(%eax)
  101568:	66 c7 80 7a 01 00 00 	movw   $0x8,0x17a(%eax)
  10156f:	08 00 
  101571:	c6 80 7c 01 00 00 00 	movb   $0x0,0x17c(%eax)
  101578:	0f b6 90 7d 01 00 00 	movzbl 0x17d(%eax),%edx
  10157f:	83 e2 f0             	and    $0xfffffff0,%edx
  101582:	83 ca 0e             	or     $0xe,%edx
  101585:	83 e2 8f             	and    $0xffffff8f,%edx
  101588:	83 ca 80             	or     $0xffffff80,%edx
  10158b:	88 90 7d 01 00 00    	mov    %dl,0x17d(%eax)
  101591:	c1 e9 10             	shr    $0x10,%ecx
  101594:	66 89 88 7e 01 00 00 	mov    %cx,0x17e(%eax)

	// Use DPL=3 here because system calls are explicitly invoked
	// by the user process (with "int $T_SYSCALL").
	SETGATE(idt[T_SYSCALL],           0, CPU_GDT_KCODE, &Xsyscall,      3);
  10159b:	c7 c1 38 1e 10 00    	mov    $0x101e38,%ecx
  1015a1:	66 89 88 80 01 00 00 	mov    %cx,0x180(%eax)
  1015a8:	66 c7 80 82 01 00 00 	movw   $0x8,0x182(%eax)
  1015af:	08 00 
  1015b1:	c6 80 84 01 00 00 00 	movb   $0x0,0x184(%eax)
  1015b8:	0f b6 90 85 01 00 00 	movzbl 0x185(%eax),%edx
  1015bf:	83 e2 f0             	and    $0xfffffff0,%edx
  1015c2:	83 ca 0e             	or     $0xe,%edx
  1015c5:	83 e2 ef             	and    $0xffffffef,%edx
  1015c8:	83 ca e0             	or     $0xffffffe0,%edx
  1015cb:	88 90 85 01 00 00    	mov    %dl,0x185(%eax)
  1015d1:	c1 e9 10             	shr    $0x10,%ecx
  1015d4:	66 89 88 86 01 00 00 	mov    %cx,0x186(%eax)

	/* default */
	SETGATE(idt[T_DEFAULT],           0, CPU_GDT_KCODE, &Xdefault,      0);
  1015db:	c7 c1 3e 1e 10 00    	mov    $0x101e3e,%ecx
  1015e1:	66 89 88 f0 07 00 00 	mov    %cx,0x7f0(%eax)
  1015e8:	66 c7 80 f2 07 00 00 	movw   $0x8,0x7f2(%eax)
  1015ef:	08 00 
  1015f1:	c6 80 f4 07 00 00 00 	movb   $0x0,0x7f4(%eax)
  1015f8:	0f b6 90 f5 07 00 00 	movzbl 0x7f5(%eax),%edx
  1015ff:	83 e2 f0             	and    $0xfffffff0,%edx
  101602:	83 ca 0e             	or     $0xe,%edx
  101605:	83 e2 8f             	and    $0xffffff8f,%edx
  101608:	83 ca 80             	or     $0xffffff80,%edx
  10160b:	88 90 f5 07 00 00    	mov    %dl,0x7f5(%eax)
  101611:	c1 e9 10             	shr    $0x10,%ecx
  101614:	66 89 88 f6 07 00 00 	mov    %cx,0x7f6(%eax)

	asm volatile("lidt %0" : : "m" (idt_pd));
  10161b:	0f 01 9e 20 03 00 00 	lidtl  0x320(%esi)
}
  101622:	83 c4 04             	add    $0x4,%esp
  101625:	5b                   	pop    %ebx
  101626:	5e                   	pop    %esi
  101627:	5f                   	pop    %edi
  101628:	5d                   	pop    %ebp
  101629:	c3                   	ret    

0010162a <intr_init>:

void
intr_init(void)
{
  10162a:	53                   	push   %ebx
  10162b:	83 ec 08             	sub    $0x8,%esp
  10162e:	e8 e8 ec ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  101633:	81 c3 cd 89 00 00    	add    $0x89cd,%ebx
	if (intr_inited == TRUE)
  101639:	0f b6 83 40 6e 02 00 	movzbl 0x26e40(%ebx),%eax
  101640:	3c 01                	cmp    $0x1,%al
  101642:	74 11                	je     101655 <intr_init+0x2b>
		return;

  pic_init();
  101644:	e8 89 00 00 00       	call   1016d2 <pic_init>
	intr_init_idt();
  101649:	e8 9b f7 ff ff       	call   100de9 <intr_init_idt>
	intr_inited = TRUE;
  10164e:	c6 83 40 6e 02 00 01 	movb   $0x1,0x26e40(%ebx)
}
  101655:	83 c4 08             	add    $0x8,%esp
  101658:	5b                   	pop    %ebx
  101659:	c3                   	ret    

0010165a <intr_enable>:

void
intr_enable(uint8_t irq)
{
  10165a:	53                   	push   %ebx
  10165b:	83 ec 08             	sub    $0x8,%esp
  10165e:	e8 b8 ec ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  101663:	81 c3 9d 89 00 00    	add    $0x899d,%ebx
  101669:	8b 44 24 10          	mov    0x10(%esp),%eax
	if (irq >= 16)
  10166d:	3c 0f                	cmp    $0xf,%al
  10166f:	76 05                	jbe    101676 <intr_enable+0x1c>
		return;
	pic_enable(irq);
}
  101671:	83 c4 08             	add    $0x8,%esp
  101674:	5b                   	pop    %ebx
  101675:	c3                   	ret    
	pic_enable(irq);
  101676:	83 ec 0c             	sub    $0xc,%esp
  101679:	0f b6 c0             	movzbl %al,%eax
  10167c:	50                   	push   %eax
  10167d:	e8 a0 01 00 00       	call   101822 <pic_enable>
  101682:	83 c4 10             	add    $0x10,%esp
  101685:	eb ea                	jmp    101671 <intr_enable+0x17>

00101687 <intr_eoi>:

void
intr_eoi(void)
{
  101687:	53                   	push   %ebx
  101688:	83 ec 08             	sub    $0x8,%esp
  10168b:	e8 8b ec ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  101690:	81 c3 70 89 00 00    	add    $0x8970,%ebx
	pic_eoi();
  101696:	e8 b6 01 00 00       	call   101851 <pic_eoi>
}
  10169b:	83 c4 08             	add    $0x8,%esp
  10169e:	5b                   	pop    %ebx
  10169f:	c3                   	ret    

001016a0 <intr_local_enable>:

void
intr_local_enable(void)
{
  1016a0:	53                   	push   %ebx
  1016a1:	83 ec 08             	sub    $0x8,%esp
  1016a4:	e8 72 ec ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  1016a9:	81 c3 57 89 00 00    	add    $0x8957,%ebx
	sti();
  1016af:	e8 24 13 00 00       	call   1029d8 <sti>
}
  1016b4:	83 c4 08             	add    $0x8,%esp
  1016b7:	5b                   	pop    %ebx
  1016b8:	c3                   	ret    

001016b9 <intr_local_disable>:

void
intr_local_disable(void)
{
  1016b9:	53                   	push   %ebx
  1016ba:	83 ec 08             	sub    $0x8,%esp
  1016bd:	e8 59 ec ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  1016c2:	81 c3 3e 89 00 00    	add    $0x893e,%ebx
	cli();
  1016c8:	e8 09 13 00 00       	call   1029d6 <cli>
}
  1016cd:	83 c4 08             	add    $0x8,%esp
  1016d0:	5b                   	pop    %ebx
  1016d1:	c3                   	ret    

001016d2 <pic_init>:
static bool pic_inited = FALSE;

/* Initialize the 8259A interrupt controllers. */
void
pic_init(void)
{
  1016d2:	53                   	push   %ebx
  1016d3:	83 ec 08             	sub    $0x8,%esp
  1016d6:	e8 40 ec ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  1016db:	81 c3 25 89 00 00    	add    $0x8925,%ebx
	if (pic_inited == TRUE)		// only do once on bootstrap CPU
  1016e1:	80 bb 41 6e 02 00 01 	cmpb   $0x1,0x26e41(%ebx)
  1016e8:	0f 84 ee 00 00 00    	je     1017dc <pic_init+0x10a>
		return;
	pic_inited = TRUE;
  1016ee:	c6 83 41 6e 02 00 01 	movb   $0x1,0x26e41(%ebx)

	/* mask all interrupts */
	outb(IO_PIC1+1, 0xff);
  1016f5:	83 ec 08             	sub    $0x8,%esp
  1016f8:	68 ff 00 00 00       	push   $0xff
  1016fd:	6a 21                	push   $0x21
  1016ff:	e8 99 13 00 00       	call   102a9d <outb>
	outb(IO_PIC2+1, 0xff);
  101704:	83 c4 08             	add    $0x8,%esp
  101707:	68 ff 00 00 00       	push   $0xff
  10170c:	68 a1 00 00 00       	push   $0xa1
  101711:	e8 87 13 00 00       	call   102a9d <outb>

	// ICW1:  0001g0hi
	//    g:  0 = edge triggering, 1 = level triggering
	//    h:  0 = cascaded PICs, 1 = master only
	//    i:  0 = no ICW4, 1 = ICW4 required
	outb(IO_PIC1, 0x11);
  101716:	83 c4 08             	add    $0x8,%esp
  101719:	6a 11                	push   $0x11
  10171b:	6a 20                	push   $0x20
  10171d:	e8 7b 13 00 00       	call   102a9d <outb>

	// ICW2:  Vector offset
	outb(IO_PIC1+1, T_IRQ0);
  101722:	83 c4 08             	add    $0x8,%esp
  101725:	6a 20                	push   $0x20
  101727:	6a 21                	push   $0x21
  101729:	e8 6f 13 00 00       	call   102a9d <outb>

	// ICW3:  bit mask of IR lines connected to slave PICs (master PIC),
	//        3-bit No of IR line at which slave connects to master(slave PIC).
	outb(IO_PIC1+1, 1<<IRQ_SLAVE);
  10172e:	83 c4 08             	add    $0x8,%esp
  101731:	6a 04                	push   $0x4
  101733:	6a 21                	push   $0x21
  101735:	e8 63 13 00 00       	call   102a9d <outb>
	//    m:  0 = slave PIC, 1 = master PIC
	//	  (ignored when b is 0, as the master/slave role
	//	  can be hardwired).
	//    a:  1 = Automatic EOI mode
	//    p:  0 = MCS-80/85 mode, 1 = intel x86 mode
	outb(IO_PIC1+1, 0x1);
  10173a:	83 c4 08             	add    $0x8,%esp
  10173d:	6a 01                	push   $0x1
  10173f:	6a 21                	push   $0x21
  101741:	e8 57 13 00 00       	call   102a9d <outb>

	// Set up slave (8259A-2)
	outb(IO_PIC2, 0x11);			// ICW1
  101746:	83 c4 08             	add    $0x8,%esp
  101749:	6a 11                	push   $0x11
  10174b:	68 a0 00 00 00       	push   $0xa0
  101750:	e8 48 13 00 00       	call   102a9d <outb>
	outb(IO_PIC2+1, T_IRQ0 + 8);		// ICW2
  101755:	83 c4 08             	add    $0x8,%esp
  101758:	6a 28                	push   $0x28
  10175a:	68 a1 00 00 00       	push   $0xa1
  10175f:	e8 39 13 00 00       	call   102a9d <outb>
	outb(IO_PIC2+1, IRQ_SLAVE);		// ICW3
  101764:	83 c4 08             	add    $0x8,%esp
  101767:	6a 02                	push   $0x2
  101769:	68 a1 00 00 00       	push   $0xa1
  10176e:	e8 2a 13 00 00       	call   102a9d <outb>
	// NB Automatic EOI mode doesn't tend to work on the slave.
	// Linux source code says it's "to be investigated".
	outb(IO_PIC2+1, 0x01);			// ICW4
  101773:	83 c4 08             	add    $0x8,%esp
  101776:	6a 01                	push   $0x1
  101778:	68 a1 00 00 00       	push   $0xa1
  10177d:	e8 1b 13 00 00       	call   102a9d <outb>

	// OCW3:  0ef01prs
	//   ef:  0x = NOP, 10 = clear specific mask, 11 = set specific mask
	//    p:  0 = no polling, 1 = polling mode
	//   rs:  0x = NOP, 10 = read IRR, 11 = read ISR
	outb(IO_PIC1, 0x68);             /* clear specific mask */
  101782:	83 c4 08             	add    $0x8,%esp
  101785:	6a 68                	push   $0x68
  101787:	6a 20                	push   $0x20
  101789:	e8 0f 13 00 00       	call   102a9d <outb>
	outb(IO_PIC1, 0x0a);             /* read IRR by default */
  10178e:	83 c4 08             	add    $0x8,%esp
  101791:	6a 0a                	push   $0xa
  101793:	6a 20                	push   $0x20
  101795:	e8 03 13 00 00       	call   102a9d <outb>

	outb(IO_PIC2, 0x68);               /* OCW3 */
  10179a:	83 c4 08             	add    $0x8,%esp
  10179d:	6a 68                	push   $0x68
  10179f:	68 a0 00 00 00       	push   $0xa0
  1017a4:	e8 f4 12 00 00       	call   102a9d <outb>
	outb(IO_PIC2, 0x0a);               /* OCW3 */
  1017a9:	83 c4 08             	add    $0x8,%esp
  1017ac:	6a 0a                	push   $0xa
  1017ae:	68 a0 00 00 00       	push   $0xa0
  1017b3:	e8 e5 12 00 00       	call   102a9d <outb>

	// mask all interrupts
	outb(IO_PIC1+1, 0xFF);
  1017b8:	83 c4 08             	add    $0x8,%esp
  1017bb:	68 ff 00 00 00       	push   $0xff
  1017c0:	6a 21                	push   $0x21
  1017c2:	e8 d6 12 00 00       	call   102a9d <outb>
	outb(IO_PIC2+1, 0xFF);
  1017c7:	83 c4 08             	add    $0x8,%esp
  1017ca:	68 ff 00 00 00       	push   $0xff
  1017cf:	68 a1 00 00 00       	push   $0xa1
  1017d4:	e8 c4 12 00 00       	call   102a9d <outb>
  1017d9:	83 c4 10             	add    $0x10,%esp
}
  1017dc:	83 c4 08             	add    $0x8,%esp
  1017df:	5b                   	pop    %ebx
  1017e0:	c3                   	ret    

001017e1 <pic_setmask>:

void
pic_setmask(uint16_t mask)
{
  1017e1:	56                   	push   %esi
  1017e2:	53                   	push   %ebx
  1017e3:	83 ec 0c             	sub    $0xc,%esp
  1017e6:	e8 30 eb ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  1017eb:	81 c3 15 88 00 00    	add    $0x8815,%ebx
  1017f1:	8b 74 24 18          	mov    0x18(%esp),%esi
	irqmask = mask;
  1017f5:	66 89 b3 26 03 00 00 	mov    %si,0x326(%ebx)
	outb(IO_PIC1+1, (char)mask);
  1017fc:	89 f0                	mov    %esi,%eax
  1017fe:	0f b6 c0             	movzbl %al,%eax
  101801:	50                   	push   %eax
  101802:	6a 21                	push   $0x21
  101804:	e8 94 12 00 00       	call   102a9d <outb>
	outb(IO_PIC2+1, (char)(mask >> 8));
  101809:	83 c4 08             	add    $0x8,%esp
  10180c:	89 f0                	mov    %esi,%eax
  10180e:	0f b6 f4             	movzbl %ah,%esi
  101811:	56                   	push   %esi
  101812:	68 a1 00 00 00       	push   $0xa1
  101817:	e8 81 12 00 00       	call   102a9d <outb>
}
  10181c:	83 c4 14             	add    $0x14,%esp
  10181f:	5b                   	pop    %ebx
  101820:	5e                   	pop    %esi
  101821:	c3                   	ret    

00101822 <pic_enable>:

void
pic_enable(int irq)
{
  101822:	83 ec 18             	sub    $0x18,%esp
  101825:	e8 bb f5 ff ff       	call   100de5 <__x86.get_pc_thunk.dx>
  10182a:	81 c2 d6 87 00 00    	add    $0x87d6,%edx
	pic_setmask(irqmask & ~(1 << irq));
  101830:	b8 01 00 00 00       	mov    $0x1,%eax
  101835:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
  101839:	d3 e0                	shl    %cl,%eax
  10183b:	f7 d0                	not    %eax
  10183d:	66 23 82 26 03 00 00 	and    0x326(%edx),%ax
  101844:	0f b7 c0             	movzwl %ax,%eax
  101847:	50                   	push   %eax
  101848:	e8 94 ff ff ff       	call   1017e1 <pic_setmask>
}
  10184d:	83 c4 1c             	add    $0x1c,%esp
  101850:	c3                   	ret    

00101851 <pic_eoi>:

void
pic_eoi(void)
{
  101851:	53                   	push   %ebx
  101852:	83 ec 10             	sub    $0x10,%esp
  101855:	e8 c1 ea ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  10185a:	81 c3 a6 87 00 00    	add    $0x87a6,%ebx
	// OCW2: rse00xxx
	//   r: rotate
	//   s: specific
	//   e: end-of-interrupt
	// xxx: specific interrupt line
	outb(IO_PIC1, 0x20);
  101860:	6a 20                	push   $0x20
  101862:	6a 20                	push   $0x20
  101864:	e8 34 12 00 00       	call   102a9d <outb>
	outb(IO_PIC2, 0x20);
  101869:	83 c4 08             	add    $0x8,%esp
  10186c:	6a 20                	push   $0x20
  10186e:	68 a0 00 00 00       	push   $0xa0
  101873:	e8 25 12 00 00       	call   102a9d <outb>
}
  101878:	83 c4 18             	add    $0x18,%esp
  10187b:	5b                   	pop    %ebx
  10187c:	c3                   	ret    

0010187d <pic_reset>:

void
pic_reset(void)
{
  10187d:	53                   	push   %ebx
  10187e:	83 ec 10             	sub    $0x10,%esp
  101881:	e8 95 ea ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  101886:	81 c3 7a 87 00 00    	add    $0x877a,%ebx
	// mask all interrupts
	outb(IO_PIC1+1, 0x00);
  10188c:	6a 00                	push   $0x0
  10188e:	6a 21                	push   $0x21
  101890:	e8 08 12 00 00       	call   102a9d <outb>
	outb(IO_PIC2+1, 0x00);
  101895:	83 c4 08             	add    $0x8,%esp
  101898:	6a 00                	push   $0x0
  10189a:	68 a1 00 00 00       	push   $0xa1
  10189f:	e8 f9 11 00 00       	call   102a9d <outb>

	// ICW1:  0001g0hi
	//    g:  0 = edge triggering, 1 = level triggering
	//    h:  0 = cascaded PICs, 1 = master only
	//    i:  0 = no ICW4, 1 = ICW4 required
	outb(IO_PIC1, 0x11);
  1018a4:	83 c4 08             	add    $0x8,%esp
  1018a7:	6a 11                	push   $0x11
  1018a9:	6a 20                	push   $0x20
  1018ab:	e8 ed 11 00 00       	call   102a9d <outb>

	// ICW2:  Vector offset
	outb(IO_PIC1+1, T_IRQ0);
  1018b0:	83 c4 08             	add    $0x8,%esp
  1018b3:	6a 20                	push   $0x20
  1018b5:	6a 21                	push   $0x21
  1018b7:	e8 e1 11 00 00       	call   102a9d <outb>

	// ICW3:  bit mask of IR lines connected to slave PICs (master PIC),
	//        3-bit No of IR line at which slave connects to master(slave PIC).
	outb(IO_PIC1+1, 1<<IRQ_SLAVE);
  1018bc:	83 c4 08             	add    $0x8,%esp
  1018bf:	6a 04                	push   $0x4
  1018c1:	6a 21                	push   $0x21
  1018c3:	e8 d5 11 00 00       	call   102a9d <outb>
	//    m:  0 = slave PIC, 1 = master PIC
	//	  (ignored when b is 0, as the master/slave role
	//	  can be hardwired).
	//    a:  1 = Automatic EOI mode
	//    p:  0 = MCS-80/85 mode, 1 = intel x86 mode
	outb(IO_PIC1+1, 0x3);
  1018c8:	83 c4 08             	add    $0x8,%esp
  1018cb:	6a 03                	push   $0x3
  1018cd:	6a 21                	push   $0x21
  1018cf:	e8 c9 11 00 00       	call   102a9d <outb>

	// Set up slave (8259A-2)
	outb(IO_PIC2, 0x11);			// ICW1
  1018d4:	83 c4 08             	add    $0x8,%esp
  1018d7:	6a 11                	push   $0x11
  1018d9:	68 a0 00 00 00       	push   $0xa0
  1018de:	e8 ba 11 00 00       	call   102a9d <outb>
	outb(IO_PIC2+1, T_IRQ0 + 8);		// ICW2
  1018e3:	83 c4 08             	add    $0x8,%esp
  1018e6:	6a 28                	push   $0x28
  1018e8:	68 a1 00 00 00       	push   $0xa1
  1018ed:	e8 ab 11 00 00       	call   102a9d <outb>
	outb(IO_PIC2+1, IRQ_SLAVE);		// ICW3
  1018f2:	83 c4 08             	add    $0x8,%esp
  1018f5:	6a 02                	push   $0x2
  1018f7:	68 a1 00 00 00       	push   $0xa1
  1018fc:	e8 9c 11 00 00       	call   102a9d <outb>
	// NB Automatic EOI mode doesn't tend to work on the slave.
	// Linux source code says it's "to be investigated".
	outb(IO_PIC2+1, 0x01);			// ICW4
  101901:	83 c4 08             	add    $0x8,%esp
  101904:	6a 01                	push   $0x1
  101906:	68 a1 00 00 00       	push   $0xa1
  10190b:	e8 8d 11 00 00       	call   102a9d <outb>

	// OCW3:  0ef01prs
	//   ef:  0x = NOP, 10 = clear specific mask, 11 = set specific mask
	//    p:  0 = no polling, 1 = polling mode
	//   rs:  0x = NOP, 10 = read IRR, 11 = read ISR
	outb(IO_PIC1, 0x68);             /* clear specific mask */
  101910:	83 c4 08             	add    $0x8,%esp
  101913:	6a 68                	push   $0x68
  101915:	6a 20                	push   $0x20
  101917:	e8 81 11 00 00       	call   102a9d <outb>
	outb(IO_PIC1, 0x0a);             /* read IRR by default */
  10191c:	83 c4 08             	add    $0x8,%esp
  10191f:	6a 0a                	push   $0xa
  101921:	6a 20                	push   $0x20
  101923:	e8 75 11 00 00       	call   102a9d <outb>

	outb(IO_PIC2, 0x68);               /* OCW3 */
  101928:	83 c4 08             	add    $0x8,%esp
  10192b:	6a 68                	push   $0x68
  10192d:	68 a0 00 00 00       	push   $0xa0
  101932:	e8 66 11 00 00       	call   102a9d <outb>
	outb(IO_PIC2, 0x0a);               /* OCW3 */
  101937:	83 c4 08             	add    $0x8,%esp
  10193a:	6a 0a                	push   $0xa
  10193c:	68 a0 00 00 00       	push   $0xa0
  101941:	e8 57 11 00 00       	call   102a9d <outb>
}
  101946:	83 c4 18             	add    $0x18,%esp
  101949:	5b                   	pop    %ebx
  10194a:	c3                   	ret    

0010194b <timer_hw_init>:

// Initialize the programmable interval timer.

void
timer_hw_init(void)
{
  10194b:	53                   	push   %ebx
  10194c:	83 ec 10             	sub    $0x10,%esp
  10194f:	e8 c7 e9 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  101954:	81 c3 ac 86 00 00    	add    $0x86ac,%ebx
	outb(PIT_CONTROL, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
  10195a:	6a 34                	push   $0x34
  10195c:	6a 43                	push   $0x43
  10195e:	e8 3a 11 00 00       	call   102a9d <outb>
	outb(PIT_CHANNEL0, LOW8(LATCH));
  101963:	83 c4 08             	add    $0x8,%esp
  101966:	68 9c 00 00 00       	push   $0x9c
  10196b:	6a 40                	push   $0x40
  10196d:	e8 2b 11 00 00       	call   102a9d <outb>
	outb(PIT_CHANNEL0, HIGH8(LATCH));
  101972:	83 c4 08             	add    $0x8,%esp
  101975:	6a 2e                	push   $0x2e
  101977:	6a 40                	push   $0x40
  101979:	e8 1f 11 00 00       	call   102a9d <outb>
}
  10197e:	83 c4 18             	add    $0x18,%esp
  101981:	5b                   	pop    %ebx
  101982:	c3                   	ret    

00101983 <tsc_calibrate>:
/*
 * XXX: From Linux 3.2.6: arch/x86/kernel/tsc.c: pit_calibrate_tsc()
 */
static uint64_t
tsc_calibrate(uint32_t latch, uint32_t ms, int loopmin)
{
  101983:	55                   	push   %ebp
  101984:	57                   	push   %edi
  101985:	56                   	push   %esi
  101986:	53                   	push   %ebx
  101987:	83 ec 48             	sub    $0x48,%esp
  10198a:	e8 98 eb ff ff       	call   100527 <__x86.get_pc_thunk.si>
  10198f:	81 c6 71 86 00 00    	add    $0x8671,%esi
  101995:	89 c7                	mov    %eax,%edi
  101997:	89 54 24 38          	mov    %edx,0x38(%esp)
  10199b:	89 cd                	mov    %ecx,%ebp
	uint64_t tsc, t1, t2, delta, tscmin, tscmax;;
	int pitcnt;

	/* Set the Gate high, disable speaker */
	outb(0x61, (inb(0x61) & ~0x02) | 0x01);
  10199d:	6a 61                	push   $0x61
  10199f:	89 f3                	mov    %esi,%ebx
  1019a1:	e8 df 10 00 00       	call   102a85 <inb>
  1019a6:	83 e0 fc             	and    $0xfffffffc,%eax
  1019a9:	83 c8 01             	or     $0x1,%eax
  1019ac:	83 c4 08             	add    $0x8,%esp
  1019af:	0f b6 c0             	movzbl %al,%eax
  1019b2:	50                   	push   %eax
  1019b3:	6a 61                	push   $0x61
  1019b5:	e8 e3 10 00 00       	call   102a9d <outb>
	/*
	 * Setup CTC channel 2 for mode 0, (interrupt on terminal
	 * count mode), binary count. Set the latch register to 50ms
	 * (LSB then MSB) to begin countdown.
	 */
	outb(0x43, 0xb0);
  1019ba:	83 c4 08             	add    $0x8,%esp
  1019bd:	68 b0 00 00 00       	push   $0xb0
  1019c2:	6a 43                	push   $0x43
  1019c4:	e8 d4 10 00 00       	call   102a9d <outb>
	outb(0x42, latch & 0xff);
  1019c9:	83 c4 08             	add    $0x8,%esp
  1019cc:	89 f8                	mov    %edi,%eax
  1019ce:	0f b6 c0             	movzbl %al,%eax
  1019d1:	50                   	push   %eax
  1019d2:	6a 42                	push   $0x42
  1019d4:	e8 c4 10 00 00       	call   102a9d <outb>
	outb(0x42, latch >> 8);
  1019d9:	83 c4 08             	add    $0x8,%esp
  1019dc:	89 f8                	mov    %edi,%eax
  1019de:	0f b6 fc             	movzbl %ah,%edi
  1019e1:	57                   	push   %edi
  1019e2:	6a 42                	push   $0x42
  1019e4:	e8 b4 10 00 00       	call   102a9d <outb>

	tsc = t1 = t2 = rdtsc();
  1019e9:	e8 05 10 00 00       	call   1029f3 <rdtsc>
  1019ee:	89 44 24 30          	mov    %eax,0x30(%esp)
  1019f2:	89 54 24 34          	mov    %edx,0x34(%esp)

	pitcnt = 0;
	tscmax = 0;
	tscmin = ~(uint64_t) 0x0;
	while ((inb(0x61) & 0x20) == 0) {
  1019f6:	83 c4 10             	add    $0x10,%esp
	tsc = t1 = t2 = rdtsc();
  1019f9:	89 44 24 18          	mov    %eax,0x18(%esp)
  1019fd:	89 54 24 1c          	mov    %edx,0x1c(%esp)
	pitcnt = 0;
  101a01:	bf 00 00 00 00       	mov    $0x0,%edi
	tscmax = 0;
  101a06:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
  101a0d:	00 
  101a0e:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
  101a15:	00 
	tscmin = ~(uint64_t) 0x0;
  101a16:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
  101a1d:	ff 
  101a1e:	c7 44 24 0c ff ff ff 	movl   $0xffffffff,0xc(%esp)
  101a25:	ff 
	while ((inb(0x61) & 0x20) == 0) {
  101a26:	eb 13                	jmp    101a3b <tsc_calibrate+0xb8>
		delta = t2 - tsc;
		tsc = t2;
		if (delta < tscmin)
			tscmin = delta;
		if (delta > tscmax)
			tscmax = delta;
  101a28:	89 4c 24 10          	mov    %ecx,0x10(%esp)
  101a2c:	89 5c 24 14          	mov    %ebx,0x14(%esp)
		pitcnt++;
  101a30:	83 c7 01             	add    $0x1,%edi
		tsc = t2;
  101a33:	89 44 24 18          	mov    %eax,0x18(%esp)
  101a37:	89 54 24 1c          	mov    %edx,0x1c(%esp)
	while ((inb(0x61) & 0x20) == 0) {
  101a3b:	83 ec 0c             	sub    $0xc,%esp
  101a3e:	6a 61                	push   $0x61
  101a40:	89 f3                	mov    %esi,%ebx
  101a42:	e8 3e 10 00 00       	call   102a85 <inb>
  101a47:	83 c4 10             	add    $0x10,%esp
  101a4a:	a8 20                	test   $0x20,%al
  101a4c:	75 39                	jne    101a87 <tsc_calibrate+0x104>
		t2 = rdtsc();
  101a4e:	89 f3                	mov    %esi,%ebx
  101a50:	e8 9e 0f 00 00       	call   1029f3 <rdtsc>
		delta = t2 - tsc;
  101a55:	89 c1                	mov    %eax,%ecx
  101a57:	89 d3                	mov    %edx,%ebx
  101a59:	2b 4c 24 18          	sub    0x18(%esp),%ecx
  101a5d:	1b 5c 24 1c          	sbb    0x1c(%esp),%ebx
		if (delta < tscmin)
  101a61:	39 5c 24 0c          	cmp    %ebx,0xc(%esp)
  101a65:	77 08                	ja     101a6f <tsc_calibrate+0xec>
  101a67:	72 0e                	jb     101a77 <tsc_calibrate+0xf4>
  101a69:	39 4c 24 08          	cmp    %ecx,0x8(%esp)
  101a6d:	76 08                	jbe    101a77 <tsc_calibrate+0xf4>
			tscmin = delta;
  101a6f:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  101a73:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
		if (delta > tscmax)
  101a77:	39 5c 24 14          	cmp    %ebx,0x14(%esp)
  101a7b:	72 ab                	jb     101a28 <tsc_calibrate+0xa5>
  101a7d:	77 b1                	ja     101a30 <tsc_calibrate+0xad>
  101a7f:	39 4c 24 10          	cmp    %ecx,0x10(%esp)
  101a83:	73 ab                	jae    101a30 <tsc_calibrate+0xad>
  101a85:	eb a1                	jmp    101a28 <tsc_calibrate+0xa5>
	 * times, then we have been hit by a massive SMI
	 *
	 * If the maximum is 10 times larger than the minimum,
	 * then we got hit by an SMI as well.
	 */
	KERN_DEBUG("pitcnt=%u, tscmin=%llu, tscmax=%llu\n",
  101a87:	ff 74 24 14          	pushl  0x14(%esp)
  101a8b:	ff 74 24 14          	pushl  0x14(%esp)
  101a8f:	ff 74 24 14          	pushl  0x14(%esp)
  101a93:	ff 74 24 14          	pushl  0x14(%esp)
  101a97:	57                   	push   %edi
  101a98:	8d 86 c8 b5 ff ff    	lea    -0x4a38(%esi),%eax
  101a9e:	50                   	push   %eax
  101a9f:	6a 3a                	push   $0x3a
  101aa1:	8d 86 ed b5 ff ff    	lea    -0x4a13(%esi),%eax
  101aa7:	50                   	push   %eax
  101aa8:	e8 ab 05 00 00       	call   102058 <debug_normal>
		   pitcnt, tscmin, tscmax);
	if (pitcnt < loopmin || tscmax > 10 * tscmin)
  101aad:	83 c4 20             	add    $0x20,%esp
  101ab0:	39 ef                	cmp    %ebp,%edi
  101ab2:	7d 12                	jge    101ac6 <tsc_calibrate+0x143>
		return ~(uint64_t) 0x0;
  101ab4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101ab9:	ba ff ff ff ff       	mov    $0xffffffff,%edx

	/* Calculate the PIT value */
	delta = t2 - t1;
	return delta / ms;
}
  101abe:	83 c4 3c             	add    $0x3c,%esp
  101ac1:	5b                   	pop    %ebx
  101ac2:	5e                   	pop    %esi
  101ac3:	5f                   	pop    %edi
  101ac4:	5d                   	pop    %ebp
  101ac5:	c3                   	ret    
	if (pitcnt < loopmin || tscmax > 10 * tscmin)
  101ac6:	8b 7c 24 08          	mov    0x8(%esp),%edi
  101aca:	8b 6c 24 0c          	mov    0xc(%esp),%ebp
  101ace:	6b cd 0a             	imul   $0xa,%ebp,%ecx
  101ad1:	b8 0a 00 00 00       	mov    $0xa,%eax
  101ad6:	f7 e7                	mul    %edi
  101ad8:	01 ca                	add    %ecx,%edx
  101ada:	8b 7c 24 10          	mov    0x10(%esp),%edi
  101ade:	8b 6c 24 14          	mov    0x14(%esp),%ebp
  101ae2:	39 d5                	cmp    %edx,%ebp
  101ae4:	77 2f                	ja     101b15 <tsc_calibrate+0x192>
  101ae6:	72 04                	jb     101aec <tsc_calibrate+0x169>
  101ae8:	39 c7                	cmp    %eax,%edi
  101aea:	77 29                	ja     101b15 <tsc_calibrate+0x192>
	delta = t2 - t1;
  101aec:	8b 44 24 18          	mov    0x18(%esp),%eax
  101af0:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  101af4:	2b 44 24 20          	sub    0x20(%esp),%eax
  101af8:	1b 54 24 24          	sbb    0x24(%esp),%edx
	return delta / ms;
  101afc:	8b 4c 24 2c          	mov    0x2c(%esp),%ecx
  101b00:	bb 00 00 00 00       	mov    $0x0,%ebx
  101b05:	53                   	push   %ebx
  101b06:	51                   	push   %ecx
  101b07:	52                   	push   %edx
  101b08:	50                   	push   %eax
  101b09:	89 f3                	mov    %esi,%ebx
  101b0b:	e8 10 35 00 00       	call   105020 <__udivdi3>
  101b10:	83 c4 10             	add    $0x10,%esp
  101b13:	eb a9                	jmp    101abe <tsc_calibrate+0x13b>
		return ~(uint64_t) 0x0;
  101b15:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101b1a:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  101b1f:	eb 9d                	jmp    101abe <tsc_calibrate+0x13b>

00101b21 <tsc_init>:

int
tsc_init(void)
{
  101b21:	55                   	push   %ebp
  101b22:	57                   	push   %edi
  101b23:	56                   	push   %esi
  101b24:	53                   	push   %ebx
  101b25:	83 ec 0c             	sub    $0xc,%esp
  101b28:	e8 ee e7 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  101b2d:	81 c3 d3 84 00 00    	add    $0x84d3,%ebx
	uint64_t ret;
	int i;

	timer_hw_init();
  101b33:	e8 13 fe ff ff       	call   10194b <timer_hw_init>

	tsc_per_ms = 0;
  101b38:	c7 c0 c0 1e 97 00    	mov    $0x971ec0,%eax
  101b3e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  101b44:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)

	/*
	 * XXX: If TSC calibration fails frequently, try to increase the
	 *      upperbound of loop condition, e.g. alternating 3 to 10.
	 */
	for (i = 0; i < 10; i++) {
  101b4b:	bd 00 00 00 00       	mov    $0x0,%ebp
  101b50:	83 fd 09             	cmp    $0x9,%ebp
  101b53:	7f 3e                	jg     101b93 <tsc_init+0x72>
		ret = tsc_calibrate(CAL_LATCH, CAL_MS, CAL_PIT_LOOPS);
  101b55:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
  101b5a:	ba 0a 00 00 00       	mov    $0xa,%edx
  101b5f:	b8 9b 2e 00 00       	mov    $0x2e9b,%eax
  101b64:	e8 1a fe ff ff       	call   101983 <tsc_calibrate>
  101b69:	89 c6                	mov    %eax,%esi
  101b6b:	89 d7                	mov    %edx,%edi
		if (ret != ~(uint64_t) 0x0)
  101b6d:	f7 d0                	not    %eax
  101b6f:	f7 d2                	not    %edx
  101b71:	09 c2                	or     %eax,%edx
  101b73:	75 1e                	jne    101b93 <tsc_init+0x72>
			break;
		KERN_DEBUG("[%d] Retry to calibrate TSC.\n", i+1);
  101b75:	83 c5 01             	add    $0x1,%ebp
  101b78:	55                   	push   %ebp
  101b79:	8d 83 fc b5 ff ff    	lea    -0x4a04(%ebx),%eax
  101b7f:	50                   	push   %eax
  101b80:	6a 55                	push   $0x55
  101b82:	8d 83 ed b5 ff ff    	lea    -0x4a13(%ebx),%eax
  101b88:	50                   	push   %eax
  101b89:	e8 ca 04 00 00       	call   102058 <debug_normal>
	for (i = 0; i < 10; i++) {
  101b8e:	83 c4 10             	add    $0x10,%esp
  101b91:	eb bd                	jmp    101b50 <tsc_init+0x2f>
	}

	if (ret == ~(uint64_t) 0x0) {
  101b93:	89 fa                	mov    %edi,%edx
  101b95:	f7 d2                	not    %edx
  101b97:	89 f0                	mov    %esi,%eax
  101b99:	f7 d0                	not    %eax
  101b9b:	09 c2                	or     %eax,%edx
  101b9d:	74 50                	je     101bef <tsc_init+0xce>
		tsc_per_ms = 1000000;

		timer_hw_init();
		return 1;
	} else {
		tsc_per_ms = ret;
  101b9f:	c7 c0 c0 1e 97 00    	mov    $0x971ec0,%eax
  101ba5:	89 30                	mov    %esi,(%eax)
  101ba7:	89 78 04             	mov    %edi,0x4(%eax)
		KERN_DEBUG("TSC freq = %llu Hz.\n", tsc_per_ms*1000);
  101baa:	8b 38                	mov    (%eax),%edi
  101bac:	8b 68 04             	mov    0x4(%eax),%ebp
  101baf:	83 ec 0c             	sub    $0xc,%esp
  101bb2:	69 cd e8 03 00 00    	imul   $0x3e8,%ebp,%ecx
  101bb8:	be e8 03 00 00       	mov    $0x3e8,%esi
  101bbd:	89 f8                	mov    %edi,%eax
  101bbf:	f7 e6                	mul    %esi
  101bc1:	01 ca                	add    %ecx,%edx
  101bc3:	52                   	push   %edx
  101bc4:	50                   	push   %eax
  101bc5:	8d 83 4d b6 ff ff    	lea    -0x49b3(%ebx),%eax
  101bcb:	50                   	push   %eax
  101bcc:	6a 61                	push   $0x61
  101bce:	8d 83 ed b5 ff ff    	lea    -0x4a13(%ebx),%eax
  101bd4:	50                   	push   %eax
  101bd5:	e8 7e 04 00 00       	call   102058 <debug_normal>

		timer_hw_init();
  101bda:	83 c4 20             	add    $0x20,%esp
  101bdd:	e8 69 fd ff ff       	call   10194b <timer_hw_init>
		return 0;
  101be2:	b8 00 00 00 00       	mov    $0x0,%eax
	}
}
  101be7:	83 c4 0c             	add    $0xc,%esp
  101bea:	5b                   	pop    %ebx
  101beb:	5e                   	pop    %esi
  101bec:	5f                   	pop    %edi
  101bed:	5d                   	pop    %ebp
  101bee:	c3                   	ret    
		KERN_DEBUG("TSC calibration failed.\n");
  101bef:	83 ec 04             	sub    $0x4,%esp
  101bf2:	8d 83 1a b6 ff ff    	lea    -0x49e6(%ebx),%eax
  101bf8:	50                   	push   %eax
  101bf9:	6a 59                	push   $0x59
  101bfb:	8d b3 ed b5 ff ff    	lea    -0x4a13(%ebx),%esi
  101c01:	56                   	push   %esi
  101c02:	e8 51 04 00 00       	call   102058 <debug_normal>
		KERN_DEBUG("Assume TSC freq = 1 GHz.\n");
  101c07:	83 c4 0c             	add    $0xc,%esp
  101c0a:	8d 83 33 b6 ff ff    	lea    -0x49cd(%ebx),%eax
  101c10:	50                   	push   %eax
  101c11:	6a 5a                	push   $0x5a
  101c13:	56                   	push   %esi
  101c14:	e8 3f 04 00 00       	call   102058 <debug_normal>
		tsc_per_ms = 1000000;
  101c19:	c7 c0 c0 1e 97 00    	mov    $0x971ec0,%eax
  101c1f:	c7 00 40 42 0f 00    	movl   $0xf4240,(%eax)
  101c25:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
		timer_hw_init();
  101c2c:	e8 1a fd ff ff       	call   10194b <timer_hw_init>
		return 1;
  101c31:	83 c4 10             	add    $0x10,%esp
  101c34:	b8 01 00 00 00       	mov    $0x1,%eax
  101c39:	eb ac                	jmp    101be7 <tsc_init+0xc6>

00101c3b <delay>:
/*
 * Wait for ms millisecond.
 */
void
delay(uint32_t ms)
{
  101c3b:	55                   	push   %ebp
  101c3c:	57                   	push   %edi
  101c3d:	56                   	push   %esi
  101c3e:	53                   	push   %ebx
  101c3f:	83 ec 1c             	sub    $0x1c,%esp
  101c42:	e8 d4 e6 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  101c47:	81 c3 b9 83 00 00    	add    $0x83b9,%ebx
  101c4d:	8b 44 24 30          	mov    0x30(%esp),%eax
	volatile uint64_t ticks = tsc_per_ms * ms;
  101c51:	c7 c2 c0 1e 97 00    	mov    $0x971ec0,%edx
  101c57:	8b 32                	mov    (%edx),%esi
  101c59:	8b 7a 04             	mov    0x4(%edx),%edi
  101c5c:	89 f9                	mov    %edi,%ecx
  101c5e:	0f af c8             	imul   %eax,%ecx
  101c61:	f7 e6                	mul    %esi
  101c63:	01 ca                	add    %ecx,%edx
  101c65:	89 44 24 08          	mov    %eax,0x8(%esp)
  101c69:	89 54 24 0c          	mov    %edx,0xc(%esp)
	volatile uint64_t start = rdtsc();
  101c6d:	e8 81 0d 00 00       	call   1029f3 <rdtsc>
  101c72:	89 04 24             	mov    %eax,(%esp)
  101c75:	89 54 24 04          	mov    %edx,0x4(%esp)
	while (rdtsc() < start + ticks);
  101c79:	e8 75 0d 00 00       	call   1029f3 <rdtsc>
  101c7e:	89 c5                	mov    %eax,%ebp
  101c80:	89 d1                	mov    %edx,%ecx
  101c82:	8b 04 24             	mov    (%esp),%eax
  101c85:	8b 54 24 04          	mov    0x4(%esp),%edx
  101c89:	8b 74 24 08          	mov    0x8(%esp),%esi
  101c8d:	8b 7c 24 0c          	mov    0xc(%esp),%edi
  101c91:	01 f0                	add    %esi,%eax
  101c93:	11 fa                	adc    %edi,%edx
  101c95:	39 d1                	cmp    %edx,%ecx
  101c97:	72 e0                	jb     101c79 <delay+0x3e>
  101c99:	77 04                	ja     101c9f <delay+0x64>
  101c9b:	39 c5                	cmp    %eax,%ebp
  101c9d:	72 da                	jb     101c79 <delay+0x3e>
}
  101c9f:	83 c4 1c             	add    $0x1c,%esp
  101ca2:	5b                   	pop    %ebx
  101ca3:	5e                   	pop    %esi
  101ca4:	5f                   	pop    %edi
  101ca5:	5d                   	pop    %ebp
  101ca6:	c3                   	ret    

00101ca7 <udelay>:
/*
 * Wait for us microsecond.
 */
void
udelay(uint32_t us)
{
  101ca7:	55                   	push   %ebp
  101ca8:	57                   	push   %edi
  101ca9:	56                   	push   %esi
  101caa:	53                   	push   %ebx
  101cab:	83 ec 1c             	sub    $0x1c,%esp
  101cae:	e8 68 e6 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  101cb3:	81 c3 4d 83 00 00    	add    $0x834d,%ebx
  101cb9:	8b 74 24 30          	mov    0x30(%esp),%esi
    volatile uint64_t ticks = tsc_per_ms / 1000 * us;
  101cbd:	c7 c0 c0 1e 97 00    	mov    $0x971ec0,%eax
  101cc3:	8b 50 04             	mov    0x4(%eax),%edx
  101cc6:	8b 00                	mov    (%eax),%eax
  101cc8:	6a 00                	push   $0x0
  101cca:	68 e8 03 00 00       	push   $0x3e8
  101ccf:	52                   	push   %edx
  101cd0:	50                   	push   %eax
  101cd1:	e8 4a 33 00 00       	call   105020 <__udivdi3>
  101cd6:	83 c4 10             	add    $0x10,%esp
  101cd9:	89 d1                	mov    %edx,%ecx
  101cdb:	0f af ce             	imul   %esi,%ecx
  101cde:	f7 e6                	mul    %esi
  101ce0:	01 ca                	add    %ecx,%edx
  101ce2:	89 44 24 08          	mov    %eax,0x8(%esp)
  101ce6:	89 54 24 0c          	mov    %edx,0xc(%esp)
    volatile uint64_t start = rdtsc();
  101cea:	e8 04 0d 00 00       	call   1029f3 <rdtsc>
  101cef:	89 04 24             	mov    %eax,(%esp)
  101cf2:	89 54 24 04          	mov    %edx,0x4(%esp)
    while (rdtsc() < start + ticks);
  101cf6:	e8 f8 0c 00 00       	call   1029f3 <rdtsc>
  101cfb:	89 c5                	mov    %eax,%ebp
  101cfd:	89 d1                	mov    %edx,%ecx
  101cff:	8b 04 24             	mov    (%esp),%eax
  101d02:	8b 54 24 04          	mov    0x4(%esp),%edx
  101d06:	8b 74 24 08          	mov    0x8(%esp),%esi
  101d0a:	8b 7c 24 0c          	mov    0xc(%esp),%edi
  101d0e:	01 f0                	add    %esi,%eax
  101d10:	11 fa                	adc    %edi,%edx
  101d12:	39 d1                	cmp    %edx,%ecx
  101d14:	72 e0                	jb     101cf6 <udelay+0x4f>
  101d16:	77 04                	ja     101d1c <udelay+0x75>
  101d18:	39 c5                	cmp    %eax,%ebp
  101d1a:	72 da                	jb     101cf6 <udelay+0x4f>
}
  101d1c:	83 c4 1c             	add    $0x1c,%esp
  101d1f:	5b                   	pop    %ebx
  101d20:	5e                   	pop    %esi
  101d21:	5f                   	pop    %edi
  101d22:	5d                   	pop    %ebp
  101d23:	c3                   	ret    
  101d24:	66 90                	xchg   %ax,%ax
  101d26:	66 90                	xchg   %ax,%ax
  101d28:	66 90                	xchg   %ax,%ax
  101d2a:	66 90                	xchg   %ax,%ax
  101d2c:	66 90                	xchg   %ax,%ax
  101d2e:	66 90                	xchg   %ax,%ax

00101d30 <Xdivide>:
	jmp _alltraps

.text

/* exceptions  */
TRAPHANDLER_NOEC(Xdivide,	T_DIVIDE)
  101d30:	6a 00                	push   $0x0
  101d32:	6a 00                	push   $0x0
  101d34:	e9 17 01 00 00       	jmp    101e50 <_alltraps>
  101d39:	90                   	nop

00101d3a <Xdebug>:
TRAPHANDLER_NOEC(Xdebug,	T_DEBUG)
  101d3a:	6a 00                	push   $0x0
  101d3c:	6a 01                	push   $0x1
  101d3e:	e9 0d 01 00 00       	jmp    101e50 <_alltraps>
  101d43:	90                   	nop

00101d44 <Xnmi>:
TRAPHANDLER_NOEC(Xnmi,		T_NMI)
  101d44:	6a 00                	push   $0x0
  101d46:	6a 02                	push   $0x2
  101d48:	e9 03 01 00 00       	jmp    101e50 <_alltraps>
  101d4d:	90                   	nop

00101d4e <Xbrkpt>:
TRAPHANDLER_NOEC(Xbrkpt,	T_BRKPT)
  101d4e:	6a 00                	push   $0x0
  101d50:	6a 03                	push   $0x3
  101d52:	e9 f9 00 00 00       	jmp    101e50 <_alltraps>
  101d57:	90                   	nop

00101d58 <Xoflow>:
TRAPHANDLER_NOEC(Xoflow,	T_OFLOW)
  101d58:	6a 00                	push   $0x0
  101d5a:	6a 04                	push   $0x4
  101d5c:	e9 ef 00 00 00       	jmp    101e50 <_alltraps>
  101d61:	90                   	nop

00101d62 <Xbound>:
TRAPHANDLER_NOEC(Xbound,	T_BOUND)
  101d62:	6a 00                	push   $0x0
  101d64:	6a 05                	push   $0x5
  101d66:	e9 e5 00 00 00       	jmp    101e50 <_alltraps>
  101d6b:	90                   	nop

00101d6c <Xillop>:
TRAPHANDLER_NOEC(Xillop,	T_ILLOP)
  101d6c:	6a 00                	push   $0x0
  101d6e:	6a 06                	push   $0x6
  101d70:	e9 db 00 00 00       	jmp    101e50 <_alltraps>
  101d75:	90                   	nop

00101d76 <Xdevice>:
TRAPHANDLER_NOEC(Xdevice,	T_DEVICE)
  101d76:	6a 00                	push   $0x0
  101d78:	6a 07                	push   $0x7
  101d7a:	e9 d1 00 00 00       	jmp    101e50 <_alltraps>
  101d7f:	90                   	nop

00101d80 <Xdblflt>:
TRAPHANDLER     (Xdblflt,	T_DBLFLT)
  101d80:	6a 08                	push   $0x8
  101d82:	e9 c9 00 00 00       	jmp    101e50 <_alltraps>
  101d87:	90                   	nop

00101d88 <Xcoproc>:
TRAPHANDLER_NOEC(Xcoproc,	T_COPROC)
  101d88:	6a 00                	push   $0x0
  101d8a:	6a 09                	push   $0x9
  101d8c:	e9 bf 00 00 00       	jmp    101e50 <_alltraps>
  101d91:	90                   	nop

00101d92 <Xtss>:
TRAPHANDLER     (Xtss,		T_TSS)
  101d92:	6a 0a                	push   $0xa
  101d94:	e9 b7 00 00 00       	jmp    101e50 <_alltraps>
  101d99:	90                   	nop

00101d9a <Xsegnp>:
TRAPHANDLER     (Xsegnp,	T_SEGNP)
  101d9a:	6a 0b                	push   $0xb
  101d9c:	e9 af 00 00 00       	jmp    101e50 <_alltraps>
  101da1:	90                   	nop

00101da2 <Xstack>:
TRAPHANDLER     (Xstack,	T_STACK)
  101da2:	6a 0c                	push   $0xc
  101da4:	e9 a7 00 00 00       	jmp    101e50 <_alltraps>
  101da9:	90                   	nop

00101daa <Xgpflt>:
TRAPHANDLER     (Xgpflt,	T_GPFLT)
  101daa:	6a 0d                	push   $0xd
  101dac:	e9 9f 00 00 00       	jmp    101e50 <_alltraps>
  101db1:	90                   	nop

00101db2 <Xpgflt>:
TRAPHANDLER     (Xpgflt,	T_PGFLT)
  101db2:	6a 0e                	push   $0xe
  101db4:	e9 97 00 00 00       	jmp    101e50 <_alltraps>
  101db9:	90                   	nop

00101dba <Xres>:
TRAPHANDLER_NOEC(Xres,		T_RES)
  101dba:	6a 00                	push   $0x0
  101dbc:	6a 0f                	push   $0xf
  101dbe:	e9 8d 00 00 00       	jmp    101e50 <_alltraps>
  101dc3:	90                   	nop

00101dc4 <Xfperr>:
TRAPHANDLER_NOEC(Xfperr,	T_FPERR)
  101dc4:	6a 00                	push   $0x0
  101dc6:	6a 10                	push   $0x10
  101dc8:	e9 83 00 00 00       	jmp    101e50 <_alltraps>
  101dcd:	90                   	nop

00101dce <Xalign>:
TRAPHANDLER     (Xalign,	T_ALIGN)
  101dce:	6a 11                	push   $0x11
  101dd0:	eb 7e                	jmp    101e50 <_alltraps>

00101dd2 <Xmchk>:
TRAPHANDLER_NOEC(Xmchk,		T_MCHK)
  101dd2:	6a 00                	push   $0x0
  101dd4:	6a 12                	push   $0x12
  101dd6:	eb 78                	jmp    101e50 <_alltraps>

00101dd8 <Xirq_timer>:

/* ISA interrupts  */
TRAPHANDLER_NOEC(Xirq_timer,	T_IRQ0 + IRQ_TIMER)
  101dd8:	6a 00                	push   $0x0
  101dda:	6a 20                	push   $0x20
  101ddc:	eb 72                	jmp    101e50 <_alltraps>

00101dde <Xirq_kbd>:
TRAPHANDLER_NOEC(Xirq_kbd,	T_IRQ0 + IRQ_KBD)
  101dde:	6a 00                	push   $0x0
  101de0:	6a 21                	push   $0x21
  101de2:	eb 6c                	jmp    101e50 <_alltraps>

00101de4 <Xirq_slave>:
TRAPHANDLER_NOEC(Xirq_slave,	T_IRQ0 + IRQ_SLAVE)
  101de4:	6a 00                	push   $0x0
  101de6:	6a 22                	push   $0x22
  101de8:	eb 66                	jmp    101e50 <_alltraps>

00101dea <Xirq_serial2>:
TRAPHANDLER_NOEC(Xirq_serial2,	T_IRQ0 + IRQ_SERIAL24)
  101dea:	6a 00                	push   $0x0
  101dec:	6a 23                	push   $0x23
  101dee:	eb 60                	jmp    101e50 <_alltraps>

00101df0 <Xirq_serial1>:
TRAPHANDLER_NOEC(Xirq_serial1,	T_IRQ0 + IRQ_SERIAL13)
  101df0:	6a 00                	push   $0x0
  101df2:	6a 24                	push   $0x24
  101df4:	eb 5a                	jmp    101e50 <_alltraps>

00101df6 <Xirq_lpt>:
TRAPHANDLER_NOEC(Xirq_lpt,	T_IRQ0 + IRQ_LPT2)
  101df6:	6a 00                	push   $0x0
  101df8:	6a 25                	push   $0x25
  101dfa:	eb 54                	jmp    101e50 <_alltraps>

00101dfc <Xirq_floppy>:
TRAPHANDLER_NOEC(Xirq_floppy,	T_IRQ0 + IRQ_FLOPPY)
  101dfc:	6a 00                	push   $0x0
  101dfe:	6a 26                	push   $0x26
  101e00:	eb 4e                	jmp    101e50 <_alltraps>

00101e02 <Xirq_spurious>:
TRAPHANDLER_NOEC(Xirq_spurious,	T_IRQ0 + IRQ_SPURIOUS)
  101e02:	6a 00                	push   $0x0
  101e04:	6a 27                	push   $0x27
  101e06:	eb 48                	jmp    101e50 <_alltraps>

00101e08 <Xirq_rtc>:
TRAPHANDLER_NOEC(Xirq_rtc,	T_IRQ0 + IRQ_RTC)
  101e08:	6a 00                	push   $0x0
  101e0a:	6a 28                	push   $0x28
  101e0c:	eb 42                	jmp    101e50 <_alltraps>

00101e0e <Xirq9>:
TRAPHANDLER_NOEC(Xirq9,		T_IRQ0 + 9)
  101e0e:	6a 00                	push   $0x0
  101e10:	6a 29                	push   $0x29
  101e12:	eb 3c                	jmp    101e50 <_alltraps>

00101e14 <Xirq10>:
TRAPHANDLER_NOEC(Xirq10,	T_IRQ0 + 10)
  101e14:	6a 00                	push   $0x0
  101e16:	6a 2a                	push   $0x2a
  101e18:	eb 36                	jmp    101e50 <_alltraps>

00101e1a <Xirq11>:
TRAPHANDLER_NOEC(Xirq11,	T_IRQ0 + 11)
  101e1a:	6a 00                	push   $0x0
  101e1c:	6a 2b                	push   $0x2b
  101e1e:	eb 30                	jmp    101e50 <_alltraps>

00101e20 <Xirq_mouse>:
TRAPHANDLER_NOEC(Xirq_mouse,	T_IRQ0 + IRQ_MOUSE)
  101e20:	6a 00                	push   $0x0
  101e22:	6a 2c                	push   $0x2c
  101e24:	eb 2a                	jmp    101e50 <_alltraps>

00101e26 <Xirq_coproc>:
TRAPHANDLER_NOEC(Xirq_coproc,	T_IRQ0 + IRQ_COPROCESSOR)
  101e26:	6a 00                	push   $0x0
  101e28:	6a 2d                	push   $0x2d
  101e2a:	eb 24                	jmp    101e50 <_alltraps>

00101e2c <Xirq_ide1>:
TRAPHANDLER_NOEC(Xirq_ide1,	T_IRQ0 + IRQ_IDE1)
  101e2c:	6a 00                	push   $0x0
  101e2e:	6a 2e                	push   $0x2e
  101e30:	eb 1e                	jmp    101e50 <_alltraps>

00101e32 <Xirq_ide2>:
TRAPHANDLER_NOEC(Xirq_ide2,	T_IRQ0 + IRQ_IDE2)
  101e32:	6a 00                	push   $0x0
  101e34:	6a 2f                	push   $0x2f
  101e36:	eb 18                	jmp    101e50 <_alltraps>

00101e38 <Xsyscall>:

/* syscall */
TRAPHANDLER_NOEC(Xsyscall,	T_SYSCALL)
  101e38:	6a 00                	push   $0x0
  101e3a:	6a 30                	push   $0x30
  101e3c:	eb 12                	jmp    101e50 <_alltraps>

00101e3e <Xdefault>:

/* default ? */
TRAPHANDLER     (Xdefault,	T_DEFAULT)
  101e3e:	68 fe 00 00 00       	push   $0xfe
  101e43:	eb 0b                	jmp    101e50 <_alltraps>
  101e45:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  101e49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00101e50 <_alltraps>:

.globl	_alltraps
.type	_alltraps,@function
.p2align 4, 0x90		/* 16-byte alignment, nop filled */
_alltraps:
	cli			# make sure there is no nested trap
  101e50:	fa                   	cli    

	cld
  101e51:	fc                   	cld    

	pushl %ds		# build context
  101e52:	1e                   	push   %ds
	pushl %es
  101e53:	06                   	push   %es
	pushal
  101e54:	60                   	pusha  

	movl $CPU_GDT_KDATA,%eax # load kernel's data segment
  101e55:	b8 10 00 00 00       	mov    $0x10,%eax
	movw %ax,%ds
  101e5a:	8e d8                	mov    %eax,%ds
	movw %ax,%es
  101e5c:	8e c0                	mov    %eax,%es

	pushl %esp		# pass pointer to this trapframe
  101e5e:	54                   	push   %esp
	call trap		# and call trap (does not return)
  101e5f:	e8 0c 31 00 00       	call   104f70 <trap>

1:	hlt			# should never get here; just spin...
  101e64:	f4                   	hlt    
  101e65:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  101e69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00101e70 <trap_return>:
//
.globl	trap_return
.type	trap_return,@function
.p2align 4, 0x90		/* 16-byte alignment, nop filled */
trap_return:
	movl	4(%esp),%esp	// reset stack pointer to point to trap frame
  101e70:	8b 64 24 04          	mov    0x4(%esp),%esp
	popal			// restore general-purpose registers except esp
  101e74:	61                   	popa   
	popl	%es		// restore data segment registers
  101e75:	07                   	pop    %es
	popl	%ds
  101e76:	1f                   	pop    %ds
	addl	$8,%esp		// skip tf_trapno and tf_errcode
  101e77:	83 c4 08             	add    $0x8,%esp
	iret			// return from trap handler
  101e7a:	cf                   	iret   

00101e7b <memset>:
#include "string.h"
#include "types.h"

void *
memset(void *v, int c, size_t n)
{
  101e7b:	57                   	push   %edi
  101e7c:	53                   	push   %ebx
  101e7d:	8b 7c 24 0c          	mov    0xc(%esp),%edi
  101e81:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    if (n == 0)
  101e85:	85 c9                	test   %ecx,%ecx
  101e87:	74 14                	je     101e9d <memset+0x22>
        return v;
    if ((int)v%4 == 0 && n%4 == 0) {
  101e89:	f7 c7 03 00 00 00    	test   $0x3,%edi
  101e8f:	75 05                	jne    101e96 <memset+0x1b>
  101e91:	f6 c1 03             	test   $0x3,%cl
  101e94:	74 0c                	je     101ea2 <memset+0x27>
        c = (c<<24)|(c<<16)|(c<<8)|c;
        asm volatile("cld; rep stosl\n"
                 :: "D" (v), "a" (c), "c" (n/4)
                 : "cc", "memory");
    } else
        asm volatile("cld; rep stosb\n"
  101e96:	8b 44 24 10          	mov    0x10(%esp),%eax
  101e9a:	fc                   	cld    
  101e9b:	f3 aa                	rep stos %al,%es:(%edi)
                 :: "D" (v), "a" (c), "c" (n)
                 : "cc", "memory");
    return v;
}
  101e9d:	89 f8                	mov    %edi,%eax
  101e9f:	5b                   	pop    %ebx
  101ea0:	5f                   	pop    %edi
  101ea1:	c3                   	ret    
        c &= 0xFF;
  101ea2:	0f b6 44 24 10       	movzbl 0x10(%esp),%eax
        c = (c<<24)|(c<<16)|(c<<8)|c;
  101ea7:	89 c2                	mov    %eax,%edx
  101ea9:	c1 e2 18             	shl    $0x18,%edx
  101eac:	89 c3                	mov    %eax,%ebx
  101eae:	c1 e3 10             	shl    $0x10,%ebx
  101eb1:	09 da                	or     %ebx,%edx
  101eb3:	89 c3                	mov    %eax,%ebx
  101eb5:	c1 e3 08             	shl    $0x8,%ebx
  101eb8:	09 da                	or     %ebx,%edx
  101eba:	09 d0                	or     %edx,%eax
                 :: "D" (v), "a" (c), "c" (n/4)
  101ebc:	c1 e9 02             	shr    $0x2,%ecx
        asm volatile("cld; rep stosl\n"
  101ebf:	fc                   	cld    
  101ec0:	f3 ab                	rep stos %eax,%es:(%edi)
  101ec2:	eb d9                	jmp    101e9d <memset+0x22>

00101ec4 <memmove>:

void *
memmove(void *dst, const void *src, size_t n)
{
  101ec4:	57                   	push   %edi
  101ec5:	56                   	push   %esi
  101ec6:	8b 44 24 0c          	mov    0xc(%esp),%eax
  101eca:	8b 74 24 10          	mov    0x10(%esp),%esi
  101ece:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    const char *s;
    char *d;

    s = src;
    d = dst;
    if (s < d && s + n > d) {
  101ed2:	39 c6                	cmp    %eax,%esi
  101ed4:	73 36                	jae    101f0c <memmove+0x48>
  101ed6:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
  101ed9:	39 d0                	cmp    %edx,%eax
  101edb:	73 2f                	jae    101f0c <memmove+0x48>
        s += n;
        d += n;
  101edd:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
        if ((int)s%4 == 0 && (int)d%4 == 0 && n%4 == 0)
  101ee0:	f6 c2 03             	test   $0x3,%dl
  101ee3:	75 1b                	jne    101f00 <memmove+0x3c>
  101ee5:	f7 c7 03 00 00 00    	test   $0x3,%edi
  101eeb:	75 13                	jne    101f00 <memmove+0x3c>
  101eed:	f6 c1 03             	test   $0x3,%cl
  101ef0:	75 0e                	jne    101f00 <memmove+0x3c>
            asm volatile("std; rep movsl\n"
                     :: "D" (d-4), "S" (s-4), "c" (n/4)
  101ef2:	83 ef 04             	sub    $0x4,%edi
  101ef5:	8d 72 fc             	lea    -0x4(%edx),%esi
  101ef8:	c1 e9 02             	shr    $0x2,%ecx
            asm volatile("std; rep movsl\n"
  101efb:	fd                   	std    
  101efc:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  101efe:	eb 09                	jmp    101f09 <memmove+0x45>
                     : "cc", "memory");
        else
            asm volatile("std; rep movsb\n"
                     :: "D" (d-1), "S" (s-1), "c" (n)
  101f00:	83 ef 01             	sub    $0x1,%edi
  101f03:	8d 72 ff             	lea    -0x1(%edx),%esi
            asm volatile("std; rep movsb\n"
  101f06:	fd                   	std    
  101f07:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
                     : "cc", "memory");
        // Some versions of GCC rely on DF being clear
        asm volatile("cld" ::: "cc");
  101f09:	fc                   	cld    
  101f0a:	eb 16                	jmp    101f22 <memmove+0x5e>
    } else {
        if ((int)s%4 == 0 && (int)d%4 == 0 && n%4 == 0)
  101f0c:	f7 c6 03 00 00 00    	test   $0x3,%esi
  101f12:	75 09                	jne    101f1d <memmove+0x59>
  101f14:	a8 03                	test   $0x3,%al
  101f16:	75 05                	jne    101f1d <memmove+0x59>
  101f18:	f6 c1 03             	test   $0x3,%cl
  101f1b:	74 08                	je     101f25 <memmove+0x61>
            asm volatile("cld; rep movsl\n"
                     :: "D" (d), "S" (s), "c" (n/4)
                     : "cc", "memory");
        else
            asm volatile("cld; rep movsb\n"
  101f1d:	89 c7                	mov    %eax,%edi
  101f1f:	fc                   	cld    
  101f20:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
                     :: "D" (d), "S" (s), "c" (n)
                     : "cc", "memory");
    }
    return dst;
}
  101f22:	5e                   	pop    %esi
  101f23:	5f                   	pop    %edi
  101f24:	c3                   	ret    
                     :: "D" (d), "S" (s), "c" (n/4)
  101f25:	c1 e9 02             	shr    $0x2,%ecx
            asm volatile("cld; rep movsl\n"
  101f28:	89 c7                	mov    %eax,%edi
  101f2a:	fc                   	cld    
  101f2b:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  101f2d:	eb f3                	jmp    101f22 <memmove+0x5e>

00101f2f <memcpy>:

void *
memcpy(void *dst, const void *src, size_t n)
{
	return memmove(dst, src, n);
  101f2f:	ff 74 24 0c          	pushl  0xc(%esp)
  101f33:	ff 74 24 0c          	pushl  0xc(%esp)
  101f37:	ff 74 24 0c          	pushl  0xc(%esp)
  101f3b:	e8 84 ff ff ff       	call   101ec4 <memmove>
  101f40:	83 c4 0c             	add    $0xc,%esp
}
  101f43:	c3                   	ret    

00101f44 <strncmp>:

int
strncmp(const char *p, const char *q, size_t n)
{
  101f44:	53                   	push   %ebx
  101f45:	8b 54 24 08          	mov    0x8(%esp),%edx
  101f49:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
  101f4d:	8b 44 24 10          	mov    0x10(%esp),%eax
	while (n > 0 && *p && *p == *q)
  101f51:	eb 09                	jmp    101f5c <strncmp+0x18>
		n--, p++, q++;
  101f53:	83 e8 01             	sub    $0x1,%eax
  101f56:	83 c2 01             	add    $0x1,%edx
  101f59:	83 c1 01             	add    $0x1,%ecx
	while (n > 0 && *p && *p == *q)
  101f5c:	85 c0                	test   %eax,%eax
  101f5e:	74 0b                	je     101f6b <strncmp+0x27>
  101f60:	0f b6 1a             	movzbl (%edx),%ebx
  101f63:	84 db                	test   %bl,%bl
  101f65:	74 04                	je     101f6b <strncmp+0x27>
  101f67:	3a 19                	cmp    (%ecx),%bl
  101f69:	74 e8                	je     101f53 <strncmp+0xf>
	if (n == 0)
  101f6b:	85 c0                	test   %eax,%eax
  101f6d:	74 0a                	je     101f79 <strncmp+0x35>
		return 0;
	else
		return (int) ((unsigned char) *p - (unsigned char) *q);
  101f6f:	0f b6 02             	movzbl (%edx),%eax
  101f72:	0f b6 11             	movzbl (%ecx),%edx
  101f75:	29 d0                	sub    %edx,%eax
}
  101f77:	5b                   	pop    %ebx
  101f78:	c3                   	ret    
		return 0;
  101f79:	b8 00 00 00 00       	mov    $0x0,%eax
  101f7e:	eb f7                	jmp    101f77 <strncmp+0x33>

00101f80 <strnlen>:

int
strnlen(const char *s, size_t size)
{
  101f80:	8b 4c 24 04          	mov    0x4(%esp),%ecx
  101f84:	8b 54 24 08          	mov    0x8(%esp),%edx
	int n;

	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  101f88:	b8 00 00 00 00       	mov    $0x0,%eax
  101f8d:	eb 09                	jmp    101f98 <strnlen+0x18>
		n++;
  101f8f:	83 c0 01             	add    $0x1,%eax
	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  101f92:	83 c1 01             	add    $0x1,%ecx
  101f95:	83 ea 01             	sub    $0x1,%edx
  101f98:	85 d2                	test   %edx,%edx
  101f9a:	74 05                	je     101fa1 <strnlen+0x21>
  101f9c:	80 39 00             	cmpb   $0x0,(%ecx)
  101f9f:	75 ee                	jne    101f8f <strnlen+0xf>
	return n;
}
  101fa1:	f3 c3                	repz ret 

00101fa3 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  101fa3:	8b 4c 24 04          	mov    0x4(%esp),%ecx
  101fa7:	8b 54 24 08          	mov    0x8(%esp),%edx
  while (*p && *p == *q)
  101fab:	eb 06                	jmp    101fb3 <strcmp+0x10>
    p++, q++;
  101fad:	83 c1 01             	add    $0x1,%ecx
  101fb0:	83 c2 01             	add    $0x1,%edx
  while (*p && *p == *q)
  101fb3:	0f b6 01             	movzbl (%ecx),%eax
  101fb6:	84 c0                	test   %al,%al
  101fb8:	74 04                	je     101fbe <strcmp+0x1b>
  101fba:	3a 02                	cmp    (%edx),%al
  101fbc:	74 ef                	je     101fad <strcmp+0xa>
  return (int) ((unsigned char) *p - (unsigned char) *q);
  101fbe:	0f b6 c0             	movzbl %al,%eax
  101fc1:	0f b6 12             	movzbl (%edx),%edx
  101fc4:	29 d0                	sub    %edx,%eax
}
  101fc6:	c3                   	ret    

00101fc7 <strchr>:

// Return a pointer to the first occurrence of 'c' in 's',
// or a null pointer if the string has no 'c'.
char *
strchr(const char *s, char c)
{
  101fc7:	8b 44 24 04          	mov    0x4(%esp),%eax
  101fcb:	0f b6 4c 24 08       	movzbl 0x8(%esp),%ecx
  for (; *s; s++)
  101fd0:	0f b6 10             	movzbl (%eax),%edx
  101fd3:	84 d2                	test   %dl,%dl
  101fd5:	74 09                	je     101fe0 <strchr+0x19>
    if (*s == c)
  101fd7:	38 ca                	cmp    %cl,%dl
  101fd9:	74 0a                	je     101fe5 <strchr+0x1e>
  for (; *s; s++)
  101fdb:	83 c0 01             	add    $0x1,%eax
  101fde:	eb f0                	jmp    101fd0 <strchr+0x9>
      return (char *) s;
  return 0;
  101fe0:	b8 00 00 00 00       	mov    $0x0,%eax
}
  101fe5:	f3 c3                	repz ret 

00101fe7 <memzero>:

void *
memzero(void *v, size_t n)
{
	return memset(v, 0, n);
  101fe7:	ff 74 24 08          	pushl  0x8(%esp)
  101feb:	6a 00                	push   $0x0
  101fed:	ff 74 24 0c          	pushl  0xc(%esp)
  101ff1:	e8 85 fe ff ff       	call   101e7b <memset>
  101ff6:	83 c4 0c             	add    $0xc,%esp
}
  101ff9:	c3                   	ret    

00101ffa <debug_trace>:

#define DEBUG_TRACEFRAMES	10

static void
debug_trace(uintptr_t ebp, uintptr_t *eips)
{
  101ffa:	56                   	push   %esi
  101ffb:	53                   	push   %ebx
  101ffc:	89 d6                	mov    %edx,%esi
	int i;
	uintptr_t *frame = (uintptr_t *) ebp;

	for (i = 0; i < DEBUG_TRACEFRAMES && frame; i++) {
  101ffe:	b9 00 00 00 00       	mov    $0x0,%ecx
  102003:	eb 0b                	jmp    102010 <debug_trace+0x16>
		eips[i] = frame[1];		/* saved %eip */
  102005:	8b 50 04             	mov    0x4(%eax),%edx
  102008:	89 14 8e             	mov    %edx,(%esi,%ecx,4)
		frame = (uintptr_t *) frame[0];	/* saved %ebp */
  10200b:	8b 00                	mov    (%eax),%eax
	for (i = 0; i < DEBUG_TRACEFRAMES && frame; i++) {
  10200d:	83 c1 01             	add    $0x1,%ecx
  102010:	83 f9 09             	cmp    $0x9,%ecx
  102013:	0f 9e c3             	setle  %bl
  102016:	85 c0                	test   %eax,%eax
  102018:	0f 95 c2             	setne  %dl
  10201b:	84 da                	test   %bl,%dl
  10201d:	75 e6                	jne    102005 <debug_trace+0xb>
  10201f:	eb 0a                	jmp    10202b <debug_trace+0x31>
	}
	for (; i < DEBUG_TRACEFRAMES; i++)
		eips[i] = 0;
  102021:	c7 04 8e 00 00 00 00 	movl   $0x0,(%esi,%ecx,4)
	for (; i < DEBUG_TRACEFRAMES; i++)
  102028:	83 c1 01             	add    $0x1,%ecx
  10202b:	83 f9 09             	cmp    $0x9,%ecx
  10202e:	7e f1                	jle    102021 <debug_trace+0x27>
}
  102030:	5b                   	pop    %ebx
  102031:	5e                   	pop    %esi
  102032:	c3                   	ret    

00102033 <debug_info>:
{
  102033:	53                   	push   %ebx
  102034:	83 ec 08             	sub    $0x8,%esp
  102037:	e8 df e2 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  10203c:	81 c3 c4 7f 00 00    	add    $0x7fc4,%ebx
	va_start(ap, fmt);
  102042:	8d 44 24 14          	lea    0x14(%esp),%eax
	vdprintf(fmt, ap);
  102046:	83 ec 08             	sub    $0x8,%esp
  102049:	50                   	push   %eax
  10204a:	ff 74 24 1c          	pushl  0x1c(%esp)
  10204e:	e8 72 01 00 00       	call   1021c5 <vdprintf>
}
  102053:	83 c4 18             	add    $0x18,%esp
  102056:	5b                   	pop    %ebx
  102057:	c3                   	ret    

00102058 <debug_normal>:
{
  102058:	53                   	push   %ebx
  102059:	83 ec 0c             	sub    $0xc,%esp
  10205c:	e8 ba e2 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  102061:	81 c3 9f 7f 00 00    	add    $0x7f9f,%ebx
	dprintf("[D] %s:%d: ", file, line);
  102067:	ff 74 24 18          	pushl  0x18(%esp)
  10206b:	ff 74 24 18          	pushl  0x18(%esp)
  10206f:	8d 83 62 b6 ff ff    	lea    -0x499e(%ebx),%eax
  102075:	50                   	push   %eax
  102076:	e8 a9 01 00 00       	call   102224 <dprintf>
	va_start(ap, fmt);
  10207b:	8d 44 24 2c          	lea    0x2c(%esp),%eax
	vdprintf(fmt, ap);
  10207f:	83 c4 08             	add    $0x8,%esp
  102082:	50                   	push   %eax
  102083:	ff 74 24 24          	pushl  0x24(%esp)
  102087:	e8 39 01 00 00       	call   1021c5 <vdprintf>
}
  10208c:	83 c4 18             	add    $0x18,%esp
  10208f:	5b                   	pop    %ebx
  102090:	c3                   	ret    

00102091 <debug_panic>:

gcc_noinline void
debug_panic(const char *file, int line, const char *fmt,...)
{
  102091:	56                   	push   %esi
  102092:	53                   	push   %ebx
  102093:	83 ec 38             	sub    $0x38,%esp
  102096:	e8 80 e2 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  10209b:	81 c3 65 7f 00 00    	add    $0x7f65,%ebx
	int i;
	uintptr_t eips[DEBUG_TRACEFRAMES];
	va_list ap;

	dprintf("[P] %s:%d: ", file, line);
  1020a1:	ff 74 24 48          	pushl  0x48(%esp)
  1020a5:	ff 74 24 48          	pushl  0x48(%esp)
  1020a9:	8d 83 6e b6 ff ff    	lea    -0x4992(%ebx),%eax
  1020af:	50                   	push   %eax
  1020b0:	e8 6f 01 00 00       	call   102224 <dprintf>

	va_start(ap, fmt);
  1020b5:	8d 44 24 5c          	lea    0x5c(%esp),%eax
	vdprintf(fmt, ap);
  1020b9:	83 c4 08             	add    $0x8,%esp
  1020bc:	50                   	push   %eax
  1020bd:	ff 74 24 54          	pushl  0x54(%esp)
  1020c1:	e8 ff 00 00 00       	call   1021c5 <vdprintf>

static inline uint32_t __attribute__((always_inline))
read_ebp(void)
{
	uint32_t ebp;
	__asm __volatile("movl %%ebp,%0" : "=rm" (ebp));
  1020c6:	89 e8                	mov    %ebp,%eax
	va_end(ap);

	debug_trace(read_ebp(), eips);
  1020c8:	8d 54 24 18          	lea    0x18(%esp),%edx
  1020cc:	e8 29 ff ff ff       	call   101ffa <debug_trace>
	for (i = 0; i < DEBUG_TRACEFRAMES && eips[i] != 0; i++)
  1020d1:	83 c4 10             	add    $0x10,%esp
  1020d4:	be 00 00 00 00       	mov    $0x0,%esi
  1020d9:	eb 16                	jmp    1020f1 <debug_panic+0x60>
		dprintf("\tfrom 0x%08x\n", eips[i]);
  1020db:	83 ec 08             	sub    $0x8,%esp
  1020de:	50                   	push   %eax
  1020df:	8d 83 7a b6 ff ff    	lea    -0x4986(%ebx),%eax
  1020e5:	50                   	push   %eax
  1020e6:	e8 39 01 00 00       	call   102224 <dprintf>
	for (i = 0; i < DEBUG_TRACEFRAMES && eips[i] != 0; i++)
  1020eb:	83 c6 01             	add    $0x1,%esi
  1020ee:	83 c4 10             	add    $0x10,%esp
  1020f1:	83 fe 09             	cmp    $0x9,%esi
  1020f4:	7f 08                	jg     1020fe <debug_panic+0x6d>
  1020f6:	8b 44 b4 08          	mov    0x8(%esp,%esi,4),%eax
  1020fa:	85 c0                	test   %eax,%eax
  1020fc:	75 dd                	jne    1020db <debug_panic+0x4a>

	dprintf("Kernel Panic !!!\n");
  1020fe:	83 ec 0c             	sub    $0xc,%esp
  102101:	8d 83 88 b6 ff ff    	lea    -0x4978(%ebx),%eax
  102107:	50                   	push   %eax
  102108:	e8 17 01 00 00       	call   102224 <dprintf>

	//intr_local_disable();
	halt();
  10210d:	e8 df 08 00 00       	call   1029f1 <halt>
}
  102112:	83 c4 44             	add    $0x44,%esp
  102115:	5b                   	pop    %ebx
  102116:	5e                   	pop    %esi
  102117:	c3                   	ret    

00102118 <debug_warn>:

void
debug_warn(const char *file, int line, const char *fmt,...)
{
  102118:	53                   	push   %ebx
  102119:	83 ec 0c             	sub    $0xc,%esp
  10211c:	e8 fa e1 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  102121:	81 c3 df 7e 00 00    	add    $0x7edf,%ebx
	dprintf("[W] %s:%d: ", file, line);
  102127:	ff 74 24 18          	pushl  0x18(%esp)
  10212b:	ff 74 24 18          	pushl  0x18(%esp)
  10212f:	8d 83 9a b6 ff ff    	lea    -0x4966(%ebx),%eax
  102135:	50                   	push   %eax
  102136:	e8 e9 00 00 00       	call   102224 <dprintf>

	va_list ap;
	va_start(ap, fmt);
  10213b:	8d 44 24 2c          	lea    0x2c(%esp),%eax
	vdprintf(fmt, ap);
  10213f:	83 c4 08             	add    $0x8,%esp
  102142:	50                   	push   %eax
  102143:	ff 74 24 24          	pushl  0x24(%esp)
  102147:	e8 79 00 00 00       	call   1021c5 <vdprintf>
	va_end(ap);
}
  10214c:	83 c4 18             	add    $0x18,%esp
  10214f:	5b                   	pop    %ebx
  102150:	c3                   	ret    

00102151 <cputs>:
    char buf[CONSOLE_BUFFER_SIZE];
};

static void
cputs (const char *str)
{
  102151:	56                   	push   %esi
  102152:	53                   	push   %ebx
  102153:	83 ec 04             	sub    $0x4,%esp
  102156:	e8 c0 e1 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  10215b:	81 c3 a5 7e 00 00    	add    $0x7ea5,%ebx
  102161:	89 c6                	mov    %eax,%esi
    while (*str)
  102163:	eb 12                	jmp    102177 <cputs+0x26>
    {
        cons_putc (*str);
  102165:	83 ec 0c             	sub    $0xc,%esp
  102168:	0f be c0             	movsbl %al,%eax
  10216b:	50                   	push   %eax
  10216c:	e8 8b e2 ff ff       	call   1003fc <cons_putc>
        str += 1;
  102171:	83 c6 01             	add    $0x1,%esi
  102174:	83 c4 10             	add    $0x10,%esp
    while (*str)
  102177:	0f b6 06             	movzbl (%esi),%eax
  10217a:	84 c0                	test   %al,%al
  10217c:	75 e7                	jne    102165 <cputs+0x14>
    }
}
  10217e:	83 c4 04             	add    $0x4,%esp
  102181:	5b                   	pop    %ebx
  102182:	5e                   	pop    %esi
  102183:	c3                   	ret    

00102184 <putch>:

static void
putch (int ch, struct dprintbuf *b)
{
  102184:	53                   	push   %ebx
  102185:	83 ec 08             	sub    $0x8,%esp
  102188:	8b 5c 24 14          	mov    0x14(%esp),%ebx
    b->buf[b->idx++] = ch;
  10218c:	8b 13                	mov    (%ebx),%edx
  10218e:	8d 42 01             	lea    0x1(%edx),%eax
  102191:	89 03                	mov    %eax,(%ebx)
  102193:	8b 4c 24 10          	mov    0x10(%esp),%ecx
  102197:	88 4c 13 08          	mov    %cl,0x8(%ebx,%edx,1)
    if (b->idx == CONSOLE_BUFFER_SIZE - 1)
  10219b:	3d ff 01 00 00       	cmp    $0x1ff,%eax
  1021a0:	74 0e                	je     1021b0 <putch+0x2c>
    {
        b->buf[b->idx] = 0;
        cputs (b->buf);
        b->idx = 0;
    }
    b->cnt++;
  1021a2:	8b 43 04             	mov    0x4(%ebx),%eax
  1021a5:	83 c0 01             	add    $0x1,%eax
  1021a8:	89 43 04             	mov    %eax,0x4(%ebx)
}
  1021ab:	83 c4 08             	add    $0x8,%esp
  1021ae:	5b                   	pop    %ebx
  1021af:	c3                   	ret    
        b->buf[b->idx] = 0;
  1021b0:	c6 44 13 09 00       	movb   $0x0,0x9(%ebx,%edx,1)
        cputs (b->buf);
  1021b5:	8d 43 08             	lea    0x8(%ebx),%eax
  1021b8:	e8 94 ff ff ff       	call   102151 <cputs>
        b->idx = 0;
  1021bd:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  1021c3:	eb dd                	jmp    1021a2 <putch+0x1e>

001021c5 <vdprintf>:

int
vdprintf (const char *fmt, va_list ap)
{
  1021c5:	53                   	push   %ebx
  1021c6:	81 ec 18 02 00 00    	sub    $0x218,%esp
  1021cc:	e8 4a e1 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  1021d1:	81 c3 2f 7e 00 00    	add    $0x7e2f,%ebx
    struct dprintbuf b;

    b.idx = 0;
  1021d7:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  1021de:	00 
    b.cnt = 0;
  1021df:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  1021e6:	00 
    vprintfmt ((void*) putch, &b, fmt, ap);
  1021e7:	ff b4 24 24 02 00 00 	pushl  0x224(%esp)
  1021ee:	ff b4 24 24 02 00 00 	pushl  0x224(%esp)
  1021f5:	8d 44 24 10          	lea    0x10(%esp),%eax
  1021f9:	50                   	push   %eax
  1021fa:	8d 83 84 81 ff ff    	lea    -0x7e7c(%ebx),%eax
  102200:	50                   	push   %eax
  102201:	e8 6b 01 00 00       	call   102371 <vprintfmt>

    b.buf[b.idx] = 0;
  102206:	8b 44 24 18          	mov    0x18(%esp),%eax
  10220a:	c6 44 04 20 00       	movb   $0x0,0x20(%esp,%eax,1)
    cputs (b.buf);
  10220f:	8d 44 24 20          	lea    0x20(%esp),%eax
  102213:	e8 39 ff ff ff       	call   102151 <cputs>

    return b.cnt;
}
  102218:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  10221c:	81 c4 28 02 00 00    	add    $0x228,%esp
  102222:	5b                   	pop    %ebx
  102223:	c3                   	ret    

00102224 <dprintf>:

int
dprintf (const char *fmt, ...)
{
  102224:	83 ec 0c             	sub    $0xc,%esp
    va_list ap;
    int cnt;

    va_start(ap, fmt);
  102227:	8d 44 24 14          	lea    0x14(%esp),%eax
    cnt = vdprintf (fmt, ap);
  10222b:	83 ec 08             	sub    $0x8,%esp
  10222e:	50                   	push   %eax
  10222f:	ff 74 24 1c          	pushl  0x1c(%esp)
  102233:	e8 8d ff ff ff       	call   1021c5 <vdprintf>
    va_end(ap);

    return cnt;
}
  102238:	83 c4 1c             	add    $0x1c,%esp
  10223b:	c3                   	ret    

0010223c <printnum>:
 * using specified putch function and associated pointer putdat.
 */
static void
printnum(putch_t putch, void *putdat,
	 unsigned long long num, unsigned base, int width, int padc)
{
  10223c:	55                   	push   %ebp
  10223d:	57                   	push   %edi
  10223e:	56                   	push   %esi
  10223f:	53                   	push   %ebx
  102240:	83 ec 2c             	sub    $0x2c,%esp
  102243:	e8 cf e0 ff ff       	call   100317 <__x86.get_pc_thunk.cx>
  102248:	81 c1 b8 7d 00 00    	add    $0x7db8,%ecx
  10224e:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  102252:	89 c6                	mov    %eax,%esi
  102254:	89 d7                	mov    %edx,%edi
  102256:	8b 44 24 40          	mov    0x40(%esp),%eax
  10225a:	8b 54 24 44          	mov    0x44(%esp),%edx
  10225e:	89 44 24 18          	mov    %eax,0x18(%esp)
  102262:	89 54 24 1c          	mov    %edx,0x1c(%esp)
  102266:	8b 6c 24 50          	mov    0x50(%esp),%ebp
	/* first recursively print all preceding (more significant) digits */
	if (num >= base) {
  10226a:	8b 4c 24 48          	mov    0x48(%esp),%ecx
  10226e:	bb 00 00 00 00       	mov    $0x0,%ebx
  102273:	89 4c 24 10          	mov    %ecx,0x10(%esp)
  102277:	89 5c 24 14          	mov    %ebx,0x14(%esp)
  10227b:	39 d3                	cmp    %edx,%ebx
  10227d:	72 0a                	jb     102289 <printnum+0x4d>
  10227f:	39 44 24 48          	cmp    %eax,0x48(%esp)
  102283:	0f 87 82 00 00 00    	ja     10230b <printnum+0xcf>
		printnum(putch, putdat, num / base, base, width - 1, padc);
  102289:	83 ec 0c             	sub    $0xc,%esp
  10228c:	55                   	push   %ebp
  10228d:	8b 44 24 5c          	mov    0x5c(%esp),%eax
  102291:	8d 58 ff             	lea    -0x1(%eax),%ebx
  102294:	53                   	push   %ebx
  102295:	ff 74 24 5c          	pushl  0x5c(%esp)
  102299:	83 ec 08             	sub    $0x8,%esp
  10229c:	ff 74 24 34          	pushl  0x34(%esp)
  1022a0:	ff 74 24 34          	pushl  0x34(%esp)
  1022a4:	ff 74 24 44          	pushl  0x44(%esp)
  1022a8:	ff 74 24 44          	pushl  0x44(%esp)
  1022ac:	8b 5c 24 3c          	mov    0x3c(%esp),%ebx
  1022b0:	e8 6b 2d 00 00       	call   105020 <__udivdi3>
  1022b5:	83 c4 18             	add    $0x18,%esp
  1022b8:	52                   	push   %edx
  1022b9:	50                   	push   %eax
  1022ba:	89 fa                	mov    %edi,%edx
  1022bc:	89 f0                	mov    %esi,%eax
  1022be:	e8 79 ff ff ff       	call   10223c <printnum>
  1022c3:	83 c4 20             	add    $0x20,%esp
  1022c6:	eb 11                	jmp    1022d9 <printnum+0x9d>
	} else {
		/* print any needed pad characters before first digit */
		while (--width > 0)
			putch(padc, putdat);
  1022c8:	83 ec 08             	sub    $0x8,%esp
  1022cb:	57                   	push   %edi
  1022cc:	55                   	push   %ebp
  1022cd:	ff d6                	call   *%esi
  1022cf:	83 c4 10             	add    $0x10,%esp
		while (--width > 0)
  1022d2:	83 eb 01             	sub    $0x1,%ebx
  1022d5:	85 db                	test   %ebx,%ebx
  1022d7:	7f ef                	jg     1022c8 <printnum+0x8c>
	}

	// then print this (the least significant) digit
	putch("0123456789abcdef"[num % base], putdat);
  1022d9:	ff 74 24 14          	pushl  0x14(%esp)
  1022dd:	ff 74 24 14          	pushl  0x14(%esp)
  1022e1:	ff 74 24 24          	pushl  0x24(%esp)
  1022e5:	ff 74 24 24          	pushl  0x24(%esp)
  1022e9:	8b 6c 24 1c          	mov    0x1c(%esp),%ebp
  1022ed:	89 eb                	mov    %ebp,%ebx
  1022ef:	e8 5c 2e 00 00       	call   105150 <__umoddi3>
  1022f4:	83 c4 08             	add    $0x8,%esp
  1022f7:	57                   	push   %edi
  1022f8:	0f be 84 05 a6 b6 ff 	movsbl -0x495a(%ebp,%eax,1),%eax
  1022ff:	ff 
  102300:	50                   	push   %eax
  102301:	ff d6                	call   *%esi
}
  102303:	83 c4 3c             	add    $0x3c,%esp
  102306:	5b                   	pop    %ebx
  102307:	5e                   	pop    %esi
  102308:	5f                   	pop    %edi
  102309:	5d                   	pop    %ebp
  10230a:	c3                   	ret    
  10230b:	8b 5c 24 4c          	mov    0x4c(%esp),%ebx
  10230f:	eb c1                	jmp    1022d2 <printnum+0x96>

00102311 <getuint>:
 * depending on the lflag parameter.
 */
static unsigned long long
getuint(va_list *ap, int lflag)
{
	if (lflag >= 2)
  102311:	83 fa 01             	cmp    $0x1,%edx
  102314:	7f 13                	jg     102329 <getuint+0x18>
		return va_arg(*ap, unsigned long long);
	else if (lflag)
  102316:	85 d2                	test   %edx,%edx
  102318:	75 1c                	jne    102336 <getuint+0x25>
		return va_arg(*ap, unsigned long);
	else
		return va_arg(*ap, unsigned int);
  10231a:	8b 10                	mov    (%eax),%edx
  10231c:	8d 4a 04             	lea    0x4(%edx),%ecx
  10231f:	89 08                	mov    %ecx,(%eax)
  102321:	8b 02                	mov    (%edx),%eax
  102323:	ba 00 00 00 00       	mov    $0x0,%edx
}
  102328:	c3                   	ret    
		return va_arg(*ap, unsigned long long);
  102329:	8b 10                	mov    (%eax),%edx
  10232b:	8d 4a 08             	lea    0x8(%edx),%ecx
  10232e:	89 08                	mov    %ecx,(%eax)
  102330:	8b 02                	mov    (%edx),%eax
  102332:	8b 52 04             	mov    0x4(%edx),%edx
  102335:	c3                   	ret    
		return va_arg(*ap, unsigned long);
  102336:	8b 10                	mov    (%eax),%edx
  102338:	8d 4a 04             	lea    0x4(%edx),%ecx
  10233b:	89 08                	mov    %ecx,(%eax)
  10233d:	8b 02                	mov    (%edx),%eax
  10233f:	ba 00 00 00 00       	mov    $0x0,%edx
  102344:	c3                   	ret    

00102345 <getint>:
 * because of sign extension
 */
static long long
getint(va_list *ap, int lflag)
{
	if (lflag >= 2)
  102345:	83 fa 01             	cmp    $0x1,%edx
  102348:	7f 0f                	jg     102359 <getint+0x14>
		return va_arg(*ap, long long);
	else if (lflag)
  10234a:	85 d2                	test   %edx,%edx
  10234c:	75 18                	jne    102366 <getint+0x21>
		return va_arg(*ap, long);
	else
		return va_arg(*ap, int);
  10234e:	8b 10                	mov    (%eax),%edx
  102350:	8d 4a 04             	lea    0x4(%edx),%ecx
  102353:	89 08                	mov    %ecx,(%eax)
  102355:	8b 02                	mov    (%edx),%eax
  102357:	99                   	cltd   
}
  102358:	c3                   	ret    
		return va_arg(*ap, long long);
  102359:	8b 10                	mov    (%eax),%edx
  10235b:	8d 4a 08             	lea    0x8(%edx),%ecx
  10235e:	89 08                	mov    %ecx,(%eax)
  102360:	8b 02                	mov    (%edx),%eax
  102362:	8b 52 04             	mov    0x4(%edx),%edx
  102365:	c3                   	ret    
		return va_arg(*ap, long);
  102366:	8b 10                	mov    (%eax),%edx
  102368:	8d 4a 04             	lea    0x4(%edx),%ecx
  10236b:	89 08                	mov    %ecx,(%eax)
  10236d:	8b 02                	mov    (%edx),%eax
  10236f:	99                   	cltd   
  102370:	c3                   	ret    

00102371 <vprintfmt>:

void
vprintfmt(putch_t putch, void *putdat, const char *fmt, va_list ap)
{
  102371:	55                   	push   %ebp
  102372:	57                   	push   %edi
  102373:	56                   	push   %esi
  102374:	53                   	push   %ebx
  102375:	83 ec 2c             	sub    $0x2c,%esp
  102378:	e8 64 ea ff ff       	call   100de1 <__x86.get_pc_thunk.ax>
  10237d:	05 83 7c 00 00       	add    $0x7c83,%eax
  102382:	89 44 24 08          	mov    %eax,0x8(%esp)
  102386:	8b 74 24 40          	mov    0x40(%esp),%esi
  10238a:	8b 7c 24 44          	mov    0x44(%esp),%edi
  10238e:	8b 6c 24 48          	mov    0x48(%esp),%ebp
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
  102392:	8d 5d 01             	lea    0x1(%ebp),%ebx
  102395:	0f b6 45 00          	movzbl 0x0(%ebp),%eax
  102399:	83 f8 25             	cmp    $0x25,%eax
  10239c:	74 16                	je     1023b4 <vprintfmt+0x43>
			if (ch == '\0')
  10239e:	85 c0                	test   %eax,%eax
  1023a0:	0f 84 18 03 00 00    	je     1026be <.L29+0x1c>
				return;
			putch(ch, putdat);
  1023a6:	83 ec 08             	sub    $0x8,%esp
  1023a9:	57                   	push   %edi
  1023aa:	50                   	push   %eax
  1023ab:	ff d6                	call   *%esi
		while ((ch = *(unsigned char *) fmt++) != '%') {
  1023ad:	83 c4 10             	add    $0x10,%esp
  1023b0:	89 dd                	mov    %ebx,%ebp
  1023b2:	eb de                	jmp    102392 <vprintfmt+0x21>
  1023b4:	c6 44 24 13 20       	movb   $0x20,0x13(%esp)
  1023b9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1023c0:	c7 44 24 1c ff ff ff 	movl   $0xffffffff,0x1c(%esp)
  1023c7:	ff 
  1023c8:	c7 44 24 0c ff ff ff 	movl   $0xffffffff,0xc(%esp)
  1023cf:	ff 
  1023d0:	ba 00 00 00 00       	mov    $0x0,%edx
  1023d5:	89 54 24 18          	mov    %edx,0x18(%esp)
		width = -1;
		precision = -1;
		lflag = 0;
		altflag = 0;
	reswitch:
		switch (ch = *(unsigned char *) fmt++) {
  1023d9:	8d 6b 01             	lea    0x1(%ebx),%ebp
  1023dc:	0f b6 03             	movzbl (%ebx),%eax
  1023df:	0f b6 d0             	movzbl %al,%edx
  1023e2:	89 54 24 14          	mov    %edx,0x14(%esp)
  1023e6:	83 e8 23             	sub    $0x23,%eax
  1023e9:	3c 55                	cmp    $0x55,%al
  1023eb:	0f 87 b1 02 00 00    	ja     1026a2 <.L29>
  1023f1:	0f b6 c0             	movzbl %al,%eax
  1023f4:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  1023f8:	03 8c 81 c0 b6 ff ff 	add    -0x4940(%ecx,%eax,4),%ecx
  1023ff:	ff e1                	jmp    *%ecx

00102401 <.L27>:
  102401:	89 eb                	mov    %ebp,%ebx

			// flag to pad on the right
		case '-':
			padc = '-';
  102403:	c6 44 24 13 2d       	movb   $0x2d,0x13(%esp)
  102408:	eb cf                	jmp    1023d9 <vprintfmt+0x68>

0010240a <.L58>:
		switch (ch = *(unsigned char *) fmt++) {
  10240a:	89 eb                	mov    %ebp,%ebx
			goto reswitch;

			// flag to pad with 0's instead of spaces
		case '0':
			padc = '0';
  10240c:	c6 44 24 13 30       	movb   $0x30,0x13(%esp)
  102411:	eb c6                	jmp    1023d9 <vprintfmt+0x68>
		switch (ch = *(unsigned char *) fmt++) {
  102413:	89 eb                	mov    %ebp,%ebx
			precision = va_arg(ap, int);
			goto process_precision;

		case '.':
			if (width < 0)
				width = 0;
  102415:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  10241c:	00 
  10241d:	eb ba                	jmp    1023d9 <vprintfmt+0x68>

0010241f <.L59>:
		switch (ch = *(unsigned char *) fmt++) {
  10241f:	b8 00 00 00 00       	mov    $0x0,%eax
  102424:	8b 4c 24 14          	mov    0x14(%esp),%ecx
  102428:	8b 54 24 18          	mov    0x18(%esp),%edx
				precision = precision * 10 + ch - '0';
  10242c:	8d 1c 80             	lea    (%eax,%eax,4),%ebx
  10242f:	8d 04 1b             	lea    (%ebx,%ebx,1),%eax
  102432:	8d 44 01 d0          	lea    -0x30(%ecx,%eax,1),%eax
				ch = *fmt;
  102436:	0f be 4d 00          	movsbl 0x0(%ebp),%ecx
				if (ch < '0' || ch > '9')
  10243a:	8d 59 d0             	lea    -0x30(%ecx),%ebx
  10243d:	83 fb 09             	cmp    $0x9,%ebx
  102440:	77 54                	ja     102496 <.L30+0xe>
			for (precision = 0; ; ++fmt) {
  102442:	83 c5 01             	add    $0x1,%ebp
				precision = precision * 10 + ch - '0';
  102445:	eb e5                	jmp    10242c <.L59+0xd>

00102447 <.L33>:
			precision = va_arg(ap, int);
  102447:	8b 44 24 4c          	mov    0x4c(%esp),%eax
  10244b:	8d 48 04             	lea    0x4(%eax),%ecx
  10244e:	89 4c 24 4c          	mov    %ecx,0x4c(%esp)
  102452:	8b 00                	mov    (%eax),%eax
  102454:	89 44 24 1c          	mov    %eax,0x1c(%esp)
		switch (ch = *(unsigned char *) fmt++) {
  102458:	89 eb                	mov    %ebp,%ebx
		case '#':
			altflag = 1;
			goto reswitch;

		process_precision:
			if (width < 0)
  10245a:	83 7c 24 0c 00       	cmpl   $0x0,0xc(%esp)
  10245f:	0f 89 74 ff ff ff    	jns    1023d9 <vprintfmt+0x68>
				width = precision, precision = -1;
  102465:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  102469:	89 44 24 0c          	mov    %eax,0xc(%esp)
  10246d:	c7 44 24 1c ff ff ff 	movl   $0xffffffff,0x1c(%esp)
  102474:	ff 
  102475:	e9 5f ff ff ff       	jmp    1023d9 <vprintfmt+0x68>

0010247a <.L34>:
			if (width < 0)
  10247a:	83 7c 24 0c 00       	cmpl   $0x0,0xc(%esp)
  10247f:	78 92                	js     102413 <.L58+0x9>
		switch (ch = *(unsigned char *) fmt++) {
  102481:	89 eb                	mov    %ebp,%ebx
  102483:	e9 51 ff ff ff       	jmp    1023d9 <vprintfmt+0x68>

00102488 <.L30>:
  102488:	89 eb                	mov    %ebp,%ebx
			altflag = 1;
  10248a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
			goto reswitch;
  102491:	e9 43 ff ff ff       	jmp    1023d9 <vprintfmt+0x68>
  102496:	89 54 24 18          	mov    %edx,0x18(%esp)
  10249a:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  10249e:	89 eb                	mov    %ebp,%ebx
  1024a0:	eb b8                	jmp    10245a <.L33+0x13>

001024a2 <.L38>:
			goto reswitch;

			// long flag (doubled for long long)
		case 'l':
			lflag++;
  1024a2:	83 44 24 18 01       	addl   $0x1,0x18(%esp)
		switch (ch = *(unsigned char *) fmt++) {
  1024a7:	89 eb                	mov    %ebp,%ebx
			goto reswitch;
  1024a9:	e9 2b ff ff ff       	jmp    1023d9 <vprintfmt+0x68>

001024ae <.L36>:

			// character
		case 'c':
			putch(va_arg(ap, int), putdat);
  1024ae:	8b 44 24 4c          	mov    0x4c(%esp),%eax
  1024b2:	8d 50 04             	lea    0x4(%eax),%edx
  1024b5:	89 54 24 4c          	mov    %edx,0x4c(%esp)
  1024b9:	83 ec 08             	sub    $0x8,%esp
  1024bc:	57                   	push   %edi
  1024bd:	ff 30                	pushl  (%eax)
  1024bf:	ff d6                	call   *%esi
			break;
  1024c1:	83 c4 10             	add    $0x10,%esp
  1024c4:	e9 c9 fe ff ff       	jmp    102392 <vprintfmt+0x21>

001024c9 <.L40>:

			// string
		case 's':
			if ((p = va_arg(ap, char *)) == NULL)
  1024c9:	8b 44 24 4c          	mov    0x4c(%esp),%eax
  1024cd:	8d 50 04             	lea    0x4(%eax),%edx
  1024d0:	89 54 24 4c          	mov    %edx,0x4c(%esp)
  1024d4:	8b 00                	mov    (%eax),%eax
  1024d6:	89 44 24 14          	mov    %eax,0x14(%esp)
  1024da:	85 c0                	test   %eax,%eax
  1024dc:	74 2a                	je     102508 <.L40+0x3f>
				p = "(null)";
			if (width > 0 && padc != '-')
  1024de:	83 7c 24 0c 00       	cmpl   $0x0,0xc(%esp)
  1024e3:	0f 9f c2             	setg   %dl
  1024e6:	80 7c 24 13 2d       	cmpb   $0x2d,0x13(%esp)
  1024eb:	0f 95 c0             	setne  %al
  1024ee:	84 c2                	test   %al,%dl
  1024f0:	75 26                	jne    102518 <.L40+0x4f>
  1024f2:	8b 44 24 14          	mov    0x14(%esp),%eax
  1024f6:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
  1024fa:	89 74 24 40          	mov    %esi,0x40(%esp)
  1024fe:	8b 74 24 0c          	mov    0xc(%esp),%esi
  102502:	89 6c 24 48          	mov    %ebp,0x48(%esp)
  102506:	eb 70                	jmp    102578 <.L40+0xaf>
				p = "(null)";
  102508:	8b 44 24 08          	mov    0x8(%esp),%eax
  10250c:	8d 80 b7 b6 ff ff    	lea    -0x4949(%eax),%eax
  102512:	89 44 24 14          	mov    %eax,0x14(%esp)
  102516:	eb c6                	jmp    1024de <.L40+0x15>
				for (width -= strnlen(p, precision);
  102518:	83 ec 08             	sub    $0x8,%esp
  10251b:	ff 74 24 24          	pushl  0x24(%esp)
  10251f:	ff 74 24 20          	pushl  0x20(%esp)
  102523:	8b 5c 24 18          	mov    0x18(%esp),%ebx
  102527:	e8 54 fa ff ff       	call   101f80 <strnlen>
  10252c:	29 44 24 1c          	sub    %eax,0x1c(%esp)
  102530:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  102534:	83 c4 10             	add    $0x10,%esp
  102537:	89 d3                	mov    %edx,%ebx
  102539:	eb 12                	jmp    10254d <.L40+0x84>
				     width > 0;
				     width--)
					putch(padc, putdat);
  10253b:	83 ec 08             	sub    $0x8,%esp
  10253e:	57                   	push   %edi
  10253f:	0f be 44 24 1f       	movsbl 0x1f(%esp),%eax
  102544:	50                   	push   %eax
  102545:	ff d6                	call   *%esi
				     width--)
  102547:	83 eb 01             	sub    $0x1,%ebx
  10254a:	83 c4 10             	add    $0x10,%esp
				for (width -= strnlen(p, precision);
  10254d:	85 db                	test   %ebx,%ebx
  10254f:	7f ea                	jg     10253b <.L40+0x72>
  102551:	89 da                	mov    %ebx,%edx
  102553:	8b 44 24 14          	mov    0x14(%esp),%eax
  102557:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
  10255b:	89 74 24 40          	mov    %esi,0x40(%esp)
  10255f:	89 d6                	mov    %edx,%esi
  102561:	89 6c 24 48          	mov    %ebp,0x48(%esp)
  102565:	eb 11                	jmp    102578 <.L40+0xaf>
				     (precision < 0 || --precision >= 0);
			     width--)
				if (altflag && (ch < ' ' || ch > '~'))
					putch('?', putdat);
				else
					putch(ch, putdat);
  102567:	83 ec 08             	sub    $0x8,%esp
  10256a:	57                   	push   %edi
  10256b:	52                   	push   %edx
  10256c:	ff 54 24 50          	call   *0x50(%esp)
  102570:	83 c4 10             	add    $0x10,%esp
			     width--)
  102573:	83 ee 01             	sub    $0x1,%esi
			     (ch = *p++) != '\0' &&
  102576:	89 e8                	mov    %ebp,%eax
  102578:	8d 68 01             	lea    0x1(%eax),%ebp
  10257b:	0f b6 00             	movzbl (%eax),%eax
  10257e:	0f be d0             	movsbl %al,%edx
			for (;
  102581:	85 d2                	test   %edx,%edx
  102583:	74 35                	je     1025ba <.L40+0xf1>
			     (ch = *p++) != '\0' &&
  102585:	85 db                	test   %ebx,%ebx
  102587:	78 05                	js     10258e <.L40+0xc5>
				     (precision < 0 || --precision >= 0);
  102589:	83 eb 01             	sub    $0x1,%ebx
  10258c:	78 20                	js     1025ae <.L40+0xe5>
				if (altflag && (ch < ' ' || ch > '~'))
  10258e:	83 3c 24 00          	cmpl   $0x0,(%esp)
  102592:	74 d3                	je     102567 <.L40+0x9e>
  102594:	0f be c0             	movsbl %al,%eax
  102597:	83 e8 20             	sub    $0x20,%eax
  10259a:	83 f8 5e             	cmp    $0x5e,%eax
  10259d:	76 c8                	jbe    102567 <.L40+0x9e>
					putch('?', putdat);
  10259f:	83 ec 08             	sub    $0x8,%esp
  1025a2:	57                   	push   %edi
  1025a3:	6a 3f                	push   $0x3f
  1025a5:	ff 54 24 50          	call   *0x50(%esp)
  1025a9:	83 c4 10             	add    $0x10,%esp
  1025ac:	eb c5                	jmp    102573 <.L40+0xaa>
  1025ae:	89 f3                	mov    %esi,%ebx
  1025b0:	8b 74 24 40          	mov    0x40(%esp),%esi
  1025b4:	8b 6c 24 48          	mov    0x48(%esp),%ebp
  1025b8:	eb 0a                	jmp    1025c4 <.L40+0xfb>
  1025ba:	89 f3                	mov    %esi,%ebx
  1025bc:	8b 74 24 40          	mov    0x40(%esp),%esi
  1025c0:	8b 6c 24 48          	mov    0x48(%esp),%ebp
			for (; width > 0; width--)
  1025c4:	85 db                	test   %ebx,%ebx
  1025c6:	0f 8e c6 fd ff ff    	jle    102392 <vprintfmt+0x21>
				putch(' ', putdat);
  1025cc:	83 ec 08             	sub    $0x8,%esp
  1025cf:	57                   	push   %edi
  1025d0:	6a 20                	push   $0x20
  1025d2:	ff d6                	call   *%esi
			for (; width > 0; width--)
  1025d4:	83 eb 01             	sub    $0x1,%ebx
  1025d7:	83 c4 10             	add    $0x10,%esp
  1025da:	eb e8                	jmp    1025c4 <.L40+0xfb>

001025dc <.L37>:
  1025dc:	8b 54 24 18          	mov    0x18(%esp),%edx
			break;

			// (signed) decimal
		case 'd':
			num = getint(&ap, lflag);
  1025e0:	8d 44 24 4c          	lea    0x4c(%esp),%eax
  1025e4:	e8 5c fd ff ff       	call   102345 <getint>
  1025e9:	89 04 24             	mov    %eax,(%esp)
  1025ec:	89 54 24 04          	mov    %edx,0x4(%esp)
			if ((long long) num < 0) {
  1025f0:	85 d2                	test   %edx,%edx
  1025f2:	78 07                	js     1025fb <.L37+0x1f>
				putch('-', putdat);
				num = -(long long) num;
			}
			base = 10;
  1025f4:	bb 0a 00 00 00       	mov    $0xa,%ebx
  1025f9:	eb 33                	jmp    10262e <.L41+0x12>
				putch('-', putdat);
  1025fb:	83 ec 08             	sub    $0x8,%esp
  1025fe:	57                   	push   %edi
  1025ff:	6a 2d                	push   $0x2d
  102601:	ff d6                	call   *%esi
				num = -(long long) num;
  102603:	8b 44 24 10          	mov    0x10(%esp),%eax
  102607:	8b 54 24 14          	mov    0x14(%esp),%edx
  10260b:	f7 d8                	neg    %eax
  10260d:	83 d2 00             	adc    $0x0,%edx
  102610:	f7 da                	neg    %edx
  102612:	83 c4 10             	add    $0x10,%esp
			base = 10;
  102615:	bb 0a 00 00 00       	mov    $0xa,%ebx
  10261a:	eb 12                	jmp    10262e <.L41+0x12>

0010261c <.L41>:
  10261c:	8b 54 24 18          	mov    0x18(%esp),%edx
			goto number;

			// unsigned decimal
		case 'u':
			num = getuint(&ap, lflag);
  102620:	8d 44 24 4c          	lea    0x4c(%esp),%eax
  102624:	e8 e8 fc ff ff       	call   102311 <getuint>
			base = 10;
  102629:	bb 0a 00 00 00       	mov    $0xa,%ebx
			// (unsigned) hexadecimal
		case 'x':
			num = getuint(&ap, lflag);
			base = 16;
		number:
			printnum(putch, putdat, num, base, width, padc);
  10262e:	83 ec 0c             	sub    $0xc,%esp
  102631:	0f be 4c 24 1f       	movsbl 0x1f(%esp),%ecx
  102636:	51                   	push   %ecx
  102637:	ff 74 24 1c          	pushl  0x1c(%esp)
  10263b:	53                   	push   %ebx
  10263c:	52                   	push   %edx
  10263d:	50                   	push   %eax
  10263e:	89 fa                	mov    %edi,%edx
  102640:	89 f0                	mov    %esi,%eax
  102642:	e8 f5 fb ff ff       	call   10223c <printnum>
			break;
  102647:	83 c4 20             	add    $0x20,%esp
  10264a:	e9 43 fd ff ff       	jmp    102392 <vprintfmt+0x21>

0010264f <.L39>:
			putch('0', putdat);
  10264f:	83 ec 08             	sub    $0x8,%esp
  102652:	57                   	push   %edi
  102653:	6a 30                	push   $0x30
  102655:	ff d6                	call   *%esi
			putch('x', putdat);
  102657:	83 c4 08             	add    $0x8,%esp
  10265a:	57                   	push   %edi
  10265b:	6a 78                	push   $0x78
  10265d:	ff d6                	call   *%esi
				(uintptr_t) va_arg(ap, void *);
  10265f:	8b 44 24 5c          	mov    0x5c(%esp),%eax
  102663:	8d 50 04             	lea    0x4(%eax),%edx
  102666:	89 54 24 5c          	mov    %edx,0x5c(%esp)
			num = (unsigned long long)
  10266a:	8b 00                	mov    (%eax),%eax
  10266c:	ba 00 00 00 00       	mov    $0x0,%edx
			goto number;
  102671:	83 c4 10             	add    $0x10,%esp
			base = 16;
  102674:	bb 10 00 00 00       	mov    $0x10,%ebx
			goto number;
  102679:	eb b3                	jmp    10262e <.L41+0x12>

0010267b <.L42>:
  10267b:	8b 54 24 18          	mov    0x18(%esp),%edx
			num = getuint(&ap, lflag);
  10267f:	8d 44 24 4c          	lea    0x4c(%esp),%eax
  102683:	e8 89 fc ff ff       	call   102311 <getuint>
			base = 16;
  102688:	bb 10 00 00 00       	mov    $0x10,%ebx
  10268d:	eb 9f                	jmp    10262e <.L41+0x12>

0010268f <.L32>:
  10268f:	8b 4c 24 14          	mov    0x14(%esp),%ecx

			// escaped '%' character
		case '%':
			putch(ch, putdat);
  102693:	83 ec 08             	sub    $0x8,%esp
  102696:	57                   	push   %edi
  102697:	51                   	push   %ecx
  102698:	ff d6                	call   *%esi
			break;
  10269a:	83 c4 10             	add    $0x10,%esp
  10269d:	e9 f0 fc ff ff       	jmp    102392 <vprintfmt+0x21>

001026a2 <.L29>:

			// unrecognized escape sequence - just print it literally
		default:
			putch('%', putdat);
  1026a2:	83 ec 08             	sub    $0x8,%esp
  1026a5:	57                   	push   %edi
  1026a6:	6a 25                	push   $0x25
  1026a8:	ff d6                	call   *%esi
			for (fmt--; fmt[-1] != '%'; fmt--)
  1026aa:	83 c4 10             	add    $0x10,%esp
  1026ad:	89 dd                	mov    %ebx,%ebp
  1026af:	80 7d ff 25          	cmpb   $0x25,-0x1(%ebp)
  1026b3:	0f 84 d9 fc ff ff    	je     102392 <vprintfmt+0x21>
  1026b9:	83 ed 01             	sub    $0x1,%ebp
  1026bc:	eb f1                	jmp    1026af <.L29+0xd>
				/* do nothing */;
			break;
		}
	}
}
  1026be:	83 c4 2c             	add    $0x2c,%esp
  1026c1:	5b                   	pop    %ebx
  1026c2:	5e                   	pop    %esi
  1026c3:	5f                   	pop    %edi
  1026c4:	5d                   	pop    %ebp
  1026c5:	c3                   	ret    

001026c6 <tss_switch>:

segdesc_t gdt_LOC[CPU_GDT_NDESC];
tss_t tss_LOC[64];

void tss_switch(uint32_t pid)
{
  1026c6:	55                   	push   %ebp
  1026c7:	57                   	push   %edi
  1026c8:	56                   	push   %esi
  1026c9:	53                   	push   %ebx
  1026ca:	83 ec 18             	sub    $0x18,%esp
  1026cd:	e8 49 dc ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  1026d2:	81 c3 2e 79 00 00    	add    $0x792e,%ebx
	gdt_LOC[CPU_GDT_TSS >> 3] =
		SEGDESC16(STS_T32A,
  1026d8:	69 54 24 2c ec 00 00 	imul   $0xec,0x2c(%esp),%edx
  1026df:	00 
  1026e0:	81 c2 40 30 9b 00    	add    $0x9b3040,%edx
  1026e6:	89 d1                	mov    %edx,%ecx
  1026e8:	c1 e9 10             	shr    $0x10,%ecx
  1026eb:	89 d6                	mov    %edx,%esi
  1026ed:	c1 ee 18             	shr    $0x18,%esi
	gdt_LOC[CPU_GDT_TSS >> 3] =
  1026f0:	c7 c0 00 30 9b 00    	mov    $0x9b3000,%eax
  1026f6:	66 c7 40 28 eb 00    	movw   $0xeb,0x28(%eax)
  1026fc:	66 89 50 2a          	mov    %dx,0x2a(%eax)
  102700:	88 48 2c             	mov    %cl,0x2c(%eax)
  102703:	0f b6 50 2d          	movzbl 0x2d(%eax),%edx
  102707:	83 e2 f0             	and    $0xfffffff0,%edx
  10270a:	83 ca 09             	or     $0x9,%edx
  10270d:	83 e2 9f             	and    $0xffffff9f,%edx
  102710:	83 ca 80             	or     $0xffffff80,%edx
  102713:	89 d5                	mov    %edx,%ebp
  102715:	0f b6 48 2e          	movzbl 0x2e(%eax),%ecx
  102719:	83 e1 c0             	and    $0xffffffc0,%ecx
  10271c:	83 c9 40             	or     $0x40,%ecx
  10271f:	83 e1 7f             	and    $0x7f,%ecx
  102722:	88 48 2e             	mov    %cl,0x2e(%eax)
  102725:	89 f1                	mov    %esi,%ecx
  102727:	88 48 2f             	mov    %cl,0x2f(%eax)
			  (uint32_t) (&tss_LOC[pid]), sizeof(tss_t) - 1, 0);
	gdt_LOC[CPU_GDT_TSS >> 3].sd_s = 0;
  10272a:	89 ea                	mov    %ebp,%edx
  10272c:	83 e2 ef             	and    $0xffffffef,%edx
  10272f:	88 50 2d             	mov    %dl,0x2d(%eax)
	ltr(CPU_GDT_TSS);
  102732:	6a 28                	push   $0x28
  102734:	e8 20 03 00 00       	call   102a59 <ltr>
}
  102739:	83 c4 1c             	add    $0x1c,%esp
  10273c:	5b                   	pop    %ebx
  10273d:	5e                   	pop    %esi
  10273e:	5f                   	pop    %edi
  10273f:	5d                   	pop    %ebp
  102740:	c3                   	ret    

00102741 <seg_init>:

void seg_init (void)
{
  102741:	55                   	push   %ebp
  102742:	57                   	push   %edi
  102743:	56                   	push   %esi
  102744:	53                   	push   %ebx
  102745:	83 ec 34             	sub    $0x34,%esp
  102748:	e8 ce db ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  10274d:	81 c3 b3 78 00 00    	add    $0x78b3,%ebx
	/* clear BSS */
	extern uint8_t end[], edata[];
	memzero (edata, bsp_kstack - edata);
  102753:	c7 c6 00 20 97 00    	mov    $0x972000,%esi
  102759:	c7 c0 e0 fc 12 00    	mov    $0x12fce0,%eax
  10275f:	89 f2                	mov    %esi,%edx
  102761:	29 c2                	sub    %eax,%edx
  102763:	52                   	push   %edx
  102764:	50                   	push   %eax
  102765:	e8 7d f8 ff ff       	call   101fe7 <memzero>
	memzero (bsp_kstack + 4096, end - bsp_kstack - 4096);
  10276a:	c7 c0 20 8c df 00    	mov    $0xdf8c20,%eax
  102770:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  102774:	2d 00 10 00 00       	sub    $0x1000,%eax
  102779:	29 f0                	sub    %esi,%eax
  10277b:	83 c4 08             	add    $0x8,%esp
  10277e:	50                   	push   %eax
  10277f:	8d b6 00 10 00 00    	lea    0x1000(%esi),%esi
  102785:	56                   	push   %esi
  102786:	e8 5c f8 ff ff       	call   101fe7 <memzero>

	/* setup GDT */
	gdt_LOC[0] = SEGDESC_NULL
  10278b:	c7 c0 00 30 9b 00    	mov    $0x9b3000,%eax
  102791:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  102797:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	;
	/* 0x08: kernel code */
	gdt_LOC[CPU_GDT_KCODE >> 3] = SEGDESC32(STA_X | STA_R, 0x0, 0xffffffff, 0);
  10279e:	66 c7 40 08 ff ff    	movw   $0xffff,0x8(%eax)
  1027a4:	66 c7 40 0a 00 00    	movw   $0x0,0xa(%eax)
  1027aa:	c6 40 0c 00          	movb   $0x0,0xc(%eax)
  1027ae:	0f b6 50 0d          	movzbl 0xd(%eax),%edx
  1027b2:	83 e2 f0             	and    $0xfffffff0,%edx
  1027b5:	83 ca 1a             	or     $0x1a,%edx
  1027b8:	83 e2 9f             	and    $0xffffff9f,%edx
  1027bb:	83 ca 80             	or     $0xffffff80,%edx
  1027be:	88 50 0d             	mov    %dl,0xd(%eax)
  1027c1:	0f b6 50 0e          	movzbl 0xe(%eax),%edx
  1027c5:	83 ca 0f             	or     $0xf,%edx
  1027c8:	83 e2 cf             	and    $0xffffffcf,%edx
  1027cb:	83 ca c0             	or     $0xffffffc0,%edx
  1027ce:	88 50 0e             	mov    %dl,0xe(%eax)
  1027d1:	c6 40 0f 00          	movb   $0x0,0xf(%eax)
	/* 0x10: kernel data */
	gdt_LOC[CPU_GDT_KDATA >> 3] = SEGDESC32(STA_W, 0x0, 0xffffffff, 0);
  1027d5:	66 c7 40 10 ff ff    	movw   $0xffff,0x10(%eax)
  1027db:	66 c7 40 12 00 00    	movw   $0x0,0x12(%eax)
  1027e1:	c6 40 14 00          	movb   $0x0,0x14(%eax)
  1027e5:	0f b6 50 15          	movzbl 0x15(%eax),%edx
  1027e9:	83 e2 f0             	and    $0xfffffff0,%edx
  1027ec:	83 ca 12             	or     $0x12,%edx
  1027ef:	83 e2 9f             	and    $0xffffff9f,%edx
  1027f2:	83 ca 80             	or     $0xffffff80,%edx
  1027f5:	88 50 15             	mov    %dl,0x15(%eax)
  1027f8:	0f b6 50 16          	movzbl 0x16(%eax),%edx
  1027fc:	83 ca 0f             	or     $0xf,%edx
  1027ff:	83 e2 cf             	and    $0xffffffcf,%edx
  102802:	83 ca c0             	or     $0xffffffc0,%edx
  102805:	88 50 16             	mov    %dl,0x16(%eax)
  102808:	c6 40 17 00          	movb   $0x0,0x17(%eax)
	/* 0x18: user code */
	gdt_LOC[CPU_GDT_UCODE >> 3] = SEGDESC32(STA_X | STA_R, 0x00000000,
  10280c:	66 c7 40 18 ff ff    	movw   $0xffff,0x18(%eax)
  102812:	66 c7 40 1a 00 00    	movw   $0x0,0x1a(%eax)
  102818:	c6 40 1c 00          	movb   $0x0,0x1c(%eax)
  10281c:	c6 40 1d fa          	movb   $0xfa,0x1d(%eax)
  102820:	0f b6 50 1e          	movzbl 0x1e(%eax),%edx
  102824:	83 ca 0f             	or     $0xf,%edx
  102827:	83 e2 cf             	and    $0xffffffcf,%edx
  10282a:	83 ca c0             	or     $0xffffffc0,%edx
  10282d:	88 50 1e             	mov    %dl,0x1e(%eax)
  102830:	c6 40 1f 00          	movb   $0x0,0x1f(%eax)
		0xffffffff, 3);
	/* 0x20: user data */
	gdt_LOC[CPU_GDT_UDATA >> 3] = SEGDESC32(STA_W, 0x00000000, 0xffffffff, 3);
  102834:	66 c7 40 20 ff ff    	movw   $0xffff,0x20(%eax)
  10283a:	66 c7 40 22 00 00    	movw   $0x0,0x22(%eax)
  102840:	c6 40 24 00          	movb   $0x0,0x24(%eax)
  102844:	c6 40 25 f2          	movb   $0xf2,0x25(%eax)
  102848:	0f b6 50 26          	movzbl 0x26(%eax),%edx
  10284c:	83 ca 0f             	or     $0xf,%edx
  10284f:	83 e2 cf             	and    $0xffffffcf,%edx
  102852:	83 ca c0             	or     $0xffffffc0,%edx
  102855:	88 50 26             	mov    %dl,0x26(%eax)
  102858:	c6 40 27 00          	movb   $0x0,0x27(%eax)

	/* setup TSS */
	tss0.ts_esp0 = (uint32_t) bsp_kstack + 4096;
  10285c:	89 b3 64 6e 02 00    	mov    %esi,0x26e64(%ebx)
	tss0.ts_ss0 = CPU_GDT_KDATA;
  102862:	66 c7 83 68 6e 02 00 	movw   $0x10,0x26e68(%ebx)
  102869:	10 00 
	gdt_LOC[CPU_GDT_TSS >> 3] = SEGDESC16(STS_T32A, (uint32_t) (&tss0),
  10286b:	66 c7 40 28 eb 00    	movw   $0xeb,0x28(%eax)
  102871:	8d b3 60 6e 02 00    	lea    0x26e60(%ebx),%esi
  102877:	66 89 70 2a          	mov    %si,0x2a(%eax)
  10287b:	89 f2                	mov    %esi,%edx
  10287d:	c1 ea 10             	shr    $0x10,%edx
  102880:	88 50 2c             	mov    %dl,0x2c(%eax)
  102883:	0f b6 50 2d          	movzbl 0x2d(%eax),%edx
  102887:	83 e2 f0             	and    $0xfffffff0,%edx
  10288a:	83 ca 09             	or     $0x9,%edx
  10288d:	83 e2 9f             	and    $0xffffff9f,%edx
  102890:	83 ca 80             	or     $0xffffff80,%edx
  102893:	89 d5                	mov    %edx,%ebp
  102895:	0f b6 48 2e          	movzbl 0x2e(%eax),%ecx
  102899:	83 e1 c0             	and    $0xffffffc0,%ecx
  10289c:	83 c9 40             	or     $0x40,%ecx
  10289f:	83 e1 7f             	and    $0x7f,%ecx
  1028a2:	88 48 2e             	mov    %cl,0x2e(%eax)
  1028a5:	c1 ee 18             	shr    $0x18,%esi
  1028a8:	89 f1                	mov    %esi,%ecx
  1028aa:	88 48 2f             	mov    %cl,0x2f(%eax)
		sizeof(tss_t) - 1, 0);
	gdt_LOC[CPU_GDT_TSS >> 3].sd_s = 0;
  1028ad:	89 ea                	mov    %ebp,%edx
  1028af:	83 e2 ef             	and    $0xffffffef,%edx
  1028b2:	88 50 2d             	mov    %dl,0x2d(%eax)

	pseudodesc_t gdt_desc =
  1028b5:	66 c7 44 24 2a 2f 00 	movw   $0x2f,0x2a(%esp)
  1028bc:	89 44 24 2c          	mov    %eax,0x2c(%esp)
		{ .pd_lim = sizeof(gdt_LOC) - 1, .pd_base = (uint32_t) gdt_LOC };
	asm volatile("lgdt %0" :: "m" (gdt_desc));
  1028c0:	0f 01 54 24 2a       	lgdtl  0x2a(%esp)
	asm volatile("movw %%ax,%%gs" :: "a" (CPU_GDT_KDATA));
  1028c5:	b8 10 00 00 00       	mov    $0x10,%eax
  1028ca:	8e e8                	mov    %eax,%gs
	asm volatile("movw %%ax,%%fs" :: "a" (CPU_GDT_KDATA));
  1028cc:	8e e0                	mov    %eax,%fs
	asm volatile("movw %%ax,%%es" :: "a" (CPU_GDT_KDATA));
  1028ce:	8e c0                	mov    %eax,%es
	asm volatile("movw %%ax,%%ds" :: "a" (CPU_GDT_KDATA));
  1028d0:	8e d8                	mov    %eax,%ds
	asm volatile("movw %%ax,%%ss" :: "a" (CPU_GDT_KDATA));
  1028d2:	8e d0                	mov    %eax,%ss
	/* reload %cs */
	asm volatile("ljmp %0,$1f\n 1:\n" :: "i" (CPU_GDT_KCODE));
  1028d4:	ea db 28 10 00 08 00 	ljmp   $0x8,$0x1028db

	/*
	 * Load a null LDT.
	 */
	lldt (0);
  1028db:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1028e2:	e8 e7 00 00 00       	call   1029ce <lldt>

	/*
	 * Load the bootstrap TSS.
	 */
	ltr (CPU_GDT_TSS);
  1028e7:	c7 04 24 28 00 00 00 	movl   $0x28,(%esp)
  1028ee:	e8 66 01 00 00       	call   102a59 <ltr>

	/*
	 * Load IDT.
	 */
	extern pseudodesc_t idt_pd;
	asm volatile("lidt %0" : : "m" (idt_pd));
  1028f3:	c7 c0 20 a3 10 00    	mov    $0x10a320,%eax
  1028f9:	0f 01 18             	lidtl  (%eax)

	/*
	 * Initialize all TSS structures for processes.
	 */
	unsigned int pid;
	memzero (tss_LOC, sizeof(tss_t) * 64);
  1028fc:	83 c4 08             	add    $0x8,%esp
  1028ff:	68 00 3b 00 00       	push   $0x3b00
  102904:	ff b3 e0 ff ff ff    	pushl  -0x20(%ebx)
  10290a:	e8 d8 f6 ff ff       	call   101fe7 <memzero>
	memzero (STACK_LOC, sizeof(char) * 64 * 4096);
  10290f:	83 c4 08             	add    $0x8,%esp
  102912:	68 00 00 04 00       	push   $0x40000
  102917:	ff b3 d8 ff ff ff    	pushl  -0x28(%ebx)
  10291d:	e8 c5 f6 ff ff       	call   101fe7 <memzero>
	for (pid = 0; pid < 64; pid++)
  102922:	83 c4 10             	add    $0x10,%esp
  102925:	be 00 00 00 00       	mov    $0x0,%esi
  10292a:	eb 4d                	jmp    102979 <seg_init+0x238>
	{
		tss_LOC[pid].ts_esp0 = (uint32_t) STACK_LOC[pid] + 4096;
  10292c:	89 f0                	mov    %esi,%eax
  10292e:	c1 e0 0c             	shl    $0xc,%eax
  102931:	81 c0 00 30 97 00    	add    $0x973000,%eax
  102937:	05 00 10 00 00       	add    $0x1000,%eax
  10293c:	c7 c1 40 30 9b 00    	mov    $0x9b3040,%ecx
  102942:	69 d6 ec 00 00 00    	imul   $0xec,%esi,%edx
  102948:	8d 3c 11             	lea    (%ecx,%edx,1),%edi
  10294b:	89 47 04             	mov    %eax,0x4(%edi)
		tss_LOC[pid].ts_ss0 = CPU_GDT_KDATA;
  10294e:	66 c7 47 08 10 00    	movw   $0x10,0x8(%edi)
		tss_LOC[pid].ts_iomb = offsetof(tss_t, ts_iopm);
  102954:	66 c7 47 66 68 00    	movw   $0x68,0x66(%edi)
		memzero (tss_LOC[pid].ts_iopm, sizeof(uint8_t) * 128);
  10295a:	8d 44 11 68          	lea    0x68(%ecx,%edx,1),%eax
  10295e:	83 ec 08             	sub    $0x8,%esp
  102961:	68 80 00 00 00       	push   $0x80
  102966:	50                   	push   %eax
  102967:	e8 7b f6 ff ff       	call   101fe7 <memzero>
		tss_LOC[pid].ts_iopm[128] = 0xff;
  10296c:	c6 87 e8 00 00 00 ff 	movb   $0xff,0xe8(%edi)
	for (pid = 0; pid < 64; pid++)
  102973:	83 c6 01             	add    $0x1,%esi
  102976:	83 c4 10             	add    $0x10,%esp
  102979:	83 fe 3f             	cmp    $0x3f,%esi
  10297c:	76 ae                	jbe    10292c <seg_init+0x1eb>
	}
}
  10297e:	83 c4 2c             	add    $0x2c,%esp
  102981:	5b                   	pop    %ebx
  102982:	5e                   	pop    %esi
  102983:	5f                   	pop    %edi
  102984:	5d                   	pop    %ebp
  102985:	c3                   	ret    

00102986 <max>:
#include "types.h"

uint32_t
max(uint32_t a, uint32_t b)
{
  102986:	8b 54 24 04          	mov    0x4(%esp),%edx
  10298a:	8b 44 24 08          	mov    0x8(%esp),%eax
	return (a > b) ? a : b;
  10298e:	39 d0                	cmp    %edx,%eax
  102990:	0f 42 c2             	cmovb  %edx,%eax
}
  102993:	c3                   	ret    

00102994 <min>:

uint32_t
min(uint32_t a, uint32_t b)
{
  102994:	8b 54 24 04          	mov    0x4(%esp),%edx
  102998:	8b 44 24 08          	mov    0x8(%esp),%eax
	return (a < b) ? a : b;
  10299c:	39 d0                	cmp    %edx,%eax
  10299e:	0f 47 c2             	cmova  %edx,%eax
}
  1029a1:	c3                   	ret    

001029a2 <rounddown>:

uint32_t
rounddown(uint32_t a, uint32_t n)
{
  1029a2:	8b 4c 24 04          	mov    0x4(%esp),%ecx
	return a - a % n;
  1029a6:	89 c8                	mov    %ecx,%eax
  1029a8:	ba 00 00 00 00       	mov    $0x0,%edx
  1029ad:	f7 74 24 08          	divl   0x8(%esp)
  1029b1:	89 c8                	mov    %ecx,%eax
  1029b3:	29 d0                	sub    %edx,%eax
}
  1029b5:	c3                   	ret    

001029b6 <roundup>:

uint32_t
roundup(uint32_t a, uint32_t n)
{
  1029b6:	8b 54 24 08          	mov    0x8(%esp),%edx
	return rounddown(a+n-1, n);
  1029ba:	89 d0                	mov    %edx,%eax
  1029bc:	03 44 24 04          	add    0x4(%esp),%eax
  1029c0:	52                   	push   %edx
  1029c1:	83 e8 01             	sub    $0x1,%eax
  1029c4:	50                   	push   %eax
  1029c5:	e8 d8 ff ff ff       	call   1029a2 <rounddown>
  1029ca:	83 c4 08             	add    $0x8,%esp
}
  1029cd:	c3                   	ret    

001029ce <lldt>:
#include "x86.h"

gcc_inline void
lldt(uint16_t sel)
{
	__asm __volatile("lldt %0" : : "r" (sel));
  1029ce:	8b 44 24 04          	mov    0x4(%esp),%eax
  1029d2:	0f 00 d0             	lldt   %ax
  1029d5:	c3                   	ret    

001029d6 <cli>:
}

gcc_inline void
cli(void)
{
	__asm __volatile("cli":::"memory");
  1029d6:	fa                   	cli    
  1029d7:	c3                   	ret    

001029d8 <sti>:
}

gcc_inline void
sti(void)
{
	__asm __volatile("sti;nop");
  1029d8:	fb                   	sti    
  1029d9:	90                   	nop
  1029da:	c3                   	ret    

001029db <rdmsr>:

gcc_inline uint64_t
rdmsr(uint32_t msr)
{
	uint64_t rv;
	__asm __volatile("rdmsr" : "=A" (rv) : "c" (msr));
  1029db:	8b 4c 24 04          	mov    0x4(%esp),%ecx
  1029df:	0f 32                	rdmsr  
	return rv;
}
  1029e1:	c3                   	ret    

001029e2 <wrmsr>:

gcc_inline void
wrmsr(uint32_t msr, uint64_t newval)
{
        __asm __volatile("wrmsr" : : "A" (newval), "c" (msr));
  1029e2:	8b 44 24 08          	mov    0x8(%esp),%eax
  1029e6:	8b 54 24 0c          	mov    0xc(%esp),%edx
  1029ea:	8b 4c 24 04          	mov    0x4(%esp),%ecx
  1029ee:	0f 30                	wrmsr  
  1029f0:	c3                   	ret    

001029f1 <halt>:
}

gcc_inline void
halt(void)
{
	__asm __volatile("hlt");
  1029f1:	f4                   	hlt    
  1029f2:	c3                   	ret    

001029f3 <rdtsc>:
gcc_inline uint64_t
rdtsc(void)
{
	uint64_t rv;

	__asm __volatile("rdtsc" : "=A" (rv));
  1029f3:	0f 31                	rdtsc  
	return (rv);
}
  1029f5:	c3                   	ret    

001029f6 <enable_sse>:

gcc_inline uint32_t
rcr4(void)
{
	uint32_t cr4;
	__asm __volatile("movl %%cr4,%0" : "=r" (cr4));
  1029f6:	0f 20 e0             	mov    %cr4,%eax
	cr4 = rcr4() | CR4_OSFXSR | CR4_OSXMMEXCPT;
  1029f9:	80 cc 06             	or     $0x6,%ah
	FENCE();
  1029fc:	0f ae f0             	mfence 
	__asm __volatile("movl %0,%%cr4" : : "r" (val));
  1029ff:	0f 22 e0             	mov    %eax,%cr4
	__asm __volatile("movl %%cr0,%0" : "=r" (val));
  102a02:	0f 20 c0             	mov    %cr0,%eax
	FENCE();
  102a05:	0f ae f0             	mfence 
  102a08:	c3                   	ret    

00102a09 <cpuid>:
{
  102a09:	55                   	push   %ebp
  102a0a:	57                   	push   %edi
  102a0b:	56                   	push   %esi
  102a0c:	53                   	push   %ebx
  102a0d:	8b 44 24 14          	mov    0x14(%esp),%eax
  102a11:	8b 7c 24 18          	mov    0x18(%esp),%edi
  102a15:	8b 6c 24 1c          	mov    0x1c(%esp),%ebp
  102a19:	8b 74 24 24          	mov    0x24(%esp),%esi
	__asm __volatile("cpuid"
  102a1d:	0f a2                	cpuid  
	if (eaxp)
  102a1f:	85 ff                	test   %edi,%edi
  102a21:	74 02                	je     102a25 <cpuid+0x1c>
		*eaxp = eax;
  102a23:	89 07                	mov    %eax,(%edi)
	if (ebxp)
  102a25:	85 ed                	test   %ebp,%ebp
  102a27:	74 03                	je     102a2c <cpuid+0x23>
		*ebxp = ebx;
  102a29:	89 5d 00             	mov    %ebx,0x0(%ebp)
	if (ecxp)
  102a2c:	83 7c 24 20 00       	cmpl   $0x0,0x20(%esp)
  102a31:	74 06                	je     102a39 <cpuid+0x30>
		*ecxp = ecx;
  102a33:	8b 44 24 20          	mov    0x20(%esp),%eax
  102a37:	89 08                	mov    %ecx,(%eax)
	if (edxp)
  102a39:	85 f6                	test   %esi,%esi
  102a3b:	74 02                	je     102a3f <cpuid+0x36>
		*edxp = edx;
  102a3d:	89 16                	mov    %edx,(%esi)
}
  102a3f:	5b                   	pop    %ebx
  102a40:	5e                   	pop    %esi
  102a41:	5f                   	pop    %edi
  102a42:	5d                   	pop    %ebp
  102a43:	c3                   	ret    

00102a44 <rcr3>:
    __asm __volatile("movl %%cr3,%0" : "=r" (val));
  102a44:	0f 20 d8             	mov    %cr3,%eax
}
  102a47:	c3                   	ret    

00102a48 <outl>:
	__asm __volatile("outl %0,%w1" : : "a" (data), "d" (port));
  102a48:	8b 44 24 08          	mov    0x8(%esp),%eax
  102a4c:	8b 54 24 04          	mov    0x4(%esp),%edx
  102a50:	ef                   	out    %eax,(%dx)
  102a51:	c3                   	ret    

00102a52 <inl>:
	__asm __volatile("inl %w1,%0" : "=a" (data) : "d" (port));
  102a52:	8b 54 24 04          	mov    0x4(%esp),%edx
  102a56:	ed                   	in     (%dx),%eax
}
  102a57:	c3                   	ret    

00102a58 <smp_wmb>:
	__asm __volatile("":::"memory");
  102a58:	c3                   	ret    

00102a59 <ltr>:
	__asm __volatile("ltr %0" : : "r" (sel));
  102a59:	8b 44 24 04          	mov    0x4(%esp),%eax
  102a5d:	0f 00 d8             	ltr    %ax
  102a60:	c3                   	ret    

00102a61 <lcr0>:
	__asm __volatile("movl %0,%%cr0" : : "r" (val));
  102a61:	8b 44 24 04          	mov    0x4(%esp),%eax
  102a65:	0f 22 c0             	mov    %eax,%cr0
  102a68:	c3                   	ret    

00102a69 <rcr0>:
	__asm __volatile("movl %%cr0,%0" : "=r" (val));
  102a69:	0f 20 c0             	mov    %cr0,%eax
}
  102a6c:	c3                   	ret    

00102a6d <rcr2>:
	__asm __volatile("movl %%cr2,%0" : "=r" (val));
  102a6d:	0f 20 d0             	mov    %cr2,%eax
}
  102a70:	c3                   	ret    

00102a71 <lcr3>:
	__asm __volatile("movl %0,%%cr3" : : "r" (val));
  102a71:	8b 44 24 04          	mov    0x4(%esp),%eax
  102a75:	0f 22 d8             	mov    %eax,%cr3
  102a78:	c3                   	ret    

00102a79 <lcr4>:
	__asm __volatile("movl %0,%%cr4" : : "r" (val));
  102a79:	8b 44 24 04          	mov    0x4(%esp),%eax
  102a7d:	0f 22 e0             	mov    %eax,%cr4
  102a80:	c3                   	ret    

00102a81 <rcr4>:
	__asm __volatile("movl %%cr4,%0" : "=r" (cr4));
  102a81:	0f 20 e0             	mov    %cr4,%eax
	return cr4;
}
  102a84:	c3                   	ret    

00102a85 <inb>:

gcc_inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
  102a85:	8b 54 24 04          	mov    0x4(%esp),%edx
  102a89:	ec                   	in     (%dx),%al
	return data;
}
  102a8a:	c3                   	ret    

00102a8b <insl>:

gcc_inline void
insl(int port, void *addr, int cnt)
{
  102a8b:	57                   	push   %edi
	__asm __volatile("cld\n\trepne\n\tinsl"                 :
  102a8c:	8b 7c 24 0c          	mov    0xc(%esp),%edi
  102a90:	8b 4c 24 10          	mov    0x10(%esp),%ecx
  102a94:	8b 54 24 08          	mov    0x8(%esp),%edx
  102a98:	fc                   	cld    
  102a99:	f2 6d                	repnz insl (%dx),%es:(%edi)
			 "=D" (addr), "=c" (cnt)                :
			 "d" (port), "0" (addr), "1" (cnt)      :
			 "memory", "cc");
}
  102a9b:	5f                   	pop    %edi
  102a9c:	c3                   	ret    

00102a9d <outb>:

gcc_inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
  102a9d:	8b 44 24 08          	mov    0x8(%esp),%eax
  102aa1:	8b 54 24 04          	mov    0x4(%esp),%edx
  102aa5:	ee                   	out    %al,(%dx)
  102aa6:	c3                   	ret    

00102aa7 <outsw>:
}

gcc_inline void
outsw(int port, const void *addr, int cnt)
{
  102aa7:	56                   	push   %esi
	__asm __volatile("cld\n\trepne\n\toutsw"                :
  102aa8:	8b 74 24 0c          	mov    0xc(%esp),%esi
  102aac:	8b 4c 24 10          	mov    0x10(%esp),%ecx
  102ab0:	8b 54 24 08          	mov    0x8(%esp),%edx
  102ab4:	fc                   	cld    
  102ab5:	f2 66 6f             	repnz outsw %ds:(%esi),(%dx)
			 "=S" (addr), "=c" (cnt)                :
			 "d" (port), "0" (addr), "1" (cnt)      :
			 "cc");
}
  102ab8:	5e                   	pop    %esi
  102ab9:	c3                   	ret    

00102aba <mon_start_user>:
extern void set_curid(unsigned int);
extern void kctx_switch(unsigned int, unsigned int);

int
mon_start_user (int argc, char **argv, struct Trapframe *tf)
{
  102aba:	57                   	push   %edi
  102abb:	56                   	push   %esi
  102abc:	53                   	push   %ebx
  102abd:	e8 59 d8 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  102ac2:	81 c3 3e 75 00 00    	add    $0x753e,%ebx
    unsigned int idle_pid;
    idle_pid = proc_create (_binary___obj_user_idle_idle_start, 10000);
  102ac8:	83 ec 08             	sub    $0x8,%esp
  102acb:	68 10 27 00 00       	push   $0x2710
  102ad0:	ff b3 c8 ff ff ff    	pushl  -0x38(%ebx)
  102ad6:	e8 35 1b 00 00       	call   104610 <proc_create>
  102adb:	89 c6                	mov    %eax,%esi
    KERN_DEBUG("process idle %d is created.\n", idle_pid);
  102add:	50                   	push   %eax
  102ade:	8d 83 18 b8 ff ff    	lea    -0x47e8(%ebx),%eax
  102ae4:	50                   	push   %eax
  102ae5:	6a 2d                	push   $0x2d
  102ae7:	8d bb 35 b8 ff ff    	lea    -0x47cb(%ebx),%edi
  102aed:	57                   	push   %edi
  102aee:	e8 65 f5 ff ff       	call   102058 <debug_normal>

    KERN_INFO("Start user-space ... \n");
  102af3:	83 c4 14             	add    $0x14,%esp
  102af6:	8d 83 48 b8 ff ff    	lea    -0x47b8(%ebx),%eax
  102afc:	50                   	push   %eax
  102afd:	e8 31 f5 ff ff       	call   102033 <debug_info>

    tqueue_remove (NUM_IDS, idle_pid);
  102b02:	83 c4 08             	add    $0x8,%esp
  102b05:	56                   	push   %esi
  102b06:	6a 40                	push   $0x40
  102b08:	e8 63 18 00 00       	call   104370 <tqueue_remove>
    tcb_set_state (idle_pid, TSTATE_RUN);
  102b0d:	83 c4 08             	add    $0x8,%esp
  102b10:	6a 01                	push   $0x1
  102b12:	56                   	push   %esi
  102b13:	e8 18 15 00 00       	call   104030 <tcb_set_state>
    set_curid (idle_pid);
  102b18:	89 34 24             	mov    %esi,(%esp)
  102b1b:	e8 b0 19 00 00       	call   1044d0 <set_curid>
    kctx_switch (0, idle_pid);
  102b20:	83 c4 08             	add    $0x8,%esp
  102b23:	56                   	push   %esi
  102b24:	6a 00                	push   $0x0
  102b26:	e8 25 14 00 00       	call   103f50 <kctx_switch>

    KERN_PANIC("mon_startuser() should never reach here.\n");
  102b2b:	83 c4 0c             	add    $0xc,%esp
  102b2e:	8d 83 4c b9 ff ff    	lea    -0x46b4(%ebx),%eax
  102b34:	50                   	push   %eax
  102b35:	6a 36                	push   $0x36
  102b37:	57                   	push   %edi
  102b38:	e8 54 f5 ff ff       	call   102091 <debug_panic>
}
  102b3d:	83 c4 10             	add    $0x10,%esp
  102b40:	5b                   	pop    %ebx
  102b41:	5e                   	pop    %esi
  102b42:	5f                   	pop    %edi
  102b43:	c3                   	ret    

00102b44 <mon_help>:

int
mon_help (int argc, char **argv, struct Trapframe *tf)
{
  102b44:	56                   	push   %esi
  102b45:	53                   	push   %ebx
  102b46:	83 ec 04             	sub    $0x4,%esp
  102b49:	e8 cd d7 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  102b4e:	81 c3 b2 74 00 00    	add    $0x74b2,%ebx
	int i;

	for (i = 0; i < NCOMMANDS; i++)
  102b54:	be 00 00 00 00       	mov    $0x0,%esi
  102b59:	eb 30                	jmp    102b8b <mon_help+0x47>
		dprintf("%s - %s\n", commands[i].name, commands[i].desc);
  102b5b:	83 ec 04             	sub    $0x4,%esp
  102b5e:	8d 04 36             	lea    (%esi,%esi,1),%eax
  102b61:	8d 0c 30             	lea    (%eax,%esi,1),%ecx
  102b64:	8d 14 8d 00 00 00 00 	lea    0x0(,%ecx,4),%edx
  102b6b:	ff b4 13 a4 ff ff ff 	pushl  -0x5c(%ebx,%edx,1)
  102b72:	ff b4 13 a0 ff ff ff 	pushl  -0x60(%ebx,%edx,1)
  102b79:	8d 83 5f b8 ff ff    	lea    -0x47a1(%ebx),%eax
  102b7f:	50                   	push   %eax
  102b80:	e8 9f f6 ff ff       	call   102224 <dprintf>
	for (i = 0; i < NCOMMANDS; i++)
  102b85:	83 c6 01             	add    $0x1,%esi
  102b88:	83 c4 10             	add    $0x10,%esp
  102b8b:	83 fe 02             	cmp    $0x2,%esi
  102b8e:	76 cb                	jbe    102b5b <mon_help+0x17>
	return 0;
}
  102b90:	b8 00 00 00 00       	mov    $0x0,%eax
  102b95:	83 c4 04             	add    $0x4,%esp
  102b98:	5b                   	pop    %ebx
  102b99:	5e                   	pop    %esi
  102b9a:	c3                   	ret    

00102b9b <mon_kerninfo>:

int
mon_kerninfo (int argc, char **argv, struct Trapframe *tf)
{
  102b9b:	57                   	push   %edi
  102b9c:	56                   	push   %esi
  102b9d:	53                   	push   %ebx
  102b9e:	e8 78 d7 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  102ba3:	81 c3 5d 74 00 00    	add    $0x745d,%ebx
	extern uint8_t start[], etext[], edata[], end[];

	dprintf("Special kernel symbols:\n");
  102ba9:	83 ec 0c             	sub    $0xc,%esp
  102bac:	8d 83 68 b8 ff ff    	lea    -0x4798(%ebx),%eax
  102bb2:	50                   	push   %eax
  102bb3:	e8 6c f6 ff ff       	call   102224 <dprintf>
	dprintf("  start  %08x\n", start);
  102bb8:	83 c4 08             	add    $0x8,%esp
  102bbb:	c7 c7 24 33 10 00    	mov    $0x103324,%edi
  102bc1:	57                   	push   %edi
  102bc2:	8d 83 81 b8 ff ff    	lea    -0x477f(%ebx),%eax
  102bc8:	50                   	push   %eax
  102bc9:	e8 56 f6 ff ff       	call   102224 <dprintf>
	dprintf("  etext  %08x\n", etext);
  102bce:	83 c4 08             	add    $0x8,%esp
  102bd1:	ff b3 dc ff ff ff    	pushl  -0x24(%ebx)
  102bd7:	8d 83 90 b8 ff ff    	lea    -0x4770(%ebx),%eax
  102bdd:	50                   	push   %eax
  102bde:	e8 41 f6 ff ff       	call   102224 <dprintf>
	dprintf("  edata  %08x\n", edata);
  102be3:	83 c4 08             	add    $0x8,%esp
  102be6:	ff b3 cc ff ff ff    	pushl  -0x34(%ebx)
  102bec:	8d 83 9f b8 ff ff    	lea    -0x4761(%ebx),%eax
  102bf2:	50                   	push   %eax
  102bf3:	e8 2c f6 ff ff       	call   102224 <dprintf>
	dprintf("  end    %08x\n", end);
  102bf8:	83 c4 08             	add    $0x8,%esp
  102bfb:	c7 c6 20 8c df 00    	mov    $0xdf8c20,%esi
  102c01:	56                   	push   %esi
  102c02:	8d 83 ae b8 ff ff    	lea    -0x4752(%ebx),%eax
  102c08:	50                   	push   %eax
  102c09:	e8 16 f6 ff ff       	call   102224 <dprintf>
	dprintf("Kernel executable memory footprint: %dKB\n",
		ROUNDUP(end - start, 1024) / 1024);
  102c0e:	29 fe                	sub    %edi,%esi
  102c10:	8d 86 ff 03 00 00    	lea    0x3ff(%esi),%eax
  102c16:	89 c1                	mov    %eax,%ecx
  102c18:	c1 f9 1f             	sar    $0x1f,%ecx
  102c1b:	c1 e9 16             	shr    $0x16,%ecx
  102c1e:	8d 14 08             	lea    (%eax,%ecx,1),%edx
  102c21:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
  102c27:	29 ca                	sub    %ecx,%edx
  102c29:	29 d0                	sub    %edx,%eax
	dprintf("Kernel executable memory footprint: %dKB\n",
  102c2b:	83 c4 08             	add    $0x8,%esp
  102c2e:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  102c34:	85 c0                	test   %eax,%eax
  102c36:	0f 49 d0             	cmovns %eax,%edx
  102c39:	c1 fa 0a             	sar    $0xa,%edx
  102c3c:	52                   	push   %edx
  102c3d:	8d 83 78 b9 ff ff    	lea    -0x4688(%ebx),%eax
  102c43:	50                   	push   %eax
  102c44:	e8 db f5 ff ff       	call   102224 <dprintf>
	return 0;
  102c49:	83 c4 10             	add    $0x10,%esp
}
  102c4c:	b8 00 00 00 00       	mov    $0x0,%eax
  102c51:	5b                   	pop    %ebx
  102c52:	5e                   	pop    %esi
  102c53:	5f                   	pop    %edi
  102c54:	c3                   	ret    

00102c55 <runcmd>:
#define WHITESPACE "\t\r\n "
#define MAXARGS 16

static int
runcmd (char *buf, struct Trapframe *tf)
{
  102c55:	55                   	push   %ebp
  102c56:	57                   	push   %edi
  102c57:	56                   	push   %esi
  102c58:	53                   	push   %ebx
  102c59:	83 ec 5c             	sub    $0x5c,%esp
  102c5c:	e8 ba d6 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  102c61:	81 c3 9f 73 00 00    	add    $0x739f,%ebx
  102c67:	89 c6                	mov    %eax,%esi
  102c69:	89 54 24 0c          	mov    %edx,0xc(%esp)
	char *argv[MAXARGS];
	int i;

	// Parse the command buffer into whitespace-separated arguments
	argc = 0;
	argv[argc] = 0;
  102c6d:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
  102c74:	00 
	argc = 0;
  102c75:	bf 00 00 00 00       	mov    $0x0,%edi
  102c7a:	eb 6d                	jmp    102ce9 <runcmd+0x94>
	while (1)
	{
		// gobble whitespace
		while (*buf && strchr (WHITESPACE, *buf))
  102c7c:	83 ec 08             	sub    $0x8,%esp
  102c7f:	0f be c0             	movsbl %al,%eax
  102c82:	50                   	push   %eax
  102c83:	8d 83 bd b8 ff ff    	lea    -0x4743(%ebx),%eax
  102c89:	50                   	push   %eax
  102c8a:	e8 38 f3 ff ff       	call   101fc7 <strchr>
  102c8f:	83 c4 10             	add    $0x10,%esp
  102c92:	85 c0                	test   %eax,%eax
  102c94:	74 5a                	je     102cf0 <runcmd+0x9b>
			*buf++ = 0;
  102c96:	c6 06 00             	movb   $0x0,(%esi)
  102c99:	89 fd                	mov    %edi,%ebp
  102c9b:	8d 76 01             	lea    0x1(%esi),%esi
  102c9e:	eb 47                	jmp    102ce7 <runcmd+0x92>
			break;

		// save and scan past next arg
		if (argc == MAXARGS - 1)
		{
			dprintf("Too many arguments (max %d)\n", MAXARGS);
  102ca0:	83 ec 08             	sub    $0x8,%esp
  102ca3:	6a 10                	push   $0x10
  102ca5:	8d 83 c2 b8 ff ff    	lea    -0x473e(%ebx),%eax
  102cab:	50                   	push   %eax
  102cac:	e8 73 f5 ff ff       	call   102224 <dprintf>
			return 0;
  102cb1:	83 c4 10             	add    $0x10,%esp
  102cb4:	bf 00 00 00 00       	mov    $0x0,%edi
		if (strcmp (argv[0], commands[i].name) == 0)
			return commands[i].func (argc, argv, tf);
	}
	dprintf("Unknown command '%s'\n", argv[0]);
	return 0;
}
  102cb9:	89 f8                	mov    %edi,%eax
  102cbb:	83 c4 5c             	add    $0x5c,%esp
  102cbe:	5b                   	pop    %ebx
  102cbf:	5e                   	pop    %esi
  102cc0:	5f                   	pop    %edi
  102cc1:	5d                   	pop    %ebp
  102cc2:	c3                   	ret    
			buf++;
  102cc3:	83 c6 01             	add    $0x1,%esi
		while (*buf && !strchr (WHITESPACE, *buf))
  102cc6:	0f b6 06             	movzbl (%esi),%eax
  102cc9:	84 c0                	test   %al,%al
  102ccb:	74 1a                	je     102ce7 <runcmd+0x92>
  102ccd:	83 ec 08             	sub    $0x8,%esp
  102cd0:	0f be c0             	movsbl %al,%eax
  102cd3:	50                   	push   %eax
  102cd4:	8d 83 bd b8 ff ff    	lea    -0x4743(%ebx),%eax
  102cda:	50                   	push   %eax
  102cdb:	e8 e7 f2 ff ff       	call   101fc7 <strchr>
  102ce0:	83 c4 10             	add    $0x10,%esp
  102ce3:	85 c0                	test   %eax,%eax
  102ce5:	74 dc                	je     102cc3 <runcmd+0x6e>
			*buf++ = 0;
  102ce7:	89 ef                	mov    %ebp,%edi
		while (*buf && strchr (WHITESPACE, *buf))
  102ce9:	0f b6 06             	movzbl (%esi),%eax
  102cec:	84 c0                	test   %al,%al
  102cee:	75 8c                	jne    102c7c <runcmd+0x27>
		if (*buf == 0)
  102cf0:	80 3e 00             	cmpb   $0x0,(%esi)
  102cf3:	74 0e                	je     102d03 <runcmd+0xae>
		if (argc == MAXARGS - 1)
  102cf5:	83 ff 0f             	cmp    $0xf,%edi
  102cf8:	74 a6                	je     102ca0 <runcmd+0x4b>
		argv[argc++] = buf;
  102cfa:	8d 6f 01             	lea    0x1(%edi),%ebp
  102cfd:	89 74 bc 10          	mov    %esi,0x10(%esp,%edi,4)
		while (*buf && !strchr (WHITESPACE, *buf))
  102d01:	eb c3                	jmp    102cc6 <runcmd+0x71>
	argv[argc] = 0;
  102d03:	c7 44 bc 10 00 00 00 	movl   $0x0,0x10(%esp,%edi,4)
  102d0a:	00 
	if (argc == 0)
  102d0b:	85 ff                	test   %edi,%edi
  102d0d:	74 aa                	je     102cb9 <runcmd+0x64>
  102d0f:	be 00 00 00 00       	mov    $0x0,%esi
	for (i = 0; i < NCOMMANDS; i++)
  102d14:	83 fe 02             	cmp    $0x2,%esi
  102d17:	77 51                	ja     102d6a <runcmd+0x115>
		if (strcmp (argv[0], commands[i].name) == 0)
  102d19:	83 ec 08             	sub    $0x8,%esp
  102d1c:	8d 14 76             	lea    (%esi,%esi,2),%edx
  102d1f:	8d 04 95 00 00 00 00 	lea    0x0(,%edx,4),%eax
  102d26:	ff b4 03 a0 ff ff ff 	pushl  -0x60(%ebx,%eax,1)
  102d2d:	ff 74 24 1c          	pushl  0x1c(%esp)
  102d31:	e8 6d f2 ff ff       	call   101fa3 <strcmp>
  102d36:	83 c4 10             	add    $0x10,%esp
  102d39:	85 c0                	test   %eax,%eax
  102d3b:	74 05                	je     102d42 <runcmd+0xed>
	for (i = 0; i < NCOMMANDS; i++)
  102d3d:	83 c6 01             	add    $0x1,%esi
  102d40:	eb d2                	jmp    102d14 <runcmd+0xbf>
			return commands[i].func (argc, argv, tf);
  102d42:	8d 14 76             	lea    (%esi,%esi,2),%edx
  102d45:	8d 04 95 00 00 00 00 	lea    0x0(,%edx,4),%eax
  102d4c:	83 ec 04             	sub    $0x4,%esp
  102d4f:	ff 74 24 10          	pushl  0x10(%esp)
  102d53:	8d 54 24 18          	lea    0x18(%esp),%edx
  102d57:	52                   	push   %edx
  102d58:	57                   	push   %edi
  102d59:	ff 94 03 a8 ff ff ff 	call   *-0x58(%ebx,%eax,1)
  102d60:	89 c7                	mov    %eax,%edi
  102d62:	83 c4 10             	add    $0x10,%esp
  102d65:	e9 4f ff ff ff       	jmp    102cb9 <runcmd+0x64>
	dprintf("Unknown command '%s'\n", argv[0]);
  102d6a:	83 ec 08             	sub    $0x8,%esp
  102d6d:	ff 74 24 18          	pushl  0x18(%esp)
  102d71:	8d 83 df b8 ff ff    	lea    -0x4721(%ebx),%eax
  102d77:	50                   	push   %eax
  102d78:	e8 a7 f4 ff ff       	call   102224 <dprintf>
	return 0;
  102d7d:	83 c4 10             	add    $0x10,%esp
  102d80:	bf 00 00 00 00       	mov    $0x0,%edi
  102d85:	e9 2f ff ff ff       	jmp    102cb9 <runcmd+0x64>

00102d8a <monitor>:

void
monitor (struct Trapframe *tf)
{
  102d8a:	57                   	push   %edi
  102d8b:	56                   	push   %esi
  102d8c:	53                   	push   %ebx
  102d8d:	e8 89 d5 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  102d92:	81 c3 6e 72 00 00    	add    $0x726e,%ebx
  102d98:	8b 74 24 10          	mov    0x10(%esp),%esi
	char *buf;

	dprintf("\n****************************************\n\n");
  102d9c:	83 ec 0c             	sub    $0xc,%esp
  102d9f:	8d bb a4 b9 ff ff    	lea    -0x465c(%ebx),%edi
  102da5:	57                   	push   %edi
  102da6:	e8 79 f4 ff ff       	call   102224 <dprintf>
	dprintf("Welcome to the mCertiKOS kernel monitor!\n");
  102dab:	8d 83 d0 b9 ff ff    	lea    -0x4630(%ebx),%eax
  102db1:	89 04 24             	mov    %eax,(%esp)
  102db4:	e8 6b f4 ff ff       	call   102224 <dprintf>
	dprintf("\n****************************************\n\n");
  102db9:	89 3c 24             	mov    %edi,(%esp)
  102dbc:	e8 63 f4 ff ff       	call   102224 <dprintf>
	dprintf("Type 'help' for a list of commands.\n");
  102dc1:	8d 83 fc b9 ff ff    	lea    -0x4604(%ebx),%eax
  102dc7:	89 04 24             	mov    %eax,(%esp)
  102dca:	e8 55 f4 ff ff       	call   102224 <dprintf>
  102dcf:	83 c4 10             	add    $0x10,%esp

	while (1)
	{
		buf = (char *) readline ("$> ");
  102dd2:	83 ec 0c             	sub    $0xc,%esp
  102dd5:	8d 83 f5 b8 ff ff    	lea    -0x470b(%ebx),%eax
  102ddb:	50                   	push   %eax
  102ddc:	e8 66 d6 ff ff       	call   100447 <readline>
		if (buf != NULL)
  102de1:	83 c4 10             	add    $0x10,%esp
  102de4:	85 c0                	test   %eax,%eax
  102de6:	74 ea                	je     102dd2 <monitor+0x48>
			if (runcmd (buf, tf) < 0)
  102de8:	89 f2                	mov    %esi,%edx
  102dea:	e8 66 fe ff ff       	call   102c55 <runcmd>
  102def:	85 c0                	test   %eax,%eax
  102df1:	79 df                	jns    102dd2 <monitor+0x48>
				break;
	}
}
  102df3:	5b                   	pop    %ebx
  102df4:	5e                   	pop    %esi
  102df5:	5f                   	pop    %edi
  102df6:	c3                   	ret    

00102df7 <pt_copyin>:
extern void alloc_page(unsigned int pid, unsigned int vaddr, unsigned int perm);
extern unsigned int get_ptbl_entry_by_va(unsigned int pid, unsigned int vaddr);

size_t
pt_copyin(uint32_t pmap_id, uintptr_t uva, void *kva, size_t len)
{
  102df7:	55                   	push   %ebp
  102df8:	57                   	push   %edi
  102df9:	56                   	push   %esi
  102dfa:	53                   	push   %ebx
  102dfb:	83 ec 1c             	sub    $0x1c,%esp
  102dfe:	e8 18 d5 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  102e03:	81 c3 fd 71 00 00    	add    $0x71fd,%ebx
  102e09:	8b 6c 24 34          	mov    0x34(%esp),%ebp
  102e0d:	8b 7c 24 3c          	mov    0x3c(%esp),%edi
	if (!(VM_USERLO <= uva && uva + len <= VM_USERHI))
  102e11:	81 fd ff ff ff 3f    	cmp    $0x3fffffff,%ebp
  102e17:	0f 86 a3 00 00 00    	jbe    102ec0 <pt_copyin+0xc9>
  102e1d:	8d 44 3d 00          	lea    0x0(%ebp,%edi,1),%eax
  102e21:	3d 00 00 00 f0       	cmp    $0xf0000000,%eax
  102e26:	0f 87 a8 00 00 00    	ja     102ed4 <pt_copyin+0xdd>
		return 0;

	if ((uintptr_t) kva + len > VM_USERHI)
  102e2c:	89 f8                	mov    %edi,%eax
  102e2e:	03 44 24 38          	add    0x38(%esp),%eax
  102e32:	3d 00 00 00 f0       	cmp    $0xf0000000,%eax
  102e37:	0f 87 a1 00 00 00    	ja     102ede <pt_copyin+0xe7>
  102e3d:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  102e44:	00 
  102e45:	eb 40                	jmp    102e87 <pt_copyin+0x90>
		if ((uva_pa & PTE_P) == 0) {
			alloc_page(pmap_id, uva, PTE_P | PTE_U | PTE_W);
			uva_pa = get_ptbl_entry_by_va(pmap_id, uva);
		}

		uva_pa = (uva_pa & 0xfffff000) + (uva % PAGESIZE);
  102e47:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  102e4c:	89 ea                	mov    %ebp,%edx
  102e4e:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  102e54:	09 d0                	or     %edx,%eax

		size_t size = (len < PAGESIZE - uva_pa % PAGESIZE) ?
			len : PAGESIZE - uva_pa % PAGESIZE;
  102e56:	89 c2                	mov    %eax,%edx
  102e58:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  102e5e:	be 00 10 00 00       	mov    $0x1000,%esi
  102e63:	29 d6                	sub    %edx,%esi
		size_t size = (len < PAGESIZE - uva_pa % PAGESIZE) ?
  102e65:	39 f7                	cmp    %esi,%edi
  102e67:	0f 46 f7             	cmovbe %edi,%esi

		memcpy(kva, (void *) uva_pa, size);
  102e6a:	83 ec 04             	sub    $0x4,%esp
  102e6d:	56                   	push   %esi
  102e6e:	50                   	push   %eax
  102e6f:	ff 74 24 44          	pushl  0x44(%esp)
  102e73:	e8 b7 f0 ff ff       	call   101f2f <memcpy>

		len -= size;
  102e78:	29 f7                	sub    %esi,%edi
		uva += size;
  102e7a:	01 f5                	add    %esi,%ebp
		kva += size;
  102e7c:	01 74 24 48          	add    %esi,0x48(%esp)
		copied += size;
  102e80:	01 74 24 1c          	add    %esi,0x1c(%esp)
  102e84:	83 c4 10             	add    $0x10,%esp
	while (len) {
  102e87:	85 ff                	test   %edi,%edi
  102e89:	74 3d                	je     102ec8 <pt_copyin+0xd1>
		uintptr_t uva_pa = get_ptbl_entry_by_va(pmap_id, uva);
  102e8b:	83 ec 08             	sub    $0x8,%esp
  102e8e:	55                   	push   %ebp
  102e8f:	ff 74 24 3c          	pushl  0x3c(%esp)
  102e93:	e8 78 0b 00 00       	call   103a10 <get_ptbl_entry_by_va>
		if ((uva_pa & PTE_P) == 0) {
  102e98:	83 c4 10             	add    $0x10,%esp
  102e9b:	a8 01                	test   $0x1,%al
  102e9d:	75 a8                	jne    102e47 <pt_copyin+0x50>
			alloc_page(pmap_id, uva, PTE_P | PTE_U | PTE_W);
  102e9f:	83 ec 04             	sub    $0x4,%esp
  102ea2:	6a 07                	push   $0x7
  102ea4:	55                   	push   %ebp
  102ea5:	ff 74 24 3c          	pushl  0x3c(%esp)
  102ea9:	e8 c2 0f 00 00       	call   103e70 <alloc_page>
			uva_pa = get_ptbl_entry_by_va(pmap_id, uva);
  102eae:	83 c4 08             	add    $0x8,%esp
  102eb1:	55                   	push   %ebp
  102eb2:	ff 74 24 3c          	pushl  0x3c(%esp)
  102eb6:	e8 55 0b 00 00       	call   103a10 <get_ptbl_entry_by_va>
  102ebb:	83 c4 10             	add    $0x10,%esp
  102ebe:	eb 87                	jmp    102e47 <pt_copyin+0x50>
		return 0;
  102ec0:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  102ec7:	00 
	}

	return copied;
}
  102ec8:	8b 44 24 0c          	mov    0xc(%esp),%eax
  102ecc:	83 c4 1c             	add    $0x1c,%esp
  102ecf:	5b                   	pop    %ebx
  102ed0:	5e                   	pop    %esi
  102ed1:	5f                   	pop    %edi
  102ed2:	5d                   	pop    %ebp
  102ed3:	c3                   	ret    
		return 0;
  102ed4:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  102edb:	00 
  102edc:	eb ea                	jmp    102ec8 <pt_copyin+0xd1>
		return 0;
  102ede:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  102ee5:	00 
  102ee6:	eb e0                	jmp    102ec8 <pt_copyin+0xd1>

00102ee8 <pt_copyout>:

size_t
pt_copyout(void *kva, uint32_t pmap_id, uintptr_t uva, size_t len)
{
  102ee8:	55                   	push   %ebp
  102ee9:	57                   	push   %edi
  102eea:	56                   	push   %esi
  102eeb:	53                   	push   %ebx
  102eec:	83 ec 1c             	sub    $0x1c,%esp
  102eef:	e8 27 d4 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  102ef4:	81 c3 0c 71 00 00    	add    $0x710c,%ebx
  102efa:	8b 6c 24 38          	mov    0x38(%esp),%ebp
  102efe:	8b 7c 24 3c          	mov    0x3c(%esp),%edi
	if (!(VM_USERLO <= uva && uva + len <= VM_USERHI))
  102f02:	81 fd ff ff ff 3f    	cmp    $0x3fffffff,%ebp
  102f08:	0f 86 a3 00 00 00    	jbe    102fb1 <pt_copyout+0xc9>
  102f0e:	8d 44 3d 00          	lea    0x0(%ebp,%edi,1),%eax
  102f12:	3d 00 00 00 f0       	cmp    $0xf0000000,%eax
  102f17:	0f 87 a8 00 00 00    	ja     102fc5 <pt_copyout+0xdd>
		return 0;

	if ((uintptr_t) kva + len > VM_USERHI)
  102f1d:	89 f8                	mov    %edi,%eax
  102f1f:	03 44 24 30          	add    0x30(%esp),%eax
  102f23:	3d 00 00 00 f0       	cmp    $0xf0000000,%eax
  102f28:	0f 87 a1 00 00 00    	ja     102fcf <pt_copyout+0xe7>
  102f2e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  102f35:	00 
  102f36:	eb 40                	jmp    102f78 <pt_copyout+0x90>
		if ((uva_pa & PTE_P) == 0) {
			alloc_page(pmap_id, uva, PTE_P | PTE_U | PTE_W);
			uva_pa = get_ptbl_entry_by_va(pmap_id, uva);
		}

		uva_pa = (uva_pa & 0xfffff000) + (uva % PAGESIZE);
  102f38:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  102f3d:	89 ea                	mov    %ebp,%edx
  102f3f:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  102f45:	09 d0                	or     %edx,%eax

		size_t size = (len < PAGESIZE - uva_pa % PAGESIZE) ?
			len : PAGESIZE - uva_pa % PAGESIZE;
  102f47:	89 c2                	mov    %eax,%edx
  102f49:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  102f4f:	be 00 10 00 00       	mov    $0x1000,%esi
  102f54:	29 d6                	sub    %edx,%esi
		size_t size = (len < PAGESIZE - uva_pa % PAGESIZE) ?
  102f56:	39 f7                	cmp    %esi,%edi
  102f58:	0f 46 f7             	cmovbe %edi,%esi

		memcpy((void *) uva_pa, kva, size);
  102f5b:	83 ec 04             	sub    $0x4,%esp
  102f5e:	56                   	push   %esi
  102f5f:	ff 74 24 38          	pushl  0x38(%esp)
  102f63:	50                   	push   %eax
  102f64:	e8 c6 ef ff ff       	call   101f2f <memcpy>

		len -= size;
  102f69:	29 f7                	sub    %esi,%edi
		uva += size;
  102f6b:	01 f5                	add    %esi,%ebp
		kva += size;
  102f6d:	01 74 24 40          	add    %esi,0x40(%esp)
		copied += size;
  102f71:	01 74 24 1c          	add    %esi,0x1c(%esp)
  102f75:	83 c4 10             	add    $0x10,%esp
	while (len) {
  102f78:	85 ff                	test   %edi,%edi
  102f7a:	74 3d                	je     102fb9 <pt_copyout+0xd1>
		uintptr_t uva_pa = get_ptbl_entry_by_va(pmap_id, uva);
  102f7c:	83 ec 08             	sub    $0x8,%esp
  102f7f:	55                   	push   %ebp
  102f80:	ff 74 24 40          	pushl  0x40(%esp)
  102f84:	e8 87 0a 00 00       	call   103a10 <get_ptbl_entry_by_va>
		if ((uva_pa & PTE_P) == 0) {
  102f89:	83 c4 10             	add    $0x10,%esp
  102f8c:	a8 01                	test   $0x1,%al
  102f8e:	75 a8                	jne    102f38 <pt_copyout+0x50>
			alloc_page(pmap_id, uva, PTE_P | PTE_U | PTE_W);
  102f90:	83 ec 04             	sub    $0x4,%esp
  102f93:	6a 07                	push   $0x7
  102f95:	55                   	push   %ebp
  102f96:	ff 74 24 40          	pushl  0x40(%esp)
  102f9a:	e8 d1 0e 00 00       	call   103e70 <alloc_page>
			uva_pa = get_ptbl_entry_by_va(pmap_id, uva);
  102f9f:	83 c4 08             	add    $0x8,%esp
  102fa2:	55                   	push   %ebp
  102fa3:	ff 74 24 40          	pushl  0x40(%esp)
  102fa7:	e8 64 0a 00 00       	call   103a10 <get_ptbl_entry_by_va>
  102fac:	83 c4 10             	add    $0x10,%esp
  102faf:	eb 87                	jmp    102f38 <pt_copyout+0x50>
		return 0;
  102fb1:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  102fb8:	00 
	}

	return copied;
}
  102fb9:	8b 44 24 0c          	mov    0xc(%esp),%eax
  102fbd:	83 c4 1c             	add    $0x1c,%esp
  102fc0:	5b                   	pop    %ebx
  102fc1:	5e                   	pop    %esi
  102fc2:	5f                   	pop    %edi
  102fc3:	5d                   	pop    %ebp
  102fc4:	c3                   	ret    
		return 0;
  102fc5:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  102fcc:	00 
  102fcd:	eb ea                	jmp    102fb9 <pt_copyout+0xd1>
		return 0;
  102fcf:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  102fd6:	00 
  102fd7:	eb e0                	jmp    102fb9 <pt_copyout+0xd1>

00102fd9 <pt_memset>:

size_t
pt_memset(uint32_t pmap_id, uintptr_t va, char c, size_t len)
{
  102fd9:	55                   	push   %ebp
  102fda:	57                   	push   %edi
  102fdb:	56                   	push   %esi
  102fdc:	53                   	push   %ebx
  102fdd:	83 ec 1c             	sub    $0x1c,%esp
  102fe0:	e8 36 d3 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  102fe5:	81 c3 1b 70 00 00    	add    $0x701b,%ebx
  102feb:	8b 6c 24 34          	mov    0x34(%esp),%ebp
  102fef:	8b 7c 24 3c          	mov    0x3c(%esp),%edi
  102ff3:	0f b6 44 24 38       	movzbl 0x38(%esp),%eax
  102ff8:	88 44 24 0f          	mov    %al,0xf(%esp)
        size_t set = 0;
  102ffc:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  103003:	00 

	while (len) {
  103004:	eb 3e                	jmp    103044 <pt_memset+0x6b>
		if ((pa & PTE_P) == 0) {
			alloc_page(pmap_id, va, PTE_P | PTE_U | PTE_W);
			pa = get_ptbl_entry_by_va(pmap_id, va);
		}

		pa = (pa & 0xfffff000) + (va % PAGESIZE);
  103006:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  10300b:	89 ea                	mov    %ebp,%edx
  10300d:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  103013:	09 d0                	or     %edx,%eax

		size_t size = (len < PAGESIZE - pa % PAGESIZE) ?
			len : PAGESIZE - pa % PAGESIZE;
  103015:	89 c2                	mov    %eax,%edx
  103017:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  10301d:	be 00 10 00 00       	mov    $0x1000,%esi
  103022:	29 d6                	sub    %edx,%esi
		size_t size = (len < PAGESIZE - pa % PAGESIZE) ?
  103024:	39 f7                	cmp    %esi,%edi
  103026:	0f 46 f7             	cmovbe %edi,%esi

		memset((void *) pa, c, size);
  103029:	83 ec 04             	sub    $0x4,%esp
  10302c:	56                   	push   %esi
  10302d:	0f be 54 24 17       	movsbl 0x17(%esp),%edx
  103032:	52                   	push   %edx
  103033:	50                   	push   %eax
  103034:	e8 42 ee ff ff       	call   101e7b <memset>

		len -= size;
  103039:	29 f7                	sub    %esi,%edi
		va += size;
  10303b:	01 f5                	add    %esi,%ebp
		set += size;
  10303d:	01 74 24 18          	add    %esi,0x18(%esp)
  103041:	83 c4 10             	add    $0x10,%esp
	while (len) {
  103044:	85 ff                	test   %edi,%edi
  103046:	74 35                	je     10307d <pt_memset+0xa4>
		uintptr_t pa = get_ptbl_entry_by_va(pmap_id, va);
  103048:	83 ec 08             	sub    $0x8,%esp
  10304b:	55                   	push   %ebp
  10304c:	ff 74 24 3c          	pushl  0x3c(%esp)
  103050:	e8 bb 09 00 00       	call   103a10 <get_ptbl_entry_by_va>
		if ((pa & PTE_P) == 0) {
  103055:	83 c4 10             	add    $0x10,%esp
  103058:	a8 01                	test   $0x1,%al
  10305a:	75 aa                	jne    103006 <pt_memset+0x2d>
			alloc_page(pmap_id, va, PTE_P | PTE_U | PTE_W);
  10305c:	83 ec 04             	sub    $0x4,%esp
  10305f:	6a 07                	push   $0x7
  103061:	55                   	push   %ebp
  103062:	ff 74 24 3c          	pushl  0x3c(%esp)
  103066:	e8 05 0e 00 00       	call   103e70 <alloc_page>
			pa = get_ptbl_entry_by_va(pmap_id, va);
  10306b:	83 c4 08             	add    $0x8,%esp
  10306e:	55                   	push   %ebp
  10306f:	ff 74 24 3c          	pushl  0x3c(%esp)
  103073:	e8 98 09 00 00       	call   103a10 <get_ptbl_entry_by_va>
  103078:	83 c4 10             	add    $0x10,%esp
  10307b:	eb 89                	jmp    103006 <pt_memset+0x2d>
	}

	return set;
}
  10307d:	8b 44 24 08          	mov    0x8(%esp),%eax
  103081:	83 c4 1c             	add    $0x1c,%esp
  103084:	5b                   	pop    %ebx
  103085:	5e                   	pop    %esi
  103086:	5f                   	pop    %edi
  103087:	5d                   	pop    %ebp
  103088:	c3                   	ret    

00103089 <elf_load>:
/*
 * Load elf execution file exe to the virtual address space pmap.
 */
void
elf_load (void *exe_ptr, int pid)
{
  103089:	55                   	push   %ebp
  10308a:	57                   	push   %edi
  10308b:	56                   	push   %esi
  10308c:	53                   	push   %ebx
  10308d:	83 ec 2c             	sub    $0x2c,%esp
  103090:	e8 86 d2 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  103095:	81 c3 6b 6f 00 00    	add    $0x6f6b,%ebx
  10309b:	8b 74 24 40          	mov    0x40(%esp),%esi
  10309f:	8b 7c 24 44          	mov    0x44(%esp),%edi
	elfhdr *eh;
	proghdr *ph, *eph;
	sechdr *sh, *esh;
	char *strtab;
	uintptr_t exe = (uintptr_t) exe_ptr;
  1030a3:	89 74 24 1c          	mov    %esi,0x1c(%esp)

	eh = (elfhdr *) exe;

	KERN_ASSERT(eh->e_magic == ELF_MAGIC);
  1030a7:	81 3e 7f 45 4c 46    	cmpl   $0x464c457f,(%esi)
  1030ad:	74 1f                	je     1030ce <elf_load+0x45>
  1030af:	8d 83 49 ba ff ff    	lea    -0x45b7(%ebx),%eax
  1030b5:	50                   	push   %eax
  1030b6:	8d 83 57 b5 ff ff    	lea    -0x4aa9(%ebx),%eax
  1030bc:	50                   	push   %eax
  1030bd:	6a 1e                	push   $0x1e
  1030bf:	8d 83 62 ba ff ff    	lea    -0x459e(%ebx),%eax
  1030c5:	50                   	push   %eax
  1030c6:	e8 c6 ef ff ff       	call   102091 <debug_panic>
  1030cb:	83 c4 10             	add    $0x10,%esp
	KERN_ASSERT(eh->e_shstrndx != ELF_SHN_UNDEF);
  1030ce:	66 83 7e 32 00       	cmpw   $0x0,0x32(%esi)
  1030d3:	74 52                	je     103127 <elf_load+0x9e>

	sh = (sechdr *) ((uintptr_t) eh + eh->e_shoff);
  1030d5:	89 f1                	mov    %esi,%ecx
  1030d7:	03 4e 20             	add    0x20(%esi),%ecx
	esh = sh + eh->e_shnum;

	strtab = (char *) (exe + sh[eh->e_shstrndx].sh_offset);
  1030da:	0f b7 46 32          	movzwl 0x32(%esi),%eax
  1030de:	8d 14 80             	lea    (%eax,%eax,4),%edx
  1030e1:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
	KERN_ASSERT(sh[eh->e_shstrndx].sh_type == ELF_SHT_STRTAB);
  1030e8:	83 7c 01 04 03       	cmpl   $0x3,0x4(%ecx,%eax,1)
  1030ed:	74 1f                	je     10310e <elf_load+0x85>
  1030ef:	8d 83 94 ba ff ff    	lea    -0x456c(%ebx),%eax
  1030f5:	50                   	push   %eax
  1030f6:	8d 83 57 b5 ff ff    	lea    -0x4aa9(%ebx),%eax
  1030fc:	50                   	push   %eax
  1030fd:	6a 25                	push   $0x25
  1030ff:	8d 83 62 ba ff ff    	lea    -0x459e(%ebx),%eax
  103105:	50                   	push   %eax
  103106:	e8 86 ef ff ff       	call   102091 <debug_panic>
  10310b:	83 c4 10             	add    $0x10,%esp

	ph = (proghdr *) ((uintptr_t) eh + eh->e_phoff);
  10310e:	89 f2                	mov    %esi,%edx
  103110:	03 56 1c             	add    0x1c(%esi),%edx
  103113:	89 d5                	mov    %edx,%ebp
	eph = ph + eh->e_phnum;
  103115:	0f b7 46 2c          	movzwl 0x2c(%esi),%eax
  103119:	c1 e0 05             	shl    $0x5,%eax
  10311c:	01 d0                	add    %edx,%eax
  10311e:	89 44 24 10          	mov    %eax,0x10(%esp)

	for (; ph < eph; ph++)
  103122:	e9 c7 00 00 00       	jmp    1031ee <elf_load+0x165>
	KERN_ASSERT(eh->e_shstrndx != ELF_SHN_UNDEF);
  103127:	8d 83 74 ba ff ff    	lea    -0x458c(%ebx),%eax
  10312d:	50                   	push   %eax
  10312e:	8d 83 57 b5 ff ff    	lea    -0x4aa9(%ebx),%eax
  103134:	50                   	push   %eax
  103135:	6a 1f                	push   $0x1f
  103137:	8d 83 62 ba ff ff    	lea    -0x459e(%ebx),%eax
  10313d:	50                   	push   %eax
  10313e:	e8 4e ef ff ff       	call   102091 <debug_panic>
  103143:	83 c4 10             	add    $0x10,%esp
  103146:	eb 8d                	jmp    1030d5 <elf_load+0x4c>
		zva = ph->p_va + ph->p_filesz;
		eva = roundup (ph->p_va + ph->p_memsz, PAGESIZE);

		perm = PTE_U | PTE_P;
		if (ph->p_flags & ELF_PROG_FLAG_WRITE)
			perm |= PTE_W;
  103148:	c7 44 24 0c 07 00 00 	movl   $0x7,0xc(%esp)
  10314f:	00 
  103150:	89 6c 24 14          	mov    %ebp,0x14(%esp)
  103154:	8b 6c 24 18          	mov    0x18(%esp),%ebp
  103158:	eb 2f                	jmp    103189 <elf_load+0x100>
			//dprintf("allocated pages \n");

			if (va < rounddown (zva, PAGESIZE))
			{
				/* copy a complete page */
				pt_copyout ((void *) fa, pid, va, PAGESIZE);
  10315a:	68 00 10 00 00       	push   $0x1000
  10315f:	56                   	push   %esi
  103160:	57                   	push   %edi
  103161:	55                   	push   %ebp
  103162:	e8 81 fd ff ff       	call   102ee8 <pt_copyout>
  103167:	83 c4 10             	add    $0x10,%esp
  10316a:	eb 11                	jmp    10317d <elf_load+0xf4>
				pt_copyout ((void *) fa, pid, va, zva - va);
			}
			else
			{
				/* zero a page */
				pt_memset (pid, va, 0, PAGESIZE);
  10316c:	68 00 10 00 00       	push   $0x1000
  103171:	6a 00                	push   $0x0
  103173:	56                   	push   %esi
  103174:	57                   	push   %edi
  103175:	e8 5f fe ff ff       	call   102fd9 <pt_memset>
  10317a:	83 c4 10             	add    $0x10,%esp
		for (; va < eva; va += PAGESIZE, fa += PAGESIZE)
  10317d:	81 c6 00 10 00 00    	add    $0x1000,%esi
  103183:	81 c5 00 10 00 00    	add    $0x1000,%ebp
  103189:	3b 74 24 08          	cmp    0x8(%esp),%esi
  10318d:	73 58                	jae    1031e7 <elf_load+0x15e>
			alloc_page (pid, va, perm);
  10318f:	83 ec 04             	sub    $0x4,%esp
  103192:	ff 74 24 10          	pushl  0x10(%esp)
  103196:	56                   	push   %esi
  103197:	57                   	push   %edi
  103198:	e8 d3 0c 00 00       	call   103e70 <alloc_page>
			if (va < rounddown (zva, PAGESIZE))
  10319d:	83 c4 08             	add    $0x8,%esp
  1031a0:	68 00 10 00 00       	push   $0x1000
  1031a5:	ff 74 24 10          	pushl  0x10(%esp)
  1031a9:	e8 f4 f7 ff ff       	call   1029a2 <rounddown>
  1031ae:	83 c4 10             	add    $0x10,%esp
  1031b1:	39 c6                	cmp    %eax,%esi
  1031b3:	72 a5                	jb     10315a <elf_load+0xd1>
			else if (va < zva && ph->p_filesz)
  1031b5:	3b 74 24 04          	cmp    0x4(%esp),%esi
  1031b9:	73 b1                	jae    10316c <elf_load+0xe3>
  1031bb:	8b 44 24 14          	mov    0x14(%esp),%eax
  1031bf:	83 78 10 00          	cmpl   $0x0,0x10(%eax)
  1031c3:	74 a7                	je     10316c <elf_load+0xe3>
				pt_memset (pid, va, 0, PAGESIZE);
  1031c5:	68 00 10 00 00       	push   $0x1000
  1031ca:	6a 00                	push   $0x0
  1031cc:	56                   	push   %esi
  1031cd:	57                   	push   %edi
  1031ce:	e8 06 fe ff ff       	call   102fd9 <pt_memset>
				pt_copyout ((void *) fa, pid, va, zva - va);
  1031d3:	8b 44 24 14          	mov    0x14(%esp),%eax
  1031d7:	29 f0                	sub    %esi,%eax
  1031d9:	50                   	push   %eax
  1031da:	56                   	push   %esi
  1031db:	57                   	push   %edi
  1031dc:	55                   	push   %ebp
  1031dd:	e8 06 fd ff ff       	call   102ee8 <pt_copyout>
  1031e2:	83 c4 20             	add    $0x20,%esp
  1031e5:	eb 96                	jmp    10317d <elf_load+0xf4>
  1031e7:	8b 6c 24 14          	mov    0x14(%esp),%ebp
	for (; ph < eph; ph++)
  1031eb:	83 c5 20             	add    $0x20,%ebp
  1031ee:	3b 6c 24 10          	cmp    0x10(%esp),%ebp
  1031f2:	73 73                	jae    103267 <elf_load+0x1de>
		if (ph->p_type != ELF_PROG_LOAD)
  1031f4:	83 7d 00 01          	cmpl   $0x1,0x0(%ebp)
  1031f8:	75 f1                	jne    1031eb <elf_load+0x162>
		fa = (uintptr_t) eh + rounddown (ph->p_offset, PAGESIZE);
  1031fa:	83 ec 08             	sub    $0x8,%esp
  1031fd:	68 00 10 00 00       	push   $0x1000
  103202:	ff 75 04             	pushl  0x4(%ebp)
  103205:	e8 98 f7 ff ff       	call   1029a2 <rounddown>
  10320a:	03 44 24 2c          	add    0x2c(%esp),%eax
  10320e:	89 44 24 28          	mov    %eax,0x28(%esp)
		va = rounddown (ph->p_va, PAGESIZE);
  103212:	83 c4 08             	add    $0x8,%esp
  103215:	68 00 10 00 00       	push   $0x1000
  10321a:	ff 75 08             	pushl  0x8(%ebp)
  10321d:	e8 80 f7 ff ff       	call   1029a2 <rounddown>
  103222:	89 c6                	mov    %eax,%esi
		zva = ph->p_va + ph->p_filesz;
  103224:	8b 45 08             	mov    0x8(%ebp),%eax
  103227:	89 c1                	mov    %eax,%ecx
  103229:	03 4d 10             	add    0x10(%ebp),%ecx
  10322c:	89 4c 24 14          	mov    %ecx,0x14(%esp)
		eva = roundup (ph->p_va + ph->p_memsz, PAGESIZE);
  103230:	03 45 14             	add    0x14(%ebp),%eax
  103233:	83 c4 08             	add    $0x8,%esp
  103236:	68 00 10 00 00       	push   $0x1000
  10323b:	50                   	push   %eax
  10323c:	e8 75 f7 ff ff       	call   1029b6 <roundup>
  103241:	89 44 24 18          	mov    %eax,0x18(%esp)
		if (ph->p_flags & ELF_PROG_FLAG_WRITE)
  103245:	83 c4 10             	add    $0x10,%esp
  103248:	f6 45 18 02          	testb  $0x2,0x18(%ebp)
  10324c:	0f 85 f6 fe ff ff    	jne    103148 <elf_load+0xbf>
		perm = PTE_U | PTE_P;
  103252:	c7 44 24 0c 05 00 00 	movl   $0x5,0xc(%esp)
  103259:	00 
  10325a:	89 6c 24 14          	mov    %ebp,0x14(%esp)
  10325e:	8b 6c 24 18          	mov    0x18(%esp),%ebp
  103262:	e9 22 ff ff ff       	jmp    103189 <elf_load+0x100>
			}
		}
	}

}
  103267:	83 c4 2c             	add    $0x2c,%esp
  10326a:	5b                   	pop    %ebx
  10326b:	5e                   	pop    %esi
  10326c:	5f                   	pop    %edi
  10326d:	5d                   	pop    %ebp
  10326e:	c3                   	ret    

0010326f <elf_entry>:

uintptr_t
elf_entry (void *exe_ptr)
{
  10326f:	56                   	push   %esi
  103270:	53                   	push   %ebx
  103271:	83 ec 04             	sub    $0x4,%esp
  103274:	e8 a2 d0 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  103279:	81 c3 87 6d 00 00    	add    $0x6d87,%ebx
  10327f:	8b 74 24 10          	mov    0x10(%esp),%esi
	uintptr_t exe = (uintptr_t) exe_ptr;
	elfhdr *eh = (elfhdr *) exe;
	KERN_ASSERT(eh->e_magic == ELF_MAGIC);
  103283:	81 3e 7f 45 4c 46    	cmpl   $0x464c457f,(%esi)
  103289:	74 1f                	je     1032aa <elf_entry+0x3b>
  10328b:	8d 83 49 ba ff ff    	lea    -0x45b7(%ebx),%eax
  103291:	50                   	push   %eax
  103292:	8d 83 57 b5 ff ff    	lea    -0x4aa9(%ebx),%eax
  103298:	50                   	push   %eax
  103299:	6a 5d                	push   $0x5d
  10329b:	8d 83 62 ba ff ff    	lea    -0x459e(%ebx),%eax
  1032a1:	50                   	push   %eax
  1032a2:	e8 ea ed ff ff       	call   102091 <debug_panic>
  1032a7:	83 c4 10             	add    $0x10,%esp
	return (uintptr_t) eh->e_entry;
  1032aa:	8b 46 18             	mov    0x18(%esi),%eax
}
  1032ad:	83 c4 04             	add    $0x4,%esp
  1032b0:	5b                   	pop    %ebx
  1032b1:	5e                   	pop    %esi
  1032b2:	c3                   	ret    
  1032b3:	66 90                	xchg   %ax,%ax
  1032b5:	66 90                	xchg   %ax,%ax
  1032b7:	66 90                	xchg   %ax,%ax
  1032b9:	66 90                	xchg   %ax,%ax
  1032bb:	66 90                	xchg   %ax,%ax
  1032bd:	66 90                	xchg   %ax,%ax
  1032bf:	90                   	nop

001032c0 <kern_init>:
    #endif
}

void
kern_init (uintptr_t mbi_addr)
{
  1032c0:	56                   	push   %esi
  1032c1:	53                   	push   %ebx
  1032c2:	e8 54 d0 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  1032c7:	81 c3 39 6d 00 00    	add    $0x6d39,%ebx
  1032cd:	83 ec 10             	sub    $0x10,%esp
    thread_init(mbi_addr);
  1032d0:	ff 74 24 1c          	pushl  0x1c(%esp)

    KERN_DEBUG("Kernel initialized.\n");
  1032d4:	8d b3 d6 ba ff ff    	lea    -0x452a(%ebx),%esi
    thread_init(mbi_addr);
  1032da:	e8 11 12 00 00       	call   1044f0 <thread_init>
    KERN_DEBUG("Kernel initialized.\n");
  1032df:	8d 83 c1 ba ff ff    	lea    -0x453f(%ebx),%eax
  1032e5:	83 c4 0c             	add    $0xc,%esp
  1032e8:	50                   	push   %eax
  1032e9:	6a 39                	push   $0x39
  1032eb:	56                   	push   %esi
  1032ec:	e8 67 ed ff ff       	call   102058 <debug_normal>
    KERN_DEBUG("In kernel main.\n\n");
  1032f1:	8d 83 e7 ba ff ff    	lea    -0x4519(%ebx),%eax
  1032f7:	83 c4 0c             	add    $0xc,%esp
  1032fa:	50                   	push   %eax
  1032fb:	6a 10                	push   $0x10
  1032fd:	56                   	push   %esi
  1032fe:	e8 55 ed ff ff       	call   102058 <debug_normal>
    monitor(NULL);
  103303:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10330a:	e8 7b fa ff ff       	call   102d8a <monitor>

    kern_main ();
}
  10330f:	83 c4 14             	add    $0x14,%esp
  103312:	5b                   	pop    %ebx
  103313:	5e                   	pop    %esi
  103314:	c3                   	ret    
  103315:	66 90                	xchg   %ax,%ax
  103317:	90                   	nop
  103318:	02 b0 ad 1b 03 00    	add    0x31bad(%eax),%dh
  10331e:	00 00                	add    %al,(%eax)
  103320:	fb                   	sti    
  103321:	4f                   	dec    %edi
  103322:	52                   	push   %edx
  103323:	e4                   	.byte 0xe4

00103324 <start>:
	.long	CHECKSUM

	/* this is the entry of the kernel */
	.globl	start
start:
	cli
  103324:	fa                   	cli    

	/* check whether the bootloader provide multiboot information */
	cmpl    $MULTIBOOT_BOOTLOADER_MAGIC, %eax
  103325:	3d 02 b0 ad 2b       	cmp    $0x2badb002,%eax
	jne     spin
  10332a:	75 27                	jne    103353 <spin>
	movl	%ebx, multiboot_ptr
  10332c:	89 1d 54 33 10 00    	mov    %ebx,0x103354

	/* tell BIOS to warmboot next time */
	movw	$0x1234,0x472
  103332:	66 c7 05 72 04 00 00 	movw   $0x1234,0x472
  103339:	34 12 

	/* clear EFLAGS */
	pushl	$0x2
  10333b:	6a 02                	push   $0x2
	popfl
  10333d:	9d                   	popf   

	/* prepare the kernel stack  */
	movl	$0x0,%ebp
  10333e:	bd 00 00 00 00       	mov    $0x0,%ebp
	movl	$(bsp_kstack+4096),%esp
  103343:	bc 00 30 97 00       	mov    $0x973000,%esp

	/* jump to the C code */
	push	multiboot_ptr
  103348:	ff 35 54 33 10 00    	pushl  0x103354
	call	kern_init
  10334e:	e8 6d ff ff ff       	call   1032c0 <kern_init>

00103353 <spin>:

	/* should not be here */
spin:
	hlt
  103353:	f4                   	hlt    

00103354 <multiboot_ptr>:
  103354:	00 00                	add    %al,(%eax)
  103356:	00 00                	add    %al,(%eax)
  103358:	66 90                	xchg   %ax,%ax
  10335a:	66 90                	xchg   %ax,%ax
  10335c:	66 90                	xchg   %ax,%ax
  10335e:	66 90                	xchg   %ax,%ax

00103360 <get_nps>:
static struct ATStruct AT[1 << 20];  

//The getter function for NUM_PAGES.
unsigned int
get_nps(void)
{
  103360:	e8 7c da ff ff       	call   100de1 <__x86.get_pc_thunk.ax>
  103365:	05 9b 6c 00 00       	add    $0x6c9b,%eax
	return NUM_PAGES;
  10336a:	8b 80 60 6f 82 00    	mov    0x826f60(%eax),%eax
}
  103370:	c3                   	ret    
  103371:	eb 0d                	jmp    103380 <set_nps>
  103373:	90                   	nop
  103374:	90                   	nop
  103375:	90                   	nop
  103376:	90                   	nop
  103377:	90                   	nop
  103378:	90                   	nop
  103379:	90                   	nop
  10337a:	90                   	nop
  10337b:	90                   	nop
  10337c:	90                   	nop
  10337d:	90                   	nop
  10337e:	90                   	nop
  10337f:	90                   	nop

00103380 <set_nps>:

//The setter function for NUM_PAGES.
void
set_nps(unsigned int nps)
{
	NUM_PAGES = nps;
  103380:	8b 54 24 04          	mov    0x4(%esp),%edx
  103384:	e8 58 da ff ff       	call   100de1 <__x86.get_pc_thunk.ax>
  103389:	05 77 6c 00 00       	add    $0x6c77,%eax
  10338e:	89 90 60 6f 82 00    	mov    %edx,0x826f60(%eax)
  103394:	c3                   	ret    
  103395:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  103399:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001033a0 <at_is_norm>:
  */
unsigned int
at_is_norm(unsigned int page_index)
{
  //TODO
  if(AT[page_index].perm > 1)
  1033a0:	8b 54 24 04          	mov    0x4(%esp),%edx
  1033a4:	e8 38 da ff ff       	call   100de1 <__x86.get_pc_thunk.ax>
  1033a9:	05 57 6c 00 00       	add    $0x6c57,%eax
  1033ae:	83 bc d0 60 6f 02 00 	cmpl   $0x1,0x26f60(%eax,%edx,8)
  1033b5:	01 
  1033b6:	0f 97 c0             	seta   %al
  1033b9:	0f b6 c0             	movzbl %al,%eax
    return 1;
  return 0;
}
  1033bc:	c3                   	ret    
  1033bd:	8d 76 00             	lea    0x0(%esi),%esi

001033c0 <at_set_perm>:
  *  - It also marks the page as unallocated.
  * Hint: See the definition of ATStruct for allocated.
  */
void
at_set_perm(unsigned int page_index, unsigned int norm_val)
{
  1033c0:	8b 54 24 04          	mov    0x4(%esp),%edx
  //TODO
  AT[page_index].perm = norm_val;
  1033c4:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  1033c8:	e8 14 da ff ff       	call   100de1 <__x86.get_pc_thunk.ax>
  1033cd:	05 33 6c 00 00       	add    $0x6c33,%eax
  1033d2:	89 8c d0 60 6f 02 00 	mov    %ecx,0x26f60(%eax,%edx,8)
  AT[page_index].allocated = 0;
  1033d9:	c7 84 d0 64 6f 02 00 	movl   $0x0,0x26f64(%eax,%edx,8)
  1033e0:	00 00 00 00 
  1033e4:	c3                   	ret    
  1033e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1033e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001033f0 <at_is_allocated>:
unsigned int
at_is_allocated(unsigned int page_index)
{
  //TODO

  if(AT[page_index].allocated > 0)
  1033f0:	8b 54 24 04          	mov    0x4(%esp),%edx
  1033f4:	e8 e8 d9 ff ff       	call   100de1 <__x86.get_pc_thunk.ax>
  1033f9:	05 07 6c 00 00       	add    $0x6c07,%eax
  1033fe:	8b 84 d0 64 6f 02 00 	mov    0x26f64(%eax,%edx,8),%eax
  103405:	85 c0                	test   %eax,%eax
  103407:	0f 95 c0             	setne  %al
  10340a:	0f b6 c0             	movzbl %al,%eax
    return 1;
  return 0;
}
  10340d:	c3                   	ret    
  10340e:	66 90                	xchg   %ax,%ax

00103410 <at_set_allocated>:
  */
void
at_set_allocated(unsigned int page_index, unsigned int allocated)
{
  //TODO
  AT[page_index].allocated = allocated;
  103410:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  103414:	8b 54 24 04          	mov    0x4(%esp),%edx
  103418:	e8 c4 d9 ff ff       	call   100de1 <__x86.get_pc_thunk.ax>
  10341d:	05 e3 6b 00 00       	add    $0x6be3,%eax
  103422:	89 8c d0 64 6f 02 00 	mov    %ecx,0x26f64(%eax,%edx,8)
  103429:	c3                   	ret    
  10342a:	66 90                	xchg   %ax,%ax
  10342c:	66 90                	xchg   %ax,%ax
  10342e:	66 90                	xchg   %ax,%ax

00103430 <pmem_init>:
  *
  *  - Review import.h in the current directory for the list of available getter and setter functions.
  */
void
pmem_init(unsigned int mbi_addr)
{
  103430:	55                   	push   %ebp
  103431:	57                   	push   %edi
  103432:	56                   	push   %esi
  103433:	53                   	push   %ebx
  103434:	e8 e2 ce ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  103439:	81 c3 c7 6b 00 00    	add    $0x6bc7,%ebx
  10343f:	83 ec 28             	sub    $0x28,%esp
  // TODO: Define your local variables here.

  //Calls the lower layer initializatin primitives.
  //The parameter mbi_addr shell not be used in the further code.

  dprintf("start physical mm init.\n");
  103442:	8d 83 f9 ba ff ff    	lea    -0x4507(%ebx),%eax
  103448:	50                   	push   %eax
  103449:	e8 d6 ed ff ff       	call   102224 <dprintf>
	devinit(mbi_addr);
  10344e:	58                   	pop    %eax
  10344f:	ff 74 24 3c          	pushl  0x3c(%esp)
  103453:	e8 73 d4 ff ff       	call   1008cb <devinit>
    * Hint 2: Think of it as the highest address possible in the ranges of the memory map table,
    *         divided by the page size plus 1.
    */
  // TODO

  int numRows = get_size();
  103458:	e8 37 d8 ff ff       	call   100c94 <get_size>
  10345d:	89 44 24 1c          	mov    %eax,0x1c(%esp)

  //nps = 2^20 / (2^10*2^2) + 1;

  int i ;
  nps = 0;
  for(i=0; i < numRows; i++){
  103461:	83 c4 10             	add    $0x10,%esp
  103464:	85 c0                	test   %eax,%eax
  103466:	0f 8e dd 00 00 00    	jle    103549 <pmem_init+0x119>
  10346c:	31 f6                	xor    %esi,%esi
  10346e:	31 ed                	xor    %ebp,%ebp
  103470:	eb 0f                	jmp    103481 <pmem_init+0x51>
  103472:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  103478:	83 c6 01             	add    $0x1,%esi
  10347b:	39 74 24 0c          	cmp    %esi,0xc(%esp)
  10347f:	74 3d                	je     1034be <pmem_init+0x8e>


      if(nps < (get_mms(i)+get_mml(i))){
  103481:	83 ec 0c             	sub    $0xc,%esp
  103484:	56                   	push   %esi
  103485:	e8 1b d8 ff ff       	call   100ca5 <get_mms>
  10348a:	89 c7                	mov    %eax,%edi
  10348c:	89 34 24             	mov    %esi,(%esp)
  10348f:	e8 5a d8 ff ff       	call   100cee <get_mml>
  103494:	01 c7                	add    %eax,%edi
  103496:	83 c4 10             	add    $0x10,%esp
  103499:	39 ef                	cmp    %ebp,%edi
  10349b:	76 db                	jbe    103478 <pmem_init+0x48>

        nps = get_mms(i) + get_mml(i); 
  10349d:	83 ec 0c             	sub    $0xc,%esp
  1034a0:	56                   	push   %esi
  1034a1:	e8 ff d7 ff ff       	call   100ca5 <get_mms>
  1034a6:	89 34 24             	mov    %esi,(%esp)
  1034a9:	89 c5                	mov    %eax,%ebp
  for(i=0; i < numRows; i++){
  1034ab:	83 c6 01             	add    $0x1,%esi
        nps = get_mms(i) + get_mml(i); 
  1034ae:	e8 3b d8 ff ff       	call   100cee <get_mml>
  1034b3:	83 c4 10             	add    $0x10,%esp
  1034b6:	01 c5                	add    %eax,%ebp
  for(i=0; i < numRows; i++){
  1034b8:	39 74 24 0c          	cmp    %esi,0xc(%esp)
  1034bc:	75 c3                	jne    103481 <pmem_init+0x51>
  1034be:	89 e8                	mov    %ebp,%eax
  1034c0:	c1 e8 0c             	shr    $0xc,%eax
  1034c3:	81 e5 ff 0f 00 00    	and    $0xfff,%ebp
  1034c9:	8d 78 01             	lea    0x1(%eax),%edi
  1034cc:	0f 44 f8             	cmove  %eax,%edi
    nps = nps / PAGESIZE + 1;




	set_nps(nps); // Setting the value computed above to NUM_PAGES.
  1034cf:	83 ec 0c             	sub    $0xc,%esp
    *    You should still set the permission of those pages in allocation table to 0.
    */
  // TODO

  //int i;
  for(i = 0; i < VM_USERLO_PI; i++)
  1034d2:	31 f6                	xor    %esi,%esi
	set_nps(nps); // Setting the value computed above to NUM_PAGES.
  1034d4:	57                   	push   %edi
  1034d5:	e8 a6 fe ff ff       	call   103380 <set_nps>
  1034da:	83 c4 10             	add    $0x10,%esp
  1034dd:	8d 76 00             	lea    0x0(%esi),%esi
    at_set_perm(i, 1);
  1034e0:	83 ec 08             	sub    $0x8,%esp
  1034e3:	6a 01                	push   $0x1
  1034e5:	56                   	push   %esi
  for(i = 0; i < VM_USERLO_PI; i++)
  1034e6:	83 c6 01             	add    $0x1,%esi
    at_set_perm(i, 1);
  1034e9:	e8 d2 fe ff ff       	call   1033c0 <at_set_perm>
  for(i = 0; i < VM_USERLO_PI; i++)
  1034ee:	83 c4 10             	add    $0x10,%esp
  1034f1:	81 fe 00 00 04 00    	cmp    $0x40000,%esi
  1034f7:	75 e7                	jne    1034e0 <pmem_init+0xb0>
 
  for(i = VM_USERHI_PI; i < nps; i++)
  1034f9:	81 ff 00 00 0f 00    	cmp    $0xf0000,%edi
  1034ff:	bd 00 00 0f 00       	mov    $0xf0000,%ebp
  103504:	76 22                	jbe    103528 <pmem_init+0xf8>
  103506:	8d 76 00             	lea    0x0(%esi),%esi
  103509:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    at_set_perm(i, 1);
  103510:	83 ec 08             	sub    $0x8,%esp
  103513:	6a 01                	push   $0x1
  103515:	55                   	push   %ebp
  for(i = VM_USERHI_PI; i < nps; i++)
  103516:	83 c5 01             	add    $0x1,%ebp
    at_set_perm(i, 1);
  103519:	e8 a2 fe ff ff       	call   1033c0 <at_set_perm>
  for(i = VM_USERHI_PI; i < nps; i++)
  10351e:	83 c4 10             	add    $0x10,%esp
  103521:	39 fd                	cmp    %edi,%ebp
  103523:	75 eb                	jne    103510 <pmem_init+0xe0>
  103525:	8d 76 00             	lea    0x0(%esi),%esi

  for(i = VM_USERLO_PI; i < VM_USERHI_PI; i++){
        at_set_perm(i, 2); 
  103528:	83 ec 08             	sub    $0x8,%esp
  10352b:	6a 02                	push   $0x2
  10352d:	56                   	push   %esi
  for(i = VM_USERLO_PI; i < VM_USERHI_PI; i++){
  10352e:	83 c6 01             	add    $0x1,%esi
        at_set_perm(i, 2); 
  103531:	e8 8a fe ff ff       	call   1033c0 <at_set_perm>
  for(i = VM_USERLO_PI; i < VM_USERHI_PI; i++){
  103536:	83 c4 10             	add    $0x10,%esp
  103539:	81 fe 00 00 0f 00    	cmp    $0xf0000,%esi
  10353f:	75 e7                	jne    103528 <pmem_init+0xf8>
  

  


}
  103541:	83 c4 1c             	add    $0x1c,%esp
  103544:	5b                   	pop    %ebx
  103545:	5e                   	pop    %esi
  103546:	5f                   	pop    %edi
  103547:	5d                   	pop    %ebp
  103548:	c3                   	ret    
  for(i=0; i < numRows; i++){
  103549:	31 ff                	xor    %edi,%edi
  10354b:	eb 82                	jmp    1034cf <pmem_init+0x9f>
  10354d:	66 90                	xchg   %ax,%ax
  10354f:	90                   	nop

00103550 <palloc>:
  * 2. Optimize the code with the memorization techniques so that you do not have to
  *    scan the allocation table from scratch every time.
  */
unsigned int
palloc()
{
  103550:	57                   	push   %edi
  103551:	56                   	push   %esi
  103552:	be 00 00 04 00       	mov    $0x40000,%esi
  103557:	53                   	push   %ebx
  103558:	e8 be cd ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  10355d:	81 c3 a3 6a 00 00    	add    $0x6aa3,%ebx
  103563:	eb 0e                	jmp    103573 <palloc+0x23>
  103565:	8d 76 00             	lea    0x0(%esi),%esi
  // TODO

  int i;
  for(i=VM_USERLO_PI; i< VM_USERHI_PI; i++){
  103568:	83 c6 01             	add    $0x1,%esi
  10356b:	81 fe 00 00 0f 00    	cmp    $0xf0000,%esi
  103571:	74 37                	je     1035aa <palloc+0x5a>

    if(at_is_norm(i)==1 && at_is_allocated(i)==0){
  103573:	83 ec 0c             	sub    $0xc,%esp
  103576:	89 f7                	mov    %esi,%edi
  103578:	56                   	push   %esi
  103579:	e8 22 fe ff ff       	call   1033a0 <at_is_norm>
  10357e:	83 c4 10             	add    $0x10,%esp
  103581:	83 f8 01             	cmp    $0x1,%eax
  103584:	75 e2                	jne    103568 <palloc+0x18>
  103586:	83 ec 0c             	sub    $0xc,%esp
  103589:	56                   	push   %esi
  10358a:	e8 61 fe ff ff       	call   1033f0 <at_is_allocated>
  10358f:	83 c4 10             	add    $0x10,%esp
  103592:	85 c0                	test   %eax,%eax
  103594:	75 d2                	jne    103568 <palloc+0x18>
      at_set_allocated(i, 1);
  103596:	83 ec 08             	sub    $0x8,%esp
  103599:	6a 01                	push   $0x1
  10359b:	56                   	push   %esi
  10359c:	e8 6f fe ff ff       	call   103410 <at_set_allocated>
      return i;
  1035a1:	83 c4 10             	add    $0x10,%esp
  }

  // return i;

  return 0;
} 
  1035a4:	89 f8                	mov    %edi,%eax
  1035a6:	5b                   	pop    %ebx
  1035a7:	5e                   	pop    %esi
  1035a8:	5f                   	pop    %edi
  1035a9:	c3                   	ret    
  return 0;
  1035aa:	31 ff                	xor    %edi,%edi
} 
  1035ac:	89 f8                	mov    %edi,%eax
  1035ae:	5b                   	pop    %ebx
  1035af:	5e                   	pop    %esi
  1035b0:	5f                   	pop    %edi
  1035b1:	c3                   	ret    
  1035b2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1035b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001035c0 <pfree>:
  * Hint: Simple. You have already implemented the functions required to check if a page
  * 	  is allocated and to set the allocation status of a page index. (See import.h)
  */
void
pfree(unsigned int pfree_index)
{
  1035c0:	53                   	push   %ebx
  1035c1:	e8 55 cd ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  1035c6:	81 c3 3a 6a 00 00    	add    $0x6a3a,%ebx
  1035cc:	83 ec 10             	sub    $0x10,%esp
  // TODO
  at_set_allocated(pfree_index, 0);
  1035cf:	6a 00                	push   $0x0
  1035d1:	ff 74 24 1c          	pushl  0x1c(%esp)
  1035d5:	e8 36 fe ff ff       	call   103410 <at_set_allocated>
}
  1035da:	83 c4 18             	add    $0x18,%esp
  1035dd:	5b                   	pop    %ebx
  1035de:	c3                   	ret    
  1035df:	90                   	nop

001035e0 <container_init>:
/**
  * Initializes the container data for the root process (the one with index 0).
  * The root process is the one that gets spawned first by the kernel.
  */
void container_init(unsigned int mbi_addr)
{
  1035e0:	55                   	push   %ebp
  1035e1:	57                   	push   %edi
  1035e2:	56                   	push   %esi
  1035e3:	53                   	push   %ebx
  1035e4:	e8 32 cd ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  1035e9:	81 c3 17 6a 00 00    	add    $0x6a17,%ebx
  1035ef:	83 ec 18             	sub    $0x18,%esp
  unsigned int real_quota;
  // TODO: define your local variables here.

  pmem_init(mbi_addr);
  1035f2:	ff 74 24 2c          	pushl  0x2c(%esp)
  1035f6:	e8 35 fe ff ff       	call   103430 <pmem_init>
    *  - We have already implemented functions that deal with AT data-structure in MATIntro layer.
    *    (see import.h for available functions)
    */

  int i, j;
  j = get_nps();
  1035fb:	e8 60 fd ff ff       	call   103360 <get_nps>
  for(i = 0; i < j; i++){
  103600:	83 c4 10             	add    $0x10,%esp
  103603:	85 c0                	test   %eax,%eax
  103605:	0f 8e 93 00 00 00    	jle    10369e <container_init+0xbe>
  10360b:	89 c7                	mov    %eax,%edi
  10360d:	31 f6                	xor    %esi,%esi
  10360f:	31 ed                	xor    %ebp,%ebp
  103611:	eb 0c                	jmp    10361f <container_init+0x3f>
  103613:	90                   	nop
  103614:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  103618:	83 c6 01             	add    $0x1,%esi
  10361b:	39 f7                	cmp    %esi,%edi
  10361d:	74 31                	je     103650 <container_init+0x70>
    if(at_is_norm(i)==1 && at_is_allocated(i)==0)
  10361f:	83 ec 0c             	sub    $0xc,%esp
  103622:	56                   	push   %esi
  103623:	e8 78 fd ff ff       	call   1033a0 <at_is_norm>
  103628:	83 c4 10             	add    $0x10,%esp
  10362b:	83 f8 01             	cmp    $0x1,%eax
  10362e:	75 e8                	jne    103618 <container_init+0x38>
  103630:	83 ec 0c             	sub    $0xc,%esp
  103633:	56                   	push   %esi
  103634:	e8 b7 fd ff ff       	call   1033f0 <at_is_allocated>
  103639:	83 c4 10             	add    $0x10,%esp
      real_quota++;
  10363c:	83 f8 01             	cmp    $0x1,%eax
  10363f:	83 d5 00             	adc    $0x0,%ebp
  for(i = 0; i < j; i++){
  103642:	83 c6 01             	add    $0x1,%esi
  103645:	39 f7                	cmp    %esi,%edi
  103647:	75 d6                	jne    10361f <container_init+0x3f>
  103649:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  103650:	89 ee                	mov    %ebp,%esi
  }


  KERN_DEBUG("\nreal quota: %d\n\n", real_quota);
  103652:	8d 83 12 bb ff ff    	lea    -0x44ee(%ebx),%eax
  103658:	55                   	push   %ebp
  103659:	50                   	push   %eax
  10365a:	8d 83 24 bb ff ff    	lea    -0x44dc(%ebx),%eax
  103660:	6a 3d                	push   $0x3d
  103662:	50                   	push   %eax
  103663:	e8 f0 e9 ff ff       	call   102058 <debug_normal>

  CONTAINER[0].quota = real_quota;
  103668:	89 b3 80 6f 82 00    	mov    %esi,0x826f80(%ebx)
  CONTAINER[0].usage = 0;
  10366e:	c7 83 84 6f 82 00 00 	movl   $0x0,0x826f84(%ebx)
  103675:	00 00 00 
  CONTAINER[0].parent = 0;
  103678:	c7 83 88 6f 82 00 00 	movl   $0x0,0x826f88(%ebx)
  10367f:	00 00 00 
  CONTAINER[0].nchildren = 0;
  103682:	c7 83 8c 6f 82 00 00 	movl   $0x0,0x826f8c(%ebx)
  103689:	00 00 00 
  CONTAINER[0].used = 1;
  10368c:	c7 83 90 6f 82 00 01 	movl   $0x1,0x826f90(%ebx)
  103693:	00 00 00 
}
  103696:	83 c4 1c             	add    $0x1c,%esp
  103699:	5b                   	pop    %ebx
  10369a:	5e                   	pop    %esi
  10369b:	5f                   	pop    %edi
  10369c:	5d                   	pop    %ebp
  10369d:	c3                   	ret    
  for(i = 0; i < j; i++){
  10369e:	31 f6                	xor    %esi,%esi
  real_quota = 0;
  1036a0:	31 ed                	xor    %ebp,%ebp
  1036a2:	eb ae                	jmp    103652 <container_init+0x72>
  1036a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1036aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

001036b0 <container_get_parent>:
/** TASK 2:
  * * Get the id of parent process of process # [id]
  * Hint: Simply return the parent field from CONTAINER for process id.
  */
unsigned int container_get_parent(unsigned int id)
{
  1036b0:	8b 44 24 04          	mov    0x4(%esp),%eax
  1036b4:	e8 2c d7 ff ff       	call   100de5 <__x86.get_pc_thunk.dx>
  1036b9:	81 c2 47 69 00 00    	add    $0x6947,%edx
  // TODO
  return CONTAINER[id].parent;
  1036bf:	8d 04 80             	lea    (%eax,%eax,4),%eax
  1036c2:	8b 84 82 88 6f 82 00 	mov    0x826f88(%edx,%eax,4),%eax
  return 0;
}
  1036c9:	c3                   	ret    
  1036ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

001036d0 <container_get_nchildren>:

/** TASK 3:
  * * Get the number of children of process # [id]
  */
unsigned int container_get_nchildren(unsigned int id)
{
  1036d0:	8b 44 24 04          	mov    0x4(%esp),%eax
  1036d4:	e8 0c d7 ff ff       	call   100de5 <__x86.get_pc_thunk.dx>
  1036d9:	81 c2 27 69 00 00    	add    $0x6927,%edx
  // TODO
  return CONTAINER[id].nchildren;
  1036df:	8d 04 80             	lea    (%eax,%eax,4),%eax
  1036e2:	8b 84 82 8c 6f 82 00 	mov    0x826f8c(%edx,%eax,4),%eax
  return 0;
}
  1036e9:	c3                   	ret    
  1036ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

001036f0 <container_get_quota>:

/** TASK 4:
  * * Get the maximum memory quota of process # [id]
  */
unsigned int container_get_quota(unsigned int id)
{
  1036f0:	8b 44 24 04          	mov    0x4(%esp),%eax
  1036f4:	e8 ec d6 ff ff       	call   100de5 <__x86.get_pc_thunk.dx>
  1036f9:	81 c2 07 69 00 00    	add    $0x6907,%edx
  // TODO
  return CONTAINER[id].quota;
  1036ff:	8d 04 80             	lea    (%eax,%eax,4),%eax
  103702:	8b 84 82 80 6f 82 00 	mov    0x826f80(%edx,%eax,4),%eax
  return 0;
}
  103709:	c3                   	ret    
  10370a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00103710 <container_get_usage>:

/** TASK 5:
  * * Get the current memory usage of process # [id]
  */
unsigned int container_get_usage(unsigned int id)
{
  103710:	8b 44 24 04          	mov    0x4(%esp),%eax
  103714:	e8 cc d6 ff ff       	call   100de5 <__x86.get_pc_thunk.dx>
  103719:	81 c2 e7 68 00 00    	add    $0x68e7,%edx
  // TODO
  return CONTAINER[id].usage;
  10371f:	8d 04 80             	lea    (%eax,%eax,4),%eax
  103722:	8b 84 82 84 6f 82 00 	mov    0x826f84(%edx,%eax,4),%eax
  return 0;
}
  103729:	c3                   	ret    
  10372a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00103730 <container_can_consume>:
  * * Determine whether the process # [id] can consume extra
  *   [n] pages of memory. If so, return 1, otherwise, return 0.
  * Hint 1: Check the definition of available fields in SContainer data-structure.
  */
unsigned int container_can_consume(unsigned int id, unsigned int n)
{
  103730:	8b 44 24 04          	mov    0x4(%esp),%eax
  103734:	e8 ac d6 ff ff       	call   100de5 <__x86.get_pc_thunk.dx>
  103739:	81 c2 c7 68 00 00    	add    $0x68c7,%edx
  // TODO
  if((CONTAINER[id].quota - CONTAINER[id].usage)>n) return 1;
  10373f:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
  103742:	8b 84 8a 80 6f 82 00 	mov    0x826f80(%edx,%ecx,4),%eax
  103749:	2b 84 8a 84 6f 82 00 	sub    0x826f84(%edx,%ecx,4),%eax
  103750:	3b 44 24 08          	cmp    0x8(%esp),%eax
  103754:	0f 97 c0             	seta   %al
  103757:	0f b6 c0             	movzbl %al,%eax
  return 0;
}
  10375a:	c3                   	ret    
  10375b:	90                   	nop
  10375c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00103760 <container_split>:
/**
 * Dedicates [quota] pages of memory for a new child process.
 * returns the container index for the new child process.
 */
unsigned int container_split(unsigned int id, unsigned int quota)
{
  103760:	57                   	push   %edi
  103761:	56                   	push   %esi
  103762:	53                   	push   %ebx
  103763:	8b 54 24 10          	mov    0x10(%esp),%edx
  103767:	e8 af cb ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  10376c:	81 c3 94 68 00 00    	add    $0x6894,%ebx
  103772:	8b 74 24 14          	mov    0x14(%esp),%esi
  unsigned int child, nc;

  nc = CONTAINER[id].nchildren;
  103776:	8d 04 92             	lea    (%edx,%edx,4),%eax
  103779:	8d 8c 83 80 6f 82 00 	lea    0x826f80(%ebx,%eax,4),%ecx
  child = id * MAX_CHILDREN + 1 + nc; //container index for the child process
  103780:	8d 44 52 01          	lea    0x1(%edx,%edx,2),%eax
  nc = CONTAINER[id].nchildren;
  103784:	8b 79 0c             	mov    0xc(%ecx),%edi
    * Hint 1: Read about the parent/child relationship maintained in you kernel 
    *         (available at the top of this page and handout)
    */

  CONTAINER[id].nchildren++;
  CONTAINER[id].usage += quota;
  103787:	01 71 04             	add    %esi,0x4(%ecx)
  child = id * MAX_CHILDREN + 1 + nc; //container index for the child process
  10378a:	01 f8                	add    %edi,%eax
  CONTAINER[id].nchildren++;
  10378c:	83 c7 01             	add    $0x1,%edi
  10378f:	89 79 0c             	mov    %edi,0xc(%ecx)
  CONTAINER[child].quota= quota;
  103792:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
  103795:	c1 e1 02             	shl    $0x2,%ecx
  103798:	8d bc 0b 80 6f 82 00 	lea    0x826f80(%ebx,%ecx,1),%edi
  10379f:	89 37                	mov    %esi,(%edi)
  CONTAINER[child].usage = 0;
  1037a1:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%edi)
  CONTAINER[child].parent = id;
  1037a8:	89 57 08             	mov    %edx,0x8(%edi)
  CONTAINER[child].nchildren  = 0;
  1037ab:	c7 47 0c 00 00 00 00 	movl   $0x0,0xc(%edi)
  CONTAINER[child].used = 1;
  1037b2:	c7 47 10 01 00 00 00 	movl   $0x1,0x10(%edi)

  return child;
}
  1037b9:	5b                   	pop    %ebx
  1037ba:	5e                   	pop    %esi
  1037bb:	5f                   	pop    %edi
  1037bc:	c3                   	ret    
  1037bd:	8d 76 00             	lea    0x0(%esi),%esi

001037c0 <container_alloc>:
  * * 1. Allocates one more page for process # [id], given that its usage would not exceed the quota.
  * * 2. Update the contained structure to reflect the container structure should be updated accordingly after the allocation.
  * returns the page index of the allocated page, or 0 in the case of failure.
  */
unsigned int container_alloc(unsigned int id)
{
  1037c0:	56                   	push   %esi
  1037c1:	53                   	push   %ebx
  1037c2:	e8 54 cb ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  1037c7:	81 c3 39 68 00 00    	add    $0x6839,%ebx
  1037cd:	83 ec 04             	sub    $0x4,%esp
  1037d0:	8b 44 24 10          	mov    0x10(%esp),%eax
  /*
   * TODO: implement the function here.
   */


  if((CONTAINER[id].usage) < CONTAINER[id].quota){
  1037d4:	8d 14 80             	lea    (%eax,%eax,4),%edx
  1037d7:	31 c0                	xor    %eax,%eax
  1037d9:	c1 e2 02             	shl    $0x2,%edx
  1037dc:	8d b4 13 80 6f 82 00 	lea    0x826f80(%ebx,%edx,1),%esi
  1037e3:	8b 8c 13 80 6f 82 00 	mov    0x826f80(%ebx,%edx,1),%ecx
  1037ea:	39 4e 04             	cmp    %ecx,0x4(%esi)
  1037ed:	7d 09                	jge    1037f8 <container_alloc+0x38>
    
     int pageindex = palloc();
  1037ef:	e8 5c fd ff ff       	call   103550 <palloc>
  
     CONTAINER[id].usage++;
  1037f4:	83 46 04 01          	addl   $0x1,0x4(%esi)
    return pageindex;
  }


  return 0;
}
  1037f8:	83 c4 04             	add    $0x4,%esp
  1037fb:	5b                   	pop    %ebx
  1037fc:	5e                   	pop    %esi
  1037fd:	c3                   	ret    
  1037fe:	66 90                	xchg   %ax,%ax

00103800 <container_free>:
  * Hint: You have already implemented functions:
  *  - to check if a page_index is allocated
  *  - to free a page_index in MATOp layer.
  */
void container_free(unsigned int id, unsigned int page_index)
{
  103800:	53                   	push   %ebx
  103801:	e8 15 cb ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  103806:	81 c3 fa 67 00 00    	add    $0x67fa,%ebx
  10380c:	83 ec 14             	sub    $0x14,%esp
  10380f:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  // TODO
  CONTAINER[id].usage--;
  pfree(page_index);
  103813:	ff 74 24 20          	pushl  0x20(%esp)
  CONTAINER[id].usage--;
  103817:	8d 04 80             	lea    (%eax,%eax,4),%eax
  10381a:	83 ac 83 84 6f 82 00 	subl   $0x1,0x826f84(%ebx,%eax,4)
  103821:	01 
  pfree(page_index);
  103822:	e8 99 fd ff ff       	call   1035c0 <pfree>
  
}
  103827:	83 c4 18             	add    $0x18,%esp
  10382a:	5b                   	pop    %ebx
  10382b:	c3                   	ret    
  10382c:	66 90                	xchg   %ax,%ax
  10382e:	66 90                	xchg   %ax,%ax

00103830 <set_pdir_base>:

/** TASK 1:
  * * Set the CR3 register with the start address of the page structure for process # [index]
  */
void set_pdir_base(unsigned int index)
{
  103830:	53                   	push   %ebx
  103831:	e8 e5 ca ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  103836:	81 c3 ca 67 00 00    	add    $0x67ca,%ebx
  10383c:	83 ec 14             	sub    $0x14,%esp
    // TODO
  set_cr3(PDirPool[index]);
  10383f:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  103843:	c1 e0 0c             	shl    $0xc,%eax
  103846:	81 c0 00 70 db 00    	add    $0xdb7000,%eax
  10384c:	50                   	push   %eax
  10384d:	e8 39 d5 ff ff       	call   100d8b <set_cr3>
}
  103852:	83 c4 18             	add    $0x18,%esp
  103855:	5b                   	pop    %ebx
  103856:	c3                   	ret    
  103857:	89 f6                	mov    %esi,%esi
  103859:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00103860 <get_pdir_entry>:
/** TASK 2:
  * * Return the page directory entry # [pde_index] of the process # [proc_index]
  * - This can be used to test whether the page directory entry is mapped
  */
unsigned int get_pdir_entry(unsigned int proc_index, unsigned int pde_index)
{
  103860:	e8 7c d5 ff ff       	call   100de1 <__x86.get_pc_thunk.ax>
  103865:	05 9b 67 00 00       	add    $0x679b,%eax
    // TODO
  
  char * dirEntry =PDirPool[proc_index][pde_index];
  10386a:	c7 c2 00 70 db 00    	mov    $0xdb7000,%edx
  103870:	8b 44 24 04          	mov    0x4(%esp),%eax
  103874:	c1 e0 0a             	shl    $0xa,%eax
  103877:	03 44 24 08          	add    0x8(%esp),%eax
  10387b:	8b 04 82             	mov    (%edx,%eax,4),%eax

 
  return (int)dirEntry;

  return 0;
}   
  10387e:	c3                   	ret    
  10387f:	90                   	nop

00103880 <set_pdir_entry>:
  * - You should also set the permissions PTE_P, PTE_W, and PTE_U
  * Hint 1: PT_PERM_PTU is defined for you.
  * Hint 2: 
  */
void set_pdir_entry(unsigned int proc_index, unsigned int pde_index, unsigned int page_index)
{
  103880:	e8 5c d5 ff ff       	call   100de1 <__x86.get_pc_thunk.ax>
  103885:	05 7b 67 00 00       	add    $0x677b,%eax
    // TODO

  
  // int * startAddress = (VM_USERLO + page_index)*PAGESIZE & 0xffffffff;
  int * startAddress = page_index <<12;
  10388a:	8b 54 24 0c          	mov    0xc(%esp),%edx
  PDirPool[proc_index][pde_index] = (int) startAddress |  PT_PERM_PTU;
  10388e:	c7 c1 00 70 db 00    	mov    $0xdb7000,%ecx
  103894:	8b 44 24 04          	mov    0x4(%esp),%eax
  int * startAddress = page_index <<12;
  103898:	c1 e2 0c             	shl    $0xc,%edx
  PDirPool[proc_index][pde_index] = (int) startAddress |  PT_PERM_PTU;
  10389b:	c1 e0 0a             	shl    $0xa,%eax
  10389e:	03 44 24 08          	add    0x8(%esp),%eax
  1038a2:	83 ca 07             	or     $0x7,%edx
  1038a5:	89 14 81             	mov    %edx,(%ecx,%eax,4)
  1038a8:	c3                   	ret    
  1038a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001038b0 <set_pdir_entry_identity>:
  * - You should also set the permissions PTE_P, PTE_W, and PTE_U
  * - This will be used to map the page directory entry to identity page table.
  * Hint 1: Cast the first entry of IDPTbl[pde_index] to char *.
  */
void set_pdir_entry_identity(unsigned int proc_index, unsigned int pde_index)
{   
  1038b0:	53                   	push   %ebx
    // TODO

  PDirPool[proc_index][pde_index] = (char *)((int)IDPTbl[pde_index]|PT_PERM_PTU);
  1038b1:	8b 54 24 08          	mov    0x8(%esp),%edx
{   
  1038b5:	8b 44 24 0c          	mov    0xc(%esp),%eax
  1038b9:	e8 5d ca ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  1038be:	81 c3 42 67 00 00    	add    $0x6742,%ebx
  PDirPool[proc_index][pde_index] = (char *)((int)IDPTbl[pde_index]|PT_PERM_PTU);
  1038c4:	c1 e2 0a             	shl    $0xa,%edx
  1038c7:	01 c2                	add    %eax,%edx
  1038c9:	c1 e0 0c             	shl    $0xc,%eax
  1038cc:	81 c0 00 70 9b 00    	add    $0x9b7000,%eax
  1038d2:	c7 c1 00 70 db 00    	mov    $0xdb7000,%ecx
  1038d8:	83 c8 07             	or     $0x7,%eax
  1038db:	89 04 91             	mov    %eax,(%ecx,%edx,4)

}   
  1038de:	5b                   	pop    %ebx
  1038df:	c3                   	ret    

001038e0 <rmv_pdir_entry>:
  * * Remove specified page directory entry 
  * Hint 1: Set the page directory entry to PT_PERM_UP.
  * Hint 2: Don't forget to cast the value to (char *).
  */
void rmv_pdir_entry(unsigned int proc_index, unsigned int pde_index)
{
  1038e0:	e8 fc d4 ff ff       	call   100de1 <__x86.get_pc_thunk.ax>
  1038e5:	05 1b 67 00 00       	add    $0x671b,%eax
    // TODO
  PDirPool[proc_index][pde_index] = (char *) PT_PERM_UP;
  1038ea:	c7 c2 00 70 db 00    	mov    $0xdb7000,%edx
  1038f0:	8b 44 24 04          	mov    0x4(%esp),%eax
  1038f4:	c1 e0 0a             	shl    $0xa,%eax
  1038f7:	03 44 24 08          	add    0x8(%esp),%eax
  1038fb:	c7 04 82 00 00 00 00 	movl   $0x0,(%edx,%eax,4)
  103902:	c3                   	ret    
  103903:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  103909:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00103910 <get_ptbl_entry>:
  * Hint 2: Do not forget that the permission info is also stored in the page directory entries.
  *         (You will have to mask out the permission info.)
  * Hint 3: Remember to cast to a pointer before de-referencing an address.
  */
unsigned int get_ptbl_entry(unsigned int proc_index, unsigned int pde_index, unsigned int pte_index)
{   
  103910:	e8 cc d4 ff ff       	call   100de1 <__x86.get_pc_thunk.ax>
  103915:	05 eb 66 00 00       	add    $0x66eb,%eax
    // TODO

  int * page_table = (int *)((int)PDirPool[proc_index][pde_index]& 0xfffff000);
  10391a:	c7 c2 00 70 db 00    	mov    $0xdb7000,%edx
  103920:	8b 44 24 04          	mov    0x4(%esp),%eax
  103924:	c1 e0 0a             	shl    $0xa,%eax
  103927:	03 44 24 08          	add    0x8(%esp),%eax
  10392b:	8b 04 82             	mov    (%edx,%eax,4),%eax
  10392e:	8b 54 24 0c          	mov    0xc(%esp),%edx
  103932:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  103937:	8b 04 90             	mov    (%eax,%edx,4),%eax

  return (int) page_table[pte_index];
  //return IDPTbl[pde_index][pte_index];

  return 0;
}
  10393a:	c3                   	ret    
  10393b:	90                   	nop
  10393c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00103940 <set_ptbl_entry>:
  * * Sets specified page table entry with the start address of physical page # [page_index]
  * - You should also set the given permission
  * Hint 1: Same as TASK 6
  */
void set_ptbl_entry(unsigned int proc_index, unsigned int pde_index, unsigned int pte_index, unsigned int page_index, unsigned int perm)
{   
  103940:	e8 9c d4 ff ff       	call   100de1 <__x86.get_pc_thunk.ax>
  103945:	05 bb 66 00 00       	add    $0x66bb,%eax
  
  char* identityList = PDirPool[proc_index][pde_index];

  int*  aIdentity  = (int) identityList &  0xfffff000;

  aIdentity[pte_index] = (page_index<<12)| perm;
  10394a:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
  char* identityList = PDirPool[proc_index][pde_index];
  10394e:	c7 c2 00 70 db 00    	mov    $0xdb7000,%edx
  103954:	8b 44 24 04          	mov    0x4(%esp),%eax
  103958:	c1 e0 0a             	shl    $0xa,%eax
  10395b:	03 44 24 08          	add    0x8(%esp),%eax
  int*  aIdentity  = (int) identityList &  0xfffff000;
  10395f:	8b 14 82             	mov    (%edx,%eax,4),%edx
  aIdentity[pte_index] = (page_index<<12)| perm;
  103962:	8b 44 24 10          	mov    0x10(%esp),%eax
  103966:	c1 e0 0c             	shl    $0xc,%eax
  103969:	0b 44 24 14          	or     0x14(%esp),%eax
  int*  aIdentity  = (int) identityList &  0xfffff000;
  10396d:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
  aIdentity[pte_index] = (page_index<<12)| perm;
  103973:	89 04 8a             	mov    %eax,(%edx,%ecx,4)
  103976:	c3                   	ret    
  103977:	89 f6                	mov    %esi,%esi
  103979:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00103980 <set_ptbl_entry_identity>:
  * | 4       |    A[1][1]   |
  * | 5       |    A[1][2]   |
  * |---------|--------------|
  */
void set_ptbl_entry_identity(unsigned int pde_index, unsigned int pte_index, unsigned int perm)
{
  103980:	e8 5c d4 ff ff       	call   100de1 <__x86.get_pc_thunk.ax>
  103985:	05 7b 66 00 00       	add    $0x667b,%eax
    // TODO
  IDPTbl[pde_index][pte_index] =  (pde_index* 1024 + pte_index) * 4096 | perm;
  10398a:	c7 c1 00 70 9b 00    	mov    $0x9b7000,%ecx
  103990:	8b 44 24 04          	mov    0x4(%esp),%eax
  103994:	c1 e0 0a             	shl    $0xa,%eax
  103997:	03 44 24 08          	add    0x8(%esp),%eax
  10399b:	89 c2                	mov    %eax,%edx
  10399d:	c1 e2 0c             	shl    $0xc,%edx
  1039a0:	0b 54 24 0c          	or     0xc(%esp),%edx
  1039a4:	89 14 81             	mov    %edx,(%ecx,%eax,4)
  1039a7:	c3                   	ret    
  1039a8:	90                   	nop
  1039a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001039b0 <rmv_ptbl_entry>:
  * * Set the specified page table entry to 0
  * Hint 1: Remember that page directory entries also have permissions stored. Mask them out.
  * Hint 2: Remember to cast to a pointer before de-referencing an address.
  */
void rmv_ptbl_entry(unsigned int proc_index, unsigned int pde_index, unsigned int pte_index)
{
  1039b0:	e8 2c d4 ff ff       	call   100de1 <__x86.get_pc_thunk.ax>
  1039b5:	05 4b 66 00 00       	add    $0x664b,%eax
    // TODO

  int * pageTable = (int *)((int)PDirPool[proc_index][pde_index]& 0xfffff000);
  1039ba:	c7 c2 00 70 db 00    	mov    $0xdb7000,%edx
  1039c0:	8b 44 24 04          	mov    0x4(%esp),%eax
  1039c4:	c1 e0 0a             	shl    $0xa,%eax
  1039c7:	03 44 24 08          	add    0x8(%esp),%eax
  1039cb:	8b 04 82             	mov    (%edx,%eax,4),%eax
  pageTable[pte_index] = 0;
  1039ce:	8b 54 24 0c          	mov    0xc(%esp),%edx
  int * pageTable = (int *)((int)PDirPool[proc_index][pde_index]& 0xfffff000);
  1039d2:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  pageTable[pte_index] = 0;
  1039d7:	c7 04 90 00 00 00 00 	movl   $0x0,(%eax,%edx,4)
  1039de:	c3                   	ret    
  1039df:	90                   	nop

001039e0 <get_pdir_entry_by_va>:
  *         Use the masks defined above. (Do think of what the values are.)
  * Hint 2: Use the appropriate functions in MATIntro layer to 
  *         read the pdir_entry
  */
unsigned int get_pdir_entry_by_va(unsigned int proc_index, unsigned int vaddr)
{
  1039e0:	53                   	push   %ebx
  1039e1:	e8 35 c9 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  1039e6:	81 c3 1a 66 00 00    	add    $0x661a,%ebx
  1039ec:	83 ec 10             	sub    $0x10,%esp
    // TODO

  int pageDirectoryIndex = (DIR_MASK & vaddr)>>22;
  1039ef:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  1039f3:	c1 e8 16             	shr    $0x16,%eax
  int pageTableIndex = (PAGE_MASK & vaddr)>>12;



  int pdir = get_pdir_entry(proc_index, pageDirectoryIndex);
  1039f6:	50                   	push   %eax
  1039f7:	ff 74 24 1c          	pushl  0x1c(%esp)
  1039fb:	e8 60 fe ff ff       	call   103860 <get_pdir_entry>

  
  return (int)pdir;

    return 0;
}
  103a00:	83 c4 18             	add    $0x18,%esp
  103a03:	5b                   	pop    %ebx
  103a04:	c3                   	ret    
  103a05:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  103a09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00103a10 <get_ptbl_entry_by_va>:
  * - Return 0 if the mapping does not exist in page directory entry (i.e. pde = 0).
  *
  * Hint 1: Same as TASK 1.
  */
unsigned int get_ptbl_entry_by_va(unsigned int proc_index, unsigned int vaddr)
{
  103a10:	55                   	push   %ebp
  103a11:	57                   	push   %edi
  103a12:	56                   	push   %esi
  103a13:	53                   	push   %ebx
  103a14:	e8 02 c9 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  103a19:	81 c3 e7 65 00 00    	add    $0x65e7,%ebx
  103a1f:	83 ec 14             	sub    $0x14,%esp
  103a22:	8b 74 24 2c          	mov    0x2c(%esp),%esi
    // TODO

  int pageDirectoryIndex =( DIR_MASK & vaddr)>>22;
  103a26:	89 f7                	mov    %esi,%edi
  int pageTableIndex = (PAGE_MASK & vaddr)>>12;
  103a28:	c1 ee 0c             	shr    $0xc,%esi
  int pageDirectoryIndex =( DIR_MASK & vaddr)>>22;
  103a2b:	c1 ef 16             	shr    $0x16,%edi
  int pageTableIndex = (PAGE_MASK & vaddr)>>12;
  103a2e:	81 e6 ff 03 00 00    	and    $0x3ff,%esi
  int offset = (OFFSET_MASK & vaddr);

  int pdir = get_pdir_entry(proc_index, pageDirectoryIndex);
  103a34:	57                   	push   %edi
  103a35:	ff 74 24 2c          	pushl  0x2c(%esp)
  103a39:	e8 22 fe ff ff       	call   103860 <get_pdir_entry>
  int ptbl = get_ptbl_entry(proc_index, pageDirectoryIndex, pageTableIndex);
  103a3e:	83 c4 0c             	add    $0xc,%esp
  int pdir = get_pdir_entry(proc_index, pageDirectoryIndex);
  103a41:	89 c5                	mov    %eax,%ebp
  int ptbl = get_ptbl_entry(proc_index, pageDirectoryIndex, pageTableIndex);
  103a43:	56                   	push   %esi
  103a44:	57                   	push   %edi
  103a45:	ff 74 24 2c          	pushl  0x2c(%esp)
  103a49:	e8 c2 fe ff ff       	call   103910 <get_ptbl_entry>

  if(ptbl != 0  && pdir != 0){
  103a4e:	83 c4 10             	add    $0x10,%esp
  103a51:	85 c0                	test   %eax,%eax
  103a53:	74 13                	je     103a68 <get_ptbl_entry_by_va+0x58>
  103a55:	85 ed                	test   %ebp,%ebp
  103a57:	74 0f                	je     103a68 <get_ptbl_entry_by_va+0x58>
    
     return ptbl;
  }

    return 0;
}         
  103a59:	83 c4 0c             	add    $0xc,%esp
  103a5c:	5b                   	pop    %ebx
  103a5d:	5e                   	pop    %esi
  103a5e:	5f                   	pop    %edi
  103a5f:	5d                   	pop    %ebp
  103a60:	c3                   	ret    
  103a61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  103a68:	83 c4 0c             	add    $0xc,%esp
    return 0;
  103a6b:	31 c0                	xor    %eax,%eax
}         
  103a6d:	5b                   	pop    %ebx
  103a6e:	5e                   	pop    %esi
  103a6f:	5f                   	pop    %edi
  103a70:	5d                   	pop    %ebp
  103a71:	c3                   	ret    
  103a72:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  103a79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00103a80 <rmv_pdir_entry_by_va>:
  * * Remove the page directory entry for the given virtual address
  * Hint 1: Calculate the arguments required by the function(rmv_pdir_entry) in MPTIntro layer
  *         and simply call it.
  */
void rmv_pdir_entry_by_va(unsigned int proc_index, unsigned int vaddr)
{
  103a80:	53                   	push   %ebx
  103a81:	e8 95 c8 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  103a86:	81 c3 7a 65 00 00    	add    $0x657a,%ebx
  103a8c:	83 ec 10             	sub    $0x10,%esp
    // TODO

  int pageDirectoryIndex = (DIR_MASK & vaddr)>>22;
  103a8f:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  103a93:	c1 e8 16             	shr    $0x16,%eax
  int pageTableIndex = (PAGE_MASK & vaddr)>>12;


  rmv_pdir_entry(proc_index, pageDirectoryIndex);
  103a96:	50                   	push   %eax
  103a97:	ff 74 24 1c          	pushl  0x1c(%esp)
  103a9b:	e8 40 fe ff ff       	call   1038e0 <rmv_pdir_entry>
}
  103aa0:	83 c4 18             	add    $0x18,%esp
  103aa3:	5b                   	pop    %ebx
  103aa4:	c3                   	ret    
  103aa5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  103aa9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00103ab0 <rmv_ptbl_entry_by_va>:
/** TASK 4:
  * * Remove the page table entry for the given virtual address
  * Hint 1: Same as TASK 3. Use the correct function.
  */
void rmv_ptbl_entry_by_va(unsigned int proc_index, unsigned int vaddr)
{
  103ab0:	53                   	push   %ebx
  103ab1:	e8 65 c8 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  103ab6:	81 c3 4a 65 00 00    	add    $0x654a,%ebx
  103abc:	83 ec 0c             	sub    $0xc,%esp
  103abf:	8b 44 24 18          	mov    0x18(%esp),%eax
    // TODO

  int pageDirectoryIndex = (DIR_MASK & vaddr)>>22;
  int pageTableIndex = (PAGE_MASK & vaddr)>>12;
  103ac3:	89 c2                	mov    %eax,%edx
  int pageDirectoryIndex = (DIR_MASK & vaddr)>>22;
  103ac5:	c1 e8 16             	shr    $0x16,%eax
  int pageTableIndex = (PAGE_MASK & vaddr)>>12;
  103ac8:	c1 ea 0c             	shr    $0xc,%edx
  103acb:	81 e2 ff 03 00 00    	and    $0x3ff,%edx

  rmv_ptbl_entry(proc_index, pageDirectoryIndex, pageTableIndex);
  103ad1:	52                   	push   %edx
  103ad2:	50                   	push   %eax
  103ad3:	ff 74 24 1c          	pushl  0x1c(%esp)
  103ad7:	e8 d4 fe ff ff       	call   1039b0 <rmv_ptbl_entry>
}
  103adc:	83 c4 18             	add    $0x18,%esp
  103adf:	5b                   	pop    %ebx
  103ae0:	c3                   	ret    
  103ae1:	eb 0d                	jmp    103af0 <set_pdir_entry_by_va>
  103ae3:	90                   	nop
  103ae4:	90                   	nop
  103ae5:	90                   	nop
  103ae6:	90                   	nop
  103ae7:	90                   	nop
  103ae8:	90                   	nop
  103ae9:	90                   	nop
  103aea:	90                   	nop
  103aeb:	90                   	nop
  103aec:	90                   	nop
  103aed:	90                   	nop
  103aee:	90                   	nop
  103aef:	90                   	nop

00103af0 <set_pdir_entry_by_va>:
/** TASK 5:
  * * Register the mapping from the virtual address [vaddr] to physical page # [page_index] in the page directory.
  * Hint: Same as TASK 3. Use the correct function.
  */
void set_pdir_entry_by_va(unsigned int proc_index, unsigned int vaddr, unsigned int page_index)
{
  103af0:	53                   	push   %ebx
  103af1:	e8 25 c8 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  103af6:	81 c3 0a 65 00 00    	add    $0x650a,%ebx
  103afc:	83 ec 0c             	sub    $0xc,%esp

  int pageDirectoryIndex = (DIR_MASK & vaddr) >>22;
  int pageTableIndex = (PAGE_MASK & vaddr) >>12;

  //set_pdir_entry(proc_index, pageDirectoryIndex, pageTableIndex);
  set_pdir_entry(proc_index, pageDirectoryIndex, page_index);
  103aff:	ff 74 24 1c          	pushl  0x1c(%esp)
  int pageDirectoryIndex = (DIR_MASK & vaddr) >>22;
  103b03:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  103b07:	c1 e8 16             	shr    $0x16,%eax
  set_pdir_entry(proc_index, pageDirectoryIndex, page_index);
  103b0a:	50                   	push   %eax
  103b0b:	ff 74 24 1c          	pushl  0x1c(%esp)
  103b0f:	e8 6c fd ff ff       	call   103880 <set_pdir_entry>
}   
  103b14:	83 c4 18             	add    $0x18,%esp
  103b17:	5b                   	pop    %ebx
  103b18:	c3                   	ret    
  103b19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00103b20 <set_ptbl_entry_by_va>:
  * * Register the mapping from the virtual address [vaddr] to the physical page # [page_index] with permission [perm]
  * - You do not need to worry about the page directory entry. just map the page table entry.
  * Hint: Same as TASK 3. Use the correct function.
  */
void set_ptbl_entry_by_va(unsigned int proc_index, unsigned int vaddr, unsigned int page_index, unsigned int perm)
{
  103b20:	53                   	push   %ebx
  103b21:	e8 f5 c7 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  103b26:	81 c3 da 64 00 00    	add    $0x64da,%ebx
  103b2c:	83 ec 14             	sub    $0x14,%esp
  103b2f:	8b 44 24 20          	mov    0x20(%esp),%eax

  int pageDirectoryIndex = (DIR_MASK & vaddr)>>22;
  int pageTableIndex = (PAGE_MASK & vaddr)>>12;


  set_ptbl_entry(proc_index, pageDirectoryIndex, pageTableIndex, page_index, perm);
  103b33:	ff 74 24 28          	pushl  0x28(%esp)
  103b37:	ff 74 24 28          	pushl  0x28(%esp)
  int pageTableIndex = (PAGE_MASK & vaddr)>>12;
  103b3b:	89 c2                	mov    %eax,%edx
  int pageDirectoryIndex = (DIR_MASK & vaddr)>>22;
  103b3d:	c1 e8 16             	shr    $0x16,%eax
  int pageTableIndex = (PAGE_MASK & vaddr)>>12;
  103b40:	c1 ea 0c             	shr    $0xc,%edx
  103b43:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
  set_ptbl_entry(proc_index, pageDirectoryIndex, pageTableIndex, page_index, perm);
  103b49:	52                   	push   %edx
  103b4a:	50                   	push   %eax
  103b4b:	ff 74 24 2c          	pushl  0x2c(%esp)
  103b4f:	e8 ec fd ff ff       	call   103940 <set_ptbl_entry>
}
  103b54:	83 c4 28             	add    $0x28,%esp
  103b57:	5b                   	pop    %ebx
  103b58:	c3                   	ret    
  103b59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00103b60 <idptbl_init>:
  * Hint 2: You have already created the functions that deal with IDPTbl. 
  *         Calculate the appropriate permission values as mentioned above 
  *         and call set_ptbl_entry_identity from MATIntro layer.
  */
void idptbl_init(unsigned int mbi_adr)
{
  103b60:	55                   	push   %ebp
  103b61:	57                   	push   %edi


    container_init(mbi_adr);

    // TODO
    for(i = 0; i < 1024; i++){
  103b62:	31 ff                	xor    %edi,%edi
{
  103b64:	56                   	push   %esi
  103b65:	53                   	push   %ebx
  103b66:	e8 b0 c7 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  103b6b:	81 c3 95 64 00 00    	add    $0x6495,%ebx
  103b71:	83 ec 18             	sub    $0x18,%esp
    container_init(mbi_adr);
  103b74:	ff 74 24 2c          	pushl  0x2c(%esp)
  103b78:	e8 63 fa ff ff       	call   1035e0 <container_init>
  103b7d:	83 c4 10             	add    $0x10,%esp
  103b80:	8d af 00 ff ff ff    	lea    -0x100(%edi),%ebp
{
  103b86:	31 f6                	xor    %esi,%esi
  103b88:	90                   	nop
  103b89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      for(j = 0; j < 1024; j++){
        int pde_index = i; 
        int pte_index = j;

	// if(i< ( VM_USERHI_PI - VM_USERLO_PI)){ // kernel
	if( i> VM_USERHI_PI/1024|| i== VM_USERHI_PI/1024 || i < VM_USERLO_PI/1024){
  103b90:	81 fd bf 02 00 00    	cmp    $0x2bf,%ebp
  103b96:	77 2d                	ja     103bc5 <idptbl_init+0x65>
          set_ptbl_entry_identity(pde_index, pte_index, PT_PERM_PWG);
        }
        else{// usable
          set_ptbl_entry_identity(pde_index, pte_index, PT_PERM_PW);
  103b98:	83 ec 04             	sub    $0x4,%esp
  103b9b:	6a 03                	push   $0x3
  103b9d:	56                   	push   %esi
  103b9e:	57                   	push   %edi
  103b9f:	e8 dc fd ff ff       	call   103980 <set_ptbl_entry_identity>
  103ba4:	83 c4 10             	add    $0x10,%esp
      for(j = 0; j < 1024; j++){
  103ba7:	83 c6 01             	add    $0x1,%esi
  103baa:	81 fe 00 04 00 00    	cmp    $0x400,%esi
  103bb0:	75 de                	jne    103b90 <idptbl_init+0x30>
    for(i = 0; i < 1024; i++){
  103bb2:	83 c7 01             	add    $0x1,%edi
  103bb5:	81 ff 00 04 00 00    	cmp    $0x400,%edi
  103bbb:	75 c3                	jne    103b80 <idptbl_init+0x20>

      }
    }

    
}
  103bbd:	83 c4 0c             	add    $0xc,%esp
  103bc0:	5b                   	pop    %ebx
  103bc1:	5e                   	pop    %esi
  103bc2:	5f                   	pop    %edi
  103bc3:	5d                   	pop    %ebp
  103bc4:	c3                   	ret    
          set_ptbl_entry_identity(pde_index, pte_index, PT_PERM_PWG);
  103bc5:	83 ec 04             	sub    $0x4,%esp
  103bc8:	68 03 01 00 00       	push   $0x103
  103bcd:	56                   	push   %esi
  103bce:	57                   	push   %edi
  103bcf:	e8 ac fd ff ff       	call   103980 <set_ptbl_entry_identity>
  103bd4:	83 c4 10             	add    $0x10,%esp
  103bd7:	eb ce                	jmp    103ba7 <idptbl_init+0x47>
  103bd9:	66 90                	xchg   %ax,%ax
  103bdb:	66 90                	xchg   %ax,%ax
  103bdd:	66 90                	xchg   %ax,%ax
  103bdf:	90                   	nop

00103be0 <pdir_init>:
  * Hint 1: Recall which portions are reserved for the kernel and calculate the pde_index.       
  * Hint 2: Recall which function in MPTIntro layer is used to set identity map. (See import.h) 
  * Hint 3: Remove the page directory entry to unmap it.
  */
void pdir_init(unsigned int mbi_adr)
{
  103be0:	55                   	push   %ebp
  103be1:	57                   	push   %edi
    int i ,j;

    idptbl_init(mbi_adr);

    // TODO
    for(i = 0; i < NUM_IDS; i++){
  103be2:	31 ed                	xor    %ebp,%ebp
{
  103be4:	56                   	push   %esi
  103be5:	53                   	push   %ebx
  103be6:	e8 30 c7 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  103beb:	81 c3 15 64 00 00    	add    $0x6415,%ebx
  103bf1:	83 ec 18             	sub    $0x18,%esp
    idptbl_init(mbi_adr);
  103bf4:	ff 74 24 2c          	pushl  0x2c(%esp)
  103bf8:	e8 63 ff ff ff       	call   103b60 <idptbl_init>
  103bfd:	83 c4 10             	add    $0x10,%esp
{
  103c00:	bf 00 00 fc ff       	mov    $0xfffc0000,%edi
  103c05:	31 f6                	xor    %esi,%esi
  103c07:	89 f6                	mov    %esi,%esi
  103c09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      for(j = 0; j< 1024; j++){

	int proc_index  = i;
	int pde_index = j;
	if(pde_index*1024 < VM_USERLO_PI || pde_index*1024 >= VM_USERHI_PI){
  103c10:	81 ff ff ff 0a 00    	cmp    $0xaffff,%edi
  103c16:	77 2e                	ja     103c46 <pdir_init+0x66>
	  set_pdir_entry_identity(proc_index, pde_index);
	}else{
	  rmv_pdir_entry(proc_index, pde_index);
  103c18:	83 ec 08             	sub    $0x8,%esp
  103c1b:	56                   	push   %esi
  103c1c:	55                   	push   %ebp
  103c1d:	e8 be fc ff ff       	call   1038e0 <rmv_pdir_entry>
  103c22:	83 c4 10             	add    $0x10,%esp
      for(j = 0; j< 1024; j++){
  103c25:	83 c6 01             	add    $0x1,%esi
  103c28:	81 c7 00 04 00 00    	add    $0x400,%edi
  103c2e:	81 fe 00 04 00 00    	cmp    $0x400,%esi
  103c34:	75 da                	jne    103c10 <pdir_init+0x30>
    for(i = 0; i < NUM_IDS; i++){
  103c36:	83 c5 01             	add    $0x1,%ebp
  103c39:	83 fd 40             	cmp    $0x40,%ebp
  103c3c:	75 c2                	jne    103c00 <pdir_init+0x20>
	}

      }
    }

}
  103c3e:	83 c4 0c             	add    $0xc,%esp
  103c41:	5b                   	pop    %ebx
  103c42:	5e                   	pop    %esi
  103c43:	5f                   	pop    %edi
  103c44:	5d                   	pop    %ebp
  103c45:	c3                   	ret    
	  set_pdir_entry_identity(proc_index, pde_index);
  103c46:	83 ec 08             	sub    $0x8,%esp
  103c49:	56                   	push   %esi
  103c4a:	55                   	push   %ebp
  103c4b:	e8 60 fc ff ff       	call   1038b0 <set_pdir_entry_identity>
  103c50:	83 c4 10             	add    $0x10,%esp
  103c53:	eb d0                	jmp    103c25 <pdir_init+0x45>
  103c55:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  103c59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00103c60 <alloc_ptbl>:
  * * 3. Clear (set to 0) all the page table entries for this newly mapped page table.
  * * 4. Return the page index of the newly allocated physical page.
  * 	 In the case when there's no physical page available, it returns 0.
  */
unsigned int alloc_ptbl(unsigned int proc_index, unsigned int vaddr)
{
  103c60:	55                   	push   %ebp
  103c61:	57                   	push   %edi
  103c62:	56                   	push   %esi
  103c63:	53                   	push   %ebx
  103c64:	e8 b2 c6 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  103c69:	81 c3 97 63 00 00    	add    $0x6397,%ebx
  103c6f:	83 ec 28             	sub    $0x28,%esp
  103c72:	8b 74 24 3c          	mov    0x3c(%esp),%esi
  
  int pageDirectoryIndex = (DIR_MASK & vaddr)>>22;
  int pageTableIndex = (PAGE_MASK & vaddr)>>12;
  int offset = (OFFSET_MASK & vaddr);

  int pageIndex = container_alloc(proc_index);
  103c76:	56                   	push   %esi
  103c77:	e8 44 fb ff ff       	call   1037c0 <container_alloc>
  103c7c:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  if(pageIndex!=0)  //not allocated
  103c80:	83 c4 10             	add    $0x10,%esp
  103c83:	85 c0                	test   %eax,%eax
  103c85:	75 11                	jne    103c98 <alloc_ptbl+0x38>
    return pageIndex;

  }

  return 0;
}
  103c87:	8b 44 24 0c          	mov    0xc(%esp),%eax
  103c8b:	83 c4 1c             	add    $0x1c,%esp
  103c8e:	5b                   	pop    %ebx
  103c8f:	5e                   	pop    %esi
  103c90:	5f                   	pop    %edi
  103c91:	5d                   	pop    %ebp
  103c92:	c3                   	ret    
  103c93:	90                   	nop
  103c94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    set_pdir_entry_by_va(proc_index, vaddr, pageIndex);
  103c98:	83 ec 04             	sub    $0x4,%esp
    for(int i = 0; i < 1024; i++)
  103c9b:	31 ed                	xor    %ebp,%ebp
    set_pdir_entry_by_va(proc_index, vaddr, pageIndex);
  103c9d:	ff 74 24 10          	pushl  0x10(%esp)
  103ca1:	ff 74 24 3c          	pushl  0x3c(%esp)
  103ca5:	56                   	push   %esi
  103ca6:	e8 45 fe ff ff       	call   103af0 <set_pdir_entry_by_va>
  int pageDirectoryIndex = (DIR_MASK & vaddr)>>22;
  103cab:	8b 7c 24 44          	mov    0x44(%esp),%edi
  103caf:	83 c4 10             	add    $0x10,%esp
  103cb2:	c1 ef 16             	shr    $0x16,%edi
  103cb5:	8d 76 00             	lea    0x0(%esi),%esi
    rmv_ptbl_entry(proc_index, pageDirectoryIndex, i);
  103cb8:	83 ec 04             	sub    $0x4,%esp
  103cbb:	55                   	push   %ebp
  103cbc:	57                   	push   %edi
    for(int i = 0; i < 1024; i++)
  103cbd:	83 c5 01             	add    $0x1,%ebp
    rmv_ptbl_entry(proc_index, pageDirectoryIndex, i);
  103cc0:	56                   	push   %esi
  103cc1:	e8 ea fc ff ff       	call   1039b0 <rmv_ptbl_entry>
    for(int i = 0; i < 1024; i++)
  103cc6:	83 c4 10             	add    $0x10,%esp
  103cc9:	81 fd 00 04 00 00    	cmp    $0x400,%ebp
  103ccf:	75 e7                	jne    103cb8 <alloc_ptbl+0x58>
}
  103cd1:	8b 44 24 0c          	mov    0xc(%esp),%eax
  103cd5:	83 c4 1c             	add    $0x1c,%esp
  103cd8:	5b                   	pop    %ebx
  103cd9:	5e                   	pop    %esi
  103cda:	5f                   	pop    %edi
  103cdb:	5d                   	pop    %ebp
  103cdc:	c3                   	ret    
  103cdd:	8d 76 00             	lea    0x0(%esi),%esi

00103ce0 <free_ptbl>:
  * Hint 1: Find the pde corresponding to vadr (MPTOp layer)
  * Hint 2: Remove the pde (MPTOp layer)
  * Hint 3: Use container free
  */
void free_ptbl(unsigned int proc_index, unsigned int vaddr)
{
  103ce0:	56                   	push   %esi
  103ce1:	53                   	push   %ebx
  103ce2:	e8 34 c6 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  103ce7:	81 c3 19 63 00 00    	add    $0x6319,%ebx
  103ced:	83 ec 0c             	sub    $0xc,%esp
  103cf0:	8b 74 24 18          	mov    0x18(%esp),%esi

  int pageDirectoryIndex = DIR_MASK & vaddr>>22;
  int pageTableIndex = PAGE_MASK & vaddr>>12;
  

  rmv_pdir_entry_by_va(proc_index, vaddr);
  103cf4:	ff 74 24 1c          	pushl  0x1c(%esp)
  103cf8:	56                   	push   %esi
  103cf9:	e8 82 fd ff ff       	call   103a80 <rmv_pdir_entry_by_va>
  container_free(proc_index, pageDirectoryIndex);
  103cfe:	58                   	pop    %eax
  103cff:	5a                   	pop    %edx
  103d00:	6a 00                	push   $0x0
  103d02:	56                   	push   %esi
  103d03:	e8 f8 fa ff ff       	call   103800 <container_free>

}
  103d08:	83 c4 14             	add    $0x14,%esp
  103d0b:	5b                   	pop    %ebx
  103d0c:	5e                   	pop    %esi
  103d0d:	c3                   	ret    
  103d0e:	66 90                	xchg   %ax,%ax

00103d10 <pdir_init_kern>:
  *  
  * Hint 1: Note that part of the task is already completed by pdir_init.
  * Hint 2: Here just set the remaining portion of process 0's page directory entry as identity map.
  */
void pdir_init_kern(unsigned int mbi_adr)
{
  103d10:	56                   	push   %esi
  103d11:	53                   	push   %ebx
    // TODO: define your local variables here.

    int i;
    
    //TODO
    pdir_init(mbi_adr);
  103d12:	be 00 00 04 00       	mov    $0x40000,%esi
  103d17:	e8 ff c5 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  103d1c:	81 c3 e4 62 00 00    	add    $0x62e4,%ebx
{
  103d22:	83 ec 10             	sub    $0x10,%esp
    pdir_init(mbi_adr);
  103d25:	ff 74 24 1c          	pushl  0x1c(%esp)
  103d29:	e8 b2 fe ff ff       	call   103be0 <pdir_init>
  103d2e:	83 c4 10             	add    $0x10,%esp
  103d31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

    for(i = VM_USERLO_PI; i < VM_USERHI_PI; i++){
       set_pdir_entry_identity(0, i/1024);
  103d38:	89 f0                	mov    %esi,%eax
  103d3a:	83 ec 08             	sub    $0x8,%esp
    for(i = VM_USERLO_PI; i < VM_USERHI_PI; i++){
  103d3d:	83 c6 01             	add    $0x1,%esi
       set_pdir_entry_identity(0, i/1024);
  103d40:	c1 f8 0a             	sar    $0xa,%eax
  103d43:	50                   	push   %eax
  103d44:	6a 00                	push   $0x0
  103d46:	e8 65 fb ff ff       	call   1038b0 <set_pdir_entry_identity>
    for(i = VM_USERLO_PI; i < VM_USERHI_PI; i++){
  103d4b:	83 c4 10             	add    $0x10,%esp
  103d4e:	81 fe 00 00 0f 00    	cmp    $0xf0000,%esi
  103d54:	75 e2                	jne    103d38 <pdir_init_kern+0x28>
       // rmv_ptbl_entry_by_va(0, i*4096);
      
    }

}
  103d56:	83 c4 04             	add    $0x4,%esp
  103d59:	5b                   	pop    %ebx
  103d5a:	5e                   	pop    %esi
  103d5b:	c3                   	ret    
  103d5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00103d60 <map_page>:
  *         - If there is an error during allocation, return MagicNumber.
  * Hint 3: If you have a valid pde, set the page table entry to new physical page (page_index) and perm.
  * Hint 4: Return the pde index or MagicNumber.
  */
unsigned int map_page(unsigned int proc_index, unsigned int vadr, unsigned int page_index, unsigned int perm)
{   
  103d60:	55                   	push   %ebp
  103d61:	57                   	push   %edi
  103d62:	56                   	push   %esi
  103d63:	53                   	push   %ebx
  103d64:	e8 b2 c5 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  103d69:	81 c3 97 62 00 00    	add    $0x6297,%ebx
  103d6f:	83 ec 24             	sub    $0x24,%esp
  103d72:	8b 74 24 38          	mov    0x38(%esp),%esi
  103d76:	8b 7c 24 3c          	mov    0x3c(%esp),%edi


  int pageDirectoryIndex = (DIR_MASK & vadr)>>22;
  int pageTableIndex = (PAGE_MASK & vadr)>>12;

  int pageDirectoryEntry = get_pdir_entry_by_va(proc_index, vadr);
  103d7a:	57                   	push   %edi
  103d7b:	56                   	push   %esi
  103d7c:	e8 5f fc ff ff       	call   1039e0 <get_pdir_entry_by_va>

  if(pageDirectoryEntry==0){
  103d81:	83 c4 10             	add    $0x10,%esp
  103d84:	85 c0                	test   %eax,%eax
  103d86:	75 28                	jne    103db0 <map_page+0x50>
    // allocate the page

    int t = alloc_ptbl(proc_index, vadr);
  103d88:	83 ec 08             	sub    $0x8,%esp
  103d8b:	57                   	push   %edi
  103d8c:	56                   	push   %esi
  103d8d:	e8 ce fe ff ff       	call   103c60 <alloc_ptbl>
    if(t==0) return MagicNumber;
  103d92:	83 c4 10             	add    $0x10,%esp
  103d95:	85 c0                	test   %eax,%eax
  103d97:	75 47                	jne    103de0 <map_page+0x80>
  }
  else{
    set_ptbl_entry_by_va(proc_index, vadr, page_index, perm);
    return (pageDirectoryEntry / PAGESIZE);
  }
}
  103d99:	83 c4 1c             	add    $0x1c,%esp
    if(t==0) return MagicNumber;
  103d9c:	b8 01 00 10 00       	mov    $0x100001,%eax
}
  103da1:	5b                   	pop    %ebx
  103da2:	5e                   	pop    %esi
  103da3:	5f                   	pop    %edi
  103da4:	5d                   	pop    %ebp
  103da5:	c3                   	ret    
  103da6:	8d 76 00             	lea    0x0(%esi),%esi
  103da9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    set_ptbl_entry_by_va(proc_index, vadr, page_index, perm);
  103db0:	ff 74 24 3c          	pushl  0x3c(%esp)
  103db4:	ff 74 24 3c          	pushl  0x3c(%esp)
  103db8:	89 c5                	mov    %eax,%ebp
  103dba:	57                   	push   %edi
  103dbb:	56                   	push   %esi
  103dbc:	e8 5f fd ff ff       	call   103b20 <set_ptbl_entry_by_va>
    return (pageDirectoryEntry / PAGESIZE);
  103dc1:	8d 95 ff 0f 00 00    	lea    0xfff(%ebp),%edx
  103dc7:	83 c4 10             	add    $0x10,%esp
  103dca:	89 e8                	mov    %ebp,%eax
  103dcc:	85 ed                	test   %ebp,%ebp
  103dce:	0f 48 c2             	cmovs  %edx,%eax
  103dd1:	c1 f8 0c             	sar    $0xc,%eax
}
  103dd4:	83 c4 1c             	add    $0x1c,%esp
  103dd7:	5b                   	pop    %ebx
  103dd8:	5e                   	pop    %esi
  103dd9:	5f                   	pop    %edi
  103dda:	5d                   	pop    %ebp
  103ddb:	c3                   	ret    
  103ddc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  103de0:	89 44 24 0c          	mov    %eax,0xc(%esp)
    set_ptbl_entry_by_va(proc_index, vadr, page_index, perm);
  103de4:	ff 74 24 3c          	pushl  0x3c(%esp)
  103de8:	ff 74 24 3c          	pushl  0x3c(%esp)
  103dec:	57                   	push   %edi
  103ded:	56                   	push   %esi
  103dee:	e8 2d fd ff ff       	call   103b20 <set_ptbl_entry_by_va>
    return t;
  103df3:	83 c4 10             	add    $0x10,%esp
  103df6:	8b 44 24 0c          	mov    0xc(%esp),%eax
  103dfa:	eb d8                	jmp    103dd4 <map_page+0x74>
  103dfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00103e00 <unmap_page>:
  *         - Nothing should be done if the mapping no longer exists.
  * Hint 2: If pte is valid, remove page table entry for vadr.
  * Hint 3: Return the corresponding page table entry.
  */
unsigned int unmap_page(unsigned int proc_index, unsigned int vadr)
{
  103e00:	55                   	push   %ebp
  103e01:	57                   	push   %edi
  103e02:	56                   	push   %esi
  103e03:	53                   	push   %ebx
  103e04:	e8 12 c5 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  103e09:	81 c3 f7 61 00 00    	add    $0x61f7,%ebx
  103e0f:	83 ec 14             	sub    $0x14,%esp
  103e12:	8b 74 24 28          	mov    0x28(%esp),%esi
  103e16:	8b 7c 24 2c          	mov    0x2c(%esp),%edi
  // TODO

  int pageDirectoryIndex = DIR_MASK & vadr>>22;
  int pageTableIndex = PAGE_MASK & vadr>>12;

  int pageindex = get_ptbl_entry_by_va(proc_index, vadr);
  103e1a:	57                   	push   %edi
  103e1b:	56                   	push   %esi
  103e1c:	e8 ef fb ff ff       	call   103a10 <get_ptbl_entry_by_va>
  103e21:	89 c5                	mov    %eax,%ebp

      rmv_ptbl_entry_by_va(proc_index, vadr);
  103e23:	58                   	pop    %eax
  103e24:	5a                   	pop    %edx
  103e25:	57                   	push   %edi
  103e26:	56                   	push   %esi
  103e27:	e8 84 fc ff ff       	call   103ab0 <rmv_ptbl_entry_by_va>
      return pageindex;
     

  return 0;
}   
  103e2c:	83 c4 1c             	add    $0x1c,%esp
  103e2f:	89 e8                	mov    %ebp,%eax
  103e31:	5b                   	pop    %ebx
  103e32:	5e                   	pop    %esi
  103e33:	5f                   	pop    %edi
  103e34:	5d                   	pop    %ebp
  103e35:	c3                   	ret    
  103e36:	66 90                	xchg   %ax,%ax
  103e38:	66 90                	xchg   %ax,%ax
  103e3a:	66 90                	xchg   %ax,%ax
  103e3c:	66 90                	xchg   %ax,%ax
  103e3e:	66 90                	xchg   %ax,%ax

00103e40 <paging_init>:
 * Initializes the page structures,
 * move to the page structure # 0 (kernel).
 * and turn on the paging.
 */
void paging_init(unsigned int mbi_addr)
{
  103e40:	53                   	push   %ebx
  103e41:	e8 d5 c4 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  103e46:	81 c3 ba 61 00 00    	add    $0x61ba,%ebx
  103e4c:	83 ec 14             	sub    $0x14,%esp
	pdir_init_kern(mbi_addr);
  103e4f:	ff 74 24 1c          	pushl  0x1c(%esp)
  103e53:	e8 b8 fe ff ff       	call   103d10 <pdir_init_kern>
	set_pdir_base(0);
  103e58:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  103e5f:	e8 cc f9 ff ff       	call   103830 <set_pdir_base>
	enable_paging();
  103e64:	e8 3f cf ff ff       	call   100da8 <enable_paging>
}
  103e69:	83 c4 18             	add    $0x18,%esp
  103e6c:	5b                   	pop    %ebx
  103e6d:	c3                   	ret    
  103e6e:	66 90                	xchg   %ax,%ax

00103e70 <alloc_page>:
  *   - It should return the physical page index registered in the page directory, i.e., the
  *     return value from map_page.
  *   - In the case of error, it should return the MagicNumber.
  */
unsigned int alloc_page (unsigned int proc_index, unsigned int vaddr, unsigned int perm)
{
  103e70:	56                   	push   %esi
  103e71:	53                   	push   %ebx
  103e72:	e8 a4 c4 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  103e77:	81 c3 89 61 00 00    	add    $0x6189,%ebx
  103e7d:	83 ec 10             	sub    $0x10,%esp
  103e80:	8b 74 24 1c          	mov    0x1c(%esp),%esi

  //dprintf("alloc page \n");

  // map_page(unsigned int, unsigned int, unsigned int, unsigned int);

  unsigned int pageindex = container_alloc(proc_index);
  103e84:	56                   	push   %esi
  103e85:	e8 36 f9 ff ff       	call   1037c0 <container_alloc>

  if(pageindex != 0){   
  103e8a:	83 c4 10             	add    $0x10,%esp
  103e8d:	85 c0                	test   %eax,%eax
  103e8f:	ba 01 00 10 00       	mov    $0x100001,%edx
  103e94:	75 0a                	jne    103ea0 <alloc_page+0x30>
     return mp;
  }
  else{ // error
    return MagicNumber;
  }
}
  103e96:	83 c4 04             	add    $0x4,%esp
  103e99:	89 d0                	mov    %edx,%eax
  103e9b:	5b                   	pop    %ebx
  103e9c:	5e                   	pop    %esi
  103e9d:	c3                   	ret    
  103e9e:	66 90                	xchg   %ax,%ax
     unsigned int mp =  map_page(proc_index, vaddr, pageindex, perm);
  103ea0:	ff 74 24 18          	pushl  0x18(%esp)
  103ea4:	50                   	push   %eax
  103ea5:	ff 74 24 1c          	pushl  0x1c(%esp)
  103ea9:	56                   	push   %esi
  103eaa:	e8 b1 fe ff ff       	call   103d60 <map_page>
     return mp;
  103eaf:	83 c4 10             	add    $0x10,%esp
     unsigned int mp =  map_page(proc_index, vaddr, pageindex, perm);
  103eb2:	89 c2                	mov    %eax,%edx
}
  103eb4:	83 c4 04             	add    $0x4,%esp
  103eb7:	89 d0                	mov    %edx,%eax
  103eb9:	5b                   	pop    %ebx
  103eba:	5e                   	pop    %esi
  103ebb:	c3                   	ret    
  103ebc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00103ec0 <alloc_mem_quota>:

/**
 * Designate some memory quota for the next child process.
 */
unsigned int alloc_mem_quota (unsigned int id, unsigned int quota)
{
  103ec0:	53                   	push   %ebx
  103ec1:	e8 55 c4 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  103ec6:	81 c3 3a 61 00 00    	add    $0x613a,%ebx
  103ecc:	83 ec 10             	sub    $0x10,%esp
	unsigned int child;
	child = container_split (id, quota);
  103ecf:	ff 74 24 1c          	pushl  0x1c(%esp)
  103ed3:	ff 74 24 1c          	pushl  0x1c(%esp)
  103ed7:	e8 84 f8 ff ff       	call   103760 <container_split>
	return child;
}
  103edc:	83 c4 18             	add    $0x18,%esp
  103edf:	5b                   	pop    %ebx
  103ee0:	c3                   	ret    
  103ee1:	66 90                	xchg   %ax,%ax
  103ee3:	66 90                	xchg   %ax,%ax
  103ee5:	66 90                	xchg   %ax,%ax
  103ee7:	66 90                	xchg   %ax,%ax
  103ee9:	66 90                	xchg   %ax,%ax
  103eeb:	66 90                	xchg   %ax,%ax
  103eed:	66 90                	xchg   %ax,%ax
  103eef:	90                   	nop

00103ef0 <kctx_set_esp>:

//places to save the [NUM_IDS] kernel thread states.
struct kctx kctx_pool[NUM_IDS];

void kctx_set_esp(unsigned int pid, void *esp)
{
  103ef0:	e8 f0 ce ff ff       	call   100de5 <__x86.get_pc_thunk.dx>
  103ef5:	81 c2 0b 61 00 00    	add    $0x610b,%edx
  103efb:	8b 44 24 04          	mov    0x4(%esp),%eax
	kctx_pool[pid].esp = esp;
  103eff:	c7 c1 00 70 df 00    	mov    $0xdf7000,%ecx
  103f05:	8b 54 24 08          	mov    0x8(%esp),%edx
  103f09:	8d 04 40             	lea    (%eax,%eax,2),%eax
  103f0c:	8d 04 c1             	lea    (%ecx,%eax,8),%eax
  103f0f:	89 10                	mov    %edx,(%eax)
  103f11:	c3                   	ret    
  103f12:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  103f19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00103f20 <kctx_set_eip>:
}

void kctx_set_eip(unsigned int pid, void *eip)
{
  103f20:	e8 c0 ce ff ff       	call   100de5 <__x86.get_pc_thunk.dx>
  103f25:	81 c2 db 60 00 00    	add    $0x60db,%edx
  103f2b:	8b 44 24 04          	mov    0x4(%esp),%eax
	kctx_pool[pid].eip = eip;
  103f2f:	c7 c1 00 70 df 00    	mov    $0xdf7000,%ecx
  103f35:	8b 54 24 08          	mov    0x8(%esp),%edx
  103f39:	8d 04 40             	lea    (%eax,%eax,2),%eax
  103f3c:	8d 04 c1             	lea    (%ecx,%eax,8),%eax
  103f3f:	89 50 14             	mov    %edx,0x14(%eax)
  103f42:	c3                   	ret    
  103f43:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  103f49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00103f50 <kctx_switch>:
/**
 * Saves the states for thread # [from_pid] and restores the states
 * for thread # [to_pid].
 */
void kctx_switch(unsigned int from_pid, unsigned int to_pid)
{
  103f50:	53                   	push   %ebx
  103f51:	e8 c5 c3 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  103f56:	81 c3 aa 60 00 00    	add    $0x60aa,%ebx
  103f5c:	83 ec 10             	sub    $0x10,%esp
  103f5f:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  103f63:	8b 54 24 18          	mov    0x18(%esp),%edx
	cswitch(&kctx_pool[from_pid], &kctx_pool[to_pid]);
  103f67:	8d 0c 40             	lea    (%eax,%eax,2),%ecx
  103f6a:	c7 c0 00 70 df 00    	mov    $0xdf7000,%eax
  103f70:	8d 14 52             	lea    (%edx,%edx,2),%edx
  103f73:	8d 0c c8             	lea    (%eax,%ecx,8),%ecx
  103f76:	8d 04 d0             	lea    (%eax,%edx,8),%eax
  103f79:	51                   	push   %ecx
  103f7a:	50                   	push   %eax
  103f7b:	e8 05 00 00 00       	call   103f85 <cswitch>
}
  103f80:	83 c4 18             	add    $0x18,%esp
  103f83:	5b                   	pop    %ebx
  103f84:	c3                   	ret    

00103f85 <cswitch>:
cswitch:
	/**
	  * The pointer *from is saved to register %eax.
	  * This is the pointer to the kctx structure to be saved.
	  */
	movl	  4(%esp), %eax	
  103f85:	8b 44 24 04          	mov    0x4(%esp),%eax

	/**
	  * The pointer *to is saved to register %edx.
	  * This is the pointer to the kctx structure to be loaded.
	  */
	movl	  8(%esp), %edx	
  103f89:	8b 54 24 08          	mov    0x8(%esp),%edx
	  *  Hint 2:
	  *  - Remember that eip in kctx structure should hold the return address pushed onto the current thread's stack (i.e. 0(%esp))
	*/


	  movl %esp, 0(%eax)
  103f8d:	89 20                	mov    %esp,(%eax)
	  movl %edi, 4(%eax)
  103f8f:	89 78 04             	mov    %edi,0x4(%eax)
	  movl %esi, 8(%eax)
  103f92:	89 70 08             	mov    %esi,0x8(%eax)
	  movl %ebx, 12(%eax)
  103f95:	89 58 0c             	mov    %ebx,0xc(%eax)
	  movl %ebp, 16(%eax)
  103f98:	89 68 10             	mov    %ebp,0x10(%eax)
	  movl 0(%esp), %ecx
  103f9b:	8b 0c 24             	mov    (%esp),%ecx
	
	  movl %ecx, 20(%eax)
  103f9e:	89 48 14             	mov    %ecx,0x14(%eax)
	  *    to as the return address. For this, we want to place the eip field of kctx structure onto the top of the stack (i.e. 0(%esp))
	  *    so that it will use that value in the ret statement.  
	  */


	  movl 0(%edx), %esp
  103fa1:	8b 22                	mov    (%edx),%esp
	  movl 4(%edx), %edi
  103fa3:	8b 7a 04             	mov    0x4(%edx),%edi
	  movl 8(%edx), %esi
  103fa6:	8b 72 08             	mov    0x8(%edx),%esi
	  movl 12(%edx), %ebx
  103fa9:	8b 5a 0c             	mov    0xc(%edx),%ebx
	  movl 16(%edx), %ebp
  103fac:	8b 6a 10             	mov    0x10(%edx),%ebp
	  movl  20(%edx), %ecx
  103faf:	8b 4a 14             	mov    0x14(%edx),%ecx
	  movl %ecx, 0(%esp)
  103fb2:	89 0c 24             	mov    %ecx,(%esp)


	/**
	  * The return value is stored in eax. Returns 0.
	  */
	xor     %eax, %eax
  103fb5:	31 c0                	xor    %eax,%eax
	ret
  103fb7:	c3                   	ret    
  103fb8:	66 90                	xchg   %ax,%ax
  103fba:	66 90                	xchg   %ax,%ax
  103fbc:	66 90                	xchg   %ax,%ax
  103fbe:	66 90                	xchg   %ax,%ax

00103fc0 <kctx_new>:
  *    i.e. Address of STACK_LOC[child][PAGESIZE - 1]. Remember that the stack is going down from high address to low.
  *  Hint 3:
  *  - Return the child pid.
  */
unsigned int kctx_new(void *entry, unsigned int id, unsigned int quota)
{
  103fc0:	56                   	push   %esi
  103fc1:	53                   	push   %ebx
  103fc2:	e8 54 c3 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  103fc7:	81 c3 39 60 00 00    	add    $0x6039,%ebx
  103fcd:	83 ec 0c             	sub    $0xc,%esp
  // TODO

  int pid_child = alloc_mem_quota(id, quota);
  103fd0:	ff 74 24 20          	pushl  0x20(%esp)
  103fd4:	ff 74 24 20          	pushl  0x20(%esp)
  103fd8:	e8 e3 fe ff ff       	call   103ec0 <alloc_mem_quota>
  103fdd:	89 c6                	mov    %eax,%esi

  int *eip = entry;
  int *esp = STACK_LOC[pid_child]+(PAGESIZE-1);


  kctx_set_esp(pid_child, esp);
  103fdf:	58                   	pop    %eax
  int *esp = STACK_LOC[pid_child]+(PAGESIZE-1);
  103fe0:	c7 c0 00 30 97 00    	mov    $0x973000,%eax
  kctx_set_esp(pid_child, esp);
  103fe6:	5a                   	pop    %edx
  int *esp = STACK_LOC[pid_child]+(PAGESIZE-1);
  103fe7:	89 f2                	mov    %esi,%edx
  103fe9:	c1 e2 0c             	shl    $0xc,%edx
  103fec:	8d 84 02 ff 0f 00 00 	lea    0xfff(%edx,%eax,1),%eax
  kctx_set_esp(pid_child, esp);
  103ff3:	50                   	push   %eax
  103ff4:	56                   	push   %esi
  103ff5:	e8 f6 fe ff ff       	call   103ef0 <kctx_set_esp>
  kctx_set_eip(pid_child, eip);
  103ffa:	59                   	pop    %ecx
  103ffb:	58                   	pop    %eax
  103ffc:	ff 74 24 18          	pushl  0x18(%esp)
  104000:	56                   	push   %esi
  104001:	e8 1a ff ff ff       	call   103f20 <kctx_set_eip>

   return pid_child;
  // return id;
}
  104006:	83 c4 14             	add    $0x14,%esp
  104009:	89 f0                	mov    %esi,%eax
  10400b:	5b                   	pop    %ebx
  10400c:	5e                   	pop    %esi
  10400d:	c3                   	ret    
  10400e:	66 90                	xchg   %ax,%ax

00104010 <tcb_get_state>:

struct TCB TCBPool[NUM_IDS];


unsigned int tcb_get_state(unsigned int pid)
{
  104010:	e8 d0 cd ff ff       	call   100de5 <__x86.get_pc_thunk.dx>
  104015:	81 c2 eb 5f 00 00    	add    $0x5feb,%edx
  10401b:	8b 44 24 04          	mov    0x4(%esp),%eax
	return TCBPool[pid].state;
  10401f:	c7 c1 00 76 df 00    	mov    $0xdf7600,%ecx
  104025:	8d 04 40             	lea    (%eax,%eax,2),%eax
  104028:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  10402b:	8b 00                	mov    (%eax),%eax
}
  10402d:	c3                   	ret    
  10402e:	66 90                	xchg   %ax,%ax

00104030 <tcb_set_state>:

void tcb_set_state(unsigned int pid, unsigned int state)
{
  104030:	e8 b0 cd ff ff       	call   100de5 <__x86.get_pc_thunk.dx>
  104035:	81 c2 cb 5f 00 00    	add    $0x5fcb,%edx
  10403b:	8b 44 24 04          	mov    0x4(%esp),%eax
	TCBPool[pid].state = state;
  10403f:	c7 c1 00 76 df 00    	mov    $0xdf7600,%ecx
  104045:	8b 54 24 08          	mov    0x8(%esp),%edx
  104049:	8d 04 40             	lea    (%eax,%eax,2),%eax
  10404c:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  10404f:	89 10                	mov    %edx,(%eax)
  104051:	c3                   	ret    
  104052:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  104059:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104060 <tcb_get_prev>:
}

unsigned int tcb_get_prev(unsigned int pid)
{
  104060:	e8 80 cd ff ff       	call   100de5 <__x86.get_pc_thunk.dx>
  104065:	81 c2 9b 5f 00 00    	add    $0x5f9b,%edx
  10406b:	8b 44 24 04          	mov    0x4(%esp),%eax
	return TCBPool[pid].prev;
  10406f:	c7 c1 00 76 df 00    	mov    $0xdf7600,%ecx
  104075:	8d 04 40             	lea    (%eax,%eax,2),%eax
  104078:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  10407b:	8b 40 04             	mov    0x4(%eax),%eax
}
  10407e:	c3                   	ret    
  10407f:	90                   	nop

00104080 <tcb_set_prev>:

void tcb_set_prev(unsigned int pid, unsigned int prev_pid)
{
  104080:	e8 60 cd ff ff       	call   100de5 <__x86.get_pc_thunk.dx>
  104085:	81 c2 7b 5f 00 00    	add    $0x5f7b,%edx
  10408b:	8b 44 24 04          	mov    0x4(%esp),%eax
	TCBPool[pid].prev = prev_pid;
  10408f:	c7 c1 00 76 df 00    	mov    $0xdf7600,%ecx
  104095:	8b 54 24 08          	mov    0x8(%esp),%edx
  104099:	8d 04 40             	lea    (%eax,%eax,2),%eax
  10409c:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  10409f:	89 50 04             	mov    %edx,0x4(%eax)
  1040a2:	c3                   	ret    
  1040a3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1040a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001040b0 <tcb_get_next>:
}

unsigned int tcb_get_next(unsigned int pid)
{
  1040b0:	e8 30 cd ff ff       	call   100de5 <__x86.get_pc_thunk.dx>
  1040b5:	81 c2 4b 5f 00 00    	add    $0x5f4b,%edx
  1040bb:	8b 44 24 04          	mov    0x4(%esp),%eax
	return TCBPool[pid].next;
  1040bf:	c7 c1 00 76 df 00    	mov    $0xdf7600,%ecx
  1040c5:	8d 04 40             	lea    (%eax,%eax,2),%eax
  1040c8:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  1040cb:	8b 40 08             	mov    0x8(%eax),%eax
}
  1040ce:	c3                   	ret    
  1040cf:	90                   	nop

001040d0 <tcb_set_next>:

void tcb_set_next(unsigned int pid, unsigned int next_pid)
{
  1040d0:	e8 10 cd ff ff       	call   100de5 <__x86.get_pc_thunk.dx>
  1040d5:	81 c2 2b 5f 00 00    	add    $0x5f2b,%edx
  1040db:	8b 44 24 04          	mov    0x4(%esp),%eax
	TCBPool[pid].next = next_pid;
  1040df:	c7 c1 00 76 df 00    	mov    $0xdf7600,%ecx
  1040e5:	8b 54 24 08          	mov    0x8(%esp),%edx
  1040e9:	8d 04 40             	lea    (%eax,%eax,2),%eax
  1040ec:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  1040ef:	89 50 08             	mov    %edx,0x8(%eax)
  1040f2:	c3                   	ret    
  1040f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1040f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104100 <tcb_init_at_id>:
}

void tcb_init_at_id(unsigned int pid)
{
  104100:	e8 e0 cc ff ff       	call   100de5 <__x86.get_pc_thunk.dx>
  104105:	81 c2 fb 5e 00 00    	add    $0x5efb,%edx
  10410b:	8b 44 24 04          	mov    0x4(%esp),%eax
	TCBPool[pid].state = TSTATE_DEAD;
  10410f:	c7 c1 00 76 df 00    	mov    $0xdf7600,%ecx
  104115:	8d 04 40             	lea    (%eax,%eax,2),%eax
  104118:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  10411b:	c7 00 03 00 00 00    	movl   $0x3,(%eax)
	TCBPool[pid].prev = NUM_IDS;
  104121:	c7 40 04 40 00 00 00 	movl   $0x40,0x4(%eax)
	TCBPool[pid].next = NUM_IDS;
  104128:	c7 40 08 40 00 00 00 	movl   $0x40,0x8(%eax)
  10412f:	c3                   	ret    

00104130 <tcb_init>:
  * 
  *  Hint 1:
  *  - Use function tcb_init_at_id, defined in PTCBIntro.c
  */
void tcb_init(unsigned int mbi_addr)
{
  104130:	56                   	push   %esi
  104131:	53                   	push   %ebx
  // TODO: define your local variables here.

	paging_init(mbi_addr);

	int i;
	for(i = 0; i < NUM_IDS; i++){
  104132:	31 f6                	xor    %esi,%esi
  104134:	e8 e2 c1 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  104139:	81 c3 c7 5e 00 00    	add    $0x5ec7,%ebx
{
  10413f:	83 ec 10             	sub    $0x10,%esp
	paging_init(mbi_addr);
  104142:	ff 74 24 1c          	pushl  0x1c(%esp)
  104146:	e8 f5 fc ff ff       	call   103e40 <paging_init>
  10414b:	83 c4 10             	add    $0x10,%esp
  10414e:	66 90                	xchg   %ax,%ax

		tcb_init_at_id(i);
  104150:	83 ec 0c             	sub    $0xc,%esp
  104153:	56                   	push   %esi
	for(i = 0; i < NUM_IDS; i++){
  104154:	83 c6 01             	add    $0x1,%esi
		tcb_init_at_id(i);
  104157:	e8 a4 ff ff ff       	call   104100 <tcb_init_at_id>
	for(i = 0; i < NUM_IDS; i++){
  10415c:	83 c4 10             	add    $0x10,%esp
  10415f:	83 fe 40             	cmp    $0x40,%esi
  104162:	75 ec                	jne    104150 <tcb_init+0x20>
	}

	

  // TODO
}
  104164:	83 c4 04             	add    $0x4,%esp
  104167:	5b                   	pop    %ebx
  104168:	5e                   	pop    %esi
  104169:	c3                   	ret    
  10416a:	66 90                	xchg   %ax,%ax
  10416c:	66 90                	xchg   %ax,%ax
  10416e:	66 90                	xchg   %ax,%ax

00104170 <tqueue_get_head>:
 * and are scheduled in a round-robin manner.
 */
struct TQueue TQueuePool[NUM_IDS + 1];

unsigned int tqueue_get_head(unsigned int chid)
{
  104170:	e8 6c cc ff ff       	call   100de1 <__x86.get_pc_thunk.ax>
  104175:	05 8b 5e 00 00       	add    $0x5e8b,%eax
	return TQueuePool[chid].head;
  10417a:	8b 54 24 04          	mov    0x4(%esp),%edx
  10417e:	c7 c0 00 79 df 00    	mov    $0xdf7900,%eax
  104184:	8b 04 d0             	mov    (%eax,%edx,8),%eax
}
  104187:	c3                   	ret    
  104188:	90                   	nop
  104189:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00104190 <tqueue_set_head>:

void tqueue_set_head(unsigned int chid, unsigned int head)
{
  104190:	e8 4c cc ff ff       	call   100de1 <__x86.get_pc_thunk.ax>
  104195:	05 6b 5e 00 00       	add    $0x5e6b,%eax
	TQueuePool[chid].head = head;
  10419a:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  10419e:	8b 54 24 04          	mov    0x4(%esp),%edx
  1041a2:	c7 c0 00 79 df 00    	mov    $0xdf7900,%eax
  1041a8:	89 0c d0             	mov    %ecx,(%eax,%edx,8)
  1041ab:	c3                   	ret    
  1041ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

001041b0 <tqueue_get_tail>:
}

unsigned int tqueue_get_tail(unsigned int chid)
{
  1041b0:	e8 2c cc ff ff       	call   100de1 <__x86.get_pc_thunk.ax>
  1041b5:	05 4b 5e 00 00       	add    $0x5e4b,%eax
	return TQueuePool[chid].tail;
  1041ba:	8b 54 24 04          	mov    0x4(%esp),%edx
  1041be:	c7 c0 00 79 df 00    	mov    $0xdf7900,%eax
  1041c4:	8b 44 d0 04          	mov    0x4(%eax,%edx,8),%eax
}
  1041c8:	c3                   	ret    
  1041c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001041d0 <tqueue_set_tail>:

void tqueue_set_tail(unsigned int chid, unsigned int tail)
{
  1041d0:	e8 0c cc ff ff       	call   100de1 <__x86.get_pc_thunk.ax>
  1041d5:	05 2b 5e 00 00       	add    $0x5e2b,%eax
	TQueuePool[chid].tail = tail;
  1041da:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  1041de:	8b 54 24 04          	mov    0x4(%esp),%edx
  1041e2:	c7 c0 00 79 df 00    	mov    $0xdf7900,%eax
  1041e8:	89 4c d0 04          	mov    %ecx,0x4(%eax,%edx,8)
  1041ec:	c3                   	ret    
  1041ed:	8d 76 00             	lea    0x0(%esi),%esi

001041f0 <tqueue_init_at_id>:
}

void tqueue_init_at_id(unsigned int chid)
{
  1041f0:	e8 ec cb ff ff       	call   100de1 <__x86.get_pc_thunk.ax>
  1041f5:	05 0b 5e 00 00       	add    $0x5e0b,%eax
  1041fa:	8b 54 24 04          	mov    0x4(%esp),%edx
	TQueuePool[chid].head = NUM_IDS;
  1041fe:	c7 c0 00 79 df 00    	mov    $0xdf7900,%eax
  104204:	c7 04 d0 40 00 00 00 	movl   $0x40,(%eax,%edx,8)
	TQueuePool[chid].tail = NUM_IDS;
  10420b:	c7 44 d0 04 40 00 00 	movl   $0x40,0x4(%eax,%edx,8)
  104212:	00 
  104213:	c3                   	ret    
  104214:	66 90                	xchg   %ax,%ax
  104216:	66 90                	xchg   %ax,%ax
  104218:	66 90                	xchg   %ax,%ax
  10421a:	66 90                	xchg   %ax,%ax
  10421c:	66 90                	xchg   %ax,%ax
  10421e:	66 90                	xchg   %ax,%ax

00104220 <tqueue_init>:
  *  Hint 1:
  *  - Remember that there are NUM_IDS + 1 queues. The first NUM_IDS queues are the sleep queues and 
  *    the last queue with id NUM_IDS is the ready queue.
  */
void tqueue_init(unsigned int mbi_addr)
{
  104220:	56                   	push   %esi
  104221:	53                   	push   %ebx
  int i;


	tcb_init(mbi_addr);

  for(i = 0; i < NUM_IDS+1; i++){
  104222:	31 f6                	xor    %esi,%esi
  104224:	e8 f2 c0 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  104229:	81 c3 d7 5d 00 00    	add    $0x5dd7,%ebx
{
  10422f:	83 ec 10             	sub    $0x10,%esp
	tcb_init(mbi_addr);
  104232:	ff 74 24 1c          	pushl  0x1c(%esp)
  104236:	e8 f5 fe ff ff       	call   104130 <tcb_init>
  10423b:	83 c4 10             	add    $0x10,%esp
  10423e:	66 90                	xchg   %ax,%ax
    tqueue_init_at_id(i);
  104240:	83 ec 0c             	sub    $0xc,%esp
  104243:	56                   	push   %esi
  for(i = 0; i < NUM_IDS+1; i++){
  104244:	83 c6 01             	add    $0x1,%esi
    tqueue_init_at_id(i);
  104247:	e8 a4 ff ff ff       	call   1041f0 <tqueue_init_at_id>
  for(i = 0; i < NUM_IDS+1; i++){
  10424c:	83 c4 10             	add    $0x10,%esp
  10424f:	83 fe 41             	cmp    $0x41,%esi
  104252:	75 ec                	jne    104240 <tqueue_init+0x20>
  }

  // TODO
}
  104254:	83 c4 04             	add    $0x4,%esp
  104257:	5b                   	pop    %ebx
  104258:	5e                   	pop    %esi
  104259:	c3                   	ret    
  10425a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00104260 <tqueue_enqueue>:
  *    1. update the next pointer in the old tail to point to #pid.
  *    2. then the prev pointer for #pid should point to the old tail.
  *    3. and the next pointer for #pid should point to NULL (i.e. NUM_IDS)
  */
void tqueue_enqueue(unsigned int chid, unsigned int pid)
{
  104260:	55                   	push   %ebp
  104261:	57                   	push   %edi
  104262:	56                   	push   %esi
  104263:	53                   	push   %ebx
  104264:	e8 b2 c0 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  104269:	81 c3 97 5d 00 00    	add    $0x5d97,%ebx
  10426f:	83 ec 18             	sub    $0x18,%esp
  104272:	8b 7c 24 2c          	mov    0x2c(%esp),%edi
  104276:	8b 74 24 30          	mov    0x30(%esp),%esi
  // TODO
  int child_tail = tqueue_get_tail(chid);
  10427a:	57                   	push   %edi
  10427b:	e8 30 ff ff ff       	call   1041b0 <tqueue_get_tail>

  if(child_tail == NUM_IDS){
  104280:	83 c4 10             	add    $0x10,%esp
  104283:	83 f8 40             	cmp    $0x40,%eax
  104286:	74 38                	je     1042c0 <tqueue_enqueue+0x60>

  }
  else{

    
    tcb_set_next(child_tail, pid);
  104288:	83 ec 08             	sub    $0x8,%esp
  10428b:	89 c5                	mov    %eax,%ebp
  10428d:	56                   	push   %esi
  10428e:	50                   	push   %eax
  10428f:	e8 3c fe ff ff       	call   1040d0 <tcb_set_next>
    tcb_set_prev(pid, child_tail);
  104294:	59                   	pop    %ecx
  104295:	58                   	pop    %eax
  104296:	55                   	push   %ebp
  104297:	56                   	push   %esi
  104298:	e8 e3 fd ff ff       	call   104080 <tcb_set_prev>
    tcb_set_next(pid,NUM_IDS);
  10429d:	58                   	pop    %eax
  10429e:	5a                   	pop    %edx
  10429f:	6a 40                	push   $0x40
  1042a1:	56                   	push   %esi
  1042a2:	e8 29 fe ff ff       	call   1040d0 <tcb_set_next>
    tqueue_set_tail(chid, pid);
  1042a7:	58                   	pop    %eax
  1042a8:	5a                   	pop    %edx
  1042a9:	56                   	push   %esi
  1042aa:	57                   	push   %edi
  1042ab:	e8 20 ff ff ff       	call   1041d0 <tqueue_set_tail>
  1042b0:	83 c4 10             	add    $0x10,%esp

  }

}
  1042b3:	83 c4 0c             	add    $0xc,%esp
  1042b6:	5b                   	pop    %ebx
  1042b7:	5e                   	pop    %esi
  1042b8:	5f                   	pop    %edi
  1042b9:	5d                   	pop    %ebp
  1042ba:	c3                   	ret    
  1042bb:	90                   	nop
  1042bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    tcb_set_prev(pid, NUM_IDS);
  1042c0:	83 ec 08             	sub    $0x8,%esp
  1042c3:	6a 40                	push   $0x40
  1042c5:	56                   	push   %esi
  1042c6:	e8 b5 fd ff ff       	call   104080 <tcb_set_prev>
    tcb_set_next(pid, NUM_IDS);
  1042cb:	59                   	pop    %ecx
  1042cc:	5d                   	pop    %ebp
  1042cd:	6a 40                	push   $0x40
  1042cf:	56                   	push   %esi
  1042d0:	e8 fb fd ff ff       	call   1040d0 <tcb_set_next>
    tqueue_set_head(chid, pid);
  1042d5:	58                   	pop    %eax
  1042d6:	5a                   	pop    %edx
  1042d7:	56                   	push   %esi
  1042d8:	57                   	push   %edi
  1042d9:	e8 b2 fe ff ff       	call   104190 <tqueue_set_head>
  1042de:	eb c7                	jmp    1042a7 <tqueue_enqueue+0x47>

001042e0 <tqueue_dequeue>:
  *  - b) Else, set prev pointer of the new head to NUM_IDS.
  *  Hint 3: Detach the popped head from other threads.
  *  - Reset the poped head's prev and next pointers to NUM_IDS.
  */
unsigned int tqueue_dequeue(unsigned int child)
{
  1042e0:	55                   	push   %ebp
  1042e1:	57                   	push   %edi
  1042e2:	56                   	push   %esi
  1042e3:	53                   	push   %ebx
  1042e4:	e8 32 c0 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  1042e9:	81 c3 17 5d 00 00    	add    $0x5d17,%ebx
  1042ef:	83 ec 18             	sub    $0x18,%esp
  1042f2:	8b 7c 24 2c          	mov    0x2c(%esp),%edi
  // TODO
  int head  = tqueue_get_head(child);
  1042f6:	57                   	push   %edi
  1042f7:	e8 74 fe ff ff       	call   104170 <tqueue_get_head>

  if(head==NUM_IDS){
  1042fc:	83 c4 10             	add    $0x10,%esp
  1042ff:	83 f8 40             	cmp    $0x40,%eax
  int head  = tqueue_get_head(child);
  104302:	89 c6                	mov    %eax,%esi
  if(head==NUM_IDS){
  104304:	74 42                	je     104348 <tqueue_dequeue+0x68>
    tqueue_set_head(child, NUM_IDS);
    tqueue_set_tail(child, NUM_IDS);
  }
  else{

    int new_head = tcb_get_next(head);
  104306:	83 ec 0c             	sub    $0xc,%esp
  104309:	50                   	push   %eax
  10430a:	e8 a1 fd ff ff       	call   1040b0 <tcb_get_next>
  10430f:	89 c5                	mov    %eax,%ebp
    tcb_set_prev(new_head, NUM_IDS);
  104311:	58                   	pop    %eax
  104312:	5a                   	pop    %edx
  104313:	6a 40                	push   $0x40
  104315:	55                   	push   %ebp
  104316:	e8 65 fd ff ff       	call   104080 <tcb_set_prev>
    tqueue_set_head(child, new_head);
  10431b:	59                   	pop    %ecx
  10431c:	58                   	pop    %eax
  10431d:	55                   	push   %ebp
  10431e:	57                   	push   %edi
  10431f:	e8 6c fe ff ff       	call   104190 <tqueue_set_head>
    tcb_set_prev(head, NUM_IDS);
  104324:	58                   	pop    %eax
  104325:	5a                   	pop    %edx
  104326:	6a 40                	push   $0x40
  104328:	56                   	push   %esi
  104329:	e8 52 fd ff ff       	call   104080 <tcb_set_prev>
    tcb_set_next(head, NUM_IDS);
  10432e:	59                   	pop    %ecx
  10432f:	5f                   	pop    %edi
  104330:	6a 40                	push   $0x40
  104332:	56                   	push   %esi
  104333:	e8 98 fd ff ff       	call   1040d0 <tcb_set_next>
  104338:	83 c4 10             	add    $0x10,%esp




  return head;
}
  10433b:	89 f0                	mov    %esi,%eax
  10433d:	83 c4 0c             	add    $0xc,%esp
  104340:	5b                   	pop    %ebx
  104341:	5e                   	pop    %esi
  104342:	5f                   	pop    %edi
  104343:	5d                   	pop    %ebp
  104344:	c3                   	ret    
  104345:	8d 76 00             	lea    0x0(%esi),%esi
    tqueue_set_head(child, NUM_IDS);
  104348:	83 ec 08             	sub    $0x8,%esp
  10434b:	6a 40                	push   $0x40
  10434d:	57                   	push   %edi
  10434e:	e8 3d fe ff ff       	call   104190 <tqueue_set_head>
    tqueue_set_tail(child, NUM_IDS);
  104353:	5d                   	pop    %ebp
  104354:	58                   	pop    %eax
  104355:	6a 40                	push   $0x40
  104357:	57                   	push   %edi
  104358:	e8 73 fe ff ff       	call   1041d0 <tqueue_set_tail>
  10435d:	83 c4 10             	add    $0x10,%esp
}
  104360:	89 f0                	mov    %esi,%eax
  104362:	83 c4 0c             	add    $0xc,%esp
  104365:	5b                   	pop    %ebx
  104366:	5e                   	pop    %esi
  104367:	5f                   	pop    %edi
  104368:	5d                   	pop    %ebp
  104369:	c3                   	ret    
  10436a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00104370 <tqueue_remove>:
  *  - c) If #pid is the tail of the queue, set it's prev thread as the tail of the queue.
  *       Remember to update the new tail's TCB pointers. (Where does the tail's next pointer point to?)
  *  Hint 2: Detach the removed #pid's TCB from other threads. (Same as TASK 3)
  */
void tqueue_remove(unsigned int chid, unsigned int pid)
{
  104370:	55                   	push   %ebp
  104371:	57                   	push   %edi
  104372:	56                   	push   %esi
  104373:	53                   	push   %ebx
  104374:	e8 a2 bf ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  104379:	81 c3 87 5c 00 00    	add    $0x5c87,%ebx
  10437f:	83 ec 18             	sub    $0x18,%esp
  104382:	8b 74 24 30          	mov    0x30(%esp),%esi
  104386:	8b 7c 24 2c          	mov    0x2c(%esp),%edi
  // TODO
  if(tcb_get_prev(pid) == NUM_IDS && tcb_get_next(pid)==NUM_IDS){
  10438a:	56                   	push   %esi
  10438b:	e8 d0 fc ff ff       	call   104060 <tcb_get_prev>
  104390:	83 c4 10             	add    $0x10,%esp
  104393:	83 f8 40             	cmp    $0x40,%eax
  104396:	74 78                	je     104410 <tqueue_remove+0xa0>

    tqueue_set_head(chid, NUM_IDS);
    tqueue_set_tail(chid, NUM_IDS);
  }
  else if(tqueue_get_head(chid)==pid){
  104398:	83 ec 0c             	sub    $0xc,%esp
  10439b:	57                   	push   %edi
  10439c:	e8 cf fd ff ff       	call   104170 <tqueue_get_head>
  1043a1:	83 c4 10             	add    $0x10,%esp
  1043a4:	39 c6                	cmp    %eax,%esi
  1043a6:	0f 84 94 00 00 00    	je     104440 <tqueue_remove+0xd0>
    int new_head = tcb_get_next(pid);
    tcb_set_prev(new_head, NUM_IDS);
    tcb_set_next(pid, NUM_IDS);
    tqueue_set_head(chid, new_head);
  }
  else if(tqueue_get_tail(chid) == pid){
  1043ac:	83 ec 0c             	sub    $0xc,%esp
  1043af:	57                   	push   %edi
  1043b0:	e8 fb fd ff ff       	call   1041b0 <tqueue_get_tail>
  1043b5:	83 c4 10             	add    $0x10,%esp
  1043b8:	39 c6                	cmp    %eax,%esi
  1043ba:	0f 84 b8 00 00 00    	je     104478 <tqueue_remove+0x108>
    tqueue_set_head(chid, NUM_IDS);

  }
  else{

    int previous = tcb_get_prev(pid);
  1043c0:	83 ec 0c             	sub    $0xc,%esp
  1043c3:	56                   	push   %esi
  1043c4:	e8 97 fc ff ff       	call   104060 <tcb_get_prev>
    int next = tcb_get_next(pid);
  1043c9:	89 34 24             	mov    %esi,(%esp)
    int previous = tcb_get_prev(pid);
  1043cc:	89 c7                	mov    %eax,%edi
    int next = tcb_get_next(pid);
  1043ce:	e8 dd fc ff ff       	call   1040b0 <tcb_get_next>
  1043d3:	89 c5                	mov    %eax,%ebp

    tcb_set_next(previous, next);
  1043d5:	58                   	pop    %eax
  1043d6:	5a                   	pop    %edx
  1043d7:	55                   	push   %ebp
  1043d8:	57                   	push   %edi
  1043d9:	e8 f2 fc ff ff       	call   1040d0 <tcb_set_next>
    tcb_set_prev(next, previous);
  1043de:	59                   	pop    %ecx
  1043df:	58                   	pop    %eax
  1043e0:	57                   	push   %edi
  1043e1:	55                   	push   %ebp
  1043e2:	e8 99 fc ff ff       	call   104080 <tcb_set_prev>
    tcb_set_prev(pid, NUM_IDS);
  1043e7:	58                   	pop    %eax
  1043e8:	5a                   	pop    %edx
  1043e9:	6a 40                	push   $0x40
  1043eb:	56                   	push   %esi
  1043ec:	e8 8f fc ff ff       	call   104080 <tcb_set_prev>
    tcb_set_next(pid, NUM_IDS);
  1043f1:	59                   	pop    %ecx
  1043f2:	5f                   	pop    %edi
  1043f3:	6a 40                	push   $0x40
  1043f5:	56                   	push   %esi
  1043f6:	e8 d5 fc ff ff       	call   1040d0 <tcb_set_next>
  1043fb:	83 c4 10             	add    $0x10,%esp





}
  1043fe:	83 c4 0c             	add    $0xc,%esp
  104401:	5b                   	pop    %ebx
  104402:	5e                   	pop    %esi
  104403:	5f                   	pop    %edi
  104404:	5d                   	pop    %ebp
  104405:	c3                   	ret    
  104406:	8d 76 00             	lea    0x0(%esi),%esi
  104409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  if(tcb_get_prev(pid) == NUM_IDS && tcb_get_next(pid)==NUM_IDS){
  104410:	83 ec 0c             	sub    $0xc,%esp
  104413:	56                   	push   %esi
  104414:	e8 97 fc ff ff       	call   1040b0 <tcb_get_next>
  104419:	83 c4 10             	add    $0x10,%esp
  10441c:	83 f8 40             	cmp    $0x40,%eax
  10441f:	0f 85 73 ff ff ff    	jne    104398 <tqueue_remove+0x28>
    tqueue_set_head(chid, NUM_IDS);
  104425:	83 ec 08             	sub    $0x8,%esp
  104428:	6a 40                	push   $0x40
  10442a:	57                   	push   %edi
  10442b:	e8 60 fd ff ff       	call   104190 <tqueue_set_head>
    tqueue_set_tail(chid, NUM_IDS);
  104430:	59                   	pop    %ecx
  104431:	5e                   	pop    %esi
  104432:	6a 40                	push   $0x40
  104434:	57                   	push   %edi
  104435:	e8 96 fd ff ff       	call   1041d0 <tqueue_set_tail>
  10443a:	83 c4 10             	add    $0x10,%esp
  10443d:	eb bf                	jmp    1043fe <tqueue_remove+0x8e>
  10443f:	90                   	nop
    int new_head = tcb_get_next(pid);
  104440:	83 ec 0c             	sub    $0xc,%esp
  104443:	56                   	push   %esi
  104444:	e8 67 fc ff ff       	call   1040b0 <tcb_get_next>
  104449:	89 c5                	mov    %eax,%ebp
    tcb_set_prev(new_head, NUM_IDS);
  10444b:	58                   	pop    %eax
  10444c:	5a                   	pop    %edx
  10444d:	6a 40                	push   $0x40
  10444f:	55                   	push   %ebp
  104450:	e8 2b fc ff ff       	call   104080 <tcb_set_prev>
    tcb_set_next(pid, NUM_IDS);
  104455:	59                   	pop    %ecx
  104456:	58                   	pop    %eax
  104457:	6a 40                	push   $0x40
  104459:	56                   	push   %esi
  10445a:	e8 71 fc ff ff       	call   1040d0 <tcb_set_next>
    tqueue_set_head(chid, new_head);
  10445f:	58                   	pop    %eax
  104460:	5a                   	pop    %edx
  104461:	55                   	push   %ebp
  104462:	57                   	push   %edi
  104463:	e8 28 fd ff ff       	call   104190 <tqueue_set_head>
  104468:	83 c4 10             	add    $0x10,%esp
}
  10446b:	83 c4 0c             	add    $0xc,%esp
  10446e:	5b                   	pop    %ebx
  10446f:	5e                   	pop    %esi
  104470:	5f                   	pop    %edi
  104471:	5d                   	pop    %ebp
  104472:	c3                   	ret    
  104473:	90                   	nop
  104474:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    tcb_set_next(pid, NUM_IDS);
  104478:	83 ec 08             	sub    $0x8,%esp
  10447b:	6a 40                	push   $0x40
  10447d:	56                   	push   %esi
  10447e:	e8 4d fc ff ff       	call   1040d0 <tcb_set_next>
    tcb_set_prev(pid, NUM_IDS);
  104483:	5d                   	pop    %ebp
  104484:	58                   	pop    %eax
  104485:	6a 40                	push   $0x40
  104487:	56                   	push   %esi
  104488:	e8 f3 fb ff ff       	call   104080 <tcb_set_prev>
    tqueue_set_tail(chid, NUM_IDS);
  10448d:	58                   	pop    %eax
  10448e:	5a                   	pop    %edx
  10448f:	6a 40                	push   $0x40
  104491:	57                   	push   %edi
  104492:	e8 39 fd ff ff       	call   1041d0 <tqueue_set_tail>
    tqueue_set_head(chid, NUM_IDS);
  104497:	59                   	pop    %ecx
  104498:	5e                   	pop    %esi
  104499:	6a 40                	push   $0x40
  10449b:	57                   	push   %edi
  10449c:	e8 ef fc ff ff       	call   104190 <tqueue_set_head>
  1044a1:	83 c4 10             	add    $0x10,%esp
}
  1044a4:	83 c4 0c             	add    $0xc,%esp
  1044a7:	5b                   	pop    %ebx
  1044a8:	5e                   	pop    %esi
  1044a9:	5f                   	pop    %edi
  1044aa:	5d                   	pop    %ebp
  1044ab:	c3                   	ret    
  1044ac:	66 90                	xchg   %ax,%ax
  1044ae:	66 90                	xchg   %ax,%ax

001044b0 <get_curid>:
unsigned int CURID;

unsigned int get_curid(void)
{
  1044b0:	e8 2c c9 ff ff       	call   100de1 <__x86.get_pc_thunk.ax>
  1044b5:	05 4b 5b 00 00       	add    $0x5b4b,%eax
	return CURID;
  1044ba:	c7 c0 08 7b df 00    	mov    $0xdf7b08,%eax
  1044c0:	8b 00                	mov    (%eax),%eax
}
  1044c2:	c3                   	ret    
  1044c3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1044c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001044d0 <set_curid>:

void set_curid(unsigned int curid)
{
  1044d0:	e8 0c c9 ff ff       	call   100de1 <__x86.get_pc_thunk.ax>
  1044d5:	05 2b 5b 00 00       	add    $0x5b2b,%eax
	CURID = curid;
  1044da:	8b 54 24 04          	mov    0x4(%esp),%edx
  1044de:	c7 c0 08 7b df 00    	mov    $0xdf7b08,%eax
  1044e4:	89 10                	mov    %edx,(%eax)
  1044e6:	c3                   	ret    
  1044e7:	66 90                	xchg   %ax,%ax
  1044e9:	66 90                	xchg   %ax,%ax
  1044eb:	66 90                	xchg   %ax,%ax
  1044ed:	66 90                	xchg   %ax,%ax
  1044ef:	90                   	nop

001044f0 <thread_init>:
#include <lib/thread.h>

#include "import.h"

void thread_init(unsigned int mbi_addr)
{
  1044f0:	53                   	push   %ebx
  1044f1:	e8 25 be ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  1044f6:	81 c3 0a 5b 00 00    	add    $0x5b0a,%ebx
  1044fc:	83 ec 14             	sub    $0x14,%esp
	tqueue_init(mbi_addr);
  1044ff:	ff 74 24 1c          	pushl  0x1c(%esp)
  104503:	e8 18 fd ff ff       	call   104220 <tqueue_init>
	set_curid(0);
  104508:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10450f:	e8 bc ff ff ff       	call   1044d0 <set_curid>
	tcb_set_state(0, TSTATE_RUN);
  104514:	58                   	pop    %eax
  104515:	5a                   	pop    %edx
  104516:	6a 01                	push   $0x1
  104518:	6a 00                	push   $0x0
  10451a:	e8 11 fb ff ff       	call   104030 <tcb_set_state>
}
  10451f:	83 c4 18             	add    $0x18,%esp
  104522:	5b                   	pop    %ebx
  104523:	c3                   	ret    
  104524:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  10452a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00104530 <thread_spawn>:
  *  - import.h has all the functions you will need.
  *  Hint 2:
  *  - The ready queue is the queue with index NUM_IDS. 
  */
unsigned int thread_spawn(void *entry, unsigned int id, unsigned int quota)
{
  104530:	56                   	push   %esi
  104531:	53                   	push   %ebx
  104532:	e8 e4 bd ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  104537:	81 c3 c9 5a 00 00    	add    $0x5ac9,%ebx
  10453d:	83 ec 08             	sub    $0x8,%esp
  // TODO

  unsigned int child_id = kctx_new(entry, id, quota);
  104540:	ff 74 24 1c          	pushl  0x1c(%esp)
  104544:	ff 74 24 1c          	pushl  0x1c(%esp)
  104548:	ff 74 24 1c          	pushl  0x1c(%esp)
  10454c:	e8 6f fa ff ff       	call   103fc0 <kctx_new>
  104551:	89 c6                	mov    %eax,%esi
  tcb_set_state(child_id, TSTATE_READY);
  104553:	58                   	pop    %eax
  104554:	5a                   	pop    %edx
  104555:	6a 00                	push   $0x0
  104557:	56                   	push   %esi
  104558:	e8 d3 fa ff ff       	call   104030 <tcb_set_state>

  tqueue_enqueue(NUM_IDS, child_id);
  10455d:	59                   	pop    %ecx
  10455e:	58                   	pop    %eax
  10455f:	56                   	push   %esi
  104560:	6a 40                	push   $0x40
  104562:	e8 f9 fc ff ff       	call   104260 <tqueue_enqueue>
  return child_id;
}
  104567:	83 c4 14             	add    $0x14,%esp
  10456a:	89 f0                	mov    %esi,%eax
  10456c:	5b                   	pop    %ebx
  10456d:	5e                   	pop    %esi
  10456e:	c3                   	ret    
  10456f:	90                   	nop

00104570 <thread_yield>:
  *          i.e. The thread at the head of the ready queue is run next.
  *  Hint 2: If you are the only thread that is ready to run,
  *          do you need to switch to yourself?
  */
void thread_yield(void)
{
  104570:	57                   	push   %edi
  104571:	56                   	push   %esi
  104572:	53                   	push   %ebx
  104573:	e8 a3 bd ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  104578:	81 c3 88 5a 00 00    	add    $0x5a88,%ebx
  // TODO

  

  int pid = get_curid();
  10457e:	e8 2d ff ff ff       	call   1044b0 <get_curid>
  tcb_set_state(pid, TSTATE_READY);
  104583:	83 ec 08             	sub    $0x8,%esp
  int pid = get_curid();
  104586:	89 c6                	mov    %eax,%esi
  tcb_set_state(pid, TSTATE_READY);
  104588:	6a 00                	push   $0x0
  10458a:	50                   	push   %eax
  10458b:	e8 a0 fa ff ff       	call   104030 <tcb_set_state>
  tqueue_enqueue(NUM_IDS, pid);
  104590:	58                   	pop    %eax
  104591:	5a                   	pop    %edx
  104592:	56                   	push   %esi
  104593:	6a 40                	push   $0x40
  104595:	e8 c6 fc ff ff       	call   104260 <tqueue_enqueue>
 
  int head = tqueue_dequeue(NUM_IDS);
  10459a:	c7 04 24 40 00 00 00 	movl   $0x40,(%esp)
  1045a1:	e8 3a fd ff ff       	call   1042e0 <tqueue_dequeue>
  tcb_set_state(head, TSTATE_RUN);
  1045a6:	59                   	pop    %ecx
  int head = tqueue_dequeue(NUM_IDS);
  1045a7:	89 c7                	mov    %eax,%edi
  tcb_set_state(head, TSTATE_RUN);
  1045a9:	58                   	pop    %eax
  1045aa:	6a 01                	push   $0x1
  1045ac:	57                   	push   %edi
  1045ad:	e8 7e fa ff ff       	call   104030 <tcb_set_state>
  set_curid(head);
  1045b2:	89 3c 24             	mov    %edi,(%esp)
  1045b5:	e8 16 ff ff ff       	call   1044d0 <set_curid>
  kctx_switch(pid, head);
  1045ba:	58                   	pop    %eax
  1045bb:	5a                   	pop    %edx
  1045bc:	57                   	push   %edi
  1045bd:	56                   	push   %esi
  1045be:	e8 8d f9 ff ff       	call   103f50 <kctx_switch>





}
  1045c3:	83 c4 10             	add    $0x10,%esp
  1045c6:	5b                   	pop    %ebx
  1045c7:	5e                   	pop    %esi
  1045c8:	5f                   	pop    %edi
  1045c9:	c3                   	ret    
  1045ca:	66 90                	xchg   %ax,%ax
  1045cc:	66 90                	xchg   %ax,%ax
  1045ce:	66 90                	xchg   %ax,%ax

001045d0 <proc_start_user>:

extern tf_t uctx_pool[NUM_IDS];
extern char STACK_LOC[NUM_IDS][PAGESIZE];

void proc_start_user(void)
{
  1045d0:	56                   	push   %esi
  1045d1:	53                   	push   %ebx
  1045d2:	e8 44 bd ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  1045d7:	81 c3 29 5a 00 00    	add    $0x5a29,%ebx
  1045dd:	83 ec 04             	sub    $0x4,%esp
	unsigned int cur_pid = get_curid();
  1045e0:	e8 cb fe ff ff       	call   1044b0 <get_curid>
	tss_switch(cur_pid);
  1045e5:	83 ec 0c             	sub    $0xc,%esp
	unsigned int cur_pid = get_curid();
  1045e8:	89 c6                	mov    %eax,%esi
	tss_switch(cur_pid);
  1045ea:	50                   	push   %eax
  1045eb:	e8 d6 e0 ff ff       	call   1026c6 <tss_switch>
	set_pdir_base(cur_pid);
  1045f0:	89 34 24             	mov    %esi,(%esp)
  1045f3:	e8 38 f2 ff ff       	call   103830 <set_pdir_base>

	trap_return((void *) &uctx_pool[cur_pid]);
  1045f8:	6b f6 44             	imul   $0x44,%esi,%esi
  1045fb:	81 c6 20 7b df 00    	add    $0xdf7b20,%esi
  104601:	89 34 24             	mov    %esi,(%esp)
  104604:	e8 67 d8 ff ff       	call   101e70 <trap_return>
}
  104609:	83 c4 14             	add    $0x14,%esp
  10460c:	5b                   	pop    %ebx
  10460d:	5e                   	pop    %esi
  10460e:	c3                   	ret    
  10460f:	90                   	nop

00104610 <proc_create>:

unsigned int proc_create(void *elf_addr, unsigned int quota)
{
  104610:	55                   	push   %ebp
  104611:	57                   	push   %edi
  104612:	56                   	push   %esi
  104613:	53                   	push   %ebx
  104614:	e8 02 bd ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  104619:	81 c3 e7 59 00 00    	add    $0x59e7,%ebx
  10461f:	83 ec 0c             	sub    $0xc,%esp
  104622:	8b 6c 24 20          	mov    0x20(%esp),%ebp
	unsigned int pid, id;

  id = get_curid();
  104626:	e8 85 fe ff ff       	call   1044b0 <get_curid>
	pid = thread_spawn((void *) proc_start_user, id, quota);
  10462b:	83 ec 04             	sub    $0x4,%esp
  10462e:	ff 74 24 28          	pushl  0x28(%esp)
  104632:	50                   	push   %eax
  104633:	8d 83 d0 a5 ff ff    	lea    -0x5a30(%ebx),%eax
  104639:	50                   	push   %eax
  10463a:	e8 f1 fe ff ff       	call   104530 <thread_spawn>
  10463f:	89 c7                	mov    %eax,%edi

	elf_load(elf_addr, pid);
  104641:	58                   	pop    %eax
  104642:	5a                   	pop    %edx
  104643:	57                   	push   %edi
  104644:	55                   	push   %ebp

  uctx_pool[pid].es = CPU_GDT_UDATA | 3;
  104645:	6b f7 44             	imul   $0x44,%edi,%esi
	elf_load(elf_addr, pid);
  104648:	e8 3c ea ff ff       	call   103089 <elf_load>
  uctx_pool[pid].es = CPU_GDT_UDATA | 3;
  10464d:	81 c6 20 7b df 00    	add    $0xdf7b20,%esi
  uctx_pool[pid].ds = CPU_GDT_UDATA | 3;
  104653:	b8 23 00 00 00       	mov    $0x23,%eax
  uctx_pool[pid].es = CPU_GDT_UDATA | 3;
  104658:	b9 23 00 00 00       	mov    $0x23,%ecx
  uctx_pool[pid].ds = CPU_GDT_UDATA | 3;
  10465d:	66 89 46 24          	mov    %ax,0x24(%esi)
  uctx_pool[pid].cs = CPU_GDT_UCODE | 3;
  104661:	b8 1b 00 00 00       	mov    $0x1b,%eax
  uctx_pool[pid].es = CPU_GDT_UDATA | 3;
  104666:	66 89 4e 20          	mov    %cx,0x20(%esi)
  uctx_pool[pid].cs = CPU_GDT_UCODE | 3;
  10466a:	66 89 46 34          	mov    %ax,0x34(%esi)
  uctx_pool[pid].ss = CPU_GDT_UDATA | 3;
  10466e:	b8 23 00 00 00       	mov    $0x23,%eax
  uctx_pool[pid].esp = VM_USERHI;
  104673:	c7 46 3c 00 00 00 f0 	movl   $0xf0000000,0x3c(%esi)
  uctx_pool[pid].ss = CPU_GDT_UDATA | 3;
  10467a:	66 89 46 40          	mov    %ax,0x40(%esi)
  uctx_pool[pid].eflags = FL_IF;
  10467e:	c7 46 38 00 02 00 00 	movl   $0x200,0x38(%esi)
  uctx_pool[pid].eip = elf_entry(elf_addr);
  104685:	89 2c 24             	mov    %ebp,(%esp)
  104688:	e8 e2 eb ff ff       	call   10326f <elf_entry>
  10468d:	89 46 30             	mov    %eax,0x30(%esi)

	return pid;
}
  104690:	83 c4 1c             	add    $0x1c,%esp
  104693:	89 f8                	mov    %edi,%eax
  104695:	5b                   	pop    %ebx
  104696:	5e                   	pop    %esi
  104697:	5f                   	pop    %edi
  104698:	5d                   	pop    %ebp
  104699:	c3                   	ret    
  10469a:	66 90                	xchg   %ax,%ax
  10469c:	66 90                	xchg   %ax,%ax
  10469e:	66 90                	xchg   %ax,%ax

001046a0 <syscall_get_arg1>:
  *  - In the following functions, you will have to get the fields from the corresponding user context in uctx_pool.
  *  - The get functions will retrieve a field (corresponding to the argument number) of the regs field in the uctx_pool array.
  */

unsigned int syscall_get_arg1(void)
{
  1046a0:	53                   	push   %ebx
  1046a1:	e8 75 bc ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  1046a6:	81 c3 5a 59 00 00    	add    $0x595a,%ebx
  1046ac:	83 ec 08             	sub    $0x8,%esp
  // TODO
  int curid = get_curid();
  1046af:	e8 fc fd ff ff       	call   1044b0 <get_curid>
  return uctx_pool[curid].regs.eax;
  1046b4:	6b c0 44             	imul   $0x44,%eax,%eax
  1046b7:	81 c0 20 7b df 00    	add    $0xdf7b20,%eax
  1046bd:	8b 40 1c             	mov    0x1c(%eax),%eax
  return 0;
}
  1046c0:	83 c4 08             	add    $0x8,%esp
  1046c3:	5b                   	pop    %ebx
  1046c4:	c3                   	ret    
  1046c5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1046c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001046d0 <syscall_get_arg2>:

unsigned int syscall_get_arg2(void)
{
  1046d0:	53                   	push   %ebx
  1046d1:	e8 45 bc ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  1046d6:	81 c3 2a 59 00 00    	add    $0x592a,%ebx
  1046dc:	83 ec 08             	sub    $0x8,%esp
  // TODO
  int curid = get_curid();
  1046df:	e8 cc fd ff ff       	call   1044b0 <get_curid>
  return uctx_pool[curid].regs.ebx;
  1046e4:	6b c0 44             	imul   $0x44,%eax,%eax
  1046e7:	81 c0 20 7b df 00    	add    $0xdf7b20,%eax
  1046ed:	8b 40 10             	mov    0x10(%eax),%eax
  return 0;
}
  1046f0:	83 c4 08             	add    $0x8,%esp
  1046f3:	5b                   	pop    %ebx
  1046f4:	c3                   	ret    
  1046f5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1046f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104700 <syscall_get_arg3>:

unsigned int syscall_get_arg3(void)
{
  104700:	53                   	push   %ebx
  104701:	e8 15 bc ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  104706:	81 c3 fa 58 00 00    	add    $0x58fa,%ebx
  10470c:	83 ec 08             	sub    $0x8,%esp
  // TODO

  int curid = get_curid();
  10470f:	e8 9c fd ff ff       	call   1044b0 <get_curid>
  return uctx_pool[curid].regs.ecx;
  104714:	6b c0 44             	imul   $0x44,%eax,%eax
  104717:	81 c0 20 7b df 00    	add    $0xdf7b20,%eax
  10471d:	8b 40 18             	mov    0x18(%eax),%eax
  return 0;
}
  104720:	83 c4 08             	add    $0x8,%esp
  104723:	5b                   	pop    %ebx
  104724:	c3                   	ret    
  104725:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  104729:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104730 <syscall_get_arg4>:

unsigned int syscall_get_arg4(void)
{
  104730:	53                   	push   %ebx
  104731:	e8 e5 bb ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  104736:	81 c3 ca 58 00 00    	add    $0x58ca,%ebx
  10473c:	83 ec 08             	sub    $0x8,%esp
  // TODO

  int curid = get_curid();
  10473f:	e8 6c fd ff ff       	call   1044b0 <get_curid>
  return uctx_pool[curid].regs.edx;
  104744:	6b c0 44             	imul   $0x44,%eax,%eax
  104747:	81 c0 20 7b df 00    	add    $0xdf7b20,%eax
  10474d:	8b 40 14             	mov    0x14(%eax),%eax

  return 0;
}
  104750:	83 c4 08             	add    $0x8,%esp
  104753:	5b                   	pop    %ebx
  104754:	c3                   	ret    
  104755:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  104759:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104760 <syscall_get_arg5>:

unsigned int syscall_get_arg5(void)
{
  104760:	53                   	push   %ebx
  104761:	e8 b5 bb ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  104766:	81 c3 9a 58 00 00    	add    $0x589a,%ebx
  10476c:	83 ec 08             	sub    $0x8,%esp
  // TODO

  int curid = get_curid();
  10476f:	e8 3c fd ff ff       	call   1044b0 <get_curid>
  return uctx_pool[curid].regs.esi;
  104774:	6b c0 44             	imul   $0x44,%eax,%eax
  104777:	81 c0 20 7b df 00    	add    $0xdf7b20,%eax
  10477d:	8b 40 04             	mov    0x4(%eax),%eax
  return 0;
}
  104780:	83 c4 08             	add    $0x8,%esp
  104783:	5b                   	pop    %ebx
  104784:	c3                   	ret    
  104785:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  104789:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104790 <syscall_get_arg6>:

unsigned int syscall_get_arg6(void)
{
  104790:	53                   	push   %ebx
  104791:	e8 85 bb ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  104796:	81 c3 6a 58 00 00    	add    $0x586a,%ebx
  10479c:	83 ec 08             	sub    $0x8,%esp
  // TODO

  int curid = get_curid();
  10479f:	e8 0c fd ff ff       	call   1044b0 <get_curid>
  return uctx_pool[curid].regs.edi;
  1047a4:	6b c0 44             	imul   $0x44,%eax,%eax
  1047a7:	81 c0 20 7b df 00    	add    $0xdf7b20,%eax
  1047ad:	8b 00                	mov    (%eax),%eax
  return 0;
}
  1047af:	83 c4 08             	add    $0x8,%esp
  1047b2:	5b                   	pop    %ebx
  1047b3:	c3                   	ret    
  1047b4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1047ba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

001047c0 <syscall_set_errno>:
  *
  *  Hint 1:
  *  - Set the err field of uctx_pool to errno.
  */
void syscall_set_errno(unsigned int errno)
{
  1047c0:	53                   	push   %ebx
  1047c1:	e8 55 bb ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  1047c6:	81 c3 3a 58 00 00    	add    $0x583a,%ebx
  1047cc:	83 ec 08             	sub    $0x8,%esp
  // TODO
  int curid = get_curid();
  1047cf:	e8 dc fc ff ff       	call   1044b0 <get_curid>
  uctx_pool[curid].regs.eax = errno;
  1047d4:	6b c0 44             	imul   $0x44,%eax,%eax
  1047d7:	81 c0 20 7b df 00    	add    $0xdf7b20,%eax
  1047dd:	8b 54 24 10          	mov    0x10(%esp),%edx
  1047e1:	89 50 1c             	mov    %edx,0x1c(%eax)
}
  1047e4:	83 c4 08             	add    $0x8,%esp
  1047e7:	5b                   	pop    %ebx
  1047e8:	c3                   	ret    
  1047e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001047f0 <syscall_set_retval1>:
  *  Hint 2: Here you will be setting the fields of the corresponding user context in uctx_pool.
  *  - The set functions will set a field (corresponding to the argument number) of the regs field in the uctx_pool array.
  */

void syscall_set_retval1(unsigned int retval)
{
  1047f0:	53                   	push   %ebx
  1047f1:	e8 25 bb ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  1047f6:	81 c3 0a 58 00 00    	add    $0x580a,%ebx
  1047fc:	83 ec 08             	sub    $0x8,%esp
  // TODO
  int curid = get_curid();
  1047ff:	e8 ac fc ff ff       	call   1044b0 <get_curid>
  uctx_pool[curid].regs.ebx = retval;
  104804:	6b c0 44             	imul   $0x44,%eax,%eax
  104807:	81 c0 20 7b df 00    	add    $0xdf7b20,%eax
  10480d:	8b 54 24 10          	mov    0x10(%esp),%edx
  104811:	89 50 10             	mov    %edx,0x10(%eax)
}
  104814:	83 c4 08             	add    $0x8,%esp
  104817:	5b                   	pop    %ebx
  104818:	c3                   	ret    
  104819:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00104820 <syscall_set_retval2>:

void syscall_set_retval2(unsigned int retval)
{
  104820:	53                   	push   %ebx
  104821:	e8 f5 ba ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  104826:	81 c3 da 57 00 00    	add    $0x57da,%ebx
  10482c:	83 ec 08             	sub    $0x8,%esp
  // TODO
  int curid = get_curid();
  10482f:	e8 7c fc ff ff       	call   1044b0 <get_curid>
  uctx_pool[curid].regs.ecx = retval;
  104834:	6b c0 44             	imul   $0x44,%eax,%eax
  104837:	81 c0 20 7b df 00    	add    $0xdf7b20,%eax
  10483d:	8b 54 24 10          	mov    0x10(%esp),%edx
  104841:	89 50 18             	mov    %edx,0x18(%eax)
}
  104844:	83 c4 08             	add    $0x8,%esp
  104847:	5b                   	pop    %ebx
  104848:	c3                   	ret    
  104849:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00104850 <syscall_set_retval3>:

void syscall_set_retval3(unsigned int retval)
{
  104850:	53                   	push   %ebx
  104851:	e8 c5 ba ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  104856:	81 c3 aa 57 00 00    	add    $0x57aa,%ebx
  10485c:	83 ec 08             	sub    $0x8,%esp
  // TODO
  int curid = get_curid();
  10485f:	e8 4c fc ff ff       	call   1044b0 <get_curid>
  uctx_pool[curid].regs.edx = retval;
  104864:	6b c0 44             	imul   $0x44,%eax,%eax
  104867:	81 c0 20 7b df 00    	add    $0xdf7b20,%eax
  10486d:	8b 54 24 10          	mov    0x10(%esp),%edx
  104871:	89 50 14             	mov    %edx,0x14(%eax)
}
  104874:	83 c4 08             	add    $0x8,%esp
  104877:	5b                   	pop    %ebx
  104878:	c3                   	ret    
  104879:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00104880 <syscall_set_retval4>:

void syscall_set_retval4(unsigned int retval)
{
  104880:	53                   	push   %ebx
  104881:	e8 95 ba ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  104886:	81 c3 7a 57 00 00    	add    $0x577a,%ebx
  10488c:	83 ec 08             	sub    $0x8,%esp
  // TODO
  int curid = get_curid();
  10488f:	e8 1c fc ff ff       	call   1044b0 <get_curid>
  uctx_pool[curid].regs.esi = retval;
  104894:	6b c0 44             	imul   $0x44,%eax,%eax
  104897:	81 c0 20 7b df 00    	add    $0xdf7b20,%eax
  10489d:	8b 54 24 10          	mov    0x10(%esp),%edx
  1048a1:	89 50 04             	mov    %edx,0x4(%eax)
}
  1048a4:	83 c4 08             	add    $0x8,%esp
  1048a7:	5b                   	pop    %ebx
  1048a8:	c3                   	ret    
  1048a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001048b0 <syscall_set_retval5>:

void syscall_set_retval5(unsigned int retval)
{
  1048b0:	53                   	push   %ebx
  1048b1:	e8 65 ba ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  1048b6:	81 c3 4a 57 00 00    	add    $0x574a,%ebx
  1048bc:	83 ec 08             	sub    $0x8,%esp
  // TODO
  int curid = get_curid();
  1048bf:	e8 ec fb ff ff       	call   1044b0 <get_curid>
  uctx_pool[curid].regs.edi = retval;
  1048c4:	6b c0 44             	imul   $0x44,%eax,%eax
  1048c7:	81 c0 20 7b df 00    	add    $0xdf7b20,%eax
  1048cd:	8b 54 24 10          	mov    0x10(%esp),%edx
  1048d1:	89 10                	mov    %edx,(%eax)
}
  1048d3:	83 c4 08             	add    $0x8,%esp
  1048d6:	5b                   	pop    %ebx
  1048d7:	c3                   	ret    
  1048d8:	66 90                	xchg   %ax,%ax
  1048da:	66 90                	xchg   %ax,%ax
  1048dc:	66 90                	xchg   %ax,%ax
  1048de:	66 90                	xchg   %ax,%ax

001048e0 <sys_puts>:
/**
 * Copies a string from user into buffer and prints it to the screen.
 * This is called by the user level "printf" library as a system call.
 */
void sys_puts(void)
{
  1048e0:	55                   	push   %ebp
  1048e1:	57                   	push   %edi
  1048e2:	56                   	push   %esi
  1048e3:	53                   	push   %ebx
  1048e4:	e8 32 ba ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  1048e9:	81 c3 17 57 00 00    	add    $0x5717,%ebx
  1048ef:	83 ec 1c             	sub    $0x1c,%esp
	unsigned int cur_pid;
	unsigned int str_uva, str_len;
	unsigned int remain, cur_pos, nbytes;


	cur_pid = get_curid();
  1048f2:	e8 b9 fb ff ff       	call   1044b0 <get_curid>
  1048f7:	89 c5                	mov    %eax,%ebp
  1048f9:	89 44 24 04          	mov    %eax,0x4(%esp)
	str_uva = syscall_get_arg2();
  1048fd:	e8 ce fd ff ff       	call   1046d0 <syscall_get_arg2>
  104902:	89 c7                	mov    %eax,%edi
	str_len = syscall_get_arg3();
  104904:	e8 f7 fd ff ff       	call   104700 <syscall_get_arg3>

	if (!(VM_USERLO <= str_uva && str_uva + str_len <= VM_USERHI)) {
  104909:	81 ff ff ff ff 3f    	cmp    $0x3fffffff,%edi
  10490f:	0f 86 ab 00 00 00    	jbe    1049c0 <sys_puts+0xe0>
  104915:	89 c6                	mov    %eax,%esi
  104917:	8d 04 07             	lea    (%edi,%eax,1),%eax
  10491a:	3d 00 00 00 f0       	cmp    $0xf0000000,%eax
  10491f:	0f 87 9b 00 00 00    	ja     1049c0 <sys_puts+0xe0>
  104925:	8d 83 80 74 82 00    	lea    0x827480(%ebx),%eax
  10492b:	c1 e5 0c             	shl    $0xc,%ebp
  10492e:	01 c5                	add    %eax,%ebp
	}

	remain = str_len;
	cur_pos = str_uva;

	while (remain) {
  104930:	85 f6                	test   %esi,%esi
  104932:	89 44 24 0c          	mov    %eax,0xc(%esp)
			      cur_pos, sys_buf[cur_pid], nbytes) != nbytes) {
			syscall_set_errno(E_MEM);
			return;
		}

		sys_buf[cur_pid][nbytes] = '\0';
  104936:	89 6c 24 08          	mov    %ebp,0x8(%esp)
	while (remain) {
  10493a:	75 52                	jne    10498e <sys_puts+0xae>
  10493c:	e9 bb 00 00 00       	jmp    1049fc <sys_puts+0x11c>
  104941:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
		if (pt_copyin(cur_pid,
  104948:	68 ff 0f 00 00       	push   $0xfff
  10494d:	55                   	push   %ebp
  10494e:	57                   	push   %edi
  10494f:	ff 74 24 10          	pushl  0x10(%esp)
  104953:	e8 9f e4 ff ff       	call   102df7 <pt_copyin>
  104958:	83 c4 10             	add    $0x10,%esp
  10495b:	3d ff 0f 00 00       	cmp    $0xfff,%eax
  104960:	75 47                	jne    1049a9 <sys_puts+0xc9>
		sys_buf[cur_pid][nbytes] = '\0';
  104962:	8b 44 24 08          	mov    0x8(%esp),%eax
		KERN_INFO("%s", sys_buf[cur_pid]);
  104966:	83 ec 08             	sub    $0x8,%esp

		remain -= nbytes;
		cur_pos += nbytes;
  104969:	81 c7 ff 0f 00 00    	add    $0xfff,%edi
		sys_buf[cur_pid][nbytes] = '\0';
  10496f:	c6 80 ff 0f 00 00 00 	movb   $0x0,0xfff(%eax)
		KERN_INFO("%s", sys_buf[cur_pid]);
  104976:	8d 83 ae b2 ff ff    	lea    -0x4d52(%ebx),%eax
  10497c:	55                   	push   %ebp
  10497d:	50                   	push   %eax
  10497e:	e8 b0 d6 ff ff       	call   102033 <debug_info>
	while (remain) {
  104983:	83 c4 10             	add    $0x10,%esp
  104986:	81 ee ff 0f 00 00    	sub    $0xfff,%esi
  10498c:	74 6e                	je     1049fc <sys_puts+0x11c>
		if (remain < PAGESIZE - 1)
  10498e:	81 fe fe 0f 00 00    	cmp    $0xffe,%esi
  104994:	77 b2                	ja     104948 <sys_puts+0x68>
		if (pt_copyin(cur_pid,
  104996:	56                   	push   %esi
  104997:	55                   	push   %ebp
  104998:	57                   	push   %edi
  104999:	ff 74 24 10          	pushl  0x10(%esp)
  10499d:	e8 55 e4 ff ff       	call   102df7 <pt_copyin>
  1049a2:	83 c4 10             	add    $0x10,%esp
  1049a5:	39 c6                	cmp    %eax,%esi
  1049a7:	74 2f                	je     1049d8 <sys_puts+0xf8>
			syscall_set_errno(E_MEM);
  1049a9:	83 ec 0c             	sub    $0xc,%esp
  1049ac:	6a 01                	push   $0x1
  1049ae:	e8 0d fe ff ff       	call   1047c0 <syscall_set_errno>
			return;
  1049b3:	83 c4 10             	add    $0x10,%esp
	}

	syscall_set_errno(E_SUCC);
}
  1049b6:	83 c4 1c             	add    $0x1c,%esp
  1049b9:	5b                   	pop    %ebx
  1049ba:	5e                   	pop    %esi
  1049bb:	5f                   	pop    %edi
  1049bc:	5d                   	pop    %ebp
  1049bd:	c3                   	ret    
  1049be:	66 90                	xchg   %ax,%ax
		syscall_set_errno(E_INVAL_ADDR);
  1049c0:	83 ec 0c             	sub    $0xc,%esp
  1049c3:	6a 04                	push   $0x4
  1049c5:	e8 f6 fd ff ff       	call   1047c0 <syscall_set_errno>
		return;
  1049ca:	83 c4 10             	add    $0x10,%esp
}
  1049cd:	83 c4 1c             	add    $0x1c,%esp
  1049d0:	5b                   	pop    %ebx
  1049d1:	5e                   	pop    %esi
  1049d2:	5f                   	pop    %edi
  1049d3:	5d                   	pop    %ebp
  1049d4:	c3                   	ret    
  1049d5:	8d 76 00             	lea    0x0(%esi),%esi
		sys_buf[cur_pid][nbytes] = '\0';
  1049d8:	8b 44 24 04          	mov    0x4(%esp),%eax
		KERN_INFO("%s", sys_buf[cur_pid]);
  1049dc:	83 ec 08             	sub    $0x8,%esp
		sys_buf[cur_pid][nbytes] = '\0';
  1049df:	c1 e0 0c             	shl    $0xc,%eax
  1049e2:	01 c6                	add    %eax,%esi
  1049e4:	8b 44 24 14          	mov    0x14(%esp),%eax
  1049e8:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
		KERN_INFO("%s", sys_buf[cur_pid]);
  1049ec:	8d 83 ae b2 ff ff    	lea    -0x4d52(%ebx),%eax
  1049f2:	55                   	push   %ebp
  1049f3:	50                   	push   %eax
  1049f4:	e8 3a d6 ff ff       	call   102033 <debug_info>
  1049f9:	83 c4 10             	add    $0x10,%esp
	syscall_set_errno(E_SUCC);
  1049fc:	83 ec 0c             	sub    $0xc,%esp
  1049ff:	6a 00                	push   $0x0
  104a01:	e8 ba fd ff ff       	call   1047c0 <syscall_set_errno>
  104a06:	83 c4 10             	add    $0x10,%esp
  104a09:	eb c2                	jmp    1049cd <sys_puts+0xed>
  104a0b:	90                   	nop
  104a0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00104a10 <sys_spawn>:
  *  Hint 2: Set the return values.
  *  - If successful, errno = E_SUCC else E_INVAL_PID
  *  - If successful, retval1 = pid (return value of proc_create) else NUM_IDS
  */
void sys_spawn(void)
{
  104a10:	57                   	push   %edi
  104a11:	56                   	push   %esi
  104a12:	53                   	push   %ebx
  104a13:	e8 03 b9 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  104a18:	81 c3 e8 55 00 00    	add    $0x55e8,%ebx
  // TODO

  //dprintf("start user process \n");
  int exec = syscall_get_arg2(); //_binary___obj_user_fork_fork_start;// _binary___obj_user_pingpong_ding_start;
  104a1e:	e8 ad fc ff ff       	call   1046d0 <syscall_get_arg2>
  104a23:	89 c6                	mov    %eax,%esi
  int quota =  syscall_get_arg3();
  104a25:	e8 d6 fc ff ff       	call   104700 <syscall_get_arg3>

  int elf_id =0;
  uint8_t *id;
  if(exec==1){
  104a2a:	83 fe 01             	cmp    $0x1,%esi
  104a2d:	74 31                	je     104a60 <sys_spawn+0x50>
    id =  _binary___obj_user_pingpong_ping_start;
    elf_id =  proc_create(id, quota);
  //extern uint8_t _binary___obj_user_pingpong_ping_start[];
  }
  else if(exec == 2){
  104a2f:	83 fe 02             	cmp    $0x2,%esi
  104a32:	74 64                	je     104a98 <sys_spawn+0x88>
    id = _binary___obj_user_pingpong_pong_start;
    elf_id = proc_create(id, quota);
  //extern uint8_t _binary___obj_user_pingpong_pong_start[];
  }
  else if(exec == 3){
  104a34:	83 fe 03             	cmp    $0x3,%esi
  104a37:	74 77                	je     104ab0 <sys_spawn+0xa0>
  104a39:	31 ff                	xor    %edi,%edi
    id = _binary___obj_user_pingpong_ding_start;
    elf_id = proc_create(id, quota);
  //extern uint8_t _binary___obj_user_pingpong_ding_start[];
  }
  else if(exec ==4){
  104a3b:	83 fe 04             	cmp    $0x4,%esi
  104a3e:	0f 84 84 00 00 00    	je     104ac8 <sys_spawn+0xb8>



  if(elf_id != NUM_IDS){
    //dprintf("user process is successful. pid=%d \n", elf_id);
    syscall_set_errno(E_SUCC);
  104a44:	83 ec 0c             	sub    $0xc,%esp
  104a47:	6a 00                	push   $0x0
  104a49:	e8 72 fd ff ff       	call   1047c0 <syscall_set_errno>
    syscall_set_retval1(elf_id);
  104a4e:	89 3c 24             	mov    %edi,(%esp)
  104a51:	e8 9a fd ff ff       	call   1047f0 <syscall_set_retval1>
  104a56:	83 c4 10             	add    $0x10,%esp
    //dprintf("user process failed \n");
    syscall_set_errno(E_INVAL_PID);
    syscall_set_retval1(NUM_IDS);
  }

}
  104a59:	5b                   	pop    %ebx
  104a5a:	5e                   	pop    %esi
  104a5b:	5f                   	pop    %edi
  104a5c:	c3                   	ret    
  104a5d:	8d 76 00             	lea    0x0(%esi),%esi
    elf_id =  proc_create(id, quota);
  104a60:	83 ec 08             	sub    $0x8,%esp
  104a63:	50                   	push   %eax
  104a64:	ff b3 c4 ff ff ff    	pushl  -0x3c(%ebx)
  104a6a:	e8 a1 fb ff ff       	call   104610 <proc_create>
  104a6f:	83 c4 10             	add    $0x10,%esp
  if(elf_id != NUM_IDS){
  104a72:	83 f8 40             	cmp    $0x40,%eax
  104a75:	75 69                	jne    104ae0 <sys_spawn+0xd0>
    syscall_set_errno(E_INVAL_PID);
  104a77:	83 ec 0c             	sub    $0xc,%esp
  104a7a:	6a 05                	push   $0x5
  104a7c:	e8 3f fd ff ff       	call   1047c0 <syscall_set_errno>
    syscall_set_retval1(NUM_IDS);
  104a81:	c7 04 24 40 00 00 00 	movl   $0x40,(%esp)
  104a88:	e8 63 fd ff ff       	call   1047f0 <syscall_set_retval1>
  104a8d:	83 c4 10             	add    $0x10,%esp
}
  104a90:	5b                   	pop    %ebx
  104a91:	5e                   	pop    %esi
  104a92:	5f                   	pop    %edi
  104a93:	c3                   	ret    
  104a94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    elf_id = proc_create(id, quota);
  104a98:	83 ec 08             	sub    $0x8,%esp
  104a9b:	50                   	push   %eax
  104a9c:	ff b3 e8 ff ff ff    	pushl  -0x18(%ebx)
  104aa2:	e8 69 fb ff ff       	call   104610 <proc_create>
  104aa7:	83 c4 10             	add    $0x10,%esp
  104aaa:	eb c6                	jmp    104a72 <sys_spawn+0x62>
  104aac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    elf_id = proc_create(id, quota);
  104ab0:	83 ec 08             	sub    $0x8,%esp
  104ab3:	50                   	push   %eax
  104ab4:	ff b3 d4 ff ff ff    	pushl  -0x2c(%ebx)
  104aba:	e8 51 fb ff ff       	call   104610 <proc_create>
  104abf:	83 c4 10             	add    $0x10,%esp
  104ac2:	eb ae                	jmp    104a72 <sys_spawn+0x62>
  104ac4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    elf_id  = proc_create(id, quota);
  104ac8:	83 ec 08             	sub    $0x8,%esp
  104acb:	50                   	push   %eax
  104acc:	ff b3 d0 ff ff ff    	pushl  -0x30(%ebx)
  104ad2:	e8 39 fb ff ff       	call   104610 <proc_create>
  104ad7:	83 c4 10             	add    $0x10,%esp
  104ada:	eb 96                	jmp    104a72 <sys_spawn+0x62>
  104adc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  104ae0:	89 c7                	mov    %eax,%edi
  104ae2:	e9 5d ff ff ff       	jmp    104a44 <sys_spawn+0x34>
  104ae7:	89 f6                	mov    %esi,%esi
  104ae9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104af0 <sys_yield>:
  *  - Simply yield.
  *  Hint 2:
  *  - Do not forget to set the error number as E_SUCC.
  */
void sys_yield(void)
{
  104af0:	53                   	push   %ebx
  104af1:	e8 25 b8 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  104af6:	81 c3 0a 55 00 00    	add    $0x550a,%ebx
  104afc:	83 ec 08             	sub    $0x8,%esp
  // TODO
  thread_yield();
  104aff:	e8 6c fa ff ff       	call   104570 <thread_yield>

  syscall_set_errno(E_SUCC);
  104b04:	83 ec 0c             	sub    $0xc,%esp
  104b07:	6a 00                	push   $0x0
  104b09:	e8 b2 fc ff ff       	call   1047c0 <syscall_set_errno>
}
  104b0e:	83 c4 18             	add    $0x18,%esp
  104b11:	5b                   	pop    %ebx
  104b12:	c3                   	ret    
  104b13:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  104b19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104b20 <sys_fork>:

void sys_fork()
{
  104b20:	f3 c3                	repz ret 
  104b22:	66 90                	xchg   %ax,%ax
  104b24:	66 90                	xchg   %ax,%ax
  104b26:	66 90                	xchg   %ax,%ax
  104b28:	66 90                	xchg   %ax,%ax
  104b2a:	66 90                	xchg   %ax,%ax
  104b2c:	66 90                	xchg   %ax,%ax
  104b2e:	66 90                	xchg   %ax,%ax

00104b30 <syscall_dispatch>:
#include <lib/syscall.h>

#include "import.h"

void syscall_dispatch(void)
{
  104b30:	53                   	push   %ebx
  104b31:	e8 e5 b7 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  104b36:	81 c3 ca 54 00 00    	add    $0x54ca,%ebx
  104b3c:	83 ec 08             	sub    $0x8,%esp
	unsigned int nr;

	nr = syscall_get_arg1();
  104b3f:	e8 5c fb ff ff       	call   1046a0 <syscall_get_arg1>

	switch (nr) {
  104b44:	83 f8 01             	cmp    $0x1,%eax
  104b47:	74 4f                	je     104b98 <syscall_dispatch+0x68>
  104b49:	72 3d                	jb     104b88 <syscall_dispatch+0x58>
  104b4b:	83 f8 02             	cmp    $0x2,%eax
  104b4e:	74 10                	je     104b60 <syscall_dispatch+0x30>
  104b50:	83 f8 03             	cmp    $0x3,%eax
  104b53:	75 1b                	jne    104b70 <syscall_dispatch+0x40>
		 *   None.
		 */
		sys_yield();
		break;
	case SYS_fork:
		sys_fork();
  104b55:	e8 c6 ff ff ff       	call   104b20 <sys_fork>
		break;
	default:
		syscall_set_errno(E_INVAL_CALLNR);
	}
}
  104b5a:	83 c4 08             	add    $0x8,%esp
  104b5d:	5b                   	pop    %ebx
  104b5e:	c3                   	ret    
  104b5f:	90                   	nop
		sys_yield();
  104b60:	e8 8b ff ff ff       	call   104af0 <sys_yield>
}
  104b65:	83 c4 08             	add    $0x8,%esp
  104b68:	5b                   	pop    %ebx
  104b69:	c3                   	ret    
  104b6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		syscall_set_errno(E_INVAL_CALLNR);
  104b70:	83 ec 0c             	sub    $0xc,%esp
  104b73:	6a 03                	push   $0x3
  104b75:	e8 46 fc ff ff       	call   1047c0 <syscall_set_errno>
  104b7a:	83 c4 10             	add    $0x10,%esp
}
  104b7d:	83 c4 08             	add    $0x8,%esp
  104b80:	5b                   	pop    %ebx
  104b81:	c3                   	ret    
  104b82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		sys_puts();
  104b88:	e8 53 fd ff ff       	call   1048e0 <sys_puts>
}
  104b8d:	83 c4 08             	add    $0x8,%esp
  104b90:	5b                   	pop    %ebx
  104b91:	c3                   	ret    
  104b92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		sys_spawn();
  104b98:	e8 73 fe ff ff       	call   104a10 <sys_spawn>
}
  104b9d:	83 c4 08             	add    $0x8,%esp
  104ba0:	5b                   	pop    %ebx
  104ba1:	c3                   	ret    
  104ba2:	66 90                	xchg   %ax,%ax
  104ba4:	66 90                	xchg   %ax,%ax
  104ba6:	66 90                	xchg   %ax,%ax
  104ba8:	66 90                	xchg   %ax,%ax
  104baa:	66 90                	xchg   %ax,%ax
  104bac:	66 90                	xchg   %ax,%ax
  104bae:	66 90                	xchg   %ax,%ax

00104bb0 <default_exception_handler>:
	KERN_DEBUG("\t%08x:\tesp:   \t\t%08x\n", &tf->esp, tf->esp);
	KERN_DEBUG("\t%08x:\tss:    \t\t%08x\n", &tf->ss, tf->ss);
}

void default_exception_handler(void)
{
  104bb0:	55                   	push   %ebp
  104bb1:	57                   	push   %edi
  104bb2:	56                   	push   %esi
  104bb3:	53                   	push   %ebx
  104bb4:	e8 62 b7 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  104bb9:	81 c3 47 54 00 00    	add    $0x5447,%ebx
  104bbf:	83 ec 1c             	sub    $0x1c,%esp
	unsigned int cur_pid;

	cur_pid = get_curid();
  104bc2:	e8 e9 f8 ff ff       	call   1044b0 <get_curid>
  104bc7:	6b e8 44             	imul   $0x44,%eax,%ebp
	trap_dump(&uctx_pool[cur_pid]);
  104bca:	c7 c0 20 7b df 00    	mov    $0xdf7b20,%eax
	KERN_DEBUG("trapframe at %x\n", base);
  104bd0:	8d bb cc bc ff ff    	lea    -0x4334(%ebx),%edi
	trap_dump(&uctx_pool[cur_pid]);
  104bd6:	8d 74 05 00          	lea    0x0(%ebp,%eax,1),%esi
  104bda:	89 44 24 08          	mov    %eax,0x8(%esp)
	KERN_DEBUG("trapframe at %x\n", base);
  104bde:	8d 83 45 bb ff ff    	lea    -0x44bb(%ebx),%eax
  104be4:	56                   	push   %esi
  104be5:	50                   	push   %eax
  104be6:	6a 15                	push   $0x15
  104be8:	57                   	push   %edi
  104be9:	e8 6a d4 ff ff       	call   102058 <debug_normal>
	KERN_DEBUG("\t%08x:\tedi:   \t\t%08x\n", &tf->regs.edi, tf->regs.edi);
  104bee:	58                   	pop    %eax
  104bef:	8d 83 56 bb ff ff    	lea    -0x44aa(%ebx),%eax
  104bf5:	ff 36                	pushl  (%esi)
  104bf7:	56                   	push   %esi
  104bf8:	50                   	push   %eax
  104bf9:	6a 16                	push   $0x16
  104bfb:	57                   	push   %edi
  104bfc:	e8 57 d4 ff ff       	call   102058 <debug_normal>
	KERN_DEBUG("\t%08x:\tesi:   \t\t%08x\n", &tf->regs.esi, tf->regs.esi);
  104c01:	83 c4 14             	add    $0x14,%esp
  104c04:	ff 76 04             	pushl  0x4(%esi)
  104c07:	8b 44 24 18          	mov    0x18(%esp),%eax
  104c0b:	8d 44 05 04          	lea    0x4(%ebp,%eax,1),%eax
  104c0f:	50                   	push   %eax
  104c10:	8d 83 6c bb ff ff    	lea    -0x4494(%ebx),%eax
  104c16:	50                   	push   %eax
  104c17:	6a 17                	push   $0x17
  104c19:	57                   	push   %edi
  104c1a:	e8 39 d4 ff ff       	call   102058 <debug_normal>
	KERN_DEBUG("\t%08x:\tebp:   \t\t%08x\n", &tf->regs.ebp, tf->regs.ebp);
  104c1f:	83 c4 14             	add    $0x14,%esp
  104c22:	ff 76 08             	pushl  0x8(%esi)
  104c25:	8b 44 24 18          	mov    0x18(%esp),%eax
  104c29:	8d 44 05 08          	lea    0x8(%ebp,%eax,1),%eax
  104c2d:	50                   	push   %eax
  104c2e:	8d 83 82 bb ff ff    	lea    -0x447e(%ebx),%eax
  104c34:	50                   	push   %eax
  104c35:	6a 18                	push   $0x18
  104c37:	57                   	push   %edi
  104c38:	e8 1b d4 ff ff       	call   102058 <debug_normal>
	KERN_DEBUG("\t%08x:\tesp:   \t\t%08x\n", &tf->regs.oesp, tf->regs.oesp);
  104c3d:	83 c4 14             	add    $0x14,%esp
  104c40:	ff 76 0c             	pushl  0xc(%esi)
  104c43:	8b 44 24 18          	mov    0x18(%esp),%eax
  104c47:	8d 44 05 0c          	lea    0xc(%ebp,%eax,1),%eax
  104c4b:	50                   	push   %eax
  104c4c:	8d 83 98 bb ff ff    	lea    -0x4468(%ebx),%eax
  104c52:	50                   	push   %eax
  104c53:	89 44 24 24          	mov    %eax,0x24(%esp)
  104c57:	6a 19                	push   $0x19
  104c59:	57                   	push   %edi
  104c5a:	e8 f9 d3 ff ff       	call   102058 <debug_normal>
	KERN_DEBUG("\t%08x:\tebx:   \t\t%08x\n", &tf->regs.ebx, tf->regs.ebx);
  104c5f:	83 c4 14             	add    $0x14,%esp
  104c62:	ff 76 10             	pushl  0x10(%esi)
  104c65:	8b 44 24 18          	mov    0x18(%esp),%eax
  104c69:	8d 54 05 10          	lea    0x10(%ebp,%eax,1),%edx
  104c6d:	52                   	push   %edx
  104c6e:	8d 93 ae bb ff ff    	lea    -0x4452(%ebx),%edx
  104c74:	52                   	push   %edx
  104c75:	6a 1a                	push   $0x1a
  104c77:	57                   	push   %edi
  104c78:	e8 db d3 ff ff       	call   102058 <debug_normal>
	KERN_DEBUG("\t%08x:\tedx:   \t\t%08x\n", &tf->regs.edx, tf->regs.edx);
  104c7d:	83 c4 14             	add    $0x14,%esp
  104c80:	ff 76 14             	pushl  0x14(%esi)
  104c83:	8b 44 24 18          	mov    0x18(%esp),%eax
  104c87:	8d 54 05 14          	lea    0x14(%ebp,%eax,1),%edx
  104c8b:	52                   	push   %edx
  104c8c:	8d 93 c4 bb ff ff    	lea    -0x443c(%ebx),%edx
  104c92:	52                   	push   %edx
  104c93:	6a 1b                	push   $0x1b
  104c95:	57                   	push   %edi
  104c96:	e8 bd d3 ff ff       	call   102058 <debug_normal>
	KERN_DEBUG("\t%08x:\tecx:   \t\t%08x\n", &tf->regs.ecx, tf->regs.ecx);
  104c9b:	83 c4 14             	add    $0x14,%esp
  104c9e:	ff 76 18             	pushl  0x18(%esi)
  104ca1:	8b 44 24 18          	mov    0x18(%esp),%eax
  104ca5:	8d 54 05 18          	lea    0x18(%ebp,%eax,1),%edx
  104ca9:	52                   	push   %edx
  104caa:	8d 93 da bb ff ff    	lea    -0x4426(%ebx),%edx
  104cb0:	52                   	push   %edx
  104cb1:	6a 1c                	push   $0x1c
  104cb3:	57                   	push   %edi
  104cb4:	e8 9f d3 ff ff       	call   102058 <debug_normal>
	KERN_DEBUG("\t%08x:\teax:   \t\t%08x\n", &tf->regs.eax, tf->regs.eax);
  104cb9:	83 c4 14             	add    $0x14,%esp
  104cbc:	ff 76 1c             	pushl  0x1c(%esi)
  104cbf:	8b 44 24 18          	mov    0x18(%esp),%eax
  104cc3:	8d 54 05 1c          	lea    0x1c(%ebp,%eax,1),%edx
  104cc7:	52                   	push   %edx
  104cc8:	8d 93 f0 bb ff ff    	lea    -0x4410(%ebx),%edx
  104cce:	52                   	push   %edx
  104ccf:	6a 1d                	push   $0x1d
  104cd1:	57                   	push   %edi
  104cd2:	e8 81 d3 ff ff       	call   102058 <debug_normal>
	KERN_DEBUG("\t%08x:\tes:    \t\t%08x\n", &tf->es, tf->es);
  104cd7:	0f b7 56 20          	movzwl 0x20(%esi),%edx
  104cdb:	83 c4 14             	add    $0x14,%esp
  104cde:	52                   	push   %edx
  104cdf:	8b 44 24 18          	mov    0x18(%esp),%eax
  104ce3:	8d 54 05 20          	lea    0x20(%ebp,%eax,1),%edx
  104ce7:	52                   	push   %edx
  104ce8:	8d 93 06 bc ff ff    	lea    -0x43fa(%ebx),%edx
  104cee:	52                   	push   %edx
  104cef:	6a 1e                	push   $0x1e
  104cf1:	57                   	push   %edi
  104cf2:	e8 61 d3 ff ff       	call   102058 <debug_normal>
	KERN_DEBUG("\t%08x:\tds:    \t\t%08x\n", &tf->ds, tf->ds);
  104cf7:	0f b7 56 24          	movzwl 0x24(%esi),%edx
  104cfb:	83 c4 14             	add    $0x14,%esp
  104cfe:	52                   	push   %edx
  104cff:	8b 44 24 18          	mov    0x18(%esp),%eax
  104d03:	8d 54 05 24          	lea    0x24(%ebp,%eax,1),%edx
  104d07:	52                   	push   %edx
  104d08:	8d 93 1c bc ff ff    	lea    -0x43e4(%ebx),%edx
  104d0e:	52                   	push   %edx
  104d0f:	6a 1f                	push   $0x1f
  104d11:	57                   	push   %edi
  104d12:	e8 41 d3 ff ff       	call   102058 <debug_normal>
	KERN_DEBUG("\t%08x:\ttrapno:\t\t%08x\n", &tf->trapno, tf->trapno);
  104d17:	83 c4 14             	add    $0x14,%esp
  104d1a:	ff 76 28             	pushl  0x28(%esi)
  104d1d:	8b 44 24 18          	mov    0x18(%esp),%eax
  104d21:	8d 54 05 28          	lea    0x28(%ebp,%eax,1),%edx
  104d25:	52                   	push   %edx
  104d26:	8d 93 32 bc ff ff    	lea    -0x43ce(%ebx),%edx
  104d2c:	52                   	push   %edx
  104d2d:	6a 20                	push   $0x20
  104d2f:	57                   	push   %edi
  104d30:	e8 23 d3 ff ff       	call   102058 <debug_normal>
	KERN_DEBUG("\t%08x:\terr:   \t\t%08x\n", &tf->err, tf->err);
  104d35:	83 c4 14             	add    $0x14,%esp
  104d38:	ff 76 2c             	pushl  0x2c(%esi)
  104d3b:	8b 44 24 18          	mov    0x18(%esp),%eax
  104d3f:	8d 54 05 2c          	lea    0x2c(%ebp,%eax,1),%edx
  104d43:	52                   	push   %edx
  104d44:	8d 93 48 bc ff ff    	lea    -0x43b8(%ebx),%edx
  104d4a:	52                   	push   %edx
  104d4b:	6a 21                	push   $0x21
  104d4d:	57                   	push   %edi
  104d4e:	e8 05 d3 ff ff       	call   102058 <debug_normal>
	KERN_DEBUG("\t%08x:\teip:   \t\t%08x\n", &tf->eip, tf->eip);
  104d53:	83 c4 14             	add    $0x14,%esp
  104d56:	ff 76 30             	pushl  0x30(%esi)
  104d59:	8b 44 24 18          	mov    0x18(%esp),%eax
  104d5d:	8d 54 05 30          	lea    0x30(%ebp,%eax,1),%edx
  104d61:	52                   	push   %edx
  104d62:	8d 93 5e bc ff ff    	lea    -0x43a2(%ebx),%edx
  104d68:	52                   	push   %edx
  104d69:	6a 22                	push   $0x22
  104d6b:	57                   	push   %edi
  104d6c:	e8 e7 d2 ff ff       	call   102058 <debug_normal>
	KERN_DEBUG("\t%08x:\tcs:    \t\t%08x\n", &tf->cs, tf->cs);
  104d71:	0f b7 56 34          	movzwl 0x34(%esi),%edx
  104d75:	83 c4 14             	add    $0x14,%esp
  104d78:	52                   	push   %edx
  104d79:	8b 44 24 18          	mov    0x18(%esp),%eax
  104d7d:	8d 54 05 34          	lea    0x34(%ebp,%eax,1),%edx
  104d81:	52                   	push   %edx
  104d82:	8d 93 74 bc ff ff    	lea    -0x438c(%ebx),%edx
  104d88:	52                   	push   %edx
  104d89:	6a 23                	push   $0x23
  104d8b:	57                   	push   %edi
  104d8c:	e8 c7 d2 ff ff       	call   102058 <debug_normal>
	KERN_DEBUG("\t%08x:\teflags:\t\t%08x\n", &tf->eflags, tf->eflags);
  104d91:	83 c4 14             	add    $0x14,%esp
  104d94:	ff 76 38             	pushl  0x38(%esi)
  104d97:	8b 44 24 18          	mov    0x18(%esp),%eax
  104d9b:	8d 54 05 38          	lea    0x38(%ebp,%eax,1),%edx
  104d9f:	52                   	push   %edx
  104da0:	8d 93 8a bc ff ff    	lea    -0x4376(%ebx),%edx
  104da6:	52                   	push   %edx
  104da7:	6a 24                	push   $0x24
  104da9:	57                   	push   %edi
  104daa:	e8 a9 d2 ff ff       	call   102058 <debug_normal>
	KERN_DEBUG("\t%08x:\tesp:   \t\t%08x\n", &tf->esp, tf->esp);
  104daf:	83 c4 14             	add    $0x14,%esp
  104db2:	ff 76 3c             	pushl  0x3c(%esi)
  104db5:	8b 44 24 18          	mov    0x18(%esp),%eax
  104db9:	8d 54 05 3c          	lea    0x3c(%ebp,%eax,1),%edx
  104dbd:	52                   	push   %edx
  104dbe:	8b 44 24 20          	mov    0x20(%esp),%eax
  104dc2:	50                   	push   %eax
  104dc3:	6a 25                	push   $0x25
  104dc5:	57                   	push   %edi
  104dc6:	e8 8d d2 ff ff       	call   102058 <debug_normal>
	KERN_DEBUG("\t%08x:\tss:    \t\t%08x\n", &tf->ss, tf->ss);
  104dcb:	0f b7 46 40          	movzwl 0x40(%esi),%eax
  104dcf:	83 c4 14             	add    $0x14,%esp
  104dd2:	50                   	push   %eax
  104dd3:	8b 44 24 18          	mov    0x18(%esp),%eax
  104dd7:	8d 44 05 40          	lea    0x40(%ebp,%eax,1),%eax
  104ddb:	50                   	push   %eax
  104ddc:	8d 83 a0 bc ff ff    	lea    -0x4360(%ebx),%eax
  104de2:	50                   	push   %eax
  104de3:	6a 26                	push   $0x26
  104de5:	57                   	push   %edi
  104de6:	e8 6d d2 ff ff       	call   102058 <debug_normal>

	KERN_PANIC("Trap %d @ 0x%08x.\n", uctx_pool[cur_pid].trapno, uctx_pool[cur_pid].eip);
  104deb:	8d 83 b6 bc ff ff    	lea    -0x434a(%ebx),%eax
  104df1:	83 c4 14             	add    $0x14,%esp
  104df4:	ff 76 30             	pushl  0x30(%esi)
  104df7:	ff 76 28             	pushl  0x28(%esi)
  104dfa:	50                   	push   %eax
  104dfb:	6a 30                	push   $0x30
  104dfd:	57                   	push   %edi
  104dfe:	e8 8e d2 ff ff       	call   102091 <debug_panic>
}
  104e03:	83 c4 3c             	add    $0x3c,%esp
  104e06:	5b                   	pop    %ebx
  104e07:	5e                   	pop    %esi
  104e08:	5f                   	pop    %edi
  104e09:	5d                   	pop    %ebp
  104e0a:	c3                   	ret    
  104e0b:	90                   	nop
  104e0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00104e10 <pgflt_handler>:

void pgflt_handler(void)
{
  104e10:	55                   	push   %ebp
  104e11:	57                   	push   %edi
  104e12:	56                   	push   %esi
  104e13:	53                   	push   %ebx
  104e14:	e8 02 b5 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  104e19:	81 c3 e7 51 00 00    	add    $0x51e7,%ebx
  104e1f:	83 ec 0c             	sub    $0xc,%esp
	unsigned int cur_pid;
	unsigned int errno;
	unsigned int fault_va;
	unsigned int pte_entry;

	cur_pid = get_curid();
  104e22:	e8 89 f6 ff ff       	call   1044b0 <get_curid>
  104e27:	89 c7                	mov    %eax,%edi
	errno = uctx_pool[cur_pid].err;
  104e29:	6b c0 44             	imul   $0x44,%eax,%eax
  104e2c:	81 c0 20 7b df 00    	add    $0xdf7b20,%eax
  104e32:	8b 70 2c             	mov    0x2c(%eax),%esi
	fault_va = rcr2();
  104e35:	e8 33 dc ff ff       	call   102a6d <rcr2>
  104e3a:	89 c5                	mov    %eax,%ebp

	if ((errno & 0x3) == 0x3){
  104e3c:	89 f0                	mov    %esi,%eax
  104e3e:	83 e0 03             	and    $0x3,%eax
  104e41:	83 f8 03             	cmp    $0x3,%eax
  104e44:	74 7a                	je     104ec0 <pgflt_handler+0xb0>
	}

  //Uncomment this line if you need to see the information of the sequence of page faults occured.
	//KERN_DEBUG("Page fault: VA 0x%08x, errno 0x%08x, process %d, EIP 0x%08x.\n", fault_va, errno, cur_pid, uctx_pool[cur_pid].eip);

	if (errno & PFE_PR) {
  104e46:	f7 c6 01 00 00 00    	test   $0x1,%esi
  104e4c:	75 22                	jne    104e70 <pgflt_handler+0x60>
		KERN_PANIC("Permission denied: va = 0x%08x, errno = 0x%08x.\n", fault_va, errno);
		return;
	}

	if (alloc_page(cur_pid, fault_va, PTE_W | PTE_U | PTE_P) == MagicNumber)
  104e4e:	83 ec 04             	sub    $0x4,%esp
  104e51:	6a 07                	push   $0x7
  104e53:	55                   	push   %ebp
  104e54:	57                   	push   %edi
  104e55:	e8 16 f0 ff ff       	call   103e70 <alloc_page>
  104e5a:	83 c4 10             	add    $0x10,%esp
  104e5d:	3d 01 00 10 00       	cmp    $0x100001,%eax
  104e62:	74 34                	je     104e98 <pgflt_handler+0x88>
    KERN_PANIC("Page allocation failed: va = 0x%08x, errno = 0x%08x.\n", fault_va, errno);

}
  104e64:	83 c4 0c             	add    $0xc,%esp
  104e67:	5b                   	pop    %ebx
  104e68:	5e                   	pop    %esi
  104e69:	5f                   	pop    %edi
  104e6a:	5d                   	pop    %ebp
  104e6b:	c3                   	ret    
  104e6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		KERN_PANIC("Permission denied: va = 0x%08x, errno = 0x%08x.\n", fault_va, errno);
  104e70:	8d 83 18 bd ff ff    	lea    -0x42e8(%ebx),%eax
  104e76:	83 ec 0c             	sub    $0xc,%esp
  104e79:	56                   	push   %esi
  104e7a:	55                   	push   %ebp
  104e7b:	50                   	push   %eax
  104e7c:	8d 83 cc bc ff ff    	lea    -0x4334(%ebx),%eax
  104e82:	6a 4e                	push   $0x4e
  104e84:	50                   	push   %eax
  104e85:	e8 07 d2 ff ff       	call   102091 <debug_panic>
		return;
  104e8a:	83 c4 20             	add    $0x20,%esp
}
  104e8d:	83 c4 0c             	add    $0xc,%esp
  104e90:	5b                   	pop    %ebx
  104e91:	5e                   	pop    %esi
  104e92:	5f                   	pop    %edi
  104e93:	5d                   	pop    %ebp
  104e94:	c3                   	ret    
  104e95:	8d 76 00             	lea    0x0(%esi),%esi
    KERN_PANIC("Page allocation failed: va = 0x%08x, errno = 0x%08x.\n", fault_va, errno);
  104e98:	8d 83 4c bd ff ff    	lea    -0x42b4(%ebx),%eax
  104e9e:	83 ec 0c             	sub    $0xc,%esp
  104ea1:	56                   	push   %esi
  104ea2:	55                   	push   %ebp
  104ea3:	50                   	push   %eax
  104ea4:	8d 83 cc bc ff ff    	lea    -0x4334(%ebx),%eax
  104eaa:	6a 53                	push   $0x53
  104eac:	50                   	push   %eax
  104ead:	e8 df d1 ff ff       	call   102091 <debug_panic>
  104eb2:	83 c4 20             	add    $0x20,%esp
}
  104eb5:	83 c4 0c             	add    $0xc,%esp
  104eb8:	5b                   	pop    %ebx
  104eb9:	5e                   	pop    %esi
  104eba:	5f                   	pop    %edi
  104ebb:	5d                   	pop    %ebp
  104ebc:	c3                   	ret    
  104ebd:	8d 76 00             	lea    0x0(%esi),%esi
		pte_entry = get_ptbl_entry_by_va(cur_pid, fault_va);
  104ec0:	83 ec 08             	sub    $0x8,%esp
  104ec3:	55                   	push   %ebp
  104ec4:	57                   	push   %edi
  104ec5:	e8 46 eb ff ff       	call   103a10 <get_ptbl_entry_by_va>
		if (pte_entry & PTE_COW){
  104eca:	83 c4 10             	add    $0x10,%esp
  104ecd:	f6 c4 08             	test   $0x8,%ah
  104ed0:	0f 85 70 ff ff ff    	jne    104e46 <pgflt_handler+0x36>
			KERN_PANIC("Writing to read-only page: va = %p\n", fault_va);
  104ed6:	8d 83 f4 bc ff ff    	lea    -0x430c(%ebx),%eax
  104edc:	55                   	push   %ebp
  104edd:	50                   	push   %eax
  104ede:	8d 83 cc bc ff ff    	lea    -0x4334(%ebx),%eax
  104ee4:	6a 46                	push   $0x46
  104ee6:	50                   	push   %eax
  104ee7:	e8 a5 d1 ff ff       	call   102091 <debug_panic>
  104eec:	83 c4 10             	add    $0x10,%esp
  104eef:	e9 52 ff ff ff       	jmp    104e46 <pgflt_handler+0x36>
  104ef4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  104efa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00104f00 <exception_handler>:
  *  Hint 1:
  *  - Retrieve trapno field from the uctx_pool array for the running process (get_curid).
  *  - Call the appropritate handler.
  */
void exception_handler(void)
{
  104f00:	53                   	push   %ebx
  104f01:	e8 15 b4 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  104f06:	81 c3 fa 50 00 00    	add    $0x50fa,%ebx
  104f0c:	83 ec 08             	sub    $0x8,%esp
  // TODO
	int pid = get_curid();
  104f0f:	e8 9c f5 ff ff       	call   1044b0 <get_curid>
	
    int trapno = uctx_pool[pid].trapno;
  104f14:	6b c0 44             	imul   $0x44,%eax,%eax
  104f17:	81 c0 20 7b df 00    	add    $0xdf7b20,%eax

    if(trapno == T_PGFLT){
  104f1d:	83 78 28 0e          	cmpl   $0xe,0x28(%eax)
  104f21:	74 0d                	je     104f30 <exception_handler+0x30>
    }
    else{
    	default_exception_handler();
    }

}
  104f23:	83 c4 08             	add    $0x8,%esp
  104f26:	5b                   	pop    %ebx
    	default_exception_handler();
  104f27:	e9 84 fc ff ff       	jmp    104bb0 <default_exception_handler>
  104f2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
}
  104f30:	83 c4 08             	add    $0x8,%esp
  104f33:	5b                   	pop    %ebx
    	pgflt_handler();
  104f34:	e9 d7 fe ff ff       	jmp    104e10 <pgflt_handler>
  104f39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00104f40 <interrupt_handler>:
  *  - Retrieve trapno field from the uctx_pool array for the running process (get_curid).
  *  Hint 2: Review ern/dev/intr.h
  *  - Hardware IRQ numbers. We receive these as (T_IRQ0 + IRQ_WHATEVER)
  */
void interrupt_handler (void)
{
  104f40:	53                   	push   %ebx
  104f41:	e8 d5 b3 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  104f46:	81 c3 ba 50 00 00    	add    $0x50ba,%ebx
  104f4c:	83 ec 08             	sub    $0x8,%esp
    // TODO

    int pid = get_curid();
  104f4f:	e8 5c f5 ff ff       	call   1044b0 <get_curid>
    int trapno = uctx_pool[pid].trapno;
  104f54:	6b c0 44             	imul   $0x44,%eax,%eax
  104f57:	81 c0 20 7b df 00    	add    $0xdf7b20,%eax

    if(trapno == (T_IRQ0+IRQ_SPURIOUS) ){
  104f5d:	83 78 28 27          	cmpl   $0x27,0x28(%eax)
  104f61:	74 05                	je     104f68 <interrupt_handler+0x28>
    intr_eoi ();
  104f63:	e8 1f c7 ff ff       	call   101687 <intr_eoi>
    }
    else{
    	default_intr_handler();
    }

}
  104f68:	83 c4 08             	add    $0x8,%esp
  104f6b:	5b                   	pop    %ebx
  104f6c:	c3                   	ret    
  104f6d:	8d 76 00             	lea    0x0(%esi),%esi

00104f70 <trap>:

void trap (tf_t *tf)
{
  104f70:	55                   	push   %ebp
  104f71:	57                   	push   %edi
  104f72:	56                   	push   %esi
  104f73:	53                   	push   %ebx
  104f74:	e8 a2 b3 ff ff       	call   10031b <__x86.get_pc_thunk.bx>
  104f79:	81 c3 87 50 00 00    	add    $0x5087,%ebx
  104f7f:	83 ec 0c             	sub    $0xc,%esp
  104f82:	8b 6c 24 20          	mov    0x20(%esp),%ebp
    unsigned int cur_pid;

    cur_pid = get_curid ();
  104f86:	e8 25 f5 ff ff       	call   1044b0 <get_curid>
    uctx_pool[cur_pid] = *tf; //save the current user context (trap frame).
  104f8b:	6b c0 44             	imul   $0x44,%eax,%eax
  104f8e:	81 c0 20 7b df 00    	add    $0xdf7b20,%eax
    set_pdir_base (0); //switch to the kernel's page table.
  104f94:	83 ec 0c             	sub    $0xc,%esp
    uctx_pool[cur_pid] = *tf; //save the current user context (trap frame).
  104f97:	b9 11 00 00 00       	mov    $0x11,%ecx
  104f9c:	89 ee                	mov    %ebp,%esi
  104f9e:	89 c7                	mov    %eax,%edi
  104fa0:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    set_pdir_base (0); //switch to the kernel's page table.
  104fa2:	6a 00                	push   $0x0
  104fa4:	e8 87 e8 ff ff       	call   103830 <set_pdir_base>

    if (T_DIVIDE <= tf->trapno && tf->trapno <= T_SECEV)
  104fa9:	8b 45 28             	mov    0x28(%ebp),%eax
  104fac:	83 c4 10             	add    $0x10,%esp
  104faf:	83 f8 1e             	cmp    $0x1e,%eax
  104fb2:	76 1c                	jbe    104fd0 <trap+0x60>
        exception_handler ();
    else if (T_IRQ0 + IRQ_TIMER <= tf->trapno && tf->trapno <= T_IRQ0 + IRQ_IDE2)
  104fb4:	8d 50 e0             	lea    -0x20(%eax),%edx
  104fb7:	83 fa 0f             	cmp    $0xf,%edx
  104fba:	76 2c                	jbe    104fe8 <trap+0x78>
        interrupt_handler ();
    else if (tf->trapno == T_SYSCALL)
  104fbc:	83 f8 30             	cmp    $0x30,%eax
  104fbf:	74 3f                	je     105000 <trap+0x90>
        syscall_dispatch ();

    proc_start_user (); //trap handled. jump back to the user. This is where you switch the TSS and page structure back.
  104fc1:	e8 0a f6 ff ff       	call   1045d0 <proc_start_user>
}
  104fc6:	83 c4 0c             	add    $0xc,%esp
  104fc9:	5b                   	pop    %ebx
  104fca:	5e                   	pop    %esi
  104fcb:	5f                   	pop    %edi
  104fcc:	5d                   	pop    %ebp
  104fcd:	c3                   	ret    
  104fce:	66 90                	xchg   %ax,%ax
        exception_handler ();
  104fd0:	e8 2b ff ff ff       	call   104f00 <exception_handler>
    proc_start_user (); //trap handled. jump back to the user. This is where you switch the TSS and page structure back.
  104fd5:	e8 f6 f5 ff ff       	call   1045d0 <proc_start_user>
}
  104fda:	83 c4 0c             	add    $0xc,%esp
  104fdd:	5b                   	pop    %ebx
  104fde:	5e                   	pop    %esi
  104fdf:	5f                   	pop    %edi
  104fe0:	5d                   	pop    %ebp
  104fe1:	c3                   	ret    
  104fe2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        interrupt_handler ();
  104fe8:	e8 53 ff ff ff       	call   104f40 <interrupt_handler>
    proc_start_user (); //trap handled. jump back to the user. This is where you switch the TSS and page structure back.
  104fed:	e8 de f5 ff ff       	call   1045d0 <proc_start_user>
}
  104ff2:	83 c4 0c             	add    $0xc,%esp
  104ff5:	5b                   	pop    %ebx
  104ff6:	5e                   	pop    %esi
  104ff7:	5f                   	pop    %edi
  104ff8:	5d                   	pop    %ebp
  104ff9:	c3                   	ret    
  104ffa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        syscall_dispatch ();
  105000:	e8 2b fb ff ff       	call   104b30 <syscall_dispatch>
    proc_start_user (); //trap handled. jump back to the user. This is where you switch the TSS and page structure back.
  105005:	e8 c6 f5 ff ff       	call   1045d0 <proc_start_user>
}
  10500a:	83 c4 0c             	add    $0xc,%esp
  10500d:	5b                   	pop    %ebx
  10500e:	5e                   	pop    %esi
  10500f:	5f                   	pop    %edi
  105010:	5d                   	pop    %ebp
  105011:	c3                   	ret    
  105012:	66 90                	xchg   %ax,%ax
  105014:	66 90                	xchg   %ax,%ax
  105016:	66 90                	xchg   %ax,%ax
  105018:	66 90                	xchg   %ax,%ax
  10501a:	66 90                	xchg   %ax,%ax
  10501c:	66 90                	xchg   %ax,%ax
  10501e:	66 90                	xchg   %ax,%ax

00105020 <__udivdi3>:
  105020:	55                   	push   %ebp
  105021:	57                   	push   %edi
  105022:	56                   	push   %esi
  105023:	53                   	push   %ebx
  105024:	83 ec 1c             	sub    $0x1c,%esp
  105027:	8b 74 24 3c          	mov    0x3c(%esp),%esi
  10502b:	8b 5c 24 30          	mov    0x30(%esp),%ebx
  10502f:	8b 4c 24 34          	mov    0x34(%esp),%ecx
  105033:	8b 7c 24 38          	mov    0x38(%esp),%edi
  105037:	85 f6                	test   %esi,%esi
  105039:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  10503d:	89 ca                	mov    %ecx,%edx
  10503f:	89 f8                	mov    %edi,%eax
  105041:	75 3d                	jne    105080 <__udivdi3+0x60>
  105043:	39 cf                	cmp    %ecx,%edi
  105045:	0f 87 c5 00 00 00    	ja     105110 <__udivdi3+0xf0>
  10504b:	85 ff                	test   %edi,%edi
  10504d:	89 fd                	mov    %edi,%ebp
  10504f:	75 0b                	jne    10505c <__udivdi3+0x3c>
  105051:	b8 01 00 00 00       	mov    $0x1,%eax
  105056:	31 d2                	xor    %edx,%edx
  105058:	f7 f7                	div    %edi
  10505a:	89 c5                	mov    %eax,%ebp
  10505c:	89 c8                	mov    %ecx,%eax
  10505e:	31 d2                	xor    %edx,%edx
  105060:	f7 f5                	div    %ebp
  105062:	89 c1                	mov    %eax,%ecx
  105064:	89 d8                	mov    %ebx,%eax
  105066:	89 cf                	mov    %ecx,%edi
  105068:	f7 f5                	div    %ebp
  10506a:	89 c3                	mov    %eax,%ebx
  10506c:	89 d8                	mov    %ebx,%eax
  10506e:	89 fa                	mov    %edi,%edx
  105070:	83 c4 1c             	add    $0x1c,%esp
  105073:	5b                   	pop    %ebx
  105074:	5e                   	pop    %esi
  105075:	5f                   	pop    %edi
  105076:	5d                   	pop    %ebp
  105077:	c3                   	ret    
  105078:	90                   	nop
  105079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  105080:	39 ce                	cmp    %ecx,%esi
  105082:	77 74                	ja     1050f8 <__udivdi3+0xd8>
  105084:	0f bd fe             	bsr    %esi,%edi
  105087:	83 f7 1f             	xor    $0x1f,%edi
  10508a:	0f 84 98 00 00 00    	je     105128 <__udivdi3+0x108>
  105090:	bb 20 00 00 00       	mov    $0x20,%ebx
  105095:	89 f9                	mov    %edi,%ecx
  105097:	89 c5                	mov    %eax,%ebp
  105099:	29 fb                	sub    %edi,%ebx
  10509b:	d3 e6                	shl    %cl,%esi
  10509d:	89 d9                	mov    %ebx,%ecx
  10509f:	d3 ed                	shr    %cl,%ebp
  1050a1:	89 f9                	mov    %edi,%ecx
  1050a3:	d3 e0                	shl    %cl,%eax
  1050a5:	09 ee                	or     %ebp,%esi
  1050a7:	89 d9                	mov    %ebx,%ecx
  1050a9:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1050ad:	89 d5                	mov    %edx,%ebp
  1050af:	8b 44 24 08          	mov    0x8(%esp),%eax
  1050b3:	d3 ed                	shr    %cl,%ebp
  1050b5:	89 f9                	mov    %edi,%ecx
  1050b7:	d3 e2                	shl    %cl,%edx
  1050b9:	89 d9                	mov    %ebx,%ecx
  1050bb:	d3 e8                	shr    %cl,%eax
  1050bd:	09 c2                	or     %eax,%edx
  1050bf:	89 d0                	mov    %edx,%eax
  1050c1:	89 ea                	mov    %ebp,%edx
  1050c3:	f7 f6                	div    %esi
  1050c5:	89 d5                	mov    %edx,%ebp
  1050c7:	89 c3                	mov    %eax,%ebx
  1050c9:	f7 64 24 0c          	mull   0xc(%esp)
  1050cd:	39 d5                	cmp    %edx,%ebp
  1050cf:	72 10                	jb     1050e1 <__udivdi3+0xc1>
  1050d1:	8b 74 24 08          	mov    0x8(%esp),%esi
  1050d5:	89 f9                	mov    %edi,%ecx
  1050d7:	d3 e6                	shl    %cl,%esi
  1050d9:	39 c6                	cmp    %eax,%esi
  1050db:	73 07                	jae    1050e4 <__udivdi3+0xc4>
  1050dd:	39 d5                	cmp    %edx,%ebp
  1050df:	75 03                	jne    1050e4 <__udivdi3+0xc4>
  1050e1:	83 eb 01             	sub    $0x1,%ebx
  1050e4:	31 ff                	xor    %edi,%edi
  1050e6:	89 d8                	mov    %ebx,%eax
  1050e8:	89 fa                	mov    %edi,%edx
  1050ea:	83 c4 1c             	add    $0x1c,%esp
  1050ed:	5b                   	pop    %ebx
  1050ee:	5e                   	pop    %esi
  1050ef:	5f                   	pop    %edi
  1050f0:	5d                   	pop    %ebp
  1050f1:	c3                   	ret    
  1050f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1050f8:	31 ff                	xor    %edi,%edi
  1050fa:	31 db                	xor    %ebx,%ebx
  1050fc:	89 d8                	mov    %ebx,%eax
  1050fe:	89 fa                	mov    %edi,%edx
  105100:	83 c4 1c             	add    $0x1c,%esp
  105103:	5b                   	pop    %ebx
  105104:	5e                   	pop    %esi
  105105:	5f                   	pop    %edi
  105106:	5d                   	pop    %ebp
  105107:	c3                   	ret    
  105108:	90                   	nop
  105109:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  105110:	89 d8                	mov    %ebx,%eax
  105112:	f7 f7                	div    %edi
  105114:	31 ff                	xor    %edi,%edi
  105116:	89 c3                	mov    %eax,%ebx
  105118:	89 d8                	mov    %ebx,%eax
  10511a:	89 fa                	mov    %edi,%edx
  10511c:	83 c4 1c             	add    $0x1c,%esp
  10511f:	5b                   	pop    %ebx
  105120:	5e                   	pop    %esi
  105121:	5f                   	pop    %edi
  105122:	5d                   	pop    %ebp
  105123:	c3                   	ret    
  105124:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  105128:	39 ce                	cmp    %ecx,%esi
  10512a:	72 0c                	jb     105138 <__udivdi3+0x118>
  10512c:	31 db                	xor    %ebx,%ebx
  10512e:	3b 44 24 08          	cmp    0x8(%esp),%eax
  105132:	0f 87 34 ff ff ff    	ja     10506c <__udivdi3+0x4c>
  105138:	bb 01 00 00 00       	mov    $0x1,%ebx
  10513d:	e9 2a ff ff ff       	jmp    10506c <__udivdi3+0x4c>
  105142:	66 90                	xchg   %ax,%ax
  105144:	66 90                	xchg   %ax,%ax
  105146:	66 90                	xchg   %ax,%ax
  105148:	66 90                	xchg   %ax,%ax
  10514a:	66 90                	xchg   %ax,%ax
  10514c:	66 90                	xchg   %ax,%ax
  10514e:	66 90                	xchg   %ax,%ax

00105150 <__umoddi3>:
  105150:	55                   	push   %ebp
  105151:	57                   	push   %edi
  105152:	56                   	push   %esi
  105153:	53                   	push   %ebx
  105154:	83 ec 1c             	sub    $0x1c,%esp
  105157:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  10515b:	8b 4c 24 30          	mov    0x30(%esp),%ecx
  10515f:	8b 74 24 34          	mov    0x34(%esp),%esi
  105163:	8b 7c 24 38          	mov    0x38(%esp),%edi
  105167:	85 c0                	test   %eax,%eax
  105169:	89 44 24 0c          	mov    %eax,0xc(%esp)
  10516d:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  105171:	89 3c 24             	mov    %edi,(%esp)
  105174:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  105178:	89 f2                	mov    %esi,%edx
  10517a:	75 14                	jne    105190 <__umoddi3+0x40>
  10517c:	39 f7                	cmp    %esi,%edi
  10517e:	76 40                	jbe    1051c0 <__umoddi3+0x70>
  105180:	89 c8                	mov    %ecx,%eax
  105182:	f7 f7                	div    %edi
  105184:	89 d0                	mov    %edx,%eax
  105186:	31 d2                	xor    %edx,%edx
  105188:	83 c4 1c             	add    $0x1c,%esp
  10518b:	5b                   	pop    %ebx
  10518c:	5e                   	pop    %esi
  10518d:	5f                   	pop    %edi
  10518e:	5d                   	pop    %ebp
  10518f:	c3                   	ret    
  105190:	39 f0                	cmp    %esi,%eax
  105192:	89 f3                	mov    %esi,%ebx
  105194:	77 4a                	ja     1051e0 <__umoddi3+0x90>
  105196:	0f bd e8             	bsr    %eax,%ebp
  105199:	83 f5 1f             	xor    $0x1f,%ebp
  10519c:	75 52                	jne    1051f0 <__umoddi3+0xa0>
  10519e:	39 f0                	cmp    %esi,%eax
  1051a0:	0f 82 da 00 00 00    	jb     105280 <__umoddi3+0x130>
  1051a6:	39 0c 24             	cmp    %ecx,(%esp)
  1051a9:	0f 86 d1 00 00 00    	jbe    105280 <__umoddi3+0x130>
  1051af:	8b 44 24 04          	mov    0x4(%esp),%eax
  1051b3:	83 c4 1c             	add    $0x1c,%esp
  1051b6:	5b                   	pop    %ebx
  1051b7:	5e                   	pop    %esi
  1051b8:	5f                   	pop    %edi
  1051b9:	5d                   	pop    %ebp
  1051ba:	c3                   	ret    
  1051bb:	90                   	nop
  1051bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1051c0:	85 ff                	test   %edi,%edi
  1051c2:	89 fd                	mov    %edi,%ebp
  1051c4:	75 0b                	jne    1051d1 <__umoddi3+0x81>
  1051c6:	b8 01 00 00 00       	mov    $0x1,%eax
  1051cb:	31 d2                	xor    %edx,%edx
  1051cd:	f7 f7                	div    %edi
  1051cf:	89 c5                	mov    %eax,%ebp
  1051d1:	89 f0                	mov    %esi,%eax
  1051d3:	31 d2                	xor    %edx,%edx
  1051d5:	f7 f5                	div    %ebp
  1051d7:	89 c8                	mov    %ecx,%eax
  1051d9:	f7 f5                	div    %ebp
  1051db:	eb a7                	jmp    105184 <__umoddi3+0x34>
  1051dd:	8d 76 00             	lea    0x0(%esi),%esi
  1051e0:	89 c8                	mov    %ecx,%eax
  1051e2:	89 f2                	mov    %esi,%edx
  1051e4:	83 c4 1c             	add    $0x1c,%esp
  1051e7:	5b                   	pop    %ebx
  1051e8:	5e                   	pop    %esi
  1051e9:	5f                   	pop    %edi
  1051ea:	5d                   	pop    %ebp
  1051eb:	c3                   	ret    
  1051ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1051f0:	8b 34 24             	mov    (%esp),%esi
  1051f3:	bf 20 00 00 00       	mov    $0x20,%edi
  1051f8:	89 e9                	mov    %ebp,%ecx
  1051fa:	29 ef                	sub    %ebp,%edi
  1051fc:	d3 e0                	shl    %cl,%eax
  1051fe:	89 f9                	mov    %edi,%ecx
  105200:	89 f2                	mov    %esi,%edx
  105202:	d3 ea                	shr    %cl,%edx
  105204:	89 e9                	mov    %ebp,%ecx
  105206:	09 c2                	or     %eax,%edx
  105208:	89 d8                	mov    %ebx,%eax
  10520a:	89 14 24             	mov    %edx,(%esp)
  10520d:	89 f2                	mov    %esi,%edx
  10520f:	d3 e2                	shl    %cl,%edx
  105211:	89 f9                	mov    %edi,%ecx
  105213:	89 54 24 04          	mov    %edx,0x4(%esp)
  105217:	8b 54 24 08          	mov    0x8(%esp),%edx
  10521b:	d3 e8                	shr    %cl,%eax
  10521d:	89 e9                	mov    %ebp,%ecx
  10521f:	89 c6                	mov    %eax,%esi
  105221:	d3 e3                	shl    %cl,%ebx
  105223:	89 f9                	mov    %edi,%ecx
  105225:	89 d0                	mov    %edx,%eax
  105227:	d3 e8                	shr    %cl,%eax
  105229:	89 e9                	mov    %ebp,%ecx
  10522b:	09 d8                	or     %ebx,%eax
  10522d:	89 d3                	mov    %edx,%ebx
  10522f:	89 f2                	mov    %esi,%edx
  105231:	f7 34 24             	divl   (%esp)
  105234:	89 d6                	mov    %edx,%esi
  105236:	d3 e3                	shl    %cl,%ebx
  105238:	f7 64 24 04          	mull   0x4(%esp)
  10523c:	39 d6                	cmp    %edx,%esi
  10523e:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  105242:	89 d1                	mov    %edx,%ecx
  105244:	89 c3                	mov    %eax,%ebx
  105246:	72 08                	jb     105250 <__umoddi3+0x100>
  105248:	75 11                	jne    10525b <__umoddi3+0x10b>
  10524a:	39 44 24 08          	cmp    %eax,0x8(%esp)
  10524e:	73 0b                	jae    10525b <__umoddi3+0x10b>
  105250:	2b 44 24 04          	sub    0x4(%esp),%eax
  105254:	1b 14 24             	sbb    (%esp),%edx
  105257:	89 d1                	mov    %edx,%ecx
  105259:	89 c3                	mov    %eax,%ebx
  10525b:	8b 54 24 08          	mov    0x8(%esp),%edx
  10525f:	29 da                	sub    %ebx,%edx
  105261:	19 ce                	sbb    %ecx,%esi
  105263:	89 f9                	mov    %edi,%ecx
  105265:	89 f0                	mov    %esi,%eax
  105267:	d3 e0                	shl    %cl,%eax
  105269:	89 e9                	mov    %ebp,%ecx
  10526b:	d3 ea                	shr    %cl,%edx
  10526d:	89 e9                	mov    %ebp,%ecx
  10526f:	d3 ee                	shr    %cl,%esi
  105271:	09 d0                	or     %edx,%eax
  105273:	89 f2                	mov    %esi,%edx
  105275:	83 c4 1c             	add    $0x1c,%esp
  105278:	5b                   	pop    %ebx
  105279:	5e                   	pop    %esi
  10527a:	5f                   	pop    %edi
  10527b:	5d                   	pop    %ebp
  10527c:	c3                   	ret    
  10527d:	8d 76 00             	lea    0x0(%esi),%esi
  105280:	89 f2                	mov    %esi,%edx
  105282:	29 f9                	sub    %edi,%ecx
  105284:	1b 54 24 0c          	sbb    0xc(%esp),%edx
  105288:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  10528c:	e9 1e ff ff ff       	jmp    1051af <__umoddi3+0x5f>
