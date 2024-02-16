	.text
	.globl	_Znwm
_Znwm:
.LFB3814:
	lui	a2,%hi(_ZN6memoryL9heapStartE)	
	ld	a3,%lo(_ZN6memoryL9heapStartE)(a2)		
	addi	a4,a0,7	
	andi	a4,a4,-8	
	beq	a3,zero,.L2	
	mv	a0,a3	
.L5:
	lbu	a5,8(a0)	
	bne	a5,zero,.L3	
	ld	a5,0(a0)		
	bgtu	a4,a5,.L3	
	addi	a0,a0,24	
	ret	
.L3:
	ld	a0,16(a0)		
	bne	a0,zero,.L5	
.L2:
	li	a5,0		
	addi a7, zero, 9
	add a0, zero, a5	
	ecall
	mv a5, a0	
	addi	a1,a4,24	
	addi a7, zero, 9
	add a0, zero, a1	
	ecall
	mv a1, a0	
	li	a0,-1		
	beq	a1,a0,.L6	
	sd	a4,0(a5)	
	li	a4,1		
	sb	a4,8(a5)	
	beq	a3,zero,.L18	
.L7:
	lui	a4,%hi(_ZN6memoryL3topE)	
	ld	a3,%lo(_ZN6memoryL3topE)(a4)		
	beq	a3,zero,.L8	
	sd	a5,16(a3)	
.L8:
	sd	a5,%lo(_ZN6memoryL3topE)(a4)	
	addi	a0,a5,24	
	ret	
.L18:
	sd	a5,%lo(_ZN6memoryL9heapStartE)(a2)	
	j	.L7		
.L6:
	sd	zero,0(zero)	
	ebreak	
.LFE3814:
	.globl	_ZdlPv
_ZdlPv:
.LFB3815:
	sb	zero,-16(a0)	
	ret	
.LFE3815:
	.globl	_Znam
_Znam:
.LFB4526:
	lui	a2,%hi(_ZN6memoryL9heapStartE)	
	ld	a3,%lo(_ZN6memoryL9heapStartE)(a2)		
	addi	a4,a0,7	
	andi	a4,a4,-8	
	beq	a3,zero,.L21	
	mv	a0,a3	
.L24:
	lbu	a5,8(a0)	
	bne	a5,zero,.L22	
	ld	a5,0(a0)		
	bgtu	a4,a5,.L22	
	addi	a0,a0,24	
	ret	
.L22:
	ld	a0,16(a0)		
	bne	a0,zero,.L24	
.L21:
	li	a5,0		
	addi a7, zero, 9
	add a0, zero, a5	
	ecall
	mv a5, a0	
	addi	a1,a4,24	
	addi a7, zero, 9
	add a0, zero, a1	
	ecall
	mv a1, a0	
	li	a0,-1		
	beq	a1,a0,.L25	
	sd	a4,0(a5)	
	li	a4,1		
	sb	a4,8(a5)	
	beq	a3,zero,.L36	
.L26:
	lui	a4,%hi(_ZN6memoryL3topE)	
	ld	a3,%lo(_ZN6memoryL3topE)(a4)		
	beq	a3,zero,.L27	
	sd	a5,16(a3)	
.L27:
	sd	a5,%lo(_ZN6memoryL3topE)(a4)	
	addi	a0,a5,24	
	ret	
.L36:
	sd	a5,%lo(_ZN6memoryL9heapStartE)(a2)	
	j	.L26		
.L25:
	sd	zero,0(zero)	
	ebreak	
.LFE4526:
	.globl	_ZdaPv
_ZdaPv:
.LFB4528:
	sb	zero,-16(a0)	
	ret	
.LFE4528:
_ZN4rstd3vecIiEC2Em:
.LFB4125:
	addi	sp,sp,-80	
	sd	s3,40(sp)	
	sd	s6,16(sp)	
	sd	s7,8(sp)	
	sd	ra,72(sp)	
	sd	zero,0(a0)	
	sd	zero,8(a0)	
	sd	zero,16(a0)	
	mv	s3,a0	
	mv	s6,a1	
	li	s7,1		
	beq	a1,zero,.L39	
	mv	s7,a1	
.L39:
	li	a5,-9		
	srli	a5,a5,3	
	bgtu	s6,a5,.L40	
	slli	a0,s7,2	
	sd	s1,56(sp)	
	sd	s2,48(sp)	
	sd	s4,32(sp)	
	sd	s5,24(sp)	
	call	_Znwm		
	sd	a0,0(s3)	
	sd	s7,16(s3)	
	mv	s2,a0	
	li	s1,0		
	li	s4,0		
	li	s5,8		
	beq	s6,zero,.L38	
	sd	s0,64(sp)	
	sd	s8,0(sp)	
.L41:
	add	a5,s2,s1	
	addi	s0,s4,1	
	sd	s0,8(s3)	
	sw	zero,0(a5)	
	addi	s1,s1,4	
	beq	s6,s0,.L69	
	beq	s7,s0,.L70	
	mv	s4,s0	
	j	.L41		
.L70:
	slli	s8,s7,1	
	beq	s2,zero,.L71	
	slli	a0,s0,3	
	call	_Znwm		
	bleu	s4,s5,.L44	
	or	a5,s2,a0	
	andi	a5,a5,7	
	bne	a5,zero,.L44	
	addi	a5,s2,4	
	beq	a0,a5,.L44	
	srli	a2,s0,1	
	slli	a2,a2,3	
	mv	a5,s2	
	mv	a4,a0	
	add	a2,a2,s2	
.L45:
	ld	a3,0(a5)		
	addi	a5,a5,8	
	addi	a4,a4,8	
	sd	a3,-8(a4)	
	bne	a5,a2,.L45	
	andi	a4,s0,1	
	andi	a5,s0,-2	
	beq	a4,zero,.L49	
	slli	a5,a5,2	
	add	a4,s2,a5	
	lw	a4,0(a4)		
	add	a5,a0,a5	
	sw	a4,0(a5)	
.L49:
	sb	zero,-16(s2)	
	sd	s8,16(s3)	
	sd	a0,0(s3)	
	mv	s7,s8	
	mv	s2,a0	
	mv	s4,s0	
	j	.L41		
.L69:
	ld	s0,64(sp)		
	ld	s8,0(sp)		
.L38:
	ld	ra,72(sp)		
	ld	s1,56(sp)		
	ld	s2,48(sp)		
	ld	s4,32(sp)		
	ld	s5,24(sp)		
	ld	s3,40(sp)		
	ld	s6,16(sp)		
	ld	s7,8(sp)		
	addi	sp,sp,80	
	jr	ra		
.L44:
	mv	a5,s2	
	mv	a4,a0	
	add	a2,s2,s1	
.L48:
	lw	a3,0(a5)		
	addi	a5,a5,4	
	addi	a4,a4,4	
	sw	a3,-4(a4)	
	bne	a5,a2,.L48	
	j	.L49		
.L71:
	slli	a0,s7,3	
	call	_Znwm		
	mv	s2,a0	
	sd	a0,0(s3)	
	sd	s8,16(s3)	
	mv	s7,s8	
	mv	s4,s0	
	j	.L41		
.L40:
	sd	s0,64(sp)	
	sd	s1,56(sp)	
	sd	s2,48(sp)	
	sd	s4,32(sp)	
	sd	s5,24(sp)	
	sd	s8,0(sp)	
.LFE4125:
	.set	_ZN4rstd3vecIiEC1Em,_ZN4rstd3vecIiEC2Em
.LC0:
	.string	"\n"
	.globl	main
main:
.LFB3818:
	addi	sp,sp,-48	
	li	a1,100		
	addi	a0,sp,8	
	sd	ra,40(sp)	
	call	_ZN4rstd3vecIiEC1Em		
	ld	a1,8(sp)		
	lui	a3,%hi(.LC0)	
	addi	a3,a3,%lo(.LC0)	
	mv	a5,a1	
	addi	a2,a1,400	
.L73:
	lw	a4,0(a5)		
	li a7, 1
	mv a0, a4	
	ecall
	
	li a7, 4
	mv a0, a3	
	ecall
	
	addi	a5,a5,4	
	bne	a2,a5,.L73	
	li	a5,0		
	addi a7, zero, 93
	add a0, zero, a5	
	ecall
	
	ld	ra,40(sp)		
	sb	zero,-16(a1)	
	li	a0,0		
	addi	sp,sp,48	
	jr	ra		
.LFE3818:
_GLOBAL__sub_I__Znwm:
.LFB4523:
	lui	a5,%hi(_ZN6memoryL9heapStartE)	
	ld	a4,%lo(_ZN6memoryL9heapStartE)(a5)		
	lui	a5,%hi(_ZN6memoryL3topE)	
	sd	a4,%lo(_ZN6memoryL3topE)(a5)	
	ret	
.LFE4523:
	.dword	_GLOBAL__sub_I__Znwm
_ZN6memoryL3topE:
_ZN6memoryL9heapStartE:
