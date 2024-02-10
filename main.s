	.file	"main.cpp"
	.option nopic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._Z7myallocm,"axG",@progbits,_Z7myallocm,comdat
	.align	1
	.weak	_Z7myallocm
	.type	_Z7myallocm, @function
_Z7myallocm:
.LFB101:
	.cfi_startproc
	addi	a4,a0,7
	andi	a4,a4,-8
	li	a2,-1
	li	a5,0
	addi	a3,a4,24
#APP
# 7 "syscall.hpp" 1
	addi a7, zero, 9
	add a0, zero, a5
	ecall
	mv a5, a0
# 0 "" 2
# 7 "syscall.hpp" 1
	addi a7, zero, 9
	add a0, zero, a3
	ecall
	mv a3, a0
# 0 "" 2
#NO_APP
	beq	a3,a2,.L2
	sd	a4,0(a5)
	li	a4,1
	sb	a4,8(a5)
	lui	a4,%hi(_ZL9heapStart)
	ld	a3,%lo(_ZL9heapStart)(a4)
	bne	a3,zero,.L3
	sd	a5,%lo(_ZL9heapStart)(a4)
.L3:
	lui	a4,%hi(_ZL3top)
	ld	a3,%lo(_ZL3top)(a4)
	beq	a3,zero,.L4
	sd	a5,16(a3)
.L4:
	sd	a5,%lo(_ZL3top)(a4)
	addi	a0,a5,24
	ret
.L2:
	sd	zero,0(zero)
	ebreak
	.cfi_endproc
.LFE101:
	.size	_Z7myallocm, .-_Z7myallocm
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
.LFB103:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a0,32
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	call	_Z7myallocm
	mv	s0,a0
	li	a0,32
	call	_Z7myallocm
	li	a4,1
	sw	a4,0(s0)
	li	a4,2
	sw	a4,4(s0)
	li	a4,3
	sw	a4,8(s0)
	li	a4,4
	sw	a4,12(s0)
	li	a4,-1
	sw	a4,0(a0)
	li	a4,-2
	sw	a4,4(a0)
	li	a4,-3
	sw	a4,8(a0)
	li	a4,-4
	sw	a4,12(a0)
	mv	a5,a0
	mv	a4,s0
	addi	a3,s0,16
.L10:
	lw	a2,0(a4)
#APP
# 25 "syscall.hpp" 1
	li a7, 1
	mv a0 a2
	ecall
	
# 0 "" 2
#NO_APP
	addi	a4,a4,4
	bne	a4,a3,.L10
	addi	a4,a5,16
.L11:
	lw	a3,0(a5)
#APP
# 25 "syscall.hpp" 1
	li a7, 1
	mv a0 a3
	ecall
	
# 0 "" 2
#NO_APP
	addi	a5,a5,4
	bne	a5,a4,.L11
	li	a5,0
#APP
# 18 "syscall.hpp" 1
	addi a7, zero, 93
	add a0, zero, a5
	ecall
	
# 0 "" 2
#NO_APP
	ld	ra,8(sp)
	.cfi_restore 1
	ld	s0,0(sp)
	.cfi_restore 8
	li	a0,0
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE103:
	.size	main, .-main
	.align	1
	.type	_GLOBAL__sub_I_main, @function
_GLOBAL__sub_I_main:
.LFB105:
	.cfi_startproc
	lui	a5,%hi(_ZL9heapStart)
	ld	a4,%lo(_ZL9heapStart)(a5)
	lui	a5,%hi(_ZL3top)
	sd	a4,%lo(_ZL3top)(a5)
	ret
	.cfi_endproc
.data
.LFE105:
	.size	_GLOBAL__sub_I_main, .-_GLOBAL__sub_I_main
	.section	.init_array,"aw"
	.align	3
	.dword	_GLOBAL__sub_I_main
	.section	.sbss._ZL3top,"aw",@nobits
	.align	3
	.type	_ZL3top, @object
	.size	_ZL3top, 8
_ZL3top:
	.zero	8
	.section	.sbss._ZL9heapStart,"aw",@nobits
	.align	3
	.type	_ZL9heapStart, @object
	.size	_ZL9heapStart, 8
_ZL9heapStart:
	.zero	8
	.ident	"GCC: (gc891d8dc23e) 13.2.0"
	.section	.note.GNU-stack,"",@progbits
