	.file	"pi_test.c"
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
	.word	784
	.text
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-320
	sw	ra,316(sp)
	sw	s0,312(sp)
	addi	s0,sp,320
	lui	a5,%hi(.LC0)
	addi	a4,a5,%lo(.LC0)
	addi	a5,s0,-308
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
	li	a2,5
	li	a1,16
	mv	a0,a5
	call	marctan
	addi	a5,s0,-164
	li	a2,239
	li	a1,4
	mv	a0,a5
	call	marctan
	addi	a3,s0,-164
	addi	a4,s0,-92
	addi	a5,s0,-236
	mv	a2,a3
	mv	a1,a4
	mv	a0,a5
	call	lsub
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	myputs
	lui	a5,%hi(.LC4)
	addi	a0,a5,%lo(.LC4)
	call	myputs
	addi	a5,s0,-236
	mv	a0,a5
	call	showData
	addi	a4,s0,-308
	addi	a5,s0,-236
	mv	a1,a4
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
	lw	ra,316(sp)
	lw	s0,312(sp)
	addi	sp,sp,320
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
	li	a5,17
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
	li	a5,17
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
	li	a5,17
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
	li	a5,17
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
	li	a5,17
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
	addi	sp,sp,-192
	sw	ra,188(sp)
	sw	s0,184(sp)
	addi	s0,sp,192
	sw	a0,-180(s0)
	sw	a1,-184(s0)
	sw	a2,-188(s0)
	li	a1,0
	lw	a0,-180(s0)
	call	init
	addi	a5,s0,-96
	lw	a1,-184(s0)
	mv	a0,a5
	call	init
	addi	a4,s0,-96
	addi	a5,s0,-96
	li	a3,0
	lw	a2,-188(s0)
	mv	a1,a4
	mv	a0,a5
	call	ldiv
	addi	a5,s0,-96
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
	sw	zero,-152(a5)
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L37:
	lw	a4,-24(s0)
	lw	a5,-20(s0)
	blt	a4,a5,.L38
	addi	a5,s0,-96
	mv	a2,a5
	lw	a1,-180(s0)
	lw	a0,-180(s0)
	call	ladd
	li	a5,3
	sw	a5,-24(s0)
.L43:
	addi	a4,s0,-96
	addi	a5,s0,-96
	lw	a3,-20(s0)
	lw	a2,-188(s0)
	mv	a1,a4
	mv	a0,a5
	call	ldiv
	addi	a4,s0,-96
	addi	a5,s0,-96
	lw	a3,-20(s0)
	lw	a2,-188(s0)
	mv	a1,a4
	mv	a0,a5
	call	ldiv
	addi	a4,s0,-96
	addi	a5,s0,-168
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
	addi	a5,s0,-168
	lw	a1,-20(s0)
	mv	a0,a5
	call	top
	mv	a4,a0
	li	a5,18
	beq	a4,a5,.L45
	lw	a5,-24(s0)
	andi	a4,a5,3
	li	a5,1
	bne	a4,a5,.L41
	addi	a5,s0,-168
	mv	a2,a5
	lw	a1,-180(s0)
	lw	a0,-180(s0)
	call	ladd
	j	.L42
.L41:
	addi	a5,s0,-168
	mv	a2,a5
	lw	a1,-180(s0)
	lw	a0,-180(s0)
	call	lsub
.L42:
	lw	a5,-24(s0)
	addi	a5,a5,2
	sw	a5,-24(s0)
	j	.L43
.L45:
	nop
	nop
	lw	ra,188(sp)
	lw	s0,184(sp)
	addi	sp,sp,192
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
	li	a5,4
	bne	a4,a5,.L51
	li	a0,32
	call	myputchar
	sw	zero,-24(s0)
.L51:
	lw	a4,-28(s0)
	li	a5,16
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
	li	a5,16
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
	li	a5,17
	ble	a4,a5,.L59
	li	a5,0
.L58:
	mv	a0,a5
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	checkResult, .-checkResult
	.ident	"GCC: (g) 12.2.0"
