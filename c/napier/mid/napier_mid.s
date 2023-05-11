	.file	"napier_mid.c"
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
	.string	"Calculating Napier's constant ... \n"
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
	.word	2
	.word	7182
	.word	8182
	.word	8459
	.word	452
	.word	3536
	.word	287
	.word	4713
	.word	5266
	.word	2497
	.word	7572
	.word	4709
	.word	3699
	.word	9595
	.word	7496
	.word	6967
	.word	6277
	.word	2407
	.word	6630
	.word	3535
	.word	4759
	.word	4571
	.word	3821
	.word	7852
	.word	5166
	.word	4274
	.word	2746
	.word	6391
	.word	9320
	.word	305
	.word	9921
	.word	8174
	.word	1359
	.word	6629
	.word	435
	.word	7290
	.word	334
	.word	2952
	.word	6059
	.word	5630
	.word	7381
	.word	3232
	.word	8627
	.word	9434
	.word	9076
	.word	3233
	.word	8298
	.word	8075
	.word	3195
	.word	2510
	.word	1901
	.word	1573
	.word	8341
	.word	8793
	.word	702
	.word	1540
	.word	8914
	.word	9934
	.word	8841
	.word	6750
	.word	9244
	.word	7614
	.word	6066
	.word	8082
	.word	2648
	.word	16
	.word	8477
	.word	4118
	.word	5374
	.word	2345
	.word	4424
	.word	3710
	.word	7539
	.word	777
	.word	4499
	.word	2069
	.word	5517
	.word	276
	.word	1838
	.word	6062
	.word	6133
	.word	1384
	.word	5830
	.word	75
	.word	2044
	.word	9338
	.word	2656
	.word	297
	.word	6067
	.word	3711
	.word	3200
	.word	7093
	.word	2870
	.word	9127
	.word	4437
	.word	4704
	.word	7230
	.word	6969
	.word	7720
	.word	9310
	.word	1416
	.word	9283
	.word	6819
	.word	255
	.word	1510
	.word	8657
	.word	4637
	.word	7211
	.word	1252
	.word	3897
	.word	8442
	.word	5056
	.word	9536
	.word	9677
	.word	785
	.word	4499
	.word	6996
	.word	7946
	.word	8644
	.word	5490
	.word	5987
	.word	9316
	.word	3688
	.word	9230
	.word	987
	.word	9312
	.word	7736
	.word	1782
	.word	1542
	.word	4999
	.word	2295
	.word	7635
	.word	1482
	.word	2082
	.word	6989
	.word	5193
	.word	6680
	.word	3318
	.word	2528
	.word	8693
	.word	9849
	.word	6465
	.word	1058
	.word	2093
	.word	9239
	.word	8294
	.word	8879
	.word	3320
	.word	3625
	.word	944
	.word	3117
	.word	3012
	.word	3819
	.word	7068
	.word	4161
	.word	4039
	.word	7019
	.word	8376
	.word	7932
	.word	683
	.word	2823
	.word	7646
	.word	4804
	.word	2953
	.word	1180
	.word	2328
	.word	7825
	.word	981
	.word	9455
	.word	8153
	.word	175
	.word	6717
	.word	3613
	.word	3206
	.word	9811
	.word	2509
	.word	9618
	.word	1881
	.word	5930
	.word	4169
	.word	351
	.word	5988
	.word	8851
	.word	9345
	.word	8072
	.word	7386
	.word	6738
	.word	5894
	.word	2287
	.word	9228
	.word	4998
	.word	9208
	.word	6805
	.word	8257
	.word	4927
	.word	9610
	.word	4841
	.word	9844
	.word	4363
	.word	4632
	.word	4496
	.word	8487
	.word	5602
	.word	3362
	.word	4827
	.word	419
	.word	7862
	.word	3209
	.word	21
	.word	6099
	.word	235
	.word	3043
	.word	6994
	.word	1849
	.word	1463
	.word	1409
	.word	3431
	.word	7381
	.word	4364
	.word	546
	.word	2531
	.word	5209
	.word	6183
	.word	6908
	.word	8870
	.word	7016
	.word	7683
	.word	9642
	.word	4378
	.word	1405
	.word	9271
	.word	4563
	.word	5490
	.word	6130
	.word	3107
	.word	2085
	.word	1038
	.word	3750
	.word	5101
	.word	1574
	.word	7704
	.word	1718
	.word	9861
	.word	687
	.word	3969
	.word	6552
	.word	1267
	.word	1546
	.word	8895
	.word	7035
	.word	353
	.word	9999
	.text
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-2032
	sw	ra,2028(sp)
	sw	s0,2024(sp)
	addi	s0,sp,2032
	addi	sp,sp,-16
	lui	a5,%hi(.LC0)
	addi	a4,a5,%lo(.LC0)
	addi	a5,s0,-2036
	mv	a3,a4
	li	a4,1008
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
	addi	a5,s0,-1028
	mv	a0,a5
	call	napier
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	myputs
	addi	a4,s0,-2036
	addi	a5,s0,-1028
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
	addi	sp,sp,16
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
	li	a5,251
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
	li	a5,251
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
	li	a5,251
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
	sw	zero,-28(s0)
	lw	a5,-48(s0)
	sw	a5,-20(s0)
	j	.L31
.L32:
	lw	a4,-28(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,3
	sub	a5,a5,a4
	slli	a5,a5,4
	add	a5,a5,a4
	slli	a5,a5,4
	mv	a3,a5
	lw	a5,-20(s0)
	slli	a5,a5,2
	lw	a4,-40(s0)
	add	a5,a4,a5
	lw	a5,0(a5)
	add	a5,a3,a5
	sw	a5,-24(s0)
	lw	a5,-20(s0)
	slli	a5,a5,2
	lw	a4,-36(s0)
	add	s1,a4,a5
	lw	a1,-44(s0)
	lw	a0,-24(s0)
	call	__divsi3
	mv	a5,a0
	sw	a5,0(s1)
	lw	a5,-24(s0)
	lw	a1,-44(s0)
	mv	a0,a5
	call	__modsi3
	mv	a5,a0
	sw	a5,-28(s0)
	lw	a5,-20(s0)
	slli	a5,a5,2
	lw	a4,-36(s0)
	add	a5,a4,a5
	addi	a4,s0,-28
	mv	a3,a4
	mv	a2,a5
	lw	a1,-44(s0)
	lw	a0,-24(s0)
	call	divrem
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L31:
	lw	a4,-20(s0)
	li	a5,251
	ble	a4,a5,.L32
	nop
	nop
	lw	ra,44(sp)
	lw	s0,40(sp)
	lw	s1,36(sp)
	addi	sp,sp,48
	jr	ra
	.size	ldiv, .-ldiv
	.align	2
	.globl	napier
	.type	napier, @function
napier:
	addi	sp,sp,-1056
	sw	ra,1052(sp)
	sw	s0,1048(sp)
	addi	s0,sp,1056
	sw	a0,-1044(s0)
	li	a1,2
	lw	a0,-1044(s0)
	call	init
	addi	a5,s0,-1032
	li	a1,1
	mv	a0,a5
	call	init
	sw	zero,-20(s0)
	li	a5,2
	sw	a5,-24(s0)
.L36:
	addi	a4,s0,-1032
	addi	a5,s0,-1032
	lw	a3,-20(s0)
	lw	a2,-24(s0)
	mv	a1,a4
	mv	a0,a5
	call	ldiv
	addi	a5,s0,-1032
	lw	a1,-20(s0)
	mv	a0,a5
	call	top
	sw	a0,-20(s0)
	lw	a4,-20(s0)
	li	a5,252
	beq	a4,a5,.L38
	addi	a5,s0,-1032
	mv	a2,a5
	lw	a1,-1044(s0)
	lw	a0,-1044(s0)
	call	ladd
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
	j	.L36
.L38:
	nop
	nop
	lw	ra,1052(sp)
	lw	s0,1048(sp)
	addi	sp,sp,1056
	jr	ra
	.size	napier, .-napier
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
	j	.L40
.L41:
	lw	a5,-20(s0)
	addi	a5,a5,-16
	add	a5,a5,s0
	li	a4,48
	sb	a4,-28(a5)
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L40:
	lw	a4,-20(s0)
	li	a5,2
	ble	a4,a5,.L41
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
	j	.L42
.L47:
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
	j	.L43
.L46:
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
	li	a5,10
	bne	a4,a5,.L44
	li	a0,32
	call	myputchar
	sw	zero,-24(s0)
.L44:
	lw	a4,-28(s0)
	li	a5,100
	bne	a4,a5,.L45
	li	a0,10
	call	myputchar
	sw	zero,-28(s0)
.L45:
	lw	a5,-32(s0)
	addi	a5,a5,1
	sw	a5,-32(s0)
.L43:
	lw	a5,-32(s0)
	lbu	a5,0(a5)
	bne	a5,zero,.L46
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L42:
	lw	a4,-20(s0)
	li	a5,250
	ble	a4,a5,.L47
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
	j	.L49
.L52:
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
	beq	a4,a5,.L50
	li	a5,1
	j	.L51
.L50:
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L49:
	lw	a4,-20(s0)
	li	a5,251
	ble	a4,a5,.L52
	li	a5,0
.L51:
	mv	a0,a5
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	checkResult, .-checkResult
	.ident	"GCC: (g) 12.2.0"
