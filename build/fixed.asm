abort:
li a7, 93
li a0, 1
ecall
_ZnamPv:
#	operator new[](unsigned long, void*)
.LFB24:
#	.LFB24
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
#	.LFE24
_ZN8rsyscall7my_sbrkEl:
#	rsyscall::my_sbrk(long)
.LFB3226:
#	.LFB3226
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
#	.LFE3226
_ZN8rsyscall4exitEl:
#	rsyscall::exit(long)
.LFB3227:
#	.LFB3227
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
#	.LFE3227
_ZN8rsyscall12print_stringEPKc:
#	rsyscall::print_string(char const*)
.LFB3229:
#	.LFB3229
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
#	.LFE3229
_ZN8rsyscall9open_fileEPKcl:
#	rsyscall::open_file(char const*, long)
.LFB3230:
#	.LFB3230
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
#	.LFE3230
_ZN8rsyscall20read_from_descriptorEiPcl:
#	rsyscall::read_from_descriptor(int, char*, long)
.LFB3232:
#	.LFB3232
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
#	.LFE3232
.data
.align 3
_ZN6memoryL9heapStartE:
.space 8
.align 3
_ZN6memoryL3topE:
.space 8
.text
_ZN6memory5alignEm:
#	memory::align(unsigned long)
.LFB3234:
#	.LFB3234
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
#	.LFE3234
_ZN6memory9allocSizeEm:
#	memory::allocSize(unsigned long)
.LFB3235:
#	.LFB3235
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
#	.LFE3235
_ZN6memory13requestFromOSEm:
#	memory::requestFromOS(unsigned long)
.LFB3236:
#	.LFB3236
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
#	.L16
ld	a5,-24(s0)
.L17:
#	.L17
mv	a0,a5
ld	ra,40(sp)
ld	s0,32(sp)
addi	sp,sp,48
jr	ra
.LFE3236:
#	.LFE3236
_ZN6memory8firstFitEm:
#	memory::firstFit(unsigned long)
.LFB3237:
#	.LFB3237
addi	sp,sp,-48
sd	s0,40(sp)
addi	s0,sp,48
sd	a0,-40(s0)
lui	a5,%hi(_ZN6memoryL9heapStartE)
ld	a5,%lo(_ZN6memoryL9heapStartE)(a5)
sd	a5,-24(s0)
j	.L19
.L23:
#	.L23
ld	a5,-24(s0)
lbu	a5,8(a5)
bne	a5,zero,.L20
ld	a5,-24(s0)
ld	a5,0(a5)
ld	a4,-40(s0)
bleu	a4,a5,.L21
.L20:
#	.L20
ld	a5,-24(s0)
ld	a5,16(a5)
sd	a5,-24(s0)
j	.L19
.L21:
#	.L21
ld	a5,-24(s0)
j	.L22
.L19:
#	.L19
ld	a5,-24(s0)
bne	a5,zero,.L23
li	a5,0
.L22:
#	.L22
mv	a0,a5
ld	s0,40(sp)
addi	sp,sp,48
jr	ra
.LFE3237:
#	.LFE3237
_ZN6memory9findBlockEm:
#	memory::findBlock(unsigned long)
.LFB3238:
#	.LFB3238
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
#	.LFE3238
_ZN6memory5allocEm:
#	memory::alloc(unsigned long)
.LFB3239:
#	.LFB3239
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
#	.L27
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
addi sp,sp,4
sd t0,0(sp)
mv t0,a5
addi t0,t0,%lo(_ZN6memoryL9heapStartE)
sd a4,0(t0)
ld t0,(sp)
addi sp,sp,-4
.L29:
#	.L29
lui	a5,%hi(_ZN6memoryL3topE)
ld	a5,%lo(_ZN6memoryL3topE)(a5)
beq	a5,zero,.L30
lui	a5,%hi(_ZN6memoryL3topE)
ld	a5,%lo(_ZN6memoryL3topE)(a5)
ld	a4,-32(s0)
sd	a4,16(a5)
.L30:
#	.L30
lui	a5,%hi(_ZN6memoryL3topE)
ld	a4,-32(s0)
addi sp,sp,4
sd t0,0(sp)
mv t0,a5
addi t0,t0,%lo(_ZN6memoryL3topE)
sd a4,0(t0)
ld t0,(sp)
addi sp,sp,-4
ld	a5,-32(s0)
addi	a5,a5,24
.L28:
#	.L28
mv	a0,a5
ld	ra,40(sp)
ld	s0,32(sp)
addi	sp,sp,48
jr	ra
.LFE3239:
#	.LFE3239
_ZN6memory9getHeaderEPKl:
#	memory::getHeader(long const*)
.LFB3240:
#	.LFB3240
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
#	.LFE3240
_ZN6memory4freeEPl:
#	memory::free(long*)
.LFB3241:
#	.LFB3241
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
#	.LFE3241
_ZN4rstd6stringC2Ev:
#	rstd::string::string()
.LFB4609:
#	.LFB4609
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
#	.LFE4609
_ZN4rstd6stringD2Ev:
#	rstd::string::~string()
.LFB4621:
#	.LFB4621
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
#	.LFE4621
_ZN4rstd6string5c_strEv:
#	rstd::string::c_str()
.LFB4636:
#	.LFB4636
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
#	.LFE4636
_ZN4rstd6string5clearEv:
#	rstd::string::clear()
.LFB4641:
#	.LFB4641
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
#	.L39
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
#	.LFE4641
_ZN4rstd6string9push_backEc:
#	rstd::string::push_back(char)
.LFB4645:
#	.LFB4645
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
#	.L42
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
#	.L41
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
#	.L44
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
#	.L40
ld	ra,24(sp)
ld	s0,16(sp)
addi	sp,sp,32
jr	ra
.LFE4645:
#	.LFE4645
_ZN4rstd6string7reserveEm:
#	rstd::string::reserve(unsigned long)
.LFB4647:
#	.LFB4647
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
#	.L49
ld	a5,-56(s0)
sd	zero,16(a5)
.L48:
#	.L48
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
#	.L50
nop
.L45:
#	.L45
ld	ra,56(sp)
ld	s0,48(sp)
ld	s1,40(sp)
addi	sp,sp,64
jr	ra
.LFE4647:
#	.LFE4647
_ZN4rstd9read_fileEPKcRNS_6stringE:
#	rstd::read_file(char const*, rstd::string&)
.LFB4661:
#	.LFB4661
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
call	_ZN4rstd3ErrINS_10file_errorEEC2ES1_
addi	a5,s0,-120
lbu	a4,-112(s0)
mv	a1,a4
mv	a0,a5
call	_ZN4rstd6ResultIiNS_10file_errorEEC2ENS_3ErrIS1_EE
ld	a5,-120(s0)
sd	a5,-128(s0)
j	.L59
.L52:
#	.L52
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
call	_ZN4rstd3ErrINS_10file_errorEEC2ES1_
addi	a5,s0,-96
lbu	a4,-88(s0)
mv	a1,a4
mv	a0,a5
call	_ZN4rstd6ResultIiNS_10file_errorEEC2ENS_3ErrIS1_EE
ld	a5,-96(s0)
sd	a5,-128(s0)
j	.L59
.L55:
#	.L55
sd	zero,-40(s0)
j	.L56
.L57:
#	.L57
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
#	.L56
ld	a5,-56(s0)
ld	a4,-40(s0)
bltu	a4,a5,.L57
ld	a4,-56(s0)
li	a5,127
ble	a4,a5,.L60
j	.L52
.L60:
#	.L60
nop
.L54:
#	.L54
addi	a5,s0,-64
li	a1,0
mv	a0,a5
call	_ZN4rstd2OkIiEC2Ei
addi	a5,s0,-72
lw	a4,-64(s0)
mv	a1,a4
mv	a0,a5
call	_ZN4rstd6ResultIiNS_10file_errorEEC2ENS_2OkIiEE
ld	a5,-72(s0)
sd	a5,-128(s0)
.L59:
#	.L59
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
#	.LFE4661
.globl	_Znwm
#	operator new(unsigned long)
_Znwm:
#	operator new(unsigned long)
.LFB4878:
#	.LFB4878
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
#	.LFE4878
.globl	_ZdlPv
#	operator delete(void*)
_ZdlPv:
#	operator delete(void*)
.LFB4879:
#	.LFB4879
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
#	.LFE4879
.globl	_Znam
#	operator new[](unsigned long)
_Znam:
#	operator new[](unsigned long)
.LFB4880:
#	.LFB4880
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
#	.LFE4880
.globl	_ZdaPv
#	operator delete[](void*)
_ZdaPv:
#	operator delete[](void*)
.LFB4881:
#	.LFB4881
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
#	.LFE4881
.data
.LC0:
#	.LC0
.string	"/home/ivanpesnya/my-rars-python-interpreter/build/fixed.asm"
.LC1:
#	.LC1
.string	"ERROR OCCURED WHILTE READING FILE"
.text
.globl	main
#	main
main:
#	main
.LFB4882:
#	.LFB4882
addi	sp,sp,-48
sd	ra,40(sp)
sd	s0,32(sp)
addi	s0,sp,48
addi	a5,s0,-40
mv	a0,a5
call	_ZN4rstd6stringC2Ev
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
#	.L68
lui	a5,%hi(.LC1)
addi	a0,a5,%lo(.LC1)
call	_ZN8rsyscall12print_stringEPKc
.L69:
#	.L69
li	a0,0
call	_ZN8rsyscall4exitEl
addi	a5,s0,-40
mv	a0,a5
call	_ZN4rstd6stringD2Ev
li	a5,0
mv	a0,a5
ld	ra,40(sp)
ld	s0,32(sp)
addi	sp,sp,48
jr	ra
.LFE4882:
#	.LFE4882
_ZN6memory7memmoveIcEEvPT_S2_m:
#	void memory::memmove<char>(char*, char*, unsigned long)
.LFB5218:
#	.LFB5218
addi	sp,sp,-64
sd	s0,56(sp)
addi	s0,sp,64
sd	a0,-40(s0)
sd	a1,-48(s0)
sd	a2,-56(s0)
sd	zero,-24(s0)
j	.L72
.L73:
#	.L73
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
#	.L72
ld	a4,-24(s0)
ld	a5,-56(s0)
bltu	a4,a5,.L73
nop
nop
ld	s0,56(sp)
addi	sp,sp,64
jr	ra
.LFE5218:
#	.LFE5218
_ZN4rstd3ErrINS_10file_errorEEC2ES1_:
#	rstd::Err<rstd::file_error>::Err(rstd::file_error)
.LFB5221:
#	.LFB5221
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
#	.LFE5221
_ZN4rstd6ResultIiNS_10file_errorEEC2ENS_3ErrIS1_EE:
#	rstd::Result<int, rstd::file_error>::Result(rstd::Err<rstd::file_error>)
.LFB5225:
#	.LFB5225
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
call	_ZNSt7variantIJN4rstd2OkIiEENS0_3ErrINS0_10file_errorEEEEEC2IS5_vvS5_vEEOT_
nop
ld	ra,40(sp)
ld	s0,32(sp)
ld	s1,24(sp)
addi	sp,sp,48
jr	ra
.LFE5225:
#	.LFE5225
_ZN4rstd2OkIiEC2Ei:
#	rstd::Ok<int>::Ok(int)
.LFB5228:
#	.LFB5228
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
#	.LFE5228
_ZSt24__find_uniq_type_in_packIN4rstd2OkIiEEJS2_NS0_3ErrINS0_10file_errorEEEEEmv:
#	unsigned long std::__find_uniq_type_in_pack<rstd::Ok<int>, rstd::Ok<int>, rstd::Err<rstd::file_error> >()
.LFB5231:
#	.LFB5231
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
#	.L82
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
#	.L80
ld	a5,-32(s0)
sd	a5,-24(s0)
.L79:
#	.L79
ld	a5,-32(s0)
addi	a5,a5,1
sd	a5,-32(s0)
.L78:
#	.L78
ld	a4,-32(s0)
li	a5,1
bleu	a4,a5,.L82
ld	a5,-24(s0)
.L83:
#	.L83
mv	a0,a5
ld	s0,40(sp)
addi	sp,sp,48
jr	ra
.LFE5231:
#	.LFE5231
_ZN4rstd6ResultIiNS_10file_errorEEC2ENS_2OkIiEE:
#	rstd::Result<int, rstd::file_error>::Result(rstd::Ok<int>)
.LFB5232:
#	.LFB5232
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
call	_ZNSt7variantIJN4rstd2OkIiEENS0_3ErrINS0_10file_errorEEEEEC2IS2_vvS2_vEEOT_
nop
ld	ra,40(sp)
ld	s0,32(sp)
ld	s1,24(sp)
addi	sp,sp,48
jr	ra
.LFE5232:
#	.LFE5232
_ZNK4rstd6ResultIiNS_10file_errorEE5is_okEv:
#	rstd::Result<int, rstd::file_error>::is_ok() const
.LFB5234:
#	.LFB5234
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
#	.LFE5234
_ZSt4moveIRN4rstd10file_errorEEONSt16remove_referenceIT_E4typeEOS4_:
#	std::remove_reference<rstd::file_error&>::type&& std::move<rstd::file_error&>(rstd::file_error&)
.LFB5398:
#	.LFB5398
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
#	.LFE5398
_ZSt4moveIRN4rstd3ErrINS0_10file_errorEEEEONSt16remove_referenceIT_E4typeEOS6_:
#	std::remove_reference<rstd::Err<rstd::file_error>&>::type&& std::move<rstd::Err<rstd::file_error>&>(rstd::Err<rstd::file_error>&)
.LFB5399:
#	.LFB5399
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
#	.LFE5399
_ZNSt7variantIJN4rstd2OkIiEENS0_3ErrINS0_10file_errorEEEEEC2IS5_vvS5_vEEOT_:
#	std::variant<rstd::Ok<int>, rstd::Err<rstd::file_error> >::variant<rstd::Err<rstd::file_error>, void, void, rstd::Err<rstd::file_error>, void>(rstd::Err<rstd::file_error>&&)
.LFB5401:
#	.LFB5401
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
call	_ZNSt7variantIJN4rstd2OkIiEENS0_3ErrINS0_10file_errorEEEEEC2ILm1EJS5_ES5_vEESt16in_place_index_tIXT_EEDpOT0_
nop
ld	ra,40(sp)
ld	s0,32(sp)
ld	s1,24(sp)
addi	sp,sp,48
jr	ra
.LFE5401:
#	.LFE5401
_ZSt4moveIRiEONSt16remove_referenceIT_E4typeEOS2_:
#	std::remove_reference<int&>::type&& std::move<int&>(int&)
.LFB5403:
#	.LFB5403
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
#	.LFE5403
_ZSt4moveIRN4rstd2OkIiEEEONSt16remove_referenceIT_E4typeEOS5_:
#	std::remove_reference<rstd::Ok<int>&>::type&& std::move<rstd::Ok<int>&>(rstd::Ok<int>&)
.LFB5404:
#	.LFB5404
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
#	.LFE5404
_ZNSt7variantIJN4rstd2OkIiEENS0_3ErrINS0_10file_errorEEEEEC2IS2_vvS2_vEEOT_:
#	std::variant<rstd::Ok<int>, rstd::Err<rstd::file_error> >::variant<rstd::Ok<int>, void, void, rstd::Ok<int>, void>(rstd::Ok<int>&&)
.LFB5406:
#	.LFB5406
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
call	_ZNSt7variantIJN4rstd2OkIiEENS0_3ErrINS0_10file_errorEEEEEC2ILm0EJS2_ES2_vEESt16in_place_index_tIXT_EEDpOT0_
nop
ld	ra,40(sp)
ld	s0,32(sp)
ld	s1,24(sp)
addi	sp,sp,48
jr	ra
.LFE5406:
#	.LFE5406
_ZSt17holds_alternativeIN4rstd2OkIiEEJS2_NS0_3ErrINS0_10file_errorEEEEEbRKSt7variantIJDpT0_EE:
#	bool std::holds_alternative<rstd::Ok<int>, rstd::Ok<int>, rstd::Err<rstd::file_error> >(std::variant<rstd::Ok<int>, rstd::Err<rstd::file_error> > const&)
.LFB5408:
#	.LFB5408
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
#	.LFE5408
_ZSt7forwardIN4rstd3ErrINS0_10file_errorEEEEOT_RNSt16remove_referenceIS4_E4typeE:
#	rstd::Err<rstd::file_error>&& std::forward<rstd::Err<rstd::file_error> >(std::remove_reference<rstd::Err<rstd::file_error> >::type&)
.LFB5524:
#	.LFB5524
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
#	.LFE5524
_ZNSt7variantIJN4rstd2OkIiEENS0_3ErrINS0_10file_errorEEEEEC2ILm1EJS5_ES5_vEESt16in_place_index_tIXT_EEDpOT0_:
#	std::variant<rstd::Ok<int>, rstd::Err<rstd::file_error> >::variant<1ul, rstd::Err<rstd::file_error>, rstd::Err<rstd::file_error>, void>(std::in_place_index_t<1ul>, rstd::Err<rstd::file_error>&&)
.LFB5526:
#	.LFB5526
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
#	.LFE5526
_ZSt7forwardIN4rstd2OkIiEEEOT_RNSt16remove_referenceIS3_E4typeE:
#	rstd::Ok<int>&& std::forward<rstd::Ok<int> >(std::remove_reference<rstd::Ok<int> >::type&)
.LFB5528:
#	.LFB5528
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
#	.LFE5528
_ZNSt7variantIJN4rstd2OkIiEENS0_3ErrINS0_10file_errorEEEEEC2ILm0EJS2_ES2_vEESt16in_place_index_tIXT_EEDpOT0_:
#	std::variant<rstd::Ok<int>, rstd::Err<rstd::file_error> >::variant<0ul, rstd::Ok<int>, rstd::Ok<int>, void>(std::in_place_index_t<0ul>, rstd::Ok<int>&&)
.LFB5530:
#	.LFB5530
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
#	.LFE5530
_ZNKSt7variantIJN4rstd2OkIiEENS0_3ErrINS0_10file_errorEEEEE5indexEv:
#	std::variant<rstd::Ok<int>, rstd::Err<rstd::file_error> >::index() const
.LFB5532:
#	.LFB5532
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
#	.LFE5532
_ZNSt8__detail9__variant15_Copy_ctor_baseILb1EJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEECI2NS0_16_Variant_storageILb1EJS4_S7_EEEILm1EJS7_EEESt16in_place_index_tIXT_EEDpOT0_:
#	std::__detail::__variant::_Copy_ctor_base<true, rstd::Ok<int>, rstd::Err<rstd::file_error> >::_Variant_storage<1ul, rstd::Err<rstd::file_error> >(std::in_place_index_t<1ul>, rstd::Err<rstd::file_error>&&)
.LFB5656:
#	.LFB5656
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
#	.LFE5656
_ZNSt8__detail9__variant15_Move_ctor_baseILb1EJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEECI2NS0_16_Variant_storageILb1EJS4_S7_EEEILm1EJS7_EEESt16in_place_index_tIXT_EEDpOT0_:
#	std::__detail::__variant::_Move_ctor_base<true, rstd::Ok<int>, rstd::Err<rstd::file_error> >::_Variant_storage<1ul, rstd::Err<rstd::file_error> >(std::in_place_index_t<1ul>, rstd::Err<rstd::file_error>&&)
.LFB5658:
#	.LFB5658
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
#	.LFE5658
_ZNSt8__detail9__variant17_Copy_assign_baseILb1EJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEECI2NS0_16_Variant_storageILb1EJS4_S7_EEEILm1EJS7_EEESt16in_place_index_tIXT_EEDpOT0_:
#	std::__detail::__variant::_Copy_assign_base<true, rstd::Ok<int>, rstd::Err<rstd::file_error> >::_Variant_storage<1ul, rstd::Err<rstd::file_error> >(std::in_place_index_t<1ul>, rstd::Err<rstd::file_error>&&)
.LFB5660:
#	.LFB5660
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
#	.LFE5660
_ZNSt8__detail9__variant17_Move_assign_baseILb1EJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEECI2NS0_16_Variant_storageILb1EJS4_S7_EEEILm1EJS7_EEESt16in_place_index_tIXT_EEDpOT0_:
#	std::__detail::__variant::_Move_assign_base<true, rstd::Ok<int>, rstd::Err<rstd::file_error> >::_Variant_storage<1ul, rstd::Err<rstd::file_error> >(std::in_place_index_t<1ul>, rstd::Err<rstd::file_error>&&)
.LFB5662:
#	.LFB5662
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
#	.LFE5662
_ZNSt8__detail9__variant13_Variant_baseIJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEEC2ILm1EJS7_EEESt16in_place_index_tIXT_EEDpOT0_:
#	std::__detail::__variant::_Variant_base<rstd::Ok<int>, rstd::Err<rstd::file_error> >::_Variant_base<1ul, rstd::Err<rstd::file_error> >(std::in_place_index_t<1ul>, rstd::Err<rstd::file_error>&&)
.LFB5664:
#	.LFB5664
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
#	.LFE5664
_ZNSt27_Enable_default_constructorILb0ESt7variantIJN4rstd2OkIiEENS1_3ErrINS1_10file_errorEEEEEEC2ESt31_Enable_default_constructor_tag:
#	std::_Enable_default_constructor<false, std::variant<rstd::Ok<int>, rstd::Err<rstd::file_error> > >::_Enable_default_constructor(std::_Enable_default_constructor_tag)
.LFB5667:
#	.LFB5667
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
#	.LFE5667
_ZNSt8__detail9__variant15_Copy_ctor_baseILb1EJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEECI2NS0_16_Variant_storageILb1EJS4_S7_EEEILm0EJS4_EEESt16in_place_index_tIXT_EEDpOT0_:
#	std::__detail::__variant::_Copy_ctor_base<true, rstd::Ok<int>, rstd::Err<rstd::file_error> >::_Variant_storage<0ul, rstd::Ok<int> >(std::in_place_index_t<0ul>, rstd::Ok<int>&&)
.LFB5674:
#	.LFB5674
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
#	.LFE5674
_ZNSt8__detail9__variant15_Move_ctor_baseILb1EJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEECI2NS0_16_Variant_storageILb1EJS4_S7_EEEILm0EJS4_EEESt16in_place_index_tIXT_EEDpOT0_:
#	std::__detail::__variant::_Move_ctor_base<true, rstd::Ok<int>, rstd::Err<rstd::file_error> >::_Variant_storage<0ul, rstd::Ok<int> >(std::in_place_index_t<0ul>, rstd::Ok<int>&&)
.LFB5676:
#	.LFB5676
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
#	.LFE5676
_ZNSt8__detail9__variant17_Copy_assign_baseILb1EJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEECI2NS0_16_Variant_storageILb1EJS4_S7_EEEILm0EJS4_EEESt16in_place_index_tIXT_EEDpOT0_:
#	std::__detail::__variant::_Copy_assign_base<true, rstd::Ok<int>, rstd::Err<rstd::file_error> >::_Variant_storage<0ul, rstd::Ok<int> >(std::in_place_index_t<0ul>, rstd::Ok<int>&&)
.LFB5678:
#	.LFB5678
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
#	.LFE5678
_ZNSt8__detail9__variant17_Move_assign_baseILb1EJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEECI2NS0_16_Variant_storageILb1EJS4_S7_EEEILm0EJS4_EEESt16in_place_index_tIXT_EEDpOT0_:
#	std::__detail::__variant::_Move_assign_base<true, rstd::Ok<int>, rstd::Err<rstd::file_error> >::_Variant_storage<0ul, rstd::Ok<int> >(std::in_place_index_t<0ul>, rstd::Ok<int>&&)
.LFB5680:
#	.LFB5680
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
#	.LFE5680
_ZNSt8__detail9__variant13_Variant_baseIJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEEC2ILm0EJS4_EEESt16in_place_index_tIXT_EEDpOT0_:
#	std::__detail::__variant::_Variant_base<rstd::Ok<int>, rstd::Err<rstd::file_error> >::_Variant_base<0ul, rstd::Ok<int> >(std::in_place_index_t<0ul>, rstd::Ok<int>&&)
.LFB5682:
#	.LFB5682
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
#	.LFE5682
_ZNSt8__detail9__variant16_Variant_storageILb1EJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEEC2ILm1EJS7_EEESt16in_place_index_tIXT_EEDpOT0_:
#	std::__detail::__variant::_Variant_storage<true, rstd::Ok<int>, rstd::Err<rstd::file_error> >::_Variant_storage<1ul, rstd::Err<rstd::file_error> >(std::in_place_index_t<1ul>, rstd::Err<rstd::file_error>&&)
.LFB5726:
#	.LFB5726
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
call	_ZNSt8__detail9__variant15_Variadic_unionIJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEEC2ILm1EJS7_EEESt16in_place_index_tIXT_EEDpOT0_
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
#	.LFE5726
_ZNSt8__detail9__variant16_Variant_storageILb1EJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEEC2ILm0EJS4_EEESt16in_place_index_tIXT_EEDpOT0_:
#	std::__detail::__variant::_Variant_storage<true, rstd::Ok<int>, rstd::Err<rstd::file_error> >::_Variant_storage<0ul, rstd::Ok<int> >(std::in_place_index_t<0ul>, rstd::Ok<int>&&)
.LFB5729:
#	.LFB5729
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
call	_ZNSt8__detail9__variant15_Variadic_unionIJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEEC2IJS4_EEESt16in_place_index_tILm0EEDpOT_
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
#	.LFE5729
_ZNSt8__detail9__variant15_Variadic_unionIJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEEC2ILm1EJS7_EEESt16in_place_index_tIXT_EEDpOT0_:
#	std::__detail::__variant::_Variadic_union<rstd::Ok<int>, rstd::Err<rstd::file_error> >::_Variadic_union<1ul, rstd::Err<rstd::file_error> >(std::in_place_index_t<1ul>, rstd::Err<rstd::file_error>&&)
.LFB5754:
#	.LFB5754
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
call	_ZNSt8__detail9__variant15_Variadic_unionIJN4rstd3ErrINS2_10file_errorEEEEEC2IJS5_EEESt16in_place_index_tILm0EEDpOT_
nop
ld	ra,56(sp)
ld	s0,48(sp)
ld	s1,40(sp)
ld	s2,32(sp)
addi	sp,sp,64
jr	ra
.LFE5754:
#	.LFE5754
_ZNSt8__detail9__variant15_Variadic_unionIJN4rstd2OkIiEENS2_3ErrINS2_10file_errorEEEEEC2IJS4_EEESt16in_place_index_tILm0EEDpOT_:
#	std::__detail::__variant::_Variadic_union<rstd::Ok<int>, rstd::Err<rstd::file_error> >::_Variadic_union<rstd::Ok<int> >(std::in_place_index_t<0ul>, rstd::Ok<int>&&)
.LFB5757:
#	.LFB5757
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
call	_ZNSt8__detail9__variant14_UninitializedIN4rstd2OkIiEELb1EEC2IJS4_EEESt16in_place_index_tILm0EEDpOT_
nop
ld	ra,56(sp)
ld	s0,48(sp)
ld	s1,40(sp)
ld	s2,32(sp)
addi	sp,sp,64
jr	ra
.LFE5757:
#	.LFE5757
_ZNSt8__detail9__variant15_Variadic_unionIJN4rstd3ErrINS2_10file_errorEEEEEC2IJS5_EEESt16in_place_index_tILm0EEDpOT_:
#	std::__detail::__variant::_Variadic_union<rstd::Err<rstd::file_error> >::_Variadic_union<rstd::Err<rstd::file_error> >(std::in_place_index_t<0ul>, rstd::Err<rstd::file_error>&&)
.LFB5775:
#	.LFB5775
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
call	_ZNSt8__detail9__variant14_UninitializedIN4rstd3ErrINS2_10file_errorEEELb1EEC2IJS5_EEESt16in_place_index_tILm0EEDpOT_
nop
ld	ra,56(sp)
ld	s0,48(sp)
ld	s1,40(sp)
ld	s2,32(sp)
addi	sp,sp,64
jr	ra
.LFE5775:
#	.LFE5775
_ZNSt8__detail9__variant14_UninitializedIN4rstd2OkIiEELb1EEC2IJS4_EEESt16in_place_index_tILm0EEDpOT_:
#	std::__detail::__variant::_Uninitialized<rstd::Ok<int>, true>::_Uninitialized<rstd::Ok<int> >(std::in_place_index_t<0ul>, rstd::Ok<int>&&)
.LFB5778:
#	.LFB5778
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
#	.LFE5778
_ZNSt8__detail9__variant14_UninitializedIN4rstd3ErrINS2_10file_errorEEELb1EEC2IJS5_EEESt16in_place_index_tILm0EEDpOT_:
#	std::__detail::__variant::_Uninitialized<rstd::Err<rstd::file_error>, true>::_Uninitialized<rstd::Err<rstd::file_error> >(std::in_place_index_t<0ul>, rstd::Err<rstd::file_error>&&)
.LFB5789:
#	.LFB5789
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
#	.LFE5789
_Z41__static_initialization_and_destruction_0v:
#	__static_initialization_and_destruction_0()
.LFB5795:
#	.LFB5795
addi	sp,sp,-16
sd	s0,8(sp)
addi	s0,sp,16
lui	a5,%hi(_ZN6memoryL9heapStartE)
ld	a4,%lo(_ZN6memoryL9heapStartE)(a5)
lui	a5,%hi(_ZN6memoryL3topE)
addi sp,sp,4
sd t0,0(sp)
mv t0,a5
addi t0,t0,%lo(_ZN6memoryL3topE)
sd a4,0(t0)
ld t0,(sp)
addi sp,sp,-4
nop
ld	s0,8(sp)
addi	sp,sp,16
jr	ra
.LFE5795:
#	.LFE5795
.data
_ZNSt8__detail14__destructibleISt13_Bit_iteratorEE:
#	std::__detail::__destructible<std::_Bit_iterator>
.byte	1
_ZNSt8__detail19__destructible_implISt13_Bit_iteratorEE:
#	std::__detail::__destructible_impl<std::_Bit_iterator>
.byte	1
_ZNSt8__detail14__destructibleISt19_Bit_const_iteratorEE:
#	std::__detail::__destructible<std::_Bit_const_iterator>
.byte	1
_ZNSt8__detail19__destructible_implISt19_Bit_const_iteratorEE:
#	std::__detail::__destructible_impl<std::_Bit_const_iterator>
.byte	1
_ZNSt8__detail30__integer_to_chars_is_unsignedIjEE:
#	std::__detail::__integer_to_chars_is_unsigned<unsigned int>
.byte	1
_ZNSt8__detail30__integer_to_chars_is_unsignedImEE:
#	std::__detail::__integer_to_chars_is_unsigned<unsigned long>
.byte	1
_ZNSt8__detail30__integer_to_chars_is_unsignedIyEE:
#	std::__detail::__integer_to_chars_is_unsigned<unsigned long long>
.byte	1
.text
_GLOBAL__sub_I__Znwm:
#	_GLOBAL__sub_I__Znwm
.LFB5796:
#	.LFB5796
addi	sp,sp,-16
sd	ra,8(sp)
sd	s0,0(sp)
addi	s0,sp,16
call	_Z41__static_initialization_and_destruction_0v
ld	ra,8(sp)
ld	s0,0(sp)
addi	sp,sp,16
jr	ra
.data
.LFE5796:
#	.LFE5796
.dword	_GLOBAL__sub_I__Znwm