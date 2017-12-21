	addi	$sp, $zero, 0
	addi	$sp, $sp, 4
	addi	$at, $sp, 2048
	addi	$k0, $zero, 0
	lui	$k0, 16128
	ori	$k0, $k0, 0
	mfc2	$f29, $k0
	mfc2	$f30, $zero
min_caml_start:
	addi	$v0, $zero, 789
	addi	$k0, $v0, 48
	swc2	$k0
	halt
