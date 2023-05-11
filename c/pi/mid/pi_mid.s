	.file	"pi_mid.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.rodata
	.align	2
.LC1:
	.string	"Program Start !\n"
	.align	2
.LC2:
	.string	"Calculating pi ... \n"
	.align	2
.LC3:
	.string	"Complete !!\n"
	.align	2
.LC4:
	.string	"\nCHECK PASSED !!\n"
	.align	2
.LC5:
	.string	"\nCHECK FAILED !!\n"
	.align	2
.LC6:
	.string	"\nINVALID ??\n"
	.align	2
.LC0:
	.word	3
	.word	1415
	.word	9265
	.word	3589
	.word	7932
	.word	3846
	.word	2643
	.word	3832
	.word	7950
	.word	2884
	.word	1971
	.word	6939
	.word	9375
	.word	1058
	.word	2097
	.word	4944
	.word	5923
	.word	781
	.word	6406
	.word	2862
	.word	899
	.word	8628
	.word	348
	.word	2534
	.word	2117
	.word	679
	.word	8214
	.word	8086
	.word	5132
	.word	8230
	.word	6647
	.word	938
	.word	4460
	.word	9550
	.word	5822
	.word	3172
	.word	5359
	.word	4081
	.word	2848
	.word	1117
	.word	4502
	.word	8410
	.word	2701
	.word	9385
	.word	2110
	.word	5559
	.word	6446
	.word	2294
	.word	8954
	.word	9303
	.word	8196
	.word	4428
	.word	8109
	.word	7566
	.word	5933
	.word	4461
	.word	2847
	.word	5648
	.word	2337
	.word	8678
	.word	3165
	.word	2712
	.word	190
	.word	9145
	.word	6485
	.word	6692
	.word	3460
	.word	3486
	.word	1045
	.word	4326
	.word	6482
	.word	1339
	.word	3607
	.word	2602
	.word	4914
	.word	1273
	.word	7245
	.word	8700
	.word	6606
	.word	3155
	.word	8817
	.word	4881
	.word	5209
	.word	2096
	.word	2829
	.word	2540
	.word	9171
	.word	5364
	.word	3678
	.word	9259
	.word	360
	.word	113
	.word	3053
	.word	548
	.word	8204
	.word	6652
	.word	1384
	.word	1469
	.word	5194
	.word	1511
	.word	6094
	.word	3305
	.word	7270
	.word	3657
	.word	5959
	.word	1953
	.word	921
	.word	8611
	.word	7381
	.word	9326
	.word	1179
	.word	3105
	.word	1185
	.word	4807
	.word	4462
	.word	3799
	.word	6274
	.word	9567
	.word	3518
	.word	8575
	.word	2724
	.word	8912
	.word	2793
	.word	8183
	.word	119
	.word	4912
	.word	9833
	.word	6733
	.word	6244
	.word	656
	.word	6430
	.word	8602
	.word	1394
	.word	9463
	.word	9522
	.word	4737
	.word	1907
	.word	217
	.word	9860
	.word	9437
	.word	277
	.word	539
	.word	2171
	.word	7629
	.word	3176
	.word	7523
	.word	8467
	.word	4818
	.word	4676
	.word	6940
	.word	5132
	.word	7
	.text
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-2032
	sw	ra,2028(sp)
	sw	s0,2024(sp)
	addi	s0,sp,2032
	addi	sp,sp,-432
	li	a5,-4096
	addi	a5,a5,-16
	add	a5,a5,s0
	lui	a4,%hi(.LC0)
	addi	a4,a4,%lo(.LC0)
	addi	a5,a5,1660
	mv	a3,a4
	li	a4,608
	mv	a2,a4
	mv	a1,a3
	mv	a0,a5
	call	memcpy
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	myputs
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	myputs
	addi	a5,s0,-628
	li	a2,5
	li	a1,16
	mv	a0,a5
	call	marctan
	addi	a5,s0,-1236
	li	a2,239
	li	a1,4
	mv	a0,a5
	call	marctan
	addi	a3,s0,-1236
	addi	a4,s0,-628
	addi	a5,s0,-1844
	mv	a2,a3
	mv	a1,a4
	mv	a0,a5
	call	lsub
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	myputs
	li	a5,-4096
	addi	a5,a5,1660
	addi	a5,a5,-16
	add	a4,a5,s0
	addi	a5,s0,-1844
	mv	a1,a4
	mv	a0,a5
	call	checkResult
	sw	a0,-20(s0)
	lw	a5,-20(s0)
	bne	a5,zero,.L2
	lui	a5,%hi(.LC4)
	addi	a0,a5,%lo(.LC4)
	call	myputs
	j	.L3
.L2:
	lw	a4,-20(s0)
	li	a5,1
	bne	a4,a5,.L4
	lui	a5,%hi(.LC5)
	addi	a0,a5,%lo(.LC5)
	call	myputs
	j	.L3
.L4:
	lui	a5,%hi(.LC6)
	addi	a0,a5,%lo(.LC6)
	call	myputs
.L3:
	li	a5,-16777216
	sw	zero,0(a5)
	li	a5,0
	mv	a0,a5
	addi	sp,sp,432
	lw	ra,2028(sp)
	lw	s0,2024(sp)
	addi	sp,sp,2032
	jr	ra
	.size	main, .-main
	.globl	__mulsi3
	.globl	__divsi3
	.globl	__modsi3
	.align	2
	.globl	numTostr
	.type	numTostr, @function
numTostr:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	a2,-44(s0)
	lw	a5,-36(s0)
	sw	a5,-24(s0)
	lw	a5,-44(s0)
	sw	a5,-20(s0)
	j	.L7
.L8:
	lw	a1,-44(s0)
	lw	a0,-20(s0)
	call	__mulsi3
	mv	a5,a0
	sw	a5,-20(s0)
.L7:
	lw	a4,-20(s0)
	lw	a5,-40(s0)
	ble	a4,a5,.L8
	lw	a1,-44(s0)
	lw	a0,-20(s0)
	call	__divsi3
	mv	a5,a0
	sw	a5,-20(s0)
	j	.L9
.L12:
	lw	a1,-20(s0)
	lw	a0,-40(s0)
	call	__divsi3
	mv	a5,a0
	sb	a5,-25(s0)
	lw	a5,-40(s0)
	lw	a1,-20(s0)
	mv	a0,a5
	call	__modsi3
	mv	a5,a0
	sw	a5,-40(s0)
	lbu	a4,-25(s0)
	li	a5,9
	bgtu	a4,a5,.L10
	lw	a5,-24(s0)
	addi	a4,a5,1
	sw	a4,-24(s0)
	lbu	a4,-25(s0)
	addi	a4,a4,48
	andi	a4,a4,0xff
	sb	a4,0(a5)
	j	.L11
.L10:
	lw	a5,-24(s0)
	addi	a4,a5,1
	sw	a4,-24(s0)
	lbu	a4,-25(s0)
	addi	a4,a4,87
	andi	a4,a4,0xff
	sb	a4,0(a5)
.L11:
	lw	a1,-44(s0)
	lw	a0,-20(s0)
	call	__divsi3
	mv	a5,a0
	sw	a5,-20(s0)
.L9:
	lw	a5,-20(s0)
	bne	a5,zero,.L12
	lw	a5,-24(s0)
	sb	zero,0(a5)
	lw	a4,-24(s0)
	lw	a5,-36(s0)
	sub	a5,a4,a5
	mv	a0,a5
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	numTostr, .-numTostr
	.align	2
	.globl	myputchar
	.type	myputchar, @function
myputchar:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	mv	a5,a0
	sb	a5,-17(s0)
	li	a5,-268435456
	lbu	a4,-17(s0)
	sb	a4,0(a5)
	nop
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	myputchar, .-myputchar
	.align	2
	.globl	myputs
	.type	myputs, @function
myputs:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	zero,-20(s0)
	j	.L16
.L17:
	lw	a5,-20(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	mv	a0,a5
	call	myputchar
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L16:
	lw	a5,-20(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	bne	a5,zero,.L17
	lw	a5,-20(s0)
	mv	a0,a5
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	myputs, .-myputs
	.align	2
	.globl	init
	.type	init, @function
init:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	lw	a5,-36(s0)
	lw	a4,-40(s0)
	sw	a4,0(a5)
	li	a5,1
	sw	a5,-20(s0)
	j	.L20
.L21:
	lw	a5,-20(s0)
	slli	a5,a5,2
	lw	a4,-36(s0)
	add	a5,a4,a5
	sw	zero,0(a5)
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L20:
	lw	a4,-20(s0)
	li	a5,151
	ble	a4,a5,.L21
	nop
	nop
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	init, .-init
	.align	2
	.globl	top
	.type	top, @function
top:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	j	.L23
.L25:
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L23:
	lw	a4,-24(s0)
	li	a5,151
	bgt	a4,a5,.L24
	lw	a5,-24(s0)
	slli	a5,a5,2
	lw	a4,-20(s0)
	add	a5,a4,a5
	lw	a5,0(a5)
	beq	a5,zero,.L25
.L24:
	lw	a5,-24(s0)
	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	top, .-top
	.align	2
	.globl	ladd
	.type	ladd, @function
ladd:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	sw	s1,36(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	a2,-44(s0)
	sw	zero,-20(s0)
	li	a5,151
	sw	a5,-24(s0)
	j	.L28
.L29:
	lw	a5,-24(s0)
	slli	a5,a5,2
	lw	a4,-40(s0)
	add	a5,a4,a5
	lw	a4,0(a5)
	lw	a5,-24(s0)
	slli	a5,a5,2
	lw	a3,-44(s0)
	add	a5,a3,a5
	lw	a5,0(a5)
	add	a5,a4,a5
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-28(s0)
	lw	a4,-28(s0)
	li	a5,8192
	addi	a1,a5,1808
	mv	a0,a4
	call	__divsi3
	mv	a5,a0
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	slli	a5,a5,2
	lw	a4,-36(s0)
	add	s1,a4,a5
	lw	a4,-28(s0)
	li	a5,8192
	addi	a1,a5,1808
	mv	a0,a4
	call	__modsi3
	mv	a5,a0
	sw	a5,0(s1)
	lw	a5,-24(s0)
	addi	a5,a5,-1
	sw	a5,-24(s0)
.L28:
	lw	a5,-24(s0)
	bge	a5,zero,.L29
	nop
	nop
	lw	ra,44(sp)
	lw	s0,40(sp)
	lw	s1,36(sp)
	addi	sp,sp,48
	jr	ra
	.size	ladd, .-ladd
	.align	2
	.globl	lsub
	.type	lsub, @function
lsub:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	sw	s1,36(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	a2,-44(s0)
	li	a5,1
	sw	a5,-20(s0)
	li	a5,151
	sw	a5,-24(s0)
	j	.L31
.L32:
	lw	a5,-24(s0)
	slli	a5,a5,2
	lw	a4,-40(s0)
	add	a5,a4,a5
	lw	a4,0(a5)
	lw	a5,-24(s0)
	slli	a5,a5,2
	lw	a3,-44(s0)
	add	a5,a3,a5
	lw	a5,0(a5)
	li	a3,8192
	addi	a3,a3,1807
	sub	a5,a3,a5
	add	a5,a4,a5
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-28(s0)
	lw	a4,-28(s0)
	li	a5,8192
	addi	a1,a5,1808
	mv	a0,a4
	call	__divsi3
	mv	a5,a0
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	slli	a5,a5,2
	lw	a4,-36(s0)
	add	s1,a4,a5
	lw	a4,-28(s0)
	li	a5,8192
	addi	a1,a5,1808
	mv	a0,a4
	call	__modsi3
	mv	a5,a0
	sw	a5,0(s1)
	lw	a5,-24(s0)
	addi	a5,a5,-1
	sw	a5,-24(s0)
.L31:
	lw	a5,-24(s0)
	bge	a5,zero,.L32
	nop
	nop
	lw	ra,44(sp)
	lw	s0,40(sp)
	lw	s1,36(sp)
	addi	sp,sp,48
	jr	ra
	.size	lsub, .-lsub
	.align	2
	.globl	ldiv
	.type	ldiv, @function
ldiv:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	sw	s1,36(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	a2,-44(s0)
	sw	a3,-48(s0)
	sw	zero,-20(s0)
	lw	a5,-48(s0)
	sw	a5,-24(s0)
	j	.L34
.L35:
	lw	a4,-20(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,3
	sub	a5,a5,a4
	slli	a5,a5,4
	add	a5,a5,a4
	slli	a5,a5,4
	mv	a3,a5
	lw	a5,-24(s0)
	slli	a5,a5,2
	lw	a4,-40(s0)
	add	a5,a4,a5
	lw	a5,0(a5)
	add	a5,a3,a5
	sw	a5,-28(s0)
	lw	a5,-24(s0)
	slli	a5,a5,2
	lw	a4,-36(s0)
	add	s1,a4,a5
	lw	a1,-44(s0)
	lw	a0,-28(s0)
	call	__divsi3
	mv	a5,a0
	sw	a5,0(s1)
	lw	a5,-28(s0)
	lw	a1,-44(s0)
	mv	a0,a5
	call	__modsi3
	mv	a5,a0
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L34:
	lw	a4,-24(s0)
	li	a5,151
	ble	a4,a5,.L35
	nop
	nop
	lw	ra,44(sp)
	lw	s0,40(sp)
	lw	s1,36(sp)
	addi	sp,sp,48
	jr	ra
	.size	ldiv, .-ldiv
	.align	2
	.globl	marctan
	.type	marctan, @function
marctan:
	addi	sp,sp,-1264
	sw	ra,1260(sp)
	sw	s0,1256(sp)
	addi	s0,sp,1264
	sw	a0,-1252(s0)
	sw	a1,-1256(s0)
	sw	a2,-1260(s0)
	li	a1,0
	lw	a0,-1252(s0)
	call	init
	addi	a5,s0,-632
	lw	a1,-1256(s0)
	mv	a0,a5
	call	init
	addi	a4,s0,-632
	addi	a5,s0,-632
	li	a3,0
	lw	a2,-1260(s0)
	mv	a1,a4
	mv	a0,a5
	call	ldiv
	addi	a5,s0,-632
	li	a1,0
	mv	a0,a5
	call	top
	sw	a0,-20(s0)
	sw	zero,-24(s0)
	j	.L37
.L38:
	lw	a5,-24(s0)
	slli	a5,a5,2
	addi	a5,a5,-16
	add	a5,a5,s0
	sw	zero,-1224(a5)
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L37:
	lw	a4,-24(s0)
	lw	a5,-20(s0)
	blt	a4,a5,.L38
	addi	a5,s0,-632
	mv	a2,a5
	lw	a1,-1252(s0)
	lw	a0,-1252(s0)
	call	ladd
	li	a5,3
	sw	a5,-24(s0)
.L43:
	addi	a4,s0,-632
	addi	a5,s0,-632
	lw	a3,-20(s0)
	lw	a2,-1260(s0)
	mv	a1,a4
	mv	a0,a5
	call	ldiv
	addi	a4,s0,-632
	addi	a5,s0,-632
	lw	a3,-20(s0)
	lw	a2,-1260(s0)
	mv	a1,a4
	mv	a0,a5
	call	ldiv
	addi	a4,s0,-632
	addi	a5,s0,-1240
	lw	a3,-20(s0)
	lw	a2,-24(s0)
	mv	a1,a4
	mv	a0,a5
	call	ldiv
	addi	a5,s0,-632
	lw	a1,-20(s0)
	mv	a0,a5
	call	top
	sw	a0,-20(s0)
	addi	a5,s0,-1240
	lw	a1,-20(s0)
	mv	a0,a5
	call	top
	mv	a4,a0
	li	a5,152
	beq	a4,a5,.L45
	lw	a5,-24(s0)
	andi	a4,a5,3
	li	a5,1
	bne	a4,a5,.L41
	addi	a5,s0,-1240
	mv	a2,a5
	lw	a1,-1252(s0)
	lw	a0,-1252(s0)
	call	ladd
	j	.L42
.L41:
	addi	a5,s0,-1240
	mv	a2,a5
	lw	a1,-1252(s0)
	lw	a0,-1252(s0)
	call	lsub
.L42:
	lw	a5,-24(s0)
	addi	a5,a5,2
	sw	a5,-24(s0)
	j	.L43
.L45:
	nop
	nop
	lw	ra,1260(sp)
	lw	s0,1256(sp)
	addi	sp,sp,1264
	jr	ra
	.size	marctan, .-marctan
	.align	2
	.globl	showData
	.type	showData, @function
showData:
	addi	sp,sp,-64
	sw	ra,60(sp)
	sw	s0,56(sp)
	addi	s0,sp,64
	sw	a0,-52(s0)
	addi	a5,s0,-44
	addi	a5,a5,3
	sw	a5,-36(s0)
	sw	zero,-20(s0)
	j	.L47
.L48:
	lw	a5,-20(s0)
	addi	a5,a5,-16
	add	a5,a5,s0
	li	a4,48
	sb	a4,-28(a5)
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L47:
	lw	a4,-20(s0)
	li	a5,2
	ble	a4,a5,.L48
	lw	a5,-20(s0)
	addi	a5,a5,-16
	add	a5,a5,s0
	sb	zero,-28(a5)
	lw	a5,-52(s0)
	lw	a5,0(a5)
	li	a2,10
	mv	a1,a5
	lw	a0,-36(s0)
	call	numTostr
	lw	a0,-36(s0)
	call	myputs
	li	a0,46
	call	myputchar
	li	a0,10
	call	myputchar
	sw	zero,-24(s0)
	sw	zero,-28(s0)
	li	a5,1
	sw	a5,-20(s0)
	j	.L49
.L54:
	lw	a5,-20(s0)
	slli	a5,a5,2
	lw	a4,-52(s0)
	add	a5,a4,a5
	lw	a5,0(a5)
	li	a2,10
	mv	a1,a5
	lw	a0,-36(s0)
	call	numTostr
	mv	a5,a0
	addi	a5,a5,-4
	lw	a4,-36(s0)
	add	a5,a4,a5
	sw	a5,-32(s0)
	j	.L50
.L53:
	lw	a5,-32(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	call	myputchar
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
	lw	a5,-28(s0)
	addi	a5,a5,1
	sw	a5,-28(s0)
	lw	a4,-24(s0)
	li	a5,5
	bne	a4,a5,.L51
	li	a0,32
	call	myputchar
	sw	zero,-24(s0)
.L51:
	lw	a4,-28(s0)
	li	a5,40
	bne	a4,a5,.L52
	li	a0,10
	call	myputchar
	sw	zero,-28(s0)
.L52:
	lw	a5,-32(s0)
	addi	a5,a5,1
	sw	a5,-32(s0)
.L50:
	lw	a5,-32(s0)
	lbu	a5,0(a5)
	bne	a5,zero,.L53
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L49:
	lw	a4,-20(s0)
	li	a5,150
	ble	a4,a5,.L54
	nop
	nop
	lw	ra,60(sp)
	lw	s0,56(sp)
	addi	sp,sp,64
	jr	ra
	.size	showData, .-showData
	.align	2
	.globl	checkResult
	.type	checkResult, @function
checkResult:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	zero,-20(s0)
	j	.L56
.L59:
	lw	a5,-20(s0)
	slli	a5,a5,2
	lw	a4,-36(s0)
	add	a5,a4,a5
	lw	a4,0(a5)
	lw	a5,-20(s0)
	slli	a5,a5,2
	lw	a3,-40(s0)
	add	a5,a3,a5
	lw	a5,0(a5)
	beq	a4,a5,.L57
	li	a5,1
	j	.L58
.L57:
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L56:
	lw	a4,-20(s0)
	li	a5,151
	ble	a4,a5,.L59
	li	a5,0
.L58:
	mv	a0,a5
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	checkResult, .-checkResult
	.ident	"GCC: (g) 12.2.0"
