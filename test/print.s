min_caml_start:
	addi	$v0, $zero, 123
	sw	$ra, 0($sp)
	jal	min_caml_print_int
	lw	$ra, 0($sp)
	addi	$v0, $zero, -456
	sw	$ra, 0($sp)
	jal	min_caml_print_int
	lw	$ra, 0($sp)
	addi	$v0, $zero, 789
	sw	$ra, 0($sp)
	jal	min_caml_print_int
	lw	$ra, 0($sp)
	jr	$ra
	hlt
