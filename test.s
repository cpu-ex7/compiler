l11:
#!3.100000
	addi	$k0, $zero, 0
	lui	$k0, 16454
	ori	$k0, $k0, 26214
	sw	$k0, l11($zero)
l9:
#!2.300000
	addi	$k0, $zero, 0
	lui	$k0, 16403
	ori	$k0, $k0, 13107
	sw	$k0, l9($zero)
	addi	$sp, $zero, l9
	addi	$sp, $sp, 4
	addi	$at, $sp, 2048
	addi	$k0, $zero, 0
	lui	$k0, 16128
	ori	$k0, $k0, 0
	mfc2	$f29, $k0
	mfc2	$f30, $zero
min_caml_start:
	addi	$v0, $zero, l11
	lwc1	$f0, 0($v0)
	sw	$ra, 0($sp)
	addi	$sp, $sp, 4
	jal	f4
	addi	$sp, $sp, -4
	lw	$ra, 0($sp)
	addi	$k0, $v0, 48
	swc2	$k0
	halt
f4:
	addi	$v0, $zero, l9
	lwc1	$f1, 0($v0)
	lef	$f1, $f0
	bc1f	bc1t_else14
	addi	$v0, $zero, 0
	jr	$ra
bc1t_else14:
	addi	$v0, $zero, 1
	jr	$ra
