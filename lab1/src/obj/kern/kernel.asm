
obj/kern/kernel:     file format elf32-i386


Disassembly of section .text:

00100000 <video_init>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	53                   	push   %ebx
  100004:	83 ec 14             	sub    $0x14,%esp
  100007:	e8 03 04 00 00       	call   10040f <__x86.get_pc_thunk.bx>
  10000c:	81 c3 f4 bf 00 00    	add    $0xbff4,%ebx
  100012:	c7 45 f4 00 80 0b 00 	movl   $0xb8000,-0xc(%ebp)
  100019:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10001c:	0f b7 00             	movzwl (%eax),%eax
  10001f:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
  100023:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100026:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
  10002b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10002e:	0f b7 00             	movzwl (%eax),%eax
  100031:	66 3d 5a a5          	cmp    $0xa55a,%ax
  100035:	74 30                	je     100067 <video_init+0x67>
  100037:	c7 45 f4 00 00 0b 00 	movl   $0xb0000,-0xc(%ebp)
  10003e:	c7 c0 8c 44 91 00    	mov    $0x91448c,%eax
  100044:	c7 00 b4 03 00 00    	movl   $0x3b4,(%eax)
  10004a:	c7 c0 8c 44 91 00    	mov    $0x91448c,%eax
  100050:	8b 00                	mov    (%eax),%eax
  100052:	83 ec 08             	sub    $0x8,%esp
  100055:	50                   	push   %eax
  100056:	8d 83 f4 b2 ff ff    	lea    -0x4d0c(%ebx),%eax
  10005c:	50                   	push   %eax
  10005d:	e8 36 33 00 00       	call   103398 <dprintf>
  100062:	83 c4 10             	add    $0x10,%esp
  100065:	eb 31                	jmp    100098 <video_init+0x98>
  100067:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10006a:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  10006e:	66 89 10             	mov    %dx,(%eax)
  100071:	c7 c0 8c 44 91 00    	mov    $0x91448c,%eax
  100077:	c7 00 d4 03 00 00    	movl   $0x3d4,(%eax)
  10007d:	c7 c0 8c 44 91 00    	mov    $0x91448c,%eax
  100083:	8b 00                	mov    (%eax),%eax
  100085:	83 ec 08             	sub    $0x8,%esp
  100088:	50                   	push   %eax
  100089:	8d 83 f4 b2 ff ff    	lea    -0x4d0c(%ebx),%eax
  10008f:	50                   	push   %eax
  100090:	e8 03 33 00 00       	call   103398 <dprintf>
  100095:	83 c4 10             	add    $0x10,%esp
  100098:	c7 c0 8c 44 91 00    	mov    $0x91448c,%eax
  10009e:	8b 00                	mov    (%eax),%eax
  1000a0:	83 ec 08             	sub    $0x8,%esp
  1000a3:	6a 0e                	push   $0xe
  1000a5:	50                   	push   %eax
  1000a6:	e8 ed 40 00 00       	call   104198 <outb>
  1000ab:	83 c4 10             	add    $0x10,%esp
  1000ae:	c7 c0 8c 44 91 00    	mov    $0x91448c,%eax
  1000b4:	8b 00                	mov    (%eax),%eax
  1000b6:	83 c0 01             	add    $0x1,%eax
  1000b9:	83 ec 0c             	sub    $0xc,%esp
  1000bc:	50                   	push   %eax
  1000bd:	e8 87 40 00 00       	call   104149 <inb>
  1000c2:	83 c4 10             	add    $0x10,%esp
  1000c5:	0f b6 c0             	movzbl %al,%eax
  1000c8:	c1 e0 08             	shl    $0x8,%eax
  1000cb:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1000ce:	c7 c0 8c 44 91 00    	mov    $0x91448c,%eax
  1000d4:	8b 00                	mov    (%eax),%eax
  1000d6:	83 ec 08             	sub    $0x8,%esp
  1000d9:	6a 0f                	push   $0xf
  1000db:	50                   	push   %eax
  1000dc:	e8 b7 40 00 00       	call   104198 <outb>
  1000e1:	83 c4 10             	add    $0x10,%esp
  1000e4:	c7 c0 8c 44 91 00    	mov    $0x91448c,%eax
  1000ea:	8b 00                	mov    (%eax),%eax
  1000ec:	83 c0 01             	add    $0x1,%eax
  1000ef:	83 ec 0c             	sub    $0xc,%esp
  1000f2:	50                   	push   %eax
  1000f3:	e8 51 40 00 00       	call   104149 <inb>
  1000f8:	83 c4 10             	add    $0x10,%esp
  1000fb:	0f b6 c0             	movzbl %al,%eax
  1000fe:	09 45 ec             	or     %eax,-0x14(%ebp)
  100101:	c7 c0 80 44 91 00    	mov    $0x914480,%eax
  100107:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10010a:	89 10                	mov    %edx,(%eax)
  10010c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10010f:	89 c2                	mov    %eax,%edx
  100111:	c7 c0 80 44 91 00    	mov    $0x914480,%eax
  100117:	66 89 50 04          	mov    %dx,0x4(%eax)
  10011b:	c7 c0 80 44 91 00    	mov    $0x914480,%eax
  100121:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
  100128:	90                   	nop
  100129:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10012c:	c9                   	leave  
  10012d:	c3                   	ret    

0010012e <video_putc>:
  10012e:	55                   	push   %ebp
  10012f:	89 e5                	mov    %esp,%ebp
  100131:	56                   	push   %esi
  100132:	53                   	push   %ebx
  100133:	83 ec 10             	sub    $0x10,%esp
  100136:	e8 d4 02 00 00       	call   10040f <__x86.get_pc_thunk.bx>
  10013b:	81 c3 c5 be 00 00    	add    $0xbec5,%ebx
  100141:	8b 45 08             	mov    0x8(%ebp),%eax
  100144:	b0 00                	mov    $0x0,%al
  100146:	85 c0                	test   %eax,%eax
  100148:	75 07                	jne    100151 <video_putc+0x23>
  10014a:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
  100151:	8b 45 08             	mov    0x8(%ebp),%eax
  100154:	0f b6 c0             	movzbl %al,%eax
  100157:	83 f8 09             	cmp    $0x9,%eax
  10015a:	0f 84 cc 00 00 00    	je     10022c <video_putc+0xfe>
  100160:	83 f8 09             	cmp    $0x9,%eax
  100163:	7f 0a                	jg     10016f <video_putc+0x41>
  100165:	83 f8 08             	cmp    $0x8,%eax
  100168:	74 14                	je     10017e <video_putc+0x50>
  10016a:	e9 00 01 00 00       	jmp    10026f <video_putc+0x141>
  10016f:	83 f8 0a             	cmp    $0xa,%eax
  100172:	74 5d                	je     1001d1 <video_putc+0xa3>
  100174:	83 f8 0d             	cmp    $0xd,%eax
  100177:	74 6f                	je     1001e8 <video_putc+0xba>
  100179:	e9 f1 00 00 00       	jmp    10026f <video_putc+0x141>
  10017e:	c7 c0 80 44 91 00    	mov    $0x914480,%eax
  100184:	0f b7 40 04          	movzwl 0x4(%eax),%eax
  100188:	66 85 c0             	test   %ax,%ax
  10018b:	0f 84 0c 01 00 00    	je     10029d <video_putc+0x16f>
  100191:	c7 c0 80 44 91 00    	mov    $0x914480,%eax
  100197:	0f b7 40 04          	movzwl 0x4(%eax),%eax
  10019b:	8d 50 ff             	lea    -0x1(%eax),%edx
  10019e:	c7 c0 80 44 91 00    	mov    $0x914480,%eax
  1001a4:	66 89 50 04          	mov    %dx,0x4(%eax)
  1001a8:	c7 c0 80 44 91 00    	mov    $0x914480,%eax
  1001ae:	8b 10                	mov    (%eax),%edx
  1001b0:	c7 c0 80 44 91 00    	mov    $0x914480,%eax
  1001b6:	0f b7 40 04          	movzwl 0x4(%eax),%eax
  1001ba:	0f b7 c0             	movzwl %ax,%eax
  1001bd:	01 c0                	add    %eax,%eax
  1001bf:	01 d0                	add    %edx,%eax
  1001c1:	8b 55 08             	mov    0x8(%ebp),%edx
  1001c4:	b2 00                	mov    $0x0,%dl
  1001c6:	83 ca 20             	or     $0x20,%edx
  1001c9:	66 89 10             	mov    %dx,(%eax)
  1001cc:	e9 cc 00 00 00       	jmp    10029d <video_putc+0x16f>
  1001d1:	c7 c0 80 44 91 00    	mov    $0x914480,%eax
  1001d7:	0f b7 40 04          	movzwl 0x4(%eax),%eax
  1001db:	8d 50 50             	lea    0x50(%eax),%edx
  1001de:	c7 c0 80 44 91 00    	mov    $0x914480,%eax
  1001e4:	66 89 50 04          	mov    %dx,0x4(%eax)
  1001e8:	c7 c0 80 44 91 00    	mov    $0x914480,%eax
  1001ee:	0f b7 70 04          	movzwl 0x4(%eax),%esi
  1001f2:	c7 c0 80 44 91 00    	mov    $0x914480,%eax
  1001f8:	0f b7 48 04          	movzwl 0x4(%eax),%ecx
  1001fc:	0f b7 c1             	movzwl %cx,%eax
  1001ff:	69 c0 cd cc 00 00    	imul   $0xcccd,%eax,%eax
  100205:	c1 e8 10             	shr    $0x10,%eax
  100208:	89 c2                	mov    %eax,%edx
  10020a:	66 c1 ea 06          	shr    $0x6,%dx
  10020e:	89 d0                	mov    %edx,%eax
  100210:	c1 e0 02             	shl    $0x2,%eax
  100213:	01 d0                	add    %edx,%eax
  100215:	c1 e0 04             	shl    $0x4,%eax
  100218:	29 c1                	sub    %eax,%ecx
  10021a:	89 ca                	mov    %ecx,%edx
  10021c:	29 d6                	sub    %edx,%esi
  10021e:	89 f2                	mov    %esi,%edx
  100220:	c7 c0 80 44 91 00    	mov    $0x914480,%eax
  100226:	66 89 50 04          	mov    %dx,0x4(%eax)
  10022a:	eb 72                	jmp    10029e <video_putc+0x170>
  10022c:	83 ec 0c             	sub    $0xc,%esp
  10022f:	6a 20                	push   $0x20
  100231:	e8 f8 fe ff ff       	call   10012e <video_putc>
  100236:	83 c4 10             	add    $0x10,%esp
  100239:	83 ec 0c             	sub    $0xc,%esp
  10023c:	6a 20                	push   $0x20
  10023e:	e8 eb fe ff ff       	call   10012e <video_putc>
  100243:	83 c4 10             	add    $0x10,%esp
  100246:	83 ec 0c             	sub    $0xc,%esp
  100249:	6a 20                	push   $0x20
  10024b:	e8 de fe ff ff       	call   10012e <video_putc>
  100250:	83 c4 10             	add    $0x10,%esp
  100253:	83 ec 0c             	sub    $0xc,%esp
  100256:	6a 20                	push   $0x20
  100258:	e8 d1 fe ff ff       	call   10012e <video_putc>
  10025d:	83 c4 10             	add    $0x10,%esp
  100260:	83 ec 0c             	sub    $0xc,%esp
  100263:	6a 20                	push   $0x20
  100265:	e8 c4 fe ff ff       	call   10012e <video_putc>
  10026a:	83 c4 10             	add    $0x10,%esp
  10026d:	eb 2f                	jmp    10029e <video_putc+0x170>
  10026f:	c7 c0 80 44 91 00    	mov    $0x914480,%eax
  100275:	8b 30                	mov    (%eax),%esi
  100277:	c7 c0 80 44 91 00    	mov    $0x914480,%eax
  10027d:	0f b7 40 04          	movzwl 0x4(%eax),%eax
  100281:	8d 48 01             	lea    0x1(%eax),%ecx
  100284:	c7 c2 80 44 91 00    	mov    $0x914480,%edx
  10028a:	66 89 4a 04          	mov    %cx,0x4(%edx)
  10028e:	0f b7 c0             	movzwl %ax,%eax
  100291:	01 c0                	add    %eax,%eax
  100293:	01 f0                	add    %esi,%eax
  100295:	8b 55 08             	mov    0x8(%ebp),%edx
  100298:	66 89 10             	mov    %dx,(%eax)
  10029b:	eb 01                	jmp    10029e <video_putc+0x170>
  10029d:	90                   	nop
  10029e:	c7 c0 80 44 91 00    	mov    $0x914480,%eax
  1002a4:	0f b7 40 04          	movzwl 0x4(%eax),%eax
  1002a8:	66 3d cf 07          	cmp    $0x7cf,%ax
  1002ac:	76 69                	jbe    100317 <video_putc+0x1e9>
  1002ae:	c7 c0 80 44 91 00    	mov    $0x914480,%eax
  1002b4:	8b 00                	mov    (%eax),%eax
  1002b6:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  1002bc:	c7 c0 80 44 91 00    	mov    $0x914480,%eax
  1002c2:	8b 00                	mov    (%eax),%eax
  1002c4:	83 ec 04             	sub    $0x4,%esp
  1002c7:	68 00 0f 00 00       	push   $0xf00
  1002cc:	52                   	push   %edx
  1002cd:	50                   	push   %eax
  1002ce:	e8 80 2b 00 00       	call   102e53 <memmove>
  1002d3:	83 c4 10             	add    $0x10,%esp
  1002d6:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  1002dd:	eb 18                	jmp    1002f7 <video_putc+0x1c9>
  1002df:	c7 c0 80 44 91 00    	mov    $0x914480,%eax
  1002e5:	8b 00                	mov    (%eax),%eax
  1002e7:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1002ea:	01 d2                	add    %edx,%edx
  1002ec:	01 d0                	add    %edx,%eax
  1002ee:	66 c7 00 20 07       	movw   $0x720,(%eax)
  1002f3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1002f7:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  1002fe:	7e df                	jle    1002df <video_putc+0x1b1>
  100300:	c7 c0 80 44 91 00    	mov    $0x914480,%eax
  100306:	0f b7 40 04          	movzwl 0x4(%eax),%eax
  10030a:	8d 50 b0             	lea    -0x50(%eax),%edx
  10030d:	c7 c0 80 44 91 00    	mov    $0x914480,%eax
  100313:	66 89 50 04          	mov    %dx,0x4(%eax)
  100317:	c7 c0 8c 44 91 00    	mov    $0x91448c,%eax
  10031d:	8b 00                	mov    (%eax),%eax
  10031f:	83 ec 08             	sub    $0x8,%esp
  100322:	6a 0e                	push   $0xe
  100324:	50                   	push   %eax
  100325:	e8 6e 3e 00 00       	call   104198 <outb>
  10032a:	83 c4 10             	add    $0x10,%esp
  10032d:	c7 c0 80 44 91 00    	mov    $0x914480,%eax
  100333:	0f b7 40 04          	movzwl 0x4(%eax),%eax
  100337:	66 c1 e8 08          	shr    $0x8,%ax
  10033b:	0f b6 c0             	movzbl %al,%eax
  10033e:	c7 c2 8c 44 91 00    	mov    $0x91448c,%edx
  100344:	8b 12                	mov    (%edx),%edx
  100346:	83 c2 01             	add    $0x1,%edx
  100349:	83 ec 08             	sub    $0x8,%esp
  10034c:	50                   	push   %eax
  10034d:	52                   	push   %edx
  10034e:	e8 45 3e 00 00       	call   104198 <outb>
  100353:	83 c4 10             	add    $0x10,%esp
  100356:	c7 c0 8c 44 91 00    	mov    $0x91448c,%eax
  10035c:	8b 00                	mov    (%eax),%eax
  10035e:	83 ec 08             	sub    $0x8,%esp
  100361:	6a 0f                	push   $0xf
  100363:	50                   	push   %eax
  100364:	e8 2f 3e 00 00       	call   104198 <outb>
  100369:	83 c4 10             	add    $0x10,%esp
  10036c:	c7 c0 80 44 91 00    	mov    $0x914480,%eax
  100372:	0f b7 40 04          	movzwl 0x4(%eax),%eax
  100376:	0f b6 c0             	movzbl %al,%eax
  100379:	c7 c2 8c 44 91 00    	mov    $0x91448c,%edx
  10037f:	8b 12                	mov    (%edx),%edx
  100381:	83 c2 01             	add    $0x1,%edx
  100384:	83 ec 08             	sub    $0x8,%esp
  100387:	50                   	push   %eax
  100388:	52                   	push   %edx
  100389:	e8 0a 3e 00 00       	call   104198 <outb>
  10038e:	83 c4 10             	add    $0x10,%esp
  100391:	90                   	nop
  100392:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100395:	5b                   	pop    %ebx
  100396:	5e                   	pop    %esi
  100397:	5d                   	pop    %ebp
  100398:	c3                   	ret    

00100399 <video_set_cursor>:
  100399:	55                   	push   %ebp
  10039a:	89 e5                	mov    %esp,%ebp
  10039c:	e8 6a 00 00 00       	call   10040b <__x86.get_pc_thunk.dx>
  1003a1:	81 c2 5f bc 00 00    	add    $0xbc5f,%edx
  1003a7:	8b 45 08             	mov    0x8(%ebp),%eax
  1003aa:	89 c1                	mov    %eax,%ecx
  1003ac:	89 c8                	mov    %ecx,%eax
  1003ae:	c1 e0 02             	shl    $0x2,%eax
  1003b1:	01 c8                	add    %ecx,%eax
  1003b3:	c1 e0 04             	shl    $0x4,%eax
  1003b6:	89 c1                	mov    %eax,%ecx
  1003b8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1003bb:	01 c1                	add    %eax,%ecx
  1003bd:	c7 c0 80 44 91 00    	mov    $0x914480,%eax
  1003c3:	66 89 48 04          	mov    %cx,0x4(%eax)
  1003c7:	90                   	nop
  1003c8:	5d                   	pop    %ebp
  1003c9:	c3                   	ret    

001003ca <video_clear_screen>:
  1003ca:	55                   	push   %ebp
  1003cb:	89 e5                	mov    %esp,%ebp
  1003cd:	83 ec 10             	sub    $0x10,%esp
  1003d0:	e8 32 00 00 00       	call   100407 <__x86.get_pc_thunk.ax>
  1003d5:	05 2b bc 00 00       	add    $0xbc2b,%eax
  1003da:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  1003e1:	eb 18                	jmp    1003fb <video_clear_screen+0x31>
  1003e3:	c7 c2 80 44 91 00    	mov    $0x914480,%edx
  1003e9:	8b 12                	mov    (%edx),%edx
  1003eb:	8b 4d fc             	mov    -0x4(%ebp),%ecx
  1003ee:	01 c9                	add    %ecx,%ecx
  1003f0:	01 ca                	add    %ecx,%edx
  1003f2:	66 c7 02 20 00       	movw   $0x20,(%edx)
  1003f7:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1003fb:	81 7d fc cf 07 00 00 	cmpl   $0x7cf,-0x4(%ebp)
  100402:	7e df                	jle    1003e3 <video_clear_screen+0x19>
  100404:	90                   	nop
  100405:	c9                   	leave  
  100406:	c3                   	ret    

00100407 <__x86.get_pc_thunk.ax>:
  100407:	8b 04 24             	mov    (%esp),%eax
  10040a:	c3                   	ret    

0010040b <__x86.get_pc_thunk.dx>:
  10040b:	8b 14 24             	mov    (%esp),%edx
  10040e:	c3                   	ret    

0010040f <__x86.get_pc_thunk.bx>:
  10040f:	8b 1c 24             	mov    (%esp),%ebx
  100412:	c3                   	ret    

00100413 <cons_init>:
  100413:	55                   	push   %ebp
  100414:	89 e5                	mov    %esp,%ebp
  100416:	53                   	push   %ebx
  100417:	83 ec 04             	sub    $0x4,%esp
  10041a:	e8 f0 ff ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  10041f:	81 c3 e1 bb 00 00    	add    $0xbbe1,%ebx
  100425:	83 ec 04             	sub    $0x4,%esp
  100428:	68 08 02 00 00       	push   $0x208
  10042d:	6a 00                	push   $0x0
  10042f:	c7 c0 a0 44 91 00    	mov    $0x9144a0,%eax
  100435:	50                   	push   %eax
  100436:	e8 a0 29 00 00       	call   102ddb <memset>
  10043b:	83 c4 10             	add    $0x10,%esp
  10043e:	e8 74 04 00 00       	call   1008b7 <serial_init>
  100443:	e8 b8 fb ff ff       	call   100000 <video_init>
  100448:	90                   	nop
  100449:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10044c:	c9                   	leave  
  10044d:	c3                   	ret    

0010044e <cons_intr>:
  10044e:	55                   	push   %ebp
  10044f:	89 e5                	mov    %esp,%ebp
  100451:	53                   	push   %ebx
  100452:	83 ec 14             	sub    $0x14,%esp
  100455:	e8 b5 ff ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  10045a:	81 c3 a6 bb 00 00    	add    $0xbba6,%ebx
  100460:	eb 54                	jmp    1004b6 <cons_intr+0x68>
  100462:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100466:	75 02                	jne    10046a <cons_intr+0x1c>
  100468:	eb 4c                	jmp    1004b6 <cons_intr+0x68>
  10046a:	c7 c0 a0 44 91 00    	mov    $0x9144a0,%eax
  100470:	8b 80 04 02 00 00    	mov    0x204(%eax),%eax
  100476:	8d 48 01             	lea    0x1(%eax),%ecx
  100479:	c7 c2 a0 44 91 00    	mov    $0x9144a0,%edx
  10047f:	89 8a 04 02 00 00    	mov    %ecx,0x204(%edx)
  100485:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100488:	89 d1                	mov    %edx,%ecx
  10048a:	c7 c2 a0 44 91 00    	mov    $0x9144a0,%edx
  100490:	88 0c 02             	mov    %cl,(%edx,%eax,1)
  100493:	c7 c0 a0 44 91 00    	mov    $0x9144a0,%eax
  100499:	8b 80 04 02 00 00    	mov    0x204(%eax),%eax
  10049f:	3d 00 02 00 00       	cmp    $0x200,%eax
  1004a4:	75 10                	jne    1004b6 <cons_intr+0x68>
  1004a6:	c7 c0 a0 44 91 00    	mov    $0x9144a0,%eax
  1004ac:	c7 80 04 02 00 00 00 	movl   $0x0,0x204(%eax)
  1004b3:	00 00 00 
  1004b6:	8b 45 08             	mov    0x8(%ebp),%eax
  1004b9:	ff d0                	call   *%eax
  1004bb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1004be:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  1004c2:	75 9e                	jne    100462 <cons_intr+0x14>
  1004c4:	90                   	nop
  1004c5:	83 c4 14             	add    $0x14,%esp
  1004c8:	5b                   	pop    %ebx
  1004c9:	5d                   	pop    %ebp
  1004ca:	c3                   	ret    

001004cb <cons_getc>:
  1004cb:	55                   	push   %ebp
  1004cc:	89 e5                	mov    %esp,%ebp
  1004ce:	53                   	push   %ebx
  1004cf:	83 ec 14             	sub    $0x14,%esp
  1004d2:	e8 38 ff ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  1004d7:	81 c3 29 bb 00 00    	add    $0xbb29,%ebx
  1004dd:	e8 a7 02 00 00       	call   100789 <serial_intr>
  1004e2:	e8 86 06 00 00       	call   100b6d <keyboard_intr>
  1004e7:	c7 c0 a0 44 91 00    	mov    $0x9144a0,%eax
  1004ed:	8b 90 00 02 00 00    	mov    0x200(%eax),%edx
  1004f3:	c7 c0 a0 44 91 00    	mov    $0x9144a0,%eax
  1004f9:	8b 80 04 02 00 00    	mov    0x204(%eax),%eax
  1004ff:	39 c2                	cmp    %eax,%edx
  100501:	74 53                	je     100556 <cons_getc+0x8b>
  100503:	c7 c0 a0 44 91 00    	mov    $0x9144a0,%eax
  100509:	8b 80 00 02 00 00    	mov    0x200(%eax),%eax
  10050f:	8d 48 01             	lea    0x1(%eax),%ecx
  100512:	c7 c2 a0 44 91 00    	mov    $0x9144a0,%edx
  100518:	89 8a 00 02 00 00    	mov    %ecx,0x200(%edx)
  10051e:	c7 c2 a0 44 91 00    	mov    $0x9144a0,%edx
  100524:	0f b6 04 02          	movzbl (%edx,%eax,1),%eax
  100528:	0f be c0             	movsbl %al,%eax
  10052b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10052e:	c7 c0 a0 44 91 00    	mov    $0x9144a0,%eax
  100534:	8b 80 00 02 00 00    	mov    0x200(%eax),%eax
  10053a:	3d 00 02 00 00       	cmp    $0x200,%eax
  10053f:	75 10                	jne    100551 <cons_getc+0x86>
  100541:	c7 c0 a0 44 91 00    	mov    $0x9144a0,%eax
  100547:	c7 80 00 02 00 00 00 	movl   $0x0,0x200(%eax)
  10054e:	00 00 00 
  100551:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100554:	eb 05                	jmp    10055b <cons_getc+0x90>
  100556:	b8 00 00 00 00       	mov    $0x0,%eax
  10055b:	83 c4 14             	add    $0x14,%esp
  10055e:	5b                   	pop    %ebx
  10055f:	5d                   	pop    %ebp
  100560:	c3                   	ret    

00100561 <cons_putc>:
  100561:	55                   	push   %ebp
  100562:	89 e5                	mov    %esp,%ebp
  100564:	53                   	push   %ebx
  100565:	83 ec 14             	sub    $0x14,%esp
  100568:	e8 a2 fe ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  10056d:	81 c3 93 ba 00 00    	add    $0xba93,%ebx
  100573:	8b 45 08             	mov    0x8(%ebp),%eax
  100576:	88 45 f4             	mov    %al,-0xc(%ebp)
  100579:	0f be 45 f4          	movsbl -0xc(%ebp),%eax
  10057d:	83 ec 0c             	sub    $0xc,%esp
  100580:	50                   	push   %eax
  100581:	e8 9e 02 00 00       	call   100824 <serial_putc>
  100586:	83 c4 10             	add    $0x10,%esp
  100589:	0f be 45 f4          	movsbl -0xc(%ebp),%eax
  10058d:	83 ec 0c             	sub    $0xc,%esp
  100590:	50                   	push   %eax
  100591:	e8 98 fb ff ff       	call   10012e <video_putc>
  100596:	83 c4 10             	add    $0x10,%esp
  100599:	90                   	nop
  10059a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10059d:	c9                   	leave  
  10059e:	c3                   	ret    

0010059f <getchar>:
  10059f:	55                   	push   %ebp
  1005a0:	89 e5                	mov    %esp,%ebp
  1005a2:	83 ec 18             	sub    $0x18,%esp
  1005a5:	e8 5d fe ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  1005aa:	05 56 ba 00 00       	add    $0xba56,%eax
  1005af:	e8 17 ff ff ff       	call   1004cb <cons_getc>
  1005b4:	88 45 f7             	mov    %al,-0x9(%ebp)
  1005b7:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  1005bb:	74 f2                	je     1005af <getchar+0x10>
  1005bd:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  1005c1:	c9                   	leave  
  1005c2:	c3                   	ret    

001005c3 <putchar>:
  1005c3:	55                   	push   %ebp
  1005c4:	89 e5                	mov    %esp,%ebp
  1005c6:	83 ec 18             	sub    $0x18,%esp
  1005c9:	e8 39 fe ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  1005ce:	05 32 ba 00 00       	add    $0xba32,%eax
  1005d3:	8b 45 08             	mov    0x8(%ebp),%eax
  1005d6:	88 45 f4             	mov    %al,-0xc(%ebp)
  1005d9:	0f be 45 f4          	movsbl -0xc(%ebp),%eax
  1005dd:	83 ec 0c             	sub    $0xc,%esp
  1005e0:	50                   	push   %eax
  1005e1:	e8 7b ff ff ff       	call   100561 <cons_putc>
  1005e6:	83 c4 10             	add    $0x10,%esp
  1005e9:	90                   	nop
  1005ea:	c9                   	leave  
  1005eb:	c3                   	ret    

001005ec <readline>:
  1005ec:	55                   	push   %ebp
  1005ed:	89 e5                	mov    %esp,%ebp
  1005ef:	53                   	push   %ebx
  1005f0:	83 ec 14             	sub    $0x14,%esp
  1005f3:	e8 17 fe ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  1005f8:	81 c3 08 ba 00 00    	add    $0xba08,%ebx
  1005fe:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100602:	74 15                	je     100619 <readline+0x2d>
  100604:	83 ec 08             	sub    $0x8,%esp
  100607:	ff 75 08             	pushl  0x8(%ebp)
  10060a:	8d 83 02 b3 ff ff    	lea    -0x4cfe(%ebx),%eax
  100610:	50                   	push   %eax
  100611:	e8 82 2d 00 00       	call   103398 <dprintf>
  100616:	83 c4 10             	add    $0x10,%esp
  100619:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100620:	e8 7a ff ff ff       	call   10059f <getchar>
  100625:	88 45 f3             	mov    %al,-0xd(%ebp)
  100628:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
  10062c:	79 21                	jns    10064f <readline+0x63>
  10062e:	0f be 45 f3          	movsbl -0xd(%ebp),%eax
  100632:	83 ec 08             	sub    $0x8,%esp
  100635:	50                   	push   %eax
  100636:	8d 83 05 b3 ff ff    	lea    -0x4cfb(%ebx),%eax
  10063c:	50                   	push   %eax
  10063d:	e8 56 2d 00 00       	call   103398 <dprintf>
  100642:	83 c4 10             	add    $0x10,%esp
  100645:	b8 00 00 00 00       	mov    $0x0,%eax
  10064a:	e9 92 00 00 00       	jmp    1006e1 <readline+0xf5>
  10064f:	80 7d f3 08          	cmpb   $0x8,-0xd(%ebp)
  100653:	74 06                	je     10065b <readline+0x6f>
  100655:	80 7d f3 7f          	cmpb   $0x7f,-0xd(%ebp)
  100659:	75 19                	jne    100674 <readline+0x88>
  10065b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10065f:	7e 13                	jle    100674 <readline+0x88>
  100661:	83 ec 0c             	sub    $0xc,%esp
  100664:	6a 08                	push   $0x8
  100666:	e8 58 ff ff ff       	call   1005c3 <putchar>
  10066b:	83 c4 10             	add    $0x10,%esp
  10066e:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  100672:	eb 68                	jmp    1006dc <readline+0xf0>
  100674:	80 7d f3 1f          	cmpb   $0x1f,-0xd(%ebp)
  100678:	7e 2f                	jle    1006a9 <readline+0xbd>
  10067a:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  100681:	7f 26                	jg     1006a9 <readline+0xbd>
  100683:	0f be 45 f3          	movsbl -0xd(%ebp),%eax
  100687:	83 ec 0c             	sub    $0xc,%esp
  10068a:	50                   	push   %eax
  10068b:	e8 33 ff ff ff       	call   1005c3 <putchar>
  100690:	83 c4 10             	add    $0x10,%esp
  100693:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100696:	8d 50 01             	lea    0x1(%eax),%edx
  100699:	89 55 f4             	mov    %edx,-0xc(%ebp)
  10069c:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
  1006a0:	88 94 03 00 70 00 00 	mov    %dl,0x7000(%ebx,%eax,1)
  1006a7:	eb 33                	jmp    1006dc <readline+0xf0>
  1006a9:	80 7d f3 0a          	cmpb   $0xa,-0xd(%ebp)
  1006ad:	74 0a                	je     1006b9 <readline+0xcd>
  1006af:	80 7d f3 0d          	cmpb   $0xd,-0xd(%ebp)
  1006b3:	0f 85 67 ff ff ff    	jne    100620 <readline+0x34>
  1006b9:	83 ec 0c             	sub    $0xc,%esp
  1006bc:	6a 0a                	push   $0xa
  1006be:	e8 00 ff ff ff       	call   1005c3 <putchar>
  1006c3:	83 c4 10             	add    $0x10,%esp
  1006c6:	8d 93 00 70 00 00    	lea    0x7000(%ebx),%edx
  1006cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006cf:	01 d0                	add    %edx,%eax
  1006d1:	c6 00 00             	movb   $0x0,(%eax)
  1006d4:	8d 83 00 70 00 00    	lea    0x7000(%ebx),%eax
  1006da:	eb 05                	jmp    1006e1 <readline+0xf5>
  1006dc:	e9 3f ff ff ff       	jmp    100620 <readline+0x34>
  1006e1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1006e4:	c9                   	leave  
  1006e5:	c3                   	ret    

001006e6 <delay>:
  1006e6:	55                   	push   %ebp
  1006e7:	89 e5                	mov    %esp,%ebp
  1006e9:	53                   	push   %ebx
  1006ea:	83 ec 04             	sub    $0x4,%esp
  1006ed:	e8 1d fd ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  1006f2:	81 c3 0e b9 00 00    	add    $0xb90e,%ebx
  1006f8:	83 ec 0c             	sub    $0xc,%esp
  1006fb:	68 84 00 00 00       	push   $0x84
  100700:	e8 44 3a 00 00       	call   104149 <inb>
  100705:	83 c4 10             	add    $0x10,%esp
  100708:	83 ec 0c             	sub    $0xc,%esp
  10070b:	68 84 00 00 00       	push   $0x84
  100710:	e8 34 3a 00 00       	call   104149 <inb>
  100715:	83 c4 10             	add    $0x10,%esp
  100718:	83 ec 0c             	sub    $0xc,%esp
  10071b:	68 84 00 00 00       	push   $0x84
  100720:	e8 24 3a 00 00       	call   104149 <inb>
  100725:	83 c4 10             	add    $0x10,%esp
  100728:	83 ec 0c             	sub    $0xc,%esp
  10072b:	68 84 00 00 00       	push   $0x84
  100730:	e8 14 3a 00 00       	call   104149 <inb>
  100735:	83 c4 10             	add    $0x10,%esp
  100738:	90                   	nop
  100739:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10073c:	c9                   	leave  
  10073d:	c3                   	ret    

0010073e <serial_proc_data>:
  10073e:	55                   	push   %ebp
  10073f:	89 e5                	mov    %esp,%ebp
  100741:	53                   	push   %ebx
  100742:	83 ec 04             	sub    $0x4,%esp
  100745:	e8 c5 fc ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  10074a:	81 c3 b6 b8 00 00    	add    $0xb8b6,%ebx
  100750:	83 ec 0c             	sub    $0xc,%esp
  100753:	68 fd 03 00 00       	push   $0x3fd
  100758:	e8 ec 39 00 00       	call   104149 <inb>
  10075d:	83 c4 10             	add    $0x10,%esp
  100760:	0f b6 c0             	movzbl %al,%eax
  100763:	83 e0 01             	and    $0x1,%eax
  100766:	85 c0                	test   %eax,%eax
  100768:	75 07                	jne    100771 <serial_proc_data+0x33>
  10076a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10076f:	eb 13                	jmp    100784 <serial_proc_data+0x46>
  100771:	83 ec 0c             	sub    $0xc,%esp
  100774:	68 f8 03 00 00       	push   $0x3f8
  100779:	e8 cb 39 00 00       	call   104149 <inb>
  10077e:	83 c4 10             	add    $0x10,%esp
  100781:	0f b6 c0             	movzbl %al,%eax
  100784:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100787:	c9                   	leave  
  100788:	c3                   	ret    

00100789 <serial_intr>:
  100789:	55                   	push   %ebp
  10078a:	89 e5                	mov    %esp,%ebp
  10078c:	53                   	push   %ebx
  10078d:	83 ec 04             	sub    $0x4,%esp
  100790:	e8 72 fc ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  100795:	05 6b b8 00 00       	add    $0xb86b,%eax
  10079a:	c7 c2 a8 46 91 00    	mov    $0x9146a8,%edx
  1007a0:	0f b6 12             	movzbl (%edx),%edx
  1007a3:	84 d2                	test   %dl,%dl
  1007a5:	74 14                	je     1007bb <serial_intr+0x32>
  1007a7:	83 ec 0c             	sub    $0xc,%esp
  1007aa:	8d 90 3e 47 ff ff    	lea    -0xb8c2(%eax),%edx
  1007b0:	52                   	push   %edx
  1007b1:	89 c3                	mov    %eax,%ebx
  1007b3:	e8 96 fc ff ff       	call   10044e <cons_intr>
  1007b8:	83 c4 10             	add    $0x10,%esp
  1007bb:	90                   	nop
  1007bc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1007bf:	c9                   	leave  
  1007c0:	c3                   	ret    

001007c1 <serial_reformatnewline>:
  1007c1:	55                   	push   %ebp
  1007c2:	89 e5                	mov    %esp,%ebp
  1007c4:	53                   	push   %ebx
  1007c5:	83 ec 14             	sub    $0x14,%esp
  1007c8:	e8 42 fc ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  1007cd:	81 c3 33 b8 00 00    	add    $0xb833,%ebx
  1007d3:	c7 45 f4 0d 00 00 00 	movl   $0xd,-0xc(%ebp)
  1007da:	c7 45 f0 0a 00 00 00 	movl   $0xa,-0x10(%ebp)
  1007e1:	8b 45 08             	mov    0x8(%ebp),%eax
  1007e4:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  1007e7:	75 31                	jne    10081a <serial_reformatnewline+0x59>
  1007e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007ec:	0f b6 c0             	movzbl %al,%eax
  1007ef:	83 ec 08             	sub    $0x8,%esp
  1007f2:	50                   	push   %eax
  1007f3:	ff 75 0c             	pushl  0xc(%ebp)
  1007f6:	e8 9d 39 00 00       	call   104198 <outb>
  1007fb:	83 c4 10             	add    $0x10,%esp
  1007fe:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100801:	0f b6 c0             	movzbl %al,%eax
  100804:	83 ec 08             	sub    $0x8,%esp
  100807:	50                   	push   %eax
  100808:	ff 75 0c             	pushl  0xc(%ebp)
  10080b:	e8 88 39 00 00       	call   104198 <outb>
  100810:	83 c4 10             	add    $0x10,%esp
  100813:	b8 01 00 00 00       	mov    $0x1,%eax
  100818:	eb 05                	jmp    10081f <serial_reformatnewline+0x5e>
  10081a:	b8 00 00 00 00       	mov    $0x0,%eax
  10081f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100822:	c9                   	leave  
  100823:	c3                   	ret    

00100824 <serial_putc>:
  100824:	55                   	push   %ebp
  100825:	89 e5                	mov    %esp,%ebp
  100827:	53                   	push   %ebx
  100828:	83 ec 24             	sub    $0x24,%esp
  10082b:	e8 df fb ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  100830:	81 c3 d0 b7 00 00    	add    $0xb7d0,%ebx
  100836:	8b 45 08             	mov    0x8(%ebp),%eax
  100839:	88 45 e4             	mov    %al,-0x1c(%ebp)
  10083c:	c7 c0 a8 46 91 00    	mov    $0x9146a8,%eax
  100842:	0f b6 00             	movzbl (%eax),%eax
  100845:	84 c0                	test   %al,%al
  100847:	74 68                	je     1008b1 <serial_putc+0x8d>
  100849:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100850:	eb 09                	jmp    10085b <serial_putc+0x37>
  100852:	e8 8f fe ff ff       	call   1006e6 <delay>
  100857:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  10085b:	83 ec 0c             	sub    $0xc,%esp
  10085e:	68 fd 03 00 00       	push   $0x3fd
  100863:	e8 e1 38 00 00       	call   104149 <inb>
  100868:	83 c4 10             	add    $0x10,%esp
  10086b:	0f b6 c0             	movzbl %al,%eax
  10086e:	83 e0 20             	and    $0x20,%eax
  100871:	85 c0                	test   %eax,%eax
  100873:	75 09                	jne    10087e <serial_putc+0x5a>
  100875:	81 7d f4 ff 31 00 00 	cmpl   $0x31ff,-0xc(%ebp)
  10087c:	7e d4                	jle    100852 <serial_putc+0x2e>
  10087e:	0f be 45 e4          	movsbl -0x1c(%ebp),%eax
  100882:	83 ec 08             	sub    $0x8,%esp
  100885:	68 f8 03 00 00       	push   $0x3f8
  10088a:	50                   	push   %eax
  10088b:	e8 31 ff ff ff       	call   1007c1 <serial_reformatnewline>
  100890:	83 c4 10             	add    $0x10,%esp
  100893:	85 c0                	test   %eax,%eax
  100895:	75 1b                	jne    1008b2 <serial_putc+0x8e>
  100897:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
  10089b:	0f b6 c0             	movzbl %al,%eax
  10089e:	83 ec 08             	sub    $0x8,%esp
  1008a1:	50                   	push   %eax
  1008a2:	68 f8 03 00 00       	push   $0x3f8
  1008a7:	e8 ec 38 00 00       	call   104198 <outb>
  1008ac:	83 c4 10             	add    $0x10,%esp
  1008af:	eb 01                	jmp    1008b2 <serial_putc+0x8e>
  1008b1:	90                   	nop
  1008b2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1008b5:	c9                   	leave  
  1008b6:	c3                   	ret    

001008b7 <serial_init>:
  1008b7:	55                   	push   %ebp
  1008b8:	89 e5                	mov    %esp,%ebp
  1008ba:	53                   	push   %ebx
  1008bb:	83 ec 04             	sub    $0x4,%esp
  1008be:	e8 4c fb ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  1008c3:	81 c3 3d b7 00 00    	add    $0xb73d,%ebx
  1008c9:	83 ec 08             	sub    $0x8,%esp
  1008cc:	6a 00                	push   $0x0
  1008ce:	68 f9 03 00 00       	push   $0x3f9
  1008d3:	e8 c0 38 00 00       	call   104198 <outb>
  1008d8:	83 c4 10             	add    $0x10,%esp
  1008db:	83 ec 08             	sub    $0x8,%esp
  1008de:	68 80 00 00 00       	push   $0x80
  1008e3:	68 fb 03 00 00       	push   $0x3fb
  1008e8:	e8 ab 38 00 00       	call   104198 <outb>
  1008ed:	83 c4 10             	add    $0x10,%esp
  1008f0:	83 ec 08             	sub    $0x8,%esp
  1008f3:	6a 01                	push   $0x1
  1008f5:	68 f8 03 00 00       	push   $0x3f8
  1008fa:	e8 99 38 00 00       	call   104198 <outb>
  1008ff:	83 c4 10             	add    $0x10,%esp
  100902:	83 ec 08             	sub    $0x8,%esp
  100905:	6a 00                	push   $0x0
  100907:	68 f9 03 00 00       	push   $0x3f9
  10090c:	e8 87 38 00 00       	call   104198 <outb>
  100911:	83 c4 10             	add    $0x10,%esp
  100914:	83 ec 08             	sub    $0x8,%esp
  100917:	6a 03                	push   $0x3
  100919:	68 fb 03 00 00       	push   $0x3fb
  10091e:	e8 75 38 00 00       	call   104198 <outb>
  100923:	83 c4 10             	add    $0x10,%esp
  100926:	83 ec 08             	sub    $0x8,%esp
  100929:	68 c7 00 00 00       	push   $0xc7
  10092e:	68 fa 03 00 00       	push   $0x3fa
  100933:	e8 60 38 00 00       	call   104198 <outb>
  100938:	83 c4 10             	add    $0x10,%esp
  10093b:	83 ec 08             	sub    $0x8,%esp
  10093e:	6a 0b                	push   $0xb
  100940:	68 fc 03 00 00       	push   $0x3fc
  100945:	e8 4e 38 00 00       	call   104198 <outb>
  10094a:	83 c4 10             	add    $0x10,%esp
  10094d:	83 ec 0c             	sub    $0xc,%esp
  100950:	68 fd 03 00 00       	push   $0x3fd
  100955:	e8 ef 37 00 00       	call   104149 <inb>
  10095a:	83 c4 10             	add    $0x10,%esp
  10095d:	3c ff                	cmp    $0xff,%al
  10095f:	0f 95 c0             	setne  %al
  100962:	89 c2                	mov    %eax,%edx
  100964:	c7 c0 a8 46 91 00    	mov    $0x9146a8,%eax
  10096a:	88 10                	mov    %dl,(%eax)
  10096c:	83 ec 0c             	sub    $0xc,%esp
  10096f:	68 fa 03 00 00       	push   $0x3fa
  100974:	e8 d0 37 00 00       	call   104149 <inb>
  100979:	83 c4 10             	add    $0x10,%esp
  10097c:	83 ec 0c             	sub    $0xc,%esp
  10097f:	68 f8 03 00 00       	push   $0x3f8
  100984:	e8 c0 37 00 00       	call   104149 <inb>
  100989:	83 c4 10             	add    $0x10,%esp
  10098c:	90                   	nop
  10098d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100990:	c9                   	leave  
  100991:	c3                   	ret    

00100992 <serial_intenable>:
  100992:	55                   	push   %ebp
  100993:	89 e5                	mov    %esp,%ebp
  100995:	53                   	push   %ebx
  100996:	83 ec 04             	sub    $0x4,%esp
  100999:	e8 69 fa ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  10099e:	05 62 b6 00 00       	add    $0xb662,%eax
  1009a3:	c7 c2 a8 46 91 00    	mov    $0x9146a8,%edx
  1009a9:	0f b6 12             	movzbl (%edx),%edx
  1009ac:	84 d2                	test   %dl,%dl
  1009ae:	74 19                	je     1009c9 <serial_intenable+0x37>
  1009b0:	83 ec 08             	sub    $0x8,%esp
  1009b3:	6a 01                	push   $0x1
  1009b5:	68 f9 03 00 00       	push   $0x3f9
  1009ba:	89 c3                	mov    %eax,%ebx
  1009bc:	e8 d7 37 00 00       	call   104198 <outb>
  1009c1:	83 c4 10             	add    $0x10,%esp
  1009c4:	e8 c0 fd ff ff       	call   100789 <serial_intr>
  1009c9:	90                   	nop
  1009ca:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1009cd:	c9                   	leave  
  1009ce:	c3                   	ret    

001009cf <kbd_proc_data>:
  1009cf:	55                   	push   %ebp
  1009d0:	89 e5                	mov    %esp,%ebp
  1009d2:	53                   	push   %ebx
  1009d3:	83 ec 14             	sub    $0x14,%esp
  1009d6:	e8 34 fa ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  1009db:	81 c3 25 b6 00 00    	add    $0xb625,%ebx
  1009e1:	83 ec 0c             	sub    $0xc,%esp
  1009e4:	6a 64                	push   $0x64
  1009e6:	e8 5e 37 00 00       	call   104149 <inb>
  1009eb:	83 c4 10             	add    $0x10,%esp
  1009ee:	83 e0 01             	and    $0x1,%eax
  1009f1:	85 c0                	test   %eax,%eax
  1009f3:	75 0a                	jne    1009ff <kbd_proc_data+0x30>
  1009f5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1009fa:	e9 69 01 00 00       	jmp    100b68 <kbd_proc_data+0x199>
  1009ff:	83 ec 0c             	sub    $0xc,%esp
  100a02:	6a 60                	push   $0x60
  100a04:	e8 40 37 00 00       	call   104149 <inb>
  100a09:	83 c4 10             	add    $0x10,%esp
  100a0c:	88 45 f3             	mov    %al,-0xd(%ebp)
  100a0f:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  100a13:	75 19                	jne    100a2e <kbd_proc_data+0x5f>
  100a15:	8b 83 00 74 00 00    	mov    0x7400(%ebx),%eax
  100a1b:	83 c8 40             	or     $0x40,%eax
  100a1e:	89 83 00 74 00 00    	mov    %eax,0x7400(%ebx)
  100a24:	b8 00 00 00 00       	mov    $0x0,%eax
  100a29:	e9 3a 01 00 00       	jmp    100b68 <kbd_proc_data+0x199>
  100a2e:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  100a32:	84 c0                	test   %al,%al
  100a34:	79 4b                	jns    100a81 <kbd_proc_data+0xb2>
  100a36:	8b 83 00 74 00 00    	mov    0x7400(%ebx),%eax
  100a3c:	83 e0 40             	and    $0x40,%eax
  100a3f:	85 c0                	test   %eax,%eax
  100a41:	75 09                	jne    100a4c <kbd_proc_data+0x7d>
  100a43:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  100a47:	83 e0 7f             	and    $0x7f,%eax
  100a4a:	eb 04                	jmp    100a50 <kbd_proc_data+0x81>
  100a4c:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  100a50:	88 45 f3             	mov    %al,-0xd(%ebp)
  100a53:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  100a57:	0f b6 84 03 00 10 00 	movzbl 0x1000(%ebx,%eax,1),%eax
  100a5e:	00 
  100a5f:	83 c8 40             	or     $0x40,%eax
  100a62:	0f b6 c0             	movzbl %al,%eax
  100a65:	f7 d0                	not    %eax
  100a67:	89 c2                	mov    %eax,%edx
  100a69:	8b 83 00 74 00 00    	mov    0x7400(%ebx),%eax
  100a6f:	21 d0                	and    %edx,%eax
  100a71:	89 83 00 74 00 00    	mov    %eax,0x7400(%ebx)
  100a77:	b8 00 00 00 00       	mov    $0x0,%eax
  100a7c:	e9 e7 00 00 00       	jmp    100b68 <kbd_proc_data+0x199>
  100a81:	8b 83 00 74 00 00    	mov    0x7400(%ebx),%eax
  100a87:	83 e0 40             	and    $0x40,%eax
  100a8a:	85 c0                	test   %eax,%eax
  100a8c:	74 13                	je     100aa1 <kbd_proc_data+0xd2>
  100a8e:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
  100a92:	8b 83 00 74 00 00    	mov    0x7400(%ebx),%eax
  100a98:	83 e0 bf             	and    $0xffffffbf,%eax
  100a9b:	89 83 00 74 00 00    	mov    %eax,0x7400(%ebx)
  100aa1:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  100aa5:	0f b6 84 03 00 10 00 	movzbl 0x1000(%ebx,%eax,1),%eax
  100aac:	00 
  100aad:	0f b6 d0             	movzbl %al,%edx
  100ab0:	8b 83 00 74 00 00    	mov    0x7400(%ebx),%eax
  100ab6:	09 d0                	or     %edx,%eax
  100ab8:	89 83 00 74 00 00    	mov    %eax,0x7400(%ebx)
  100abe:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  100ac2:	0f b6 84 03 00 11 00 	movzbl 0x1100(%ebx,%eax,1),%eax
  100ac9:	00 
  100aca:	0f b6 d0             	movzbl %al,%edx
  100acd:	8b 83 00 74 00 00    	mov    0x7400(%ebx),%eax
  100ad3:	31 d0                	xor    %edx,%eax
  100ad5:	89 83 00 74 00 00    	mov    %eax,0x7400(%ebx)
  100adb:	8b 83 00 74 00 00    	mov    0x7400(%ebx),%eax
  100ae1:	83 e0 03             	and    $0x3,%eax
  100ae4:	8b 94 83 00 15 00 00 	mov    0x1500(%ebx,%eax,4),%edx
  100aeb:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  100aef:	01 d0                	add    %edx,%eax
  100af1:	0f b6 00             	movzbl (%eax),%eax
  100af4:	0f b6 c0             	movzbl %al,%eax
  100af7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100afa:	8b 83 00 74 00 00    	mov    0x7400(%ebx),%eax
  100b00:	83 e0 08             	and    $0x8,%eax
  100b03:	85 c0                	test   %eax,%eax
  100b05:	74 22                	je     100b29 <kbd_proc_data+0x15a>
  100b07:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  100b0b:	7e 0c                	jle    100b19 <kbd_proc_data+0x14a>
  100b0d:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  100b11:	7f 06                	jg     100b19 <kbd_proc_data+0x14a>
  100b13:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  100b17:	eb 10                	jmp    100b29 <kbd_proc_data+0x15a>
  100b19:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  100b1d:	7e 0a                	jle    100b29 <kbd_proc_data+0x15a>
  100b1f:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  100b23:	7f 04                	jg     100b29 <kbd_proc_data+0x15a>
  100b25:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
  100b29:	8b 83 00 74 00 00    	mov    0x7400(%ebx),%eax
  100b2f:	f7 d0                	not    %eax
  100b31:	83 e0 06             	and    $0x6,%eax
  100b34:	85 c0                	test   %eax,%eax
  100b36:	75 2d                	jne    100b65 <kbd_proc_data+0x196>
  100b38:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  100b3f:	75 24                	jne    100b65 <kbd_proc_data+0x196>
  100b41:	83 ec 0c             	sub    $0xc,%esp
  100b44:	8d 83 15 b3 ff ff    	lea    -0x4ceb(%ebx),%eax
  100b4a:	50                   	push   %eax
  100b4b:	e8 48 28 00 00       	call   103398 <dprintf>
  100b50:	83 c4 10             	add    $0x10,%esp
  100b53:	83 ec 08             	sub    $0x8,%esp
  100b56:	6a 03                	push   $0x3
  100b58:	68 92 00 00 00       	push   $0x92
  100b5d:	e8 36 36 00 00       	call   104198 <outb>
  100b62:	83 c4 10             	add    $0x10,%esp
  100b65:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b68:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100b6b:	c9                   	leave  
  100b6c:	c3                   	ret    

00100b6d <keyboard_intr>:
  100b6d:	55                   	push   %ebp
  100b6e:	89 e5                	mov    %esp,%ebp
  100b70:	53                   	push   %ebx
  100b71:	83 ec 04             	sub    $0x4,%esp
  100b74:	e8 8e f8 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  100b79:	05 87 b4 00 00       	add    $0xb487,%eax
  100b7e:	83 ec 0c             	sub    $0xc,%esp
  100b81:	8d 90 cf 49 ff ff    	lea    -0xb631(%eax),%edx
  100b87:	52                   	push   %edx
  100b88:	89 c3                	mov    %eax,%ebx
  100b8a:	e8 bf f8 ff ff       	call   10044e <cons_intr>
  100b8f:	83 c4 10             	add    $0x10,%esp
  100b92:	90                   	nop
  100b93:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100b96:	c9                   	leave  
  100b97:	c3                   	ret    

00100b98 <devinit>:
  100b98:	55                   	push   %ebp
  100b99:	89 e5                	mov    %esp,%ebp
  100b9b:	53                   	push   %ebx
  100b9c:	83 ec 04             	sub    $0x4,%esp
  100b9f:	e8 6b f8 ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  100ba4:	81 c3 5c b4 00 00    	add    $0xb45c,%ebx
  100baa:	e8 dc 2c 00 00       	call   10388b <seg_init>
  100baf:	e8 d9 33 00 00       	call   103f8d <enable_sse>
  100bb4:	e8 5a f8 ff ff       	call   100413 <cons_init>
  100bb9:	83 ec 04             	sub    $0x4,%esp
  100bbc:	8d 83 21 b3 ff ff    	lea    -0x4cdf(%ebx),%eax
  100bc2:	50                   	push   %eax
  100bc3:	6a 13                	push   $0x13
  100bc5:	8d 83 34 b3 ff ff    	lea    -0x4ccc(%ebx),%eax
  100bcb:	50                   	push   %eax
  100bcc:	e8 f6 24 00 00       	call   1030c7 <debug_normal>
  100bd1:	83 c4 10             	add    $0x10,%esp
  100bd4:	ff 75 08             	pushl  0x8(%ebp)
  100bd7:	8d 83 47 b3 ff ff    	lea    -0x4cb9(%ebx),%eax
  100bdd:	50                   	push   %eax
  100bde:	6a 14                	push   $0x14
  100be0:	8d 83 34 b3 ff ff    	lea    -0x4ccc(%ebx),%eax
  100be6:	50                   	push   %eax
  100be7:	e8 db 24 00 00       	call   1030c7 <debug_normal>
  100bec:	83 c4 10             	add    $0x10,%esp
  100bef:	e8 19 20 00 00       	call   102c0d <intr_init>
  100bf4:	83 ec 0c             	sub    $0xc,%esp
  100bf7:	ff 75 08             	pushl  0x8(%ebp)
  100bfa:	e8 a3 03 00 00       	call   100fa2 <pmmap_init>
  100bff:	83 c4 10             	add    $0x10,%esp
  100c02:	90                   	nop
  100c03:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100c06:	c9                   	leave  
  100c07:	c3                   	ret    

00100c08 <pmmap_alloc_slot>:
  100c08:	55                   	push   %ebp
  100c09:	89 e5                	mov    %esp,%ebp
  100c0b:	e8 fb f7 ff ff       	call   10040b <__x86.get_pc_thunk.dx>
  100c10:	81 c2 f0 b3 00 00    	add    $0xb3f0,%edx
  100c16:	8b 82 20 7e 00 00    	mov    0x7e20(%edx),%eax
  100c1c:	3d 80 00 00 00       	cmp    $0x80,%eax
  100c21:	0f 94 c0             	sete   %al
  100c24:	0f b6 c0             	movzbl %al,%eax
  100c27:	85 c0                	test   %eax,%eax
  100c29:	74 07                	je     100c32 <pmmap_alloc_slot+0x2a>
  100c2b:	b8 00 00 00 00       	mov    $0x0,%eax
  100c30:	eb 21                	jmp    100c53 <pmmap_alloc_slot+0x4b>
  100c32:	8b 8a 20 7e 00 00    	mov    0x7e20(%edx),%ecx
  100c38:	8d 41 01             	lea    0x1(%ecx),%eax
  100c3b:	89 82 20 7e 00 00    	mov    %eax,0x7e20(%edx)
  100c41:	89 c8                	mov    %ecx,%eax
  100c43:	c1 e0 02             	shl    $0x2,%eax
  100c46:	01 c8                	add    %ecx,%eax
  100c48:	c1 e0 02             	shl    $0x2,%eax
  100c4b:	8d 92 20 74 00 00    	lea    0x7420(%edx),%edx
  100c51:	01 d0                	add    %edx,%eax
  100c53:	5d                   	pop    %ebp
  100c54:	c3                   	ret    

00100c55 <pmmap_insert>:
  100c55:	55                   	push   %ebp
  100c56:	89 e5                	mov    %esp,%ebp
  100c58:	53                   	push   %ebx
  100c59:	83 ec 14             	sub    $0x14,%esp
  100c5c:	e8 ae f7 ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  100c61:	81 c3 9f b3 00 00    	add    $0xb39f,%ebx
  100c67:	e8 9c ff ff ff       	call   100c08 <pmmap_alloc_slot>
  100c6c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  100c6f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  100c73:	75 1b                	jne    100c90 <pmmap_insert+0x3b>
  100c75:	83 ec 04             	sub    $0x4,%esp
  100c78:	8d 83 5c b3 ff ff    	lea    -0x4ca4(%ebx),%eax
  100c7e:	50                   	push   %eax
  100c7f:	6a 3e                	push   $0x3e
  100c81:	8d 83 79 b3 ff ff    	lea    -0x4c87(%ebx),%eax
  100c87:	50                   	push   %eax
  100c88:	e8 f4 24 00 00       	call   103181 <debug_panic>
  100c8d:	83 c4 10             	add    $0x10,%esp
  100c90:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100c93:	8b 55 08             	mov    0x8(%ebp),%edx
  100c96:	89 10                	mov    %edx,(%eax)
  100c98:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100c9b:	8b 55 0c             	mov    0xc(%ebp),%edx
  100c9e:	89 50 04             	mov    %edx,0x4(%eax)
  100ca1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100ca4:	8b 55 10             	mov    0x10(%ebp),%edx
  100ca7:	89 50 08             	mov    %edx,0x8(%eax)
  100caa:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  100cb1:	8b 83 24 7e 00 00    	mov    0x7e24(%ebx),%eax
  100cb7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100cba:	eb 19                	jmp    100cd5 <pmmap_insert+0x80>
  100cbc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cbf:	8b 00                	mov    (%eax),%eax
  100cc1:	3b 45 08             	cmp    0x8(%ebp),%eax
  100cc4:	77 17                	ja     100cdd <pmmap_insert+0x88>
  100cc6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cc9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  100ccc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ccf:	8b 40 0c             	mov    0xc(%eax),%eax
  100cd2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100cd5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100cd9:	75 e1                	jne    100cbc <pmmap_insert+0x67>
  100cdb:	eb 01                	jmp    100cde <pmmap_insert+0x89>
  100cdd:	90                   	nop
  100cde:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100ce2:	75 17                	jne    100cfb <pmmap_insert+0xa6>
  100ce4:	8b 93 24 7e 00 00    	mov    0x7e24(%ebx),%edx
  100cea:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100ced:	89 50 0c             	mov    %edx,0xc(%eax)
  100cf0:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100cf3:	89 83 24 7e 00 00    	mov    %eax,0x7e24(%ebx)
  100cf9:	eb 15                	jmp    100d10 <pmmap_insert+0xbb>
  100cfb:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100cfe:	8b 50 0c             	mov    0xc(%eax),%edx
  100d01:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100d04:	89 50 0c             	mov    %edx,0xc(%eax)
  100d07:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100d0a:	8b 55 ec             	mov    -0x14(%ebp),%edx
  100d0d:	89 50 0c             	mov    %edx,0xc(%eax)
  100d10:	90                   	nop
  100d11:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100d14:	c9                   	leave  
  100d15:	c3                   	ret    

00100d16 <pmmap_merge>:
  100d16:	55                   	push   %ebp
  100d17:	89 e5                	mov    %esp,%ebp
  100d19:	53                   	push   %ebx
  100d1a:	83 ec 24             	sub    $0x24,%esp
  100d1d:	e8 ed f6 ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  100d22:	81 c3 de b2 00 00    	add    $0xb2de,%ebx
  100d28:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  100d2f:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  100d36:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  100d3d:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  100d44:	8b 83 24 7e 00 00    	mov    0x7e24(%ebx),%eax
  100d4a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100d4d:	eb 75                	jmp    100dc4 <pmmap_merge+0xae>
  100d4f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d52:	8b 40 0c             	mov    0xc(%eax),%eax
  100d55:	89 45 f0             	mov    %eax,-0x10(%ebp)
  100d58:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100d5c:	74 6e                	je     100dcc <pmmap_merge+0xb6>
  100d5e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d61:	8b 10                	mov    (%eax),%edx
  100d63:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100d66:	8b 00                	mov    (%eax),%eax
  100d68:	39 c2                	cmp    %eax,%edx
  100d6a:	77 4f                	ja     100dbb <pmmap_merge+0xa5>
  100d6c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d6f:	8b 50 04             	mov    0x4(%eax),%edx
  100d72:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100d75:	8b 00                	mov    (%eax),%eax
  100d77:	39 c2                	cmp    %eax,%edx
  100d79:	72 40                	jb     100dbb <pmmap_merge+0xa5>
  100d7b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d7e:	8b 50 08             	mov    0x8(%eax),%edx
  100d81:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100d84:	8b 40 08             	mov    0x8(%eax),%eax
  100d87:	39 c2                	cmp    %eax,%edx
  100d89:	75 30                	jne    100dbb <pmmap_merge+0xa5>
  100d8b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100d8e:	8b 50 04             	mov    0x4(%eax),%edx
  100d91:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d94:	8b 40 04             	mov    0x4(%eax),%eax
  100d97:	83 ec 08             	sub    $0x8,%esp
  100d9a:	52                   	push   %edx
  100d9b:	50                   	push   %eax
  100d9c:	e8 b1 30 00 00       	call   103e52 <max>
  100da1:	83 c4 10             	add    $0x10,%esp
  100da4:	89 c2                	mov    %eax,%edx
  100da6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100da9:	89 50 04             	mov    %edx,0x4(%eax)
  100dac:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100daf:	8b 40 0c             	mov    0xc(%eax),%eax
  100db2:	8b 50 0c             	mov    0xc(%eax),%edx
  100db5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100db8:	89 50 0c             	mov    %edx,0xc(%eax)
  100dbb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100dbe:	8b 40 0c             	mov    0xc(%eax),%eax
  100dc1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100dc4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100dc8:	75 85                	jne    100d4f <pmmap_merge+0x39>
  100dca:	eb 01                	jmp    100dcd <pmmap_merge+0xb7>
  100dcc:	90                   	nop
  100dcd:	8b 83 24 7e 00 00    	mov    0x7e24(%ebx),%eax
  100dd3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100dd6:	e9 cf 00 00 00       	jmp    100eaa <pmmap_merge+0x194>
  100ddb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100dde:	8b 40 08             	mov    0x8(%eax),%eax
  100de1:	83 f8 01             	cmp    $0x1,%eax
  100de4:	74 3d                	je     100e23 <pmmap_merge+0x10d>
  100de6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100de9:	8b 40 08             	mov    0x8(%eax),%eax
  100dec:	83 f8 02             	cmp    $0x2,%eax
  100def:	74 2b                	je     100e1c <pmmap_merge+0x106>
  100df1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100df4:	8b 40 08             	mov    0x8(%eax),%eax
  100df7:	83 f8 03             	cmp    $0x3,%eax
  100dfa:	74 19                	je     100e15 <pmmap_merge+0xff>
  100dfc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100dff:	8b 40 08             	mov    0x8(%eax),%eax
  100e02:	83 f8 04             	cmp    $0x4,%eax
  100e05:	75 07                	jne    100e0e <pmmap_merge+0xf8>
  100e07:	b8 03 00 00 00       	mov    $0x3,%eax
  100e0c:	eb 1a                	jmp    100e28 <pmmap_merge+0x112>
  100e0e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100e13:	eb 13                	jmp    100e28 <pmmap_merge+0x112>
  100e15:	b8 02 00 00 00       	mov    $0x2,%eax
  100e1a:	eb 0c                	jmp    100e28 <pmmap_merge+0x112>
  100e1c:	b8 01 00 00 00       	mov    $0x1,%eax
  100e21:	eb 05                	jmp    100e28 <pmmap_merge+0x112>
  100e23:	b8 00 00 00 00       	mov    $0x0,%eax
  100e28:	89 45 ec             	mov    %eax,-0x14(%ebp)
  100e2b:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
  100e2f:	75 1f                	jne    100e50 <pmmap_merge+0x13a>
  100e31:	8d 83 8a b3 ff ff    	lea    -0x4c76(%ebx),%eax
  100e37:	50                   	push   %eax
  100e38:	8d 83 9b b3 ff ff    	lea    -0x4c65(%ebx),%eax
  100e3e:	50                   	push   %eax
  100e3f:	6a 71                	push   $0x71
  100e41:	8d 83 79 b3 ff ff    	lea    -0x4c87(%ebx),%eax
  100e47:	50                   	push   %eax
  100e48:	e8 34 23 00 00       	call   103181 <debug_panic>
  100e4d:	83 c4 10             	add    $0x10,%esp
  100e50:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100e53:	8b 44 85 dc          	mov    -0x24(%ebp,%eax,4),%eax
  100e57:	85 c0                	test   %eax,%eax
  100e59:	74 1f                	je     100e7a <pmmap_merge+0x164>
  100e5b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100e5e:	8b 44 85 dc          	mov    -0x24(%ebp,%eax,4),%eax
  100e62:	8b 50 10             	mov    0x10(%eax),%edx
  100e65:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100e68:	89 50 10             	mov    %edx,0x10(%eax)
  100e6b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100e6e:	8b 44 85 dc          	mov    -0x24(%ebp,%eax,4),%eax
  100e72:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100e75:	89 50 10             	mov    %edx,0x10(%eax)
  100e78:	eb 1d                	jmp    100e97 <pmmap_merge+0x181>
  100e7a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100e7d:	8b 94 83 28 7e 00 00 	mov    0x7e28(%ebx,%eax,4),%edx
  100e84:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100e87:	89 50 10             	mov    %edx,0x10(%eax)
  100e8a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100e8d:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100e90:	89 94 83 28 7e 00 00 	mov    %edx,0x7e28(%ebx,%eax,4)
  100e97:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100e9a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100e9d:	89 54 85 dc          	mov    %edx,-0x24(%ebp,%eax,4)
  100ea1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ea4:	8b 40 0c             	mov    0xc(%eax),%eax
  100ea7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100eaa:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100eae:	0f 85 27 ff ff ff    	jne    100ddb <pmmap_merge+0xc5>
  100eb4:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100eb7:	85 c0                	test   %eax,%eax
  100eb9:	74 0c                	je     100ec7 <pmmap_merge+0x1b1>
  100ebb:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100ebe:	8b 40 04             	mov    0x4(%eax),%eax
  100ec1:	89 83 38 7e 00 00    	mov    %eax,0x7e38(%ebx)
  100ec7:	90                   	nop
  100ec8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100ecb:	c9                   	leave  
  100ecc:	c3                   	ret    

00100ecd <pmmap_dump>:
  100ecd:	55                   	push   %ebp
  100ece:	89 e5                	mov    %esp,%ebp
  100ed0:	53                   	push   %ebx
  100ed1:	83 ec 14             	sub    $0x14,%esp
  100ed4:	e8 36 f5 ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  100ed9:	81 c3 27 b1 00 00    	add    $0xb127,%ebx
  100edf:	8b 83 24 7e 00 00    	mov    0x7e24(%ebx),%eax
  100ee5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100ee8:	e9 a5 00 00 00       	jmp    100f92 <pmmap_dump+0xc5>
  100eed:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ef0:	8b 40 08             	mov    0x8(%eax),%eax
  100ef3:	83 f8 01             	cmp    $0x1,%eax
  100ef6:	74 41                	je     100f39 <pmmap_dump+0x6c>
  100ef8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100efb:	8b 40 08             	mov    0x8(%eax),%eax
  100efe:	83 f8 02             	cmp    $0x2,%eax
  100f01:	74 2e                	je     100f31 <pmmap_dump+0x64>
  100f03:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100f06:	8b 40 08             	mov    0x8(%eax),%eax
  100f09:	83 f8 03             	cmp    $0x3,%eax
  100f0c:	74 1b                	je     100f29 <pmmap_dump+0x5c>
  100f0e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100f11:	8b 40 08             	mov    0x8(%eax),%eax
  100f14:	83 f8 04             	cmp    $0x4,%eax
  100f17:	75 08                	jne    100f21 <pmmap_dump+0x54>
  100f19:	8d 83 b8 b3 ff ff    	lea    -0x4c48(%ebx),%eax
  100f1f:	eb 1e                	jmp    100f3f <pmmap_dump+0x72>
  100f21:	8d 83 c1 b3 ff ff    	lea    -0x4c3f(%ebx),%eax
  100f27:	eb 16                	jmp    100f3f <pmmap_dump+0x72>
  100f29:	8d 83 c9 b3 ff ff    	lea    -0x4c37(%ebx),%eax
  100f2f:	eb 0e                	jmp    100f3f <pmmap_dump+0x72>
  100f31:	8d 83 d3 b3 ff ff    	lea    -0x4c2d(%ebx),%eax
  100f37:	eb 06                	jmp    100f3f <pmmap_dump+0x72>
  100f39:	8d 83 dc b3 ff ff    	lea    -0x4c24(%ebx),%eax
  100f3f:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100f42:	8b 0a                	mov    (%edx),%ecx
  100f44:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100f47:	8b 52 04             	mov    0x4(%edx),%edx
  100f4a:	39 d1                	cmp    %edx,%ecx
  100f4c:	75 08                	jne    100f56 <pmmap_dump+0x89>
  100f4e:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100f51:	8b 52 04             	mov    0x4(%edx),%edx
  100f54:	eb 1c                	jmp    100f72 <pmmap_dump+0xa5>
  100f56:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100f59:	8b 52 04             	mov    0x4(%edx),%edx
  100f5c:	83 fa ff             	cmp    $0xffffffff,%edx
  100f5f:	75 08                	jne    100f69 <pmmap_dump+0x9c>
  100f61:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100f64:	8b 52 04             	mov    0x4(%edx),%edx
  100f67:	eb 09                	jmp    100f72 <pmmap_dump+0xa5>
  100f69:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100f6c:	8b 52 04             	mov    0x4(%edx),%edx
  100f6f:	83 ea 01             	sub    $0x1,%edx
  100f72:	8b 4d f4             	mov    -0xc(%ebp),%ecx
  100f75:	8b 09                	mov    (%ecx),%ecx
  100f77:	50                   	push   %eax
  100f78:	52                   	push   %edx
  100f79:	51                   	push   %ecx
  100f7a:	8d 83 e4 b3 ff ff    	lea    -0x4c1c(%ebx),%eax
  100f80:	50                   	push   %eax
  100f81:	e8 10 21 00 00       	call   103096 <debug_info>
  100f86:	83 c4 10             	add    $0x10,%esp
  100f89:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100f8c:	8b 40 0c             	mov    0xc(%eax),%eax
  100f8f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100f92:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100f96:	0f 85 51 ff ff ff    	jne    100eed <pmmap_dump+0x20>
  100f9c:	90                   	nop
  100f9d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100fa0:	c9                   	leave  
  100fa1:	c3                   	ret    

00100fa2 <pmmap_init>:
  100fa2:	55                   	push   %ebp
  100fa3:	89 e5                	mov    %esp,%ebp
  100fa5:	53                   	push   %ebx
  100fa6:	83 ec 24             	sub    $0x24,%esp
  100fa9:	e8 61 f4 ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  100fae:	81 c3 52 b0 00 00    	add    $0xb052,%ebx
  100fb4:	83 ec 0c             	sub    $0xc,%esp
  100fb7:	8d 83 05 b4 ff ff    	lea    -0x4bfb(%ebx),%eax
  100fbd:	50                   	push   %eax
  100fbe:	e8 d3 20 00 00       	call   103096 <debug_info>
  100fc3:	83 c4 10             	add    $0x10,%esp
  100fc6:	83 ec 04             	sub    $0x4,%esp
  100fc9:	8d 83 07 b4 ff ff    	lea    -0x4bf9(%ebx),%eax
  100fcf:	50                   	push   %eax
  100fd0:	68 96 00 00 00       	push   $0x96
  100fd5:	8d 83 79 b3 ff ff    	lea    -0x4c87(%ebx),%eax
  100fdb:	50                   	push   %eax
  100fdc:	e8 e6 20 00 00       	call   1030c7 <debug_normal>
  100fe1:	83 c4 10             	add    $0x10,%esp
  100fe4:	8b 45 08             	mov    0x8(%ebp),%eax
  100fe7:	89 45 e8             	mov    %eax,-0x18(%ebp)
  100fea:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100fed:	8b 40 30             	mov    0x30(%eax),%eax
  100ff0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100ff3:	c7 83 24 7e 00 00 00 	movl   $0x0,0x7e24(%ebx)
  100ffa:	00 00 00 
  100ffd:	c7 83 28 7e 00 00 00 	movl   $0x0,0x7e28(%ebx)
  101004:	00 00 00 
  101007:	c7 83 2c 7e 00 00 00 	movl   $0x0,0x7e2c(%ebx)
  10100e:	00 00 00 
  101011:	c7 83 30 7e 00 00 00 	movl   $0x0,0x7e30(%ebx)
  101018:	00 00 00 
  10101b:	c7 83 34 7e 00 00 00 	movl   $0x0,0x7e34(%ebx)
  101022:	00 00 00 
  101025:	eb 6c                	jmp    101093 <pmmap_init+0xf1>
  101027:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10102a:	8b 40 08             	mov    0x8(%eax),%eax
  10102d:	85 c0                	test   %eax,%eax
  10102f:	75 58                	jne    101089 <pmmap_init+0xe7>
  101031:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101034:	8b 40 04             	mov    0x4(%eax),%eax
  101037:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  10103a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10103d:	8b 40 10             	mov    0x10(%eax),%eax
  101040:	85 c0                	test   %eax,%eax
  101042:	75 0f                	jne    101053 <pmmap_init+0xb1>
  101044:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101047:	8b 40 0c             	mov    0xc(%eax),%eax
  10104a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  10104d:	f7 d2                	not    %edx
  10104f:	39 d0                	cmp    %edx,%eax
  101051:	72 09                	jb     10105c <pmmap_init+0xba>
  101053:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
  10105a:	eb 0e                	jmp    10106a <pmmap_init+0xc8>
  10105c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10105f:	8b 50 0c             	mov    0xc(%eax),%edx
  101062:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  101065:	01 d0                	add    %edx,%eax
  101067:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10106a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10106d:	8b 40 14             	mov    0x14(%eax),%eax
  101070:	89 45 e0             	mov    %eax,-0x20(%ebp)
  101073:	83 ec 04             	sub    $0x4,%esp
  101076:	ff 75 e0             	pushl  -0x20(%ebp)
  101079:	ff 75 f0             	pushl  -0x10(%ebp)
  10107c:	ff 75 e4             	pushl  -0x1c(%ebp)
  10107f:	e8 d1 fb ff ff       	call   100c55 <pmmap_insert>
  101084:	83 c4 10             	add    $0x10,%esp
  101087:	eb 01                	jmp    10108a <pmmap_init+0xe8>
  101089:	90                   	nop
  10108a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10108d:	83 c0 18             	add    $0x18,%eax
  101090:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101093:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101096:	8b 45 e8             	mov    -0x18(%ebp),%eax
  101099:	8b 40 30             	mov    0x30(%eax),%eax
  10109c:	29 c2                	sub    %eax,%edx
  10109e:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1010a1:	8b 40 2c             	mov    0x2c(%eax),%eax
  1010a4:	39 c2                	cmp    %eax,%edx
  1010a6:	0f 82 7b ff ff ff    	jb     101027 <pmmap_init+0x85>
  1010ac:	e8 65 fc ff ff       	call   100d16 <pmmap_merge>
  1010b1:	e8 17 fe ff ff       	call   100ecd <pmmap_dump>
  1010b6:	8b 83 24 7e 00 00    	mov    0x7e24(%ebx),%eax
  1010bc:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1010bf:	eb 18                	jmp    1010d9 <pmmap_init+0x137>
  1010c1:	8b 83 40 7e 00 00    	mov    0x7e40(%ebx),%eax
  1010c7:	83 c0 01             	add    $0x1,%eax
  1010ca:	89 83 40 7e 00 00    	mov    %eax,0x7e40(%ebx)
  1010d0:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1010d3:	8b 40 0c             	mov    0xc(%eax),%eax
  1010d6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1010d9:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  1010dd:	75 e2                	jne    1010c1 <pmmap_init+0x11f>
  1010df:	8b 83 38 7e 00 00    	mov    0x7e38(%ebx),%eax
  1010e5:	83 ec 08             	sub    $0x8,%esp
  1010e8:	68 00 10 00 00       	push   $0x1000
  1010ed:	50                   	push   %eax
  1010ee:	e8 91 2d 00 00       	call   103e84 <rounddown>
  1010f3:	83 c4 10             	add    $0x10,%esp
  1010f6:	c1 e8 0c             	shr    $0xc,%eax
  1010f9:	89 83 3c 7e 00 00    	mov    %eax,0x7e3c(%ebx)
  1010ff:	90                   	nop
  101100:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101103:	c9                   	leave  
  101104:	c3                   	ret    

00101105 <get_size>:
  101105:	55                   	push   %ebp
  101106:	89 e5                	mov    %esp,%ebp
  101108:	e8 fa f2 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  10110d:	05 f3 ae 00 00       	add    $0xaef3,%eax
  101112:	8b 80 40 7e 00 00    	mov    0x7e40(%eax),%eax
  101118:	5d                   	pop    %ebp
  101119:	c3                   	ret    

0010111a <get_mms>:
  10111a:	55                   	push   %ebp
  10111b:	89 e5                	mov    %esp,%ebp
  10111d:	83 ec 10             	sub    $0x10,%esp
  101120:	e8 e2 f2 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  101125:	05 db ae 00 00       	add    $0xaedb,%eax
  10112a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101131:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  101138:	8b 90 24 7e 00 00    	mov    0x7e24(%eax),%edx
  10113e:	89 55 f8             	mov    %edx,-0x8(%ebp)
  101141:	eb 15                	jmp    101158 <get_mms+0x3e>
  101143:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101146:	3b 55 08             	cmp    0x8(%ebp),%edx
  101149:	74 15                	je     101160 <get_mms+0x46>
  10114b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  10114f:	8b 55 f8             	mov    -0x8(%ebp),%edx
  101152:	8b 52 0c             	mov    0xc(%edx),%edx
  101155:	89 55 f8             	mov    %edx,-0x8(%ebp)
  101158:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
  10115c:	75 e5                	jne    101143 <get_mms+0x29>
  10115e:	eb 01                	jmp    101161 <get_mms+0x47>
  101160:	90                   	nop
  101161:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
  101165:	74 0b                	je     101172 <get_mms+0x58>
  101167:	8b 80 40 7e 00 00    	mov    0x7e40(%eax),%eax
  10116d:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  101170:	75 07                	jne    101179 <get_mms+0x5f>
  101172:	b8 00 00 00 00       	mov    $0x0,%eax
  101177:	eb 05                	jmp    10117e <get_mms+0x64>
  101179:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10117c:	8b 00                	mov    (%eax),%eax
  10117e:	c9                   	leave  
  10117f:	c3                   	ret    

00101180 <get_mml>:
  101180:	55                   	push   %ebp
  101181:	89 e5                	mov    %esp,%ebp
  101183:	83 ec 10             	sub    $0x10,%esp
  101186:	e8 7c f2 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  10118b:	05 75 ae 00 00       	add    $0xae75,%eax
  101190:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101197:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  10119e:	8b 90 24 7e 00 00    	mov    0x7e24(%eax),%edx
  1011a4:	89 55 f8             	mov    %edx,-0x8(%ebp)
  1011a7:	eb 15                	jmp    1011be <get_mml+0x3e>
  1011a9:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1011ac:	3b 55 08             	cmp    0x8(%ebp),%edx
  1011af:	74 15                	je     1011c6 <get_mml+0x46>
  1011b1:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1011b5:	8b 55 f8             	mov    -0x8(%ebp),%edx
  1011b8:	8b 52 0c             	mov    0xc(%edx),%edx
  1011bb:	89 55 f8             	mov    %edx,-0x8(%ebp)
  1011be:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
  1011c2:	75 e5                	jne    1011a9 <get_mml+0x29>
  1011c4:	eb 01                	jmp    1011c7 <get_mml+0x47>
  1011c6:	90                   	nop
  1011c7:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
  1011cb:	74 0b                	je     1011d8 <get_mml+0x58>
  1011cd:	8b 80 40 7e 00 00    	mov    0x7e40(%eax),%eax
  1011d3:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  1011d6:	75 07                	jne    1011df <get_mml+0x5f>
  1011d8:	b8 00 00 00 00       	mov    $0x0,%eax
  1011dd:	eb 0f                	jmp    1011ee <get_mml+0x6e>
  1011df:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1011e2:	8b 50 04             	mov    0x4(%eax),%edx
  1011e5:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1011e8:	8b 00                	mov    (%eax),%eax
  1011ea:	29 c2                	sub    %eax,%edx
  1011ec:	89 d0                	mov    %edx,%eax
  1011ee:	c9                   	leave  
  1011ef:	c3                   	ret    

001011f0 <is_usable>:
  1011f0:	55                   	push   %ebp
  1011f1:	89 e5                	mov    %esp,%ebp
  1011f3:	83 ec 10             	sub    $0x10,%esp
  1011f6:	e8 0c f2 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  1011fb:	05 05 ae 00 00       	add    $0xae05,%eax
  101200:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101207:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  10120e:	8b 90 24 7e 00 00    	mov    0x7e24(%eax),%edx
  101214:	89 55 f8             	mov    %edx,-0x8(%ebp)
  101217:	eb 15                	jmp    10122e <is_usable+0x3e>
  101219:	8b 55 fc             	mov    -0x4(%ebp),%edx
  10121c:	3b 55 08             	cmp    0x8(%ebp),%edx
  10121f:	74 15                	je     101236 <is_usable+0x46>
  101221:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  101225:	8b 55 f8             	mov    -0x8(%ebp),%edx
  101228:	8b 52 0c             	mov    0xc(%edx),%edx
  10122b:	89 55 f8             	mov    %edx,-0x8(%ebp)
  10122e:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
  101232:	75 e5                	jne    101219 <is_usable+0x29>
  101234:	eb 01                	jmp    101237 <is_usable+0x47>
  101236:	90                   	nop
  101237:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
  10123b:	74 0b                	je     101248 <is_usable+0x58>
  10123d:	8b 80 40 7e 00 00    	mov    0x7e40(%eax),%eax
  101243:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  101246:	75 07                	jne    10124f <is_usable+0x5f>
  101248:	b8 00 00 00 00       	mov    $0x0,%eax
  10124d:	eb 0f                	jmp    10125e <is_usable+0x6e>
  10124f:	8b 45 f8             	mov    -0x8(%ebp),%eax
  101252:	8b 40 08             	mov    0x8(%eax),%eax
  101255:	83 f8 01             	cmp    $0x1,%eax
  101258:	0f 94 c0             	sete   %al
  10125b:	0f b6 c0             	movzbl %al,%eax
  10125e:	c9                   	leave  
  10125f:	c3                   	ret    

00101260 <set_cr3>:
  101260:	55                   	push   %ebp
  101261:	89 e5                	mov    %esp,%ebp
  101263:	53                   	push   %ebx
  101264:	83 ec 04             	sub    $0x4,%esp
  101267:	e8 9b f1 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  10126c:	05 94 ad 00 00       	add    $0xad94,%eax
  101271:	8b 55 08             	mov    0x8(%ebp),%edx
  101274:	83 ec 0c             	sub    $0xc,%esp
  101277:	52                   	push   %edx
  101278:	89 c3                	mov    %eax,%ebx
  10127a:	e8 83 2e 00 00       	call   104102 <lcr3>
  10127f:	83 c4 10             	add    $0x10,%esp
  101282:	90                   	nop
  101283:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101286:	c9                   	leave  
  101287:	c3                   	ret    

00101288 <enable_paging>:
  101288:	55                   	push   %ebp
  101289:	89 e5                	mov    %esp,%ebp
  10128b:	53                   	push   %ebx
  10128c:	83 ec 14             	sub    $0x14,%esp
  10128f:	e8 7b f1 ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  101294:	81 c3 6c ad 00 00    	add    $0xad6c,%ebx
  10129a:	e8 8f 2e 00 00       	call   10412e <rcr4>
  10129f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1012a2:	81 4d f4 80 00 00 00 	orl    $0x80,-0xc(%ebp)
  1012a9:	83 ec 0c             	sub    $0xc,%esp
  1012ac:	ff 75 f4             	pushl  -0xc(%ebp)
  1012af:	e8 64 2e 00 00       	call   104118 <lcr4>
  1012b4:	83 c4 10             	add    $0x10,%esp
  1012b7:	e8 10 2e 00 00       	call   1040cc <rcr0>
  1012bc:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1012bf:	81 4d f0 23 00 05 80 	orl    $0x80050023,-0x10(%ebp)
  1012c6:	83 65 f0 f3          	andl   $0xfffffff3,-0x10(%ebp)
  1012ca:	83 ec 0c             	sub    $0xc,%esp
  1012cd:	ff 75 f0             	pushl  -0x10(%ebp)
  1012d0:	e8 e1 2d 00 00       	call   1040b6 <lcr0>
  1012d5:	83 c4 10             	add    $0x10,%esp
  1012d8:	90                   	nop
  1012d9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1012dc:	c9                   	leave  
  1012dd:	c3                   	ret    

001012de <intr_init_idt>:
  1012de:	55                   	push   %ebp
  1012df:	89 e5                	mov    %esp,%ebp
  1012e1:	53                   	push   %ebx
  1012e2:	83 ec 10             	sub    $0x10,%esp
  1012e5:	e8 1d f1 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  1012ea:	05 16 ad 00 00       	add    $0xad16,%eax
  1012ef:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  1012f6:	e9 c3 00 00 00       	jmp    1013be <intr_init_idt+0xe0>
  1012fb:	c7 c2 9e 2d 10 00    	mov    $0x102d9e,%edx
  101301:	89 d3                	mov    %edx,%ebx
  101303:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101309:	8b 4d f8             	mov    -0x8(%ebp),%ecx
  10130c:	66 89 1c ca          	mov    %bx,(%edx,%ecx,8)
  101310:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101316:	8b 4d f8             	mov    -0x8(%ebp),%ecx
  101319:	66 c7 44 ca 02 08 00 	movw   $0x8,0x2(%edx,%ecx,8)
  101320:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101326:	8b 4d f8             	mov    -0x8(%ebp),%ecx
  101329:	0f b6 5c ca 04       	movzbl 0x4(%edx,%ecx,8),%ebx
  10132e:	83 e3 e0             	and    $0xffffffe0,%ebx
  101331:	88 5c ca 04          	mov    %bl,0x4(%edx,%ecx,8)
  101335:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10133b:	8b 4d f8             	mov    -0x8(%ebp),%ecx
  10133e:	0f b6 5c ca 04       	movzbl 0x4(%edx,%ecx,8),%ebx
  101343:	83 e3 1f             	and    $0x1f,%ebx
  101346:	88 5c ca 04          	mov    %bl,0x4(%edx,%ecx,8)
  10134a:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101350:	8b 4d f8             	mov    -0x8(%ebp),%ecx
  101353:	0f b6 5c ca 05       	movzbl 0x5(%edx,%ecx,8),%ebx
  101358:	83 e3 f0             	and    $0xfffffff0,%ebx
  10135b:	83 cb 0e             	or     $0xe,%ebx
  10135e:	88 5c ca 05          	mov    %bl,0x5(%edx,%ecx,8)
  101362:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101368:	8b 4d f8             	mov    -0x8(%ebp),%ecx
  10136b:	0f b6 5c ca 05       	movzbl 0x5(%edx,%ecx,8),%ebx
  101370:	83 e3 ef             	and    $0xffffffef,%ebx
  101373:	88 5c ca 05          	mov    %bl,0x5(%edx,%ecx,8)
  101377:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10137d:	8b 4d f8             	mov    -0x8(%ebp),%ecx
  101380:	0f b6 5c ca 05       	movzbl 0x5(%edx,%ecx,8),%ebx
  101385:	83 e3 9f             	and    $0xffffff9f,%ebx
  101388:	88 5c ca 05          	mov    %bl,0x5(%edx,%ecx,8)
  10138c:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101392:	8b 4d f8             	mov    -0x8(%ebp),%ecx
  101395:	0f b6 5c ca 05       	movzbl 0x5(%edx,%ecx,8),%ebx
  10139a:	83 cb 80             	or     $0xffffff80,%ebx
  10139d:	88 5c ca 05          	mov    %bl,0x5(%edx,%ecx,8)
  1013a1:	c7 c2 9e 2d 10 00    	mov    $0x102d9e,%edx
  1013a7:	c1 ea 10             	shr    $0x10,%edx
  1013aa:	89 d3                	mov    %edx,%ebx
  1013ac:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1013b2:	8b 4d f8             	mov    -0x8(%ebp),%ecx
  1013b5:	66 89 5c ca 06       	mov    %bx,0x6(%edx,%ecx,8)
  1013ba:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  1013be:	8b 55 f8             	mov    -0x8(%ebp),%edx
  1013c1:	81 fa ff 00 00 00    	cmp    $0xff,%edx
  1013c7:	0f 86 2e ff ff ff    	jbe    1012fb <intr_init_idt+0x1d>
  1013cd:	c7 c2 40 2c 10 00    	mov    $0x102c40,%edx
  1013d3:	89 d1                	mov    %edx,%ecx
  1013d5:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1013db:	66 89 0a             	mov    %cx,(%edx)
  1013de:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1013e4:	66 c7 42 02 08 00    	movw   $0x8,0x2(%edx)
  1013ea:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1013f0:	0f b6 4a 04          	movzbl 0x4(%edx),%ecx
  1013f4:	83 e1 e0             	and    $0xffffffe0,%ecx
  1013f7:	88 4a 04             	mov    %cl,0x4(%edx)
  1013fa:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101400:	0f b6 4a 04          	movzbl 0x4(%edx),%ecx
  101404:	83 e1 1f             	and    $0x1f,%ecx
  101407:	88 4a 04             	mov    %cl,0x4(%edx)
  10140a:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101410:	0f b6 4a 05          	movzbl 0x5(%edx),%ecx
  101414:	83 e1 f0             	and    $0xfffffff0,%ecx
  101417:	83 c9 0e             	or     $0xe,%ecx
  10141a:	88 4a 05             	mov    %cl,0x5(%edx)
  10141d:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101423:	0f b6 4a 05          	movzbl 0x5(%edx),%ecx
  101427:	83 e1 ef             	and    $0xffffffef,%ecx
  10142a:	88 4a 05             	mov    %cl,0x5(%edx)
  10142d:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101433:	0f b6 4a 05          	movzbl 0x5(%edx),%ecx
  101437:	83 e1 9f             	and    $0xffffff9f,%ecx
  10143a:	88 4a 05             	mov    %cl,0x5(%edx)
  10143d:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101443:	0f b6 4a 05          	movzbl 0x5(%edx),%ecx
  101447:	83 c9 80             	or     $0xffffff80,%ecx
  10144a:	88 4a 05             	mov    %cl,0x5(%edx)
  10144d:	c7 c2 40 2c 10 00    	mov    $0x102c40,%edx
  101453:	c1 ea 10             	shr    $0x10,%edx
  101456:	89 d1                	mov    %edx,%ecx
  101458:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10145e:	66 89 4a 06          	mov    %cx,0x6(%edx)
  101462:	c7 c2 4a 2c 10 00    	mov    $0x102c4a,%edx
  101468:	89 d1                	mov    %edx,%ecx
  10146a:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101470:	66 89 4a 08          	mov    %cx,0x8(%edx)
  101474:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10147a:	66 c7 42 0a 08 00    	movw   $0x8,0xa(%edx)
  101480:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101486:	0f b6 4a 0c          	movzbl 0xc(%edx),%ecx
  10148a:	83 e1 e0             	and    $0xffffffe0,%ecx
  10148d:	88 4a 0c             	mov    %cl,0xc(%edx)
  101490:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101496:	0f b6 4a 0c          	movzbl 0xc(%edx),%ecx
  10149a:	83 e1 1f             	and    $0x1f,%ecx
  10149d:	88 4a 0c             	mov    %cl,0xc(%edx)
  1014a0:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1014a6:	0f b6 4a 0d          	movzbl 0xd(%edx),%ecx
  1014aa:	83 e1 f0             	and    $0xfffffff0,%ecx
  1014ad:	83 c9 0e             	or     $0xe,%ecx
  1014b0:	88 4a 0d             	mov    %cl,0xd(%edx)
  1014b3:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1014b9:	0f b6 4a 0d          	movzbl 0xd(%edx),%ecx
  1014bd:	83 e1 ef             	and    $0xffffffef,%ecx
  1014c0:	88 4a 0d             	mov    %cl,0xd(%edx)
  1014c3:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1014c9:	0f b6 4a 0d          	movzbl 0xd(%edx),%ecx
  1014cd:	83 e1 9f             	and    $0xffffff9f,%ecx
  1014d0:	88 4a 0d             	mov    %cl,0xd(%edx)
  1014d3:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1014d9:	0f b6 4a 0d          	movzbl 0xd(%edx),%ecx
  1014dd:	83 c9 80             	or     $0xffffff80,%ecx
  1014e0:	88 4a 0d             	mov    %cl,0xd(%edx)
  1014e3:	c7 c2 4a 2c 10 00    	mov    $0x102c4a,%edx
  1014e9:	c1 ea 10             	shr    $0x10,%edx
  1014ec:	89 d1                	mov    %edx,%ecx
  1014ee:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1014f4:	66 89 4a 0e          	mov    %cx,0xe(%edx)
  1014f8:	c7 c2 54 2c 10 00    	mov    $0x102c54,%edx
  1014fe:	89 d1                	mov    %edx,%ecx
  101500:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101506:	66 89 4a 10          	mov    %cx,0x10(%edx)
  10150a:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101510:	66 c7 42 12 08 00    	movw   $0x8,0x12(%edx)
  101516:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10151c:	0f b6 4a 14          	movzbl 0x14(%edx),%ecx
  101520:	83 e1 e0             	and    $0xffffffe0,%ecx
  101523:	88 4a 14             	mov    %cl,0x14(%edx)
  101526:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10152c:	0f b6 4a 14          	movzbl 0x14(%edx),%ecx
  101530:	83 e1 1f             	and    $0x1f,%ecx
  101533:	88 4a 14             	mov    %cl,0x14(%edx)
  101536:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10153c:	0f b6 4a 15          	movzbl 0x15(%edx),%ecx
  101540:	83 e1 f0             	and    $0xfffffff0,%ecx
  101543:	83 c9 0e             	or     $0xe,%ecx
  101546:	88 4a 15             	mov    %cl,0x15(%edx)
  101549:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10154f:	0f b6 4a 15          	movzbl 0x15(%edx),%ecx
  101553:	83 e1 ef             	and    $0xffffffef,%ecx
  101556:	88 4a 15             	mov    %cl,0x15(%edx)
  101559:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10155f:	0f b6 4a 15          	movzbl 0x15(%edx),%ecx
  101563:	83 e1 9f             	and    $0xffffff9f,%ecx
  101566:	88 4a 15             	mov    %cl,0x15(%edx)
  101569:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10156f:	0f b6 4a 15          	movzbl 0x15(%edx),%ecx
  101573:	83 c9 80             	or     $0xffffff80,%ecx
  101576:	88 4a 15             	mov    %cl,0x15(%edx)
  101579:	c7 c2 54 2c 10 00    	mov    $0x102c54,%edx
  10157f:	c1 ea 10             	shr    $0x10,%edx
  101582:	89 d1                	mov    %edx,%ecx
  101584:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10158a:	66 89 4a 16          	mov    %cx,0x16(%edx)
  10158e:	c7 c2 5e 2c 10 00    	mov    $0x102c5e,%edx
  101594:	89 d1                	mov    %edx,%ecx
  101596:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10159c:	66 89 4a 18          	mov    %cx,0x18(%edx)
  1015a0:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1015a6:	66 c7 42 1a 08 00    	movw   $0x8,0x1a(%edx)
  1015ac:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1015b2:	0f b6 4a 1c          	movzbl 0x1c(%edx),%ecx
  1015b6:	83 e1 e0             	and    $0xffffffe0,%ecx
  1015b9:	88 4a 1c             	mov    %cl,0x1c(%edx)
  1015bc:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1015c2:	0f b6 4a 1c          	movzbl 0x1c(%edx),%ecx
  1015c6:	83 e1 1f             	and    $0x1f,%ecx
  1015c9:	88 4a 1c             	mov    %cl,0x1c(%edx)
  1015cc:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1015d2:	0f b6 4a 1d          	movzbl 0x1d(%edx),%ecx
  1015d6:	83 e1 f0             	and    $0xfffffff0,%ecx
  1015d9:	83 c9 0e             	or     $0xe,%ecx
  1015dc:	88 4a 1d             	mov    %cl,0x1d(%edx)
  1015df:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1015e5:	0f b6 4a 1d          	movzbl 0x1d(%edx),%ecx
  1015e9:	83 e1 ef             	and    $0xffffffef,%ecx
  1015ec:	88 4a 1d             	mov    %cl,0x1d(%edx)
  1015ef:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1015f5:	0f b6 4a 1d          	movzbl 0x1d(%edx),%ecx
  1015f9:	83 c9 60             	or     $0x60,%ecx
  1015fc:	88 4a 1d             	mov    %cl,0x1d(%edx)
  1015ff:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101605:	0f b6 4a 1d          	movzbl 0x1d(%edx),%ecx
  101609:	83 c9 80             	or     $0xffffff80,%ecx
  10160c:	88 4a 1d             	mov    %cl,0x1d(%edx)
  10160f:	c7 c2 5e 2c 10 00    	mov    $0x102c5e,%edx
  101615:	c1 ea 10             	shr    $0x10,%edx
  101618:	89 d1                	mov    %edx,%ecx
  10161a:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101620:	66 89 4a 1e          	mov    %cx,0x1e(%edx)
  101624:	c7 c2 68 2c 10 00    	mov    $0x102c68,%edx
  10162a:	89 d1                	mov    %edx,%ecx
  10162c:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101632:	66 89 4a 20          	mov    %cx,0x20(%edx)
  101636:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10163c:	66 c7 42 22 08 00    	movw   $0x8,0x22(%edx)
  101642:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101648:	0f b6 4a 24          	movzbl 0x24(%edx),%ecx
  10164c:	83 e1 e0             	and    $0xffffffe0,%ecx
  10164f:	88 4a 24             	mov    %cl,0x24(%edx)
  101652:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101658:	0f b6 4a 24          	movzbl 0x24(%edx),%ecx
  10165c:	83 e1 1f             	and    $0x1f,%ecx
  10165f:	88 4a 24             	mov    %cl,0x24(%edx)
  101662:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101668:	0f b6 4a 25          	movzbl 0x25(%edx),%ecx
  10166c:	83 e1 f0             	and    $0xfffffff0,%ecx
  10166f:	83 c9 0e             	or     $0xe,%ecx
  101672:	88 4a 25             	mov    %cl,0x25(%edx)
  101675:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10167b:	0f b6 4a 25          	movzbl 0x25(%edx),%ecx
  10167f:	83 e1 ef             	and    $0xffffffef,%ecx
  101682:	88 4a 25             	mov    %cl,0x25(%edx)
  101685:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10168b:	0f b6 4a 25          	movzbl 0x25(%edx),%ecx
  10168f:	83 c9 60             	or     $0x60,%ecx
  101692:	88 4a 25             	mov    %cl,0x25(%edx)
  101695:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10169b:	0f b6 4a 25          	movzbl 0x25(%edx),%ecx
  10169f:	83 c9 80             	or     $0xffffff80,%ecx
  1016a2:	88 4a 25             	mov    %cl,0x25(%edx)
  1016a5:	c7 c2 68 2c 10 00    	mov    $0x102c68,%edx
  1016ab:	c1 ea 10             	shr    $0x10,%edx
  1016ae:	89 d1                	mov    %edx,%ecx
  1016b0:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1016b6:	66 89 4a 26          	mov    %cx,0x26(%edx)
  1016ba:	c7 c2 72 2c 10 00    	mov    $0x102c72,%edx
  1016c0:	89 d1                	mov    %edx,%ecx
  1016c2:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1016c8:	66 89 4a 28          	mov    %cx,0x28(%edx)
  1016cc:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1016d2:	66 c7 42 2a 08 00    	movw   $0x8,0x2a(%edx)
  1016d8:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1016de:	0f b6 4a 2c          	movzbl 0x2c(%edx),%ecx
  1016e2:	83 e1 e0             	and    $0xffffffe0,%ecx
  1016e5:	88 4a 2c             	mov    %cl,0x2c(%edx)
  1016e8:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1016ee:	0f b6 4a 2c          	movzbl 0x2c(%edx),%ecx
  1016f2:	83 e1 1f             	and    $0x1f,%ecx
  1016f5:	88 4a 2c             	mov    %cl,0x2c(%edx)
  1016f8:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1016fe:	0f b6 4a 2d          	movzbl 0x2d(%edx),%ecx
  101702:	83 e1 f0             	and    $0xfffffff0,%ecx
  101705:	83 c9 0e             	or     $0xe,%ecx
  101708:	88 4a 2d             	mov    %cl,0x2d(%edx)
  10170b:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101711:	0f b6 4a 2d          	movzbl 0x2d(%edx),%ecx
  101715:	83 e1 ef             	and    $0xffffffef,%ecx
  101718:	88 4a 2d             	mov    %cl,0x2d(%edx)
  10171b:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101721:	0f b6 4a 2d          	movzbl 0x2d(%edx),%ecx
  101725:	83 e1 9f             	and    $0xffffff9f,%ecx
  101728:	88 4a 2d             	mov    %cl,0x2d(%edx)
  10172b:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101731:	0f b6 4a 2d          	movzbl 0x2d(%edx),%ecx
  101735:	83 c9 80             	or     $0xffffff80,%ecx
  101738:	88 4a 2d             	mov    %cl,0x2d(%edx)
  10173b:	c7 c2 72 2c 10 00    	mov    $0x102c72,%edx
  101741:	c1 ea 10             	shr    $0x10,%edx
  101744:	89 d1                	mov    %edx,%ecx
  101746:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10174c:	66 89 4a 2e          	mov    %cx,0x2e(%edx)
  101750:	c7 c2 7c 2c 10 00    	mov    $0x102c7c,%edx
  101756:	89 d1                	mov    %edx,%ecx
  101758:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10175e:	66 89 4a 30          	mov    %cx,0x30(%edx)
  101762:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101768:	66 c7 42 32 08 00    	movw   $0x8,0x32(%edx)
  10176e:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101774:	0f b6 4a 34          	movzbl 0x34(%edx),%ecx
  101778:	83 e1 e0             	and    $0xffffffe0,%ecx
  10177b:	88 4a 34             	mov    %cl,0x34(%edx)
  10177e:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101784:	0f b6 4a 34          	movzbl 0x34(%edx),%ecx
  101788:	83 e1 1f             	and    $0x1f,%ecx
  10178b:	88 4a 34             	mov    %cl,0x34(%edx)
  10178e:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101794:	0f b6 4a 35          	movzbl 0x35(%edx),%ecx
  101798:	83 e1 f0             	and    $0xfffffff0,%ecx
  10179b:	83 c9 0e             	or     $0xe,%ecx
  10179e:	88 4a 35             	mov    %cl,0x35(%edx)
  1017a1:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1017a7:	0f b6 4a 35          	movzbl 0x35(%edx),%ecx
  1017ab:	83 e1 ef             	and    $0xffffffef,%ecx
  1017ae:	88 4a 35             	mov    %cl,0x35(%edx)
  1017b1:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1017b7:	0f b6 4a 35          	movzbl 0x35(%edx),%ecx
  1017bb:	83 e1 9f             	and    $0xffffff9f,%ecx
  1017be:	88 4a 35             	mov    %cl,0x35(%edx)
  1017c1:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1017c7:	0f b6 4a 35          	movzbl 0x35(%edx),%ecx
  1017cb:	83 c9 80             	or     $0xffffff80,%ecx
  1017ce:	88 4a 35             	mov    %cl,0x35(%edx)
  1017d1:	c7 c2 7c 2c 10 00    	mov    $0x102c7c,%edx
  1017d7:	c1 ea 10             	shr    $0x10,%edx
  1017da:	89 d1                	mov    %edx,%ecx
  1017dc:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1017e2:	66 89 4a 36          	mov    %cx,0x36(%edx)
  1017e6:	c7 c2 86 2c 10 00    	mov    $0x102c86,%edx
  1017ec:	89 d1                	mov    %edx,%ecx
  1017ee:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1017f4:	66 89 4a 38          	mov    %cx,0x38(%edx)
  1017f8:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1017fe:	66 c7 42 3a 08 00    	movw   $0x8,0x3a(%edx)
  101804:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10180a:	0f b6 4a 3c          	movzbl 0x3c(%edx),%ecx
  10180e:	83 e1 e0             	and    $0xffffffe0,%ecx
  101811:	88 4a 3c             	mov    %cl,0x3c(%edx)
  101814:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10181a:	0f b6 4a 3c          	movzbl 0x3c(%edx),%ecx
  10181e:	83 e1 1f             	and    $0x1f,%ecx
  101821:	88 4a 3c             	mov    %cl,0x3c(%edx)
  101824:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10182a:	0f b6 4a 3d          	movzbl 0x3d(%edx),%ecx
  10182e:	83 e1 f0             	and    $0xfffffff0,%ecx
  101831:	83 c9 0e             	or     $0xe,%ecx
  101834:	88 4a 3d             	mov    %cl,0x3d(%edx)
  101837:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10183d:	0f b6 4a 3d          	movzbl 0x3d(%edx),%ecx
  101841:	83 e1 ef             	and    $0xffffffef,%ecx
  101844:	88 4a 3d             	mov    %cl,0x3d(%edx)
  101847:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10184d:	0f b6 4a 3d          	movzbl 0x3d(%edx),%ecx
  101851:	83 e1 9f             	and    $0xffffff9f,%ecx
  101854:	88 4a 3d             	mov    %cl,0x3d(%edx)
  101857:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10185d:	0f b6 4a 3d          	movzbl 0x3d(%edx),%ecx
  101861:	83 c9 80             	or     $0xffffff80,%ecx
  101864:	88 4a 3d             	mov    %cl,0x3d(%edx)
  101867:	c7 c2 86 2c 10 00    	mov    $0x102c86,%edx
  10186d:	c1 ea 10             	shr    $0x10,%edx
  101870:	89 d1                	mov    %edx,%ecx
  101872:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101878:	66 89 4a 3e          	mov    %cx,0x3e(%edx)
  10187c:	c7 c2 90 2c 10 00    	mov    $0x102c90,%edx
  101882:	89 d1                	mov    %edx,%ecx
  101884:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10188a:	66 89 4a 40          	mov    %cx,0x40(%edx)
  10188e:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101894:	66 c7 42 42 08 00    	movw   $0x8,0x42(%edx)
  10189a:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1018a0:	0f b6 4a 44          	movzbl 0x44(%edx),%ecx
  1018a4:	83 e1 e0             	and    $0xffffffe0,%ecx
  1018a7:	88 4a 44             	mov    %cl,0x44(%edx)
  1018aa:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1018b0:	0f b6 4a 44          	movzbl 0x44(%edx),%ecx
  1018b4:	83 e1 1f             	and    $0x1f,%ecx
  1018b7:	88 4a 44             	mov    %cl,0x44(%edx)
  1018ba:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1018c0:	0f b6 4a 45          	movzbl 0x45(%edx),%ecx
  1018c4:	83 e1 f0             	and    $0xfffffff0,%ecx
  1018c7:	83 c9 0e             	or     $0xe,%ecx
  1018ca:	88 4a 45             	mov    %cl,0x45(%edx)
  1018cd:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1018d3:	0f b6 4a 45          	movzbl 0x45(%edx),%ecx
  1018d7:	83 e1 ef             	and    $0xffffffef,%ecx
  1018da:	88 4a 45             	mov    %cl,0x45(%edx)
  1018dd:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1018e3:	0f b6 4a 45          	movzbl 0x45(%edx),%ecx
  1018e7:	83 e1 9f             	and    $0xffffff9f,%ecx
  1018ea:	88 4a 45             	mov    %cl,0x45(%edx)
  1018ed:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1018f3:	0f b6 4a 45          	movzbl 0x45(%edx),%ecx
  1018f7:	83 c9 80             	or     $0xffffff80,%ecx
  1018fa:	88 4a 45             	mov    %cl,0x45(%edx)
  1018fd:	c7 c2 90 2c 10 00    	mov    $0x102c90,%edx
  101903:	c1 ea 10             	shr    $0x10,%edx
  101906:	89 d1                	mov    %edx,%ecx
  101908:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10190e:	66 89 4a 46          	mov    %cx,0x46(%edx)
  101912:	c7 c2 a2 2c 10 00    	mov    $0x102ca2,%edx
  101918:	89 d1                	mov    %edx,%ecx
  10191a:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101920:	66 89 4a 50          	mov    %cx,0x50(%edx)
  101924:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10192a:	66 c7 42 52 08 00    	movw   $0x8,0x52(%edx)
  101930:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101936:	0f b6 4a 54          	movzbl 0x54(%edx),%ecx
  10193a:	83 e1 e0             	and    $0xffffffe0,%ecx
  10193d:	88 4a 54             	mov    %cl,0x54(%edx)
  101940:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101946:	0f b6 4a 54          	movzbl 0x54(%edx),%ecx
  10194a:	83 e1 1f             	and    $0x1f,%ecx
  10194d:	88 4a 54             	mov    %cl,0x54(%edx)
  101950:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101956:	0f b6 4a 55          	movzbl 0x55(%edx),%ecx
  10195a:	83 e1 f0             	and    $0xfffffff0,%ecx
  10195d:	83 c9 0e             	or     $0xe,%ecx
  101960:	88 4a 55             	mov    %cl,0x55(%edx)
  101963:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101969:	0f b6 4a 55          	movzbl 0x55(%edx),%ecx
  10196d:	83 e1 ef             	and    $0xffffffef,%ecx
  101970:	88 4a 55             	mov    %cl,0x55(%edx)
  101973:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101979:	0f b6 4a 55          	movzbl 0x55(%edx),%ecx
  10197d:	83 e1 9f             	and    $0xffffff9f,%ecx
  101980:	88 4a 55             	mov    %cl,0x55(%edx)
  101983:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101989:	0f b6 4a 55          	movzbl 0x55(%edx),%ecx
  10198d:	83 c9 80             	or     $0xffffff80,%ecx
  101990:	88 4a 55             	mov    %cl,0x55(%edx)
  101993:	c7 c2 a2 2c 10 00    	mov    $0x102ca2,%edx
  101999:	c1 ea 10             	shr    $0x10,%edx
  10199c:	89 d1                	mov    %edx,%ecx
  10199e:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1019a4:	66 89 4a 56          	mov    %cx,0x56(%edx)
  1019a8:	c7 c2 aa 2c 10 00    	mov    $0x102caa,%edx
  1019ae:	89 d1                	mov    %edx,%ecx
  1019b0:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1019b6:	66 89 4a 58          	mov    %cx,0x58(%edx)
  1019ba:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1019c0:	66 c7 42 5a 08 00    	movw   $0x8,0x5a(%edx)
  1019c6:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1019cc:	0f b6 4a 5c          	movzbl 0x5c(%edx),%ecx
  1019d0:	83 e1 e0             	and    $0xffffffe0,%ecx
  1019d3:	88 4a 5c             	mov    %cl,0x5c(%edx)
  1019d6:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1019dc:	0f b6 4a 5c          	movzbl 0x5c(%edx),%ecx
  1019e0:	83 e1 1f             	and    $0x1f,%ecx
  1019e3:	88 4a 5c             	mov    %cl,0x5c(%edx)
  1019e6:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1019ec:	0f b6 4a 5d          	movzbl 0x5d(%edx),%ecx
  1019f0:	83 e1 f0             	and    $0xfffffff0,%ecx
  1019f3:	83 c9 0e             	or     $0xe,%ecx
  1019f6:	88 4a 5d             	mov    %cl,0x5d(%edx)
  1019f9:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1019ff:	0f b6 4a 5d          	movzbl 0x5d(%edx),%ecx
  101a03:	83 e1 ef             	and    $0xffffffef,%ecx
  101a06:	88 4a 5d             	mov    %cl,0x5d(%edx)
  101a09:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101a0f:	0f b6 4a 5d          	movzbl 0x5d(%edx),%ecx
  101a13:	83 e1 9f             	and    $0xffffff9f,%ecx
  101a16:	88 4a 5d             	mov    %cl,0x5d(%edx)
  101a19:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101a1f:	0f b6 4a 5d          	movzbl 0x5d(%edx),%ecx
  101a23:	83 c9 80             	or     $0xffffff80,%ecx
  101a26:	88 4a 5d             	mov    %cl,0x5d(%edx)
  101a29:	c7 c2 aa 2c 10 00    	mov    $0x102caa,%edx
  101a2f:	c1 ea 10             	shr    $0x10,%edx
  101a32:	89 d1                	mov    %edx,%ecx
  101a34:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101a3a:	66 89 4a 5e          	mov    %cx,0x5e(%edx)
  101a3e:	c7 c2 b2 2c 10 00    	mov    $0x102cb2,%edx
  101a44:	89 d1                	mov    %edx,%ecx
  101a46:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101a4c:	66 89 4a 60          	mov    %cx,0x60(%edx)
  101a50:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101a56:	66 c7 42 62 08 00    	movw   $0x8,0x62(%edx)
  101a5c:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101a62:	0f b6 4a 64          	movzbl 0x64(%edx),%ecx
  101a66:	83 e1 e0             	and    $0xffffffe0,%ecx
  101a69:	88 4a 64             	mov    %cl,0x64(%edx)
  101a6c:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101a72:	0f b6 4a 64          	movzbl 0x64(%edx),%ecx
  101a76:	83 e1 1f             	and    $0x1f,%ecx
  101a79:	88 4a 64             	mov    %cl,0x64(%edx)
  101a7c:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101a82:	0f b6 4a 65          	movzbl 0x65(%edx),%ecx
  101a86:	83 e1 f0             	and    $0xfffffff0,%ecx
  101a89:	83 c9 0e             	or     $0xe,%ecx
  101a8c:	88 4a 65             	mov    %cl,0x65(%edx)
  101a8f:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101a95:	0f b6 4a 65          	movzbl 0x65(%edx),%ecx
  101a99:	83 e1 ef             	and    $0xffffffef,%ecx
  101a9c:	88 4a 65             	mov    %cl,0x65(%edx)
  101a9f:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101aa5:	0f b6 4a 65          	movzbl 0x65(%edx),%ecx
  101aa9:	83 e1 9f             	and    $0xffffff9f,%ecx
  101aac:	88 4a 65             	mov    %cl,0x65(%edx)
  101aaf:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101ab5:	0f b6 4a 65          	movzbl 0x65(%edx),%ecx
  101ab9:	83 c9 80             	or     $0xffffff80,%ecx
  101abc:	88 4a 65             	mov    %cl,0x65(%edx)
  101abf:	c7 c2 b2 2c 10 00    	mov    $0x102cb2,%edx
  101ac5:	c1 ea 10             	shr    $0x10,%edx
  101ac8:	89 d1                	mov    %edx,%ecx
  101aca:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101ad0:	66 89 4a 66          	mov    %cx,0x66(%edx)
  101ad4:	c7 c2 ba 2c 10 00    	mov    $0x102cba,%edx
  101ada:	89 d1                	mov    %edx,%ecx
  101adc:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101ae2:	66 89 4a 68          	mov    %cx,0x68(%edx)
  101ae6:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101aec:	66 c7 42 6a 08 00    	movw   $0x8,0x6a(%edx)
  101af2:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101af8:	0f b6 4a 6c          	movzbl 0x6c(%edx),%ecx
  101afc:	83 e1 e0             	and    $0xffffffe0,%ecx
  101aff:	88 4a 6c             	mov    %cl,0x6c(%edx)
  101b02:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101b08:	0f b6 4a 6c          	movzbl 0x6c(%edx),%ecx
  101b0c:	83 e1 1f             	and    $0x1f,%ecx
  101b0f:	88 4a 6c             	mov    %cl,0x6c(%edx)
  101b12:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101b18:	0f b6 4a 6d          	movzbl 0x6d(%edx),%ecx
  101b1c:	83 e1 f0             	and    $0xfffffff0,%ecx
  101b1f:	83 c9 0e             	or     $0xe,%ecx
  101b22:	88 4a 6d             	mov    %cl,0x6d(%edx)
  101b25:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101b2b:	0f b6 4a 6d          	movzbl 0x6d(%edx),%ecx
  101b2f:	83 e1 ef             	and    $0xffffffef,%ecx
  101b32:	88 4a 6d             	mov    %cl,0x6d(%edx)
  101b35:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101b3b:	0f b6 4a 6d          	movzbl 0x6d(%edx),%ecx
  101b3f:	83 e1 9f             	and    $0xffffff9f,%ecx
  101b42:	88 4a 6d             	mov    %cl,0x6d(%edx)
  101b45:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101b4b:	0f b6 4a 6d          	movzbl 0x6d(%edx),%ecx
  101b4f:	83 c9 80             	or     $0xffffff80,%ecx
  101b52:	88 4a 6d             	mov    %cl,0x6d(%edx)
  101b55:	c7 c2 ba 2c 10 00    	mov    $0x102cba,%edx
  101b5b:	c1 ea 10             	shr    $0x10,%edx
  101b5e:	89 d1                	mov    %edx,%ecx
  101b60:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101b66:	66 89 4a 6e          	mov    %cx,0x6e(%edx)
  101b6a:	c7 c2 c2 2c 10 00    	mov    $0x102cc2,%edx
  101b70:	89 d1                	mov    %edx,%ecx
  101b72:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101b78:	66 89 4a 70          	mov    %cx,0x70(%edx)
  101b7c:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101b82:	66 c7 42 72 08 00    	movw   $0x8,0x72(%edx)
  101b88:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101b8e:	0f b6 4a 74          	movzbl 0x74(%edx),%ecx
  101b92:	83 e1 e0             	and    $0xffffffe0,%ecx
  101b95:	88 4a 74             	mov    %cl,0x74(%edx)
  101b98:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101b9e:	0f b6 4a 74          	movzbl 0x74(%edx),%ecx
  101ba2:	83 e1 1f             	and    $0x1f,%ecx
  101ba5:	88 4a 74             	mov    %cl,0x74(%edx)
  101ba8:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101bae:	0f b6 4a 75          	movzbl 0x75(%edx),%ecx
  101bb2:	83 e1 f0             	and    $0xfffffff0,%ecx
  101bb5:	83 c9 0e             	or     $0xe,%ecx
  101bb8:	88 4a 75             	mov    %cl,0x75(%edx)
  101bbb:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101bc1:	0f b6 4a 75          	movzbl 0x75(%edx),%ecx
  101bc5:	83 e1 ef             	and    $0xffffffef,%ecx
  101bc8:	88 4a 75             	mov    %cl,0x75(%edx)
  101bcb:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101bd1:	0f b6 4a 75          	movzbl 0x75(%edx),%ecx
  101bd5:	83 e1 9f             	and    $0xffffff9f,%ecx
  101bd8:	88 4a 75             	mov    %cl,0x75(%edx)
  101bdb:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101be1:	0f b6 4a 75          	movzbl 0x75(%edx),%ecx
  101be5:	83 c9 80             	or     $0xffffff80,%ecx
  101be8:	88 4a 75             	mov    %cl,0x75(%edx)
  101beb:	c7 c2 c2 2c 10 00    	mov    $0x102cc2,%edx
  101bf1:	c1 ea 10             	shr    $0x10,%edx
  101bf4:	89 d1                	mov    %edx,%ecx
  101bf6:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101bfc:	66 89 4a 76          	mov    %cx,0x76(%edx)
  101c00:	c7 c2 d4 2c 10 00    	mov    $0x102cd4,%edx
  101c06:	89 d1                	mov    %edx,%ecx
  101c08:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101c0e:	66 89 8a 80 00 00 00 	mov    %cx,0x80(%edx)
  101c15:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101c1b:	66 c7 82 82 00 00 00 	movw   $0x8,0x82(%edx)
  101c22:	08 00 
  101c24:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101c2a:	0f b6 8a 84 00 00 00 	movzbl 0x84(%edx),%ecx
  101c31:	83 e1 e0             	and    $0xffffffe0,%ecx
  101c34:	88 8a 84 00 00 00    	mov    %cl,0x84(%edx)
  101c3a:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101c40:	0f b6 8a 84 00 00 00 	movzbl 0x84(%edx),%ecx
  101c47:	83 e1 1f             	and    $0x1f,%ecx
  101c4a:	88 8a 84 00 00 00    	mov    %cl,0x84(%edx)
  101c50:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101c56:	0f b6 8a 85 00 00 00 	movzbl 0x85(%edx),%ecx
  101c5d:	83 e1 f0             	and    $0xfffffff0,%ecx
  101c60:	83 c9 0e             	or     $0xe,%ecx
  101c63:	88 8a 85 00 00 00    	mov    %cl,0x85(%edx)
  101c69:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101c6f:	0f b6 8a 85 00 00 00 	movzbl 0x85(%edx),%ecx
  101c76:	83 e1 ef             	and    $0xffffffef,%ecx
  101c79:	88 8a 85 00 00 00    	mov    %cl,0x85(%edx)
  101c7f:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101c85:	0f b6 8a 85 00 00 00 	movzbl 0x85(%edx),%ecx
  101c8c:	83 e1 9f             	and    $0xffffff9f,%ecx
  101c8f:	88 8a 85 00 00 00    	mov    %cl,0x85(%edx)
  101c95:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101c9b:	0f b6 8a 85 00 00 00 	movzbl 0x85(%edx),%ecx
  101ca2:	83 c9 80             	or     $0xffffff80,%ecx
  101ca5:	88 8a 85 00 00 00    	mov    %cl,0x85(%edx)
  101cab:	c7 c2 d4 2c 10 00    	mov    $0x102cd4,%edx
  101cb1:	c1 ea 10             	shr    $0x10,%edx
  101cb4:	89 d1                	mov    %edx,%ecx
  101cb6:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101cbc:	66 89 8a 86 00 00 00 	mov    %cx,0x86(%edx)
  101cc3:	c7 c2 de 2c 10 00    	mov    $0x102cde,%edx
  101cc9:	89 d1                	mov    %edx,%ecx
  101ccb:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101cd1:	66 89 8a 88 00 00 00 	mov    %cx,0x88(%edx)
  101cd8:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101cde:	66 c7 82 8a 00 00 00 	movw   $0x8,0x8a(%edx)
  101ce5:	08 00 
  101ce7:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101ced:	0f b6 8a 8c 00 00 00 	movzbl 0x8c(%edx),%ecx
  101cf4:	83 e1 e0             	and    $0xffffffe0,%ecx
  101cf7:	88 8a 8c 00 00 00    	mov    %cl,0x8c(%edx)
  101cfd:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101d03:	0f b6 8a 8c 00 00 00 	movzbl 0x8c(%edx),%ecx
  101d0a:	83 e1 1f             	and    $0x1f,%ecx
  101d0d:	88 8a 8c 00 00 00    	mov    %cl,0x8c(%edx)
  101d13:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101d19:	0f b6 8a 8d 00 00 00 	movzbl 0x8d(%edx),%ecx
  101d20:	83 e1 f0             	and    $0xfffffff0,%ecx
  101d23:	83 c9 0e             	or     $0xe,%ecx
  101d26:	88 8a 8d 00 00 00    	mov    %cl,0x8d(%edx)
  101d2c:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101d32:	0f b6 8a 8d 00 00 00 	movzbl 0x8d(%edx),%ecx
  101d39:	83 e1 ef             	and    $0xffffffef,%ecx
  101d3c:	88 8a 8d 00 00 00    	mov    %cl,0x8d(%edx)
  101d42:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101d48:	0f b6 8a 8d 00 00 00 	movzbl 0x8d(%edx),%ecx
  101d4f:	83 e1 9f             	and    $0xffffff9f,%ecx
  101d52:	88 8a 8d 00 00 00    	mov    %cl,0x8d(%edx)
  101d58:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101d5e:	0f b6 8a 8d 00 00 00 	movzbl 0x8d(%edx),%ecx
  101d65:	83 c9 80             	or     $0xffffff80,%ecx
  101d68:	88 8a 8d 00 00 00    	mov    %cl,0x8d(%edx)
  101d6e:	c7 c2 de 2c 10 00    	mov    $0x102cde,%edx
  101d74:	c1 ea 10             	shr    $0x10,%edx
  101d77:	89 d1                	mov    %edx,%ecx
  101d79:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101d7f:	66 89 8a 8e 00 00 00 	mov    %cx,0x8e(%edx)
  101d86:	c7 c2 e6 2c 10 00    	mov    $0x102ce6,%edx
  101d8c:	89 d1                	mov    %edx,%ecx
  101d8e:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101d94:	66 89 8a 90 00 00 00 	mov    %cx,0x90(%edx)
  101d9b:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101da1:	66 c7 82 92 00 00 00 	movw   $0x8,0x92(%edx)
  101da8:	08 00 
  101daa:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101db0:	0f b6 8a 94 00 00 00 	movzbl 0x94(%edx),%ecx
  101db7:	83 e1 e0             	and    $0xffffffe0,%ecx
  101dba:	88 8a 94 00 00 00    	mov    %cl,0x94(%edx)
  101dc0:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101dc6:	0f b6 8a 94 00 00 00 	movzbl 0x94(%edx),%ecx
  101dcd:	83 e1 1f             	and    $0x1f,%ecx
  101dd0:	88 8a 94 00 00 00    	mov    %cl,0x94(%edx)
  101dd6:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101ddc:	0f b6 8a 95 00 00 00 	movzbl 0x95(%edx),%ecx
  101de3:	83 e1 f0             	and    $0xfffffff0,%ecx
  101de6:	83 c9 0e             	or     $0xe,%ecx
  101de9:	88 8a 95 00 00 00    	mov    %cl,0x95(%edx)
  101def:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101df5:	0f b6 8a 95 00 00 00 	movzbl 0x95(%edx),%ecx
  101dfc:	83 e1 ef             	and    $0xffffffef,%ecx
  101dff:	88 8a 95 00 00 00    	mov    %cl,0x95(%edx)
  101e05:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101e0b:	0f b6 8a 95 00 00 00 	movzbl 0x95(%edx),%ecx
  101e12:	83 e1 9f             	and    $0xffffff9f,%ecx
  101e15:	88 8a 95 00 00 00    	mov    %cl,0x95(%edx)
  101e1b:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101e21:	0f b6 8a 95 00 00 00 	movzbl 0x95(%edx),%ecx
  101e28:	83 c9 80             	or     $0xffffff80,%ecx
  101e2b:	88 8a 95 00 00 00    	mov    %cl,0x95(%edx)
  101e31:	c7 c2 e6 2c 10 00    	mov    $0x102ce6,%edx
  101e37:	c1 ea 10             	shr    $0x10,%edx
  101e3a:	89 d1                	mov    %edx,%ecx
  101e3c:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101e42:	66 89 8a 96 00 00 00 	mov    %cx,0x96(%edx)
  101e49:	c7 c2 f0 2c 10 00    	mov    $0x102cf0,%edx
  101e4f:	89 d1                	mov    %edx,%ecx
  101e51:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101e57:	66 89 8a 00 01 00 00 	mov    %cx,0x100(%edx)
  101e5e:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101e64:	66 c7 82 02 01 00 00 	movw   $0x8,0x102(%edx)
  101e6b:	08 00 
  101e6d:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101e73:	0f b6 8a 04 01 00 00 	movzbl 0x104(%edx),%ecx
  101e7a:	83 e1 e0             	and    $0xffffffe0,%ecx
  101e7d:	88 8a 04 01 00 00    	mov    %cl,0x104(%edx)
  101e83:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101e89:	0f b6 8a 04 01 00 00 	movzbl 0x104(%edx),%ecx
  101e90:	83 e1 1f             	and    $0x1f,%ecx
  101e93:	88 8a 04 01 00 00    	mov    %cl,0x104(%edx)
  101e99:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101e9f:	0f b6 8a 05 01 00 00 	movzbl 0x105(%edx),%ecx
  101ea6:	83 e1 f0             	and    $0xfffffff0,%ecx
  101ea9:	83 c9 0e             	or     $0xe,%ecx
  101eac:	88 8a 05 01 00 00    	mov    %cl,0x105(%edx)
  101eb2:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101eb8:	0f b6 8a 05 01 00 00 	movzbl 0x105(%edx),%ecx
  101ebf:	83 e1 ef             	and    $0xffffffef,%ecx
  101ec2:	88 8a 05 01 00 00    	mov    %cl,0x105(%edx)
  101ec8:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101ece:	0f b6 8a 05 01 00 00 	movzbl 0x105(%edx),%ecx
  101ed5:	83 e1 9f             	and    $0xffffff9f,%ecx
  101ed8:	88 8a 05 01 00 00    	mov    %cl,0x105(%edx)
  101ede:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101ee4:	0f b6 8a 05 01 00 00 	movzbl 0x105(%edx),%ecx
  101eeb:	83 c9 80             	or     $0xffffff80,%ecx
  101eee:	88 8a 05 01 00 00    	mov    %cl,0x105(%edx)
  101ef4:	c7 c2 f0 2c 10 00    	mov    $0x102cf0,%edx
  101efa:	c1 ea 10             	shr    $0x10,%edx
  101efd:	89 d1                	mov    %edx,%ecx
  101eff:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101f05:	66 89 8a 06 01 00 00 	mov    %cx,0x106(%edx)
  101f0c:	c7 c2 fa 2c 10 00    	mov    $0x102cfa,%edx
  101f12:	89 d1                	mov    %edx,%ecx
  101f14:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101f1a:	66 89 8a 08 01 00 00 	mov    %cx,0x108(%edx)
  101f21:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101f27:	66 c7 82 0a 01 00 00 	movw   $0x8,0x10a(%edx)
  101f2e:	08 00 
  101f30:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101f36:	0f b6 8a 0c 01 00 00 	movzbl 0x10c(%edx),%ecx
  101f3d:	83 e1 e0             	and    $0xffffffe0,%ecx
  101f40:	88 8a 0c 01 00 00    	mov    %cl,0x10c(%edx)
  101f46:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101f4c:	0f b6 8a 0c 01 00 00 	movzbl 0x10c(%edx),%ecx
  101f53:	83 e1 1f             	and    $0x1f,%ecx
  101f56:	88 8a 0c 01 00 00    	mov    %cl,0x10c(%edx)
  101f5c:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101f62:	0f b6 8a 0d 01 00 00 	movzbl 0x10d(%edx),%ecx
  101f69:	83 e1 f0             	and    $0xfffffff0,%ecx
  101f6c:	83 c9 0e             	or     $0xe,%ecx
  101f6f:	88 8a 0d 01 00 00    	mov    %cl,0x10d(%edx)
  101f75:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101f7b:	0f b6 8a 0d 01 00 00 	movzbl 0x10d(%edx),%ecx
  101f82:	83 e1 ef             	and    $0xffffffef,%ecx
  101f85:	88 8a 0d 01 00 00    	mov    %cl,0x10d(%edx)
  101f8b:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101f91:	0f b6 8a 0d 01 00 00 	movzbl 0x10d(%edx),%ecx
  101f98:	83 e1 9f             	and    $0xffffff9f,%ecx
  101f9b:	88 8a 0d 01 00 00    	mov    %cl,0x10d(%edx)
  101fa1:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101fa7:	0f b6 8a 0d 01 00 00 	movzbl 0x10d(%edx),%ecx
  101fae:	83 c9 80             	or     $0xffffff80,%ecx
  101fb1:	88 8a 0d 01 00 00    	mov    %cl,0x10d(%edx)
  101fb7:	c7 c2 fa 2c 10 00    	mov    $0x102cfa,%edx
  101fbd:	c1 ea 10             	shr    $0x10,%edx
  101fc0:	89 d1                	mov    %edx,%ecx
  101fc2:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101fc8:	66 89 8a 0e 01 00 00 	mov    %cx,0x10e(%edx)
  101fcf:	c7 c2 04 2d 10 00    	mov    $0x102d04,%edx
  101fd5:	89 d1                	mov    %edx,%ecx
  101fd7:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101fdd:	66 89 8a 10 01 00 00 	mov    %cx,0x110(%edx)
  101fe4:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101fea:	66 c7 82 12 01 00 00 	movw   $0x8,0x112(%edx)
  101ff1:	08 00 
  101ff3:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  101ff9:	0f b6 8a 14 01 00 00 	movzbl 0x114(%edx),%ecx
  102000:	83 e1 e0             	and    $0xffffffe0,%ecx
  102003:	88 8a 14 01 00 00    	mov    %cl,0x114(%edx)
  102009:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10200f:	0f b6 8a 14 01 00 00 	movzbl 0x114(%edx),%ecx
  102016:	83 e1 1f             	and    $0x1f,%ecx
  102019:	88 8a 14 01 00 00    	mov    %cl,0x114(%edx)
  10201f:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102025:	0f b6 8a 15 01 00 00 	movzbl 0x115(%edx),%ecx
  10202c:	83 e1 f0             	and    $0xfffffff0,%ecx
  10202f:	83 c9 0e             	or     $0xe,%ecx
  102032:	88 8a 15 01 00 00    	mov    %cl,0x115(%edx)
  102038:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10203e:	0f b6 8a 15 01 00 00 	movzbl 0x115(%edx),%ecx
  102045:	83 e1 ef             	and    $0xffffffef,%ecx
  102048:	88 8a 15 01 00 00    	mov    %cl,0x115(%edx)
  10204e:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102054:	0f b6 8a 15 01 00 00 	movzbl 0x115(%edx),%ecx
  10205b:	83 e1 9f             	and    $0xffffff9f,%ecx
  10205e:	88 8a 15 01 00 00    	mov    %cl,0x115(%edx)
  102064:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10206a:	0f b6 8a 15 01 00 00 	movzbl 0x115(%edx),%ecx
  102071:	83 c9 80             	or     $0xffffff80,%ecx
  102074:	88 8a 15 01 00 00    	mov    %cl,0x115(%edx)
  10207a:	c7 c2 04 2d 10 00    	mov    $0x102d04,%edx
  102080:	c1 ea 10             	shr    $0x10,%edx
  102083:	89 d1                	mov    %edx,%ecx
  102085:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10208b:	66 89 8a 16 01 00 00 	mov    %cx,0x116(%edx)
  102092:	c7 c2 0e 2d 10 00    	mov    $0x102d0e,%edx
  102098:	89 d1                	mov    %edx,%ecx
  10209a:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1020a0:	66 89 8a 18 01 00 00 	mov    %cx,0x118(%edx)
  1020a7:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1020ad:	66 c7 82 1a 01 00 00 	movw   $0x8,0x11a(%edx)
  1020b4:	08 00 
  1020b6:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1020bc:	0f b6 8a 1c 01 00 00 	movzbl 0x11c(%edx),%ecx
  1020c3:	83 e1 e0             	and    $0xffffffe0,%ecx
  1020c6:	88 8a 1c 01 00 00    	mov    %cl,0x11c(%edx)
  1020cc:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1020d2:	0f b6 8a 1c 01 00 00 	movzbl 0x11c(%edx),%ecx
  1020d9:	83 e1 1f             	and    $0x1f,%ecx
  1020dc:	88 8a 1c 01 00 00    	mov    %cl,0x11c(%edx)
  1020e2:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1020e8:	0f b6 8a 1d 01 00 00 	movzbl 0x11d(%edx),%ecx
  1020ef:	83 e1 f0             	and    $0xfffffff0,%ecx
  1020f2:	83 c9 0e             	or     $0xe,%ecx
  1020f5:	88 8a 1d 01 00 00    	mov    %cl,0x11d(%edx)
  1020fb:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102101:	0f b6 8a 1d 01 00 00 	movzbl 0x11d(%edx),%ecx
  102108:	83 e1 ef             	and    $0xffffffef,%ecx
  10210b:	88 8a 1d 01 00 00    	mov    %cl,0x11d(%edx)
  102111:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102117:	0f b6 8a 1d 01 00 00 	movzbl 0x11d(%edx),%ecx
  10211e:	83 e1 9f             	and    $0xffffff9f,%ecx
  102121:	88 8a 1d 01 00 00    	mov    %cl,0x11d(%edx)
  102127:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10212d:	0f b6 8a 1d 01 00 00 	movzbl 0x11d(%edx),%ecx
  102134:	83 c9 80             	or     $0xffffff80,%ecx
  102137:	88 8a 1d 01 00 00    	mov    %cl,0x11d(%edx)
  10213d:	c7 c2 0e 2d 10 00    	mov    $0x102d0e,%edx
  102143:	c1 ea 10             	shr    $0x10,%edx
  102146:	89 d1                	mov    %edx,%ecx
  102148:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10214e:	66 89 8a 1e 01 00 00 	mov    %cx,0x11e(%edx)
  102155:	c7 c2 18 2d 10 00    	mov    $0x102d18,%edx
  10215b:	89 d1                	mov    %edx,%ecx
  10215d:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102163:	66 89 8a 20 01 00 00 	mov    %cx,0x120(%edx)
  10216a:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102170:	66 c7 82 22 01 00 00 	movw   $0x8,0x122(%edx)
  102177:	08 00 
  102179:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10217f:	0f b6 8a 24 01 00 00 	movzbl 0x124(%edx),%ecx
  102186:	83 e1 e0             	and    $0xffffffe0,%ecx
  102189:	88 8a 24 01 00 00    	mov    %cl,0x124(%edx)
  10218f:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102195:	0f b6 8a 24 01 00 00 	movzbl 0x124(%edx),%ecx
  10219c:	83 e1 1f             	and    $0x1f,%ecx
  10219f:	88 8a 24 01 00 00    	mov    %cl,0x124(%edx)
  1021a5:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1021ab:	0f b6 8a 25 01 00 00 	movzbl 0x125(%edx),%ecx
  1021b2:	83 e1 f0             	and    $0xfffffff0,%ecx
  1021b5:	83 c9 0e             	or     $0xe,%ecx
  1021b8:	88 8a 25 01 00 00    	mov    %cl,0x125(%edx)
  1021be:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1021c4:	0f b6 8a 25 01 00 00 	movzbl 0x125(%edx),%ecx
  1021cb:	83 e1 ef             	and    $0xffffffef,%ecx
  1021ce:	88 8a 25 01 00 00    	mov    %cl,0x125(%edx)
  1021d4:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1021da:	0f b6 8a 25 01 00 00 	movzbl 0x125(%edx),%ecx
  1021e1:	83 e1 9f             	and    $0xffffff9f,%ecx
  1021e4:	88 8a 25 01 00 00    	mov    %cl,0x125(%edx)
  1021ea:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1021f0:	0f b6 8a 25 01 00 00 	movzbl 0x125(%edx),%ecx
  1021f7:	83 c9 80             	or     $0xffffff80,%ecx
  1021fa:	88 8a 25 01 00 00    	mov    %cl,0x125(%edx)
  102200:	c7 c2 18 2d 10 00    	mov    $0x102d18,%edx
  102206:	c1 ea 10             	shr    $0x10,%edx
  102209:	89 d1                	mov    %edx,%ecx
  10220b:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102211:	66 89 8a 26 01 00 00 	mov    %cx,0x126(%edx)
  102218:	c7 c2 22 2d 10 00    	mov    $0x102d22,%edx
  10221e:	89 d1                	mov    %edx,%ecx
  102220:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102226:	66 89 8a 28 01 00 00 	mov    %cx,0x128(%edx)
  10222d:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102233:	66 c7 82 2a 01 00 00 	movw   $0x8,0x12a(%edx)
  10223a:	08 00 
  10223c:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102242:	0f b6 8a 2c 01 00 00 	movzbl 0x12c(%edx),%ecx
  102249:	83 e1 e0             	and    $0xffffffe0,%ecx
  10224c:	88 8a 2c 01 00 00    	mov    %cl,0x12c(%edx)
  102252:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102258:	0f b6 8a 2c 01 00 00 	movzbl 0x12c(%edx),%ecx
  10225f:	83 e1 1f             	and    $0x1f,%ecx
  102262:	88 8a 2c 01 00 00    	mov    %cl,0x12c(%edx)
  102268:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10226e:	0f b6 8a 2d 01 00 00 	movzbl 0x12d(%edx),%ecx
  102275:	83 e1 f0             	and    $0xfffffff0,%ecx
  102278:	83 c9 0e             	or     $0xe,%ecx
  10227b:	88 8a 2d 01 00 00    	mov    %cl,0x12d(%edx)
  102281:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102287:	0f b6 8a 2d 01 00 00 	movzbl 0x12d(%edx),%ecx
  10228e:	83 e1 ef             	and    $0xffffffef,%ecx
  102291:	88 8a 2d 01 00 00    	mov    %cl,0x12d(%edx)
  102297:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10229d:	0f b6 8a 2d 01 00 00 	movzbl 0x12d(%edx),%ecx
  1022a4:	83 e1 9f             	and    $0xffffff9f,%ecx
  1022a7:	88 8a 2d 01 00 00    	mov    %cl,0x12d(%edx)
  1022ad:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1022b3:	0f b6 8a 2d 01 00 00 	movzbl 0x12d(%edx),%ecx
  1022ba:	83 c9 80             	or     $0xffffff80,%ecx
  1022bd:	88 8a 2d 01 00 00    	mov    %cl,0x12d(%edx)
  1022c3:	c7 c2 22 2d 10 00    	mov    $0x102d22,%edx
  1022c9:	c1 ea 10             	shr    $0x10,%edx
  1022cc:	89 d1                	mov    %edx,%ecx
  1022ce:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1022d4:	66 89 8a 2e 01 00 00 	mov    %cx,0x12e(%edx)
  1022db:	c7 c2 2c 2d 10 00    	mov    $0x102d2c,%edx
  1022e1:	89 d1                	mov    %edx,%ecx
  1022e3:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1022e9:	66 89 8a 30 01 00 00 	mov    %cx,0x130(%edx)
  1022f0:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1022f6:	66 c7 82 32 01 00 00 	movw   $0x8,0x132(%edx)
  1022fd:	08 00 
  1022ff:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102305:	0f b6 8a 34 01 00 00 	movzbl 0x134(%edx),%ecx
  10230c:	83 e1 e0             	and    $0xffffffe0,%ecx
  10230f:	88 8a 34 01 00 00    	mov    %cl,0x134(%edx)
  102315:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10231b:	0f b6 8a 34 01 00 00 	movzbl 0x134(%edx),%ecx
  102322:	83 e1 1f             	and    $0x1f,%ecx
  102325:	88 8a 34 01 00 00    	mov    %cl,0x134(%edx)
  10232b:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102331:	0f b6 8a 35 01 00 00 	movzbl 0x135(%edx),%ecx
  102338:	83 e1 f0             	and    $0xfffffff0,%ecx
  10233b:	83 c9 0e             	or     $0xe,%ecx
  10233e:	88 8a 35 01 00 00    	mov    %cl,0x135(%edx)
  102344:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10234a:	0f b6 8a 35 01 00 00 	movzbl 0x135(%edx),%ecx
  102351:	83 e1 ef             	and    $0xffffffef,%ecx
  102354:	88 8a 35 01 00 00    	mov    %cl,0x135(%edx)
  10235a:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102360:	0f b6 8a 35 01 00 00 	movzbl 0x135(%edx),%ecx
  102367:	83 e1 9f             	and    $0xffffff9f,%ecx
  10236a:	88 8a 35 01 00 00    	mov    %cl,0x135(%edx)
  102370:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102376:	0f b6 8a 35 01 00 00 	movzbl 0x135(%edx),%ecx
  10237d:	83 c9 80             	or     $0xffffff80,%ecx
  102380:	88 8a 35 01 00 00    	mov    %cl,0x135(%edx)
  102386:	c7 c2 2c 2d 10 00    	mov    $0x102d2c,%edx
  10238c:	c1 ea 10             	shr    $0x10,%edx
  10238f:	89 d1                	mov    %edx,%ecx
  102391:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102397:	66 89 8a 36 01 00 00 	mov    %cx,0x136(%edx)
  10239e:	c7 c2 32 2d 10 00    	mov    $0x102d32,%edx
  1023a4:	89 d1                	mov    %edx,%ecx
  1023a6:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1023ac:	66 89 8a 38 01 00 00 	mov    %cx,0x138(%edx)
  1023b3:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1023b9:	66 c7 82 3a 01 00 00 	movw   $0x8,0x13a(%edx)
  1023c0:	08 00 
  1023c2:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1023c8:	0f b6 8a 3c 01 00 00 	movzbl 0x13c(%edx),%ecx
  1023cf:	83 e1 e0             	and    $0xffffffe0,%ecx
  1023d2:	88 8a 3c 01 00 00    	mov    %cl,0x13c(%edx)
  1023d8:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1023de:	0f b6 8a 3c 01 00 00 	movzbl 0x13c(%edx),%ecx
  1023e5:	83 e1 1f             	and    $0x1f,%ecx
  1023e8:	88 8a 3c 01 00 00    	mov    %cl,0x13c(%edx)
  1023ee:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1023f4:	0f b6 8a 3d 01 00 00 	movzbl 0x13d(%edx),%ecx
  1023fb:	83 e1 f0             	and    $0xfffffff0,%ecx
  1023fe:	83 c9 0e             	or     $0xe,%ecx
  102401:	88 8a 3d 01 00 00    	mov    %cl,0x13d(%edx)
  102407:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10240d:	0f b6 8a 3d 01 00 00 	movzbl 0x13d(%edx),%ecx
  102414:	83 e1 ef             	and    $0xffffffef,%ecx
  102417:	88 8a 3d 01 00 00    	mov    %cl,0x13d(%edx)
  10241d:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102423:	0f b6 8a 3d 01 00 00 	movzbl 0x13d(%edx),%ecx
  10242a:	83 e1 9f             	and    $0xffffff9f,%ecx
  10242d:	88 8a 3d 01 00 00    	mov    %cl,0x13d(%edx)
  102433:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102439:	0f b6 8a 3d 01 00 00 	movzbl 0x13d(%edx),%ecx
  102440:	83 c9 80             	or     $0xffffff80,%ecx
  102443:	88 8a 3d 01 00 00    	mov    %cl,0x13d(%edx)
  102449:	c7 c2 32 2d 10 00    	mov    $0x102d32,%edx
  10244f:	c1 ea 10             	shr    $0x10,%edx
  102452:	89 d1                	mov    %edx,%ecx
  102454:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10245a:	66 89 8a 3e 01 00 00 	mov    %cx,0x13e(%edx)
  102461:	c7 c2 38 2d 10 00    	mov    $0x102d38,%edx
  102467:	89 d1                	mov    %edx,%ecx
  102469:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10246f:	66 89 8a 40 01 00 00 	mov    %cx,0x140(%edx)
  102476:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10247c:	66 c7 82 42 01 00 00 	movw   $0x8,0x142(%edx)
  102483:	08 00 
  102485:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10248b:	0f b6 8a 44 01 00 00 	movzbl 0x144(%edx),%ecx
  102492:	83 e1 e0             	and    $0xffffffe0,%ecx
  102495:	88 8a 44 01 00 00    	mov    %cl,0x144(%edx)
  10249b:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1024a1:	0f b6 8a 44 01 00 00 	movzbl 0x144(%edx),%ecx
  1024a8:	83 e1 1f             	and    $0x1f,%ecx
  1024ab:	88 8a 44 01 00 00    	mov    %cl,0x144(%edx)
  1024b1:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1024b7:	0f b6 8a 45 01 00 00 	movzbl 0x145(%edx),%ecx
  1024be:	83 e1 f0             	and    $0xfffffff0,%ecx
  1024c1:	83 c9 0e             	or     $0xe,%ecx
  1024c4:	88 8a 45 01 00 00    	mov    %cl,0x145(%edx)
  1024ca:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1024d0:	0f b6 8a 45 01 00 00 	movzbl 0x145(%edx),%ecx
  1024d7:	83 e1 ef             	and    $0xffffffef,%ecx
  1024da:	88 8a 45 01 00 00    	mov    %cl,0x145(%edx)
  1024e0:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1024e6:	0f b6 8a 45 01 00 00 	movzbl 0x145(%edx),%ecx
  1024ed:	83 e1 9f             	and    $0xffffff9f,%ecx
  1024f0:	88 8a 45 01 00 00    	mov    %cl,0x145(%edx)
  1024f6:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1024fc:	0f b6 8a 45 01 00 00 	movzbl 0x145(%edx),%ecx
  102503:	83 c9 80             	or     $0xffffff80,%ecx
  102506:	88 8a 45 01 00 00    	mov    %cl,0x145(%edx)
  10250c:	c7 c2 38 2d 10 00    	mov    $0x102d38,%edx
  102512:	c1 ea 10             	shr    $0x10,%edx
  102515:	89 d1                	mov    %edx,%ecx
  102517:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10251d:	66 89 8a 46 01 00 00 	mov    %cx,0x146(%edx)
  102524:	c7 c2 3e 2d 10 00    	mov    $0x102d3e,%edx
  10252a:	89 d1                	mov    %edx,%ecx
  10252c:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102532:	66 89 8a 48 01 00 00 	mov    %cx,0x148(%edx)
  102539:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10253f:	66 c7 82 4a 01 00 00 	movw   $0x8,0x14a(%edx)
  102546:	08 00 
  102548:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10254e:	0f b6 8a 4c 01 00 00 	movzbl 0x14c(%edx),%ecx
  102555:	83 e1 e0             	and    $0xffffffe0,%ecx
  102558:	88 8a 4c 01 00 00    	mov    %cl,0x14c(%edx)
  10255e:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102564:	0f b6 8a 4c 01 00 00 	movzbl 0x14c(%edx),%ecx
  10256b:	83 e1 1f             	and    $0x1f,%ecx
  10256e:	88 8a 4c 01 00 00    	mov    %cl,0x14c(%edx)
  102574:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10257a:	0f b6 8a 4d 01 00 00 	movzbl 0x14d(%edx),%ecx
  102581:	83 e1 f0             	and    $0xfffffff0,%ecx
  102584:	83 c9 0e             	or     $0xe,%ecx
  102587:	88 8a 4d 01 00 00    	mov    %cl,0x14d(%edx)
  10258d:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102593:	0f b6 8a 4d 01 00 00 	movzbl 0x14d(%edx),%ecx
  10259a:	83 e1 ef             	and    $0xffffffef,%ecx
  10259d:	88 8a 4d 01 00 00    	mov    %cl,0x14d(%edx)
  1025a3:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1025a9:	0f b6 8a 4d 01 00 00 	movzbl 0x14d(%edx),%ecx
  1025b0:	83 e1 9f             	and    $0xffffff9f,%ecx
  1025b3:	88 8a 4d 01 00 00    	mov    %cl,0x14d(%edx)
  1025b9:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1025bf:	0f b6 8a 4d 01 00 00 	movzbl 0x14d(%edx),%ecx
  1025c6:	83 c9 80             	or     $0xffffff80,%ecx
  1025c9:	88 8a 4d 01 00 00    	mov    %cl,0x14d(%edx)
  1025cf:	c7 c2 3e 2d 10 00    	mov    $0x102d3e,%edx
  1025d5:	c1 ea 10             	shr    $0x10,%edx
  1025d8:	89 d1                	mov    %edx,%ecx
  1025da:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1025e0:	66 89 8a 4e 01 00 00 	mov    %cx,0x14e(%edx)
  1025e7:	c7 c2 44 2d 10 00    	mov    $0x102d44,%edx
  1025ed:	89 d1                	mov    %edx,%ecx
  1025ef:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1025f5:	66 89 8a 50 01 00 00 	mov    %cx,0x150(%edx)
  1025fc:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102602:	66 c7 82 52 01 00 00 	movw   $0x8,0x152(%edx)
  102609:	08 00 
  10260b:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102611:	0f b6 8a 54 01 00 00 	movzbl 0x154(%edx),%ecx
  102618:	83 e1 e0             	and    $0xffffffe0,%ecx
  10261b:	88 8a 54 01 00 00    	mov    %cl,0x154(%edx)
  102621:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102627:	0f b6 8a 54 01 00 00 	movzbl 0x154(%edx),%ecx
  10262e:	83 e1 1f             	and    $0x1f,%ecx
  102631:	88 8a 54 01 00 00    	mov    %cl,0x154(%edx)
  102637:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10263d:	0f b6 8a 55 01 00 00 	movzbl 0x155(%edx),%ecx
  102644:	83 e1 f0             	and    $0xfffffff0,%ecx
  102647:	83 c9 0e             	or     $0xe,%ecx
  10264a:	88 8a 55 01 00 00    	mov    %cl,0x155(%edx)
  102650:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102656:	0f b6 8a 55 01 00 00 	movzbl 0x155(%edx),%ecx
  10265d:	83 e1 ef             	and    $0xffffffef,%ecx
  102660:	88 8a 55 01 00 00    	mov    %cl,0x155(%edx)
  102666:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10266c:	0f b6 8a 55 01 00 00 	movzbl 0x155(%edx),%ecx
  102673:	83 e1 9f             	and    $0xffffff9f,%ecx
  102676:	88 8a 55 01 00 00    	mov    %cl,0x155(%edx)
  10267c:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102682:	0f b6 8a 55 01 00 00 	movzbl 0x155(%edx),%ecx
  102689:	83 c9 80             	or     $0xffffff80,%ecx
  10268c:	88 8a 55 01 00 00    	mov    %cl,0x155(%edx)
  102692:	c7 c2 44 2d 10 00    	mov    $0x102d44,%edx
  102698:	c1 ea 10             	shr    $0x10,%edx
  10269b:	89 d1                	mov    %edx,%ecx
  10269d:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1026a3:	66 89 8a 56 01 00 00 	mov    %cx,0x156(%edx)
  1026aa:	c7 c2 4a 2d 10 00    	mov    $0x102d4a,%edx
  1026b0:	89 d1                	mov    %edx,%ecx
  1026b2:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1026b8:	66 89 8a 58 01 00 00 	mov    %cx,0x158(%edx)
  1026bf:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1026c5:	66 c7 82 5a 01 00 00 	movw   $0x8,0x15a(%edx)
  1026cc:	08 00 
  1026ce:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1026d4:	0f b6 8a 5c 01 00 00 	movzbl 0x15c(%edx),%ecx
  1026db:	83 e1 e0             	and    $0xffffffe0,%ecx
  1026de:	88 8a 5c 01 00 00    	mov    %cl,0x15c(%edx)
  1026e4:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1026ea:	0f b6 8a 5c 01 00 00 	movzbl 0x15c(%edx),%ecx
  1026f1:	83 e1 1f             	and    $0x1f,%ecx
  1026f4:	88 8a 5c 01 00 00    	mov    %cl,0x15c(%edx)
  1026fa:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102700:	0f b6 8a 5d 01 00 00 	movzbl 0x15d(%edx),%ecx
  102707:	83 e1 f0             	and    $0xfffffff0,%ecx
  10270a:	83 c9 0e             	or     $0xe,%ecx
  10270d:	88 8a 5d 01 00 00    	mov    %cl,0x15d(%edx)
  102713:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102719:	0f b6 8a 5d 01 00 00 	movzbl 0x15d(%edx),%ecx
  102720:	83 e1 ef             	and    $0xffffffef,%ecx
  102723:	88 8a 5d 01 00 00    	mov    %cl,0x15d(%edx)
  102729:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10272f:	0f b6 8a 5d 01 00 00 	movzbl 0x15d(%edx),%ecx
  102736:	83 e1 9f             	and    $0xffffff9f,%ecx
  102739:	88 8a 5d 01 00 00    	mov    %cl,0x15d(%edx)
  10273f:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102745:	0f b6 8a 5d 01 00 00 	movzbl 0x15d(%edx),%ecx
  10274c:	83 c9 80             	or     $0xffffff80,%ecx
  10274f:	88 8a 5d 01 00 00    	mov    %cl,0x15d(%edx)
  102755:	c7 c2 4a 2d 10 00    	mov    $0x102d4a,%edx
  10275b:	c1 ea 10             	shr    $0x10,%edx
  10275e:	89 d1                	mov    %edx,%ecx
  102760:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102766:	66 89 8a 5e 01 00 00 	mov    %cx,0x15e(%edx)
  10276d:	c7 c2 50 2d 10 00    	mov    $0x102d50,%edx
  102773:	89 d1                	mov    %edx,%ecx
  102775:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10277b:	66 89 8a 60 01 00 00 	mov    %cx,0x160(%edx)
  102782:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102788:	66 c7 82 62 01 00 00 	movw   $0x8,0x162(%edx)
  10278f:	08 00 
  102791:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102797:	0f b6 8a 64 01 00 00 	movzbl 0x164(%edx),%ecx
  10279e:	83 e1 e0             	and    $0xffffffe0,%ecx
  1027a1:	88 8a 64 01 00 00    	mov    %cl,0x164(%edx)
  1027a7:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1027ad:	0f b6 8a 64 01 00 00 	movzbl 0x164(%edx),%ecx
  1027b4:	83 e1 1f             	and    $0x1f,%ecx
  1027b7:	88 8a 64 01 00 00    	mov    %cl,0x164(%edx)
  1027bd:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1027c3:	0f b6 8a 65 01 00 00 	movzbl 0x165(%edx),%ecx
  1027ca:	83 e1 f0             	and    $0xfffffff0,%ecx
  1027cd:	83 c9 0e             	or     $0xe,%ecx
  1027d0:	88 8a 65 01 00 00    	mov    %cl,0x165(%edx)
  1027d6:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1027dc:	0f b6 8a 65 01 00 00 	movzbl 0x165(%edx),%ecx
  1027e3:	83 e1 ef             	and    $0xffffffef,%ecx
  1027e6:	88 8a 65 01 00 00    	mov    %cl,0x165(%edx)
  1027ec:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1027f2:	0f b6 8a 65 01 00 00 	movzbl 0x165(%edx),%ecx
  1027f9:	83 e1 9f             	and    $0xffffff9f,%ecx
  1027fc:	88 8a 65 01 00 00    	mov    %cl,0x165(%edx)
  102802:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102808:	0f b6 8a 65 01 00 00 	movzbl 0x165(%edx),%ecx
  10280f:	83 c9 80             	or     $0xffffff80,%ecx
  102812:	88 8a 65 01 00 00    	mov    %cl,0x165(%edx)
  102818:	c7 c2 50 2d 10 00    	mov    $0x102d50,%edx
  10281e:	c1 ea 10             	shr    $0x10,%edx
  102821:	89 d1                	mov    %edx,%ecx
  102823:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102829:	66 89 8a 66 01 00 00 	mov    %cx,0x166(%edx)
  102830:	c7 c2 56 2d 10 00    	mov    $0x102d56,%edx
  102836:	89 d1                	mov    %edx,%ecx
  102838:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10283e:	66 89 8a 68 01 00 00 	mov    %cx,0x168(%edx)
  102845:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10284b:	66 c7 82 6a 01 00 00 	movw   $0x8,0x16a(%edx)
  102852:	08 00 
  102854:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10285a:	0f b6 8a 6c 01 00 00 	movzbl 0x16c(%edx),%ecx
  102861:	83 e1 e0             	and    $0xffffffe0,%ecx
  102864:	88 8a 6c 01 00 00    	mov    %cl,0x16c(%edx)
  10286a:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102870:	0f b6 8a 6c 01 00 00 	movzbl 0x16c(%edx),%ecx
  102877:	83 e1 1f             	and    $0x1f,%ecx
  10287a:	88 8a 6c 01 00 00    	mov    %cl,0x16c(%edx)
  102880:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102886:	0f b6 8a 6d 01 00 00 	movzbl 0x16d(%edx),%ecx
  10288d:	83 e1 f0             	and    $0xfffffff0,%ecx
  102890:	83 c9 0e             	or     $0xe,%ecx
  102893:	88 8a 6d 01 00 00    	mov    %cl,0x16d(%edx)
  102899:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10289f:	0f b6 8a 6d 01 00 00 	movzbl 0x16d(%edx),%ecx
  1028a6:	83 e1 ef             	and    $0xffffffef,%ecx
  1028a9:	88 8a 6d 01 00 00    	mov    %cl,0x16d(%edx)
  1028af:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1028b5:	0f b6 8a 6d 01 00 00 	movzbl 0x16d(%edx),%ecx
  1028bc:	83 e1 9f             	and    $0xffffff9f,%ecx
  1028bf:	88 8a 6d 01 00 00    	mov    %cl,0x16d(%edx)
  1028c5:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1028cb:	0f b6 8a 6d 01 00 00 	movzbl 0x16d(%edx),%ecx
  1028d2:	83 c9 80             	or     $0xffffff80,%ecx
  1028d5:	88 8a 6d 01 00 00    	mov    %cl,0x16d(%edx)
  1028db:	c7 c2 56 2d 10 00    	mov    $0x102d56,%edx
  1028e1:	c1 ea 10             	shr    $0x10,%edx
  1028e4:	89 d1                	mov    %edx,%ecx
  1028e6:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1028ec:	66 89 8a 6e 01 00 00 	mov    %cx,0x16e(%edx)
  1028f3:	c7 c2 5c 2d 10 00    	mov    $0x102d5c,%edx
  1028f9:	89 d1                	mov    %edx,%ecx
  1028fb:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102901:	66 89 8a 70 01 00 00 	mov    %cx,0x170(%edx)
  102908:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10290e:	66 c7 82 72 01 00 00 	movw   $0x8,0x172(%edx)
  102915:	08 00 
  102917:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10291d:	0f b6 8a 74 01 00 00 	movzbl 0x174(%edx),%ecx
  102924:	83 e1 e0             	and    $0xffffffe0,%ecx
  102927:	88 8a 74 01 00 00    	mov    %cl,0x174(%edx)
  10292d:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102933:	0f b6 8a 74 01 00 00 	movzbl 0x174(%edx),%ecx
  10293a:	83 e1 1f             	and    $0x1f,%ecx
  10293d:	88 8a 74 01 00 00    	mov    %cl,0x174(%edx)
  102943:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102949:	0f b6 8a 75 01 00 00 	movzbl 0x175(%edx),%ecx
  102950:	83 e1 f0             	and    $0xfffffff0,%ecx
  102953:	83 c9 0e             	or     $0xe,%ecx
  102956:	88 8a 75 01 00 00    	mov    %cl,0x175(%edx)
  10295c:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102962:	0f b6 8a 75 01 00 00 	movzbl 0x175(%edx),%ecx
  102969:	83 e1 ef             	and    $0xffffffef,%ecx
  10296c:	88 8a 75 01 00 00    	mov    %cl,0x175(%edx)
  102972:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102978:	0f b6 8a 75 01 00 00 	movzbl 0x175(%edx),%ecx
  10297f:	83 e1 9f             	and    $0xffffff9f,%ecx
  102982:	88 8a 75 01 00 00    	mov    %cl,0x175(%edx)
  102988:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  10298e:	0f b6 8a 75 01 00 00 	movzbl 0x175(%edx),%ecx
  102995:	83 c9 80             	or     $0xffffff80,%ecx
  102998:	88 8a 75 01 00 00    	mov    %cl,0x175(%edx)
  10299e:	c7 c2 5c 2d 10 00    	mov    $0x102d5c,%edx
  1029a4:	c1 ea 10             	shr    $0x10,%edx
  1029a7:	89 d1                	mov    %edx,%ecx
  1029a9:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1029af:	66 89 8a 76 01 00 00 	mov    %cx,0x176(%edx)
  1029b6:	c7 c2 62 2d 10 00    	mov    $0x102d62,%edx
  1029bc:	89 d1                	mov    %edx,%ecx
  1029be:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1029c4:	66 89 8a 78 01 00 00 	mov    %cx,0x178(%edx)
  1029cb:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1029d1:	66 c7 82 7a 01 00 00 	movw   $0x8,0x17a(%edx)
  1029d8:	08 00 
  1029da:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1029e0:	0f b6 8a 7c 01 00 00 	movzbl 0x17c(%edx),%ecx
  1029e7:	83 e1 e0             	and    $0xffffffe0,%ecx
  1029ea:	88 8a 7c 01 00 00    	mov    %cl,0x17c(%edx)
  1029f0:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  1029f6:	0f b6 8a 7c 01 00 00 	movzbl 0x17c(%edx),%ecx
  1029fd:	83 e1 1f             	and    $0x1f,%ecx
  102a00:	88 8a 7c 01 00 00    	mov    %cl,0x17c(%edx)
  102a06:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102a0c:	0f b6 8a 7d 01 00 00 	movzbl 0x17d(%edx),%ecx
  102a13:	83 e1 f0             	and    $0xfffffff0,%ecx
  102a16:	83 c9 0e             	or     $0xe,%ecx
  102a19:	88 8a 7d 01 00 00    	mov    %cl,0x17d(%edx)
  102a1f:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102a25:	0f b6 8a 7d 01 00 00 	movzbl 0x17d(%edx),%ecx
  102a2c:	83 e1 ef             	and    $0xffffffef,%ecx
  102a2f:	88 8a 7d 01 00 00    	mov    %cl,0x17d(%edx)
  102a35:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102a3b:	0f b6 8a 7d 01 00 00 	movzbl 0x17d(%edx),%ecx
  102a42:	83 e1 9f             	and    $0xffffff9f,%ecx
  102a45:	88 8a 7d 01 00 00    	mov    %cl,0x17d(%edx)
  102a4b:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102a51:	0f b6 8a 7d 01 00 00 	movzbl 0x17d(%edx),%ecx
  102a58:	83 c9 80             	or     $0xffffff80,%ecx
  102a5b:	88 8a 7d 01 00 00    	mov    %cl,0x17d(%edx)
  102a61:	c7 c2 62 2d 10 00    	mov    $0x102d62,%edx
  102a67:	c1 ea 10             	shr    $0x10,%edx
  102a6a:	89 d1                	mov    %edx,%ecx
  102a6c:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102a72:	66 89 8a 7e 01 00 00 	mov    %cx,0x17e(%edx)
  102a79:	c7 c2 98 2d 10 00    	mov    $0x102d98,%edx
  102a7f:	89 d1                	mov    %edx,%ecx
  102a81:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102a87:	66 89 8a 80 01 00 00 	mov    %cx,0x180(%edx)
  102a8e:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102a94:	66 c7 82 82 01 00 00 	movw   $0x8,0x182(%edx)
  102a9b:	08 00 
  102a9d:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102aa3:	0f b6 8a 84 01 00 00 	movzbl 0x184(%edx),%ecx
  102aaa:	83 e1 e0             	and    $0xffffffe0,%ecx
  102aad:	88 8a 84 01 00 00    	mov    %cl,0x184(%edx)
  102ab3:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102ab9:	0f b6 8a 84 01 00 00 	movzbl 0x184(%edx),%ecx
  102ac0:	83 e1 1f             	and    $0x1f,%ecx
  102ac3:	88 8a 84 01 00 00    	mov    %cl,0x184(%edx)
  102ac9:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102acf:	0f b6 8a 85 01 00 00 	movzbl 0x185(%edx),%ecx
  102ad6:	83 e1 f0             	and    $0xfffffff0,%ecx
  102ad9:	83 c9 0e             	or     $0xe,%ecx
  102adc:	88 8a 85 01 00 00    	mov    %cl,0x185(%edx)
  102ae2:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102ae8:	0f b6 8a 85 01 00 00 	movzbl 0x185(%edx),%ecx
  102aef:	83 e1 ef             	and    $0xffffffef,%ecx
  102af2:	88 8a 85 01 00 00    	mov    %cl,0x185(%edx)
  102af8:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102afe:	0f b6 8a 85 01 00 00 	movzbl 0x185(%edx),%ecx
  102b05:	83 c9 60             	or     $0x60,%ecx
  102b08:	88 8a 85 01 00 00    	mov    %cl,0x185(%edx)
  102b0e:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102b14:	0f b6 8a 85 01 00 00 	movzbl 0x185(%edx),%ecx
  102b1b:	83 c9 80             	or     $0xffffff80,%ecx
  102b1e:	88 8a 85 01 00 00    	mov    %cl,0x185(%edx)
  102b24:	c7 c2 98 2d 10 00    	mov    $0x102d98,%edx
  102b2a:	c1 ea 10             	shr    $0x10,%edx
  102b2d:	89 d1                	mov    %edx,%ecx
  102b2f:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102b35:	66 89 8a 86 01 00 00 	mov    %cx,0x186(%edx)
  102b3c:	c7 c2 9e 2d 10 00    	mov    $0x102d9e,%edx
  102b42:	89 d1                	mov    %edx,%ecx
  102b44:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102b4a:	66 89 8a f0 07 00 00 	mov    %cx,0x7f0(%edx)
  102b51:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102b57:	66 c7 82 f2 07 00 00 	movw   $0x8,0x7f2(%edx)
  102b5e:	08 00 
  102b60:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102b66:	0f b6 8a f4 07 00 00 	movzbl 0x7f4(%edx),%ecx
  102b6d:	83 e1 e0             	and    $0xffffffe0,%ecx
  102b70:	88 8a f4 07 00 00    	mov    %cl,0x7f4(%edx)
  102b76:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102b7c:	0f b6 8a f4 07 00 00 	movzbl 0x7f4(%edx),%ecx
  102b83:	83 e1 1f             	and    $0x1f,%ecx
  102b86:	88 8a f4 07 00 00    	mov    %cl,0x7f4(%edx)
  102b8c:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102b92:	0f b6 8a f5 07 00 00 	movzbl 0x7f5(%edx),%ecx
  102b99:	83 e1 f0             	and    $0xfffffff0,%ecx
  102b9c:	83 c9 0e             	or     $0xe,%ecx
  102b9f:	88 8a f5 07 00 00    	mov    %cl,0x7f5(%edx)
  102ba5:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102bab:	0f b6 8a f5 07 00 00 	movzbl 0x7f5(%edx),%ecx
  102bb2:	83 e1 ef             	and    $0xffffffef,%ecx
  102bb5:	88 8a f5 07 00 00    	mov    %cl,0x7f5(%edx)
  102bbb:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102bc1:	0f b6 8a f5 07 00 00 	movzbl 0x7f5(%edx),%ecx
  102bc8:	83 e1 9f             	and    $0xffffff9f,%ecx
  102bcb:	88 8a f5 07 00 00    	mov    %cl,0x7f5(%edx)
  102bd1:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102bd7:	0f b6 8a f5 07 00 00 	movzbl 0x7f5(%edx),%ecx
  102bde:	83 c9 80             	or     $0xffffff80,%ecx
  102be1:	88 8a f5 07 00 00    	mov    %cl,0x7f5(%edx)
  102be7:	c7 c2 9e 2d 10 00    	mov    $0x102d9e,%edx
  102bed:	c1 ea 10             	shr    $0x10,%edx
  102bf0:	89 d1                	mov    %edx,%ecx
  102bf2:	c7 c2 c0 46 91 00    	mov    $0x9146c0,%edx
  102bf8:	66 89 8a f6 07 00 00 	mov    %cx,0x7f6(%edx)
  102bff:	0f 01 98 10 15 00 00 	lidtl  0x1510(%eax)
  102c06:	90                   	nop
  102c07:	83 c4 10             	add    $0x10,%esp
  102c0a:	5b                   	pop    %ebx
  102c0b:	5d                   	pop    %ebp
  102c0c:	c3                   	ret    

00102c0d <intr_init>:
  102c0d:	55                   	push   %ebp
  102c0e:	89 e5                	mov    %esp,%ebp
  102c10:	53                   	push   %ebx
  102c11:	e8 f9 d7 ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  102c16:	81 c3 ea 93 00 00    	add    $0x93ea,%ebx
  102c1c:	0f b6 83 44 7e 00 00 	movzbl 0x7e44(%ebx),%eax
  102c23:	3c 01                	cmp    $0x1,%al
  102c25:	74 0e                	je     102c35 <intr_init+0x28>
  102c27:	e8 b2 e6 ff ff       	call   1012de <intr_init_idt>
  102c2c:	c6 83 44 7e 00 00 01 	movb   $0x1,0x7e44(%ebx)
  102c33:	eb 01                	jmp    102c36 <intr_init+0x29>
  102c35:	90                   	nop
  102c36:	5b                   	pop    %ebx
  102c37:	5d                   	pop    %ebp
  102c38:	c3                   	ret    
  102c39:	66 90                	xchg   %ax,%ax
  102c3b:	66 90                	xchg   %ax,%ax
  102c3d:	66 90                	xchg   %ax,%ax
  102c3f:	90                   	nop

00102c40 <Xdivide>:
  102c40:	6a 00                	push   $0x0
  102c42:	6a 00                	push   $0x0
  102c44:	e9 67 01 00 00       	jmp    102db0 <_alltraps>
  102c49:	90                   	nop

00102c4a <Xdebug>:
  102c4a:	6a 00                	push   $0x0
  102c4c:	6a 01                	push   $0x1
  102c4e:	e9 5d 01 00 00       	jmp    102db0 <_alltraps>
  102c53:	90                   	nop

00102c54 <Xnmi>:
  102c54:	6a 00                	push   $0x0
  102c56:	6a 02                	push   $0x2
  102c58:	e9 53 01 00 00       	jmp    102db0 <_alltraps>
  102c5d:	90                   	nop

00102c5e <Xbrkpt>:
  102c5e:	6a 00                	push   $0x0
  102c60:	6a 03                	push   $0x3
  102c62:	e9 49 01 00 00       	jmp    102db0 <_alltraps>
  102c67:	90                   	nop

00102c68 <Xoflow>:
  102c68:	6a 00                	push   $0x0
  102c6a:	6a 04                	push   $0x4
  102c6c:	e9 3f 01 00 00       	jmp    102db0 <_alltraps>
  102c71:	90                   	nop

00102c72 <Xbound>:
  102c72:	6a 00                	push   $0x0
  102c74:	6a 05                	push   $0x5
  102c76:	e9 35 01 00 00       	jmp    102db0 <_alltraps>
  102c7b:	90                   	nop

00102c7c <Xillop>:
  102c7c:	6a 00                	push   $0x0
  102c7e:	6a 06                	push   $0x6
  102c80:	e9 2b 01 00 00       	jmp    102db0 <_alltraps>
  102c85:	90                   	nop

00102c86 <Xdevice>:
  102c86:	6a 00                	push   $0x0
  102c88:	6a 07                	push   $0x7
  102c8a:	e9 21 01 00 00       	jmp    102db0 <_alltraps>
  102c8f:	90                   	nop

00102c90 <Xdblflt>:
  102c90:	6a 08                	push   $0x8
  102c92:	e9 19 01 00 00       	jmp    102db0 <_alltraps>
  102c97:	90                   	nop

00102c98 <Xcoproc>:
  102c98:	6a 00                	push   $0x0
  102c9a:	6a 09                	push   $0x9
  102c9c:	e9 0f 01 00 00       	jmp    102db0 <_alltraps>
  102ca1:	90                   	nop

00102ca2 <Xtss>:
  102ca2:	6a 0a                	push   $0xa
  102ca4:	e9 07 01 00 00       	jmp    102db0 <_alltraps>
  102ca9:	90                   	nop

00102caa <Xsegnp>:
  102caa:	6a 0b                	push   $0xb
  102cac:	e9 ff 00 00 00       	jmp    102db0 <_alltraps>
  102cb1:	90                   	nop

00102cb2 <Xstack>:
  102cb2:	6a 0c                	push   $0xc
  102cb4:	e9 f7 00 00 00       	jmp    102db0 <_alltraps>
  102cb9:	90                   	nop

00102cba <Xgpflt>:
  102cba:	6a 0d                	push   $0xd
  102cbc:	e9 ef 00 00 00       	jmp    102db0 <_alltraps>
  102cc1:	90                   	nop

00102cc2 <Xpgflt>:
  102cc2:	6a 0e                	push   $0xe
  102cc4:	e9 e7 00 00 00       	jmp    102db0 <_alltraps>
  102cc9:	90                   	nop

00102cca <Xres>:
  102cca:	6a 00                	push   $0x0
  102ccc:	6a 0f                	push   $0xf
  102cce:	e9 dd 00 00 00       	jmp    102db0 <_alltraps>
  102cd3:	90                   	nop

00102cd4 <Xfperr>:
  102cd4:	6a 00                	push   $0x0
  102cd6:	6a 10                	push   $0x10
  102cd8:	e9 d3 00 00 00       	jmp    102db0 <_alltraps>
  102cdd:	90                   	nop

00102cde <Xalign>:
  102cde:	6a 11                	push   $0x11
  102ce0:	e9 cb 00 00 00       	jmp    102db0 <_alltraps>
  102ce5:	90                   	nop

00102ce6 <Xmchk>:
  102ce6:	6a 00                	push   $0x0
  102ce8:	6a 12                	push   $0x12
  102cea:	e9 c1 00 00 00       	jmp    102db0 <_alltraps>
  102cef:	90                   	nop

00102cf0 <Xirq_timer>:
  102cf0:	6a 00                	push   $0x0
  102cf2:	6a 20                	push   $0x20
  102cf4:	e9 b7 00 00 00       	jmp    102db0 <_alltraps>
  102cf9:	90                   	nop

00102cfa <Xirq_kbd>:
  102cfa:	6a 00                	push   $0x0
  102cfc:	6a 21                	push   $0x21
  102cfe:	e9 ad 00 00 00       	jmp    102db0 <_alltraps>
  102d03:	90                   	nop

00102d04 <Xirq_slave>:
  102d04:	6a 00                	push   $0x0
  102d06:	6a 22                	push   $0x22
  102d08:	e9 a3 00 00 00       	jmp    102db0 <_alltraps>
  102d0d:	90                   	nop

00102d0e <Xirq_serial2>:
  102d0e:	6a 00                	push   $0x0
  102d10:	6a 23                	push   $0x23
  102d12:	e9 99 00 00 00       	jmp    102db0 <_alltraps>
  102d17:	90                   	nop

00102d18 <Xirq_serial1>:
  102d18:	6a 00                	push   $0x0
  102d1a:	6a 24                	push   $0x24
  102d1c:	e9 8f 00 00 00       	jmp    102db0 <_alltraps>
  102d21:	90                   	nop

00102d22 <Xirq_lpt>:
  102d22:	6a 00                	push   $0x0
  102d24:	6a 25                	push   $0x25
  102d26:	e9 85 00 00 00       	jmp    102db0 <_alltraps>
  102d2b:	90                   	nop

00102d2c <Xirq_floppy>:
  102d2c:	6a 00                	push   $0x0
  102d2e:	6a 26                	push   $0x26
  102d30:	eb 7e                	jmp    102db0 <_alltraps>

00102d32 <Xirq_spurious>:
  102d32:	6a 00                	push   $0x0
  102d34:	6a 27                	push   $0x27
  102d36:	eb 78                	jmp    102db0 <_alltraps>

00102d38 <Xirq_rtc>:
  102d38:	6a 00                	push   $0x0
  102d3a:	6a 28                	push   $0x28
  102d3c:	eb 72                	jmp    102db0 <_alltraps>

00102d3e <Xirq9>:
  102d3e:	6a 00                	push   $0x0
  102d40:	6a 29                	push   $0x29
  102d42:	eb 6c                	jmp    102db0 <_alltraps>

00102d44 <Xirq10>:
  102d44:	6a 00                	push   $0x0
  102d46:	6a 2a                	push   $0x2a
  102d48:	eb 66                	jmp    102db0 <_alltraps>

00102d4a <Xirq11>:
  102d4a:	6a 00                	push   $0x0
  102d4c:	6a 2b                	push   $0x2b
  102d4e:	eb 60                	jmp    102db0 <_alltraps>

00102d50 <Xirq_mouse>:
  102d50:	6a 00                	push   $0x0
  102d52:	6a 2c                	push   $0x2c
  102d54:	eb 5a                	jmp    102db0 <_alltraps>

00102d56 <Xirq_coproc>:
  102d56:	6a 00                	push   $0x0
  102d58:	6a 2d                	push   $0x2d
  102d5a:	eb 54                	jmp    102db0 <_alltraps>

00102d5c <Xirq_ide1>:
  102d5c:	6a 00                	push   $0x0
  102d5e:	6a 2e                	push   $0x2e
  102d60:	eb 4e                	jmp    102db0 <_alltraps>

00102d62 <Xirq_ide2>:
  102d62:	6a 00                	push   $0x0
  102d64:	6a 2f                	push   $0x2f
  102d66:	eb 48                	jmp    102db0 <_alltraps>

00102d68 <Xirq_ehci1>:
  102d68:	6a 00                	push   $0x0
  102d6a:	6a 30                	push   $0x30
  102d6c:	eb 42                	jmp    102db0 <_alltraps>

00102d6e <Xirq17>:
  102d6e:	6a 00                	push   $0x0
  102d70:	6a 31                	push   $0x31
  102d72:	eb 3c                	jmp    102db0 <_alltraps>

00102d74 <Xirq18>:
  102d74:	6a 00                	push   $0x0
  102d76:	6a 32                	push   $0x32
  102d78:	eb 36                	jmp    102db0 <_alltraps>

00102d7a <Xirq19>:
  102d7a:	6a 00                	push   $0x0
  102d7c:	6a 33                	push   $0x33
  102d7e:	eb 30                	jmp    102db0 <_alltraps>

00102d80 <Xirq20>:
  102d80:	6a 00                	push   $0x0
  102d82:	6a 34                	push   $0x34
  102d84:	eb 2a                	jmp    102db0 <_alltraps>

00102d86 <Xirq21>:
  102d86:	6a 00                	push   $0x0
  102d88:	6a 35                	push   $0x35
  102d8a:	eb 24                	jmp    102db0 <_alltraps>

00102d8c <Xirq22>:
  102d8c:	6a 00                	push   $0x0
  102d8e:	6a 36                	push   $0x36
  102d90:	eb 1e                	jmp    102db0 <_alltraps>

00102d92 <Xirq_ehci2>:
  102d92:	6a 00                	push   $0x0
  102d94:	6a 37                	push   $0x37
  102d96:	eb 18                	jmp    102db0 <_alltraps>

00102d98 <Xsyscall>:
  102d98:	6a 00                	push   $0x0
  102d9a:	6a 30                	push   $0x30
  102d9c:	eb 12                	jmp    102db0 <_alltraps>

00102d9e <Xdefault>:
  102d9e:	68 fe 00 00 00       	push   $0xfe
  102da3:	eb 0b                	jmp    102db0 <_alltraps>
  102da5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  102da9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00102db0 <_alltraps>:
  102db0:	fa                   	cli    
  102db1:	1e                   	push   %ds
  102db2:	06                   	push   %es
  102db3:	60                   	pusha  
  102db4:	b8 10 00 00 00       	mov    $0x10,%eax
  102db9:	8e d8                	mov    %eax,%ds
  102dbb:	8e c0                	mov    %eax,%es
  102dbd:	54                   	push   %esp
  102dbe:	e8 99 21 00 00       	call   104f5c <trap>
  102dc3:	f4                   	hlt    
  102dc4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  102dca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00102dd0 <trap_return>:
  102dd0:	8b 64 24 04          	mov    0x4(%esp),%esp
  102dd4:	61                   	popa   
  102dd5:	07                   	pop    %es
  102dd6:	1f                   	pop    %ds
  102dd7:	83 c4 08             	add    $0x8,%esp
  102dda:	c3                   	ret    

00102ddb <memset>:
  102ddb:	55                   	push   %ebp
  102ddc:	89 e5                	mov    %esp,%ebp
  102dde:	57                   	push   %edi
  102ddf:	e8 23 d6 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  102de4:	05 1c 92 00 00       	add    $0x921c,%eax
  102de9:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102ded:	75 05                	jne    102df4 <memset+0x19>
  102def:	8b 45 08             	mov    0x8(%ebp),%eax
  102df2:	eb 5c                	jmp    102e50 <memset+0x75>
  102df4:	8b 45 08             	mov    0x8(%ebp),%eax
  102df7:	83 e0 03             	and    $0x3,%eax
  102dfa:	85 c0                	test   %eax,%eax
  102dfc:	75 41                	jne    102e3f <memset+0x64>
  102dfe:	8b 45 10             	mov    0x10(%ebp),%eax
  102e01:	83 e0 03             	and    $0x3,%eax
  102e04:	85 c0                	test   %eax,%eax
  102e06:	75 37                	jne    102e3f <memset+0x64>
  102e08:	81 65 0c ff 00 00 00 	andl   $0xff,0xc(%ebp)
  102e0f:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e12:	c1 e0 18             	shl    $0x18,%eax
  102e15:	89 c2                	mov    %eax,%edx
  102e17:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e1a:	c1 e0 10             	shl    $0x10,%eax
  102e1d:	09 c2                	or     %eax,%edx
  102e1f:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e22:	c1 e0 08             	shl    $0x8,%eax
  102e25:	09 d0                	or     %edx,%eax
  102e27:	09 45 0c             	or     %eax,0xc(%ebp)
  102e2a:	8b 45 10             	mov    0x10(%ebp),%eax
  102e2d:	c1 e8 02             	shr    $0x2,%eax
  102e30:	89 c1                	mov    %eax,%ecx
  102e32:	8b 55 08             	mov    0x8(%ebp),%edx
  102e35:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e38:	89 d7                	mov    %edx,%edi
  102e3a:	fc                   	cld    
  102e3b:	f3 ab                	rep stos %eax,%es:(%edi)
  102e3d:	eb 0e                	jmp    102e4d <memset+0x72>
  102e3f:	8b 55 08             	mov    0x8(%ebp),%edx
  102e42:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e45:	8b 4d 10             	mov    0x10(%ebp),%ecx
  102e48:	89 d7                	mov    %edx,%edi
  102e4a:	fc                   	cld    
  102e4b:	f3 aa                	rep stos %al,%es:(%edi)
  102e4d:	8b 45 08             	mov    0x8(%ebp),%eax
  102e50:	5f                   	pop    %edi
  102e51:	5d                   	pop    %ebp
  102e52:	c3                   	ret    

00102e53 <memmove>:
  102e53:	55                   	push   %ebp
  102e54:	89 e5                	mov    %esp,%ebp
  102e56:	57                   	push   %edi
  102e57:	56                   	push   %esi
  102e58:	53                   	push   %ebx
  102e59:	83 ec 10             	sub    $0x10,%esp
  102e5c:	e8 a6 d5 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  102e61:	05 9f 91 00 00       	add    $0x919f,%eax
  102e66:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e69:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102e6c:	8b 45 08             	mov    0x8(%ebp),%eax
  102e6f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102e72:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e75:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  102e78:	73 6d                	jae    102ee7 <memmove+0x94>
  102e7a:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102e7d:	8b 45 10             	mov    0x10(%ebp),%eax
  102e80:	01 d0                	add    %edx,%eax
  102e82:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  102e85:	76 60                	jbe    102ee7 <memmove+0x94>
  102e87:	8b 45 10             	mov    0x10(%ebp),%eax
  102e8a:	01 45 f0             	add    %eax,-0x10(%ebp)
  102e8d:	8b 45 10             	mov    0x10(%ebp),%eax
  102e90:	01 45 ec             	add    %eax,-0x14(%ebp)
  102e93:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e96:	83 e0 03             	and    $0x3,%eax
  102e99:	85 c0                	test   %eax,%eax
  102e9b:	75 2f                	jne    102ecc <memmove+0x79>
  102e9d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102ea0:	83 e0 03             	and    $0x3,%eax
  102ea3:	85 c0                	test   %eax,%eax
  102ea5:	75 25                	jne    102ecc <memmove+0x79>
  102ea7:	8b 45 10             	mov    0x10(%ebp),%eax
  102eaa:	83 e0 03             	and    $0x3,%eax
  102ead:	85 c0                	test   %eax,%eax
  102eaf:	75 1b                	jne    102ecc <memmove+0x79>
  102eb1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102eb4:	83 e8 04             	sub    $0x4,%eax
  102eb7:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102eba:	83 ea 04             	sub    $0x4,%edx
  102ebd:	8b 4d 10             	mov    0x10(%ebp),%ecx
  102ec0:	c1 e9 02             	shr    $0x2,%ecx
  102ec3:	89 c7                	mov    %eax,%edi
  102ec5:	89 d6                	mov    %edx,%esi
  102ec7:	fd                   	std    
  102ec8:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102eca:	eb 18                	jmp    102ee4 <memmove+0x91>
  102ecc:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102ecf:	8d 50 ff             	lea    -0x1(%eax),%edx
  102ed2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102ed5:	8d 58 ff             	lea    -0x1(%eax),%ebx
  102ed8:	8b 45 10             	mov    0x10(%ebp),%eax
  102edb:	89 d7                	mov    %edx,%edi
  102edd:	89 de                	mov    %ebx,%esi
  102edf:	89 c1                	mov    %eax,%ecx
  102ee1:	fd                   	std    
  102ee2:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102ee4:	fc                   	cld    
  102ee5:	eb 45                	jmp    102f2c <memmove+0xd9>
  102ee7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102eea:	83 e0 03             	and    $0x3,%eax
  102eed:	85 c0                	test   %eax,%eax
  102eef:	75 2b                	jne    102f1c <memmove+0xc9>
  102ef1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102ef4:	83 e0 03             	and    $0x3,%eax
  102ef7:	85 c0                	test   %eax,%eax
  102ef9:	75 21                	jne    102f1c <memmove+0xc9>
  102efb:	8b 45 10             	mov    0x10(%ebp),%eax
  102efe:	83 e0 03             	and    $0x3,%eax
  102f01:	85 c0                	test   %eax,%eax
  102f03:	75 17                	jne    102f1c <memmove+0xc9>
  102f05:	8b 45 10             	mov    0x10(%ebp),%eax
  102f08:	c1 e8 02             	shr    $0x2,%eax
  102f0b:	89 c1                	mov    %eax,%ecx
  102f0d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102f10:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102f13:	89 c7                	mov    %eax,%edi
  102f15:	89 d6                	mov    %edx,%esi
  102f17:	fc                   	cld    
  102f18:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102f1a:	eb 10                	jmp    102f2c <memmove+0xd9>
  102f1c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102f1f:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102f22:	8b 4d 10             	mov    0x10(%ebp),%ecx
  102f25:	89 c7                	mov    %eax,%edi
  102f27:	89 d6                	mov    %edx,%esi
  102f29:	fc                   	cld    
  102f2a:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102f2c:	8b 45 08             	mov    0x8(%ebp),%eax
  102f2f:	83 c4 10             	add    $0x10,%esp
  102f32:	5b                   	pop    %ebx
  102f33:	5e                   	pop    %esi
  102f34:	5f                   	pop    %edi
  102f35:	5d                   	pop    %ebp
  102f36:	c3                   	ret    

00102f37 <memcpy>:
  102f37:	55                   	push   %ebp
  102f38:	89 e5                	mov    %esp,%ebp
  102f3a:	e8 c8 d4 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  102f3f:	05 c1 90 00 00       	add    $0x90c1,%eax
  102f44:	ff 75 10             	pushl  0x10(%ebp)
  102f47:	ff 75 0c             	pushl  0xc(%ebp)
  102f4a:	ff 75 08             	pushl  0x8(%ebp)
  102f4d:	e8 01 ff ff ff       	call   102e53 <memmove>
  102f52:	83 c4 0c             	add    $0xc,%esp
  102f55:	c9                   	leave  
  102f56:	c3                   	ret    

00102f57 <strncmp>:
  102f57:	55                   	push   %ebp
  102f58:	89 e5                	mov    %esp,%ebp
  102f5a:	e8 a8 d4 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  102f5f:	05 a1 90 00 00       	add    $0x90a1,%eax
  102f64:	eb 0c                	jmp    102f72 <strncmp+0x1b>
  102f66:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  102f6a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102f6e:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  102f72:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102f76:	74 1a                	je     102f92 <strncmp+0x3b>
  102f78:	8b 45 08             	mov    0x8(%ebp),%eax
  102f7b:	0f b6 00             	movzbl (%eax),%eax
  102f7e:	84 c0                	test   %al,%al
  102f80:	74 10                	je     102f92 <strncmp+0x3b>
  102f82:	8b 45 08             	mov    0x8(%ebp),%eax
  102f85:	0f b6 10             	movzbl (%eax),%edx
  102f88:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f8b:	0f b6 00             	movzbl (%eax),%eax
  102f8e:	38 c2                	cmp    %al,%dl
  102f90:	74 d4                	je     102f66 <strncmp+0xf>
  102f92:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102f96:	75 07                	jne    102f9f <strncmp+0x48>
  102f98:	b8 00 00 00 00       	mov    $0x0,%eax
  102f9d:	eb 16                	jmp    102fb5 <strncmp+0x5e>
  102f9f:	8b 45 08             	mov    0x8(%ebp),%eax
  102fa2:	0f b6 00             	movzbl (%eax),%eax
  102fa5:	0f b6 d0             	movzbl %al,%edx
  102fa8:	8b 45 0c             	mov    0xc(%ebp),%eax
  102fab:	0f b6 00             	movzbl (%eax),%eax
  102fae:	0f b6 c0             	movzbl %al,%eax
  102fb1:	29 c2                	sub    %eax,%edx
  102fb3:	89 d0                	mov    %edx,%eax
  102fb5:	5d                   	pop    %ebp
  102fb6:	c3                   	ret    

00102fb7 <strnlen>:
  102fb7:	55                   	push   %ebp
  102fb8:	89 e5                	mov    %esp,%ebp
  102fba:	83 ec 10             	sub    $0x10,%esp
  102fbd:	e8 45 d4 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  102fc2:	05 3e 90 00 00       	add    $0x903e,%eax
  102fc7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  102fce:	eb 0c                	jmp    102fdc <strnlen+0x25>
  102fd0:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  102fd4:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102fd8:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
  102fdc:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102fe0:	74 0a                	je     102fec <strnlen+0x35>
  102fe2:	8b 45 08             	mov    0x8(%ebp),%eax
  102fe5:	0f b6 00             	movzbl (%eax),%eax
  102fe8:	84 c0                	test   %al,%al
  102fea:	75 e4                	jne    102fd0 <strnlen+0x19>
  102fec:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102fef:	c9                   	leave  
  102ff0:	c3                   	ret    

00102ff1 <strcmp>:
  102ff1:	55                   	push   %ebp
  102ff2:	89 e5                	mov    %esp,%ebp
  102ff4:	e8 0e d4 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  102ff9:	05 07 90 00 00       	add    $0x9007,%eax
  102ffe:	eb 08                	jmp    103008 <strcmp+0x17>
  103000:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103004:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  103008:	8b 45 08             	mov    0x8(%ebp),%eax
  10300b:	0f b6 00             	movzbl (%eax),%eax
  10300e:	84 c0                	test   %al,%al
  103010:	74 10                	je     103022 <strcmp+0x31>
  103012:	8b 45 08             	mov    0x8(%ebp),%eax
  103015:	0f b6 10             	movzbl (%eax),%edx
  103018:	8b 45 0c             	mov    0xc(%ebp),%eax
  10301b:	0f b6 00             	movzbl (%eax),%eax
  10301e:	38 c2                	cmp    %al,%dl
  103020:	74 de                	je     103000 <strcmp+0xf>
  103022:	8b 45 08             	mov    0x8(%ebp),%eax
  103025:	0f b6 00             	movzbl (%eax),%eax
  103028:	0f b6 d0             	movzbl %al,%edx
  10302b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10302e:	0f b6 00             	movzbl (%eax),%eax
  103031:	0f b6 c0             	movzbl %al,%eax
  103034:	29 c2                	sub    %eax,%edx
  103036:	89 d0                	mov    %edx,%eax
  103038:	5d                   	pop    %ebp
  103039:	c3                   	ret    

0010303a <strchr>:
  10303a:	55                   	push   %ebp
  10303b:	89 e5                	mov    %esp,%ebp
  10303d:	83 ec 04             	sub    $0x4,%esp
  103040:	e8 c2 d3 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  103045:	05 bb 8f 00 00       	add    $0x8fbb,%eax
  10304a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10304d:	88 45 fc             	mov    %al,-0x4(%ebp)
  103050:	eb 14                	jmp    103066 <strchr+0x2c>
  103052:	8b 45 08             	mov    0x8(%ebp),%eax
  103055:	0f b6 00             	movzbl (%eax),%eax
  103058:	3a 45 fc             	cmp    -0x4(%ebp),%al
  10305b:	75 05                	jne    103062 <strchr+0x28>
  10305d:	8b 45 08             	mov    0x8(%ebp),%eax
  103060:	eb 13                	jmp    103075 <strchr+0x3b>
  103062:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103066:	8b 45 08             	mov    0x8(%ebp),%eax
  103069:	0f b6 00             	movzbl (%eax),%eax
  10306c:	84 c0                	test   %al,%al
  10306e:	75 e2                	jne    103052 <strchr+0x18>
  103070:	b8 00 00 00 00       	mov    $0x0,%eax
  103075:	c9                   	leave  
  103076:	c3                   	ret    

00103077 <memzero>:
  103077:	55                   	push   %ebp
  103078:	89 e5                	mov    %esp,%ebp
  10307a:	e8 88 d3 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  10307f:	05 81 8f 00 00       	add    $0x8f81,%eax
  103084:	ff 75 0c             	pushl  0xc(%ebp)
  103087:	6a 00                	push   $0x0
  103089:	ff 75 08             	pushl  0x8(%ebp)
  10308c:	e8 4a fd ff ff       	call   102ddb <memset>
  103091:	83 c4 0c             	add    $0xc,%esp
  103094:	c9                   	leave  
  103095:	c3                   	ret    

00103096 <debug_info>:
  103096:	55                   	push   %ebp
  103097:	89 e5                	mov    %esp,%ebp
  103099:	53                   	push   %ebx
  10309a:	83 ec 14             	sub    $0x14,%esp
  10309d:	e8 65 d3 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  1030a2:	05 5e 8f 00 00       	add    $0x8f5e,%eax
  1030a7:	8d 55 0c             	lea    0xc(%ebp),%edx
  1030aa:	89 55 f4             	mov    %edx,-0xc(%ebp)
  1030ad:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1030b0:	83 ec 08             	sub    $0x8,%esp
  1030b3:	52                   	push   %edx
  1030b4:	ff 75 08             	pushl  0x8(%ebp)
  1030b7:	89 c3                	mov    %eax,%ebx
  1030b9:	e8 66 02 00 00       	call   103324 <vdprintf>
  1030be:	83 c4 10             	add    $0x10,%esp
  1030c1:	90                   	nop
  1030c2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1030c5:	c9                   	leave  
  1030c6:	c3                   	ret    

001030c7 <debug_normal>:
  1030c7:	55                   	push   %ebp
  1030c8:	89 e5                	mov    %esp,%ebp
  1030ca:	53                   	push   %ebx
  1030cb:	83 ec 14             	sub    $0x14,%esp
  1030ce:	e8 3c d3 ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  1030d3:	81 c3 2d 8f 00 00    	add    $0x8f2d,%ebx
  1030d9:	83 ec 04             	sub    $0x4,%esp
  1030dc:	ff 75 0c             	pushl  0xc(%ebp)
  1030df:	ff 75 08             	pushl  0x8(%ebp)
  1030e2:	8d 83 1f b4 ff ff    	lea    -0x4be1(%ebx),%eax
  1030e8:	50                   	push   %eax
  1030e9:	e8 aa 02 00 00       	call   103398 <dprintf>
  1030ee:	83 c4 10             	add    $0x10,%esp
  1030f1:	8d 45 14             	lea    0x14(%ebp),%eax
  1030f4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1030f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1030fa:	83 ec 08             	sub    $0x8,%esp
  1030fd:	50                   	push   %eax
  1030fe:	ff 75 10             	pushl  0x10(%ebp)
  103101:	e8 1e 02 00 00       	call   103324 <vdprintf>
  103106:	83 c4 10             	add    $0x10,%esp
  103109:	90                   	nop
  10310a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10310d:	c9                   	leave  
  10310e:	c3                   	ret    

0010310f <debug_trace>:
  10310f:	55                   	push   %ebp
  103110:	89 e5                	mov    %esp,%ebp
  103112:	83 ec 10             	sub    $0x10,%esp
  103115:	e8 ed d2 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  10311a:	05 e6 8e 00 00       	add    $0x8ee6,%eax
  10311f:	8b 45 08             	mov    0x8(%ebp),%eax
  103122:	89 45 f8             	mov    %eax,-0x8(%ebp)
  103125:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10312c:	eb 23                	jmp    103151 <debug_trace+0x42>
  10312e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103131:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  103138:	8b 45 0c             	mov    0xc(%ebp),%eax
  10313b:	01 c2                	add    %eax,%edx
  10313d:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103140:	8b 40 04             	mov    0x4(%eax),%eax
  103143:	89 02                	mov    %eax,(%edx)
  103145:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103148:	8b 00                	mov    (%eax),%eax
  10314a:	89 45 f8             	mov    %eax,-0x8(%ebp)
  10314d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  103151:	83 7d fc 09          	cmpl   $0x9,-0x4(%ebp)
  103155:	7f 21                	jg     103178 <debug_trace+0x69>
  103157:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
  10315b:	75 d1                	jne    10312e <debug_trace+0x1f>
  10315d:	eb 19                	jmp    103178 <debug_trace+0x69>
  10315f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103162:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  103169:	8b 45 0c             	mov    0xc(%ebp),%eax
  10316c:	01 d0                	add    %edx,%eax
  10316e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  103174:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  103178:	83 7d fc 09          	cmpl   $0x9,-0x4(%ebp)
  10317c:	7e e1                	jle    10315f <debug_trace+0x50>
  10317e:	90                   	nop
  10317f:	c9                   	leave  
  103180:	c3                   	ret    

00103181 <debug_panic>:
  103181:	55                   	push   %ebp
  103182:	89 e5                	mov    %esp,%ebp
  103184:	53                   	push   %ebx
  103185:	83 ec 44             	sub    $0x44,%esp
  103188:	e8 82 d2 ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  10318d:	81 c3 73 8e 00 00    	add    $0x8e73,%ebx
  103193:	83 ec 04             	sub    $0x4,%esp
  103196:	ff 75 0c             	pushl  0xc(%ebp)
  103199:	ff 75 08             	pushl  0x8(%ebp)
  10319c:	8d 83 2b b4 ff ff    	lea    -0x4bd5(%ebx),%eax
  1031a2:	50                   	push   %eax
  1031a3:	e8 f0 01 00 00       	call   103398 <dprintf>
  1031a8:	83 c4 10             	add    $0x10,%esp
  1031ab:	8d 45 14             	lea    0x14(%ebp),%eax
  1031ae:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  1031b1:	8b 45 c4             	mov    -0x3c(%ebp),%eax
  1031b4:	83 ec 08             	sub    $0x8,%esp
  1031b7:	50                   	push   %eax
  1031b8:	ff 75 10             	pushl  0x10(%ebp)
  1031bb:	e8 64 01 00 00       	call   103324 <vdprintf>
  1031c0:	83 c4 10             	add    $0x10,%esp
  1031c3:	89 e8                	mov    %ebp,%eax
  1031c5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1031c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1031cb:	83 ec 08             	sub    $0x8,%esp
  1031ce:	8d 55 c8             	lea    -0x38(%ebp),%edx
  1031d1:	52                   	push   %edx
  1031d2:	50                   	push   %eax
  1031d3:	e8 37 ff ff ff       	call   10310f <debug_trace>
  1031d8:	83 c4 10             	add    $0x10,%esp
  1031db:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1031e2:	eb 1e                	jmp    103202 <debug_panic+0x81>
  1031e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1031e7:	8b 44 85 c8          	mov    -0x38(%ebp,%eax,4),%eax
  1031eb:	83 ec 08             	sub    $0x8,%esp
  1031ee:	50                   	push   %eax
  1031ef:	8d 83 37 b4 ff ff    	lea    -0x4bc9(%ebx),%eax
  1031f5:	50                   	push   %eax
  1031f6:	e8 9d 01 00 00       	call   103398 <dprintf>
  1031fb:	83 c4 10             	add    $0x10,%esp
  1031fe:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  103202:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
  103206:	7f 0b                	jg     103213 <debug_panic+0x92>
  103208:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10320b:	8b 44 85 c8          	mov    -0x38(%ebp,%eax,4),%eax
  10320f:	85 c0                	test   %eax,%eax
  103211:	75 d1                	jne    1031e4 <debug_panic+0x63>
  103213:	83 ec 0c             	sub    $0xc,%esp
  103216:	8d 83 45 b4 ff ff    	lea    -0x4bbb(%ebx),%eax
  10321c:	50                   	push   %eax
  10321d:	e8 76 01 00 00       	call   103398 <dprintf>
  103222:	83 c4 10             	add    $0x10,%esp
  103225:	e8 32 0d 00 00       	call   103f5c <halt>
  10322a:	90                   	nop
  10322b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10322e:	c9                   	leave  
  10322f:	c3                   	ret    

00103230 <debug_warn>:
  103230:	55                   	push   %ebp
  103231:	89 e5                	mov    %esp,%ebp
  103233:	53                   	push   %ebx
  103234:	83 ec 14             	sub    $0x14,%esp
  103237:	e8 d3 d1 ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  10323c:	81 c3 c4 8d 00 00    	add    $0x8dc4,%ebx
  103242:	83 ec 04             	sub    $0x4,%esp
  103245:	ff 75 0c             	pushl  0xc(%ebp)
  103248:	ff 75 08             	pushl  0x8(%ebp)
  10324b:	8d 83 57 b4 ff ff    	lea    -0x4ba9(%ebx),%eax
  103251:	50                   	push   %eax
  103252:	e8 41 01 00 00       	call   103398 <dprintf>
  103257:	83 c4 10             	add    $0x10,%esp
  10325a:	8d 45 14             	lea    0x14(%ebp),%eax
  10325d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103260:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103263:	83 ec 08             	sub    $0x8,%esp
  103266:	50                   	push   %eax
  103267:	ff 75 10             	pushl  0x10(%ebp)
  10326a:	e8 b5 00 00 00       	call   103324 <vdprintf>
  10326f:	83 c4 10             	add    $0x10,%esp
  103272:	90                   	nop
  103273:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  103276:	c9                   	leave  
  103277:	c3                   	ret    

00103278 <cputs>:
  103278:	55                   	push   %ebp
  103279:	89 e5                	mov    %esp,%ebp
  10327b:	53                   	push   %ebx
  10327c:	83 ec 04             	sub    $0x4,%esp
  10327f:	e8 8b d1 ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  103284:	81 c3 7c 8d 00 00    	add    $0x8d7c,%ebx
  10328a:	eb 19                	jmp    1032a5 <cputs+0x2d>
  10328c:	8b 45 08             	mov    0x8(%ebp),%eax
  10328f:	0f b6 00             	movzbl (%eax),%eax
  103292:	0f be c0             	movsbl %al,%eax
  103295:	83 ec 0c             	sub    $0xc,%esp
  103298:	50                   	push   %eax
  103299:	e8 c3 d2 ff ff       	call   100561 <cons_putc>
  10329e:	83 c4 10             	add    $0x10,%esp
  1032a1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  1032a5:	8b 45 08             	mov    0x8(%ebp),%eax
  1032a8:	0f b6 00             	movzbl (%eax),%eax
  1032ab:	84 c0                	test   %al,%al
  1032ad:	75 dd                	jne    10328c <cputs+0x14>
  1032af:	90                   	nop
  1032b0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1032b3:	c9                   	leave  
  1032b4:	c3                   	ret    

001032b5 <putch>:
  1032b5:	55                   	push   %ebp
  1032b6:	89 e5                	mov    %esp,%ebp
  1032b8:	83 ec 08             	sub    $0x8,%esp
  1032bb:	e8 47 d1 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  1032c0:	05 40 8d 00 00       	add    $0x8d40,%eax
  1032c5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032c8:	8b 00                	mov    (%eax),%eax
  1032ca:	8d 48 01             	lea    0x1(%eax),%ecx
  1032cd:	8b 55 0c             	mov    0xc(%ebp),%edx
  1032d0:	89 0a                	mov    %ecx,(%edx)
  1032d2:	8b 55 08             	mov    0x8(%ebp),%edx
  1032d5:	89 d1                	mov    %edx,%ecx
  1032d7:	8b 55 0c             	mov    0xc(%ebp),%edx
  1032da:	88 4c 02 08          	mov    %cl,0x8(%edx,%eax,1)
  1032de:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032e1:	8b 00                	mov    (%eax),%eax
  1032e3:	3d ff 01 00 00       	cmp    $0x1ff,%eax
  1032e8:	75 28                	jne    103312 <putch+0x5d>
  1032ea:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032ed:	8b 00                	mov    (%eax),%eax
  1032ef:	8b 55 0c             	mov    0xc(%ebp),%edx
  1032f2:	c6 44 02 08 00       	movb   $0x0,0x8(%edx,%eax,1)
  1032f7:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032fa:	83 c0 08             	add    $0x8,%eax
  1032fd:	83 ec 0c             	sub    $0xc,%esp
  103300:	50                   	push   %eax
  103301:	e8 72 ff ff ff       	call   103278 <cputs>
  103306:	83 c4 10             	add    $0x10,%esp
  103309:	8b 45 0c             	mov    0xc(%ebp),%eax
  10330c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  103312:	8b 45 0c             	mov    0xc(%ebp),%eax
  103315:	8b 40 04             	mov    0x4(%eax),%eax
  103318:	8d 50 01             	lea    0x1(%eax),%edx
  10331b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10331e:	89 50 04             	mov    %edx,0x4(%eax)
  103321:	90                   	nop
  103322:	c9                   	leave  
  103323:	c3                   	ret    

00103324 <vdprintf>:
  103324:	55                   	push   %ebp
  103325:	89 e5                	mov    %esp,%ebp
  103327:	53                   	push   %ebx
  103328:	81 ec 14 02 00 00    	sub    $0x214,%esp
  10332e:	e8 d4 d0 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  103333:	05 cd 8c 00 00       	add    $0x8ccd,%eax
  103338:	c7 85 f0 fd ff ff 00 	movl   $0x0,-0x210(%ebp)
  10333f:	00 00 00 
  103342:	c7 85 f4 fd ff ff 00 	movl   $0x0,-0x20c(%ebp)
  103349:	00 00 00 
  10334c:	ff 75 0c             	pushl  0xc(%ebp)
  10334f:	ff 75 08             	pushl  0x8(%ebp)
  103352:	8d 95 f0 fd ff ff    	lea    -0x210(%ebp),%edx
  103358:	52                   	push   %edx
  103359:	8d 90 b5 72 ff ff    	lea    -0x8d4b(%eax),%edx
  10335f:	52                   	push   %edx
  103360:	89 c3                	mov    %eax,%ebx
  103362:	e8 db 01 00 00       	call   103542 <vprintfmt>
  103367:	83 c4 10             	add    $0x10,%esp
  10336a:	8b 85 f0 fd ff ff    	mov    -0x210(%ebp),%eax
  103370:	c6 84 05 f8 fd ff ff 	movb   $0x0,-0x208(%ebp,%eax,1)
  103377:	00 
  103378:	83 ec 0c             	sub    $0xc,%esp
  10337b:	8d 85 f0 fd ff ff    	lea    -0x210(%ebp),%eax
  103381:	83 c0 08             	add    $0x8,%eax
  103384:	50                   	push   %eax
  103385:	e8 ee fe ff ff       	call   103278 <cputs>
  10338a:	83 c4 10             	add    $0x10,%esp
  10338d:	8b 85 f4 fd ff ff    	mov    -0x20c(%ebp),%eax
  103393:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  103396:	c9                   	leave  
  103397:	c3                   	ret    

00103398 <dprintf>:
  103398:	55                   	push   %ebp
  103399:	89 e5                	mov    %esp,%ebp
  10339b:	83 ec 18             	sub    $0x18,%esp
  10339e:	e8 64 d0 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  1033a3:	05 5d 8c 00 00       	add    $0x8c5d,%eax
  1033a8:	8d 45 0c             	lea    0xc(%ebp),%eax
  1033ab:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1033ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1033b1:	83 ec 08             	sub    $0x8,%esp
  1033b4:	50                   	push   %eax
  1033b5:	ff 75 08             	pushl  0x8(%ebp)
  1033b8:	e8 67 ff ff ff       	call   103324 <vdprintf>
  1033bd:	83 c4 10             	add    $0x10,%esp
  1033c0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1033c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1033c6:	c9                   	leave  
  1033c7:	c3                   	ret    

001033c8 <printnum>:
  1033c8:	55                   	push   %ebp
  1033c9:	89 e5                	mov    %esp,%ebp
  1033cb:	57                   	push   %edi
  1033cc:	56                   	push   %esi
  1033cd:	53                   	push   %ebx
  1033ce:	83 ec 1c             	sub    $0x1c,%esp
  1033d1:	e8 ad 04 00 00       	call   103883 <__x86.get_pc_thunk.si>
  1033d6:	81 c6 2a 8c 00 00    	add    $0x8c2a,%esi
  1033dc:	8b 45 10             	mov    0x10(%ebp),%eax
  1033df:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1033e2:	8b 45 14             	mov    0x14(%ebp),%eax
  1033e5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  1033e8:	8b 45 18             	mov    0x18(%ebp),%eax
  1033eb:	ba 00 00 00 00       	mov    $0x0,%edx
  1033f0:	3b 55 e4             	cmp    -0x1c(%ebp),%edx
  1033f3:	77 57                	ja     10344c <printnum+0x84>
  1033f5:	3b 55 e4             	cmp    -0x1c(%ebp),%edx
  1033f8:	72 05                	jb     1033ff <printnum+0x37>
  1033fa:	3b 45 e0             	cmp    -0x20(%ebp),%eax
  1033fd:	77 4d                	ja     10344c <printnum+0x84>
  1033ff:	8b 45 1c             	mov    0x1c(%ebp),%eax
  103402:	8d 78 ff             	lea    -0x1(%eax),%edi
  103405:	8b 45 18             	mov    0x18(%ebp),%eax
  103408:	ba 00 00 00 00       	mov    $0x0,%edx
  10340d:	52                   	push   %edx
  10340e:	50                   	push   %eax
  10340f:	ff 75 e4             	pushl  -0x1c(%ebp)
  103412:	ff 75 e0             	pushl  -0x20(%ebp)
  103415:	89 f3                	mov    %esi,%ebx
  103417:	e8 64 3c 00 00       	call   107080 <__udivdi3>
  10341c:	83 c4 10             	add    $0x10,%esp
  10341f:	83 ec 04             	sub    $0x4,%esp
  103422:	ff 75 20             	pushl  0x20(%ebp)
  103425:	57                   	push   %edi
  103426:	ff 75 18             	pushl  0x18(%ebp)
  103429:	52                   	push   %edx
  10342a:	50                   	push   %eax
  10342b:	ff 75 0c             	pushl  0xc(%ebp)
  10342e:	ff 75 08             	pushl  0x8(%ebp)
  103431:	e8 92 ff ff ff       	call   1033c8 <printnum>
  103436:	83 c4 20             	add    $0x20,%esp
  103439:	eb 1b                	jmp    103456 <printnum+0x8e>
  10343b:	83 ec 08             	sub    $0x8,%esp
  10343e:	ff 75 0c             	pushl  0xc(%ebp)
  103441:	ff 75 20             	pushl  0x20(%ebp)
  103444:	8b 45 08             	mov    0x8(%ebp),%eax
  103447:	ff d0                	call   *%eax
  103449:	83 c4 10             	add    $0x10,%esp
  10344c:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
  103450:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  103454:	7f e5                	jg     10343b <printnum+0x73>
  103456:	8b 4d 18             	mov    0x18(%ebp),%ecx
  103459:	bb 00 00 00 00       	mov    $0x0,%ebx
  10345e:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103461:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  103464:	53                   	push   %ebx
  103465:	51                   	push   %ecx
  103466:	52                   	push   %edx
  103467:	50                   	push   %eax
  103468:	89 f3                	mov    %esi,%ebx
  10346a:	e8 41 3d 00 00       	call   1071b0 <__umoddi3>
  10346f:	83 c4 10             	add    $0x10,%esp
  103472:	8d 8e 64 b4 ff ff    	lea    -0x4b9c(%esi),%ecx
  103478:	01 c8                	add    %ecx,%eax
  10347a:	0f b6 00             	movzbl (%eax),%eax
  10347d:	0f be c0             	movsbl %al,%eax
  103480:	83 ec 08             	sub    $0x8,%esp
  103483:	ff 75 0c             	pushl  0xc(%ebp)
  103486:	50                   	push   %eax
  103487:	8b 45 08             	mov    0x8(%ebp),%eax
  10348a:	ff d0                	call   *%eax
  10348c:	83 c4 10             	add    $0x10,%esp
  10348f:	90                   	nop
  103490:	8d 65 f4             	lea    -0xc(%ebp),%esp
  103493:	5b                   	pop    %ebx
  103494:	5e                   	pop    %esi
  103495:	5f                   	pop    %edi
  103496:	5d                   	pop    %ebp
  103497:	c3                   	ret    

00103498 <getuint>:
  103498:	55                   	push   %ebp
  103499:	89 e5                	mov    %esp,%ebp
  10349b:	e8 67 cf ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  1034a0:	05 60 8b 00 00       	add    $0x8b60,%eax
  1034a5:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  1034a9:	7e 14                	jle    1034bf <getuint+0x27>
  1034ab:	8b 45 08             	mov    0x8(%ebp),%eax
  1034ae:	8b 00                	mov    (%eax),%eax
  1034b0:	8d 48 08             	lea    0x8(%eax),%ecx
  1034b3:	8b 55 08             	mov    0x8(%ebp),%edx
  1034b6:	89 0a                	mov    %ecx,(%edx)
  1034b8:	8b 50 04             	mov    0x4(%eax),%edx
  1034bb:	8b 00                	mov    (%eax),%eax
  1034bd:	eb 30                	jmp    1034ef <getuint+0x57>
  1034bf:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  1034c3:	74 16                	je     1034db <getuint+0x43>
  1034c5:	8b 45 08             	mov    0x8(%ebp),%eax
  1034c8:	8b 00                	mov    (%eax),%eax
  1034ca:	8d 48 04             	lea    0x4(%eax),%ecx
  1034cd:	8b 55 08             	mov    0x8(%ebp),%edx
  1034d0:	89 0a                	mov    %ecx,(%edx)
  1034d2:	8b 00                	mov    (%eax),%eax
  1034d4:	ba 00 00 00 00       	mov    $0x0,%edx
  1034d9:	eb 14                	jmp    1034ef <getuint+0x57>
  1034db:	8b 45 08             	mov    0x8(%ebp),%eax
  1034de:	8b 00                	mov    (%eax),%eax
  1034e0:	8d 48 04             	lea    0x4(%eax),%ecx
  1034e3:	8b 55 08             	mov    0x8(%ebp),%edx
  1034e6:	89 0a                	mov    %ecx,(%edx)
  1034e8:	8b 00                	mov    (%eax),%eax
  1034ea:	ba 00 00 00 00       	mov    $0x0,%edx
  1034ef:	5d                   	pop    %ebp
  1034f0:	c3                   	ret    

001034f1 <getint>:
  1034f1:	55                   	push   %ebp
  1034f2:	89 e5                	mov    %esp,%ebp
  1034f4:	e8 0e cf ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  1034f9:	05 07 8b 00 00       	add    $0x8b07,%eax
  1034fe:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  103502:	7e 14                	jle    103518 <getint+0x27>
  103504:	8b 45 08             	mov    0x8(%ebp),%eax
  103507:	8b 00                	mov    (%eax),%eax
  103509:	8d 48 08             	lea    0x8(%eax),%ecx
  10350c:	8b 55 08             	mov    0x8(%ebp),%edx
  10350f:	89 0a                	mov    %ecx,(%edx)
  103511:	8b 50 04             	mov    0x4(%eax),%edx
  103514:	8b 00                	mov    (%eax),%eax
  103516:	eb 28                	jmp    103540 <getint+0x4f>
  103518:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  10351c:	74 12                	je     103530 <getint+0x3f>
  10351e:	8b 45 08             	mov    0x8(%ebp),%eax
  103521:	8b 00                	mov    (%eax),%eax
  103523:	8d 48 04             	lea    0x4(%eax),%ecx
  103526:	8b 55 08             	mov    0x8(%ebp),%edx
  103529:	89 0a                	mov    %ecx,(%edx)
  10352b:	8b 00                	mov    (%eax),%eax
  10352d:	99                   	cltd   
  10352e:	eb 10                	jmp    103540 <getint+0x4f>
  103530:	8b 45 08             	mov    0x8(%ebp),%eax
  103533:	8b 00                	mov    (%eax),%eax
  103535:	8d 48 04             	lea    0x4(%eax),%ecx
  103538:	8b 55 08             	mov    0x8(%ebp),%edx
  10353b:	89 0a                	mov    %ecx,(%edx)
  10353d:	8b 00                	mov    (%eax),%eax
  10353f:	99                   	cltd   
  103540:	5d                   	pop    %ebp
  103541:	c3                   	ret    

00103542 <vprintfmt>:
  103542:	55                   	push   %ebp
  103543:	89 e5                	mov    %esp,%ebp
  103545:	57                   	push   %edi
  103546:	56                   	push   %esi
  103547:	53                   	push   %ebx
  103548:	83 ec 2c             	sub    $0x2c,%esp
  10354b:	e8 37 03 00 00       	call   103887 <__x86.get_pc_thunk.di>
  103550:	81 c7 b0 8a 00 00    	add    $0x8ab0,%edi
  103556:	eb 17                	jmp    10356f <vprintfmt+0x2d>
  103558:	85 db                	test   %ebx,%ebx
  10355a:	0f 84 1a 03 00 00    	je     10387a <.L22+0x2d>
  103560:	83 ec 08             	sub    $0x8,%esp
  103563:	ff 75 0c             	pushl  0xc(%ebp)
  103566:	53                   	push   %ebx
  103567:	8b 45 08             	mov    0x8(%ebp),%eax
  10356a:	ff d0                	call   *%eax
  10356c:	83 c4 10             	add    $0x10,%esp
  10356f:	8b 45 10             	mov    0x10(%ebp),%eax
  103572:	8d 50 01             	lea    0x1(%eax),%edx
  103575:	89 55 10             	mov    %edx,0x10(%ebp)
  103578:	0f b6 00             	movzbl (%eax),%eax
  10357b:	0f b6 d8             	movzbl %al,%ebx
  10357e:	83 fb 25             	cmp    $0x25,%ebx
  103581:	75 d5                	jne    103558 <vprintfmt+0x16>
  103583:	c6 45 cb 20          	movb   $0x20,-0x35(%ebp)
  103587:	c7 45 d4 ff ff ff ff 	movl   $0xffffffff,-0x2c(%ebp)
  10358e:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  103595:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  10359c:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
  1035a3:	8b 45 10             	mov    0x10(%ebp),%eax
  1035a6:	8d 50 01             	lea    0x1(%eax),%edx
  1035a9:	89 55 10             	mov    %edx,0x10(%ebp)
  1035ac:	0f b6 00             	movzbl (%eax),%eax
  1035af:	0f b6 d8             	movzbl %al,%ebx
  1035b2:	8d 43 dd             	lea    -0x23(%ebx),%eax
  1035b5:	83 f8 55             	cmp    $0x55,%eax
  1035b8:	0f 87 8f 02 00 00    	ja     10384d <.L22>
  1035be:	c1 e0 02             	shl    $0x2,%eax
  1035c1:	8b 84 38 7c b4 ff ff 	mov    -0x4b84(%eax,%edi,1),%eax
  1035c8:	01 f8                	add    %edi,%eax
  1035ca:	ff e0                	jmp    *%eax

001035cc <.L27>:
  1035cc:	c6 45 cb 2d          	movb   $0x2d,-0x35(%ebp)
  1035d0:	eb d1                	jmp    1035a3 <vprintfmt+0x61>

001035d2 <.L29>:
  1035d2:	c6 45 cb 30          	movb   $0x30,-0x35(%ebp)
  1035d6:	eb cb                	jmp    1035a3 <vprintfmt+0x61>

001035d8 <.L30>:
  1035d8:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%ebp)
  1035df:	8b 55 d0             	mov    -0x30(%ebp),%edx
  1035e2:	89 d0                	mov    %edx,%eax
  1035e4:	c1 e0 02             	shl    $0x2,%eax
  1035e7:	01 d0                	add    %edx,%eax
  1035e9:	01 c0                	add    %eax,%eax
  1035eb:	01 d8                	add    %ebx,%eax
  1035ed:	83 e8 30             	sub    $0x30,%eax
  1035f0:	89 45 d0             	mov    %eax,-0x30(%ebp)
  1035f3:	8b 45 10             	mov    0x10(%ebp),%eax
  1035f6:	0f b6 00             	movzbl (%eax),%eax
  1035f9:	0f be d8             	movsbl %al,%ebx
  1035fc:	83 fb 2f             	cmp    $0x2f,%ebx
  1035ff:	7e 39                	jle    10363a <.L23+0xc>
  103601:	83 fb 39             	cmp    $0x39,%ebx
  103604:	7f 34                	jg     10363a <.L23+0xc>
  103606:	83 45 10 01          	addl   $0x1,0x10(%ebp)
  10360a:	eb d3                	jmp    1035df <.L30+0x7>

0010360c <.L26>:
  10360c:	8b 45 14             	mov    0x14(%ebp),%eax
  10360f:	8d 50 04             	lea    0x4(%eax),%edx
  103612:	89 55 14             	mov    %edx,0x14(%ebp)
  103615:	8b 00                	mov    (%eax),%eax
  103617:	89 45 d0             	mov    %eax,-0x30(%ebp)
  10361a:	eb 1f                	jmp    10363b <.L23+0xd>

0010361c <.L28>:
  10361c:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
  103620:	79 81                	jns    1035a3 <vprintfmt+0x61>
  103622:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
  103629:	e9 75 ff ff ff       	jmp    1035a3 <vprintfmt+0x61>

0010362e <.L23>:
  10362e:	c7 45 cc 01 00 00 00 	movl   $0x1,-0x34(%ebp)
  103635:	e9 69 ff ff ff       	jmp    1035a3 <vprintfmt+0x61>
  10363a:	90                   	nop
  10363b:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
  10363f:	0f 89 5e ff ff ff    	jns    1035a3 <vprintfmt+0x61>
  103645:	8b 45 d0             	mov    -0x30(%ebp),%eax
  103648:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  10364b:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  103652:	e9 4c ff ff ff       	jmp    1035a3 <vprintfmt+0x61>

00103657 <.L33>:
  103657:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
  10365b:	e9 43 ff ff ff       	jmp    1035a3 <vprintfmt+0x61>

00103660 <.L31>:
  103660:	8b 45 14             	mov    0x14(%ebp),%eax
  103663:	8d 50 04             	lea    0x4(%eax),%edx
  103666:	89 55 14             	mov    %edx,0x14(%ebp)
  103669:	8b 00                	mov    (%eax),%eax
  10366b:	83 ec 08             	sub    $0x8,%esp
  10366e:	ff 75 0c             	pushl  0xc(%ebp)
  103671:	50                   	push   %eax
  103672:	8b 45 08             	mov    0x8(%ebp),%eax
  103675:	ff d0                	call   *%eax
  103677:	83 c4 10             	add    $0x10,%esp
  10367a:	e9 f6 01 00 00       	jmp    103875 <.L22+0x28>

0010367f <.L35>:
  10367f:	8b 45 14             	mov    0x14(%ebp),%eax
  103682:	8d 50 04             	lea    0x4(%eax),%edx
  103685:	89 55 14             	mov    %edx,0x14(%ebp)
  103688:	8b 30                	mov    (%eax),%esi
  10368a:	85 f6                	test   %esi,%esi
  10368c:	75 06                	jne    103694 <.L35+0x15>
  10368e:	8d b7 75 b4 ff ff    	lea    -0x4b8b(%edi),%esi
  103694:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
  103698:	7e 71                	jle    10370b <.L35+0x8c>
  10369a:	80 7d cb 2d          	cmpb   $0x2d,-0x35(%ebp)
  10369e:	74 6b                	je     10370b <.L35+0x8c>
  1036a0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  1036a3:	83 ec 08             	sub    $0x8,%esp
  1036a6:	50                   	push   %eax
  1036a7:	56                   	push   %esi
  1036a8:	89 fb                	mov    %edi,%ebx
  1036aa:	e8 08 f9 ff ff       	call   102fb7 <strnlen>
  1036af:	83 c4 10             	add    $0x10,%esp
  1036b2:	29 45 d4             	sub    %eax,-0x2c(%ebp)
  1036b5:	eb 17                	jmp    1036ce <.L35+0x4f>
  1036b7:	0f be 45 cb          	movsbl -0x35(%ebp),%eax
  1036bb:	83 ec 08             	sub    $0x8,%esp
  1036be:	ff 75 0c             	pushl  0xc(%ebp)
  1036c1:	50                   	push   %eax
  1036c2:	8b 45 08             	mov    0x8(%ebp),%eax
  1036c5:	ff d0                	call   *%eax
  1036c7:	83 c4 10             	add    $0x10,%esp
  1036ca:	83 6d d4 01          	subl   $0x1,-0x2c(%ebp)
  1036ce:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
  1036d2:	7f e3                	jg     1036b7 <.L35+0x38>
  1036d4:	eb 35                	jmp    10370b <.L35+0x8c>
  1036d6:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
  1036da:	74 1c                	je     1036f8 <.L35+0x79>
  1036dc:	83 fb 1f             	cmp    $0x1f,%ebx
  1036df:	7e 05                	jle    1036e6 <.L35+0x67>
  1036e1:	83 fb 7e             	cmp    $0x7e,%ebx
  1036e4:	7e 12                	jle    1036f8 <.L35+0x79>
  1036e6:	83 ec 08             	sub    $0x8,%esp
  1036e9:	ff 75 0c             	pushl  0xc(%ebp)
  1036ec:	6a 3f                	push   $0x3f
  1036ee:	8b 45 08             	mov    0x8(%ebp),%eax
  1036f1:	ff d0                	call   *%eax
  1036f3:	83 c4 10             	add    $0x10,%esp
  1036f6:	eb 0f                	jmp    103707 <.L35+0x88>
  1036f8:	83 ec 08             	sub    $0x8,%esp
  1036fb:	ff 75 0c             	pushl  0xc(%ebp)
  1036fe:	53                   	push   %ebx
  1036ff:	8b 45 08             	mov    0x8(%ebp),%eax
  103702:	ff d0                	call   *%eax
  103704:	83 c4 10             	add    $0x10,%esp
  103707:	83 6d d4 01          	subl   $0x1,-0x2c(%ebp)
  10370b:	89 f0                	mov    %esi,%eax
  10370d:	8d 70 01             	lea    0x1(%eax),%esi
  103710:	0f b6 00             	movzbl (%eax),%eax
  103713:	0f be d8             	movsbl %al,%ebx
  103716:	85 db                	test   %ebx,%ebx
  103718:	74 26                	je     103740 <.L35+0xc1>
  10371a:	83 7d d0 00          	cmpl   $0x0,-0x30(%ebp)
  10371e:	78 b6                	js     1036d6 <.L35+0x57>
  103720:	83 6d d0 01          	subl   $0x1,-0x30(%ebp)
  103724:	83 7d d0 00          	cmpl   $0x0,-0x30(%ebp)
  103728:	79 ac                	jns    1036d6 <.L35+0x57>
  10372a:	eb 14                	jmp    103740 <.L35+0xc1>
  10372c:	83 ec 08             	sub    $0x8,%esp
  10372f:	ff 75 0c             	pushl  0xc(%ebp)
  103732:	6a 20                	push   $0x20
  103734:	8b 45 08             	mov    0x8(%ebp),%eax
  103737:	ff d0                	call   *%eax
  103739:	83 c4 10             	add    $0x10,%esp
  10373c:	83 6d d4 01          	subl   $0x1,-0x2c(%ebp)
  103740:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
  103744:	7f e6                	jg     10372c <.L35+0xad>
  103746:	e9 2a 01 00 00       	jmp    103875 <.L22+0x28>

0010374b <.L32>:
  10374b:	83 ec 08             	sub    $0x8,%esp
  10374e:	ff 75 d8             	pushl  -0x28(%ebp)
  103751:	8d 45 14             	lea    0x14(%ebp),%eax
  103754:	50                   	push   %eax
  103755:	e8 97 fd ff ff       	call   1034f1 <getint>
  10375a:	83 c4 10             	add    $0x10,%esp
  10375d:	89 45 e0             	mov    %eax,-0x20(%ebp)
  103760:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  103763:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103766:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  103769:	85 d2                	test   %edx,%edx
  10376b:	79 23                	jns    103790 <.L32+0x45>
  10376d:	83 ec 08             	sub    $0x8,%esp
  103770:	ff 75 0c             	pushl  0xc(%ebp)
  103773:	6a 2d                	push   $0x2d
  103775:	8b 45 08             	mov    0x8(%ebp),%eax
  103778:	ff d0                	call   *%eax
  10377a:	83 c4 10             	add    $0x10,%esp
  10377d:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103780:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  103783:	f7 d8                	neg    %eax
  103785:	83 d2 00             	adc    $0x0,%edx
  103788:	f7 da                	neg    %edx
  10378a:	89 45 e0             	mov    %eax,-0x20(%ebp)
  10378d:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  103790:	c7 45 dc 0a 00 00 00 	movl   $0xa,-0x24(%ebp)
  103797:	eb 7e                	jmp    103817 <.L37+0x1f>

00103799 <.L36>:
  103799:	83 ec 08             	sub    $0x8,%esp
  10379c:	ff 75 d8             	pushl  -0x28(%ebp)
  10379f:	8d 45 14             	lea    0x14(%ebp),%eax
  1037a2:	50                   	push   %eax
  1037a3:	e8 f0 fc ff ff       	call   103498 <getuint>
  1037a8:	83 c4 10             	add    $0x10,%esp
  1037ab:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1037ae:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  1037b1:	c7 45 dc 0a 00 00 00 	movl   $0xa,-0x24(%ebp)
  1037b8:	eb 5d                	jmp    103817 <.L37+0x1f>

001037ba <.L34>:
  1037ba:	83 ec 08             	sub    $0x8,%esp
  1037bd:	ff 75 0c             	pushl  0xc(%ebp)
  1037c0:	6a 30                	push   $0x30
  1037c2:	8b 45 08             	mov    0x8(%ebp),%eax
  1037c5:	ff d0                	call   *%eax
  1037c7:	83 c4 10             	add    $0x10,%esp
  1037ca:	83 ec 08             	sub    $0x8,%esp
  1037cd:	ff 75 0c             	pushl  0xc(%ebp)
  1037d0:	6a 78                	push   $0x78
  1037d2:	8b 45 08             	mov    0x8(%ebp),%eax
  1037d5:	ff d0                	call   *%eax
  1037d7:	83 c4 10             	add    $0x10,%esp
  1037da:	8b 45 14             	mov    0x14(%ebp),%eax
  1037dd:	8d 50 04             	lea    0x4(%eax),%edx
  1037e0:	89 55 14             	mov    %edx,0x14(%ebp)
  1037e3:	8b 00                	mov    (%eax),%eax
  1037e5:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1037e8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  1037ef:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
  1037f6:	eb 1f                	jmp    103817 <.L37+0x1f>

001037f8 <.L37>:
  1037f8:	83 ec 08             	sub    $0x8,%esp
  1037fb:	ff 75 d8             	pushl  -0x28(%ebp)
  1037fe:	8d 45 14             	lea    0x14(%ebp),%eax
  103801:	50                   	push   %eax
  103802:	e8 91 fc ff ff       	call   103498 <getuint>
  103807:	83 c4 10             	add    $0x10,%esp
  10380a:	89 45 e0             	mov    %eax,-0x20(%ebp)
  10380d:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  103810:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
  103817:	0f be 55 cb          	movsbl -0x35(%ebp),%edx
  10381b:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10381e:	83 ec 04             	sub    $0x4,%esp
  103821:	52                   	push   %edx
  103822:	ff 75 d4             	pushl  -0x2c(%ebp)
  103825:	50                   	push   %eax
  103826:	ff 75 e4             	pushl  -0x1c(%ebp)
  103829:	ff 75 e0             	pushl  -0x20(%ebp)
  10382c:	ff 75 0c             	pushl  0xc(%ebp)
  10382f:	ff 75 08             	pushl  0x8(%ebp)
  103832:	e8 91 fb ff ff       	call   1033c8 <printnum>
  103837:	83 c4 20             	add    $0x20,%esp
  10383a:	eb 39                	jmp    103875 <.L22+0x28>

0010383c <.L25>:
  10383c:	83 ec 08             	sub    $0x8,%esp
  10383f:	ff 75 0c             	pushl  0xc(%ebp)
  103842:	53                   	push   %ebx
  103843:	8b 45 08             	mov    0x8(%ebp),%eax
  103846:	ff d0                	call   *%eax
  103848:	83 c4 10             	add    $0x10,%esp
  10384b:	eb 28                	jmp    103875 <.L22+0x28>

0010384d <.L22>:
  10384d:	83 ec 08             	sub    $0x8,%esp
  103850:	ff 75 0c             	pushl  0xc(%ebp)
  103853:	6a 25                	push   $0x25
  103855:	8b 45 08             	mov    0x8(%ebp),%eax
  103858:	ff d0                	call   *%eax
  10385a:	83 c4 10             	add    $0x10,%esp
  10385d:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  103861:	eb 04                	jmp    103867 <.L22+0x1a>
  103863:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  103867:	8b 45 10             	mov    0x10(%ebp),%eax
  10386a:	83 e8 01             	sub    $0x1,%eax
  10386d:	0f b6 00             	movzbl (%eax),%eax
  103870:	3c 25                	cmp    $0x25,%al
  103872:	75 ef                	jne    103863 <.L22+0x16>
  103874:	90                   	nop
  103875:	e9 f5 fc ff ff       	jmp    10356f <vprintfmt+0x2d>
  10387a:	90                   	nop
  10387b:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10387e:	5b                   	pop    %ebx
  10387f:	5e                   	pop    %esi
  103880:	5f                   	pop    %edi
  103881:	5d                   	pop    %ebp
  103882:	c3                   	ret    

00103883 <__x86.get_pc_thunk.si>:
  103883:	8b 34 24             	mov    (%esp),%esi
  103886:	c3                   	ret    

00103887 <__x86.get_pc_thunk.di>:
  103887:	8b 3c 24             	mov    (%esp),%edi
  10388a:	c3                   	ret    

0010388b <seg_init>:
  10388b:	55                   	push   %ebp
  10388c:	89 e5                	mov    %esp,%ebp
  10388e:	53                   	push   %ebx
  10388f:	83 ec 14             	sub    $0x14,%esp
  103892:	e8 78 cb ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  103897:	81 c3 69 87 00 00    	add    $0x8769,%ebx
  10389d:	c7 c0 00 50 91 00    	mov    $0x915000,%eax
  1038a3:	89 c2                	mov    %eax,%edx
  1038a5:	c7 c0 68 29 11 00    	mov    $0x112968,%eax
  1038ab:	29 c2                	sub    %eax,%edx
  1038ad:	89 d0                	mov    %edx,%eax
  1038af:	83 ec 08             	sub    $0x8,%esp
  1038b2:	50                   	push   %eax
  1038b3:	c7 c0 68 29 11 00    	mov    $0x112968,%eax
  1038b9:	50                   	push   %eax
  1038ba:	e8 b8 f7 ff ff       	call   103077 <memzero>
  1038bf:	83 c4 10             	add    $0x10,%esp
  1038c2:	c7 c0 00 a0 d9 00    	mov    $0xd9a000,%eax
  1038c8:	8d 90 00 f0 ff ff    	lea    -0x1000(%eax),%edx
  1038ce:	c7 c0 00 50 91 00    	mov    $0x915000,%eax
  1038d4:	29 c2                	sub    %eax,%edx
  1038d6:	89 d0                	mov    %edx,%eax
  1038d8:	89 c2                	mov    %eax,%edx
  1038da:	c7 c0 00 50 91 00    	mov    $0x915000,%eax
  1038e0:	8d 80 00 10 00 00    	lea    0x1000(%eax),%eax
  1038e6:	83 ec 08             	sub    $0x8,%esp
  1038e9:	52                   	push   %edx
  1038ea:	50                   	push   %eax
  1038eb:	e8 87 f7 ff ff       	call   103077 <memzero>
  1038f0:	83 c4 10             	add    $0x10,%esp
  1038f3:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  1038f9:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  1038ff:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  103906:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  10390c:	66 c7 40 08 ff ff    	movw   $0xffff,0x8(%eax)
  103912:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103918:	66 c7 40 0a 00 00    	movw   $0x0,0xa(%eax)
  10391e:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103924:	c6 40 0c 00          	movb   $0x0,0xc(%eax)
  103928:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  10392e:	0f b6 50 0d          	movzbl 0xd(%eax),%edx
  103932:	83 e2 f0             	and    $0xfffffff0,%edx
  103935:	83 ca 0a             	or     $0xa,%edx
  103938:	88 50 0d             	mov    %dl,0xd(%eax)
  10393b:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103941:	0f b6 50 0d          	movzbl 0xd(%eax),%edx
  103945:	83 ca 10             	or     $0x10,%edx
  103948:	88 50 0d             	mov    %dl,0xd(%eax)
  10394b:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103951:	0f b6 50 0d          	movzbl 0xd(%eax),%edx
  103955:	83 e2 9f             	and    $0xffffff9f,%edx
  103958:	88 50 0d             	mov    %dl,0xd(%eax)
  10395b:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103961:	0f b6 50 0d          	movzbl 0xd(%eax),%edx
  103965:	83 ca 80             	or     $0xffffff80,%edx
  103968:	88 50 0d             	mov    %dl,0xd(%eax)
  10396b:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103971:	0f b6 50 0e          	movzbl 0xe(%eax),%edx
  103975:	83 ca 0f             	or     $0xf,%edx
  103978:	88 50 0e             	mov    %dl,0xe(%eax)
  10397b:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103981:	0f b6 50 0e          	movzbl 0xe(%eax),%edx
  103985:	83 e2 ef             	and    $0xffffffef,%edx
  103988:	88 50 0e             	mov    %dl,0xe(%eax)
  10398b:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103991:	0f b6 50 0e          	movzbl 0xe(%eax),%edx
  103995:	83 e2 df             	and    $0xffffffdf,%edx
  103998:	88 50 0e             	mov    %dl,0xe(%eax)
  10399b:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  1039a1:	0f b6 50 0e          	movzbl 0xe(%eax),%edx
  1039a5:	83 ca 40             	or     $0x40,%edx
  1039a8:	88 50 0e             	mov    %dl,0xe(%eax)
  1039ab:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  1039b1:	0f b6 50 0e          	movzbl 0xe(%eax),%edx
  1039b5:	83 ca 80             	or     $0xffffff80,%edx
  1039b8:	88 50 0e             	mov    %dl,0xe(%eax)
  1039bb:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  1039c1:	c6 40 0f 00          	movb   $0x0,0xf(%eax)
  1039c5:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  1039cb:	66 c7 40 10 ff ff    	movw   $0xffff,0x10(%eax)
  1039d1:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  1039d7:	66 c7 40 12 00 00    	movw   $0x0,0x12(%eax)
  1039dd:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  1039e3:	c6 40 14 00          	movb   $0x0,0x14(%eax)
  1039e7:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  1039ed:	0f b6 50 15          	movzbl 0x15(%eax),%edx
  1039f1:	83 e2 f0             	and    $0xfffffff0,%edx
  1039f4:	83 ca 02             	or     $0x2,%edx
  1039f7:	88 50 15             	mov    %dl,0x15(%eax)
  1039fa:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103a00:	0f b6 50 15          	movzbl 0x15(%eax),%edx
  103a04:	83 ca 10             	or     $0x10,%edx
  103a07:	88 50 15             	mov    %dl,0x15(%eax)
  103a0a:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103a10:	0f b6 50 15          	movzbl 0x15(%eax),%edx
  103a14:	83 e2 9f             	and    $0xffffff9f,%edx
  103a17:	88 50 15             	mov    %dl,0x15(%eax)
  103a1a:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103a20:	0f b6 50 15          	movzbl 0x15(%eax),%edx
  103a24:	83 ca 80             	or     $0xffffff80,%edx
  103a27:	88 50 15             	mov    %dl,0x15(%eax)
  103a2a:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103a30:	0f b6 50 16          	movzbl 0x16(%eax),%edx
  103a34:	83 ca 0f             	or     $0xf,%edx
  103a37:	88 50 16             	mov    %dl,0x16(%eax)
  103a3a:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103a40:	0f b6 50 16          	movzbl 0x16(%eax),%edx
  103a44:	83 e2 ef             	and    $0xffffffef,%edx
  103a47:	88 50 16             	mov    %dl,0x16(%eax)
  103a4a:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103a50:	0f b6 50 16          	movzbl 0x16(%eax),%edx
  103a54:	83 e2 df             	and    $0xffffffdf,%edx
  103a57:	88 50 16             	mov    %dl,0x16(%eax)
  103a5a:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103a60:	0f b6 50 16          	movzbl 0x16(%eax),%edx
  103a64:	83 ca 40             	or     $0x40,%edx
  103a67:	88 50 16             	mov    %dl,0x16(%eax)
  103a6a:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103a70:	0f b6 50 16          	movzbl 0x16(%eax),%edx
  103a74:	83 ca 80             	or     $0xffffff80,%edx
  103a77:	88 50 16             	mov    %dl,0x16(%eax)
  103a7a:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103a80:	c6 40 17 00          	movb   $0x0,0x17(%eax)
  103a84:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103a8a:	66 c7 40 18 ff ff    	movw   $0xffff,0x18(%eax)
  103a90:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103a96:	66 c7 40 1a 00 00    	movw   $0x0,0x1a(%eax)
  103a9c:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103aa2:	c6 40 1c 00          	movb   $0x0,0x1c(%eax)
  103aa6:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103aac:	0f b6 50 1d          	movzbl 0x1d(%eax),%edx
  103ab0:	83 e2 f0             	and    $0xfffffff0,%edx
  103ab3:	83 ca 0a             	or     $0xa,%edx
  103ab6:	88 50 1d             	mov    %dl,0x1d(%eax)
  103ab9:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103abf:	0f b6 50 1d          	movzbl 0x1d(%eax),%edx
  103ac3:	83 ca 10             	or     $0x10,%edx
  103ac6:	88 50 1d             	mov    %dl,0x1d(%eax)
  103ac9:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103acf:	0f b6 50 1d          	movzbl 0x1d(%eax),%edx
  103ad3:	83 ca 60             	or     $0x60,%edx
  103ad6:	88 50 1d             	mov    %dl,0x1d(%eax)
  103ad9:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103adf:	0f b6 50 1d          	movzbl 0x1d(%eax),%edx
  103ae3:	83 ca 80             	or     $0xffffff80,%edx
  103ae6:	88 50 1d             	mov    %dl,0x1d(%eax)
  103ae9:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103aef:	0f b6 50 1e          	movzbl 0x1e(%eax),%edx
  103af3:	83 ca 0f             	or     $0xf,%edx
  103af6:	88 50 1e             	mov    %dl,0x1e(%eax)
  103af9:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103aff:	0f b6 50 1e          	movzbl 0x1e(%eax),%edx
  103b03:	83 e2 ef             	and    $0xffffffef,%edx
  103b06:	88 50 1e             	mov    %dl,0x1e(%eax)
  103b09:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103b0f:	0f b6 50 1e          	movzbl 0x1e(%eax),%edx
  103b13:	83 e2 df             	and    $0xffffffdf,%edx
  103b16:	88 50 1e             	mov    %dl,0x1e(%eax)
  103b19:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103b1f:	0f b6 50 1e          	movzbl 0x1e(%eax),%edx
  103b23:	83 ca 40             	or     $0x40,%edx
  103b26:	88 50 1e             	mov    %dl,0x1e(%eax)
  103b29:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103b2f:	0f b6 50 1e          	movzbl 0x1e(%eax),%edx
  103b33:	83 ca 80             	or     $0xffffff80,%edx
  103b36:	88 50 1e             	mov    %dl,0x1e(%eax)
  103b39:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103b3f:	c6 40 1f 00          	movb   $0x0,0x1f(%eax)
  103b43:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103b49:	66 c7 40 20 ff ff    	movw   $0xffff,0x20(%eax)
  103b4f:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103b55:	66 c7 40 22 00 00    	movw   $0x0,0x22(%eax)
  103b5b:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103b61:	c6 40 24 00          	movb   $0x0,0x24(%eax)
  103b65:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103b6b:	0f b6 50 25          	movzbl 0x25(%eax),%edx
  103b6f:	83 e2 f0             	and    $0xfffffff0,%edx
  103b72:	83 ca 02             	or     $0x2,%edx
  103b75:	88 50 25             	mov    %dl,0x25(%eax)
  103b78:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103b7e:	0f b6 50 25          	movzbl 0x25(%eax),%edx
  103b82:	83 ca 10             	or     $0x10,%edx
  103b85:	88 50 25             	mov    %dl,0x25(%eax)
  103b88:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103b8e:	0f b6 50 25          	movzbl 0x25(%eax),%edx
  103b92:	83 ca 60             	or     $0x60,%edx
  103b95:	88 50 25             	mov    %dl,0x25(%eax)
  103b98:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103b9e:	0f b6 50 25          	movzbl 0x25(%eax),%edx
  103ba2:	83 ca 80             	or     $0xffffff80,%edx
  103ba5:	88 50 25             	mov    %dl,0x25(%eax)
  103ba8:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103bae:	0f b6 50 26          	movzbl 0x26(%eax),%edx
  103bb2:	83 ca 0f             	or     $0xf,%edx
  103bb5:	88 50 26             	mov    %dl,0x26(%eax)
  103bb8:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103bbe:	0f b6 50 26          	movzbl 0x26(%eax),%edx
  103bc2:	83 e2 ef             	and    $0xffffffef,%edx
  103bc5:	88 50 26             	mov    %dl,0x26(%eax)
  103bc8:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103bce:	0f b6 50 26          	movzbl 0x26(%eax),%edx
  103bd2:	83 e2 df             	and    $0xffffffdf,%edx
  103bd5:	88 50 26             	mov    %dl,0x26(%eax)
  103bd8:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103bde:	0f b6 50 26          	movzbl 0x26(%eax),%edx
  103be2:	83 ca 40             	or     $0x40,%edx
  103be5:	88 50 26             	mov    %dl,0x26(%eax)
  103be8:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103bee:	0f b6 50 26          	movzbl 0x26(%eax),%edx
  103bf2:	83 ca 80             	or     $0xffffff80,%edx
  103bf5:	88 50 26             	mov    %dl,0x26(%eax)
  103bf8:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103bfe:	c6 40 27 00          	movb   $0x0,0x27(%eax)
  103c02:	c7 c0 00 50 91 00    	mov    $0x915000,%eax
  103c08:	05 00 10 00 00       	add    $0x1000,%eax
  103c0d:	89 83 64 7e 00 00    	mov    %eax,0x7e64(%ebx)
  103c13:	66 c7 83 68 7e 00 00 	movw   $0x10,0x7e68(%ebx)
  103c1a:	10 00 
  103c1c:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103c22:	66 c7 40 28 eb 00    	movw   $0xeb,0x28(%eax)
  103c28:	8d 83 60 7e 00 00    	lea    0x7e60(%ebx),%eax
  103c2e:	89 c2                	mov    %eax,%edx
  103c30:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103c36:	66 89 50 2a          	mov    %dx,0x2a(%eax)
  103c3a:	8d 83 60 7e 00 00    	lea    0x7e60(%ebx),%eax
  103c40:	c1 e8 10             	shr    $0x10,%eax
  103c43:	89 c2                	mov    %eax,%edx
  103c45:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103c4b:	88 50 2c             	mov    %dl,0x2c(%eax)
  103c4e:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103c54:	0f b6 50 2d          	movzbl 0x2d(%eax),%edx
  103c58:	83 e2 f0             	and    $0xfffffff0,%edx
  103c5b:	83 ca 09             	or     $0x9,%edx
  103c5e:	88 50 2d             	mov    %dl,0x2d(%eax)
  103c61:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103c67:	0f b6 50 2d          	movzbl 0x2d(%eax),%edx
  103c6b:	83 ca 10             	or     $0x10,%edx
  103c6e:	88 50 2d             	mov    %dl,0x2d(%eax)
  103c71:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103c77:	0f b6 50 2d          	movzbl 0x2d(%eax),%edx
  103c7b:	83 e2 9f             	and    $0xffffff9f,%edx
  103c7e:	88 50 2d             	mov    %dl,0x2d(%eax)
  103c81:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103c87:	0f b6 50 2d          	movzbl 0x2d(%eax),%edx
  103c8b:	83 ca 80             	or     $0xffffff80,%edx
  103c8e:	88 50 2d             	mov    %dl,0x2d(%eax)
  103c91:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103c97:	0f b6 50 2e          	movzbl 0x2e(%eax),%edx
  103c9b:	83 e2 f0             	and    $0xfffffff0,%edx
  103c9e:	88 50 2e             	mov    %dl,0x2e(%eax)
  103ca1:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103ca7:	0f b6 50 2e          	movzbl 0x2e(%eax),%edx
  103cab:	83 e2 ef             	and    $0xffffffef,%edx
  103cae:	88 50 2e             	mov    %dl,0x2e(%eax)
  103cb1:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103cb7:	0f b6 50 2e          	movzbl 0x2e(%eax),%edx
  103cbb:	83 e2 df             	and    $0xffffffdf,%edx
  103cbe:	88 50 2e             	mov    %dl,0x2e(%eax)
  103cc1:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103cc7:	0f b6 50 2e          	movzbl 0x2e(%eax),%edx
  103ccb:	83 ca 40             	or     $0x40,%edx
  103cce:	88 50 2e             	mov    %dl,0x2e(%eax)
  103cd1:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103cd7:	0f b6 50 2e          	movzbl 0x2e(%eax),%edx
  103cdb:	83 e2 7f             	and    $0x7f,%edx
  103cde:	88 50 2e             	mov    %dl,0x2e(%eax)
  103ce1:	8d 83 60 7e 00 00    	lea    0x7e60(%ebx),%eax
  103ce7:	c1 e8 18             	shr    $0x18,%eax
  103cea:	89 c2                	mov    %eax,%edx
  103cec:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103cf2:	88 50 2f             	mov    %dl,0x2f(%eax)
  103cf5:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103cfb:	0f b6 50 2d          	movzbl 0x2d(%eax),%edx
  103cff:	83 e2 ef             	and    $0xffffffef,%edx
  103d02:	88 50 2d             	mov    %dl,0x2d(%eax)
  103d05:	66 c7 45 ee 2f 00    	movw   $0x2f,-0x12(%ebp)
  103d0b:	c7 c0 00 60 95 00    	mov    $0x956000,%eax
  103d11:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103d14:	0f 01 55 ee          	lgdtl  -0x12(%ebp)
  103d18:	b8 10 00 00 00       	mov    $0x10,%eax
  103d1d:	8e e8                	mov    %eax,%gs
  103d1f:	b8 10 00 00 00       	mov    $0x10,%eax
  103d24:	8e e0                	mov    %eax,%fs
  103d26:	b8 10 00 00 00       	mov    $0x10,%eax
  103d2b:	8e c0                	mov    %eax,%es
  103d2d:	b8 10 00 00 00       	mov    $0x10,%eax
  103d32:	8e d8                	mov    %eax,%ds
  103d34:	b8 10 00 00 00       	mov    $0x10,%eax
  103d39:	8e d0                	mov    %eax,%ss
  103d3b:	ea 42 3d 10 00 08 00 	ljmp   $0x8,$0x103d42
  103d42:	83 ec 0c             	sub    $0xc,%esp
  103d45:	6a 00                	push   $0x0
  103d47:	e8 7d 01 00 00       	call   103ec9 <lldt>
  103d4c:	83 c4 10             	add    $0x10,%esp
  103d4f:	83 ec 0c             	sub    $0xc,%esp
  103d52:	6a 28                	push   $0x28
  103d54:	e8 3c 03 00 00       	call   104095 <ltr>
  103d59:	83 c4 10             	add    $0x10,%esp
  103d5c:	c7 c0 10 d5 10 00    	mov    $0x10d510,%eax
  103d62:	0f 01 18             	lidtl  (%eax)
  103d65:	83 ec 08             	sub    $0x8,%esp
  103d68:	68 00 3b 00 00       	push   $0x3b00
  103d6d:	c7 c0 40 60 95 00    	mov    $0x956040,%eax
  103d73:	50                   	push   %eax
  103d74:	e8 fe f2 ff ff       	call   103077 <memzero>
  103d79:	83 c4 10             	add    $0x10,%esp
  103d7c:	83 ec 08             	sub    $0x8,%esp
  103d7f:	68 00 00 04 00       	push   $0x40000
  103d84:	c7 c0 00 60 91 00    	mov    $0x916000,%eax
  103d8a:	50                   	push   %eax
  103d8b:	e8 e7 f2 ff ff       	call   103077 <memzero>
  103d90:	83 c4 10             	add    $0x10,%esp
  103d93:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  103d9a:	e9 a3 00 00 00       	jmp    103e42 <seg_init+0x5b7>
  103d9f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103da2:	c1 e0 0c             	shl    $0xc,%eax
  103da5:	89 c2                	mov    %eax,%edx
  103da7:	c7 c0 00 60 91 00    	mov    $0x916000,%eax
  103dad:	01 d0                	add    %edx,%eax
  103daf:	8d 90 00 10 00 00    	lea    0x1000(%eax),%edx
  103db5:	c7 c1 40 60 95 00    	mov    $0x956040,%ecx
  103dbb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103dbe:	69 c0 ec 00 00 00    	imul   $0xec,%eax,%eax
  103dc4:	01 c8                	add    %ecx,%eax
  103dc6:	83 c0 04             	add    $0x4,%eax
  103dc9:	89 10                	mov    %edx,(%eax)
  103dcb:	c7 c2 40 60 95 00    	mov    $0x956040,%edx
  103dd1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103dd4:	69 c0 ec 00 00 00    	imul   $0xec,%eax,%eax
  103dda:	01 d0                	add    %edx,%eax
  103ddc:	83 c0 08             	add    $0x8,%eax
  103ddf:	66 c7 00 10 00       	movw   $0x10,(%eax)
  103de4:	c7 c2 40 60 95 00    	mov    $0x956040,%edx
  103dea:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103ded:	69 c0 ec 00 00 00    	imul   $0xec,%eax,%eax
  103df3:	01 d0                	add    %edx,%eax
  103df5:	83 c0 66             	add    $0x66,%eax
  103df8:	66 c7 00 68 00       	movw   $0x68,(%eax)
  103dfd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103e00:	69 c0 ec 00 00 00    	imul   $0xec,%eax,%eax
  103e06:	8d 50 60             	lea    0x60(%eax),%edx
  103e09:	c7 c0 40 60 95 00    	mov    $0x956040,%eax
  103e0f:	01 d0                	add    %edx,%eax
  103e11:	83 c0 08             	add    $0x8,%eax
  103e14:	83 ec 08             	sub    $0x8,%esp
  103e17:	68 80 00 00 00       	push   $0x80
  103e1c:	50                   	push   %eax
  103e1d:	e8 55 f2 ff ff       	call   103077 <memzero>
  103e22:	83 c4 10             	add    $0x10,%esp
  103e25:	c7 c2 40 60 95 00    	mov    $0x956040,%edx
  103e2b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103e2e:	69 c0 ec 00 00 00    	imul   $0xec,%eax,%eax
  103e34:	01 d0                	add    %edx,%eax
  103e36:	05 e8 00 00 00       	add    $0xe8,%eax
  103e3b:	c6 00 ff             	movb   $0xff,(%eax)
  103e3e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  103e42:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
  103e46:	0f 86 53 ff ff ff    	jbe    103d9f <seg_init+0x514>
  103e4c:	90                   	nop
  103e4d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  103e50:	c9                   	leave  
  103e51:	c3                   	ret    

00103e52 <max>:
  103e52:	55                   	push   %ebp
  103e53:	89 e5                	mov    %esp,%ebp
  103e55:	e8 ad c5 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  103e5a:	05 a6 81 00 00       	add    $0x81a6,%eax
  103e5f:	8b 45 08             	mov    0x8(%ebp),%eax
  103e62:	39 45 0c             	cmp    %eax,0xc(%ebp)
  103e65:	0f 43 45 0c          	cmovae 0xc(%ebp),%eax
  103e69:	5d                   	pop    %ebp
  103e6a:	c3                   	ret    

00103e6b <min>:
  103e6b:	55                   	push   %ebp
  103e6c:	89 e5                	mov    %esp,%ebp
  103e6e:	e8 94 c5 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  103e73:	05 8d 81 00 00       	add    $0x818d,%eax
  103e78:	8b 45 08             	mov    0x8(%ebp),%eax
  103e7b:	39 45 0c             	cmp    %eax,0xc(%ebp)
  103e7e:	0f 46 45 0c          	cmovbe 0xc(%ebp),%eax
  103e82:	5d                   	pop    %ebp
  103e83:	c3                   	ret    

00103e84 <rounddown>:
  103e84:	55                   	push   %ebp
  103e85:	89 e5                	mov    %esp,%ebp
  103e87:	e8 7b c5 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  103e8c:	05 74 81 00 00       	add    $0x8174,%eax
  103e91:	8b 45 08             	mov    0x8(%ebp),%eax
  103e94:	ba 00 00 00 00       	mov    $0x0,%edx
  103e99:	f7 75 0c             	divl   0xc(%ebp)
  103e9c:	8b 45 08             	mov    0x8(%ebp),%eax
  103e9f:	29 d0                	sub    %edx,%eax
  103ea1:	5d                   	pop    %ebp
  103ea2:	c3                   	ret    

00103ea3 <roundup>:
  103ea3:	55                   	push   %ebp
  103ea4:	89 e5                	mov    %esp,%ebp
  103ea6:	e8 5c c5 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  103eab:	05 55 81 00 00       	add    $0x8155,%eax
  103eb0:	8b 55 08             	mov    0x8(%ebp),%edx
  103eb3:	8b 45 0c             	mov    0xc(%ebp),%eax
  103eb6:	01 d0                	add    %edx,%eax
  103eb8:	83 e8 01             	sub    $0x1,%eax
  103ebb:	ff 75 0c             	pushl  0xc(%ebp)
  103ebe:	50                   	push   %eax
  103ebf:	e8 c0 ff ff ff       	call   103e84 <rounddown>
  103ec4:	83 c4 08             	add    $0x8,%esp
  103ec7:	c9                   	leave  
  103ec8:	c3                   	ret    

00103ec9 <lldt>:
  103ec9:	55                   	push   %ebp
  103eca:	89 e5                	mov    %esp,%ebp
  103ecc:	83 ec 04             	sub    $0x4,%esp
  103ecf:	e8 33 c5 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  103ed4:	05 2c 81 00 00       	add    $0x812c,%eax
  103ed9:	8b 45 08             	mov    0x8(%ebp),%eax
  103edc:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  103ee0:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
  103ee4:	0f 00 d0             	lldt   %ax
  103ee7:	90                   	nop
  103ee8:	c9                   	leave  
  103ee9:	c3                   	ret    

00103eea <cli>:
  103eea:	55                   	push   %ebp
  103eeb:	89 e5                	mov    %esp,%ebp
  103eed:	e8 15 c5 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  103ef2:	05 0e 81 00 00       	add    $0x810e,%eax
  103ef7:	fa                   	cli    
  103ef8:	90                   	nop
  103ef9:	5d                   	pop    %ebp
  103efa:	c3                   	ret    

00103efb <sti>:
  103efb:	55                   	push   %ebp
  103efc:	89 e5                	mov    %esp,%ebp
  103efe:	e8 04 c5 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  103f03:	05 fd 80 00 00       	add    $0x80fd,%eax
  103f08:	fb                   	sti    
  103f09:	90                   	nop
  103f0a:	90                   	nop
  103f0b:	5d                   	pop    %ebp
  103f0c:	c3                   	ret    

00103f0d <rdmsr>:
  103f0d:	55                   	push   %ebp
  103f0e:	89 e5                	mov    %esp,%ebp
  103f10:	83 ec 10             	sub    $0x10,%esp
  103f13:	e8 ef c4 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  103f18:	05 e8 80 00 00       	add    $0x80e8,%eax
  103f1d:	8b 45 08             	mov    0x8(%ebp),%eax
  103f20:	89 c1                	mov    %eax,%ecx
  103f22:	0f 32                	rdmsr  
  103f24:	89 45 f8             	mov    %eax,-0x8(%ebp)
  103f27:	89 55 fc             	mov    %edx,-0x4(%ebp)
  103f2a:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103f2d:	8b 55 fc             	mov    -0x4(%ebp),%edx
  103f30:	c9                   	leave  
  103f31:	c3                   	ret    

00103f32 <wrmsr>:
  103f32:	55                   	push   %ebp
  103f33:	89 e5                	mov    %esp,%ebp
  103f35:	83 ec 08             	sub    $0x8,%esp
  103f38:	e8 ca c4 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  103f3d:	05 c3 80 00 00       	add    $0x80c3,%eax
  103f42:	8b 45 0c             	mov    0xc(%ebp),%eax
  103f45:	89 45 f8             	mov    %eax,-0x8(%ebp)
  103f48:	8b 45 10             	mov    0x10(%ebp),%eax
  103f4b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  103f4e:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103f51:	8b 55 fc             	mov    -0x4(%ebp),%edx
  103f54:	8b 4d 08             	mov    0x8(%ebp),%ecx
  103f57:	0f 30                	wrmsr  
  103f59:	90                   	nop
  103f5a:	c9                   	leave  
  103f5b:	c3                   	ret    

00103f5c <halt>:
  103f5c:	55                   	push   %ebp
  103f5d:	89 e5                	mov    %esp,%ebp
  103f5f:	e8 a3 c4 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  103f64:	05 9c 80 00 00       	add    $0x809c,%eax
  103f69:	f4                   	hlt    
  103f6a:	90                   	nop
  103f6b:	5d                   	pop    %ebp
  103f6c:	c3                   	ret    

00103f6d <rdtsc>:
  103f6d:	55                   	push   %ebp
  103f6e:	89 e5                	mov    %esp,%ebp
  103f70:	83 ec 10             	sub    $0x10,%esp
  103f73:	e8 8f c4 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  103f78:	05 88 80 00 00       	add    $0x8088,%eax
  103f7d:	0f 31                	rdtsc  
  103f7f:	89 45 f8             	mov    %eax,-0x8(%ebp)
  103f82:	89 55 fc             	mov    %edx,-0x4(%ebp)
  103f85:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103f88:	8b 55 fc             	mov    -0x4(%ebp),%edx
  103f8b:	c9                   	leave  
  103f8c:	c3                   	ret    

00103f8d <enable_sse>:
  103f8d:	55                   	push   %ebp
  103f8e:	89 e5                	mov    %esp,%ebp
  103f90:	83 ec 20             	sub    $0x20,%esp
  103f93:	e8 6f c4 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  103f98:	05 68 80 00 00       	add    $0x8068,%eax
  103f9d:	0f 20 e0             	mov    %cr4,%eax
  103fa0:	89 45 ec             	mov    %eax,-0x14(%ebp)
  103fa3:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103fa6:	80 cc 06             	or     $0x6,%ah
  103fa9:	89 45 fc             	mov    %eax,-0x4(%ebp)
  103fac:	0f ae f0             	mfence 
  103faf:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103fb2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103fb5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103fb8:	0f 22 e0             	mov    %eax,%cr4
  103fbb:	0f 20 c0             	mov    %cr0,%eax
  103fbe:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103fc1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103fc4:	83 c8 02             	or     $0x2,%eax
  103fc7:	89 45 f8             	mov    %eax,-0x8(%ebp)
  103fca:	0f ae f0             	mfence 
  103fcd:	83 65 f8 f3          	andl   $0xfffffff3,-0x8(%ebp)
  103fd1:	90                   	nop
  103fd2:	c9                   	leave  
  103fd3:	c3                   	ret    

00103fd4 <cpuid>:
  103fd4:	55                   	push   %ebp
  103fd5:	89 e5                	mov    %esp,%ebp
  103fd7:	53                   	push   %ebx
  103fd8:	83 ec 10             	sub    $0x10,%esp
  103fdb:	e8 27 c4 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  103fe0:	05 20 80 00 00       	add    $0x8020,%eax
  103fe5:	8b 45 08             	mov    0x8(%ebp),%eax
  103fe8:	0f a2                	cpuid  
  103fea:	89 45 f8             	mov    %eax,-0x8(%ebp)
  103fed:	89 5d f4             	mov    %ebx,-0xc(%ebp)
  103ff0:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  103ff3:	89 55 ec             	mov    %edx,-0x14(%ebp)
  103ff6:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  103ffa:	74 08                	je     104004 <cpuid+0x30>
  103ffc:	8b 45 0c             	mov    0xc(%ebp),%eax
  103fff:	8b 55 f8             	mov    -0x8(%ebp),%edx
  104002:	89 10                	mov    %edx,(%eax)
  104004:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  104008:	74 08                	je     104012 <cpuid+0x3e>
  10400a:	8b 45 10             	mov    0x10(%ebp),%eax
  10400d:	8b 55 f4             	mov    -0xc(%ebp),%edx
  104010:	89 10                	mov    %edx,(%eax)
  104012:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
  104016:	74 08                	je     104020 <cpuid+0x4c>
  104018:	8b 45 14             	mov    0x14(%ebp),%eax
  10401b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10401e:	89 10                	mov    %edx,(%eax)
  104020:	83 7d 18 00          	cmpl   $0x0,0x18(%ebp)
  104024:	74 08                	je     10402e <cpuid+0x5a>
  104026:	8b 45 18             	mov    0x18(%ebp),%eax
  104029:	8b 55 ec             	mov    -0x14(%ebp),%edx
  10402c:	89 10                	mov    %edx,(%eax)
  10402e:	90                   	nop
  10402f:	83 c4 10             	add    $0x10,%esp
  104032:	5b                   	pop    %ebx
  104033:	5d                   	pop    %ebp
  104034:	c3                   	ret    

00104035 <rcr3>:
  104035:	55                   	push   %ebp
  104036:	89 e5                	mov    %esp,%ebp
  104038:	83 ec 10             	sub    $0x10,%esp
  10403b:	e8 c7 c3 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  104040:	05 c0 7f 00 00       	add    $0x7fc0,%eax
  104045:	0f 20 d8             	mov    %cr3,%eax
  104048:	89 45 fc             	mov    %eax,-0x4(%ebp)
  10404b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10404e:	c9                   	leave  
  10404f:	c3                   	ret    

00104050 <outl>:
  104050:	55                   	push   %ebp
  104051:	89 e5                	mov    %esp,%ebp
  104053:	e8 af c3 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  104058:	05 a8 7f 00 00       	add    $0x7fa8,%eax
  10405d:	8b 45 0c             	mov    0xc(%ebp),%eax
  104060:	8b 55 08             	mov    0x8(%ebp),%edx
  104063:	ef                   	out    %eax,(%dx)
  104064:	90                   	nop
  104065:	5d                   	pop    %ebp
  104066:	c3                   	ret    

00104067 <inl>:
  104067:	55                   	push   %ebp
  104068:	89 e5                	mov    %esp,%ebp
  10406a:	83 ec 10             	sub    $0x10,%esp
  10406d:	e8 95 c3 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  104072:	05 8e 7f 00 00       	add    $0x7f8e,%eax
  104077:	8b 45 08             	mov    0x8(%ebp),%eax
  10407a:	89 c2                	mov    %eax,%edx
  10407c:	ed                   	in     (%dx),%eax
  10407d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  104080:	8b 45 fc             	mov    -0x4(%ebp),%eax
  104083:	c9                   	leave  
  104084:	c3                   	ret    

00104085 <smp_wmb>:
  104085:	55                   	push   %ebp
  104086:	89 e5                	mov    %esp,%ebp
  104088:	e8 7a c3 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  10408d:	05 73 7f 00 00       	add    $0x7f73,%eax
  104092:	90                   	nop
  104093:	5d                   	pop    %ebp
  104094:	c3                   	ret    

00104095 <ltr>:
  104095:	55                   	push   %ebp
  104096:	89 e5                	mov    %esp,%ebp
  104098:	83 ec 04             	sub    $0x4,%esp
  10409b:	e8 67 c3 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  1040a0:	05 60 7f 00 00       	add    $0x7f60,%eax
  1040a5:	8b 45 08             	mov    0x8(%ebp),%eax
  1040a8:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  1040ac:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
  1040b0:	0f 00 d8             	ltr    %ax
  1040b3:	90                   	nop
  1040b4:	c9                   	leave  
  1040b5:	c3                   	ret    

001040b6 <lcr0>:
  1040b6:	55                   	push   %ebp
  1040b7:	89 e5                	mov    %esp,%ebp
  1040b9:	e8 49 c3 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  1040be:	05 42 7f 00 00       	add    $0x7f42,%eax
  1040c3:	8b 45 08             	mov    0x8(%ebp),%eax
  1040c6:	0f 22 c0             	mov    %eax,%cr0
  1040c9:	90                   	nop
  1040ca:	5d                   	pop    %ebp
  1040cb:	c3                   	ret    

001040cc <rcr0>:
  1040cc:	55                   	push   %ebp
  1040cd:	89 e5                	mov    %esp,%ebp
  1040cf:	83 ec 10             	sub    $0x10,%esp
  1040d2:	e8 30 c3 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  1040d7:	05 29 7f 00 00       	add    $0x7f29,%eax
  1040dc:	0f 20 c0             	mov    %cr0,%eax
  1040df:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1040e2:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1040e5:	c9                   	leave  
  1040e6:	c3                   	ret    

001040e7 <rcr2>:
  1040e7:	55                   	push   %ebp
  1040e8:	89 e5                	mov    %esp,%ebp
  1040ea:	83 ec 10             	sub    $0x10,%esp
  1040ed:	e8 15 c3 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  1040f2:	05 0e 7f 00 00       	add    $0x7f0e,%eax
  1040f7:	0f 20 d0             	mov    %cr2,%eax
  1040fa:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1040fd:	8b 45 fc             	mov    -0x4(%ebp),%eax
  104100:	c9                   	leave  
  104101:	c3                   	ret    

00104102 <lcr3>:
  104102:	55                   	push   %ebp
  104103:	89 e5                	mov    %esp,%ebp
  104105:	e8 fd c2 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  10410a:	05 f6 7e 00 00       	add    $0x7ef6,%eax
  10410f:	8b 45 08             	mov    0x8(%ebp),%eax
  104112:	0f 22 d8             	mov    %eax,%cr3
  104115:	90                   	nop
  104116:	5d                   	pop    %ebp
  104117:	c3                   	ret    

00104118 <lcr4>:
  104118:	55                   	push   %ebp
  104119:	89 e5                	mov    %esp,%ebp
  10411b:	e8 e7 c2 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  104120:	05 e0 7e 00 00       	add    $0x7ee0,%eax
  104125:	8b 45 08             	mov    0x8(%ebp),%eax
  104128:	0f 22 e0             	mov    %eax,%cr4
  10412b:	90                   	nop
  10412c:	5d                   	pop    %ebp
  10412d:	c3                   	ret    

0010412e <rcr4>:
  10412e:	55                   	push   %ebp
  10412f:	89 e5                	mov    %esp,%ebp
  104131:	83 ec 10             	sub    $0x10,%esp
  104134:	e8 ce c2 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  104139:	05 c7 7e 00 00       	add    $0x7ec7,%eax
  10413e:	0f 20 e0             	mov    %cr4,%eax
  104141:	89 45 fc             	mov    %eax,-0x4(%ebp)
  104144:	8b 45 fc             	mov    -0x4(%ebp),%eax
  104147:	c9                   	leave  
  104148:	c3                   	ret    

00104149 <inb>:
  104149:	55                   	push   %ebp
  10414a:	89 e5                	mov    %esp,%ebp
  10414c:	83 ec 10             	sub    $0x10,%esp
  10414f:	e8 b3 c2 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  104154:	05 ac 7e 00 00       	add    $0x7eac,%eax
  104159:	8b 45 08             	mov    0x8(%ebp),%eax
  10415c:	89 c2                	mov    %eax,%edx
  10415e:	ec                   	in     (%dx),%al
  10415f:	88 45 ff             	mov    %al,-0x1(%ebp)
  104162:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  104166:	c9                   	leave  
  104167:	c3                   	ret    

00104168 <insl>:
  104168:	55                   	push   %ebp
  104169:	89 e5                	mov    %esp,%ebp
  10416b:	57                   	push   %edi
  10416c:	53                   	push   %ebx
  10416d:	e8 95 c2 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  104172:	05 8e 7e 00 00       	add    $0x7e8e,%eax
  104177:	8b 55 08             	mov    0x8(%ebp),%edx
  10417a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  10417d:	8b 45 10             	mov    0x10(%ebp),%eax
  104180:	89 cb                	mov    %ecx,%ebx
  104182:	89 df                	mov    %ebx,%edi
  104184:	89 c1                	mov    %eax,%ecx
  104186:	fc                   	cld    
  104187:	f2 6d                	repnz insl (%dx),%es:(%edi)
  104189:	89 c8                	mov    %ecx,%eax
  10418b:	89 fb                	mov    %edi,%ebx
  10418d:	89 5d 0c             	mov    %ebx,0xc(%ebp)
  104190:	89 45 10             	mov    %eax,0x10(%ebp)
  104193:	90                   	nop
  104194:	5b                   	pop    %ebx
  104195:	5f                   	pop    %edi
  104196:	5d                   	pop    %ebp
  104197:	c3                   	ret    

00104198 <outb>:
  104198:	55                   	push   %ebp
  104199:	89 e5                	mov    %esp,%ebp
  10419b:	83 ec 04             	sub    $0x4,%esp
  10419e:	e8 64 c2 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  1041a3:	05 5d 7e 00 00       	add    $0x7e5d,%eax
  1041a8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1041ab:	88 45 fc             	mov    %al,-0x4(%ebp)
  1041ae:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
  1041b2:	8b 55 08             	mov    0x8(%ebp),%edx
  1041b5:	ee                   	out    %al,(%dx)
  1041b6:	90                   	nop
  1041b7:	c9                   	leave  
  1041b8:	c3                   	ret    

001041b9 <outsw>:
  1041b9:	55                   	push   %ebp
  1041ba:	89 e5                	mov    %esp,%ebp
  1041bc:	56                   	push   %esi
  1041bd:	53                   	push   %ebx
  1041be:	e8 44 c2 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  1041c3:	05 3d 7e 00 00       	add    $0x7e3d,%eax
  1041c8:	8b 55 08             	mov    0x8(%ebp),%edx
  1041cb:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  1041ce:	8b 45 10             	mov    0x10(%ebp),%eax
  1041d1:	89 cb                	mov    %ecx,%ebx
  1041d3:	89 de                	mov    %ebx,%esi
  1041d5:	89 c1                	mov    %eax,%ecx
  1041d7:	fc                   	cld    
  1041d8:	f2 66 6f             	repnz outsw %ds:(%esi),(%dx)
  1041db:	89 c8                	mov    %ecx,%eax
  1041dd:	89 f3                	mov    %esi,%ebx
  1041df:	89 5d 0c             	mov    %ebx,0xc(%ebp)
  1041e2:	89 45 10             	mov    %eax,0x10(%ebp)
  1041e5:	90                   	nop
  1041e6:	5b                   	pop    %ebx
  1041e7:	5e                   	pop    %esi
  1041e8:	5d                   	pop    %ebp
  1041e9:	c3                   	ret    

001041ea <mon_start_user>:
  1041ea:	55                   	push   %ebp
  1041eb:	89 e5                	mov    %esp,%ebp
  1041ed:	53                   	push   %ebx
  1041ee:	83 ec 14             	sub    $0x14,%esp
  1041f1:	e8 19 c2 ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  1041f6:	81 c3 0a 7e 00 00    	add    $0x7e0a,%ebx
  1041fc:	8b 83 4c 7f 00 00    	mov    0x7f4c(%ebx),%eax
  104202:	85 c0                	test   %eax,%eax
  104204:	74 19                	je     10421f <mon_start_user+0x35>
  104206:	83 ec 0c             	sub    $0xc,%esp
  104209:	8d 83 48 b6 ff ff    	lea    -0x49b8(%ebx),%eax
  10420f:	50                   	push   %eax
  104210:	e8 83 f1 ff ff       	call   103398 <dprintf>
  104215:	83 c4 10             	add    $0x10,%esp
  104218:	b8 00 00 00 00       	mov    $0x0,%eax
  10421d:	eb 63                	jmp    104282 <mon_start_user+0x98>
  10421f:	c7 c0 00 f0 10 00    	mov    $0x10f000,%eax
  104225:	89 45 f4             	mov    %eax,-0xc(%ebp)
  104228:	83 ec 08             	sub    $0x8,%esp
  10422b:	68 00 00 10 00       	push   $0x100000
  104230:	6a 00                	push   $0x0
  104232:	e8 e9 2b 00 00       	call   106e20 <alloc_mem_quota>
  104237:	83 c4 10             	add    $0x10,%esp
  10423a:	89 83 4c 7f 00 00    	mov    %eax,0x7f4c(%ebx)
  104240:	8b 83 4c 7f 00 00    	mov    0x7f4c(%ebx),%eax
  104246:	83 ec 08             	sub    $0x8,%esp
  104249:	50                   	push   %eax
  10424a:	ff 75 f4             	pushl  -0xc(%ebp)
  10424d:	e8 a8 06 00 00       	call   1048fa <elf_load>
  104252:	83 c4 10             	add    $0x10,%esp
  104255:	8b 83 4c 7f 00 00    	mov    0x7f4c(%ebx),%eax
  10425b:	83 ec 0c             	sub    $0xc,%esp
  10425e:	50                   	push   %eax
  10425f:	e8 ac 1d 00 00       	call   106010 <set_pdir_base>
  104264:	83 c4 10             	add    $0x10,%esp
  104267:	83 ec 0c             	sub    $0xc,%esp
  10426a:	ff 75 f4             	pushl  -0xc(%ebp)
  10426d:	e8 4c 09 00 00       	call   104bbe <elf_entry>
  104272:	83 c4 10             	add    $0x10,%esp
  104275:	89 45 f0             	mov    %eax,-0x10(%ebp)
  104278:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10427b:	ff d0                	call   *%eax
  10427d:	b8 00 00 00 00       	mov    $0x0,%eax
  104282:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  104285:	c9                   	leave  
  104286:	c3                   	ret    

00104287 <mon_help>:
  104287:	55                   	push   %ebp
  104288:	89 e5                	mov    %esp,%ebp
  10428a:	56                   	push   %esi
  10428b:	53                   	push   %ebx
  10428c:	83 ec 10             	sub    $0x10,%esp
  10428f:	e8 7b c1 ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  104294:	81 c3 6c 7d 00 00    	add    $0x7d6c,%ebx
  10429a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1042a1:	eb 44                	jmp    1042e7 <mon_help+0x60>
  1042a3:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1042a6:	8d 8b 24 15 00 00    	lea    0x1524(%ebx),%ecx
  1042ac:	89 d0                	mov    %edx,%eax
  1042ae:	01 c0                	add    %eax,%eax
  1042b0:	01 d0                	add    %edx,%eax
  1042b2:	c1 e0 02             	shl    $0x2,%eax
  1042b5:	01 c8                	add    %ecx,%eax
  1042b7:	8b 08                	mov    (%eax),%ecx
  1042b9:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1042bc:	8d b3 20 15 00 00    	lea    0x1520(%ebx),%esi
  1042c2:	89 d0                	mov    %edx,%eax
  1042c4:	01 c0                	add    %eax,%eax
  1042c6:	01 d0                	add    %edx,%eax
  1042c8:	c1 e0 02             	shl    $0x2,%eax
  1042cb:	01 f0                	add    %esi,%eax
  1042cd:	8b 00                	mov    (%eax),%eax
  1042cf:	83 ec 04             	sub    $0x4,%esp
  1042d2:	51                   	push   %ecx
  1042d3:	50                   	push   %eax
  1042d4:	8d 83 a4 b6 ff ff    	lea    -0x495c(%ebx),%eax
  1042da:	50                   	push   %eax
  1042db:	e8 b8 f0 ff ff       	call   103398 <dprintf>
  1042e0:	83 c4 10             	add    $0x10,%esp
  1042e3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1042e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1042ea:	83 f8 02             	cmp    $0x2,%eax
  1042ed:	76 b4                	jbe    1042a3 <mon_help+0x1c>
  1042ef:	b8 00 00 00 00       	mov    $0x0,%eax
  1042f4:	8d 65 f8             	lea    -0x8(%ebp),%esp
  1042f7:	5b                   	pop    %ebx
  1042f8:	5e                   	pop    %esi
  1042f9:	5d                   	pop    %ebp
  1042fa:	c3                   	ret    

001042fb <mon_kerninfo>:
  1042fb:	55                   	push   %ebp
  1042fc:	89 e5                	mov    %esp,%ebp
  1042fe:	53                   	push   %ebx
  1042ff:	83 ec 14             	sub    $0x14,%esp
  104302:	e8 08 c1 ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  104307:	81 c3 f9 7c 00 00    	add    $0x7cf9,%ebx
  10430d:	83 ec 0c             	sub    $0xc,%esp
  104310:	8d 83 ad b6 ff ff    	lea    -0x4953(%ebx),%eax
  104316:	50                   	push   %eax
  104317:	e8 7c f0 ff ff       	call   103398 <dprintf>
  10431c:	83 c4 10             	add    $0x10,%esp
  10431f:	83 ec 08             	sub    $0x8,%esp
  104322:	c7 c0 74 53 10 00    	mov    $0x105374,%eax
  104328:	50                   	push   %eax
  104329:	8d 83 c6 b6 ff ff    	lea    -0x493a(%ebx),%eax
  10432f:	50                   	push   %eax
  104330:	e8 63 f0 ff ff       	call   103398 <dprintf>
  104335:	83 c4 10             	add    $0x10,%esp
  104338:	83 ec 08             	sub    $0x8,%esp
  10433b:	c7 c0 f1 72 10 00    	mov    $0x1072f1,%eax
  104341:	50                   	push   %eax
  104342:	8d 83 d5 b6 ff ff    	lea    -0x492b(%ebx),%eax
  104348:	50                   	push   %eax
  104349:	e8 4a f0 ff ff       	call   103398 <dprintf>
  10434e:	83 c4 10             	add    $0x10,%esp
  104351:	83 ec 08             	sub    $0x8,%esp
  104354:	c7 c0 68 29 11 00    	mov    $0x112968,%eax
  10435a:	50                   	push   %eax
  10435b:	8d 83 e4 b6 ff ff    	lea    -0x491c(%ebx),%eax
  104361:	50                   	push   %eax
  104362:	e8 31 f0 ff ff       	call   103398 <dprintf>
  104367:	83 c4 10             	add    $0x10,%esp
  10436a:	83 ec 08             	sub    $0x8,%esp
  10436d:	c7 c0 00 a0 d9 00    	mov    $0xd9a000,%eax
  104373:	50                   	push   %eax
  104374:	8d 83 f3 b6 ff ff    	lea    -0x490d(%ebx),%eax
  10437a:	50                   	push   %eax
  10437b:	e8 18 f0 ff ff       	call   103398 <dprintf>
  104380:	83 c4 10             	add    $0x10,%esp
  104383:	c7 c0 00 a0 d9 00    	mov    $0xd9a000,%eax
  104389:	89 c2                	mov    %eax,%edx
  10438b:	c7 c0 74 53 10 00    	mov    $0x105374,%eax
  104391:	29 c2                	sub    %eax,%edx
  104393:	89 d0                	mov    %edx,%eax
  104395:	89 45 f4             	mov    %eax,-0xc(%ebp)
  104398:	c7 45 f0 00 04 00 00 	movl   $0x400,-0x10(%ebp)
  10439f:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1043a2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1043a5:	01 d0                	add    %edx,%eax
  1043a7:	83 e8 01             	sub    $0x1,%eax
  1043aa:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1043ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1043b0:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1043b3:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1043b6:	99                   	cltd   
  1043b7:	f7 7d e8             	idivl  -0x18(%ebp)
  1043ba:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1043bd:	29 d0                	sub    %edx,%eax
  1043bf:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  1043c5:	85 c0                	test   %eax,%eax
  1043c7:	0f 48 c2             	cmovs  %edx,%eax
  1043ca:	c1 f8 0a             	sar    $0xa,%eax
  1043cd:	83 ec 08             	sub    $0x8,%esp
  1043d0:	50                   	push   %eax
  1043d1:	8d 83 04 b7 ff ff    	lea    -0x48fc(%ebx),%eax
  1043d7:	50                   	push   %eax
  1043d8:	e8 bb ef ff ff       	call   103398 <dprintf>
  1043dd:	83 c4 10             	add    $0x10,%esp
  1043e0:	b8 00 00 00 00       	mov    $0x0,%eax
  1043e5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1043e8:	c9                   	leave  
  1043e9:	c3                   	ret    

001043ea <mon_backtrace>:
  1043ea:	55                   	push   %ebp
  1043eb:	89 e5                	mov    %esp,%ebp
  1043ed:	e8 15 c0 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  1043f2:	05 0e 7c 00 00       	add    $0x7c0e,%eax
  1043f7:	b8 00 00 00 00       	mov    $0x0,%eax
  1043fc:	5d                   	pop    %ebp
  1043fd:	c3                   	ret    

001043fe <runcmd>:
  1043fe:	55                   	push   %ebp
  1043ff:	89 e5                	mov    %esp,%ebp
  104401:	53                   	push   %ebx
  104402:	83 ec 54             	sub    $0x54,%esp
  104405:	e8 05 c0 ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  10440a:	81 c3 f6 7b 00 00    	add    $0x7bf6,%ebx
  104410:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  104417:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10441a:	c7 44 85 b0 00 00 00 	movl   $0x0,-0x50(%ebp,%eax,4)
  104421:	00 
  104422:	eb 0c                	jmp    104430 <runcmd+0x32>
  104424:	8b 45 08             	mov    0x8(%ebp),%eax
  104427:	8d 50 01             	lea    0x1(%eax),%edx
  10442a:	89 55 08             	mov    %edx,0x8(%ebp)
  10442d:	c6 00 00             	movb   $0x0,(%eax)
  104430:	8b 45 08             	mov    0x8(%ebp),%eax
  104433:	0f b6 00             	movzbl (%eax),%eax
  104436:	84 c0                	test   %al,%al
  104438:	74 20                	je     10445a <runcmd+0x5c>
  10443a:	8b 45 08             	mov    0x8(%ebp),%eax
  10443d:	0f b6 00             	movzbl (%eax),%eax
  104440:	0f be c0             	movsbl %al,%eax
  104443:	83 ec 08             	sub    $0x8,%esp
  104446:	50                   	push   %eax
  104447:	8d 83 2e b7 ff ff    	lea    -0x48d2(%ebx),%eax
  10444d:	50                   	push   %eax
  10444e:	e8 e7 eb ff ff       	call   10303a <strchr>
  104453:	83 c4 10             	add    $0x10,%esp
  104456:	85 c0                	test   %eax,%eax
  104458:	75 ca                	jne    104424 <runcmd+0x26>
  10445a:	8b 45 08             	mov    0x8(%ebp),%eax
  10445d:	0f b6 00             	movzbl (%eax),%eax
  104460:	84 c0                	test   %al,%al
  104462:	74 6d                	je     1044d1 <runcmd+0xd3>
  104464:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  104468:	75 1e                	jne    104488 <runcmd+0x8a>
  10446a:	83 ec 08             	sub    $0x8,%esp
  10446d:	6a 10                	push   $0x10
  10446f:	8d 83 33 b7 ff ff    	lea    -0x48cd(%ebx),%eax
  104475:	50                   	push   %eax
  104476:	e8 1d ef ff ff       	call   103398 <dprintf>
  10447b:	83 c4 10             	add    $0x10,%esp
  10447e:	b8 00 00 00 00       	mov    $0x0,%eax
  104483:	e9 e9 00 00 00       	jmp    104571 <runcmd+0x173>
  104488:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10448b:	8d 50 01             	lea    0x1(%eax),%edx
  10448e:	89 55 f4             	mov    %edx,-0xc(%ebp)
  104491:	8b 55 08             	mov    0x8(%ebp),%edx
  104494:	89 54 85 b0          	mov    %edx,-0x50(%ebp,%eax,4)
  104498:	eb 04                	jmp    10449e <runcmd+0xa0>
  10449a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  10449e:	8b 45 08             	mov    0x8(%ebp),%eax
  1044a1:	0f b6 00             	movzbl (%eax),%eax
  1044a4:	84 c0                	test   %al,%al
  1044a6:	0f 84 76 ff ff ff    	je     104422 <runcmd+0x24>
  1044ac:	8b 45 08             	mov    0x8(%ebp),%eax
  1044af:	0f b6 00             	movzbl (%eax),%eax
  1044b2:	0f be c0             	movsbl %al,%eax
  1044b5:	83 ec 08             	sub    $0x8,%esp
  1044b8:	50                   	push   %eax
  1044b9:	8d 83 2e b7 ff ff    	lea    -0x48d2(%ebx),%eax
  1044bf:	50                   	push   %eax
  1044c0:	e8 75 eb ff ff       	call   10303a <strchr>
  1044c5:	83 c4 10             	add    $0x10,%esp
  1044c8:	85 c0                	test   %eax,%eax
  1044ca:	74 ce                	je     10449a <runcmd+0x9c>
  1044cc:	e9 51 ff ff ff       	jmp    104422 <runcmd+0x24>
  1044d1:	90                   	nop
  1044d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1044d5:	c7 44 85 b0 00 00 00 	movl   $0x0,-0x50(%ebp,%eax,4)
  1044dc:	00 
  1044dd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1044e1:	75 0a                	jne    1044ed <runcmd+0xef>
  1044e3:	b8 00 00 00 00       	mov    $0x0,%eax
  1044e8:	e9 84 00 00 00       	jmp    104571 <runcmd+0x173>
  1044ed:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  1044f4:	eb 58                	jmp    10454e <runcmd+0x150>
  1044f6:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1044f9:	8d 8b 20 15 00 00    	lea    0x1520(%ebx),%ecx
  1044ff:	89 d0                	mov    %edx,%eax
  104501:	01 c0                	add    %eax,%eax
  104503:	01 d0                	add    %edx,%eax
  104505:	c1 e0 02             	shl    $0x2,%eax
  104508:	01 c8                	add    %ecx,%eax
  10450a:	8b 10                	mov    (%eax),%edx
  10450c:	8b 45 b0             	mov    -0x50(%ebp),%eax
  10450f:	83 ec 08             	sub    $0x8,%esp
  104512:	52                   	push   %edx
  104513:	50                   	push   %eax
  104514:	e8 d8 ea ff ff       	call   102ff1 <strcmp>
  104519:	83 c4 10             	add    $0x10,%esp
  10451c:	85 c0                	test   %eax,%eax
  10451e:	75 2a                	jne    10454a <runcmd+0x14c>
  104520:	8b 55 f0             	mov    -0x10(%ebp),%edx
  104523:	8d 8b 28 15 00 00    	lea    0x1528(%ebx),%ecx
  104529:	89 d0                	mov    %edx,%eax
  10452b:	01 c0                	add    %eax,%eax
  10452d:	01 d0                	add    %edx,%eax
  10452f:	c1 e0 02             	shl    $0x2,%eax
  104532:	01 c8                	add    %ecx,%eax
  104534:	8b 00                	mov    (%eax),%eax
  104536:	83 ec 04             	sub    $0x4,%esp
  104539:	ff 75 0c             	pushl  0xc(%ebp)
  10453c:	8d 55 b0             	lea    -0x50(%ebp),%edx
  10453f:	52                   	push   %edx
  104540:	ff 75 f4             	pushl  -0xc(%ebp)
  104543:	ff d0                	call   *%eax
  104545:	83 c4 10             	add    $0x10,%esp
  104548:	eb 27                	jmp    104571 <runcmd+0x173>
  10454a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  10454e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  104551:	83 f8 02             	cmp    $0x2,%eax
  104554:	76 a0                	jbe    1044f6 <runcmd+0xf8>
  104556:	8b 45 b0             	mov    -0x50(%ebp),%eax
  104559:	83 ec 08             	sub    $0x8,%esp
  10455c:	50                   	push   %eax
  10455d:	8d 83 50 b7 ff ff    	lea    -0x48b0(%ebx),%eax
  104563:	50                   	push   %eax
  104564:	e8 2f ee ff ff       	call   103398 <dprintf>
  104569:	83 c4 10             	add    $0x10,%esp
  10456c:	b8 00 00 00 00       	mov    $0x0,%eax
  104571:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  104574:	c9                   	leave  
  104575:	c3                   	ret    

00104576 <monitor>:
  104576:	55                   	push   %ebp
  104577:	89 e5                	mov    %esp,%ebp
  104579:	53                   	push   %ebx
  10457a:	83 ec 14             	sub    $0x14,%esp
  10457d:	e8 8d be ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  104582:	81 c3 7e 7a 00 00    	add    $0x7a7e,%ebx
  104588:	83 ec 0c             	sub    $0xc,%esp
  10458b:	8d 83 68 b7 ff ff    	lea    -0x4898(%ebx),%eax
  104591:	50                   	push   %eax
  104592:	e8 01 ee ff ff       	call   103398 <dprintf>
  104597:	83 c4 10             	add    $0x10,%esp
  10459a:	83 ec 0c             	sub    $0xc,%esp
  10459d:	8d 83 94 b7 ff ff    	lea    -0x486c(%ebx),%eax
  1045a3:	50                   	push   %eax
  1045a4:	e8 ef ed ff ff       	call   103398 <dprintf>
  1045a9:	83 c4 10             	add    $0x10,%esp
  1045ac:	83 ec 0c             	sub    $0xc,%esp
  1045af:	8d 83 68 b7 ff ff    	lea    -0x4898(%ebx),%eax
  1045b5:	50                   	push   %eax
  1045b6:	e8 dd ed ff ff       	call   103398 <dprintf>
  1045bb:	83 c4 10             	add    $0x10,%esp
  1045be:	83 ec 0c             	sub    $0xc,%esp
  1045c1:	8d 83 c0 b7 ff ff    	lea    -0x4840(%ebx),%eax
  1045c7:	50                   	push   %eax
  1045c8:	e8 cb ed ff ff       	call   103398 <dprintf>
  1045cd:	83 c4 10             	add    $0x10,%esp
  1045d0:	83 ec 0c             	sub    $0xc,%esp
  1045d3:	8d 83 e5 b7 ff ff    	lea    -0x481b(%ebx),%eax
  1045d9:	50                   	push   %eax
  1045da:	e8 0d c0 ff ff       	call   1005ec <readline>
  1045df:	83 c4 10             	add    $0x10,%esp
  1045e2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1045e5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1045e9:	74 e5                	je     1045d0 <monitor+0x5a>
  1045eb:	83 ec 08             	sub    $0x8,%esp
  1045ee:	ff 75 08             	pushl  0x8(%ebp)
  1045f1:	ff 75 f4             	pushl  -0xc(%ebp)
  1045f4:	e8 05 fe ff ff       	call   1043fe <runcmd>
  1045f9:	83 c4 10             	add    $0x10,%esp
  1045fc:	85 c0                	test   %eax,%eax
  1045fe:	78 02                	js     104602 <monitor+0x8c>
  104600:	eb ce                	jmp    1045d0 <monitor+0x5a>
  104602:	90                   	nop
  104603:	90                   	nop
  104604:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  104607:	c9                   	leave  
  104608:	c3                   	ret    

00104609 <pt_copyin>:
  104609:	55                   	push   %ebp
  10460a:	89 e5                	mov    %esp,%ebp
  10460c:	53                   	push   %ebx
  10460d:	83 ec 14             	sub    $0x14,%esp
  104610:	e8 fa bd ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  104615:	81 c3 eb 79 00 00    	add    $0x79eb,%ebx
  10461b:	81 7d 0c ff ff ff 3f 	cmpl   $0x3fffffff,0xc(%ebp)
  104622:	76 0f                	jbe    104633 <pt_copyin+0x2a>
  104624:	8b 55 0c             	mov    0xc(%ebp),%edx
  104627:	8b 45 14             	mov    0x14(%ebp),%eax
  10462a:	01 d0                	add    %edx,%eax
  10462c:	3d 00 00 00 f0       	cmp    $0xf0000000,%eax
  104631:	76 0a                	jbe    10463d <pt_copyin+0x34>
  104633:	b8 00 00 00 00       	mov    $0x0,%eax
  104638:	e9 d5 00 00 00       	jmp    104712 <pt_copyin+0x109>
  10463d:	8b 55 10             	mov    0x10(%ebp),%edx
  104640:	8b 45 14             	mov    0x14(%ebp),%eax
  104643:	01 d0                	add    %edx,%eax
  104645:	3d 00 00 00 f0       	cmp    $0xf0000000,%eax
  10464a:	76 0a                	jbe    104656 <pt_copyin+0x4d>
  10464c:	b8 00 00 00 00       	mov    $0x0,%eax
  104651:	e9 bc 00 00 00       	jmp    104712 <pt_copyin+0x109>
  104656:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  10465d:	e9 a3 00 00 00       	jmp    104705 <pt_copyin+0xfc>
  104662:	83 ec 08             	sub    $0x8,%esp
  104665:	ff 75 0c             	pushl  0xc(%ebp)
  104668:	ff 75 08             	pushl  0x8(%ebp)
  10466b:	e8 10 1e 00 00       	call   106480 <get_ptbl_entry_by_va>
  104670:	83 c4 10             	add    $0x10,%esp
  104673:	89 45 f0             	mov    %eax,-0x10(%ebp)
  104676:	8b 45 f0             	mov    -0x10(%ebp),%eax
  104679:	83 e0 01             	and    $0x1,%eax
  10467c:	85 c0                	test   %eax,%eax
  10467e:	75 27                	jne    1046a7 <pt_copyin+0x9e>
  104680:	83 ec 04             	sub    $0x4,%esp
  104683:	6a 07                	push   $0x7
  104685:	ff 75 0c             	pushl  0xc(%ebp)
  104688:	ff 75 08             	pushl  0x8(%ebp)
  10468b:	e8 40 27 00 00       	call   106dd0 <alloc_page>
  104690:	83 c4 10             	add    $0x10,%esp
  104693:	83 ec 08             	sub    $0x8,%esp
  104696:	ff 75 0c             	pushl  0xc(%ebp)
  104699:	ff 75 08             	pushl  0x8(%ebp)
  10469c:	e8 df 1d 00 00       	call   106480 <get_ptbl_entry_by_va>
  1046a1:	83 c4 10             	add    $0x10,%esp
  1046a4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1046a7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1046aa:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  1046af:	89 c2                	mov    %eax,%edx
  1046b1:	8b 45 0c             	mov    0xc(%ebp),%eax
  1046b4:	25 ff 0f 00 00       	and    $0xfff,%eax
  1046b9:	09 d0                	or     %edx,%eax
  1046bb:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1046be:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1046c1:	25 ff 0f 00 00       	and    $0xfff,%eax
  1046c6:	ba 00 10 00 00       	mov    $0x1000,%edx
  1046cb:	29 c2                	sub    %eax,%edx
  1046cd:	8b 45 14             	mov    0x14(%ebp),%eax
  1046d0:	39 c2                	cmp    %eax,%edx
  1046d2:	0f 46 c2             	cmovbe %edx,%eax
  1046d5:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1046d8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1046db:	83 ec 04             	sub    $0x4,%esp
  1046de:	ff 75 ec             	pushl  -0x14(%ebp)
  1046e1:	50                   	push   %eax
  1046e2:	ff 75 10             	pushl  0x10(%ebp)
  1046e5:	e8 4d e8 ff ff       	call   102f37 <memcpy>
  1046ea:	83 c4 10             	add    $0x10,%esp
  1046ed:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1046f0:	29 45 14             	sub    %eax,0x14(%ebp)
  1046f3:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1046f6:	01 45 0c             	add    %eax,0xc(%ebp)
  1046f9:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1046fc:	01 45 10             	add    %eax,0x10(%ebp)
  1046ff:	8b 45 ec             	mov    -0x14(%ebp),%eax
  104702:	01 45 f4             	add    %eax,-0xc(%ebp)
  104705:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
  104709:	0f 85 53 ff ff ff    	jne    104662 <pt_copyin+0x59>
  10470f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104712:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  104715:	c9                   	leave  
  104716:	c3                   	ret    

00104717 <pt_copyout>:
  104717:	55                   	push   %ebp
  104718:	89 e5                	mov    %esp,%ebp
  10471a:	53                   	push   %ebx
  10471b:	83 ec 14             	sub    $0x14,%esp
  10471e:	e8 ec bc ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  104723:	81 c3 dd 78 00 00    	add    $0x78dd,%ebx
  104729:	81 7d 10 ff ff ff 3f 	cmpl   $0x3fffffff,0x10(%ebp)
  104730:	76 0f                	jbe    104741 <pt_copyout+0x2a>
  104732:	8b 55 10             	mov    0x10(%ebp),%edx
  104735:	8b 45 14             	mov    0x14(%ebp),%eax
  104738:	01 d0                	add    %edx,%eax
  10473a:	3d 00 00 00 f0       	cmp    $0xf0000000,%eax
  10473f:	76 0a                	jbe    10474b <pt_copyout+0x34>
  104741:	b8 00 00 00 00       	mov    $0x0,%eax
  104746:	e9 d5 00 00 00       	jmp    104820 <pt_copyout+0x109>
  10474b:	8b 55 08             	mov    0x8(%ebp),%edx
  10474e:	8b 45 14             	mov    0x14(%ebp),%eax
  104751:	01 d0                	add    %edx,%eax
  104753:	3d 00 00 00 f0       	cmp    $0xf0000000,%eax
  104758:	76 0a                	jbe    104764 <pt_copyout+0x4d>
  10475a:	b8 00 00 00 00       	mov    $0x0,%eax
  10475f:	e9 bc 00 00 00       	jmp    104820 <pt_copyout+0x109>
  104764:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  10476b:	e9 a3 00 00 00       	jmp    104813 <pt_copyout+0xfc>
  104770:	83 ec 08             	sub    $0x8,%esp
  104773:	ff 75 10             	pushl  0x10(%ebp)
  104776:	ff 75 0c             	pushl  0xc(%ebp)
  104779:	e8 02 1d 00 00       	call   106480 <get_ptbl_entry_by_va>
  10477e:	83 c4 10             	add    $0x10,%esp
  104781:	89 45 f0             	mov    %eax,-0x10(%ebp)
  104784:	8b 45 f0             	mov    -0x10(%ebp),%eax
  104787:	83 e0 01             	and    $0x1,%eax
  10478a:	85 c0                	test   %eax,%eax
  10478c:	75 27                	jne    1047b5 <pt_copyout+0x9e>
  10478e:	83 ec 04             	sub    $0x4,%esp
  104791:	6a 07                	push   $0x7
  104793:	ff 75 10             	pushl  0x10(%ebp)
  104796:	ff 75 0c             	pushl  0xc(%ebp)
  104799:	e8 32 26 00 00       	call   106dd0 <alloc_page>
  10479e:	83 c4 10             	add    $0x10,%esp
  1047a1:	83 ec 08             	sub    $0x8,%esp
  1047a4:	ff 75 10             	pushl  0x10(%ebp)
  1047a7:	ff 75 0c             	pushl  0xc(%ebp)
  1047aa:	e8 d1 1c 00 00       	call   106480 <get_ptbl_entry_by_va>
  1047af:	83 c4 10             	add    $0x10,%esp
  1047b2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1047b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1047b8:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  1047bd:	89 c2                	mov    %eax,%edx
  1047bf:	8b 45 10             	mov    0x10(%ebp),%eax
  1047c2:	25 ff 0f 00 00       	and    $0xfff,%eax
  1047c7:	09 d0                	or     %edx,%eax
  1047c9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1047cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1047cf:	25 ff 0f 00 00       	and    $0xfff,%eax
  1047d4:	ba 00 10 00 00       	mov    $0x1000,%edx
  1047d9:	29 c2                	sub    %eax,%edx
  1047db:	8b 45 14             	mov    0x14(%ebp),%eax
  1047de:	39 c2                	cmp    %eax,%edx
  1047e0:	0f 46 c2             	cmovbe %edx,%eax
  1047e3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1047e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1047e9:	83 ec 04             	sub    $0x4,%esp
  1047ec:	ff 75 ec             	pushl  -0x14(%ebp)
  1047ef:	ff 75 08             	pushl  0x8(%ebp)
  1047f2:	50                   	push   %eax
  1047f3:	e8 3f e7 ff ff       	call   102f37 <memcpy>
  1047f8:	83 c4 10             	add    $0x10,%esp
  1047fb:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1047fe:	29 45 14             	sub    %eax,0x14(%ebp)
  104801:	8b 45 ec             	mov    -0x14(%ebp),%eax
  104804:	01 45 10             	add    %eax,0x10(%ebp)
  104807:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10480a:	01 45 08             	add    %eax,0x8(%ebp)
  10480d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  104810:	01 45 f4             	add    %eax,-0xc(%ebp)
  104813:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
  104817:	0f 85 53 ff ff ff    	jne    104770 <pt_copyout+0x59>
  10481d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104820:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  104823:	c9                   	leave  
  104824:	c3                   	ret    

00104825 <pt_memset>:
  104825:	55                   	push   %ebp
  104826:	89 e5                	mov    %esp,%ebp
  104828:	53                   	push   %ebx
  104829:	83 ec 24             	sub    $0x24,%esp
  10482c:	e8 de bb ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  104831:	81 c3 cf 77 00 00    	add    $0x77cf,%ebx
  104837:	8b 45 10             	mov    0x10(%ebp),%eax
  10483a:	88 45 e4             	mov    %al,-0x1c(%ebp)
  10483d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  104844:	e9 9f 00 00 00       	jmp    1048e8 <pt_memset+0xc3>
  104849:	83 ec 08             	sub    $0x8,%esp
  10484c:	ff 75 0c             	pushl  0xc(%ebp)
  10484f:	ff 75 08             	pushl  0x8(%ebp)
  104852:	e8 29 1c 00 00       	call   106480 <get_ptbl_entry_by_va>
  104857:	83 c4 10             	add    $0x10,%esp
  10485a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10485d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  104860:	83 e0 01             	and    $0x1,%eax
  104863:	85 c0                	test   %eax,%eax
  104865:	75 27                	jne    10488e <pt_memset+0x69>
  104867:	83 ec 04             	sub    $0x4,%esp
  10486a:	6a 07                	push   $0x7
  10486c:	ff 75 0c             	pushl  0xc(%ebp)
  10486f:	ff 75 08             	pushl  0x8(%ebp)
  104872:	e8 59 25 00 00       	call   106dd0 <alloc_page>
  104877:	83 c4 10             	add    $0x10,%esp
  10487a:	83 ec 08             	sub    $0x8,%esp
  10487d:	ff 75 0c             	pushl  0xc(%ebp)
  104880:	ff 75 08             	pushl  0x8(%ebp)
  104883:	e8 f8 1b 00 00       	call   106480 <get_ptbl_entry_by_va>
  104888:	83 c4 10             	add    $0x10,%esp
  10488b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10488e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  104891:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  104896:	89 c2                	mov    %eax,%edx
  104898:	8b 45 0c             	mov    0xc(%ebp),%eax
  10489b:	25 ff 0f 00 00       	and    $0xfff,%eax
  1048a0:	09 d0                	or     %edx,%eax
  1048a2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1048a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1048a8:	25 ff 0f 00 00       	and    $0xfff,%eax
  1048ad:	ba 00 10 00 00       	mov    $0x1000,%edx
  1048b2:	29 c2                	sub    %eax,%edx
  1048b4:	8b 45 14             	mov    0x14(%ebp),%eax
  1048b7:	39 c2                	cmp    %eax,%edx
  1048b9:	0f 46 c2             	cmovbe %edx,%eax
  1048bc:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1048bf:	0f be 55 e4          	movsbl -0x1c(%ebp),%edx
  1048c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1048c6:	83 ec 04             	sub    $0x4,%esp
  1048c9:	ff 75 ec             	pushl  -0x14(%ebp)
  1048cc:	52                   	push   %edx
  1048cd:	50                   	push   %eax
  1048ce:	e8 08 e5 ff ff       	call   102ddb <memset>
  1048d3:	83 c4 10             	add    $0x10,%esp
  1048d6:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1048d9:	29 45 14             	sub    %eax,0x14(%ebp)
  1048dc:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1048df:	01 45 0c             	add    %eax,0xc(%ebp)
  1048e2:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1048e5:	01 45 f4             	add    %eax,-0xc(%ebp)
  1048e8:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
  1048ec:	0f 85 57 ff ff ff    	jne    104849 <pt_memset+0x24>
  1048f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1048f5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1048f8:	c9                   	leave  
  1048f9:	c3                   	ret    

001048fa <elf_load>:
  1048fa:	55                   	push   %ebp
  1048fb:	89 e5                	mov    %esp,%ebp
  1048fd:	53                   	push   %ebx
  1048fe:	83 ec 44             	sub    $0x44,%esp
  104901:	e8 09 bb ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  104906:	81 c3 fa 76 00 00    	add    $0x76fa,%ebx
  10490c:	8b 45 08             	mov    0x8(%ebp),%eax
  10490f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  104912:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  104915:	89 45 e0             	mov    %eax,-0x20(%ebp)
  104918:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10491b:	8b 00                	mov    (%eax),%eax
  10491d:	3d 7f 45 4c 46       	cmp    $0x464c457f,%eax
  104922:	74 1f                	je     104943 <elf_load+0x49>
  104924:	8d 83 ec b7 ff ff    	lea    -0x4814(%ebx),%eax
  10492a:	50                   	push   %eax
  10492b:	8d 83 05 b8 ff ff    	lea    -0x47fb(%ebx),%eax
  104931:	50                   	push   %eax
  104932:	6a 25                	push   $0x25
  104934:	8d 83 22 b8 ff ff    	lea    -0x47de(%ebx),%eax
  10493a:	50                   	push   %eax
  10493b:	e8 41 e8 ff ff       	call   103181 <debug_panic>
  104940:	83 c4 10             	add    $0x10,%esp
  104943:	8b 45 e0             	mov    -0x20(%ebp),%eax
  104946:	0f b7 40 32          	movzwl 0x32(%eax),%eax
  10494a:	66 85 c0             	test   %ax,%ax
  10494d:	75 1f                	jne    10496e <elf_load+0x74>
  10494f:	8d 83 34 b8 ff ff    	lea    -0x47cc(%ebx),%eax
  104955:	50                   	push   %eax
  104956:	8d 83 05 b8 ff ff    	lea    -0x47fb(%ebx),%eax
  10495c:	50                   	push   %eax
  10495d:	6a 26                	push   $0x26
  10495f:	8d 83 22 b8 ff ff    	lea    -0x47de(%ebx),%eax
  104965:	50                   	push   %eax
  104966:	e8 16 e8 ff ff       	call   103181 <debug_panic>
  10496b:	83 c4 10             	add    $0x10,%esp
  10496e:	8b 45 e0             	mov    -0x20(%ebp),%eax
  104971:	8b 50 20             	mov    0x20(%eax),%edx
  104974:	8b 45 e0             	mov    -0x20(%ebp),%eax
  104977:	01 d0                	add    %edx,%eax
  104979:	89 45 dc             	mov    %eax,-0x24(%ebp)
  10497c:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10497f:	0f b7 40 30          	movzwl 0x30(%eax),%eax
  104983:	0f b7 d0             	movzwl %ax,%edx
  104986:	89 d0                	mov    %edx,%eax
  104988:	c1 e0 02             	shl    $0x2,%eax
  10498b:	01 d0                	add    %edx,%eax
  10498d:	c1 e0 03             	shl    $0x3,%eax
  104990:	89 c2                	mov    %eax,%edx
  104992:	8b 45 dc             	mov    -0x24(%ebp),%eax
  104995:	01 d0                	add    %edx,%eax
  104997:	89 45 d8             	mov    %eax,-0x28(%ebp)
  10499a:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10499d:	0f b7 40 32          	movzwl 0x32(%eax),%eax
  1049a1:	0f b7 d0             	movzwl %ax,%edx
  1049a4:	89 d0                	mov    %edx,%eax
  1049a6:	c1 e0 02             	shl    $0x2,%eax
  1049a9:	01 d0                	add    %edx,%eax
  1049ab:	c1 e0 03             	shl    $0x3,%eax
  1049ae:	89 c2                	mov    %eax,%edx
  1049b0:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1049b3:	01 d0                	add    %edx,%eax
  1049b5:	8b 50 10             	mov    0x10(%eax),%edx
  1049b8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1049bb:	01 d0                	add    %edx,%eax
  1049bd:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  1049c0:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1049c3:	0f b7 40 32          	movzwl 0x32(%eax),%eax
  1049c7:	0f b7 d0             	movzwl %ax,%edx
  1049ca:	89 d0                	mov    %edx,%eax
  1049cc:	c1 e0 02             	shl    $0x2,%eax
  1049cf:	01 d0                	add    %edx,%eax
  1049d1:	c1 e0 03             	shl    $0x3,%eax
  1049d4:	89 c2                	mov    %eax,%edx
  1049d6:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1049d9:	01 d0                	add    %edx,%eax
  1049db:	8b 40 04             	mov    0x4(%eax),%eax
  1049de:	83 f8 03             	cmp    $0x3,%eax
  1049e1:	74 1f                	je     104a02 <elf_load+0x108>
  1049e3:	8d 83 54 b8 ff ff    	lea    -0x47ac(%ebx),%eax
  1049e9:	50                   	push   %eax
  1049ea:	8d 83 05 b8 ff ff    	lea    -0x47fb(%ebx),%eax
  1049f0:	50                   	push   %eax
  1049f1:	6a 2c                	push   $0x2c
  1049f3:	8d 83 22 b8 ff ff    	lea    -0x47de(%ebx),%eax
  1049f9:	50                   	push   %eax
  1049fa:	e8 82 e7 ff ff       	call   103181 <debug_panic>
  1049ff:	83 c4 10             	add    $0x10,%esp
  104a02:	8b 45 e0             	mov    -0x20(%ebp),%eax
  104a05:	8b 50 1c             	mov    0x1c(%eax),%edx
  104a08:	8b 45 e0             	mov    -0x20(%ebp),%eax
  104a0b:	01 d0                	add    %edx,%eax
  104a0d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  104a10:	8b 45 e0             	mov    -0x20(%ebp),%eax
  104a13:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  104a17:	0f b7 c0             	movzwl %ax,%eax
  104a1a:	c1 e0 05             	shl    $0x5,%eax
  104a1d:	89 c2                	mov    %eax,%edx
  104a1f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104a22:	01 d0                	add    %edx,%eax
  104a24:	89 45 d0             	mov    %eax,-0x30(%ebp)
  104a27:	e9 63 01 00 00       	jmp    104b8f <elf_load+0x295>
  104a2c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104a2f:	8b 00                	mov    (%eax),%eax
  104a31:	83 f8 01             	cmp    $0x1,%eax
  104a34:	0f 85 50 01 00 00    	jne    104b8a <elf_load+0x290>
  104a3a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104a3d:	8b 40 04             	mov    0x4(%eax),%eax
  104a40:	83 ec 08             	sub    $0x8,%esp
  104a43:	68 00 10 00 00       	push   $0x1000
  104a48:	50                   	push   %eax
  104a49:	e8 36 f4 ff ff       	call   103e84 <rounddown>
  104a4e:	83 c4 10             	add    $0x10,%esp
  104a51:	89 c2                	mov    %eax,%edx
  104a53:	8b 45 e0             	mov    -0x20(%ebp),%eax
  104a56:	01 d0                	add    %edx,%eax
  104a58:	89 45 f0             	mov    %eax,-0x10(%ebp)
  104a5b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104a5e:	8b 40 08             	mov    0x8(%eax),%eax
  104a61:	83 ec 08             	sub    $0x8,%esp
  104a64:	68 00 10 00 00       	push   $0x1000
  104a69:	50                   	push   %eax
  104a6a:	e8 15 f4 ff ff       	call   103e84 <rounddown>
  104a6f:	83 c4 10             	add    $0x10,%esp
  104a72:	89 45 ec             	mov    %eax,-0x14(%ebp)
  104a75:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104a78:	8b 50 08             	mov    0x8(%eax),%edx
  104a7b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104a7e:	8b 40 10             	mov    0x10(%eax),%eax
  104a81:	01 d0                	add    %edx,%eax
  104a83:	89 45 cc             	mov    %eax,-0x34(%ebp)
  104a86:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104a89:	8b 50 08             	mov    0x8(%eax),%edx
  104a8c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104a8f:	8b 40 14             	mov    0x14(%eax),%eax
  104a92:	01 d0                	add    %edx,%eax
  104a94:	83 ec 08             	sub    $0x8,%esp
  104a97:	68 00 10 00 00       	push   $0x1000
  104a9c:	50                   	push   %eax
  104a9d:	e8 01 f4 ff ff       	call   103ea3 <roundup>
  104aa2:	83 c4 10             	add    $0x10,%esp
  104aa5:	89 45 c8             	mov    %eax,-0x38(%ebp)
  104aa8:	c7 45 e8 05 00 00 00 	movl   $0x5,-0x18(%ebp)
  104aaf:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104ab2:	8b 40 18             	mov    0x18(%eax),%eax
  104ab5:	83 e0 02             	and    $0x2,%eax
  104ab8:	85 c0                	test   %eax,%eax
  104aba:	0f 84 bc 00 00 00    	je     104b7c <elf_load+0x282>
  104ac0:	83 4d e8 02          	orl    $0x2,-0x18(%ebp)
  104ac4:	e9 b3 00 00 00       	jmp    104b7c <elf_load+0x282>
  104ac9:	83 ec 04             	sub    $0x4,%esp
  104acc:	ff 75 e8             	pushl  -0x18(%ebp)
  104acf:	ff 75 ec             	pushl  -0x14(%ebp)
  104ad2:	ff 75 0c             	pushl  0xc(%ebp)
  104ad5:	e8 f6 22 00 00       	call   106dd0 <alloc_page>
  104ada:	83 c4 10             	add    $0x10,%esp
  104add:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  104ae0:	83 ec 08             	sub    $0x8,%esp
  104ae3:	68 00 10 00 00       	push   $0x1000
  104ae8:	ff 75 cc             	pushl  -0x34(%ebp)
  104aeb:	e8 94 f3 ff ff       	call   103e84 <rounddown>
  104af0:	83 c4 10             	add    $0x10,%esp
  104af3:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  104af6:	76 1a                	jbe    104b12 <elf_load+0x218>
  104af8:	8b 55 0c             	mov    0xc(%ebp),%edx
  104afb:	8b 45 f0             	mov    -0x10(%ebp),%eax
  104afe:	68 00 10 00 00       	push   $0x1000
  104b03:	ff 75 ec             	pushl  -0x14(%ebp)
  104b06:	52                   	push   %edx
  104b07:	50                   	push   %eax
  104b08:	e8 0a fc ff ff       	call   104717 <pt_copyout>
  104b0d:	83 c4 10             	add    $0x10,%esp
  104b10:	eb 5c                	jmp    104b6e <elf_load+0x274>
  104b12:	8b 45 ec             	mov    -0x14(%ebp),%eax
  104b15:	3b 45 cc             	cmp    -0x34(%ebp),%eax
  104b18:	73 3e                	jae    104b58 <elf_load+0x25e>
  104b1a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104b1d:	8b 40 10             	mov    0x10(%eax),%eax
  104b20:	85 c0                	test   %eax,%eax
  104b22:	74 34                	je     104b58 <elf_load+0x25e>
  104b24:	8b 45 0c             	mov    0xc(%ebp),%eax
  104b27:	68 00 10 00 00       	push   $0x1000
  104b2c:	6a 00                	push   $0x0
  104b2e:	ff 75 ec             	pushl  -0x14(%ebp)
  104b31:	50                   	push   %eax
  104b32:	e8 ee fc ff ff       	call   104825 <pt_memset>
  104b37:	83 c4 10             	add    $0x10,%esp
  104b3a:	8b 45 cc             	mov    -0x34(%ebp),%eax
  104b3d:	2b 45 ec             	sub    -0x14(%ebp),%eax
  104b40:	89 c1                	mov    %eax,%ecx
  104b42:	8b 55 0c             	mov    0xc(%ebp),%edx
  104b45:	8b 45 f0             	mov    -0x10(%ebp),%eax
  104b48:	51                   	push   %ecx
  104b49:	ff 75 ec             	pushl  -0x14(%ebp)
  104b4c:	52                   	push   %edx
  104b4d:	50                   	push   %eax
  104b4e:	e8 c4 fb ff ff       	call   104717 <pt_copyout>
  104b53:	83 c4 10             	add    $0x10,%esp
  104b56:	eb 16                	jmp    104b6e <elf_load+0x274>
  104b58:	8b 45 0c             	mov    0xc(%ebp),%eax
  104b5b:	68 00 10 00 00       	push   $0x1000
  104b60:	6a 00                	push   $0x0
  104b62:	ff 75 ec             	pushl  -0x14(%ebp)
  104b65:	50                   	push   %eax
  104b66:	e8 ba fc ff ff       	call   104825 <pt_memset>
  104b6b:	83 c4 10             	add    $0x10,%esp
  104b6e:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
  104b75:	81 45 f0 00 10 00 00 	addl   $0x1000,-0x10(%ebp)
  104b7c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  104b7f:	3b 45 c8             	cmp    -0x38(%ebp),%eax
  104b82:	0f 82 41 ff ff ff    	jb     104ac9 <elf_load+0x1cf>
  104b88:	eb 01                	jmp    104b8b <elf_load+0x291>
  104b8a:	90                   	nop
  104b8b:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
  104b8f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104b92:	3b 45 d0             	cmp    -0x30(%ebp),%eax
  104b95:	0f 82 91 fe ff ff    	jb     104a2c <elf_load+0x132>
  104b9b:	8b 45 0c             	mov    0xc(%ebp),%eax
  104b9e:	68 00 10 00 00       	push   $0x1000
  104ba3:	68 00 00 00 e0       	push   $0xe0000000
  104ba8:	50                   	push   %eax
  104ba9:	8d 83 00 20 00 00    	lea    0x2000(%ebx),%eax
  104baf:	50                   	push   %eax
  104bb0:	e8 62 fb ff ff       	call   104717 <pt_copyout>
  104bb5:	83 c4 10             	add    $0x10,%esp
  104bb8:	90                   	nop
  104bb9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  104bbc:	c9                   	leave  
  104bbd:	c3                   	ret    

00104bbe <elf_entry>:
  104bbe:	55                   	push   %ebp
  104bbf:	89 e5                	mov    %esp,%ebp
  104bc1:	53                   	push   %ebx
  104bc2:	83 ec 14             	sub    $0x14,%esp
  104bc5:	e8 3d b8 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  104bca:	05 36 74 00 00       	add    $0x7436,%eax
  104bcf:	8b 55 08             	mov    0x8(%ebp),%edx
  104bd2:	89 55 f4             	mov    %edx,-0xc(%ebp)
  104bd5:	8b 55 f4             	mov    -0xc(%ebp),%edx
  104bd8:	89 55 f0             	mov    %edx,-0x10(%ebp)
  104bdb:	8b 55 f0             	mov    -0x10(%ebp),%edx
  104bde:	8b 12                	mov    (%edx),%edx
  104be0:	81 fa 7f 45 4c 46    	cmp    $0x464c457f,%edx
  104be6:	74 21                	je     104c09 <elf_entry+0x4b>
  104be8:	8d 90 ec b7 ff ff    	lea    -0x4814(%eax),%edx
  104bee:	52                   	push   %edx
  104bef:	8d 90 05 b8 ff ff    	lea    -0x47fb(%eax),%edx
  104bf5:	52                   	push   %edx
  104bf6:	6a 63                	push   $0x63
  104bf8:	8d 90 22 b8 ff ff    	lea    -0x47de(%eax),%edx
  104bfe:	52                   	push   %edx
  104bff:	89 c3                	mov    %eax,%ebx
  104c01:	e8 7b e5 ff ff       	call   103181 <debug_panic>
  104c06:	83 c4 10             	add    $0x10,%esp
  104c09:	8b 45 f0             	mov    -0x10(%ebp),%eax
  104c0c:	8b 40 18             	mov    0x18(%eax),%eax
  104c0f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  104c12:	c9                   	leave  
  104c13:	c3                   	ret    

00104c14 <trap_dump>:
  104c14:	55                   	push   %ebp
  104c15:	89 e5                	mov    %esp,%ebp
  104c17:	53                   	push   %ebx
  104c18:	83 ec 14             	sub    $0x14,%esp
  104c1b:	e8 ef b7 ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  104c20:	81 c3 e0 73 00 00    	add    $0x73e0,%ebx
  104c26:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  104c2a:	0f 84 4f 02 00 00    	je     104e7f <trap_dump+0x26b>
  104c30:	8b 45 08             	mov    0x8(%ebp),%eax
  104c33:	89 45 f4             	mov    %eax,-0xc(%ebp)
  104c36:	ff 75 f4             	pushl  -0xc(%ebp)
  104c39:	8d 83 84 b8 ff ff    	lea    -0x477c(%ebx),%eax
  104c3f:	50                   	push   %eax
  104c40:	6a 11                	push   $0x11
  104c42:	8d 83 95 b8 ff ff    	lea    -0x476b(%ebx),%eax
  104c48:	50                   	push   %eax
  104c49:	e8 79 e4 ff ff       	call   1030c7 <debug_normal>
  104c4e:	83 c4 10             	add    $0x10,%esp
  104c51:	8b 45 08             	mov    0x8(%ebp),%eax
  104c54:	8b 10                	mov    (%eax),%edx
  104c56:	8b 45 08             	mov    0x8(%ebp),%eax
  104c59:	83 ec 04             	sub    $0x4,%esp
  104c5c:	52                   	push   %edx
  104c5d:	50                   	push   %eax
  104c5e:	8d 83 a5 b8 ff ff    	lea    -0x475b(%ebx),%eax
  104c64:	50                   	push   %eax
  104c65:	e8 2c e4 ff ff       	call   103096 <debug_info>
  104c6a:	83 c4 10             	add    $0x10,%esp
  104c6d:	8b 45 08             	mov    0x8(%ebp),%eax
  104c70:	8b 40 04             	mov    0x4(%eax),%eax
  104c73:	8b 55 08             	mov    0x8(%ebp),%edx
  104c76:	83 c2 04             	add    $0x4,%edx
  104c79:	83 ec 04             	sub    $0x4,%esp
  104c7c:	50                   	push   %eax
  104c7d:	52                   	push   %edx
  104c7e:	8d 83 bb b8 ff ff    	lea    -0x4745(%ebx),%eax
  104c84:	50                   	push   %eax
  104c85:	e8 0c e4 ff ff       	call   103096 <debug_info>
  104c8a:	83 c4 10             	add    $0x10,%esp
  104c8d:	8b 45 08             	mov    0x8(%ebp),%eax
  104c90:	8b 40 08             	mov    0x8(%eax),%eax
  104c93:	8b 55 08             	mov    0x8(%ebp),%edx
  104c96:	83 c2 08             	add    $0x8,%edx
  104c99:	83 ec 04             	sub    $0x4,%esp
  104c9c:	50                   	push   %eax
  104c9d:	52                   	push   %edx
  104c9e:	8d 83 d1 b8 ff ff    	lea    -0x472f(%ebx),%eax
  104ca4:	50                   	push   %eax
  104ca5:	e8 ec e3 ff ff       	call   103096 <debug_info>
  104caa:	83 c4 10             	add    $0x10,%esp
  104cad:	8b 45 08             	mov    0x8(%ebp),%eax
  104cb0:	8b 40 0c             	mov    0xc(%eax),%eax
  104cb3:	8b 55 08             	mov    0x8(%ebp),%edx
  104cb6:	83 c2 0c             	add    $0xc,%edx
  104cb9:	83 ec 04             	sub    $0x4,%esp
  104cbc:	50                   	push   %eax
  104cbd:	52                   	push   %edx
  104cbe:	8d 83 e7 b8 ff ff    	lea    -0x4719(%ebx),%eax
  104cc4:	50                   	push   %eax
  104cc5:	e8 cc e3 ff ff       	call   103096 <debug_info>
  104cca:	83 c4 10             	add    $0x10,%esp
  104ccd:	8b 45 08             	mov    0x8(%ebp),%eax
  104cd0:	8b 40 10             	mov    0x10(%eax),%eax
  104cd3:	8b 55 08             	mov    0x8(%ebp),%edx
  104cd6:	83 c2 10             	add    $0x10,%edx
  104cd9:	83 ec 04             	sub    $0x4,%esp
  104cdc:	50                   	push   %eax
  104cdd:	52                   	push   %edx
  104cde:	8d 83 fd b8 ff ff    	lea    -0x4703(%ebx),%eax
  104ce4:	50                   	push   %eax
  104ce5:	e8 ac e3 ff ff       	call   103096 <debug_info>
  104cea:	83 c4 10             	add    $0x10,%esp
  104ced:	8b 45 08             	mov    0x8(%ebp),%eax
  104cf0:	8b 40 14             	mov    0x14(%eax),%eax
  104cf3:	8b 55 08             	mov    0x8(%ebp),%edx
  104cf6:	83 c2 14             	add    $0x14,%edx
  104cf9:	83 ec 04             	sub    $0x4,%esp
  104cfc:	50                   	push   %eax
  104cfd:	52                   	push   %edx
  104cfe:	8d 83 13 b9 ff ff    	lea    -0x46ed(%ebx),%eax
  104d04:	50                   	push   %eax
  104d05:	e8 8c e3 ff ff       	call   103096 <debug_info>
  104d0a:	83 c4 10             	add    $0x10,%esp
  104d0d:	8b 45 08             	mov    0x8(%ebp),%eax
  104d10:	8b 40 18             	mov    0x18(%eax),%eax
  104d13:	8b 55 08             	mov    0x8(%ebp),%edx
  104d16:	83 c2 18             	add    $0x18,%edx
  104d19:	83 ec 04             	sub    $0x4,%esp
  104d1c:	50                   	push   %eax
  104d1d:	52                   	push   %edx
  104d1e:	8d 83 29 b9 ff ff    	lea    -0x46d7(%ebx),%eax
  104d24:	50                   	push   %eax
  104d25:	e8 6c e3 ff ff       	call   103096 <debug_info>
  104d2a:	83 c4 10             	add    $0x10,%esp
  104d2d:	8b 45 08             	mov    0x8(%ebp),%eax
  104d30:	8b 40 1c             	mov    0x1c(%eax),%eax
  104d33:	8b 55 08             	mov    0x8(%ebp),%edx
  104d36:	83 c2 1c             	add    $0x1c,%edx
  104d39:	83 ec 04             	sub    $0x4,%esp
  104d3c:	50                   	push   %eax
  104d3d:	52                   	push   %edx
  104d3e:	8d 83 3f b9 ff ff    	lea    -0x46c1(%ebx),%eax
  104d44:	50                   	push   %eax
  104d45:	e8 4c e3 ff ff       	call   103096 <debug_info>
  104d4a:	83 c4 10             	add    $0x10,%esp
  104d4d:	8b 45 08             	mov    0x8(%ebp),%eax
  104d50:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  104d54:	0f b7 c0             	movzwl %ax,%eax
  104d57:	8b 55 08             	mov    0x8(%ebp),%edx
  104d5a:	83 c2 20             	add    $0x20,%edx
  104d5d:	83 ec 04             	sub    $0x4,%esp
  104d60:	50                   	push   %eax
  104d61:	52                   	push   %edx
  104d62:	8d 83 55 b9 ff ff    	lea    -0x46ab(%ebx),%eax
  104d68:	50                   	push   %eax
  104d69:	e8 28 e3 ff ff       	call   103096 <debug_info>
  104d6e:	83 c4 10             	add    $0x10,%esp
  104d71:	8b 45 08             	mov    0x8(%ebp),%eax
  104d74:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  104d78:	0f b7 c0             	movzwl %ax,%eax
  104d7b:	8b 55 08             	mov    0x8(%ebp),%edx
  104d7e:	83 c2 24             	add    $0x24,%edx
  104d81:	83 ec 04             	sub    $0x4,%esp
  104d84:	50                   	push   %eax
  104d85:	52                   	push   %edx
  104d86:	8d 83 6b b9 ff ff    	lea    -0x4695(%ebx),%eax
  104d8c:	50                   	push   %eax
  104d8d:	e8 04 e3 ff ff       	call   103096 <debug_info>
  104d92:	83 c4 10             	add    $0x10,%esp
  104d95:	8b 45 08             	mov    0x8(%ebp),%eax
  104d98:	8b 40 28             	mov    0x28(%eax),%eax
  104d9b:	8b 55 08             	mov    0x8(%ebp),%edx
  104d9e:	83 c2 28             	add    $0x28,%edx
  104da1:	83 ec 04             	sub    $0x4,%esp
  104da4:	50                   	push   %eax
  104da5:	52                   	push   %edx
  104da6:	8d 83 81 b9 ff ff    	lea    -0x467f(%ebx),%eax
  104dac:	50                   	push   %eax
  104dad:	e8 e4 e2 ff ff       	call   103096 <debug_info>
  104db2:	83 c4 10             	add    $0x10,%esp
  104db5:	8b 45 08             	mov    0x8(%ebp),%eax
  104db8:	8b 40 2c             	mov    0x2c(%eax),%eax
  104dbb:	8b 55 08             	mov    0x8(%ebp),%edx
  104dbe:	83 c2 2c             	add    $0x2c,%edx
  104dc1:	83 ec 04             	sub    $0x4,%esp
  104dc4:	50                   	push   %eax
  104dc5:	52                   	push   %edx
  104dc6:	8d 83 97 b9 ff ff    	lea    -0x4669(%ebx),%eax
  104dcc:	50                   	push   %eax
  104dcd:	e8 c4 e2 ff ff       	call   103096 <debug_info>
  104dd2:	83 c4 10             	add    $0x10,%esp
  104dd5:	8b 45 08             	mov    0x8(%ebp),%eax
  104dd8:	8b 40 30             	mov    0x30(%eax),%eax
  104ddb:	8b 55 08             	mov    0x8(%ebp),%edx
  104dde:	83 c2 30             	add    $0x30,%edx
  104de1:	83 ec 04             	sub    $0x4,%esp
  104de4:	50                   	push   %eax
  104de5:	52                   	push   %edx
  104de6:	8d 83 ad b9 ff ff    	lea    -0x4653(%ebx),%eax
  104dec:	50                   	push   %eax
  104ded:	e8 a4 e2 ff ff       	call   103096 <debug_info>
  104df2:	83 c4 10             	add    $0x10,%esp
  104df5:	8b 45 08             	mov    0x8(%ebp),%eax
  104df8:	0f b7 40 34          	movzwl 0x34(%eax),%eax
  104dfc:	0f b7 c0             	movzwl %ax,%eax
  104dff:	8b 55 08             	mov    0x8(%ebp),%edx
  104e02:	83 c2 34             	add    $0x34,%edx
  104e05:	83 ec 04             	sub    $0x4,%esp
  104e08:	50                   	push   %eax
  104e09:	52                   	push   %edx
  104e0a:	8d 83 c3 b9 ff ff    	lea    -0x463d(%ebx),%eax
  104e10:	50                   	push   %eax
  104e11:	e8 80 e2 ff ff       	call   103096 <debug_info>
  104e16:	83 c4 10             	add    $0x10,%esp
  104e19:	8b 45 08             	mov    0x8(%ebp),%eax
  104e1c:	8b 40 38             	mov    0x38(%eax),%eax
  104e1f:	8b 55 08             	mov    0x8(%ebp),%edx
  104e22:	83 c2 38             	add    $0x38,%edx
  104e25:	83 ec 04             	sub    $0x4,%esp
  104e28:	50                   	push   %eax
  104e29:	52                   	push   %edx
  104e2a:	8d 83 d9 b9 ff ff    	lea    -0x4627(%ebx),%eax
  104e30:	50                   	push   %eax
  104e31:	e8 60 e2 ff ff       	call   103096 <debug_info>
  104e36:	83 c4 10             	add    $0x10,%esp
  104e39:	8b 45 08             	mov    0x8(%ebp),%eax
  104e3c:	8b 40 3c             	mov    0x3c(%eax),%eax
  104e3f:	8b 55 08             	mov    0x8(%ebp),%edx
  104e42:	83 c2 3c             	add    $0x3c,%edx
  104e45:	83 ec 04             	sub    $0x4,%esp
  104e48:	50                   	push   %eax
  104e49:	52                   	push   %edx
  104e4a:	8d 83 e7 b8 ff ff    	lea    -0x4719(%ebx),%eax
  104e50:	50                   	push   %eax
  104e51:	e8 40 e2 ff ff       	call   103096 <debug_info>
  104e56:	83 c4 10             	add    $0x10,%esp
  104e59:	8b 45 08             	mov    0x8(%ebp),%eax
  104e5c:	0f b7 40 40          	movzwl 0x40(%eax),%eax
  104e60:	0f b7 c0             	movzwl %ax,%eax
  104e63:	8b 55 08             	mov    0x8(%ebp),%edx
  104e66:	83 c2 40             	add    $0x40,%edx
  104e69:	83 ec 04             	sub    $0x4,%esp
  104e6c:	50                   	push   %eax
  104e6d:	52                   	push   %edx
  104e6e:	8d 83 ef b9 ff ff    	lea    -0x4611(%ebx),%eax
  104e74:	50                   	push   %eax
  104e75:	e8 1c e2 ff ff       	call   103096 <debug_info>
  104e7a:	83 c4 10             	add    $0x10,%esp
  104e7d:	eb 01                	jmp    104e80 <trap_dump+0x26c>
  104e7f:	90                   	nop
  104e80:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  104e83:	c9                   	leave  
  104e84:	c3                   	ret    

00104e85 <pgflt_handler>:
  104e85:	55                   	push   %ebp
  104e86:	89 e5                	mov    %esp,%ebp
  104e88:	53                   	push   %ebx
  104e89:	83 ec 14             	sub    $0x14,%esp
  104e8c:	e8 7e b5 ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  104e91:	81 c3 6f 71 00 00    	add    $0x716f,%ebx
  104e97:	8b 45 08             	mov    0x8(%ebp),%eax
  104e9a:	8b 40 2c             	mov    0x2c(%eax),%eax
  104e9d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  104ea0:	e8 42 f2 ff ff       	call   1040e7 <rcr2>
  104ea5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  104ea8:	8b 45 08             	mov    0x8(%ebp),%eax
  104eab:	8b 50 30             	mov    0x30(%eax),%edx
  104eae:	c7 c0 4c 3f 11 00    	mov    $0x113f4c,%eax
  104eb4:	8b 00                	mov    (%eax),%eax
  104eb6:	83 ec 0c             	sub    $0xc,%esp
  104eb9:	52                   	push   %edx
  104eba:	50                   	push   %eax
  104ebb:	ff 75 f4             	pushl  -0xc(%ebp)
  104ebe:	ff 75 f0             	pushl  -0x10(%ebp)
  104ec1:	8d 83 08 ba ff ff    	lea    -0x45f8(%ebx),%eax
  104ec7:	50                   	push   %eax
  104ec8:	e8 cb e4 ff ff       	call   103398 <dprintf>
  104ecd:	83 c4 20             	add    $0x20,%esp
  104ed0:	8b 45 08             	mov    0x8(%ebp),%eax
  104ed3:	8b 40 2c             	mov    0x2c(%eax),%eax
  104ed6:	83 e0 01             	and    $0x1,%eax
  104ed9:	85 c0                	test   %eax,%eax
  104edb:	74 23                	je     104f00 <pgflt_handler+0x7b>
  104edd:	83 ec 0c             	sub    $0xc,%esp
  104ee0:	ff 75 f4             	pushl  -0xc(%ebp)
  104ee3:	ff 75 f0             	pushl  -0x10(%ebp)
  104ee6:	8d 83 4c ba ff ff    	lea    -0x45b4(%ebx),%eax
  104eec:	50                   	push   %eax
  104eed:	6a 35                	push   $0x35
  104eef:	8d 83 95 b8 ff ff    	lea    -0x476b(%ebx),%eax
  104ef5:	50                   	push   %eax
  104ef6:	e8 86 e2 ff ff       	call   103181 <debug_panic>
  104efb:	83 c4 20             	add    $0x20,%esp
  104efe:	eb 2c                	jmp    104f2c <pgflt_handler+0xa7>
  104f00:	83 ec 08             	sub    $0x8,%esp
  104f03:	68 00 10 00 00       	push   $0x1000
  104f08:	ff 75 f0             	pushl  -0x10(%ebp)
  104f0b:	e8 74 ef ff ff       	call   103e84 <rounddown>
  104f10:	83 c4 10             	add    $0x10,%esp
  104f13:	89 c2                	mov    %eax,%edx
  104f15:	c7 c0 4c 3f 11 00    	mov    $0x113f4c,%eax
  104f1b:	8b 00                	mov    (%eax),%eax
  104f1d:	83 ec 04             	sub    $0x4,%esp
  104f20:	6a 07                	push   $0x7
  104f22:	52                   	push   %edx
  104f23:	50                   	push   %eax
  104f24:	e8 a7 1e 00 00       	call   106dd0 <alloc_page>
  104f29:	83 c4 10             	add    $0x10,%esp
  104f2c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  104f2f:	c9                   	leave  
  104f30:	c3                   	ret    

00104f31 <checkpoint>:
  104f31:	55                   	push   %ebp
  104f32:	89 e5                	mov    %esp,%ebp
  104f34:	53                   	push   %ebx
  104f35:	83 ec 04             	sub    $0x4,%esp
  104f38:	e8 ca b4 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  104f3d:	05 c3 70 00 00       	add    $0x70c3,%eax
  104f42:	83 ec 0c             	sub    $0xc,%esp
  104f45:	8d 90 7d ba ff ff    	lea    -0x4583(%eax),%edx
  104f4b:	52                   	push   %edx
  104f4c:	89 c3                	mov    %eax,%ebx
  104f4e:	e8 43 e1 ff ff       	call   103096 <debug_info>
  104f53:	83 c4 10             	add    $0x10,%esp
  104f56:	90                   	nop
  104f57:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  104f5a:	c9                   	leave  
  104f5b:	c3                   	ret    

00104f5c <trap>:
  104f5c:	55                   	push   %ebp
  104f5d:	89 e5                	mov    %esp,%ebp
  104f5f:	53                   	push   %ebx
  104f60:	83 ec 04             	sub    $0x4,%esp
  104f63:	e8 a7 b4 ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  104f68:	81 c3 98 70 00 00    	add    $0x7098,%ebx
  104f6e:	8b 45 08             	mov    0x8(%ebp),%eax
  104f71:	8b 40 28             	mov    0x28(%eax),%eax
  104f74:	83 f8 0e             	cmp    $0xe,%eax
  104f77:	75 1d                	jne    104f96 <trap+0x3a>
  104f79:	83 ec 0c             	sub    $0xc,%esp
  104f7c:	6a 00                	push   $0x0
  104f7e:	e8 8d 10 00 00       	call   106010 <set_pdir_base>
  104f83:	83 c4 10             	add    $0x10,%esp
  104f86:	83 ec 0c             	sub    $0xc,%esp
  104f89:	ff 75 08             	pushl  0x8(%ebp)
  104f8c:	e8 f4 fe ff ff       	call   104e85 <pgflt_handler>
  104f91:	83 c4 10             	add    $0x10,%esp
  104f94:	eb 48                	jmp    104fde <trap+0x82>
  104f96:	8b 45 08             	mov    0x8(%ebp),%eax
  104f99:	8b 40 28             	mov    0x28(%eax),%eax
  104f9c:	50                   	push   %eax
  104f9d:	8d 83 8a ba ff ff    	lea    -0x4576(%ebx),%eax
  104fa3:	50                   	push   %eax
  104fa4:	6a 4e                	push   $0x4e
  104fa6:	8d 83 95 b8 ff ff    	lea    -0x476b(%ebx),%eax
  104fac:	50                   	push   %eax
  104fad:	e8 15 e1 ff ff       	call   1030c7 <debug_normal>
  104fb2:	83 c4 10             	add    $0x10,%esp
  104fb5:	83 ec 0c             	sub    $0xc,%esp
  104fb8:	ff 75 08             	pushl  0x8(%ebp)
  104fbb:	e8 54 fc ff ff       	call   104c14 <trap_dump>
  104fc0:	83 c4 10             	add    $0x10,%esp
  104fc3:	83 ec 04             	sub    $0x4,%esp
  104fc6:	8d 83 9e ba ff ff    	lea    -0x4562(%ebx),%eax
  104fcc:	50                   	push   %eax
  104fcd:	6a 50                	push   $0x50
  104fcf:	8d 83 95 b8 ff ff    	lea    -0x476b(%ebx),%eax
  104fd5:	50                   	push   %eax
  104fd6:	e8 a6 e1 ff ff       	call   103181 <debug_panic>
  104fdb:	83 c4 10             	add    $0x10,%esp
  104fde:	c7 c0 4c 3f 11 00    	mov    $0x113f4c,%eax
  104fe4:	8b 00                	mov    (%eax),%eax
  104fe6:	83 ec 0c             	sub    $0xc,%esp
  104fe9:	50                   	push   %eax
  104fea:	e8 21 10 00 00       	call   106010 <set_pdir_base>
  104fef:	83 c4 10             	add    $0x10,%esp
  104ff2:	83 ec 0c             	sub    $0xc,%esp
  104ff5:	ff 75 08             	pushl  0x8(%ebp)
  104ff8:	e8 d3 dd ff ff       	call   102dd0 <trap_return>
  104ffd:	83 c4 10             	add    $0x10,%esp
  105000:	90                   	nop
  105001:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  105004:	c9                   	leave  
  105005:	c3                   	ret    
  105006:	66 90                	xchg   %ax,%ax
  105008:	66 90                	xchg   %ax,%ax
  10500a:	66 90                	xchg   %ax,%ax
  10500c:	66 90                	xchg   %ax,%ax
  10500e:	66 90                	xchg   %ax,%ax

00105010 <kern_init>:
    #endif
}

void
kern_init (uintptr_t mbi_addr)
{
  105010:	56                   	push   %esi
  105011:	53                   	push   %ebx
  105012:	e8 f8 b3 ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  105017:	81 c3 e9 6f 00 00    	add    $0x6fe9,%ebx
  10501d:	83 ec 10             	sub    $0x10,%esp
    #ifdef TEST
    pdir_init_kern(mbi_addr);
  105020:	ff 74 24 1c          	pushl  0x1c(%esp)
    #else
    paging_init (mbi_addr);
    #endif

    KERN_DEBUG("Kernel initialized.\n");
  105024:	8d b3 ba ba ff ff    	lea    -0x4546(%ebx),%esi
    pdir_init_kern(mbi_addr);
  10502a:	e8 51 1b 00 00       	call   106b80 <pdir_init_kern>
    KERN_DEBUG("Kernel initialized.\n");
  10502f:	8d 83 a5 ba ff ff    	lea    -0x455b(%ebx),%eax
  105035:	83 c4 0c             	add    $0xc,%esp
  105038:	50                   	push   %eax
  105039:	6a 69                	push   $0x69
  10503b:	56                   	push   %esi
  10503c:	e8 86 e0 ff ff       	call   1030c7 <debug_normal>
    KERN_DEBUG("In kernel main.\n\n");
  105041:	8d 83 cb ba ff ff    	lea    -0x4535(%ebx),%eax
  105047:	83 c4 0c             	add    $0xc,%esp
  10504a:	50                   	push   %eax
  10504b:	6a 19                	push   $0x19
  10504d:	56                   	push   %esi
  10504e:	e8 74 e0 ff ff       	call   1030c7 <debug_normal>
      dprintf("Testing the MATIntro layer...\n");
  105053:	8d 83 b0 bb ff ff    	lea    -0x4450(%ebx),%eax
  105059:	89 04 24             	mov    %eax,(%esp)
  10505c:	e8 37 e3 ff ff       	call   103398 <dprintf>
      if(test_MATIntro() == 0)
  105061:	e8 1a 07 00 00       	call   105780 <test_MATIntro>
  105066:	83 c4 10             	add    $0x10,%esp
  105069:	84 c0                	test   %al,%al
  10506b:	0f 85 f7 01 00 00    	jne    105268 <kern_init+0x258>
        dprintf("All tests passed.\n");
  105071:	8d 83 dd ba ff ff    	lea    -0x4523(%ebx),%eax
  105077:	83 ec 0c             	sub    $0xc,%esp
  10507a:	50                   	push   %eax
  10507b:	e8 18 e3 ff ff       	call   103398 <dprintf>
  105080:	83 c4 10             	add    $0x10,%esp
      dprintf("\n");
  105083:	8d b3 db ba ff ff    	lea    -0x4525(%ebx),%esi
  105089:	83 ec 0c             	sub    $0xc,%esp
  10508c:	56                   	push   %esi
  10508d:	e8 06 e3 ff ff       	call   103398 <dprintf>
      dprintf("Testing the MATInit layer...\n");
  105092:	8d 83 fe ba ff ff    	lea    -0x4502(%ebx),%eax
  105098:	89 04 24             	mov    %eax,(%esp)
  10509b:	e8 f8 e2 ff ff       	call   103398 <dprintf>
      if(test_MATInit() == 0)
  1050a0:	e8 1b 09 00 00       	call   1059c0 <test_MATInit>
  1050a5:	83 c4 10             	add    $0x10,%esp
  1050a8:	84 c0                	test   %al,%al
  1050aa:	0f 85 80 02 00 00    	jne    105330 <kern_init+0x320>
        dprintf("All tests passed.\n");
  1050b0:	8d 83 dd ba ff ff    	lea    -0x4523(%ebx),%eax
  1050b6:	83 ec 0c             	sub    $0xc,%esp
  1050b9:	50                   	push   %eax
  1050ba:	e8 d9 e2 ff ff       	call   103398 <dprintf>
  1050bf:	83 c4 10             	add    $0x10,%esp
      dprintf("\n");
  1050c2:	83 ec 0c             	sub    $0xc,%esp
  1050c5:	56                   	push   %esi
  1050c6:	e8 cd e2 ff ff       	call   103398 <dprintf>
      dprintf("Testing the MATOp layer...\n");
  1050cb:	8d 83 1c bb ff ff    	lea    -0x44e4(%ebx),%eax
  1050d1:	89 04 24             	mov    %eax,(%esp)
  1050d4:	e8 bf e2 ff ff       	call   103398 <dprintf>
      if(test_MATOp() == 0)
  1050d9:	e8 b2 0a 00 00       	call   105b90 <test_MATOp>
  1050de:	83 c4 10             	add    $0x10,%esp
  1050e1:	84 c0                	test   %al,%al
  1050e3:	0f 85 27 02 00 00    	jne    105310 <kern_init+0x300>
        dprintf("All tests passed.\n");
  1050e9:	8d 83 dd ba ff ff    	lea    -0x4523(%ebx),%eax
  1050ef:	83 ec 0c             	sub    $0xc,%esp
  1050f2:	50                   	push   %eax
  1050f3:	e8 a0 e2 ff ff       	call   103398 <dprintf>
  1050f8:	83 c4 10             	add    $0x10,%esp
      dprintf("\n");
  1050fb:	83 ec 0c             	sub    $0xc,%esp
  1050fe:	56                   	push   %esi
  1050ff:	e8 94 e2 ff ff       	call   103398 <dprintf>
      dprintf("Testing the MContainer layer...\n");
  105104:	8d 83 d0 bb ff ff    	lea    -0x4430(%ebx),%eax
  10510a:	89 04 24             	mov    %eax,(%esp)
  10510d:	e8 86 e2 ff ff       	call   103398 <dprintf>
      if(test_MContainer() == 0)
  105112:	e8 d9 0e 00 00       	call   105ff0 <test_MContainer>
  105117:	83 c4 10             	add    $0x10,%esp
  10511a:	84 c0                	test   %al,%al
  10511c:	0f 85 ce 01 00 00    	jne    1052f0 <kern_init+0x2e0>
        dprintf("All tests passed.\n");
  105122:	8d 83 dd ba ff ff    	lea    -0x4523(%ebx),%eax
  105128:	83 ec 0c             	sub    $0xc,%esp
  10512b:	50                   	push   %eax
  10512c:	e8 67 e2 ff ff       	call   103398 <dprintf>
  105131:	83 c4 10             	add    $0x10,%esp
      dprintf("\n");
  105134:	83 ec 0c             	sub    $0xc,%esp
  105137:	56                   	push   %esi
  105138:	e8 5b e2 ff ff       	call   103398 <dprintf>
      dprintf("Testing the MPTIntro layer...\n");
  10513d:	8d 83 f4 bb ff ff    	lea    -0x440c(%ebx),%eax
  105143:	89 04 24             	mov    %eax,(%esp)
  105146:	e8 4d e2 ff ff       	call   103398 <dprintf>
      if(test_MPTIntro() == 0)
  10514b:	e8 e0 12 00 00       	call   106430 <test_MPTIntro>
  105150:	83 c4 10             	add    $0x10,%esp
  105153:	84 c0                	test   %al,%al
  105155:	0f 85 75 01 00 00    	jne    1052d0 <kern_init+0x2c0>
        dprintf("All tests passed.\n");
  10515b:	8d 83 dd ba ff ff    	lea    -0x4523(%ebx),%eax
  105161:	83 ec 0c             	sub    $0xc,%esp
  105164:	50                   	push   %eax
  105165:	e8 2e e2 ff ff       	call   103398 <dprintf>
  10516a:	83 c4 10             	add    $0x10,%esp
      dprintf("\n");
  10516d:	83 ec 0c             	sub    $0xc,%esp
  105170:	56                   	push   %esi
  105171:	e8 22 e2 ff ff       	call   103398 <dprintf>
      dprintf("Testing the MPTOp layer...\n");
  105176:	8d 83 38 bb ff ff    	lea    -0x44c8(%ebx),%eax
  10517c:	89 04 24             	mov    %eax,(%esp)
  10517f:	e8 14 e2 ff ff       	call   103398 <dprintf>
      if(test_MPTOp() == 0)
  105184:	e8 e7 16 00 00       	call   106870 <test_MPTOp>
  105189:	83 c4 10             	add    $0x10,%esp
  10518c:	84 c0                	test   %al,%al
  10518e:	0f 85 1c 01 00 00    	jne    1052b0 <kern_init+0x2a0>
        dprintf("All tests passed.\n");
  105194:	8d 83 dd ba ff ff    	lea    -0x4523(%ebx),%eax
  10519a:	83 ec 0c             	sub    $0xc,%esp
  10519d:	50                   	push   %eax
  10519e:	e8 f5 e1 ff ff       	call   103398 <dprintf>
  1051a3:	83 c4 10             	add    $0x10,%esp
      dprintf("\n");
  1051a6:	83 ec 0c             	sub    $0xc,%esp
  1051a9:	56                   	push   %esi
  1051aa:	e8 e9 e1 ff ff       	call   103398 <dprintf>
      dprintf("Testing the MPTComm layer...\n");
  1051af:	8d 83 54 bb ff ff    	lea    -0x44ac(%ebx),%eax
  1051b5:	89 04 24             	mov    %eax,(%esp)
  1051b8:	e8 db e1 ff ff       	call   103398 <dprintf>
      if(test_MPTComm() == 0)
  1051bd:	e8 9e 19 00 00       	call   106b60 <test_MPTComm>
  1051c2:	83 c4 10             	add    $0x10,%esp
  1051c5:	84 c0                	test   %al,%al
  1051c7:	0f 85 cb 00 00 00    	jne    105298 <kern_init+0x288>
        dprintf("All tests passed.\n");
  1051cd:	8d 83 dd ba ff ff    	lea    -0x4523(%ebx),%eax
  1051d3:	83 ec 0c             	sub    $0xc,%esp
  1051d6:	50                   	push   %eax
  1051d7:	e8 bc e1 ff ff       	call   103398 <dprintf>
  1051dc:	83 c4 10             	add    $0x10,%esp
      dprintf("\n");
  1051df:	83 ec 0c             	sub    $0xc,%esp
  1051e2:	56                   	push   %esi
  1051e3:	e8 b0 e1 ff ff       	call   103398 <dprintf>
      dprintf("Testing the MPTKern layer...\n");
  1051e8:	8d 83 72 bb ff ff    	lea    -0x448e(%ebx),%eax
  1051ee:	89 04 24             	mov    %eax,(%esp)
  1051f1:	e8 a2 e1 ff ff       	call   103398 <dprintf>
      if(test_MPTKern() == 0)
  1051f6:	e8 75 1b 00 00       	call   106d70 <test_MPTKern>
  1051fb:	83 c4 10             	add    $0x10,%esp
  1051fe:	84 c0                	test   %al,%al
  105200:	75 7e                	jne    105280 <kern_init+0x270>
        dprintf("All tests passed.\n");
  105202:	8d 83 dd ba ff ff    	lea    -0x4523(%ebx),%eax
  105208:	83 ec 0c             	sub    $0xc,%esp
  10520b:	50                   	push   %eax
  10520c:	e8 87 e1 ff ff       	call   103398 <dprintf>
  105211:	83 c4 10             	add    $0x10,%esp
      dprintf("\n");
  105214:	83 ec 0c             	sub    $0xc,%esp
  105217:	56                   	push   %esi
  105218:	e8 7b e1 ff ff       	call   103398 <dprintf>
      dprintf("Testing the MPTNew layer...\n");
  10521d:	8d 83 90 bb ff ff    	lea    -0x4470(%ebx),%eax
  105223:	89 04 24             	mov    %eax,(%esp)
  105226:	e8 6d e1 ff ff       	call   103398 <dprintf>
      if(test_MPTNew() == 0)
  10522b:	e8 30 1e 00 00       	call   107060 <test_MPTNew>
  105230:	83 c4 10             	add    $0x10,%esp
  105233:	84 c0                	test   %al,%al
  105235:	0f 84 15 01 00 00    	je     105350 <kern_init+0x340>
        dprintf("Test failed.\n");
  10523b:	8d 83 f0 ba ff ff    	lea    -0x4510(%ebx),%eax
  105241:	83 ec 0c             	sub    $0xc,%esp
  105244:	50                   	push   %eax
  105245:	e8 4e e1 ff ff       	call   103398 <dprintf>
  10524a:	83 c4 10             	add    $0x10,%esp
      dprintf("\nTest complete. Please Use Ctrl-a x to exit qemu.");
  10524d:	8d 83 14 bc ff ff    	lea    -0x43ec(%ebx),%eax
  105253:	83 ec 0c             	sub    $0xc,%esp
  105256:	50                   	push   %eax
  105257:	e8 3c e1 ff ff       	call   103398 <dprintf>

    kern_main ();
}
  10525c:	83 c4 14             	add    $0x14,%esp
  10525f:	5b                   	pop    %ebx
  105260:	5e                   	pop    %esi
  105261:	c3                   	ret    
  105262:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        dprintf("Test failed.\n");
  105268:	8d 83 f0 ba ff ff    	lea    -0x4510(%ebx),%eax
  10526e:	83 ec 0c             	sub    $0xc,%esp
  105271:	50                   	push   %eax
  105272:	e8 21 e1 ff ff       	call   103398 <dprintf>
  105277:	83 c4 10             	add    $0x10,%esp
  10527a:	e9 04 fe ff ff       	jmp    105083 <kern_init+0x73>
  10527f:	90                   	nop
        dprintf("Test failed.\n");
  105280:	8d 83 f0 ba ff ff    	lea    -0x4510(%ebx),%eax
  105286:	83 ec 0c             	sub    $0xc,%esp
  105289:	50                   	push   %eax
  10528a:	e8 09 e1 ff ff       	call   103398 <dprintf>
  10528f:	83 c4 10             	add    $0x10,%esp
  105292:	eb 80                	jmp    105214 <kern_init+0x204>
  105294:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        dprintf("Test failed.\n");
  105298:	8d 83 f0 ba ff ff    	lea    -0x4510(%ebx),%eax
  10529e:	83 ec 0c             	sub    $0xc,%esp
  1052a1:	50                   	push   %eax
  1052a2:	e8 f1 e0 ff ff       	call   103398 <dprintf>
  1052a7:	83 c4 10             	add    $0x10,%esp
  1052aa:	e9 30 ff ff ff       	jmp    1051df <kern_init+0x1cf>
  1052af:	90                   	nop
        dprintf("Test failed.\n");
  1052b0:	8d 83 f0 ba ff ff    	lea    -0x4510(%ebx),%eax
  1052b6:	83 ec 0c             	sub    $0xc,%esp
  1052b9:	50                   	push   %eax
  1052ba:	e8 d9 e0 ff ff       	call   103398 <dprintf>
  1052bf:	83 c4 10             	add    $0x10,%esp
  1052c2:	e9 df fe ff ff       	jmp    1051a6 <kern_init+0x196>
  1052c7:	89 f6                	mov    %esi,%esi
  1052c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        dprintf("Test failed.\n");
  1052d0:	8d 83 f0 ba ff ff    	lea    -0x4510(%ebx),%eax
  1052d6:	83 ec 0c             	sub    $0xc,%esp
  1052d9:	50                   	push   %eax
  1052da:	e8 b9 e0 ff ff       	call   103398 <dprintf>
  1052df:	83 c4 10             	add    $0x10,%esp
  1052e2:	e9 86 fe ff ff       	jmp    10516d <kern_init+0x15d>
  1052e7:	89 f6                	mov    %esi,%esi
  1052e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        dprintf("Test failed.\n");
  1052f0:	8d 83 f0 ba ff ff    	lea    -0x4510(%ebx),%eax
  1052f6:	83 ec 0c             	sub    $0xc,%esp
  1052f9:	50                   	push   %eax
  1052fa:	e8 99 e0 ff ff       	call   103398 <dprintf>
  1052ff:	83 c4 10             	add    $0x10,%esp
  105302:	e9 2d fe ff ff       	jmp    105134 <kern_init+0x124>
  105307:	89 f6                	mov    %esi,%esi
  105309:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        dprintf("Test failed.\n");
  105310:	8d 83 f0 ba ff ff    	lea    -0x4510(%ebx),%eax
  105316:	83 ec 0c             	sub    $0xc,%esp
  105319:	50                   	push   %eax
  10531a:	e8 79 e0 ff ff       	call   103398 <dprintf>
  10531f:	83 c4 10             	add    $0x10,%esp
  105322:	e9 d4 fd ff ff       	jmp    1050fb <kern_init+0xeb>
  105327:	89 f6                	mov    %esi,%esi
  105329:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        dprintf("Test failed.\n");
  105330:	8d 83 f0 ba ff ff    	lea    -0x4510(%ebx),%eax
  105336:	83 ec 0c             	sub    $0xc,%esp
  105339:	50                   	push   %eax
  10533a:	e8 59 e0 ff ff       	call   103398 <dprintf>
  10533f:	83 c4 10             	add    $0x10,%esp
  105342:	e9 7b fd ff ff       	jmp    1050c2 <kern_init+0xb2>
  105347:	89 f6                	mov    %esi,%esi
  105349:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        dprintf("All tests passed.\n");
  105350:	8d 83 dd ba ff ff    	lea    -0x4523(%ebx),%eax
  105356:	83 ec 0c             	sub    $0xc,%esp
  105359:	50                   	push   %eax
  10535a:	e8 39 e0 ff ff       	call   103398 <dprintf>
  10535f:	83 c4 10             	add    $0x10,%esp
  105362:	e9 e6 fe ff ff       	jmp    10524d <kern_init+0x23d>
  105367:	90                   	nop
  105368:	02 b0 ad 1b 03 00    	add    0x31bad(%eax),%dh
  10536e:	00 00                	add    %al,(%eax)
  105370:	fb                   	sti    
  105371:	4f                   	dec    %edi
  105372:	52                   	push   %edx
  105373:	e4                   	.byte 0xe4

00105374 <start>:
  105374:	fa                   	cli    
  105375:	3d 02 b0 ad 2b       	cmp    $0x2badb002,%eax
  10537a:	75 27                	jne    1053a3 <spin>
  10537c:	89 1d a4 53 10 00    	mov    %ebx,0x1053a4
  105382:	66 c7 05 72 04 00 00 	movw   $0x1234,0x472
  105389:	34 12 
  10538b:	6a 02                	push   $0x2
  10538d:	9d                   	popf   
  10538e:	bd 00 00 00 00       	mov    $0x0,%ebp
  105393:	bc 00 60 91 00       	mov    $0x916000,%esp
  105398:	ff 35 a4 53 10 00    	pushl  0x1053a4
  10539e:	e8 6d fc ff ff       	call   105010 <kern_init>

001053a3 <spin>:
  1053a3:	f4                   	hlt    

001053a4 <multiboot_ptr>:
  1053a4:	00 00                	add    %al,(%eax)
  1053a6:	00 00                	add    %al,(%eax)
  1053a8:	66 90                	xchg   %ax,%ax
  1053aa:	66 90                	xchg   %ax,%ax
  1053ac:	66 90                	xchg   %ax,%ax
  1053ae:	66 90                	xchg   %ax,%ax

001053b0 <get_nps>:
static struct ATStruct AT[1 << 20];  

//The getter function for NUM_PAGES.
unsigned int
get_nps(void)
{
  1053b0:	e8 52 b0 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  1053b5:	05 4b 6c 00 00       	add    $0x6c4b,%eax
	return NUM_PAGES;
  1053ba:	8b 80 60 7f 80 00    	mov    0x807f60(%eax),%eax
}
  1053c0:	c3                   	ret    
  1053c1:	eb 0d                	jmp    1053d0 <set_nps>
  1053c3:	90                   	nop
  1053c4:	90                   	nop
  1053c5:	90                   	nop
  1053c6:	90                   	nop
  1053c7:	90                   	nop
  1053c8:	90                   	nop
  1053c9:	90                   	nop
  1053ca:	90                   	nop
  1053cb:	90                   	nop
  1053cc:	90                   	nop
  1053cd:	90                   	nop
  1053ce:	90                   	nop
  1053cf:	90                   	nop

001053d0 <set_nps>:

//The setter function for NUM_PAGES.
void
set_nps(unsigned int nps)
{
	NUM_PAGES = nps;
  1053d0:	8b 54 24 04          	mov    0x4(%esp),%edx
  1053d4:	e8 2e b0 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  1053d9:	05 27 6c 00 00       	add    $0x6c27,%eax
  1053de:	89 90 60 7f 80 00    	mov    %edx,0x807f60(%eax)
  1053e4:	c3                   	ret    
  1053e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1053e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001053f0 <at_is_norm>:
  */
unsigned int
at_is_norm(unsigned int page_index)
{
  //TODO
  if(AT[page_index].perm > 1)
  1053f0:	8b 54 24 04          	mov    0x4(%esp),%edx
  1053f4:	e8 0e b0 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  1053f9:	05 07 6c 00 00       	add    $0x6c07,%eax
  1053fe:	83 bc d0 60 7f 00 00 	cmpl   $0x1,0x7f60(%eax,%edx,8)
  105405:	01 
  105406:	0f 97 c0             	seta   %al
  105409:	0f b6 c0             	movzbl %al,%eax
    return 1;
  return 0;
}
  10540c:	c3                   	ret    
  10540d:	8d 76 00             	lea    0x0(%esi),%esi

00105410 <at_set_perm>:
  *  - It also marks the page as unallocated.
  * Hint: See the definition of ATStruct for allocated.
  */
void
at_set_perm(unsigned int page_index, unsigned int norm_val)
{
  105410:	8b 54 24 04          	mov    0x4(%esp),%edx
  //TODO
  AT[page_index].perm = norm_val;
  105414:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  105418:	e8 ea af ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  10541d:	05 e3 6b 00 00       	add    $0x6be3,%eax
  105422:	89 8c d0 60 7f 00 00 	mov    %ecx,0x7f60(%eax,%edx,8)
  AT[page_index].allocated = 0;
  105429:	c7 84 d0 64 7f 00 00 	movl   $0x0,0x7f64(%eax,%edx,8)
  105430:	00 00 00 00 
  105434:	c3                   	ret    
  105435:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  105439:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00105440 <at_is_allocated>:
unsigned int
at_is_allocated(unsigned int page_index)
{
  //TODO

  if(AT[page_index].allocated > 0)
  105440:	8b 54 24 04          	mov    0x4(%esp),%edx
  105444:	e8 be af ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  105449:	05 b7 6b 00 00       	add    $0x6bb7,%eax
  10544e:	8b 84 d0 64 7f 00 00 	mov    0x7f64(%eax,%edx,8),%eax
  105455:	85 c0                	test   %eax,%eax
  105457:	0f 95 c0             	setne  %al
  10545a:	0f b6 c0             	movzbl %al,%eax
    return 1;
  return 0;
}
  10545d:	c3                   	ret    
  10545e:	66 90                	xchg   %ax,%ax

00105460 <at_set_allocated>:
  */
void
at_set_allocated(unsigned int page_index, unsigned int allocated)
{
  //TODO
  AT[page_index].allocated = allocated;
  105460:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  105464:	8b 54 24 04          	mov    0x4(%esp),%edx
  105468:	e8 9a af ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  10546d:	05 93 6b 00 00       	add    $0x6b93,%eax
  105472:	89 8c d0 64 7f 00 00 	mov    %ecx,0x7f64(%eax,%edx,8)
  105479:	c3                   	ret    
  10547a:	66 90                	xchg   %ax,%ax
  10547c:	66 90                	xchg   %ax,%ax
  10547e:	66 90                	xchg   %ax,%ax

00105480 <MATIntro_test1>:
#include <lib/debug.h>
#include "export.h"

int MATIntro_test1()
{
  105480:	55                   	push   %ebp
  105481:	57                   	push   %edi
  int rn10[] = {1,3,5,6,78,3576,32,8,0,100};
  int i;
  int nps = get_nps();
  105482:	bd 01 00 00 00       	mov    $0x1,%ebp
{
  105487:	56                   	push   %esi
  105488:	53                   	push   %ebx
  105489:	e8 81 af ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  10548e:	81 c3 72 6b 00 00    	add    $0x6b72,%ebx
  105494:	83 ec 4c             	sub    $0x4c,%esp
  int rn10[] = {1,3,5,6,78,3576,32,8,0,100};
  105497:	c7 44 24 18 01 00 00 	movl   $0x1,0x18(%esp)
  10549e:	00 
  10549f:	c7 44 24 1c 03 00 00 	movl   $0x3,0x1c(%esp)
  1054a6:	00 
  1054a7:	8d 74 24 1c          	lea    0x1c(%esp),%esi
  1054ab:	c7 44 24 20 05 00 00 	movl   $0x5,0x20(%esp)
  1054b2:	00 
  1054b3:	c7 44 24 24 06 00 00 	movl   $0x6,0x24(%esp)
  1054ba:	00 
  1054bb:	8d 7c 24 40          	lea    0x40(%esp),%edi
  1054bf:	c7 44 24 28 4e 00 00 	movl   $0x4e,0x28(%esp)
  1054c6:	00 
  1054c7:	c7 44 24 2c f8 0d 00 	movl   $0xdf8,0x2c(%esp)
  1054ce:	00 
  1054cf:	c7 44 24 30 20 00 00 	movl   $0x20,0x30(%esp)
  1054d6:	00 
  1054d7:	c7 44 24 34 08 00 00 	movl   $0x8,0x34(%esp)
  1054de:	00 
  1054df:	c7 44 24 38 00 00 00 	movl   $0x0,0x38(%esp)
  1054e6:	00 
  1054e7:	c7 44 24 3c 64 00 00 	movl   $0x64,0x3c(%esp)
  1054ee:	00 
  int nps = get_nps();
  1054ef:	e8 bc fe ff ff       	call   1053b0 <get_nps>
  1054f4:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1054f8:	eb 0b                	jmp    105505 <MATIntro_test1+0x85>
  1054fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  105500:	8b 2e                	mov    (%esi),%ebp
  105502:	83 c6 04             	add    $0x4,%esi
  for(i = 0; i< 10; i++) {
    set_nps(rn10[i]);
  105505:	83 ec 0c             	sub    $0xc,%esp
  105508:	55                   	push   %ebp
  105509:	e8 c2 fe ff ff       	call   1053d0 <set_nps>
    if (get_nps() != rn10[i]) {
  10550e:	e8 9d fe ff ff       	call   1053b0 <get_nps>
  105513:	83 c4 10             	add    $0x10,%esp
  105516:	39 c5                	cmp    %eax,%ebp
  105518:	75 2e                	jne    105548 <MATIntro_test1+0xc8>
  for(i = 0; i< 10; i++) {
  10551a:	39 fe                	cmp    %edi,%esi
  10551c:	75 e2                	jne    105500 <MATIntro_test1+0x80>
      set_nps(nps);
      dprintf("test 1 failed.\n");
      return 1;
    }
  }
  set_nps(nps);
  10551e:	83 ec 0c             	sub    $0xc,%esp
  105521:	ff 74 24 18          	pushl  0x18(%esp)
  105525:	e8 a6 fe ff ff       	call   1053d0 <set_nps>
  dprintf("test 1 passed.\n");
  10552a:	8d 83 56 bc ff ff    	lea    -0x43aa(%ebx),%eax
  105530:	89 04 24             	mov    %eax,(%esp)
  105533:	e8 60 de ff ff       	call   103398 <dprintf>
  return 0;
  105538:	83 c4 10             	add    $0x10,%esp
  10553b:	31 c0                	xor    %eax,%eax
}
  10553d:	83 c4 4c             	add    $0x4c,%esp
  105540:	5b                   	pop    %ebx
  105541:	5e                   	pop    %esi
  105542:	5f                   	pop    %edi
  105543:	5d                   	pop    %ebp
  105544:	c3                   	ret    
  105545:	8d 76 00             	lea    0x0(%esi),%esi
      set_nps(nps);
  105548:	83 ec 0c             	sub    $0xc,%esp
  10554b:	ff 74 24 18          	pushl  0x18(%esp)
  10554f:	e8 7c fe ff ff       	call   1053d0 <set_nps>
      dprintf("test 1 failed.\n");
  105554:	8d 83 46 bc ff ff    	lea    -0x43ba(%ebx),%eax
  10555a:	89 04 24             	mov    %eax,(%esp)
  10555d:	e8 36 de ff ff       	call   103398 <dprintf>
      return 1;
  105562:	83 c4 10             	add    $0x10,%esp
  105565:	b8 01 00 00 00       	mov    $0x1,%eax
}
  10556a:	83 c4 4c             	add    $0x4c,%esp
  10556d:	5b                   	pop    %ebx
  10556e:	5e                   	pop    %esi
  10556f:	5f                   	pop    %edi
  105570:	5d                   	pop    %ebp
  105571:	c3                   	ret    
  105572:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  105579:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00105580 <MATIntro_test2>:

int MATIntro_test2()
{
  105580:	53                   	push   %ebx
  105581:	e8 89 ae ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  105586:	81 c3 7a 6a 00 00    	add    $0x6a7a,%ebx
  10558c:	83 ec 10             	sub    $0x10,%esp
  at_set_perm(0, 0);
  10558f:	6a 00                	push   $0x0
  105591:	6a 00                	push   $0x0
  105593:	e8 78 fe ff ff       	call   105410 <at_set_perm>
  if (at_is_norm(0) != 0 || at_is_allocated(0) != 0) {
  105598:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10559f:	e8 4c fe ff ff       	call   1053f0 <at_is_norm>
  1055a4:	83 c4 10             	add    $0x10,%esp
  1055a7:	85 c0                	test   %eax,%eax
  1055a9:	75 11                	jne    1055bc <MATIntro_test2+0x3c>
  1055ab:	83 ec 0c             	sub    $0xc,%esp
  1055ae:	6a 00                	push   $0x0
  1055b0:	e8 8b fe ff ff       	call   105440 <at_is_allocated>
  1055b5:	83 c4 10             	add    $0x10,%esp
  1055b8:	85 c0                	test   %eax,%eax
  1055ba:	74 2c                	je     1055e8 <MATIntro_test2+0x68>
    at_set_perm(0, 0);
  1055bc:	83 ec 08             	sub    $0x8,%esp
  1055bf:	6a 00                	push   $0x0
  1055c1:	6a 00                	push   $0x0
  1055c3:	e8 48 fe ff ff       	call   105410 <at_set_perm>
    dprintf("test 2 failed.\n");
  1055c8:	8d 83 66 bc ff ff    	lea    -0x439a(%ebx),%eax
  1055ce:	89 04 24             	mov    %eax,(%esp)
  1055d1:	e8 c2 dd ff ff       	call   103398 <dprintf>
    return 1;
  1055d6:	83 c4 10             	add    $0x10,%esp
  1055d9:	b8 01 00 00 00       	mov    $0x1,%eax
    return 1;
  }
  at_set_perm(0, 0);
  dprintf("test 2 passed.\n");
  return 0;
}
  1055de:	83 c4 08             	add    $0x8,%esp
  1055e1:	5b                   	pop    %ebx
  1055e2:	c3                   	ret    
  1055e3:	90                   	nop
  1055e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  at_set_perm(0, 1);
  1055e8:	83 ec 08             	sub    $0x8,%esp
  1055eb:	6a 01                	push   $0x1
  1055ed:	6a 00                	push   $0x0
  1055ef:	e8 1c fe ff ff       	call   105410 <at_set_perm>
  if (at_is_norm(0) != 0 || at_is_allocated(0) != 0) {
  1055f4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1055fb:	e8 f0 fd ff ff       	call   1053f0 <at_is_norm>
  105600:	83 c4 10             	add    $0x10,%esp
  105603:	85 c0                	test   %eax,%eax
  105605:	75 b5                	jne    1055bc <MATIntro_test2+0x3c>
  105607:	83 ec 0c             	sub    $0xc,%esp
  10560a:	6a 00                	push   $0x0
  10560c:	e8 2f fe ff ff       	call   105440 <at_is_allocated>
  105611:	83 c4 10             	add    $0x10,%esp
  105614:	85 c0                	test   %eax,%eax
  105616:	75 a4                	jne    1055bc <MATIntro_test2+0x3c>
  at_set_perm(0, 2);
  105618:	83 ec 08             	sub    $0x8,%esp
  10561b:	6a 02                	push   $0x2
  10561d:	6a 00                	push   $0x0
  10561f:	e8 ec fd ff ff       	call   105410 <at_set_perm>
  if (at_is_norm(0) != 1 || at_is_allocated(0) != 0) {
  105624:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10562b:	e8 c0 fd ff ff       	call   1053f0 <at_is_norm>
  105630:	83 c4 10             	add    $0x10,%esp
  105633:	83 f8 01             	cmp    $0x1,%eax
  105636:	75 84                	jne    1055bc <MATIntro_test2+0x3c>
  105638:	83 ec 0c             	sub    $0xc,%esp
  10563b:	6a 00                	push   $0x0
  10563d:	e8 fe fd ff ff       	call   105440 <at_is_allocated>
  105642:	83 c4 10             	add    $0x10,%esp
  105645:	85 c0                	test   %eax,%eax
  105647:	0f 85 6f ff ff ff    	jne    1055bc <MATIntro_test2+0x3c>
  at_set_perm(0, 100);
  10564d:	83 ec 08             	sub    $0x8,%esp
  105650:	6a 64                	push   $0x64
  105652:	6a 00                	push   $0x0
  105654:	e8 b7 fd ff ff       	call   105410 <at_set_perm>
  if (at_is_norm(0) != 1 || at_is_allocated(0) != 0) {
  105659:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  105660:	e8 8b fd ff ff       	call   1053f0 <at_is_norm>
  105665:	83 c4 10             	add    $0x10,%esp
  105668:	83 f8 01             	cmp    $0x1,%eax
  10566b:	0f 85 4b ff ff ff    	jne    1055bc <MATIntro_test2+0x3c>
  105671:	83 ec 0c             	sub    $0xc,%esp
  105674:	6a 00                	push   $0x0
  105676:	e8 c5 fd ff ff       	call   105440 <at_is_allocated>
  10567b:	83 c4 10             	add    $0x10,%esp
  10567e:	85 c0                	test   %eax,%eax
  105680:	0f 85 36 ff ff ff    	jne    1055bc <MATIntro_test2+0x3c>
  at_set_perm(0, 0);
  105686:	83 ec 08             	sub    $0x8,%esp
  105689:	6a 00                	push   $0x0
  10568b:	6a 00                	push   $0x0
  10568d:	e8 7e fd ff ff       	call   105410 <at_set_perm>
  dprintf("test 2 passed.\n");
  105692:	8d 83 76 bc ff ff    	lea    -0x438a(%ebx),%eax
  105698:	89 04 24             	mov    %eax,(%esp)
  10569b:	e8 f8 dc ff ff       	call   103398 <dprintf>
  1056a0:	83 c4 10             	add    $0x10,%esp
  return 0;
  1056a3:	31 c0                	xor    %eax,%eax
  1056a5:	e9 34 ff ff ff       	jmp    1055de <MATIntro_test2+0x5e>
  1056aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

001056b0 <MATIntro_test3>:

int MATIntro_test3()
{
  1056b0:	53                   	push   %ebx
  1056b1:	e8 59 ad ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  1056b6:	81 c3 4a 69 00 00    	add    $0x694a,%ebx
  1056bc:	83 ec 10             	sub    $0x10,%esp
  at_set_allocated(1, 0);
  1056bf:	6a 00                	push   $0x0
  1056c1:	6a 01                	push   $0x1
  1056c3:	e8 98 fd ff ff       	call   105460 <at_set_allocated>
  if (at_is_allocated(1) != 0) {
  1056c8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1056cf:	e8 6c fd ff ff       	call   105440 <at_is_allocated>
  1056d4:	83 c4 10             	add    $0x10,%esp
  1056d7:	85 c0                	test   %eax,%eax
  1056d9:	75 20                	jne    1056fb <MATIntro_test3+0x4b>
    at_set_allocated(1, 0);
    dprintf("test 3 failed.\n");
    return 1;
  }
  at_set_allocated(1, 1);
  1056db:	83 ec 08             	sub    $0x8,%esp
  1056de:	6a 01                	push   $0x1
  1056e0:	6a 01                	push   $0x1
  1056e2:	e8 79 fd ff ff       	call   105460 <at_set_allocated>
  if (at_is_allocated(1) != 1) {
  1056e7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1056ee:	e8 4d fd ff ff       	call   105440 <at_is_allocated>
  1056f3:	83 c4 10             	add    $0x10,%esp
  1056f6:	83 f8 01             	cmp    $0x1,%eax
  1056f9:	74 2d                	je     105728 <MATIntro_test3+0x78>
    at_set_allocated(1, 0);
  1056fb:	83 ec 08             	sub    $0x8,%esp
  1056fe:	6a 00                	push   $0x0
  105700:	6a 01                	push   $0x1
  105702:	e8 59 fd ff ff       	call   105460 <at_set_allocated>
    dprintf("test 3 failed.\n");
  105707:	8d 83 86 bc ff ff    	lea    -0x437a(%ebx),%eax
  10570d:	89 04 24             	mov    %eax,(%esp)
  105710:	e8 83 dc ff ff       	call   103398 <dprintf>
    return 1;
  105715:	83 c4 10             	add    $0x10,%esp
  105718:	b8 01 00 00 00       	mov    $0x1,%eax
    return 1;
  }
  at_set_allocated(1, 0);
  dprintf("test 3 passed.\n");
  return 0;
}
  10571d:	83 c4 08             	add    $0x8,%esp
  105720:	5b                   	pop    %ebx
  105721:	c3                   	ret    
  105722:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  at_set_allocated(1, 100);
  105728:	83 ec 08             	sub    $0x8,%esp
  10572b:	6a 64                	push   $0x64
  10572d:	6a 01                	push   $0x1
  10572f:	e8 2c fd ff ff       	call   105460 <at_set_allocated>
  if (at_is_allocated(1) != 1) {
  105734:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  10573b:	e8 00 fd ff ff       	call   105440 <at_is_allocated>
  105740:	83 c4 10             	add    $0x10,%esp
  105743:	83 f8 01             	cmp    $0x1,%eax
  105746:	75 b3                	jne    1056fb <MATIntro_test3+0x4b>
  at_set_allocated(1, 0);
  105748:	83 ec 08             	sub    $0x8,%esp
  10574b:	6a 00                	push   $0x0
  10574d:	6a 01                	push   $0x1
  10574f:	e8 0c fd ff ff       	call   105460 <at_set_allocated>
  dprintf("test 3 passed.\n");
  105754:	8d 83 96 bc ff ff    	lea    -0x436a(%ebx),%eax
  10575a:	89 04 24             	mov    %eax,(%esp)
  10575d:	e8 36 dc ff ff       	call   103398 <dprintf>
  105762:	83 c4 10             	add    $0x10,%esp
  return 0;
  105765:	31 c0                	xor    %eax,%eax
  105767:	eb b4                	jmp    10571d <MATIntro_test3+0x6d>
  105769:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00105770 <MATIntro_test_own>:
int MATIntro_test_own()
{
  // TODO (optional)
  // dprintf("own test passed.\n");
  return 0;
}
  105770:	31 c0                	xor    %eax,%eax
  105772:	c3                   	ret    
  105773:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  105779:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00105780 <test_MATIntro>:

int test_MATIntro()
{
  105780:	53                   	push   %ebx
  105781:	83 ec 08             	sub    $0x8,%esp
  return MATIntro_test1() + MATIntro_test2() + MATIntro_test3() + MATIntro_test_own();
  105784:	e8 f7 fc ff ff       	call   105480 <MATIntro_test1>
  105789:	89 c3                	mov    %eax,%ebx
  10578b:	e8 f0 fd ff ff       	call   105580 <MATIntro_test2>
  105790:	01 c3                	add    %eax,%ebx
  105792:	e8 19 ff ff ff       	call   1056b0 <MATIntro_test3>
}
  105797:	83 c4 08             	add    $0x8,%esp
  return MATIntro_test1() + MATIntro_test2() + MATIntro_test3() + MATIntro_test_own();
  10579a:	01 d8                	add    %ebx,%eax
}
  10579c:	5b                   	pop    %ebx
  10579d:	c3                   	ret    
  10579e:	66 90                	xchg   %ax,%ax

001057a0 <pmem_init>:
  *
  *  - Review import.h in the current directory for the list of available getter and setter functions.
  */
void
pmem_init(unsigned int mbi_addr)
{
  1057a0:	55                   	push   %ebp
  1057a1:	57                   	push   %edi
  1057a2:	56                   	push   %esi
  1057a3:	53                   	push   %ebx
  1057a4:	e8 66 ac ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  1057a9:	81 c3 57 68 00 00    	add    $0x6857,%ebx
  1057af:	83 ec 28             	sub    $0x28,%esp
  // TODO: Define your local variables here.

  //Calls the lower layer initializatin primitives.
  //The parameter mbi_addr shell not be used in the further code.

  dprintf("start physical mm init.\n");
  1057b2:	8d 83 a6 bc ff ff    	lea    -0x435a(%ebx),%eax
  1057b8:	50                   	push   %eax
  1057b9:	e8 da db ff ff       	call   103398 <dprintf>
	devinit(mbi_addr);
  1057be:	58                   	pop    %eax
  1057bf:	ff 74 24 3c          	pushl  0x3c(%esp)
  1057c3:	e8 d0 b3 ff ff       	call   100b98 <devinit>
    * Hint 2: Think of it as the highest address possible in the ranges of the memory map table,
    *         divided by the page size plus 1.
    */
  // TODO

  int numRows = get_size();
  1057c8:	e8 38 b9 ff ff       	call   101105 <get_size>
  1057cd:	89 44 24 1c          	mov    %eax,0x1c(%esp)

  //nps = 2^20 / (2^10*2^2) + 1;

  int i ;
  nps = 0;
  for(i=0; i < numRows; i++){
  1057d1:	83 c4 10             	add    $0x10,%esp
  1057d4:	85 c0                	test   %eax,%eax
  1057d6:	0f 8e dd 00 00 00    	jle    1058b9 <pmem_init+0x119>
  1057dc:	31 f6                	xor    %esi,%esi
  1057de:	31 ed                	xor    %ebp,%ebp
  1057e0:	eb 0f                	jmp    1057f1 <pmem_init+0x51>
  1057e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1057e8:	83 c6 01             	add    $0x1,%esi
  1057eb:	39 74 24 0c          	cmp    %esi,0xc(%esp)
  1057ef:	74 3d                	je     10582e <pmem_init+0x8e>


      if(nps < (get_mms(i)+get_mml(i))){
  1057f1:	83 ec 0c             	sub    $0xc,%esp
  1057f4:	56                   	push   %esi
  1057f5:	e8 20 b9 ff ff       	call   10111a <get_mms>
  1057fa:	89 c7                	mov    %eax,%edi
  1057fc:	89 34 24             	mov    %esi,(%esp)
  1057ff:	e8 7c b9 ff ff       	call   101180 <get_mml>
  105804:	01 c7                	add    %eax,%edi
  105806:	83 c4 10             	add    $0x10,%esp
  105809:	39 ef                	cmp    %ebp,%edi
  10580b:	76 db                	jbe    1057e8 <pmem_init+0x48>

        nps = get_mms(i) + get_mml(i); 
  10580d:	83 ec 0c             	sub    $0xc,%esp
  105810:	56                   	push   %esi
  105811:	e8 04 b9 ff ff       	call   10111a <get_mms>
  105816:	89 34 24             	mov    %esi,(%esp)
  105819:	89 c5                	mov    %eax,%ebp
  for(i=0; i < numRows; i++){
  10581b:	83 c6 01             	add    $0x1,%esi
        nps = get_mms(i) + get_mml(i); 
  10581e:	e8 5d b9 ff ff       	call   101180 <get_mml>
  105823:	83 c4 10             	add    $0x10,%esp
  105826:	01 c5                	add    %eax,%ebp
  for(i=0; i < numRows; i++){
  105828:	39 74 24 0c          	cmp    %esi,0xc(%esp)
  10582c:	75 c3                	jne    1057f1 <pmem_init+0x51>
  10582e:	89 e8                	mov    %ebp,%eax
  105830:	c1 e8 0c             	shr    $0xc,%eax
  105833:	81 e5 ff 0f 00 00    	and    $0xfff,%ebp
  105839:	8d 78 01             	lea    0x1(%eax),%edi
  10583c:	0f 44 f8             	cmove  %eax,%edi
    nps = nps / PAGESIZE + 1;




	set_nps(nps); // Setting the value computed above to NUM_PAGES.
  10583f:	83 ec 0c             	sub    $0xc,%esp
    *    You should still set the permission of those pages in allocation table to 0.
    */
  // TODO

  //int i;
  for(i = 0; i < VM_USERLO_PI; i++)
  105842:	31 f6                	xor    %esi,%esi
	set_nps(nps); // Setting the value computed above to NUM_PAGES.
  105844:	57                   	push   %edi
  105845:	e8 86 fb ff ff       	call   1053d0 <set_nps>
  10584a:	83 c4 10             	add    $0x10,%esp
  10584d:	8d 76 00             	lea    0x0(%esi),%esi
    at_set_perm(i, 1);
  105850:	83 ec 08             	sub    $0x8,%esp
  105853:	6a 01                	push   $0x1
  105855:	56                   	push   %esi
  for(i = 0; i < VM_USERLO_PI; i++)
  105856:	83 c6 01             	add    $0x1,%esi
    at_set_perm(i, 1);
  105859:	e8 b2 fb ff ff       	call   105410 <at_set_perm>
  for(i = 0; i < VM_USERLO_PI; i++)
  10585e:	83 c4 10             	add    $0x10,%esp
  105861:	81 fe 00 00 04 00    	cmp    $0x40000,%esi
  105867:	75 e7                	jne    105850 <pmem_init+0xb0>
 
  for(i = VM_USERHI_PI; i < nps; i++)
  105869:	81 ff 00 00 0f 00    	cmp    $0xf0000,%edi
  10586f:	bd 00 00 0f 00       	mov    $0xf0000,%ebp
  105874:	76 22                	jbe    105898 <pmem_init+0xf8>
  105876:	8d 76 00             	lea    0x0(%esi),%esi
  105879:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    at_set_perm(i, 1);
  105880:	83 ec 08             	sub    $0x8,%esp
  105883:	6a 01                	push   $0x1
  105885:	55                   	push   %ebp
  for(i = VM_USERHI_PI; i < nps; i++)
  105886:	83 c5 01             	add    $0x1,%ebp
    at_set_perm(i, 1);
  105889:	e8 82 fb ff ff       	call   105410 <at_set_perm>
  for(i = VM_USERHI_PI; i < nps; i++)
  10588e:	83 c4 10             	add    $0x10,%esp
  105891:	39 fd                	cmp    %edi,%ebp
  105893:	75 eb                	jne    105880 <pmem_init+0xe0>
  105895:	8d 76 00             	lea    0x0(%esi),%esi

  for(i = VM_USERLO_PI; i < VM_USERHI_PI; i++){
        at_set_perm(i, 2); 
  105898:	83 ec 08             	sub    $0x8,%esp
  10589b:	6a 02                	push   $0x2
  10589d:	56                   	push   %esi
  for(i = VM_USERLO_PI; i < VM_USERHI_PI; i++){
  10589e:	83 c6 01             	add    $0x1,%esi
        at_set_perm(i, 2); 
  1058a1:	e8 6a fb ff ff       	call   105410 <at_set_perm>
  for(i = VM_USERLO_PI; i < VM_USERHI_PI; i++){
  1058a6:	83 c4 10             	add    $0x10,%esp
  1058a9:	81 fe 00 00 0f 00    	cmp    $0xf0000,%esi
  1058af:	75 e7                	jne    105898 <pmem_init+0xf8>
  

  


}
  1058b1:	83 c4 1c             	add    $0x1c,%esp
  1058b4:	5b                   	pop    %ebx
  1058b5:	5e                   	pop    %esi
  1058b6:	5f                   	pop    %edi
  1058b7:	5d                   	pop    %ebp
  1058b8:	c3                   	ret    
  for(i=0; i < numRows; i++){
  1058b9:	31 ff                	xor    %edi,%edi
  1058bb:	eb 82                	jmp    10583f <pmem_init+0x9f>
  1058bd:	66 90                	xchg   %ax,%ax
  1058bf:	90                   	nop

001058c0 <MATInit_test1>:
#include <lib/debug.h>
#include <pmm/MATIntro/export.h>

int MATInit_test1()
{
  1058c0:	57                   	push   %edi
  1058c1:	56                   	push   %esi
  1058c2:	31 f6                	xor    %esi,%esi
  1058c4:	53                   	push   %ebx
  1058c5:	e8 45 ab ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  1058ca:	81 c3 36 67 00 00    	add    $0x6736,%ebx
  int i;
  int nps = get_nps();
  1058d0:	e8 db fa ff ff       	call   1053b0 <get_nps>
  if (nps <= 1000) {
  1058d5:	3d e8 03 00 00       	cmp    $0x3e8,%eax
  1058da:	89 c7                	mov    %eax,%edi
  1058dc:	0f 8e ae 00 00 00    	jle    105990 <MATInit_test1+0xd0>
  1058e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    dprintf("test 1 failed.\n");
    return 1;
  }
  for(i = 0; i < nps; i ++) {
    if (at_is_allocated(i) != 0) {
  1058e8:	83 ec 0c             	sub    $0xc,%esp
  1058eb:	56                   	push   %esi
  1058ec:	e8 4f fb ff ff       	call   105440 <at_is_allocated>
  1058f1:	83 c4 10             	add    $0x10,%esp
  1058f4:	85 c0                	test   %eax,%eax
  1058f6:	75 40                	jne    105938 <MATInit_test1+0x78>
      dprintf("allocated: %d: %d\n", i, at_is_allocated(i));
      dprintf("test 1 failed.\n");
      return 1;
    }
    if ((i < 0x40000000/4096 || i >= 0xF0000000/4096) && at_is_norm(i) != 0) {
  1058f8:	8d 86 00 00 fc ff    	lea    -0x40000(%esi),%eax
  1058fe:	3d ff ff 0a 00       	cmp    $0xaffff,%eax
  105903:	76 10                	jbe    105915 <MATInit_test1+0x55>
  105905:	83 ec 0c             	sub    $0xc,%esp
  105908:	56                   	push   %esi
  105909:	e8 e2 fa ff ff       	call   1053f0 <at_is_norm>
  10590e:	83 c4 10             	add    $0x10,%esp
  105911:	85 c0                	test   %eax,%eax
  105913:	75 5b                	jne    105970 <MATInit_test1+0xb0>
  for(i = 0; i < nps; i ++) {
  105915:	83 c6 01             	add    $0x1,%esi
  105918:	39 f7                	cmp    %esi,%edi
  10591a:	75 cc                	jne    1058e8 <MATInit_test1+0x28>
      dprintf("test 1 failed.\n");
      return 1;
    }

  }
  dprintf("test 1 passed.\n");
  10591c:	8d 83 56 bc ff ff    	lea    -0x43aa(%ebx),%eax
  105922:	83 ec 0c             	sub    $0xc,%esp
  105925:	50                   	push   %eax
  105926:	e8 6d da ff ff       	call   103398 <dprintf>
  return 0;
  10592b:	83 c4 10             	add    $0x10,%esp
  10592e:	31 c0                	xor    %eax,%eax
}
  105930:	5b                   	pop    %ebx
  105931:	5e                   	pop    %esi
  105932:	5f                   	pop    %edi
  105933:	c3                   	ret    
  105934:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      dprintf("allocated: %d: %d\n", i, at_is_allocated(i));
  105938:	83 ec 0c             	sub    $0xc,%esp
  10593b:	56                   	push   %esi
  10593c:	e8 ff fa ff ff       	call   105440 <at_is_allocated>
  105941:	83 c4 0c             	add    $0xc,%esp
  105944:	50                   	push   %eax
  105945:	8d 83 bf bc ff ff    	lea    -0x4341(%ebx),%eax
  10594b:	56                   	push   %esi
      dprintf("norm: %d: %d\n", i, at_is_norm(i));
  10594c:	50                   	push   %eax
  10594d:	e8 46 da ff ff       	call   103398 <dprintf>
      dprintf("test 1 failed.\n");
  105952:	8d 83 46 bc ff ff    	lea    -0x43ba(%ebx),%eax
  105958:	89 04 24             	mov    %eax,(%esp)
  10595b:	e8 38 da ff ff       	call   103398 <dprintf>
      return 1;
  105960:	83 c4 10             	add    $0x10,%esp
  105963:	b8 01 00 00 00       	mov    $0x1,%eax
}
  105968:	5b                   	pop    %ebx
  105969:	5e                   	pop    %esi
  10596a:	5f                   	pop    %edi
  10596b:	c3                   	ret    
  10596c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      dprintf("norm: %d: %d\n", i, at_is_norm(i));
  105970:	83 ec 0c             	sub    $0xc,%esp
  105973:	56                   	push   %esi
  105974:	e8 77 fa ff ff       	call   1053f0 <at_is_norm>
  105979:	83 c4 0c             	add    $0xc,%esp
  10597c:	50                   	push   %eax
  10597d:	8d 83 d2 bc ff ff    	lea    -0x432e(%ebx),%eax
  105983:	56                   	push   %esi
  105984:	eb c6                	jmp    10594c <MATInit_test1+0x8c>
  105986:	8d 76 00             	lea    0x0(%esi),%esi
  105989:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    dprintf("test 1 failed.\n");
  105990:	8d 83 46 bc ff ff    	lea    -0x43ba(%ebx),%eax
  105996:	83 ec 0c             	sub    $0xc,%esp
  105999:	50                   	push   %eax
  10599a:	e8 f9 d9 ff ff       	call   103398 <dprintf>
    return 1;
  10599f:	83 c4 10             	add    $0x10,%esp
  1059a2:	b8 01 00 00 00       	mov    $0x1,%eax
}
  1059a7:	5b                   	pop    %ebx
  1059a8:	5e                   	pop    %esi
  1059a9:	5f                   	pop    %edi
  1059aa:	c3                   	ret    
  1059ab:	90                   	nop
  1059ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

001059b0 <MATInit_test_own>:
int MATInit_test_own()
{
  // TODO (optional)
  // dprintf("own test passed.\n");
  return 0;
}
  1059b0:	31 c0                	xor    %eax,%eax
  1059b2:	c3                   	ret    
  1059b3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1059b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001059c0 <test_MATInit>:

int test_MATInit()
{
  return MATInit_test1() + MATInit_test_own();
  1059c0:	e9 fb fe ff ff       	jmp    1058c0 <MATInit_test1>
  1059c5:	66 90                	xchg   %ax,%ax
  1059c7:	66 90                	xchg   %ax,%ax
  1059c9:	66 90                	xchg   %ax,%ax
  1059cb:	66 90                	xchg   %ax,%ax
  1059cd:	66 90                	xchg   %ax,%ax
  1059cf:	90                   	nop

001059d0 <palloc>:
  * 2. Optimize the code with the memorization techniques so that you do not have to
  *    scan the allocation table from scratch every time.
  */
unsigned int
palloc()
{
  1059d0:	57                   	push   %edi
  1059d1:	56                   	push   %esi
  1059d2:	be 00 00 04 00       	mov    $0x40000,%esi
  1059d7:	53                   	push   %ebx
  1059d8:	e8 32 aa ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  1059dd:	81 c3 23 66 00 00    	add    $0x6623,%ebx
  1059e3:	eb 0e                	jmp    1059f3 <palloc+0x23>
  1059e5:	8d 76 00             	lea    0x0(%esi),%esi
  // TODO

  int i;
  for(i=VM_USERLO_PI; i< VM_USERHI_PI; i++){
  1059e8:	83 c6 01             	add    $0x1,%esi
  1059eb:	81 fe 00 00 0f 00    	cmp    $0xf0000,%esi
  1059f1:	74 37                	je     105a2a <palloc+0x5a>

    if(at_is_norm(i)==1 && at_is_allocated(i)==0){
  1059f3:	83 ec 0c             	sub    $0xc,%esp
  1059f6:	89 f7                	mov    %esi,%edi
  1059f8:	56                   	push   %esi
  1059f9:	e8 f2 f9 ff ff       	call   1053f0 <at_is_norm>
  1059fe:	83 c4 10             	add    $0x10,%esp
  105a01:	83 f8 01             	cmp    $0x1,%eax
  105a04:	75 e2                	jne    1059e8 <palloc+0x18>
  105a06:	83 ec 0c             	sub    $0xc,%esp
  105a09:	56                   	push   %esi
  105a0a:	e8 31 fa ff ff       	call   105440 <at_is_allocated>
  105a0f:	83 c4 10             	add    $0x10,%esp
  105a12:	85 c0                	test   %eax,%eax
  105a14:	75 d2                	jne    1059e8 <palloc+0x18>
      at_set_allocated(i, 1);
  105a16:	83 ec 08             	sub    $0x8,%esp
  105a19:	6a 01                	push   $0x1
  105a1b:	56                   	push   %esi
  105a1c:	e8 3f fa ff ff       	call   105460 <at_set_allocated>
      return i;
  105a21:	83 c4 10             	add    $0x10,%esp
  }

  // return i;

  return 0;
} 
  105a24:	89 f8                	mov    %edi,%eax
  105a26:	5b                   	pop    %ebx
  105a27:	5e                   	pop    %esi
  105a28:	5f                   	pop    %edi
  105a29:	c3                   	ret    
  return 0;
  105a2a:	31 ff                	xor    %edi,%edi
} 
  105a2c:	89 f8                	mov    %edi,%eax
  105a2e:	5b                   	pop    %ebx
  105a2f:	5e                   	pop    %esi
  105a30:	5f                   	pop    %edi
  105a31:	c3                   	ret    
  105a32:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  105a39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00105a40 <pfree>:
  * Hint: Simple. You have already implemented the functions required to check if a page
  * 	  is allocated and to set the allocation status of a page index. (See import.h)
  */
void
pfree(unsigned int pfree_index)
{
  105a40:	53                   	push   %ebx
  105a41:	e8 c9 a9 ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  105a46:	81 c3 ba 65 00 00    	add    $0x65ba,%ebx
  105a4c:	83 ec 10             	sub    $0x10,%esp
  // TODO
  at_set_allocated(pfree_index, 0);
  105a4f:	6a 00                	push   $0x0
  105a51:	ff 74 24 1c          	pushl  0x1c(%esp)
  105a55:	e8 06 fa ff ff       	call   105460 <at_set_allocated>
}
  105a5a:	83 c4 18             	add    $0x18,%esp
  105a5d:	5b                   	pop    %ebx
  105a5e:	c3                   	ret    
  105a5f:	90                   	nop

00105a60 <MATOp_test1>:
#include <lib/debug.h>
#include <pmm/MATIntro/export.h>
#include "export.h"

int MATOp_test1()
{
  105a60:	56                   	push   %esi
  105a61:	53                   	push   %ebx
  105a62:	e8 a8 a9 ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  105a67:	81 c3 99 65 00 00    	add    $0x6599,%ebx
  105a6d:	83 ec 04             	sub    $0x4,%esp
  int page_index = palloc();
  105a70:	e8 5b ff ff ff       	call   1059d0 <palloc>
  if (page_index < 262144) {
  105a75:	3d ff ff 03 00       	cmp    $0x3ffff,%eax
  int page_index = palloc();
  105a7a:	89 c6                	mov    %eax,%esi
  if (page_index < 262144) {
  105a7c:	7e 72                	jle    105af0 <MATOp_test1+0x90>
    pfree(page_index);
    dprintf("test 1 a %d failed.\n", page_index);
    return 1;
  }
  if (at_is_norm(page_index) != 1) {
  105a7e:	83 ec 0c             	sub    $0xc,%esp
  105a81:	50                   	push   %eax
  105a82:	e8 69 f9 ff ff       	call   1053f0 <at_is_norm>
  105a87:	83 c4 10             	add    $0x10,%esp
  105a8a:	83 f8 01             	cmp    $0x1,%eax
  105a8d:	74 29                	je     105ab8 <MATOp_test1+0x58>
    pfree(page_index);
  105a8f:	83 ec 0c             	sub    $0xc,%esp
  105a92:	56                   	push   %esi
  105a93:	e8 a8 ff ff ff       	call   105a40 <pfree>
    dprintf("test  1 b %d failed.\n", page_index);
  105a98:	59                   	pop    %ecx
  105a99:	58                   	pop    %eax
  105a9a:	8d 83 f5 bc ff ff    	lea    -0x430b(%ebx),%eax
  105aa0:	56                   	push   %esi
  105aa1:	50                   	push   %eax
  105aa2:	e8 f1 d8 ff ff       	call   103398 <dprintf>
    return 1;
  105aa7:	83 c4 10             	add    $0x10,%esp
  105aaa:	b8 01 00 00 00       	mov    $0x1,%eax
    dprintf("test 1 d failed.\n");
    return 1;
  }
  dprintf("test 1 passed.\n");
  return 0;
}
  105aaf:	83 c4 04             	add    $0x4,%esp
  105ab2:	5b                   	pop    %ebx
  105ab3:	5e                   	pop    %esi
  105ab4:	c3                   	ret    
  105ab5:	8d 76 00             	lea    0x0(%esi),%esi
  if (at_is_allocated(page_index) != 1) {
  105ab8:	83 ec 0c             	sub    $0xc,%esp
  105abb:	56                   	push   %esi
  105abc:	e8 7f f9 ff ff       	call   105440 <at_is_allocated>
  105ac1:	83 c4 10             	add    $0x10,%esp
  105ac4:	83 f8 01             	cmp    $0x1,%eax
  105ac7:	74 57                	je     105b20 <MATOp_test1+0xc0>
    pfree(page_index);
  105ac9:	83 ec 0c             	sub    $0xc,%esp
  105acc:	56                   	push   %esi
  105acd:	e8 6e ff ff ff       	call   105a40 <pfree>
    dprintf("test 1 c %d failed.\n", page_index);
  105ad2:	58                   	pop    %eax
  105ad3:	8d 83 0b bd ff ff    	lea    -0x42f5(%ebx),%eax
  105ad9:	5a                   	pop    %edx
  105ada:	56                   	push   %esi
  105adb:	50                   	push   %eax
  105adc:	e8 b7 d8 ff ff       	call   103398 <dprintf>
    return 1;
  105ae1:	83 c4 10             	add    $0x10,%esp
  105ae4:	b8 01 00 00 00       	mov    $0x1,%eax
}
  105ae9:	83 c4 04             	add    $0x4,%esp
  105aec:	5b                   	pop    %ebx
  105aed:	5e                   	pop    %esi
  105aee:	c3                   	ret    
  105aef:	90                   	nop
    pfree(page_index);
  105af0:	83 ec 0c             	sub    $0xc,%esp
  105af3:	50                   	push   %eax
  105af4:	e8 47 ff ff ff       	call   105a40 <pfree>
    dprintf("test 1 a %d failed.\n", page_index);
  105af9:	58                   	pop    %eax
  105afa:	8d 83 e0 bc ff ff    	lea    -0x4320(%ebx),%eax
  105b00:	5a                   	pop    %edx
  105b01:	56                   	push   %esi
  105b02:	50                   	push   %eax
  105b03:	e8 90 d8 ff ff       	call   103398 <dprintf>
    return 1;
  105b08:	83 c4 10             	add    $0x10,%esp
  105b0b:	b8 01 00 00 00       	mov    $0x1,%eax
}
  105b10:	83 c4 04             	add    $0x4,%esp
  105b13:	5b                   	pop    %ebx
  105b14:	5e                   	pop    %esi
  105b15:	c3                   	ret    
  105b16:	8d 76 00             	lea    0x0(%esi),%esi
  105b19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  pfree(page_index);
  105b20:	83 ec 0c             	sub    $0xc,%esp
  105b23:	56                   	push   %esi
  105b24:	e8 17 ff ff ff       	call   105a40 <pfree>
  if (at_is_allocated(page_index) != 0) {
  105b29:	89 34 24             	mov    %esi,(%esp)
  105b2c:	e8 0f f9 ff ff       	call   105440 <at_is_allocated>
  105b31:	83 c4 10             	add    $0x10,%esp
  105b34:	85 c0                	test   %eax,%eax
  105b36:	75 20                	jne    105b58 <MATOp_test1+0xf8>
  dprintf("test 1 passed.\n");
  105b38:	8d 83 56 bc ff ff    	lea    -0x43aa(%ebx),%eax
  105b3e:	83 ec 0c             	sub    $0xc,%esp
  105b41:	50                   	push   %eax
  105b42:	e8 51 d8 ff ff       	call   103398 <dprintf>
  return 0;
  105b47:	83 c4 10             	add    $0x10,%esp
  105b4a:	31 c0                	xor    %eax,%eax
  105b4c:	e9 5e ff ff ff       	jmp    105aaf <MATOp_test1+0x4f>
  105b51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    dprintf("test 1 d failed.\n");
  105b58:	8d 83 20 bd ff ff    	lea    -0x42e0(%ebx),%eax
  105b5e:	83 ec 0c             	sub    $0xc,%esp
  105b61:	50                   	push   %eax
  105b62:	e8 31 d8 ff ff       	call   103398 <dprintf>
    return 1;
  105b67:	83 c4 10             	add    $0x10,%esp
  105b6a:	b8 01 00 00 00       	mov    $0x1,%eax
  105b6f:	e9 3b ff ff ff       	jmp    105aaf <MATOp_test1+0x4f>
  105b74:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  105b7a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00105b80 <MATOp_test_own>:
int MATOp_test_own()
{
  // TODO (optional)
  // dprintf("own test passed.\n");
  return 0;
}
  105b80:	31 c0                	xor    %eax,%eax
  105b82:	c3                   	ret    
  105b83:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  105b89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00105b90 <test_MATOp>:

int test_MATOp()
{
  return MATOp_test1() + MATOp_test_own();
  105b90:	e9 cb fe ff ff       	jmp    105a60 <MATOp_test1>
  105b95:	66 90                	xchg   %ax,%ax
  105b97:	66 90                	xchg   %ax,%ax
  105b99:	66 90                	xchg   %ax,%ax
  105b9b:	66 90                	xchg   %ax,%ax
  105b9d:	66 90                	xchg   %ax,%ax
  105b9f:	90                   	nop

00105ba0 <container_init>:
/**
  * Initializes the container data for the root process (the one with index 0).
  * The root process is the one that gets spawned first by the kernel.
  */
void container_init(unsigned int mbi_addr)
{
  105ba0:	55                   	push   %ebp
  105ba1:	57                   	push   %edi
  105ba2:	56                   	push   %esi
  105ba3:	53                   	push   %ebx
  105ba4:	e8 66 a8 ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  105ba9:	81 c3 57 64 00 00    	add    $0x6457,%ebx
  105baf:	83 ec 18             	sub    $0x18,%esp
  unsigned int real_quota;
  // TODO: define your local variables here.

  pmem_init(mbi_addr);
  105bb2:	ff 74 24 2c          	pushl  0x2c(%esp)
  105bb6:	e8 e5 fb ff ff       	call   1057a0 <pmem_init>
    *  - We have already implemented functions that deal with AT data-structure in MATIntro layer.
    *    (see import.h for available functions)
    */

  int i, j;
  j = get_nps();
  105bbb:	e8 f0 f7 ff ff       	call   1053b0 <get_nps>
  for(i = 0; i < j; i++){
  105bc0:	83 c4 10             	add    $0x10,%esp
  105bc3:	85 c0                	test   %eax,%eax
  105bc5:	0f 8e 93 00 00 00    	jle    105c5e <container_init+0xbe>
  105bcb:	89 c7                	mov    %eax,%edi
  105bcd:	31 f6                	xor    %esi,%esi
  105bcf:	31 ed                	xor    %ebp,%ebp
  105bd1:	eb 0c                	jmp    105bdf <container_init+0x3f>
  105bd3:	90                   	nop
  105bd4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  105bd8:	83 c6 01             	add    $0x1,%esi
  105bdb:	39 f7                	cmp    %esi,%edi
  105bdd:	74 31                	je     105c10 <container_init+0x70>
    if(at_is_norm(i)==1 && at_is_allocated(i)==0)
  105bdf:	83 ec 0c             	sub    $0xc,%esp
  105be2:	56                   	push   %esi
  105be3:	e8 08 f8 ff ff       	call   1053f0 <at_is_norm>
  105be8:	83 c4 10             	add    $0x10,%esp
  105beb:	83 f8 01             	cmp    $0x1,%eax
  105bee:	75 e8                	jne    105bd8 <container_init+0x38>
  105bf0:	83 ec 0c             	sub    $0xc,%esp
  105bf3:	56                   	push   %esi
  105bf4:	e8 47 f8 ff ff       	call   105440 <at_is_allocated>
  105bf9:	83 c4 10             	add    $0x10,%esp
      real_quota++;
  105bfc:	83 f8 01             	cmp    $0x1,%eax
  105bff:	83 d5 00             	adc    $0x0,%ebp
  for(i = 0; i < j; i++){
  105c02:	83 c6 01             	add    $0x1,%esi
  105c05:	39 f7                	cmp    %esi,%edi
  105c07:	75 d6                	jne    105bdf <container_init+0x3f>
  105c09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  105c10:	89 ee                	mov    %ebp,%esi
  }


  KERN_DEBUG("\nreal quota: %d\n\n", real_quota);
  105c12:	8d 83 32 bd ff ff    	lea    -0x42ce(%ebx),%eax
  105c18:	55                   	push   %ebp
  105c19:	50                   	push   %eax
  105c1a:	8d 83 44 bd ff ff    	lea    -0x42bc(%ebx),%eax
  105c20:	6a 3d                	push   $0x3d
  105c22:	50                   	push   %eax
  105c23:	e8 9f d4 ff ff       	call   1030c7 <debug_normal>

  CONTAINER[0].quota = real_quota;
  105c28:	89 b3 80 7f 80 00    	mov    %esi,0x807f80(%ebx)
  CONTAINER[0].usage = 0;
  105c2e:	c7 83 84 7f 80 00 00 	movl   $0x0,0x807f84(%ebx)
  105c35:	00 00 00 
  CONTAINER[0].parent = 0;
  105c38:	c7 83 88 7f 80 00 00 	movl   $0x0,0x807f88(%ebx)
  105c3f:	00 00 00 
  CONTAINER[0].nchildren = 0;
  105c42:	c7 83 8c 7f 80 00 00 	movl   $0x0,0x807f8c(%ebx)
  105c49:	00 00 00 
  CONTAINER[0].used = 1;
  105c4c:	c7 83 90 7f 80 00 01 	movl   $0x1,0x807f90(%ebx)
  105c53:	00 00 00 
}
  105c56:	83 c4 1c             	add    $0x1c,%esp
  105c59:	5b                   	pop    %ebx
  105c5a:	5e                   	pop    %esi
  105c5b:	5f                   	pop    %edi
  105c5c:	5d                   	pop    %ebp
  105c5d:	c3                   	ret    
  for(i = 0; i < j; i++){
  105c5e:	31 f6                	xor    %esi,%esi
  real_quota = 0;
  105c60:	31 ed                	xor    %ebp,%ebp
  105c62:	eb ae                	jmp    105c12 <container_init+0x72>
  105c64:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  105c6a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00105c70 <container_get_parent>:
/** TASK 2:
  * * Get the id of parent process of process # [id]
  * Hint: Simply return the parent field from CONTAINER for process id.
  */
unsigned int container_get_parent(unsigned int id)
{
  105c70:	8b 44 24 04          	mov    0x4(%esp),%eax
  105c74:	e8 92 a7 ff ff       	call   10040b <__x86.get_pc_thunk.dx>
  105c79:	81 c2 87 63 00 00    	add    $0x6387,%edx
  // TODO
  return CONTAINER[id].parent;
  105c7f:	8d 04 80             	lea    (%eax,%eax,4),%eax
  105c82:	8b 84 82 88 7f 80 00 	mov    0x807f88(%edx,%eax,4),%eax
  return 0;
}
  105c89:	c3                   	ret    
  105c8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00105c90 <container_get_nchildren>:

/** TASK 3:
  * * Get the number of children of process # [id]
  */
unsigned int container_get_nchildren(unsigned int id)
{
  105c90:	8b 44 24 04          	mov    0x4(%esp),%eax
  105c94:	e8 72 a7 ff ff       	call   10040b <__x86.get_pc_thunk.dx>
  105c99:	81 c2 67 63 00 00    	add    $0x6367,%edx
  // TODO
  return CONTAINER[id].nchildren;
  105c9f:	8d 04 80             	lea    (%eax,%eax,4),%eax
  105ca2:	8b 84 82 8c 7f 80 00 	mov    0x807f8c(%edx,%eax,4),%eax
  return 0;
}
  105ca9:	c3                   	ret    
  105caa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00105cb0 <container_get_quota>:

/** TASK 4:
  * * Get the maximum memory quota of process # [id]
  */
unsigned int container_get_quota(unsigned int id)
{
  105cb0:	8b 44 24 04          	mov    0x4(%esp),%eax
  105cb4:	e8 52 a7 ff ff       	call   10040b <__x86.get_pc_thunk.dx>
  105cb9:	81 c2 47 63 00 00    	add    $0x6347,%edx
  // TODO
  return CONTAINER[id].quota;
  105cbf:	8d 04 80             	lea    (%eax,%eax,4),%eax
  105cc2:	8b 84 82 80 7f 80 00 	mov    0x807f80(%edx,%eax,4),%eax
  return 0;
}
  105cc9:	c3                   	ret    
  105cca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00105cd0 <container_get_usage>:

/** TASK 5:
  * * Get the current memory usage of process # [id]
  */
unsigned int container_get_usage(unsigned int id)
{
  105cd0:	8b 44 24 04          	mov    0x4(%esp),%eax
  105cd4:	e8 32 a7 ff ff       	call   10040b <__x86.get_pc_thunk.dx>
  105cd9:	81 c2 27 63 00 00    	add    $0x6327,%edx
  // TODO
  return CONTAINER[id].usage;
  105cdf:	8d 04 80             	lea    (%eax,%eax,4),%eax
  105ce2:	8b 84 82 84 7f 80 00 	mov    0x807f84(%edx,%eax,4),%eax
  return 0;
}
  105ce9:	c3                   	ret    
  105cea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00105cf0 <container_can_consume>:
  * * Determine whether the process # [id] can consume extra
  *   [n] pages of memory. If so, return 1, otherwise, return 0.
  * Hint 1: Check the definition of available fields in SContainer data-structure.
  */
unsigned int container_can_consume(unsigned int id, unsigned int n)
{
  105cf0:	8b 44 24 04          	mov    0x4(%esp),%eax
  105cf4:	e8 12 a7 ff ff       	call   10040b <__x86.get_pc_thunk.dx>
  105cf9:	81 c2 07 63 00 00    	add    $0x6307,%edx
  // TODO
  if((CONTAINER[id].quota - CONTAINER[id].usage)>n) return 1;
  105cff:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
  105d02:	8b 84 8a 80 7f 80 00 	mov    0x807f80(%edx,%ecx,4),%eax
  105d09:	2b 84 8a 84 7f 80 00 	sub    0x807f84(%edx,%ecx,4),%eax
  105d10:	3b 44 24 08          	cmp    0x8(%esp),%eax
  105d14:	0f 97 c0             	seta   %al
  105d17:	0f b6 c0             	movzbl %al,%eax
  return 0;
}
  105d1a:	c3                   	ret    
  105d1b:	90                   	nop
  105d1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00105d20 <container_split>:
/**
 * Dedicates [quota] pages of memory for a new child process.
 * returns the container index for the new child process.
 */
unsigned int container_split(unsigned int id, unsigned int quota)
{
  105d20:	57                   	push   %edi
  105d21:	56                   	push   %esi
  105d22:	53                   	push   %ebx
  105d23:	8b 54 24 10          	mov    0x10(%esp),%edx
  105d27:	e8 e3 a6 ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  105d2c:	81 c3 d4 62 00 00    	add    $0x62d4,%ebx
  105d32:	8b 74 24 14          	mov    0x14(%esp),%esi
  unsigned int child, nc;

  nc = CONTAINER[id].nchildren;
  105d36:	8d 04 92             	lea    (%edx,%edx,4),%eax
  105d39:	8d 8c 83 80 7f 80 00 	lea    0x807f80(%ebx,%eax,4),%ecx
  child = id * MAX_CHILDREN + 1 + nc; //container index for the child process
  105d40:	8d 44 52 01          	lea    0x1(%edx,%edx,2),%eax
  nc = CONTAINER[id].nchildren;
  105d44:	8b 79 0c             	mov    0xc(%ecx),%edi
    * Hint 1: Read about the parent/child relationship maintained in you kernel 
    *         (available at the top of this page and handout)
    */

  CONTAINER[id].nchildren++;
  CONTAINER[id].usage += quota;
  105d47:	01 71 04             	add    %esi,0x4(%ecx)
  child = id * MAX_CHILDREN + 1 + nc; //container index for the child process
  105d4a:	01 f8                	add    %edi,%eax
  CONTAINER[id].nchildren++;
  105d4c:	83 c7 01             	add    $0x1,%edi
  105d4f:	89 79 0c             	mov    %edi,0xc(%ecx)
  CONTAINER[child].quota= quota;
  105d52:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
  105d55:	c1 e1 02             	shl    $0x2,%ecx
  105d58:	8d bc 0b 80 7f 80 00 	lea    0x807f80(%ebx,%ecx,1),%edi
  105d5f:	89 37                	mov    %esi,(%edi)
  CONTAINER[child].usage = 0;
  105d61:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%edi)
  CONTAINER[child].parent = id;
  105d68:	89 57 08             	mov    %edx,0x8(%edi)
  CONTAINER[child].nchildren  = 0;
  105d6b:	c7 47 0c 00 00 00 00 	movl   $0x0,0xc(%edi)
  CONTAINER[child].used = 1;
  105d72:	c7 47 10 01 00 00 00 	movl   $0x1,0x10(%edi)

  return child;
}
  105d79:	5b                   	pop    %ebx
  105d7a:	5e                   	pop    %esi
  105d7b:	5f                   	pop    %edi
  105d7c:	c3                   	ret    
  105d7d:	8d 76 00             	lea    0x0(%esi),%esi

00105d80 <container_alloc>:
  * * 1. Allocates one more page for process # [id], given that its usage would not exceed the quota.
  * * 2. Update the contained structure to reflect the container structure should be updated accordingly after the allocation.
  * returns the page index of the allocated page, or 0 in the case of failure.
  */
unsigned int container_alloc(unsigned int id)
{
  105d80:	56                   	push   %esi
  105d81:	53                   	push   %ebx
  105d82:	e8 88 a6 ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  105d87:	81 c3 79 62 00 00    	add    $0x6279,%ebx
  105d8d:	83 ec 04             	sub    $0x4,%esp
  105d90:	8b 44 24 10          	mov    0x10(%esp),%eax
  /*
   * TODO: implement the function here.
   */


  if((CONTAINER[id].usage) < CONTAINER[id].quota){
  105d94:	8d 14 80             	lea    (%eax,%eax,4),%edx
  105d97:	31 c0                	xor    %eax,%eax
  105d99:	c1 e2 02             	shl    $0x2,%edx
  105d9c:	8d b4 13 80 7f 80 00 	lea    0x807f80(%ebx,%edx,1),%esi
  105da3:	8b 8c 13 80 7f 80 00 	mov    0x807f80(%ebx,%edx,1),%ecx
  105daa:	39 4e 04             	cmp    %ecx,0x4(%esi)
  105dad:	7d 09                	jge    105db8 <container_alloc+0x38>
    
     int pageindex = palloc();
  105daf:	e8 1c fc ff ff       	call   1059d0 <palloc>
  
     CONTAINER[id].usage++;
  105db4:	83 46 04 01          	addl   $0x1,0x4(%esi)
    return pageindex;
  }


  return 0;
}
  105db8:	83 c4 04             	add    $0x4,%esp
  105dbb:	5b                   	pop    %ebx
  105dbc:	5e                   	pop    %esi
  105dbd:	c3                   	ret    
  105dbe:	66 90                	xchg   %ax,%ax

00105dc0 <container_free>:
  * Hint: You have already implemented functions:
  *  - to check if a page_index is allocated
  *  - to free a page_index in MATOp layer.
  */
void container_free(unsigned int id, unsigned int page_index)
{
  105dc0:	53                   	push   %ebx
  105dc1:	e8 49 a6 ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  105dc6:	81 c3 3a 62 00 00    	add    $0x623a,%ebx
  105dcc:	83 ec 14             	sub    $0x14,%esp
  105dcf:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  // TODO
  CONTAINER[id].usage--;
  pfree(page_index);
  105dd3:	ff 74 24 20          	pushl  0x20(%esp)
  CONTAINER[id].usage--;
  105dd7:	8d 04 80             	lea    (%eax,%eax,4),%eax
  105dda:	83 ac 83 84 7f 80 00 	subl   $0x1,0x807f84(%ebx,%eax,4)
  105de1:	01 
  pfree(page_index);
  105de2:	e8 59 fc ff ff       	call   105a40 <pfree>
  
}
  105de7:	83 c4 18             	add    $0x18,%esp
  105dea:	5b                   	pop    %ebx
  105deb:	c3                   	ret    
  105dec:	66 90                	xchg   %ax,%ax
  105dee:	66 90                	xchg   %ax,%ax

00105df0 <MContainer_test1>:
#include <lib/debug.h>
#include "export.h"

int MContainer_test1()
{
  105df0:	53                   	push   %ebx
  105df1:	e8 19 a6 ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  105df6:	81 c3 0a 62 00 00    	add    $0x620a,%ebx
  105dfc:	83 ec 14             	sub    $0x14,%esp
  if (container_get_quota(0) <= 10000) {
  105dff:	6a 00                	push   $0x0
  105e01:	e8 aa fe ff ff       	call   105cb0 <container_get_quota>
  105e06:	83 c4 10             	add    $0x10,%esp
  105e09:	3d 10 27 00 00       	cmp    $0x2710,%eax
  105e0e:	76 70                	jbe    105e80 <MContainer_test1+0x90>
    dprintf("test 1 total quota= %d failed.\n", container_get_quota(0));
    return 1;
  }
  if (container_can_consume(0, 10000) != 1) {
  105e10:	83 ec 08             	sub    $0x8,%esp
  105e13:	68 10 27 00 00       	push   $0x2710
  105e18:	6a 00                	push   $0x0
  105e1a:	e8 d1 fe ff ff       	call   105cf0 <container_can_consume>
  105e1f:	83 c4 10             	add    $0x10,%esp
  105e22:	83 f8 01             	cmp    $0x1,%eax
  105e25:	74 21                	je     105e48 <MContainer_test1+0x58>
    dprintf("test 1 consume10000  failed.\n");
  105e27:	8d 83 a9 bd ff ff    	lea    -0x4257(%ebx),%eax
  105e2d:	83 ec 0c             	sub    $0xc,%esp
  105e30:	50                   	push   %eax
  105e31:	e8 62 d5 ff ff       	call   103398 <dprintf>
    return 1;
  105e36:	83 c4 10             	add    $0x10,%esp
  105e39:	b8 01 00 00 00       	mov    $0x1,%eax
    dprintf("test 1 consume 10000000 failed.\n");
    return 1;
  }
  dprintf("test 1 passed.\n");
  return 0;
}
  105e3e:	83 c4 08             	add    $0x8,%esp
  105e41:	5b                   	pop    %ebx
  105e42:	c3                   	ret    
  105e43:	90                   	nop
  105e44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if (container_can_consume(0, 10000000) != 0) {
  105e48:	83 ec 08             	sub    $0x8,%esp
  105e4b:	68 80 96 98 00       	push   $0x989680
  105e50:	6a 00                	push   $0x0
  105e52:	e8 99 fe ff ff       	call   105cf0 <container_can_consume>
  105e57:	83 c4 10             	add    $0x10,%esp
  105e5a:	85 c0                	test   %eax,%eax
  105e5c:	75 52                	jne    105eb0 <MContainer_test1+0xc0>
  dprintf("test 1 passed.\n");
  105e5e:	8d 83 56 bc ff ff    	lea    -0x43aa(%ebx),%eax
  105e64:	83 ec 0c             	sub    $0xc,%esp
  105e67:	50                   	push   %eax
  105e68:	e8 2b d5 ff ff       	call   103398 <dprintf>
  105e6d:	83 c4 10             	add    $0x10,%esp
  return 0;
  105e70:	31 c0                	xor    %eax,%eax
}
  105e72:	83 c4 08             	add    $0x8,%esp
  105e75:	5b                   	pop    %ebx
  105e76:	c3                   	ret    
  105e77:	89 f6                	mov    %esi,%esi
  105e79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    dprintf("test 1 total quota= %d failed.\n", container_get_quota(0));
  105e80:	83 ec 0c             	sub    $0xc,%esp
  105e83:	6a 00                	push   $0x0
  105e85:	e8 26 fe ff ff       	call   105cb0 <container_get_quota>
  105e8a:	5a                   	pop    %edx
  105e8b:	59                   	pop    %ecx
  105e8c:	50                   	push   %eax
  105e8d:	8d 83 68 bd ff ff    	lea    -0x4298(%ebx),%eax
  105e93:	50                   	push   %eax
  105e94:	e8 ff d4 ff ff       	call   103398 <dprintf>
    return 1;
  105e99:	83 c4 10             	add    $0x10,%esp
  105e9c:	b8 01 00 00 00       	mov    $0x1,%eax
}
  105ea1:	83 c4 08             	add    $0x8,%esp
  105ea4:	5b                   	pop    %ebx
  105ea5:	c3                   	ret    
  105ea6:	8d 76 00             	lea    0x0(%esi),%esi
  105ea9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    dprintf("test 1 consume 10000000 failed.\n");
  105eb0:	8d 83 88 bd ff ff    	lea    -0x4278(%ebx),%eax
  105eb6:	83 ec 0c             	sub    $0xc,%esp
  105eb9:	50                   	push   %eax
  105eba:	e8 d9 d4 ff ff       	call   103398 <dprintf>
  105ebf:	83 c4 10             	add    $0x10,%esp
    return 1;
  105ec2:	b8 01 00 00 00       	mov    $0x1,%eax
  105ec7:	e9 72 ff ff ff       	jmp    105e3e <MContainer_test1+0x4e>
  105ecc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00105ed0 <MContainer_test2>:


int MContainer_test2()
{
  105ed0:	55                   	push   %ebp
  105ed1:	57                   	push   %edi
  105ed2:	56                   	push   %esi
  105ed3:	53                   	push   %ebx
  105ed4:	e8 36 a5 ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  105ed9:	81 c3 27 61 00 00    	add    $0x6127,%ebx
  105edf:	83 ec 18             	sub    $0x18,%esp
  unsigned int old_usage = container_get_usage(0);
  105ee2:	6a 00                	push   $0x0
  105ee4:	e8 e7 fd ff ff       	call   105cd0 <container_get_usage>
  unsigned int old_nchildren = container_get_nchildren(0);
  105ee9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  unsigned int old_usage = container_get_usage(0);
  105ef0:	89 c7                	mov    %eax,%edi
  unsigned int old_nchildren = container_get_nchildren(0);
  105ef2:	e8 99 fd ff ff       	call   105c90 <container_get_nchildren>
  105ef7:	89 c5                	mov    %eax,%ebp
  unsigned int chid = container_split(0, 100);
  105ef9:	58                   	pop    %eax
  105efa:	5a                   	pop    %edx
  105efb:	6a 64                	push   $0x64
  105efd:	6a 00                	push   $0x0
  105eff:	e8 1c fe ff ff       	call   105d20 <container_split>
  if (container_get_quota(chid) != 100 || container_get_parent(chid) != 0 ||
  105f04:	89 04 24             	mov    %eax,(%esp)
  unsigned int chid = container_split(0, 100);
  105f07:	89 c6                	mov    %eax,%esi
  if (container_get_quota(chid) != 100 || container_get_parent(chid) != 0 ||
  105f09:	e8 a2 fd ff ff       	call   105cb0 <container_get_quota>
  105f0e:	83 c4 10             	add    $0x10,%esp
  105f11:	83 f8 64             	cmp    $0x64,%eax
  105f14:	74 22                	je     105f38 <MContainer_test2+0x68>
      container_get_usage(chid) != 0 || container_get_nchildren(chid) != 0 ||
      container_get_usage(0) != old_usage + 100 || container_get_nchildren(0) != old_nchildren + 1) {
    dprintf("test 2 a  failed.\n");
  105f16:	8d 83 c7 bd ff ff    	lea    -0x4239(%ebx),%eax
  105f1c:	83 ec 0c             	sub    $0xc,%esp
  105f1f:	50                   	push   %eax
  105f20:	e8 73 d4 ff ff       	call   103398 <dprintf>
    return 1;
  105f25:	83 c4 10             	add    $0x10,%esp
  105f28:	b8 01 00 00 00       	mov    $0x1,%eax
    dprintf("test 2 b failed.\n");
    return 1;
  }
  dprintf("test 2 passed.\n");
  return 0;
}
  105f2d:	83 c4 0c             	add    $0xc,%esp
  105f30:	5b                   	pop    %ebx
  105f31:	5e                   	pop    %esi
  105f32:	5f                   	pop    %edi
  105f33:	5d                   	pop    %ebp
  105f34:	c3                   	ret    
  105f35:	8d 76 00             	lea    0x0(%esi),%esi
  if (container_get_quota(chid) != 100 || container_get_parent(chid) != 0 ||
  105f38:	83 ec 0c             	sub    $0xc,%esp
  105f3b:	56                   	push   %esi
  105f3c:	e8 2f fd ff ff       	call   105c70 <container_get_parent>
  105f41:	83 c4 10             	add    $0x10,%esp
  105f44:	85 c0                	test   %eax,%eax
  105f46:	75 ce                	jne    105f16 <MContainer_test2+0x46>
      container_get_usage(chid) != 0 || container_get_nchildren(chid) != 0 ||
  105f48:	83 ec 0c             	sub    $0xc,%esp
  105f4b:	56                   	push   %esi
  105f4c:	e8 7f fd ff ff       	call   105cd0 <container_get_usage>
  if (container_get_quota(chid) != 100 || container_get_parent(chid) != 0 ||
  105f51:	83 c4 10             	add    $0x10,%esp
  105f54:	85 c0                	test   %eax,%eax
  105f56:	75 be                	jne    105f16 <MContainer_test2+0x46>
      container_get_usage(chid) != 0 || container_get_nchildren(chid) != 0 ||
  105f58:	83 ec 0c             	sub    $0xc,%esp
  105f5b:	56                   	push   %esi
  105f5c:	e8 2f fd ff ff       	call   105c90 <container_get_nchildren>
  105f61:	83 c4 10             	add    $0x10,%esp
  105f64:	85 c0                	test   %eax,%eax
  105f66:	75 ae                	jne    105f16 <MContainer_test2+0x46>
      container_get_usage(0) != old_usage + 100 || container_get_nchildren(0) != old_nchildren + 1) {
  105f68:	83 ec 0c             	sub    $0xc,%esp
  105f6b:	83 c7 64             	add    $0x64,%edi
  105f6e:	6a 00                	push   $0x0
  105f70:	e8 5b fd ff ff       	call   105cd0 <container_get_usage>
      container_get_usage(chid) != 0 || container_get_nchildren(chid) != 0 ||
  105f75:	83 c4 10             	add    $0x10,%esp
  105f78:	39 f8                	cmp    %edi,%eax
  105f7a:	75 9a                	jne    105f16 <MContainer_test2+0x46>
      container_get_usage(0) != old_usage + 100 || container_get_nchildren(0) != old_nchildren + 1) {
  105f7c:	83 ec 0c             	sub    $0xc,%esp
  105f7f:	83 c5 01             	add    $0x1,%ebp
  105f82:	6a 00                	push   $0x0
  105f84:	e8 07 fd ff ff       	call   105c90 <container_get_nchildren>
  105f89:	83 c4 10             	add    $0x10,%esp
  105f8c:	39 e8                	cmp    %ebp,%eax
  105f8e:	75 86                	jne    105f16 <MContainer_test2+0x46>
  container_alloc(chid);
  105f90:	83 ec 0c             	sub    $0xc,%esp
  105f93:	56                   	push   %esi
  105f94:	e8 e7 fd ff ff       	call   105d80 <container_alloc>
  if (container_get_usage(chid) != 1) {
  105f99:	89 34 24             	mov    %esi,(%esp)
  105f9c:	e8 2f fd ff ff       	call   105cd0 <container_get_usage>
  105fa1:	83 c4 10             	add    $0x10,%esp
  105fa4:	83 e8 01             	sub    $0x1,%eax
  105fa7:	74 1c                	je     105fc5 <MContainer_test2+0xf5>
    dprintf("test 2 b failed.\n");
  105fa9:	8d 83 da bd ff ff    	lea    -0x4226(%ebx),%eax
  105faf:	83 ec 0c             	sub    $0xc,%esp
  105fb2:	50                   	push   %eax
  105fb3:	e8 e0 d3 ff ff       	call   103398 <dprintf>
    return 1;
  105fb8:	83 c4 10             	add    $0x10,%esp
  105fbb:	b8 01 00 00 00       	mov    $0x1,%eax
  105fc0:	e9 68 ff ff ff       	jmp    105f2d <MContainer_test2+0x5d>
  dprintf("test 2 passed.\n");
  105fc5:	8d 83 76 bc ff ff    	lea    -0x438a(%ebx),%eax
  105fcb:	83 ec 0c             	sub    $0xc,%esp
  105fce:	50                   	push   %eax
  105fcf:	e8 c4 d3 ff ff       	call   103398 <dprintf>
  return 0;
  105fd4:	83 c4 10             	add    $0x10,%esp
  105fd7:	31 c0                	xor    %eax,%eax
  105fd9:	e9 4f ff ff ff       	jmp    105f2d <MContainer_test2+0x5d>
  105fde:	66 90                	xchg   %ax,%ax

00105fe0 <MContainer_test_own>:
int MContainer_test_own()
{
  // TODO (optional)
  // dprintf("own test passed.\n");
  return 0;
}
  105fe0:	31 c0                	xor    %eax,%eax
  105fe2:	c3                   	ret    
  105fe3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  105fe9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00105ff0 <test_MContainer>:

int test_MContainer()
{
  105ff0:	53                   	push   %ebx
  105ff1:	83 ec 08             	sub    $0x8,%esp
  return MContainer_test1() + MContainer_test2() + MContainer_test_own();
  105ff4:	e8 f7 fd ff ff       	call   105df0 <MContainer_test1>
  105ff9:	89 c3                	mov    %eax,%ebx
  105ffb:	e8 d0 fe ff ff       	call   105ed0 <MContainer_test2>
}
  106000:	83 c4 08             	add    $0x8,%esp
  return MContainer_test1() + MContainer_test2() + MContainer_test_own();
  106003:	01 d8                	add    %ebx,%eax
}
  106005:	5b                   	pop    %ebx
  106006:	c3                   	ret    
  106007:	66 90                	xchg   %ax,%ax
  106009:	66 90                	xchg   %ax,%ax
  10600b:	66 90                	xchg   %ax,%ax
  10600d:	66 90                	xchg   %ax,%ax
  10600f:	90                   	nop

00106010 <set_pdir_base>:

/** TASK 1:
  * * Set the CR3 register with the start address of the page structure for process # [index]
  */
void set_pdir_base(unsigned int index)
{
  106010:	53                   	push   %ebx
  106011:	e8 f9 a3 ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  106016:	81 c3 ea 5f 00 00    	add    $0x5fea,%ebx
  10601c:	83 ec 14             	sub    $0x14,%esp
    // TODO
  set_cr3(PDirPool[index]);
  10601f:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  106023:	c1 e0 0c             	shl    $0xc,%eax
  106026:	81 c0 00 a0 d5 00    	add    $0xd5a000,%eax
  10602c:	50                   	push   %eax
  10602d:	e8 2e b2 ff ff       	call   101260 <set_cr3>
}
  106032:	83 c4 18             	add    $0x18,%esp
  106035:	5b                   	pop    %ebx
  106036:	c3                   	ret    
  106037:	89 f6                	mov    %esi,%esi
  106039:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00106040 <get_pdir_entry>:
/** TASK 2:
  * * Return the page directory entry # [pde_index] of the process # [proc_index]
  * - This can be used to test whether the page directory entry is mapped
  */
unsigned int get_pdir_entry(unsigned int proc_index, unsigned int pde_index)
{
  106040:	e8 c2 a3 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  106045:	05 bb 5f 00 00       	add    $0x5fbb,%eax
    // TODO
  
  char * dirEntry =PDirPool[proc_index][pde_index];
  10604a:	c7 c2 00 a0 d5 00    	mov    $0xd5a000,%edx
  106050:	8b 44 24 04          	mov    0x4(%esp),%eax
  106054:	c1 e0 0a             	shl    $0xa,%eax
  106057:	03 44 24 08          	add    0x8(%esp),%eax
  10605b:	8b 04 82             	mov    (%edx,%eax,4),%eax

 
  return (int)dirEntry;

  return 0;
}   
  10605e:	c3                   	ret    
  10605f:	90                   	nop

00106060 <set_pdir_entry>:
  * - You should also set the permissions PTE_P, PTE_W, and PTE_U
  * Hint 1: PT_PERM_PTU is defined for you.
  * Hint 2: 
  */
void set_pdir_entry(unsigned int proc_index, unsigned int pde_index, unsigned int page_index)
{
  106060:	e8 a2 a3 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  106065:	05 9b 5f 00 00       	add    $0x5f9b,%eax
    // TODO

  
  // int * startAddress = (VM_USERLO + page_index)*PAGESIZE & 0xffffffff;
  int * startAddress = page_index <<12;
  10606a:	8b 54 24 0c          	mov    0xc(%esp),%edx
  PDirPool[proc_index][pde_index] = (int) startAddress |  PT_PERM_PTU;
  10606e:	c7 c1 00 a0 d5 00    	mov    $0xd5a000,%ecx
  106074:	8b 44 24 04          	mov    0x4(%esp),%eax
  int * startAddress = page_index <<12;
  106078:	c1 e2 0c             	shl    $0xc,%edx
  PDirPool[proc_index][pde_index] = (int) startAddress |  PT_PERM_PTU;
  10607b:	c1 e0 0a             	shl    $0xa,%eax
  10607e:	03 44 24 08          	add    0x8(%esp),%eax
  106082:	83 ca 07             	or     $0x7,%edx
  106085:	89 14 81             	mov    %edx,(%ecx,%eax,4)
  106088:	c3                   	ret    
  106089:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00106090 <set_pdir_entry_identity>:
  * - You should also set the permissions PTE_P, PTE_W, and PTE_U
  * - This will be used to map the page directory entry to identity page table.
  * Hint 1: Cast the first entry of IDPTbl[pde_index] to char *.
  */
void set_pdir_entry_identity(unsigned int proc_index, unsigned int pde_index)
{   
  106090:	53                   	push   %ebx
    // TODO

  PDirPool[proc_index][pde_index] = (char *)((int)IDPTbl[pde_index]|PT_PERM_PTU);
  106091:	8b 54 24 08          	mov    0x8(%esp),%edx
{   
  106095:	8b 44 24 0c          	mov    0xc(%esp),%eax
  106099:	e8 71 a3 ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  10609e:	81 c3 62 5f 00 00    	add    $0x5f62,%ebx
  PDirPool[proc_index][pde_index] = (char *)((int)IDPTbl[pde_index]|PT_PERM_PTU);
  1060a4:	c1 e2 0a             	shl    $0xa,%edx
  1060a7:	01 c2                	add    %eax,%edx
  1060a9:	c1 e0 0c             	shl    $0xc,%eax
  1060ac:	81 c0 00 a0 95 00    	add    $0x95a000,%eax
  1060b2:	c7 c1 00 a0 d5 00    	mov    $0xd5a000,%ecx
  1060b8:	83 c8 07             	or     $0x7,%eax
  1060bb:	89 04 91             	mov    %eax,(%ecx,%edx,4)

}   
  1060be:	5b                   	pop    %ebx
  1060bf:	c3                   	ret    

001060c0 <rmv_pdir_entry>:
  * * Remove specified page directory entry 
  * Hint 1: Set the page directory entry to PT_PERM_UP.
  * Hint 2: Don't forget to cast the value to (char *).
  */
void rmv_pdir_entry(unsigned int proc_index, unsigned int pde_index)
{
  1060c0:	e8 42 a3 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  1060c5:	05 3b 5f 00 00       	add    $0x5f3b,%eax
    // TODO
  PDirPool[proc_index][pde_index] = (char *) PT_PERM_UP;
  1060ca:	c7 c2 00 a0 d5 00    	mov    $0xd5a000,%edx
  1060d0:	8b 44 24 04          	mov    0x4(%esp),%eax
  1060d4:	c1 e0 0a             	shl    $0xa,%eax
  1060d7:	03 44 24 08          	add    0x8(%esp),%eax
  1060db:	c7 04 82 00 00 00 00 	movl   $0x0,(%edx,%eax,4)
  1060e2:	c3                   	ret    
  1060e3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1060e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001060f0 <get_ptbl_entry>:
  * Hint 2: Do not forget that the permission info is also stored in the page directory entries.
  *         (You will have to mask out the permission info.)
  * Hint 3: Remember to cast to a pointer before de-referencing an address.
  */
unsigned int get_ptbl_entry(unsigned int proc_index, unsigned int pde_index, unsigned int pte_index)
{   
  1060f0:	e8 12 a3 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  1060f5:	05 0b 5f 00 00       	add    $0x5f0b,%eax
    // TODO

  int * page_table = (int *)((int)PDirPool[proc_index][pde_index]& 0xfffff000);
  1060fa:	c7 c2 00 a0 d5 00    	mov    $0xd5a000,%edx
  106100:	8b 44 24 04          	mov    0x4(%esp),%eax
  106104:	c1 e0 0a             	shl    $0xa,%eax
  106107:	03 44 24 08          	add    0x8(%esp),%eax
  10610b:	8b 04 82             	mov    (%edx,%eax,4),%eax
  10610e:	8b 54 24 0c          	mov    0xc(%esp),%edx
  106112:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  106117:	8b 04 90             	mov    (%eax,%edx,4),%eax

  return (int) page_table[pte_index];
  //return IDPTbl[pde_index][pte_index];

  return 0;
}
  10611a:	c3                   	ret    
  10611b:	90                   	nop
  10611c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00106120 <set_ptbl_entry>:
  * * Sets specified page table entry with the start address of physical page # [page_index]
  * - You should also set the given permission
  * Hint 1: Same as TASK 6
  */
void set_ptbl_entry(unsigned int proc_index, unsigned int pde_index, unsigned int pte_index, unsigned int page_index, unsigned int perm)
{   
  106120:	e8 e2 a2 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  106125:	05 db 5e 00 00       	add    $0x5edb,%eax
  
  char* identityList = PDirPool[proc_index][pde_index];

  int*  aIdentity  = (int) identityList &  0xfffff000;

  aIdentity[pte_index] = (page_index<<12)| perm;
  10612a:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
  char* identityList = PDirPool[proc_index][pde_index];
  10612e:	c7 c2 00 a0 d5 00    	mov    $0xd5a000,%edx
  106134:	8b 44 24 04          	mov    0x4(%esp),%eax
  106138:	c1 e0 0a             	shl    $0xa,%eax
  10613b:	03 44 24 08          	add    0x8(%esp),%eax
  int*  aIdentity  = (int) identityList &  0xfffff000;
  10613f:	8b 14 82             	mov    (%edx,%eax,4),%edx
  aIdentity[pte_index] = (page_index<<12)| perm;
  106142:	8b 44 24 10          	mov    0x10(%esp),%eax
  106146:	c1 e0 0c             	shl    $0xc,%eax
  106149:	0b 44 24 14          	or     0x14(%esp),%eax
  int*  aIdentity  = (int) identityList &  0xfffff000;
  10614d:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
  aIdentity[pte_index] = (page_index<<12)| perm;
  106153:	89 04 8a             	mov    %eax,(%edx,%ecx,4)
  106156:	c3                   	ret    
  106157:	89 f6                	mov    %esi,%esi
  106159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00106160 <set_ptbl_entry_identity>:
  * | 4       |    A[1][1]   |
  * | 5       |    A[1][2]   |
  * |---------|--------------|
  */
void set_ptbl_entry_identity(unsigned int pde_index, unsigned int pte_index, unsigned int perm)
{
  106160:	e8 a2 a2 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  106165:	05 9b 5e 00 00       	add    $0x5e9b,%eax
    // TODO
  IDPTbl[pde_index][pte_index] =  (pde_index* 1024 + pte_index) * 4096 | perm;
  10616a:	c7 c1 00 a0 95 00    	mov    $0x95a000,%ecx
  106170:	8b 44 24 04          	mov    0x4(%esp),%eax
  106174:	c1 e0 0a             	shl    $0xa,%eax
  106177:	03 44 24 08          	add    0x8(%esp),%eax
  10617b:	89 c2                	mov    %eax,%edx
  10617d:	c1 e2 0c             	shl    $0xc,%edx
  106180:	0b 54 24 0c          	or     0xc(%esp),%edx
  106184:	89 14 81             	mov    %edx,(%ecx,%eax,4)
  106187:	c3                   	ret    
  106188:	90                   	nop
  106189:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00106190 <rmv_ptbl_entry>:
  * * Set the specified page table entry to 0
  * Hint 1: Remember that page directory entries also have permissions stored. Mask them out.
  * Hint 2: Remember to cast to a pointer before de-referencing an address.
  */
void rmv_ptbl_entry(unsigned int proc_index, unsigned int pde_index, unsigned int pte_index)
{
  106190:	e8 72 a2 ff ff       	call   100407 <__x86.get_pc_thunk.ax>
  106195:	05 6b 5e 00 00       	add    $0x5e6b,%eax
    // TODO

  int * pageTable = (int *)((int)PDirPool[proc_index][pde_index]& 0xfffff000);
  10619a:	c7 c2 00 a0 d5 00    	mov    $0xd5a000,%edx
  1061a0:	8b 44 24 04          	mov    0x4(%esp),%eax
  1061a4:	c1 e0 0a             	shl    $0xa,%eax
  1061a7:	03 44 24 08          	add    0x8(%esp),%eax
  1061ab:	8b 04 82             	mov    (%edx,%eax,4),%eax
  pageTable[pte_index] = 0;
  1061ae:	8b 54 24 0c          	mov    0xc(%esp),%edx
  int * pageTable = (int *)((int)PDirPool[proc_index][pde_index]& 0xfffff000);
  1061b2:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  pageTable[pte_index] = 0;
  1061b7:	c7 04 90 00 00 00 00 	movl   $0x0,(%eax,%edx,4)
  1061be:	c3                   	ret    
  1061bf:	90                   	nop

001061c0 <MPTIntro_test1>:

extern char * PDirPool[NUM_IDS][1024];
extern unsigned int IDPTbl[1024][1024];

int MPTIntro_test1()
{
  1061c0:	56                   	push   %esi
  1061c1:	53                   	push   %ebx
  1061c2:	e8 48 a2 ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  1061c7:	81 c3 39 5e 00 00    	add    $0x5e39,%ebx
  1061cd:	83 ec 10             	sub    $0x10,%esp
  set_pdir_base(0);
  1061d0:	6a 00                	push   $0x0
  1061d2:	e8 39 fe ff ff       	call   106010 <set_pdir_base>
  if ((unsigned int)PDirPool[0] != rcr3()) {
  1061d7:	e8 59 de ff ff       	call   104035 <rcr3>
  1061dc:	83 c4 10             	add    $0x10,%esp
  1061df:	81 f8 00 a0 d5 00    	cmp    $0xd5a000,%eax
  1061e5:	74 21                	je     106208 <MPTIntro_test1+0x48>
    dprintf("test 1 pDirPool  failed.\n");
  1061e7:	8d 83 ec bd ff ff    	lea    -0x4214(%ebx),%eax
  1061ed:	83 ec 0c             	sub    $0xc,%esp
  1061f0:	50                   	push   %eax
  1061f1:	e8 a2 d1 ff ff       	call   103398 <dprintf>
    return 1;
  1061f6:	83 c4 10             	add    $0x10,%esp
  1061f9:	b8 01 00 00 00       	mov    $0x1,%eax
    dprintf("test 1 remove entry  failed.\n");
    return 1;
  }
  dprintf("test 1 passed.\n");
  return 0;
}
  1061fe:	83 c4 04             	add    $0x4,%esp
  106201:	5b                   	pop    %ebx
  106202:	5e                   	pop    %esi
  106203:	c3                   	ret    
  106204:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  set_pdir_entry_identity(1, 1);
  106208:	83 ec 08             	sub    $0x8,%esp
  10620b:	6a 01                	push   $0x1
  10620d:	6a 01                	push   $0x1
  10620f:	e8 7c fe ff ff       	call   106090 <set_pdir_entry_identity>
  set_pdir_entry(1, 2, 100);
  106214:	83 c4 0c             	add    $0xc,%esp
  106217:	6a 64                	push   $0x64
  106219:	6a 02                	push   $0x2
  10621b:	6a 01                	push   $0x1
  10621d:	e8 3e fe ff ff       	call   106060 <set_pdir_entry>
  if (get_pdir_entry(1, 1) != (unsigned int)IDPTbl[1] +   7) {
  106222:	5e                   	pop    %esi
  106223:	58                   	pop    %eax
  106224:	6a 01                	push   $0x1
  106226:	6a 01                	push   $0x1
  106228:	e8 13 fe ff ff       	call   106040 <get_pdir_entry>
  10622d:	c7 c2 00 a0 95 00    	mov    $0x95a000,%edx
  106233:	83 c4 10             	add    $0x10,%esp
  106236:	8d b2 00 10 00 00    	lea    0x1000(%edx),%esi
  10623c:	81 c2 07 10 00 00    	add    $0x1007,%edx
  106242:	39 d0                	cmp    %edx,%eax
  106244:	74 20                	je     106266 <MPTIntro_test1+0xa6>
    dprintf("test 1 pDir Entry Identity 1 dir_entry = %d  IDPTble= %d  failed.\n",get_pdir_entry(1,1), IDPTbl[1]);
  106246:	83 ec 08             	sub    $0x8,%esp
  106249:	6a 01                	push   $0x1
  10624b:	6a 01                	push   $0x1
  10624d:	e8 ee fd ff ff       	call   106040 <get_pdir_entry>
  106252:	83 c4 0c             	add    $0xc,%esp
  106255:	56                   	push   %esi
  106256:	50                   	push   %eax
  106257:	8d 83 24 be ff ff    	lea    -0x41dc(%ebx),%eax
  10625d:	50                   	push   %eax
  10625e:	e8 35 d1 ff ff       	call   103398 <dprintf>
  106263:	83 c4 10             	add    $0x10,%esp
  if (get_pdir_entry(1, 2) != 409607) {
  106266:	83 ec 08             	sub    $0x8,%esp
  106269:	6a 02                	push   $0x2
  10626b:	6a 01                	push   $0x1
  10626d:	e8 ce fd ff ff       	call   106040 <get_pdir_entry>
  106272:	83 c4 10             	add    $0x10,%esp
  106275:	3d 07 40 06 00       	cmp    $0x64007,%eax
  10627a:	74 1e                	je     10629a <MPTIntro_test1+0xda>
    dprintf("test 1 pDir Entry Identity 2=%d  failed.\n", get_pdir_entry(1,2));
  10627c:	83 ec 08             	sub    $0x8,%esp
  10627f:	6a 02                	push   $0x2
  106281:	6a 01                	push   $0x1
  106283:	e8 b8 fd ff ff       	call   106040 <get_pdir_entry>
  106288:	5a                   	pop    %edx
  106289:	59                   	pop    %ecx
  10628a:	50                   	push   %eax
  10628b:	8d 83 68 be ff ff    	lea    -0x4198(%ebx),%eax
  106291:	50                   	push   %eax
  106292:	e8 01 d1 ff ff       	call   103398 <dprintf>
  106297:	83 c4 10             	add    $0x10,%esp
  rmv_pdir_entry(1, 1);
  10629a:	83 ec 08             	sub    $0x8,%esp
  10629d:	6a 01                	push   $0x1
  10629f:	6a 01                	push   $0x1
  1062a1:	e8 1a fe ff ff       	call   1060c0 <rmv_pdir_entry>
  rmv_pdir_entry(1, 2);
  1062a6:	58                   	pop    %eax
  1062a7:	5a                   	pop    %edx
  1062a8:	6a 02                	push   $0x2
  1062aa:	6a 01                	push   $0x1
  1062ac:	e8 0f fe ff ff       	call   1060c0 <rmv_pdir_entry>
  if (get_pdir_entry(1, 1) != 0 || get_pdir_entry(1, 2) != 0) {
  1062b1:	59                   	pop    %ecx
  1062b2:	5e                   	pop    %esi
  1062b3:	6a 01                	push   $0x1
  1062b5:	6a 01                	push   $0x1
  1062b7:	e8 84 fd ff ff       	call   106040 <get_pdir_entry>
  1062bc:	83 c4 10             	add    $0x10,%esp
  1062bf:	85 c0                	test   %eax,%eax
  1062c1:	75 13                	jne    1062d6 <MPTIntro_test1+0x116>
  1062c3:	83 ec 08             	sub    $0x8,%esp
  1062c6:	6a 02                	push   $0x2
  1062c8:	6a 01                	push   $0x1
  1062ca:	e8 71 fd ff ff       	call   106040 <get_pdir_entry>
  1062cf:	83 c4 10             	add    $0x10,%esp
  1062d2:	85 c0                	test   %eax,%eax
  1062d4:	74 22                	je     1062f8 <MPTIntro_test1+0x138>
    dprintf("test 1 remove entry  failed.\n");
  1062d6:	8d 83 06 be ff ff    	lea    -0x41fa(%ebx),%eax
  1062dc:	83 ec 0c             	sub    $0xc,%esp
  1062df:	50                   	push   %eax
  1062e0:	e8 b3 d0 ff ff       	call   103398 <dprintf>
  1062e5:	83 c4 10             	add    $0x10,%esp
    return 1;
  1062e8:	b8 01 00 00 00       	mov    $0x1,%eax
}
  1062ed:	83 c4 04             	add    $0x4,%esp
  1062f0:	5b                   	pop    %ebx
  1062f1:	5e                   	pop    %esi
  1062f2:	c3                   	ret    
  1062f3:	90                   	nop
  1062f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  dprintf("test 1 passed.\n");
  1062f8:	8d 83 56 bc ff ff    	lea    -0x43aa(%ebx),%eax
  1062fe:	83 ec 0c             	sub    $0xc,%esp
  106301:	50                   	push   %eax
  106302:	e8 91 d0 ff ff       	call   103398 <dprintf>
  106307:	83 c4 10             	add    $0x10,%esp
  return 0;
  10630a:	31 c0                	xor    %eax,%eax
  10630c:	e9 ed fe ff ff       	jmp    1061fe <MPTIntro_test1+0x3e>
  106311:	eb 0d                	jmp    106320 <MPTIntro_test2>
  106313:	90                   	nop
  106314:	90                   	nop
  106315:	90                   	nop
  106316:	90                   	nop
  106317:	90                   	nop
  106318:	90                   	nop
  106319:	90                   	nop
  10631a:	90                   	nop
  10631b:	90                   	nop
  10631c:	90                   	nop
  10631d:	90                   	nop
  10631e:	90                   	nop
  10631f:	90                   	nop

00106320 <MPTIntro_test2>:

int MPTIntro_test2()
{
  106320:	56                   	push   %esi
  106321:	53                   	push   %ebx
  106322:	e8 e8 a0 ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  106327:	81 c3 d9 5c 00 00    	add    $0x5cd9,%ebx
  10632d:	83 ec 08             	sub    $0x8,%esp
  set_pdir_entry(1, 1, 10000);
  106330:	68 10 27 00 00       	push   $0x2710
  106335:	6a 01                	push   $0x1
  106337:	6a 01                	push   $0x1
  106339:	e8 22 fd ff ff       	call   106060 <set_pdir_entry>
  set_ptbl_entry(1, 1, 1, 10000, 259);
  10633e:	c7 04 24 03 01 00 00 	movl   $0x103,(%esp)
  106345:	68 10 27 00 00       	push   $0x2710
  10634a:	6a 01                	push   $0x1
  10634c:	6a 01                	push   $0x1
  10634e:	6a 01                	push   $0x1
  106350:	e8 cb fd ff ff       	call   106120 <set_ptbl_entry>
  if (get_ptbl_entry(1, 1, 1) != 40960259) {
  106355:	83 c4 1c             	add    $0x1c,%esp
  106358:	6a 01                	push   $0x1
  10635a:	6a 01                	push   $0x1
  10635c:	6a 01                	push   $0x1
  10635e:	e8 8d fd ff ff       	call   1060f0 <get_ptbl_entry>
  106363:	83 c4 10             	add    $0x10,%esp
  106366:	3d 03 01 71 02       	cmp    $0x2710103,%eax
  10636b:	74 2f                	je     10639c <MPTIntro_test2+0x7c>
    dprintf("test 2 pdir=%d, get table entry=%d  failed.\n", get_pdir_entry(1,1), get_ptbl_entry(1,1,1));
  10636d:	83 ec 04             	sub    $0x4,%esp
  106370:	6a 01                	push   $0x1
  106372:	6a 01                	push   $0x1
  106374:	6a 01                	push   $0x1
  106376:	e8 75 fd ff ff       	call   1060f0 <get_ptbl_entry>
  10637b:	89 c6                	mov    %eax,%esi
  10637d:	58                   	pop    %eax
  10637e:	5a                   	pop    %edx
  10637f:	6a 01                	push   $0x1
  106381:	6a 01                	push   $0x1
  106383:	e8 b8 fc ff ff       	call   106040 <get_pdir_entry>
  106388:	83 c4 0c             	add    $0xc,%esp
  10638b:	56                   	push   %esi
  10638c:	50                   	push   %eax
  10638d:	8d 83 94 be ff ff    	lea    -0x416c(%ebx),%eax
  106393:	50                   	push   %eax
  106394:	e8 ff cf ff ff       	call   103398 <dprintf>
  106399:	83 c4 10             	add    $0x10,%esp
    // return 1;
  }
  rmv_ptbl_entry(1, 1, 1);
  10639c:	83 ec 04             	sub    $0x4,%esp
  10639f:	6a 01                	push   $0x1
  1063a1:	6a 01                	push   $0x1
  1063a3:	6a 01                	push   $0x1
  1063a5:	e8 e6 fd ff ff       	call   106190 <rmv_ptbl_entry>
  if (get_ptbl_entry(1, 1, 1) != 0) {
  1063aa:	83 c4 0c             	add    $0xc,%esp
  1063ad:	6a 01                	push   $0x1
  1063af:	6a 01                	push   $0x1
  1063b1:	6a 01                	push   $0x1
  1063b3:	e8 38 fd ff ff       	call   1060f0 <get_ptbl_entry>
  1063b8:	83 c4 10             	add    $0x10,%esp
  1063bb:	85 c0                	test   %eax,%eax
  1063bd:	75 29                	jne    1063e8 <MPTIntro_test2+0xc8>
    dprintf("test 2 remove table  entry = %d failed.\n", get_ptbl_entry(1,1,1));
    return 1;
  }
  rmv_pdir_entry(1, 1);
  1063bf:	83 ec 08             	sub    $0x8,%esp
  1063c2:	6a 01                	push   $0x1
  1063c4:	6a 01                	push   $0x1
  1063c6:	e8 f5 fc ff ff       	call   1060c0 <rmv_pdir_entry>
  dprintf("test 2 passed.\n");
  1063cb:	8d 83 76 bc ff ff    	lea    -0x438a(%ebx),%eax
  1063d1:	89 04 24             	mov    %eax,(%esp)
  1063d4:	e8 bf cf ff ff       	call   103398 <dprintf>
  return 0;
  1063d9:	83 c4 10             	add    $0x10,%esp
  1063dc:	31 c0                	xor    %eax,%eax
}
  1063de:	83 c4 04             	add    $0x4,%esp
  1063e1:	5b                   	pop    %ebx
  1063e2:	5e                   	pop    %esi
  1063e3:	c3                   	ret    
  1063e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    dprintf("test 2 remove table  entry = %d failed.\n", get_ptbl_entry(1,1,1));
  1063e8:	83 ec 04             	sub    $0x4,%esp
  1063eb:	6a 01                	push   $0x1
  1063ed:	6a 01                	push   $0x1
  1063ef:	6a 01                	push   $0x1
  1063f1:	e8 fa fc ff ff       	call   1060f0 <get_ptbl_entry>
  1063f6:	5a                   	pop    %edx
  1063f7:	59                   	pop    %ecx
  1063f8:	50                   	push   %eax
  1063f9:	8d 83 c4 be ff ff    	lea    -0x413c(%ebx),%eax
  1063ff:	50                   	push   %eax
  106400:	e8 93 cf ff ff       	call   103398 <dprintf>
    return 1;
  106405:	83 c4 10             	add    $0x10,%esp
  106408:	b8 01 00 00 00       	mov    $0x1,%eax
}
  10640d:	83 c4 04             	add    $0x4,%esp
  106410:	5b                   	pop    %ebx
  106411:	5e                   	pop    %esi
  106412:	c3                   	ret    
  106413:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  106419:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00106420 <MPTIntro_test_own>:
int MPTIntro_test_own()
{
  // TODO (optional)
  // dprintf("own test passed.\n");
  return 0;
}
  106420:	31 c0                	xor    %eax,%eax
  106422:	c3                   	ret    
  106423:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  106429:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00106430 <test_MPTIntro>:

int test_MPTIntro()
{
  106430:	53                   	push   %ebx
  106431:	83 ec 08             	sub    $0x8,%esp
  return MPTIntro_test1() + MPTIntro_test2() + MPTIntro_test_own();
  106434:	e8 87 fd ff ff       	call   1061c0 <MPTIntro_test1>
  106439:	89 c3                	mov    %eax,%ebx
  10643b:	e8 e0 fe ff ff       	call   106320 <MPTIntro_test2>
}
  106440:	83 c4 08             	add    $0x8,%esp
  return MPTIntro_test1() + MPTIntro_test2() + MPTIntro_test_own();
  106443:	01 d8                	add    %ebx,%eax
}
  106445:	5b                   	pop    %ebx
  106446:	c3                   	ret    
  106447:	66 90                	xchg   %ax,%ax
  106449:	66 90                	xchg   %ax,%ax
  10644b:	66 90                	xchg   %ax,%ax
  10644d:	66 90                	xchg   %ax,%ax
  10644f:	90                   	nop

00106450 <get_pdir_entry_by_va>:
  *         Use the masks defined above. (Do think of what the values are.)
  * Hint 2: Use the appropriate functions in MATIntro layer to 
  *         read the pdir_entry
  */
unsigned int get_pdir_entry_by_va(unsigned int proc_index, unsigned int vaddr)
{
  106450:	53                   	push   %ebx
  106451:	e8 b9 9f ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  106456:	81 c3 aa 5b 00 00    	add    $0x5baa,%ebx
  10645c:	83 ec 10             	sub    $0x10,%esp
    // TODO

  int pageDirectoryIndex = (DIR_MASK & vaddr)>>22;
  10645f:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  106463:	c1 e8 16             	shr    $0x16,%eax
  int pageTableIndex = (PAGE_MASK & vaddr)>>12;



  int pdir = get_pdir_entry(proc_index, pageDirectoryIndex);
  106466:	50                   	push   %eax
  106467:	ff 74 24 1c          	pushl  0x1c(%esp)
  10646b:	e8 d0 fb ff ff       	call   106040 <get_pdir_entry>

  
  return (int)pdir;

    return 0;
}
  106470:	83 c4 18             	add    $0x18,%esp
  106473:	5b                   	pop    %ebx
  106474:	c3                   	ret    
  106475:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  106479:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00106480 <get_ptbl_entry_by_va>:
  * - Return 0 if the mapping does not exist in page directory entry (i.e. pde = 0).
  *
  * Hint 1: Same as TASK 1.
  */
unsigned int get_ptbl_entry_by_va(unsigned int proc_index, unsigned int vaddr)
{
  106480:	55                   	push   %ebp
  106481:	57                   	push   %edi
  106482:	56                   	push   %esi
  106483:	53                   	push   %ebx
  106484:	e8 86 9f ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  106489:	81 c3 77 5b 00 00    	add    $0x5b77,%ebx
  10648f:	83 ec 14             	sub    $0x14,%esp
  106492:	8b 74 24 2c          	mov    0x2c(%esp),%esi
    // TODO

  int pageDirectoryIndex =( DIR_MASK & vaddr)>>22;
  106496:	89 f7                	mov    %esi,%edi
  int pageTableIndex = (PAGE_MASK & vaddr)>>12;
  106498:	c1 ee 0c             	shr    $0xc,%esi
  int pageDirectoryIndex =( DIR_MASK & vaddr)>>22;
  10649b:	c1 ef 16             	shr    $0x16,%edi
  int pageTableIndex = (PAGE_MASK & vaddr)>>12;
  10649e:	81 e6 ff 03 00 00    	and    $0x3ff,%esi
  int offset = (OFFSET_MASK & vaddr);

  int pdir = get_pdir_entry(proc_index, pageDirectoryIndex);
  1064a4:	57                   	push   %edi
  1064a5:	ff 74 24 2c          	pushl  0x2c(%esp)
  1064a9:	e8 92 fb ff ff       	call   106040 <get_pdir_entry>
  int ptbl = get_ptbl_entry(proc_index, pageDirectoryIndex, pageTableIndex);
  1064ae:	83 c4 0c             	add    $0xc,%esp
  int pdir = get_pdir_entry(proc_index, pageDirectoryIndex);
  1064b1:	89 c5                	mov    %eax,%ebp
  int ptbl = get_ptbl_entry(proc_index, pageDirectoryIndex, pageTableIndex);
  1064b3:	56                   	push   %esi
  1064b4:	57                   	push   %edi
  1064b5:	ff 74 24 2c          	pushl  0x2c(%esp)
  1064b9:	e8 32 fc ff ff       	call   1060f0 <get_ptbl_entry>

  if(ptbl != 0  && pdir != 0){
  1064be:	83 c4 10             	add    $0x10,%esp
  1064c1:	85 c0                	test   %eax,%eax
  1064c3:	74 13                	je     1064d8 <get_ptbl_entry_by_va+0x58>
  1064c5:	85 ed                	test   %ebp,%ebp
  1064c7:	74 0f                	je     1064d8 <get_ptbl_entry_by_va+0x58>
    
     return ptbl;
  }

    return 0;
}         
  1064c9:	83 c4 0c             	add    $0xc,%esp
  1064cc:	5b                   	pop    %ebx
  1064cd:	5e                   	pop    %esi
  1064ce:	5f                   	pop    %edi
  1064cf:	5d                   	pop    %ebp
  1064d0:	c3                   	ret    
  1064d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1064d8:	83 c4 0c             	add    $0xc,%esp
    return 0;
  1064db:	31 c0                	xor    %eax,%eax
}         
  1064dd:	5b                   	pop    %ebx
  1064de:	5e                   	pop    %esi
  1064df:	5f                   	pop    %edi
  1064e0:	5d                   	pop    %ebp
  1064e1:	c3                   	ret    
  1064e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1064e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001064f0 <rmv_pdir_entry_by_va>:
  * * Remove the page directory entry for the given virtual address
  * Hint 1: Calculate the arguments required by the function(rmv_pdir_entry) in MPTIntro layer
  *         and simply call it.
  */
void rmv_pdir_entry_by_va(unsigned int proc_index, unsigned int vaddr)
{
  1064f0:	53                   	push   %ebx
  1064f1:	e8 19 9f ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  1064f6:	81 c3 0a 5b 00 00    	add    $0x5b0a,%ebx
  1064fc:	83 ec 10             	sub    $0x10,%esp
    // TODO

  int pageDirectoryIndex = (DIR_MASK & vaddr)>>22;
  1064ff:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  106503:	c1 e8 16             	shr    $0x16,%eax
  int pageTableIndex = (PAGE_MASK & vaddr)>>12;


  rmv_pdir_entry(proc_index, pageDirectoryIndex);
  106506:	50                   	push   %eax
  106507:	ff 74 24 1c          	pushl  0x1c(%esp)
  10650b:	e8 b0 fb ff ff       	call   1060c0 <rmv_pdir_entry>
}
  106510:	83 c4 18             	add    $0x18,%esp
  106513:	5b                   	pop    %ebx
  106514:	c3                   	ret    
  106515:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  106519:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00106520 <rmv_ptbl_entry_by_va>:
/** TASK 4:
  * * Remove the page table entry for the given virtual address
  * Hint 1: Same as TASK 3. Use the correct function.
  */
void rmv_ptbl_entry_by_va(unsigned int proc_index, unsigned int vaddr)
{
  106520:	53                   	push   %ebx
  106521:	e8 e9 9e ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  106526:	81 c3 da 5a 00 00    	add    $0x5ada,%ebx
  10652c:	83 ec 0c             	sub    $0xc,%esp
  10652f:	8b 44 24 18          	mov    0x18(%esp),%eax
    // TODO

  int pageDirectoryIndex = (DIR_MASK & vaddr)>>22;
  int pageTableIndex = (PAGE_MASK & vaddr)>>12;
  106533:	89 c2                	mov    %eax,%edx
  int pageDirectoryIndex = (DIR_MASK & vaddr)>>22;
  106535:	c1 e8 16             	shr    $0x16,%eax
  int pageTableIndex = (PAGE_MASK & vaddr)>>12;
  106538:	c1 ea 0c             	shr    $0xc,%edx
  10653b:	81 e2 ff 03 00 00    	and    $0x3ff,%edx

  rmv_ptbl_entry(proc_index, pageDirectoryIndex, pageTableIndex);
  106541:	52                   	push   %edx
  106542:	50                   	push   %eax
  106543:	ff 74 24 1c          	pushl  0x1c(%esp)
  106547:	e8 44 fc ff ff       	call   106190 <rmv_ptbl_entry>
}
  10654c:	83 c4 18             	add    $0x18,%esp
  10654f:	5b                   	pop    %ebx
  106550:	c3                   	ret    
  106551:	eb 0d                	jmp    106560 <set_pdir_entry_by_va>
  106553:	90                   	nop
  106554:	90                   	nop
  106555:	90                   	nop
  106556:	90                   	nop
  106557:	90                   	nop
  106558:	90                   	nop
  106559:	90                   	nop
  10655a:	90                   	nop
  10655b:	90                   	nop
  10655c:	90                   	nop
  10655d:	90                   	nop
  10655e:	90                   	nop
  10655f:	90                   	nop

00106560 <set_pdir_entry_by_va>:
/** TASK 5:
  * * Register the mapping from the virtual address [vaddr] to physical page # [page_index] in the page directory.
  * Hint: Same as TASK 3. Use the correct function.
  */
void set_pdir_entry_by_va(unsigned int proc_index, unsigned int vaddr, unsigned int page_index)
{
  106560:	53                   	push   %ebx
  106561:	e8 a9 9e ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  106566:	81 c3 9a 5a 00 00    	add    $0x5a9a,%ebx
  10656c:	83 ec 0c             	sub    $0xc,%esp

  int pageDirectoryIndex = (DIR_MASK & vaddr) >>22;
  int pageTableIndex = (PAGE_MASK & vaddr) >>12;

  //set_pdir_entry(proc_index, pageDirectoryIndex, pageTableIndex);
  set_pdir_entry(proc_index, pageDirectoryIndex, page_index);
  10656f:	ff 74 24 1c          	pushl  0x1c(%esp)
  int pageDirectoryIndex = (DIR_MASK & vaddr) >>22;
  106573:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  106577:	c1 e8 16             	shr    $0x16,%eax
  set_pdir_entry(proc_index, pageDirectoryIndex, page_index);
  10657a:	50                   	push   %eax
  10657b:	ff 74 24 1c          	pushl  0x1c(%esp)
  10657f:	e8 dc fa ff ff       	call   106060 <set_pdir_entry>
}   
  106584:	83 c4 18             	add    $0x18,%esp
  106587:	5b                   	pop    %ebx
  106588:	c3                   	ret    
  106589:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00106590 <set_ptbl_entry_by_va>:
  * * Register the mapping from the virtual address [vaddr] to the physical page # [page_index] with permission [perm]
  * - You do not need to worry about the page directory entry. just map the page table entry.
  * Hint: Same as TASK 3. Use the correct function.
  */
void set_ptbl_entry_by_va(unsigned int proc_index, unsigned int vaddr, unsigned int page_index, unsigned int perm)
{
  106590:	53                   	push   %ebx
  106591:	e8 79 9e ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  106596:	81 c3 6a 5a 00 00    	add    $0x5a6a,%ebx
  10659c:	83 ec 14             	sub    $0x14,%esp
  10659f:	8b 44 24 20          	mov    0x20(%esp),%eax

  int pageDirectoryIndex = (DIR_MASK & vaddr)>>22;
  int pageTableIndex = (PAGE_MASK & vaddr)>>12;


  set_ptbl_entry(proc_index, pageDirectoryIndex, pageTableIndex, page_index, perm);
  1065a3:	ff 74 24 28          	pushl  0x28(%esp)
  1065a7:	ff 74 24 28          	pushl  0x28(%esp)
  int pageTableIndex = (PAGE_MASK & vaddr)>>12;
  1065ab:	89 c2                	mov    %eax,%edx
  int pageDirectoryIndex = (DIR_MASK & vaddr)>>22;
  1065ad:	c1 e8 16             	shr    $0x16,%eax
  int pageTableIndex = (PAGE_MASK & vaddr)>>12;
  1065b0:	c1 ea 0c             	shr    $0xc,%edx
  1065b3:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
  set_ptbl_entry(proc_index, pageDirectoryIndex, pageTableIndex, page_index, perm);
  1065b9:	52                   	push   %edx
  1065ba:	50                   	push   %eax
  1065bb:	ff 74 24 2c          	pushl  0x2c(%esp)
  1065bf:	e8 5c fb ff ff       	call   106120 <set_ptbl_entry>
}
  1065c4:	83 c4 28             	add    $0x28,%esp
  1065c7:	5b                   	pop    %ebx
  1065c8:	c3                   	ret    
  1065c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001065d0 <idptbl_init>:
  * Hint 2: You have already created the functions that deal with IDPTbl. 
  *         Calculate the appropriate permission values as mentioned above 
  *         and call set_ptbl_entry_identity from MATIntro layer.
  */
void idptbl_init(unsigned int mbi_adr)
{
  1065d0:	55                   	push   %ebp
  1065d1:	57                   	push   %edi


    container_init(mbi_adr);

    // TODO
    for(i = 0; i < 1024; i++){
  1065d2:	31 ff                	xor    %edi,%edi
{
  1065d4:	56                   	push   %esi
  1065d5:	53                   	push   %ebx
  1065d6:	e8 34 9e ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  1065db:	81 c3 25 5a 00 00    	add    $0x5a25,%ebx
  1065e1:	83 ec 18             	sub    $0x18,%esp
    container_init(mbi_adr);
  1065e4:	ff 74 24 2c          	pushl  0x2c(%esp)
  1065e8:	e8 b3 f5 ff ff       	call   105ba0 <container_init>
  1065ed:	83 c4 10             	add    $0x10,%esp
  1065f0:	8d af 00 ff ff ff    	lea    -0x100(%edi),%ebp
{
  1065f6:	31 f6                	xor    %esi,%esi
  1065f8:	90                   	nop
  1065f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      for(j = 0; j < 1024; j++){
        int pde_index = i; 
        int pte_index = j;

	// if(i< ( VM_USERHI_PI - VM_USERLO_PI)){ // kernel
	if( i> VM_USERHI_PI/1024|| i== VM_USERHI_PI/1024 || i < VM_USERLO_PI/1024){
  106600:	81 fd bf 02 00 00    	cmp    $0x2bf,%ebp
  106606:	77 2d                	ja     106635 <idptbl_init+0x65>
          set_ptbl_entry_identity(pde_index, pte_index, PT_PERM_PWG);
        }
        else{// usable
          set_ptbl_entry_identity(pde_index, pte_index, PT_PERM_PW);
  106608:	83 ec 04             	sub    $0x4,%esp
  10660b:	6a 03                	push   $0x3
  10660d:	56                   	push   %esi
  10660e:	57                   	push   %edi
  10660f:	e8 4c fb ff ff       	call   106160 <set_ptbl_entry_identity>
  106614:	83 c4 10             	add    $0x10,%esp
      for(j = 0; j < 1024; j++){
  106617:	83 c6 01             	add    $0x1,%esi
  10661a:	81 fe 00 04 00 00    	cmp    $0x400,%esi
  106620:	75 de                	jne    106600 <idptbl_init+0x30>
    for(i = 0; i < 1024; i++){
  106622:	83 c7 01             	add    $0x1,%edi
  106625:	81 ff 00 04 00 00    	cmp    $0x400,%edi
  10662b:	75 c3                	jne    1065f0 <idptbl_init+0x20>

      }
    }

    
}
  10662d:	83 c4 0c             	add    $0xc,%esp
  106630:	5b                   	pop    %ebx
  106631:	5e                   	pop    %esi
  106632:	5f                   	pop    %edi
  106633:	5d                   	pop    %ebp
  106634:	c3                   	ret    
          set_ptbl_entry_identity(pde_index, pte_index, PT_PERM_PWG);
  106635:	83 ec 04             	sub    $0x4,%esp
  106638:	68 03 01 00 00       	push   $0x103
  10663d:	56                   	push   %esi
  10663e:	57                   	push   %edi
  10663f:	e8 1c fb ff ff       	call   106160 <set_ptbl_entry_identity>
  106644:	83 c4 10             	add    $0x10,%esp
  106647:	eb ce                	jmp    106617 <idptbl_init+0x47>
  106649:	66 90                	xchg   %ax,%ax
  10664b:	66 90                	xchg   %ax,%ax
  10664d:	66 90                	xchg   %ax,%ax
  10664f:	90                   	nop

00106650 <MPTOp_test1>:
#include <lib/debug.h>
#include "export.h"

int MPTOp_test1()
{
  106650:	56                   	push   %esi
  106651:	53                   	push   %ebx
  106652:	e8 b8 9d ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  106657:	81 c3 a9 59 00 00    	add    $0x59a9,%ebx
  10665d:	83 ec 0c             	sub    $0xc,%esp
  unsigned int vaddr = 4096*1024*300;

  
  if (get_ptbl_entry_by_va(10, vaddr) != 0) {
  106660:	68 00 00 00 4b       	push   $0x4b000000
  106665:	6a 0a                	push   $0xa
  106667:	e8 14 fe ff ff       	call   106480 <get_ptbl_entry_by_va>
  10666c:	83 c4 10             	add    $0x10,%esp
  10666f:	85 c0                	test   %eax,%eax
  106671:	0f 85 b9 01 00 00    	jne    106830 <MPTOp_test1+0x1e0>
    dprintf("test 1 get ptbl entry by va = %d failed.\n", get_ptbl_entry_by_va(10, vaddr));
    // return 1;
  }
  if (get_pdir_entry_by_va(10, vaddr) != 0) {
  106677:	83 ec 08             	sub    $0x8,%esp
  10667a:	68 00 00 00 4b       	push   $0x4b000000
  10667f:	6a 0a                	push   $0xa
  106681:	e8 ca fd ff ff       	call   106450 <get_pdir_entry_by_va>
  106686:	83 c4 10             	add    $0x10,%esp
  106689:	85 c0                	test   %eax,%eax
  10668b:	0f 85 6f 01 00 00    	jne    106800 <MPTOp_test1+0x1b0>
    dprintf("test 1 get pdir entry by va = %d failed.\n", get_pdir_entry_by_va(10,vaddr));
    // return 1;
  }
  set_pdir_entry_by_va(10, vaddr, 100);
  106691:	83 ec 04             	sub    $0x4,%esp
  106694:	6a 64                	push   $0x64
  106696:	68 00 00 00 4b       	push   $0x4b000000
  10669b:	6a 0a                	push   $0xa
  10669d:	e8 be fe ff ff       	call   106560 <set_pdir_entry_by_va>
  set_ptbl_entry_by_va(10, vaddr, 100, 259);
  1066a2:	68 03 01 00 00       	push   $0x103
  1066a7:	6a 64                	push   $0x64
  1066a9:	68 00 00 00 4b       	push   $0x4b000000
  1066ae:	6a 0a                	push   $0xa
  1066b0:	e8 db fe ff ff       	call   106590 <set_ptbl_entry_by_va>
  if (get_ptbl_entry_by_va(10, vaddr) == 0) {
  1066b5:	83 c4 18             	add    $0x18,%esp
  1066b8:	68 00 00 00 4b       	push   $0x4b000000
  1066bd:	6a 0a                	push   $0xa
  1066bf:	e8 bc fd ff ff       	call   106480 <get_ptbl_entry_by_va>
  1066c4:	83 c4 10             	add    $0x10,%esp
  1066c7:	85 c0                	test   %eax,%eax
  1066c9:	0f 84 f1 00 00 00    	je     1067c0 <MPTOp_test1+0x170>
    dprintf("test 1 again get page directory=%d, ptable entry by va = %d failed.\n",get_pdir_entry_by_va(10, vaddr), get_ptbl_entry_by_va(10, vaddr));
    // return 1;
  }
  if (get_pdir_entry_by_va(10, vaddr) == 0) {
  1066cf:	83 ec 08             	sub    $0x8,%esp
  1066d2:	68 00 00 00 4b       	push   $0x4b000000
  1066d7:	6a 0a                	push   $0xa
  1066d9:	e8 72 fd ff ff       	call   106450 <get_pdir_entry_by_va>
  1066de:	83 c4 10             	add    $0x10,%esp
  1066e1:	85 c0                	test   %eax,%eax
  1066e3:	0f 84 af 00 00 00    	je     106798 <MPTOp_test1+0x148>
    dprintf("test 1 again get pdir entry by va=%d failed.\n", get_pdir_entry_by_va(10, vaddr));
    // return 1;
  }
  rmv_ptbl_entry_by_va(10, vaddr);
  1066e9:	83 ec 08             	sub    $0x8,%esp
  1066ec:	68 00 00 00 4b       	push   $0x4b000000
  1066f1:	6a 0a                	push   $0xa
  1066f3:	e8 28 fe ff ff       	call   106520 <rmv_ptbl_entry_by_va>
  rmv_pdir_entry_by_va(10, vaddr);
  1066f8:	59                   	pop    %ecx
  1066f9:	5e                   	pop    %esi
  1066fa:	68 00 00 00 4b       	push   $0x4b000000
  1066ff:	6a 0a                	push   $0xa
  106701:	e8 ea fd ff ff       	call   1064f0 <rmv_pdir_entry_by_va>
  if (get_ptbl_entry_by_va(10, vaddr) != 0) {
  106706:	58                   	pop    %eax
  106707:	5a                   	pop    %edx
  106708:	68 00 00 00 4b       	push   $0x4b000000
  10670d:	6a 0a                	push   $0xa
  10670f:	e8 6c fd ff ff       	call   106480 <get_ptbl_entry_by_va>
  106714:	83 c4 10             	add    $0x10,%esp
  106717:	85 c0                	test   %eax,%eax
  106719:	75 55                	jne    106770 <MPTOp_test1+0x120>
    dprintf("test 1 rmv ptbl entry by va = %d failed.\n", get_ptbl_entry_by_va(10,vaddr));
    // return 1;
  }
  if (get_pdir_entry_by_va(10, vaddr) != 0) {
  10671b:	83 ec 08             	sub    $0x8,%esp
  10671e:	68 00 00 00 4b       	push   $0x4b000000
  106723:	6a 0a                	push   $0xa
  106725:	e8 26 fd ff ff       	call   106450 <get_pdir_entry_by_va>
  10672a:	83 c4 10             	add    $0x10,%esp
  10672d:	85 c0                	test   %eax,%eax
  10672f:	74 21                	je     106752 <MPTOp_test1+0x102>
    dprintf("test 1 rmv pdir entry by va=%d failed.\n", get_pdir_entry_by_va(10, vaddr));
  106731:	83 ec 08             	sub    $0x8,%esp
  106734:	68 00 00 00 4b       	push   $0x4b000000
  106739:	6a 0a                	push   $0xa
  10673b:	e8 10 fd ff ff       	call   106450 <get_pdir_entry_by_va>
  106740:	5a                   	pop    %edx
  106741:	59                   	pop    %ecx
  106742:	50                   	push   %eax
  106743:	8d 83 ec bf ff ff    	lea    -0x4014(%ebx),%eax
  106749:	50                   	push   %eax
  10674a:	e8 49 cc ff ff       	call   103398 <dprintf>
  10674f:	83 c4 10             	add    $0x10,%esp
    // return 1;
  }
				     
  dprintf("test 1 passed.\n");
  106752:	8d 83 56 bc ff ff    	lea    -0x43aa(%ebx),%eax
  106758:	83 ec 0c             	sub    $0xc,%esp
  10675b:	50                   	push   %eax
  10675c:	e8 37 cc ff ff       	call   103398 <dprintf>
  return 0;
}
  106761:	83 c4 14             	add    $0x14,%esp
  106764:	31 c0                	xor    %eax,%eax
  106766:	5b                   	pop    %ebx
  106767:	5e                   	pop    %esi
  106768:	c3                   	ret    
  106769:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    dprintf("test 1 rmv ptbl entry by va = %d failed.\n", get_ptbl_entry_by_va(10,vaddr));
  106770:	83 ec 08             	sub    $0x8,%esp
  106773:	68 00 00 00 4b       	push   $0x4b000000
  106778:	6a 0a                	push   $0xa
  10677a:	e8 01 fd ff ff       	call   106480 <get_ptbl_entry_by_va>
  10677f:	5e                   	pop    %esi
  106780:	5a                   	pop    %edx
  106781:	50                   	push   %eax
  106782:	8d 83 c0 bf ff ff    	lea    -0x4040(%ebx),%eax
  106788:	50                   	push   %eax
  106789:	e8 0a cc ff ff       	call   103398 <dprintf>
  10678e:	83 c4 10             	add    $0x10,%esp
  106791:	eb 88                	jmp    10671b <MPTOp_test1+0xcb>
  106793:	90                   	nop
  106794:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    dprintf("test 1 again get pdir entry by va=%d failed.\n", get_pdir_entry_by_va(10, vaddr));
  106798:	83 ec 08             	sub    $0x8,%esp
  10679b:	68 00 00 00 4b       	push   $0x4b000000
  1067a0:	6a 0a                	push   $0xa
  1067a2:	e8 a9 fc ff ff       	call   106450 <get_pdir_entry_by_va>
  1067a7:	59                   	pop    %ecx
  1067a8:	5e                   	pop    %esi
  1067a9:	50                   	push   %eax
  1067aa:	8d 83 90 bf ff ff    	lea    -0x4070(%ebx),%eax
  1067b0:	50                   	push   %eax
  1067b1:	e8 e2 cb ff ff       	call   103398 <dprintf>
  1067b6:	83 c4 10             	add    $0x10,%esp
  1067b9:	e9 2b ff ff ff       	jmp    1066e9 <MPTOp_test1+0x99>
  1067be:	66 90                	xchg   %ax,%ax
    dprintf("test 1 again get page directory=%d, ptable entry by va = %d failed.\n",get_pdir_entry_by_va(10, vaddr), get_ptbl_entry_by_va(10, vaddr));
  1067c0:	83 ec 08             	sub    $0x8,%esp
  1067c3:	68 00 00 00 4b       	push   $0x4b000000
  1067c8:	6a 0a                	push   $0xa
  1067ca:	e8 b1 fc ff ff       	call   106480 <get_ptbl_entry_by_va>
  1067cf:	89 c6                	mov    %eax,%esi
  1067d1:	58                   	pop    %eax
  1067d2:	5a                   	pop    %edx
  1067d3:	68 00 00 00 4b       	push   $0x4b000000
  1067d8:	6a 0a                	push   $0xa
  1067da:	e8 71 fc ff ff       	call   106450 <get_pdir_entry_by_va>
  1067df:	83 c4 0c             	add    $0xc,%esp
  1067e2:	56                   	push   %esi
  1067e3:	50                   	push   %eax
  1067e4:	8d 83 48 bf ff ff    	lea    -0x40b8(%ebx),%eax
  1067ea:	50                   	push   %eax
  1067eb:	e8 a8 cb ff ff       	call   103398 <dprintf>
  1067f0:	83 c4 10             	add    $0x10,%esp
  1067f3:	e9 d7 fe ff ff       	jmp    1066cf <MPTOp_test1+0x7f>
  1067f8:	90                   	nop
  1067f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    dprintf("test 1 get pdir entry by va = %d failed.\n", get_pdir_entry_by_va(10,vaddr));
  106800:	83 ec 08             	sub    $0x8,%esp
  106803:	68 00 00 00 4b       	push   $0x4b000000
  106808:	6a 0a                	push   $0xa
  10680a:	e8 41 fc ff ff       	call   106450 <get_pdir_entry_by_va>
  10680f:	59                   	pop    %ecx
  106810:	5e                   	pop    %esi
  106811:	50                   	push   %eax
  106812:	8d 83 1c bf ff ff    	lea    -0x40e4(%ebx),%eax
  106818:	50                   	push   %eax
  106819:	e8 7a cb ff ff       	call   103398 <dprintf>
  10681e:	83 c4 10             	add    $0x10,%esp
  106821:	e9 6b fe ff ff       	jmp    106691 <MPTOp_test1+0x41>
  106826:	8d 76 00             	lea    0x0(%esi),%esi
  106829:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    dprintf("test 1 get ptbl entry by va = %d failed.\n", get_ptbl_entry_by_va(10, vaddr));
  106830:	83 ec 08             	sub    $0x8,%esp
  106833:	68 00 00 00 4b       	push   $0x4b000000
  106838:	6a 0a                	push   $0xa
  10683a:	e8 41 fc ff ff       	call   106480 <get_ptbl_entry_by_va>
  10683f:	5a                   	pop    %edx
  106840:	59                   	pop    %ecx
  106841:	50                   	push   %eax
  106842:	8d 83 f0 be ff ff    	lea    -0x4110(%ebx),%eax
  106848:	50                   	push   %eax
  106849:	e8 4a cb ff ff       	call   103398 <dprintf>
  10684e:	83 c4 10             	add    $0x10,%esp
  106851:	e9 21 fe ff ff       	jmp    106677 <MPTOp_test1+0x27>
  106856:	8d 76 00             	lea    0x0(%esi),%esi
  106859:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00106860 <MPTOp_test_own>:
int MPTOp_test_own()
{
  // TODO (optional)
  // dprintf("own test passed.\n");
  return 0;
}
  106860:	31 c0                	xor    %eax,%eax
  106862:	c3                   	ret    
  106863:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  106869:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00106870 <test_MPTOp>:

int test_MPTOp()
{
  return MPTOp_test1() + MPTOp_test_own();
  106870:	e9 db fd ff ff       	jmp    106650 <MPTOp_test1>
  106875:	66 90                	xchg   %ax,%ax
  106877:	66 90                	xchg   %ax,%ax
  106879:	66 90                	xchg   %ax,%ax
  10687b:	66 90                	xchg   %ax,%ax
  10687d:	66 90                	xchg   %ax,%ax
  10687f:	90                   	nop

00106880 <pdir_init>:
  * Hint 1: Recall which portions are reserved for the kernel and calculate the pde_index.       
  * Hint 2: Recall which function in MPTIntro layer is used to set identity map. (See import.h) 
  * Hint 3: Remove the page directory entry to unmap it.
  */
void pdir_init(unsigned int mbi_adr)
{
  106880:	55                   	push   %ebp
  106881:	57                   	push   %edi
    int i ,j;

    idptbl_init(mbi_adr);

    // TODO
    for(i = 0; i < NUM_IDS; i++){
  106882:	31 ed                	xor    %ebp,%ebp
{
  106884:	56                   	push   %esi
  106885:	53                   	push   %ebx
  106886:	e8 84 9b ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  10688b:	81 c3 75 57 00 00    	add    $0x5775,%ebx
  106891:	83 ec 18             	sub    $0x18,%esp
    idptbl_init(mbi_adr);
  106894:	ff 74 24 2c          	pushl  0x2c(%esp)
  106898:	e8 33 fd ff ff       	call   1065d0 <idptbl_init>
  10689d:	83 c4 10             	add    $0x10,%esp
{
  1068a0:	bf 00 00 fc ff       	mov    $0xfffc0000,%edi
  1068a5:	31 f6                	xor    %esi,%esi
  1068a7:	89 f6                	mov    %esi,%esi
  1068a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      for(j = 0; j< 1024; j++){

	int proc_index  = i;
	int pde_index = j;
	if(pde_index*1024 < VM_USERLO_PI || pde_index*1024 >= VM_USERHI_PI){
  1068b0:	81 ff ff ff 0a 00    	cmp    $0xaffff,%edi
  1068b6:	77 2e                	ja     1068e6 <pdir_init+0x66>
	  set_pdir_entry_identity(proc_index, pde_index);
	}else{
	  rmv_pdir_entry(proc_index, pde_index);
  1068b8:	83 ec 08             	sub    $0x8,%esp
  1068bb:	56                   	push   %esi
  1068bc:	55                   	push   %ebp
  1068bd:	e8 fe f7 ff ff       	call   1060c0 <rmv_pdir_entry>
  1068c2:	83 c4 10             	add    $0x10,%esp
      for(j = 0; j< 1024; j++){
  1068c5:	83 c6 01             	add    $0x1,%esi
  1068c8:	81 c7 00 04 00 00    	add    $0x400,%edi
  1068ce:	81 fe 00 04 00 00    	cmp    $0x400,%esi
  1068d4:	75 da                	jne    1068b0 <pdir_init+0x30>
    for(i = 0; i < NUM_IDS; i++){
  1068d6:	83 c5 01             	add    $0x1,%ebp
  1068d9:	83 fd 40             	cmp    $0x40,%ebp
  1068dc:	75 c2                	jne    1068a0 <pdir_init+0x20>
	}

      }
    }

}
  1068de:	83 c4 0c             	add    $0xc,%esp
  1068e1:	5b                   	pop    %ebx
  1068e2:	5e                   	pop    %esi
  1068e3:	5f                   	pop    %edi
  1068e4:	5d                   	pop    %ebp
  1068e5:	c3                   	ret    
	  set_pdir_entry_identity(proc_index, pde_index);
  1068e6:	83 ec 08             	sub    $0x8,%esp
  1068e9:	56                   	push   %esi
  1068ea:	55                   	push   %ebp
  1068eb:	e8 a0 f7 ff ff       	call   106090 <set_pdir_entry_identity>
  1068f0:	83 c4 10             	add    $0x10,%esp
  1068f3:	eb d0                	jmp    1068c5 <pdir_init+0x45>
  1068f5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1068f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00106900 <alloc_ptbl>:
  * * 3. Clear (set to 0) all the page table entries for this newly mapped page table.
  * * 4. Return the page index of the newly allocated physical page.
  * 	 In the case when there's no physical page available, it returns 0.
  */
unsigned int alloc_ptbl(unsigned int proc_index, unsigned int vaddr)
{
  106900:	55                   	push   %ebp
  106901:	57                   	push   %edi
  106902:	56                   	push   %esi
  106903:	53                   	push   %ebx
  106904:	e8 06 9b ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  106909:	81 c3 f7 56 00 00    	add    $0x56f7,%ebx
  10690f:	83 ec 28             	sub    $0x28,%esp
  106912:	8b 74 24 3c          	mov    0x3c(%esp),%esi
  
  int pageDirectoryIndex = (DIR_MASK & vaddr)>>22;
  int pageTableIndex = (PAGE_MASK & vaddr)>>12;
  int offset = (OFFSET_MASK & vaddr);

  int pageIndex = container_alloc(proc_index);
  106916:	56                   	push   %esi
  106917:	e8 64 f4 ff ff       	call   105d80 <container_alloc>
  10691c:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  if(pageIndex!=0)  //not allocated
  106920:	83 c4 10             	add    $0x10,%esp
  106923:	85 c0                	test   %eax,%eax
  106925:	75 11                	jne    106938 <alloc_ptbl+0x38>
    return pageIndex;

  }

  return 0;
}
  106927:	8b 44 24 0c          	mov    0xc(%esp),%eax
  10692b:	83 c4 1c             	add    $0x1c,%esp
  10692e:	5b                   	pop    %ebx
  10692f:	5e                   	pop    %esi
  106930:	5f                   	pop    %edi
  106931:	5d                   	pop    %ebp
  106932:	c3                   	ret    
  106933:	90                   	nop
  106934:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    set_pdir_entry_by_va(proc_index, vaddr, pageIndex);
  106938:	83 ec 04             	sub    $0x4,%esp
    for(int i = 0; i < 1024; i++)
  10693b:	31 ed                	xor    %ebp,%ebp
    set_pdir_entry_by_va(proc_index, vaddr, pageIndex);
  10693d:	ff 74 24 10          	pushl  0x10(%esp)
  106941:	ff 74 24 3c          	pushl  0x3c(%esp)
  106945:	56                   	push   %esi
  106946:	e8 15 fc ff ff       	call   106560 <set_pdir_entry_by_va>
  int pageDirectoryIndex = (DIR_MASK & vaddr)>>22;
  10694b:	8b 7c 24 44          	mov    0x44(%esp),%edi
  10694f:	83 c4 10             	add    $0x10,%esp
  106952:	c1 ef 16             	shr    $0x16,%edi
  106955:	8d 76 00             	lea    0x0(%esi),%esi
    rmv_ptbl_entry(proc_index, pageDirectoryIndex, i);
  106958:	83 ec 04             	sub    $0x4,%esp
  10695b:	55                   	push   %ebp
  10695c:	57                   	push   %edi
    for(int i = 0; i < 1024; i++)
  10695d:	83 c5 01             	add    $0x1,%ebp
    rmv_ptbl_entry(proc_index, pageDirectoryIndex, i);
  106960:	56                   	push   %esi
  106961:	e8 2a f8 ff ff       	call   106190 <rmv_ptbl_entry>
    for(int i = 0; i < 1024; i++)
  106966:	83 c4 10             	add    $0x10,%esp
  106969:	81 fd 00 04 00 00    	cmp    $0x400,%ebp
  10696f:	75 e7                	jne    106958 <alloc_ptbl+0x58>
}
  106971:	8b 44 24 0c          	mov    0xc(%esp),%eax
  106975:	83 c4 1c             	add    $0x1c,%esp
  106978:	5b                   	pop    %ebx
  106979:	5e                   	pop    %esi
  10697a:	5f                   	pop    %edi
  10697b:	5d                   	pop    %ebp
  10697c:	c3                   	ret    
  10697d:	8d 76 00             	lea    0x0(%esi),%esi

00106980 <free_ptbl>:
  * Hint 1: Find the pde corresponding to vadr (MPTOp layer)
  * Hint 2: Remove the pde (MPTOp layer)
  * Hint 3: Use container free
  */
void free_ptbl(unsigned int proc_index, unsigned int vaddr)
{
  106980:	56                   	push   %esi
  106981:	53                   	push   %ebx
  106982:	e8 88 9a ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  106987:	81 c3 79 56 00 00    	add    $0x5679,%ebx
  10698d:	83 ec 0c             	sub    $0xc,%esp
  106990:	8b 74 24 18          	mov    0x18(%esp),%esi

  int pageDirectoryIndex = DIR_MASK & vaddr>>22;
  int pageTableIndex = PAGE_MASK & vaddr>>12;
  

  rmv_pdir_entry_by_va(proc_index, vaddr);
  106994:	ff 74 24 1c          	pushl  0x1c(%esp)
  106998:	56                   	push   %esi
  106999:	e8 52 fb ff ff       	call   1064f0 <rmv_pdir_entry_by_va>
  container_free(proc_index, pageDirectoryIndex);
  10699e:	58                   	pop    %eax
  10699f:	5a                   	pop    %edx
  1069a0:	6a 00                	push   $0x0
  1069a2:	56                   	push   %esi
  1069a3:	e8 18 f4 ff ff       	call   105dc0 <container_free>

}
  1069a8:	83 c4 14             	add    $0x14,%esp
  1069ab:	5b                   	pop    %ebx
  1069ac:	5e                   	pop    %esi
  1069ad:	c3                   	ret    
  1069ae:	66 90                	xchg   %ax,%ax

001069b0 <MPTComm_test1>:
#include <pmm/MContainer/export.h>
#include <vmm/MPTOp/export.h>
#include "export.h"

int MPTComm_test1()
{
  1069b0:	55                   	push   %ebp
  1069b1:	57                   	push   %edi
  1069b2:	bf 03 01 00 00       	mov    $0x103,%edi
  1069b7:	56                   	push   %esi
  1069b8:	53                   	push   %ebx
  1069b9:	be 00 ff ff ff       	mov    $0xffffff00,%esi
  1069be:	e8 4c 9a ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  1069c3:	81 c3 3d 56 00 00    	add    $0x563d,%ebx
  1069c9:	83 ec 0c             	sub    $0xc,%esp
  1069cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int i;
  for (i = 0; i < 1024; i ++) {     // kernel portion
    if (i < 256 || i >= 960) {      // proc[10], dir[kern], check if identity map
  1069d0:	81 fe bf 02 00 00    	cmp    $0x2bf,%esi
  1069d6:	77 2d                	ja     106a05 <MPTComm_test1+0x55>
  1069d8:	83 c6 01             	add    $0x1,%esi
  1069db:	81 c7 00 00 40 00    	add    $0x400000,%edi
  for (i = 0; i < 1024; i ++) {     // kernel portion
  1069e1:	81 fe 00 03 00 00    	cmp    $0x300,%esi
  1069e7:	75 e7                	jne    1069d0 <MPTComm_test1+0x20>
        dprintf("test 1 get ptbl entry by  va  pde=%d ptbl entry = %d failed.\n",(i*4096*1024+259), get_ptbl_entry_by_va(10, i*4096*1024));
	 return 1;
      }
    }
  }
  dprintf("test 1 passed.\n");
  1069e9:	8d 83 56 bc ff ff    	lea    -0x43aa(%ebx),%eax
  1069ef:	83 ec 0c             	sub    $0xc,%esp
  1069f2:	50                   	push   %eax
  1069f3:	e8 a0 c9 ff ff       	call   103398 <dprintf>
  return 0;
  1069f8:	83 c4 10             	add    $0x10,%esp
  1069fb:	31 c0                	xor    %eax,%eax
}
  1069fd:	83 c4 0c             	add    $0xc,%esp
  106a00:	5b                   	pop    %ebx
  106a01:	5e                   	pop    %esi
  106a02:	5f                   	pop    %edi
  106a03:	5d                   	pop    %ebp
  106a04:	c3                   	ret    
  106a05:	8d af fd fe ff ff    	lea    -0x103(%edi),%ebp
      if (get_ptbl_entry_by_va(10, i * 4096 * 1024) != i * 4096 * 1024 + 259) {
  106a0b:	83 ec 08             	sub    $0x8,%esp
  106a0e:	55                   	push   %ebp
  106a0f:	6a 0a                	push   $0xa
  106a11:	e8 6a fa ff ff       	call   106480 <get_ptbl_entry_by_va>
  106a16:	83 c4 10             	add    $0x10,%esp
  106a19:	39 f8                	cmp    %edi,%eax
  106a1b:	74 bb                	je     1069d8 <MPTComm_test1+0x28>
        dprintf("test 1 get ptbl entry by  va  pde=%d ptbl entry = %d failed.\n",(i*4096*1024+259), get_ptbl_entry_by_va(10, i*4096*1024));
  106a1d:	83 ec 08             	sub    $0x8,%esp
  106a20:	55                   	push   %ebp
  106a21:	6a 0a                	push   $0xa
  106a23:	e8 58 fa ff ff       	call   106480 <get_ptbl_entry_by_va>
  106a28:	83 c4 0c             	add    $0xc,%esp
  106a2b:	50                   	push   %eax
  106a2c:	8d 83 14 c0 ff ff    	lea    -0x3fec(%ebx),%eax
  106a32:	57                   	push   %edi
  106a33:	50                   	push   %eax
  106a34:	e8 5f c9 ff ff       	call   103398 <dprintf>
	 return 1;
  106a39:	83 c4 10             	add    $0x10,%esp
  106a3c:	b8 01 00 00 00       	mov    $0x1,%eax
  106a41:	eb ba                	jmp    1069fd <MPTComm_test1+0x4d>
  106a43:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  106a49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00106a50 <MPTComm_test2>:

int MPTComm_test2()
{
  106a50:	53                   	push   %ebx
  106a51:	e8 b9 99 ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  106a56:	81 c3 aa 55 00 00    	add    $0x55aa,%ebx
  106a5c:	83 ec 10             	sub    $0x10,%esp
  unsigned int vaddr = 300 * 4096 * 1024;
  container_split(0, 100);
  106a5f:	6a 64                	push   $0x64
  106a61:	6a 00                	push   $0x0
  106a63:	e8 b8 f2 ff ff       	call   105d20 <container_split>
   alloc_ptbl(1, vaddr);
  106a68:	59                   	pop    %ecx
  106a69:	58                   	pop    %eax
  106a6a:	68 00 00 00 4b       	push   $0x4b000000
  106a6f:	6a 01                	push   $0x1
  106a71:	e8 8a fe ff ff       	call   106900 <alloc_ptbl>
  if (get_pdir_entry_by_va(1, vaddr) == 0) {
  106a76:	58                   	pop    %eax
  106a77:	5a                   	pop    %edx
  106a78:	68 00 00 00 4b       	push   $0x4b000000
  106a7d:	6a 01                	push   $0x1
  106a7f:	e8 cc f9 ff ff       	call   106450 <get_pdir_entry_by_va>
  106a84:	83 c4 10             	add    $0x10,%esp
  106a87:	85 c0                	test   %eax,%eax
  106a89:	0f 84 99 00 00 00    	je     106b28 <MPTComm_test2+0xd8>
    dprintf("test 2 get directory entry by va = %d failed.\n", get_pdir_entry_by_va(1, vaddr));
    //return 1;
  }
  if(get_ptbl_entry_by_va(1, vaddr) != 0) {
  106a8f:	83 ec 08             	sub    $0x8,%esp
  106a92:	68 00 00 00 4b       	push   $0x4b000000
  106a97:	6a 01                	push   $0x1
  106a99:	e8 e2 f9 ff ff       	call   106480 <get_ptbl_entry_by_va>
  106a9e:	83 c4 10             	add    $0x10,%esp
  106aa1:	85 c0                	test   %eax,%eax
  106aa3:	75 5b                	jne    106b00 <MPTComm_test2+0xb0>
    dprintf("test 2 get ptbl entry by va=%d failed.\n", get_ptbl_entry_by_va(1, vaddr));
    //return 1;
  }
  free_ptbl(1, vaddr);
  106aa5:	83 ec 08             	sub    $0x8,%esp
  106aa8:	68 00 00 00 4b       	push   $0x4b000000
  106aad:	6a 01                	push   $0x1
  106aaf:	e8 cc fe ff ff       	call   106980 <free_ptbl>
  if (get_pdir_entry_by_va(1, vaddr) != 0) {
  106ab4:	58                   	pop    %eax
  106ab5:	5a                   	pop    %edx
  106ab6:	68 00 00 00 4b       	push   $0x4b000000
  106abb:	6a 01                	push   $0x1
  106abd:	e8 8e f9 ff ff       	call   106450 <get_pdir_entry_by_va>
  106ac2:	83 c4 10             	add    $0x10,%esp
  106ac5:	85 c0                	test   %eax,%eax
  106ac7:	74 21                	je     106aea <MPTComm_test2+0x9a>
    dprintf("test 2 free ptbl=%d failed.\n", get_pdir_entry_by_va(1, vaddr));
  106ac9:	83 ec 08             	sub    $0x8,%esp
  106acc:	68 00 00 00 4b       	push   $0x4b000000
  106ad1:	6a 01                	push   $0x1
  106ad3:	e8 78 f9 ff ff       	call   106450 <get_pdir_entry_by_va>
  106ad8:	5a                   	pop    %edx
  106ad9:	59                   	pop    %ecx
  106ada:	50                   	push   %eax
  106adb:	8d 83 ac c0 ff ff    	lea    -0x3f54(%ebx),%eax
  106ae1:	50                   	push   %eax
  106ae2:	e8 b1 c8 ff ff       	call   103398 <dprintf>
  106ae7:	83 c4 10             	add    $0x10,%esp
    //return 1;
  }
  dprintf("test 2 passed.\n");
  106aea:	8d 83 76 bc ff ff    	lea    -0x438a(%ebx),%eax
  106af0:	83 ec 0c             	sub    $0xc,%esp
  106af3:	50                   	push   %eax
  106af4:	e8 9f c8 ff ff       	call   103398 <dprintf>
  return 0;
}
  106af9:	83 c4 18             	add    $0x18,%esp
  106afc:	31 c0                	xor    %eax,%eax
  106afe:	5b                   	pop    %ebx
  106aff:	c3                   	ret    
    dprintf("test 2 get ptbl entry by va=%d failed.\n", get_ptbl_entry_by_va(1, vaddr));
  106b00:	83 ec 08             	sub    $0x8,%esp
  106b03:	68 00 00 00 4b       	push   $0x4b000000
  106b08:	6a 01                	push   $0x1
  106b0a:	e8 71 f9 ff ff       	call   106480 <get_ptbl_entry_by_va>
  106b0f:	59                   	pop    %ecx
  106b10:	5a                   	pop    %edx
  106b11:	50                   	push   %eax
  106b12:	8d 83 84 c0 ff ff    	lea    -0x3f7c(%ebx),%eax
  106b18:	50                   	push   %eax
  106b19:	e8 7a c8 ff ff       	call   103398 <dprintf>
  106b1e:	83 c4 10             	add    $0x10,%esp
  106b21:	eb 82                	jmp    106aa5 <MPTComm_test2+0x55>
  106b23:	90                   	nop
  106b24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    dprintf("test 2 get directory entry by va = %d failed.\n", get_pdir_entry_by_va(1, vaddr));
  106b28:	83 ec 08             	sub    $0x8,%esp
  106b2b:	68 00 00 00 4b       	push   $0x4b000000
  106b30:	6a 01                	push   $0x1
  106b32:	e8 19 f9 ff ff       	call   106450 <get_pdir_entry_by_va>
  106b37:	59                   	pop    %ecx
  106b38:	5a                   	pop    %edx
  106b39:	50                   	push   %eax
  106b3a:	8d 83 54 c0 ff ff    	lea    -0x3fac(%ebx),%eax
  106b40:	50                   	push   %eax
  106b41:	e8 52 c8 ff ff       	call   103398 <dprintf>
  106b46:	83 c4 10             	add    $0x10,%esp
  106b49:	e9 41 ff ff ff       	jmp    106a8f <MPTComm_test2+0x3f>
  106b4e:	66 90                	xchg   %ax,%ax

00106b50 <MPTComm_test_own>:
int MPTComm_test_own()
{
  // TODO (optional)
  // dprintf("own test passed.\n");
  return 0;
}
  106b50:	31 c0                	xor    %eax,%eax
  106b52:	c3                   	ret    
  106b53:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  106b59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00106b60 <test_MPTComm>:

int test_MPTComm()
{
  106b60:	53                   	push   %ebx
  106b61:	83 ec 08             	sub    $0x8,%esp
  return MPTComm_test1() + MPTComm_test2() + MPTComm_test_own();
  106b64:	e8 47 fe ff ff       	call   1069b0 <MPTComm_test1>
  106b69:	89 c3                	mov    %eax,%ebx
  106b6b:	e8 e0 fe ff ff       	call   106a50 <MPTComm_test2>
}
  106b70:	83 c4 08             	add    $0x8,%esp
  return MPTComm_test1() + MPTComm_test2() + MPTComm_test_own();
  106b73:	01 d8                	add    %ebx,%eax
}
  106b75:	5b                   	pop    %ebx
  106b76:	c3                   	ret    
  106b77:	66 90                	xchg   %ax,%ax
  106b79:	66 90                	xchg   %ax,%ax
  106b7b:	66 90                	xchg   %ax,%ax
  106b7d:	66 90                	xchg   %ax,%ax
  106b7f:	90                   	nop

00106b80 <pdir_init_kern>:
  *  
  * Hint 1: Note that part of the task is already completed by pdir_init.
  * Hint 2: Here just set the remaining portion of process 0's page directory entry as identity map.
  */
void pdir_init_kern(unsigned int mbi_adr)
{
  106b80:	56                   	push   %esi
  106b81:	53                   	push   %ebx
    // TODO: define your local variables here.

    int i;
    
    //TODO
    pdir_init(mbi_adr);
  106b82:	be 00 00 04 00       	mov    $0x40000,%esi
  106b87:	e8 83 98 ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  106b8c:	81 c3 74 54 00 00    	add    $0x5474,%ebx
{
  106b92:	83 ec 10             	sub    $0x10,%esp
    pdir_init(mbi_adr);
  106b95:	ff 74 24 1c          	pushl  0x1c(%esp)
  106b99:	e8 e2 fc ff ff       	call   106880 <pdir_init>
  106b9e:	83 c4 10             	add    $0x10,%esp
  106ba1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

    for(i = VM_USERLO_PI; i < VM_USERHI_PI; i++){
       set_pdir_entry_identity(0, i/1024);
  106ba8:	89 f0                	mov    %esi,%eax
  106baa:	83 ec 08             	sub    $0x8,%esp
    for(i = VM_USERLO_PI; i < VM_USERHI_PI; i++){
  106bad:	83 c6 01             	add    $0x1,%esi
       set_pdir_entry_identity(0, i/1024);
  106bb0:	c1 f8 0a             	sar    $0xa,%eax
  106bb3:	50                   	push   %eax
  106bb4:	6a 00                	push   $0x0
  106bb6:	e8 d5 f4 ff ff       	call   106090 <set_pdir_entry_identity>
    for(i = VM_USERLO_PI; i < VM_USERHI_PI; i++){
  106bbb:	83 c4 10             	add    $0x10,%esp
  106bbe:	81 fe 00 00 0f 00    	cmp    $0xf0000,%esi
  106bc4:	75 e2                	jne    106ba8 <pdir_init_kern+0x28>
       // rmv_ptbl_entry_by_va(0, i*4096);
      
    }

}
  106bc6:	83 c4 04             	add    $0x4,%esp
  106bc9:	5b                   	pop    %ebx
  106bca:	5e                   	pop    %esi
  106bcb:	c3                   	ret    
  106bcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00106bd0 <map_page>:
  *         - If there is an error during allocation, return MagicNumber.
  * Hint 3: If you have a valid pde, set the page table entry to new physical page (page_index) and perm.
  * Hint 4: Return the pde index or MagicNumber.
  */
unsigned int map_page(unsigned int proc_index, unsigned int vadr, unsigned int page_index, unsigned int perm)
{   
  106bd0:	55                   	push   %ebp
  106bd1:	57                   	push   %edi
  106bd2:	56                   	push   %esi
  106bd3:	53                   	push   %ebx
  106bd4:	e8 36 98 ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  106bd9:	81 c3 27 54 00 00    	add    $0x5427,%ebx
  106bdf:	83 ec 24             	sub    $0x24,%esp
  106be2:	8b 74 24 38          	mov    0x38(%esp),%esi
  106be6:	8b 7c 24 3c          	mov    0x3c(%esp),%edi


  int pageDirectoryIndex = (DIR_MASK & vadr)>>22;
  int pageTableIndex = (PAGE_MASK & vadr)>>12;

  int pageDirectoryEntry = get_pdir_entry_by_va(proc_index, vadr);
  106bea:	57                   	push   %edi
  106beb:	56                   	push   %esi
  106bec:	e8 5f f8 ff ff       	call   106450 <get_pdir_entry_by_va>

  if(pageDirectoryEntry==0){
  106bf1:	83 c4 10             	add    $0x10,%esp
  106bf4:	85 c0                	test   %eax,%eax
  106bf6:	75 28                	jne    106c20 <map_page+0x50>
    // allocate the page

    int t = alloc_ptbl(proc_index, vadr);
  106bf8:	83 ec 08             	sub    $0x8,%esp
  106bfb:	57                   	push   %edi
  106bfc:	56                   	push   %esi
  106bfd:	e8 fe fc ff ff       	call   106900 <alloc_ptbl>
    if(t==0) return MagicNumber;
  106c02:	83 c4 10             	add    $0x10,%esp
  106c05:	85 c0                	test   %eax,%eax
  106c07:	75 47                	jne    106c50 <map_page+0x80>
  }
  else{
    set_ptbl_entry_by_va(proc_index, vadr, page_index, perm);
    return (pageDirectoryEntry / PAGESIZE);
  }
}
  106c09:	83 c4 1c             	add    $0x1c,%esp
    if(t==0) return MagicNumber;
  106c0c:	b8 01 00 10 00       	mov    $0x100001,%eax
}
  106c11:	5b                   	pop    %ebx
  106c12:	5e                   	pop    %esi
  106c13:	5f                   	pop    %edi
  106c14:	5d                   	pop    %ebp
  106c15:	c3                   	ret    
  106c16:	8d 76 00             	lea    0x0(%esi),%esi
  106c19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    set_ptbl_entry_by_va(proc_index, vadr, page_index, perm);
  106c20:	ff 74 24 3c          	pushl  0x3c(%esp)
  106c24:	ff 74 24 3c          	pushl  0x3c(%esp)
  106c28:	89 c5                	mov    %eax,%ebp
  106c2a:	57                   	push   %edi
  106c2b:	56                   	push   %esi
  106c2c:	e8 5f f9 ff ff       	call   106590 <set_ptbl_entry_by_va>
    return (pageDirectoryEntry / PAGESIZE);
  106c31:	8d 95 ff 0f 00 00    	lea    0xfff(%ebp),%edx
  106c37:	83 c4 10             	add    $0x10,%esp
  106c3a:	89 e8                	mov    %ebp,%eax
  106c3c:	85 ed                	test   %ebp,%ebp
  106c3e:	0f 48 c2             	cmovs  %edx,%eax
  106c41:	c1 f8 0c             	sar    $0xc,%eax
}
  106c44:	83 c4 1c             	add    $0x1c,%esp
  106c47:	5b                   	pop    %ebx
  106c48:	5e                   	pop    %esi
  106c49:	5f                   	pop    %edi
  106c4a:	5d                   	pop    %ebp
  106c4b:	c3                   	ret    
  106c4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    set_ptbl_entry_by_va(proc_index, vadr, t, perm);
  106c50:	ff 74 24 3c          	pushl  0x3c(%esp)
  106c54:	50                   	push   %eax
  106c55:	89 44 24 14          	mov    %eax,0x14(%esp)
  106c59:	57                   	push   %edi
  106c5a:	56                   	push   %esi
  106c5b:	e8 30 f9 ff ff       	call   106590 <set_ptbl_entry_by_va>
    return t;
  106c60:	83 c4 10             	add    $0x10,%esp
  106c63:	8b 44 24 0c          	mov    0xc(%esp),%eax
  106c67:	eb db                	jmp    106c44 <map_page+0x74>
  106c69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00106c70 <unmap_page>:
  *         - Nothing should be done if the mapping no longer exists.
  * Hint 2: If pte is valid, remove page table entry for vadr.
  * Hint 3: Return the corresponding page table entry.
  */
unsigned int unmap_page(unsigned int proc_index, unsigned int vadr)
{
  106c70:	55                   	push   %ebp
  106c71:	57                   	push   %edi
  106c72:	56                   	push   %esi
  106c73:	53                   	push   %ebx
  106c74:	e8 96 97 ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  106c79:	81 c3 87 53 00 00    	add    $0x5387,%ebx
  106c7f:	83 ec 14             	sub    $0x14,%esp
  106c82:	8b 74 24 28          	mov    0x28(%esp),%esi
  106c86:	8b 7c 24 2c          	mov    0x2c(%esp),%edi
  // TODO

  int pageDirectoryIndex = DIR_MASK & vadr>>22;
  int pageTableIndex = PAGE_MASK & vadr>>12;

  int pageindex = get_ptbl_entry_by_va(proc_index, vadr);
  106c8a:	57                   	push   %edi
  106c8b:	56                   	push   %esi
  106c8c:	e8 ef f7 ff ff       	call   106480 <get_ptbl_entry_by_va>
  106c91:	89 c5                	mov    %eax,%ebp

      rmv_ptbl_entry_by_va(proc_index, vadr);
  106c93:	58                   	pop    %eax
  106c94:	5a                   	pop    %edx
  106c95:	57                   	push   %edi
  106c96:	56                   	push   %esi
  106c97:	e8 84 f8 ff ff       	call   106520 <rmv_ptbl_entry_by_va>
      return pageindex;
     

  return 0;
}   
  106c9c:	83 c4 1c             	add    $0x1c,%esp
  106c9f:	89 e8                	mov    %ebp,%eax
  106ca1:	5b                   	pop    %ebx
  106ca2:	5e                   	pop    %esi
  106ca3:	5f                   	pop    %edi
  106ca4:	5d                   	pop    %ebp
  106ca5:	c3                   	ret    
  106ca6:	66 90                	xchg   %ax,%ax
  106ca8:	66 90                	xchg   %ax,%ax
  106caa:	66 90                	xchg   %ax,%ax
  106cac:	66 90                	xchg   %ax,%ax
  106cae:	66 90                	xchg   %ax,%ax

00106cb0 <MPTKern_test1>:
#include <pmm/MContainer/export.h>
#include <vmm/MPTOp/export.h>
#include "export.h"

int MPTKern_test1()
{
  106cb0:	53                   	push   %ebx
  106cb1:	e8 59 97 ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  106cb6:	81 c3 4a 53 00 00    	add    $0x534a,%ebx
  106cbc:	83 ec 14             	sub    $0x14,%esp
  if (get_ptbl_entry_by_va(1, vaddr) != 0) {
    dprintf("test 1 unmap page %d  failed.\n", get_ptbl_entry_by_va(1, vaddr));
    // return 1;
  }
  */
  dprintf("test 1  passed.\n");
  106cbf:	8d 83 c9 c0 ff ff    	lea    -0x3f37(%ebx),%eax
  106cc5:	50                   	push   %eax
  106cc6:	e8 cd c6 ff ff       	call   103398 <dprintf>
  return 0;
}
  106ccb:	83 c4 18             	add    $0x18,%esp
  106cce:	31 c0                	xor    %eax,%eax
  106cd0:	5b                   	pop    %ebx
  106cd1:	c3                   	ret    
  106cd2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  106cd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00106ce0 <MPTKern_test2>:

int MPTKern_test2()
{
  106ce0:	55                   	push   %ebp
  106ce1:	57                   	push   %edi
  106ce2:	56                   	push   %esi
  106ce3:	53                   	push   %ebx
  unsigned int i;
  for (i = 256; i < 960; i ++) {
  106ce4:	be 00 01 00 00       	mov    $0x100,%esi
  106ce9:	e8 21 97 ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  106cee:	81 c3 12 53 00 00    	add    $0x5312,%ebx
{
  106cf4:	83 ec 0c             	sub    $0xc,%esp
    if (get_ptbl_entry_by_va(0, i * 4096 * 1024L) != i * 4096 * 1024L + 3) {
      dprintf("test 2 ptbl entry %d = %d, should be= %d  failed.\n",i, get_ptbl_entry_by_va(0, i*4096*1024L), (i*4096*1024L));
  106cf7:	8d ab dc c0 ff ff    	lea    -0x3f24(%ebx),%ebp
  106cfd:	8d 76 00             	lea    0x0(%esi),%esi
    if (get_ptbl_entry_by_va(0, i * 4096 * 1024L) != i * 4096 * 1024L + 3) {
  106d00:	89 f7                	mov    %esi,%edi
  106d02:	83 ec 08             	sub    $0x8,%esp
  106d05:	c1 e7 16             	shl    $0x16,%edi
  106d08:	57                   	push   %edi
  106d09:	6a 00                	push   $0x0
  106d0b:	e8 70 f7 ff ff       	call   106480 <get_ptbl_entry_by_va>
  106d10:	8d 57 03             	lea    0x3(%edi),%edx
  106d13:	83 c4 10             	add    $0x10,%esp
  106d16:	39 c2                	cmp    %eax,%edx
  106d18:	74 17                	je     106d31 <MPTKern_test2+0x51>
      dprintf("test 2 ptbl entry %d = %d, should be= %d  failed.\n",i, get_ptbl_entry_by_va(0, i*4096*1024L), (i*4096*1024L));
  106d1a:	83 ec 08             	sub    $0x8,%esp
  106d1d:	57                   	push   %edi
  106d1e:	6a 00                	push   $0x0
  106d20:	e8 5b f7 ff ff       	call   106480 <get_ptbl_entry_by_va>
  106d25:	57                   	push   %edi
  106d26:	50                   	push   %eax
  106d27:	56                   	push   %esi
  106d28:	55                   	push   %ebp
  106d29:	e8 6a c6 ff ff       	call   103398 <dprintf>
  106d2e:	83 c4 20             	add    $0x20,%esp
  for (i = 256; i < 960; i ++) {
  106d31:	83 c6 01             	add    $0x1,%esi
  106d34:	81 fe c0 03 00 00    	cmp    $0x3c0,%esi
  106d3a:	75 c4                	jne    106d00 <MPTKern_test2+0x20>
      // return 1;
    }
  }
  dprintf("test 2 passed.\n");
  106d3c:	8d 83 76 bc ff ff    	lea    -0x438a(%ebx),%eax
  106d42:	83 ec 0c             	sub    $0xc,%esp
  106d45:	50                   	push   %eax
  106d46:	e8 4d c6 ff ff       	call   103398 <dprintf>
  return 0;
}
  106d4b:	83 c4 1c             	add    $0x1c,%esp
  106d4e:	31 c0                	xor    %eax,%eax
  106d50:	5b                   	pop    %ebx
  106d51:	5e                   	pop    %esi
  106d52:	5f                   	pop    %edi
  106d53:	5d                   	pop    %ebp
  106d54:	c3                   	ret    
  106d55:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  106d59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00106d60 <MPTKern_test_own>:
int MPTKern_test_own()
{
  // TODO (optional)
  // dprintf("own test passed.\n");
  return 0;
}
  106d60:	31 c0                	xor    %eax,%eax
  106d62:	c3                   	ret    
  106d63:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  106d69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00106d70 <test_MPTKern>:

int test_MPTKern()
{
  106d70:	53                   	push   %ebx
  106d71:	e8 99 96 ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  106d76:	81 c3 8a 52 00 00    	add    $0x528a,%ebx
  106d7c:	83 ec 14             	sub    $0x14,%esp
  dprintf("test 1  passed.\n");
  106d7f:	8d 83 c9 c0 ff ff    	lea    -0x3f37(%ebx),%eax
  106d85:	50                   	push   %eax
  106d86:	e8 0d c6 ff ff       	call   103398 <dprintf>
  return MPTKern_test1() + MPTKern_test2() + MPTKern_test_own();
}
  106d8b:	83 c4 18             	add    $0x18,%esp
  106d8e:	5b                   	pop    %ebx
  return MPTKern_test1() + MPTKern_test2() + MPTKern_test_own();
  106d8f:	e9 4c ff ff ff       	jmp    106ce0 <MPTKern_test2>
  106d94:	66 90                	xchg   %ax,%ax
  106d96:	66 90                	xchg   %ax,%ax
  106d98:	66 90                	xchg   %ax,%ax
  106d9a:	66 90                	xchg   %ax,%ax
  106d9c:	66 90                	xchg   %ax,%ax
  106d9e:	66 90                	xchg   %ax,%ax

00106da0 <paging_init>:
 * Initializes the page structures,
 * move to the page structure # 0 (kernel).
 * and turn on the paging.
 */
void paging_init(unsigned int mbi_addr)
{
  106da0:	53                   	push   %ebx
  106da1:	e8 69 96 ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  106da6:	81 c3 5a 52 00 00    	add    $0x525a,%ebx
  106dac:	83 ec 14             	sub    $0x14,%esp
	pdir_init_kern(mbi_addr);
  106daf:	ff 74 24 1c          	pushl  0x1c(%esp)
  106db3:	e8 c8 fd ff ff       	call   106b80 <pdir_init_kern>
	set_pdir_base(0);
  106db8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  106dbf:	e8 4c f2 ff ff       	call   106010 <set_pdir_base>
	enable_paging();
  106dc4:	e8 bf a4 ff ff       	call   101288 <enable_paging>
}
  106dc9:	83 c4 18             	add    $0x18,%esp
  106dcc:	5b                   	pop    %ebx
  106dcd:	c3                   	ret    
  106dce:	66 90                	xchg   %ax,%ax

00106dd0 <alloc_page>:
  *   - It should return the physical page index registered in the page directory, i.e., the
  *     return value from map_page.
  *   - In the case of error, it should return the MagicNumber.
  */
unsigned int alloc_page (unsigned int proc_index, unsigned int vaddr, unsigned int perm)
{
  106dd0:	56                   	push   %esi
  106dd1:	53                   	push   %ebx
  106dd2:	e8 38 96 ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  106dd7:	81 c3 29 52 00 00    	add    $0x5229,%ebx
  106ddd:	83 ec 10             	sub    $0x10,%esp
  106de0:	8b 74 24 1c          	mov    0x1c(%esp),%esi

  //dprintf("alloc page \n");

  // map_page(unsigned int, unsigned int, unsigned int, unsigned int);

  unsigned int pageindex = container_alloc(proc_index);
  106de4:	56                   	push   %esi
  106de5:	e8 96 ef ff ff       	call   105d80 <container_alloc>

  if(pageindex != 0){   
  106dea:	83 c4 10             	add    $0x10,%esp
  106ded:	85 c0                	test   %eax,%eax
  106def:	ba 01 00 10 00       	mov    $0x100001,%edx
  106df4:	75 0a                	jne    106e00 <alloc_page+0x30>
     return mp;
  }
  else{ // error
    return MagicNumber;
  }
}
  106df6:	83 c4 04             	add    $0x4,%esp
  106df9:	89 d0                	mov    %edx,%eax
  106dfb:	5b                   	pop    %ebx
  106dfc:	5e                   	pop    %esi
  106dfd:	c3                   	ret    
  106dfe:	66 90                	xchg   %ax,%ax
     unsigned int mp =  map_page(proc_index, vaddr, pageindex, perm);
  106e00:	ff 74 24 18          	pushl  0x18(%esp)
  106e04:	50                   	push   %eax
  106e05:	ff 74 24 1c          	pushl  0x1c(%esp)
  106e09:	56                   	push   %esi
  106e0a:	e8 c1 fd ff ff       	call   106bd0 <map_page>
     return mp;
  106e0f:	83 c4 10             	add    $0x10,%esp
     unsigned int mp =  map_page(proc_index, vaddr, pageindex, perm);
  106e12:	89 c2                	mov    %eax,%edx
}
  106e14:	83 c4 04             	add    $0x4,%esp
  106e17:	89 d0                	mov    %edx,%eax
  106e19:	5b                   	pop    %ebx
  106e1a:	5e                   	pop    %esi
  106e1b:	c3                   	ret    
  106e1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00106e20 <alloc_mem_quota>:

/**
 * Designate some memory quota for the next child process.
 */
unsigned int alloc_mem_quota (unsigned int id, unsigned int quota)
{
  106e20:	53                   	push   %ebx
  106e21:	e8 e9 95 ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  106e26:	81 c3 da 51 00 00    	add    $0x51da,%ebx
  106e2c:	83 ec 10             	sub    $0x10,%esp
	unsigned int child;
	child = container_split (id, quota);
  106e2f:	ff 74 24 1c          	pushl  0x1c(%esp)
  106e33:	ff 74 24 1c          	pushl  0x1c(%esp)
  106e37:	e8 e4 ee ff ff       	call   105d20 <container_split>
	return child;
}
  106e3c:	83 c4 18             	add    $0x18,%esp
  106e3f:	5b                   	pop    %ebx
  106e40:	c3                   	ret    
  106e41:	66 90                	xchg   %ax,%ax
  106e43:	66 90                	xchg   %ax,%ax
  106e45:	66 90                	xchg   %ax,%ax
  106e47:	66 90                	xchg   %ax,%ax
  106e49:	66 90                	xchg   %ax,%ax
  106e4b:	66 90                	xchg   %ax,%ax
  106e4d:	66 90                	xchg   %ax,%ax
  106e4f:	90                   	nop

00106e50 <MPTNew_test1>:
#include <lib/debug.h>
#include "export.h"

int MPTNew_test1()
{
  106e50:	53                   	push   %ebx
  106e51:	e8 b9 95 ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  106e56:	81 c3 aa 51 00 00    	add    $0x51aa,%ebx
  106e5c:	83 ec 10             	sub    $0x10,%esp
  unsigned int vaddr = 4096*1024*400;
  container_split(0, 100);
  106e5f:	6a 64                	push   $0x64
  106e61:	6a 00                	push   $0x0
  106e63:	e8 b8 ee ff ff       	call   105d20 <container_split>
  if (get_ptbl_entry_by_va(1, vaddr) != 0) {
  106e68:	59                   	pop    %ecx
  106e69:	58                   	pop    %eax
  106e6a:	68 00 00 00 64       	push   $0x64000000
  106e6f:	6a 01                	push   $0x1
  106e71:	e8 0a f6 ff ff       	call   106480 <get_ptbl_entry_by_va>
  106e76:	83 c4 10             	add    $0x10,%esp
  106e79:	85 c0                	test   %eax,%eax
  106e7b:	0f 85 af 00 00 00    	jne    106f30 <MPTNew_test1+0xe0>
    dprintf("test 1 get ptbl failed.\n");
    // return 1;
  }
  if (get_pdir_entry_by_va(1, vaddr) != 0) {
  106e81:	83 ec 08             	sub    $0x8,%esp
  106e84:	68 00 00 00 64       	push   $0x64000000
  106e89:	6a 01                	push   $0x1
  106e8b:	e8 c0 f5 ff ff       	call   106450 <get_pdir_entry_by_va>
  106e90:	83 c4 10             	add    $0x10,%esp
  106e93:	85 c0                	test   %eax,%eax
  106e95:	0f 85 7d 00 00 00    	jne    106f18 <MPTNew_test1+0xc8>
    dprintf("test 1 get pdir failed.\n");
    // return 1;
  }
  alloc_page(1, vaddr, 7);
  106e9b:	83 ec 04             	sub    $0x4,%esp
  106e9e:	6a 07                	push   $0x7
  106ea0:	68 00 00 00 64       	push   $0x64000000
  106ea5:	6a 01                	push   $0x1
  106ea7:	e8 24 ff ff ff       	call   106dd0 <alloc_page>
  if (get_ptbl_entry_by_va(1, vaddr) == 0) {
  106eac:	58                   	pop    %eax
  106ead:	5a                   	pop    %edx
  106eae:	68 00 00 00 64       	push   $0x64000000
  106eb3:	6a 01                	push   $0x1
  106eb5:	e8 c6 f5 ff ff       	call   106480 <get_ptbl_entry_by_va>
  106eba:	83 c4 10             	add    $0x10,%esp
  106ebd:	85 c0                	test   %eax,%eax
  106ebf:	74 3f                	je     106f00 <MPTNew_test1+0xb0>
    dprintf("test 1 allocate ptbl failed.\n");
    // return 1;
  }
  if (get_pdir_entry_by_va(1, vaddr) == 0) {
  106ec1:	83 ec 08             	sub    $0x8,%esp
  106ec4:	68 00 00 00 64       	push   $0x64000000
  106ec9:	6a 01                	push   $0x1
  106ecb:	e8 80 f5 ff ff       	call   106450 <get_pdir_entry_by_va>
  106ed0:	83 c4 10             	add    $0x10,%esp
  106ed3:	85 c0                	test   %eax,%eax
  106ed5:	75 12                	jne    106ee9 <MPTNew_test1+0x99>
    dprintf("test 1 allocate pdir failed.\n");
  106ed7:	8d 83 60 c1 ff ff    	lea    -0x3ea0(%ebx),%eax
  106edd:	83 ec 0c             	sub    $0xc,%esp
  106ee0:	50                   	push   %eax
  106ee1:	e8 b2 c4 ff ff       	call   103398 <dprintf>
  106ee6:	83 c4 10             	add    $0x10,%esp
    // return 1;
  }
  dprintf("test 1 passed.\n");
  106ee9:	8d 83 56 bc ff ff    	lea    -0x43aa(%ebx),%eax
  106eef:	83 ec 0c             	sub    $0xc,%esp
  106ef2:	50                   	push   %eax
  106ef3:	e8 a0 c4 ff ff       	call   103398 <dprintf>
  return 0;
}
  106ef8:	83 c4 18             	add    $0x18,%esp
  106efb:	31 c0                	xor    %eax,%eax
  106efd:	5b                   	pop    %ebx
  106efe:	c3                   	ret    
  106eff:	90                   	nop
    dprintf("test 1 allocate ptbl failed.\n");
  106f00:	8d 83 42 c1 ff ff    	lea    -0x3ebe(%ebx),%eax
  106f06:	83 ec 0c             	sub    $0xc,%esp
  106f09:	50                   	push   %eax
  106f0a:	e8 89 c4 ff ff       	call   103398 <dprintf>
  106f0f:	83 c4 10             	add    $0x10,%esp
  106f12:	eb ad                	jmp    106ec1 <MPTNew_test1+0x71>
  106f14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    dprintf("test 1 get pdir failed.\n");
  106f18:	8d 83 29 c1 ff ff    	lea    -0x3ed7(%ebx),%eax
  106f1e:	83 ec 0c             	sub    $0xc,%esp
  106f21:	50                   	push   %eax
  106f22:	e8 71 c4 ff ff       	call   103398 <dprintf>
  106f27:	83 c4 10             	add    $0x10,%esp
  106f2a:	e9 6c ff ff ff       	jmp    106e9b <MPTNew_test1+0x4b>
  106f2f:	90                   	nop
    dprintf("test 1 get ptbl failed.\n");
  106f30:	8d 83 10 c1 ff ff    	lea    -0x3ef0(%ebx),%eax
  106f36:	83 ec 0c             	sub    $0xc,%esp
  106f39:	50                   	push   %eax
  106f3a:	e8 59 c4 ff ff       	call   103398 <dprintf>
  106f3f:	83 c4 10             	add    $0x10,%esp
  106f42:	e9 3a ff ff ff       	jmp    106e81 <MPTNew_test1+0x31>
  106f47:	89 f6                	mov    %esi,%esi
  106f49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00106f50 <MPTNew_test_own>:
 * Be extra careful to make sure that if you overwrite some of the kernel data, they are set back to
 * the original value. O.w., it may make the future test scripts to fail even if you implement all
 * the functions correctly.
 */
int MPTNew_test_own()
{
  106f50:	53                   	push   %ebx
  106f51:	e8 b9 94 ff ff       	call   10040f <__x86.get_pc_thunk.bx>
  106f56:	81 c3 aa 50 00 00    	add    $0x50aa,%ebx
  106f5c:	83 ec 14             	sub    $0x14,%esp
  // TODO (optional)
  dprintf("own test passed.\n");
  106f5f:	8d 83 7e c1 ff ff    	lea    -0x3e82(%ebx),%eax
  106f65:	50                   	push   %eax
  106f66:	e8 2d c4 ff ff       	call   103398 <dprintf>

  
  unsigned int vaddr = 4096*1024*400;
  container_split(0, 100);
  106f6b:	59                   	pop    %ecx
  106f6c:	58                   	pop    %eax
  106f6d:	6a 64                	push   $0x64
  106f6f:	6a 00                	push   $0x0
  106f71:	e8 aa ed ff ff       	call   105d20 <container_split>
  if (get_ptbl_entry_by_va(2, vaddr) != 0) {
  106f76:	58                   	pop    %eax
  106f77:	5a                   	pop    %edx
  106f78:	68 00 00 00 64       	push   $0x64000000
  106f7d:	6a 02                	push   $0x2
  106f7f:	e8 fc f4 ff ff       	call   106480 <get_ptbl_entry_by_va>
  106f84:	83 c4 10             	add    $0x10,%esp
  106f87:	85 c0                	test   %eax,%eax
  106f89:	0f 85 b1 00 00 00    	jne    107040 <MPTNew_test_own+0xf0>
    dprintf("test 1 get ptbl failed.\n");
    // return 1;
  }
  if (get_pdir_entry_by_va(2, vaddr) != 0) {
  106f8f:	83 ec 08             	sub    $0x8,%esp
  106f92:	68 00 00 00 64       	push   $0x64000000
  106f97:	6a 02                	push   $0x2
  106f99:	e8 b2 f4 ff ff       	call   106450 <get_pdir_entry_by_va>
  106f9e:	83 c4 10             	add    $0x10,%esp
  106fa1:	85 c0                	test   %eax,%eax
  106fa3:	0f 85 7f 00 00 00    	jne    107028 <MPTNew_test_own+0xd8>
    dprintf("test 1 get pdir failed.\n");
    // return 1;
  }
  alloc_page(2, vaddr, 7);
  106fa9:	83 ec 04             	sub    $0x4,%esp
  106fac:	6a 07                	push   $0x7
  106fae:	68 00 00 00 64       	push   $0x64000000
  106fb3:	6a 02                	push   $0x2
  106fb5:	e8 16 fe ff ff       	call   106dd0 <alloc_page>
  if (get_ptbl_entry_by_va(2, vaddr) == 0) {
  106fba:	58                   	pop    %eax
  106fbb:	5a                   	pop    %edx
  106fbc:	68 00 00 00 64       	push   $0x64000000
  106fc1:	6a 02                	push   $0x2
  106fc3:	e8 b8 f4 ff ff       	call   106480 <get_ptbl_entry_by_va>
  106fc8:	83 c4 10             	add    $0x10,%esp
  106fcb:	85 c0                	test   %eax,%eax
  106fcd:	74 41                	je     107010 <MPTNew_test_own+0xc0>
    dprintf("test 1 allocate ptbl failed.\n");
    // return 1;
  }
  if (get_pdir_entry_by_va(2, vaddr) == 0) {
  106fcf:	83 ec 08             	sub    $0x8,%esp
  106fd2:	68 00 00 00 64       	push   $0x64000000
  106fd7:	6a 02                	push   $0x2
  106fd9:	e8 72 f4 ff ff       	call   106450 <get_pdir_entry_by_va>
  106fde:	83 c4 10             	add    $0x10,%esp
  106fe1:	85 c0                	test   %eax,%eax
  106fe3:	75 12                	jne    106ff7 <MPTNew_test_own+0xa7>
    dprintf("test 1 allocate pdir failed.\n");
  106fe5:	8d 83 60 c1 ff ff    	lea    -0x3ea0(%ebx),%eax
  106feb:	83 ec 0c             	sub    $0xc,%esp
  106fee:	50                   	push   %eax
  106fef:	e8 a4 c3 ff ff       	call   103398 <dprintf>
  106ff4:	83 c4 10             	add    $0x10,%esp
    // return 1;
  }
  dprintf("test 1 passed.\n");
  106ff7:	8d 83 56 bc ff ff    	lea    -0x43aa(%ebx),%eax
  106ffd:	83 ec 0c             	sub    $0xc,%esp
  107000:	50                   	push   %eax
  107001:	e8 92 c3 ff ff       	call   103398 <dprintf>
  return 0;


  
  return 0;
}
  107006:	83 c4 18             	add    $0x18,%esp
  107009:	31 c0                	xor    %eax,%eax
  10700b:	5b                   	pop    %ebx
  10700c:	c3                   	ret    
  10700d:	8d 76 00             	lea    0x0(%esi),%esi
    dprintf("test 1 allocate ptbl failed.\n");
  107010:	8d 83 42 c1 ff ff    	lea    -0x3ebe(%ebx),%eax
  107016:	83 ec 0c             	sub    $0xc,%esp
  107019:	50                   	push   %eax
  10701a:	e8 79 c3 ff ff       	call   103398 <dprintf>
  10701f:	83 c4 10             	add    $0x10,%esp
  107022:	eb ab                	jmp    106fcf <MPTNew_test_own+0x7f>
  107024:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    dprintf("test 1 get pdir failed.\n");
  107028:	8d 83 29 c1 ff ff    	lea    -0x3ed7(%ebx),%eax
  10702e:	83 ec 0c             	sub    $0xc,%esp
  107031:	50                   	push   %eax
  107032:	e8 61 c3 ff ff       	call   103398 <dprintf>
  107037:	83 c4 10             	add    $0x10,%esp
  10703a:	e9 6a ff ff ff       	jmp    106fa9 <MPTNew_test_own+0x59>
  10703f:	90                   	nop
    dprintf("test 1 get ptbl failed.\n");
  107040:	8d 83 10 c1 ff ff    	lea    -0x3ef0(%ebx),%eax
  107046:	83 ec 0c             	sub    $0xc,%esp
  107049:	50                   	push   %eax
  10704a:	e8 49 c3 ff ff       	call   103398 <dprintf>
  10704f:	83 c4 10             	add    $0x10,%esp
  107052:	e9 38 ff ff ff       	jmp    106f8f <MPTNew_test_own+0x3f>
  107057:	89 f6                	mov    %esi,%esi
  107059:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00107060 <test_MPTNew>:

int test_MPTNew()
{
  107060:	53                   	push   %ebx
  107061:	83 ec 08             	sub    $0x8,%esp
  return MPTNew_test1() + MPTNew_test_own();
  107064:	e8 e7 fd ff ff       	call   106e50 <MPTNew_test1>
  107069:	89 c3                	mov    %eax,%ebx
  10706b:	e8 e0 fe ff ff       	call   106f50 <MPTNew_test_own>
}
  107070:	83 c4 08             	add    $0x8,%esp
  return MPTNew_test1() + MPTNew_test_own();
  107073:	01 d8                	add    %ebx,%eax
}
  107075:	5b                   	pop    %ebx
  107076:	c3                   	ret    
  107077:	66 90                	xchg   %ax,%ax
  107079:	66 90                	xchg   %ax,%ax
  10707b:	66 90                	xchg   %ax,%ax
  10707d:	66 90                	xchg   %ax,%ax
  10707f:	90                   	nop

00107080 <__udivdi3>:
  107080:	55                   	push   %ebp
  107081:	57                   	push   %edi
  107082:	56                   	push   %esi
  107083:	53                   	push   %ebx
  107084:	83 ec 1c             	sub    $0x1c,%esp
  107087:	8b 74 24 3c          	mov    0x3c(%esp),%esi
  10708b:	8b 5c 24 30          	mov    0x30(%esp),%ebx
  10708f:	8b 4c 24 34          	mov    0x34(%esp),%ecx
  107093:	8b 7c 24 38          	mov    0x38(%esp),%edi
  107097:	85 f6                	test   %esi,%esi
  107099:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  10709d:	89 ca                	mov    %ecx,%edx
  10709f:	89 f8                	mov    %edi,%eax
  1070a1:	75 3d                	jne    1070e0 <__udivdi3+0x60>
  1070a3:	39 cf                	cmp    %ecx,%edi
  1070a5:	0f 87 c5 00 00 00    	ja     107170 <__udivdi3+0xf0>
  1070ab:	85 ff                	test   %edi,%edi
  1070ad:	89 fd                	mov    %edi,%ebp
  1070af:	75 0b                	jne    1070bc <__udivdi3+0x3c>
  1070b1:	b8 01 00 00 00       	mov    $0x1,%eax
  1070b6:	31 d2                	xor    %edx,%edx
  1070b8:	f7 f7                	div    %edi
  1070ba:	89 c5                	mov    %eax,%ebp
  1070bc:	89 c8                	mov    %ecx,%eax
  1070be:	31 d2                	xor    %edx,%edx
  1070c0:	f7 f5                	div    %ebp
  1070c2:	89 c1                	mov    %eax,%ecx
  1070c4:	89 d8                	mov    %ebx,%eax
  1070c6:	89 cf                	mov    %ecx,%edi
  1070c8:	f7 f5                	div    %ebp
  1070ca:	89 c3                	mov    %eax,%ebx
  1070cc:	89 d8                	mov    %ebx,%eax
  1070ce:	89 fa                	mov    %edi,%edx
  1070d0:	83 c4 1c             	add    $0x1c,%esp
  1070d3:	5b                   	pop    %ebx
  1070d4:	5e                   	pop    %esi
  1070d5:	5f                   	pop    %edi
  1070d6:	5d                   	pop    %ebp
  1070d7:	c3                   	ret    
  1070d8:	90                   	nop
  1070d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1070e0:	39 ce                	cmp    %ecx,%esi
  1070e2:	77 74                	ja     107158 <__udivdi3+0xd8>
  1070e4:	0f bd fe             	bsr    %esi,%edi
  1070e7:	83 f7 1f             	xor    $0x1f,%edi
  1070ea:	0f 84 98 00 00 00    	je     107188 <__udivdi3+0x108>
  1070f0:	bb 20 00 00 00       	mov    $0x20,%ebx
  1070f5:	89 f9                	mov    %edi,%ecx
  1070f7:	89 c5                	mov    %eax,%ebp
  1070f9:	29 fb                	sub    %edi,%ebx
  1070fb:	d3 e6                	shl    %cl,%esi
  1070fd:	89 d9                	mov    %ebx,%ecx
  1070ff:	d3 ed                	shr    %cl,%ebp
  107101:	89 f9                	mov    %edi,%ecx
  107103:	d3 e0                	shl    %cl,%eax
  107105:	09 ee                	or     %ebp,%esi
  107107:	89 d9                	mov    %ebx,%ecx
  107109:	89 44 24 0c          	mov    %eax,0xc(%esp)
  10710d:	89 d5                	mov    %edx,%ebp
  10710f:	8b 44 24 08          	mov    0x8(%esp),%eax
  107113:	d3 ed                	shr    %cl,%ebp
  107115:	89 f9                	mov    %edi,%ecx
  107117:	d3 e2                	shl    %cl,%edx
  107119:	89 d9                	mov    %ebx,%ecx
  10711b:	d3 e8                	shr    %cl,%eax
  10711d:	09 c2                	or     %eax,%edx
  10711f:	89 d0                	mov    %edx,%eax
  107121:	89 ea                	mov    %ebp,%edx
  107123:	f7 f6                	div    %esi
  107125:	89 d5                	mov    %edx,%ebp
  107127:	89 c3                	mov    %eax,%ebx
  107129:	f7 64 24 0c          	mull   0xc(%esp)
  10712d:	39 d5                	cmp    %edx,%ebp
  10712f:	72 10                	jb     107141 <__udivdi3+0xc1>
  107131:	8b 74 24 08          	mov    0x8(%esp),%esi
  107135:	89 f9                	mov    %edi,%ecx
  107137:	d3 e6                	shl    %cl,%esi
  107139:	39 c6                	cmp    %eax,%esi
  10713b:	73 07                	jae    107144 <__udivdi3+0xc4>
  10713d:	39 d5                	cmp    %edx,%ebp
  10713f:	75 03                	jne    107144 <__udivdi3+0xc4>
  107141:	83 eb 01             	sub    $0x1,%ebx
  107144:	31 ff                	xor    %edi,%edi
  107146:	89 d8                	mov    %ebx,%eax
  107148:	89 fa                	mov    %edi,%edx
  10714a:	83 c4 1c             	add    $0x1c,%esp
  10714d:	5b                   	pop    %ebx
  10714e:	5e                   	pop    %esi
  10714f:	5f                   	pop    %edi
  107150:	5d                   	pop    %ebp
  107151:	c3                   	ret    
  107152:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  107158:	31 ff                	xor    %edi,%edi
  10715a:	31 db                	xor    %ebx,%ebx
  10715c:	89 d8                	mov    %ebx,%eax
  10715e:	89 fa                	mov    %edi,%edx
  107160:	83 c4 1c             	add    $0x1c,%esp
  107163:	5b                   	pop    %ebx
  107164:	5e                   	pop    %esi
  107165:	5f                   	pop    %edi
  107166:	5d                   	pop    %ebp
  107167:	c3                   	ret    
  107168:	90                   	nop
  107169:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  107170:	89 d8                	mov    %ebx,%eax
  107172:	f7 f7                	div    %edi
  107174:	31 ff                	xor    %edi,%edi
  107176:	89 c3                	mov    %eax,%ebx
  107178:	89 d8                	mov    %ebx,%eax
  10717a:	89 fa                	mov    %edi,%edx
  10717c:	83 c4 1c             	add    $0x1c,%esp
  10717f:	5b                   	pop    %ebx
  107180:	5e                   	pop    %esi
  107181:	5f                   	pop    %edi
  107182:	5d                   	pop    %ebp
  107183:	c3                   	ret    
  107184:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  107188:	39 ce                	cmp    %ecx,%esi
  10718a:	72 0c                	jb     107198 <__udivdi3+0x118>
  10718c:	31 db                	xor    %ebx,%ebx
  10718e:	3b 44 24 08          	cmp    0x8(%esp),%eax
  107192:	0f 87 34 ff ff ff    	ja     1070cc <__udivdi3+0x4c>
  107198:	bb 01 00 00 00       	mov    $0x1,%ebx
  10719d:	e9 2a ff ff ff       	jmp    1070cc <__udivdi3+0x4c>
  1071a2:	66 90                	xchg   %ax,%ax
  1071a4:	66 90                	xchg   %ax,%ax
  1071a6:	66 90                	xchg   %ax,%ax
  1071a8:	66 90                	xchg   %ax,%ax
  1071aa:	66 90                	xchg   %ax,%ax
  1071ac:	66 90                	xchg   %ax,%ax
  1071ae:	66 90                	xchg   %ax,%ax

001071b0 <__umoddi3>:
  1071b0:	55                   	push   %ebp
  1071b1:	57                   	push   %edi
  1071b2:	56                   	push   %esi
  1071b3:	53                   	push   %ebx
  1071b4:	83 ec 1c             	sub    $0x1c,%esp
  1071b7:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  1071bb:	8b 4c 24 30          	mov    0x30(%esp),%ecx
  1071bf:	8b 74 24 34          	mov    0x34(%esp),%esi
  1071c3:	8b 7c 24 38          	mov    0x38(%esp),%edi
  1071c7:	85 c0                	test   %eax,%eax
  1071c9:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1071cd:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  1071d1:	89 3c 24             	mov    %edi,(%esp)
  1071d4:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  1071d8:	89 f2                	mov    %esi,%edx
  1071da:	75 14                	jne    1071f0 <__umoddi3+0x40>
  1071dc:	39 f7                	cmp    %esi,%edi
  1071de:	76 40                	jbe    107220 <__umoddi3+0x70>
  1071e0:	89 c8                	mov    %ecx,%eax
  1071e2:	f7 f7                	div    %edi
  1071e4:	89 d0                	mov    %edx,%eax
  1071e6:	31 d2                	xor    %edx,%edx
  1071e8:	83 c4 1c             	add    $0x1c,%esp
  1071eb:	5b                   	pop    %ebx
  1071ec:	5e                   	pop    %esi
  1071ed:	5f                   	pop    %edi
  1071ee:	5d                   	pop    %ebp
  1071ef:	c3                   	ret    
  1071f0:	39 f0                	cmp    %esi,%eax
  1071f2:	89 f3                	mov    %esi,%ebx
  1071f4:	77 4a                	ja     107240 <__umoddi3+0x90>
  1071f6:	0f bd e8             	bsr    %eax,%ebp
  1071f9:	83 f5 1f             	xor    $0x1f,%ebp
  1071fc:	75 52                	jne    107250 <__umoddi3+0xa0>
  1071fe:	39 f0                	cmp    %esi,%eax
  107200:	0f 82 da 00 00 00    	jb     1072e0 <__umoddi3+0x130>
  107206:	39 0c 24             	cmp    %ecx,(%esp)
  107209:	0f 86 d1 00 00 00    	jbe    1072e0 <__umoddi3+0x130>
  10720f:	8b 44 24 04          	mov    0x4(%esp),%eax
  107213:	83 c4 1c             	add    $0x1c,%esp
  107216:	5b                   	pop    %ebx
  107217:	5e                   	pop    %esi
  107218:	5f                   	pop    %edi
  107219:	5d                   	pop    %ebp
  10721a:	c3                   	ret    
  10721b:	90                   	nop
  10721c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  107220:	85 ff                	test   %edi,%edi
  107222:	89 fd                	mov    %edi,%ebp
  107224:	75 0b                	jne    107231 <__umoddi3+0x81>
  107226:	b8 01 00 00 00       	mov    $0x1,%eax
  10722b:	31 d2                	xor    %edx,%edx
  10722d:	f7 f7                	div    %edi
  10722f:	89 c5                	mov    %eax,%ebp
  107231:	89 f0                	mov    %esi,%eax
  107233:	31 d2                	xor    %edx,%edx
  107235:	f7 f5                	div    %ebp
  107237:	89 c8                	mov    %ecx,%eax
  107239:	f7 f5                	div    %ebp
  10723b:	eb a7                	jmp    1071e4 <__umoddi3+0x34>
  10723d:	8d 76 00             	lea    0x0(%esi),%esi
  107240:	89 c8                	mov    %ecx,%eax
  107242:	89 f2                	mov    %esi,%edx
  107244:	83 c4 1c             	add    $0x1c,%esp
  107247:	5b                   	pop    %ebx
  107248:	5e                   	pop    %esi
  107249:	5f                   	pop    %edi
  10724a:	5d                   	pop    %ebp
  10724b:	c3                   	ret    
  10724c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  107250:	8b 34 24             	mov    (%esp),%esi
  107253:	bf 20 00 00 00       	mov    $0x20,%edi
  107258:	89 e9                	mov    %ebp,%ecx
  10725a:	29 ef                	sub    %ebp,%edi
  10725c:	d3 e0                	shl    %cl,%eax
  10725e:	89 f9                	mov    %edi,%ecx
  107260:	89 f2                	mov    %esi,%edx
  107262:	d3 ea                	shr    %cl,%edx
  107264:	89 e9                	mov    %ebp,%ecx
  107266:	09 c2                	or     %eax,%edx
  107268:	89 d8                	mov    %ebx,%eax
  10726a:	89 14 24             	mov    %edx,(%esp)
  10726d:	89 f2                	mov    %esi,%edx
  10726f:	d3 e2                	shl    %cl,%edx
  107271:	89 f9                	mov    %edi,%ecx
  107273:	89 54 24 04          	mov    %edx,0x4(%esp)
  107277:	8b 54 24 08          	mov    0x8(%esp),%edx
  10727b:	d3 e8                	shr    %cl,%eax
  10727d:	89 e9                	mov    %ebp,%ecx
  10727f:	89 c6                	mov    %eax,%esi
  107281:	d3 e3                	shl    %cl,%ebx
  107283:	89 f9                	mov    %edi,%ecx
  107285:	89 d0                	mov    %edx,%eax
  107287:	d3 e8                	shr    %cl,%eax
  107289:	89 e9                	mov    %ebp,%ecx
  10728b:	09 d8                	or     %ebx,%eax
  10728d:	89 d3                	mov    %edx,%ebx
  10728f:	89 f2                	mov    %esi,%edx
  107291:	f7 34 24             	divl   (%esp)
  107294:	89 d6                	mov    %edx,%esi
  107296:	d3 e3                	shl    %cl,%ebx
  107298:	f7 64 24 04          	mull   0x4(%esp)
  10729c:	39 d6                	cmp    %edx,%esi
  10729e:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  1072a2:	89 d1                	mov    %edx,%ecx
  1072a4:	89 c3                	mov    %eax,%ebx
  1072a6:	72 08                	jb     1072b0 <__umoddi3+0x100>
  1072a8:	75 11                	jne    1072bb <__umoddi3+0x10b>
  1072aa:	39 44 24 08          	cmp    %eax,0x8(%esp)
  1072ae:	73 0b                	jae    1072bb <__umoddi3+0x10b>
  1072b0:	2b 44 24 04          	sub    0x4(%esp),%eax
  1072b4:	1b 14 24             	sbb    (%esp),%edx
  1072b7:	89 d1                	mov    %edx,%ecx
  1072b9:	89 c3                	mov    %eax,%ebx
  1072bb:	8b 54 24 08          	mov    0x8(%esp),%edx
  1072bf:	29 da                	sub    %ebx,%edx
  1072c1:	19 ce                	sbb    %ecx,%esi
  1072c3:	89 f9                	mov    %edi,%ecx
  1072c5:	89 f0                	mov    %esi,%eax
  1072c7:	d3 e0                	shl    %cl,%eax
  1072c9:	89 e9                	mov    %ebp,%ecx
  1072cb:	d3 ea                	shr    %cl,%edx
  1072cd:	89 e9                	mov    %ebp,%ecx
  1072cf:	d3 ee                	shr    %cl,%esi
  1072d1:	09 d0                	or     %edx,%eax
  1072d3:	89 f2                	mov    %esi,%edx
  1072d5:	83 c4 1c             	add    $0x1c,%esp
  1072d8:	5b                   	pop    %ebx
  1072d9:	5e                   	pop    %esi
  1072da:	5f                   	pop    %edi
  1072db:	5d                   	pop    %ebp
  1072dc:	c3                   	ret    
  1072dd:	8d 76 00             	lea    0x0(%esi),%esi
  1072e0:	89 f2                	mov    %esi,%edx
  1072e2:	29 f9                	sub    %edi,%ecx
  1072e4:	1b 54 24 0c          	sbb    0xc(%esp),%edx
  1072e8:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  1072ec:	e9 1e ff ff ff       	jmp    10720f <__umoddi3+0x5f>
