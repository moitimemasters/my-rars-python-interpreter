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
_ZN8rsyscall10close_fileEl:
#	rsyscall::close_file(long)
.LFB3231:
#	.LFB3231
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
#	.LFE3231
_ZN8rsyscall20read_from_descriptorElPcl:
#	rsyscall::read_from_descriptor(long, char*, long)
.LFB3232:
#	.LFB3232
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
beq	a5,zero,.L17
li	a5,0
j	.L18
.L17:
#	.L17
ld	a5,-24(s0)
.L18:
#	.L18
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
j	.L20
.L24:
#	.L24
ld	a5,-24(s0)
lbu	a5,8(a5)
bne	a5,zero,.L21
ld	a5,-24(s0)
ld	a5,0(a5)
ld	a4,-40(s0)
bleu	a4,a5,.L22
.L21:
#	.L21
ld	a5,-24(s0)
ld	a5,16(a5)
sd	a5,-24(s0)
j	.L20
.L22:
#	.L22
ld	a5,-24(s0)
j	.L23
.L20:
#	.L20
ld	a5,-24(s0)
bne	a5,zero,.L24
li	a5,0
.L23:
#	.L23
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
.data
.LC0:
#	.LC0
.string	"Out of memory\n"
.text
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
beq	a5,zero,.L28
ld	a5,-24(s0)
addi	a5,a5,24
j	.L29
.L28:
#	.L28
ld	a0,-40(s0)
call	_ZN6memory13requestFromOSEm
sd	a0,-32(s0)
ld	a5,-32(s0)
bne	a5,zero,.L30
lui	a5,%hi(.LC0)
addi	a0,a5,%lo(.LC0)
call	_ZN8rsyscall12print_stringEPKc
li	a0,1
call	_ZN8rsyscall4exitEl
li	a5,0
j	.L29
.L30:
#	.L30
ld	a5,-32(s0)
ld	a4,-40(s0)
sd	a4,0(a5)
ld	a5,-32(s0)
li	a4,1
sb	a4,8(a5)
lui	a5,%hi(_ZN6memoryL9heapStartE)
ld	a5,%lo(_ZN6memoryL9heapStartE)(a5)
bne	a5,zero,.L31
lui	a5,%hi(_ZN6memoryL9heapStartE)
ld	a4,-32(s0)
addi sp,sp,4
sd t0,0(sp)
mv t0,a5
addi t0,t0,%lo(_ZN6memoryL9heapStartE)
sd a4,0(t0)
ld t0,(sp)
addi sp,sp,-4
.L31:
#	.L31
lui	a5,%hi(_ZN6memoryL3topE)
ld	a5,%lo(_ZN6memoryL3topE)(a5)
beq	a5,zero,.L32
lui	a5,%hi(_ZN6memoryL3topE)
ld	a5,%lo(_ZN6memoryL3topE)(a5)
ld	a4,-32(s0)
sd	a4,16(a5)
.L32:
#	.L32
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
.L29:
#	.L29
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
_ZN4rstd6strlenEPKc:
#	rstd::strlen(char const*)
.LFB4555:
#	.LFB4555
addi	sp,sp,-48
sd	s0,40(sp)
addi	s0,sp,48
sd	a0,-40(s0)
sw	zero,-20(s0)
j	.L37
.L38:
#	.L38
lw	a5,-20(s0)
addiw	a5,a5,1
sw	a5,-20(s0)
ld	a5,-40(s0)
addi	a5,a5,1
sd	a5,-40(s0)
.L37:
#	.L37
ld	a5,-40(s0)
lbu	a5,0(a5)
bne	a5,zero,.L38
lw	a5,-20(s0)
mv	a0,a5
ld	s0,40(sp)
addi	sp,sp,48
jr	ra
.LFE4555:
#	.LFE4555
_ZN4rstd6stringC2Ev:
#	rstd::string::string()
.LFB4569:
#	.LFB4569
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
.LFE4569:
#	.LFE4569
_ZN4rstd6stringC2Emc:
#	rstd::string::string(unsigned long, char)
.LFB4572:
#	.LFB4572
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
bne	a5,zero,.L42
ld	a5,-56(s0)
sd	zero,16(a5)
j	.L41
.L42:
#	.L42
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
j	.L44
.L45:
#	.L45
ld	a5,-56(s0)
ld	a4,16(a5)
lw	a5,-36(s0)
add	a5,a4,a5
lbu	a4,-65(s0)
sb	a4,0(a5)
lw	a5,-36(s0)
addiw	a5,a5,1
sw	a5,-36(s0)
.L44:
#	.L44
lw	a4,-36(s0)
ld	a5,-56(s0)
ld	a5,0(a5)
bltu	a4,a5,.L45
.L41:
#	.L41
ld	ra,72(sp)
ld	s0,64(sp)
ld	s1,56(sp)
addi	sp,sp,80
jr	ra
.LFE4572:
#	.LFE4572
_ZN4rstd6stringC2EPKc:
#	rstd::string::string(char const*)
.LFB4575:
#	.LFB4575
addi	sp,sp,-64
sd	ra,56(sp)
sd	s0,48(sp)
sd	s1,40(sp)
addi	s0,sp,64
sd	a0,-56(s0)
sd	a1,-64(s0)
ld	a0,-64(s0)
call	_ZN4rstd6strlenEPKc
mv	a4,a0
ld	a5,-56(s0)
sd	a4,0(a5)
ld	a0,-64(s0)
call	_ZN4rstd6strlenEPKc
mv	a4,a0
ld	a5,-56(s0)
sd	a4,8(a5)
ld	a5,-56(s0)
sd	zero,16(a5)
ld	a5,-56(s0)
ld	a5,0(a5)
beq	a5,zero,.L51
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
j	.L49
.L50:
#	.L50
lw	a5,-36(s0)
ld	a4,-64(s0)
add	a4,a4,a5
ld	a5,-56(s0)
ld	a3,16(a5)
lw	a5,-36(s0)
add	a5,a3,a5
lbu	a4,0(a4)
sb	a4,0(a5)
lw	a5,-36(s0)
addiw	a5,a5,1
sw	a5,-36(s0)
.L49:
#	.L49
lw	a4,-36(s0)
ld	a5,-56(s0)
ld	a5,0(a5)
bltu	a4,a5,.L50
j	.L46
.L51:
#	.L51
nop
.L46:
#	.L46
ld	ra,56(sp)
ld	s0,48(sp)
ld	s1,40(sp)
addi	sp,sp,64
jr	ra
.LFE4575:
#	.LFE4575
_ZN4rstd6stringD2Ev:
#	rstd::string::~string()
.LFB4581:
#	.LFB4581
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
.LFE4581:
#	.LFE4581
_ZN4rstd6stringC2ERKS0_:
#	rstd::string::string(rstd::string const&)
.LFB4584:
#	.LFB4584
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
beq	a4,a5,.L59
ld	a5,-56(s0)
ld	a5,8(a5)
bne	a5,zero,.L56
ld	a5,-56(s0)
sd	zero,16(a5)
j	.L53
.L56:
#	.L56
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
j	.L57
.L58:
#	.L58
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
.L57:
#	.L57
lw	a4,-36(s0)
ld	a5,-56(s0)
ld	a5,0(a5)
bltu	a4,a5,.L58
j	.L53
.L59:
#	.L59
nop
.L53:
#	.L53
ld	ra,56(sp)
ld	s0,48(sp)
ld	s1,40(sp)
addi	sp,sp,64
jr	ra
.LFE4584:
#	.LFE4584
_ZN4rstd6stringaSERKS0_:
#	rstd::string::operator=(rstd::string const&)
.LFB4586:
#	.LFB4586
addi	sp,sp,-64
sd	ra,56(sp)
sd	s0,48(sp)
sd	s1,40(sp)
addi	s0,sp,64
sd	a0,-56(s0)
sd	a1,-64(s0)
ld	a4,-56(s0)
ld	a5,-64(s0)
bne	a4,a5,.L61
ld	a5,-56(s0)
j	.L62
.L61:
#	.L61
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
beq	a5,zero,.L63
ld	a5,-56(s0)
ld	a5,16(a5)
mv	a0,a5
call	_ZdaPv
.L63:
#	.L63
ld	a5,-56(s0)
ld	a5,0(a5)
beq	a5,zero,.L64
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
j	.L65
.L64:
#	.L64
li	a4,0
.L65:
#	.L65
ld	a5,-56(s0)
sd	a4,16(a5)
sw	zero,-36(s0)
j	.L66
.L67:
#	.L67
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
.L66:
#	.L66
lw	a4,-36(s0)
ld	a5,-56(s0)
ld	a5,0(a5)
bltu	a4,a5,.L67
ld	a5,-56(s0)
.L62:
#	.L62
mv	a0,a5
ld	ra,56(sp)
ld	s0,48(sp)
ld	s1,40(sp)
addi	sp,sp,64
jr	ra
.LFE4586:
#	.LFE4586
_ZNK4rstd6stringixEm:
#	rstd::string::operator[](unsigned long) const
.LFB4588:
#	.LFB4588
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
.LFE4588:
#	.LFE4588
_ZN4rstd6string5c_strEv:
#	rstd::string::c_str()
.LFB4598:
#	.LFB4598
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
.LFE4598:
#	.LFE4598
_ZNK4rstd6string4sizeEv:
#	rstd::string::size() const
.LFB4600:
#	.LFB4600
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
.LFE4600:
#	.LFE4600
_ZNK4rstd6string8capacityEv:
#	rstd::string::capacity() const
.LFB4602:
#	.LFB4602
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
.LFE4602:
#	.LFE4602
_ZN4rstd6string5clearEv:
#	rstd::string::clear()
.LFB4603:
#	.LFB4603
addi	sp,sp,-32
sd	ra,24(sp)
sd	s0,16(sp)
addi	s0,sp,32
sd	a0,-24(s0)
ld	a5,-24(s0)
ld	a5,16(a5)
beq	a5,zero,.L77
ld	a5,-24(s0)
ld	a5,16(a5)
beq	a5,zero,.L77
ld	a5,-24(s0)
ld	a5,16(a5)
mv	a0,a5
call	_ZdaPv
.L77:
#	.L77
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
.LFE4603:
#	.LFE4603
_ZN4rstd6string9push_backEc:
#	rstd::string::push_back(char)
.LFB4607:
#	.LFB4607
addi	sp,sp,-32
sd	ra,24(sp)
sd	s0,16(sp)
addi	s0,sp,32
sd	a0,-24(s0)
mv	a5,a1
sb	a5,-25(s0)
ld	a5,-24(s0)
ld	a5,8(a5)
bne	a5,zero,.L79
ld	a5,-24(s0)
ld	a5,16(a5)
beq	a5,zero,.L80
ld	a5,-24(s0)
ld	a5,16(a5)
mv	a0,a5
call	_ZdaPv
.L80:
#	.L80
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
j	.L78
.L79:
#	.L79
ld	a5,-24(s0)
ld	a4,0(a5)
ld	a5,-24(s0)
ld	a5,8(a5)
bne	a4,a5,.L82
ld	a5,-24(s0)
ld	a5,8(a5)
slli	a5,a5,1
mv	a1,a5
ld	a0,-24(s0)
call	_ZN4rstd6string7reserveEm
.L82:
#	.L82
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
.L78:
#	.L78
ld	ra,24(sp)
ld	s0,16(sp)
addi	sp,sp,32
jr	ra
.LFE4607:
#	.LFE4607
_ZN4rstd6string7reserveEm:
#	rstd::string::reserve(unsigned long)
.LFB4609:
#	.LFB4609
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
bleu	a4,a5,.L88
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
beq	a5,zero,.L86
ld	a5,-56(s0)
ld	a5,16(a5)
beq	a5,zero,.L87
ld	a5,-56(s0)
ld	a5,16(a5)
mv	a0,a5
call	_ZdaPv
.L87:
#	.L87
ld	a5,-56(s0)
sd	zero,16(a5)
.L86:
#	.L86
ld	a5,-56(s0)
ld	a4,-40(s0)
sd	a4,16(a5)
ld	a5,-56(s0)
ld	a4,-64(s0)
sd	a4,8(a5)
ld	a5,-56(s0)
ld	a5,8(a5)
ld	a4,-64(s0)
bgeu	a4,a5,.L83
ld	a5,-56(s0)
ld	a4,-64(s0)
sd	a4,0(a5)
j	.L83
.L88:
#	.L88
nop
.L83:
#	.L83
ld	ra,56(sp)
ld	s0,48(sp)
ld	s1,40(sp)
addi	sp,sp,64
jr	ra
.LFE4609:
#	.LFE4609
_ZeqRKN4rstd6stringES2_:
#	operator==(rstd::string const&, rstd::string const&)
.LFB4614:
#	.LFB4614
addi	sp,sp,-64
sd	ra,56(sp)
sd	s0,48(sp)
sd	s1,40(sp)
addi	s0,sp,64
sd	a0,-56(s0)
sd	a1,-64(s0)
ld	a0,-56(s0)
call	_ZNK4rstd6string4sizeEv
mv	s1,a0
ld	a0,-64(s0)
call	_ZNK4rstd6string4sizeEv
mv	a5,a0
sub	a5,s1,a5
snez	a5,a5
andi	a5,a5,0xff
beq	a5,zero,.L90
li	a5,0
j	.L91
.L90:
#	.L90
sw	zero,-36(s0)
j	.L92
.L94:
#	.L94
lw	a5,-36(s0)
mv	a1,a5
ld	a0,-56(s0)
call	_ZNK4rstd6stringixEm
mv	a5,a0
lbu	s1,0(a5)
lw	a5,-36(s0)
mv	a1,a5
ld	a0,-64(s0)
call	_ZNK4rstd6stringixEm
mv	a5,a0
lbu	a5,0(a5)
sext.w	a4,s1
sext.w	a5,a5
sub	a5,a4,a5
snez	a5,a5
andi	a5,a5,0xff
beq	a5,zero,.L93
li	a5,0
j	.L91
.L93:
#	.L93
lw	a5,-36(s0)
addiw	a5,a5,1
sw	a5,-36(s0)
.L92:
#	.L92
lw	s1,-36(s0)
ld	a0,-56(s0)
call	_ZNK4rstd6string4sizeEv
mv	a5,a0
sltu	a5,s1,a5
andi	a5,a5,0xff
bne	a5,zero,.L94
li	a5,1
.L91:
#	.L91
mv	a0,a5
ld	ra,56(sp)
ld	s0,48(sp)
ld	s1,40(sp)
addi	sp,sp,64
jr	ra
.LFE4614:
#	.LFE4614
.data
.align 2
_ZL4iota:
.space 4
.text
.globl	TOKEN_NAMES
#	TOKEN_NAMES
.data
.LC1:
#	.LC1
.string	"undefined"
.string	""
.LC2:
#	.LC2
.string	"eof"
.string	""
.LC3:
#	.LC3
.string	"newline"
.string	""
.LC4:
#	.LC4
.string	"space"
.string	""
.LC5:
#	.LC5
.string	"int_10"
.string	""
.LC6:
#	.LC6
.string	"float_10"
.string	""
.LC7:
#	.LC7
.string	"name"
.string	""
.LC8:
#	.LC8
.string	"and"
.string	""
.LC9:
#	.LC9
.string	"as"
.string	""
.LC10:
#	.LC10
.string	""
.string	""
.LC11:
#	.LC11
.string	"break"
.string	""
.LC12:
#	.LC12
.string	"continue"
.string	""
.LC13:
#	.LC13
.string	"dict"
.string	""
.LC14:
#	.LC14
.string	"def"
.string	""
.LC15:
#	.LC15
.string	"del"
.string	""
.LC16:
#	.LC16
.string	"exception"
.string	""
.LC17:
#	.LC17
.string	"except"
.string	""
.LC18:
#	.LC18
.string	"from"
.string	""
.LC19:
#	.LC19
.string	"for"
.string	""
.LC20:
#	.LC20
.string	"getattr"
.string	""
.LC21:
#	.LC21
.string	"import"
.string	""
.LC22:
#	.LC22
.string	"is"
.string	""
.LC23:
#	.LC23
.string	"in"
.string	""
.LC24:
#	.LC24
.string	"if"
.string	""
.LC25:
#	.LC25
.string	"list"
.string	""
.LC26:
#	.LC26
.string	"len"
.string	""
.LC27:
#	.LC27
.string	"or"
.string	""
.LC28:
#	.LC28
.string	"pass"
.string	""
.LC29:
#	.LC29
.string	"return"
.string	""
.LC30:
#	.LC30
.string	"setattr"
.string	""
.LC31:
#	.LC31
.string	"set"
.string	""
.LC32:
#	.LC32
.string	"yield"
.string	""
.LC33:
#	.LC33
.string	"plus"
.string	""
.LC34:
#	.LC34
.string	"minus"
.string	""
.LC35:
#	.LC35
.string	"mul"
.string	""
.LC36:
#	.LC36
.string	"div"
.string	""
.LC37:
#	.LC37
.string	"mod"
.string	""
.LC38:
#	.LC38
.string	"pow"
.string	""
.LC39:
#	.LC39
.string	"floordiv"
.string	""
.LC40:
#	.LC40
.string	"binvert"
.string	""
.LC41:
#	.LC41
.string	"band"
.string	""
.LC42:
#	.LC42
.string	"bor"
.string	""
.LC43:
#	.LC43
.string	"bxor"
.string	""
.LC44:
#	.LC44
.string	"blshift"
.string	""
.LC45:
#	.LC45
.string	"brshift"
.string	""
.LC46:
#	.LC46
.string	"eq"
.string	""
.LC47:
#	.LC47
.string	"ne"
.string	""
.LC48:
#	.LC48
.string	"lt"
.string	""
.LC49:
#	.LC49
.string	"gt"
.string	""
.LC50:
#	.LC50
.string	"le"
.string	""
.LC51:
#	.LC51
.string	"ge"
.string	""
.LC52:
#	.LC52
.string	"lor"
.string	""
.LC53:
#	.LC53
.string	"land"
.string	""
.LC54:
#	.LC54
.string	"lnot"
.string	""
.LC55:
#	.LC55
.string	"assign"
.string	""
.LC56:
#	.LC56
.string	"aug_plus"
.string	""
.LC57:
#	.LC57
.string	"aug_minus"
.string	""
.LC58:
#	.LC58
.string	"aug_mul"
.string	""
.LC59:
#	.LC59
.string	"aug_div"
.string	""
.LC60:
#	.LC60
.string	"aug_mod"
.string	""
.LC61:
#	.LC61
.string	"aug_pow"
.string	""
.LC62:
#	.LC62
.string	"aug_floordiv"
.string	""
.LC63:
#	.LC63
.string	"aug_band"
.string	""
.LC64:
#	.LC64
.string	"aug_bor"
.string	""
.LC65:
#	.LC65
.string	"aug_bxor"
.string	""
.LC66:
#	.LC66
.string	"aug_blshift"
.string	""
.LC67:
#	.LC67
.string	"aug_brshift"
.string	""
.LC68:
#	.LC68
.string	"aug_binvert"
.string	""
.LC69:
#	.LC69
.string	"comma"
.string	""
.LC70:
#	.LC70
.string	"dot"
.string	""
.LC71:
#	.LC71
.string	"colon"
.string	""
.LC72:
#	.LC72
.string	"semicolon"
.string	""
.LC73:
#	.LC73
.string	"lparen"
.string	""
.LC74:
#	.LC74
.string	"rparen"
.string	""
.LC75:
#	.LC75
.string	"lbracket"
.string	""
.LC76:
#	.LC76
.string	"rbracket"
.string	""
.LC77:
#	.LC77
.string	"lbrace"
.string	""
.LC78:
#	.LC78
.string	"rbrace"
.string	""
.LC79:
#	.LC79
.string	"double_quote"
.string	""
.LC80:
#	.LC80
.string	"single_quote"
.string	""
.LC81:
#	.LC81
.string	"string_content"
.string	""
.LC82:
#	.LC82
.string	"hashtag_comment"
.string	""
TOKEN_NAMES:
#	TOKEN_NAMES
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
.dword	.LC82
.text
_ZNK14parsed_token_t9to_stringEv:
#	parsed_token_t::to_string() const
.LFB4622:
#	.LFB4622
addi	sp,sp,-32
sd	ra,24(sp)
sd	s0,16(sp)
addi	s0,sp,32
sd	a0,-24(s0)
sd	a1,-32(s0)
ld	a5,-32(s0)
ld	a5,0(a5)
lui	a4,%hi(TOKEN_NAMES)
addi	a4,a4,%lo(TOKEN_NAMES)
slli	a5,a5,3
add	a5,a4,a5
ld	a5,0(a5)
mv	a1,a5
ld	a0,-24(s0)
call	_ZN4rstd6stringC2EPKc
li	a1,0
ld	a0,-24(s0)
call	_ZN4rstd6string9push_backEc
nop
ld	a0,-24(s0)
ld	ra,24(sp)
ld	s0,16(sp)
addi	sp,sp,32
jr	ra
.LFE4622:
#	.LFE4622
_ZN7lexer_t7advanceEv:
#	lexer_t::advance()
.LFB4623:
#	.LFB4623
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
beq	a5,zero,.L98
ld	a5,-24(s0)
sd	zero,56(a5)
ld	a5,-24(s0)
ld	a5,48(a5)
addi	a4,a5,1
ld	a5,-24(s0)
sd	a4,48(a5)
j	.L99
.L98:
#	.L98
ld	a5,-24(s0)
ld	a5,56(a5)
addi	a4,a5,1
ld	a5,-24(s0)
sd	a4,56(a5)
.L99:
#	.L99
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
.LFE4623:
#	.LFE4623
_ZN7lexer_tD2Ev:
#	lexer_t::~lexer_t()
.LFB4625:
#	.LFB4625
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
call	_ZN4rstd6stringD2Ev
nop
ld	ra,24(sp)
ld	s0,16(sp)
addi	sp,sp,32
jr	ra
.LFE4625:
#	.LFE4625
.data
.LC83:
#	.LC83
.string	"Error reading from descriptor\n"
.text
_ZN7lexer_tC2El:
#	lexer_t::lexer_t(long)
.LFB4628:
#	.LFB4628
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
call	_ZN4rstd6stringC2Ev
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
bge	a5,zero,.L102
lui	a5,%hi(.LC83)
addi	a0,a5,%lo(.LC83)
call	_ZN8rsyscall12print_stringEPKc
li	a0,0
call	_ZN8rsyscall4exitEl
.L102:
#	.L102
ld	a4,-24(s0)
li	a5,127
bgt	a4,a5,.L103
ld	a5,-40(s0)
li	a4,1
sb	a4,24(a5)
.L103:
#	.L103
ld	a4,-24(s0)
ld	a5,-40(s0)
sd	a4,32(a5)
nop
ld	ra,40(sp)
ld	s0,32(sp)
addi	sp,sp,48
jr	ra
.LFE4628:
#	.LFE4628
_ZN7lexer_t8get_charEv:
#	lexer_t::get_char()
.LFB4630:
#	.LFB4630
addi	sp,sp,-48
sd	ra,40(sp)
sd	s0,32(sp)
addi	s0,sp,48
sd	a0,-40(s0)
ld	a5,-40(s0)
ld	a4,16(a5)
ld	a5,-40(s0)
ld	a5,32(a5)
bne	a4,a5,.L105
ld	a5,-40(s0)
lbu	a5,24(a5)
beq	a5,zero,.L106
li	a5,0
j	.L107
.L106:
#	.L106
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
bge	a5,zero,.L108
lui	a5,%hi(.LC83)
addi	a0,a5,%lo(.LC83)
call	_ZN8rsyscall12print_stringEPKc
li	a0,0
call	_ZN8rsyscall4exitEl
.L108:
#	.L108
ld	a4,-24(s0)
li	a5,127
bgt	a4,a5,.L109
ld	a5,-40(s0)
li	a4,1
sb	a4,24(a5)
.L109:
#	.L109
ld	a4,-24(s0)
ld	a5,-40(s0)
sd	a4,32(a5)
ld	a5,-40(s0)
sd	zero,16(a5)
.L105:
#	.L105
ld	a5,-40(s0)
ld	a4,8(a5)
ld	a5,-40(s0)
ld	a5,16(a5)
add	a5,a4,a5
lbu	a5,0(a5)
.L107:
#	.L107
mv	a0,a5
ld	ra,40(sp)
ld	s0,32(sp)
addi	sp,sp,48
jr	ra
.LFE4630:
#	.LFE4630
_ZN7lexer_t12advance_charEv:
#	lexer_t::advance_char()
.LFB4631:
#	.LFB4631
addi	sp,sp,-48
sd	ra,40(sp)
sd	s0,32(sp)
addi	s0,sp,48
sd	a0,-40(s0)
ld	a5,-40(s0)
ld	a4,16(a5)
ld	a5,-40(s0)
ld	a5,32(a5)
bne	a4,a5,.L111
ld	a5,-40(s0)
lbu	a5,24(a5)
bne	a5,zero,.L118
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
bge	a5,zero,.L114
lui	a5,%hi(.LC83)
addi	a0,a5,%lo(.LC83)
call	_ZN8rsyscall12print_stringEPKc
li	a0,0
call	_ZN8rsyscall4exitEl
.L114:
#	.L114
ld	a4,-24(s0)
li	a5,127
bgt	a4,a5,.L115
ld	a5,-40(s0)
li	a4,1
sb	a4,24(a5)
.L115:
#	.L115
ld	a4,-24(s0)
ld	a5,-40(s0)
sd	a4,32(a5)
ld	a5,-40(s0)
sd	zero,16(a5)
.L111:
#	.L111
ld	a5,-40(s0)
ld	a4,8(a5)
ld	a5,-40(s0)
ld	a5,16(a5)
add	a5,a4,a5
lbu	a5,0(a5)
mv	a4,a5
li	a5,10
bne	a4,a5,.L116
ld	a5,-40(s0)
sd	zero,56(a5)
ld	a5,-40(s0)
ld	a5,48(a5)
addi	a4,a5,1
ld	a5,-40(s0)
sd	a4,48(a5)
j	.L117
.L116:
#	.L116
ld	a5,-40(s0)
ld	a5,56(a5)
addi	a4,a5,1
ld	a5,-40(s0)
sd	a4,56(a5)
.L117:
#	.L117
ld	a5,-40(s0)
ld	a5,16(a5)
addi	a4,a5,1
ld	a5,-40(s0)
sd	a4,16(a5)
j	.L110
.L118:
#	.L118
nop
.L110:
#	.L110
ld	ra,40(sp)
ld	s0,32(sp)
addi	sp,sp,48
jr	ra
.LFE4631:
#	.LFE4631
_ZN7lexer_t17can_continue_nameEc:
#	lexer_t::can_continue_name(char)
.LFB4633:
#	.LFB4633
addi	sp,sp,-32
sd	s0,24(sp)
addi	s0,sp,32
sd	a0,-24(s0)
mv	a5,a1
sb	a5,-25(s0)
lbu	a5,-25(s0)
andi	a4,a5,0xff
li	a5,96
bleu	a4,a5,.L120
lbu	a5,-25(s0)
andi	a4,a5,0xff
li	a5,122
bleu	a4,a5,.L121
.L120:
#	.L120
lbu	a5,-25(s0)
andi	a4,a5,0xff
li	a5,64
bleu	a4,a5,.L122
lbu	a5,-25(s0)
andi	a4,a5,0xff
li	a5,90
bleu	a4,a5,.L121
.L122:
#	.L122
lbu	a5,-25(s0)
andi	a4,a5,0xff
li	a5,47
bleu	a4,a5,.L123
lbu	a5,-25(s0)
andi	a4,a5,0xff
li	a5,57
bleu	a4,a5,.L121
.L123:
#	.L123
lbu	a5,-25(s0)
andi	a4,a5,0xff
li	a5,95
bne	a4,a5,.L124
.L121:
#	.L121
li	a5,1
j	.L125
.L124:
#	.L124
li	a5,0
.L125:
#	.L125
mv	a0,a5
ld	s0,24(sp)
addi	sp,sp,32
jr	ra
.LFE4633:
#	.LFE4633
_ZN7lexer_t11parse_exactEPKcm:
#	lexer_t::parse_exact(char const*, unsigned long)
.LFB4634:
#	.LFB4634
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
bltu	a4,a5,.L128
ld	a5,-88(s0)
j	.L129
.L128:
#	.L128
ld	a5,-72(s0)
ld	a5,40(a5)
sd	a5,-56(s0)
ld	a4,-80(s0)
ld	a5,-88(s0)
add	a5,a4,a5
sd	a5,-40(s0)
j	.L130
.L132:
#	.L132
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
beq	a5,zero,.L131
ld	a5,-72(s0)
ld	a4,40(a5)
ld	a5,-56(s0)
sub	a4,a4,a5
ld	a5,-88(s0)
add	a5,a4,a5
j	.L129
.L131:
#	.L131
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
.L130:
#	.L130
ld	a5,-40(s0)
lbu	a5,0(a5)
bne	a5,zero,.L132
ld	a5,-72(s0)
ld	a4,40(a5)
ld	a5,-56(s0)
sub	a4,a4,a5
ld	a5,-88(s0)
add	a5,a4,a5
.L129:
#	.L129
mv	a0,a5
ld	ra,88(sp)
ld	s0,80(sp)
ld	s1,72(sp)
addi	sp,sp,96
jr	ra
.LFE4634:
#	.LFE4634
_ZN7lexer_t10parse_wordEPKcm:
#	lexer_t::parse_word(char const*, unsigned long)
.LFB4635:
#	.LFB4635
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
bltu	a4,a5,.L134
ld	a5,-88(s0)
j	.L135
.L134:
#	.L134
ld	a5,-72(s0)
ld	a5,40(a5)
sd	a5,-56(s0)
ld	a4,-80(s0)
ld	a5,-88(s0)
add	a5,a4,a5
sd	a5,-40(s0)
j	.L136
.L138:
#	.L138
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
beq	a5,zero,.L137
ld	a5,-72(s0)
ld	a4,40(a5)
ld	a5,-56(s0)
sub	a4,a4,a5
ld	a5,-88(s0)
add	a5,a4,a5
j	.L135
.L137:
#	.L137
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
.L136:
#	.L136
ld	a5,-40(s0)
lbu	a5,0(a5)
bne	a5,zero,.L138
ld	a0,-72(s0)
call	_ZN7lexer_t8get_charEv
mv	a5,a0
sb	a5,-57(s0)
lbu	a5,-57(s0)
mv	a1,a5
ld	a0,-72(s0)
call	_ZN7lexer_t17can_continue_nameEc
mv	a5,a0
beq	a5,zero,.L139
ld	a5,-72(s0)
addi	a5,a5,64
lbu	a4,-57(s0)
mv	a1,a4
mv	a0,a5
call	_ZN4rstd6string9push_backEc
ld	a0,-72(s0)
call	_ZN7lexer_t7advanceEv
.L139:
#	.L139
ld	a5,-72(s0)
ld	a4,40(a5)
ld	a5,-56(s0)
sub	a4,a4,a5
ld	a5,-88(s0)
add	a5,a4,a5
.L135:
#	.L135
mv	a0,a5
ld	ra,88(sp)
ld	s0,80(sp)
ld	s1,72(sp)
addi	sp,sp,96
jr	ra
.LFE4635:
#	.LFE4635
_ZN7lexer_t7isdigitEc:
#	lexer_t::isdigit(char)
.LFB4636:
#	.LFB4636
addi	sp,sp,-32
sd	s0,24(sp)
addi	s0,sp,32
sd	a0,-24(s0)
mv	a5,a1
sb	a5,-25(s0)
lbu	a5,-25(s0)
andi	a4,a5,0xff
li	a5,47
bleu	a4,a5,.L141
lbu	a5,-25(s0)
andi	a4,a5,0xff
li	a5,57
bgtu	a4,a5,.L141
li	a5,1
j	.L142
.L141:
#	.L141
li	a5,0
.L142:
#	.L142
mv	a0,a5
ld	s0,24(sp)
addi	sp,sp,32
jr	ra
.LFE4636:
#	.LFE4636
_ZN14parsed_token_tD2Ev:
#	parsed_token_t::~parsed_token_t()
.LFB4639:
#	.LFB4639
addi	sp,sp,-32
sd	ra,24(sp)
sd	s0,16(sp)
addi	s0,sp,32
sd	a0,-24(s0)
ld	a5,-24(s0)
addi	a5,a5,40
mv	a0,a5
call	_ZN4rstd6stringD2Ev
nop
ld	ra,24(sp)
ld	s0,16(sp)
addi	sp,sp,32
jr	ra
.LFE4639:
#	.LFE4639
_ZN7lexer_t11parse_spaceEv:
#	lexer_t::parse_space()
.LFB4637:
#	.LFB4637
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
bne	a5,zero,.L146
ld	a5,-40(s0)
sd	zero,0(a5)
sd	zero,8(a5)
sd	zero,16(a5)
sd	zero,24(a5)
sd	zero,32(a5)
sd	zero,40(a5)
sd	zero,48(a5)
sd	zero,56(a5)
ld	a5,-40(s0)
li	a4,1
sd	a4,0(a5)
ld	a5,-40(s0)
addi	a5,a5,40
mv	a0,a5
call	_ZN4rstd6stringC2Ev
j	.L147
.L146:
#	.L146
ld	a0,-48(s0)
call	_ZN7lexer_t7advanceEv
lbu	a5,-17(s0)
andi	a4,a5,0xff
li	a5,32
bne	a4,a5,.L148
ld	a5,-40(s0)
sd	zero,0(a5)
sd	zero,8(a5)
sd	zero,16(a5)
sd	zero,24(a5)
sd	zero,32(a5)
sd	zero,40(a5)
sd	zero,48(a5)
sd	zero,56(a5)
ld	a5,-40(s0)
li	a4,3
sd	a4,0(a5)
ld	a5,-40(s0)
addi	a5,a5,40
mv	a0,a5
call	_ZN4rstd6stringC2Ev
j	.L147
.L148:
#	.L148
lbu	a5,-17(s0)
andi	a4,a5,0xff
li	a5,9
bne	a4,a5,.L149
ld	a5,-40(s0)
sd	zero,0(a5)
sd	zero,8(a5)
sd	zero,16(a5)
sd	zero,24(a5)
sd	zero,32(a5)
sd	zero,40(a5)
sd	zero,48(a5)
sd	zero,56(a5)
ld	a5,-40(s0)
li	a4,3
sd	a4,0(a5)
ld	a5,-40(s0)
addi	a5,a5,40
mv	a0,a5
call	_ZN4rstd6stringC2Ev
j	.L147
.L149:
#	.L149
lbu	a5,-17(s0)
andi	a4,a5,0xff
li	a5,10
bne	a4,a5,.L150
ld	a5,-40(s0)
sd	zero,0(a5)
sd	zero,8(a5)
sd	zero,16(a5)
sd	zero,24(a5)
sd	zero,32(a5)
sd	zero,40(a5)
sd	zero,48(a5)
sd	zero,56(a5)
ld	a5,-40(s0)
li	a4,2
sd	a4,0(a5)
ld	a5,-40(s0)
addi	a5,a5,40
mv	a0,a5
call	_ZN4rstd6stringC2Ev
j	.L147
.L150:
#	.L150
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
call	_ZN4rstd6stringC2Emc
.L147:
#	.L147
ld	a0,-40(s0)
ld	ra,40(sp)
ld	s0,32(sp)
addi	sp,sp,48
jr	ra
.LFE4637:
#	.LFE4637
_ZN14parsed_token_tC2EOS_:
#	parsed_token_t::parsed_token_t(parsed_token_t&&)
.LFB4643:
#	.LFB4643
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
call	_ZN4rstd6stringC2ERKS0_
nop
ld	ra,24(sp)
ld	s0,16(sp)
addi	sp,sp,32
jr	ra
.LFE4643:
#	.LFE4643
_ZN7lexer_t10parse_nameEmmmm:
#	lexer_t::parse_name(unsigned long, unsigned long, unsigned long, unsigned long)
.LFB4641:
#	.LFB4641
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
bne	a5,zero,.L153
ld	a5,-112(s0)
addi	a5,a5,64
mv	a0,a5
call	_ZN4rstd6string5clearEv
.L153:
#	.L153
ld	a0,-112(s0)
call	_ZN7lexer_t8get_charEv
mv	a5,a0
sb	a5,-17(s0)
j	.L154
.L155:
#	.L155
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
.L154:
#	.L154
lbu	a5,-17(s0)
mv	a1,a5
ld	a0,-112(s0)
call	_ZN7lexer_t17can_continue_nameEc
mv	a5,a0
bne	a5,zero,.L155
ld	a5,-112(s0)
ld	a4,40(a5)
ld	a5,-120(s0)
sub	a5,a4,a5
ld	a4,-144(s0)
add	a5,a4,a5
sd	a5,-144(s0)
ld	a5,-144(s0)
bne	a5,zero,.L156
ld	a5,-104(s0)
ld	a1,-112(s0)
mv	a0,a5
call	_ZN7lexer_t11parse_spaceEv
j	.L158
.L156:
#	.L156
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
call	_ZN4rstd6stringC2ERKS0_
ld	a5,-112(s0)
addi	a5,a5,64
mv	a0,a5
call	_ZN4rstd6string5clearEv
addi	a5,s0,-88
mv	a1,a5
ld	a0,-104(s0)
call	_ZN14parsed_token_tC2EOS_
addi	a5,s0,-88
mv	a0,a5
call	_ZN14parsed_token_tD2Ev
.L158:
#	.L158
ld	a0,-104(s0)
ld	ra,136(sp)
ld	s0,128(sp)
addi	sp,sp,144
jr	ra
.LFE4641:
#	.LFE4641
.data
.LC84:
#	.LC84
.string	"parsed int: "
.LC85:
#	.LC85
.string	"\n"
.LC86:
#	.LC86
.string	"parsed float: "
.text
_ZN7lexer_t12parse_numberEv:
#	lexer_t::parse_number()
.LFB4645:
#	.LFB4645
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
j	.L160
.L161:
#	.L161
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
.L160:
#	.L160
lbu	a5,-25(s0)
mv	a1,a5
ld	a0,-208(s0)
call	_ZN7lexer_t7isdigitEc
mv	a5,a0
bne	a5,zero,.L161
ld	a5,-24(s0)
bne	a5,zero,.L162
ld	a0,-200(s0)
ld	a5,-24(s0)
ld	a4,-48(s0)
ld	a3,-56(s0)
ld	a2,-40(s0)
ld	a1,-208(s0)
call	_ZN7lexer_t10parse_nameEmmmm
j	.L159
.L162:
#	.L162
lbu	a5,-25(s0)
andi	a5,a5,0xff
beq	a5,zero,.L164
lbu	a5,-25(s0)
andi	a4,a5,0xff
li	a5,46
beq	a4,a5,.L165
.L164:
#	.L164
lui	a5,%hi(.LC84)
addi	a0,a5,%lo(.LC84)
call	_ZN8rsyscall12print_stringEPKc
ld	a5,-208(s0)
addi	a5,a5,64
mv	a0,a5
call	_ZN4rstd6string5c_strEv
mv	a5,a0
mv	a0,a5
call	_ZN8rsyscall12print_stringEPKc
lui	a5,%hi(.LC85)
addi	a0,a5,%lo(.LC85)
call	_ZN8rsyscall12print_stringEPKc
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
call	_ZN4rstd6stringC2ERKS0_
ld	a5,-208(s0)
addi	a5,a5,64
mv	a0,a5
call	_ZN4rstd6string5clearEv
addi	a5,s0,-184
mv	a1,a5
ld	a0,-200(s0)
call	_ZN14parsed_token_tC2EOS_
addi	a5,s0,-184
mv	a0,a5
call	_ZN14parsed_token_tD2Ev
j	.L159
.L165:
#	.L165
ld	a5,-208(s0)
addi	a5,a5,64
lbu	a4,-25(s0)
mv	a1,a4
mv	a0,a5
call	_ZN4rstd6string9push_backEc
ld	a0,-208(s0)
call	_ZN7lexer_t7advanceEv
ld	a0,-208(s0)
call	_ZN7lexer_t8get_charEv
mv	a5,a0
sb	a5,-25(s0)
ld	a5,-24(s0)
addi	a5,a5,1
sd	a5,-24(s0)
j	.L166
.L167:
#	.L167
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
.L166:
#	.L166
lbu	a5,-25(s0)
mv	a1,a5
ld	a0,-208(s0)
call	_ZN7lexer_t7isdigitEc
mv	a5,a0
bne	a5,zero,.L167
lui	a5,%hi(.LC86)
addi	a0,a5,%lo(.LC86)
call	_ZN8rsyscall12print_stringEPKc
ld	a5,-208(s0)
addi	a5,a5,64
mv	a0,a5
call	_ZN4rstd6string5c_strEv
mv	a5,a0
mv	a0,a5
call	_ZN8rsyscall12print_stringEPKc
lui	a5,%hi(.LC85)
addi	a0,a5,%lo(.LC85)
call	_ZN8rsyscall12print_stringEPKc
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
call	_ZN4rstd6stringC2ERKS0_
ld	a5,-208(s0)
addi	a5,a5,64
mv	a0,a5
call	_ZN4rstd6string5clearEv
addi	a5,s0,-120
mv	a1,a5
ld	a0,-200(s0)
call	_ZN14parsed_token_tC2EOS_
addi	a5,s0,-120
mv	a0,a5
call	_ZN14parsed_token_tD2Ev
.L159:
#	.L159
ld	a0,-200(s0)
ld	ra,200(sp)
ld	s0,192(sp)
addi	sp,sp,208
jr	ra
.LFE4645:
#	.LFE4645
_ZN7lexer_t13parse_commentEv:
#	lexer_t::parse_comment()
.LFB4646:
#	.LFB4646
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
bne	a5,zero,.L170
ld	a5,-56(s0)
sd	zero,0(a5)
sd	zero,8(a5)
sd	zero,16(a5)
sd	zero,24(a5)
sd	zero,32(a5)
sd	zero,40(a5)
sd	zero,48(a5)
sd	zero,56(a5)
ld	a5,-56(s0)
li	a4,1
sd	a4,0(a5)
ld	a5,-56(s0)
addi	a5,a5,40
mv	a0,a5
call	_ZN4rstd6stringC2Ev
j	.L171
.L170:
#	.L170
lbu	a5,-41(s0)
andi	a4,a5,0xff
li	a5,35
bne	a4,a5,.L172
j	.L173
.L175:
#	.L175
ld	a5,-64(s0)
addi	a5,a5,64
lbu	a4,-41(s0)
mv	a1,a4
mv	a0,a5
call	_ZN4rstd6string9push_backEc
ld	a0,-64(s0)
call	_ZN7lexer_t7advanceEv
.L173:
#	.L173
lbu	a5,-41(s0)
andi	a4,a5,0xff
li	a5,10
beq	a4,a5,.L174
lbu	a5,-41(s0)
andi	a5,a5,0xff
bne	a5,zero,.L175
.L174:
#	.L174
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
call	_ZN4rstd6stringC2ERKS0_
j	.L171
.L172:
#	.L172
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
call	_ZN4rstd6stringC2Ev
.L171:
#	.L171
ld	a0,-56(s0)
ld	ra,56(sp)
ld	s0,48(sp)
addi	sp,sp,64
jr	ra
.LFE4646:
#	.LFE4646
_ZN7lexer_t21parse_string_unescapeEv:
#	lexer_t::parse_string_unescape()
.LFB4647:
#	.LFB4647
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
j	.L177
.L188:
#	.L188
lbu	a5,-17(s0)
andi	a5,a5,0xff
bne	a5,zero,.L178
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
call	_ZN4rstd6stringC2ERKS0_
j	.L179
.L178:
#	.L178
lbu	a5,-17(s0)
andi	a4,a5,0xff
li	a5,92
bne	a4,a5,.L180
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
beq	a3,a4,.L181
mv	a3,a5
li	a4,116
bgt	a3,a4,.L182
mv	a3,a5
li	a4,114
beq	a3,a4,.L183
mv	a3,a5
li	a4,114
bgt	a3,a4,.L182
mv	a3,a5
li	a4,48
beq	a3,a4,.L184
mv	a4,a5
li	a5,110
bne	a4,a5,.L182
ld	a5,-112(s0)
addi	a5,a5,64
li	a1,10
mv	a0,a5
call	_ZN4rstd6string9push_backEc
j	.L186
.L181:
#	.L181
ld	a5,-112(s0)
addi	a5,a5,64
li	a1,9
mv	a0,a5
call	_ZN4rstd6string9push_backEc
j	.L186
.L183:
#	.L183
ld	a5,-112(s0)
addi	a5,a5,64
li	a1,13
mv	a0,a5
call	_ZN4rstd6string9push_backEc
j	.L186
.L184:
#	.L184
ld	a5,-112(s0)
addi	a5,a5,64
li	a1,0
mv	a0,a5
call	_ZN4rstd6string9push_backEc
j	.L186
.L182:
#	.L182
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
call	_ZN4rstd6stringC2ERKS0_
j	.L179
.L180:
#	.L180
lbu	a5,-17(s0)
andi	a4,a5,0xff
li	a5,10
bne	a4,a5,.L187
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
call	_ZN4rstd6stringC2ERKS0_
j	.L179
.L187:
#	.L187
ld	a5,-112(s0)
addi	a5,a5,64
lbu	a4,-17(s0)
mv	a1,a4
mv	a0,a5
call	_ZN4rstd6string9push_backEc
.L186:
#	.L186
ld	a0,-112(s0)
call	_ZN7lexer_t7advanceEv
ld	a0,-112(s0)
call	_ZN7lexer_t8get_charEv
mv	a5,a0
sb	a5,-17(s0)
.L177:
#	.L177
lbu	a5,-17(s0)
mv	a4,a5
lbu	a5,-49(s0)
andi	a4,a4,0xff
andi	a5,a5,0xff
bne	a4,a5,.L188
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
call	_ZN4rstd6stringC2ERKS0_
.L179:
#	.L179
ld	a0,-104(s0)
ld	ra,104(sp)
ld	s0,96(sp)
addi	sp,sp,112
jr	ra
.LFE4647:
#	.LFE4647
.data
.LC87:
#	.LC87
.string	">>="
.LC88:
#	.LC88
.string	">="
.LC89:
#	.LC89
.string	"<<="
.LC90:
#	.LC90
.string	"<="
.LC91:
#	.LC91
.string	"=="
.LC92:
#	.LC92
.string	"="
.LC93:
#	.LC93
.string	"!="
.LC94:
#	.LC94
.string	"+="
.LC95:
#	.LC95
.string	"-="
.LC96:
#	.LC96
.string	"**="
.LC97:
#	.LC97
.string	"*="
.LC98:
#	.LC98
.string	"//="
.LC99:
#	.LC99
.string	"/="
.LC100:
#	.LC100
.string	"%="
.LC101:
#	.LC101
.string	"|="
.LC102:
#	.LC102
.string	"&="
.LC103:
#	.LC103
.string	"^="
.LC104:
#	.LC104
.string	"~="
.text
_ZN7lexer_t14parse_non_nameEv:
#	lexer_t::parse_non_name()
.LFB4648:
#	.LFB4648
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
bne	a5,zero,.L190
ld	a5,-72(s0)
sd	zero,0(a5)
sd	zero,8(a5)
sd	zero,16(a5)
sd	zero,24(a5)
sd	zero,32(a5)
sd	zero,40(a5)
sd	zero,48(a5)
sd	zero,56(a5)
ld	a5,-72(s0)
li	a4,1
sd	a4,0(a5)
ld	a5,-72(s0)
addi	a5,a5,40
mv	a0,a5
call	_ZN4rstd6stringC2Ev
j	.L191
.L190:
#	.L190
li	a2,0
lui	a5,%hi(.LC87)
addi	a1,a5,%lo(.LC87)
ld	a0,-80(s0)
call	_ZN7lexer_t11parse_exactEPKcm
sd	a0,-64(s0)
ld	a4,-64(s0)
li	a5,3
bne	a4,a5,.L192
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
call	_ZN4rstd6stringC2Ev
j	.L191
.L192:
#	.L192
ld	a4,-64(s0)
li	a5,2
bne	a4,a5,.L193
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
call	_ZN4rstd6stringC2Ev
j	.L191
.L193:
#	.L193
ld	a4,-64(s0)
li	a5,1
bne	a4,a5,.L194
ld	a2,-64(s0)
lui	a5,%hi(.LC88)
addi	a1,a5,%lo(.LC88)
ld	a0,-80(s0)
call	_ZN7lexer_t11parse_exactEPKcm
sd	a0,-64(s0)
ld	a4,-64(s0)
li	a5,2
bne	a4,a5,.L195
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
call	_ZN4rstd6stringC2Ev
j	.L191
.L195:
#	.L195
ld	a4,-64(s0)
li	a5,1
bne	a4,a5,.L194
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
call	_ZN4rstd6stringC2Ev
j	.L191
.L194:
#	.L194
li	a2,0
lui	a5,%hi(.LC89)
addi	a1,a5,%lo(.LC89)
ld	a0,-80(s0)
call	_ZN7lexer_t11parse_exactEPKcm
sd	a0,-64(s0)
ld	a4,-64(s0)
li	a5,3
bne	a4,a5,.L196
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
call	_ZN4rstd6stringC2Ev
j	.L191
.L196:
#	.L196
ld	a4,-64(s0)
li	a5,2
bne	a4,a5,.L197
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
call	_ZN4rstd6stringC2Ev
j	.L191
.L197:
#	.L197
ld	a4,-64(s0)
li	a5,1
bne	a4,a5,.L198
ld	a2,-64(s0)
lui	a5,%hi(.LC90)
addi	a1,a5,%lo(.LC90)
ld	a0,-80(s0)
call	_ZN7lexer_t11parse_exactEPKcm
sd	a0,-64(s0)
ld	a4,-64(s0)
li	a5,2
bne	a4,a5,.L199
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
call	_ZN4rstd6stringC2Ev
j	.L191
.L199:
#	.L199
ld	a4,-64(s0)
li	a5,1
bne	a4,a5,.L198
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
call	_ZN4rstd6stringC2Ev
j	.L191
.L198:
#	.L198
li	a2,0
lui	a5,%hi(.LC91)
addi	a1,a5,%lo(.LC91)
ld	a0,-80(s0)
call	_ZN7lexer_t11parse_exactEPKcm
sd	a0,-64(s0)
ld	a4,-64(s0)
li	a5,2
bne	a4,a5,.L200
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
call	_ZN4rstd6stringC2Ev
j	.L191
.L200:
#	.L200
ld	a4,-64(s0)
li	a5,1
bne	a4,a5,.L201
ld	a2,-64(s0)
lui	a5,%hi(.LC92)
addi	a1,a5,%lo(.LC92)
ld	a0,-80(s0)
call	_ZN7lexer_t11parse_exactEPKcm
sd	a0,-64(s0)
ld	a4,-64(s0)
li	a5,1
bne	a4,a5,.L201
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
call	_ZN4rstd6stringC2Ev
j	.L191
.L201:
#	.L201
li	a2,0
lui	a5,%hi(.LC93)
addi	a1,a5,%lo(.LC93)
ld	a0,-80(s0)
call	_ZN7lexer_t11parse_exactEPKcm
sd	a0,-64(s0)
ld	a4,-64(s0)
li	a5,2
bne	a4,a5,.L202
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
call	_ZN4rstd6stringC2Ev
j	.L191
.L202:
#	.L202
ld	a4,-64(s0)
li	a5,1
bne	a4,a5,.L203
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
call	_ZN4rstd6stringC2ERKS0_
j	.L191
.L203:
#	.L203
li	a2,0
lui	a5,%hi(.LC94)
addi	a1,a5,%lo(.LC94)
ld	a0,-80(s0)
call	_ZN7lexer_t11parse_exactEPKcm
sd	a0,-64(s0)
ld	a4,-64(s0)
li	a5,2
bne	a4,a5,.L204
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
call	_ZN4rstd6stringC2Ev
j	.L191
.L204:
#	.L204
ld	a4,-64(s0)
li	a5,1
bne	a4,a5,.L205
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
call	_ZN4rstd6stringC2Ev
j	.L191
.L205:
#	.L205
li	a2,0
lui	a5,%hi(.LC95)
addi	a1,a5,%lo(.LC95)
ld	a0,-80(s0)
call	_ZN7lexer_t11parse_exactEPKcm
sd	a0,-64(s0)
ld	a4,-64(s0)
li	a5,2
bne	a4,a5,.L206
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
call	_ZN4rstd6stringC2Ev
j	.L191
.L206:
#	.L206
ld	a4,-64(s0)
li	a5,1
bne	a4,a5,.L207
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
call	_ZN4rstd6stringC2Ev
j	.L191
.L207:
#	.L207
li	a2,0
lui	a5,%hi(.LC96)
addi	a1,a5,%lo(.LC96)
ld	a0,-80(s0)
call	_ZN7lexer_t11parse_exactEPKcm
sd	a0,-64(s0)
ld	a4,-64(s0)
li	a5,3
bne	a4,a5,.L208
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
call	_ZN4rstd6stringC2Ev
j	.L191
.L208:
#	.L208
ld	a4,-64(s0)
li	a5,2
bne	a4,a5,.L209
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
call	_ZN4rstd6stringC2Ev
j	.L191
.L209:
#	.L209
ld	a4,-64(s0)
li	a5,1
bne	a4,a5,.L210
ld	a2,-64(s0)
lui	a5,%hi(.LC97)
addi	a1,a5,%lo(.LC97)
ld	a0,-80(s0)
call	_ZN7lexer_t11parse_exactEPKcm
sd	a0,-64(s0)
ld	a4,-64(s0)
li	a5,2
bne	a4,a5,.L211
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
call	_ZN4rstd6stringC2Ev
j	.L191
.L211:
#	.L211
ld	a4,-64(s0)
li	a5,1
bne	a4,a5,.L210
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
call	_ZN4rstd6stringC2Ev
j	.L191
.L210:
#	.L210
li	a2,0
lui	a5,%hi(.LC98)
addi	a1,a5,%lo(.LC98)
ld	a0,-80(s0)
call	_ZN7lexer_t11parse_exactEPKcm
sd	a0,-64(s0)
ld	a4,-64(s0)
li	a5,3
bne	a4,a5,.L212
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
call	_ZN4rstd6stringC2Ev
j	.L191
.L212:
#	.L212
ld	a4,-64(s0)
li	a5,2
bne	a4,a5,.L213
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
call	_ZN4rstd6stringC2Ev
j	.L191
.L213:
#	.L213
ld	a4,-64(s0)
li	a5,1
bne	a4,a5,.L214
ld	a2,-64(s0)
lui	a5,%hi(.LC99)
addi	a1,a5,%lo(.LC99)
ld	a0,-80(s0)
call	_ZN7lexer_t11parse_exactEPKcm
sd	a0,-64(s0)
ld	a4,-64(s0)
li	a5,2
bne	a4,a5,.L215
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
call	_ZN4rstd6stringC2Ev
j	.L191
.L215:
#	.L215
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
call	_ZN4rstd6stringC2Ev
j	.L191
.L214:
#	.L214
li	a2,0
lui	a5,%hi(.LC100)
addi	a1,a5,%lo(.LC100)
ld	a0,-80(s0)
call	_ZN7lexer_t11parse_exactEPKcm
sd	a0,-64(s0)
ld	a4,-64(s0)
li	a5,2
bne	a4,a5,.L216
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
call	_ZN4rstd6stringC2Ev
j	.L191
.L216:
#	.L216
ld	a4,-64(s0)
li	a5,1
bne	a4,a5,.L217
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
call	_ZN4rstd6stringC2Ev
j	.L191
.L217:
#	.L217
li	a2,0
lui	a5,%hi(.LC101)
addi	a1,a5,%lo(.LC101)
ld	a0,-80(s0)
call	_ZN7lexer_t11parse_exactEPKcm
sd	a0,-64(s0)
ld	a4,-64(s0)
li	a5,2
bne	a4,a5,.L218
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
call	_ZN4rstd6stringC2Ev
j	.L191
.L218:
#	.L218
ld	a4,-64(s0)
li	a5,1
bne	a4,a5,.L219
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
call	_ZN4rstd6stringC2Ev
j	.L191
.L219:
#	.L219
li	a2,0
lui	a5,%hi(.LC102)
addi	a1,a5,%lo(.LC102)
ld	a0,-80(s0)
call	_ZN7lexer_t11parse_exactEPKcm
sd	a0,-64(s0)
ld	a4,-64(s0)
li	a5,2
bne	a4,a5,.L220
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
call	_ZN4rstd6stringC2Ev
j	.L191
.L220:
#	.L220
ld	a4,-64(s0)
li	a5,1
bne	a4,a5,.L221
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
call	_ZN4rstd6stringC2Ev
j	.L191
.L221:
#	.L221
li	a2,0
lui	a5,%hi(.LC103)
addi	a1,a5,%lo(.LC103)
ld	a0,-80(s0)
call	_ZN7lexer_t11parse_exactEPKcm
sd	a0,-64(s0)
ld	a4,-64(s0)
li	a5,2
bne	a4,a5,.L222
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
call	_ZN4rstd6stringC2Ev
j	.L191
.L222:
#	.L222
ld	a4,-64(s0)
li	a5,1
bne	a4,a5,.L223
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
call	_ZN4rstd6stringC2Ev
j	.L191
.L223:
#	.L223
li	a2,0
lui	a5,%hi(.LC104)
addi	a1,a5,%lo(.LC104)
ld	a0,-80(s0)
call	_ZN7lexer_t11parse_exactEPKcm
sd	a0,-64(s0)
ld	a4,-64(s0)
li	a5,2
bne	a4,a5,.L224
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
call	_ZN4rstd6stringC2Ev
j	.L191
.L224:
#	.L224
ld	a4,-64(s0)
li	a5,1
bne	a4,a5,.L225
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
call	_ZN4rstd6stringC2Ev
j	.L191
.L225:
#	.L225
sd	zero,-24(s0)
lbu	a5,-49(s0)
sext.w	a5,a5
addiw	a3,a5,-34
sext.w	a4,a3
li	a5,91
bgtu	a4,a5,.L226
slli	a5,a3,32
srli	a5,a5,32
slli	a4,a5,2
lui	a5,%hi(.L228)
addi	a5,a5,%lo(.L228)
add	a5,a4,a5
lw	a5,0(a5)
jr	a5
.data
.L228:
#	.L228
.word	.L240
.word	.L239
.word	.L226
.word	.L226
.word	.L226
.word	.L238
.word	.L237
.word	.L236
.word	.L226
.word	.L226
.word	.L235
.word	.L226
.word	.L234
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L233
.word	.L232
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L231
.word	.L226
.word	.L230
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L226
.word	.L229
.word	.L226
.word	.L227
.text
.L235:
#	.L235
li	a5,68
sd	a5,-24(s0)
j	.L241
.L234:
#	.L234
li	a5,69
sd	a5,-24(s0)
j	.L241
.L233:
#	.L233
li	a5,70
sd	a5,-24(s0)
j	.L241
.L232:
#	.L232
li	a5,71
sd	a5,-24(s0)
j	.L241
.L237:
#	.L237
li	a5,72
sd	a5,-24(s0)
j	.L241
.L236:
#	.L236
li	a5,73
sd	a5,-24(s0)
j	.L241
.L231:
#	.L231
li	a5,74
sd	a5,-24(s0)
j	.L241
.L230:
#	.L230
li	a5,75
sd	a5,-24(s0)
j	.L241
.L229:
#	.L229
li	a5,76
sd	a5,-24(s0)
j	.L241
.L227:
#	.L227
li	a5,77
sd	a5,-24(s0)
j	.L241
.L240:
#	.L240
li	a5,78
sd	a5,-24(s0)
j	.L241
.L238:
#	.L238
li	a5,79
sd	a5,-24(s0)
j	.L241
.L239:
#	.L239
li	a5,81
sd	a5,-24(s0)
j	.L241
.L226:
#	.L226
sd	zero,-24(s0)
nop
.L241:
#	.L241
ld	a4,-24(s0)
li	a5,81
bne	a4,a5,.L242
ld	a5,-72(s0)
ld	a1,-80(s0)
mv	a0,a5
call	_ZN7lexer_t13parse_commentEv
j	.L191
.L242:
#	.L242
ld	a4,-24(s0)
li	a5,78
beq	a4,a5,.L243
ld	a4,-24(s0)
li	a5,79
bne	a4,a5,.L244
.L243:
#	.L243
ld	a5,-72(s0)
ld	a1,-80(s0)
mv	a0,a5
call	_ZN7lexer_t21parse_string_unescapeEv
j	.L191
.L244:
#	.L244
ld	a5,-24(s0)
beq	a5,zero,.L245
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
call	_ZN4rstd6stringC2Ev
j	.L191
.L245:
#	.L245
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
call	_ZN4rstd6stringC2Ev
.L191:
#	.L191
ld	a0,-72(s0)
ld	ra,72(sp)
ld	s0,64(sp)
addi	sp,sp,80
jr	ra
.LFE4648:
#	.LFE4648
.data
.LC105:
#	.LC105
.string	"and"
.LC106:
#	.LC106
.string	"as"
.LC107:
#	.LC107
.string	"break"
.LC108:
#	.LC108
.string	"bool"
.LC109:
#	.LC109
.string	"continue"
.LC110:
#	.LC110
.string	"dict"
.LC111:
#	.LC111
.string	"def"
.LC112:
#	.LC112
.string	"del"
.LC113:
#	.LC113
.string	"exception"
.LC114:
#	.LC114
.string	"except"
.LC115:
#	.LC115
.string	"from"
.LC116:
#	.LC116
.string	"for"
.LC117:
#	.LC117
.string	"getattr"
.LC118:
#	.LC118
.string	"import"
.LC119:
#	.LC119
.string	"is"
.LC120:
#	.LC120
.string	"in"
.LC121:
#	.LC121
.string	"if"
.LC122:
#	.LC122
.string	"list"
.LC123:
#	.LC123
.string	"len"
.LC124:
#	.LC124
.string	"or"
.LC125:
#	.LC125
.string	"return"
.LC126:
#	.LC126
.string	"setattr"
.LC127:
#	.LC127
.string	"set"
.LC128:
#	.LC128
.string	"yield"
.text
_ZN7lexer_t8next_tokEv:
#	lexer_t::next_tok()
.LFB4649:
#	.LFB4649
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
bne	a5,zero,.L247
ld	a5,-72(s0)
sd	zero,0(a5)
sd	zero,8(a5)
sd	zero,16(a5)
sd	zero,24(a5)
sd	zero,32(a5)
sd	zero,40(a5)
sd	zero,48(a5)
sd	zero,56(a5)
ld	a5,-72(s0)
li	a4,1
sd	a4,0(a5)
ld	a5,-72(s0)
addi	a5,a5,40
mv	a0,a5
call	_ZN4rstd6stringC2Ev
j	.L248
.L247:
#	.L247
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
lui	a5,%hi(.LC105)
addi	a1,a5,%lo(.LC105)
ld	a0,-80(s0)
call	_ZN7lexer_t10parse_wordEPKcm
sd	a0,-56(s0)
ld	a4,-56(s0)
li	a5,3
bleu	a4,a5,.L249
ld	a0,-72(s0)
ld	a5,-56(s0)
ld	a4,-40(s0)
ld	a3,-48(s0)
ld	a2,-32(s0)
ld	a1,-80(s0)
call	_ZN7lexer_t10parse_nameEmmmm
j	.L248
.L249:
#	.L249
ld	a4,-56(s0)
li	a5,3
bne	a4,a5,.L250
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
call	_ZN4rstd6stringC2Ev
j	.L248
.L250:
#	.L250
ld	a4,-56(s0)
li	a5,1
bne	a4,a5,.L251
ld	a2,-56(s0)
lui	a5,%hi(.LC106)
addi	a1,a5,%lo(.LC106)
ld	a0,-80(s0)
call	_ZN7lexer_t10parse_wordEPKcm
sd	a0,-56(s0)
ld	a4,-56(s0)
li	a5,2
bne	a4,a5,.L252
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
call	_ZN4rstd6stringC2Ev
j	.L248
.L252:
#	.L252
ld	a0,-72(s0)
ld	a5,-56(s0)
ld	a4,-40(s0)
ld	a3,-48(s0)
ld	a2,-32(s0)
ld	a1,-80(s0)
call	_ZN7lexer_t10parse_nameEmmmm
j	.L248
.L251:
#	.L251
ld	a5,-56(s0)
beq	a5,zero,.L253
ld	a0,-72(s0)
ld	a5,-56(s0)
ld	a4,-40(s0)
ld	a3,-48(s0)
ld	a2,-32(s0)
ld	a1,-80(s0)
call	_ZN7lexer_t10parse_nameEmmmm
j	.L248
.L253:
#	.L253
li	a2,0
lui	a5,%hi(.LC107)
addi	a1,a5,%lo(.LC107)
ld	a0,-80(s0)
call	_ZN7lexer_t10parse_wordEPKcm
sd	a0,-56(s0)
ld	a4,-56(s0)
li	a5,5
bleu	a4,a5,.L254
ld	a0,-72(s0)
ld	a5,-56(s0)
ld	a4,-40(s0)
ld	a3,-48(s0)
ld	a2,-32(s0)
ld	a1,-80(s0)
call	_ZN7lexer_t10parse_nameEmmmm
j	.L248
.L254:
#	.L254
ld	a4,-56(s0)
li	a5,5
bne	a4,a5,.L255
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
call	_ZN4rstd6stringC2Ev
j	.L248
.L255:
#	.L255
ld	a4,-56(s0)
li	a5,1
bne	a4,a5,.L256
ld	a2,-56(s0)
lui	a5,%hi(.LC108)
addi	a1,a5,%lo(.LC108)
ld	a0,-80(s0)
call	_ZN7lexer_t10parse_wordEPKcm
sd	a0,-56(s0)
ld	a4,-56(s0)
li	a5,4
bne	a4,a5,.L257
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
call	_ZN4rstd6stringC2Ev
j	.L248
.L257:
#	.L257
ld	a0,-72(s0)
ld	a5,-56(s0)
ld	a4,-40(s0)
ld	a3,-48(s0)
ld	a2,-32(s0)
ld	a1,-80(s0)
call	_ZN7lexer_t10parse_nameEmmmm
j	.L248
.L256:
#	.L256
ld	a5,-56(s0)
beq	a5,zero,.L258
ld	a0,-72(s0)
ld	a5,-56(s0)
ld	a4,-40(s0)
ld	a3,-48(s0)
ld	a2,-32(s0)
ld	a1,-80(s0)
call	_ZN7lexer_t10parse_nameEmmmm
j	.L248
.L258:
#	.L258
li	a2,0
lui	a5,%hi(.LC109)
addi	a1,a5,%lo(.LC109)
ld	a0,-80(s0)
call	_ZN7lexer_t10parse_wordEPKcm
sd	a0,-56(s0)
ld	a4,-56(s0)
li	a5,8
bleu	a4,a5,.L259
ld	a0,-72(s0)
ld	a5,-56(s0)
ld	a4,-40(s0)
ld	a3,-48(s0)
ld	a2,-32(s0)
ld	a1,-80(s0)
call	_ZN7lexer_t10parse_nameEmmmm
j	.L248
.L259:
#	.L259
ld	a4,-56(s0)
li	a5,8
bne	a4,a5,.L260
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
call	_ZN4rstd6stringC2Ev
j	.L248
.L260:
#	.L260
ld	a5,-56(s0)
beq	a5,zero,.L261
ld	a0,-72(s0)
ld	a5,-56(s0)
ld	a4,-40(s0)
ld	a3,-48(s0)
ld	a2,-32(s0)
ld	a1,-80(s0)
call	_ZN7lexer_t10parse_nameEmmmm
j	.L248
.L261:
#	.L261
li	a2,0
lui	a5,%hi(.LC110)
addi	a1,a5,%lo(.LC110)
ld	a0,-80(s0)
call	_ZN7lexer_t10parse_wordEPKcm
sd	a0,-56(s0)
ld	a4,-56(s0)
li	a5,4
bleu	a4,a5,.L262
ld	a0,-72(s0)
ld	a5,-56(s0)
ld	a4,-40(s0)
ld	a3,-48(s0)
ld	a2,-32(s0)
ld	a1,-80(s0)
call	_ZN7lexer_t10parse_nameEmmmm
j	.L248
.L262:
#	.L262
ld	a4,-56(s0)
li	a5,4
bne	a4,a5,.L263
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
call	_ZN4rstd6stringC2Ev
j	.L248
.L263:
#	.L263
ld	a4,-56(s0)
li	a5,1
bne	a4,a5,.L264
ld	a2,-56(s0)
lui	a5,%hi(.LC111)
addi	a1,a5,%lo(.LC111)
ld	a0,-80(s0)
call	_ZN7lexer_t10parse_wordEPKcm
sd	a0,-56(s0)
ld	a4,-56(s0)
li	a5,3
bleu	a4,a5,.L265
ld	a0,-72(s0)
ld	a5,-56(s0)
ld	a4,-40(s0)
ld	a3,-48(s0)
ld	a2,-32(s0)
ld	a1,-80(s0)
call	_ZN7lexer_t10parse_nameEmmmm
j	.L248
.L265:
#	.L265
ld	a4,-56(s0)
li	a5,3
bne	a4,a5,.L266
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
call	_ZN4rstd6stringC2Ev
j	.L248
.L266:
#	.L266
ld	a4,-56(s0)
li	a5,2
bne	a4,a5,.L267
ld	a2,-56(s0)
lui	a5,%hi(.LC112)
addi	a1,a5,%lo(.LC112)
ld	a0,-80(s0)
call	_ZN7lexer_t10parse_wordEPKcm
sd	a0,-56(s0)
ld	a4,-56(s0)
li	a5,3
bne	a4,a5,.L268
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
call	_ZN4rstd6stringC2Ev
j	.L248
.L268:
#	.L268
ld	a0,-72(s0)
ld	a5,-56(s0)
ld	a4,-40(s0)
ld	a3,-48(s0)
ld	a2,-32(s0)
ld	a1,-80(s0)
call	_ZN7lexer_t10parse_nameEmmmm
j	.L248
.L267:
#	.L267
ld	a5,-56(s0)
beq	a5,zero,.L269
ld	a0,-72(s0)
ld	a5,-56(s0)
ld	a4,-40(s0)
ld	a3,-48(s0)
ld	a2,-32(s0)
ld	a1,-80(s0)
call	_ZN7lexer_t10parse_nameEmmmm
j	.L248
.L264:
#	.L264
ld	a5,-56(s0)
beq	a5,zero,.L269
ld	a0,-72(s0)
ld	a5,-56(s0)
ld	a4,-40(s0)
ld	a3,-48(s0)
ld	a2,-32(s0)
ld	a1,-80(s0)
call	_ZN7lexer_t10parse_nameEmmmm
j	.L248
.L269:
#	.L269
li	a2,0
lui	a5,%hi(.LC113)
addi	a1,a5,%lo(.LC113)
ld	a0,-80(s0)
call	_ZN7lexer_t10parse_wordEPKcm
sd	a0,-56(s0)
ld	a4,-56(s0)
li	a5,9
bleu	a4,a5,.L270
ld	a0,-72(s0)
ld	a5,-56(s0)
ld	a4,-40(s0)
ld	a3,-48(s0)
ld	a2,-32(s0)
ld	a1,-80(s0)
call	_ZN7lexer_t10parse_nameEmmmm
j	.L248
.L270:
#	.L270
ld	a4,-56(s0)
li	a5,9
bne	a4,a5,.L271
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
call	_ZN4rstd6stringC2Ev
j	.L248
.L271:
#	.L271
ld	a4,-56(s0)
li	a5,6
bne	a4,a5,.L272
ld	a2,-56(s0)
lui	a5,%hi(.LC114)
addi	a1,a5,%lo(.LC114)
ld	a0,-80(s0)
call	_ZN7lexer_t10parse_wordEPKcm
sd	a0,-56(s0)
ld	a4,-56(s0)
li	a5,6
bne	a4,a5,.L273
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
call	_ZN4rstd6stringC2Ev
j	.L248
.L273:
#	.L273
ld	a0,-72(s0)
ld	a5,-56(s0)
ld	a4,-40(s0)
ld	a3,-48(s0)
ld	a2,-32(s0)
ld	a1,-80(s0)
call	_ZN7lexer_t10parse_nameEmmmm
j	.L248
.L272:
#	.L272
ld	a5,-56(s0)
beq	a5,zero,.L274
ld	a0,-72(s0)
ld	a5,-56(s0)
ld	a4,-40(s0)
ld	a3,-48(s0)
ld	a2,-32(s0)
ld	a1,-80(s0)
call	_ZN7lexer_t10parse_nameEmmmm
j	.L248
.L274:
#	.L274
li	a2,0
lui	a5,%hi(.LC115)
addi	a1,a5,%lo(.LC115)
ld	a0,-80(s0)
call	_ZN7lexer_t10parse_wordEPKcm
sd	a0,-56(s0)
ld	a4,-56(s0)
li	a5,4
bleu	a4,a5,.L275
ld	a0,-72(s0)
ld	a5,-56(s0)
ld	a4,-40(s0)
ld	a3,-48(s0)
ld	a2,-32(s0)
ld	a1,-80(s0)
call	_ZN7lexer_t10parse_nameEmmmm
j	.L248
.L275:
#	.L275
ld	a4,-56(s0)
li	a5,4
bne	a4,a5,.L276
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
call	_ZN4rstd6stringC2Ev
j	.L248
.L276:
#	.L276
ld	a4,-56(s0)
li	a5,1
bne	a4,a5,.L277
ld	a2,-56(s0)
lui	a5,%hi(.LC116)
addi	a1,a5,%lo(.LC116)
ld	a0,-80(s0)
call	_ZN7lexer_t10parse_wordEPKcm
sd	a0,-56(s0)
ld	a4,-56(s0)
li	a5,3
bne	a4,a5,.L278
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
call	_ZN4rstd6stringC2Ev
j	.L248
.L278:
#	.L278
ld	a0,-72(s0)
ld	a5,-56(s0)
ld	a4,-40(s0)
ld	a3,-48(s0)
ld	a2,-32(s0)
ld	a1,-80(s0)
call	_ZN7lexer_t10parse_nameEmmmm
j	.L248
.L277:
#	.L277
ld	a5,-56(s0)
beq	a5,zero,.L279
ld	a0,-72(s0)
ld	a5,-56(s0)
ld	a4,-40(s0)
ld	a3,-48(s0)
ld	a2,-32(s0)
ld	a1,-80(s0)
call	_ZN7lexer_t10parse_nameEmmmm
j	.L248
.L279:
#	.L279
li	a2,0
lui	a5,%hi(.LC117)
addi	a1,a5,%lo(.LC117)
ld	a0,-80(s0)
call	_ZN7lexer_t10parse_wordEPKcm
sd	a0,-56(s0)
ld	a4,-56(s0)
li	a5,7
bleu	a4,a5,.L280
ld	a0,-72(s0)
ld	a5,-56(s0)
ld	a4,-40(s0)
ld	a3,-48(s0)
ld	a2,-32(s0)
ld	a1,-80(s0)
call	_ZN7lexer_t10parse_nameEmmmm
j	.L248
.L280:
#	.L280
ld	a4,-56(s0)
li	a5,7
bne	a4,a5,.L281
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
call	_ZN4rstd6stringC2Ev
j	.L248
.L281:
#	.L281
ld	a5,-56(s0)
beq	a5,zero,.L282
ld	a0,-72(s0)
ld	a5,-56(s0)
ld	a4,-40(s0)
ld	a3,-48(s0)
ld	a2,-32(s0)
ld	a1,-80(s0)
call	_ZN7lexer_t10parse_nameEmmmm
j	.L248
.L282:
#	.L282
li	a2,0
lui	a5,%hi(.LC118)
addi	a1,a5,%lo(.LC118)
ld	a0,-80(s0)
call	_ZN7lexer_t10parse_wordEPKcm
sd	a0,-56(s0)
ld	a4,-56(s0)
li	a5,6
bleu	a4,a5,.L283
ld	a0,-72(s0)
ld	a5,-56(s0)
ld	a4,-40(s0)
ld	a3,-48(s0)
ld	a2,-32(s0)
ld	a1,-80(s0)
call	_ZN7lexer_t10parse_nameEmmmm
j	.L248
.L283:
#	.L283
ld	a4,-56(s0)
li	a5,6
bne	a4,a5,.L284
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
call	_ZN4rstd6stringC2Ev
j	.L248
.L284:
#	.L284
ld	a4,-56(s0)
li	a5,1
bne	a4,a5,.L285
ld	a2,-56(s0)
lui	a5,%hi(.LC119)
addi	a1,a5,%lo(.LC119)
ld	a0,-80(s0)
call	_ZN7lexer_t10parse_wordEPKcm
sd	a0,-56(s0)
ld	a4,-56(s0)
li	a5,2
bleu	a4,a5,.L286
ld	a0,-72(s0)
ld	a5,-56(s0)
ld	a4,-40(s0)
ld	a3,-48(s0)
ld	a2,-32(s0)
ld	a1,-80(s0)
call	_ZN7lexer_t10parse_nameEmmmm
j	.L248
.L286:
#	.L286
ld	a4,-56(s0)
li	a5,2
bne	a4,a5,.L287
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
call	_ZN4rstd6stringC2Ev
j	.L248
.L287:
#	.L287
ld	a2,-56(s0)
lui	a5,%hi(.LC120)
addi	a1,a5,%lo(.LC120)
ld	a0,-80(s0)
call	_ZN7lexer_t10parse_wordEPKcm
sd	a0,-56(s0)
ld	a4,-56(s0)
li	a5,2
bleu	a4,a5,.L288
ld	a0,-72(s0)
ld	a5,-56(s0)
ld	a4,-40(s0)
ld	a3,-48(s0)
ld	a2,-32(s0)
ld	a1,-80(s0)
call	_ZN7lexer_t10parse_nameEmmmm
j	.L248
.L288:
#	.L288
ld	a4,-56(s0)
li	a5,2
bne	a4,a5,.L289
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
call	_ZN4rstd6stringC2Ev
j	.L248
.L289:
#	.L289
ld	a2,-56(s0)
lui	a5,%hi(.LC121)
addi	a1,a5,%lo(.LC121)
ld	a0,-80(s0)
call	_ZN7lexer_t10parse_wordEPKcm
sd	a0,-56(s0)
ld	a4,-56(s0)
li	a5,2
bleu	a4,a5,.L290
ld	a0,-72(s0)
ld	a5,-56(s0)
ld	a4,-40(s0)
ld	a3,-48(s0)
ld	a2,-32(s0)
ld	a1,-80(s0)
call	_ZN7lexer_t10parse_nameEmmmm
j	.L248
.L290:
#	.L290
ld	a4,-56(s0)
li	a5,2
bne	a4,a5,.L291
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
call	_ZN4rstd6stringC2Ev
j	.L248
.L291:
#	.L291
ld	a0,-72(s0)
ld	a5,-56(s0)
ld	a4,-40(s0)
ld	a3,-48(s0)
ld	a2,-32(s0)
ld	a1,-80(s0)
call	_ZN7lexer_t10parse_nameEmmmm
j	.L248
.L285:
#	.L285
ld	a5,-56(s0)
beq	a5,zero,.L292
ld	a0,-72(s0)
ld	a5,-56(s0)
ld	a4,-40(s0)
ld	a3,-48(s0)
ld	a2,-32(s0)
ld	a1,-80(s0)
call	_ZN7lexer_t10parse_nameEmmmm
j	.L248
.L292:
#	.L292
li	a2,0
lui	a5,%hi(.LC122)
addi	a1,a5,%lo(.LC122)
ld	a0,-80(s0)
call	_ZN7lexer_t10parse_wordEPKcm
sd	a0,-56(s0)
ld	a4,-56(s0)
li	a5,4
bleu	a4,a5,.L293
ld	a0,-72(s0)
ld	a5,-56(s0)
ld	a4,-40(s0)
ld	a3,-48(s0)
ld	a2,-32(s0)
ld	a1,-80(s0)
call	_ZN7lexer_t10parse_nameEmmmm
j	.L248
.L293:
#	.L293
ld	a4,-56(s0)
li	a5,4
bne	a4,a5,.L294
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
call	_ZN4rstd6stringC2Ev
j	.L248
.L294:
#	.L294
ld	a4,-56(s0)
li	a5,1
bne	a4,a5,.L295
ld	a2,-56(s0)
lui	a5,%hi(.LC123)
addi	a1,a5,%lo(.LC123)
ld	a0,-80(s0)
call	_ZN7lexer_t10parse_wordEPKcm
sd	a0,-56(s0)
ld	a4,-56(s0)
li	a5,3
bne	a4,a5,.L296
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
call	_ZN4rstd6stringC2Ev
j	.L248
.L296:
#	.L296
ld	a0,-72(s0)
ld	a5,-56(s0)
ld	a4,-40(s0)
ld	a3,-48(s0)
ld	a2,-32(s0)
ld	a1,-80(s0)
call	_ZN7lexer_t10parse_nameEmmmm
j	.L248
.L295:
#	.L295
ld	a5,-56(s0)
beq	a5,zero,.L297
ld	a0,-72(s0)
ld	a5,-56(s0)
ld	a4,-40(s0)
ld	a3,-48(s0)
ld	a2,-32(s0)
ld	a1,-80(s0)
call	_ZN7lexer_t10parse_nameEmmmm
j	.L248
.L297:
#	.L297
li	a2,0
lui	a5,%hi(.LC124)
addi	a1,a5,%lo(.LC124)
ld	a0,-80(s0)
call	_ZN7lexer_t10parse_wordEPKcm
sd	a0,-56(s0)
ld	a4,-56(s0)
li	a5,2
bleu	a4,a5,.L298
ld	a0,-72(s0)
ld	a5,-56(s0)
ld	a4,-40(s0)
ld	a3,-48(s0)
ld	a2,-32(s0)
ld	a1,-80(s0)
call	_ZN7lexer_t10parse_nameEmmmm
j	.L248
.L298:
#	.L298
ld	a4,-56(s0)
li	a5,2
bne	a4,a5,.L299
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
call	_ZN4rstd6stringC2Ev
j	.L248
.L299:
#	.L299
ld	a5,-56(s0)
beq	a5,zero,.L300
ld	a0,-72(s0)
ld	a5,-56(s0)
ld	a4,-40(s0)
ld	a3,-48(s0)
ld	a2,-32(s0)
ld	a1,-80(s0)
call	_ZN7lexer_t10parse_nameEmmmm
j	.L248
.L300:
#	.L300
li	a2,0
lui	a5,%hi(.LC125)
addi	a1,a5,%lo(.LC125)
ld	a0,-80(s0)
call	_ZN7lexer_t10parse_wordEPKcm
sd	a0,-56(s0)
ld	a4,-56(s0)
li	a5,6
bleu	a4,a5,.L301
ld	a0,-72(s0)
ld	a5,-56(s0)
ld	a4,-40(s0)
ld	a3,-48(s0)
ld	a2,-32(s0)
ld	a1,-80(s0)
call	_ZN7lexer_t10parse_nameEmmmm
j	.L248
.L301:
#	.L301
ld	a4,-56(s0)
li	a5,6
bne	a4,a5,.L302
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
call	_ZN4rstd6stringC2ERKS0_
j	.L248
.L302:
#	.L302
ld	a5,-56(s0)
beq	a5,zero,.L303
ld	a0,-72(s0)
ld	a5,-56(s0)
ld	a4,-40(s0)
ld	a3,-48(s0)
ld	a2,-32(s0)
ld	a1,-80(s0)
call	_ZN7lexer_t10parse_nameEmmmm
j	.L248
.L303:
#	.L303
li	a2,0
lui	a5,%hi(.LC126)
addi	a1,a5,%lo(.LC126)
ld	a0,-80(s0)
call	_ZN7lexer_t10parse_wordEPKcm
sd	a0,-56(s0)
ld	a4,-56(s0)
li	a5,7
bleu	a4,a5,.L304
ld	a0,-72(s0)
ld	a5,-56(s0)
ld	a4,-40(s0)
ld	a3,-48(s0)
ld	a2,-32(s0)
ld	a1,-80(s0)
call	_ZN7lexer_t10parse_nameEmmmm
j	.L248
.L304:
#	.L304
ld	a4,-56(s0)
li	a5,7
bne	a4,a5,.L305
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
call	_ZN4rstd6stringC2Ev
j	.L248
.L305:
#	.L305
ld	a4,-56(s0)
li	a5,3
bne	a4,a5,.L306
ld	a2,-56(s0)
lui	a5,%hi(.LC127)
addi	a1,a5,%lo(.LC127)
ld	a0,-80(s0)
call	_ZN7lexer_t10parse_wordEPKcm
sd	a0,-56(s0)
ld	a4,-56(s0)
li	a5,3
bne	a4,a5,.L307
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
call	_ZN4rstd6stringC2Ev
j	.L248
.L307:
#	.L307
ld	a0,-72(s0)
ld	a5,-56(s0)
ld	a4,-40(s0)
ld	a3,-48(s0)
ld	a2,-32(s0)
ld	a1,-80(s0)
call	_ZN7lexer_t10parse_nameEmmmm
j	.L248
.L306:
#	.L306
ld	a5,-56(s0)
beq	a5,zero,.L308
ld	a0,-72(s0)
ld	a5,-56(s0)
ld	a4,-40(s0)
ld	a3,-48(s0)
ld	a2,-32(s0)
ld	a1,-80(s0)
call	_ZN7lexer_t10parse_nameEmmmm
j	.L248
.L308:
#	.L308
li	a2,0
lui	a5,%hi(.LC128)
addi	a1,a5,%lo(.LC128)
ld	a0,-80(s0)
call	_ZN7lexer_t10parse_wordEPKcm
sd	a0,-56(s0)
ld	a4,-56(s0)
li	a5,5
bleu	a4,a5,.L309
ld	a0,-72(s0)
ld	a5,-56(s0)
ld	a4,-40(s0)
ld	a3,-48(s0)
ld	a2,-32(s0)
ld	a1,-80(s0)
call	_ZN7lexer_t10parse_nameEmmmm
j	.L248
.L309:
#	.L309
ld	a4,-56(s0)
li	a5,5
bne	a4,a5,.L310
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
call	_ZN4rstd6stringC2Ev
j	.L248
.L310:
#	.L310
ld	a5,-56(s0)
beq	a5,zero,.L311
ld	a0,-72(s0)
ld	a5,-56(s0)
ld	a4,-40(s0)
ld	a3,-48(s0)
ld	a2,-32(s0)
ld	a1,-80(s0)
call	_ZN7lexer_t10parse_nameEmmmm
j	.L248
.L311:
#	.L311
lbu	a5,-17(s0)
mv	a1,a5
ld	a0,-80(s0)
call	_ZN7lexer_t7isdigitEc
mv	a5,a0
beq	a5,zero,.L312
ld	a5,-72(s0)
ld	a1,-80(s0)
mv	a0,a5
call	_ZN7lexer_t12parse_numberEv
j	.L248
.L312:
#	.L312
lbu	a5,-17(s0)
mv	a1,a5
ld	a0,-80(s0)
call	_ZN7lexer_t17can_continue_nameEc
mv	a5,a0
beq	a5,zero,.L313
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
j	.L248
.L313:
#	.L313
lbu	a5,-17(s0)
andi	a4,a5,0xff
li	a5,32
beq	a4,a5,.L314
lbu	a5,-17(s0)
andi	a4,a5,0xff
li	a5,9
beq	a4,a5,.L314
lbu	a5,-17(s0)
andi	a4,a5,0xff
li	a5,10
bne	a4,a5,.L315
.L314:
#	.L314
ld	a5,-72(s0)
ld	a1,-80(s0)
mv	a0,a5
call	_ZN7lexer_t11parse_spaceEv
j	.L248
.L315:
#	.L315
ld	a5,-72(s0)
ld	a1,-80(s0)
mv	a0,a5
call	_ZN7lexer_t14parse_non_nameEv
.L248:
#	.L248
ld	a0,-72(s0)
ld	ra,72(sp)
ld	s0,64(sp)
addi	sp,sp,80
jr	ra
.LFE4649:
#	.LFE4649
.globl	NODE_NAMES
#	NODE_NAMES
.data
.LC129:
#	.LC129
.string	"UNKNOWN"
.string	""
.LC130:
#	.LC130
.string	"BINARY_OP"
.string	""
.LC131:
#	.LC131
.string	"UNARY_OP"
.string	""
.LC132:
#	.LC132
.string	"NUMBER"
.string	""
NODE_NAMES:
#	NODE_NAMES
.dword	.LC129
.dword	.LC130
.dword	.LC131
.dword	.LC132
.text
_ZN14parsed_token_tC2ERKS_:
#	parsed_token_t::parsed_token_t(parsed_token_t const&)
.LFB4871:
#	.LFB4871
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
call	_ZN4rstd6stringC2ERKS0_
nop
ld	ra,24(sp)
ld	s0,16(sp)
addi	sp,sp,32
jr	ra
.LFE4871:
#	.LFE4871
_ZN10ast_node_tC2ERK11node_type_tRK14parsed_token_t:
#	ast_node_t::ast_node_t(node_type_t const&, parsed_token_t const&)
.LFB4873:
#	.LFB4873
addi	sp,sp,-48
sd	ra,40(sp)
sd	s0,32(sp)
addi	s0,sp,48
sd	a0,-24(s0)
sd	a1,-32(s0)
sd	a2,-40(s0)
ld	a5,-32(s0)
lw	a4,0(a5)
ld	a5,-24(s0)
sw	a4,0(a5)
li	a0,800
call	_ZN6memory5allocEm
mv	a4,a0
ld	a5,-24(s0)
sd	a4,8(a5)
ld	a5,-24(s0)
addi	a5,a5,16
ld	a1,-40(s0)
mv	a0,a5
call	_ZN14parsed_token_tC2ERKS_
nop
ld	ra,40(sp)
ld	s0,32(sp)
addi	sp,sp,48
jr	ra
.LFE4873:
#	.LFE4873
_ZN14parsed_token_tC2Ev:
#	parsed_token_t::parsed_token_t()
.LFB4878:
#	.LFB4878
addi	sp,sp,-32
sd	ra,24(sp)
sd	s0,16(sp)
addi	s0,sp,32
sd	a0,-24(s0)
ld	a5,-24(s0)
addi	a5,a5,40
mv	a0,a5
call	_ZN4rstd6stringC2Ev
nop
ld	ra,24(sp)
ld	s0,16(sp)
addi	sp,sp,32
jr	ra
.LFE4878:
#	.LFE4878
_ZN10ast_node_tC2Ev:
#	ast_node_t::ast_node_t()
.LFB4880:
#	.LFB4880
addi	sp,sp,-32
sd	ra,24(sp)
sd	s0,16(sp)
addi	s0,sp,32
sd	a0,-24(s0)
ld	a5,-24(s0)
sw	zero,0(a5)
ld	a5,-24(s0)
sd	zero,8(a5)
ld	a5,-24(s0)
addi	a5,a5,16
mv	a0,a5
call	_ZN14parsed_token_tC2Ev
nop
ld	ra,24(sp)
ld	s0,16(sp)
addi	sp,sp,32
jr	ra
.LFE4880:
#	.LFE4880
_ZN10ast_node_tD2Ev:
#	ast_node_t::~ast_node_t()
.LFB4883:
#	.LFB4883
addi	sp,sp,-32
sd	ra,24(sp)
sd	s0,16(sp)
addi	s0,sp,32
sd	a0,-24(s0)
ld	a5,-24(s0)
addi	a5,a5,16
mv	a0,a5
call	_ZN14parsed_token_tD2Ev
nop
ld	ra,24(sp)
ld	s0,16(sp)
addi	sp,sp,32
jr	ra
.LFE4883:
#	.LFE4883
_ZN12maybe_node_tC2Ev:
#	maybe_node_t::maybe_node_t()
.LFB4885:
#	.LFB4885
addi	sp,sp,-32
sd	ra,24(sp)
sd	s0,16(sp)
addi	s0,sp,32
sd	a0,-24(s0)
ld	a5,-24(s0)
li	a4,1
sb	a4,0(a5)
ld	a5,-24(s0)
addi	a5,a5,8
mv	a0,a5
call	_ZN10ast_node_tC2Ev
nop
ld	ra,24(sp)
ld	s0,16(sp)
addi	sp,sp,32
jr	ra
.LFE4885:
#	.LFE4885
_ZN10ast_node_tC2ERKS_:
#	ast_node_t::ast_node_t(ast_node_t const&)
.LFB4889:
#	.LFB4889
addi	sp,sp,-32
sd	ra,24(sp)
sd	s0,16(sp)
addi	s0,sp,32
sd	a0,-24(s0)
sd	a1,-32(s0)
ld	a5,-32(s0)
lw	a4,0(a5)
ld	a5,-24(s0)
sw	a4,0(a5)
ld	a5,-32(s0)
ld	a4,8(a5)
ld	a5,-24(s0)
sd	a4,8(a5)
ld	a5,-24(s0)
addi	a4,a5,16
ld	a5,-32(s0)
addi	a5,a5,16
mv	a1,a5
mv	a0,a4
call	_ZN14parsed_token_tC2ERKS_
nop
ld	ra,24(sp)
ld	s0,16(sp)
addi	sp,sp,32
jr	ra
.LFE4889:
#	.LFE4889
_ZN12maybe_node_tC2ERK10ast_node_t:
#	maybe_node_t::maybe_node_t(ast_node_t const&)
.LFB4891:
#	.LFB4891
addi	sp,sp,-32
sd	ra,24(sp)
sd	s0,16(sp)
addi	s0,sp,32
sd	a0,-24(s0)
sd	a1,-32(s0)
ld	a5,-24(s0)
sb	zero,0(a5)
ld	a5,-24(s0)
addi	a5,a5,8
ld	a1,-32(s0)
mv	a0,a5
call	_ZN10ast_node_tC2ERKS_
nop
ld	ra,24(sp)
ld	s0,16(sp)
addi	sp,sp,32
jr	ra
.LFE4891:
#	.LFE4891
_ZN12maybe_node_tC2ERKS_:
#	maybe_node_t::maybe_node_t(maybe_node_t const&)
.LFB4894:
#	.LFB4894
addi	sp,sp,-32
sd	ra,24(sp)
sd	s0,16(sp)
addi	s0,sp,32
sd	a0,-24(s0)
sd	a1,-32(s0)
ld	a5,-32(s0)
lbu	a4,0(a5)
ld	a5,-24(s0)
sb	a4,0(a5)
ld	a5,-24(s0)
addi	a4,a5,8
ld	a5,-32(s0)
addi	a5,a5,8
mv	a1,a5
mv	a0,a4
call	_ZN10ast_node_tC2ERKS_
nop
ld	ra,24(sp)
ld	s0,16(sp)
addi	sp,sp,32
jr	ra
.LFE4894:
#	.LFE4894
_ZN12maybe_node_tD2Ev:
#	maybe_node_t::~maybe_node_t()
.LFB4898:
#	.LFB4898
addi	sp,sp,-32
sd	ra,24(sp)
sd	s0,16(sp)
addi	s0,sp,32
sd	a0,-24(s0)
ld	a5,-24(s0)
addi	a5,a5,8
mv	a0,a5
call	_ZN10ast_node_tD2Ev
nop
ld	ra,24(sp)
ld	s0,16(sp)
addi	sp,sp,32
jr	ra
.LFE4898:
#	.LFE4898
_ZN13maybe_error_tC2ERK12maybe_node_t:
#	maybe_error_t::maybe_error_t(maybe_node_t const&)
.LFB4900:
#	.LFB4900
addi	sp,sp,-32
sd	ra,24(sp)
sd	s0,16(sp)
addi	s0,sp,32
sd	a0,-24(s0)
sd	a1,-32(s0)
ld	a5,-24(s0)
sb	zero,0(a5)
ld	a5,-24(s0)
sd	zero,8(a5)
ld	a5,-24(s0)
addi	a5,a5,16
ld	a1,-32(s0)
mv	a0,a5
call	_ZN12maybe_node_tC2ERKS_
nop
ld	ra,24(sp)
ld	s0,16(sp)
addi	sp,sp,32
jr	ra
.LFE4900:
#	.LFE4900
_ZN13maybe_error_tC2EPKc:
#	maybe_error_t::maybe_error_t(char const*)
.LFB4903:
#	.LFB4903
addi	sp,sp,-32
sd	ra,24(sp)
sd	s0,16(sp)
addi	s0,sp,32
sd	a0,-24(s0)
sd	a1,-32(s0)
ld	a5,-24(s0)
li	a4,1
sb	a4,0(a5)
ld	a5,-24(s0)
ld	a4,-32(s0)
sd	a4,8(a5)
ld	a5,-24(s0)
addi	a5,a5,16
mv	a0,a5
call	_ZN12maybe_node_tC2Ev
nop
ld	ra,24(sp)
ld	s0,16(sp)
addi	sp,sp,32
jr	ra
.LFE4903:
#	.LFE4903
_ZN13maybe_error_tC2ERKS_:
#	maybe_error_t::maybe_error_t(maybe_error_t const&)
.LFB4906:
#	.LFB4906
addi	sp,sp,-32
sd	ra,24(sp)
sd	s0,16(sp)
addi	s0,sp,32
sd	a0,-24(s0)
sd	a1,-32(s0)
ld	a5,-32(s0)
lbu	a4,0(a5)
ld	a5,-24(s0)
sb	a4,0(a5)
ld	a5,-32(s0)
ld	a4,8(a5)
ld	a5,-24(s0)
sd	a4,8(a5)
ld	a5,-24(s0)
addi	a4,a5,16
ld	a5,-32(s0)
addi	a5,a5,16
mv	a1,a5
mv	a0,a4
call	_ZN12maybe_node_tC2ERKS_
nop
ld	ra,24(sp)
ld	s0,16(sp)
addi	sp,sp,32
jr	ra
.LFE4906:
#	.LFE4906
_ZN13maybe_error_tC2ERK10ast_node_t:
#	maybe_error_t::maybe_error_t(ast_node_t const&)
.LFB4909:
#	.LFB4909
addi	sp,sp,-32
sd	ra,24(sp)
sd	s0,16(sp)
addi	s0,sp,32
sd	a0,-24(s0)
sd	a1,-32(s0)
ld	a5,-24(s0)
sb	zero,0(a5)
ld	a5,-24(s0)
sd	zero,8(a5)
ld	a5,-24(s0)
addi	a5,a5,16
ld	a1,-32(s0)
mv	a0,a5
call	_ZN12maybe_node_tC2ERK10ast_node_t
nop
ld	ra,24(sp)
ld	s0,16(sp)
addi	sp,sp,32
jr	ra
.LFE4909:
#	.LFE4909
_ZN7lexer_tC2ERKS_:
#	lexer_t::lexer_t(lexer_t const&)
.LFB4913:
#	.LFB4913
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
lbu	a4,24(a5)
ld	a5,-24(s0)
sb	a4,24(a5)
ld	a5,-32(s0)
ld	a4,32(a5)
ld	a5,-24(s0)
sd	a4,32(a5)
ld	a5,-32(s0)
ld	a4,40(a5)
ld	a5,-24(s0)
sd	a4,40(a5)
ld	a5,-32(s0)
ld	a4,48(a5)
ld	a5,-24(s0)
sd	a4,48(a5)
ld	a5,-32(s0)
ld	a4,56(a5)
ld	a5,-24(s0)
sd	a4,56(a5)
ld	a5,-24(s0)
addi	a4,a5,64
ld	a5,-32(s0)
addi	a5,a5,64
mv	a1,a5
mv	a0,a4
call	_ZN4rstd6stringC2ERKS0_
nop
ld	ra,24(sp)
ld	s0,16(sp)
addi	sp,sp,32
jr	ra
.LFE4913:
#	.LFE4913
_ZN8parser_tC2ERK7lexer_t:
#	parser_t::parser_t(lexer_t const&)
.LFB4915:
#	.LFB4915
addi	sp,sp,-32
sd	ra,24(sp)
sd	s0,16(sp)
addi	s0,sp,32
sd	a0,-24(s0)
sd	a1,-32(s0)
ld	a5,-24(s0)
ld	a1,-32(s0)
mv	a0,a5
call	_ZN7lexer_tC2ERKS_
ld	a5,-24(s0)
addi	a5,a5,88
mv	a0,a5
call	_ZN14parsed_token_tC2Ev
nop
ld	ra,24(sp)
ld	s0,16(sp)
addi	sp,sp,32
jr	ra
.LFE4915:
#	.LFE4915
_ZN14parsed_token_taSEOS_:
#	parsed_token_t::operator=(parsed_token_t&&)
.LFB4918:
#	.LFB4918
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
.LFE4918:
#	.LFE4918
_ZN14parsed_token_taSERKS_:
#	parsed_token_t::operator=(parsed_token_t const&)
.LFB4919:
#	.LFB4919
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
.LFE4919:
#	.LFE4919
_ZN8parser_t15skip_whitespaceEv:
#	parser_t::skip_whitespace()
.LFB4917:
#	.LFB4917
addi	sp,sp,-160
sd	ra,152(sp)
sd	s0,144(sp)
addi	s0,sp,160
sd	a0,-152(s0)
ld	a4,-152(s0)
addi	a5,s0,-144
mv	a1,a4
mv	a0,a5
call	_ZN7lexer_t8next_tokEv
j	.L337
.L338:
#	.L338
ld	a4,-152(s0)
addi	a5,s0,-80
mv	a1,a4
mv	a0,a5
call	_ZN7lexer_t8next_tokEv
addi	a4,s0,-80
addi	a5,s0,-144
mv	a1,a4
mv	a0,a5
call	_ZN14parsed_token_taSEOS_
addi	a5,s0,-80
mv	a0,a5
call	_ZN14parsed_token_tD2Ev
.L337:
#	.L337
ld	a4,-144(s0)
li	a5,3
beq	a4,a5,.L338
ld	a4,-144(s0)
li	a5,2
beq	a4,a5,.L338
ld	a5,-152(s0)
addi	a5,a5,88
addi	a4,s0,-144
mv	a1,a4
mv	a0,a5
call	_ZN14parsed_token_taSERKS_
addi	a5,s0,-144
mv	a0,a5
call	_ZN14parsed_token_tD2Ev
ld	ra,152(sp)
ld	s0,144(sp)
addi	sp,sp,160
jr	ra
.LFE4917:
#	.LFE4917
_ZN8parser_t3eatEv:
#	parser_t::eat()
.LFB4920:
#	.LFB4920
addi	sp,sp,-32
sd	ra,24(sp)
sd	s0,16(sp)
addi	s0,sp,32
sd	a0,-24(s0)
sd	a1,-32(s0)
ld	a0,-32(s0)
call	_ZN8parser_t15skip_whitespaceEv
ld	a5,-32(s0)
addi	a5,a5,88
mv	a1,a5
ld	a0,-24(s0)
call	_ZN14parsed_token_tC2ERKS_
ld	a0,-24(s0)
ld	ra,24(sp)
ld	s0,16(sp)
addi	sp,sp,32
jr	ra
.LFE4920:
#	.LFE4920
_ZN13maybe_error_tD2Ev:
#	maybe_error_t::~maybe_error_t()
.LFB4923:
#	.LFB4923
addi	sp,sp,-32
sd	ra,24(sp)
sd	s0,16(sp)
addi	s0,sp,32
sd	a0,-24(s0)
ld	a5,-24(s0)
addi	a5,a5,16
mv	a0,a5
call	_ZN12maybe_node_tD2Ev
nop
ld	ra,24(sp)
ld	s0,16(sp)
addi	sp,sp,32
jr	ra
.LFE4923:
#	.LFE4923
.data
.LC133:
#	.LC133
.string	"ast parsed number: "
.text
_ZN8parser_t12parse_numberEv:
#	parser_t::parse_number()
.LFB4921:
#	.LFB4921
addi	sp,sp,-512
sd	ra,504(sp)
sd	s0,496(sp)
addi	s0,sp,512
sd	a0,-504(s0)
sd	a1,-512(s0)
ld	a5,-512(s0)
ld	a4,88(a5)
li	a5,1
bne	a4,a5,.L343
addi	a5,s0,-264
mv	a0,a5
call	_ZN12maybe_node_tC2Ev
addi	a5,s0,-264
mv	a1,a5
ld	a0,-504(s0)
call	_ZN13maybe_error_tC2ERK12maybe_node_t
addi	a5,s0,-264
mv	a0,a5
call	_ZN12maybe_node_tD2Ev
j	.L342
.L343:
#	.L343
addi	a5,s0,-176
ld	a1,-512(s0)
mv	a0,a5
call	_ZN8parser_t3eatEv
addi	a5,s0,-176
mv	a0,a5
call	_ZN14parsed_token_tD2Ev
ld	a5,-512(s0)
ld	a4,88(a5)
li	a5,4
beq	a4,a5,.L345
ld	a5,-512(s0)
ld	a4,88(a5)
li	a5,5
bne	a4,a5,.L346
.L345:
#	.L345
ld	a5,-512(s0)
addi	a4,a5,88
addi	a5,s0,-496
mv	a1,a4
mv	a0,a5
call	_ZN14parsed_token_tC2ERKS_
li	a5,3
sw	a5,-108(s0)
addi	a3,s0,-496
addi	a4,s0,-108
addi	a5,s0,-432
mv	a2,a3
mv	a1,a4
mv	a0,a5
call	_ZN10ast_node_tC2ERK11node_type_tRK14parsed_token_t
addi	a4,s0,-432
addi	a5,s0,-352
mv	a1,a4
mv	a0,a5
call	_ZN12maybe_node_tC2ERK10ast_node_t
lui	a5,%hi(.LC133)
addi	a0,a5,%lo(.LC133)
call	_ZN8rsyscall12print_stringEPKc
addi	a5,s0,-352
addi	a5,a5,64
mv	a0,a5
call	_ZN4rstd6string5c_strEv
mv	a5,a0
mv	a0,a5
call	_ZN8rsyscall12print_stringEPKc
lui	a5,%hi(.LC85)
addi	a0,a5,%lo(.LC85)
call	_ZN8rsyscall12print_stringEPKc
addi	a5,s0,-352
mv	a1,a5
ld	a0,-504(s0)
call	_ZN13maybe_error_tC2ERK12maybe_node_t
addi	a5,s0,-352
mv	a0,a5
call	_ZN12maybe_node_tD2Ev
addi	a5,s0,-432
mv	a0,a5
call	_ZN10ast_node_tD2Ev
addi	a5,s0,-496
mv	a0,a5
call	_ZN14parsed_token_tD2Ev
j	.L342
.L346:
#	.L346
addi	a5,s0,-104
mv	a0,a5
call	_ZN12maybe_node_tC2Ev
addi	a5,s0,-104
mv	a1,a5
ld	a0,-504(s0)
call	_ZN13maybe_error_tC2ERK12maybe_node_t
addi	a5,s0,-104
mv	a0,a5
call	_ZN12maybe_node_tD2Ev
.L342:
#	.L342
ld	a0,-504(s0)
ld	ra,504(sp)
ld	s0,496(sp)
addi	sp,sp,512
jr	ra
.LFE4921:
#	.LFE4921
_ZN10ast_node_taSEOS_:
#	ast_node_t::operator=(ast_node_t&&)
.LFB4926:
#	.LFB4926
addi	sp,sp,-32
sd	ra,24(sp)
sd	s0,16(sp)
addi	s0,sp,32
sd	a0,-24(s0)
sd	a1,-32(s0)
ld	a5,-32(s0)
lw	a4,0(a5)
ld	a5,-24(s0)
sw	a4,0(a5)
ld	a5,-32(s0)
ld	a4,8(a5)
ld	a5,-24(s0)
sd	a4,8(a5)
ld	a5,-32(s0)
addi	a4,a5,16
ld	a5,-24(s0)
addi	a5,a5,16
mv	a1,a4
mv	a0,a5
call	_ZN14parsed_token_taSEOS_
ld	a5,-24(s0)
mv	a0,a5
ld	ra,24(sp)
ld	s0,16(sp)
addi	sp,sp,32
jr	ra
.LFE4926:
#	.LFE4926
_ZN10ast_node_taSERKS_:
#	ast_node_t::operator=(ast_node_t const&)
.LFB4927:
#	.LFB4927
addi	sp,sp,-32
sd	ra,24(sp)
sd	s0,16(sp)
addi	s0,sp,32
sd	a0,-24(s0)
sd	a1,-32(s0)
ld	a5,-32(s0)
lw	a4,0(a5)
ld	a5,-24(s0)
sw	a4,0(a5)
ld	a5,-32(s0)
ld	a4,8(a5)
ld	a5,-24(s0)
sd	a4,8(a5)
ld	a5,-32(s0)
addi	a4,a5,16
ld	a5,-24(s0)
addi	a5,a5,16
mv	a1,a4
mv	a0,a5
call	_ZN14parsed_token_taSERKS_
ld	a5,-24(s0)
mv	a0,a5
ld	ra,24(sp)
ld	s0,16(sp)
addi	sp,sp,32
jr	ra
.LFE4927:
#	.LFE4927
_ZN12maybe_node_taSERKS_:
#	maybe_node_t::operator=(maybe_node_t const&)
.LFB4929:
#	.LFB4929
addi	sp,sp,-32
sd	ra,24(sp)
sd	s0,16(sp)
addi	s0,sp,32
sd	a0,-24(s0)
sd	a1,-32(s0)
ld	a5,-32(s0)
lbu	a4,0(a5)
ld	a5,-24(s0)
sb	a4,0(a5)
ld	a5,-32(s0)
addi	a4,a5,8
ld	a5,-24(s0)
addi	a5,a5,8
mv	a1,a4
mv	a0,a5
call	_ZN10ast_node_taSERKS_
ld	a5,-24(s0)
mv	a0,a5
ld	ra,24(sp)
ld	s0,16(sp)
addi	sp,sp,32
jr	ra
.LFE4929:
#	.LFE4929
_ZN13maybe_error_taSERKS_:
#	maybe_error_t::operator=(maybe_error_t const&)
.LFB4928:
#	.LFB4928
addi	sp,sp,-32
sd	ra,24(sp)
sd	s0,16(sp)
addi	s0,sp,32
sd	a0,-24(s0)
sd	a1,-32(s0)
ld	a5,-32(s0)
lbu	a4,0(a5)
ld	a5,-24(s0)
sb	a4,0(a5)
ld	a5,-32(s0)
ld	a4,8(a5)
ld	a5,-24(s0)
sd	a4,8(a5)
ld	a5,-32(s0)
addi	a4,a5,16
ld	a5,-24(s0)
addi	a5,a5,16
mv	a1,a4
mv	a0,a5
call	_ZN12maybe_node_taSERKS_
ld	a5,-24(s0)
mv	a0,a5
ld	ra,24(sp)
ld	s0,16(sp)
addi	sp,sp,32
jr	ra
.LFE4928:
#	.LFE4928
.data
.LC134:
#	.LC134
.string	"Expected expression after product expression"
.text
_ZN8parser_t13parse_productEv:
#	parser_t::parse_product()
.LFB4925:
#	.LFB4925
addi	sp,sp,-720
sd	ra,712(sp)
sd	s0,704(sp)
sd	s1,696(sp)
addi	s0,sp,720
sd	a0,-712(s0)
sd	a1,-720(s0)
addi	a5,s0,-456
ld	a1,-720(s0)
mv	a0,a5
call	_ZN8parser_t12parse_numberEv
lbu	a5,-456(s0)
beq	a5,zero,.L356
addi	a5,s0,-456
mv	a1,a5
ld	a0,-712(s0)
call	_ZN13maybe_error_tC2ERKS_
j	.L357
.L356:
#	.L356
lbu	a5,-440(s0)
beq	a5,zero,.L358
addi	a5,s0,-456
mv	a1,a5
ld	a0,-712(s0)
call	_ZN13maybe_error_tC2ERKS_
j	.L357
.L358:
#	.L358
addi	a5,s0,-352
ld	a1,-720(s0)
mv	a0,a5
call	_ZN8parser_t3eatEv
addi	a5,s0,-352
mv	a0,a5
call	_ZN14parsed_token_tD2Ev
j	.L359
.L366:
#	.L366
ld	a5,-720(s0)
addi	a4,a5,88
addi	a5,s0,-704
mv	a1,a4
mv	a0,a5
call	_ZN14parsed_token_tC2ERKS_
addi	a5,s0,-560
ld	a1,-720(s0)
mv	a0,a5
call	_ZN8parser_t12parse_numberEv
lbu	a5,-456(s0)
beq	a5,zero,.L360
addi	a5,s0,-456
mv	a1,a5
ld	a0,-712(s0)
call	_ZN13maybe_error_tC2ERKS_
li	s1,0
j	.L361
.L360:
#	.L360
lbu	a5,-440(s0)
beq	a5,zero,.L362
lui	a5,%hi(.LC134)
addi	a1,a5,%lo(.LC134)
ld	a0,-712(s0)
call	_ZN13maybe_error_tC2EPKc
li	s1,0
j	.L361
.L362:
#	.L362
li	a5,1
sw	a5,-284(s0)
addi	a3,s0,-704
addi	a4,s0,-284
addi	a5,s0,-640
mv	a2,a3
mv	a1,a4
mv	a0,a5
call	_ZN10ast_node_tC2ERK11node_type_tRK14parsed_token_t
addi	a5,s0,-456
addi	a4,a5,24
addi	a5,s0,-280
mv	a1,a4
mv	a0,a5
call	_ZN10ast_node_tC2ERKS_
ld	a5,-632(s0)
addi	a4,s0,-280
mv	a1,a4
mv	a0,a5
call	_ZN10ast_node_taSEOS_
addi	a5,s0,-280
mv	a0,a5
call	_ZN10ast_node_tD2Ev
ld	a5,-632(s0)
addi	a4,a5,80
addi	a5,s0,-560
addi	a5,a5,24
mv	a1,a5
mv	a0,a4
call	_ZN10ast_node_taSERKS_
addi	a4,s0,-640
addi	a5,s0,-200
mv	a1,a4
mv	a0,a5
call	_ZN13maybe_error_tC2ERK10ast_node_t
addi	a4,s0,-200
addi	a5,s0,-456
mv	a1,a4
mv	a0,a5
call	_ZN13maybe_error_taSERKS_
addi	a5,s0,-200
mv	a0,a5
call	_ZN13maybe_error_tD2Ev
addi	a5,s0,-640
mv	a0,a5
call	_ZN10ast_node_tD2Ev
li	s1,1
.L361:
#	.L361
addi	a5,s0,-560
mv	a0,a5
call	_ZN13maybe_error_tD2Ev
mv	a4,s1
li	a5,1
bne	a4,a5,.L363
li	s1,1
j	.L364
.L363:
#	.L363
li	s1,0
.L364:
#	.L364
addi	a5,s0,-704
mv	a0,a5
call	_ZN14parsed_token_tD2Ev
mv	a4,s1
li	a5,1
bne	a4,a5,.L357
addi	a5,s0,-96
ld	a1,-720(s0)
mv	a0,a5
call	_ZN8parser_t3eatEv
addi	a5,s0,-96
mv	a0,a5
call	_ZN14parsed_token_tD2Ev
.L359:
#	.L359
ld	a5,-720(s0)
ld	a4,88(a5)
li	a5,34
beq	a4,a5,.L366
ld	a5,-720(s0)
ld	a4,88(a5)
li	a5,35
beq	a4,a5,.L366
ld	a5,-720(s0)
ld	a4,88(a5)
li	a5,38
beq	a4,a5,.L366
addi	a5,s0,-456
mv	a1,a5
ld	a0,-712(s0)
call	_ZN13maybe_error_tC2ERKS_
.L357:
#	.L357
addi	a5,s0,-456
mv	a0,a5
call	_ZN13maybe_error_tD2Ev
ld	a0,-712(s0)
ld	ra,712(sp)
ld	s0,704(sp)
ld	s1,696(sp)
addi	sp,sp,720
jr	ra
.LFE4925:
#	.LFE4925
.data
.LC135:
#	.LC135
.string	"got lhs: "
.LC136:
#	.LC136
.string	"Expected expression after sum expression"
.text
_ZN8parser_t9parse_sumEv:
#	parser_t::parse_sum()
.LFB4930:
#	.LFB4930
addi	sp,sp,-512
sd	ra,504(sp)
sd	s0,496(sp)
sd	s1,488(sp)
addi	s0,sp,512
sd	a0,-504(s0)
sd	a1,-512(s0)
addi	a5,s0,-248
ld	a1,-512(s0)
mv	a0,a5
call	_ZN8parser_t13parse_productEv
lui	a5,%hi(.LC135)
addi	a0,a5,%lo(.LC135)
call	_ZN8rsyscall12print_stringEPKc
addi	a5,s0,-248
addi	a5,a5,80
mv	a0,a5
call	_ZN4rstd6string5c_strEv
mv	a5,a0
mv	a0,a5
call	_ZN8rsyscall12print_stringEPKc
lui	a5,%hi(.LC85)
addi	a0,a5,%lo(.LC85)
call	_ZN8rsyscall12print_stringEPKc
lbu	a5,-248(s0)
beq	a5,zero,.L369
addi	a5,s0,-248
mv	a1,a5
ld	a0,-504(s0)
call	_ZN13maybe_error_tC2ERKS_
j	.L370
.L369:
#	.L369
lbu	a5,-232(s0)
beq	a5,zero,.L372
addi	a5,s0,-248
mv	a1,a5
ld	a0,-504(s0)
call	_ZN13maybe_error_tC2ERKS_
j	.L370
.L379:
#	.L379
ld	a5,-512(s0)
addi	a4,a5,88
addi	a5,s0,-496
mv	a1,a4
mv	a0,a5
call	_ZN14parsed_token_tC2ERKS_
addi	a5,s0,-352
ld	a1,-512(s0)
mv	a0,a5
call	_ZN8parser_t13parse_productEv
lbu	a5,-248(s0)
beq	a5,zero,.L373
addi	a5,s0,-248
mv	a1,a5
ld	a0,-504(s0)
call	_ZN13maybe_error_tC2ERKS_
li	s1,0
j	.L374
.L373:
#	.L373
lbu	a5,-232(s0)
beq	a5,zero,.L375
lui	a5,%hi(.LC136)
addi	a1,a5,%lo(.LC136)
ld	a0,-504(s0)
call	_ZN13maybe_error_tC2EPKc
li	s1,0
j	.L374
.L375:
#	.L375
li	a5,1
sw	a5,-140(s0)
addi	a3,s0,-496
addi	a4,s0,-140
addi	a5,s0,-432
mv	a2,a3
mv	a1,a4
mv	a0,a5
call	_ZN10ast_node_tC2ERK11node_type_tRK14parsed_token_t
ld	a4,-424(s0)
addi	a5,s0,-248
addi	a5,a5,24
mv	a1,a5
mv	a0,a4
call	_ZN10ast_node_taSERKS_
ld	a5,-424(s0)
addi	a4,a5,80
addi	a5,s0,-352
addi	a5,a5,24
mv	a1,a5
mv	a0,a4
call	_ZN10ast_node_taSERKS_
addi	a4,s0,-432
addi	a5,s0,-136
mv	a1,a4
mv	a0,a5
call	_ZN13maybe_error_tC2ERK10ast_node_t
addi	a4,s0,-136
addi	a5,s0,-248
mv	a1,a4
mv	a0,a5
call	_ZN13maybe_error_taSERKS_
addi	a5,s0,-136
mv	a0,a5
call	_ZN13maybe_error_tD2Ev
addi	a5,s0,-432
mv	a0,a5
call	_ZN10ast_node_tD2Ev
li	s1,1
.L374:
#	.L374
addi	a5,s0,-352
mv	a0,a5
call	_ZN13maybe_error_tD2Ev
mv	a4,s1
li	a5,1
bne	a4,a5,.L376
li	s1,1
j	.L377
.L376:
#	.L376
li	s1,0
.L377:
#	.L377
addi	a5,s0,-496
mv	a0,a5
call	_ZN14parsed_token_tD2Ev
mv	a4,s1
li	a5,1
bne	a4,a5,.L370
.L372:
#	.L372
ld	a5,-512(s0)
ld	a4,88(a5)
li	a5,32
beq	a4,a5,.L379
ld	a5,-512(s0)
ld	a4,88(a5)
li	a5,33
beq	a4,a5,.L379
addi	a5,s0,-248
mv	a1,a5
ld	a0,-504(s0)
call	_ZN13maybe_error_tC2ERKS_
.L370:
#	.L370
addi	a5,s0,-248
mv	a0,a5
call	_ZN13maybe_error_tD2Ev
ld	a0,-504(s0)
ld	ra,504(sp)
ld	s0,496(sp)
ld	s1,488(sp)
addi	sp,sp,512
jr	ra
.LFE4930:
#	.LFE4930
_ZN8parser_t16parse_expressionEv:
#	parser_t::parse_expression()
.LFB4931:
#	.LFB4931
addi	sp,sp,-32
sd	ra,24(sp)
sd	s0,16(sp)
addi	s0,sp,32
sd	a0,-24(s0)
sd	a1,-32(s0)
ld	a5,-24(s0)
ld	a1,-32(s0)
mv	a0,a5
call	_ZN8parser_t9parse_sumEv
ld	a0,-24(s0)
ld	ra,24(sp)
ld	s0,16(sp)
addi	sp,sp,32
jr	ra
.LFE4931:
#	.LFE4931
.globl	_Znwm
#	operator new(unsigned long)
_Znwm:
#	operator new(unsigned long)
.LFB4978:
#	.LFB4978
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
.LFE4978:
#	.LFE4978
.globl	_ZdlPv
#	operator delete(void*)
_ZdlPv:
#	operator delete(void*)
.LFB4979:
#	.LFB4979
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
.LFE4979:
#	.LFE4979
.globl	_Znam
#	operator new[](unsigned long)
_Znam:
#	operator new[](unsigned long)
.LFB4980:
#	.LFB4980
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
.LFE4980:
#	.LFE4980
.globl	_ZdaPv
#	operator delete[](void*)
_ZdaPv:
#	operator delete[](void*)
.LFB4981:
#	.LFB4981
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
.LFE4981:
#	.LFE4981
_ZN8parser_tD2Ev:
#	parser_t::~parser_t()
.LFB4984:
#	.LFB4984
addi	sp,sp,-32
sd	ra,24(sp)
sd	s0,16(sp)
addi	s0,sp,32
sd	a0,-24(s0)
ld	a5,-24(s0)
addi	a5,a5,88
mv	a0,a5
call	_ZN14parsed_token_tD2Ev
ld	a5,-24(s0)
mv	a0,a5
call	_ZN7lexer_tD2Ev
nop
ld	ra,24(sp)
ld	s0,16(sp)
addi	sp,sp,32
jr	ra
.LFE4984:
#	.LFE4984
.data
.LC137:
#	.LC137
.string	"/home/ivanpesnya/my-rars-python-interpreter/test.py"
.LC138:
#	.LC138
.string	"Error opening file: "
.LC139:
#	.LC139
.string	"Error parsing expression: "
.LC140:
#	.LC140
.string	"Parsed expression\n"
.LC141:
#	.LC141
.string	"Error: lhs and rhs are the same\n"
.text
.globl	main
#	main
main:
#	main
.LFB4982:
#	.LFB4982
addi	sp,sp,-640
sd	ra,632(sp)
sd	s0,624(sp)
addi	s0,sp,640
lui	a5,%hi(.LC137)
addi	a5,a5,%lo(.LC137)
sd	a5,-24(s0)
li	a1,0
ld	a0,-24(s0)
call	_ZN8rsyscall9open_fileEPKcl
sd	a0,-32(s0)
ld	a5,-32(s0)
bge	a5,zero,.L391
lui	a5,%hi(.LC138)
addi	a0,a5,%lo(.LC138)
call	_ZN8rsyscall12print_stringEPKc
ld	a0,-24(s0)
call	_ZN8rsyscall12print_stringEPKc
lui	a5,%hi(.LC85)
addi	a0,a5,%lo(.LC85)
call	_ZN8rsyscall12print_stringEPKc
li	a0,1
call	_ZN8rsyscall4exitEl
.L391:
#	.L391
addi	a5,s0,-144
ld	a1,-32(s0)
mv	a0,a5
call	_ZN7lexer_tC2El
addi	a4,s0,-144
addi	a5,s0,-296
mv	a1,a4
mv	a0,a5
call	_ZN8parser_tC2ERK7lexer_t
addi	a5,s0,-400
addi	a4,s0,-296
mv	a1,a4
mv	a0,a5
call	_ZN8parser_t16parse_expressionEv
lbu	a5,-400(s0)
beq	a5,zero,.L392
lui	a5,%hi(.LC139)
addi	a0,a5,%lo(.LC139)
call	_ZN8rsyscall12print_stringEPKc
ld	a5,-392(s0)
mv	a0,a5
call	_ZN8rsyscall12print_stringEPKc
lui	a5,%hi(.LC85)
addi	a0,a5,%lo(.LC85)
call	_ZN8rsyscall12print_stringEPKc
li	a0,1
call	_ZN8rsyscall4exitEl
.L392:
#	.L392
ld	a4,-360(s0)
li	a5,1
bne	a4,a5,.L393
addi	a4,s0,-56
addi	a5,s0,-400
addi	a5,a5,40
mv	a1,a5
mv	a0,a4
call	_ZNK14parsed_token_t9to_stringEv
addi	a5,s0,-56
mv	a0,a5
call	_ZN4rstd6string5c_strEv
mv	a5,a0
mv	a0,a5
call	_ZN8rsyscall12print_stringEPKc
addi	a5,s0,-56
mv	a0,a5
call	_ZN4rstd6stringD2Ev
.L393:
#	.L393
lui	a5,%hi(.LC140)
addi	a0,a5,%lo(.LC140)
call	_ZN8rsyscall12print_stringEPKc
addi	a5,s0,-400
addi	a4,a5,24
addi	a5,s0,-480
mv	a1,a4
mv	a0,a5
call	_ZN10ast_node_tC2ERKS_
ld	a4,-472(s0)
addi	a5,s0,-560
mv	a1,a4
mv	a0,a5
call	_ZN10ast_node_tC2ERKS_
ld	a5,-472(s0)
addi	a4,a5,80
addi	a5,s0,-640
mv	a1,a4
mv	a0,a5
call	_ZN10ast_node_tC2ERKS_
addi	a5,s0,-640
addi	a4,a5,56
addi	a5,s0,-560
addi	a5,a5,56
mv	a1,a4
mv	a0,a5
call	_ZeqRKN4rstd6stringES2_
mv	a5,a0
beq	a5,zero,.L394
lui	a5,%hi(.LC141)
addi	a0,a5,%lo(.LC141)
call	_ZN8rsyscall12print_stringEPKc
li	a0,1
call	_ZN8rsyscall4exitEl
.L394:
#	.L394
lui	a5,%hi(.LC85)
addi	a0,a5,%lo(.LC85)
call	_ZN8rsyscall12print_stringEPKc
ld	a0,-32(s0)
call	_ZN8rsyscall10close_fileEl
li	a0,0
call	_ZN8rsyscall4exitEl
addi	a5,s0,-640
mv	a0,a5
call	_ZN10ast_node_tD2Ev
addi	a5,s0,-560
mv	a0,a5
call	_ZN10ast_node_tD2Ev
addi	a5,s0,-480
mv	a0,a5
call	_ZN10ast_node_tD2Ev
addi	a5,s0,-400
mv	a0,a5
call	_ZN13maybe_error_tD2Ev
addi	a5,s0,-296
mv	a0,a5
call	_ZN8parser_tD2Ev
addi	a5,s0,-144
mv	a0,a5
call	_ZN7lexer_tD2Ev
li	a5,0
mv	a0,a5
ld	ra,632(sp)
ld	s0,624(sp)
addi	sp,sp,640
jr	ra
.LFE4982:
#	.LFE4982
_ZN6memory7memmoveIcEEvPT_S2_m:
#	void memory::memmove<char>(char*, char*, unsigned long)
.LFB5304:
#	.LFB5304
addi	sp,sp,-64
sd	s0,56(sp)
addi	s0,sp,64
sd	a0,-40(s0)
sd	a1,-48(s0)
sd	a2,-56(s0)
sd	zero,-24(s0)
j	.L397
.L398:
#	.L398
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
.L397:
#	.L397
ld	a4,-24(s0)
ld	a5,-56(s0)
bltu	a4,a5,.L398
nop
nop
ld	s0,56(sp)
addi	sp,sp,64
jr	ra
.LFE5304:
#	.LFE5304
_Z41__static_initialization_and_destruction_0v:
#	__static_initialization_and_destruction_0()
.LFB5789:
#	.LFB5789
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
.LFE5789:
#	.LFE5789
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
_GLOBAL__sub_I_TOKEN_NAMES:
#	_GLOBAL__sub_I_TOKEN_NAMES
.LFB5790:
#	.LFB5790
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
.LFE5790:
#	.LFE5790
.dword	_GLOBAL__sub_I_TOKEN_NAMES