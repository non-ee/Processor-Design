	.file	"prime_test.c"
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
	.string	"Obtaining Prime Numbers ... \n"
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
	.word	2
	.word	3
	.word	5
	.word	7
	.word	11
	.word	13
	.word	17
	.word	19
	.word	23
	.word	29
	.word	31
	.word	37
	.word	41
	.word	43
	.word	47
	.word	53
	.word	59
	.word	61
	.word	67
	.word	71
	.word	73
	.word	79
	.word	83
	.word	89
	.word	97
	.word	101
	.word	103
	.word	107
	.word	109
	.word	113
	.word	127
	.word	131
	.word	137
	.word	139
	.word	149
	.word	151
	.word	157
	.word	163
	.word	167
	.word	173
	.text
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-352
	sw	ra,348(sp)
	sw	s0,344(sp)
	addi	s0,sp,352
	lui	a5,%hi(.LC0)
	addi	a4,a5,%lo(.LC0)
	addi	a5,s0,-344
	mv	a3,a4
	li	a4,160
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
	addi	a5,s0,-184
	li	a1,40
	mv	a0,a5
	call	getPrimeNumbers
	sw	a0,-20(s0)
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	myputs
	lui	a5,%hi(.LC4)
	addi	a0,a5,%lo(.LC4)
	call	myputs
	addi	a5,s0,-184
	lw	a1,-20(s0)
	mv	a0,a5
	call	showData
	addi	a4,s0,-344
	addi	a5,s0,-184
	lw	a2,-20(s0)
	mv	a1,a4
	mv	a0,a5
	call	checkResult
	sw	a0,-24(s0)
	lw	a5,-24(s0)
	bne	a5,zero,.L2
	lui	a5,%hi(.LC5)
	addi	a0,a5,%lo(.LC5)
	call	myputs
	j	.L3
.L2:
	lw	a4,-24(s0)
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
	lw	ra,348(sp)
	lw	s0,344(sp)
	addi	sp,sp,352
	jr	ra
	.size	main, .-main
	.globl	__umodsi3
	.align	2
	.globl	getPrimeNumbers
	.type	getPrimeNumbers, @function
getPrimeNumbers:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	lw	a5,-36(s0)
	li	a4,2
	sw	a4,0(a5)
	li	a5,1
	sw	a5,-28(s0)
	li	a5,2
	sw	a5,-20(s0)
	j	.L7
.L13:
	sw	zero,-24(s0)
	j	.L8
.L11:
	lw	a5,-24(s0)
	slli	a5,a5,2
	lw	a4,-36(s0)
	add	a5,a4,a5
	lw	a4,0(a5)
	lw	a5,-20(s0)
	mv	a1,a4
	mv	a0,a5
	call	__umodsi3
	mv	a5,a0
	beq	a5,zero,.L15
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L8:
	lw	a4,-24(s0)
	lw	a5,-28(s0)
	bltu	a4,a5,.L11
	j	.L10
.L15:
	nop
.L10:
	lw	a4,-24(s0)
	lw	a5,-28(s0)
	bne	a4,a5,.L12
	lw	a5,-28(s0)
	addi	a4,a5,1
	sw	a4,-28(s0)
	slli	a5,a5,2
	lw	a4,-36(s0)
	add	a5,a4,a5
	lw	a4,-20(s0)
	sw	a4,0(a5)
.L12:
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L7:
	lw	a5,-40(s0)
	lw	a4,-28(s0)
	bltu	a4,a5,.L13
	lw	a5,-28(s0)
	mv	a0,a5
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	getPrimeNumbers, .-getPrimeNumbers
	.align	2
	.globl	showData
	.type	showData, @function
showData:
	addi	sp,sp,-64
	sw	ra,60(sp)
	sw	s0,56(sp)
	addi	s0,sp,64
	sw	a0,-52(s0)
	sw	a1,-56(s0)
	sw	zero,-24(s0)
	sw	zero,-20(s0)
	j	.L17
.L19:
	lw	a5,-20(s0)
	slli	a5,a5,2
	lw	a4,-52(s0)
	add	a5,a4,a5
	lw	a5,0(a5)
	mv	a4,a5
	addi	a5,s0,-36
	li	a2,10
	mv	a1,a4
	mv	a0,a5
	call	numTostr
	addi	a5,s0,-36
	mv	a0,a5
	call	myputs
	li	a0,32
	call	myputchar
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
	lw	a4,-24(s0)
	li	a5,10
	bne	a4,a5,.L18
	li	a0,10
	call	myputchar
	sw	zero,-24(s0)
.L18:
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L17:
	lw	a4,-20(s0)
	lw	a5,-56(s0)
	blt	a4,a5,.L19
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
	sw	a2,-44(s0)
	sw	zero,-20(s0)
	j	.L21
.L24:
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
	beq	a4,a5,.L22
	li	a5,1
	j	.L23
.L22:
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L21:
	lw	a4,-20(s0)
	lw	a5,-44(s0)
	blt	a4,a5,.L24
	li	a5,0
.L23:
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
	j	.L26
.L27:
	lw	a1,-44(s0)
	lw	a0,-20(s0)
	call	__mulsi3
	mv	a5,a0
	sw	a5,-20(s0)
.L26:
	lw	a4,-20(s0)
	lw	a5,-40(s0)
	ble	a4,a5,.L27
	lw	a1,-44(s0)
	lw	a0,-20(s0)
	call	__divsi3
	mv	a5,a0
	sw	a5,-20(s0)
	j	.L28
.L31:
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
	bgtu	a4,a5,.L29
	lw	a5,-24(s0)
	addi	a4,a5,1
	sw	a4,-24(s0)
	lbu	a4,-25(s0)
	addi	a4,a4,48
	andi	a4,a4,0xff
	sb	a4,0(a5)
	j	.L30
.L29:
	lw	a5,-24(s0)
	addi	a4,a5,1
	sw	a4,-24(s0)
	lbu	a4,-25(s0)
	addi	a4,a4,87
	andi	a4,a4,0xff
	sb	a4,0(a5)
.L30:
	lw	a1,-44(s0)
	lw	a0,-20(s0)
	call	__divsi3
	mv	a5,a0
	sw	a5,-20(s0)
.L28:
	lw	a5,-20(s0)
	bne	a5,zero,.L31
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
	j	.L35
.L36:
	lw	a5,-20(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	mv	a0,a5
	call	myputchar
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L35:
	lw	a5,-20(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	bne	a5,zero,.L36
	lw	a5,-20(s0)
	mv	a0,a5
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	myputs, .-myputs
	.ident	"GCC: (g) 12.2.0"
