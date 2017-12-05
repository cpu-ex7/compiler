.section	".rodata"
.align	8
l.24:	! 0.000000
	.long	0x0
l.22:	! 10.000000
	.long	0x41200000
l.20:	! 1.000000
	.long	0x3f800000
l.18:	! 0.200000
	.long	0x3e4ccccd
.section	".text"
mul.8:
	addi	$v0, $zero, l.18
	lwc1	$f2, 0($v0)
	fcondle	$f2, $f0
	bc1f	bc1t_else.27
	addi	$v0, $zero, l.20
	lwc1	$f2, 0($v0)
	fsub	$f2, $f0, $f2
	fadd	$f1, $f0, $f1
	fmv	$f0, $f2
	j	mul.8
bc1t_else.27:
	fmv	$f0, $f1
	jr	$ra
.global	min_caml_start
min_caml_start:
	addi	$v0, $zero, l.22
	lwc1	$f0, 0($v0)
	addi	$v0, $zero, l.24
	lwc1	$f1, 0($v0)
	sw	$ra, 0($sp)
	jal	mul.8
	lw	$ra, 0($sp)
	sw	$ra, 0($sp)
	jal	min_caml_print_float
	lw	$ra, 0($sp)
	jr	$ra
	hlt
