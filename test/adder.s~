adder11:
	lw	$v1, 8($k0)
	add	$v0, $v1, $v0
	jr	$ra
make_adder5:
	add	$v1, $zero, $at
	addi	$at, $at, 8
	addi	$a0, $zero, adder11
	sw	$a0, 0($v1)
	sw	$v0, 4($v1)
	add	$v0, $zero, $v1
	jr	$ra
min_caml_start:
	addi	$v0, $zero, 3
	sw	$ra, 0($sp)
	jal	make_adder5
	lw	$ra, 0($sp)
	addi	$k0, $v0, 0
	addi	$v0, $zero, 7
	sw	$ra, 0($sp)
	lw	$t9, 0($k0)
	jal	$t9
	lw	$ra, 0($sp)
	sw	$ra, 0($sp)
	jal	min_caml_print_int
	lw	$ra, 0($sp)
	jr	$ra
	hlt
