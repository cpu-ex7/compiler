l107:
#!0.000000
	addi	$k0, $zero, 0
	lui	$k0, 0
	ori	$k0, $k0, 0
	sw	$k0, l107($zero)
l105:
#!1.000000
	addi	$k0, $zero, 0
	lui	$k0, 16256
	ori	$k0, $k0, 0
	sw	$k0, l105($zero)
l102:
#!1.500000
	addi	$k0, $zero, 0
	lui	$k0, 16320
	ori	$k0, $k0, 0
	sw	$k0, l102($zero)
l100:
#!400.000000
	addi	$k0, $zero, 0
	lui	$k0, 17352
	ori	$k0, $k0, 0
	sw	$k0, l100($zero)
l98:
#!4.000000
	addi	$k0, $zero, 0
	lui	$k0, 16512
	ori	$k0, $k0, 0
	sw	$k0, l98($zero)
	addi	$sp, $zero, l98
	addi	$sp, $sp, 4
	addi	$at, $sp, 2048
	addi	$k0, $zero, 0
	lui	$k0, 16128
	ori	$k0, $k0, 0
	mfc2	$f29, $k0
	mfc2	$f30, $zero
min_caml_start:
	addi	$v0, $zero, 0
	sw	$ra, 0($sp)
	addi	$sp, $sp, 4
	jal	yloop40
	addi	$sp, $sp, -4
	lw	$ra, 0($sp)
	halt
dbl38:
	addf	$f0, $f0, $f0
	jr	$ra
iloop54:
	addi	$v1, $zero, 0
	bne	$v0, $v1, beq_else126
	addi	$v0, $zero, 1
	addi	$k0, $v0, 48
	swc2	$k0
	jr	$ra
beq_else126:
	subf	$f2, $f2, $f3
	addf	$f2, $f2, $f4
	swc1	$f4, 0($sp)
	sw	$v0, 4($sp)
	swc1	$f2, 8($sp)
	swc1	$f5, 12($sp)
	swc1	$f1, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	dbl38
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lwc1	$f1, 16($sp)
	mulf	$f0, $f0, $f1
	lwc1	$f5, 12($sp)
	addf	$f1, $f0, $f5
	lwc1	$f0, 8($sp)
	mulf	$f2, $f0, $f0
	mulf	$f3, $f1, $f1
	addf	$f4, $f2, $f3
	addi	$v0, $zero, l98
	lwc1	$f6, 0($v0)
	lef	$f4, $f6
	bc1f	bc1t_else128
	lw	$v0, 4($sp)
	addi	$v0, $v0, -1
	lwc1	$f4, 0($sp)
	j	iloop54
bc1t_else128:
	addi	$v0, $zero, 0
	addi	$k0, $v0, 48
	swc2	$k0
	jr	$ra
xloop44:
	slti	$k1, $v0, 400
	bne	$zero, $k1, beq_else130
	jr	$ra
beq_else130:
	mfc2	$f27, $v0
	cvtsw	$f0, $f27
	sw	$v0, 0($sp)
	sw	$v1, 4($sp)
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	dbl38
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	addi	$v0, $zero, l100
	lwc1	$f1, 0($v0)
	divf	$f0, $f0, $f1
	addi	$v0, $zero, l102
	lwc1	$f1, 0($v0)
	subf	$f0, $f0, $f1
	lw	$v0, 4($sp)
	mfc2	$f27, $v0
	cvtsw	$f1, $f27
	swc1	$f0, 8($sp)
	mvf	$f0, $f1
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	dbl38
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	addi	$v0, $zero, l100
	lwc1	$f1, 0($v0)
	divf	$f0, $f0, $f1
	addi	$v0, $zero, l105
	lwc1	$f1, 0($v0)
	subf	$f5, $f0, $f1
	addi	$v0, $zero, 1000
	addi	$v1, $zero, l107
	lwc1	$f0, 0($v1)
	addi	$v1, $zero, l107
	lwc1	$f1, 0($v1)
	addi	$v1, $zero, l107
	lwc1	$f2, 0($v1)
	addi	$v1, $zero, l107
	lwc1	$f3, 0($v1)
	lwc1	$f4, 8($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	iloop54
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lw	$v0, 0($sp)
	addi	$v0, $v0, 1
	lw	$v1, 4($sp)
	j	xloop44
yloop40:
	slti	$k1, $v0, 400
	bne	$zero, $k1, beq_else132
	jr	$ra
beq_else132:
	addi	$v1, $zero, 0
	sw	$v0, 0($sp)
	addi	$t8, $v1, 0
	addi	$v1, $v0, 0
	addi	$v0, $t8, 0
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	xloop44
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lw	$v0, 0($sp)
	addi	$v0, $v0, 1
	j	yloop40
