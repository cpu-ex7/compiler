.section	".rodata"
.align	32
l.107:	! 0.000000
	.long	0x0
l.105:	! 1.000000
	.long	0x3f800000
l.102:	! 1.500000
	.long	0x3fc00000
l.100:	! 400.000000
	.long	0x43c80000
l.98:	! 4.000000
	.long	0x40800000
.section	".text"
dbl.38:
	fadd	$f0, $f0, $f0
	jr	$ra
iloop.54:
	addi	$zero, $v1, 0
	bne	$v0, $v1, beq_else.126
	addi	$zero, $v0, 1
	j	min_caml_print_int
beq_else.126:
	fsub	$f2, $f3, $f2
	fadd	$f2, $f4, $f2
	swc1	$sp, $f4, 0
	sw	$sp, $v0, 1
	swc1	$sp, $f2, 2
	swc1	$sp, $f5, 3
	swc1	$sp, $f1, 4
	sw	$sp, $ra, 5
	jal	dbl.38
	lw	$sp, $ra, 5
	lwc1	$sp, $f1, 4
	fmul	$f0, $f1, $f0
	lwc1	$sp, $f5, 3
	fadd	$f0, $f5, $f1
	lwc1	$sp, $f0, 2
	fmul	$f0, $f0, $f2
	fmul	$f1, $f1, $f3
	fadd	$f2, $f3, $f4
	addi	$zero, $v0, l.98
	lwc1	$v0, $f6, 0
	fcondle	$f4, $f6
	bc1f	bc1t_else.127
	lw	$sp, $v0, 1
	subi	$v0, $v0, 1
	lwc1	$sp, $f4, 0
	j	iloop.54
bc1t_else.127:
	addi	$zero, $v0, 0
	j	min_caml_print_int
xloop.44:
	slti	$v0, $cond, 400
	bne	$zero, $cond, beq_else.128
	jr	$ra
beq_else.128:
	sw	$sp, $v0, 0
	sw	$sp, $v1, 1
	sw	$sp, $ra, 2
	jal	min_caml_float_of_int
	lw	$sp, $ra, 2
	sw	$sp, $ra, 2
	jal	dbl.38
	lw	$sp, $ra, 2
	addi	$zero, $v0, l.100
	lwc1	$v0, $f1, 0
	fdiv	$f0, $f1, $f0
	addi	$zero, $v0, l.102
	lwc1	$v0, $f1, 0
	fsub	$f0, $f1, $f0
	lw	$sp, $v0, 1
	swc1	$sp, $f0, 2
	sw	$sp, $ra, 3
	jal	min_caml_float_of_int
	lw	$sp, $ra, 3
	sw	$sp, $ra, 3
	jal	dbl.38
	lw	$sp, $ra, 3
	addi	$zero, $v0, l.100
	lwc1	$v0, $f1, 0
	fdiv	$f0, $f1, $f0
	addi	$zero, $v0, l.105
	lwc1	$v0, $f1, 0
	fsub	$f0, $f1, $f5
	addi	$zero, $v0, 1000
	addi	$zero, $v1, l.107
	lwc1	$v1, $f0, 0
	addi	$zero, $v1, l.107
	lwc1	$v1, $f1, 0
	addi	$zero, $v1, l.107
	lwc1	$v1, $f2, 0
	addi	$zero, $v1, l.107
	lwc1	$v1, $f3, 0
	lwc1	$sp, $f4, 2
	sw	$sp, $ra, 3
	jal	iloop.54
	lw	$sp, $ra, 3
	lw	$sp, $v0, 0
	addi	$v0, $v0, 1
	lw	$sp, $v1, 1
	j	xloop.44
yloop.40:
	slti	$v0, $cond, 400
	bne	$zero, $cond, beq_else.130
	jr	$ra
beq_else.130:
	addi	$zero, $v1, 0
	sw	$sp, $v0, 0
	addi	$v1, $k0, 0
	addi	$v0, $v1, 0
	addi	$k0, $v0, 0
	sw	$sp, $ra, 1
	jal	xloop.44
	lw	$sp, $ra, 1
	lw	$sp, $v0, 0
	addi	$v0, $v0, 1
	j	yloop.40
.global	min_caml_start
min_caml_start:
	addi	$zero, $v0, 0
	sw	$sp, $ra, 0
	jal	yloop.40
	lw	$sp, $ra, 0
	jr $ra
	hlt
