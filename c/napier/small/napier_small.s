	.file	"napier_small.c"
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
	.word	2386
	.text
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-176
	sw	ra,172(sp)
	sw	s0,168(sp)
	addi	s0,sp,176
	lui	a5,%hi(.LC0)
	addi	a4,a5,%lo(.LC0)
	addi	a5,s0,-164
	mv	a3,a4
	li	a4,72
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
	addi	a5,s0,-92
	mv	a0,a5
	call	napier
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	myputs
	addi	a4,s0,-164
	addi	a5,s0,-92
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
	lw	ra,172(sp)
	lw	s0,168(sp)
	addi	sp,sp,176
	jr	ra
	.size	main, .-main
	.align	2
	.globl	mul
	.type	mul, @function
mul:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	zero,-20(s0)
	lw	a4,-36(s0)
	lw	a5,-40(s0)
	bge	a4,a5,.L8
	lw	a5,-36(s0)
	sw	a5,-24(s0)
	lw	a5,-40(s0)
	sw	a5,-36(s0)
	lw	a5,-24(s0)
	sw	a5,-40(s0)
	j	.L8
.L10:
	lw	a5,-40(s0)
	andi	a5,a5,1
	beq	a5,zero,.L9
	lw	a4,-20(s0)
	lw	a5,-36(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
.L9:
	lw	a5,-36(s0)
	slli	a5,a5,1
	sw	a5,-36(s0)
	lw	a5,-40(s0)
	srai	a5,a5,1
	sw	a5,-40(s0)
.L8:
	lw	a5,-40(s0)
	bne	a5,zero,.L10
	lw	a5,-20(s0)
	mv	a0,a5
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	mul, .-mul
	.align	2
	.globl	div
	.type	div, @function
div:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	zero,-20(s0)
	li	a5,1
	sw	a5,-24(s0)
	j	.L13
.L14:
	lw	a5,-24(s0)
	slli	a5,a5,1
	sw	a5,-24(s0)
	lw	a5,-40(s0)
	slli	a5,a5,1
	sw	a5,-40(s0)
.L13:
	lw	a4,-36(s0)
	lw	a5,-40(s0)
	bge	a4,a5,.L14
	lw	a5,-24(s0)
	srai	a5,a5,1
	sw	a5,-24(s0)
	lw	a5,-40(s0)
	srai	a5,a5,1
	sw	a5,-40(s0)
	j	.L15
.L17:
	lw	a4,-36(s0)
	lw	a5,-40(s0)
	blt	a4,a5,.L16
	lw	a4,-20(s0)
	lw	a5,-24(s0)
	or	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-36(s0)
	lw	a5,-40(s0)
	sub	a5,a4,a5
	sw	a5,-36(s0)
.L16:
	lw	a5,-24(s0)
	srai	a5,a5,1
	sw	a5,-24(s0)
	lw	a5,-40(s0)
	srai	a5,a5,1
	sw	a5,-40(s0)
.L15:
	lw	a5,-24(s0)
	bne	a5,zero,.L17
	lw	a5,-20(s0)
	mv	a0,a5
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	div, .-div
	.align	2
	.globl	rem
	.type	rem, @function
rem:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	li	a5,1
	sw	a5,-20(s0)
	j	.L20
.L21:
	lw	a5,-20(s0)
	slli	a5,a5,1
	sw	a5,-20(s0)
	lw	a5,-40(s0)
	slli	a5,a5,1
	sw	a5,-40(s0)
.L20:
	lw	a4,-36(s0)
	lw	a5,-40(s0)
	bge	a4,a5,.L21
	lw	a5,-20(s0)
	srai	a5,a5,1
	sw	a5,-20(s0)
	lw	a5,-40(s0)
	srai	a5,a5,1
	sw	a5,-40(s0)
	j	.L22
.L24:
	lw	a4,-36(s0)
	lw	a5,-40(s0)
	blt	a4,a5,.L23
	lw	a4,-36(s0)
	lw	a5,-40(s0)
	sub	a5,a4,a5
	sw	a5,-36(s0)
.L23:
	lw	a5,-20(s0)
	srai	a5,a5,1
	sw	a5,-20(s0)
	lw	a5,-40(s0)
	srai	a5,a5,1
	sw	a5,-40(s0)
.L22:
	lw	a5,-20(s0)
	bne	a5,zero,.L24
	lw	a5,-36(s0)
	mv	a0,a5
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	rem, .-rem
	.align	2
	.globl	divrem
	.type	divrem, @function
divrem:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	a2,-44(s0)
	sw	a3,-48(s0)
	sw	zero,-20(s0)
	li	a5,1
	sw	a5,-24(s0)
	j	.L27
.L28:
	lw	a5,-24(s0)
	slli	a5,a5,1
	sw	a5,-24(s0)
	lw	a5,-40(s0)
	slli	a5,a5,1
	sw	a5,-40(s0)
.L27:
	lw	a4,-36(s0)
	lw	a5,-40(s0)
	bge	a4,a5,.L28
	lw	a5,-24(s0)
	srai	a5,a5,1
	sw	a5,-24(s0)
	lw	a5,-40(s0)
	srai	a5,a5,1
	sw	a5,-40(s0)
	j	.L29
.L31:
	lw	a4,-36(s0)
	lw	a5,-40(s0)
	blt	a4,a5,.L30
	lw	a4,-20(s0)
	lw	a5,-24(s0)
	or	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-36(s0)
	lw	a5,-40(s0)
	sub	a5,a4,a5
	sw	a5,-36(s0)
.L30:
	lw	a5,-24(s0)
	srai	a5,a5,1
	sw	a5,-24(s0)
	lw	a5,-40(s0)
	srai	a5,a5,1
	sw	a5,-40(s0)
.L29:
	lw	a5,-24(s0)
	bne	a5,zero,.L31
	lw	a5,-44(s0)
	lw	a4,-20(s0)
	sw	a4,0(a5)
	lw	a5,-48(s0)
	lw	a4,-36(s0)
	sw	a4,0(a5)
	nop
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	divrem, .-divrem
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
	j	.L33
.L34:
	lw	a1,-44(s0)
	lw	a0,-20(s0)
	call	mul
	sw	a0,-20(s0)
.L33:
	lw	a4,-20(s0)
	lw	a5,-40(s0)
	ble	a4,a5,.L34
	lw	a1,-44(s0)
	lw	a0,-20(s0)
	call	div
	sw	a0,-20(s0)
	j	.L35
.L38:
	lw	a1,-20(s0)
	lw	a0,-40(s0)
	call	div
	mv	a5,a0
	sb	a5,-25(s0)
	lw	a1,-20(s0)
	lw	a0,-40(s0)
	call	rem
	sw	a0,-40(s0)
	lbu	a4,-25(s0)
	li	a5,9
	bgtu	a4,a5,.L36
	lw	a5,-24(s0)
	addi	a4,a5,1
	sw	a4,-24(s0)
	lbu	a4,-25(s0)
	addi	a4,a4,48
	andi	a4,a4,0xff
	sb	a4,0(a5)
	j	.L37
.L36:
	lw	a5,-24(s0)
	addi	a4,a5,1
	sw	a4,-24(s0)
	lbu	a4,-25(s0)
	addi	a4,a4,87
	andi	a4,a4,0xff
	sb	a4,0(a5)
.L37:
	lw	a1,-44(s0)
	lw	a0,-20(s0)
	call	div
	sw	a0,-20(s0)
.L35:
	lw	a5,-20(s0)
	bne	a5,zero,.L38
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
	j	.L42
.L43:
	lw	a5,-20(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	mv	a0,a5
	call	myputchar
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L42:
	lw	a5,-20(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	bne	a5,zero,.L43
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
	j	.L46
.L47:
	lw	a5,-20(s0)
	slli	a5,a5,2
	lw	a4,-36(s0)
	add	a5,a4,a5
	sw	zero,0(a5)
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L46:
	lw	a4,-20(s0)
	li	a5,17
	ble	a4,a5,.L47
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
	j	.L49
.L51:
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L49:
	lw	a4,-24(s0)
	li	a5,17
	bgt	a4,a5,.L50
	lw	a5,-24(s0)
	slli	a5,a5,2
	lw	a4,-20(s0)
	add	a5,a4,a5
	lw	a5,0(a5)
	beq	a5,zero,.L51
.L50:
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
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	a2,-44(s0)
	sw	zero,-28(s0)
	li	a5,17
	sw	a5,-20(s0)
	j	.L54
.L55:
	lw	a5,-20(s0)
	slli	a5,a5,2
	lw	a4,-40(s0)
	add	a5,a4,a5
	lw	a4,0(a5)
	lw	a5,-20(s0)
	slli	a5,a5,2
	lw	a3,-44(s0)
	add	a5,a3,a5
	lw	a5,0(a5)
	add	a4,a4,a5
	lw	a5,-28(s0)
	add	a5,a4,a5
	sw	a5,-24(s0)
	lw	a5,-20(s0)
	slli	a5,a5,2
	lw	a4,-36(s0)
	add	a4,a4,a5
	addi	a5,s0,-28
	mv	a3,a4
	mv	a2,a5
	li	a5,8192
	addi	a1,a5,1808
	lw	a0,-24(s0)
	call	divrem
	lw	a5,-20(s0)
	addi	a5,a5,-1
	sw	a5,-20(s0)
.L54:
	lw	a5,-20(s0)
	bge	a5,zero,.L55
	nop
	nop
	lw	ra,44(sp)
	lw	s0,40(sp)
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
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	a2,-44(s0)
	sw	a3,-48(s0)
	sw	zero,-28(s0)
	lw	a5,-48(s0)
	sw	a5,-20(s0)
	j	.L57
.L58:
	lw	a4,-28(s0)
	li	a5,8192
	addi	a1,a5,1808
	mv	a0,a4
	call	mul
	mv	a3,a0
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
.L57:
	lw	a4,-20(s0)
	li	a5,17
	ble	a4,a5,.L58
	nop
	nop
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	ldiv, .-ldiv
	.align	2
	.globl	napier
	.type	napier, @function
napier:
	addi	sp,sp,-112
	sw	ra,108(sp)
	sw	s0,104(sp)
	addi	s0,sp,112
	sw	a0,-100(s0)
	li	a1,2
	lw	a0,-100(s0)
	call	init
	addi	a5,s0,-96
	li	a1,1
	mv	a0,a5
	call	init
	sw	zero,-20(s0)
	li	a5,2
	sw	a5,-24(s0)
.L62:
	addi	a4,s0,-96
	addi	a5,s0,-96
	lw	a3,-20(s0)
	lw	a2,-24(s0)
	mv	a1,a4
	mv	a0,a5
	call	ldiv
	addi	a5,s0,-96
	lw	a1,-20(s0)
	mv	a0,a5
	call	top
	sw	a0,-20(s0)
	lw	a4,-20(s0)
	li	a5,18
	beq	a4,a5,.L64
	addi	a5,s0,-96
	mv	a2,a5
	lw	a1,-100(s0)
	lw	a0,-100(s0)
	call	ladd
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
	j	.L62
.L64:
	nop
	nop
	lw	ra,108(sp)
	lw	s0,104(sp)
	addi	sp,sp,112
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
	j	.L66
.L67:
	lw	a5,-20(s0)
	addi	a5,a5,-16
	add	a5,a5,s0
	li	a4,48
	sb	a4,-28(a5)
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L66:
	lw	a4,-20(s0)
	li	a5,2
	ble	a4,a5,.L67
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
	j	.L68
.L73:
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
	j	.L69
.L72:
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
	li	a5,4
	bne	a4,a5,.L70
	li	a0,32
	call	myputchar
	sw	zero,-24(s0)
.L70:
	lw	a4,-28(s0)
	li	a5,16
	bne	a4,a5,.L71
	li	a0,10
	call	myputchar
	sw	zero,-28(s0)
.L71:
	lw	a5,-32(s0)
	addi	a5,a5,1
	sw	a5,-32(s0)
.L69:
	lw	a5,-32(s0)
	lbu	a5,0(a5)
	bne	a5,zero,.L72
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L68:
	lw	a4,-20(s0)
	li	a5,16
	ble	a4,a5,.L73
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
	j	.L75
.L78:
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
	beq	a4,a5,.L76
	li	a5,1
	j	.L77
.L76:
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L75:
	lw	a4,-20(s0)
	li	a5,17
	ble	a4,a5,.L78
	li	a5,0
.L77:
	mv	a0,a5
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	checkResult, .-checkResult
	.ident	"GCC: (g) 12.2.0"
