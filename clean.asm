	.text
	.weak	_ZN8rsyscall12print_stringEPKc
_ZN8rsyscall12print_stringEPKc:
.LFB3274:
	mv	a5,a0	
	li a7, 4
	mv a0, a5	
	ecall
	
	ret	
.LFE3274:
.LC0:
	.string	"/home/ivanpesnya/a.rs"
.LC1:
	.string	"couldn't load file\n"
.LC2:
	.string	"couldn't read from descriptor\n"
.LC3:
	.string	"===FILE CONTENTS===\n"
.LC4:
	.string	"===END OF FILE===\n"
	.globl	main
main:
.LFB3287:
	addi	sp,sp,-32	
	sd	s1,8(sp)	
	lui	s1,%hi(.LC0)	
	sd	ra,24(sp)	
	sd	s0,16(sp)	
	addi	s1,s1,%lo(.LC0)	
	li	a5,0		
	li a7, 1024
	mv a0, s1	
	mv a1, a5	
	ecall 
	mv s1, a0 	
	
	bge	s1,zero,.L3	
	lui	a0,%hi(.LC1)	
	addi	a0,a0,%lo(.LC1)	
	call	_ZN8rsyscall12print_stringEPKc		
	li	a5,1		
	addi a7, zero, 93
	add a0, zero, a5	
	ecall
	
.L3:
	lui	a3,%hi(_ZN6memoryL9heapStartE)	
	ld	a2,%lo(_ZN6memoryL9heapStartE)(a3)		
	li	a4,127		
	mv	a5,a2	
.L4:
	bne	a5,zero,.L7	
	addi a7, zero, 9
	add a0, zero, a5	
	ecall
	mv a5, a0	
	li	a4,152		
	addi a7, zero, 9
	add a0, zero, a4	
	ecall
	mv a4, a0	
	li	a1,-1		
	beq	a4,a1,.L10	
	li	a4,128		
	sd	a4,0(a5)	
	li	a4,1		
	sb	a4,8(a5)	
	bne	a2,zero,.L11	
	sd	a5,%lo(_ZN6memoryL9heapStartE)(a3)	
.L11:
	lui	a4,%hi(_ZN6memoryL3topE)	
	ld	a3,%lo(_ZN6memoryL3topE)(a4)		
	beq	a3,zero,.L12	
	sd	a5,16(a3)	
.L12:
	sd	a5,%lo(_ZN6memoryL3topE)(a4)	
.L20:
	addi	s0,a5,24	
	li	a5,128		
	li a7, 63
	mv a0, s1	
	mv a1, s0	
	mv a2, a5	
	ecall
	mv a5, a0	
	
	bge	a5,zero,.L13	
	lui	a0,%hi(.LC2)	
	addi	a0,a0,%lo(.LC2)	
	call	_ZN8rsyscall12print_stringEPKc		
.L13:
	lui	a0,%hi(.LC3)	
	addi	a0,a0,%lo(.LC3)	
	call	_ZN8rsyscall12print_stringEPKc		
	mv	a0,s0	
	call	_ZN8rsyscall12print_stringEPKc		
	lui	a0,%hi(.LC4)	
	addi	a0,a0,%lo(.LC4)	
	call	_ZN8rsyscall12print_stringEPKc		
	li a7, 57
	mv a0, s1	
	ecall
	
	li	a5,0		
	addi a7, zero, 93
	add a0, zero, a5	
	ecall
	
	ld	ra,24(sp)		
	ld	s0,16(sp)		
	ld	s1,8(sp)		
	li	a0,0		
	addi	sp,sp,32	
	jr	ra		
.L7:
	lbu	a1,8(a5)	
	bne	a1,zero,.L5	
	ld	a1,0(a5)		
	bgtu	a1,a4,.L20	
.L5:
	ld	a5,16(a5)		
	j	.L4		
.L10:
	sd	zero,0(zero)	
	ebreak	
.LFE3287:
_GLOBAL__sub_I_main:
.LFB3981:
	lui	a5,%hi(_ZN6memoryL9heapStartE)	
	ld	a4,%lo(_ZN6memoryL9heapStartE)(a5)		
	lui	a5,%hi(_ZN6memoryL3topE)	
	sd	a4,%lo(_ZN6memoryL3topE)(a5)	
	ret	
.LFE3981:
	.dword	_GLOBAL__sub_I_main
_ZN6memoryL3topE:
_ZN6memoryL9heapStartE:
