	addi	$sp, $zero, 0
	addi	$sp, $sp, 4
	addi	$at, $sp, 2048
	addi	$k0, $zero, 0
	lui	$k0, 16128
	ori	$k0, $k0, 0
	mfc2	$f29, $k0
	mfc2	$f30, $zero
min_caml_start:
	addi	$v0, $zero, 10
	sw	$ra, 0($sp)
	addi	$sp, $sp, 4
	jal	fib10
	addi	$sp, $sp, -4
	lw	$ra, 0($sp)
	addi	$k0, $v0, 48
	swc2	$k0
	halt
fib10:
	sgti	$k1, $v0, 1
	bne	$zero, $k1, beq_else24
	jr	$ra
beq_else24:
	addi	$v1, $v0, -1
	sw	$v0, 0($sp)
	addi	$v0, $v1, 0
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	fib10
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lw	$v1, 0($sp)
	addi	$v1, $v1, -2
	sw	$v0, 4($sp)
	addi	$v0, $v1, 0
	sw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jal	fib10
	addi	$sp, $sp, -12
	lw	$ra, 8($sp)
	lw	$v1, 4($sp)
	add	$v0, $v1, $v0
	jr	$ra
