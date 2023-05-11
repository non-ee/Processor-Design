	.file	"bitcnts_small.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.data
	.align	2
	.type	bits, @object
	.size	bits, 256
bits:
	.string	""
	.ascii	"\001\001\002\001\002\002\003\001\002\002\003\002\003\003\004"
	.ascii	"\001\002\002\003\002\003\003\004\002\003\003\004\003\004\004"
	.ascii	"\005\001\002\002\003\002\003\003\004\002\003\003\004\003\004"
	.ascii	"\004\005\002\003\003\004\003\004\004\005\003\004\004\005\004"
	.ascii	"\005\005\006\001\002\002\003\002\003\003\004\002\003\003\004"
	.ascii	"\003\004\004\005\002\003\003\004\003\004\004\005\003\004\004"
	.ascii	"\005\004\005\005\006\002\003\003\004\003\004\004\005\003\004"
	.ascii	"\004\005\004\005\005\006\003\004\004\005\004\005\005\006\004"
	.ascii	"\005\005\006\005\006\006\007\001\002\002\003\002\003\003\004"
	.ascii	"\002\003\003\004\003\004\004\005\002\003\003\004\003\004\004"
	.ascii	"\005\003\004\004\005\004\005\005\006\002\003\003\004\003\004"
	.ascii	"\004\005\003\004\004\005\004\005\005\006\003\004\004\005\004"
	.ascii	"\005\005\006\004\005\005\006\005\006\006\007\002\003\003\004"
	.ascii	"\003\004\004\005\003\004\004\005\004\005\005\006\003\004\004"
	.ascii	"\005\004\005\005\006\004\005\005\006\005\006\006\007\003\004"
	.ascii	"\004\005\004\005\005\006\004\005\005\006\005\006\006\007\004"
	.ascii	"\005\005\006\005\006\006\007\005\006\006\007\006\007\007\b"
	.section	.rodata
	.align	2
.LC11:
	.string	"Bit counter algorithm benchmark\n"
	.align	2
.LC12:
	.string	": "
	.align	2
.LC13:
	.string	"CHECK PASSED !!\n"
	.align	2
.LC14:
	.string	"CHECK FAILED !!\n"
	.align	2
.LC0:
	.string	"Optimized 1 bit/loop counter"
	.align	2
.LC1:
	.string	"Ratko's mystery algorithm"
	.align	2
.LC2:
	.string	"Recursive bit count by nybbles"
	.align	2
.LC3:
	.string	"Non-recursive bit count by nybbles"
	.align	2
.LC4:
	.string	"Non-recursive bit count by bytes (BW)"
	.align	2
.LC5:
	.string	"Non-recursive bit count by bytes (AR)"
	.align	2
.LC6:
	.string	"Shift and count bits"
	.align	2
.LC10:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.align	2
.LC8:
	.word	1804289383
	.word	846930886
	.word	1681692777
	.word	1714636915
	.word	1957747793
	.word	424238335
	.word	719885386
	.align	2
.LC9:
	.word	1250098
	.word	1099133
	.word	1064678
	.word	1193637
	.word	1280734
	.word	1095696
	.word	1237855
	.text
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-128
	sw	ra,124(sp)
	sw	s0,120(sp)
	addi	s0,sp,128
	lui	a5,%hi(.LC10)
	addi	a5,a5,%lo(.LC10)
	lw	a6,0(a5)
	lw	a0,4(a5)
	lw	a1,8(a5)
	lw	a2,12(a5)
	lw	a3,16(a5)
	lw	a4,20(a5)
	lw	a5,24(a5)
	sw	a6,-64(s0)
	sw	a0,-60(s0)
	sw	a1,-56(s0)
	sw	a2,-52(s0)
	sw	a3,-48(s0)
	sw	a4,-44(s0)
	sw	a5,-40(s0)
	li	a5,73728
	addi	a5,a5,1272
	sw	a5,-36(s0)
	lui	a5,%hi(.LC8)
	addi	a5,a5,%lo(.LC8)
	lw	a6,0(a5)
	lw	a0,4(a5)
	lw	a1,8(a5)
	lw	a2,12(a5)
	lw	a3,16(a5)
	lw	a4,20(a5)
	lw	a5,24(a5)
	sw	a6,-92(s0)
	sw	a0,-88(s0)
	sw	a1,-84(s0)
	sw	a2,-80(s0)
	sw	a3,-76(s0)
	sw	a4,-72(s0)
	sw	a5,-68(s0)
	lui	a5,%hi(.LC9)
	addi	a5,a5,%lo(.LC9)
	lw	a6,0(a5)
	lw	a0,4(a5)
	lw	a1,8(a5)
	lw	a2,12(a5)
	lw	a3,16(a5)
	lw	a4,20(a5)
	lw	a5,24(a5)
	sw	a6,-120(s0)
	sw	a0,-116(s0)
	sw	a1,-112(s0)
	sw	a2,-108(s0)
	sw	a3,-104(s0)
	sw	a4,-100(s0)
	sw	a5,-96(s0)
	lui	a5,%hi(.LC11)
	addi	a0,a5,%lo(.LC11)
	call	myputs
	sw	zero,-20(s0)
	j	.L2
.L28:
	lw	a5,-20(s0)
	andi	a5,a5,0xff
	addi	a5,a5,49
	andi	a5,a5,0xff
	mv	a0,a5
	call	myputchar
	lui	a5,%hi(.LC12)
	addi	a0,a5,%lo(.LC12)
	call	myputs
	lw	a5,-20(s0)
	slli	a5,a5,2
	addi	a5,a5,-16
	add	a5,a5,s0
	lw	a5,-48(a5)
	mv	a0,a5
	call	myputs
	li	a0,10
	call	myputchar
	sw	zero,-28(s0)
	lw	a5,-20(s0)
	slli	a5,a5,2
	addi	a5,a5,-16
	add	a5,a5,s0
	lw	a5,-76(a5)
	sw	a5,-32(s0)
	lw	a4,-20(s0)
	li	a5,6
	bgtu	a4,a5,.L3
	lw	a5,-20(s0)
	slli	a4,a5,2
	lui	a5,%hi(.L5)
	addi	a5,a5,%lo(.L5)
	add	a5,a4,a5
	lw	a5,0(a5)
	jr	a5
	.section	.rodata
	.align	2
	.align	2
.L5:
	.word	.L11
	.word	.L10
	.word	.L9
	.word	.L8
	.word	.L7
	.word	.L6
	.word	.L4
	.text
.L11:
	sw	zero,-24(s0)
	j	.L12
.L13:
	lw	a0,-32(s0)
	call	bit_count
	mv	a4,a0
	lw	a5,-28(s0)
	add	a5,a5,a4
	sw	a5,-28(s0)
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
	lw	a5,-32(s0)
	addi	a5,a5,13
	sw	a5,-32(s0)
.L12:
	lw	a4,-24(s0)
	lw	a5,-36(s0)
	blt	a4,a5,.L13
	j	.L3
.L10:
	sw	zero,-24(s0)
	j	.L14
.L15:
	lw	a0,-32(s0)
	call	bitcount
	mv	a4,a0
	lw	a5,-28(s0)
	add	a5,a5,a4
	sw	a5,-28(s0)
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
	lw	a5,-32(s0)
	addi	a5,a5,13
	sw	a5,-32(s0)
.L14:
	lw	a4,-24(s0)
	lw	a5,-36(s0)
	blt	a4,a5,.L15
	j	.L3
.L9:
	sw	zero,-24(s0)
	j	.L16
.L17:
	lw	a0,-32(s0)
	call	ntbl_bitcnt
	mv	a4,a0
	lw	a5,-28(s0)
	add	a5,a5,a4
	sw	a5,-28(s0)
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
	lw	a5,-32(s0)
	addi	a5,a5,13
	sw	a5,-32(s0)
.L16:
	lw	a4,-24(s0)
	lw	a5,-36(s0)
	blt	a4,a5,.L17
	j	.L3
.L8:
	sw	zero,-24(s0)
	j	.L18
.L19:
	lw	a0,-32(s0)
	call	ntbl_bitcount
	mv	a4,a0
	lw	a5,-28(s0)
	add	a5,a5,a4
	sw	a5,-28(s0)
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
	lw	a5,-32(s0)
	addi	a5,a5,13
	sw	a5,-32(s0)
.L18:
	lw	a4,-24(s0)
	lw	a5,-36(s0)
	blt	a4,a5,.L19
	j	.L3
.L7:
	sw	zero,-24(s0)
	j	.L20
.L21:
	lw	a0,-32(s0)
	call	BW_btbl_bitcount
	mv	a4,a0
	lw	a5,-28(s0)
	add	a5,a5,a4
	sw	a5,-28(s0)
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
	lw	a5,-32(s0)
	addi	a5,a5,13
	sw	a5,-32(s0)
.L20:
	lw	a4,-24(s0)
	lw	a5,-36(s0)
	blt	a4,a5,.L21
	j	.L3
.L6:
	sw	zero,-24(s0)
	j	.L22
.L23:
	lw	a0,-32(s0)
	call	AR_btbl_bitcount
	mv	a4,a0
	lw	a5,-28(s0)
	add	a5,a5,a4
	sw	a5,-28(s0)
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
	lw	a5,-32(s0)
	addi	a5,a5,13
	sw	a5,-32(s0)
.L22:
	lw	a4,-24(s0)
	lw	a5,-36(s0)
	blt	a4,a5,.L23
	j	.L3
.L4:
	sw	zero,-24(s0)
	j	.L24
.L25:
	lw	a0,-32(s0)
	call	bit_shifter
	mv	a4,a0
	lw	a5,-28(s0)
	add	a5,a5,a4
	sw	a5,-28(s0)
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
	lw	a5,-32(s0)
	addi	a5,a5,13
	sw	a5,-32(s0)
.L24:
	lw	a4,-24(s0)
	lw	a5,-36(s0)
	blt	a4,a5,.L25
	nop
.L3:
	lw	a5,-20(s0)
	slli	a5,a5,2
	addi	a5,a5,-16
	add	a5,a5,s0
	lw	a5,-104(a5)
	lw	a4,-28(s0)
	bne	a4,a5,.L26
	lui	a5,%hi(.LC13)
	addi	a0,a5,%lo(.LC13)
	call	myputs
	j	.L27
.L26:
	lui	a5,%hi(.LC14)
	addi	a0,a5,%lo(.LC14)
	call	myputs
.L27:
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L2:
	lw	a4,-20(s0)
	li	a5,6
	ble	a4,a5,.L28
	li	a5,-16777216
	sw	zero,0(a5)
	li	a5,0
	mv	a0,a5
	lw	ra,124(sp)
	lw	s0,120(sp)
	addi	sp,sp,128
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
	j	.L32
.L33:
	lw	a5,-20(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	mv	a0,a5
	call	myputchar
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L32:
	lw	a5,-20(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	bne	a5,zero,.L33
	lw	a5,-20(s0)
	mv	a0,a5
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	myputs, .-myputs
	.align	2
	.globl	bit_count
	.type	bit_count, @function
bit_count:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	zero,-20(s0)
	lw	a5,-36(s0)
	beq	a5,zero,.L36
.L37:
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
	lw	a5,-36(s0)
	addi	a5,a5,-1
	lw	a4,-36(s0)
	and	a5,a4,a5
	sw	a5,-36(s0)
	lw	a5,-36(s0)
	bne	a5,zero,.L37
.L36:
	lw	a5,-20(s0)
	mv	a0,a5
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	bit_count, .-bit_count
	.align	2
	.globl	bitcount
	.type	bitcount, @function
bitcount:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	lw	a5,-20(s0)
	srli	a4,a5,1
	li	a5,1431654400
	addi	a5,a5,1365
	and	a4,a4,a5
	lw	a3,-20(s0)
	li	a5,1431654400
	addi	a5,a5,1365
	and	a5,a3,a5
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	srli	a4,a5,2
	li	a5,858992640
	addi	a5,a5,819
	and	a4,a4,a5
	lw	a3,-20(s0)
	li	a5,858992640
	addi	a5,a5,819
	and	a5,a3,a5
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	srli	a4,a5,4
	li	a5,252645376
	addi	a5,a5,-241
	and	a4,a4,a5
	lw	a3,-20(s0)
	li	a5,252645376
	addi	a5,a5,-241
	and	a5,a3,a5
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	srli	a4,a5,8
	li	a5,16711680
	addi	a5,a5,255
	and	a4,a4,a5
	lw	a3,-20(s0)
	li	a5,16711680
	addi	a5,a5,255
	and	a5,a3,a5
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	srli	a4,a5,16
	lw	a3,-20(s0)
	li	a5,65536
	addi	a5,a5,-1
	and	a5,a3,a5
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	bitcount, .-bitcount
	.align	2
	.globl	ntbl_bitcnt
	.type	ntbl_bitcnt, @function
ntbl_bitcnt:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	lw	a5,-36(s0)
	andi	a5,a5,15
	lui	a4,%hi(bits)
	addi	a4,a4,%lo(bits)
	add	a5,a4,a5
	lbu	a5,0(a5)
	sw	a5,-20(s0)
	lw	a5,-36(s0)
	srai	a5,a5,4
	sw	a5,-36(s0)
	lw	a5,-36(s0)
	beq	a5,zero,.L42
	lw	a0,-36(s0)
	call	ntbl_bitcnt
	mv	a4,a0
	lw	a5,-20(s0)
	add	a5,a5,a4
	sw	a5,-20(s0)
.L42:
	lw	a5,-20(s0)
	mv	a0,a5
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	ntbl_bitcnt, .-ntbl_bitcnt
	.align	2
	.globl	ntbl_bitcount
	.type	ntbl_bitcount, @function
ntbl_bitcount:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	lw	a5,-20(s0)
	andi	a5,a5,15
	lui	a4,%hi(bits)
	addi	a4,a4,%lo(bits)
	add	a5,a4,a5
	lbu	a5,0(a5)
	mv	a3,a5
	lw	a5,-20(s0)
	srli	a5,a5,4
	andi	a5,a5,15
	lui	a4,%hi(bits)
	addi	a4,a4,%lo(bits)
	add	a5,a4,a5
	lbu	a5,0(a5)
	add	a5,a3,a5
	lw	a4,-20(s0)
	srli	a4,a4,8
	andi	a4,a4,15
	lui	a3,%hi(bits)
	addi	a3,a3,%lo(bits)
	add	a4,a3,a4
	lbu	a4,0(a4)
	add	a5,a5,a4
	lw	a4,-20(s0)
	srli	a4,a4,12
	andi	a4,a4,15
	lui	a3,%hi(bits)
	addi	a3,a3,%lo(bits)
	add	a4,a3,a4
	lbu	a4,0(a4)
	add	a5,a5,a4
	lw	a4,-20(s0)
	srli	a4,a4,16
	andi	a4,a4,15
	lui	a3,%hi(bits)
	addi	a3,a3,%lo(bits)
	add	a4,a3,a4
	lbu	a4,0(a4)
	add	a5,a5,a4
	lw	a4,-20(s0)
	srli	a4,a4,20
	andi	a4,a4,15
	lui	a3,%hi(bits)
	addi	a3,a3,%lo(bits)
	add	a4,a3,a4
	lbu	a4,0(a4)
	add	a5,a5,a4
	lw	a4,-20(s0)
	srli	a4,a4,24
	andi	a4,a4,15
	lui	a3,%hi(bits)
	addi	a3,a3,%lo(bits)
	add	a4,a3,a4
	lbu	a4,0(a4)
	add	a5,a5,a4
	lw	a4,-20(s0)
	srli	a4,a4,28
	mv	a3,a4
	lui	a4,%hi(bits)
	addi	a4,a4,%lo(bits)
	add	a4,a4,a3
	lbu	a4,0(a4)
	add	a5,a5,a4
	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	ntbl_bitcount, .-ntbl_bitcount
	.align	2
	.globl	BW_btbl_bitcount
	.type	BW_btbl_bitcount, @function
BW_btbl_bitcount:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	lw	a5,-36(s0)
	sw	a5,-20(s0)
	lbu	a5,-20(s0)
	mv	a4,a5
	lui	a5,%hi(bits)
	addi	a5,a5,%lo(bits)
	add	a5,a5,a4
	lbu	a5,0(a5)
	mv	a4,a5
	lbu	a5,-19(s0)
	mv	a3,a5
	lui	a5,%hi(bits)
	addi	a5,a5,%lo(bits)
	add	a5,a5,a3
	lbu	a5,0(a5)
	add	a5,a4,a5
	lbu	a4,-17(s0)
	mv	a3,a4
	lui	a4,%hi(bits)
	addi	a4,a4,%lo(bits)
	add	a4,a4,a3
	lbu	a4,0(a4)
	add	a5,a5,a4
	lbu	a4,-18(s0)
	mv	a3,a4
	lui	a4,%hi(bits)
	addi	a4,a4,%lo(bits)
	add	a4,a4,a3
	lbu	a4,0(a4)
	add	a5,a5,a4
	mv	a0,a5
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	BW_btbl_bitcount, .-BW_btbl_bitcount
	.align	2
	.globl	AR_btbl_bitcount
	.type	AR_btbl_bitcount, @function
AR_btbl_bitcount:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	addi	a5,s0,-36
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	addi	a4,a5,1
	sw	a4,-20(s0)
	lbu	a5,0(a5)
	mv	a4,a5
	lui	a5,%hi(bits)
	addi	a5,a5,%lo(bits)
	add	a5,a5,a4
	lbu	a5,0(a5)
	sw	a5,-24(s0)
	lw	a5,-20(s0)
	addi	a4,a5,1
	sw	a4,-20(s0)
	lbu	a5,0(a5)
	mv	a4,a5
	lui	a5,%hi(bits)
	addi	a5,a5,%lo(bits)
	add	a5,a5,a4
	lbu	a5,0(a5)
	mv	a4,a5
	lw	a5,-24(s0)
	add	a5,a5,a4
	sw	a5,-24(s0)
	lw	a5,-20(s0)
	addi	a4,a5,1
	sw	a4,-20(s0)
	lbu	a5,0(a5)
	mv	a4,a5
	lui	a5,%hi(bits)
	addi	a5,a5,%lo(bits)
	add	a5,a5,a4
	lbu	a5,0(a5)
	mv	a4,a5
	lw	a5,-24(s0)
	add	a5,a5,a4
	sw	a5,-24(s0)
	lw	a5,-20(s0)
	lbu	a5,0(a5)
	mv	a4,a5
	lui	a5,%hi(bits)
	addi	a5,a5,%lo(bits)
	add	a5,a5,a4
	lbu	a5,0(a5)
	mv	a4,a5
	lw	a5,-24(s0)
	add	a5,a5,a4
	sw	a5,-24(s0)
	lw	a5,-24(s0)
	mv	a0,a5
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	AR_btbl_bitcount, .-AR_btbl_bitcount
	.align	2
	.globl	bit_shifter
	.type	bit_shifter, @function
bit_shifter:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	zero,-24(s0)
	lw	a5,-24(s0)
	sw	a5,-20(s0)
	j	.L51
.L53:
	lw	a5,-36(s0)
	andi	a5,a5,1
	lw	a4,-24(s0)
	add	a5,a4,a5
	sw	a5,-24(s0)
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
	lw	a5,-36(s0)
	srai	a5,a5,1
	sw	a5,-36(s0)
.L51:
	lw	a5,-36(s0)
	beq	a5,zero,.L52
	lw	a4,-20(s0)
	li	a5,31
	bleu	a4,a5,.L53
.L52:
	lw	a5,-24(s0)
	mv	a0,a5
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	bit_shifter, .-bit_shifter
	.ident	"GCC: (g) 12.2.0"
