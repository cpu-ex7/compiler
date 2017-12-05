.section	".rodata"
.align	32
.section	".text"
f.19:
	lw	$k1, $v0, 1
	j	min_caml_print_int
.global	min_caml_start
min_caml_start:
	addi	$zero, $v0, 42
	add	$zero, $at, $k1
	addi	$at, $at, 2
	addi	$zero, $v1, f.19
	sw	$k1, $v1, 0
	sw	$k1, $v0, 1
	addi	$zero, $v0, 1
	addi	$zero, $v1, 2
	addi	$zero, $a0, 3
	addi	$zero, $a1, 4
	addi	$zero, $a2, 5
	addi	$zero, $a3, 6
	addi	$zero, $t0, 7
	addi	$zero, $t1, 8
	addi	$zero, $t2, 9
	addi	$zero, $t3, 10
	addi	$zero, $t4, 11
	addi	$zero, $t5, 12
	addi	$zero, $t6, 13
	addi	$zero, $t7, 14
	addi	$zero, $s0, 15
	addi	$zero, $s1, 16
	addi	$zero, $s2, 17
	sw	$sp, $ra, 0
	lw	$k1, $k0, 0
	jal	$k0
	lw	$sp, $ra, 0
	jr $ra
	hlt
