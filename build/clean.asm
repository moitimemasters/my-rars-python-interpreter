	.text
_ZnamPv:
.LFB24:
	addi	sp,sp,-32	
	sd	s0,24(sp)	
	addi	s0,sp,32	
	sd	a0,-24(s0)	
	sd	a1,-32(s0)	
	ld	a5,-32(s0)		
	mv	a0,a5	
	ld	s0,24(sp)		
	addi	sp,sp,32	
	jr	ra		
.LFE24:
_ZN8rsyscall7my_sbrkEl:
.LFB3226:
	addi	sp,sp,-48	
	sd	s0,40(sp)	
	addi	s0,sp,48	
	sd	a0,-40(s0)	
	ld	a5,-40(s0)		
	addi a7, zero, 9
	add a0, zero, a5	
	ecall
	mv a5, a0	
	sd	a5,-24(s0)	
	ld	a5,-24(s0)		
	mv	a0,a5	
	ld	s0,40(sp)		
	addi	sp,sp,48	
	jr	ra		
.LFE3226:
_ZN8rsyscall4exitEl:
.LFB3227:
	addi	sp,sp,-32	
	sd	s0,24(sp)	
	addi	s0,sp,32	
	sd	a0,-24(s0)	
	ld	a5,-24(s0)		
	addi a7, zero, 93
	add a0, zero, a5	
	ecall
	
	nop	
	ld	s0,24(sp)		
	addi	sp,sp,32	
	jr	ra		
.LFE3227:
_ZN8rsyscall12print_stringEPKc:
.LFB3229:
	addi	sp,sp,-32	
	sd	s0,24(sp)	
	addi	s0,sp,32	
	sd	a0,-24(s0)	
	ld	a5,-24(s0)		
	li a7, 4
	mv a0, a5	
	ecall
	
	nop	
	ld	s0,24(sp)		
	addi	sp,sp,32	
	jr	ra		
.LFE3229:
_ZN8rsyscall9open_fileEPKcl:
.LFB3230:
	addi	sp,sp,-48	
	sd	s0,40(sp)	
	addi	s0,sp,48	
	sd	a0,-40(s0)	
	sd	a1,-48(s0)	
	ld	a5,-40(s0)		
	ld	a4,-48(s0)		
	li a7, 1024
	mv a0, a5	
	mv a1, a4	
	ecall 
	mv a5, a0 	
	
	sd	a5,-24(s0)	
	ld	a5,-24(s0)		
	mv	a0,a5	
	ld	s0,40(sp)		
	addi	sp,sp,48	
	jr	ra		
.LFE3230:
_ZN8rsyscall10close_fileEl:
.LFB3231:
	addi	sp,sp,-32	
	sd	s0,24(sp)	
	addi	s0,sp,32	
	sd	a0,-24(s0)	
	ld	a5,-24(s0)		
	li a7, 57
	mv a0, a5	
	ecall
	
	nop	
	ld	s0,24(sp)		
	addi	sp,sp,32	
	jr	ra		
.LFE3231:
_ZN8rsyscall20read_from_descriptorElPcl:
.LFB3232:
	addi	sp,sp,-64	
	sd	s0,56(sp)	
	addi	s0,sp,64	
	sd	a0,-40(s0)	
	sd	a1,-48(s0)	
	sd	a2,-56(s0)	
	ld	a5,-40(s0)		
	ld	a4,-48(s0)		
	ld	a3,-56(s0)		
	li a7, 63
	mv a0, a5	
	mv a1, a4	
	mv a2, a3	
	ecall
	mv a5, a0	
	
	sd	a5,-24(s0)	
	ld	a5,-24(s0)		
	mv	a0,a5	
	ld	s0,56(sp)		
	addi	sp,sp,64	
	jr	ra		
.LFE3232:
	.comm	_ZN6memoryL9heapStartE,8,8
	.comm	_ZN6memoryL3topE,8,8
_ZN6memory5alignEm:
.LFB3234:
	addi	sp,sp,-32	
	sd	s0,24(sp)	
	addi	s0,sp,32	
	sd	a0,-24(s0)	
	ld	a5,-24(s0)		
	addi	a5,a5,7	
	andi	a5,a5,-8	
	mv	a0,a5	
	ld	s0,24(sp)		
	addi	sp,sp,32	
	jr	ra		
.LFE3234:
_ZN6memory9allocSizeEm:
.LFB3235:
	addi	sp,sp,-32	
	sd	s0,24(sp)	
	addi	s0,sp,32	
	sd	a0,-24(s0)	
	ld	a5,-24(s0)		
	addi	a5,a5,24	
	mv	a0,a5	
	ld	s0,24(sp)		
	addi	sp,sp,32	
	jr	ra		
.LFE3235:
_ZN6memory13requestFromOSEm:
.LFB3236:
	addi	sp,sp,-48	
	sd	ra,40(sp)	
	sd	s0,32(sp)	
	addi	s0,sp,48	
	sd	a0,-40(s0)	
	li	a0,0		
	call	_ZN8rsyscall7my_sbrkEl		
	sd	a0,-24(s0)	
	ld	a0,-40(s0)		
	call	_ZN6memory9allocSizeEm		
	mv	a5,a0	
	mv	a0,a5	
	call	_ZN8rsyscall7my_sbrkEl		
	mv	a5,a0	
	addi	a5,a5,1	
	seqz	a5,a5	
	andi	a5,a5,0xff	
	beq	a5,zero,.L17	
	li	a5,0		
	j	.L18		
.L17:
	ld	a5,-24(s0)		
.L18:
	mv	a0,a5	
	ld	ra,40(sp)		
	ld	s0,32(sp)		
	addi	sp,sp,48	
	jr	ra		
.LFE3236:
_ZN6memory8firstFitEm:
.LFB3237:
	addi	sp,sp,-48	
	sd	s0,40(sp)	
	addi	s0,sp,48	
	sd	a0,-40(s0)	
	lui	a5,%hi(_ZN6memoryL9heapStartE)	
	ld	a5,%lo(_ZN6memoryL9heapStartE)(a5)		
	sd	a5,-24(s0)	
	j	.L20		
.L24:
	ld	a5,-24(s0)		
	lbu	a5,8(a5)	
	bne	a5,zero,.L21	
	ld	a5,-24(s0)		
	ld	a5,0(a5)		
	ld	a4,-40(s0)		
	bleu	a4,a5,.L22	
.L21:
	ld	a5,-24(s0)		
	ld	a5,16(a5)		
	sd	a5,-24(s0)	
	j	.L20		
.L22:
	ld	a5,-24(s0)		
	j	.L23		
.L20:
	ld	a5,-24(s0)		
	bne	a5,zero,.L24	
	li	a5,0		
.L23:
	mv	a0,a5	
	ld	s0,40(sp)		
	addi	sp,sp,48	
	jr	ra		
.LFE3237:
_ZN6memory9findBlockEm:
.LFB3238:
	addi	sp,sp,-32	
	sd	ra,24(sp)	
	sd	s0,16(sp)	
	addi	s0,sp,32	
	sd	a0,-24(s0)	
	ld	a0,-24(s0)		
	call	_ZN6memory8firstFitEm		
	mv	a5,a0	
	mv	a0,a5	
	ld	ra,24(sp)		
	ld	s0,16(sp)		
	addi	sp,sp,32	
	jr	ra		
.LFE3238:
_ZN6memory5allocEm:
.LFB3239:
	addi	sp,sp,-48	
	sd	ra,40(sp)	
	sd	s0,32(sp)	
	addi	s0,sp,48	
	sd	a0,-40(s0)	
	ld	a0,-40(s0)		
	call	_ZN6memory5alignEm		
	sd	a0,-40(s0)	
	ld	a0,-40(s0)		
	call	_ZN6memory9findBlockEm		
	sd	a0,-24(s0)	
	ld	a5,-24(s0)		
	beq	a5,zero,.L28	
	ld	a5,-24(s0)		
	addi	a5,a5,24	
	j	.L29		
.L28:
	ld	a0,-40(s0)		
	call	_ZN6memory13requestFromOSEm		
	sd	a0,-32(s0)	
	ld	a5,-32(s0)		
	ld	a4,-40(s0)		
	sd	a4,0(a5)	
	ld	a5,-32(s0)		
	li	a4,1		
	sb	a4,8(a5)	
	lui	a5,%hi(_ZN6memoryL9heapStartE)	
	ld	a5,%lo(_ZN6memoryL9heapStartE)(a5)		
	bne	a5,zero,.L30	
	lui	a5,%hi(_ZN6memoryL9heapStartE)	
	ld	a4,-32(s0)		
	sd	a4,%lo(_ZN6memoryL9heapStartE)(a5)	
.L30:
	lui	a5,%hi(_ZN6memoryL3topE)	
	ld	a5,%lo(_ZN6memoryL3topE)(a5)		
	beq	a5,zero,.L31	
	lui	a5,%hi(_ZN6memoryL3topE)	
	ld	a5,%lo(_ZN6memoryL3topE)(a5)		
	ld	a4,-32(s0)		
	sd	a4,16(a5)	
.L31:
	lui	a5,%hi(_ZN6memoryL3topE)	
	ld	a4,-32(s0)		
	sd	a4,%lo(_ZN6memoryL3topE)(a5)	
	ld	a5,-32(s0)		
	addi	a5,a5,24	
.L29:
	mv	a0,a5	
	ld	ra,40(sp)		
	ld	s0,32(sp)		
	addi	sp,sp,48	
	jr	ra		
.LFE3239:
_ZN6memory9getHeaderEPKl:
.LFB3240:
	addi	sp,sp,-32	
	sd	s0,24(sp)	
	addi	s0,sp,32	
	sd	a0,-24(s0)	
	ld	a5,-24(s0)		
	addi	a5,a5,-24	
	mv	a0,a5	
	ld	s0,24(sp)		
	addi	sp,sp,32	
	jr	ra		
.LFE3240:
_ZN6memory4freeEPl:
.LFB3241:
	addi	sp,sp,-48	
	sd	ra,40(sp)	
	sd	s0,32(sp)	
	addi	s0,sp,48	
	sd	a0,-40(s0)	
	ld	a0,-40(s0)		
	call	_ZN6memory9getHeaderEPKl		
	sd	a0,-24(s0)	
	ld	a5,-24(s0)		
	sb	zero,8(a5)	
	nop	
	ld	ra,40(sp)		
	ld	s0,32(sp)		
	addi	sp,sp,48	
	jr	ra		
.LFE3241:
_ZN4rstd6strlenEPKc:
.LFB4595:
	addi	sp,sp,-48	
	sd	s0,40(sp)	
	addi	s0,sp,48	
	sd	a0,-40(s0)	
	sw	zero,-20(s0)	
	j	.L36		
.L37:
	lw	a5,-20(s0)		
	addiw	a5,a5,1	
	sw	a5,-20(s0)	
	ld	a5,-40(s0)		
	addi	a5,a5,1	
	sd	a5,-40(s0)	
.L36:
	ld	a5,-40(s0)		
	lbu	a5,0(a5)	
	bne	a5,zero,.L37	
	lw	a5,-20(s0)		
	mv	a0,a5	
	ld	s0,40(sp)		
	addi	sp,sp,48	
	jr	ra		
.LFE4595:
_ZN4rstd6stringC2Ev:
.LFB4609:
	addi	sp,sp,-32	
	sd	s0,24(sp)	
	addi	s0,sp,32	
	sd	a0,-24(s0)	
	ld	a5,-24(s0)		
	sd	zero,0(a5)	
	ld	a5,-24(s0)		
	sd	zero,8(a5)	
	ld	a5,-24(s0)		
	sd	zero,16(a5)	
	nop	
	ld	s0,24(sp)		
	addi	sp,sp,32	
	jr	ra		
.LFE4609:
	.set	_ZN4rstd6stringC1Ev,_ZN4rstd6stringC2Ev
_ZN4rstd6stringC2Emc:
.LFB4612:
	addi	sp,sp,-80	
	sd	ra,72(sp)	
	sd	s0,64(sp)	
	sd	s1,56(sp)	
	addi	s0,sp,80	
	sd	a0,-56(s0)	
	sd	a1,-64(s0)	
	mv	a5,a2	
	sb	a5,-65(s0)	
	ld	a5,-56(s0)		
	ld	a4,-64(s0)		
	sd	a4,0(a5)	
	ld	a5,-56(s0)		
	ld	a4,-64(s0)		
	sd	a4,8(a5)	
	ld	a5,-56(s0)		
	ld	a5,0(a5)		
	bne	a5,zero,.L41	
	ld	a5,-56(s0)		
	sd	zero,16(a5)	
	j	.L40		
.L41:
	ld	a5,-56(s0)		
	ld	s1,0(a5)		
	ld	a5,-56(s0)		
	ld	a5,0(a5)		
	mv	a0,a5	
	call	_Znam		
	mv	a5,a0	
	mv	a1,a5	
	mv	a0,s1	
	call	_ZnamPv		
	mv	a4,a0	
	ld	a5,-56(s0)		
	sd	a4,16(a5)	
	sw	zero,-36(s0)	
	j	.L43		
.L44:
	ld	a5,-56(s0)		
	ld	a4,16(a5)		
	lw	a5,-36(s0)		
	add	a5,a4,a5	
	lbu	a4,-65(s0)	
	sb	a4,0(a5)	
	lw	a5,-36(s0)		
	addiw	a5,a5,1	
	sw	a5,-36(s0)	
.L43:
	lw	a4,-36(s0)		
	ld	a5,-56(s0)		
	ld	a5,0(a5)		
	bltu	a4,a5,.L44	
.L40:
	ld	ra,72(sp)		
	ld	s0,64(sp)		
	ld	s1,56(sp)		
	addi	sp,sp,80	
	jr	ra		
.LFE4612:
	.set	_ZN4rstd6stringC1Emc,_ZN4rstd6stringC2Emc
_ZN4rstd6stringD2Ev:
.LFB4621:
	addi	sp,sp,-32	
	sd	ra,24(sp)	
	sd	s0,16(sp)	
	addi	s0,sp,32	
	sd	a0,-24(s0)	
	ld	a0,-24(s0)		
	call	_ZN4rstd6string5clearEv		
	nop	
	ld	ra,24(sp)		
	ld	s0,16(sp)		
	addi	sp,sp,32	
	jr	ra		
.LFE4621:
	.set	_ZN4rstd6stringD1Ev,_ZN4rstd6stringD2Ev
_ZN4rstd6stringC2ERKS0_:
.LFB4624:
	addi	sp,sp,-64	
	sd	ra,56(sp)	
	sd	s0,48(sp)	
	sd	s1,40(sp)	
	addi	s0,sp,64	
	sd	a0,-56(s0)	
	sd	a1,-64(s0)	
	ld	a0,-64(s0)		
	call	_ZNK4rstd6string4sizeEv		
	mv	a4,a0	
	ld	a5,-56(s0)		
	sd	a4,0(a5)	
	ld	a0,-64(s0)		
	call	_ZNK4rstd6string8capacityEv		
	mv	a4,a0	
	ld	a5,-56(s0)		
	sd	a4,8(a5)	
	ld	a4,-56(s0)		
	ld	a5,-64(s0)		
	beq	a4,a5,.L52	
	ld	a5,-56(s0)		
	ld	a5,8(a5)		
	bne	a5,zero,.L49	
	ld	a5,-56(s0)		
	sd	zero,16(a5)	
	j	.L46		
.L49:
	ld	a5,-56(s0)		
	ld	s1,8(a5)		
	ld	a5,-56(s0)		
	ld	a5,8(a5)		
	mv	a0,a5	
	call	_Znam		
	mv	a5,a0	
	mv	a1,a5	
	mv	a0,s1	
	call	_ZnamPv		
	mv	a4,a0	
	ld	a5,-56(s0)		
	sd	a4,16(a5)	
	sw	zero,-36(s0)	
	j	.L50		
.L51:
	lw	a5,-36(s0)		
	mv	a1,a5	
	ld	a0,-64(s0)		
	call	_ZNK4rstd6stringixEm		
	mv	a3,a0	
	ld	a5,-56(s0)		
	ld	a4,16(a5)		
	lw	a5,-36(s0)		
	add	a5,a4,a5	
	lbu	a4,0(a3)	
	sb	a4,0(a5)	
	lw	a5,-36(s0)		
	addiw	a5,a5,1	
	sw	a5,-36(s0)	
.L50:
	lw	a4,-36(s0)		
	ld	a5,-56(s0)		
	ld	a5,0(a5)		
	bltu	a4,a5,.L51	
	j	.L46		
.L52:
	nop	
.L46:
	ld	ra,56(sp)		
	ld	s0,48(sp)		
	ld	s1,40(sp)		
	addi	sp,sp,64	
	jr	ra		
.LFE4624:
	.set	_ZN4rstd6stringC1ERKS0_,_ZN4rstd6stringC2ERKS0_
_ZN4rstd6stringaSERKS0_:
.LFB4626:
	addi	sp,sp,-64	
	sd	ra,56(sp)	
	sd	s0,48(sp)	
	sd	s1,40(sp)	
	addi	s0,sp,64	
	sd	a0,-56(s0)	
	sd	a1,-64(s0)	
	ld	a4,-56(s0)		
	ld	a5,-64(s0)		
	bne	a4,a5,.L54	
	ld	a5,-56(s0)		
	j	.L55		
.L54:
	ld	a0,-64(s0)		
	call	_ZNK4rstd6string4sizeEv		
	mv	a4,a0	
	ld	a5,-56(s0)		
	sd	a4,0(a5)	
	ld	a0,-64(s0)		
	call	_ZNK4rstd6string8capacityEv		
	mv	a4,a0	
	ld	a5,-56(s0)		
	sd	a4,8(a5)	
	ld	a5,-56(s0)		
	ld	a5,16(a5)		
	beq	a5,zero,.L56	
	ld	a5,-56(s0)		
	ld	a5,16(a5)		
	mv	a0,a5	
	call	_ZdaPv		
.L56:
	ld	a5,-56(s0)		
	ld	a5,0(a5)		
	beq	a5,zero,.L57	
	ld	a5,-56(s0)		
	ld	s1,8(a5)		
	ld	a5,-56(s0)		
	ld	a5,8(a5)		
	mv	a0,a5	
	call	_Znam		
	mv	a5,a0	
	mv	a1,a5	
	mv	a0,s1	
	call	_ZnamPv		
	mv	a4,a0	
	j	.L58		
.L57:
	li	a4,0		
.L58:
	ld	a5,-56(s0)		
	sd	a4,16(a5)	
	sw	zero,-36(s0)	
	j	.L59		
.L60:
	lw	a5,-36(s0)		
	mv	a1,a5	
	ld	a0,-64(s0)		
	call	_ZNK4rstd6stringixEm		
	mv	a3,a0	
	ld	a5,-56(s0)		
	ld	a4,16(a5)		
	lw	a5,-36(s0)		
	add	a5,a4,a5	
	lbu	a4,0(a3)	
	sb	a4,0(a5)	
	lw	a5,-36(s0)		
	addiw	a5,a5,1	
	sw	a5,-36(s0)	
.L59:
	lw	a4,-36(s0)		
	ld	a5,-56(s0)		
	ld	a5,0(a5)		
	bltu	a4,a5,.L60	
	ld	a5,-56(s0)		
.L55:
	mv	a0,a5	
	ld	ra,56(sp)		
	ld	s0,48(sp)		
	ld	s1,40(sp)		
	addi	sp,sp,64	
	jr	ra		
.LFE4626:
_ZNK4rstd6stringixEm:
.LFB4628:
	addi	sp,sp,-32	
	sd	s0,24(sp)	
	addi	s0,sp,32	
	sd	a0,-24(s0)	
	sd	a1,-32(s0)	
	ld	a5,-24(s0)		
	ld	a4,16(a5)		
	ld	a5,-32(s0)		
	add	a5,a4,a5	
	mv	a0,a5	
	ld	s0,24(sp)		
	addi	sp,sp,32	
	jr	ra		
.LFE4628:
_ZN4rstd6string5c_strEv:
.LFB4638:
	addi	sp,sp,-32	
	sd	s0,24(sp)	
	addi	s0,sp,32	
	sd	a0,-24(s0)	
	ld	a5,-24(s0)		
	ld	a5,16(a5)		
	mv	a0,a5	
	ld	s0,24(sp)		
	addi	sp,sp,32	
	jr	ra		
.LFE4638:
_ZNK4rstd6string4sizeEv:
.LFB4640:
	addi	sp,sp,-32	
	sd	s0,24(sp)	
	addi	s0,sp,32	
	sd	a0,-24(s0)	
	ld	a5,-24(s0)		
	ld	a5,0(a5)		
	mv	a0,a5	
	ld	s0,24(sp)		
	addi	sp,sp,32	
	jr	ra		
.LFE4640:
_ZNK4rstd6string8capacityEv:
.LFB4642:
	addi	sp,sp,-32	
	sd	s0,24(sp)	
	addi	s0,sp,32	
	sd	a0,-24(s0)	
	ld	a5,-24(s0)		
	ld	a5,8(a5)		
	mv	a0,a5	
	ld	s0,24(sp)		
	addi	sp,sp,32	
	jr	ra		
.LFE4642:
_ZN4rstd6string5clearEv:
.LFB4643:
	addi	sp,sp,-32	
	sd	ra,24(sp)	
	sd	s0,16(sp)	
	addi	s0,sp,32	
	sd	a0,-24(s0)	
	ld	a5,-24(s0)		
	ld	a5,16(a5)		
	beq	a5,zero,.L70	
	ld	a5,-24(s0)		
	ld	a5,16(a5)		
	beq	a5,zero,.L70	
	ld	a5,-24(s0)		
	ld	a5,16(a5)		
	mv	a0,a5	
	call	_ZdaPv		
.L70:
	ld	a5,-24(s0)		
	sd	zero,16(a5)	
	ld	a5,-24(s0)		
	sd	zero,0(a5)	
	ld	a5,-24(s0)		
	sd	zero,8(a5)	
	nop	
	ld	ra,24(sp)		
	ld	s0,16(sp)		
	addi	sp,sp,32	
	jr	ra		
.LFE4643:
_ZN4rstd6string9push_backEc:
.LFB4647:
	addi	sp,sp,-32	
	sd	ra,24(sp)	
	sd	s0,16(sp)	
	addi	s0,sp,32	
	sd	a0,-24(s0)	
	mv	a5,a1	
	sb	a5,-25(s0)	
	ld	a5,-24(s0)		
	ld	a5,8(a5)		
	bne	a5,zero,.L72	
	ld	a5,-24(s0)		
	ld	a5,16(a5)		
	beq	a5,zero,.L73	
	ld	a5,-24(s0)		
	ld	a5,16(a5)		
	mv	a0,a5	
	call	_ZdaPv		
.L73:
	li	a0,1		
	call	_Znam		
	mv	a5,a0	
	mv	a1,a5	
	li	a0,1		
	call	_ZnamPv		
	mv	a4,a0	
	ld	a5,-24(s0)		
	sd	a4,16(a5)	
	ld	a5,-24(s0)		
	ld	a5,16(a5)		
	lbu	a4,-25(s0)	
	sb	a4,0(a5)	
	ld	a5,-24(s0)		
	li	a4,1		
	sd	a4,8(a5)	
	ld	a5,-24(s0)		
	li	a4,1		
	sd	a4,0(a5)	
	j	.L71		
.L72:
	ld	a5,-24(s0)		
	ld	a4,0(a5)		
	ld	a5,-24(s0)		
	ld	a5,8(a5)		
	bne	a4,a5,.L75	
	ld	a5,-24(s0)		
	ld	a5,8(a5)		
	slli	a5,a5,1	
	mv	a1,a5	
	ld	a0,-24(s0)		
	call	_ZN4rstd6string7reserveEm		
.L75:
	ld	a5,-24(s0)		
	ld	a5,0(a5)		
	addi	a4,a5,1	
	ld	a5,-24(s0)		
	sd	a4,0(a5)	
	ld	a5,-24(s0)		
	ld	a4,16(a5)		
	ld	a5,-24(s0)		
	ld	a5,0(a5)		
	addi	a5,a5,-1	
	add	a5,a4,a5	
	lbu	a4,-25(s0)	
	sb	a4,0(a5)	
.L71:
	ld	ra,24(sp)		
	ld	s0,16(sp)		
	addi	sp,sp,32	
	jr	ra		
.LFE4647:
_ZN4rstd6string7reserveEm:
.LFB4649:
	addi	sp,sp,-64	
	sd	ra,56(sp)	
	sd	s0,48(sp)	
	sd	s1,40(sp)	
	addi	s0,sp,64	
	sd	a0,-56(s0)	
	sd	a1,-64(s0)	
	ld	a5,-56(s0)		
	ld	a5,8(a5)		
	ld	a4,-64(s0)		
	bleu	a4,a5,.L81	
	ld	s1,-64(s0)		
	ld	a0,-64(s0)		
	call	_Znam		
	mv	a5,a0	
	mv	a1,a5	
	mv	a0,s1	
	call	_ZnamPv		
	sd	a0,-40(s0)	
	ld	a5,-56(s0)		
	ld	a4,16(a5)		
	ld	a5,-56(s0)		
	ld	a5,0(a5)		
	mv	a2,a5	
	mv	a1,a4	
	ld	a0,-40(s0)		
	call	_ZN6memory7memmoveIcEEvPT_S2_m		
	ld	a5,-56(s0)		
	ld	a5,16(a5)		
	beq	a5,zero,.L79	
	ld	a5,-56(s0)		
	ld	a5,16(a5)		
	beq	a5,zero,.L80	
	ld	a5,-56(s0)		
	ld	a5,16(a5)		
	mv	a0,a5	
	call	_ZdaPv		
.L80:
	ld	a5,-56(s0)		
	sd	zero,16(a5)	
.L79:
	ld	a5,-56(s0)		
	ld	a4,-40(s0)		
	sd	a4,16(a5)	
	ld	a5,-56(s0)		
	ld	a4,-64(s0)		
	sd	a4,8(a5)	
	ld	a5,-56(s0)		
	ld	a5,8(a5)		
	ld	a4,-64(s0)		
	bgeu	a4,a5,.L76	
	ld	a5,-56(s0)		
	ld	a4,-64(s0)		
	sd	a4,0(a5)	
	j	.L76		
.L81:
	nop	
.L76:
	ld	ra,56(sp)		
	ld	s0,48(sp)		
	ld	s1,40(sp)		
	addi	sp,sp,64	
	jr	ra		
.LFE4649:
	.comm	_ZL4iota,4,4
	.globl	TOKEN_NAMES
.LC0:
	.string	"undefined"
	.string	""
.LC1:
	.string	"eof"
	.string	""
.LC2:
	.string	"newline"
	.string	""
.LC3:
	.string	"space"
	.string	""
.LC4:
	.string	"int_10"
	.string	""
.LC5:
	.string	"float_10"
	.string	""
.LC6:
	.string	"name"
	.string	""
.LC7:
	.string	"and"
	.string	""
.LC8:
	.string	"as"
	.string	""
.LC9:
	.string	""
	.string	""
.LC10:
	.string	"break"
	.string	""
.LC11:
	.string	"continue"
	.string	""
.LC12:
	.string	"dict"
	.string	""
.LC13:
	.string	"def"
	.string	""
.LC14:
	.string	"del"
	.string	""
.LC15:
	.string	"exception"
	.string	""
.LC16:
	.string	"except"
	.string	""
.LC17:
	.string	"from"
	.string	""
.LC18:
	.string	"for"
	.string	""
.LC19:
	.string	"getattr"
	.string	""
.LC20:
	.string	"import"
	.string	""
.LC21:
	.string	"is"
	.string	""
.LC22:
	.string	"in"
	.string	""
.LC23:
	.string	"if"
	.string	""
.LC24:
	.string	"list"
	.string	""
.LC25:
	.string	"len"
	.string	""
.LC26:
	.string	"or"
	.string	""
.LC27:
	.string	"pass"
	.string	""
.LC28:
	.string	"return"
	.string	""
.LC29:
	.string	"setattr"
	.string	""
.LC30:
	.string	"set"
	.string	""
.LC31:
	.string	"yield"
	.string	""
.LC32:
	.string	"plus"
	.string	""
.LC33:
	.string	"minus"
	.string	""
.LC34:
	.string	"mul"
	.string	""
.LC35:
	.string	"div"
	.string	""
.LC36:
	.string	"mod"
	.string	""
.LC37:
	.string	"pow"
	.string	""
.LC38:
	.string	"floordiv"
	.string	""
.LC39:
	.string	"binvert"
	.string	""
.LC40:
	.string	"band"
	.string	""
.LC41:
	.string	"bor"
	.string	""
.LC42:
	.string	"bxor"
	.string	""
.LC43:
	.string	"blshift"
	.string	""
.LC44:
	.string	"brshift"
	.string	""
.LC45:
	.string	"eq"
	.string	""
.LC46:
	.string	"ne"
	.string	""
.LC47:
	.string	"lt"
	.string	""
.LC48:
	.string	"gt"
	.string	""
.LC49:
	.string	"le"
	.string	""
.LC50:
	.string	"ge"
	.string	""
.LC51:
	.string	"lor"
	.string	""
.LC52:
	.string	"land"
	.string	""
.LC53:
	.string	"lnot"
	.string	""
.LC54:
	.string	"assign"
	.string	""
.LC55:
	.string	"aug_plus"
	.string	""
.LC56:
	.string	"aug_minus"
	.string	""
.LC57:
	.string	"aug_mul"
	.string	""
.LC58:
	.string	"aug_div"
	.string	""
.LC59:
	.string	"aug_mod"
	.string	""
.LC60:
	.string	"aug_pow"
	.string	""
.LC61:
	.string	"aug_floordiv"
	.string	""
.LC62:
	.string	"aug_band"
	.string	""
.LC63:
	.string	"aug_bor"
	.string	""
.LC64:
	.string	"aug_bxor"
	.string	""
.LC65:
	.string	"aug_blshift"
	.string	""
.LC66:
	.string	"aug_brshift"
	.string	""
.LC67:
	.string	"aug_binvert"
	.string	""
.LC68:
	.string	"comma"
	.string	""
.LC69:
	.string	"dot"
	.string	""
.LC70:
	.string	"colon"
	.string	""
.LC71:
	.string	"semicolon"
	.string	""
.LC72:
	.string	"lparen"
	.string	""
.LC73:
	.string	"rparen"
	.string	""
.LC74:
	.string	"lbracket"
	.string	""
.LC75:
	.string	"rbracket"
	.string	""
.LC76:
	.string	"lbrace"
	.string	""
.LC77:
	.string	"rbrace"
	.string	""
.LC78:
	.string	"double_quote"
	.string	""
.LC79:
	.string	"single_quote"
	.string	""
.LC80:
	.string	"string_content"
	.string	""
.LC81:
	.string	"hashtag_comment"
	.string	""
	.data
TOKEN_NAMES:
	.dword	.LC0
	.dword	.LC1
	.dword	.LC2
	.dword	.LC3
	.dword	.LC4
	.dword	.LC5
	.dword	.LC6
	.dword	.LC7
	.dword	.LC8
	.dword	.LC9
	.dword	.LC10
	.dword	.LC11
	.dword	.LC12
	.dword	.LC13
	.dword	.LC14
	.dword	.LC15
	.dword	.LC16
	.dword	.LC17
	.dword	.LC18
	.dword	.LC19
	.dword	.LC20
	.dword	.LC21
	.dword	.LC22
	.dword	.LC23
	.dword	.LC24
	.dword	.LC25
	.dword	.LC26
	.dword	.LC27
	.dword	.LC28
	.dword	.LC29
	.dword	.LC30
	.dword	.LC31
	.dword	.LC32
	.dword	.LC33
	.dword	.LC34
	.dword	.LC35
	.dword	.LC36
	.dword	.LC37
	.dword	.LC38
	.dword	.LC39
	.dword	.LC40
	.dword	.LC41
	.dword	.LC42
	.dword	.LC43
	.dword	.LC44
	.dword	.LC45
	.dword	.LC46
	.dword	.LC47
	.dword	.LC48
	.dword	.LC49
	.dword	.LC50
	.dword	.LC51
	.dword	.LC52
	.dword	.LC53
	.dword	.LC54
	.dword	.LC55
	.dword	.LC56
	.dword	.LC57
	.dword	.LC58
	.dword	.LC59
	.dword	.LC60
	.dword	.LC61
	.dword	.LC62
	.dword	.LC63
	.dword	.LC64
	.dword	.LC65
	.dword	.LC66
	.dword	.LC67
	.dword	.LC68
	.dword	.LC69
	.dword	.LC70
	.dword	.LC71
	.dword	.LC72
	.dword	.LC73
	.dword	.LC74
	.dword	.LC75
	.dword	.LC76
	.dword	.LC77
	.dword	.LC78
	.dword	.LC79
	.dword	.LC80
	.dword	.LC81
_ZN7lexer_t7advanceEv:
.LFB4663:
	addi	sp,sp,-32	
	sd	ra,24(sp)	
	sd	s0,16(sp)	
	addi	s0,sp,32	
	sd	a0,-24(s0)	
	ld	a0,-24(s0)		
	call	_ZN7lexer_t8get_charEv		
	mv	a5,a0	
	sext.w	a4,a5	
	li	a5,10		
	sub	a5,a4,a5	
	seqz	a5,a5	
	andi	a5,a5,0xff	
	beq	a5,zero,.L83	
	ld	a5,-24(s0)		
	sd	zero,56(a5)	
	ld	a5,-24(s0)		
	ld	a5,48(a5)		
	addi	a4,a5,1	
	ld	a5,-24(s0)		
	sd	a4,48(a5)	
	j	.L84		
.L83:
	ld	a5,-24(s0)		
	ld	a5,56(a5)		
	addi	a4,a5,1	
	ld	a5,-24(s0)		
	sd	a4,56(a5)	
.L84:
	ld	a0,-24(s0)		
	call	_ZN7lexer_t12advance_charEv		
	ld	a5,-24(s0)		
	ld	a5,40(a5)		
	addi	a4,a5,1	
	ld	a5,-24(s0)		
	sd	a4,40(a5)	
	nop	
	ld	ra,24(sp)		
	ld	s0,16(sp)		
	addi	sp,sp,32	
	jr	ra		
.LFE4663:
_ZN7lexer_tD2Ev:
.LFB4665:
	addi	sp,sp,-32	
	sd	ra,24(sp)	
	sd	s0,16(sp)	
	addi	s0,sp,32	
	sd	a0,-24(s0)	
	ld	a5,-24(s0)		
	ld	a5,8(a5)		
	mv	a0,a5	
	call	_ZdaPv		
	ld	a5,-24(s0)		
	addi	a5,a5,64	
	mv	a0,a5	
	call	_ZN4rstd6stringD1Ev		
	nop	
	ld	ra,24(sp)		
	ld	s0,16(sp)		
	addi	sp,sp,32	
	jr	ra		
.LFE4665:
	.set	_ZN7lexer_tD1Ev,_ZN7lexer_tD2Ev
.LC82:
	.string	"Error reading from descriptor\n"
_ZN7lexer_tC2El:
.LFB4668:
	addi	sp,sp,-48	
	sd	ra,40(sp)	
	sd	s0,32(sp)	
	addi	s0,sp,48	
	sd	a0,-40(s0)	
	sd	a1,-48(s0)	
	ld	a5,-40(s0)		
	ld	a4,-48(s0)		
	sd	a4,0(a5)	
	ld	a5,-40(s0)		
	sd	zero,16(a5)	
	ld	a5,-40(s0)		
	sb	zero,24(a5)	
	ld	a5,-40(s0)		
	li	a4,128		
	sd	a4,32(a5)	
	ld	a5,-40(s0)		
	sd	zero,40(a5)	
	ld	a5,-40(s0)		
	sd	zero,48(a5)	
	ld	a5,-40(s0)		
	sd	zero,56(a5)	
	ld	a5,-40(s0)		
	addi	a5,a5,64	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	li	a0,128		
	call	_Znam		
	mv	a5,a0	
	mv	a1,a5	
	li	a0,128		
	call	_ZnamPv		
	mv	a4,a0	
	ld	a5,-40(s0)		
	sd	a4,8(a5)	
	ld	a5,-40(s0)		
	ld	a5,8(a5)		
	li	a2,128		
	mv	a1,a5	
	ld	a0,-48(s0)		
	call	_ZN8rsyscall20read_from_descriptorElPcl		
	sd	a0,-24(s0)	
	ld	a5,-24(s0)		
	bge	a5,zero,.L87	
	lui	a5,%hi(.LC82)	
	addi	a0,a5,%lo(.LC82)	
	call	_ZN8rsyscall12print_stringEPKc		
	li	a0,0		
	call	_ZN8rsyscall4exitEl		
.L87:
	ld	a4,-24(s0)		
	li	a5,127		
	bgt	a4,a5,.L88	
	ld	a5,-40(s0)		
	li	a4,1		
	sb	a4,24(a5)	
.L88:
	ld	a4,-24(s0)		
	ld	a5,-40(s0)		
	sd	a4,32(a5)	
	nop	
	ld	ra,40(sp)		
	ld	s0,32(sp)		
	addi	sp,sp,48	
	jr	ra		
.LFE4668:
	.set	_ZN7lexer_tC1El,_ZN7lexer_tC2El
_ZN7lexer_t8get_charEv:
.LFB4670:
	addi	sp,sp,-48	
	sd	ra,40(sp)	
	sd	s0,32(sp)	
	addi	s0,sp,48	
	sd	a0,-40(s0)	
	ld	a5,-40(s0)		
	ld	a4,16(a5)		
	ld	a5,-40(s0)		
	ld	a5,32(a5)		
	bne	a4,a5,.L90	
	ld	a5,-40(s0)		
	lbu	a5,24(a5)	
	beq	a5,zero,.L91	
	li	a5,0		
	j	.L92		
.L91:
	ld	a5,-40(s0)		
	ld	a4,0(a5)		
	ld	a5,-40(s0)		
	ld	a5,8(a5)		
	li	a2,128		
	mv	a1,a5	
	mv	a0,a4	
	call	_ZN8rsyscall20read_from_descriptorElPcl		
	sd	a0,-24(s0)	
	ld	a5,-24(s0)		
	bge	a5,zero,.L93	
	lui	a5,%hi(.LC82)	
	addi	a0,a5,%lo(.LC82)	
	call	_ZN8rsyscall12print_stringEPKc		
	li	a0,0		
	call	_ZN8rsyscall4exitEl		
.L93:
	ld	a4,-24(s0)		
	li	a5,127		
	bgt	a4,a5,.L94	
	ld	a5,-40(s0)		
	li	a4,1		
	sb	a4,24(a5)	
.L94:
	ld	a4,-24(s0)		
	ld	a5,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-40(s0)		
	sd	zero,16(a5)	
.L90:
	ld	a5,-40(s0)		
	ld	a4,8(a5)		
	ld	a5,-40(s0)		
	ld	a5,16(a5)		
	add	a5,a4,a5	
	lbu	a5,0(a5)	
.L92:
	mv	a0,a5	
	ld	ra,40(sp)		
	ld	s0,32(sp)		
	addi	sp,sp,48	
	jr	ra		
.LFE4670:
_ZN7lexer_t12advance_charEv:
.LFB4671:
	addi	sp,sp,-48	
	sd	ra,40(sp)	
	sd	s0,32(sp)	
	addi	s0,sp,48	
	sd	a0,-40(s0)	
	ld	a5,-40(s0)		
	ld	a4,16(a5)		
	ld	a5,-40(s0)		
	ld	a5,32(a5)		
	bne	a4,a5,.L96	
	ld	a5,-40(s0)		
	lbu	a5,24(a5)	
	bne	a5,zero,.L103	
	ld	a5,-40(s0)		
	ld	a4,0(a5)		
	ld	a5,-40(s0)		
	ld	a5,8(a5)		
	li	a2,128		
	mv	a1,a5	
	mv	a0,a4	
	call	_ZN8rsyscall20read_from_descriptorElPcl		
	sd	a0,-24(s0)	
	ld	a5,-24(s0)		
	bge	a5,zero,.L99	
	lui	a5,%hi(.LC82)	
	addi	a0,a5,%lo(.LC82)	
	call	_ZN8rsyscall12print_stringEPKc		
	li	a0,0		
	call	_ZN8rsyscall4exitEl		
.L99:
	ld	a4,-24(s0)		
	li	a5,127		
	bgt	a4,a5,.L100	
	ld	a5,-40(s0)		
	li	a4,1		
	sb	a4,24(a5)	
.L100:
	ld	a4,-24(s0)		
	ld	a5,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-40(s0)		
	sd	zero,16(a5)	
.L96:
	ld	a5,-40(s0)		
	ld	a4,8(a5)		
	ld	a5,-40(s0)		
	ld	a5,16(a5)		
	add	a5,a4,a5	
	lbu	a5,0(a5)	
	mv	a4,a5	
	li	a5,10		
	bne	a4,a5,.L101	
	ld	a5,-40(s0)		
	sd	zero,56(a5)	
	ld	a5,-40(s0)		
	ld	a5,48(a5)		
	addi	a4,a5,1	
	ld	a5,-40(s0)		
	sd	a4,48(a5)	
	j	.L102		
.L101:
	ld	a5,-40(s0)		
	ld	a5,56(a5)		
	addi	a4,a5,1	
	ld	a5,-40(s0)		
	sd	a4,56(a5)	
.L102:
	ld	a5,-40(s0)		
	ld	a5,16(a5)		
	addi	a4,a5,1	
	ld	a5,-40(s0)		
	sd	a4,16(a5)	
	j	.L95		
.L103:
	nop	
.L95:
	ld	ra,40(sp)		
	ld	s0,32(sp)		
	addi	sp,sp,48	
	jr	ra		
.LFE4671:
_ZN7lexer_t17can_continue_nameEc:
.LFB4673:
	addi	sp,sp,-32	
	sd	s0,24(sp)	
	addi	s0,sp,32	
	sd	a0,-24(s0)	
	mv	a5,a1	
	sb	a5,-25(s0)	
	lbu	a5,-25(s0)	
	andi	a4,a5,0xff	
	li	a5,96		
	bleu	a4,a5,.L105	
	lbu	a5,-25(s0)	
	andi	a4,a5,0xff	
	li	a5,122		
	bleu	a4,a5,.L106	
.L105:
	lbu	a5,-25(s0)	
	andi	a4,a5,0xff	
	li	a5,64		
	bleu	a4,a5,.L107	
	lbu	a5,-25(s0)	
	andi	a4,a5,0xff	
	li	a5,90		
	bleu	a4,a5,.L106	
.L107:
	lbu	a5,-25(s0)	
	andi	a4,a5,0xff	
	li	a5,47		
	bleu	a4,a5,.L108	
	lbu	a5,-25(s0)	
	andi	a4,a5,0xff	
	li	a5,57		
	bleu	a4,a5,.L106	
.L108:
	lbu	a5,-25(s0)	
	andi	a4,a5,0xff	
	li	a5,95		
	bne	a4,a5,.L109	
.L106:
	li	a5,1		
	j	.L110		
.L109:
	li	a5,0		
.L110:
	mv	a0,a5	
	ld	s0,24(sp)		
	addi	sp,sp,32	
	jr	ra		
.LFE4673:
_ZN7lexer_t11parse_exactEPKcm:
.LFB4674:
	addi	sp,sp,-96	
	sd	ra,88(sp)	
	sd	s0,80(sp)	
	sd	s1,72(sp)	
	addi	s0,sp,96	
	sd	a0,-72(s0)	
	sd	a1,-80(s0)	
	sd	a2,-88(s0)	
	ld	a0,-80(s0)		
	call	_ZN4rstd6strlenEPKc		
	sd	a0,-48(s0)	
	ld	a4,-88(s0)		
	ld	a5,-48(s0)		
	bltu	a4,a5,.L113	
	ld	a5,-88(s0)		
	j	.L114		
.L113:
	ld	a5,-72(s0)		
	ld	a5,40(a5)		
	sd	a5,-56(s0)	
	ld	a4,-80(s0)		
	ld	a5,-88(s0)		
	add	a5,a4,a5	
	sd	a5,-40(s0)	
	j	.L115		
.L117:
	ld	a5,-40(s0)		
	lbu	s1,0(a5)	
	ld	a0,-72(s0)		
	call	_ZN7lexer_t8get_charEv		
	mv	a5,a0	
	sext.w	a4,s1	
	sext.w	a5,a5	
	sub	a5,a4,a5	
	snez	a5,a5	
	andi	a5,a5,0xff	
	beq	a5,zero,.L116	
	ld	a5,-72(s0)		
	ld	a4,40(a5)		
	ld	a5,-56(s0)		
	sub	a4,a4,a5	
	ld	a5,-88(s0)		
	add	a5,a4,a5	
	j	.L114		
.L116:
	ld	a5,-72(s0)		
	addi	a4,a5,64	
	ld	a5,-40(s0)		
	lbu	a5,0(a5)	
	mv	a1,a5	
	mv	a0,a4	
	call	_ZN4rstd6string9push_backEc		
	ld	a0,-72(s0)		
	call	_ZN7lexer_t7advanceEv		
	ld	a5,-40(s0)		
	addi	a5,a5,1	
	sd	a5,-40(s0)	
.L115:
	ld	a5,-40(s0)		
	lbu	a5,0(a5)	
	bne	a5,zero,.L117	
	ld	a5,-72(s0)		
	ld	a4,40(a5)		
	ld	a5,-56(s0)		
	sub	a4,a4,a5	
	ld	a5,-88(s0)		
	add	a5,a4,a5	
.L114:
	mv	a0,a5	
	ld	ra,88(sp)		
	ld	s0,80(sp)		
	ld	s1,72(sp)		
	addi	sp,sp,96	
	jr	ra		
.LFE4674:
_ZN7lexer_t10parse_wordEPKcm:
.LFB4675:
	addi	sp,sp,-96	
	sd	ra,88(sp)	
	sd	s0,80(sp)	
	sd	s1,72(sp)	
	addi	s0,sp,96	
	sd	a0,-72(s0)	
	sd	a1,-80(s0)	
	sd	a2,-88(s0)	
	ld	a0,-80(s0)		
	call	_ZN4rstd6strlenEPKc		
	sd	a0,-48(s0)	
	ld	a4,-88(s0)		
	ld	a5,-48(s0)		
	bltu	a4,a5,.L119	
	ld	a5,-88(s0)		
	j	.L120		
.L119:
	ld	a5,-72(s0)		
	ld	a5,40(a5)		
	sd	a5,-56(s0)	
	ld	a4,-80(s0)		
	ld	a5,-88(s0)		
	add	a5,a4,a5	
	sd	a5,-40(s0)	
	j	.L121		
.L123:
	ld	a5,-40(s0)		
	lbu	s1,0(a5)	
	ld	a0,-72(s0)		
	call	_ZN7lexer_t8get_charEv		
	mv	a5,a0	
	sext.w	a4,s1	
	sext.w	a5,a5	
	sub	a5,a4,a5	
	snez	a5,a5	
	andi	a5,a5,0xff	
	beq	a5,zero,.L122	
	ld	a5,-72(s0)		
	ld	a4,40(a5)		
	ld	a5,-56(s0)		
	sub	a4,a4,a5	
	ld	a5,-88(s0)		
	add	a5,a4,a5	
	j	.L120		
.L122:
	ld	a5,-72(s0)		
	addi	a4,a5,64	
	ld	a5,-40(s0)		
	lbu	a5,0(a5)	
	mv	a1,a5	
	mv	a0,a4	
	call	_ZN4rstd6string9push_backEc		
	ld	a0,-72(s0)		
	call	_ZN7lexer_t7advanceEv		
	ld	a5,-40(s0)		
	addi	a5,a5,1	
	sd	a5,-40(s0)	
.L121:
	ld	a5,-40(s0)		
	lbu	a5,0(a5)	
	bne	a5,zero,.L123	
	ld	a0,-72(s0)		
	call	_ZN7lexer_t8get_charEv		
	mv	a5,a0	
	sb	a5,-57(s0)	
	lbu	a5,-57(s0)	
	mv	a1,a5	
	ld	a0,-72(s0)		
	call	_ZN7lexer_t17can_continue_nameEc		
	mv	a5,a0	
	beq	a5,zero,.L124	
	ld	a5,-72(s0)		
	addi	a5,a5,64	
	lbu	a4,-57(s0)	
	mv	a1,a4	
	mv	a0,a5	
	call	_ZN4rstd6string9push_backEc		
	ld	a0,-72(s0)		
	call	_ZN7lexer_t7advanceEv		
.L124:
	ld	a5,-72(s0)		
	ld	a4,40(a5)		
	ld	a5,-56(s0)		
	sub	a4,a4,a5	
	ld	a5,-88(s0)		
	add	a5,a4,a5	
.L120:
	mv	a0,a5	
	ld	ra,88(sp)		
	ld	s0,80(sp)		
	ld	s1,72(sp)		
	addi	sp,sp,96	
	jr	ra		
.LFE4675:
_ZN7lexer_t7isdigitEc:
.LFB4676:
	addi	sp,sp,-32	
	sd	s0,24(sp)	
	addi	s0,sp,32	
	sd	a0,-24(s0)	
	mv	a5,a1	
	sb	a5,-25(s0)	
	lbu	a5,-25(s0)	
	andi	a4,a5,0xff	
	li	a5,47		
	bleu	a4,a5,.L126	
	lbu	a5,-25(s0)	
	andi	a4,a5,0xff	
	li	a5,57		
	bgtu	a4,a5,.L126	
	li	a5,1		
	j	.L127		
.L126:
	li	a5,0		
.L127:
	mv	a0,a5	
	ld	s0,24(sp)		
	addi	sp,sp,32	
	jr	ra		
.LFE4676:
_ZN14parsed_token_tD2Ev:
.LFB4679:
	addi	sp,sp,-32	
	sd	ra,24(sp)	
	sd	s0,16(sp)	
	addi	s0,sp,32	
	sd	a0,-24(s0)	
	ld	a5,-24(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringD1Ev		
	nop	
	ld	ra,24(sp)		
	ld	s0,16(sp)		
	addi	sp,sp,32	
	jr	ra		
.LFE4679:
	.set	_ZN14parsed_token_tD1Ev,_ZN14parsed_token_tD2Ev
_ZN7lexer_t11parse_spaceEv:
.LFB4677:
	addi	sp,sp,-48	
	sd	ra,40(sp)	
	sd	s0,32(sp)	
	addi	s0,sp,48	
	sd	a0,-40(s0)	
	sd	a1,-48(s0)	
	ld	a0,-48(s0)		
	call	_ZN7lexer_t8get_charEv		
	mv	a5,a0	
	sb	a5,-17(s0)	
	lbu	a5,-17(s0)	
	andi	a5,a5,0xff	
	bne	a5,zero,.L131	
	ld	a5,-40(s0)		
	li	a4,1		
	sd	a4,0(a5)	
	ld	a5,-40(s0)		
	sd	zero,8(a5)	
	ld	a5,-40(s0)		
	sd	zero,16(a5)	
	ld	a5,-40(s0)		
	sd	zero,24(a5)	
	ld	a5,-40(s0)		
	sd	zero,32(a5)	
	ld	a5,-40(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L132		
.L131:
	ld	a0,-48(s0)		
	call	_ZN7lexer_t7advanceEv		
	lbu	a5,-17(s0)	
	andi	a4,a5,0xff	
	li	a5,32		
	bne	a4,a5,.L133	
	ld	a5,-40(s0)		
	li	a4,3		
	sd	a4,0(a5)	
	ld	a5,-40(s0)		
	sd	zero,8(a5)	
	ld	a5,-40(s0)		
	sd	zero,16(a5)	
	ld	a5,-40(s0)		
	sd	zero,24(a5)	
	ld	a5,-40(s0)		
	sd	zero,32(a5)	
	ld	a5,-40(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L132		
.L133:
	lbu	a5,-17(s0)	
	andi	a4,a5,0xff	
	li	a5,9		
	bne	a4,a5,.L134	
	ld	a5,-40(s0)		
	li	a4,3		
	sd	a4,0(a5)	
	ld	a5,-40(s0)		
	sd	zero,8(a5)	
	ld	a5,-40(s0)		
	sd	zero,16(a5)	
	ld	a5,-40(s0)		
	sd	zero,24(a5)	
	ld	a5,-40(s0)		
	sd	zero,32(a5)	
	ld	a5,-40(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L132		
.L134:
	lbu	a5,-17(s0)	
	andi	a4,a5,0xff	
	li	a5,10		
	bne	a4,a5,.L135	
	ld	a5,-40(s0)		
	li	a4,2		
	sd	a4,0(a5)	
	ld	a5,-40(s0)		
	sd	zero,8(a5)	
	ld	a5,-40(s0)		
	sd	zero,16(a5)	
	ld	a5,-40(s0)		
	sd	zero,24(a5)	
	ld	a5,-40(s0)		
	sd	zero,32(a5)	
	ld	a5,-40(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L132		
.L135:
	ld	a5,-40(s0)		
	sd	zero,0(a5)	
	ld	a5,-48(s0)		
	ld	a5,40(a5)		
	addi	a4,a5,-1	
	ld	a5,-40(s0)		
	sd	a4,8(a5)	
	ld	a5,-48(s0)		
	ld	a4,40(a5)		
	ld	a5,-40(s0)		
	sd	a4,16(a5)	
	ld	a5,-48(s0)		
	ld	a4,48(a5)		
	ld	a5,-40(s0)		
	sd	a4,24(a5)	
	ld	a5,-48(s0)		
	ld	a4,56(a5)		
	ld	a5,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-40(s0)		
	addi	a5,a5,40	
	lbu	a4,-17(s0)	
	mv	a2,a4	
	li	a1,1		
	mv	a0,a5	
	call	_ZN4rstd6stringC1Emc		
.L132:
	ld	a0,-40(s0)		
	ld	ra,40(sp)		
	ld	s0,32(sp)		
	addi	sp,sp,48	
	jr	ra		
.LFE4677:
_ZN14parsed_token_tC2EOS_:
.LFB4683:
	addi	sp,sp,-32	
	sd	ra,24(sp)	
	sd	s0,16(sp)	
	addi	s0,sp,32	
	sd	a0,-24(s0)	
	sd	a1,-32(s0)	
	ld	a5,-32(s0)		
	ld	a4,0(a5)		
	ld	a5,-24(s0)		
	sd	a4,0(a5)	
	ld	a5,-32(s0)		
	ld	a4,8(a5)		
	ld	a5,-24(s0)		
	sd	a4,8(a5)	
	ld	a5,-32(s0)		
	ld	a4,16(a5)		
	ld	a5,-24(s0)		
	sd	a4,16(a5)	
	ld	a5,-32(s0)		
	ld	a4,24(a5)		
	ld	a5,-24(s0)		
	sd	a4,24(a5)	
	ld	a5,-32(s0)		
	ld	a4,32(a5)		
	ld	a5,-24(s0)		
	sd	a4,32(a5)	
	ld	a5,-24(s0)		
	addi	a4,a5,40	
	ld	a5,-32(s0)		
	addi	a5,a5,40	
	mv	a1,a5	
	mv	a0,a4	
	call	_ZN4rstd6stringC1ERKS0_		
	nop	
	ld	ra,24(sp)		
	ld	s0,16(sp)		
	addi	sp,sp,32	
	jr	ra		
.LFE4683:
	.set	_ZN14parsed_token_tC1EOS_,_ZN14parsed_token_tC2EOS_
_ZN7lexer_t10parse_nameEmmmm:
.LFB4681:
	addi	sp,sp,-144	
	sd	ra,136(sp)	
	sd	s0,128(sp)	
	addi	s0,sp,144	
	sd	a0,-104(s0)	
	sd	a1,-112(s0)	
	sd	a2,-120(s0)	
	sd	a3,-128(s0)	
	sd	a4,-136(s0)	
	sd	a5,-144(s0)	
	ld	a5,-144(s0)		
	bne	a5,zero,.L138	
	ld	a5,-112(s0)		
	addi	a5,a5,64	
	mv	a0,a5	
	call	_ZN4rstd6string5clearEv		
.L138:
	ld	a0,-112(s0)		
	call	_ZN7lexer_t8get_charEv		
	mv	a5,a0	
	sb	a5,-17(s0)	
	j	.L139		
.L140:
	ld	a5,-112(s0)		
	addi	a5,a5,64	
	lbu	a4,-17(s0)	
	mv	a1,a4	
	mv	a0,a5	
	call	_ZN4rstd6string9push_backEc		
	ld	a0,-112(s0)		
	call	_ZN7lexer_t7advanceEv		
	ld	a0,-112(s0)		
	call	_ZN7lexer_t8get_charEv		
	mv	a5,a0	
	sb	a5,-17(s0)	
.L139:
	lbu	a5,-17(s0)	
	mv	a1,a5	
	ld	a0,-112(s0)		
	call	_ZN7lexer_t17can_continue_nameEc		
	mv	a5,a0	
	bne	a5,zero,.L140	
	ld	a5,-112(s0)		
	ld	a4,40(a5)		
	ld	a5,-120(s0)		
	sub	a5,a4,a5	
	ld	a4,-144(s0)		
	add	a5,a4,a5	
	sd	a5,-144(s0)	
	ld	a5,-144(s0)		
	bne	a5,zero,.L141	
	ld	a5,-104(s0)		
	ld	a1,-112(s0)		
	mv	a0,a5	
	call	_ZN7lexer_t11parse_spaceEv		
	j	.L143		
.L141:
	sd	zero,-88(s0)	
	sd	zero,-80(s0)	
	sd	zero,-72(s0)	
	sd	zero,-64(s0)	
	sd	zero,-56(s0)	
	sd	zero,-48(s0)	
	sd	zero,-40(s0)	
	sd	zero,-32(s0)	
	li	a5,6		
	sd	a5,-88(s0)	
	ld	a5,-120(s0)		
	sd	a5,-80(s0)	
	ld	a5,-112(s0)		
	ld	a5,40(a5)		
	sd	a5,-72(s0)	
	ld	a5,-128(s0)		
	sd	a5,-64(s0)	
	ld	a5,-136(s0)		
	sd	a5,-56(s0)	
	ld	a5,-112(s0)		
	addi	a4,a5,64	
	addi	a5,s0,-88	
	addi	a5,a5,40	
	mv	a1,a4	
	mv	a0,a5	
	call	_ZN4rstd6stringC1ERKS0_		
	ld	a5,-112(s0)		
	addi	a5,a5,64	
	mv	a0,a5	
	call	_ZN4rstd6string5clearEv		
	addi	a5,s0,-88	
	mv	a1,a5	
	ld	a0,-104(s0)		
	call	_ZN14parsed_token_tC1EOS_		
	addi	a5,s0,-88	
	mv	a0,a5	
	call	_ZN14parsed_token_tD1Ev		
.L143:
	ld	a0,-104(s0)		
	ld	ra,136(sp)		
	ld	s0,128(sp)		
	addi	sp,sp,144	
	jr	ra		
.LFE4681:
_ZN7lexer_t12parse_numberEv:
.LFB4685:
	addi	sp,sp,-208	
	sd	ra,200(sp)	
	sd	s0,192(sp)	
	addi	s0,sp,208	
	sd	a0,-200(s0)	
	sd	a1,-208(s0)	
	sd	zero,-24(s0)	
	ld	a5,-208(s0)		
	ld	a5,40(a5)		
	sd	a5,-40(s0)	
	ld	a5,-208(s0)		
	ld	a5,56(a5)		
	sd	a5,-48(s0)	
	ld	a5,-208(s0)		
	ld	a5,48(a5)		
	sd	a5,-56(s0)	
	ld	a5,-208(s0)		
	addi	a5,a5,64	
	mv	a0,a5	
	call	_ZN4rstd6string5clearEv		
	ld	a0,-208(s0)		
	call	_ZN7lexer_t8get_charEv		
	mv	a5,a0	
	sb	a5,-25(s0)	
	j	.L145		
.L146:
	ld	a5,-208(s0)		
	addi	a5,a5,64	
	lbu	a4,-25(s0)	
	mv	a1,a4	
	mv	a0,a5	
	call	_ZN4rstd6string9push_backEc		
	ld	a0,-208(s0)		
	call	_ZN7lexer_t7advanceEv		
	ld	a5,-24(s0)		
	addi	a5,a5,1	
	sd	a5,-24(s0)	
	ld	a0,-208(s0)		
	call	_ZN7lexer_t8get_charEv		
	mv	a5,a0	
	sb	a5,-25(s0)	
.L145:
	lbu	a5,-25(s0)	
	mv	a1,a5	
	ld	a0,-208(s0)		
	call	_ZN7lexer_t7isdigitEc		
	mv	a5,a0	
	bne	a5,zero,.L146	
	ld	a5,-24(s0)		
	bne	a5,zero,.L147	
	ld	a0,-200(s0)		
	ld	a5,-24(s0)		
	ld	a4,-48(s0)		
	ld	a3,-56(s0)		
	ld	a2,-40(s0)		
	ld	a1,-208(s0)		
	call	_ZN7lexer_t10parse_nameEmmmm		
	j	.L144		
.L147:
	lbu	a5,-25(s0)	
	andi	a5,a5,0xff	
	beq	a5,zero,.L149	
	lbu	a5,-25(s0)	
	andi	a4,a5,0xff	
	li	a5,46		
	beq	a4,a5,.L150	
.L149:
	sd	zero,-184(s0)	
	sd	zero,-176(s0)	
	sd	zero,-168(s0)	
	sd	zero,-160(s0)	
	sd	zero,-152(s0)	
	sd	zero,-144(s0)	
	sd	zero,-136(s0)	
	sd	zero,-128(s0)	
	li	a5,4		
	sd	a5,-184(s0)	
	ld	a5,-40(s0)		
	sd	a5,-176(s0)	
	ld	a5,-208(s0)		
	ld	a5,40(a5)		
	sd	a5,-168(s0)	
	ld	a5,-56(s0)		
	sd	a5,-160(s0)	
	ld	a5,-48(s0)		
	sd	a5,-152(s0)	
	ld	a5,-208(s0)		
	addi	a4,a5,64	
	addi	a5,s0,-184	
	addi	a5,a5,40	
	mv	a1,a4	
	mv	a0,a5	
	call	_ZN4rstd6stringC1ERKS0_		
	ld	a5,-208(s0)		
	addi	a5,a5,64	
	mv	a0,a5	
	call	_ZN4rstd6string5clearEv		
	addi	a5,s0,-184	
	mv	a1,a5	
	ld	a0,-200(s0)		
	call	_ZN14parsed_token_tC1EOS_		
	addi	a5,s0,-184	
	mv	a0,a5	
	call	_ZN14parsed_token_tD1Ev		
	j	.L144		
.L150:
	ld	a5,-208(s0)		
	addi	a5,a5,64	
	lbu	a4,-25(s0)	
	mv	a1,a4	
	mv	a0,a5	
	call	_ZN4rstd6string9push_backEc		
	ld	a0,-208(s0)		
	call	_ZN7lexer_t7advanceEv		
	ld	a5,-24(s0)		
	addi	a5,a5,1	
	sd	a5,-24(s0)	
	j	.L151		
.L152:
	ld	a5,-208(s0)		
	addi	a5,a5,64	
	lbu	a4,-25(s0)	
	mv	a1,a4	
	mv	a0,a5	
	call	_ZN4rstd6string9push_backEc		
	ld	a0,-208(s0)		
	call	_ZN7lexer_t7advanceEv		
	ld	a5,-24(s0)		
	addi	a5,a5,1	
	sd	a5,-24(s0)	
.L151:
	lbu	a5,-25(s0)	
	mv	a1,a5	
	ld	a0,-208(s0)		
	call	_ZN7lexer_t7isdigitEc		
	mv	a5,a0	
	bne	a5,zero,.L152	
	sd	zero,-120(s0)	
	sd	zero,-112(s0)	
	sd	zero,-104(s0)	
	sd	zero,-96(s0)	
	sd	zero,-88(s0)	
	sd	zero,-80(s0)	
	sd	zero,-72(s0)	
	sd	zero,-64(s0)	
	li	a5,4		
	sd	a5,-120(s0)	
	ld	a5,-40(s0)		
	sd	a5,-112(s0)	
	ld	a5,-208(s0)		
	ld	a5,40(a5)		
	sd	a5,-104(s0)	
	ld	a5,-56(s0)		
	sd	a5,-96(s0)	
	ld	a5,-48(s0)		
	sd	a5,-88(s0)	
	ld	a5,-208(s0)		
	addi	a4,a5,64	
	addi	a5,s0,-120	
	addi	a5,a5,40	
	mv	a1,a4	
	mv	a0,a5	
	call	_ZN4rstd6stringC1ERKS0_		
	ld	a5,-208(s0)		
	addi	a5,a5,64	
	mv	a0,a5	
	call	_ZN4rstd6string5clearEv		
	addi	a5,s0,-120	
	mv	a1,a5	
	ld	a0,-200(s0)		
	call	_ZN14parsed_token_tC1EOS_		
	addi	a5,s0,-120	
	mv	a0,a5	
	call	_ZN14parsed_token_tD1Ev		
.L144:
	ld	a0,-200(s0)		
	ld	ra,200(sp)		
	ld	s0,192(sp)		
	addi	sp,sp,208	
	jr	ra		
.LFE4685:
_ZN7lexer_t13parse_commentEv:
.LFB4686:
	addi	sp,sp,-64	
	sd	ra,56(sp)	
	sd	s0,48(sp)	
	addi	s0,sp,64	
	sd	a0,-56(s0)	
	sd	a1,-64(s0)	
	ld	a5,-64(s0)		
	ld	a5,40(a5)		
	sd	a5,-24(s0)	
	ld	a5,-64(s0)		
	ld	a5,56(a5)		
	sd	a5,-32(s0)	
	ld	a5,-64(s0)		
	ld	a5,48(a5)		
	sd	a5,-40(s0)	
	ld	a5,-64(s0)		
	addi	a5,a5,64	
	mv	a0,a5	
	call	_ZN4rstd6string5clearEv		
	ld	a0,-64(s0)		
	call	_ZN7lexer_t8get_charEv		
	mv	a5,a0	
	sb	a5,-41(s0)	
	lbu	a5,-41(s0)	
	andi	a5,a5,0xff	
	bne	a5,zero,.L155	
	ld	a5,-56(s0)		
	li	a4,1		
	sd	a4,0(a5)	
	ld	a5,-56(s0)		
	sd	zero,8(a5)	
	ld	a5,-56(s0)		
	sd	zero,16(a5)	
	ld	a5,-56(s0)		
	sd	zero,24(a5)	
	ld	a5,-56(s0)		
	sd	zero,32(a5)	
	ld	a5,-56(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L156		
.L155:
	lbu	a5,-41(s0)	
	andi	a4,a5,0xff	
	li	a5,35		
	bne	a4,a5,.L157	
	j	.L158		
.L160:
	ld	a5,-64(s0)		
	addi	a5,a5,64	
	lbu	a4,-41(s0)	
	mv	a1,a4	
	mv	a0,a5	
	call	_ZN4rstd6string9push_backEc		
	ld	a0,-64(s0)		
	call	_ZN7lexer_t7advanceEv		
.L158:
	lbu	a5,-41(s0)	
	andi	a4,a5,0xff	
	li	a5,10		
	beq	a4,a5,.L159	
	lbu	a5,-41(s0)	
	andi	a5,a5,0xff	
	bne	a5,zero,.L160	
.L159:
	ld	a5,-56(s0)		
	li	a4,81		
	sd	a4,0(a5)	
	ld	a5,-56(s0)		
	ld	a4,-24(s0)		
	sd	a4,8(a5)	
	ld	a5,-64(s0)		
	ld	a4,40(a5)		
	ld	a5,-56(s0)		
	sd	a4,16(a5)	
	ld	a5,-56(s0)		
	ld	a4,-40(s0)		
	sd	a4,24(a5)	
	ld	a5,-56(s0)		
	ld	a4,-32(s0)		
	sd	a4,32(a5)	
	ld	a5,-56(s0)		
	addi	a4,a5,40	
	ld	a5,-64(s0)		
	addi	a5,a5,64	
	mv	a1,a5	
	mv	a0,a4	
	call	_ZN4rstd6stringC1ERKS0_		
	j	.L156		
.L157:
	ld	a5,-56(s0)		
	sd	zero,0(a5)	
	ld	a5,-56(s0)		
	ld	a4,-24(s0)		
	sd	a4,8(a5)	
	ld	a5,-64(s0)		
	ld	a4,40(a5)		
	ld	a5,-56(s0)		
	sd	a4,16(a5)	
	ld	a5,-56(s0)		
	ld	a4,-40(s0)		
	sd	a4,24(a5)	
	ld	a5,-56(s0)		
	ld	a4,-32(s0)		
	sd	a4,32(a5)	
	ld	a5,-56(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
.L156:
	ld	a0,-56(s0)		
	ld	ra,56(sp)		
	ld	s0,48(sp)		
	addi	sp,sp,64	
	jr	ra		
.LFE4686:
_ZN7lexer_t21parse_string_unescapeEv:
.LFB4687:
	addi	sp,sp,-112	
	sd	ra,104(sp)	
	sd	s0,96(sp)	
	addi	s0,sp,112	
	sd	a0,-104(s0)	
	sd	a1,-112(s0)	
	ld	a5,-112(s0)		
	ld	a5,40(a5)		
	sd	a5,-32(s0)	
	ld	a5,-112(s0)		
	ld	a5,56(a5)		
	sd	a5,-40(s0)	
	ld	a5,-112(s0)		
	ld	a5,48(a5)		
	sd	a5,-48(s0)	
	ld	a5,-112(s0)		
	addi	a5,a5,64	
	mv	a0,a5	
	call	_ZN4rstd6string5clearEv		
	ld	a0,-112(s0)		
	call	_ZN7lexer_t8get_charEv		
	mv	a5,a0	
	sb	a5,-49(s0)	
	ld	a0,-112(s0)		
	call	_ZN7lexer_t7advanceEv		
	ld	a0,-112(s0)		
	call	_ZN7lexer_t8get_charEv		
	mv	a5,a0	
	sb	a5,-17(s0)	
	j	.L162		
.L173:
	lbu	a5,-17(s0)	
	andi	a5,a5,0xff	
	bne	a5,zero,.L163	
	ld	a5,-104(s0)		
	sd	zero,0(a5)	
	ld	a5,-104(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-112(s0)		
	ld	a4,40(a5)		
	ld	a5,-104(s0)		
	sd	a4,16(a5)	
	ld	a5,-104(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-104(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-104(s0)		
	addi	a4,a5,40	
	ld	a5,-112(s0)		
	addi	a5,a5,64	
	mv	a1,a5	
	mv	a0,a4	
	call	_ZN4rstd6stringC1ERKS0_		
	j	.L164		
.L163:
	lbu	a5,-17(s0)	
	andi	a4,a5,0xff	
	li	a5,92		
	bne	a4,a5,.L165	
	ld	a5,-112(s0)		
	ld	a5,40(a5)		
	sd	a5,-64(s0)	
	ld	a5,-112(s0)		
	ld	a5,56(a5)		
	sd	a5,-72(s0)	
	ld	a5,-112(s0)		
	ld	a5,48(a5)		
	sd	a5,-80(s0)	
	ld	a0,-112(s0)		
	call	_ZN7lexer_t7advanceEv		
	ld	a0,-112(s0)		
	call	_ZN7lexer_t8get_charEv		
	mv	a5,a0	
	sb	a5,-81(s0)	
	lbu	a5,-81(s0)	
	sext.w	a5,a5	
	mv	a3,a5	
	li	a4,116		
	beq	a3,a4,.L166	
	mv	a3,a5	
	li	a4,116		
	bgt	a3,a4,.L167	
	mv	a3,a5	
	li	a4,114		
	beq	a3,a4,.L168	
	mv	a3,a5	
	li	a4,114		
	bgt	a3,a4,.L167	
	mv	a3,a5	
	li	a4,48		
	beq	a3,a4,.L169	
	mv	a4,a5	
	li	a5,110		
	bne	a4,a5,.L167	
	ld	a5,-112(s0)		
	addi	a5,a5,64	
	li	a1,10		
	mv	a0,a5	
	call	_ZN4rstd6string9push_backEc		
	j	.L171		
.L166:
	ld	a5,-112(s0)		
	addi	a5,a5,64	
	li	a1,9		
	mv	a0,a5	
	call	_ZN4rstd6string9push_backEc		
	j	.L171		
.L168:
	ld	a5,-112(s0)		
	addi	a5,a5,64	
	li	a1,13		
	mv	a0,a5	
	call	_ZN4rstd6string9push_backEc		
	j	.L171		
.L169:
	ld	a5,-112(s0)		
	addi	a5,a5,64	
	li	a1,0		
	mv	a0,a5	
	call	_ZN4rstd6string9push_backEc		
	j	.L171		
.L167:
	ld	a5,-112(s0)		
	addi	a5,a5,64	
	lbu	a4,-17(s0)	
	mv	a1,a4	
	mv	a0,a5	
	call	_ZN4rstd6string9push_backEc		
	ld	a5,-112(s0)		
	addi	a5,a5,64	
	lbu	a4,-81(s0)	
	mv	a1,a4	
	mv	a0,a5	
	call	_ZN4rstd6string9push_backEc		
	ld	a5,-104(s0)		
	sd	zero,0(a5)	
	ld	a5,-104(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-112(s0)		
	ld	a4,40(a5)		
	ld	a5,-104(s0)		
	sd	a4,16(a5)	
	ld	a5,-104(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-104(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-104(s0)		
	addi	a4,a5,40	
	ld	a5,-112(s0)		
	addi	a5,a5,64	
	mv	a1,a5	
	mv	a0,a4	
	call	_ZN4rstd6stringC1ERKS0_		
	j	.L164		
.L165:
	lbu	a5,-17(s0)	
	andi	a4,a5,0xff	
	li	a5,10		
	bne	a4,a5,.L172	
	ld	a5,-104(s0)		
	sd	zero,0(a5)	
	ld	a5,-104(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-112(s0)		
	ld	a4,40(a5)		
	ld	a5,-104(s0)		
	sd	a4,16(a5)	
	ld	a5,-104(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-104(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-104(s0)		
	addi	a4,a5,40	
	ld	a5,-112(s0)		
	addi	a5,a5,64	
	mv	a1,a5	
	mv	a0,a4	
	call	_ZN4rstd6stringC1ERKS0_		
	j	.L164		
.L172:
	ld	a5,-112(s0)		
	addi	a5,a5,64	
	lbu	a4,-17(s0)	
	mv	a1,a4	
	mv	a0,a5	
	call	_ZN4rstd6string9push_backEc		
.L171:
	ld	a0,-112(s0)		
	call	_ZN7lexer_t7advanceEv		
	ld	a0,-112(s0)		
	call	_ZN7lexer_t8get_charEv		
	mv	a5,a0	
	sb	a5,-17(s0)	
.L162:
	lbu	a5,-17(s0)	
	mv	a4,a5	
	lbu	a5,-49(s0)	
	andi	a4,a4,0xff	
	andi	a5,a5,0xff	
	bne	a4,a5,.L173	
	ld	a0,-112(s0)		
	call	_ZN7lexer_t7advanceEv		
	ld	a5,-104(s0)		
	li	a4,80		
	sd	a4,0(a5)	
	ld	a5,-104(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-112(s0)		
	ld	a4,40(a5)		
	ld	a5,-104(s0)		
	sd	a4,16(a5)	
	ld	a5,-104(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-104(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-104(s0)		
	addi	a4,a5,40	
	ld	a5,-112(s0)		
	addi	a5,a5,64	
	mv	a1,a5	
	mv	a0,a4	
	call	_ZN4rstd6stringC1ERKS0_		
.L164:
	ld	a0,-104(s0)		
	ld	ra,104(sp)		
	ld	s0,96(sp)		
	addi	sp,sp,112	
	jr	ra		
.LFE4687:
.LC83:
	.string	">>="
.LC84:
	.string	">="
.LC85:
	.string	"<<="
.LC86:
	.string	"<="
.LC87:
	.string	"=="
.LC88:
	.string	"="
.LC89:
	.string	"!="
.LC90:
	.string	"+="
.LC91:
	.string	"-="
.LC92:
	.string	"**="
.LC93:
	.string	"*="
.LC94:
	.string	"//="
.LC95:
	.string	"/="
.LC96:
	.string	"%="
.LC97:
	.string	"|="
.LC98:
	.string	"&="
.LC99:
	.string	"^="
.LC100:
	.string	"~="
_ZN7lexer_t14parse_non_nameEv:
.LFB4688:
	addi	sp,sp,-80	
	sd	ra,72(sp)	
	sd	s0,64(sp)	
	addi	s0,sp,80	
	sd	a0,-72(s0)	
	sd	a1,-80(s0)	
	ld	a5,-80(s0)		
	ld	a5,40(a5)		
	sd	a5,-32(s0)	
	ld	a5,-80(s0)		
	ld	a5,56(a5)		
	sd	a5,-40(s0)	
	ld	a5,-80(s0)		
	ld	a5,48(a5)		
	sd	a5,-48(s0)	
	ld	a5,-80(s0)		
	addi	a5,a5,64	
	mv	a0,a5	
	call	_ZN4rstd6string5clearEv		
	ld	a0,-80(s0)		
	call	_ZN7lexer_t8get_charEv		
	mv	a5,a0	
	sb	a5,-49(s0)	
	lbu	a5,-49(s0)	
	andi	a5,a5,0xff	
	bne	a5,zero,.L175	
	ld	a5,-72(s0)		
	li	a4,1		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	sd	zero,8(a5)	
	ld	a5,-72(s0)		
	sd	zero,16(a5)	
	ld	a5,-72(s0)		
	sd	zero,24(a5)	
	ld	a5,-72(s0)		
	sd	zero,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L176		
.L175:
	li	a2,0		
	lui	a5,%hi(.LC83)	
	addi	a1,a5,%lo(.LC83)	
	ld	a0,-80(s0)		
	call	_ZN7lexer_t11parse_exactEPKcm		
	sd	a0,-64(s0)	
	ld	a4,-64(s0)		
	li	a5,3		
	bne	a4,a5,.L177	
	ld	a5,-72(s0)		
	li	a4,66		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L176		
.L177:
	ld	a4,-64(s0)		
	li	a5,2		
	bne	a4,a5,.L178	
	ld	a5,-72(s0)		
	li	a4,44		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L176		
.L178:
	ld	a4,-64(s0)		
	li	a5,1		
	bne	a4,a5,.L179	
	ld	a2,-64(s0)		
	lui	a5,%hi(.LC84)	
	addi	a1,a5,%lo(.LC84)	
	ld	a0,-80(s0)		
	call	_ZN7lexer_t11parse_exactEPKcm		
	sd	a0,-64(s0)	
	ld	a4,-64(s0)		
	li	a5,2		
	bne	a4,a5,.L180	
	ld	a5,-72(s0)		
	li	a4,50		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L176		
.L180:
	ld	a4,-64(s0)		
	li	a5,1		
	bne	a4,a5,.L179	
	ld	a5,-72(s0)		
	li	a4,48		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L176		
.L179:
	li	a2,0		
	lui	a5,%hi(.LC85)	
	addi	a1,a5,%lo(.LC85)	
	ld	a0,-80(s0)		
	call	_ZN7lexer_t11parse_exactEPKcm		
	sd	a0,-64(s0)	
	ld	a4,-64(s0)		
	li	a5,3		
	bne	a4,a5,.L181	
	ld	a5,-72(s0)		
	li	a4,65		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L176		
.L181:
	ld	a4,-64(s0)		
	li	a5,2		
	bne	a4,a5,.L182	
	ld	a5,-72(s0)		
	li	a4,43		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L176		
.L182:
	ld	a4,-64(s0)		
	li	a5,1		
	bne	a4,a5,.L183	
	ld	a2,-64(s0)		
	lui	a5,%hi(.LC86)	
	addi	a1,a5,%lo(.LC86)	
	ld	a0,-80(s0)		
	call	_ZN7lexer_t11parse_exactEPKcm		
	sd	a0,-64(s0)	
	ld	a4,-64(s0)		
	li	a5,2		
	bne	a4,a5,.L184	
	ld	a5,-72(s0)		
	li	a4,49		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L176		
.L184:
	ld	a4,-64(s0)		
	li	a5,1		
	bne	a4,a5,.L183	
	ld	a5,-72(s0)		
	li	a4,47		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L176		
.L183:
	li	a2,0		
	lui	a5,%hi(.LC87)	
	addi	a1,a5,%lo(.LC87)	
	ld	a0,-80(s0)		
	call	_ZN7lexer_t11parse_exactEPKcm		
	sd	a0,-64(s0)	
	ld	a4,-64(s0)		
	li	a5,2		
	bne	a4,a5,.L185	
	ld	a5,-72(s0)		
	li	a4,45		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L176		
.L185:
	ld	a4,-64(s0)		
	li	a5,1		
	bne	a4,a5,.L186	
	ld	a2,-64(s0)		
	lui	a5,%hi(.LC88)	
	addi	a1,a5,%lo(.LC88)	
	ld	a0,-80(s0)		
	call	_ZN7lexer_t11parse_exactEPKcm		
	sd	a0,-64(s0)	
	ld	a4,-64(s0)		
	li	a5,1		
	bne	a4,a5,.L186	
	ld	a5,-72(s0)		
	li	a4,54		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L176		
.L186:
	li	a2,0		
	lui	a5,%hi(.LC89)	
	addi	a1,a5,%lo(.LC89)	
	ld	a0,-80(s0)		
	call	_ZN7lexer_t11parse_exactEPKcm		
	sd	a0,-64(s0)	
	ld	a4,-64(s0)		
	li	a5,2		
	bne	a4,a5,.L187	
	ld	a5,-72(s0)		
	li	a4,46		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L176		
.L187:
	ld	a4,-64(s0)		
	li	a5,1		
	bne	a4,a5,.L188	
	ld	a5,-72(s0)		
	sd	zero,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a4,a5,40	
	ld	a5,-80(s0)		
	addi	a5,a5,64	
	mv	a1,a5	
	mv	a0,a4	
	call	_ZN4rstd6stringC1ERKS0_		
	j	.L176		
.L188:
	li	a2,0		
	lui	a5,%hi(.LC90)	
	addi	a1,a5,%lo(.LC90)	
	ld	a0,-80(s0)		
	call	_ZN7lexer_t11parse_exactEPKcm		
	sd	a0,-64(s0)	
	ld	a4,-64(s0)		
	li	a5,2		
	bne	a4,a5,.L189	
	ld	a5,-72(s0)		
	li	a4,55		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L176		
.L189:
	ld	a4,-64(s0)		
	li	a5,1		
	bne	a4,a5,.L190	
	ld	a5,-72(s0)		
	li	a4,32		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L176		
.L190:
	li	a2,0		
	lui	a5,%hi(.LC91)	
	addi	a1,a5,%lo(.LC91)	
	ld	a0,-80(s0)		
	call	_ZN7lexer_t11parse_exactEPKcm		
	sd	a0,-64(s0)	
	ld	a4,-64(s0)		
	li	a5,2		
	bne	a4,a5,.L191	
	ld	a5,-72(s0)		
	li	a4,56		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L176		
.L191:
	ld	a4,-64(s0)		
	li	a5,1		
	bne	a4,a5,.L192	
	ld	a5,-72(s0)		
	li	a4,33		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L176		
.L192:
	li	a2,0		
	lui	a5,%hi(.LC92)	
	addi	a1,a5,%lo(.LC92)	
	ld	a0,-80(s0)		
	call	_ZN7lexer_t11parse_exactEPKcm		
	sd	a0,-64(s0)	
	ld	a4,-64(s0)		
	li	a5,3		
	bne	a4,a5,.L193	
	ld	a5,-72(s0)		
	li	a4,60		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L176		
.L193:
	ld	a4,-64(s0)		
	li	a5,2		
	bne	a4,a5,.L194	
	ld	a5,-72(s0)		
	li	a4,37		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L176		
.L194:
	ld	a4,-64(s0)		
	li	a5,1		
	bne	a4,a5,.L195	
	ld	a2,-64(s0)		
	lui	a5,%hi(.LC93)	
	addi	a1,a5,%lo(.LC93)	
	ld	a0,-80(s0)		
	call	_ZN7lexer_t11parse_exactEPKcm		
	sd	a0,-64(s0)	
	ld	a4,-64(s0)		
	li	a5,2		
	bne	a4,a5,.L196	
	ld	a5,-72(s0)		
	li	a4,57		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L176		
.L196:
	ld	a4,-64(s0)		
	li	a5,1		
	bne	a4,a5,.L195	
	ld	a5,-72(s0)		
	li	a4,34		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L176		
.L195:
	li	a2,0		
	lui	a5,%hi(.LC94)	
	addi	a1,a5,%lo(.LC94)	
	ld	a0,-80(s0)		
	call	_ZN7lexer_t11parse_exactEPKcm		
	sd	a0,-64(s0)	
	ld	a4,-64(s0)		
	li	a5,3		
	bne	a4,a5,.L197	
	ld	a5,-72(s0)		
	li	a4,61		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L176		
.L197:
	ld	a4,-64(s0)		
	li	a5,2		
	bne	a4,a5,.L198	
	ld	a5,-72(s0)		
	li	a4,38		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L176		
.L198:
	ld	a4,-64(s0)		
	li	a5,1		
	bne	a4,a5,.L199	
	ld	a2,-64(s0)		
	lui	a5,%hi(.LC95)	
	addi	a1,a5,%lo(.LC95)	
	ld	a0,-80(s0)		
	call	_ZN7lexer_t11parse_exactEPKcm		
	sd	a0,-64(s0)	
	ld	a4,-64(s0)		
	li	a5,2		
	bne	a4,a5,.L200	
	ld	a5,-72(s0)		
	li	a4,58		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L176		
.L200:
	ld	a5,-72(s0)		
	li	a4,35		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L176		
.L199:
	li	a2,0		
	lui	a5,%hi(.LC96)	
	addi	a1,a5,%lo(.LC96)	
	ld	a0,-80(s0)		
	call	_ZN7lexer_t11parse_exactEPKcm		
	sd	a0,-64(s0)	
	ld	a4,-64(s0)		
	li	a5,2		
	bne	a4,a5,.L201	
	ld	a5,-72(s0)		
	li	a4,59		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L176		
.L201:
	ld	a4,-64(s0)		
	li	a5,1		
	bne	a4,a5,.L202	
	ld	a5,-72(s0)		
	li	a4,36		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L176		
.L202:
	li	a2,0		
	lui	a5,%hi(.LC97)	
	addi	a1,a5,%lo(.LC97)	
	ld	a0,-80(s0)		
	call	_ZN7lexer_t11parse_exactEPKcm		
	sd	a0,-64(s0)	
	ld	a4,-64(s0)		
	li	a5,2		
	bne	a4,a5,.L203	
	ld	a5,-72(s0)		
	li	a4,63		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L176		
.L203:
	ld	a4,-64(s0)		
	li	a5,1		
	bne	a4,a5,.L204	
	ld	a5,-72(s0)		
	li	a4,41		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L176		
.L204:
	li	a2,0		
	lui	a5,%hi(.LC98)	
	addi	a1,a5,%lo(.LC98)	
	ld	a0,-80(s0)		
	call	_ZN7lexer_t11parse_exactEPKcm		
	sd	a0,-64(s0)	
	ld	a4,-64(s0)		
	li	a5,2		
	bne	a4,a5,.L205	
	ld	a5,-72(s0)		
	li	a4,62		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L176		
.L205:
	ld	a4,-64(s0)		
	li	a5,1		
	bne	a4,a5,.L206	
	ld	a5,-72(s0)		
	li	a4,40		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L176		
.L206:
	li	a2,0		
	lui	a5,%hi(.LC99)	
	addi	a1,a5,%lo(.LC99)	
	ld	a0,-80(s0)		
	call	_ZN7lexer_t11parse_exactEPKcm		
	sd	a0,-64(s0)	
	ld	a4,-64(s0)		
	li	a5,2		
	bne	a4,a5,.L207	
	ld	a5,-72(s0)		
	li	a4,64		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L176		
.L207:
	ld	a4,-64(s0)		
	li	a5,1		
	bne	a4,a5,.L208	
	ld	a5,-72(s0)		
	li	a4,42		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L176		
.L208:
	li	a2,0		
	lui	a5,%hi(.LC100)	
	addi	a1,a5,%lo(.LC100)	
	ld	a0,-80(s0)		
	call	_ZN7lexer_t11parse_exactEPKcm		
	sd	a0,-64(s0)	
	ld	a4,-64(s0)		
	li	a5,2		
	bne	a4,a5,.L209	
	ld	a5,-72(s0)		
	li	a4,67		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L176		
.L209:
	ld	a4,-64(s0)		
	li	a5,1		
	bne	a4,a5,.L210	
	ld	a5,-72(s0)		
	li	a4,39		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L176		
.L210:
	sd	zero,-24(s0)	
	lbu	a5,-49(s0)	
	sext.w	a5,a5	
	addiw	a3,a5,-34	
	sext.w	a4,a3	
	li	a5,91		
	bgtu	a4,a5,.L211	
	slli	a5,a3,32	
	srli	a5,a5,32	
	slli	a4,a5,2	
	lui	a5,%hi(.L213)	
	addi	a5,a5,%lo(.L213)	
	add	a5,a4,a5	
	lw	a5,0(a5)		
	jr	a5		
.L213:
	.word	.L225
	.word	.L224
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L223
	.word	.L222
	.word	.L221
	.word	.L211
	.word	.L211
	.word	.L220
	.word	.L211
	.word	.L219
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L218
	.word	.L217
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L216
	.word	.L211
	.word	.L215
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L211
	.word	.L214
	.word	.L211
	.word	.L212
.L220:
	li	a5,68		
	sd	a5,-24(s0)	
	j	.L226		
.L219:
	li	a5,69		
	sd	a5,-24(s0)	
	j	.L226		
.L218:
	li	a5,70		
	sd	a5,-24(s0)	
	j	.L226		
.L217:
	li	a5,71		
	sd	a5,-24(s0)	
	j	.L226		
.L222:
	li	a5,72		
	sd	a5,-24(s0)	
	j	.L226		
.L221:
	li	a5,73		
	sd	a5,-24(s0)	
	j	.L226		
.L216:
	li	a5,74		
	sd	a5,-24(s0)	
	j	.L226		
.L215:
	li	a5,75		
	sd	a5,-24(s0)	
	j	.L226		
.L214:
	li	a5,76		
	sd	a5,-24(s0)	
	j	.L226		
.L212:
	li	a5,77		
	sd	a5,-24(s0)	
	j	.L226		
.L225:
	li	a5,78		
	sd	a5,-24(s0)	
	j	.L226		
.L223:
	li	a5,79		
	sd	a5,-24(s0)	
	j	.L226		
.L224:
	li	a5,81		
	sd	a5,-24(s0)	
	j	.L226		
.L211:
	sd	zero,-24(s0)	
	nop	
.L226:
	ld	a4,-24(s0)		
	li	a5,81		
	bne	a4,a5,.L227	
	ld	a5,-72(s0)		
	ld	a1,-80(s0)		
	mv	a0,a5	
	call	_ZN7lexer_t13parse_commentEv		
	j	.L176		
.L227:
	ld	a4,-24(s0)		
	li	a5,78		
	beq	a4,a5,.L228	
	ld	a4,-24(s0)		
	li	a5,79		
	bne	a4,a5,.L229	
.L228:
	ld	a5,-72(s0)		
	ld	a1,-80(s0)		
	mv	a0,a5	
	call	_ZN7lexer_t21parse_string_unescapeEv		
	j	.L176		
.L229:
	ld	a5,-24(s0)		
	beq	a5,zero,.L230	
	ld	a0,-80(s0)		
	call	_ZN7lexer_t7advanceEv		
	ld	a5,-72(s0)		
	ld	a4,-24(s0)		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L176		
.L230:
	ld	a5,-72(s0)		
	sd	zero,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
.L176:
	ld	a0,-72(s0)		
	ld	ra,72(sp)		
	ld	s0,64(sp)		
	addi	sp,sp,80	
	jr	ra		
.LFE4688:
.LC101:
	.string	"and"
.LC102:
	.string	"as"
.LC103:
	.string	"break"
.LC104:
	.string	"bool"
.LC105:
	.string	"continue"
.LC106:
	.string	"dict"
.LC107:
	.string	"def"
.LC108:
	.string	"del"
.LC109:
	.string	"exception"
.LC110:
	.string	"except"
.LC111:
	.string	"from"
.LC112:
	.string	"for"
.LC113:
	.string	"getattr"
.LC114:
	.string	"import"
.LC115:
	.string	"is"
.LC116:
	.string	"in"
.LC117:
	.string	"if"
.LC118:
	.string	"list"
.LC119:
	.string	"len"
.LC120:
	.string	"or"
.LC121:
	.string	"return"
.LC122:
	.string	"setattr"
.LC123:
	.string	"set"
.LC124:
	.string	"yield"
_ZN7lexer_t8next_tokEv:
.LFB4689:
	addi	sp,sp,-80	
	sd	ra,72(sp)	
	sd	s0,64(sp)	
	addi	s0,sp,80	
	sd	a0,-72(s0)	
	sd	a1,-80(s0)	
	ld	a5,-80(s0)		
	addi	a5,a5,64	
	mv	a0,a5	
	call	_ZN4rstd6string5clearEv		
	ld	a0,-80(s0)		
	call	_ZN7lexer_t8get_charEv		
	mv	a5,a0	
	sb	a5,-17(s0)	
	lbu	a5,-17(s0)	
	andi	a5,a5,0xff	
	bne	a5,zero,.L232	
	ld	a5,-72(s0)		
	li	a4,1		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	sd	zero,8(a5)	
	ld	a5,-72(s0)		
	sd	zero,16(a5)	
	ld	a5,-72(s0)		
	sd	zero,24(a5)	
	ld	a5,-72(s0)		
	sd	zero,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L233		
.L232:
	ld	a5,-80(s0)		
	ld	a5,40(a5)		
	sd	a5,-32(s0)	
	ld	a5,-80(s0)		
	ld	a5,56(a5)		
	sd	a5,-40(s0)	
	ld	a5,-80(s0)		
	ld	a5,48(a5)		
	sd	a5,-48(s0)	
	li	a2,0		
	lui	a5,%hi(.LC101)	
	addi	a1,a5,%lo(.LC101)	
	ld	a0,-80(s0)		
	call	_ZN7lexer_t10parse_wordEPKcm		
	sd	a0,-56(s0)	
	ld	a4,-56(s0)		
	li	a5,3		
	bleu	a4,a5,.L234	
	ld	a0,-72(s0)		
	ld	a5,-56(s0)		
	ld	a4,-40(s0)		
	ld	a3,-48(s0)		
	ld	a2,-32(s0)		
	ld	a1,-80(s0)		
	call	_ZN7lexer_t10parse_nameEmmmm		
	j	.L233		
.L234:
	ld	a4,-56(s0)		
	li	a5,3		
	bne	a4,a5,.L235	
	ld	a5,-72(s0)		
	li	a4,7		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L233		
.L235:
	ld	a4,-56(s0)		
	li	a5,1		
	bne	a4,a5,.L236	
	ld	a2,-56(s0)		
	lui	a5,%hi(.LC102)	
	addi	a1,a5,%lo(.LC102)	
	ld	a0,-80(s0)		
	call	_ZN7lexer_t10parse_wordEPKcm		
	sd	a0,-56(s0)	
	ld	a4,-56(s0)		
	li	a5,2		
	bne	a4,a5,.L237	
	ld	a5,-72(s0)		
	li	a4,8		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L233		
.L237:
	ld	a0,-72(s0)		
	ld	a5,-56(s0)		
	ld	a4,-40(s0)		
	ld	a3,-48(s0)		
	ld	a2,-32(s0)		
	ld	a1,-80(s0)		
	call	_ZN7lexer_t10parse_nameEmmmm		
	j	.L233		
.L236:
	ld	a5,-56(s0)		
	beq	a5,zero,.L238	
	ld	a0,-72(s0)		
	ld	a5,-56(s0)		
	ld	a4,-40(s0)		
	ld	a3,-48(s0)		
	ld	a2,-32(s0)		
	ld	a1,-80(s0)		
	call	_ZN7lexer_t10parse_nameEmmmm		
	j	.L233		
.L238:
	li	a2,0		
	lui	a5,%hi(.LC103)	
	addi	a1,a5,%lo(.LC103)	
	ld	a0,-80(s0)		
	call	_ZN7lexer_t10parse_wordEPKcm		
	sd	a0,-56(s0)	
	ld	a4,-56(s0)		
	li	a5,5		
	bleu	a4,a5,.L239	
	ld	a0,-72(s0)		
	ld	a5,-56(s0)		
	ld	a4,-40(s0)		
	ld	a3,-48(s0)		
	ld	a2,-32(s0)		
	ld	a1,-80(s0)		
	call	_ZN7lexer_t10parse_nameEmmmm		
	j	.L233		
.L239:
	ld	a4,-56(s0)		
	li	a5,5		
	bne	a4,a5,.L240	
	ld	a5,-72(s0)		
	li	a4,10		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L233		
.L240:
	ld	a4,-56(s0)		
	li	a5,1		
	bne	a4,a5,.L241	
	ld	a2,-56(s0)		
	lui	a5,%hi(.LC104)	
	addi	a1,a5,%lo(.LC104)	
	ld	a0,-80(s0)		
	call	_ZN7lexer_t10parse_wordEPKcm		
	sd	a0,-56(s0)	
	ld	a4,-56(s0)		
	li	a5,4		
	bne	a4,a5,.L242	
	ld	a5,-72(s0)		
	li	a4,9		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L233		
.L242:
	ld	a0,-72(s0)		
	ld	a5,-56(s0)		
	ld	a4,-40(s0)		
	ld	a3,-48(s0)		
	ld	a2,-32(s0)		
	ld	a1,-80(s0)		
	call	_ZN7lexer_t10parse_nameEmmmm		
	j	.L233		
.L241:
	ld	a5,-56(s0)		
	beq	a5,zero,.L243	
	ld	a0,-72(s0)		
	ld	a5,-56(s0)		
	ld	a4,-40(s0)		
	ld	a3,-48(s0)		
	ld	a2,-32(s0)		
	ld	a1,-80(s0)		
	call	_ZN7lexer_t10parse_nameEmmmm		
	j	.L233		
.L243:
	li	a2,0		
	lui	a5,%hi(.LC105)	
	addi	a1,a5,%lo(.LC105)	
	ld	a0,-80(s0)		
	call	_ZN7lexer_t10parse_wordEPKcm		
	sd	a0,-56(s0)	
	ld	a4,-56(s0)		
	li	a5,8		
	bleu	a4,a5,.L244	
	ld	a0,-72(s0)		
	ld	a5,-56(s0)		
	ld	a4,-40(s0)		
	ld	a3,-48(s0)		
	ld	a2,-32(s0)		
	ld	a1,-80(s0)		
	call	_ZN7lexer_t10parse_nameEmmmm		
	j	.L233		
.L244:
	ld	a4,-56(s0)		
	li	a5,8		
	bne	a4,a5,.L245	
	ld	a5,-72(s0)		
	li	a4,11		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L233		
.L245:
	ld	a5,-56(s0)		
	beq	a5,zero,.L246	
	ld	a0,-72(s0)		
	ld	a5,-56(s0)		
	ld	a4,-40(s0)		
	ld	a3,-48(s0)		
	ld	a2,-32(s0)		
	ld	a1,-80(s0)		
	call	_ZN7lexer_t10parse_nameEmmmm		
	j	.L233		
.L246:
	li	a2,0		
	lui	a5,%hi(.LC106)	
	addi	a1,a5,%lo(.LC106)	
	ld	a0,-80(s0)		
	call	_ZN7lexer_t10parse_wordEPKcm		
	sd	a0,-56(s0)	
	ld	a4,-56(s0)		
	li	a5,4		
	bleu	a4,a5,.L247	
	ld	a0,-72(s0)		
	ld	a5,-56(s0)		
	ld	a4,-40(s0)		
	ld	a3,-48(s0)		
	ld	a2,-32(s0)		
	ld	a1,-80(s0)		
	call	_ZN7lexer_t10parse_nameEmmmm		
	j	.L233		
.L247:
	ld	a4,-56(s0)		
	li	a5,4		
	bne	a4,a5,.L248	
	ld	a5,-72(s0)		
	li	a4,12		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L233		
.L248:
	ld	a4,-56(s0)		
	li	a5,1		
	bne	a4,a5,.L249	
	ld	a2,-56(s0)		
	lui	a5,%hi(.LC107)	
	addi	a1,a5,%lo(.LC107)	
	ld	a0,-80(s0)		
	call	_ZN7lexer_t10parse_wordEPKcm		
	sd	a0,-56(s0)	
	ld	a4,-56(s0)		
	li	a5,3		
	bleu	a4,a5,.L250	
	ld	a0,-72(s0)		
	ld	a5,-56(s0)		
	ld	a4,-40(s0)		
	ld	a3,-48(s0)		
	ld	a2,-32(s0)		
	ld	a1,-80(s0)		
	call	_ZN7lexer_t10parse_nameEmmmm		
	j	.L233		
.L250:
	ld	a4,-56(s0)		
	li	a5,3		
	bne	a4,a5,.L251	
	ld	a5,-72(s0)		
	li	a4,13		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L233		
.L251:
	ld	a4,-56(s0)		
	li	a5,2		
	bne	a4,a5,.L252	
	ld	a2,-56(s0)		
	lui	a5,%hi(.LC108)	
	addi	a1,a5,%lo(.LC108)	
	ld	a0,-80(s0)		
	call	_ZN7lexer_t10parse_wordEPKcm		
	sd	a0,-56(s0)	
	ld	a4,-56(s0)		
	li	a5,3		
	bne	a4,a5,.L253	
	ld	a5,-72(s0)		
	li	a4,14		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L233		
.L253:
	ld	a0,-72(s0)		
	ld	a5,-56(s0)		
	ld	a4,-40(s0)		
	ld	a3,-48(s0)		
	ld	a2,-32(s0)		
	ld	a1,-80(s0)		
	call	_ZN7lexer_t10parse_nameEmmmm		
	j	.L233		
.L252:
	ld	a5,-56(s0)		
	beq	a5,zero,.L254	
	ld	a0,-72(s0)		
	ld	a5,-56(s0)		
	ld	a4,-40(s0)		
	ld	a3,-48(s0)		
	ld	a2,-32(s0)		
	ld	a1,-80(s0)		
	call	_ZN7lexer_t10parse_nameEmmmm		
	j	.L233		
.L249:
	ld	a5,-56(s0)		
	beq	a5,zero,.L254	
	ld	a0,-72(s0)		
	ld	a5,-56(s0)		
	ld	a4,-40(s0)		
	ld	a3,-48(s0)		
	ld	a2,-32(s0)		
	ld	a1,-80(s0)		
	call	_ZN7lexer_t10parse_nameEmmmm		
	j	.L233		
.L254:
	li	a2,0		
	lui	a5,%hi(.LC109)	
	addi	a1,a5,%lo(.LC109)	
	ld	a0,-80(s0)		
	call	_ZN7lexer_t10parse_wordEPKcm		
	sd	a0,-56(s0)	
	ld	a4,-56(s0)		
	li	a5,9		
	bleu	a4,a5,.L255	
	ld	a0,-72(s0)		
	ld	a5,-56(s0)		
	ld	a4,-40(s0)		
	ld	a3,-48(s0)		
	ld	a2,-32(s0)		
	ld	a1,-80(s0)		
	call	_ZN7lexer_t10parse_nameEmmmm		
	j	.L233		
.L255:
	ld	a4,-56(s0)		
	li	a5,9		
	bne	a4,a5,.L256	
	ld	a5,-72(s0)		
	li	a4,15		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L233		
.L256:
	ld	a4,-56(s0)		
	li	a5,6		
	bne	a4,a5,.L257	
	ld	a2,-56(s0)		
	lui	a5,%hi(.LC110)	
	addi	a1,a5,%lo(.LC110)	
	ld	a0,-80(s0)		
	call	_ZN7lexer_t10parse_wordEPKcm		
	sd	a0,-56(s0)	
	ld	a4,-56(s0)		
	li	a5,6		
	bne	a4,a5,.L258	
	ld	a5,-72(s0)		
	li	a4,16		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L233		
.L258:
	ld	a0,-72(s0)		
	ld	a5,-56(s0)		
	ld	a4,-40(s0)		
	ld	a3,-48(s0)		
	ld	a2,-32(s0)		
	ld	a1,-80(s0)		
	call	_ZN7lexer_t10parse_nameEmmmm		
	j	.L233		
.L257:
	ld	a5,-56(s0)		
	beq	a5,zero,.L259	
	ld	a0,-72(s0)		
	ld	a5,-56(s0)		
	ld	a4,-40(s0)		
	ld	a3,-48(s0)		
	ld	a2,-32(s0)		
	ld	a1,-80(s0)		
	call	_ZN7lexer_t10parse_nameEmmmm		
	j	.L233		
.L259:
	li	a2,0		
	lui	a5,%hi(.LC111)	
	addi	a1,a5,%lo(.LC111)	
	ld	a0,-80(s0)		
	call	_ZN7lexer_t10parse_wordEPKcm		
	sd	a0,-56(s0)	
	ld	a4,-56(s0)		
	li	a5,4		
	bleu	a4,a5,.L260	
	ld	a0,-72(s0)		
	ld	a5,-56(s0)		
	ld	a4,-40(s0)		
	ld	a3,-48(s0)		
	ld	a2,-32(s0)		
	ld	a1,-80(s0)		
	call	_ZN7lexer_t10parse_nameEmmmm		
	j	.L233		
.L260:
	ld	a4,-56(s0)		
	li	a5,4		
	bne	a4,a5,.L261	
	ld	a5,-72(s0)		
	li	a4,17		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L233		
.L261:
	ld	a4,-56(s0)		
	li	a5,1		
	bne	a4,a5,.L262	
	ld	a2,-56(s0)		
	lui	a5,%hi(.LC112)	
	addi	a1,a5,%lo(.LC112)	
	ld	a0,-80(s0)		
	call	_ZN7lexer_t10parse_wordEPKcm		
	sd	a0,-56(s0)	
	ld	a4,-56(s0)		
	li	a5,3		
	bne	a4,a5,.L263	
	ld	a5,-72(s0)		
	li	a4,18		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L233		
.L263:
	ld	a0,-72(s0)		
	ld	a5,-56(s0)		
	ld	a4,-40(s0)		
	ld	a3,-48(s0)		
	ld	a2,-32(s0)		
	ld	a1,-80(s0)		
	call	_ZN7lexer_t10parse_nameEmmmm		
	j	.L233		
.L262:
	ld	a5,-56(s0)		
	beq	a5,zero,.L264	
	ld	a0,-72(s0)		
	ld	a5,-56(s0)		
	ld	a4,-40(s0)		
	ld	a3,-48(s0)		
	ld	a2,-32(s0)		
	ld	a1,-80(s0)		
	call	_ZN7lexer_t10parse_nameEmmmm		
	j	.L233		
.L264:
	li	a2,0		
	lui	a5,%hi(.LC113)	
	addi	a1,a5,%lo(.LC113)	
	ld	a0,-80(s0)		
	call	_ZN7lexer_t10parse_wordEPKcm		
	sd	a0,-56(s0)	
	ld	a4,-56(s0)		
	li	a5,7		
	bleu	a4,a5,.L265	
	ld	a0,-72(s0)		
	ld	a5,-56(s0)		
	ld	a4,-40(s0)		
	ld	a3,-48(s0)		
	ld	a2,-32(s0)		
	ld	a1,-80(s0)		
	call	_ZN7lexer_t10parse_nameEmmmm		
	j	.L233		
.L265:
	ld	a4,-56(s0)		
	li	a5,7		
	bne	a4,a5,.L266	
	ld	a5,-72(s0)		
	li	a4,19		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L233		
.L266:
	ld	a5,-56(s0)		
	beq	a5,zero,.L267	
	ld	a0,-72(s0)		
	ld	a5,-56(s0)		
	ld	a4,-40(s0)		
	ld	a3,-48(s0)		
	ld	a2,-32(s0)		
	ld	a1,-80(s0)		
	call	_ZN7lexer_t10parse_nameEmmmm		
	j	.L233		
.L267:
	li	a2,0		
	lui	a5,%hi(.LC114)	
	addi	a1,a5,%lo(.LC114)	
	ld	a0,-80(s0)		
	call	_ZN7lexer_t10parse_wordEPKcm		
	sd	a0,-56(s0)	
	ld	a4,-56(s0)		
	li	a5,6		
	bleu	a4,a5,.L268	
	ld	a0,-72(s0)		
	ld	a5,-56(s0)		
	ld	a4,-40(s0)		
	ld	a3,-48(s0)		
	ld	a2,-32(s0)		
	ld	a1,-80(s0)		
	call	_ZN7lexer_t10parse_nameEmmmm		
	j	.L233		
.L268:
	ld	a4,-56(s0)		
	li	a5,6		
	bne	a4,a5,.L269	
	ld	a5,-72(s0)		
	li	a4,20		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L233		
.L269:
	ld	a4,-56(s0)		
	li	a5,1		
	bne	a4,a5,.L270	
	ld	a2,-56(s0)		
	lui	a5,%hi(.LC115)	
	addi	a1,a5,%lo(.LC115)	
	ld	a0,-80(s0)		
	call	_ZN7lexer_t10parse_wordEPKcm		
	sd	a0,-56(s0)	
	ld	a4,-56(s0)		
	li	a5,2		
	bleu	a4,a5,.L271	
	ld	a0,-72(s0)		
	ld	a5,-56(s0)		
	ld	a4,-40(s0)		
	ld	a3,-48(s0)		
	ld	a2,-32(s0)		
	ld	a1,-80(s0)		
	call	_ZN7lexer_t10parse_nameEmmmm		
	j	.L233		
.L271:
	ld	a4,-56(s0)		
	li	a5,2		
	bne	a4,a5,.L272	
	ld	a5,-72(s0)		
	li	a4,21		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L233		
.L272:
	ld	a2,-56(s0)		
	lui	a5,%hi(.LC116)	
	addi	a1,a5,%lo(.LC116)	
	ld	a0,-80(s0)		
	call	_ZN7lexer_t10parse_wordEPKcm		
	sd	a0,-56(s0)	
	ld	a4,-56(s0)		
	li	a5,2		
	bleu	a4,a5,.L273	
	ld	a0,-72(s0)		
	ld	a5,-56(s0)		
	ld	a4,-40(s0)		
	ld	a3,-48(s0)		
	ld	a2,-32(s0)		
	ld	a1,-80(s0)		
	call	_ZN7lexer_t10parse_nameEmmmm		
	j	.L233		
.L273:
	ld	a4,-56(s0)		
	li	a5,2		
	bne	a4,a5,.L274	
	ld	a5,-72(s0)		
	li	a4,22		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L233		
.L274:
	ld	a2,-56(s0)		
	lui	a5,%hi(.LC117)	
	addi	a1,a5,%lo(.LC117)	
	ld	a0,-80(s0)		
	call	_ZN7lexer_t10parse_wordEPKcm		
	sd	a0,-56(s0)	
	ld	a4,-56(s0)		
	li	a5,2		
	bleu	a4,a5,.L275	
	ld	a0,-72(s0)		
	ld	a5,-56(s0)		
	ld	a4,-40(s0)		
	ld	a3,-48(s0)		
	ld	a2,-32(s0)		
	ld	a1,-80(s0)		
	call	_ZN7lexer_t10parse_nameEmmmm		
	j	.L233		
.L275:
	ld	a4,-56(s0)		
	li	a5,2		
	bne	a4,a5,.L276	
	ld	a5,-72(s0)		
	li	a4,23		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L233		
.L276:
	ld	a0,-72(s0)		
	ld	a5,-56(s0)		
	ld	a4,-40(s0)		
	ld	a3,-48(s0)		
	ld	a2,-32(s0)		
	ld	a1,-80(s0)		
	call	_ZN7lexer_t10parse_nameEmmmm		
	j	.L233		
.L270:
	ld	a5,-56(s0)		
	beq	a5,zero,.L277	
	ld	a0,-72(s0)		
	ld	a5,-56(s0)		
	ld	a4,-40(s0)		
	ld	a3,-48(s0)		
	ld	a2,-32(s0)		
	ld	a1,-80(s0)		
	call	_ZN7lexer_t10parse_nameEmmmm		
	j	.L233		
.L277:
	li	a2,0		
	lui	a5,%hi(.LC118)	
	addi	a1,a5,%lo(.LC118)	
	ld	a0,-80(s0)		
	call	_ZN7lexer_t10parse_wordEPKcm		
	sd	a0,-56(s0)	
	ld	a4,-56(s0)		
	li	a5,4		
	bleu	a4,a5,.L278	
	ld	a0,-72(s0)		
	ld	a5,-56(s0)		
	ld	a4,-40(s0)		
	ld	a3,-48(s0)		
	ld	a2,-32(s0)		
	ld	a1,-80(s0)		
	call	_ZN7lexer_t10parse_nameEmmmm		
	j	.L233		
.L278:
	ld	a4,-56(s0)		
	li	a5,4		
	bne	a4,a5,.L279	
	ld	a5,-72(s0)		
	li	a4,24		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L233		
.L279:
	ld	a4,-56(s0)		
	li	a5,1		
	bne	a4,a5,.L280	
	ld	a2,-56(s0)		
	lui	a5,%hi(.LC119)	
	addi	a1,a5,%lo(.LC119)	
	ld	a0,-80(s0)		
	call	_ZN7lexer_t10parse_wordEPKcm		
	sd	a0,-56(s0)	
	ld	a4,-56(s0)		
	li	a5,3		
	bne	a4,a5,.L281	
	ld	a5,-72(s0)		
	li	a4,25		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L233		
.L281:
	ld	a0,-72(s0)		
	ld	a5,-56(s0)		
	ld	a4,-40(s0)		
	ld	a3,-48(s0)		
	ld	a2,-32(s0)		
	ld	a1,-80(s0)		
	call	_ZN7lexer_t10parse_nameEmmmm		
	j	.L233		
.L280:
	ld	a5,-56(s0)		
	beq	a5,zero,.L282	
	ld	a0,-72(s0)		
	ld	a5,-56(s0)		
	ld	a4,-40(s0)		
	ld	a3,-48(s0)		
	ld	a2,-32(s0)		
	ld	a1,-80(s0)		
	call	_ZN7lexer_t10parse_nameEmmmm		
	j	.L233		
.L282:
	li	a2,0		
	lui	a5,%hi(.LC120)	
	addi	a1,a5,%lo(.LC120)	
	ld	a0,-80(s0)		
	call	_ZN7lexer_t10parse_wordEPKcm		
	sd	a0,-56(s0)	
	ld	a4,-56(s0)		
	li	a5,2		
	bleu	a4,a5,.L283	
	ld	a0,-72(s0)		
	ld	a5,-56(s0)		
	ld	a4,-40(s0)		
	ld	a3,-48(s0)		
	ld	a2,-32(s0)		
	ld	a1,-80(s0)		
	call	_ZN7lexer_t10parse_nameEmmmm		
	j	.L233		
.L283:
	ld	a4,-56(s0)		
	li	a5,2		
	bne	a4,a5,.L284	
	ld	a5,-72(s0)		
	li	a4,26		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L233		
.L284:
	ld	a5,-56(s0)		
	beq	a5,zero,.L285	
	ld	a0,-72(s0)		
	ld	a5,-56(s0)		
	ld	a4,-40(s0)		
	ld	a3,-48(s0)		
	ld	a2,-32(s0)		
	ld	a1,-80(s0)		
	call	_ZN7lexer_t10parse_nameEmmmm		
	j	.L233		
.L285:
	li	a2,0		
	lui	a5,%hi(.LC121)	
	addi	a1,a5,%lo(.LC121)	
	ld	a0,-80(s0)		
	call	_ZN7lexer_t10parse_wordEPKcm		
	sd	a0,-56(s0)	
	ld	a4,-56(s0)		
	li	a5,6		
	bleu	a4,a5,.L286	
	ld	a0,-72(s0)		
	ld	a5,-56(s0)		
	ld	a4,-40(s0)		
	ld	a3,-48(s0)		
	ld	a2,-32(s0)		
	ld	a1,-80(s0)		
	call	_ZN7lexer_t10parse_nameEmmmm		
	j	.L233		
.L286:
	ld	a4,-56(s0)		
	li	a5,6		
	bne	a4,a5,.L287	
	ld	a5,-72(s0)		
	li	a4,28		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a4,a5,40	
	ld	a5,-80(s0)		
	addi	a5,a5,64	
	mv	a1,a5	
	mv	a0,a4	
	call	_ZN4rstd6stringC1ERKS0_		
	j	.L233		
.L287:
	ld	a5,-56(s0)		
	beq	a5,zero,.L288	
	ld	a0,-72(s0)		
	ld	a5,-56(s0)		
	ld	a4,-40(s0)		
	ld	a3,-48(s0)		
	ld	a2,-32(s0)		
	ld	a1,-80(s0)		
	call	_ZN7lexer_t10parse_nameEmmmm		
	j	.L233		
.L288:
	li	a2,0		
	lui	a5,%hi(.LC122)	
	addi	a1,a5,%lo(.LC122)	
	ld	a0,-80(s0)		
	call	_ZN7lexer_t10parse_wordEPKcm		
	sd	a0,-56(s0)	
	ld	a4,-56(s0)		
	li	a5,7		
	bleu	a4,a5,.L289	
	ld	a0,-72(s0)		
	ld	a5,-56(s0)		
	ld	a4,-40(s0)		
	ld	a3,-48(s0)		
	ld	a2,-32(s0)		
	ld	a1,-80(s0)		
	call	_ZN7lexer_t10parse_nameEmmmm		
	j	.L233		
.L289:
	ld	a4,-56(s0)		
	li	a5,7		
	bne	a4,a5,.L290	
	ld	a5,-72(s0)		
	li	a4,29		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L233		
.L290:
	ld	a4,-56(s0)		
	li	a5,3		
	bne	a4,a5,.L291	
	ld	a2,-56(s0)		
	lui	a5,%hi(.LC123)	
	addi	a1,a5,%lo(.LC123)	
	ld	a0,-80(s0)		
	call	_ZN7lexer_t10parse_wordEPKcm		
	sd	a0,-56(s0)	
	ld	a4,-56(s0)		
	li	a5,3		
	bne	a4,a5,.L292	
	ld	a5,-72(s0)		
	li	a4,30		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L233		
.L292:
	ld	a0,-72(s0)		
	ld	a5,-56(s0)		
	ld	a4,-40(s0)		
	ld	a3,-48(s0)		
	ld	a2,-32(s0)		
	ld	a1,-80(s0)		
	call	_ZN7lexer_t10parse_nameEmmmm		
	j	.L233		
.L291:
	ld	a5,-56(s0)		
	beq	a5,zero,.L293	
	ld	a0,-72(s0)		
	ld	a5,-56(s0)		
	ld	a4,-40(s0)		
	ld	a3,-48(s0)		
	ld	a2,-32(s0)		
	ld	a1,-80(s0)		
	call	_ZN7lexer_t10parse_nameEmmmm		
	j	.L233		
.L293:
	li	a2,0		
	lui	a5,%hi(.LC124)	
	addi	a1,a5,%lo(.LC124)	
	ld	a0,-80(s0)		
	call	_ZN7lexer_t10parse_wordEPKcm		
	sd	a0,-56(s0)	
	ld	a4,-56(s0)		
	li	a5,5		
	bleu	a4,a5,.L294	
	ld	a0,-72(s0)		
	ld	a5,-56(s0)		
	ld	a4,-40(s0)		
	ld	a3,-48(s0)		
	ld	a2,-32(s0)		
	ld	a1,-80(s0)		
	call	_ZN7lexer_t10parse_nameEmmmm		
	j	.L233		
.L294:
	ld	a4,-56(s0)		
	li	a5,5		
	bne	a4,a5,.L295	
	ld	a5,-72(s0)		
	li	a4,31		
	sd	a4,0(a5)	
	ld	a5,-72(s0)		
	ld	a4,-32(s0)		
	sd	a4,8(a5)	
	ld	a5,-80(s0)		
	ld	a4,40(a5)		
	ld	a5,-72(s0)		
	sd	a4,16(a5)	
	ld	a5,-72(s0)		
	ld	a4,-48(s0)		
	sd	a4,24(a5)	
	ld	a5,-72(s0)		
	ld	a4,-40(s0)		
	sd	a4,32(a5)	
	ld	a5,-72(s0)		
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	j	.L233		
.L295:
	ld	a5,-56(s0)		
	beq	a5,zero,.L296	
	ld	a0,-72(s0)		
	ld	a5,-56(s0)		
	ld	a4,-40(s0)		
	ld	a3,-48(s0)		
	ld	a2,-32(s0)		
	ld	a1,-80(s0)		
	call	_ZN7lexer_t10parse_nameEmmmm		
	j	.L233		
.L296:
	lbu	a5,-17(s0)	
	mv	a1,a5	
	ld	a0,-80(s0)		
	call	_ZN7lexer_t7isdigitEc		
	mv	a5,a0	
	beq	a5,zero,.L297	
	ld	a5,-72(s0)		
	ld	a1,-80(s0)		
	mv	a0,a5	
	call	_ZN7lexer_t12parse_numberEv		
	j	.L233		
.L297:
	lbu	a5,-17(s0)	
	mv	a1,a5	
	ld	a0,-80(s0)		
	call	_ZN7lexer_t17can_continue_nameEc		
	mv	a5,a0	
	beq	a5,zero,.L298	
	ld	a5,-80(s0)		
	ld	a2,40(a5)		
	ld	a5,-80(s0)		
	ld	a3,48(a5)		
	ld	a5,-80(s0)		
	ld	a4,56(a5)		
	ld	a0,-72(s0)		
	li	a5,0		
	ld	a1,-80(s0)		
	call	_ZN7lexer_t10parse_nameEmmmm		
	j	.L233		
.L298:
	lbu	a5,-17(s0)	
	andi	a4,a5,0xff	
	li	a5,32		
	beq	a4,a5,.L299	
	lbu	a5,-17(s0)	
	andi	a4,a5,0xff	
	li	a5,9		
	beq	a4,a5,.L299	
	lbu	a5,-17(s0)	
	andi	a4,a5,0xff	
	li	a5,10		
	bne	a4,a5,.L300	
.L299:
	ld	a5,-72(s0)		
	ld	a1,-80(s0)		
	mv	a0,a5	
	call	_ZN7lexer_t11parse_spaceEv		
	j	.L233		
.L300:
	ld	a5,-72(s0)		
	ld	a1,-80(s0)		
	mv	a0,a5	
	call	_ZN7lexer_t14parse_non_nameEv		
.L233:
	ld	a0,-72(s0)		
	ld	ra,72(sp)		
	ld	s0,64(sp)		
	addi	sp,sp,80	
	jr	ra		
.LFE4689:
	.text
	.globl	_Znwm
_Znwm:
.LFB4909:
	addi	sp,sp,-32	
	sd	ra,24(sp)	
	sd	s0,16(sp)	
	addi	s0,sp,32	
	sd	a0,-24(s0)	
	ld	a0,-24(s0)		
	call	_ZN6memory5allocEm		
	mv	a5,a0	
	mv	a0,a5	
	ld	ra,24(sp)		
	ld	s0,16(sp)		
	addi	sp,sp,32	
	jr	ra		
.LFE4909:
	.globl	_ZdlPv
_ZdlPv:
.LFB4910:
	addi	sp,sp,-32	
	sd	ra,24(sp)	
	sd	s0,16(sp)	
	addi	s0,sp,32	
	sd	a0,-24(s0)	
	ld	a0,-24(s0)		
	call	_ZN6memory4freeEPl		
	nop	
	ld	ra,24(sp)		
	ld	s0,16(sp)		
	addi	sp,sp,32	
	jr	ra		
.LFE4910:
	.globl	_Znam
_Znam:
.LFB4911:
	addi	sp,sp,-32	
	sd	ra,24(sp)	
	sd	s0,16(sp)	
	addi	s0,sp,32	
	sd	a0,-24(s0)	
	ld	a0,-24(s0)		
	call	_ZN6memory5allocEm		
	mv	a5,a0	
	mv	a0,a5	
	ld	ra,24(sp)		
	ld	s0,16(sp)		
	addi	sp,sp,32	
	jr	ra		
.LFE4911:
	.globl	_ZdaPv
_ZdaPv:
.LFB4912:
	addi	sp,sp,-32	
	sd	ra,24(sp)	
	sd	s0,16(sp)	
	addi	s0,sp,32	
	sd	a0,-24(s0)	
	ld	a0,-24(s0)		
	call	_ZN6memory4freeEPl		
	nop	
	ld	ra,24(sp)		
	ld	s0,16(sp)		
	addi	sp,sp,32	
	jr	ra		
.LFE4912:
_ZN14parsed_token_taSEOS_:
.LFB4914:
	addi	sp,sp,-32	
	sd	ra,24(sp)	
	sd	s0,16(sp)	
	addi	s0,sp,32	
	sd	a0,-24(s0)	
	sd	a1,-32(s0)	
	ld	a5,-32(s0)		
	ld	a4,0(a5)		
	ld	a5,-24(s0)		
	sd	a4,0(a5)	
	ld	a5,-32(s0)		
	ld	a4,8(a5)		
	ld	a5,-24(s0)		
	sd	a4,8(a5)	
	ld	a5,-32(s0)		
	ld	a4,16(a5)		
	ld	a5,-24(s0)		
	sd	a4,16(a5)	
	ld	a5,-32(s0)		
	ld	a4,24(a5)		
	ld	a5,-24(s0)		
	sd	a4,24(a5)	
	ld	a5,-32(s0)		
	ld	a4,32(a5)		
	ld	a5,-24(s0)		
	sd	a4,32(a5)	
	ld	a5,-32(s0)		
	addi	a4,a5,40	
	ld	a5,-24(s0)		
	addi	a5,a5,40	
	mv	a1,a4	
	mv	a0,a5	
	call	_ZN4rstd6stringaSERKS0_		
	ld	a5,-24(s0)		
	mv	a0,a5	
	ld	ra,24(sp)		
	ld	s0,16(sp)		
	addi	sp,sp,32	
	jr	ra		
.LFE4914:
.LC125:
	.string	"/home/ivanpesnya/my-rars-python-interpreter/test.py"
.LC126:
	.string	"Error opening file: "
.LC127:
	.string	"\n"
.LC128:
	.string	"Opened file\n"
.LC129:
	.string	"Token: '"
.LC130:
	.string	"' data: '"
.LC131:
	.string	"'\n"
.LC132:
	.string	"Undefined token: @"
.LC133:
	.string	"EOF\n"
	.text
	.globl	main
main:
.LFB4913:
	addi	sp,sp,-256	
	sd	ra,248(sp)	
	sd	s0,240(sp)	
	addi	s0,sp,256	
	lui	a5,%hi(.LC125)	
	addi	a5,a5,%lo(.LC125)	
	sd	a5,-24(s0)	
	li	a1,0		
	ld	a0,-24(s0)		
	call	_ZN8rsyscall9open_fileEPKcl		
	sd	a0,-32(s0)	
	ld	a5,-32(s0)		
	bge	a5,zero,.L310	
	lui	a5,%hi(.LC126)	
	addi	a0,a5,%lo(.LC126)	
	call	_ZN8rsyscall12print_stringEPKc		
	ld	a0,-24(s0)		
	call	_ZN8rsyscall12print_stringEPKc		
	lui	a5,%hi(.LC127)	
	addi	a0,a5,%lo(.LC127)	
	call	_ZN8rsyscall12print_stringEPKc		
	li	a0,1		
	call	_ZN8rsyscall4exitEl		
.L310:
	lui	a5,%hi(.LC128)	
	addi	a0,a5,%lo(.LC128)	
	call	_ZN8rsyscall12print_stringEPKc		
	addi	a5,s0,-184	
	ld	a1,-32(s0)		
	mv	a0,a5	
	call	_ZN7lexer_tC1El		
	addi	a5,s0,-248	
	addi	a4,s0,-184	
	mv	a1,a4	
	mv	a0,a5	
	call	_ZN7lexer_t8next_tokEv		
	j	.L311		
.L313:
	lui	a5,%hi(.LC129)	
	addi	a0,a5,%lo(.LC129)	
	call	_ZN8rsyscall12print_stringEPKc		
	lui	a5,%hi(.LC130)	
	addi	a0,a5,%lo(.LC130)	
	call	_ZN8rsyscall12print_stringEPKc		
	addi	a5,s0,-248	
	addi	a5,a5,40	
	li	a1,0		
	mv	a0,a5	
	call	_ZN4rstd6string9push_backEc		
	addi	a5,s0,-248	
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6string5c_strEv		
	mv	a5,a0	
	mv	a0,a5	
	call	_ZN8rsyscall12print_stringEPKc		
	lui	a5,%hi(.LC131)	
	addi	a0,a5,%lo(.LC131)	
	call	_ZN8rsyscall12print_stringEPKc		
	addi	a5,s0,-96	
	addi	a4,s0,-184	
	mv	a1,a4	
	mv	a0,a5	
	call	_ZN7lexer_t8next_tokEv		
	addi	a4,s0,-96	
	addi	a5,s0,-248	
	mv	a1,a4	
	mv	a0,a5	
	call	_ZN14parsed_token_taSEOS_		
	addi	a5,s0,-96	
	mv	a0,a5	
	call	_ZN14parsed_token_tD1Ev		
.L311:
	ld	a4,-248(s0)		
	li	a5,1		
	beq	a4,a5,.L312	
	ld	a5,-248(s0)		
	bne	a5,zero,.L313	
.L312:
	ld	a5,-248(s0)		
	bne	a5,zero,.L314	
	lui	a5,%hi(.LC132)	
	addi	a0,a5,%lo(.LC132)	
	call	_ZN8rsyscall12print_stringEPKc		
	addi	a5,s0,-248	
	addi	a5,a5,40	
	li	a1,0		
	mv	a0,a5	
	call	_ZN4rstd6string9push_backEc		
	addi	a5,s0,-248	
	addi	a5,a5,40	
	mv	a0,a5	
	call	_ZN4rstd6string5c_strEv		
	mv	a5,a0	
	mv	a0,a5	
	call	_ZN8rsyscall12print_stringEPKc		
	lui	a5,%hi(.LC127)	
	addi	a0,a5,%lo(.LC127)	
	call	_ZN8rsyscall12print_stringEPKc		
	j	.L315		
.L314:
	lui	a5,%hi(.LC133)	
	addi	a0,a5,%lo(.LC133)	
	call	_ZN8rsyscall12print_stringEPKc		
.L315:
	ld	a0,-32(s0)		
	call	_ZN8rsyscall10close_fileEl		
	li	a0,0		
	call	_ZN8rsyscall4exitEl		
	addi	a5,s0,-248	
	mv	a0,a5	
	call	_ZN14parsed_token_tD1Ev		
	addi	a5,s0,-184	
	mv	a0,a5	
	call	_ZN7lexer_tD1Ev		
	li	a5,0		
	mv	a0,a5	
	ld	ra,248(sp)		
	ld	s0,240(sp)		
	addi	sp,sp,256	
	jr	ra		
.LFE4913:
_ZN6memory7memmoveIcEEvPT_S2_m:
.LFB5233:
	addi	sp,sp,-64	
	sd	s0,56(sp)	
	addi	s0,sp,64	
	sd	a0,-40(s0)	
	sd	a1,-48(s0)	
	sd	a2,-56(s0)	
	sd	zero,-24(s0)	
	j	.L318		
.L319:
	ld	a4,-48(s0)		
	ld	a5,-24(s0)		
	add	a4,a4,a5	
	ld	a3,-40(s0)		
	ld	a5,-24(s0)		
	add	a5,a3,a5	
	lbu	a4,0(a4)	
	sb	a4,0(a5)	
	ld	a5,-24(s0)		
	addi	a5,a5,1	
	sd	a5,-24(s0)	
.L318:
	ld	a4,-24(s0)		
	ld	a5,-56(s0)		
	bltu	a4,a5,.L319	
	nop	
	nop	
	ld	s0,56(sp)		
	addi	sp,sp,64	
	jr	ra		
.LFE5233:
	.text
_Z41__static_initialization_and_destruction_0v:
.LFB5718:
	addi	sp,sp,-16	
	sd	s0,8(sp)	
	addi	s0,sp,16	
	lui	a5,%hi(_ZN6memoryL9heapStartE)	
	ld	a4,%lo(_ZN6memoryL9heapStartE)(a5)		
	lui	a5,%hi(_ZN6memoryL3topE)	
	sd	a4,%lo(_ZN6memoryL3topE)(a5)	
	nop	
	ld	s0,8(sp)		
	addi	sp,sp,16	
	jr	ra		
.LFE5718:
_ZNSt8__detail14__destructibleISt13_Bit_iteratorEE:
	.byte	1
_ZNSt8__detail19__destructible_implISt13_Bit_iteratorEE:
	.byte	1
_ZNSt8__detail14__destructibleISt19_Bit_const_iteratorEE:
	.byte	1
_ZNSt8__detail19__destructible_implISt19_Bit_const_iteratorEE:
	.byte	1
_ZNSt8__detail30__integer_to_chars_is_unsignedIjEE:
	.byte	1
_ZNSt8__detail30__integer_to_chars_is_unsignedImEE:
	.byte	1
_ZNSt8__detail30__integer_to_chars_is_unsignedIyEE:
	.byte	1
	.text
_GLOBAL__sub_I_TOKEN_NAMES:
.LFB5719:
	addi	sp,sp,-16	
	sd	ra,8(sp)	
	sd	s0,0(sp)	
	addi	s0,sp,16	
	call	_Z41__static_initialization_and_destruction_0v		
	ld	ra,8(sp)		
	ld	s0,0(sp)		
	addi	sp,sp,16	
	jr	ra		
.LFE5719:
	.dword	_GLOBAL__sub_I_TOKEN_NAMES
