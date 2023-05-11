	.file	"pbmsrch_test.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.local	table
	.comm	table,1024,4
	.local	len
	.comm	len,4,4
	.local	findme
	.comm	findme,4,4
	.section	.rodata
	.align	2
.LC18:
	.string	"CHECK FAILED !!\n"
	.align	2
.LC19:
	.string	"CHECK PASSED !!\n"
	.align	2
.LC0:
	.string	"abb"
	.align	2
.LC1:
	.string	"you"
	.align	2
.LC2:
	.string	"not"
	.align	2
.LC3:
	.string	"it"
	.align	2
.LC4:
	.string	"dad"
	.align	2
.LC5:
	.string	"yoo"
	.align	2
.LC6:
	.string	"hoo"
	.align	2
.LC16:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	0
	.align	2
.LC8:
	.string	"cabbie"
	.align	2
.LC9:
	.string	"your"
	.align	2
.LC10:
	.string	"It isn't here"
	.align	2
.LC11:
	.string	"But it is here"
	.align	2
.LC12:
	.string	"hodad"
	.align	2
.LC13:
	.string	"yoohoo"
	.align	2
.LC17:
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.word	.LC13
	.word	.LC13
	.align	2
.LC15:
	.word	1
	.word	0
	.word	-1
	.word	4
	.word	2
	.word	0
	.word	3
	.text
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-112
	sw	ra,108(sp)
	sw	s0,104(sp)
	addi	s0,sp,112
	lui	a5,%hi(.LC16)
	addi	a5,a5,%lo(.LC16)
	lw	a7,0(a5)
	lw	a6,4(a5)
	lw	a0,8(a5)
	lw	a1,12(a5)
	lw	a2,16(a5)
	lw	a3,20(a5)
	lw	a4,24(a5)
	lw	a5,28(a5)
	sw	a7,-56(s0)
	sw	a6,-52(s0)
	sw	a0,-48(s0)
	sw	a1,-44(s0)
	sw	a2,-40(s0)
	sw	a3,-36(s0)
	sw	a4,-32(s0)
	sw	a5,-28(s0)
	lui	a5,%hi(.LC17)
	addi	a5,a5,%lo(.LC17)
	lw	a6,0(a5)
	lw	a0,4(a5)
	lw	a1,8(a5)
	lw	a2,12(a5)
	lw	a3,16(a5)
	lw	a4,20(a5)
	lw	a5,24(a5)
	sw	a6,-84(s0)
	sw	a0,-80(s0)
	sw	a1,-76(s0)
	sw	a2,-72(s0)
	sw	a3,-68(s0)
	sw	a4,-64(s0)
	sw	a5,-60(s0)
	lui	a5,%hi(.LC15)
	addi	a5,a5,%lo(.LC15)
	lw	a6,0(a5)
	lw	a0,4(a5)
	lw	a1,8(a5)
	lw	a2,12(a5)
	lw	a3,16(a5)
	lw	a4,20(a5)
	lw	a5,24(a5)
	sw	a6,-112(s0)
	sw	a0,-108(s0)
	sw	a1,-104(s0)
	sw	a2,-100(s0)
	sw	a3,-96(s0)
	sw	a4,-92(s0)
	sw	a5,-88(s0)
	sw	zero,-20(s0)
	j	.L2
.L4:
	lw	a5,-20(s0)
	slli	a5,a5,2
	addi	a5,a5,-16
	add	a5,a5,s0
	lw	a5,-40(a5)
	mv	a0,a5
	call	init_search
	lw	a5,-20(s0)
	slli	a5,a5,2
	addi	a5,a5,-16
	add	a5,a5,s0
	lw	a5,-68(a5)
	mv	a0,a5
	call	strsearch
	sw	a0,-24(s0)
	lw	a5,-20(s0)
	slli	a5,a5,2
	addi	a5,a5,-16
	add	a5,a5,s0
	lw	a5,-96(a5)
	lw	a4,-24(s0)
	beq	a4,a5,.L3
	lui	a5,%hi(.LC18)
	addi	a0,a5,%lo(.LC18)
	call	myputs
	li	a5,-16777216
	sw	zero,0(a5)
.L3:
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L2:
	lw	a5,-20(s0)
	slli	a5,a5,2
	addi	a5,a5,-16
	add	a5,a5,s0
	lw	a5,-40(a5)
	bne	a5,zero,.L4
	lw	a4,-20(s0)
	li	a5,7
	bne	a4,a5,.L5
	lui	a5,%hi(.LC19)
	addi	a0,a5,%lo(.LC19)
	call	myputs
	j	.L6
.L5:
	lui	a5,%hi(.LC18)
	addi	a0,a5,%lo(.LC18)
	call	myputs
.L6:
	li	a5,-16777216
	sw	zero,0(a5)
	li	a5,0
	mv	a0,a5
	lw	ra,108(sp)
	lw	s0,104(sp)
	addi	sp,sp,112
	jr	ra
	.size	main, .-main
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
	j	.L10
.L11:
	lw	a5,-20(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	mv	a0,a5
	call	myputchar
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L10:
	lw	a5,-20(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	bne	a5,zero,.L11
	lw	a5,-20(s0)
	mv	a0,a5
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	myputs, .-myputs
	.align	2
	.globl	mystrlen
	.type	mystrlen, @function
mystrlen:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	zero,-20(s0)
	j	.L14
.L15:
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L14:
	lw	a5,-20(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	bne	a5,zero,.L15
	lw	a5,-20(s0)
	mv	a0,a5
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	mystrlen, .-mystrlen
	.align	2
	.globl	mystrncmp
	.type	mystrncmp, @function
mystrncmp:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	a2,-44(s0)
	sw	zero,-20(s0)
	j	.L18
.L20:
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L18:
	lw	a5,-44(s0)
	addi	a4,a5,-1
	lw	a5,-20(s0)
	bleu	a4,a5,.L19
	lw	a5,-20(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a4,0(a5)
	lw	a5,-20(s0)
	lw	a3,-40(s0)
	add	a5,a3,a5
	lbu	a5,0(a5)
	bne	a4,a5,.L19
	lw	a5,-20(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	beq	a5,zero,.L19
	lw	a5,-20(s0)
	lw	a4,-40(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	bne	a5,zero,.L20
.L19:
	lw	a5,-20(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a4,0(a5)
	lw	a5,-20(s0)
	lw	a3,-40(s0)
	add	a5,a3,a5
	lbu	a5,0(a5)
	bleu	a4,a5,.L21
	li	a5,1
	j	.L22
.L21:
	lw	a5,-20(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a4,0(a5)
	lw	a5,-20(s0)
	lw	a3,-40(s0)
	add	a5,a3,a5
	lbu	a5,0(a5)
	bgeu	a4,a5,.L23
	li	a5,-1
	j	.L22
.L23:
	li	a5,0
.L22:
	mv	a0,a5
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	mystrncmp, .-mystrncmp
	.align	2
	.globl	init_search
	.type	init_search, @function
init_search:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	lw	a0,-36(s0)
	call	mystrlen
	mv	a4,a0
	lui	a5,%hi(len)
	sw	a4,%lo(len)(a5)
	sw	zero,-20(s0)
	j	.L25
.L26:
	lui	a5,%hi(len)
	lw	a4,%lo(len)(a5)
	lui	a5,%hi(table)
	addi	a3,a5,%lo(table)
	lw	a5,-20(s0)
	slli	a5,a5,2
	add	a5,a3,a5
	sw	a4,0(a5)
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L25:
	lw	a4,-20(s0)
	li	a5,255
	bleu	a4,a5,.L26
	sw	zero,-20(s0)
	j	.L27
.L28:
	lui	a5,%hi(len)
	lw	a4,%lo(len)(a5)
	lw	a5,-20(s0)
	sub	a5,a4,a5
	lw	a3,-36(s0)
	lw	a4,-20(s0)
	add	a4,a3,a4
	lbu	a4,0(a4)
	mv	a2,a4
	addi	a4,a5,-1
	lui	a5,%hi(table)
	addi	a3,a5,%lo(table)
	slli	a5,a2,2
	add	a5,a3,a5
	sw	a4,0(a5)
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L27:
	lui	a5,%hi(len)
	lw	a5,%lo(len)(a5)
	lw	a4,-20(s0)
	bltu	a4,a5,.L28
	lui	a5,%hi(findme)
	lw	a4,-36(s0)
	sw	a4,%lo(findme)(a5)
	nop
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	init_search, .-init_search
	.align	2
	.globl	strsearch
	.type	strsearch, @function
strsearch:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	sw	s1,36(sp)
	sw	s2,32(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	lui	a5,%hi(len)
	lw	a5,%lo(len)(a5)
	addi	s1,a5,-1
	lw	a0,-36(s0)
	call	mystrlen
	sw	a0,-20(s0)
	j	.L30
.L33:
	add	s1,s1,s2
.L31:
	lw	a5,-20(s0)
	bgeu	s1,a5,.L32
	lw	a5,-36(s0)
	add	a5,a5,s1
	lbu	a5,0(a5)
	mv	a3,a5
	lui	a5,%hi(table)
	addi	a4,a5,%lo(table)
	slli	a5,a3,2
	add	a5,a4,a5
	lw	s2,0(a5)
	bne	s2,zero,.L33
.L32:
	bne	s2,zero,.L30
	lui	a5,%hi(findme)
	lw	a3,%lo(findme)(a5)
	lui	a5,%hi(len)
	lw	a5,%lo(len)(a5)
	sub	a5,s1,a5
	addi	a5,a5,1
	lw	a4,-36(s0)
	add	a5,a4,a5
	sw	a5,-24(s0)
	lui	a5,%hi(len)
	lw	a5,%lo(len)(a5)
	mv	a2,a5
	lw	a1,-24(s0)
	mv	a0,a3
	call	mystrncmp
	mv	a5,a0
	bne	a5,zero,.L34
	lui	a5,%hi(len)
	lw	a5,%lo(len)(a5)
	sub	a5,s1,a5
	addi	a5,a5,1
	j	.L35
.L34:
	addi	s1,s1,1
.L30:
	lw	a5,-20(s0)
	bltu	s1,a5,.L31
	li	a5,-1
.L35:
	mv	a0,a5
	lw	ra,44(sp)
	lw	s0,40(sp)
	lw	s1,36(sp)
	lw	s2,32(sp)
	addi	sp,sp,48
	jr	ra
	.size	strsearch, .-strsearch
	.ident	"GCC: (g) 12.2.0"
