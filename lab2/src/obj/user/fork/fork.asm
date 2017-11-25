
obj/user/fork/fork:     file format elf32-i386


Disassembly of section .text:

40000000 <_start>:
_start:
	/*
	 * If there are arguments on the stack, then the current stack will not
	 * be aligned to a nice big power-of-two boundary/
	 */
	testl	$0x0fffffff, %esp
40000000:	f7 c4 ff ff ff 0f    	test   $0xfffffff,%esp
	jnz	args_exist
40000006:	75 04                	jne    4000000c <args_exist>

40000008 <noargs>:

noargs:
	/* If no arguments are on the stack, push two dummy zero. */
	pushl	$0
40000008:	6a 00                	push   $0x0
	pushl	$0
4000000a:	6a 00                	push   $0x0

4000000c <args_exist>:

args_exist:
	/* Jump to the C part. */
	call	main
4000000c:	e8 c3 0b 00 00       	call   40000bd4 <main>

	/* When returning, push the return value on the stack. */
	pushl	%eax
40000011:	50                   	push   %eax

40000012 <spin>:
spin:
	/*
	 * TODO: replace yield with exit
	 */
	call	yield
40000012:	e8 e1 07 00 00       	call   400007f8 <yield>
	jmp	spin
40000017:	eb f9                	jmp    40000012 <spin>

40000019 <debug>:
#include <stdarg.h>
#include <stdio.h>

void
debug(const char *file, int line, const char *fmt, ...)
{
40000019:	53                   	push   %ebx
4000001a:	83 ec 0c             	sub    $0xc,%esp
4000001d:	e8 a7 00 00 00       	call   400000c9 <__x86.get_pc_thunk.bx>
40000022:	81 c3 de 2f 00 00    	add    $0x2fde,%ebx
	va_list ap;
	va_start(ap, fmt);
	printf("[D] %s:%d: ", file, line);
40000028:	ff 74 24 18          	pushl  0x18(%esp)
4000002c:	ff 74 24 18          	pushl  0x18(%esp)
40000030:	8d 83 04 df ff ff    	lea    -0x20fc(%ebx),%eax
40000036:	50                   	push   %eax
40000037:	e8 b6 01 00 00       	call   400001f2 <printf>
	vcprintf(fmt, ap);
4000003c:	83 c4 08             	add    $0x8,%esp
4000003f:	8d 44 24 24          	lea    0x24(%esp),%eax
40000043:	50                   	push   %eax
40000044:	ff 74 24 24          	pushl  0x24(%esp)
40000048:	e8 44 01 00 00       	call   40000191 <vcprintf>
	va_end(ap);
}
4000004d:	83 c4 18             	add    $0x18,%esp
40000050:	5b                   	pop    %ebx
40000051:	c3                   	ret    

40000052 <warn>:

void
warn(const char *file, int line, const char *fmt, ...)
{
40000052:	53                   	push   %ebx
40000053:	83 ec 0c             	sub    $0xc,%esp
40000056:	e8 6e 00 00 00       	call   400000c9 <__x86.get_pc_thunk.bx>
4000005b:	81 c3 a5 2f 00 00    	add    $0x2fa5,%ebx
	va_list ap;
	va_start(ap, fmt);
	printf("[W] %s:%d: ", file, line);
40000061:	ff 74 24 18          	pushl  0x18(%esp)
40000065:	ff 74 24 18          	pushl  0x18(%esp)
40000069:	8d 83 10 df ff ff    	lea    -0x20f0(%ebx),%eax
4000006f:	50                   	push   %eax
40000070:	e8 7d 01 00 00       	call   400001f2 <printf>
	vcprintf(fmt, ap);
40000075:	83 c4 08             	add    $0x8,%esp
40000078:	8d 44 24 24          	lea    0x24(%esp),%eax
4000007c:	50                   	push   %eax
4000007d:	ff 74 24 24          	pushl  0x24(%esp)
40000081:	e8 0b 01 00 00       	call   40000191 <vcprintf>
	va_end(ap);
}
40000086:	83 c4 18             	add    $0x18,%esp
40000089:	5b                   	pop    %ebx
4000008a:	c3                   	ret    

4000008b <panic>:

void
panic(const char *file, int line, const char *fmt, ...)
{
4000008b:	53                   	push   %ebx
4000008c:	83 ec 0c             	sub    $0xc,%esp
4000008f:	e8 35 00 00 00       	call   400000c9 <__x86.get_pc_thunk.bx>
40000094:	81 c3 6c 2f 00 00    	add    $0x2f6c,%ebx
	va_list ap;
	va_start(ap, fmt);
	printf("[P] %s:%d: ", file, line);
4000009a:	ff 74 24 18          	pushl  0x18(%esp)
4000009e:	ff 74 24 18          	pushl  0x18(%esp)
400000a2:	8d 83 1c df ff ff    	lea    -0x20e4(%ebx),%eax
400000a8:	50                   	push   %eax
400000a9:	e8 44 01 00 00       	call   400001f2 <printf>
	vcprintf(fmt, ap);
400000ae:	83 c4 08             	add    $0x8,%esp
400000b1:	8d 44 24 24          	lea    0x24(%esp),%eax
400000b5:	50                   	push   %eax
400000b6:	ff 74 24 24          	pushl  0x24(%esp)
400000ba:	e8 d2 00 00 00       	call   40000191 <vcprintf>
400000bf:	83 c4 10             	add    $0x10,%esp
	va_end(ap);

	while (1)
		yield();
400000c2:	e8 31 07 00 00       	call   400007f8 <yield>
400000c7:	eb f9                	jmp    400000c2 <panic+0x37>

400000c9 <__x86.get_pc_thunk.bx>:
400000c9:	8b 1c 24             	mov    (%esp),%ebx
400000cc:	c3                   	ret    

400000cd <atoi>:
#include <stdlib.h>

int
atoi(const char *buf, int *i)
{
400000cd:	55                   	push   %ebp
400000ce:	57                   	push   %edi
400000cf:	56                   	push   %esi
400000d0:	53                   	push   %ebx
400000d1:	83 ec 04             	sub    $0x4,%esp
400000d4:	8b 44 24 18          	mov    0x18(%esp),%eax
400000d8:	89 04 24             	mov    %eax,(%esp)
	int loc = 0;
	int numstart = 0;
	int acc = 0;
	int negative = 0;
	if (buf[loc] == '+')
400000db:	0f b6 00             	movzbl (%eax),%eax
400000de:	3c 2b                	cmp    $0x2b,%al
400000e0:	74 17                	je     400000f9 <atoi+0x2c>
		loc++;
	else if (buf[loc] == '-') {
400000e2:	3c 2d                	cmp    $0x2d,%al
400000e4:	74 1f                	je     40000105 <atoi+0x38>
	int negative = 0;
400000e6:	bf 00 00 00 00       	mov    $0x0,%edi
	int loc = 0;
400000eb:	be 00 00 00 00       	mov    $0x0,%esi
		negative = 1;
		loc++;
	}
	numstart = loc;
	// no grab the numbers
	while ('0' <= buf[loc] && buf[loc] <= '9') {
400000f0:	89 f0                	mov    %esi,%eax
	int acc = 0;
400000f2:	b9 00 00 00 00       	mov    $0x0,%ecx
	while ('0' <= buf[loc] && buf[loc] <= '9') {
400000f7:	eb 29                	jmp    40000122 <atoi+0x55>
	int negative = 0;
400000f9:	bf 00 00 00 00       	mov    $0x0,%edi
		loc++;
400000fe:	be 01 00 00 00       	mov    $0x1,%esi
40000103:	eb eb                	jmp    400000f0 <atoi+0x23>
		negative = 1;
40000105:	bf 01 00 00 00       	mov    $0x1,%edi
		loc++;
4000010a:	be 01 00 00 00       	mov    $0x1,%esi
4000010f:	eb df                	jmp    400000f0 <atoi+0x23>
		acc = acc*10 + (buf[loc]-'0');
40000111:	8d 2c 89             	lea    (%ecx,%ecx,4),%ebp
40000114:	8d 4c 2d 00          	lea    0x0(%ebp,%ebp,1),%ecx
40000118:	0f be d2             	movsbl %dl,%edx
4000011b:	8d 4c 0a d0          	lea    -0x30(%edx,%ecx,1),%ecx
		loc++;
4000011f:	83 c0 01             	add    $0x1,%eax
	while ('0' <= buf[loc] && buf[loc] <= '9') {
40000122:	8b 1c 24             	mov    (%esp),%ebx
40000125:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
40000129:	8d 6a d0             	lea    -0x30(%edx),%ebp
4000012c:	89 eb                	mov    %ebp,%ebx
4000012e:	80 fb 09             	cmp    $0x9,%bl
40000131:	76 de                	jbe    40000111 <atoi+0x44>
	}
	if (numstart == loc) {
40000133:	39 c6                	cmp    %eax,%esi
40000135:	74 14                	je     4000014b <atoi+0x7e>
		// no numbers have actually been scanned
		return 0;
	}
	if (negative)
40000137:	85 ff                	test   %edi,%edi
40000139:	74 02                	je     4000013d <atoi+0x70>
		acc = - acc;
4000013b:	f7 d9                	neg    %ecx
	*i = acc;
4000013d:	8b 54 24 1c          	mov    0x1c(%esp),%edx
40000141:	89 0a                	mov    %ecx,(%edx)
	return loc;
}
40000143:	83 c4 04             	add    $0x4,%esp
40000146:	5b                   	pop    %ebx
40000147:	5e                   	pop    %esi
40000148:	5f                   	pop    %edi
40000149:	5d                   	pop    %ebp
4000014a:	c3                   	ret    
		return 0;
4000014b:	b8 00 00 00 00       	mov    $0x0,%eax
40000150:	eb f1                	jmp    40000143 <atoi+0x76>

40000152 <putch>:
	char buf[MAX_BUF];
};

static void
putch(int ch, struct printbuf *b)
{
40000152:	53                   	push   %ebx
40000153:	8b 54 24 0c          	mov    0xc(%esp),%edx
	b->buf[b->idx++] = ch;
40000157:	8b 02                	mov    (%edx),%eax
40000159:	8d 48 01             	lea    0x1(%eax),%ecx
4000015c:	89 0a                	mov    %ecx,(%edx)
4000015e:	0f b6 5c 24 08       	movzbl 0x8(%esp),%ebx
40000163:	88 5c 02 08          	mov    %bl,0x8(%edx,%eax,1)
	if (b->idx == MAX_BUF-1) {
40000167:	81 f9 ff 0f 00 00    	cmp    $0xfff,%ecx
4000016d:	74 0b                	je     4000017a <putch+0x28>
		b->buf[b->idx] = 0;
		puts(b->buf, b->idx);
		b->idx = 0;
	}
	b->cnt++;
4000016f:	8b 42 04             	mov    0x4(%edx),%eax
40000172:	83 c0 01             	add    $0x1,%eax
40000175:	89 42 04             	mov    %eax,0x4(%edx)
}
40000178:	5b                   	pop    %ebx
40000179:	c3                   	ret    
		b->buf[b->idx] = 0;
4000017a:	c6 44 02 09 00       	movb   $0x0,0x9(%edx,%eax,1)
		puts(b->buf, b->idx);
4000017f:	8d 5a 08             	lea    0x8(%edx),%ebx


static gcc_inline void
sys_puts(const char *s, size_t len)
{
	asm volatile("int %0" :
40000182:	b8 00 00 00 00       	mov    $0x0,%eax
40000187:	cd 30                	int    $0x30
		b->idx = 0;
40000189:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
4000018f:	eb de                	jmp    4000016f <putch+0x1d>

40000191 <vcprintf>:

int
vcprintf(const char *fmt, va_list ap)
{
40000191:	53                   	push   %ebx
40000192:	81 ec 18 10 00 00    	sub    $0x1018,%esp
40000198:	e8 2c ff ff ff       	call   400000c9 <__x86.get_pc_thunk.bx>
4000019d:	81 c3 63 2e 00 00    	add    $0x2e63,%ebx
	struct printbuf b;

	b.idx = 0;
400001a3:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
400001aa:	00 
	b.cnt = 0;
400001ab:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
400001b2:	00 
	vprintfmt((void*)putch, &b, fmt, ap);
400001b3:	ff b4 24 24 10 00 00 	pushl  0x1024(%esp)
400001ba:	ff b4 24 24 10 00 00 	pushl  0x1024(%esp)
400001c1:	8d 44 24 10          	lea    0x10(%esp),%eax
400001c5:	50                   	push   %eax
400001c6:	8d 83 52 d1 ff ff    	lea    -0x2eae(%ebx),%eax
400001cc:	50                   	push   %eax
400001cd:	e8 8b 01 00 00       	call   4000035d <vprintfmt>

	b.buf[b.idx] = 0;
400001d2:	8b 4c 24 18          	mov    0x18(%esp),%ecx
400001d6:	c6 44 0c 20 00       	movb   $0x0,0x20(%esp,%ecx,1)
400001db:	8d 5c 24 20          	lea    0x20(%esp),%ebx
400001df:	b8 00 00 00 00       	mov    $0x0,%eax
400001e4:	cd 30                	int    $0x30
	puts(b.buf, b.idx);

	return b.cnt;
}
400001e6:	8b 44 24 1c          	mov    0x1c(%esp),%eax
400001ea:	81 c4 28 10 00 00    	add    $0x1028,%esp
400001f0:	5b                   	pop    %ebx
400001f1:	c3                   	ret    

400001f2 <printf>:

int
printf(const char *fmt, ...)
{
400001f2:	83 ec 14             	sub    $0x14,%esp
	va_list ap;
	int cnt;

	va_start(ap, fmt);
	cnt = vcprintf(fmt, ap);
400001f5:	8d 44 24 1c          	lea    0x1c(%esp),%eax
400001f9:	50                   	push   %eax
400001fa:	ff 74 24 1c          	pushl  0x1c(%esp)
400001fe:	e8 8e ff ff ff       	call   40000191 <vcprintf>
	va_end(ap);

	return cnt;
}
40000203:	83 c4 1c             	add    $0x1c,%esp
40000206:	c3                   	ret    

40000207 <printnum>:
 * using specified putch function and associated pointer putdat.
 */
static void
printnum(void (*putch)(int, void*), void *putdat,
	 unsigned long long num, unsigned base, int width, int padc)
{
40000207:	55                   	push   %ebp
40000208:	57                   	push   %edi
40000209:	56                   	push   %esi
4000020a:	53                   	push   %ebx
4000020b:	83 ec 2c             	sub    $0x2c,%esp
4000020e:	e8 c2 05 00 00       	call   400007d5 <__x86.get_pc_thunk.cx>
40000213:	81 c1 ed 2d 00 00    	add    $0x2ded,%ecx
40000219:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
4000021d:	89 c6                	mov    %eax,%esi
4000021f:	89 d7                	mov    %edx,%edi
40000221:	8b 44 24 40          	mov    0x40(%esp),%eax
40000225:	8b 54 24 44          	mov    0x44(%esp),%edx
40000229:	89 44 24 18          	mov    %eax,0x18(%esp)
4000022d:	89 54 24 1c          	mov    %edx,0x1c(%esp)
40000231:	8b 6c 24 50          	mov    0x50(%esp),%ebp
	// first recursively print all preceding (more significant) digits
	if (num >= base) {
40000235:	8b 4c 24 48          	mov    0x48(%esp),%ecx
40000239:	bb 00 00 00 00       	mov    $0x0,%ebx
4000023e:	89 4c 24 10          	mov    %ecx,0x10(%esp)
40000242:	89 5c 24 14          	mov    %ebx,0x14(%esp)
40000246:	39 d3                	cmp    %edx,%ebx
40000248:	72 0a                	jb     40000254 <printnum+0x4d>
4000024a:	39 44 24 48          	cmp    %eax,0x48(%esp)
4000024e:	0f 87 82 00 00 00    	ja     400002d6 <printnum+0xcf>
		printnum(putch, putdat, num / base, base, width - 1, padc);
40000254:	83 ec 0c             	sub    $0xc,%esp
40000257:	55                   	push   %ebp
40000258:	8b 44 24 5c          	mov    0x5c(%esp),%eax
4000025c:	8d 58 ff             	lea    -0x1(%eax),%ebx
4000025f:	53                   	push   %ebx
40000260:	ff 74 24 5c          	pushl  0x5c(%esp)
40000264:	83 ec 08             	sub    $0x8,%esp
40000267:	ff 74 24 34          	pushl  0x34(%esp)
4000026b:	ff 74 24 34          	pushl  0x34(%esp)
4000026f:	ff 74 24 44          	pushl  0x44(%esp)
40000273:	ff 74 24 44          	pushl  0x44(%esp)
40000277:	8b 5c 24 3c          	mov    0x3c(%esp),%ebx
4000027b:	e8 10 0a 00 00       	call   40000c90 <__udivdi3>
40000280:	83 c4 18             	add    $0x18,%esp
40000283:	52                   	push   %edx
40000284:	50                   	push   %eax
40000285:	89 fa                	mov    %edi,%edx
40000287:	89 f0                	mov    %esi,%eax
40000289:	e8 79 ff ff ff       	call   40000207 <printnum>
4000028e:	83 c4 20             	add    $0x20,%esp
40000291:	eb 11                	jmp    400002a4 <printnum+0x9d>
	} else {
		// print any needed pad characters before first digit
		while (--width > 0)
			putch(padc, putdat);
40000293:	83 ec 08             	sub    $0x8,%esp
40000296:	57                   	push   %edi
40000297:	55                   	push   %ebp
40000298:	ff d6                	call   *%esi
4000029a:	83 c4 10             	add    $0x10,%esp
		while (--width > 0)
4000029d:	83 eb 01             	sub    $0x1,%ebx
400002a0:	85 db                	test   %ebx,%ebx
400002a2:	7f ef                	jg     40000293 <printnum+0x8c>
	}

	// then print this (the least significant) digit
	putch("0123456789abcdef"[num % base], putdat);
400002a4:	ff 74 24 14          	pushl  0x14(%esp)
400002a8:	ff 74 24 14          	pushl  0x14(%esp)
400002ac:	ff 74 24 24          	pushl  0x24(%esp)
400002b0:	ff 74 24 24          	pushl  0x24(%esp)
400002b4:	8b 6c 24 1c          	mov    0x1c(%esp),%ebp
400002b8:	89 eb                	mov    %ebp,%ebx
400002ba:	e8 01 0b 00 00       	call   40000dc0 <__umoddi3>
400002bf:	83 c4 08             	add    $0x8,%esp
400002c2:	57                   	push   %edi
400002c3:	0f be 84 05 28 df ff 	movsbl -0x20d8(%ebp,%eax,1),%eax
400002ca:	ff 
400002cb:	50                   	push   %eax
400002cc:	ff d6                	call   *%esi
}
400002ce:	83 c4 3c             	add    $0x3c,%esp
400002d1:	5b                   	pop    %ebx
400002d2:	5e                   	pop    %esi
400002d3:	5f                   	pop    %edi
400002d4:	5d                   	pop    %ebp
400002d5:	c3                   	ret    
400002d6:	8b 5c 24 4c          	mov    0x4c(%esp),%ebx
400002da:	eb c1                	jmp    4000029d <printnum+0x96>

400002dc <getuint>:
// Get an unsigned int of various possible sizes from a varargs list,
// depending on the lflag parameter.
static unsigned long long
getuint(va_list *ap, int lflag)
{
	if (lflag >= 2)
400002dc:	83 fa 01             	cmp    $0x1,%edx
400002df:	7e 0d                	jle    400002ee <getuint+0x12>
		return va_arg(*ap, unsigned long long);
400002e1:	8b 08                	mov    (%eax),%ecx
400002e3:	8d 51 08             	lea    0x8(%ecx),%edx
400002e6:	89 10                	mov    %edx,(%eax)
400002e8:	8b 01                	mov    (%ecx),%eax
400002ea:	8b 51 04             	mov    0x4(%ecx),%edx
400002ed:	c3                   	ret    
	else if (lflag)
400002ee:	85 d2                	test   %edx,%edx
400002f0:	75 0f                	jne    40000301 <getuint+0x25>
		return va_arg(*ap, unsigned long);
	else
		return va_arg(*ap, unsigned int);
400002f2:	8b 08                	mov    (%eax),%ecx
400002f4:	8d 51 04             	lea    0x4(%ecx),%edx
400002f7:	89 10                	mov    %edx,(%eax)
400002f9:	8b 01                	mov    (%ecx),%eax
400002fb:	ba 00 00 00 00       	mov    $0x0,%edx
}
40000300:	c3                   	ret    
		return va_arg(*ap, unsigned long);
40000301:	8b 08                	mov    (%eax),%ecx
40000303:	8d 51 04             	lea    0x4(%ecx),%edx
40000306:	89 10                	mov    %edx,(%eax)
40000308:	8b 01                	mov    (%ecx),%eax
4000030a:	ba 00 00 00 00       	mov    $0x0,%edx
4000030f:	c3                   	ret    

40000310 <getint>:
// Same as getuint but signed - can't use getuint
// because of sign extension
static long long
getint(va_list *ap, int lflag)
{
	if (lflag >= 2)
40000310:	83 fa 01             	cmp    $0x1,%edx
40000313:	7e 0d                	jle    40000322 <getint+0x12>
		return va_arg(*ap, long long);
40000315:	8b 08                	mov    (%eax),%ecx
40000317:	8d 51 08             	lea    0x8(%ecx),%edx
4000031a:	89 10                	mov    %edx,(%eax)
4000031c:	8b 01                	mov    (%ecx),%eax
4000031e:	8b 51 04             	mov    0x4(%ecx),%edx
40000321:	c3                   	ret    
	else if (lflag)
40000322:	85 d2                	test   %edx,%edx
40000324:	75 0b                	jne    40000331 <getint+0x21>
		return va_arg(*ap, long);
	else
		return va_arg(*ap, int);
40000326:	8b 08                	mov    (%eax),%ecx
40000328:	8d 51 04             	lea    0x4(%ecx),%edx
4000032b:	89 10                	mov    %edx,(%eax)
4000032d:	8b 01                	mov    (%ecx),%eax
4000032f:	99                   	cltd   
}
40000330:	c3                   	ret    
		return va_arg(*ap, long);
40000331:	8b 08                	mov    (%eax),%ecx
40000333:	8d 51 04             	lea    0x4(%ecx),%edx
40000336:	89 10                	mov    %edx,(%eax)
40000338:	8b 01                	mov    (%ecx),%eax
4000033a:	99                   	cltd   
4000033b:	c3                   	ret    

4000033c <sprintputch>:
	int cnt;
};

static void
sprintputch(int ch, struct sprintbuf *b)
{
4000033c:	8b 44 24 08          	mov    0x8(%esp),%eax
	b->cnt++;
40000340:	8b 48 08             	mov    0x8(%eax),%ecx
40000343:	8d 51 01             	lea    0x1(%ecx),%edx
40000346:	89 50 08             	mov    %edx,0x8(%eax)
	if (b->buf < b->ebuf)
40000349:	8b 10                	mov    (%eax),%edx
4000034b:	3b 50 04             	cmp    0x4(%eax),%edx
4000034e:	73 0b                	jae    4000035b <sprintputch+0x1f>
		*b->buf++ = ch;
40000350:	8d 4a 01             	lea    0x1(%edx),%ecx
40000353:	89 08                	mov    %ecx,(%eax)
40000355:	8b 44 24 04          	mov    0x4(%esp),%eax
40000359:	88 02                	mov    %al,(%edx)
4000035b:	f3 c3                	repz ret 

4000035d <vprintfmt>:
{
4000035d:	55                   	push   %ebp
4000035e:	57                   	push   %edi
4000035f:	56                   	push   %esi
40000360:	53                   	push   %ebx
40000361:	83 ec 2c             	sub    $0x2c,%esp
40000364:	e8 64 04 00 00       	call   400007cd <__x86.get_pc_thunk.ax>
40000369:	05 97 2c 00 00       	add    $0x2c97,%eax
4000036e:	89 44 24 08          	mov    %eax,0x8(%esp)
40000372:	8b 74 24 40          	mov    0x40(%esp),%esi
40000376:	8b 7c 24 44          	mov    0x44(%esp),%edi
4000037a:	8b 6c 24 48          	mov    0x48(%esp),%ebp
		while ((ch = *(unsigned char *) fmt++) != '%') {
4000037e:	8d 5d 01             	lea    0x1(%ebp),%ebx
40000381:	0f b6 45 00          	movzbl 0x0(%ebp),%eax
40000385:	83 f8 25             	cmp    $0x25,%eax
40000388:	74 16                	je     400003a0 <vprintfmt+0x43>
			if (ch == '\0')
4000038a:	85 c0                	test   %eax,%eax
4000038c:	0f 84 41 03 00 00    	je     400006d3 <.L29+0x1d>
			putch(ch, putdat);
40000392:	83 ec 08             	sub    $0x8,%esp
40000395:	57                   	push   %edi
40000396:	50                   	push   %eax
40000397:	ff d6                	call   *%esi
		while ((ch = *(unsigned char *) fmt++) != '%') {
40000399:	83 c4 10             	add    $0x10,%esp
4000039c:	89 dd                	mov    %ebx,%ebp
4000039e:	eb de                	jmp    4000037e <vprintfmt+0x21>
400003a0:	c6 44 24 0f 20       	movb   $0x20,0xf(%esp)
400003a5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
400003ac:	c7 44 24 1c ff ff ff 	movl   $0xffffffff,0x1c(%esp)
400003b3:	ff 
400003b4:	c7 44 24 10 ff ff ff 	movl   $0xffffffff,0x10(%esp)
400003bb:	ff 
400003bc:	ba 00 00 00 00       	mov    $0x0,%edx
400003c1:	89 54 24 18          	mov    %edx,0x18(%esp)
		switch (ch = *(unsigned char *) fmt++) {
400003c5:	8d 6b 01             	lea    0x1(%ebx),%ebp
400003c8:	0f b6 03             	movzbl (%ebx),%eax
400003cb:	0f b6 d0             	movzbl %al,%edx
400003ce:	89 54 24 14          	mov    %edx,0x14(%esp)
400003d2:	83 e8 23             	sub    $0x23,%eax
400003d5:	3c 55                	cmp    $0x55,%al
400003d7:	0f 87 d9 02 00 00    	ja     400006b6 <.L29>
400003dd:	0f b6 c0             	movzbl %al,%eax
400003e0:	8b 4c 24 08          	mov    0x8(%esp),%ecx
400003e4:	03 8c 81 40 df ff ff 	add    -0x20c0(%ecx,%eax,4),%ecx
400003eb:	ff e1                	jmp    *%ecx

400003ed <.L27>:
400003ed:	89 eb                	mov    %ebp,%ebx
			padc = '-';
400003ef:	c6 44 24 0f 2d       	movb   $0x2d,0xf(%esp)
400003f4:	eb cf                	jmp    400003c5 <vprintfmt+0x68>

400003f6 <.L59>:
		switch (ch = *(unsigned char *) fmt++) {
400003f6:	89 eb                	mov    %ebp,%ebx
			padc = '0';
400003f8:	c6 44 24 0f 30       	movb   $0x30,0xf(%esp)
400003fd:	eb c6                	jmp    400003c5 <vprintfmt+0x68>
		switch (ch = *(unsigned char *) fmt++) {
400003ff:	89 eb                	mov    %ebp,%ebx
				width = 0;
40000401:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
40000408:	00 
40000409:	eb ba                	jmp    400003c5 <vprintfmt+0x68>

4000040b <.L60>:
		switch (ch = *(unsigned char *) fmt++) {
4000040b:	b8 00 00 00 00       	mov    $0x0,%eax
40000410:	8b 4c 24 14          	mov    0x14(%esp),%ecx
40000414:	8b 54 24 18          	mov    0x18(%esp),%edx
				precision = precision * 10 + ch - '0';
40000418:	8d 1c 80             	lea    (%eax,%eax,4),%ebx
4000041b:	8d 04 1b             	lea    (%ebx,%ebx,1),%eax
4000041e:	8d 44 01 d0          	lea    -0x30(%ecx,%eax,1),%eax
				ch = *fmt;
40000422:	0f be 4d 00          	movsbl 0x0(%ebp),%ecx
				if (ch < '0' || ch > '9')
40000426:	8d 59 d0             	lea    -0x30(%ecx),%ebx
40000429:	83 fb 09             	cmp    $0x9,%ebx
4000042c:	77 55                	ja     40000483 <.L30+0xe>
			for (precision = 0; ; ++fmt) {
4000042e:	83 c5 01             	add    $0x1,%ebp
				precision = precision * 10 + ch - '0';
40000431:	eb e5                	jmp    40000418 <.L60+0xd>

40000433 <.L33>:
			precision = va_arg(ap, int);
40000433:	8b 44 24 4c          	mov    0x4c(%esp),%eax
40000437:	83 c0 04             	add    $0x4,%eax
4000043a:	89 44 24 4c          	mov    %eax,0x4c(%esp)
4000043e:	8b 40 fc             	mov    -0x4(%eax),%eax
40000441:	89 44 24 1c          	mov    %eax,0x1c(%esp)
		switch (ch = *(unsigned char *) fmt++) {
40000445:	89 eb                	mov    %ebp,%ebx
			if (width < 0)
40000447:	83 7c 24 10 00       	cmpl   $0x0,0x10(%esp)
4000044c:	0f 89 73 ff ff ff    	jns    400003c5 <vprintfmt+0x68>
				width = precision, precision = -1;
40000452:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000456:	89 44 24 10          	mov    %eax,0x10(%esp)
4000045a:	c7 44 24 1c ff ff ff 	movl   $0xffffffff,0x1c(%esp)
40000461:	ff 
40000462:	e9 5e ff ff ff       	jmp    400003c5 <vprintfmt+0x68>

40000467 <.L34>:
			if (width < 0)
40000467:	83 7c 24 10 00       	cmpl   $0x0,0x10(%esp)
4000046c:	78 91                	js     400003ff <.L59+0x9>
		switch (ch = *(unsigned char *) fmt++) {
4000046e:	89 eb                	mov    %ebp,%ebx
40000470:	e9 50 ff ff ff       	jmp    400003c5 <vprintfmt+0x68>

40000475 <.L30>:
40000475:	89 eb                	mov    %ebp,%ebx
			altflag = 1;
40000477:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
			goto reswitch;
4000047e:	e9 42 ff ff ff       	jmp    400003c5 <vprintfmt+0x68>
40000483:	89 54 24 18          	mov    %edx,0x18(%esp)
40000487:	89 44 24 1c          	mov    %eax,0x1c(%esp)
4000048b:	89 eb                	mov    %ebp,%ebx
4000048d:	eb b8                	jmp    40000447 <.L33+0x14>

4000048f <.L38>:
			lflag++;
4000048f:	83 44 24 18 01       	addl   $0x1,0x18(%esp)
		switch (ch = *(unsigned char *) fmt++) {
40000494:	89 eb                	mov    %ebp,%ebx
			goto reswitch;
40000496:	e9 2a ff ff ff       	jmp    400003c5 <vprintfmt+0x68>

4000049b <.L36>:
			putch(va_arg(ap, int), putdat);
4000049b:	8b 44 24 4c          	mov    0x4c(%esp),%eax
4000049f:	83 c0 04             	add    $0x4,%eax
400004a2:	89 44 24 4c          	mov    %eax,0x4c(%esp)
400004a6:	83 ec 08             	sub    $0x8,%esp
400004a9:	57                   	push   %edi
400004aa:	ff 70 fc             	pushl  -0x4(%eax)
400004ad:	ff d6                	call   *%esi
			break;
400004af:	83 c4 10             	add    $0x10,%esp
400004b2:	e9 c7 fe ff ff       	jmp    4000037e <vprintfmt+0x21>

400004b7 <.L41>:
			if ((p = va_arg(ap, char *)) == NULL)
400004b7:	8b 44 24 4c          	mov    0x4c(%esp),%eax
400004bb:	83 c0 04             	add    $0x4,%eax
400004be:	89 44 24 4c          	mov    %eax,0x4c(%esp)
400004c2:	8b 40 fc             	mov    -0x4(%eax),%eax
400004c5:	89 44 24 14          	mov    %eax,0x14(%esp)
400004c9:	85 c0                	test   %eax,%eax
400004cb:	74 2a                	je     400004f7 <.L41+0x40>
			if (width > 0 && padc != '-')
400004cd:	83 7c 24 10 00       	cmpl   $0x0,0x10(%esp)
400004d2:	0f 9f c2             	setg   %dl
400004d5:	80 7c 24 0f 2d       	cmpb   $0x2d,0xf(%esp)
400004da:	0f 95 c0             	setne  %al
400004dd:	84 c2                	test   %al,%dl
400004df:	75 26                	jne    40000507 <.L41+0x50>
400004e1:	8b 44 24 14          	mov    0x14(%esp),%eax
400004e5:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
400004e9:	89 74 24 40          	mov    %esi,0x40(%esp)
400004ed:	8b 74 24 10          	mov    0x10(%esp),%esi
400004f1:	89 6c 24 48          	mov    %ebp,0x48(%esp)
400004f5:	eb 70                	jmp    40000567 <.L41+0xb0>
				p = "(null)";
400004f7:	8b 44 24 08          	mov    0x8(%esp),%eax
400004fb:	8d 80 39 df ff ff    	lea    -0x20c7(%eax),%eax
40000501:	89 44 24 14          	mov    %eax,0x14(%esp)
40000505:	eb c6                	jmp    400004cd <.L41+0x16>
				for (width -= strnlen(p, precision); width > 0; width--)
40000507:	83 ec 08             	sub    $0x8,%esp
4000050a:	ff 74 24 24          	pushl  0x24(%esp)
4000050e:	ff 74 24 20          	pushl  0x20(%esp)
40000512:	8b 5c 24 18          	mov    0x18(%esp),%ebx
40000516:	e8 41 03 00 00       	call   4000085c <strnlen>
4000051b:	29 44 24 20          	sub    %eax,0x20(%esp)
4000051f:	8b 54 24 20          	mov    0x20(%esp),%edx
40000523:	83 c4 10             	add    $0x10,%esp
40000526:	89 d3                	mov    %edx,%ebx
40000528:	eb 12                	jmp    4000053c <.L41+0x85>
					putch(padc, putdat);
4000052a:	83 ec 08             	sub    $0x8,%esp
4000052d:	57                   	push   %edi
4000052e:	0f be 44 24 1b       	movsbl 0x1b(%esp),%eax
40000533:	50                   	push   %eax
40000534:	ff d6                	call   *%esi
				for (width -= strnlen(p, precision); width > 0; width--)
40000536:	83 eb 01             	sub    $0x1,%ebx
40000539:	83 c4 10             	add    $0x10,%esp
4000053c:	85 db                	test   %ebx,%ebx
4000053e:	7f ea                	jg     4000052a <.L41+0x73>
40000540:	89 da                	mov    %ebx,%edx
40000542:	8b 44 24 14          	mov    0x14(%esp),%eax
40000546:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
4000054a:	89 74 24 40          	mov    %esi,0x40(%esp)
4000054e:	89 d6                	mov    %edx,%esi
40000550:	89 6c 24 48          	mov    %ebp,0x48(%esp)
40000554:	eb 11                	jmp    40000567 <.L41+0xb0>
					putch(ch, putdat);
40000556:	83 ec 08             	sub    $0x8,%esp
40000559:	57                   	push   %edi
4000055a:	52                   	push   %edx
4000055b:	ff 54 24 50          	call   *0x50(%esp)
4000055f:	83 c4 10             	add    $0x10,%esp
			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0); width--)
40000562:	83 ee 01             	sub    $0x1,%esi
40000565:	89 e8                	mov    %ebp,%eax
40000567:	8d 68 01             	lea    0x1(%eax),%ebp
4000056a:	0f b6 00             	movzbl (%eax),%eax
4000056d:	0f be d0             	movsbl %al,%edx
40000570:	85 d2                	test   %edx,%edx
40000572:	74 4c                	je     400005c0 <.L41+0x109>
40000574:	85 db                	test   %ebx,%ebx
40000576:	78 05                	js     4000057d <.L41+0xc6>
40000578:	83 eb 01             	sub    $0x1,%ebx
4000057b:	78 20                	js     4000059d <.L41+0xe6>
				if (altflag && (ch < ' ' || ch > '~'))
4000057d:	83 3c 24 00          	cmpl   $0x0,(%esp)
40000581:	74 d3                	je     40000556 <.L41+0x9f>
40000583:	0f be c0             	movsbl %al,%eax
40000586:	83 e8 20             	sub    $0x20,%eax
40000589:	83 f8 5e             	cmp    $0x5e,%eax
4000058c:	76 c8                	jbe    40000556 <.L41+0x9f>
					putch('?', putdat);
4000058e:	83 ec 08             	sub    $0x8,%esp
40000591:	57                   	push   %edi
40000592:	6a 3f                	push   $0x3f
40000594:	ff 54 24 50          	call   *0x50(%esp)
40000598:	83 c4 10             	add    $0x10,%esp
4000059b:	eb c5                	jmp    40000562 <.L41+0xab>
4000059d:	89 f3                	mov    %esi,%ebx
4000059f:	8b 74 24 40          	mov    0x40(%esp),%esi
400005a3:	8b 6c 24 48          	mov    0x48(%esp),%ebp
400005a7:	eb 0e                	jmp    400005b7 <.L41+0x100>
				putch(' ', putdat);
400005a9:	83 ec 08             	sub    $0x8,%esp
400005ac:	57                   	push   %edi
400005ad:	6a 20                	push   $0x20
400005af:	ff d6                	call   *%esi
			for (; width > 0; width--)
400005b1:	83 eb 01             	sub    $0x1,%ebx
400005b4:	83 c4 10             	add    $0x10,%esp
400005b7:	85 db                	test   %ebx,%ebx
400005b9:	7f ee                	jg     400005a9 <.L41+0xf2>
400005bb:	e9 be fd ff ff       	jmp    4000037e <vprintfmt+0x21>
400005c0:	89 f3                	mov    %esi,%ebx
400005c2:	8b 74 24 40          	mov    0x40(%esp),%esi
400005c6:	8b 6c 24 48          	mov    0x48(%esp),%ebp
400005ca:	eb eb                	jmp    400005b7 <.L41+0x100>

400005cc <.L37>:
400005cc:	8b 54 24 18          	mov    0x18(%esp),%edx
			num = getint(&ap, lflag);
400005d0:	8d 44 24 4c          	lea    0x4c(%esp),%eax
400005d4:	e8 37 fd ff ff       	call   40000310 <getint>
400005d9:	89 04 24             	mov    %eax,(%esp)
400005dc:	89 54 24 04          	mov    %edx,0x4(%esp)
			if ((long long) num < 0) {
400005e0:	85 d2                	test   %edx,%edx
400005e2:	78 07                	js     400005eb <.L37+0x1f>
			base = 10;
400005e4:	bb 0a 00 00 00       	mov    $0xa,%ebx
400005e9:	eb 33                	jmp    4000061e <.L42+0x12>
				putch('-', putdat);
400005eb:	83 ec 08             	sub    $0x8,%esp
400005ee:	57                   	push   %edi
400005ef:	6a 2d                	push   $0x2d
400005f1:	ff d6                	call   *%esi
				num = -(long long) num;
400005f3:	8b 44 24 10          	mov    0x10(%esp),%eax
400005f7:	8b 54 24 14          	mov    0x14(%esp),%edx
400005fb:	f7 d8                	neg    %eax
400005fd:	83 d2 00             	adc    $0x0,%edx
40000600:	f7 da                	neg    %edx
40000602:	83 c4 10             	add    $0x10,%esp
			base = 10;
40000605:	bb 0a 00 00 00       	mov    $0xa,%ebx
4000060a:	eb 12                	jmp    4000061e <.L42+0x12>

4000060c <.L42>:
4000060c:	8b 54 24 18          	mov    0x18(%esp),%edx
			num = getuint(&ap, lflag);
40000610:	8d 44 24 4c          	lea    0x4c(%esp),%eax
40000614:	e8 c3 fc ff ff       	call   400002dc <getuint>
			base = 10;
40000619:	bb 0a 00 00 00       	mov    $0xa,%ebx
			printnum(putch, putdat, num, base, width, padc);
4000061e:	83 ec 0c             	sub    $0xc,%esp
40000621:	0f be 4c 24 1b       	movsbl 0x1b(%esp),%ecx
40000626:	51                   	push   %ecx
40000627:	ff 74 24 20          	pushl  0x20(%esp)
4000062b:	53                   	push   %ebx
4000062c:	52                   	push   %edx
4000062d:	50                   	push   %eax
4000062e:	89 fa                	mov    %edi,%edx
40000630:	89 f0                	mov    %esi,%eax
40000632:	e8 d0 fb ff ff       	call   40000207 <printnum>
			break;
40000637:	83 c4 20             	add    $0x20,%esp
4000063a:	e9 3f fd ff ff       	jmp    4000037e <vprintfmt+0x21>

4000063f <.L39>:
			putch('X', putdat);
4000063f:	83 ec 08             	sub    $0x8,%esp
40000642:	57                   	push   %edi
40000643:	6a 58                	push   $0x58
40000645:	ff d6                	call   *%esi
			putch('X', putdat);
40000647:	83 c4 08             	add    $0x8,%esp
4000064a:	57                   	push   %edi
4000064b:	6a 58                	push   $0x58
4000064d:	ff d6                	call   *%esi
			putch('X', putdat);
4000064f:	83 c4 08             	add    $0x8,%esp
40000652:	57                   	push   %edi
40000653:	6a 58                	push   $0x58
40000655:	ff d6                	call   *%esi
			break;
40000657:	83 c4 10             	add    $0x10,%esp
4000065a:	e9 1f fd ff ff       	jmp    4000037e <vprintfmt+0x21>

4000065f <.L40>:
			putch('0', putdat);
4000065f:	83 ec 08             	sub    $0x8,%esp
40000662:	57                   	push   %edi
40000663:	6a 30                	push   $0x30
40000665:	ff d6                	call   *%esi
			putch('x', putdat);
40000667:	83 c4 08             	add    $0x8,%esp
4000066a:	57                   	push   %edi
4000066b:	6a 78                	push   $0x78
4000066d:	ff d6                	call   *%esi
				(uintptr_t) va_arg(ap, void *);
4000066f:	8b 44 24 5c          	mov    0x5c(%esp),%eax
40000673:	83 c0 04             	add    $0x4,%eax
40000676:	89 44 24 5c          	mov    %eax,0x5c(%esp)
			num = (unsigned long long)
4000067a:	8b 40 fc             	mov    -0x4(%eax),%eax
4000067d:	ba 00 00 00 00       	mov    $0x0,%edx
			goto number;
40000682:	83 c4 10             	add    $0x10,%esp
			base = 16;
40000685:	bb 10 00 00 00       	mov    $0x10,%ebx
			goto number;
4000068a:	eb 92                	jmp    4000061e <.L42+0x12>

4000068c <.L43>:
4000068c:	8b 54 24 18          	mov    0x18(%esp),%edx
			num = getuint(&ap, lflag);
40000690:	8d 44 24 4c          	lea    0x4c(%esp),%eax
40000694:	e8 43 fc ff ff       	call   400002dc <getuint>
			base = 16;
40000699:	bb 10 00 00 00       	mov    $0x10,%ebx
4000069e:	e9 7b ff ff ff       	jmp    4000061e <.L42+0x12>

400006a3 <.L32>:
400006a3:	8b 4c 24 14          	mov    0x14(%esp),%ecx
			putch(ch, putdat);
400006a7:	83 ec 08             	sub    $0x8,%esp
400006aa:	57                   	push   %edi
400006ab:	51                   	push   %ecx
400006ac:	ff d6                	call   *%esi
			break;
400006ae:	83 c4 10             	add    $0x10,%esp
400006b1:	e9 c8 fc ff ff       	jmp    4000037e <vprintfmt+0x21>

400006b6 <.L29>:
			putch('%', putdat);
400006b6:	83 ec 08             	sub    $0x8,%esp
400006b9:	57                   	push   %edi
400006ba:	6a 25                	push   $0x25
400006bc:	ff d6                	call   *%esi
			for (fmt--; fmt[-1] != '%'; fmt--)
400006be:	83 c4 10             	add    $0x10,%esp
400006c1:	89 dd                	mov    %ebx,%ebp
400006c3:	eb 03                	jmp    400006c8 <.L29+0x12>
400006c5:	83 ed 01             	sub    $0x1,%ebp
400006c8:	80 7d ff 25          	cmpb   $0x25,-0x1(%ebp)
400006cc:	75 f7                	jne    400006c5 <.L29+0xf>
400006ce:	e9 ab fc ff ff       	jmp    4000037e <vprintfmt+0x21>
}
400006d3:	83 c4 2c             	add    $0x2c,%esp
400006d6:	5b                   	pop    %ebx
400006d7:	5e                   	pop    %esi
400006d8:	5f                   	pop    %edi
400006d9:	5d                   	pop    %ebp
400006da:	c3                   	ret    

400006db <printfmt>:
{
400006db:	83 ec 0c             	sub    $0xc,%esp
	vprintfmt(putch, putdat, fmt, ap);
400006de:	8d 44 24 1c          	lea    0x1c(%esp),%eax
400006e2:	50                   	push   %eax
400006e3:	ff 74 24 1c          	pushl  0x1c(%esp)
400006e7:	ff 74 24 1c          	pushl  0x1c(%esp)
400006eb:	ff 74 24 1c          	pushl  0x1c(%esp)
400006ef:	e8 69 fc ff ff       	call   4000035d <vprintfmt>
}
400006f4:	83 c4 1c             	add    $0x1c,%esp
400006f7:	c3                   	ret    

400006f8 <vsprintf>:
}

int
vsprintf(char *buf, const char *fmt, va_list ap)
{
400006f8:	83 ec 1c             	sub    $0x1c,%esp
400006fb:	e8 cd 00 00 00       	call   400007cd <__x86.get_pc_thunk.ax>
40000700:	05 00 29 00 00       	add    $0x2900,%eax
	//assert(buf != NULL);
	struct sprintbuf b = {buf, (char*)(intptr_t)~0, 0};
40000705:	8b 54 24 20          	mov    0x20(%esp),%edx
40000709:	89 54 24 04          	mov    %edx,0x4(%esp)
4000070d:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
40000714:	ff 
40000715:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
4000071c:	00 

	// print the string to the buffer
	vprintfmt((void*)sprintputch, &b, fmt, ap);
4000071d:	ff 74 24 28          	pushl  0x28(%esp)
40000721:	ff 74 24 28          	pushl  0x28(%esp)
40000725:	8d 54 24 0c          	lea    0xc(%esp),%edx
40000729:	52                   	push   %edx
4000072a:	8d 80 3c d3 ff ff    	lea    -0x2cc4(%eax),%eax
40000730:	50                   	push   %eax
40000731:	e8 27 fc ff ff       	call   4000035d <vprintfmt>

	// null terminate the buffer
	*b.buf = '\0';
40000736:	8b 44 24 14          	mov    0x14(%esp),%eax
4000073a:	c6 00 00             	movb   $0x0,(%eax)

	return b.cnt;
}
4000073d:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000741:	83 c4 2c             	add    $0x2c,%esp
40000744:	c3                   	ret    

40000745 <sprintf>:

int
sprintf(char *buf, const char *fmt, ...)
{
40000745:	83 ec 10             	sub    $0x10,%esp
	va_list ap;
	int rc;

	va_start(ap, fmt);
	rc = vsprintf(buf, fmt, ap);
40000748:	8d 44 24 1c          	lea    0x1c(%esp),%eax
4000074c:	50                   	push   %eax
4000074d:	ff 74 24 1c          	pushl  0x1c(%esp)
40000751:	ff 74 24 1c          	pushl  0x1c(%esp)
40000755:	e8 9e ff ff ff       	call   400006f8 <vsprintf>
	va_end(ap);

	return rc;
}
4000075a:	83 c4 1c             	add    $0x1c,%esp
4000075d:	c3                   	ret    

4000075e <vsnprintf>:

int
vsnprintf(char *buf, int n, const char *fmt, va_list ap)
{
4000075e:	83 ec 1c             	sub    $0x1c,%esp
40000761:	e8 6b 00 00 00       	call   400007d1 <__x86.get_pc_thunk.dx>
40000766:	81 c2 9a 28 00 00    	add    $0x289a,%edx
4000076c:	8b 44 24 20          	mov    0x20(%esp),%eax
	//assert(buf != NULL && n > 0);
	struct sprintbuf b = {buf, buf+n-1, 0};
40000770:	89 44 24 04          	mov    %eax,0x4(%esp)
40000774:	8b 4c 24 24          	mov    0x24(%esp),%ecx
40000778:	8d 44 08 ff          	lea    -0x1(%eax,%ecx,1),%eax
4000077c:	89 44 24 08          	mov    %eax,0x8(%esp)
40000780:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000787:	00 

	// print the string to the buffer
	vprintfmt((void*)sprintputch, &b, fmt, ap);
40000788:	ff 74 24 2c          	pushl  0x2c(%esp)
4000078c:	ff 74 24 2c          	pushl  0x2c(%esp)
40000790:	8d 44 24 0c          	lea    0xc(%esp),%eax
40000794:	50                   	push   %eax
40000795:	8d 82 3c d3 ff ff    	lea    -0x2cc4(%edx),%eax
4000079b:	50                   	push   %eax
4000079c:	e8 bc fb ff ff       	call   4000035d <vprintfmt>

	// null terminate the buffer
	*b.buf = '\0';
400007a1:	8b 44 24 14          	mov    0x14(%esp),%eax
400007a5:	c6 00 00             	movb   $0x0,(%eax)

	return b.cnt;
}
400007a8:	8b 44 24 1c          	mov    0x1c(%esp),%eax
400007ac:	83 c4 2c             	add    $0x2c,%esp
400007af:	c3                   	ret    

400007b0 <snprintf>:

int
snprintf(char *buf, int n, const char *fmt, ...)
{
400007b0:	83 ec 0c             	sub    $0xc,%esp
	va_list ap;
	int rc;

	va_start(ap, fmt);
	rc = vsnprintf(buf, n, fmt, ap);
400007b3:	8d 44 24 1c          	lea    0x1c(%esp),%eax
400007b7:	50                   	push   %eax
400007b8:	ff 74 24 1c          	pushl  0x1c(%esp)
400007bc:	ff 74 24 1c          	pushl  0x1c(%esp)
400007c0:	ff 74 24 1c          	pushl  0x1c(%esp)
400007c4:	e8 95 ff ff ff       	call   4000075e <vsnprintf>
	va_end(ap);

	return rc;
}
400007c9:	83 c4 1c             	add    $0x1c,%esp
400007cc:	c3                   	ret    

400007cd <__x86.get_pc_thunk.ax>:
400007cd:	8b 04 24             	mov    (%esp),%eax
400007d0:	c3                   	ret    

400007d1 <__x86.get_pc_thunk.dx>:
400007d1:	8b 14 24             	mov    (%esp),%edx
400007d4:	c3                   	ret    

400007d5 <__x86.get_pc_thunk.cx>:
400007d5:	8b 0c 24             	mov    (%esp),%ecx
400007d8:	c3                   	ret    

400007d9 <spawn>:
#include <syscall.h>
#include <types.h>

pid_t
spawn(uintptr_t exec, unsigned int quota)
{
400007d9:	53                   	push   %ebx
sys_spawn(uintptr_t exec, unsigned int quota)
{
	int errno;
	pid_t pid;

	asm volatile("int %2"
400007da:	b8 01 00 00 00       	mov    $0x1,%eax
400007df:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
400007e3:	8b 5c 24 08          	mov    0x8(%esp),%ebx
400007e7:	cd 30                	int    $0x30
		       "a" (SYS_spawn),
		       "b" (exec),
		       "c" (quota)
		     : "cc", "memory");

	return errno ? -1 : pid;
400007e9:	85 c0                	test   %eax,%eax
400007eb:	75 04                	jne    400007f1 <spawn+0x18>
	return sys_spawn(exec, quota);
}
400007ed:	89 d8                	mov    %ebx,%eax
400007ef:	5b                   	pop    %ebx
400007f0:	c3                   	ret    
400007f1:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
	return sys_spawn(exec, quota);
400007f6:	eb f5                	jmp    400007ed <spawn+0x14>

400007f8 <yield>:
}

static gcc_inline void
sys_yield(void)
{
	asm volatile("int %0" :
400007f8:	b8 02 00 00 00       	mov    $0x2,%eax
400007fd:	cd 30                	int    $0x30
400007ff:	c3                   	ret    

40000800 <spinlock_init>:
}

void
spinlock_init(spinlock_t *lk)
{
	*lk = 0;
40000800:	8b 44 24 04          	mov    0x4(%esp),%eax
40000804:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
4000080a:	c3                   	ret    

4000080b <spinlock_acquire>:
}

void
spinlock_acquire(spinlock_t *lk)
{
4000080b:	8b 54 24 04          	mov    0x4(%esp),%edx
	while(xchg(lk, 1) != 0)
4000080f:	eb 02                	jmp    40000813 <spinlock_acquire+0x8>
		asm volatile("pause");
40000811:	f3 90                	pause  
	asm volatile("lock; xchgl %0, %1" :
40000813:	b8 01 00 00 00       	mov    $0x1,%eax
40000818:	f0 87 02             	lock xchg %eax,(%edx)
	while(xchg(lk, 1) != 0)
4000081b:	85 c0                	test   %eax,%eax
4000081d:	75 f2                	jne    40000811 <spinlock_acquire+0x6>
}
4000081f:	f3 c3                	repz ret 

40000821 <spinlock_holding>:

// Check whether this cpu is holding the lock.
bool
spinlock_holding(spinlock_t *lock)
{
	return *lock;
40000821:	8b 44 24 04          	mov    0x4(%esp),%eax
40000825:	8b 00                	mov    (%eax),%eax
}
40000827:	c3                   	ret    

40000828 <spinlock_release>:
{
40000828:	53                   	push   %ebx
40000829:	8b 5c 24 08          	mov    0x8(%esp),%ebx
	if (spinlock_holding(lk) == FALSE)
4000082d:	53                   	push   %ebx
4000082e:	e8 ee ff ff ff       	call   40000821 <spinlock_holding>
40000833:	83 c4 04             	add    $0x4,%esp
40000836:	84 c0                	test   %al,%al
40000838:	74 08                	je     40000842 <spinlock_release+0x1a>
	asm volatile("lock; xchgl %0, %1" :
4000083a:	b8 00 00 00 00       	mov    $0x0,%eax
4000083f:	f0 87 03             	lock xchg %eax,(%ebx)
}
40000842:	5b                   	pop    %ebx
40000843:	c3                   	ret    

40000844 <strlen>:
#include <string.h>
#include <types.h>

int
strlen(const char *s)
{
40000844:	8b 54 24 04          	mov    0x4(%esp),%edx
	int n;

	for (n = 0; *s != '\0'; s++)
40000848:	b8 00 00 00 00       	mov    $0x0,%eax
4000084d:	eb 06                	jmp    40000855 <strlen+0x11>
		n++;
4000084f:	83 c0 01             	add    $0x1,%eax
	for (n = 0; *s != '\0'; s++)
40000852:	83 c2 01             	add    $0x1,%edx
40000855:	80 3a 00             	cmpb   $0x0,(%edx)
40000858:	75 f5                	jne    4000084f <strlen+0xb>
	return n;
}
4000085a:	f3 c3                	repz ret 

4000085c <strnlen>:

int
strnlen(const char *s, size_t size)
{
4000085c:	8b 4c 24 04          	mov    0x4(%esp),%ecx
40000860:	8b 54 24 08          	mov    0x8(%esp),%edx
	int n;

	for (n = 0; size > 0 && *s != '\0'; s++, size--)
40000864:	b8 00 00 00 00       	mov    $0x0,%eax
40000869:	eb 09                	jmp    40000874 <strnlen+0x18>
		n++;
4000086b:	83 c0 01             	add    $0x1,%eax
	for (n = 0; size > 0 && *s != '\0'; s++, size--)
4000086e:	83 c1 01             	add    $0x1,%ecx
40000871:	83 ea 01             	sub    $0x1,%edx
40000874:	85 d2                	test   %edx,%edx
40000876:	74 05                	je     4000087d <strnlen+0x21>
40000878:	80 39 00             	cmpb   $0x0,(%ecx)
4000087b:	75 ee                	jne    4000086b <strnlen+0xf>
	return n;
}
4000087d:	f3 c3                	repz ret 

4000087f <strcpy>:

char *
strcpy(char *dst, const char *src)
{
4000087f:	53                   	push   %ebx
40000880:	8b 44 24 08          	mov    0x8(%esp),%eax
40000884:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
	char *ret;

	ret = dst;
	while ((*dst++ = *src++) != '\0')
40000888:	89 c2                	mov    %eax,%edx
4000088a:	0f b6 19             	movzbl (%ecx),%ebx
4000088d:	88 1a                	mov    %bl,(%edx)
4000088f:	8d 52 01             	lea    0x1(%edx),%edx
40000892:	8d 49 01             	lea    0x1(%ecx),%ecx
40000895:	84 db                	test   %bl,%bl
40000897:	75 f1                	jne    4000088a <strcpy+0xb>
		/* do nothing */;
	return ret;
}
40000899:	5b                   	pop    %ebx
4000089a:	c3                   	ret    

4000089b <strncpy>:

char *
strncpy(char *dst, const char *src, size_t size)
{
4000089b:	55                   	push   %ebp
4000089c:	57                   	push   %edi
4000089d:	56                   	push   %esi
4000089e:	53                   	push   %ebx
4000089f:	8b 6c 24 14          	mov    0x14(%esp),%ebp
400008a3:	8b 5c 24 18          	mov    0x18(%esp),%ebx
400008a7:	8b 7c 24 1c          	mov    0x1c(%esp),%edi
	size_t i;
	char *ret;

	ret = dst;
	for (i = 0; i < size; i++) {
400008ab:	89 e9                	mov    %ebp,%ecx
400008ad:	ba 00 00 00 00       	mov    $0x0,%edx
400008b2:	eb 05                	jmp    400008b9 <strncpy+0x1e>
400008b4:	83 c2 01             	add    $0x1,%edx
		*dst++ = *src;
400008b7:	89 f1                	mov    %esi,%ecx
	for (i = 0; i < size; i++) {
400008b9:	39 fa                	cmp    %edi,%edx
400008bb:	73 12                	jae    400008cf <strncpy+0x34>
		*dst++ = *src;
400008bd:	8d 71 01             	lea    0x1(%ecx),%esi
400008c0:	0f b6 03             	movzbl (%ebx),%eax
400008c3:	88 01                	mov    %al,(%ecx)
		// If strlen(src) < size, null-pad 'dst' out to 'size' chars
		if (*src != '\0')
400008c5:	80 3b 00             	cmpb   $0x0,(%ebx)
400008c8:	74 ea                	je     400008b4 <strncpy+0x19>
			src++;
400008ca:	83 c3 01             	add    $0x1,%ebx
400008cd:	eb e5                	jmp    400008b4 <strncpy+0x19>
	}
	return ret;
}
400008cf:	89 e8                	mov    %ebp,%eax
400008d1:	5b                   	pop    %ebx
400008d2:	5e                   	pop    %esi
400008d3:	5f                   	pop    %edi
400008d4:	5d                   	pop    %ebp
400008d5:	c3                   	ret    

400008d6 <strlcpy>:

size_t
strlcpy(char *dst, const char *src, size_t size)
{
400008d6:	56                   	push   %esi
400008d7:	53                   	push   %ebx
400008d8:	8b 74 24 0c          	mov    0xc(%esp),%esi
400008dc:	8b 4c 24 10          	mov    0x10(%esp),%ecx
400008e0:	8b 54 24 14          	mov    0x14(%esp),%edx
	char *dst_in;

	dst_in = dst;
	if (size > 0) {
400008e4:	85 d2                	test   %edx,%edx
400008e6:	74 04                	je     400008ec <strlcpy+0x16>
400008e8:	89 f0                	mov    %esi,%eax
400008ea:	eb 0c                	jmp    400008f8 <strlcpy+0x22>
400008ec:	89 f0                	mov    %esi,%eax
400008ee:	eb 17                	jmp    40000907 <strlcpy+0x31>
		while (--size > 0 && *src != '\0')
			*dst++ = *src++;
400008f0:	83 c1 01             	add    $0x1,%ecx
400008f3:	88 18                	mov    %bl,(%eax)
400008f5:	8d 40 01             	lea    0x1(%eax),%eax
		while (--size > 0 && *src != '\0')
400008f8:	83 ea 01             	sub    $0x1,%edx
400008fb:	74 07                	je     40000904 <strlcpy+0x2e>
400008fd:	0f b6 19             	movzbl (%ecx),%ebx
40000900:	84 db                	test   %bl,%bl
40000902:	75 ec                	jne    400008f0 <strlcpy+0x1a>
		*dst = '\0';
40000904:	c6 00 00             	movb   $0x0,(%eax)
	}
	return dst - dst_in;
40000907:	29 f0                	sub    %esi,%eax
}
40000909:	5b                   	pop    %ebx
4000090a:	5e                   	pop    %esi
4000090b:	c3                   	ret    

4000090c <strcmp>:

int
strcmp(const char *p, const char *q)
{
4000090c:	8b 4c 24 04          	mov    0x4(%esp),%ecx
40000910:	8b 54 24 08          	mov    0x8(%esp),%edx
	while (*p && *p == *q)
40000914:	eb 06                	jmp    4000091c <strcmp+0x10>
		p++, q++;
40000916:	83 c1 01             	add    $0x1,%ecx
40000919:	83 c2 01             	add    $0x1,%edx
	while (*p && *p == *q)
4000091c:	0f b6 01             	movzbl (%ecx),%eax
4000091f:	84 c0                	test   %al,%al
40000921:	74 04                	je     40000927 <strcmp+0x1b>
40000923:	3a 02                	cmp    (%edx),%al
40000925:	74 ef                	je     40000916 <strcmp+0xa>
	return (int) ((unsigned char) *p - (unsigned char) *q);
40000927:	0f b6 c0             	movzbl %al,%eax
4000092a:	0f b6 12             	movzbl (%edx),%edx
4000092d:	29 d0                	sub    %edx,%eax
}
4000092f:	c3                   	ret    

40000930 <strncmp>:

int
strncmp(const char *p, const char *q, size_t n)
{
40000930:	53                   	push   %ebx
40000931:	8b 54 24 08          	mov    0x8(%esp),%edx
40000935:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
40000939:	8b 44 24 10          	mov    0x10(%esp),%eax
	while (n > 0 && *p && *p == *q)
4000093d:	eb 09                	jmp    40000948 <strncmp+0x18>
		n--, p++, q++;
4000093f:	83 e8 01             	sub    $0x1,%eax
40000942:	83 c2 01             	add    $0x1,%edx
40000945:	83 c1 01             	add    $0x1,%ecx
	while (n > 0 && *p && *p == *q)
40000948:	85 c0                	test   %eax,%eax
4000094a:	74 0b                	je     40000957 <strncmp+0x27>
4000094c:	0f b6 1a             	movzbl (%edx),%ebx
4000094f:	84 db                	test   %bl,%bl
40000951:	74 04                	je     40000957 <strncmp+0x27>
40000953:	3a 19                	cmp    (%ecx),%bl
40000955:	74 e8                	je     4000093f <strncmp+0xf>
	if (n == 0)
40000957:	85 c0                	test   %eax,%eax
40000959:	74 0a                	je     40000965 <strncmp+0x35>
		return 0;
	else
		return (int) ((unsigned char) *p - (unsigned char) *q);
4000095b:	0f b6 02             	movzbl (%edx),%eax
4000095e:	0f b6 11             	movzbl (%ecx),%edx
40000961:	29 d0                	sub    %edx,%eax
}
40000963:	5b                   	pop    %ebx
40000964:	c3                   	ret    
		return 0;
40000965:	b8 00 00 00 00       	mov    $0x0,%eax
4000096a:	eb f7                	jmp    40000963 <strncmp+0x33>

4000096c <strchr>:

char *
strchr(const char *s, char c)
{
4000096c:	8b 44 24 04          	mov    0x4(%esp),%eax
40000970:	0f b6 4c 24 08       	movzbl 0x8(%esp),%ecx
	for (; *s; s++)
40000975:	0f b6 10             	movzbl (%eax),%edx
40000978:	84 d2                	test   %dl,%dl
4000097a:	74 09                	je     40000985 <strchr+0x19>
		if (*s == c)
4000097c:	38 ca                	cmp    %cl,%dl
4000097e:	74 0a                	je     4000098a <strchr+0x1e>
	for (; *s; s++)
40000980:	83 c0 01             	add    $0x1,%eax
40000983:	eb f0                	jmp    40000975 <strchr+0x9>
			return (char *) s;
	return 0;
40000985:	b8 00 00 00 00       	mov    $0x0,%eax
}
4000098a:	f3 c3                	repz ret 

4000098c <strfind>:

char *
strfind(const char *s, char c)
{
4000098c:	8b 44 24 04          	mov    0x4(%esp),%eax
40000990:	0f b6 4c 24 08       	movzbl 0x8(%esp),%ecx
	for (; *s; s++)
40000995:	0f b6 10             	movzbl (%eax),%edx
40000998:	84 d2                	test   %dl,%dl
4000099a:	74 09                	je     400009a5 <strfind+0x19>
		if (*s == c)
4000099c:	38 ca                	cmp    %cl,%dl
4000099e:	74 05                	je     400009a5 <strfind+0x19>
	for (; *s; s++)
400009a0:	83 c0 01             	add    $0x1,%eax
400009a3:	eb f0                	jmp    40000995 <strfind+0x9>
			break;
	return (char *) s;
}
400009a5:	f3 c3                	repz ret 

400009a7 <strtol>:


long
strtol(const char *s, char **endptr, int base)
{
400009a7:	55                   	push   %ebp
400009a8:	57                   	push   %edi
400009a9:	56                   	push   %esi
400009aa:	53                   	push   %ebx
400009ab:	83 ec 04             	sub    $0x4,%esp
400009ae:	8b 4c 24 18          	mov    0x18(%esp),%ecx
400009b2:	8b 74 24 1c          	mov    0x1c(%esp),%esi
400009b6:	8b 44 24 20          	mov    0x20(%esp),%eax
400009ba:	89 04 24             	mov    %eax,(%esp)
	int neg = 0;
	long val = 0;

	// gobble initial whitespace
	while (*s == ' ' || *s == '\t')
400009bd:	0f b6 01             	movzbl (%ecx),%eax
400009c0:	3c 20                	cmp    $0x20,%al
400009c2:	0f 94 c3             	sete   %bl
400009c5:	3c 09                	cmp    $0x9,%al
400009c7:	0f 94 c2             	sete   %dl
400009ca:	08 d3                	or     %dl,%bl
400009cc:	74 05                	je     400009d3 <strtol+0x2c>
		s++;
400009ce:	83 c1 01             	add    $0x1,%ecx
400009d1:	eb ea                	jmp    400009bd <strtol+0x16>

	// plus/minus sign
	if (*s == '+')
400009d3:	3c 2b                	cmp    $0x2b,%al
400009d5:	74 3f                	je     40000a16 <strtol+0x6f>
		s++;
	else if (*s == '-')
400009d7:	3c 2d                	cmp    $0x2d,%al
400009d9:	74 45                	je     40000a20 <strtol+0x79>
	int neg = 0;
400009db:	bf 00 00 00 00       	mov    $0x0,%edi
		s++, neg = 1;

	// hex or octal base prefix
	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
400009e0:	8b 04 24             	mov    (%esp),%eax
400009e3:	85 c0                	test   %eax,%eax
400009e5:	0f 94 c2             	sete   %dl
400009e8:	83 f8 10             	cmp    $0x10,%eax
400009eb:	0f 94 c0             	sete   %al
400009ee:	08 c2                	or     %al,%dl
400009f0:	74 05                	je     400009f7 <strtol+0x50>
400009f2:	80 39 30             	cmpb   $0x30,(%ecx)
400009f5:	74 33                	je     40000a2a <strtol+0x83>
		s += 2, base = 16;
	else if (base == 0 && s[0] == '0')
400009f7:	83 3c 24 00          	cmpl   $0x0,(%esp)
400009fb:	75 05                	jne    40000a02 <strtol+0x5b>
400009fd:	80 39 30             	cmpb   $0x30,(%ecx)
40000a00:	74 3a                	je     40000a3c <strtol+0x95>
		s++, base = 8;
	else if (base == 0)
40000a02:	83 3c 24 00          	cmpl   $0x0,(%esp)
40000a06:	75 07                	jne    40000a0f <strtol+0x68>
		base = 10;
40000a08:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
40000a0f:	b8 00 00 00 00       	mov    $0x0,%eax
40000a14:	eb 51                	jmp    40000a67 <strtol+0xc0>
		s++;
40000a16:	83 c1 01             	add    $0x1,%ecx
	int neg = 0;
40000a19:	bf 00 00 00 00       	mov    $0x0,%edi
40000a1e:	eb c0                	jmp    400009e0 <strtol+0x39>
		s++, neg = 1;
40000a20:	83 c1 01             	add    $0x1,%ecx
40000a23:	bf 01 00 00 00       	mov    $0x1,%edi
40000a28:	eb b6                	jmp    400009e0 <strtol+0x39>
	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
40000a2a:	80 79 01 78          	cmpb   $0x78,0x1(%ecx)
40000a2e:	75 c7                	jne    400009f7 <strtol+0x50>
		s += 2, base = 16;
40000a30:	83 c1 02             	add    $0x2,%ecx
40000a33:	c7 04 24 10 00 00 00 	movl   $0x10,(%esp)
40000a3a:	eb d3                	jmp    40000a0f <strtol+0x68>
		s++, base = 8;
40000a3c:	83 c1 01             	add    $0x1,%ecx
40000a3f:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
40000a46:	eb c7                	jmp    40000a0f <strtol+0x68>
	while (1) {
		int dig;

		if (*s >= '0' && *s <= '9')
			dig = *s - '0';
		else if (*s >= 'a' && *s <= 'z')
40000a48:	8d 6a 9f             	lea    -0x61(%edx),%ebp
40000a4b:	89 eb                	mov    %ebp,%ebx
40000a4d:	80 fb 19             	cmp    $0x19,%bl
40000a50:	77 2a                	ja     40000a7c <strtol+0xd5>
			dig = *s - 'a' + 10;
40000a52:	0f be d2             	movsbl %dl,%edx
40000a55:	83 ea 57             	sub    $0x57,%edx
		else if (*s >= 'A' && *s <= 'Z')
			dig = *s - 'A' + 10;
		else
			break;
		if (dig >= base)
40000a58:	8b 1c 24             	mov    (%esp),%ebx
40000a5b:	39 da                	cmp    %ebx,%edx
40000a5d:	7d 2f                	jge    40000a8e <strtol+0xe7>
			break;
		s++, val = (val * base) + dig;
40000a5f:	83 c1 01             	add    $0x1,%ecx
40000a62:	0f af c3             	imul   %ebx,%eax
40000a65:	01 d0                	add    %edx,%eax
		if (*s >= '0' && *s <= '9')
40000a67:	0f b6 11             	movzbl (%ecx),%edx
40000a6a:	8d 6a d0             	lea    -0x30(%edx),%ebp
40000a6d:	89 eb                	mov    %ebp,%ebx
40000a6f:	80 fb 09             	cmp    $0x9,%bl
40000a72:	77 d4                	ja     40000a48 <strtol+0xa1>
			dig = *s - '0';
40000a74:	0f be d2             	movsbl %dl,%edx
40000a77:	83 ea 30             	sub    $0x30,%edx
40000a7a:	eb dc                	jmp    40000a58 <strtol+0xb1>
		else if (*s >= 'A' && *s <= 'Z')
40000a7c:	8d 6a bf             	lea    -0x41(%edx),%ebp
40000a7f:	89 eb                	mov    %ebp,%ebx
40000a81:	80 fb 19             	cmp    $0x19,%bl
40000a84:	77 08                	ja     40000a8e <strtol+0xe7>
			dig = *s - 'A' + 10;
40000a86:	0f be d2             	movsbl %dl,%edx
40000a89:	83 ea 37             	sub    $0x37,%edx
40000a8c:	eb ca                	jmp    40000a58 <strtol+0xb1>
		// we don't properly detect overflow!
	}

	if (endptr)
40000a8e:	85 f6                	test   %esi,%esi
40000a90:	74 02                	je     40000a94 <strtol+0xed>
		*endptr = (char *) s;
40000a92:	89 0e                	mov    %ecx,(%esi)
	return (neg ? -val : val);
40000a94:	85 ff                	test   %edi,%edi
40000a96:	74 02                	je     40000a9a <strtol+0xf3>
40000a98:	f7 d8                	neg    %eax
}
40000a9a:	83 c4 04             	add    $0x4,%esp
40000a9d:	5b                   	pop    %ebx
40000a9e:	5e                   	pop    %esi
40000a9f:	5f                   	pop    %edi
40000aa0:	5d                   	pop    %ebp
40000aa1:	c3                   	ret    

40000aa2 <memset>:

void *
memset(void *v, int c, size_t n)
{
40000aa2:	57                   	push   %edi
40000aa3:	53                   	push   %ebx
40000aa4:	8b 7c 24 0c          	mov    0xc(%esp),%edi
40000aa8:	8b 4c 24 14          	mov    0x14(%esp),%ecx
	if (n == 0)
40000aac:	85 c9                	test   %ecx,%ecx
40000aae:	74 14                	je     40000ac4 <memset+0x22>
		return v;
	if ((int)v%4 == 0 && n%4 == 0) {
40000ab0:	f7 c7 03 00 00 00    	test   $0x3,%edi
40000ab6:	75 05                	jne    40000abd <memset+0x1b>
40000ab8:	f6 c1 03             	test   $0x3,%cl
40000abb:	74 0c                	je     40000ac9 <memset+0x27>
		c = (c<<24)|(c<<16)|(c<<8)|c;
		asm volatile("cld; rep stosl\n"
			     :: "D" (v), "a" (c), "c" (n/4)
			     : "cc", "memory");
	} else
		asm volatile("cld; rep stosb\n"
40000abd:	8b 44 24 10          	mov    0x10(%esp),%eax
40000ac1:	fc                   	cld    
40000ac2:	f3 aa                	rep stos %al,%es:(%edi)
			     :: "D" (v), "a" (c), "c" (n)
			     : "cc", "memory");
	return v;
}
40000ac4:	89 f8                	mov    %edi,%eax
40000ac6:	5b                   	pop    %ebx
40000ac7:	5f                   	pop    %edi
40000ac8:	c3                   	ret    
		c &= 0xFF;
40000ac9:	0f b6 44 24 10       	movzbl 0x10(%esp),%eax
		c = (c<<24)|(c<<16)|(c<<8)|c;
40000ace:	89 c2                	mov    %eax,%edx
40000ad0:	c1 e2 18             	shl    $0x18,%edx
40000ad3:	89 c3                	mov    %eax,%ebx
40000ad5:	c1 e3 10             	shl    $0x10,%ebx
40000ad8:	09 da                	or     %ebx,%edx
40000ada:	89 c3                	mov    %eax,%ebx
40000adc:	c1 e3 08             	shl    $0x8,%ebx
40000adf:	09 da                	or     %ebx,%edx
40000ae1:	09 d0                	or     %edx,%eax
			     :: "D" (v), "a" (c), "c" (n/4)
40000ae3:	c1 e9 02             	shr    $0x2,%ecx
		asm volatile("cld; rep stosl\n"
40000ae6:	fc                   	cld    
40000ae7:	f3 ab                	rep stos %eax,%es:(%edi)
40000ae9:	eb d9                	jmp    40000ac4 <memset+0x22>

40000aeb <memmove>:

void *
memmove(void *dst, const void *src, size_t n)
{
40000aeb:	57                   	push   %edi
40000aec:	56                   	push   %esi
40000aed:	8b 44 24 0c          	mov    0xc(%esp),%eax
40000af1:	8b 74 24 10          	mov    0x10(%esp),%esi
40000af5:	8b 4c 24 14          	mov    0x14(%esp),%ecx
	const char *s;
	char *d;

	s = src;
	d = dst;
	if (s < d && s + n > d) {
40000af9:	39 c6                	cmp    %eax,%esi
40000afb:	73 36                	jae    40000b33 <memmove+0x48>
40000afd:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
40000b00:	39 d0                	cmp    %edx,%eax
40000b02:	73 2f                	jae    40000b33 <memmove+0x48>
		s += n;
		d += n;
40000b04:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
		if ((int)s%4 == 0 && (int)d%4 == 0 && n%4 == 0)
40000b07:	f6 c2 03             	test   $0x3,%dl
40000b0a:	75 1b                	jne    40000b27 <memmove+0x3c>
40000b0c:	f7 c7 03 00 00 00    	test   $0x3,%edi
40000b12:	75 13                	jne    40000b27 <memmove+0x3c>
40000b14:	f6 c1 03             	test   $0x3,%cl
40000b17:	75 0e                	jne    40000b27 <memmove+0x3c>
			asm volatile("std; rep movsl\n"
				     :: "D" (d-4), "S" (s-4), "c" (n/4)
40000b19:	83 ef 04             	sub    $0x4,%edi
40000b1c:	8d 72 fc             	lea    -0x4(%edx),%esi
40000b1f:	c1 e9 02             	shr    $0x2,%ecx
			asm volatile("std; rep movsl\n"
40000b22:	fd                   	std    
40000b23:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
40000b25:	eb 09                	jmp    40000b30 <memmove+0x45>
				     : "cc", "memory");
		else
			asm volatile("std; rep movsb\n"
				     :: "D" (d-1), "S" (s-1), "c" (n)
40000b27:	83 ef 01             	sub    $0x1,%edi
40000b2a:	8d 72 ff             	lea    -0x1(%edx),%esi
			asm volatile("std; rep movsb\n"
40000b2d:	fd                   	std    
40000b2e:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
				     : "cc", "memory");
		// Some versions of GCC rely on DF being clear
		asm volatile("cld" ::: "cc");
40000b30:	fc                   	cld    
40000b31:	eb 16                	jmp    40000b49 <memmove+0x5e>
	} else {
		if ((int)s%4 == 0 && (int)d%4 == 0 && n%4 == 0)
40000b33:	f7 c6 03 00 00 00    	test   $0x3,%esi
40000b39:	75 09                	jne    40000b44 <memmove+0x59>
40000b3b:	a8 03                	test   $0x3,%al
40000b3d:	75 05                	jne    40000b44 <memmove+0x59>
40000b3f:	f6 c1 03             	test   $0x3,%cl
40000b42:	74 08                	je     40000b4c <memmove+0x61>
			asm volatile("cld; rep movsl\n"
				     :: "D" (d), "S" (s), "c" (n/4)
				     : "cc", "memory");
		else
			asm volatile("cld; rep movsb\n"
40000b44:	89 c7                	mov    %eax,%edi
40000b46:	fc                   	cld    
40000b47:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
				     :: "D" (d), "S" (s), "c" (n)
				     : "cc", "memory");
	}
	return dst;
}
40000b49:	5e                   	pop    %esi
40000b4a:	5f                   	pop    %edi
40000b4b:	c3                   	ret    
				     :: "D" (d), "S" (s), "c" (n/4)
40000b4c:	c1 e9 02             	shr    $0x2,%ecx
			asm volatile("cld; rep movsl\n"
40000b4f:	89 c7                	mov    %eax,%edi
40000b51:	fc                   	cld    
40000b52:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
40000b54:	eb f3                	jmp    40000b49 <memmove+0x5e>

40000b56 <memcpy>:

void *
memcpy(void *dst, const void *src, size_t n)
{
	return memmove(dst, src, n);
40000b56:	ff 74 24 0c          	pushl  0xc(%esp)
40000b5a:	ff 74 24 0c          	pushl  0xc(%esp)
40000b5e:	ff 74 24 0c          	pushl  0xc(%esp)
40000b62:	e8 84 ff ff ff       	call   40000aeb <memmove>
40000b67:	83 c4 0c             	add    $0xc,%esp
}
40000b6a:	c3                   	ret    

40000b6b <memcmp>:

int
memcmp(const void *v1, const void *v2, size_t n)
{
40000b6b:	56                   	push   %esi
40000b6c:	53                   	push   %ebx
40000b6d:	8b 44 24 14          	mov    0x14(%esp),%eax
	const uint8_t *s1 = (const uint8_t *) v1;
	const uint8_t *s2 = (const uint8_t *) v2;
40000b71:	8b 4c 24 10          	mov    0x10(%esp),%ecx
	const uint8_t *s1 = (const uint8_t *) v1;
40000b75:	8b 54 24 0c          	mov    0xc(%esp),%edx

	while (n-- > 0) {
40000b79:	8d 70 ff             	lea    -0x1(%eax),%esi
40000b7c:	85 c0                	test   %eax,%eax
40000b7e:	74 1c                	je     40000b9c <memcmp+0x31>
		if (*s1 != *s2)
40000b80:	0f b6 02             	movzbl (%edx),%eax
40000b83:	0f b6 19             	movzbl (%ecx),%ebx
40000b86:	38 d8                	cmp    %bl,%al
40000b88:	75 0a                	jne    40000b94 <memcmp+0x29>
			return (int) *s1 - (int) *s2;
		s1++, s2++;
40000b8a:	83 c2 01             	add    $0x1,%edx
40000b8d:	83 c1 01             	add    $0x1,%ecx
	while (n-- > 0) {
40000b90:	89 f0                	mov    %esi,%eax
40000b92:	eb e5                	jmp    40000b79 <memcmp+0xe>
			return (int) *s1 - (int) *s2;
40000b94:	0f b6 c0             	movzbl %al,%eax
40000b97:	0f b6 db             	movzbl %bl,%ebx
40000b9a:	29 d8                	sub    %ebx,%eax
	}

	return 0;
}
40000b9c:	5b                   	pop    %ebx
40000b9d:	5e                   	pop    %esi
40000b9e:	c3                   	ret    

40000b9f <memchr>:

void *
memchr(const void *s, int c, size_t n)
{
40000b9f:	8b 44 24 04          	mov    0x4(%esp),%eax
40000ba3:	8b 4c 24 08          	mov    0x8(%esp),%ecx
	const void *ends = (const char *) s + n;
40000ba7:	89 c2                	mov    %eax,%edx
40000ba9:	03 54 24 0c          	add    0xc(%esp),%edx
	for (; s < ends; s++)
40000bad:	39 d0                	cmp    %edx,%eax
40000baf:	73 09                	jae    40000bba <memchr+0x1b>
		if (*(const unsigned char *) s == (unsigned char) c)
40000bb1:	38 08                	cmp    %cl,(%eax)
40000bb3:	74 0a                	je     40000bbf <memchr+0x20>
	for (; s < ends; s++)
40000bb5:	83 c0 01             	add    $0x1,%eax
40000bb8:	eb f3                	jmp    40000bad <memchr+0xe>
			return (void *) s;
	return NULL;
40000bba:	b8 00 00 00 00       	mov    $0x0,%eax
}
40000bbf:	f3 c3                	repz ret 

40000bc1 <memzero>:

void *
memzero(void *v, size_t n)
{
	return memset(v, 0, n);
40000bc1:	ff 74 24 08          	pushl  0x8(%esp)
40000bc5:	6a 00                	push   $0x0
40000bc7:	ff 74 24 0c          	pushl  0xc(%esp)
40000bcb:	e8 d2 fe ff ff       	call   40000aa2 <memset>
40000bd0:	83 c4 0c             	add    $0xc,%esp
}
40000bd3:	c3                   	ret    

40000bd4 <main>:
#include <x86.h>

uint32_t global_test = 0x12345678;

int main (int argc, char **argv)
{
40000bd4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
40000bd8:	83 e4 f0             	and    $0xfffffff0,%esp
40000bdb:	ff 71 fc             	pushl  -0x4(%ecx)
40000bde:	55                   	push   %ebp
40000bdf:	89 e5                	mov    %esp,%ebp
40000be1:	56                   	push   %esi
40000be2:	53                   	push   %ebx
40000be3:	51                   	push   %ecx
40000be4:	83 ec 0c             	sub    $0xc,%esp
40000be7:	e8 9e 00 00 00       	call   40000c8a <__x86.get_pc_thunk.si>
40000bec:	81 c6 14 24 00 00    	add    $0x2414,%esi
sys_fork(void)
{
	int errno;
	pid_t pid;

	asm volatile("int %2" 
40000bf2:	b8 03 00 00 00       	mov    $0x3,%eax
40000bf7:	cd 30                	int    $0x30
    pid_t pid;

    pid = sys_fork();

    if (pid == 0){
40000bf9:	85 db                	test   %ebx,%ebx
40000bfb:	75 52                	jne    40000c4f <main+0x7b>
40000bfd:	b8 03 00 00 00       	mov    $0x3,%eax
40000c02:	cd 30                	int    $0x30
        pid = sys_fork();

        if(pid == 0){
40000c04:	85 db                	test   %ebx,%ebx
40000c06:	75 2a                	jne    40000c32 <main+0x5e>
            printf("This is grandchild, global = %p\n", global_test);
40000c08:	83 ec 08             	sub    $0x8,%esp
40000c0b:	ff b6 0c 00 00 00    	pushl  0xc(%esi)
40000c11:	8d 86 98 e0 ff ff    	lea    -0x1f68(%esi),%eax
40000c17:	50                   	push   %eax
40000c18:	89 f3                	mov    %esi,%ebx
40000c1a:	e8 d3 f5 ff ff       	call   400001f2 <printf>
40000c1f:	83 c4 10             	add    $0x10,%esp
        global_test = 0x5678;
        printf("parent global_test1 = %p\n", global_test);
    }

    return 0;
}
40000c22:	b8 00 00 00 00       	mov    $0x0,%eax
40000c27:	8d 65 f4             	lea    -0xc(%ebp),%esp
40000c2a:	59                   	pop    %ecx
40000c2b:	5b                   	pop    %ebx
40000c2c:	5e                   	pop    %esi
40000c2d:	5d                   	pop    %ebp
40000c2e:	8d 61 fc             	lea    -0x4(%ecx),%esp
40000c31:	c3                   	ret    
            printf("Child forks %d, global = %p\n", pid, global_test);
40000c32:	83 ec 04             	sub    $0x4,%esp
40000c35:	ff b6 0c 00 00 00    	pushl  0xc(%esi)
40000c3b:	53                   	push   %ebx
40000c3c:	8d 86 bc e0 ff ff    	lea    -0x1f44(%esi),%eax
40000c42:	50                   	push   %eax
40000c43:	89 f3                	mov    %esi,%ebx
40000c45:	e8 a8 f5 ff ff       	call   400001f2 <printf>
40000c4a:	83 c4 10             	add    $0x10,%esp
40000c4d:	eb d3                	jmp    40000c22 <main+0x4e>
        printf("parent forks %d, global = %p\n", pid, global_test);
40000c4f:	83 ec 04             	sub    $0x4,%esp
40000c52:	ff b6 0c 00 00 00    	pushl  0xc(%esi)
40000c58:	53                   	push   %ebx
40000c59:	8d 86 d9 e0 ff ff    	lea    -0x1f27(%esi),%eax
40000c5f:	50                   	push   %eax
40000c60:	89 f3                	mov    %esi,%ebx
40000c62:	e8 8b f5 ff ff       	call   400001f2 <printf>
        global_test = 0x5678;
40000c67:	c7 86 0c 00 00 00 78 	movl   $0x5678,0xc(%esi)
40000c6e:	56 00 00 
        printf("parent global_test1 = %p\n", global_test);
40000c71:	83 c4 08             	add    $0x8,%esp
40000c74:	68 78 56 00 00       	push   $0x5678
40000c79:	8d 86 f7 e0 ff ff    	lea    -0x1f09(%esi),%eax
40000c7f:	50                   	push   %eax
40000c80:	e8 6d f5 ff ff       	call   400001f2 <printf>
40000c85:	83 c4 10             	add    $0x10,%esp
40000c88:	eb 98                	jmp    40000c22 <main+0x4e>

40000c8a <__x86.get_pc_thunk.si>:
40000c8a:	8b 34 24             	mov    (%esp),%esi
40000c8d:	c3                   	ret    
40000c8e:	66 90                	xchg   %ax,%ax

40000c90 <__udivdi3>:
40000c90:	55                   	push   %ebp
40000c91:	57                   	push   %edi
40000c92:	56                   	push   %esi
40000c93:	53                   	push   %ebx
40000c94:	83 ec 1c             	sub    $0x1c,%esp
40000c97:	8b 74 24 3c          	mov    0x3c(%esp),%esi
40000c9b:	8b 5c 24 30          	mov    0x30(%esp),%ebx
40000c9f:	8b 4c 24 34          	mov    0x34(%esp),%ecx
40000ca3:	8b 7c 24 38          	mov    0x38(%esp),%edi
40000ca7:	85 f6                	test   %esi,%esi
40000ca9:	89 5c 24 08          	mov    %ebx,0x8(%esp)
40000cad:	89 ca                	mov    %ecx,%edx
40000caf:	89 f8                	mov    %edi,%eax
40000cb1:	75 3d                	jne    40000cf0 <__udivdi3+0x60>
40000cb3:	39 cf                	cmp    %ecx,%edi
40000cb5:	0f 87 c5 00 00 00    	ja     40000d80 <__udivdi3+0xf0>
40000cbb:	85 ff                	test   %edi,%edi
40000cbd:	89 fd                	mov    %edi,%ebp
40000cbf:	75 0b                	jne    40000ccc <__udivdi3+0x3c>
40000cc1:	b8 01 00 00 00       	mov    $0x1,%eax
40000cc6:	31 d2                	xor    %edx,%edx
40000cc8:	f7 f7                	div    %edi
40000cca:	89 c5                	mov    %eax,%ebp
40000ccc:	89 c8                	mov    %ecx,%eax
40000cce:	31 d2                	xor    %edx,%edx
40000cd0:	f7 f5                	div    %ebp
40000cd2:	89 c1                	mov    %eax,%ecx
40000cd4:	89 d8                	mov    %ebx,%eax
40000cd6:	89 cf                	mov    %ecx,%edi
40000cd8:	f7 f5                	div    %ebp
40000cda:	89 c3                	mov    %eax,%ebx
40000cdc:	89 d8                	mov    %ebx,%eax
40000cde:	89 fa                	mov    %edi,%edx
40000ce0:	83 c4 1c             	add    $0x1c,%esp
40000ce3:	5b                   	pop    %ebx
40000ce4:	5e                   	pop    %esi
40000ce5:	5f                   	pop    %edi
40000ce6:	5d                   	pop    %ebp
40000ce7:	c3                   	ret    
40000ce8:	90                   	nop
40000ce9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40000cf0:	39 ce                	cmp    %ecx,%esi
40000cf2:	77 74                	ja     40000d68 <__udivdi3+0xd8>
40000cf4:	0f bd fe             	bsr    %esi,%edi
40000cf7:	83 f7 1f             	xor    $0x1f,%edi
40000cfa:	0f 84 98 00 00 00    	je     40000d98 <__udivdi3+0x108>
40000d00:	bb 20 00 00 00       	mov    $0x20,%ebx
40000d05:	89 f9                	mov    %edi,%ecx
40000d07:	89 c5                	mov    %eax,%ebp
40000d09:	29 fb                	sub    %edi,%ebx
40000d0b:	d3 e6                	shl    %cl,%esi
40000d0d:	89 d9                	mov    %ebx,%ecx
40000d0f:	d3 ed                	shr    %cl,%ebp
40000d11:	89 f9                	mov    %edi,%ecx
40000d13:	d3 e0                	shl    %cl,%eax
40000d15:	09 ee                	or     %ebp,%esi
40000d17:	89 d9                	mov    %ebx,%ecx
40000d19:	89 44 24 0c          	mov    %eax,0xc(%esp)
40000d1d:	89 d5                	mov    %edx,%ebp
40000d1f:	8b 44 24 08          	mov    0x8(%esp),%eax
40000d23:	d3 ed                	shr    %cl,%ebp
40000d25:	89 f9                	mov    %edi,%ecx
40000d27:	d3 e2                	shl    %cl,%edx
40000d29:	89 d9                	mov    %ebx,%ecx
40000d2b:	d3 e8                	shr    %cl,%eax
40000d2d:	09 c2                	or     %eax,%edx
40000d2f:	89 d0                	mov    %edx,%eax
40000d31:	89 ea                	mov    %ebp,%edx
40000d33:	f7 f6                	div    %esi
40000d35:	89 d5                	mov    %edx,%ebp
40000d37:	89 c3                	mov    %eax,%ebx
40000d39:	f7 64 24 0c          	mull   0xc(%esp)
40000d3d:	39 d5                	cmp    %edx,%ebp
40000d3f:	72 10                	jb     40000d51 <__udivdi3+0xc1>
40000d41:	8b 74 24 08          	mov    0x8(%esp),%esi
40000d45:	89 f9                	mov    %edi,%ecx
40000d47:	d3 e6                	shl    %cl,%esi
40000d49:	39 c6                	cmp    %eax,%esi
40000d4b:	73 07                	jae    40000d54 <__udivdi3+0xc4>
40000d4d:	39 d5                	cmp    %edx,%ebp
40000d4f:	75 03                	jne    40000d54 <__udivdi3+0xc4>
40000d51:	83 eb 01             	sub    $0x1,%ebx
40000d54:	31 ff                	xor    %edi,%edi
40000d56:	89 d8                	mov    %ebx,%eax
40000d58:	89 fa                	mov    %edi,%edx
40000d5a:	83 c4 1c             	add    $0x1c,%esp
40000d5d:	5b                   	pop    %ebx
40000d5e:	5e                   	pop    %esi
40000d5f:	5f                   	pop    %edi
40000d60:	5d                   	pop    %ebp
40000d61:	c3                   	ret    
40000d62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40000d68:	31 ff                	xor    %edi,%edi
40000d6a:	31 db                	xor    %ebx,%ebx
40000d6c:	89 d8                	mov    %ebx,%eax
40000d6e:	89 fa                	mov    %edi,%edx
40000d70:	83 c4 1c             	add    $0x1c,%esp
40000d73:	5b                   	pop    %ebx
40000d74:	5e                   	pop    %esi
40000d75:	5f                   	pop    %edi
40000d76:	5d                   	pop    %ebp
40000d77:	c3                   	ret    
40000d78:	90                   	nop
40000d79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40000d80:	89 d8                	mov    %ebx,%eax
40000d82:	f7 f7                	div    %edi
40000d84:	31 ff                	xor    %edi,%edi
40000d86:	89 c3                	mov    %eax,%ebx
40000d88:	89 d8                	mov    %ebx,%eax
40000d8a:	89 fa                	mov    %edi,%edx
40000d8c:	83 c4 1c             	add    $0x1c,%esp
40000d8f:	5b                   	pop    %ebx
40000d90:	5e                   	pop    %esi
40000d91:	5f                   	pop    %edi
40000d92:	5d                   	pop    %ebp
40000d93:	c3                   	ret    
40000d94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
40000d98:	39 ce                	cmp    %ecx,%esi
40000d9a:	72 0c                	jb     40000da8 <__udivdi3+0x118>
40000d9c:	31 db                	xor    %ebx,%ebx
40000d9e:	3b 44 24 08          	cmp    0x8(%esp),%eax
40000da2:	0f 87 34 ff ff ff    	ja     40000cdc <__udivdi3+0x4c>
40000da8:	bb 01 00 00 00       	mov    $0x1,%ebx
40000dad:	e9 2a ff ff ff       	jmp    40000cdc <__udivdi3+0x4c>
40000db2:	66 90                	xchg   %ax,%ax
40000db4:	66 90                	xchg   %ax,%ax
40000db6:	66 90                	xchg   %ax,%ax
40000db8:	66 90                	xchg   %ax,%ax
40000dba:	66 90                	xchg   %ax,%ax
40000dbc:	66 90                	xchg   %ax,%ax
40000dbe:	66 90                	xchg   %ax,%ax

40000dc0 <__umoddi3>:
40000dc0:	55                   	push   %ebp
40000dc1:	57                   	push   %edi
40000dc2:	56                   	push   %esi
40000dc3:	53                   	push   %ebx
40000dc4:	83 ec 1c             	sub    $0x1c,%esp
40000dc7:	8b 44 24 3c          	mov    0x3c(%esp),%eax
40000dcb:	8b 4c 24 30          	mov    0x30(%esp),%ecx
40000dcf:	8b 74 24 34          	mov    0x34(%esp),%esi
40000dd3:	8b 7c 24 38          	mov    0x38(%esp),%edi
40000dd7:	85 c0                	test   %eax,%eax
40000dd9:	89 44 24 0c          	mov    %eax,0xc(%esp)
40000ddd:	89 4c 24 08          	mov    %ecx,0x8(%esp)
40000de1:	89 3c 24             	mov    %edi,(%esp)
40000de4:	89 4c 24 04          	mov    %ecx,0x4(%esp)
40000de8:	89 f2                	mov    %esi,%edx
40000dea:	75 14                	jne    40000e00 <__umoddi3+0x40>
40000dec:	39 f7                	cmp    %esi,%edi
40000dee:	76 40                	jbe    40000e30 <__umoddi3+0x70>
40000df0:	89 c8                	mov    %ecx,%eax
40000df2:	f7 f7                	div    %edi
40000df4:	89 d0                	mov    %edx,%eax
40000df6:	31 d2                	xor    %edx,%edx
40000df8:	83 c4 1c             	add    $0x1c,%esp
40000dfb:	5b                   	pop    %ebx
40000dfc:	5e                   	pop    %esi
40000dfd:	5f                   	pop    %edi
40000dfe:	5d                   	pop    %ebp
40000dff:	c3                   	ret    
40000e00:	39 f0                	cmp    %esi,%eax
40000e02:	89 f3                	mov    %esi,%ebx
40000e04:	77 4a                	ja     40000e50 <__umoddi3+0x90>
40000e06:	0f bd e8             	bsr    %eax,%ebp
40000e09:	83 f5 1f             	xor    $0x1f,%ebp
40000e0c:	75 52                	jne    40000e60 <__umoddi3+0xa0>
40000e0e:	39 f0                	cmp    %esi,%eax
40000e10:	0f 82 da 00 00 00    	jb     40000ef0 <__umoddi3+0x130>
40000e16:	39 0c 24             	cmp    %ecx,(%esp)
40000e19:	0f 86 d1 00 00 00    	jbe    40000ef0 <__umoddi3+0x130>
40000e1f:	8b 44 24 04          	mov    0x4(%esp),%eax
40000e23:	83 c4 1c             	add    $0x1c,%esp
40000e26:	5b                   	pop    %ebx
40000e27:	5e                   	pop    %esi
40000e28:	5f                   	pop    %edi
40000e29:	5d                   	pop    %ebp
40000e2a:	c3                   	ret    
40000e2b:	90                   	nop
40000e2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
40000e30:	85 ff                	test   %edi,%edi
40000e32:	89 fd                	mov    %edi,%ebp
40000e34:	75 0b                	jne    40000e41 <__umoddi3+0x81>
40000e36:	b8 01 00 00 00       	mov    $0x1,%eax
40000e3b:	31 d2                	xor    %edx,%edx
40000e3d:	f7 f7                	div    %edi
40000e3f:	89 c5                	mov    %eax,%ebp
40000e41:	89 f0                	mov    %esi,%eax
40000e43:	31 d2                	xor    %edx,%edx
40000e45:	f7 f5                	div    %ebp
40000e47:	89 c8                	mov    %ecx,%eax
40000e49:	f7 f5                	div    %ebp
40000e4b:	eb a7                	jmp    40000df4 <__umoddi3+0x34>
40000e4d:	8d 76 00             	lea    0x0(%esi),%esi
40000e50:	89 c8                	mov    %ecx,%eax
40000e52:	89 f2                	mov    %esi,%edx
40000e54:	83 c4 1c             	add    $0x1c,%esp
40000e57:	5b                   	pop    %ebx
40000e58:	5e                   	pop    %esi
40000e59:	5f                   	pop    %edi
40000e5a:	5d                   	pop    %ebp
40000e5b:	c3                   	ret    
40000e5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
40000e60:	8b 34 24             	mov    (%esp),%esi
40000e63:	bf 20 00 00 00       	mov    $0x20,%edi
40000e68:	89 e9                	mov    %ebp,%ecx
40000e6a:	29 ef                	sub    %ebp,%edi
40000e6c:	d3 e0                	shl    %cl,%eax
40000e6e:	89 f9                	mov    %edi,%ecx
40000e70:	89 f2                	mov    %esi,%edx
40000e72:	d3 ea                	shr    %cl,%edx
40000e74:	89 e9                	mov    %ebp,%ecx
40000e76:	09 c2                	or     %eax,%edx
40000e78:	89 d8                	mov    %ebx,%eax
40000e7a:	89 14 24             	mov    %edx,(%esp)
40000e7d:	89 f2                	mov    %esi,%edx
40000e7f:	d3 e2                	shl    %cl,%edx
40000e81:	89 f9                	mov    %edi,%ecx
40000e83:	89 54 24 04          	mov    %edx,0x4(%esp)
40000e87:	8b 54 24 08          	mov    0x8(%esp),%edx
40000e8b:	d3 e8                	shr    %cl,%eax
40000e8d:	89 e9                	mov    %ebp,%ecx
40000e8f:	89 c6                	mov    %eax,%esi
40000e91:	d3 e3                	shl    %cl,%ebx
40000e93:	89 f9                	mov    %edi,%ecx
40000e95:	89 d0                	mov    %edx,%eax
40000e97:	d3 e8                	shr    %cl,%eax
40000e99:	89 e9                	mov    %ebp,%ecx
40000e9b:	09 d8                	or     %ebx,%eax
40000e9d:	89 d3                	mov    %edx,%ebx
40000e9f:	89 f2                	mov    %esi,%edx
40000ea1:	f7 34 24             	divl   (%esp)
40000ea4:	89 d6                	mov    %edx,%esi
40000ea6:	d3 e3                	shl    %cl,%ebx
40000ea8:	f7 64 24 04          	mull   0x4(%esp)
40000eac:	39 d6                	cmp    %edx,%esi
40000eae:	89 5c 24 08          	mov    %ebx,0x8(%esp)
40000eb2:	89 d1                	mov    %edx,%ecx
40000eb4:	89 c3                	mov    %eax,%ebx
40000eb6:	72 08                	jb     40000ec0 <__umoddi3+0x100>
40000eb8:	75 11                	jne    40000ecb <__umoddi3+0x10b>
40000eba:	39 44 24 08          	cmp    %eax,0x8(%esp)
40000ebe:	73 0b                	jae    40000ecb <__umoddi3+0x10b>
40000ec0:	2b 44 24 04          	sub    0x4(%esp),%eax
40000ec4:	1b 14 24             	sbb    (%esp),%edx
40000ec7:	89 d1                	mov    %edx,%ecx
40000ec9:	89 c3                	mov    %eax,%ebx
40000ecb:	8b 54 24 08          	mov    0x8(%esp),%edx
40000ecf:	29 da                	sub    %ebx,%edx
40000ed1:	19 ce                	sbb    %ecx,%esi
40000ed3:	89 f9                	mov    %edi,%ecx
40000ed5:	89 f0                	mov    %esi,%eax
40000ed7:	d3 e0                	shl    %cl,%eax
40000ed9:	89 e9                	mov    %ebp,%ecx
40000edb:	d3 ea                	shr    %cl,%edx
40000edd:	89 e9                	mov    %ebp,%ecx
40000edf:	d3 ee                	shr    %cl,%esi
40000ee1:	09 d0                	or     %edx,%eax
40000ee3:	89 f2                	mov    %esi,%edx
40000ee5:	83 c4 1c             	add    $0x1c,%esp
40000ee8:	5b                   	pop    %ebx
40000ee9:	5e                   	pop    %esi
40000eea:	5f                   	pop    %edi
40000eeb:	5d                   	pop    %ebp
40000eec:	c3                   	ret    
40000eed:	8d 76 00             	lea    0x0(%esi),%esi
40000ef0:	89 f2                	mov    %esi,%edx
40000ef2:	29 f9                	sub    %edi,%ecx
40000ef4:	1b 54 24 0c          	sbb    0xc(%esp),%edx
40000ef8:	89 4c 24 04          	mov    %ecx,0x4(%esp)
40000efc:	e9 1e ff ff ff       	jmp    40000e1f <__umoddi3+0x5f>
