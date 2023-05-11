	.file	"bsort_test.c"
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
	.string	"Sorting ... \n"
	.align	2
.LC3:
	.string	"Complete !!\n"
	.align	2
.LC4:
	.string	"\nResult:\n"
	.align	2
.LC5:
	.string	"\nCHECK PASSED !!\n"
	.align	2
.LC6:
	.string	"\nCHECK FAILED !!\n"
	.align	2
.LC7:
	.string	"\nINVALID ??\n"
	.align	2
.LC0:
	.word	383
	.word	886
	.word	777
	.word	915
	.word	793
	.word	335
	.word	386
	.word	492
	.word	649
	.word	421
	.word	362
	.word	27
	.word	690
	.word	59
	.word	763
	.word	926
	.word	540
	.word	426
	.word	172
	.word	736
	.word	211
	.word	368
	.word	567
	.word	429
	.word	782
	.word	530
	.word	862
	.word	123
	.word	67
	.word	135
	.word	929
	.word	802
	.word	22
	.word	58
	.word	69
	.word	167
	.word	393
	.word	456
	.word	11
	.word	42
	.word	229
	.word	373
	.word	421
	.word	919
	.word	784
	.word	537
	.word	198
	.word	324
	.word	315
	.word	370
	.word	413
	.word	526
	.word	91
	.word	980
	.word	956
	.word	873
	.word	862
	.word	170
	.word	996
	.word	281
	.word	305
	.word	925
	.word	84
	.word	327
	.word	336
	.word	505
	.word	846
	.word	729
	.word	313
	.word	857
	.word	124
	.word	895
	.word	582
	.word	545
	.word	814
	.word	367
	.word	434
	.word	364
	.word	43
	.word	750
	.word	87
	.word	808
	.word	276
	.word	178
	.word	788
	.word	584
	.word	403
	.word	651
	.word	754
	.word	399
	.word	932
	.word	60
	.word	676
	.word	368
	.word	739
	.word	12
	.word	226
	.word	586
	.word	94
	.word	539
	.text
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-432
	sw	ra,428(sp)
	sw	s0,424(sp)
	addi	s0,sp,432
	lui	a5,%hi(.LC0)
	addi	a4,a5,%lo(.LC0)
	addi	a5,s0,-420
	mv	a3,a4
	li	a4,400
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
	addi	a5,s0,-420
	li	a1,100
	mv	a0,a5
	call	babbleSort
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	myputs
	lui	a5,%hi(.LC4)
	addi	a0,a5,%lo(.LC4)
	call	myputs
	addi	a5,s0,-420
	li	a1,100
	mv	a0,a5
	call	showData
	addi	a5,s0,-420
	li	a1,100
	mv	a0,a5
	call	checkResult
	sw	a0,-20(s0)
	lw	a5,-20(s0)
	bne	a5,zero,.L2
	lui	a5,%hi(.LC5)
	addi	a0,a5,%lo(.LC5)
	call	myputs
	j	.L3
.L2:
	lw	a4,-20(s0)
	li	a5,1
	bne	a4,a5,.L4
	lui	a5,%hi(.LC6)
	addi	a0,a5,%lo(.LC6)
	call	myputs
	j	.L3
.L4:
	lui	a5,%hi(.LC7)
	addi	a0,a5,%lo(.LC7)
	call	myputs
.L3:
	li	a5,-16777216
	sw	zero,0(a5)
	li	a5,0
	mv	a0,a5
	lw	ra,428(sp)
	lw	s0,424(sp)
	addi	sp,sp,432
	jr	ra
	.size	main, .-main
	.align	2
	.globl	babbleSort
	.type	babbleSort, @function
babbleSort:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	zero,-20(s0)
	j	.L7
.L11:
	sw	zero,-24(s0)
	j	.L8
.L10:
	lw	a5,-24(s0)
	slli	a5,a5,2
	lw	a4,-36(s0)
	add	a5,a4,a5
	lw	a4,0(a5)
	lw	a5,-24(s0)
	addi	a5,a5,1
	slli	a5,a5,2
	lw	a3,-36(s0)
	add	a5,a3,a5
	lw	a5,0(a5)
	ble	a4,a5,.L9
	lw	a5,-24(s0)
	slli	a5,a5,2
	lw	a4,-36(s0)
	add	a5,a4,a5
	lw	a5,0(a5)
	sw	a5,-28(s0)
	lw	a5,-24(s0)
	addi	a5,a5,1
	slli	a5,a5,2
	lw	a4,-36(s0)
	add	a4,a4,a5
	lw	a5,-24(s0)
	slli	a5,a5,2
	lw	a3,-36(s0)
	add	a5,a3,a5
	lw	a4,0(a4)
	sw	a4,0(a5)
	lw	a5,-24(s0)
	addi	a5,a5,1
	slli	a5,a5,2
	lw	a4,-36(s0)
	add	a5,a4,a5
	lw	a4,-28(s0)
	sw	a4,0(a5)
.L9:
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L8:
	lw	a4,-40(s0)
	lw	a5,-20(s0)
	sub	a5,a4,a5
	addi	a5,a5,-1
	lw	a4,-24(s0)
	blt	a4,a5,.L10
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L7:
	lw	a5,-40(s0)
	addi	a5,a5,-1
	lw	a4,-20(s0)
	blt	a4,a5,.L11
	nop
	nop
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	babbleSort, .-babbleSort
	.align	2
	.globl	showData
	.type	showData, @function
showData:
	addi	sp,sp,-176
	sw	ra,172(sp)
	sw	s0,168(sp)
	addi	s0,sp,176
	sw	a0,-164(s0)
	sw	a1,-168(s0)
	sw	zero,-24(s0)
	sw	zero,-20(s0)
	j	.L13
.L15:
	lw	a5,-20(s0)
	slli	a5,a5,2
	lw	a4,-164(s0)
	add	a5,a4,a5
	lw	a4,0(a5)
	addi	a5,s0,-152
	li	a2,10
	mv	a1,a4
	mv	a0,a5
	call	numTostr
	addi	a5,s0,-152
	mv	a0,a5
	call	myputs
	li	a0,32
	call	myputchar
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
	lw	a4,-24(s0)
	li	a5,10
	bne	a4,a5,.L14
	li	a0,10
	call	myputchar
	sw	zero,-24(s0)
.L14:
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L13:
	lw	a4,-20(s0)
	lw	a5,-168(s0)
	blt	a4,a5,.L15
	nop
	nop
	lw	ra,172(sp)
	lw	s0,168(sp)
	addi	sp,sp,176
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
	j	.L17
.L20:
	lw	a5,-20(s0)
	slli	a5,a5,2
	lw	a4,-36(s0)
	add	a5,a4,a5
	lw	a4,0(a5)
	lw	a5,-20(s0)
	addi	a5,a5,1
	slli	a5,a5,2
	lw	a3,-36(s0)
	add	a5,a3,a5
	lw	a5,0(a5)
	ble	a4,a5,.L18
	li	a5,1
	j	.L19
.L18:
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L17:
	lw	a5,-40(s0)
	addi	a5,a5,-1
	lw	a4,-20(s0)
	blt	a4,a5,.L20
	li	a5,0
.L19:
	mv	a0,a5
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	checkResult, .-checkResult
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
	j	.L22
.L23:
	lw	a1,-44(s0)
	lw	a0,-20(s0)
	call	__mulsi3
	mv	a5,a0
	sw	a5,-20(s0)
.L22:
	lw	a4,-20(s0)
	lw	a5,-40(s0)
	ble	a4,a5,.L23
	lw	a1,-44(s0)
	lw	a0,-20(s0)
	call	__divsi3
	mv	a5,a0
	sw	a5,-20(s0)
	j	.L24
.L27:
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
	bgtu	a4,a5,.L25
	lw	a5,-36(s0)
	addi	a4,a5,1
	sw	a4,-36(s0)
	lbu	a4,-25(s0)
	addi	a4,a4,48
	andi	a4,a4,0xff
	sb	a4,0(a5)
	j	.L26
.L25:
	lw	a5,-36(s0)
	addi	a4,a5,1
	sw	a4,-36(s0)
	lbu	a4,-25(s0)
	addi	a4,a4,87
	andi	a4,a4,0xff
	sb	a4,0(a5)
.L26:
	lw	a1,-44(s0)
	lw	a0,-20(s0)
	call	__divsi3
	mv	a5,a0
	sw	a5,-20(s0)
.L24:
	lw	a5,-20(s0)
	bne	a5,zero,.L27
	lw	a5,-36(s0)
	sb	zero,0(a5)
	lw	a4,-36(s0)
	lw	a5,-24(s0)
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
	j	.L31
.L32:
	lw	a5,-20(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	mv	a0,a5
	call	myputchar
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L31:
	lw	a5,-20(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	bne	a5,zero,.L32
	lw	a5,-20(s0)
	mv	a0,a5
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	myputs, .-myputs
	.ident	"GCC: (g) 12.2.0"
