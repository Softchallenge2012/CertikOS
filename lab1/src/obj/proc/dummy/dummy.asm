
obj/proc/dummy/dummy:     file format elf32-i386


Disassembly of section .text:

400000a0 <main>:
400000a0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
400000a4:	83 e4 f0             	and    $0xfffffff0,%esp
400000a7:	ff 71 fc             	pushl  -0x4(%ecx)
400000aa:	55                   	push   %ebp
400000ab:	89 e5                	mov    %esp,%ebp
400000ad:	57                   	push   %edi
400000ae:	56                   	push   %esi
400000af:	53                   	push   %ebx
400000b0:	51                   	push   %ecx
400000b1:	e8 d1 02 00 00       	call   40000387 <__x86.get_pc_thunk.bx>
400000b6:	81 c3 4a 3f 00 00    	add    $0x3f4a,%ebx
400000bc:	83 ec 24             	sub    $0x24,%esp
400000bf:	8d 83 ec d6 ff ff    	lea    -0x2914(%ebx),%eax
400000c5:	50                   	push   %eax
400000c6:	e8 c5 04 00 00       	call   40000590 <printf>
400000cb:	8d 83 20 d7 ff ff    	lea    -0x28e0(%ebx),%eax
400000d1:	89 04 24             	mov    %eax,(%esp)
400000d4:	e8 b7 04 00 00       	call   40000590 <printf>
400000d9:	8d 83 c8 d8 ff ff    	lea    -0x2738(%ebx),%eax
400000df:	89 04 24             	mov    %eax,(%esp)
400000e2:	89 45 d8             	mov    %eax,-0x28(%ebp)
400000e5:	e8 a6 04 00 00       	call   40000590 <printf>
400000ea:	8d 83 f5 d8 ff ff    	lea    -0x270b(%ebx),%eax
400000f0:	83 c4 10             	add    $0x10,%esp
400000f3:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
400000fa:	89 45 e0             	mov    %eax,-0x20(%ebp)
400000fd:	8d 76 00             	lea    0x0(%esi),%esi
40000100:	e8 5b 11 00 00       	call   40001260 <sys_getc>
40000105:	85 c0                	test   %eax,%eax
40000107:	74 f7                	je     40000100 <main+0x60>
40000109:	83 f8 1a             	cmp    $0x1a,%eax
4000010c:	74 4f                	je     4000015d <main+0xbd>
4000010e:	83 f8 0a             	cmp    $0xa,%eax
40000111:	74 6d                	je     40000180 <main+0xe0>
40000113:	83 f8 0d             	cmp    $0xd,%eax
40000116:	74 68                	je     40000180 <main+0xe0>
40000118:	8d 50 d0             	lea    -0x30(%eax),%edx
4000011b:	83 fa 09             	cmp    $0x9,%edx
4000011e:	77 e0                	ja     40000100 <main+0x60>
40000120:	81 7d dc 98 99 99 19 	cmpl   $0x19999998,-0x24(%ebp)
40000127:	0f 86 e3 00 00 00    	jbe    40000210 <main+0x170>
4000012d:	8d 83 07 d9 ff ff    	lea    -0x26f9(%ebx),%eax
40000133:	83 ec 0c             	sub    $0xc,%esp
40000136:	50                   	push   %eax
40000137:	e8 54 04 00 00       	call   40000590 <printf>
4000013c:	58                   	pop    %eax
4000013d:	ff 75 d8             	pushl  -0x28(%ebp)
40000140:	e8 4b 04 00 00       	call   40000590 <printf>
40000145:	83 c4 10             	add    $0x10,%esp
40000148:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
4000014f:	e8 0c 11 00 00       	call   40001260 <sys_getc>
40000154:	85 c0                	test   %eax,%eax
40000156:	74 a8                	je     40000100 <main+0x60>
40000158:	83 f8 1a             	cmp    $0x1a,%eax
4000015b:	75 b1                	jne    4000010e <main+0x6e>
4000015d:	8d 83 58 d7 ff ff    	lea    -0x28a8(%ebx),%eax
40000163:	83 ec 0c             	sub    $0xc,%esp
40000166:	50                   	push   %eax
40000167:	e8 24 04 00 00       	call   40000590 <printf>
4000016c:	83 c4 10             	add    $0x10,%esp
4000016f:	8d 65 f0             	lea    -0x10(%ebp),%esp
40000172:	31 c0                	xor    %eax,%eax
40000174:	59                   	pop    %ecx
40000175:	5b                   	pop    %ebx
40000176:	5e                   	pop    %esi
40000177:	5f                   	pop    %edi
40000178:	5d                   	pop    %ebp
40000179:	8d 61 fc             	lea    -0x4(%ecx),%esp
4000017c:	c3                   	ret    
4000017d:	8d 76 00             	lea    0x0(%esi),%esi
40000180:	8d 83 1d d9 ff ff    	lea    -0x26e3(%ebx),%eax
40000186:	83 ec 0c             	sub    $0xc,%esp
40000189:	8d bb 7c d7 ff ff    	lea    -0x2884(%ebx),%edi
4000018f:	8d b3 f1 d8 ff ff    	lea    -0x270f(%ebx),%esi
40000195:	50                   	push   %eax
40000196:	e8 f5 03 00 00       	call   40000590 <printf>
4000019b:	5a                   	pop    %edx
4000019c:	8d 83 dc d8 ff ff    	lea    -0x2724(%ebx),%eax
400001a2:	59                   	pop    %ecx
400001a3:	ff 75 dc             	pushl  -0x24(%ebp)
400001a6:	50                   	push   %eax
400001a7:	e8 e4 03 00 00       	call   40000590 <printf>
400001ac:	89 3c 24             	mov    %edi,(%esp)
400001af:	e8 dc 03 00 00       	call   40000590 <printf>
400001b4:	83 c4 10             	add    $0x10,%esp
400001b7:	89 f6                	mov    %esi,%esi
400001b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
400001c0:	e8 9b 10 00 00       	call   40001260 <sys_getc>
400001c5:	84 c0                	test   %al,%al
400001c7:	89 c2                	mov    %eax,%edx
400001c9:	74 f5                	je     400001c0 <main+0x120>
400001cb:	83 ec 08             	sub    $0x8,%esp
400001ce:	0f be c0             	movsbl %al,%eax
400001d1:	88 55 e7             	mov    %dl,-0x19(%ebp)
400001d4:	50                   	push   %eax
400001d5:	56                   	push   %esi
400001d6:	e8 b5 03 00 00       	call   40000590 <printf>
400001db:	0f b6 55 e7          	movzbl -0x19(%ebp),%edx
400001df:	83 c4 10             	add    $0x10,%esp
400001e2:	80 fa 72             	cmp    $0x72,%dl
400001e5:	74 51                	je     40000238 <main+0x198>
400001e7:	80 fa 77             	cmp    $0x77,%dl
400001ea:	74 74                	je     40000260 <main+0x1c0>
400001ec:	83 ec 0c             	sub    $0xc,%esp
400001ef:	ff 75 e0             	pushl  -0x20(%ebp)
400001f2:	e8 99 03 00 00       	call   40000590 <printf>
400001f7:	89 3c 24             	mov    %edi,(%esp)
400001fa:	e8 91 03 00 00       	call   40000590 <printf>
400001ff:	83 c4 10             	add    $0x10,%esp
40000202:	e8 59 10 00 00       	call   40001260 <sys_getc>
40000207:	84 c0                	test   %al,%al
40000209:	89 c2                	mov    %eax,%edx
4000020b:	74 b3                	je     400001c0 <main+0x120>
4000020d:	eb bc                	jmp    400001cb <main+0x12b>
4000020f:	90                   	nop
40000210:	8b 4d dc             	mov    -0x24(%ebp),%ecx
40000213:	83 ec 08             	sub    $0x8,%esp
40000216:	50                   	push   %eax
40000217:	8d 14 89             	lea    (%ecx,%ecx,4),%edx
4000021a:	8d 4c 50 d0          	lea    -0x30(%eax,%edx,2),%ecx
4000021e:	8d 83 1f d9 ff ff    	lea    -0x26e1(%ebx),%eax
40000224:	50                   	push   %eax
40000225:	89 4d dc             	mov    %ecx,-0x24(%ebp)
40000228:	e8 63 03 00 00       	call   40000590 <printf>
4000022d:	83 c4 10             	add    $0x10,%esp
40000230:	e9 cb fe ff ff       	jmp    40000100 <main+0x60>
40000235:	8d 76 00             	lea    0x0(%esi),%esi
40000238:	8b 45 dc             	mov    -0x24(%ebp),%eax
4000023b:	83 ec 04             	sub    $0x4,%esp
4000023e:	ff 30                	pushl  (%eax)
40000240:	50                   	push   %eax
40000241:	8d 83 ac d7 ff ff    	lea    -0x2854(%ebx),%eax
40000247:	50                   	push   %eax
40000248:	e8 43 03 00 00       	call   40000590 <printf>
4000024d:	83 c4 10             	add    $0x10,%esp
40000250:	83 ec 0c             	sub    $0xc,%esp
40000253:	8d 83 90 d8 ff ff    	lea    -0x2770(%ebx),%eax
40000259:	e9 d8 fe ff ff       	jmp    40000136 <main+0x96>
4000025e:	66 90                	xchg   %ax,%ax
40000260:	8d 83 d4 d7 ff ff    	lea    -0x282c(%ebx),%eax
40000266:	83 ec 0c             	sub    $0xc,%esp
40000269:	50                   	push   %eax
4000026a:	e8 21 03 00 00       	call   40000590 <printf>
4000026f:	8d 83 08 d8 ff ff    	lea    -0x27f8(%ebx),%eax
40000275:	89 04 24             	mov    %eax,(%esp)
40000278:	e8 13 03 00 00       	call   40000590 <printf>
4000027d:	83 c4 10             	add    $0x10,%esp
40000280:	e8 db 0f 00 00       	call   40001260 <sys_getc>
40000285:	8d 78 d0             	lea    -0x30(%eax),%edi
40000288:	83 ff 09             	cmp    $0x9,%edi
4000028b:	77 f3                	ja     40000280 <main+0x1e0>
4000028d:	83 ec 08             	sub    $0x8,%esp
40000290:	50                   	push   %eax
40000291:	56                   	push   %esi
40000292:	e8 f9 02 00 00       	call   40000590 <printf>
40000297:	8b 45 dc             	mov    -0x24(%ebp),%eax
4000029a:	89 38                	mov    %edi,(%eax)
4000029c:	8d 83 28 d8 ff ff    	lea    -0x27d8(%ebx),%eax
400002a2:	89 04 24             	mov    %eax,(%esp)
400002a5:	e8 e6 02 00 00       	call   40000590 <printf>
400002aa:	83 c4 10             	add    $0x10,%esp
400002ad:	eb a1                	jmp    40000250 <main+0x1b0>

400002af <_start>:
400002af:	60                   	pusha  
400002b0:	e8 6b 0f 00 00       	call   40001220 <init>
400002b5:	e8 e6 fd ff ff       	call   400000a0 <main>
400002ba:	61                   	popa   
400002bb:	c3                   	ret    
400002bc:	66 90                	xchg   %ax,%ax
400002be:	66 90                	xchg   %ax,%ax

400002c0 <debug>:
400002c0:	53                   	push   %ebx
400002c1:	e8 c1 00 00 00       	call   40000387 <__x86.get_pc_thunk.bx>
400002c6:	81 c3 3a 3d 00 00    	add    $0x3d3a,%ebx
400002cc:	83 ec 0c             	sub    $0xc,%esp
400002cf:	8d 83 54 d5 ff ff    	lea    -0x2aac(%ebx),%eax
400002d5:	ff 74 24 18          	pushl  0x18(%esp)
400002d9:	ff 74 24 18          	pushl  0x18(%esp)
400002dd:	50                   	push   %eax
400002de:	e8 ad 02 00 00       	call   40000590 <printf>
400002e3:	58                   	pop    %eax
400002e4:	5a                   	pop    %edx
400002e5:	8d 44 24 24          	lea    0x24(%esp),%eax
400002e9:	50                   	push   %eax
400002ea:	ff 74 24 24          	pushl  0x24(%esp)
400002ee:	e8 2d 02 00 00       	call   40000520 <vcprintf>
400002f3:	83 c4 18             	add    $0x18,%esp
400002f6:	5b                   	pop    %ebx
400002f7:	c3                   	ret    
400002f8:	90                   	nop
400002f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

40000300 <warn>:
40000300:	53                   	push   %ebx
40000301:	e8 81 00 00 00       	call   40000387 <__x86.get_pc_thunk.bx>
40000306:	81 c3 fa 3c 00 00    	add    $0x3cfa,%ebx
4000030c:	83 ec 0c             	sub    $0xc,%esp
4000030f:	8d 83 60 d5 ff ff    	lea    -0x2aa0(%ebx),%eax
40000315:	ff 74 24 18          	pushl  0x18(%esp)
40000319:	ff 74 24 18          	pushl  0x18(%esp)
4000031d:	50                   	push   %eax
4000031e:	e8 6d 02 00 00       	call   40000590 <printf>
40000323:	58                   	pop    %eax
40000324:	5a                   	pop    %edx
40000325:	8d 44 24 24          	lea    0x24(%esp),%eax
40000329:	50                   	push   %eax
4000032a:	ff 74 24 24          	pushl  0x24(%esp)
4000032e:	e8 ed 01 00 00       	call   40000520 <vcprintf>
40000333:	83 c4 18             	add    $0x18,%esp
40000336:	5b                   	pop    %ebx
40000337:	c3                   	ret    
40000338:	90                   	nop
40000339:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

40000340 <panic>:
40000340:	53                   	push   %ebx
40000341:	e8 41 00 00 00       	call   40000387 <__x86.get_pc_thunk.bx>
40000346:	81 c3 ba 3c 00 00    	add    $0x3cba,%ebx
4000034c:	83 ec 0c             	sub    $0xc,%esp
4000034f:	8d 83 6c d5 ff ff    	lea    -0x2a94(%ebx),%eax
40000355:	ff 74 24 18          	pushl  0x18(%esp)
40000359:	ff 74 24 18          	pushl  0x18(%esp)
4000035d:	50                   	push   %eax
4000035e:	e8 2d 02 00 00       	call   40000590 <printf>
40000363:	58                   	pop    %eax
40000364:	5a                   	pop    %edx
40000365:	8d 44 24 24          	lea    0x24(%esp),%eax
40000369:	50                   	push   %eax
4000036a:	ff 74 24 24          	pushl  0x24(%esp)
4000036e:	e8 ad 01 00 00       	call   40000520 <vcprintf>
40000373:	83 c4 10             	add    $0x10,%esp
40000376:	8d 76 00             	lea    0x0(%esi),%esi
40000379:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
40000380:	e8 cb 0e 00 00       	call   40001250 <yield>
40000385:	eb f9                	jmp    40000380 <panic+0x40>

40000387 <__x86.get_pc_thunk.bx>:
40000387:	8b 1c 24             	mov    (%esp),%ebx
4000038a:	c3                   	ret    
4000038b:	66 90                	xchg   %ax,%ax
4000038d:	66 90                	xchg   %ax,%ax
4000038f:	90                   	nop

40000390 <atoi>:
40000390:	55                   	push   %ebp
40000391:	57                   	push   %edi
40000392:	56                   	push   %esi
40000393:	53                   	push   %ebx
40000394:	8b 74 24 14          	mov    0x14(%esp),%esi
40000398:	0f b6 06             	movzbl (%esi),%eax
4000039b:	3c 2b                	cmp    $0x2b,%al
4000039d:	74 51                	je     400003f0 <atoi+0x60>
4000039f:	3c 2d                	cmp    $0x2d,%al
400003a1:	0f 94 c0             	sete   %al
400003a4:	0f b6 c0             	movzbl %al,%eax
400003a7:	89 c5                	mov    %eax,%ebp
400003a9:	89 c7                	mov    %eax,%edi
400003ab:	0f be 14 06          	movsbl (%esi,%eax,1),%edx
400003af:	8d 42 d0             	lea    -0x30(%edx),%eax
400003b2:	3c 09                	cmp    $0x9,%al
400003b4:	77 4a                	ja     40000400 <atoi+0x70>
400003b6:	89 f8                	mov    %edi,%eax
400003b8:	31 c9                	xor    %ecx,%ecx
400003ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
400003c0:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
400003c3:	83 c0 01             	add    $0x1,%eax
400003c6:	8d 4c 4a d0          	lea    -0x30(%edx,%ecx,2),%ecx
400003ca:	0f be 14 06          	movsbl (%esi,%eax,1),%edx
400003ce:	8d 5a d0             	lea    -0x30(%edx),%ebx
400003d1:	80 fb 09             	cmp    $0x9,%bl
400003d4:	76 ea                	jbe    400003c0 <atoi+0x30>
400003d6:	39 c7                	cmp    %eax,%edi
400003d8:	74 26                	je     40000400 <atoi+0x70>
400003da:	89 ca                	mov    %ecx,%edx
400003dc:	f7 da                	neg    %edx
400003de:	85 ed                	test   %ebp,%ebp
400003e0:	0f 45 ca             	cmovne %edx,%ecx
400003e3:	8b 54 24 18          	mov    0x18(%esp),%edx
400003e7:	89 0a                	mov    %ecx,(%edx)
400003e9:	5b                   	pop    %ebx
400003ea:	5e                   	pop    %esi
400003eb:	5f                   	pop    %edi
400003ec:	5d                   	pop    %ebp
400003ed:	c3                   	ret    
400003ee:	66 90                	xchg   %ax,%ax
400003f0:	b8 01 00 00 00       	mov    $0x1,%eax
400003f5:	31 ed                	xor    %ebp,%ebp
400003f7:	bf 01 00 00 00       	mov    $0x1,%edi
400003fc:	eb ad                	jmp    400003ab <atoi+0x1b>
400003fe:	66 90                	xchg   %ax,%ax
40000400:	5b                   	pop    %ebx
40000401:	31 c0                	xor    %eax,%eax
40000403:	5e                   	pop    %esi
40000404:	5f                   	pop    %edi
40000405:	5d                   	pop    %ebp
40000406:	c3                   	ret    
40000407:	66 90                	xchg   %ax,%ax
40000409:	66 90                	xchg   %ax,%ax
4000040b:	66 90                	xchg   %ax,%ax
4000040d:	66 90                	xchg   %ax,%ax
4000040f:	90                   	nop

40000410 <putch>:
40000410:	56                   	push   %esi
40000411:	53                   	push   %ebx
40000412:	e8 70 ff ff ff       	call   40000387 <__x86.get_pc_thunk.bx>
40000417:	81 c3 e9 3b 00 00    	add    $0x3be9,%ebx
4000041d:	83 ec 04             	sub    $0x4,%esp
40000420:	8b 74 24 14          	mov    0x14(%esp),%esi
40000424:	8b 4c 24 10          	mov    0x10(%esp),%ecx
40000428:	8b 16                	mov    (%esi),%edx
4000042a:	8d 42 01             	lea    0x1(%edx),%eax
4000042d:	3d ff 0f 00 00       	cmp    $0xfff,%eax
40000432:	89 06                	mov    %eax,(%esi)
40000434:	88 4c 16 08          	mov    %cl,0x8(%esi,%edx,1)
40000438:	74 0e                	je     40000448 <putch+0x38>
4000043a:	83 46 04 01          	addl   $0x1,0x4(%esi)
4000043e:	83 c4 04             	add    $0x4,%esp
40000441:	5b                   	pop    %ebx
40000442:	5e                   	pop    %esi
40000443:	c3                   	ret    
40000444:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
40000448:	8d 46 08             	lea    0x8(%esi),%eax
4000044b:	83 ec 08             	sub    $0x8,%esp
4000044e:	c6 86 07 10 00 00 00 	movb   $0x0,0x1007(%esi)
40000455:	68 ff 0f 00 00       	push   $0xfff
4000045a:	50                   	push   %eax
4000045b:	e8 20 0e 00 00       	call   40001280 <sys_puts>
40000460:	83 c4 10             	add    $0x10,%esp
40000463:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
40000469:	83 46 04 01          	addl   $0x1,0x4(%esi)
4000046d:	83 c4 04             	add    $0x4,%esp
40000470:	5b                   	pop    %ebx
40000471:	5e                   	pop    %esi
40000472:	c3                   	ret    
40000473:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40000479:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

40000480 <gets>:
40000480:	55                   	push   %ebp
40000481:	57                   	push   %edi
40000482:	56                   	push   %esi
40000483:	53                   	push   %ebx
40000484:	31 f6                	xor    %esi,%esi
40000486:	e8 fc fe ff ff       	call   40000387 <__x86.get_pc_thunk.bx>
4000048b:	81 c3 75 3b 00 00    	add    $0x3b75,%ebx
40000491:	83 ec 2c             	sub    $0x2c,%esp
40000494:	8b 44 24 44          	mov    0x44(%esp),%eax
40000498:	c6 44 24 1f 00       	movb   $0x0,0x1f(%esp)
4000049d:	8d 6c 24 1e          	lea    0x1e(%esp),%ebp
400004a1:	83 e8 01             	sub    $0x1,%eax
400004a4:	83 7c 24 44 01       	cmpl   $0x1,0x44(%esp)
400004a9:	89 44 24 0c          	mov    %eax,0xc(%esp)
400004ad:	7e 41                	jle    400004f0 <gets+0x70>
400004af:	90                   	nop
400004b0:	e8 ab 0d 00 00       	call   40001260 <sys_getc>
400004b5:	84 c0                	test   %al,%al
400004b7:	89 c7                	mov    %eax,%edi
400004b9:	74 f5                	je     400004b0 <gets+0x30>
400004bb:	88 44 24 1e          	mov    %al,0x1e(%esp)
400004bf:	89 44 24 08          	mov    %eax,0x8(%esp)
400004c3:	83 ec 08             	sub    $0x8,%esp
400004c6:	6a 02                	push   $0x2
400004c8:	55                   	push   %ebp
400004c9:	e8 b2 0d 00 00       	call   40001280 <sys_puts>
400004ce:	89 f8                	mov    %edi,%eax
400004d0:	83 c4 10             	add    $0x10,%esp
400004d3:	3c 0a                	cmp    $0xa,%al
400004d5:	74 2e                	je     40000505 <gets+0x85>
400004d7:	3c 0d                	cmp    $0xd,%al
400004d9:	8b 44 24 08          	mov    0x8(%esp),%eax
400004dd:	74 26                	je     40000505 <gets+0x85>
400004df:	83 c6 01             	add    $0x1,%esi
400004e2:	3b 74 24 0c          	cmp    0xc(%esp),%esi
400004e6:	8b 54 24 40          	mov    0x40(%esp),%edx
400004ea:	88 44 32 ff          	mov    %al,-0x1(%edx,%esi,1)
400004ee:	75 c0                	jne    400004b0 <gets+0x30>
400004f0:	8b 44 24 40          	mov    0x40(%esp),%eax
400004f4:	8b 4c 24 44          	mov    0x44(%esp),%ecx
400004f8:	c6 44 08 ff 00       	movb   $0x0,-0x1(%eax,%ecx,1)
400004fd:	83 c4 2c             	add    $0x2c,%esp
40000500:	5b                   	pop    %ebx
40000501:	5e                   	pop    %esi
40000502:	5f                   	pop    %edi
40000503:	5d                   	pop    %ebp
40000504:	c3                   	ret    
40000505:	8b 44 24 40          	mov    0x40(%esp),%eax
40000509:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
4000050d:	83 c4 2c             	add    $0x2c,%esp
40000510:	5b                   	pop    %ebx
40000511:	5e                   	pop    %esi
40000512:	5f                   	pop    %edi
40000513:	5d                   	pop    %ebp
40000514:	c3                   	ret    
40000515:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
40000519:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

40000520 <vcprintf>:
40000520:	53                   	push   %ebx
40000521:	e8 61 fe ff ff       	call   40000387 <__x86.get_pc_thunk.bx>
40000526:	81 c3 da 3a 00 00    	add    $0x3ada,%ebx
4000052c:	81 ec 18 10 00 00    	sub    $0x1018,%esp
40000532:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
40000539:	00 
4000053a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000541:	00 
40000542:	ff b4 24 24 10 00 00 	pushl  0x1024(%esp)
40000549:	ff b4 24 24 10 00 00 	pushl  0x1024(%esp)
40000550:	8d 44 24 10          	lea    0x10(%esp),%eax
40000554:	50                   	push   %eax
40000555:	8d 83 10 c4 ff ff    	lea    -0x3bf0(%ebx),%eax
4000055b:	50                   	push   %eax
4000055c:	e8 8f 01 00 00       	call   400006f0 <vprintfmt>
40000561:	8b 44 24 18          	mov    0x18(%esp),%eax
40000565:	c6 44 04 20 00       	movb   $0x0,0x20(%esp,%eax,1)
4000056a:	5a                   	pop    %edx
4000056b:	59                   	pop    %ecx
4000056c:	50                   	push   %eax
4000056d:	8d 44 24 1c          	lea    0x1c(%esp),%eax
40000571:	50                   	push   %eax
40000572:	e8 09 0d 00 00       	call   40001280 <sys_puts>
40000577:	8b 44 24 1c          	mov    0x1c(%esp),%eax
4000057b:	81 c4 28 10 00 00    	add    $0x1028,%esp
40000581:	5b                   	pop    %ebx
40000582:	c3                   	ret    
40000583:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40000589:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

40000590 <printf>:
40000590:	83 ec 14             	sub    $0x14,%esp
40000593:	8d 44 24 1c          	lea    0x1c(%esp),%eax
40000597:	50                   	push   %eax
40000598:	ff 74 24 1c          	pushl  0x1c(%esp)
4000059c:	e8 7f ff ff ff       	call   40000520 <vcprintf>
400005a1:	83 c4 1c             	add    $0x1c,%esp
400005a4:	c3                   	ret    
400005a5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
400005a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

400005b0 <printf2>:
400005b0:	83 ec 14             	sub    $0x14,%esp
400005b3:	8d 44 24 1c          	lea    0x1c(%esp),%eax
400005b7:	50                   	push   %eax
400005b8:	ff 74 24 1c          	pushl  0x1c(%esp)
400005bc:	e8 5f ff ff ff       	call   40000520 <vcprintf>
400005c1:	83 c4 1c             	add    $0x1c,%esp
400005c4:	c3                   	ret    
400005c5:	66 90                	xchg   %ax,%ax
400005c7:	66 90                	xchg   %ax,%ax
400005c9:	66 90                	xchg   %ax,%ax
400005cb:	66 90                	xchg   %ax,%ax
400005cd:	66 90                	xchg   %ax,%ax
400005cf:	90                   	nop

400005d0 <printnum>:
400005d0:	55                   	push   %ebp
400005d1:	57                   	push   %edi
400005d2:	89 d7                	mov    %edx,%edi
400005d4:	56                   	push   %esi
400005d5:	53                   	push   %ebx
400005d6:	89 c6                	mov    %eax,%esi
400005d8:	e8 3e 07 00 00       	call   40000d1b <__x86.get_pc_thunk.cx>
400005dd:	81 c1 23 3a 00 00    	add    $0x3a23,%ecx
400005e3:	83 ec 2c             	sub    $0x2c,%esp
400005e6:	8b 54 24 44          	mov    0x44(%esp),%edx
400005ea:	8b 44 24 40          	mov    0x40(%esp),%eax
400005ee:	89 4c 24 18          	mov    %ecx,0x18(%esp)
400005f2:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
400005f9:	00 
400005fa:	8b 6c 24 50          	mov    0x50(%esp),%ebp
400005fe:	8b 5c 24 4c          	mov    0x4c(%esp),%ebx
40000602:	89 d1                	mov    %edx,%ecx
40000604:	39 4c 24 0c          	cmp    %ecx,0xc(%esp)
40000608:	89 c2                	mov    %eax,%edx
4000060a:	89 44 24 10          	mov    %eax,0x10(%esp)
4000060e:	8b 44 24 48          	mov    0x48(%esp),%eax
40000612:	89 4c 24 14          	mov    %ecx,0x14(%esp)
40000616:	89 6c 24 1c          	mov    %ebp,0x1c(%esp)
4000061a:	89 44 24 08          	mov    %eax,0x8(%esp)
4000061e:	73 70                	jae    40000690 <printnum+0xc0>
40000620:	83 ec 0c             	sub    $0xc,%esp
40000623:	83 eb 01             	sub    $0x1,%ebx
40000626:	ff 74 24 28          	pushl  0x28(%esp)
4000062a:	53                   	push   %ebx
4000062b:	50                   	push   %eax
4000062c:	83 ec 08             	sub    $0x8,%esp
4000062f:	ff 74 24 2c          	pushl  0x2c(%esp)
40000633:	ff 74 24 2c          	pushl  0x2c(%esp)
40000637:	ff 74 24 3c          	pushl  0x3c(%esp)
4000063b:	ff 74 24 3c          	pushl  0x3c(%esp)
4000063f:	8b 5c 24 48          	mov    0x48(%esp),%ebx
40000643:	e8 98 0c 00 00       	call   400012e0 <__udivdi3>
40000648:	83 c4 18             	add    $0x18,%esp
4000064b:	52                   	push   %edx
4000064c:	50                   	push   %eax
4000064d:	89 fa                	mov    %edi,%edx
4000064f:	89 f0                	mov    %esi,%eax
40000651:	e8 7a ff ff ff       	call   400005d0 <printnum>
40000656:	83 c4 20             	add    $0x20,%esp
40000659:	89 7c 24 44          	mov    %edi,0x44(%esp)
4000065d:	ff 74 24 0c          	pushl  0xc(%esp)
40000661:	ff 74 24 0c          	pushl  0xc(%esp)
40000665:	ff 74 24 1c          	pushl  0x1c(%esp)
40000669:	ff 74 24 1c          	pushl  0x1c(%esp)
4000066d:	8b 7c 24 28          	mov    0x28(%esp),%edi
40000671:	89 fb                	mov    %edi,%ebx
40000673:	e8 98 0d 00 00       	call   40001410 <__umoddi3>
40000678:	0f be 84 07 78 d5 ff 	movsbl -0x2a88(%edi,%eax,1),%eax
4000067f:	ff 
40000680:	89 44 24 50          	mov    %eax,0x50(%esp)
40000684:	83 c4 3c             	add    $0x3c,%esp
40000687:	89 f0                	mov    %esi,%eax
40000689:	5b                   	pop    %ebx
4000068a:	5e                   	pop    %esi
4000068b:	5f                   	pop    %edi
4000068c:	5d                   	pop    %ebp
4000068d:	ff e0                	jmp    *%eax
4000068f:	90                   	nop
40000690:	76 26                	jbe    400006b8 <printnum+0xe8>
40000692:	83 eb 01             	sub    $0x1,%ebx
40000695:	8b 6c 24 1c          	mov    0x1c(%esp),%ebp
40000699:	85 db                	test   %ebx,%ebx
4000069b:	7e bc                	jle    40000659 <printnum+0x89>
4000069d:	8d 76 00             	lea    0x0(%esi),%esi
400006a0:	83 ec 08             	sub    $0x8,%esp
400006a3:	57                   	push   %edi
400006a4:	55                   	push   %ebp
400006a5:	ff d6                	call   *%esi
400006a7:	83 c4 10             	add    $0x10,%esp
400006aa:	83 eb 01             	sub    $0x1,%ebx
400006ad:	75 f1                	jne    400006a0 <printnum+0xd0>
400006af:	eb a8                	jmp    40000659 <printnum+0x89>
400006b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
400006b8:	39 d0                	cmp    %edx,%eax
400006ba:	0f 86 60 ff ff ff    	jbe    40000620 <printnum+0x50>
400006c0:	eb d0                	jmp    40000692 <printnum+0xc2>
400006c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
400006c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

400006d0 <sprintputch>:
400006d0:	8b 44 24 08          	mov    0x8(%esp),%eax
400006d4:	83 40 08 01          	addl   $0x1,0x8(%eax)
400006d8:	8b 10                	mov    (%eax),%edx
400006da:	3b 50 04             	cmp    0x4(%eax),%edx
400006dd:	73 0b                	jae    400006ea <sprintputch+0x1a>
400006df:	8d 4a 01             	lea    0x1(%edx),%ecx
400006e2:	89 08                	mov    %ecx,(%eax)
400006e4:	8b 44 24 04          	mov    0x4(%esp),%eax
400006e8:	88 02                	mov    %al,(%edx)
400006ea:	f3 c3                	repz ret 
400006ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

400006f0 <vprintfmt>:
400006f0:	55                   	push   %ebp
400006f1:	57                   	push   %edi
400006f2:	56                   	push   %esi
400006f3:	53                   	push   %ebx
400006f4:	e8 1a 06 00 00       	call   40000d13 <__x86.get_pc_thunk.ax>
400006f9:	05 07 39 00 00       	add    $0x3907,%eax
400006fe:	83 ec 2c             	sub    $0x2c,%esp
40000701:	89 04 24             	mov    %eax,(%esp)
40000704:	8b 7c 24 40          	mov    0x40(%esp),%edi
40000708:	8d 80 89 d5 ff ff    	lea    -0x2a77(%eax),%eax
4000070e:	8b 6c 24 44          	mov    0x44(%esp),%ebp
40000712:	89 44 24 1c          	mov    %eax,0x1c(%esp)
40000716:	8b 44 24 48          	mov    0x48(%esp),%eax
4000071a:	8d 58 01             	lea    0x1(%eax),%ebx
4000071d:	0f b6 00             	movzbl (%eax),%eax
40000720:	83 f8 25             	cmp    $0x25,%eax
40000723:	75 21                	jne    40000746 <vprintfmt+0x56>
40000725:	eb 31                	jmp    40000758 <vprintfmt+0x68>
40000727:	89 f6                	mov    %esi,%esi
40000729:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
40000730:	83 ec 08             	sub    $0x8,%esp
40000733:	83 c3 01             	add    $0x1,%ebx
40000736:	55                   	push   %ebp
40000737:	50                   	push   %eax
40000738:	ff d7                	call   *%edi
4000073a:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
4000073e:	83 c4 10             	add    $0x10,%esp
40000741:	83 f8 25             	cmp    $0x25,%eax
40000744:	74 12                	je     40000758 <vprintfmt+0x68>
40000746:	85 c0                	test   %eax,%eax
40000748:	75 e6                	jne    40000730 <vprintfmt+0x40>
4000074a:	83 c4 2c             	add    $0x2c,%esp
4000074d:	5b                   	pop    %ebx
4000074e:	5e                   	pop    %esi
4000074f:	5f                   	pop    %edi
40000750:	5d                   	pop    %ebp
40000751:	c3                   	ret    
40000752:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40000758:	be ff ff ff ff       	mov    $0xffffffff,%esi
4000075d:	31 d2                	xor    %edx,%edx
4000075f:	c6 44 24 10 20       	movb   $0x20,0x10(%esp)
40000764:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
4000076b:	00 
4000076c:	c7 44 24 04 ff ff ff 	movl   $0xffffffff,0x4(%esp)
40000773:	ff 
40000774:	89 54 24 14          	mov    %edx,0x14(%esp)
40000778:	89 74 24 18          	mov    %esi,0x18(%esp)
4000077c:	0f b6 0b             	movzbl (%ebx),%ecx
4000077f:	8d 43 01             	lea    0x1(%ebx),%eax
40000782:	89 44 24 48          	mov    %eax,0x48(%esp)
40000786:	8d 41 dd             	lea    -0x23(%ecx),%eax
40000789:	3c 55                	cmp    $0x55,%al
4000078b:	0f 87 a1 02 00 00    	ja     40000a32 <.L27>
40000791:	8b 14 24             	mov    (%esp),%edx
40000794:	0f b6 c0             	movzbl %al,%eax
40000797:	03 94 82 90 d5 ff ff 	add    -0x2a70(%edx,%eax,4),%edx
4000079e:	ff e2                	jmp    *%edx

400007a0 <.L70>:
400007a0:	8b 5c 24 48          	mov    0x48(%esp),%ebx
400007a4:	c6 44 24 10 30       	movb   $0x30,0x10(%esp)
400007a9:	eb d1                	jmp    4000077c <vprintfmt+0x8c>

400007ab <.L34>:
400007ab:	8d 41 d0             	lea    -0x30(%ecx),%eax
400007ae:	89 c6                	mov    %eax,%esi
400007b0:	89 44 24 18          	mov    %eax,0x18(%esp)
400007b4:	0f be 43 01          	movsbl 0x1(%ebx),%eax
400007b8:	8b 5c 24 48          	mov    0x48(%esp),%ebx
400007bc:	8d 48 d0             	lea    -0x30(%eax),%ecx
400007bf:	83 f9 09             	cmp    $0x9,%ecx
400007c2:	0f 87 e8 01 00 00    	ja     400009b0 <.L31+0x19>
400007c8:	8b 54 24 14          	mov    0x14(%esp),%edx
400007cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
400007d0:	8d 0c b6             	lea    (%esi,%esi,4),%ecx
400007d3:	83 c3 01             	add    $0x1,%ebx
400007d6:	8d 74 48 d0          	lea    -0x30(%eax,%ecx,2),%esi
400007da:	0f be 03             	movsbl (%ebx),%eax
400007dd:	8d 48 d0             	lea    -0x30(%eax),%ecx
400007e0:	83 f9 09             	cmp    $0x9,%ecx
400007e3:	76 eb                	jbe    400007d0 <.L34+0x25>
400007e5:	89 54 24 14          	mov    %edx,0x14(%esp)
400007e9:	89 74 24 18          	mov    %esi,0x18(%esp)
400007ed:	e9 be 01 00 00       	jmp    400009b0 <.L31+0x19>

400007f2 <.L35>:
400007f2:	8b 44 24 4c          	mov    0x4c(%esp),%eax
400007f6:	83 ec 08             	sub    $0x8,%esp
400007f9:	55                   	push   %ebp
400007fa:	8d 58 04             	lea    0x4(%eax),%ebx
400007fd:	8b 44 24 58          	mov    0x58(%esp),%eax
40000801:	ff 30                	pushl  (%eax)
40000803:	ff d7                	call   *%edi
40000805:	83 c4 10             	add    $0x10,%esp
40000808:	89 5c 24 4c          	mov    %ebx,0x4c(%esp)
4000080c:	e9 05 ff ff ff       	jmp    40000716 <vprintfmt+0x26>

40000811 <.L36>:
40000811:	8b 54 24 14          	mov    0x14(%esp),%edx
40000815:	8b 44 24 4c          	mov    0x4c(%esp),%eax
40000819:	83 fa 01             	cmp    $0x1,%edx
4000081c:	8b 08                	mov    (%eax),%ecx
4000081e:	0f 8e 02 03 00 00    	jle    40000b26 <.L27+0xf4>
40000824:	8b 58 04             	mov    0x4(%eax),%ebx
40000827:	83 c0 08             	add    $0x8,%eax
4000082a:	89 44 24 4c          	mov    %eax,0x4c(%esp)
4000082e:	85 db                	test   %ebx,%ebx
40000830:	be 0a 00 00 00       	mov    $0xa,%esi
40000835:	0f 88 31 03 00 00    	js     40000b6c <.L27+0x13a>
4000083b:	83 ec 0c             	sub    $0xc,%esp
4000083e:	89 ea                	mov    %ebp,%edx
40000840:	0f be 44 24 1c       	movsbl 0x1c(%esp),%eax
40000845:	50                   	push   %eax
40000846:	ff 74 24 14          	pushl  0x14(%esp)
4000084a:	89 f8                	mov    %edi,%eax
4000084c:	56                   	push   %esi
4000084d:	53                   	push   %ebx
4000084e:	51                   	push   %ecx
4000084f:	e8 7c fd ff ff       	call   400005d0 <printnum>
40000854:	83 c4 20             	add    $0x20,%esp
40000857:	e9 ba fe ff ff       	jmp    40000716 <vprintfmt+0x26>

4000085c <.L37>:
4000085c:	83 44 24 14 01       	addl   $0x1,0x14(%esp)
40000861:	8b 5c 24 48          	mov    0x48(%esp),%ebx
40000865:	e9 12 ff ff ff       	jmp    4000077c <vprintfmt+0x8c>

4000086a <.L38>:
4000086a:	83 ec 08             	sub    $0x8,%esp
4000086d:	55                   	push   %ebp
4000086e:	6a 58                	push   $0x58
40000870:	ff d7                	call   *%edi
40000872:	5b                   	pop    %ebx
40000873:	5e                   	pop    %esi
40000874:	55                   	push   %ebp
40000875:	6a 58                	push   $0x58
40000877:	ff d7                	call   *%edi
40000879:	58                   	pop    %eax
4000087a:	5a                   	pop    %edx
4000087b:	55                   	push   %ebp
4000087c:	6a 58                	push   $0x58
4000087e:	ff d7                	call   *%edi
40000880:	83 c4 10             	add    $0x10,%esp
40000883:	e9 8e fe ff ff       	jmp    40000716 <vprintfmt+0x26>

40000888 <.L39>:
40000888:	83 ec 08             	sub    $0x8,%esp
4000088b:	31 db                	xor    %ebx,%ebx
4000088d:	be 10 00 00 00       	mov    $0x10,%esi
40000892:	55                   	push   %ebp
40000893:	6a 30                	push   $0x30
40000895:	ff d7                	call   *%edi
40000897:	5a                   	pop    %edx
40000898:	59                   	pop    %ecx
40000899:	55                   	push   %ebp
4000089a:	6a 78                	push   $0x78
4000089c:	ff d7                	call   *%edi
4000089e:	8b 44 24 5c          	mov    0x5c(%esp),%eax
400008a2:	83 c4 10             	add    $0x10,%esp
400008a5:	8b 08                	mov    (%eax),%ecx
400008a7:	8b 44 24 4c          	mov    0x4c(%esp),%eax
400008ab:	83 c0 04             	add    $0x4,%eax
400008ae:	89 44 24 4c          	mov    %eax,0x4c(%esp)
400008b2:	eb 87                	jmp    4000083b <.L36+0x2a>

400008b4 <.L40>:
400008b4:	8b 44 24 4c          	mov    0x4c(%esp),%eax
400008b8:	8b 74 24 18          	mov    0x18(%esp),%esi
400008bc:	83 c0 04             	add    $0x4,%eax
400008bf:	89 44 24 14          	mov    %eax,0x14(%esp)
400008c3:	8b 44 24 4c          	mov    0x4c(%esp),%eax
400008c7:	8b 00                	mov    (%eax),%eax
400008c9:	85 c0                	test   %eax,%eax
400008cb:	89 44 24 18          	mov    %eax,0x18(%esp)
400008cf:	0f 84 62 02 00 00    	je     40000b37 <.L27+0x105>
400008d5:	8b 4c 24 04          	mov    0x4(%esp),%ecx
400008d9:	85 c9                	test   %ecx,%ecx
400008db:	7e 0b                	jle    400008e8 <.L40+0x34>
400008dd:	80 7c 24 10 2d       	cmpb   $0x2d,0x10(%esp)
400008e2:	0f 85 bd 01 00 00    	jne    40000aa5 <.L27+0x73>
400008e8:	8b 44 24 18          	mov    0x18(%esp),%eax
400008ec:	0f be 08             	movsbl (%eax),%ecx
400008ef:	8d 58 01             	lea    0x1(%eax),%ebx
400008f2:	85 c9                	test   %ecx,%ecx
400008f4:	89 c8                	mov    %ecx,%eax
400008f6:	0f 84 6e 01 00 00    	je     40000a6a <.L27+0x38>
400008fc:	89 7c 24 40          	mov    %edi,0x40(%esp)
40000900:	89 df                	mov    %ebx,%edi
40000902:	8b 5c 24 04          	mov    0x4(%esp),%ebx
40000906:	eb 29                	jmp    40000931 <.L40+0x7d>
40000908:	90                   	nop
40000909:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40000910:	83 ec 08             	sub    $0x8,%esp
40000913:	55                   	push   %ebp
40000914:	51                   	push   %ecx
40000915:	ff 54 24 50          	call   *0x50(%esp)
40000919:	83 c4 10             	add    $0x10,%esp
4000091c:	83 c7 01             	add    $0x1,%edi
4000091f:	0f be 47 ff          	movsbl -0x1(%edi),%eax
40000923:	83 eb 01             	sub    $0x1,%ebx
40000926:	0f be c8             	movsbl %al,%ecx
40000929:	85 c9                	test   %ecx,%ecx
4000092b:	0f 84 31 01 00 00    	je     40000a62 <.L27+0x30>
40000931:	85 f6                	test   %esi,%esi
40000933:	78 0c                	js     40000941 <.L40+0x8d>
40000935:	83 ee 01             	sub    $0x1,%esi
40000938:	83 fe ff             	cmp    $0xffffffff,%esi
4000093b:	0f 84 21 01 00 00    	je     40000a62 <.L27+0x30>
40000941:	8b 54 24 08          	mov    0x8(%esp),%edx
40000945:	85 d2                	test   %edx,%edx
40000947:	74 c7                	je     40000910 <.L40+0x5c>
40000949:	83 e8 20             	sub    $0x20,%eax
4000094c:	83 f8 5e             	cmp    $0x5e,%eax
4000094f:	76 bf                	jbe    40000910 <.L40+0x5c>
40000951:	83 ec 08             	sub    $0x8,%esp
40000954:	55                   	push   %ebp
40000955:	6a 3f                	push   $0x3f
40000957:	ff 54 24 50          	call   *0x50(%esp)
4000095b:	83 c4 10             	add    $0x10,%esp
4000095e:	eb bc                	jmp    4000091c <.L40+0x68>

40000960 <.L41>:
40000960:	8b 54 24 14          	mov    0x14(%esp),%edx
40000964:	8b 44 24 4c          	mov    0x4c(%esp),%eax
40000968:	83 fa 01             	cmp    $0x1,%edx
4000096b:	8b 08                	mov    (%eax),%ecx
4000096d:	0f 8e a0 01 00 00    	jle    40000b13 <.L27+0xe1>
40000973:	8b 58 04             	mov    0x4(%eax),%ebx
40000976:	83 c0 08             	add    $0x8,%eax
40000979:	be 0a 00 00 00       	mov    $0xa,%esi
4000097e:	89 44 24 4c          	mov    %eax,0x4c(%esp)
40000982:	e9 b4 fe ff ff       	jmp    4000083b <.L36+0x2a>

40000987 <.L30>:
40000987:	83 ec 08             	sub    $0x8,%esp
4000098a:	55                   	push   %ebp
4000098b:	6a 25                	push   $0x25
4000098d:	ff d7                	call   *%edi
4000098f:	83 c4 10             	add    $0x10,%esp
40000992:	e9 7f fd ff ff       	jmp    40000716 <vprintfmt+0x26>

40000997 <.L31>:
40000997:	8b 44 24 4c          	mov    0x4c(%esp),%eax
4000099b:	8b 5c 24 48          	mov    0x48(%esp),%ebx
4000099f:	8b 00                	mov    (%eax),%eax
400009a1:	89 44 24 18          	mov    %eax,0x18(%esp)
400009a5:	8b 44 24 4c          	mov    0x4c(%esp),%eax
400009a9:	83 c0 04             	add    $0x4,%eax
400009ac:	89 44 24 4c          	mov    %eax,0x4c(%esp)
400009b0:	8b 74 24 04          	mov    0x4(%esp),%esi
400009b4:	85 f6                	test   %esi,%esi
400009b6:	0f 89 c0 fd ff ff    	jns    4000077c <vprintfmt+0x8c>
400009bc:	8b 44 24 18          	mov    0x18(%esp),%eax
400009c0:	c7 44 24 18 ff ff ff 	movl   $0xffffffff,0x18(%esp)
400009c7:	ff 
400009c8:	89 44 24 04          	mov    %eax,0x4(%esp)
400009cc:	e9 ab fd ff ff       	jmp    4000077c <vprintfmt+0x8c>

400009d1 <.L32>:
400009d1:	8b 5c 24 48          	mov    0x48(%esp),%ebx
400009d5:	c6 44 24 10 2d       	movb   $0x2d,0x10(%esp)
400009da:	e9 9d fd ff ff       	jmp    4000077c <vprintfmt+0x8c>

400009df <.L33>:
400009df:	8b 44 24 04          	mov    0x4(%esp),%eax
400009e3:	be 00 00 00 00       	mov    $0x0,%esi
400009e8:	8b 5c 24 48          	mov    0x48(%esp),%ebx
400009ec:	85 c0                	test   %eax,%eax
400009ee:	0f 49 f0             	cmovns %eax,%esi
400009f1:	89 74 24 04          	mov    %esi,0x4(%esp)
400009f5:	e9 82 fd ff ff       	jmp    4000077c <vprintfmt+0x8c>

400009fa <.L42>:
400009fa:	8b 54 24 14          	mov    0x14(%esp),%edx
400009fe:	8b 44 24 4c          	mov    0x4c(%esp),%eax
40000a02:	83 fa 01             	cmp    $0x1,%edx
40000a05:	8b 08                	mov    (%eax),%ecx
40000a07:	0f 8e f3 00 00 00    	jle    40000b00 <.L27+0xce>
40000a0d:	8b 58 04             	mov    0x4(%eax),%ebx
40000a10:	83 c0 08             	add    $0x8,%eax
40000a13:	be 10 00 00 00       	mov    $0x10,%esi
40000a18:	89 44 24 4c          	mov    %eax,0x4c(%esp)
40000a1c:	e9 1a fe ff ff       	jmp    4000083b <.L36+0x2a>

40000a21 <.L28>:
40000a21:	8b 5c 24 48          	mov    0x48(%esp),%ebx
40000a25:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
40000a2c:	00 
40000a2d:	e9 4a fd ff ff       	jmp    4000077c <vprintfmt+0x8c>

40000a32 <.L27>:
40000a32:	83 ec 08             	sub    $0x8,%esp
40000a35:	55                   	push   %ebp
40000a36:	6a 25                	push   $0x25
40000a38:	ff d7                	call   *%edi
40000a3a:	83 c4 10             	add    $0x10,%esp
40000a3d:	80 7b ff 25          	cmpb   $0x25,-0x1(%ebx)
40000a41:	89 5c 24 48          	mov    %ebx,0x48(%esp)
40000a45:	0f 84 cb fc ff ff    	je     40000716 <vprintfmt+0x26>
40000a4b:	89 d8                	mov    %ebx,%eax
40000a4d:	8d 76 00             	lea    0x0(%esi),%esi
40000a50:	83 e8 01             	sub    $0x1,%eax
40000a53:	80 78 ff 25          	cmpb   $0x25,-0x1(%eax)
40000a57:	75 f7                	jne    40000a50 <.L27+0x1e>
40000a59:	89 44 24 48          	mov    %eax,0x48(%esp)
40000a5d:	e9 b4 fc ff ff       	jmp    40000716 <vprintfmt+0x26>
40000a62:	8b 7c 24 40          	mov    0x40(%esp),%edi
40000a66:	89 5c 24 04          	mov    %ebx,0x4(%esp)
40000a6a:	8b 4c 24 04          	mov    0x4(%esp),%ecx
40000a6e:	8b 5c 24 04          	mov    0x4(%esp),%ebx
40000a72:	85 c9                	test   %ecx,%ecx
40000a74:	7e 1a                	jle    40000a90 <.L27+0x5e>
40000a76:	8d 76 00             	lea    0x0(%esi),%esi
40000a79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
40000a80:	83 ec 08             	sub    $0x8,%esp
40000a83:	55                   	push   %ebp
40000a84:	6a 20                	push   $0x20
40000a86:	ff d7                	call   *%edi
40000a88:	83 c4 10             	add    $0x10,%esp
40000a8b:	83 eb 01             	sub    $0x1,%ebx
40000a8e:	75 f0                	jne    40000a80 <.L27+0x4e>
40000a90:	8b 44 24 14          	mov    0x14(%esp),%eax
40000a94:	89 44 24 4c          	mov    %eax,0x4c(%esp)
40000a98:	e9 79 fc ff ff       	jmp    40000716 <vprintfmt+0x26>
40000a9d:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000aa1:	89 44 24 18          	mov    %eax,0x18(%esp)
40000aa5:	83 ec 08             	sub    $0x8,%esp
40000aa8:	56                   	push   %esi
40000aa9:	ff 74 24 24          	pushl  0x24(%esp)
40000aad:	8b 5c 24 10          	mov    0x10(%esp),%ebx
40000ab1:	e8 8a 02 00 00       	call   40000d40 <strnlen>
40000ab6:	29 44 24 14          	sub    %eax,0x14(%esp)
40000aba:	8b 4c 24 14          	mov    0x14(%esp),%ecx
40000abe:	83 c4 10             	add    $0x10,%esp
40000ac1:	85 c9                	test   %ecx,%ecx
40000ac3:	7e 22                	jle    40000ae7 <.L27+0xb5>
40000ac5:	0f be 5c 24 10       	movsbl 0x10(%esp),%ebx
40000aca:	89 74 24 10          	mov    %esi,0x10(%esp)
40000ace:	89 ce                	mov    %ecx,%esi
40000ad0:	83 ec 08             	sub    $0x8,%esp
40000ad3:	55                   	push   %ebp
40000ad4:	53                   	push   %ebx
40000ad5:	ff d7                	call   *%edi
40000ad7:	83 c4 10             	add    $0x10,%esp
40000ada:	83 ee 01             	sub    $0x1,%esi
40000add:	75 f1                	jne    40000ad0 <.L27+0x9e>
40000adf:	89 74 24 04          	mov    %esi,0x4(%esp)
40000ae3:	8b 74 24 10          	mov    0x10(%esp),%esi
40000ae7:	8b 44 24 18          	mov    0x18(%esp),%eax
40000aeb:	8d 58 01             	lea    0x1(%eax),%ebx
40000aee:	0f be 00             	movsbl (%eax),%eax
40000af1:	0f be c8             	movsbl %al,%ecx
40000af4:	85 c9                	test   %ecx,%ecx
40000af6:	0f 85 00 fe ff ff    	jne    400008fc <.L40+0x48>
40000afc:	eb 92                	jmp    40000a90 <.L27+0x5e>
40000afe:	66 90                	xchg   %ax,%ax
40000b00:	83 c0 04             	add    $0x4,%eax
40000b03:	31 db                	xor    %ebx,%ebx
40000b05:	be 10 00 00 00       	mov    $0x10,%esi
40000b0a:	89 44 24 4c          	mov    %eax,0x4c(%esp)
40000b0e:	e9 28 fd ff ff       	jmp    4000083b <.L36+0x2a>
40000b13:	83 c0 04             	add    $0x4,%eax
40000b16:	31 db                	xor    %ebx,%ebx
40000b18:	be 0a 00 00 00       	mov    $0xa,%esi
40000b1d:	89 44 24 4c          	mov    %eax,0x4c(%esp)
40000b21:	e9 15 fd ff ff       	jmp    4000083b <.L36+0x2a>
40000b26:	89 cb                	mov    %ecx,%ebx
40000b28:	83 c0 04             	add    $0x4,%eax
40000b2b:	c1 fb 1f             	sar    $0x1f,%ebx
40000b2e:	89 44 24 4c          	mov    %eax,0x4c(%esp)
40000b32:	e9 f7 fc ff ff       	jmp    4000082e <.L36+0x1d>
40000b37:	8b 44 24 04          	mov    0x4(%esp),%eax
40000b3b:	85 c0                	test   %eax,%eax
40000b3d:	7e 0b                	jle    40000b4a <.L27+0x118>
40000b3f:	80 7c 24 10 2d       	cmpb   $0x2d,0x10(%esp)
40000b44:	0f 85 53 ff ff ff    	jne    40000a9d <.L27+0x6b>
40000b4a:	8b 14 24             	mov    (%esp),%edx
40000b4d:	89 7c 24 40          	mov    %edi,0x40(%esp)
40000b51:	b8 28 00 00 00       	mov    $0x28,%eax
40000b56:	b9 28 00 00 00       	mov    $0x28,%ecx
40000b5b:	8d 9a 8a d5 ff ff    	lea    -0x2a76(%edx),%ebx
40000b61:	89 df                	mov    %ebx,%edi
40000b63:	8b 5c 24 04          	mov    0x4(%esp),%ebx
40000b67:	e9 c5 fd ff ff       	jmp    40000931 <.L40+0x7d>
40000b6c:	89 4c 24 08          	mov    %ecx,0x8(%esp)
40000b70:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
40000b74:	83 ec 08             	sub    $0x8,%esp
40000b77:	55                   	push   %ebp
40000b78:	6a 2d                	push   $0x2d
40000b7a:	ff d7                	call   *%edi
40000b7c:	8b 4c 24 18          	mov    0x18(%esp),%ecx
40000b80:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
40000b84:	f7 d9                	neg    %ecx
40000b86:	83 d3 00             	adc    $0x0,%ebx
40000b89:	83 c4 10             	add    $0x10,%esp
40000b8c:	f7 db                	neg    %ebx
40000b8e:	e9 a8 fc ff ff       	jmp    4000083b <.L36+0x2a>
40000b93:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40000b99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

40000ba0 <printfmt>:
40000ba0:	83 ec 0c             	sub    $0xc,%esp
40000ba3:	8d 44 24 1c          	lea    0x1c(%esp),%eax
40000ba7:	50                   	push   %eax
40000ba8:	ff 74 24 1c          	pushl  0x1c(%esp)
40000bac:	ff 74 24 1c          	pushl  0x1c(%esp)
40000bb0:	ff 74 24 1c          	pushl  0x1c(%esp)
40000bb4:	e8 37 fb ff ff       	call   400006f0 <vprintfmt>
40000bb9:	83 c4 1c             	add    $0x1c,%esp
40000bbc:	c3                   	ret    
40000bbd:	8d 76 00             	lea    0x0(%esi),%esi

40000bc0 <vsprintf>:
40000bc0:	83 ec 1c             	sub    $0x1c,%esp
40000bc3:	8b 54 24 20          	mov    0x20(%esp),%edx
40000bc7:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
40000bce:	ff 
40000bcf:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000bd6:	00 
40000bd7:	e8 37 01 00 00       	call   40000d13 <__x86.get_pc_thunk.ax>
40000bdc:	05 24 34 00 00       	add    $0x3424,%eax
40000be1:	89 54 24 04          	mov    %edx,0x4(%esp)
40000be5:	ff 74 24 28          	pushl  0x28(%esp)
40000be9:	ff 74 24 28          	pushl  0x28(%esp)
40000bed:	8d 80 d0 c6 ff ff    	lea    -0x3930(%eax),%eax
40000bf3:	8d 54 24 0c          	lea    0xc(%esp),%edx
40000bf7:	52                   	push   %edx
40000bf8:	50                   	push   %eax
40000bf9:	e8 f2 fa ff ff       	call   400006f0 <vprintfmt>
40000bfe:	8b 44 24 14          	mov    0x14(%esp),%eax
40000c02:	c6 00 00             	movb   $0x0,(%eax)
40000c05:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000c09:	83 c4 2c             	add    $0x2c,%esp
40000c0c:	c3                   	ret    
40000c0d:	8d 76 00             	lea    0x0(%esi),%esi

40000c10 <sprintf>:
40000c10:	83 ec 1c             	sub    $0x1c,%esp
40000c13:	8b 54 24 20          	mov    0x20(%esp),%edx
40000c17:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
40000c1e:	ff 
40000c1f:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000c26:	00 
40000c27:	e8 e7 00 00 00       	call   40000d13 <__x86.get_pc_thunk.ax>
40000c2c:	05 d4 33 00 00       	add    $0x33d4,%eax
40000c31:	89 54 24 04          	mov    %edx,0x4(%esp)
40000c35:	8d 54 24 28          	lea    0x28(%esp),%edx
40000c39:	8d 80 d0 c6 ff ff    	lea    -0x3930(%eax),%eax
40000c3f:	52                   	push   %edx
40000c40:	ff 74 24 28          	pushl  0x28(%esp)
40000c44:	8d 54 24 0c          	lea    0xc(%esp),%edx
40000c48:	52                   	push   %edx
40000c49:	50                   	push   %eax
40000c4a:	e8 a1 fa ff ff       	call   400006f0 <vprintfmt>
40000c4f:	8b 44 24 14          	mov    0x14(%esp),%eax
40000c53:	c6 00 00             	movb   $0x0,(%eax)
40000c56:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000c5a:	83 c4 2c             	add    $0x2c,%esp
40000c5d:	c3                   	ret    
40000c5e:	66 90                	xchg   %ax,%ax

40000c60 <vsnprintf>:
40000c60:	83 ec 1c             	sub    $0x1c,%esp
40000c63:	8b 44 24 20          	mov    0x20(%esp),%eax
40000c67:	8b 4c 24 24          	mov    0x24(%esp),%ecx
40000c6b:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000c72:	00 
40000c73:	e8 9f 00 00 00       	call   40000d17 <__x86.get_pc_thunk.dx>
40000c78:	81 c2 88 33 00 00    	add    $0x3388,%edx
40000c7e:	89 44 24 04          	mov    %eax,0x4(%esp)
40000c82:	8d 44 08 ff          	lea    -0x1(%eax,%ecx,1),%eax
40000c86:	89 44 24 08          	mov    %eax,0x8(%esp)
40000c8a:	ff 74 24 2c          	pushl  0x2c(%esp)
40000c8e:	ff 74 24 2c          	pushl  0x2c(%esp)
40000c92:	8d 44 24 0c          	lea    0xc(%esp),%eax
40000c96:	50                   	push   %eax
40000c97:	8d 82 d0 c6 ff ff    	lea    -0x3930(%edx),%eax
40000c9d:	50                   	push   %eax
40000c9e:	e8 4d fa ff ff       	call   400006f0 <vprintfmt>
40000ca3:	8b 44 24 14          	mov    0x14(%esp),%eax
40000ca7:	c6 00 00             	movb   $0x0,(%eax)
40000caa:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000cae:	83 c4 2c             	add    $0x2c,%esp
40000cb1:	c3                   	ret    
40000cb2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40000cb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

40000cc0 <snprintf>:
40000cc0:	83 ec 1c             	sub    $0x1c,%esp
40000cc3:	8b 44 24 20          	mov    0x20(%esp),%eax
40000cc7:	8b 4c 24 24          	mov    0x24(%esp),%ecx
40000ccb:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000cd2:	00 
40000cd3:	e8 3f 00 00 00       	call   40000d17 <__x86.get_pc_thunk.dx>
40000cd8:	81 c2 28 33 00 00    	add    $0x3328,%edx
40000cde:	89 44 24 04          	mov    %eax,0x4(%esp)
40000ce2:	8d 44 08 ff          	lea    -0x1(%eax,%ecx,1),%eax
40000ce6:	89 44 24 08          	mov    %eax,0x8(%esp)
40000cea:	8d 44 24 2c          	lea    0x2c(%esp),%eax
40000cee:	50                   	push   %eax
40000cef:	ff 74 24 2c          	pushl  0x2c(%esp)
40000cf3:	8d 44 24 0c          	lea    0xc(%esp),%eax
40000cf7:	50                   	push   %eax
40000cf8:	8d 82 d0 c6 ff ff    	lea    -0x3930(%edx),%eax
40000cfe:	50                   	push   %eax
40000cff:	e8 ec f9 ff ff       	call   400006f0 <vprintfmt>
40000d04:	8b 44 24 14          	mov    0x14(%esp),%eax
40000d08:	c6 00 00             	movb   $0x0,(%eax)
40000d0b:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000d0f:	83 c4 2c             	add    $0x2c,%esp
40000d12:	c3                   	ret    

40000d13 <__x86.get_pc_thunk.ax>:
40000d13:	8b 04 24             	mov    (%esp),%eax
40000d16:	c3                   	ret    

40000d17 <__x86.get_pc_thunk.dx>:
40000d17:	8b 14 24             	mov    (%esp),%edx
40000d1a:	c3                   	ret    

40000d1b <__x86.get_pc_thunk.cx>:
40000d1b:	8b 0c 24             	mov    (%esp),%ecx
40000d1e:	c3                   	ret    
40000d1f:	90                   	nop

40000d20 <strlen>:
40000d20:	8b 54 24 04          	mov    0x4(%esp),%edx
40000d24:	31 c0                	xor    %eax,%eax
40000d26:	80 3a 00             	cmpb   $0x0,(%edx)
40000d29:	74 10                	je     40000d3b <strlen+0x1b>
40000d2b:	90                   	nop
40000d2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
40000d30:	83 c0 01             	add    $0x1,%eax
40000d33:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
40000d37:	75 f7                	jne    40000d30 <strlen+0x10>
40000d39:	f3 c3                	repz ret 
40000d3b:	f3 c3                	repz ret 
40000d3d:	8d 76 00             	lea    0x0(%esi),%esi

40000d40 <strnlen>:
40000d40:	8b 54 24 08          	mov    0x8(%esp),%edx
40000d44:	31 c0                	xor    %eax,%eax
40000d46:	8b 4c 24 04          	mov    0x4(%esp),%ecx
40000d4a:	85 d2                	test   %edx,%edx
40000d4c:	74 24                	je     40000d72 <strnlen+0x32>
40000d4e:	80 39 00             	cmpb   $0x0,(%ecx)
40000d51:	75 0b                	jne    40000d5e <strnlen+0x1e>
40000d53:	eb 10                	jmp    40000d65 <strnlen+0x25>
40000d55:	8d 76 00             	lea    0x0(%esi),%esi
40000d58:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
40000d5c:	74 12                	je     40000d70 <strnlen+0x30>
40000d5e:	83 c0 01             	add    $0x1,%eax
40000d61:	39 c2                	cmp    %eax,%edx
40000d63:	75 f3                	jne    40000d58 <strnlen+0x18>
40000d65:	f3 c3                	repz ret 
40000d67:	89 f6                	mov    %esi,%esi
40000d69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
40000d70:	f3 c3                	repz ret 
40000d72:	f3 c3                	repz ret 
40000d74:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40000d7a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

40000d80 <strcpy>:
40000d80:	53                   	push   %ebx
40000d81:	8b 44 24 08          	mov    0x8(%esp),%eax
40000d85:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
40000d89:	89 c2                	mov    %eax,%edx
40000d8b:	90                   	nop
40000d8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
40000d90:	83 c1 01             	add    $0x1,%ecx
40000d93:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
40000d97:	83 c2 01             	add    $0x1,%edx
40000d9a:	84 db                	test   %bl,%bl
40000d9c:	88 5a ff             	mov    %bl,-0x1(%edx)
40000d9f:	75 ef                	jne    40000d90 <strcpy+0x10>
40000da1:	5b                   	pop    %ebx
40000da2:	c3                   	ret    
40000da3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40000da9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

40000db0 <strncpy>:
40000db0:	57                   	push   %edi
40000db1:	56                   	push   %esi
40000db2:	53                   	push   %ebx
40000db3:	8b 74 24 18          	mov    0x18(%esp),%esi
40000db7:	8b 7c 24 10          	mov    0x10(%esp),%edi
40000dbb:	8b 4c 24 14          	mov    0x14(%esp),%ecx
40000dbf:	85 f6                	test   %esi,%esi
40000dc1:	8d 1c 37             	lea    (%edi,%esi,1),%ebx
40000dc4:	74 1d                	je     40000de3 <strncpy+0x33>
40000dc6:	89 fa                	mov    %edi,%edx
40000dc8:	90                   	nop
40000dc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40000dd0:	0f b6 01             	movzbl (%ecx),%eax
40000dd3:	83 c2 01             	add    $0x1,%edx
40000dd6:	88 42 ff             	mov    %al,-0x1(%edx)
40000dd9:	80 39 01             	cmpb   $0x1,(%ecx)
40000ddc:	83 d9 ff             	sbb    $0xffffffff,%ecx
40000ddf:	39 d3                	cmp    %edx,%ebx
40000de1:	75 ed                	jne    40000dd0 <strncpy+0x20>
40000de3:	89 f8                	mov    %edi,%eax
40000de5:	5b                   	pop    %ebx
40000de6:	5e                   	pop    %esi
40000de7:	5f                   	pop    %edi
40000de8:	c3                   	ret    
40000de9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

40000df0 <strlcpy>:
40000df0:	53                   	push   %ebx
40000df1:	8b 54 24 10          	mov    0x10(%esp),%edx
40000df5:	31 c0                	xor    %eax,%eax
40000df7:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
40000dfb:	85 d2                	test   %edx,%edx
40000dfd:	74 3f                	je     40000e3e <strlcpy+0x4e>
40000dff:	89 d0                	mov    %edx,%eax
40000e01:	83 e8 01             	sub    $0x1,%eax
40000e04:	74 3a                	je     40000e40 <strlcpy+0x50>
40000e06:	0f b6 19             	movzbl (%ecx),%ebx
40000e09:	84 db                	test   %bl,%bl
40000e0b:	74 39                	je     40000e46 <strlcpy+0x56>
40000e0d:	8d 51 01             	lea    0x1(%ecx),%edx
40000e10:	01 c8                	add    %ecx,%eax
40000e12:	8b 4c 24 08          	mov    0x8(%esp),%ecx
40000e16:	eb 13                	jmp    40000e2b <strlcpy+0x3b>
40000e18:	90                   	nop
40000e19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40000e20:	83 c2 01             	add    $0x1,%edx
40000e23:	0f b6 5a ff          	movzbl -0x1(%edx),%ebx
40000e27:	84 db                	test   %bl,%bl
40000e29:	74 0a                	je     40000e35 <strlcpy+0x45>
40000e2b:	83 c1 01             	add    $0x1,%ecx
40000e2e:	39 c2                	cmp    %eax,%edx
40000e30:	88 59 ff             	mov    %bl,-0x1(%ecx)
40000e33:	75 eb                	jne    40000e20 <strlcpy+0x30>
40000e35:	89 c8                	mov    %ecx,%eax
40000e37:	2b 44 24 08          	sub    0x8(%esp),%eax
40000e3b:	c6 01 00             	movb   $0x0,(%ecx)
40000e3e:	5b                   	pop    %ebx
40000e3f:	c3                   	ret    
40000e40:	8b 4c 24 08          	mov    0x8(%esp),%ecx
40000e44:	eb f5                	jmp    40000e3b <strlcpy+0x4b>
40000e46:	8b 4c 24 08          	mov    0x8(%esp),%ecx
40000e4a:	31 c0                	xor    %eax,%eax
40000e4c:	eb ed                	jmp    40000e3b <strlcpy+0x4b>
40000e4e:	66 90                	xchg   %ax,%ax

40000e50 <strcmp>:
40000e50:	56                   	push   %esi
40000e51:	53                   	push   %ebx
40000e52:	8b 54 24 0c          	mov    0xc(%esp),%edx
40000e56:	8b 4c 24 10          	mov    0x10(%esp),%ecx
40000e5a:	0f b6 02             	movzbl (%edx),%eax
40000e5d:	0f b6 19             	movzbl (%ecx),%ebx
40000e60:	84 c0                	test   %al,%al
40000e62:	75 1f                	jne    40000e83 <strcmp+0x33>
40000e64:	eb 2a                	jmp    40000e90 <strcmp+0x40>
40000e66:	8d 76 00             	lea    0x0(%esi),%esi
40000e69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
40000e70:	83 c2 01             	add    $0x1,%edx
40000e73:	0f b6 02             	movzbl (%edx),%eax
40000e76:	8d 71 01             	lea    0x1(%ecx),%esi
40000e79:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
40000e7d:	84 c0                	test   %al,%al
40000e7f:	74 0f                	je     40000e90 <strcmp+0x40>
40000e81:	89 f1                	mov    %esi,%ecx
40000e83:	38 d8                	cmp    %bl,%al
40000e85:	74 e9                	je     40000e70 <strcmp+0x20>
40000e87:	29 d8                	sub    %ebx,%eax
40000e89:	5b                   	pop    %ebx
40000e8a:	5e                   	pop    %esi
40000e8b:	c3                   	ret    
40000e8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
40000e90:	31 c0                	xor    %eax,%eax
40000e92:	29 d8                	sub    %ebx,%eax
40000e94:	5b                   	pop    %ebx
40000e95:	5e                   	pop    %esi
40000e96:	c3                   	ret    
40000e97:	89 f6                	mov    %esi,%esi
40000e99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

40000ea0 <strncmp>:
40000ea0:	57                   	push   %edi
40000ea1:	56                   	push   %esi
40000ea2:	53                   	push   %ebx
40000ea3:	8b 7c 24 18          	mov    0x18(%esp),%edi
40000ea7:	8b 4c 24 10          	mov    0x10(%esp),%ecx
40000eab:	8b 74 24 14          	mov    0x14(%esp),%esi
40000eaf:	85 ff                	test   %edi,%edi
40000eb1:	74 2f                	je     40000ee2 <strncmp+0x42>
40000eb3:	0f b6 11             	movzbl (%ecx),%edx
40000eb6:	0f b6 1e             	movzbl (%esi),%ebx
40000eb9:	84 d2                	test   %dl,%dl
40000ebb:	74 37                	je     40000ef4 <strncmp+0x54>
40000ebd:	38 d3                	cmp    %dl,%bl
40000ebf:	75 33                	jne    40000ef4 <strncmp+0x54>
40000ec1:	01 f7                	add    %esi,%edi
40000ec3:	eb 13                	jmp    40000ed8 <strncmp+0x38>
40000ec5:	8d 76 00             	lea    0x0(%esi),%esi
40000ec8:	0f b6 11             	movzbl (%ecx),%edx
40000ecb:	84 d2                	test   %dl,%dl
40000ecd:	74 21                	je     40000ef0 <strncmp+0x50>
40000ecf:	0f b6 18             	movzbl (%eax),%ebx
40000ed2:	89 c6                	mov    %eax,%esi
40000ed4:	38 da                	cmp    %bl,%dl
40000ed6:	75 1c                	jne    40000ef4 <strncmp+0x54>
40000ed8:	8d 46 01             	lea    0x1(%esi),%eax
40000edb:	83 c1 01             	add    $0x1,%ecx
40000ede:	39 f8                	cmp    %edi,%eax
40000ee0:	75 e6                	jne    40000ec8 <strncmp+0x28>
40000ee2:	5b                   	pop    %ebx
40000ee3:	31 c0                	xor    %eax,%eax
40000ee5:	5e                   	pop    %esi
40000ee6:	5f                   	pop    %edi
40000ee7:	c3                   	ret    
40000ee8:	90                   	nop
40000ee9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40000ef0:	0f b6 5e 01          	movzbl 0x1(%esi),%ebx
40000ef4:	0f b6 c2             	movzbl %dl,%eax
40000ef7:	29 d8                	sub    %ebx,%eax
40000ef9:	5b                   	pop    %ebx
40000efa:	5e                   	pop    %esi
40000efb:	5f                   	pop    %edi
40000efc:	c3                   	ret    
40000efd:	8d 76 00             	lea    0x0(%esi),%esi

40000f00 <strchr>:
40000f00:	53                   	push   %ebx
40000f01:	8b 44 24 08          	mov    0x8(%esp),%eax
40000f05:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
40000f09:	0f b6 10             	movzbl (%eax),%edx
40000f0c:	84 d2                	test   %dl,%dl
40000f0e:	74 1e                	je     40000f2e <strchr+0x2e>
40000f10:	38 d3                	cmp    %dl,%bl
40000f12:	89 d9                	mov    %ebx,%ecx
40000f14:	75 0e                	jne    40000f24 <strchr+0x24>
40000f16:	eb 18                	jmp    40000f30 <strchr+0x30>
40000f18:	90                   	nop
40000f19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40000f20:	38 ca                	cmp    %cl,%dl
40000f22:	74 0c                	je     40000f30 <strchr+0x30>
40000f24:	83 c0 01             	add    $0x1,%eax
40000f27:	0f b6 10             	movzbl (%eax),%edx
40000f2a:	84 d2                	test   %dl,%dl
40000f2c:	75 f2                	jne    40000f20 <strchr+0x20>
40000f2e:	31 c0                	xor    %eax,%eax
40000f30:	5b                   	pop    %ebx
40000f31:	c3                   	ret    
40000f32:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40000f39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

40000f40 <strfind>:
40000f40:	53                   	push   %ebx
40000f41:	8b 44 24 08          	mov    0x8(%esp),%eax
40000f45:	8b 54 24 0c          	mov    0xc(%esp),%edx
40000f49:	0f b6 18             	movzbl (%eax),%ebx
40000f4c:	38 d3                	cmp    %dl,%bl
40000f4e:	74 1e                	je     40000f6e <strfind+0x2e>
40000f50:	84 db                	test   %bl,%bl
40000f52:	89 d1                	mov    %edx,%ecx
40000f54:	75 0e                	jne    40000f64 <strfind+0x24>
40000f56:	eb 16                	jmp    40000f6e <strfind+0x2e>
40000f58:	90                   	nop
40000f59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40000f60:	84 d2                	test   %dl,%dl
40000f62:	74 0a                	je     40000f6e <strfind+0x2e>
40000f64:	83 c0 01             	add    $0x1,%eax
40000f67:	0f b6 10             	movzbl (%eax),%edx
40000f6a:	38 ca                	cmp    %cl,%dl
40000f6c:	75 f2                	jne    40000f60 <strfind+0x20>
40000f6e:	5b                   	pop    %ebx
40000f6f:	c3                   	ret    

40000f70 <strtol>:
40000f70:	55                   	push   %ebp
40000f71:	57                   	push   %edi
40000f72:	56                   	push   %esi
40000f73:	53                   	push   %ebx
40000f74:	83 ec 04             	sub    $0x4,%esp
40000f77:	8b 44 24 20          	mov    0x20(%esp),%eax
40000f7b:	8b 4c 24 18          	mov    0x18(%esp),%ecx
40000f7f:	8b 74 24 1c          	mov    0x1c(%esp),%esi
40000f83:	89 04 24             	mov    %eax,(%esp)
40000f86:	0f b6 01             	movzbl (%ecx),%eax
40000f89:	3c 20                	cmp    $0x20,%al
40000f8b:	75 0d                	jne    40000f9a <strtol+0x2a>
40000f8d:	8d 76 00             	lea    0x0(%esi),%esi
40000f90:	83 c1 01             	add    $0x1,%ecx
40000f93:	0f b6 01             	movzbl (%ecx),%eax
40000f96:	3c 20                	cmp    $0x20,%al
40000f98:	74 f6                	je     40000f90 <strtol+0x20>
40000f9a:	3c 09                	cmp    $0x9,%al
40000f9c:	74 f2                	je     40000f90 <strtol+0x20>
40000f9e:	3c 2b                	cmp    $0x2b,%al
40000fa0:	0f 84 9a 00 00 00    	je     40001040 <strtol+0xd0>
40000fa6:	31 ff                	xor    %edi,%edi
40000fa8:	3c 2d                	cmp    $0x2d,%al
40000faa:	0f 84 a0 00 00 00    	je     40001050 <strtol+0xe0>
40000fb0:	f7 04 24 ef ff ff ff 	testl  $0xffffffef,(%esp)
40000fb7:	0f be 11             	movsbl (%ecx),%edx
40000fba:	75 19                	jne    40000fd5 <strtol+0x65>
40000fbc:	80 fa 30             	cmp    $0x30,%dl
40000fbf:	0f 84 98 00 00 00    	je     4000105d <strtol+0xed>
40000fc5:	8b 1c 24             	mov    (%esp),%ebx
40000fc8:	b8 0a 00 00 00       	mov    $0xa,%eax
40000fcd:	85 db                	test   %ebx,%ebx
40000fcf:	0f 45 c3             	cmovne %ebx,%eax
40000fd2:	89 04 24             	mov    %eax,(%esp)
40000fd5:	31 c0                	xor    %eax,%eax
40000fd7:	eb 1c                	jmp    40000ff5 <strtol+0x85>
40000fd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40000fe0:	83 ea 30             	sub    $0x30,%edx
40000fe3:	8b 1c 24             	mov    (%esp),%ebx
40000fe6:	39 da                	cmp    %ebx,%edx
40000fe8:	7d 29                	jge    40001013 <strtol+0xa3>
40000fea:	0f af c3             	imul   %ebx,%eax
40000fed:	83 c1 01             	add    $0x1,%ecx
40000ff0:	01 d0                	add    %edx,%eax
40000ff2:	0f be 11             	movsbl (%ecx),%edx
40000ff5:	8d 6a d0             	lea    -0x30(%edx),%ebp
40000ff8:	89 eb                	mov    %ebp,%ebx
40000ffa:	80 fb 09             	cmp    $0x9,%bl
40000ffd:	76 e1                	jbe    40000fe0 <strtol+0x70>
40000fff:	8d 6a 9f             	lea    -0x61(%edx),%ebp
40001002:	89 eb                	mov    %ebp,%ebx
40001004:	80 fb 19             	cmp    $0x19,%bl
40001007:	77 27                	ja     40001030 <strtol+0xc0>
40001009:	8b 1c 24             	mov    (%esp),%ebx
4000100c:	83 ea 57             	sub    $0x57,%edx
4000100f:	39 da                	cmp    %ebx,%edx
40001011:	7c d7                	jl     40000fea <strtol+0x7a>
40001013:	85 f6                	test   %esi,%esi
40001015:	74 02                	je     40001019 <strtol+0xa9>
40001017:	89 0e                	mov    %ecx,(%esi)
40001019:	89 c2                	mov    %eax,%edx
4000101b:	f7 da                	neg    %edx
4000101d:	85 ff                	test   %edi,%edi
4000101f:	0f 45 c2             	cmovne %edx,%eax
40001022:	83 c4 04             	add    $0x4,%esp
40001025:	5b                   	pop    %ebx
40001026:	5e                   	pop    %esi
40001027:	5f                   	pop    %edi
40001028:	5d                   	pop    %ebp
40001029:	c3                   	ret    
4000102a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40001030:	8d 6a bf             	lea    -0x41(%edx),%ebp
40001033:	89 eb                	mov    %ebp,%ebx
40001035:	80 fb 19             	cmp    $0x19,%bl
40001038:	77 d9                	ja     40001013 <strtol+0xa3>
4000103a:	83 ea 37             	sub    $0x37,%edx
4000103d:	eb a4                	jmp    40000fe3 <strtol+0x73>
4000103f:	90                   	nop
40001040:	83 c1 01             	add    $0x1,%ecx
40001043:	31 ff                	xor    %edi,%edi
40001045:	e9 66 ff ff ff       	jmp    40000fb0 <strtol+0x40>
4000104a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40001050:	83 c1 01             	add    $0x1,%ecx
40001053:	bf 01 00 00 00       	mov    $0x1,%edi
40001058:	e9 53 ff ff ff       	jmp    40000fb0 <strtol+0x40>
4000105d:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
40001061:	3c 78                	cmp    $0x78,%al
40001063:	74 1d                	je     40001082 <strtol+0x112>
40001065:	8b 1c 24             	mov    (%esp),%ebx
40001068:	85 db                	test   %ebx,%ebx
4000106a:	0f 85 65 ff ff ff    	jne    40000fd5 <strtol+0x65>
40001070:	83 c1 01             	add    $0x1,%ecx
40001073:	0f be d0             	movsbl %al,%edx
40001076:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
4000107d:	e9 53 ff ff ff       	jmp    40000fd5 <strtol+0x65>
40001082:	0f be 51 02          	movsbl 0x2(%ecx),%edx
40001086:	c7 04 24 10 00 00 00 	movl   $0x10,(%esp)
4000108d:	83 c1 02             	add    $0x2,%ecx
40001090:	e9 40 ff ff ff       	jmp    40000fd5 <strtol+0x65>
40001095:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
40001099:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

400010a0 <memset>:
400010a0:	57                   	push   %edi
400010a1:	56                   	push   %esi
400010a2:	53                   	push   %ebx
400010a3:	8b 4c 24 18          	mov    0x18(%esp),%ecx
400010a7:	8b 7c 24 10          	mov    0x10(%esp),%edi
400010ab:	85 c9                	test   %ecx,%ecx
400010ad:	74 14                	je     400010c3 <memset+0x23>
400010af:	f7 c7 03 00 00 00    	test   $0x3,%edi
400010b5:	75 05                	jne    400010bc <memset+0x1c>
400010b7:	f6 c1 03             	test   $0x3,%cl
400010ba:	74 14                	je     400010d0 <memset+0x30>
400010bc:	8b 44 24 14          	mov    0x14(%esp),%eax
400010c0:	fc                   	cld    
400010c1:	f3 aa                	rep stos %al,%es:(%edi)
400010c3:	89 f8                	mov    %edi,%eax
400010c5:	5b                   	pop    %ebx
400010c6:	5e                   	pop    %esi
400010c7:	5f                   	pop    %edi
400010c8:	c3                   	ret    
400010c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
400010d0:	0f b6 54 24 14       	movzbl 0x14(%esp),%edx
400010d5:	c1 e9 02             	shr    $0x2,%ecx
400010d8:	89 d0                	mov    %edx,%eax
400010da:	89 d6                	mov    %edx,%esi
400010dc:	89 d3                	mov    %edx,%ebx
400010de:	c1 e0 18             	shl    $0x18,%eax
400010e1:	c1 e6 10             	shl    $0x10,%esi
400010e4:	c1 e3 08             	shl    $0x8,%ebx
400010e7:	09 f0                	or     %esi,%eax
400010e9:	09 d0                	or     %edx,%eax
400010eb:	09 d8                	or     %ebx,%eax
400010ed:	fc                   	cld    
400010ee:	f3 ab                	rep stos %eax,%es:(%edi)
400010f0:	89 f8                	mov    %edi,%eax
400010f2:	5b                   	pop    %ebx
400010f3:	5e                   	pop    %esi
400010f4:	5f                   	pop    %edi
400010f5:	c3                   	ret    
400010f6:	8d 76 00             	lea    0x0(%esi),%esi
400010f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

40001100 <memmove>:
40001100:	57                   	push   %edi
40001101:	56                   	push   %esi
40001102:	8b 44 24 0c          	mov    0xc(%esp),%eax
40001106:	8b 74 24 10          	mov    0x10(%esp),%esi
4000110a:	8b 4c 24 14          	mov    0x14(%esp),%ecx
4000110e:	39 c6                	cmp    %eax,%esi
40001110:	73 26                	jae    40001138 <memmove+0x38>
40001112:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
40001115:	39 d0                	cmp    %edx,%eax
40001117:	73 1f                	jae    40001138 <memmove+0x38>
40001119:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
4000111c:	89 d6                	mov    %edx,%esi
4000111e:	09 fe                	or     %edi,%esi
40001120:	83 e6 03             	and    $0x3,%esi
40001123:	74 3b                	je     40001160 <memmove+0x60>
40001125:	83 ef 01             	sub    $0x1,%edi
40001128:	8d 72 ff             	lea    -0x1(%edx),%esi
4000112b:	fd                   	std    
4000112c:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
4000112e:	fc                   	cld    
4000112f:	5e                   	pop    %esi
40001130:	5f                   	pop    %edi
40001131:	c3                   	ret    
40001132:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40001138:	89 f2                	mov    %esi,%edx
4000113a:	09 c2                	or     %eax,%edx
4000113c:	83 e2 03             	and    $0x3,%edx
4000113f:	75 0f                	jne    40001150 <memmove+0x50>
40001141:	f6 c1 03             	test   $0x3,%cl
40001144:	75 0a                	jne    40001150 <memmove+0x50>
40001146:	c1 e9 02             	shr    $0x2,%ecx
40001149:	89 c7                	mov    %eax,%edi
4000114b:	fc                   	cld    
4000114c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
4000114e:	eb 05                	jmp    40001155 <memmove+0x55>
40001150:	89 c7                	mov    %eax,%edi
40001152:	fc                   	cld    
40001153:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
40001155:	5e                   	pop    %esi
40001156:	5f                   	pop    %edi
40001157:	c3                   	ret    
40001158:	90                   	nop
40001159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40001160:	f6 c1 03             	test   $0x3,%cl
40001163:	75 c0                	jne    40001125 <memmove+0x25>
40001165:	83 ef 04             	sub    $0x4,%edi
40001168:	8d 72 fc             	lea    -0x4(%edx),%esi
4000116b:	c1 e9 02             	shr    $0x2,%ecx
4000116e:	fd                   	std    
4000116f:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
40001171:	eb bb                	jmp    4000112e <memmove+0x2e>
40001173:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40001179:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

40001180 <memcpy>:
40001180:	e9 7b ff ff ff       	jmp    40001100 <memmove>
40001185:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
40001189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

40001190 <memcmp>:
40001190:	57                   	push   %edi
40001191:	56                   	push   %esi
40001192:	53                   	push   %ebx
40001193:	8b 5c 24 18          	mov    0x18(%esp),%ebx
40001197:	8b 74 24 10          	mov    0x10(%esp),%esi
4000119b:	8b 7c 24 14          	mov    0x14(%esp),%edi
4000119f:	85 db                	test   %ebx,%ebx
400011a1:	74 29                	je     400011cc <memcmp+0x3c>
400011a3:	0f b6 16             	movzbl (%esi),%edx
400011a6:	0f b6 0f             	movzbl (%edi),%ecx
400011a9:	38 d1                	cmp    %dl,%cl
400011ab:	75 2b                	jne    400011d8 <memcmp+0x48>
400011ad:	b8 01 00 00 00       	mov    $0x1,%eax
400011b2:	eb 14                	jmp    400011c8 <memcmp+0x38>
400011b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
400011b8:	0f b6 14 06          	movzbl (%esi,%eax,1),%edx
400011bc:	83 c0 01             	add    $0x1,%eax
400011bf:	0f b6 4c 07 ff       	movzbl -0x1(%edi,%eax,1),%ecx
400011c4:	38 ca                	cmp    %cl,%dl
400011c6:	75 10                	jne    400011d8 <memcmp+0x48>
400011c8:	39 d8                	cmp    %ebx,%eax
400011ca:	75 ec                	jne    400011b8 <memcmp+0x28>
400011cc:	5b                   	pop    %ebx
400011cd:	31 c0                	xor    %eax,%eax
400011cf:	5e                   	pop    %esi
400011d0:	5f                   	pop    %edi
400011d1:	c3                   	ret    
400011d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
400011d8:	0f b6 c2             	movzbl %dl,%eax
400011db:	5b                   	pop    %ebx
400011dc:	29 c8                	sub    %ecx,%eax
400011de:	5e                   	pop    %esi
400011df:	5f                   	pop    %edi
400011e0:	c3                   	ret    
400011e1:	eb 0d                	jmp    400011f0 <memchr>
400011e3:	90                   	nop
400011e4:	90                   	nop
400011e5:	90                   	nop
400011e6:	90                   	nop
400011e7:	90                   	nop
400011e8:	90                   	nop
400011e9:	90                   	nop
400011ea:	90                   	nop
400011eb:	90                   	nop
400011ec:	90                   	nop
400011ed:	90                   	nop
400011ee:	90                   	nop
400011ef:	90                   	nop

400011f0 <memchr>:
400011f0:	53                   	push   %ebx
400011f1:	8b 44 24 08          	mov    0x8(%esp),%eax
400011f5:	8b 54 24 10          	mov    0x10(%esp),%edx
400011f9:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
400011fd:	01 c2                	add    %eax,%edx
400011ff:	39 d0                	cmp    %edx,%eax
40001201:	73 18                	jae    4000121b <memchr+0x2b>
40001203:	38 18                	cmp    %bl,(%eax)
40001205:	89 d9                	mov    %ebx,%ecx
40001207:	75 0b                	jne    40001214 <memchr+0x24>
40001209:	eb 12                	jmp    4000121d <memchr+0x2d>
4000120b:	90                   	nop
4000120c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
40001210:	38 08                	cmp    %cl,(%eax)
40001212:	74 09                	je     4000121d <memchr+0x2d>
40001214:	83 c0 01             	add    $0x1,%eax
40001217:	39 c2                	cmp    %eax,%edx
40001219:	75 f5                	jne    40001210 <memchr+0x20>
4000121b:	31 c0                	xor    %eax,%eax
4000121d:	5b                   	pop    %ebx
4000121e:	c3                   	ret    
4000121f:	90                   	nop

40001220 <init>:
40001220:	e8 ee fa ff ff       	call   40000d13 <__x86.get_pc_thunk.ax>
40001225:	05 db 2d 00 00       	add    $0x2ddb,%eax
4000122a:	8b 0d 00 00 00 e0    	mov    0xe0000000,%ecx
40001230:	c7 c2 40 44 00 40    	mov    $0x40004440,%edx
40001236:	c7 c0 20 40 00 40    	mov    $0x40004020,%eax
4000123c:	89 0a                	mov    %ecx,(%edx)
4000123e:	8b 15 04 00 00 e0    	mov    0xe0000004,%edx
40001244:	89 10                	mov    %edx,(%eax)
40001246:	c3                   	ret    
40001247:	89 f6                	mov    %esi,%esi
40001249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

40001250 <yield>:
40001250:	f3 c3                	repz ret 
40001252:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40001259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

40001260 <sys_getc>:
40001260:	e8 ae fa ff ff       	call   40000d13 <__x86.get_pc_thunk.ax>
40001265:	05 9b 2d 00 00       	add    $0x2d9b,%eax
4000126a:	83 ec 0c             	sub    $0xc,%esp
4000126d:	c7 c0 20 40 00 40    	mov    $0x40004020,%eax
40001273:	ff 10                	call   *(%eax)
40001275:	83 c4 0c             	add    $0xc,%esp
40001278:	0f be c0             	movsbl %al,%eax
4000127b:	c3                   	ret    
4000127c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

40001280 <sys_puts>:
40001280:	55                   	push   %ebp
40001281:	57                   	push   %edi
40001282:	b8 ff 03 00 00       	mov    $0x3ff,%eax
40001287:	56                   	push   %esi
40001288:	53                   	push   %ebx
40001289:	e8 f9 f0 ff ff       	call   40000387 <__x86.get_pc_thunk.bx>
4000128e:	81 c3 72 2d 00 00    	add    $0x2d72,%ebx
40001294:	83 ec 10             	sub    $0x10,%esp
40001297:	8b 74 24 28          	mov    0x28(%esp),%esi
4000129b:	8b 6c 24 24          	mov    0x24(%esp),%ebp
4000129f:	c7 c7 40 40 00 40    	mov    $0x40004040,%edi
400012a5:	81 fe ff 03 00 00    	cmp    $0x3ff,%esi
400012ab:	0f 47 f0             	cmova  %eax,%esi
400012ae:	56                   	push   %esi
400012af:	55                   	push   %ebp
400012b0:	57                   	push   %edi
400012b1:	e8 fa fa ff ff       	call   40000db0 <strncpy>
400012b6:	c7 c0 40 44 00 40    	mov    $0x40004440,%eax
400012bc:	8d 93 e8 d6 ff ff    	lea    -0x2918(%ebx),%edx
400012c2:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
400012c6:	89 6c 24 34          	mov    %ebp,0x34(%esp)
400012ca:	89 54 24 30          	mov    %edx,0x30(%esp)
400012ce:	8b 00                	mov    (%eax),%eax
400012d0:	83 c4 1c             	add    $0x1c,%esp
400012d3:	5b                   	pop    %ebx
400012d4:	5e                   	pop    %esi
400012d5:	5f                   	pop    %edi
400012d6:	5d                   	pop    %ebp
400012d7:	ff e0                	jmp    *%eax
400012d9:	66 90                	xchg   %ax,%ax
400012db:	66 90                	xchg   %ax,%ax
400012dd:	66 90                	xchg   %ax,%ax
400012df:	90                   	nop

400012e0 <__udivdi3>:
400012e0:	55                   	push   %ebp
400012e1:	57                   	push   %edi
400012e2:	56                   	push   %esi
400012e3:	53                   	push   %ebx
400012e4:	83 ec 1c             	sub    $0x1c,%esp
400012e7:	8b 74 24 3c          	mov    0x3c(%esp),%esi
400012eb:	8b 5c 24 30          	mov    0x30(%esp),%ebx
400012ef:	8b 4c 24 34          	mov    0x34(%esp),%ecx
400012f3:	8b 7c 24 38          	mov    0x38(%esp),%edi
400012f7:	85 f6                	test   %esi,%esi
400012f9:	89 5c 24 08          	mov    %ebx,0x8(%esp)
400012fd:	89 ca                	mov    %ecx,%edx
400012ff:	89 f8                	mov    %edi,%eax
40001301:	75 3d                	jne    40001340 <__udivdi3+0x60>
40001303:	39 cf                	cmp    %ecx,%edi
40001305:	0f 87 c5 00 00 00    	ja     400013d0 <__udivdi3+0xf0>
4000130b:	85 ff                	test   %edi,%edi
4000130d:	89 fd                	mov    %edi,%ebp
4000130f:	75 0b                	jne    4000131c <__udivdi3+0x3c>
40001311:	b8 01 00 00 00       	mov    $0x1,%eax
40001316:	31 d2                	xor    %edx,%edx
40001318:	f7 f7                	div    %edi
4000131a:	89 c5                	mov    %eax,%ebp
4000131c:	89 c8                	mov    %ecx,%eax
4000131e:	31 d2                	xor    %edx,%edx
40001320:	f7 f5                	div    %ebp
40001322:	89 c1                	mov    %eax,%ecx
40001324:	89 d8                	mov    %ebx,%eax
40001326:	89 cf                	mov    %ecx,%edi
40001328:	f7 f5                	div    %ebp
4000132a:	89 c3                	mov    %eax,%ebx
4000132c:	89 d8                	mov    %ebx,%eax
4000132e:	89 fa                	mov    %edi,%edx
40001330:	83 c4 1c             	add    $0x1c,%esp
40001333:	5b                   	pop    %ebx
40001334:	5e                   	pop    %esi
40001335:	5f                   	pop    %edi
40001336:	5d                   	pop    %ebp
40001337:	c3                   	ret    
40001338:	90                   	nop
40001339:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40001340:	39 ce                	cmp    %ecx,%esi
40001342:	77 74                	ja     400013b8 <__udivdi3+0xd8>
40001344:	0f bd fe             	bsr    %esi,%edi
40001347:	83 f7 1f             	xor    $0x1f,%edi
4000134a:	0f 84 98 00 00 00    	je     400013e8 <__udivdi3+0x108>
40001350:	bb 20 00 00 00       	mov    $0x20,%ebx
40001355:	89 f9                	mov    %edi,%ecx
40001357:	89 c5                	mov    %eax,%ebp
40001359:	29 fb                	sub    %edi,%ebx
4000135b:	d3 e6                	shl    %cl,%esi
4000135d:	89 d9                	mov    %ebx,%ecx
4000135f:	d3 ed                	shr    %cl,%ebp
40001361:	89 f9                	mov    %edi,%ecx
40001363:	d3 e0                	shl    %cl,%eax
40001365:	09 ee                	or     %ebp,%esi
40001367:	89 d9                	mov    %ebx,%ecx
40001369:	89 44 24 0c          	mov    %eax,0xc(%esp)
4000136d:	89 d5                	mov    %edx,%ebp
4000136f:	8b 44 24 08          	mov    0x8(%esp),%eax
40001373:	d3 ed                	shr    %cl,%ebp
40001375:	89 f9                	mov    %edi,%ecx
40001377:	d3 e2                	shl    %cl,%edx
40001379:	89 d9                	mov    %ebx,%ecx
4000137b:	d3 e8                	shr    %cl,%eax
4000137d:	09 c2                	or     %eax,%edx
4000137f:	89 d0                	mov    %edx,%eax
40001381:	89 ea                	mov    %ebp,%edx
40001383:	f7 f6                	div    %esi
40001385:	89 d5                	mov    %edx,%ebp
40001387:	89 c3                	mov    %eax,%ebx
40001389:	f7 64 24 0c          	mull   0xc(%esp)
4000138d:	39 d5                	cmp    %edx,%ebp
4000138f:	72 10                	jb     400013a1 <__udivdi3+0xc1>
40001391:	8b 74 24 08          	mov    0x8(%esp),%esi
40001395:	89 f9                	mov    %edi,%ecx
40001397:	d3 e6                	shl    %cl,%esi
40001399:	39 c6                	cmp    %eax,%esi
4000139b:	73 07                	jae    400013a4 <__udivdi3+0xc4>
4000139d:	39 d5                	cmp    %edx,%ebp
4000139f:	75 03                	jne    400013a4 <__udivdi3+0xc4>
400013a1:	83 eb 01             	sub    $0x1,%ebx
400013a4:	31 ff                	xor    %edi,%edi
400013a6:	89 d8                	mov    %ebx,%eax
400013a8:	89 fa                	mov    %edi,%edx
400013aa:	83 c4 1c             	add    $0x1c,%esp
400013ad:	5b                   	pop    %ebx
400013ae:	5e                   	pop    %esi
400013af:	5f                   	pop    %edi
400013b0:	5d                   	pop    %ebp
400013b1:	c3                   	ret    
400013b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
400013b8:	31 ff                	xor    %edi,%edi
400013ba:	31 db                	xor    %ebx,%ebx
400013bc:	89 d8                	mov    %ebx,%eax
400013be:	89 fa                	mov    %edi,%edx
400013c0:	83 c4 1c             	add    $0x1c,%esp
400013c3:	5b                   	pop    %ebx
400013c4:	5e                   	pop    %esi
400013c5:	5f                   	pop    %edi
400013c6:	5d                   	pop    %ebp
400013c7:	c3                   	ret    
400013c8:	90                   	nop
400013c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
400013d0:	89 d8                	mov    %ebx,%eax
400013d2:	f7 f7                	div    %edi
400013d4:	31 ff                	xor    %edi,%edi
400013d6:	89 c3                	mov    %eax,%ebx
400013d8:	89 d8                	mov    %ebx,%eax
400013da:	89 fa                	mov    %edi,%edx
400013dc:	83 c4 1c             	add    $0x1c,%esp
400013df:	5b                   	pop    %ebx
400013e0:	5e                   	pop    %esi
400013e1:	5f                   	pop    %edi
400013e2:	5d                   	pop    %ebp
400013e3:	c3                   	ret    
400013e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
400013e8:	39 ce                	cmp    %ecx,%esi
400013ea:	72 0c                	jb     400013f8 <__udivdi3+0x118>
400013ec:	31 db                	xor    %ebx,%ebx
400013ee:	3b 44 24 08          	cmp    0x8(%esp),%eax
400013f2:	0f 87 34 ff ff ff    	ja     4000132c <__udivdi3+0x4c>
400013f8:	bb 01 00 00 00       	mov    $0x1,%ebx
400013fd:	e9 2a ff ff ff       	jmp    4000132c <__udivdi3+0x4c>
40001402:	66 90                	xchg   %ax,%ax
40001404:	66 90                	xchg   %ax,%ax
40001406:	66 90                	xchg   %ax,%ax
40001408:	66 90                	xchg   %ax,%ax
4000140a:	66 90                	xchg   %ax,%ax
4000140c:	66 90                	xchg   %ax,%ax
4000140e:	66 90                	xchg   %ax,%ax

40001410 <__umoddi3>:
40001410:	55                   	push   %ebp
40001411:	57                   	push   %edi
40001412:	56                   	push   %esi
40001413:	53                   	push   %ebx
40001414:	83 ec 1c             	sub    $0x1c,%esp
40001417:	8b 44 24 3c          	mov    0x3c(%esp),%eax
4000141b:	8b 4c 24 30          	mov    0x30(%esp),%ecx
4000141f:	8b 74 24 34          	mov    0x34(%esp),%esi
40001423:	8b 7c 24 38          	mov    0x38(%esp),%edi
40001427:	85 c0                	test   %eax,%eax
40001429:	89 44 24 0c          	mov    %eax,0xc(%esp)
4000142d:	89 4c 24 08          	mov    %ecx,0x8(%esp)
40001431:	89 3c 24             	mov    %edi,(%esp)
40001434:	89 4c 24 04          	mov    %ecx,0x4(%esp)
40001438:	89 f2                	mov    %esi,%edx
4000143a:	75 14                	jne    40001450 <__umoddi3+0x40>
4000143c:	39 f7                	cmp    %esi,%edi
4000143e:	76 40                	jbe    40001480 <__umoddi3+0x70>
40001440:	89 c8                	mov    %ecx,%eax
40001442:	f7 f7                	div    %edi
40001444:	89 d0                	mov    %edx,%eax
40001446:	31 d2                	xor    %edx,%edx
40001448:	83 c4 1c             	add    $0x1c,%esp
4000144b:	5b                   	pop    %ebx
4000144c:	5e                   	pop    %esi
4000144d:	5f                   	pop    %edi
4000144e:	5d                   	pop    %ebp
4000144f:	c3                   	ret    
40001450:	39 f0                	cmp    %esi,%eax
40001452:	89 f3                	mov    %esi,%ebx
40001454:	77 4a                	ja     400014a0 <__umoddi3+0x90>
40001456:	0f bd e8             	bsr    %eax,%ebp
40001459:	83 f5 1f             	xor    $0x1f,%ebp
4000145c:	75 52                	jne    400014b0 <__umoddi3+0xa0>
4000145e:	39 f0                	cmp    %esi,%eax
40001460:	0f 82 da 00 00 00    	jb     40001540 <__umoddi3+0x130>
40001466:	39 0c 24             	cmp    %ecx,(%esp)
40001469:	0f 86 d1 00 00 00    	jbe    40001540 <__umoddi3+0x130>
4000146f:	8b 44 24 04          	mov    0x4(%esp),%eax
40001473:	83 c4 1c             	add    $0x1c,%esp
40001476:	5b                   	pop    %ebx
40001477:	5e                   	pop    %esi
40001478:	5f                   	pop    %edi
40001479:	5d                   	pop    %ebp
4000147a:	c3                   	ret    
4000147b:	90                   	nop
4000147c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
40001480:	85 ff                	test   %edi,%edi
40001482:	89 fd                	mov    %edi,%ebp
40001484:	75 0b                	jne    40001491 <__umoddi3+0x81>
40001486:	b8 01 00 00 00       	mov    $0x1,%eax
4000148b:	31 d2                	xor    %edx,%edx
4000148d:	f7 f7                	div    %edi
4000148f:	89 c5                	mov    %eax,%ebp
40001491:	89 f0                	mov    %esi,%eax
40001493:	31 d2                	xor    %edx,%edx
40001495:	f7 f5                	div    %ebp
40001497:	89 c8                	mov    %ecx,%eax
40001499:	f7 f5                	div    %ebp
4000149b:	eb a7                	jmp    40001444 <__umoddi3+0x34>
4000149d:	8d 76 00             	lea    0x0(%esi),%esi
400014a0:	89 c8                	mov    %ecx,%eax
400014a2:	89 f2                	mov    %esi,%edx
400014a4:	83 c4 1c             	add    $0x1c,%esp
400014a7:	5b                   	pop    %ebx
400014a8:	5e                   	pop    %esi
400014a9:	5f                   	pop    %edi
400014aa:	5d                   	pop    %ebp
400014ab:	c3                   	ret    
400014ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
400014b0:	8b 34 24             	mov    (%esp),%esi
400014b3:	bf 20 00 00 00       	mov    $0x20,%edi
400014b8:	89 e9                	mov    %ebp,%ecx
400014ba:	29 ef                	sub    %ebp,%edi
400014bc:	d3 e0                	shl    %cl,%eax
400014be:	89 f9                	mov    %edi,%ecx
400014c0:	89 f2                	mov    %esi,%edx
400014c2:	d3 ea                	shr    %cl,%edx
400014c4:	89 e9                	mov    %ebp,%ecx
400014c6:	09 c2                	or     %eax,%edx
400014c8:	89 d8                	mov    %ebx,%eax
400014ca:	89 14 24             	mov    %edx,(%esp)
400014cd:	89 f2                	mov    %esi,%edx
400014cf:	d3 e2                	shl    %cl,%edx
400014d1:	89 f9                	mov    %edi,%ecx
400014d3:	89 54 24 04          	mov    %edx,0x4(%esp)
400014d7:	8b 54 24 08          	mov    0x8(%esp),%edx
400014db:	d3 e8                	shr    %cl,%eax
400014dd:	89 e9                	mov    %ebp,%ecx
400014df:	89 c6                	mov    %eax,%esi
400014e1:	d3 e3                	shl    %cl,%ebx
400014e3:	89 f9                	mov    %edi,%ecx
400014e5:	89 d0                	mov    %edx,%eax
400014e7:	d3 e8                	shr    %cl,%eax
400014e9:	89 e9                	mov    %ebp,%ecx
400014eb:	09 d8                	or     %ebx,%eax
400014ed:	89 d3                	mov    %edx,%ebx
400014ef:	89 f2                	mov    %esi,%edx
400014f1:	f7 34 24             	divl   (%esp)
400014f4:	89 d6                	mov    %edx,%esi
400014f6:	d3 e3                	shl    %cl,%ebx
400014f8:	f7 64 24 04          	mull   0x4(%esp)
400014fc:	39 d6                	cmp    %edx,%esi
400014fe:	89 5c 24 08          	mov    %ebx,0x8(%esp)
40001502:	89 d1                	mov    %edx,%ecx
40001504:	89 c3                	mov    %eax,%ebx
40001506:	72 08                	jb     40001510 <__umoddi3+0x100>
40001508:	75 11                	jne    4000151b <__umoddi3+0x10b>
4000150a:	39 44 24 08          	cmp    %eax,0x8(%esp)
4000150e:	73 0b                	jae    4000151b <__umoddi3+0x10b>
40001510:	2b 44 24 04          	sub    0x4(%esp),%eax
40001514:	1b 14 24             	sbb    (%esp),%edx
40001517:	89 d1                	mov    %edx,%ecx
40001519:	89 c3                	mov    %eax,%ebx
4000151b:	8b 54 24 08          	mov    0x8(%esp),%edx
4000151f:	29 da                	sub    %ebx,%edx
40001521:	19 ce                	sbb    %ecx,%esi
40001523:	89 f9                	mov    %edi,%ecx
40001525:	89 f0                	mov    %esi,%eax
40001527:	d3 e0                	shl    %cl,%eax
40001529:	89 e9                	mov    %ebp,%ecx
4000152b:	d3 ea                	shr    %cl,%edx
4000152d:	89 e9                	mov    %ebp,%ecx
4000152f:	d3 ee                	shr    %cl,%esi
40001531:	09 d0                	or     %edx,%eax
40001533:	89 f2                	mov    %esi,%edx
40001535:	83 c4 1c             	add    $0x1c,%esp
40001538:	5b                   	pop    %ebx
40001539:	5e                   	pop    %esi
4000153a:	5f                   	pop    %edi
4000153b:	5d                   	pop    %ebp
4000153c:	c3                   	ret    
4000153d:	8d 76 00             	lea    0x0(%esi),%esi
40001540:	89 f2                	mov    %esi,%edx
40001542:	29 f9                	sub    %edi,%ecx
40001544:	1b 54 24 0c          	sbb    0xc(%esp),%edx
40001548:	89 4c 24 04          	mov    %ecx,0x4(%esp)
4000154c:	e9 1e ff ff ff       	jmp    4000146f <__umoddi3+0x5f>
