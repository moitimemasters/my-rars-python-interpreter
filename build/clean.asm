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
_ZN8rsyscall20read_from_descriptorEiPcl:
.LFB3232:
	addi	sp,sp,-64	
	sd	s0,56(sp)	
	addi	s0,sp,64	
	mv	a5,a0	
	sd	a1,-48(s0)	
	sd	a2,-56(s0)	
	sw	a5,-36(s0)	
	lw	a5,-36(s0)		
	mv	a3,a5	
	ld	a5,-48(s0)		
	ld	a4,-56(s0)		
	li a7, 63
	mv a0, a3	
	mv a1, a5	
	mv a2, a4	
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
	beq	a5,zero,.L16	
	li	a5,0		
	j	.L17		
.L16:
	ld	a5,-24(s0)		
.L17:
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
	j	.L19		
.L23:
	ld	a5,-24(s0)		
	lbu	a5,8(a5)	
	bne	a5,zero,.L20	
	ld	a5,-24(s0)		
	ld	a5,0(a5)		
	ld	a4,-40(s0)		
	bleu	a4,a5,.L21	
.L20:
	ld	a5,-24(s0)		
	ld	a5,16(a5)		
	sd	a5,-24(s0)	
	j	.L19		
.L21:
	ld	a5,-24(s0)		
	j	.L22		
.L19:
	ld	a5,-24(s0)		
	bne	a5,zero,.L23	
	li	a5,0		
.L22:
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
	beq	a5,zero,.L27	
	ld	a5,-24(s0)		
	addi	a5,a5,24	
	j	.L28		
.L27:
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
	bne	a5,zero,.L29	
	lui	a5,%hi(_ZN6memoryL9heapStartE)	
	ld	a4,-32(s0)		
	sd	a4,%lo(_ZN6memoryL9heapStartE)(a5)	
.L29:
	lui	a5,%hi(_ZN6memoryL3topE)	
	ld	a5,%lo(_ZN6memoryL3topE)(a5)		
	beq	a5,zero,.L30	
	lui	a5,%hi(_ZN6memoryL3topE)	
	ld	a5,%lo(_ZN6memoryL3topE)(a5)		
	ld	a4,-32(s0)		
	sd	a4,16(a5)	
.L30:
	lui	a5,%hi(_ZN6memoryL3topE)	
	ld	a4,-32(s0)		
	sd	a4,%lo(_ZN6memoryL3topE)(a5)	
	ld	a5,-32(s0)		
	addi	a5,a5,24	
.L28:
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
_ZN4rstd6string5c_strEv:
.LFB4636:
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
.LFE4636:
_ZN4rstd6string5clearEv:
.LFB4641:
	addi	sp,sp,-32	
	sd	ra,24(sp)	
	sd	s0,16(sp)	
	addi	s0,sp,32	
	sd	a0,-24(s0)	
	ld	a5,-24(s0)		
	ld	a5,16(a5)		
	beq	a5,zero,.L39	
	ld	a5,-24(s0)		
	ld	a5,16(a5)		
	beq	a5,zero,.L39	
	ld	a5,-24(s0)		
	ld	a5,16(a5)		
	mv	a0,a5	
	call	_ZdaPv		
.L39:
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
.LFE4641:
_ZN4rstd6string9push_backEc:
.LFB4645:
	addi	sp,sp,-32	
	sd	ra,24(sp)	
	sd	s0,16(sp)	
	addi	s0,sp,32	
	sd	a0,-24(s0)	
	mv	a5,a1	
	sb	a5,-25(s0)	
	ld	a5,-24(s0)		
	ld	a5,8(a5)		
	bne	a5,zero,.L41	
	ld	a5,-24(s0)		
	ld	a5,16(a5)		
	beq	a5,zero,.L42	
	ld	a5,-24(s0)		
	ld	a5,16(a5)		
	mv	a0,a5	
	call	_ZdaPv		
.L42:
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
	j	.L40		
.L41:
	ld	a5,-24(s0)		
	ld	a4,0(a5)		
	ld	a5,-24(s0)		
	ld	a5,8(a5)		
	bne	a4,a5,.L44	
	ld	a5,-24(s0)		
	ld	a5,8(a5)		
	slli	a5,a5,1	
	mv	a1,a5	
	ld	a0,-24(s0)		
	call	_ZN4rstd6string7reserveEm		
.L44:
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
.L40:
	ld	ra,24(sp)		
	ld	s0,16(sp)		
	addi	sp,sp,32	
	jr	ra		
.LFE4645:
_ZN4rstd6string7reserveEm:
.LFB4647:
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
	bleu	a4,a5,.L50	
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
	beq	a5,zero,.L48	
	ld	a5,-56(s0)		
	ld	a5,16(a5)		
	beq	a5,zero,.L49	
	ld	a5,-56(s0)		
	ld	a5,16(a5)		
	mv	a0,a5	
	call	_ZdaPv		
.L49:
	ld	a5,-56(s0)		
	sd	zero,16(a5)	
.L48:
	ld	a5,-56(s0)		
	ld	a4,-40(s0)		
	sd	a4,16(a5)	
	ld	a5,-56(s0)		
	ld	a4,-64(s0)		
	sd	a4,8(a5)	
	ld	a5,-56(s0)		
	ld	a5,8(a5)		
	ld	a4,-64(s0)		
	bgeu	a4,a5,.L45	
	ld	a5,-56(s0)		
	ld	a4,-64(s0)		
	sd	a4,0(a5)	
	j	.L45		
.L50:
	nop	
.L45:
	ld	ra,56(sp)		
	ld	s0,48(sp)		
	ld	s1,40(sp)		
	addi	sp,sp,64	
	jr	ra		
.LFE4647:
_ZN4rstd9read_fileEPKcRNS_6stringE:
.LFB4661:
	addi	sp,sp,-288	
	sd	ra,280(sp)	
	sd	s0,272(sp)	
	sd	s1,264(sp)	
	sd	s2,256(sp)	
	addi	s0,sp,288	
	sd	a0,-280(s0)	
	sd	a1,-288(s0)	
	li	a1,0		
	ld	a0,-280(s0)		
	call	_ZN8rsyscall9open_fileEPKcl		
	sd	a0,-48(s0)	
	ld	a5,-48(s0)		
	bge	a5,zero,.L52	
	addi	a5,s0,-112	
	mv	a1,s2	
	mv	a0,a5	
	call	_ZN4rstd3ErrINS_10file_errorEEC1ES1_		
	addi	a5,s0,-120	
	lbu	a4,-112(s0)	
	mv	a1,a4	
	mv	a0,a5	
	call	_ZN4rstd6ResultIiNS_10file_errorEEC1ENS_3ErrIS1_EE		
	ld	a5,-120(s0)		
	sd	a5,-128(s0)	
	j	.L59		
.L52:
	ld	a5,-48(s0)		
	sext.w	a5,a5	
	addi	a4,s0,-264	
	li	a2,128		
	mv	a1,a4	
	mv	a0,a5	
	call	_ZN8rsyscall20read_from_descriptorEiPcl		
	sd	a0,-56(s0)	
	ld	a5,-56(s0)		
	beq	a5,zero,.L54	
	ld	a5,-56(s0)		
	bge	a5,zero,.L55	
	addi	a5,s0,-88	
	mv	a1,s1	
	mv	a0,a5	
	call	_ZN4rstd3ErrINS_10file_errorEEC1ES1_		
	addi	a5,s0,-96	
	lbu	a4,-88(s0)	
	mv	a1,a4	
	mv	a0,a5	
	call	_ZN4rstd6ResultIiNS_10file_errorEEC1ENS_3ErrIS1_EE		
	ld	a5,-96(s0)		
	sd	a5,-128(s0)	
	j	.L59		
.L55:
	sd	zero,-40(s0)	
	j	.L56		
.L57:
	ld	a5,-40(s0)		
	addi	a5,a5,-32	
	add	a5,a5,s0	
	lbu	a5,-232(a5)	
	mv	a1,a5	
	ld	a0,-288(s0)		
	call	_ZN4rstd6string9push_backEc		
	ld	a5,-40(s0)		
	addi	a5,a5,1	
	sd	a5,-40(s0)	
.L56:
	ld	a5,-56(s0)		
	ld	a4,-40(s0)		
	bltu	a4,a5,.L57	
	ld	a4,-56(s0)		
	li	a5,127		
	ble	a4,a5,.L60	
	j	.L52		
.L60:
	nop	
.L54:
	addi	a5,s0,-64	
	li	a1,0		
	mv	a0,a5	
	call	_ZN4rstd2OkIiEC1Ei		
	addi	a5,s0,-72	
	lw	a4,-64(s0)		
	mv	a1,a4	
	mv	a0,a5	
	call	_ZN4rstd6ResultIiNS_10file_errorEEC1ENS_2OkIiEE		
	ld	a5,-72(s0)		
	sd	a5,-128(s0)	
.L59:
	li	a5,0		
	lwu	a3,-128(s0)	
	li	a4,-1		
	srli	a4,a4,32	
	and	a4,a3,a4	
	li	a3,-1		
	slli	a3,a3,32	
	and	a5,a5,a3	
	or	a5,a5,a4	
	lwu	a4,-124(s0)	
	slli	a4,a4,32	
	li	a3,-1		
	srli	a3,a3,32	
	and	a5,a5,a3	
	or	a5,a5,a4	
	mv	a0,a5	
	ld	ra,280(sp)		
	ld	s0,272(sp)		
	ld	s1,264(sp)		
	ld	s2,256(sp)		
	addi	sp,sp,288	
	jr	ra		
.LFE4661:
	.text
	.globl	_Znwm
_Znwm:
.LFB4878:
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
.LFE4878:
	.globl	_ZdlPv
_ZdlPv:
.LFB4879:
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
.LFE4879:
	.globl	_Znam
_Znam:
.LFB4880:
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
.LFE4880:
	.globl	_ZdaPv
_ZdaPv:
.LFB4881:
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
.LFE4881:
.LC0:
	.string	"/home/ivanpesnya/my-rars-python-interpreter/build/fixed.asm"
.LC1:
	.string	"ERROR OCCURED WHILTE READING FILE"
	.text
	.globl	main
main:
.LFB4882:
	addi	sp,sp,-48	
	sd	ra,40(sp)	
	sd	s0,32(sp)	
	addi	s0,sp,48	
	addi	a5,s0,-40	
	mv	a0,a5	
	call	_ZN4rstd6stringC1Ev		
	addi	a5,s0,-40	
	mv	a1,a5	
	lui	a5,%hi(.LC0)	
	addi	a0,a5,%lo(.LC0)	
	call	_ZN4rstd9read_fileEPKcRNS_6stringE		
	mv	a5,a0	
	sd	a5,-48(s0)	
	addi	a5,s0,-48	
	mv	a0,a5	
	call	_ZNK4rstd6ResultIiNS_10file_errorEE5is_okEv		
	mv	a5,a0	
	beq	a5,zero,.L68	
	addi	a5,s0,-40	
	mv	a0,a5	
	call	_ZN4rstd6string5c_strEv		
	mv	a5,a0	
	mv	a0,a5	
	call	_ZN8rsyscall12print_stringEPKc		
	j	.L69		
.L68:
	lui	a5,%hi(.LC1)	
	addi	a0,a5,%lo(.LC1)	
	call	_ZN8rsyscall12print_stringEPKc		
.L69:
	li	a0,0		
	call	_ZN8rsyscall4exitEl		
	addi	a5,s0,-40	
	mv	a0,a5	
	call	_ZN4rstd6stringD1Ev		
	li	a5,0		
	mv	a0,a5	
	ld	ra,40(sp)		
	ld	s0,32(sp)		
	addi	sp,sp,48	
	jr	ra		
.LFE4882:
_ZN6memory7memmoveIcEEvPT_S2_m:
.LFB5218:
	addi	sp,sp,-64	
	sd	s0,56(sp)	
	addi	s0,sp,64	
	sd	a0,-40(s0)	
	sd	a1,-48(s0)	
	sd	a2,-56(s0)	
	sd	zero,-24(s0)	
	j	.L72		
.L73:
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
.L72:
	ld	a4,-24(s0)		
	ld	a5,-56(s0)		
	bltu	a4,a5,.L73	
	nop	
	nop	
	ld	s0,56(sp)		
	addi	sp,sp,64	
	jr	ra		
.LFE5218:
_ZN4rstd3ErrINS_10file_errorEEC2ES1_:
.LFB5221:
	addi	sp,sp,-32	
	sd	ra,24(sp)	
	sd	s0,16(sp)	
	addi	s0,sp,32	
	sd	a0,-24(s0)	
	sb	a1,-32(s0)	
	addi	a5,s0,-32	
	mv	a0,a5	
	call	_ZSt4moveIRN4rstd10file_errorEEONSt16remove_referenceIT_E4typeEOS4_		
	nop	
	ld	ra,24(sp)		
	ld	s0,16(sp)		
	addi	sp,sp,32	
	jr	ra		
.LFE5221:
	.set	_ZN4rstd3ErrINS_10file_errorEEC1ES1_,_ZN4rstd3ErrINS_10file_errorEEC2ES1_
_ZN4rstd6ResultIiNS_10file_errorEEC2ENS_3ErrIS1_EE:
.LFB5225:
	addi	sp,sp,-48	
	sd	ra,40(sp)	
	sd	s0,32(sp)	
	sd	s1,24(sp)	
	addi	s0,sp,48	
	sd	a0,-40(s0)	
	sb	a1,-48(s0)	
	ld	s1,-40(s0)		
	addi	a5,s0,-48	
	mv	a0,a5	
	call	_ZSt4moveIRN4rstd3ErrINS0_10file_errorEEEEONSt16remove_referenceIT_E4typeEOS6_		
	mv	a5,a0	
	mv	a1,a5	
	mv	a0,s1	
	call	_ZNSt7variantIJN4rstd2OkIiEENS0_3ErrINS0_10file_errorEEEEEC1IS5_vvS5_vEEOT_		
	nop	
	ld	ra,40(sp)		
	ld	s0,32(sp)		
	ld	s1,24(sp)		
	addi	sp,sp,48	
	jr	ra		
.LFE5225:
	.set	_ZN4rstd6ResultIiNS_10file_errorEEC1ENS_3ErrIS1_EE,_ZN4rstd6ResultIiNS_10file_errorEEC2ENS_3ErrIS1_EE
_ZN4rstd2OkIiEC2Ei:
.LFB5228:
	addi	sp,sp,-32	
	sd	ra,24(sp)	
	sd	s0,16(sp)	
	addi	s0,sp,32	
	sd	a0,-24(s0)	
	mv	a5,a1	
	sw	a5,-28(s0)	
	addi	a5,s0,-28	
	mv	a0,a5	
	call	_ZSt4moveIRiEONSt16remove_referenceIT_E4typeEOS2_		
	mv	a5,a0	
	lw	a4,0(a5)		
	ld	a5,-24(s0)		
	sw	a4,0(a5)	
	nop	
	ld	ra,24(sp)		
	ld	s0,16(sp)		
	addi	sp,sp,32	
	jr	ra		
.LFE5228:
	.set	_ZN4rstd2OkIiEC1Ei,_ZN4rstd2OkIiEC2Ei
_ZSt24__find_uniq_type_in_packIN4rstd2OkIiEEJS2_NS0_3ErrINS0_10file_errorEEEEEmv:
.LFB5231:
	addi	sp,sp,-48	
	sd	s0,40(sp)	
	addi	s0,sp,48	
	li	a5,2		
	sd	a5,-40(s0)	
	li	a5,1		
	sb	a5,-48(s0)	
	sb	zero,-47(s0)	
	li	a5,2		
	sd	a5,-24(s0)	
	sd	zero,-32(s0)	
	j	.L78		
.L82:
	ld	a5,-32(s0)		
	addi	a5,a5,-16	
	add	a5,a5,s0	
	lbu	a5,-32(a5)	
	beq	a5,zero,.L79	
	ld	a4,-24(s0)		
	li	a5,1		
	bgtu	a4,a5,.L80	
	li	a5,2		
	j	.L83		
.L80:
	ld	a5,-32(s0)		
	sd	a5,-24(s0)	
.L79:
	ld	a5,-32(s0)		
	addi	a5,a5,1	
	sd	a5,-32(s0)	
.L78:
	ld	a4,-32(s0)		
	li	a5,1		
	bleu	a4,a5,.L82	
	ld	a5,-24(s0)		
.L83:
	mv	a0,a5	
	ld	s0,40(sp)		
	addi	sp,sp,48	
	jr	ra		
.LFE5231:
_ZN4rstd6ResultIiNS_10file_errorEEC2ENS_2OkIiEE:
.LFB5232:
	addi	sp,sp,-48	
	sd	ra,40(sp)	
	sd	s0,32(sp)	
	sd	s1,24(sp)	
	addi	s0,sp,48	
	sd	a0,-40(s0)	
	sw	a1,-48(s0)	
	ld	s1,-40(s0)		
	addi	a5,s0,-48	
	mv	a0,a5	
	call	_ZSt4moveIRN4rstd2OkIiEEEONSt16remove_referenceIT_E4typeEOS5_		
	mv	a5,a0	
	mv	a1,a5	
	mv	a0,s1	
	call	_ZNSt7variantIJN4rstd2OkIiEENS0_3ErrINS0_10file_errorEEEEEC1IS2_vvS2_vEEOT_		
	nop	
	ld	ra,40(sp)		
	ld	s0,32(sp)		
	ld	s1,24(sp)		
	addi	sp,sp,48	
	jr	ra		
.LFE5232:
	.set	_ZN4rstd6ResultIiNS_10file_errorEEC1ENS_2OkIiEE,_ZN4rstd6ResultIiNS_10file_errorEEC2ENS_2OkIiEE
_ZNK4rstd6ResultIiNS_10file_errorEE5is_okEv:
.LFB5234:
	addi	sp,sp,-32	
	sd	ra,24(sp)	
	sd	s0,16(sp)	
	addi	s0,sp,32	
	sd	a0,-24(s0)	
	ld	a5,-24(s0)		
	mv	a0,a5	
	call	_ZSt17holds_alternativeIN4rstd2OkIiEEJS2_NS0_3ErrINS0_10file_errorEEEEEbRKSt7variantIJDpT0_EE		
	mv	a5,a0	
	mv	a0,a5	
	ld	ra,24(sp)		
	ld	s0,16(sp)		
	addi	sp,sp,32	
	jr	ra		
.LFE5234:
_ZSt4moveIRN4rstd10file_errorEEONSt16remove_referenceIT_E4typeEOS4_:
.LFB5398:
	addi	sp,sp,-32	
	sd	s0,24(sp)	
	addi	s0,sp,32	
	sd	a0,-24(s0)	
	ld	a5,-24(s0)		
	mv	a0,a5	
	ld	s0,24(sp)		
	addi	sp,sp,32	
	jr	ra		
.LFE5398:
_ZSt4moveIRN4rstd3ErrINS0_10file_errorEEEEONSt16remove_referenceIT_E4typeEOS6_:
.LFB5399:
	addi	sp,sp,-32	
	sd	s0,24(sp)	
	addi	s0,sp,32	
	sd	a0,-24(s0)	
	ld	a5,-24(s0)		
	mv	a0,a5	
	ld	s0,24(sp)		
	addi	sp,sp,32	
	jr	ra		
.LFE5399:
_ZNSt7variantIJN4rstd2OkIiEENS0_3ErrINS0_10file_errorEEEEEC2IS5_vvS5_vEEOT_:
.LFB5401:
	addi	sp,sp,-48	
	sd	ra,40(sp)	
	sd	s0,32(sp)	
	sd	s1,24(sp)	
	addi	s0,sp,48	
	sd	a0,-40(s0)	
	sd	a1,-48(s0)	
	ld	a0,-48(s0)		
	call	_ZSt7forwardIN4rstd3ErrINS0_10file_errorEEEEOT_RNSt16remove_referenceIS4_E4typeE		
	mv	a5,a0	
	mv	a2,a5	
	mv	a1,s1	
	ld	a0,-40(s0)		
	call	_ZNSt7variantIJN4rstd2OkIiEENS0_3ErrINS0_10file_errorEEEEEC1ILm1EJS5_ES5_vEESt16in_place_index_tIXT_EEDpOT0_		
	nop	
	ld	ra,40(sp)		
	ld	s0,32(sp)		
	ld	s1,24(sp)		
	addi	sp,sp,48	
	jr	ra		
.LFE5401:
	.set	_ZNSt7variantIJN4rstd2OkIiEENS0_3ErrINS0_10file_errorEEEEEC1IS5_vvS5_vEEOT_,_ZNSt7variantIJN4rstd2OkIiEENS0_3ErrINS0_10file_errorEEEEEC2IS5_vvS5_vEEOT_
_ZSt4moveIRiEONSt16remove_referenceIT_E4typeEOS2_:
.LFB5403:
	addi	sp,sp,-32	
	sd	s0,24(sp)	
	addi	s0,sp,32	
	sd	a0,-24(s0)	
	ld	a5,-24(s0)		
	mv	a0,a5	
	ld	s0,24(sp)		
	addi	sp,sp,32	
	jr	ra		
.LFE5403:
_ZSt4moveIRN4rstd2OkIiEEEONSt16remove_referenceIT_E4typeEOS5_:
.LFB5404:
	addi	sp,sp,-32	
	sd	s0,24(sp)	
	addi	s0,sp,32	
	sd	a0,-24(s0)	
	ld	a5,-24(s0)		
	mv	a0,a5	
	ld	s0,24(sp)		
	addi	sp,sp,32	
	jr	ra		
.LFE5404:
_ZNSt7variantIJN4rstd2OkIiEENS0_3ErrINS0_10file_errorEEEEEC2IS2_vvS2_vEEOT_:
.LFB5406:
	addi	sp,sp,-48	
	sd	ra,40(sp)	
	sd	s0,32(sp)	
	sd	s1,24(sp)	
	addi	s0,sp,48	
	sd	a0,-40(s0)	
	sd	a1,-48(s0)	
	ld	a0,-48(s0)		
	call	_ZSt7forwardIN4rstd2OkIiEEEOT_RNSt16remove_referenceIS3_E4typeE		
	mv	a5,a0	
	mv	a2,a5	
	mv	a1,s1	
	ld	a0,-40(s0)		
	call	_ZNSt7variantIJN4rstd2OkIiEENS0_3ErrINS0_10file_errorEEEEEC1ILm0EJS2_ES2_vEESt16in_place_index_tIXT_EEDpOT0_		
	nop	
	ld	ra,40(sp)		
	ld	s0,32(sp)		
	ld	s1,24(sp)		
	addi	sp,sp,48	
	jr	ra		
.LFE5406:
	.set	_ZNSt7variantIJN4rstd2OkIiEENS0_3ErrINS0_10file_errorEEEEEC1IS2_vvS2_vEEOT_,_ZNSt7variantIJN4rstd2OkIiEENS0_3ErrINS0_10file_errorEEEEEC2IS2_vvS2_vEEOT_
_ZSt17holds_alternativeIN4rstd2OkIiEEJS2_NS0_3ErrINS0_10file_errorEEEEEbRKSt7variantIJDpT0_EE:
.LFB5408:
	addi	sp,sp,-48	
	sd	ra,40(sp)	
	sd	s0,32(sp)	
	sd	s1,24(sp)	
	addi	s0,sp,48	
	sd	a0,-40(s0)	
	ld	a0,-40(s0)		
	call	_ZNKSt7variantIJN4rstd2OkIiEENS0_3ErrINS0_10file_errorEEEEE5indexEv		
	mv	s1,a0	
	call	_ZSt24__find_uniq_type_in_packIN4rstd2OkIiEEJS2_NS0_3ErrINS0_10file_errorEEEEEmv		
	mv	a5,a0	
	sub	a5,s1,a5	
	seqz	a5,a5	
	andi	a5,a5,0xff	
	mv	a0,a5	
	ld	ra,40(sp)		
	ld	s0,32(sp)		
	ld	s1,24(sp)		
	addi	sp,sp,48	
	jr	ra		
.LFE5408:
_ZSt7forwardIN4rstd3ErrINS0_10file_errorEEEEOT_RNSt16remove_referenceIS4_E4typeE:
.LFB5524:
	addi	sp,sp,-32	
	sd	s0,24(sp)	
	addi	s0,sp,32	
	sd	a0,-24(s0)	
	ld	a5,-24(s0)		
	mv	a0,a5	
	ld	s0,24(sp)		
	addi	sp,sp,32	
	jr	ra		
.LFE5524:
_ZNSt7variantIJN4rstd2OkIiEENS0_3ErrINS0_10file_errorEEEEEC2ILm1EJS5_ES5_vEESt16in_place_index_tIXT_EEDpOT0_:
.LFB5526:
	addi	sp,sp,-80	
	sd	ra,72(sp)	
	sd	s0,64(sp)	
	sd	s1,56(sp)	
	sd	s2,48(sp)	
	sd	s3,40(sp)	
	addi	s0,sp,80	
	sd	a0,-56(s0)	
	sb	a1,-64(s0)	
	sd	a2,-72(s0)	
	ld	s1,-56(s0)		
	ld	a0,-72(s0)		
	call	_ZSt7forwardIN4rstd3ErrINS0_10file_errorEEEEOT_RNSt16remove_referenceIS4_E4typeE		
	mv	a5,a0	
	mv	a2,a5	
	mv	a1,s3	
	mv	a0,s1	
	call	_ZNSt8__detail9__variant13_Variant_baseIJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEEC2ILm1EJS7_EEESt16in_place_index_tIXT_EEDpOT0_		
	mv	a1,s2	
	ld	a0,-56(s0)		
	call	_ZNSt27_Enable_default_constructorILb0ESt7variantIJN4rstd2OkIiEENS1_3ErrINS1_10file_errorEEEEEEC2ESt31_Enable_default_constructor_tag		
	nop	
	ld	ra,72(sp)		
	ld	s0,64(sp)		
	ld	s1,56(sp)		
	ld	s2,48(sp)		
	ld	s3,40(sp)		
	addi	sp,sp,80	
	jr	ra		
.LFE5526:
	.set	_ZNSt7variantIJN4rstd2OkIiEENS0_3ErrINS0_10file_errorEEEEEC1ILm1EJS5_ES5_vEESt16in_place_index_tIXT_EEDpOT0_,_ZNSt7variantIJN4rstd2OkIiEENS0_3ErrINS0_10file_errorEEEEEC2ILm1EJS5_ES5_vEESt16in_place_index_tIXT_EEDpOT0_
_ZSt7forwardIN4rstd2OkIiEEEOT_RNSt16remove_referenceIS3_E4typeE:
.LFB5528:
	addi	sp,sp,-32	
	sd	s0,24(sp)	
	addi	s0,sp,32	
	sd	a0,-24(s0)	
	ld	a5,-24(s0)		
	mv	a0,a5	
	ld	s0,24(sp)		
	addi	sp,sp,32	
	jr	ra		
.LFE5528:
_ZNSt7variantIJN4rstd2OkIiEENS0_3ErrINS0_10file_errorEEEEEC2ILm0EJS2_ES2_vEESt16in_place_index_tIXT_EEDpOT0_:
.LFB5530:
	addi	sp,sp,-80	
	sd	ra,72(sp)	
	sd	s0,64(sp)	
	sd	s1,56(sp)	
	sd	s2,48(sp)	
	sd	s3,40(sp)	
	addi	s0,sp,80	
	sd	a0,-56(s0)	
	sb	a1,-64(s0)	
	sd	a2,-72(s0)	
	ld	s1,-56(s0)		
	ld	a0,-72(s0)		
	call	_ZSt7forwardIN4rstd2OkIiEEEOT_RNSt16remove_referenceIS3_E4typeE		
	mv	a5,a0	
	mv	a2,a5	
	mv	a1,s3	
	mv	a0,s1	
	call	_ZNSt8__detail9__variant13_Variant_baseIJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEEC2ILm0EJS4_EEESt16in_place_index_tIXT_EEDpOT0_		
	mv	a1,s2	
	ld	a0,-56(s0)		
	call	_ZNSt27_Enable_default_constructorILb0ESt7variantIJN4rstd2OkIiEENS1_3ErrINS1_10file_errorEEEEEEC2ESt31_Enable_default_constructor_tag		
	nop	
	ld	ra,72(sp)		
	ld	s0,64(sp)		
	ld	s1,56(sp)		
	ld	s2,48(sp)		
	ld	s3,40(sp)		
	addi	sp,sp,80	
	jr	ra		
.LFE5530:
	.set	_ZNSt7variantIJN4rstd2OkIiEENS0_3ErrINS0_10file_errorEEEEEC1ILm0EJS2_ES2_vEESt16in_place_index_tIXT_EEDpOT0_,_ZNSt7variantIJN4rstd2OkIiEENS0_3ErrINS0_10file_errorEEEEEC2ILm0EJS2_ES2_vEESt16in_place_index_tIXT_EEDpOT0_
_ZNKSt7variantIJN4rstd2OkIiEENS0_3ErrINS0_10file_errorEEEEE5indexEv:
.LFB5532:
	addi	sp,sp,-32	
	sd	s0,24(sp)	
	addi	s0,sp,32	
	sd	a0,-24(s0)	
	ld	a5,-24(s0)		
	lbu	a5,4(a5)	
	mv	a0,a5	
	ld	s0,24(sp)		
	addi	sp,sp,32	
	jr	ra		
.LFE5532:
_ZNSt8__detail9__variant15_Copy_ctor_baseILb1EJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEECI2NS0_16_Variant_storageILb1EJS4_S7_EEEILm1EJS7_EEESt16in_place_index_tIXT_EEDpOT0_:
.LFB5656:
	addi	sp,sp,-48	
	sd	ra,40(sp)	
	sd	s0,32(sp)	
	addi	s0,sp,48	
	sd	a0,-24(s0)	
	sb	a1,-32(s0)	
	sd	a2,-40(s0)	
	ld	a5,-24(s0)		
	ld	a2,-40(s0)		
	mv	a1,a4	
	mv	a0,a5	
	call	_ZNSt8__detail9__variant16_Variant_storageILb1EJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEEC2ILm1EJS7_EEESt16in_place_index_tIXT_EEDpOT0_		
	nop	
	ld	ra,40(sp)		
	ld	s0,32(sp)		
	addi	sp,sp,48	
	jr	ra		
.LFE5656:
	.set	_ZNSt8__detail9__variant15_Copy_ctor_baseILb1EJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEECI1NS0_16_Variant_storageILb1EJS4_S7_EEEILm1EJS7_EEESt16in_place_index_tIXT_EEDpOT0_,_ZNSt8__detail9__variant15_Copy_ctor_baseILb1EJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEECI2NS0_16_Variant_storageILb1EJS4_S7_EEEILm1EJS7_EEESt16in_place_index_tIXT_EEDpOT0_
_ZNSt8__detail9__variant15_Move_ctor_baseILb1EJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEECI2NS0_16_Variant_storageILb1EJS4_S7_EEEILm1EJS7_EEESt16in_place_index_tIXT_EEDpOT0_:
.LFB5658:
	addi	sp,sp,-48	
	sd	ra,40(sp)	
	sd	s0,32(sp)	
	addi	s0,sp,48	
	sd	a0,-24(s0)	
	sb	a1,-32(s0)	
	sd	a2,-40(s0)	
	ld	a5,-24(s0)		
	ld	a2,-40(s0)		
	mv	a1,a4	
	mv	a0,a5	
	call	_ZNSt8__detail9__variant15_Copy_ctor_baseILb1EJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEECI2NS0_16_Variant_storageILb1EJS4_S7_EEEILm1EJS7_EEESt16in_place_index_tIXT_EEDpOT0_		
	nop	
	ld	ra,40(sp)		
	ld	s0,32(sp)		
	addi	sp,sp,48	
	jr	ra		
.LFE5658:
	.set	_ZNSt8__detail9__variant15_Move_ctor_baseILb1EJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEECI1NS0_16_Variant_storageILb1EJS4_S7_EEEILm1EJS7_EEESt16in_place_index_tIXT_EEDpOT0_,_ZNSt8__detail9__variant15_Move_ctor_baseILb1EJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEECI2NS0_16_Variant_storageILb1EJS4_S7_EEEILm1EJS7_EEESt16in_place_index_tIXT_EEDpOT0_
_ZNSt8__detail9__variant17_Copy_assign_baseILb1EJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEECI2NS0_16_Variant_storageILb1EJS4_S7_EEEILm1EJS7_EEESt16in_place_index_tIXT_EEDpOT0_:
.LFB5660:
	addi	sp,sp,-48	
	sd	ra,40(sp)	
	sd	s0,32(sp)	
	addi	s0,sp,48	
	sd	a0,-24(s0)	
	sb	a1,-32(s0)	
	sd	a2,-40(s0)	
	ld	a5,-24(s0)		
	ld	a2,-40(s0)		
	mv	a1,a4	
	mv	a0,a5	
	call	_ZNSt8__detail9__variant15_Move_ctor_baseILb1EJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEECI2NS0_16_Variant_storageILb1EJS4_S7_EEEILm1EJS7_EEESt16in_place_index_tIXT_EEDpOT0_		
	nop	
	ld	ra,40(sp)		
	ld	s0,32(sp)		
	addi	sp,sp,48	
	jr	ra		
.LFE5660:
	.set	_ZNSt8__detail9__variant17_Copy_assign_baseILb1EJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEECI1NS0_16_Variant_storageILb1EJS4_S7_EEEILm1EJS7_EEESt16in_place_index_tIXT_EEDpOT0_,_ZNSt8__detail9__variant17_Copy_assign_baseILb1EJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEECI2NS0_16_Variant_storageILb1EJS4_S7_EEEILm1EJS7_EEESt16in_place_index_tIXT_EEDpOT0_
_ZNSt8__detail9__variant17_Move_assign_baseILb1EJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEECI2NS0_16_Variant_storageILb1EJS4_S7_EEEILm1EJS7_EEESt16in_place_index_tIXT_EEDpOT0_:
.LFB5662:
	addi	sp,sp,-48	
	sd	ra,40(sp)	
	sd	s0,32(sp)	
	addi	s0,sp,48	
	sd	a0,-24(s0)	
	sb	a1,-32(s0)	
	sd	a2,-40(s0)	
	ld	a5,-24(s0)		
	ld	a2,-40(s0)		
	mv	a1,a4	
	mv	a0,a5	
	call	_ZNSt8__detail9__variant17_Copy_assign_baseILb1EJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEECI2NS0_16_Variant_storageILb1EJS4_S7_EEEILm1EJS7_EEESt16in_place_index_tIXT_EEDpOT0_		
	nop	
	ld	ra,40(sp)		
	ld	s0,32(sp)		
	addi	sp,sp,48	
	jr	ra		
.LFE5662:
	.set	_ZNSt8__detail9__variant17_Move_assign_baseILb1EJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEECI1NS0_16_Variant_storageILb1EJS4_S7_EEEILm1EJS7_EEESt16in_place_index_tIXT_EEDpOT0_,_ZNSt8__detail9__variant17_Move_assign_baseILb1EJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEECI2NS0_16_Variant_storageILb1EJS4_S7_EEEILm1EJS7_EEESt16in_place_index_tIXT_EEDpOT0_
_ZNSt8__detail9__variant13_Variant_baseIJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEEC2ILm1EJS7_EEESt16in_place_index_tIXT_EEDpOT0_:
.LFB5664:
	addi	sp,sp,-64	
	sd	ra,56(sp)	
	sd	s0,48(sp)	
	sd	s1,40(sp)	
	sd	s2,32(sp)	
	addi	s0,sp,64	
	sd	a0,-40(s0)	
	sb	a1,-48(s0)	
	sd	a2,-56(s0)	
	ld	s1,-40(s0)		
	ld	a0,-56(s0)		
	call	_ZSt7forwardIN4rstd3ErrINS0_10file_errorEEEEOT_RNSt16remove_referenceIS4_E4typeE		
	mv	a5,a0	
	mv	a2,a5	
	mv	a1,s2	
	mv	a0,s1	
	call	_ZNSt8__detail9__variant17_Move_assign_baseILb1EJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEECI2NS0_16_Variant_storageILb1EJS4_S7_EEEILm1EJS7_EEESt16in_place_index_tIXT_EEDpOT0_		
	nop	
	ld	ra,56(sp)		
	ld	s0,48(sp)		
	ld	s1,40(sp)		
	ld	s2,32(sp)		
	addi	sp,sp,64	
	jr	ra		
.LFE5664:
	.set	_ZNSt8__detail9__variant13_Variant_baseIJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEEC1ILm1EJS7_EEESt16in_place_index_tIXT_EEDpOT0_,_ZNSt8__detail9__variant13_Variant_baseIJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEEC2ILm1EJS7_EEESt16in_place_index_tIXT_EEDpOT0_
_ZNSt27_Enable_default_constructorILb0ESt7variantIJN4rstd2OkIiEENS1_3ErrINS1_10file_errorEEEEEEC2ESt31_Enable_default_constructor_tag:
.LFB5667:
	addi	sp,sp,-32	
	sd	s0,24(sp)	
	addi	s0,sp,32	
	sd	a0,-24(s0)	
	sb	a1,-32(s0)	
	nop	
	ld	s0,24(sp)		
	addi	sp,sp,32	
	jr	ra		
.LFE5667:
	.set	_ZNSt27_Enable_default_constructorILb0ESt7variantIJN4rstd2OkIiEENS1_3ErrINS1_10file_errorEEEEEEC1ESt31_Enable_default_constructor_tag,_ZNSt27_Enable_default_constructorILb0ESt7variantIJN4rstd2OkIiEENS1_3ErrINS1_10file_errorEEEEEEC2ESt31_Enable_default_constructor_tag
_ZNSt8__detail9__variant15_Copy_ctor_baseILb1EJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEECI2NS0_16_Variant_storageILb1EJS4_S7_EEEILm0EJS4_EEESt16in_place_index_tIXT_EEDpOT0_:
.LFB5674:
	addi	sp,sp,-48	
	sd	ra,40(sp)	
	sd	s0,32(sp)	
	addi	s0,sp,48	
	sd	a0,-24(s0)	
	sb	a1,-32(s0)	
	sd	a2,-40(s0)	
	ld	a5,-24(s0)		
	ld	a2,-40(s0)		
	mv	a1,a4	
	mv	a0,a5	
	call	_ZNSt8__detail9__variant16_Variant_storageILb1EJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEEC2ILm0EJS4_EEESt16in_place_index_tIXT_EEDpOT0_		
	nop	
	ld	ra,40(sp)		
	ld	s0,32(sp)		
	addi	sp,sp,48	
	jr	ra		
.LFE5674:
	.set	_ZNSt8__detail9__variant15_Copy_ctor_baseILb1EJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEECI1NS0_16_Variant_storageILb1EJS4_S7_EEEILm0EJS4_EEESt16in_place_index_tIXT_EEDpOT0_,_ZNSt8__detail9__variant15_Copy_ctor_baseILb1EJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEECI2NS0_16_Variant_storageILb1EJS4_S7_EEEILm0EJS4_EEESt16in_place_index_tIXT_EEDpOT0_
_ZNSt8__detail9__variant15_Move_ctor_baseILb1EJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEECI2NS0_16_Variant_storageILb1EJS4_S7_EEEILm0EJS4_EEESt16in_place_index_tIXT_EEDpOT0_:
.LFB5676:
	addi	sp,sp,-48	
	sd	ra,40(sp)	
	sd	s0,32(sp)	
	addi	s0,sp,48	
	sd	a0,-24(s0)	
	sb	a1,-32(s0)	
	sd	a2,-40(s0)	
	ld	a5,-24(s0)		
	ld	a2,-40(s0)		
	mv	a1,a4	
	mv	a0,a5	
	call	_ZNSt8__detail9__variant15_Copy_ctor_baseILb1EJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEECI2NS0_16_Variant_storageILb1EJS4_S7_EEEILm0EJS4_EEESt16in_place_index_tIXT_EEDpOT0_		
	nop	
	ld	ra,40(sp)		
	ld	s0,32(sp)		
	addi	sp,sp,48	
	jr	ra		
.LFE5676:
	.set	_ZNSt8__detail9__variant15_Move_ctor_baseILb1EJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEECI1NS0_16_Variant_storageILb1EJS4_S7_EEEILm0EJS4_EEESt16in_place_index_tIXT_EEDpOT0_,_ZNSt8__detail9__variant15_Move_ctor_baseILb1EJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEECI2NS0_16_Variant_storageILb1EJS4_S7_EEEILm0EJS4_EEESt16in_place_index_tIXT_EEDpOT0_
_ZNSt8__detail9__variant17_Copy_assign_baseILb1EJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEECI2NS0_16_Variant_storageILb1EJS4_S7_EEEILm0EJS4_EEESt16in_place_index_tIXT_EEDpOT0_:
.LFB5678:
	addi	sp,sp,-48	
	sd	ra,40(sp)	
	sd	s0,32(sp)	
	addi	s0,sp,48	
	sd	a0,-24(s0)	
	sb	a1,-32(s0)	
	sd	a2,-40(s0)	
	ld	a5,-24(s0)		
	ld	a2,-40(s0)		
	mv	a1,a4	
	mv	a0,a5	
	call	_ZNSt8__detail9__variant15_Move_ctor_baseILb1EJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEECI2NS0_16_Variant_storageILb1EJS4_S7_EEEILm0EJS4_EEESt16in_place_index_tIXT_EEDpOT0_		
	nop	
	ld	ra,40(sp)		
	ld	s0,32(sp)		
	addi	sp,sp,48	
	jr	ra		
.LFE5678:
	.set	_ZNSt8__detail9__variant17_Copy_assign_baseILb1EJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEECI1NS0_16_Variant_storageILb1EJS4_S7_EEEILm0EJS4_EEESt16in_place_index_tIXT_EEDpOT0_,_ZNSt8__detail9__variant17_Copy_assign_baseILb1EJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEECI2NS0_16_Variant_storageILb1EJS4_S7_EEEILm0EJS4_EEESt16in_place_index_tIXT_EEDpOT0_
_ZNSt8__detail9__variant17_Move_assign_baseILb1EJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEECI2NS0_16_Variant_storageILb1EJS4_S7_EEEILm0EJS4_EEESt16in_place_index_tIXT_EEDpOT0_:
.LFB5680:
	addi	sp,sp,-48	
	sd	ra,40(sp)	
	sd	s0,32(sp)	
	addi	s0,sp,48	
	sd	a0,-24(s0)	
	sb	a1,-32(s0)	
	sd	a2,-40(s0)	
	ld	a5,-24(s0)		
	ld	a2,-40(s0)		
	mv	a1,a4	
	mv	a0,a5	
	call	_ZNSt8__detail9__variant17_Copy_assign_baseILb1EJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEECI2NS0_16_Variant_storageILb1EJS4_S7_EEEILm0EJS4_EEESt16in_place_index_tIXT_EEDpOT0_		
	nop	
	ld	ra,40(sp)		
	ld	s0,32(sp)		
	addi	sp,sp,48	
	jr	ra		
.LFE5680:
	.set	_ZNSt8__detail9__variant17_Move_assign_baseILb1EJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEECI1NS0_16_Variant_storageILb1EJS4_S7_EEEILm0EJS4_EEESt16in_place_index_tIXT_EEDpOT0_,_ZNSt8__detail9__variant17_Move_assign_baseILb1EJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEECI2NS0_16_Variant_storageILb1EJS4_S7_EEEILm0EJS4_EEESt16in_place_index_tIXT_EEDpOT0_
_ZNSt8__detail9__variant13_Variant_baseIJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEEC2ILm0EJS4_EEESt16in_place_index_tIXT_EEDpOT0_:
.LFB5682:
	addi	sp,sp,-64	
	sd	ra,56(sp)	
	sd	s0,48(sp)	
	sd	s1,40(sp)	
	sd	s2,32(sp)	
	addi	s0,sp,64	
	sd	a0,-40(s0)	
	sb	a1,-48(s0)	
	sd	a2,-56(s0)	
	ld	s1,-40(s0)		
	ld	a0,-56(s0)		
	call	_ZSt7forwardIN4rstd2OkIiEEEOT_RNSt16remove_referenceIS3_E4typeE		
	mv	a5,a0	
	mv	a2,a5	
	mv	a1,s2	
	mv	a0,s1	
	call	_ZNSt8__detail9__variant17_Move_assign_baseILb1EJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEECI2NS0_16_Variant_storageILb1EJS4_S7_EEEILm0EJS4_EEESt16in_place_index_tIXT_EEDpOT0_		
	nop	
	ld	ra,56(sp)		
	ld	s0,48(sp)		
	ld	s1,40(sp)		
	ld	s2,32(sp)		
	addi	sp,sp,64	
	jr	ra		
.LFE5682:
	.set	_ZNSt8__detail9__variant13_Variant_baseIJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEEC1ILm0EJS4_EEESt16in_place_index_tIXT_EEDpOT0_,_ZNSt8__detail9__variant13_Variant_baseIJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEEC2ILm0EJS4_EEESt16in_place_index_tIXT_EEDpOT0_
_ZNSt8__detail9__variant16_Variant_storageILb1EJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEEC2ILm1EJS7_EEESt16in_place_index_tIXT_EEDpOT0_:
.LFB5726:
	addi	sp,sp,-64	
	sd	ra,56(sp)	
	sd	s0,48(sp)	
	sd	s1,40(sp)	
	sd	s2,32(sp)	
	addi	s0,sp,64	
	sd	a0,-40(s0)	
	sb	a1,-48(s0)	
	sd	a2,-56(s0)	
	ld	s1,-40(s0)		
	ld	a0,-56(s0)		
	call	_ZSt7forwardIN4rstd3ErrINS0_10file_errorEEEEOT_RNSt16remove_referenceIS4_E4typeE		
	mv	a5,a0	
	mv	a2,a5	
	mv	a1,s2	
	mv	a0,s1	
	call	_ZNSt8__detail9__variant15_Variadic_unionIJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEEC1ILm1EJS7_EEESt16in_place_index_tIXT_EEDpOT0_		
	ld	a5,-40(s0)		
	li	a4,1		
	sb	a4,4(a5)	
	nop	
	ld	ra,56(sp)		
	ld	s0,48(sp)		
	ld	s1,40(sp)		
	ld	s2,32(sp)		
	addi	sp,sp,64	
	jr	ra		
.LFE5726:
	.set	_ZNSt8__detail9__variant16_Variant_storageILb1EJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEEC1ILm1EJS7_EEESt16in_place_index_tIXT_EEDpOT0_,_ZNSt8__detail9__variant16_Variant_storageILb1EJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEEC2ILm1EJS7_EEESt16in_place_index_tIXT_EEDpOT0_
_ZNSt8__detail9__variant16_Variant_storageILb1EJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEEC2ILm0EJS4_EEESt16in_place_index_tIXT_EEDpOT0_:
.LFB5729:
	addi	sp,sp,-64	
	sd	ra,56(sp)	
	sd	s0,48(sp)	
	sd	s1,40(sp)	
	sd	s2,32(sp)	
	addi	s0,sp,64	
	sd	a0,-40(s0)	
	sb	a1,-48(s0)	
	sd	a2,-56(s0)	
	ld	s1,-40(s0)		
	ld	a0,-56(s0)		
	call	_ZSt7forwardIN4rstd2OkIiEEEOT_RNSt16remove_referenceIS3_E4typeE		
	mv	a5,a0	
	mv	a2,a5	
	mv	a1,s2	
	mv	a0,s1	
	call	_ZNSt8__detail9__variant15_Variadic_unionIJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEEC1IJS4_EEESt16in_place_index_tILm0EEDpOT_		
	ld	a5,-40(s0)		
	sb	zero,4(a5)	
	nop	
	ld	ra,56(sp)		
	ld	s0,48(sp)		
	ld	s1,40(sp)		
	ld	s2,32(sp)		
	addi	sp,sp,64	
	jr	ra		
.LFE5729:
	.set	_ZNSt8__detail9__variant16_Variant_storageILb1EJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEEC1ILm0EJS4_EEESt16in_place_index_tIXT_EEDpOT0_,_ZNSt8__detail9__variant16_Variant_storageILb1EJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEEC2ILm0EJS4_EEESt16in_place_index_tIXT_EEDpOT0_
_ZNSt8__detail9__variant15_Variadic_unionIJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEEC2ILm1EJS7_EEESt16in_place_index_tIXT_EEDpOT0_:
.LFB5754:
	addi	sp,sp,-64	
	sd	ra,56(sp)	
	sd	s0,48(sp)	
	sd	s1,40(sp)	
	sd	s2,32(sp)	
	addi	s0,sp,64	
	sd	a0,-40(s0)	
	sb	a1,-48(s0)	
	sd	a2,-56(s0)	
	ld	s1,-40(s0)		
	ld	a0,-56(s0)		
	call	_ZSt7forwardIN4rstd3ErrINS0_10file_errorEEEEOT_RNSt16remove_referenceIS4_E4typeE		
	mv	a5,a0	
	mv	a2,a5	
	mv	a1,s2	
	mv	a0,s1	
	call	_ZNSt8__detail9__variant15_Variadic_unionIJN4rstd3ErrINS2_10file_errorEEEEEC1IJS5_EEESt16in_place_index_tILm0EEDpOT_		
	nop	
	ld	ra,56(sp)		
	ld	s0,48(sp)		
	ld	s1,40(sp)		
	ld	s2,32(sp)		
	addi	sp,sp,64	
	jr	ra		
.LFE5754:
	.set	_ZNSt8__detail9__variant15_Variadic_unionIJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEEC1ILm1EJS7_EEESt16in_place_index_tIXT_EEDpOT0_,_ZNSt8__detail9__variant15_Variadic_unionIJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEEC2ILm1EJS7_EEESt16in_place_index_tIXT_EEDpOT0_
_ZNSt8__detail9__variant15_Variadic_unionIJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEEC2IJS4_EEESt16in_place_index_tILm0EEDpOT_:
.LFB5757:
	addi	sp,sp,-64	
	sd	ra,56(sp)	
	sd	s0,48(sp)	
	sd	s1,40(sp)	
	sd	s2,32(sp)	
	addi	s0,sp,64	
	sd	a0,-40(s0)	
	sb	a1,-48(s0)	
	sd	a2,-56(s0)	
	ld	s1,-40(s0)		
	ld	a0,-56(s0)		
	call	_ZSt7forwardIN4rstd2OkIiEEEOT_RNSt16remove_referenceIS3_E4typeE		
	mv	a5,a0	
	mv	a2,a5	
	mv	a1,s2	
	mv	a0,s1	
	call	_ZNSt8__detail9__variant14_UninitializedIN4rstd2OkIiEELb1EEC1IJS4_EEESt16in_place_index_tILm0EEDpOT_		
	nop	
	ld	ra,56(sp)		
	ld	s0,48(sp)		
	ld	s1,40(sp)		
	ld	s2,32(sp)		
	addi	sp,sp,64	
	jr	ra		
.LFE5757:
	.set	_ZNSt8__detail9__variant15_Variadic_unionIJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEEC1IJS4_EEESt16in_place_index_tILm0EEDpOT_,_ZNSt8__detail9__variant15_Variadic_unionIJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEEC2IJS4_EEESt16in_place_index_tILm0EEDpOT_
_ZNSt8__detail9__variant15_Variadic_unionIJN4rstd3ErrINS2_10file_errorEEEEEC2IJS5_EEESt16in_place_index_tILm0EEDpOT_:
.LFB5775:
	addi	sp,sp,-64	
	sd	ra,56(sp)	
	sd	s0,48(sp)	
	sd	s1,40(sp)	
	sd	s2,32(sp)	
	addi	s0,sp,64	
	sd	a0,-40(s0)	
	sb	a1,-48(s0)	
	sd	a2,-56(s0)	
	ld	s1,-40(s0)		
	ld	a0,-56(s0)		
	call	_ZSt7forwardIN4rstd3ErrINS0_10file_errorEEEEOT_RNSt16remove_referenceIS4_E4typeE		
	mv	a5,a0	
	mv	a2,a5	
	mv	a1,s2	
	mv	a0,s1	
	call	_ZNSt8__detail9__variant14_UninitializedIN4rstd3ErrINS2_10file_errorEEELb1EEC1IJS5_EEESt16in_place_index_tILm0EEDpOT_		
	nop	
	ld	ra,56(sp)		
	ld	s0,48(sp)		
	ld	s1,40(sp)		
	ld	s2,32(sp)		
	addi	sp,sp,64	
	jr	ra		
.LFE5775:
	.set	_ZNSt8__detail9__variant15_Variadic_unionIJN4rstd3ErrINS2_10file_errorEEEEEC1IJS5_EEESt16in_place_index_tILm0EEDpOT_,_ZNSt8__detail9__variant15_Variadic_unionIJN4rstd3ErrINS2_10file_errorEEEEEC2IJS5_EEESt16in_place_index_tILm0EEDpOT_
_ZNSt8__detail9__variant14_UninitializedIN4rstd2OkIiEELb1EEC2IJS4_EEESt16in_place_index_tILm0EEDpOT_:
.LFB5778:
	addi	sp,sp,-48	
	sd	ra,40(sp)	
	sd	s0,32(sp)	
	addi	s0,sp,48	
	sd	a0,-24(s0)	
	sb	a1,-32(s0)	
	sd	a2,-40(s0)	
	ld	a0,-40(s0)		
	call	_ZSt7forwardIN4rstd2OkIiEEEOT_RNSt16remove_referenceIS3_E4typeE		
	mv	a4,a0	
	ld	a5,-24(s0)		
	lw	a4,0(a4)		
	sw	a4,0(a5)	
	nop	
	ld	ra,40(sp)		
	ld	s0,32(sp)		
	addi	sp,sp,48	
	jr	ra		
.LFE5778:
	.set	_ZNSt8__detail9__variant14_UninitializedIN4rstd2OkIiEELb1EEC1IJS4_EEESt16in_place_index_tILm0EEDpOT_,_ZNSt8__detail9__variant14_UninitializedIN4rstd2OkIiEELb1EEC2IJS4_EEESt16in_place_index_tILm0EEDpOT_
_ZNSt8__detail9__variant14_UninitializedIN4rstd3ErrINS2_10file_errorEEELb1EEC2IJS5_EEESt16in_place_index_tILm0EEDpOT_:
.LFB5789:
	addi	sp,sp,-48	
	sd	ra,40(sp)	
	sd	s0,32(sp)	
	addi	s0,sp,48	
	sd	a0,-24(s0)	
	sb	a1,-32(s0)	
	sd	a2,-40(s0)	
	ld	a0,-40(s0)		
	call	_ZSt7forwardIN4rstd3ErrINS0_10file_errorEEEEOT_RNSt16remove_referenceIS4_E4typeE		
	nop	
	ld	ra,40(sp)		
	ld	s0,32(sp)		
	addi	sp,sp,48	
	jr	ra		
.LFE5789:
	.set	_ZNSt8__detail9__variant14_UninitializedIN4rstd3ErrINS2_10file_errorEEELb1EEC1IJS5_EEESt16in_place_index_tILm0EEDpOT_,_ZNSt8__detail9__variant14_UninitializedIN4rstd3ErrINS2_10file_errorEEELb1EEC2IJS5_EEESt16in_place_index_tILm0EEDpOT_
	.text
_Z41__static_initialization_and_destruction_0v:
.LFB5795:
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
.LFE5795:
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
_GLOBAL__sub_I__Znwm:
.LFB5796:
	addi	sp,sp,-16	
	sd	ra,8(sp)	
	sd	s0,0(sp)	
	addi	s0,sp,16	
	call	_Z41__static_initialization_and_destruction_0v		
	ld	ra,8(sp)		
	ld	s0,0(sp)		
	addi	sp,sp,16	
	jr	ra		
.LFE5796:
	.dword	_GLOBAL__sub_I__Znwm
