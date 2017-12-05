.section	".rodata"
.align	32
l.5021:	! 128.000000
	.long	0x43000000
l.5009:	! 40000.000000
	.long	0x471c4000
l.4948:	! -2.000000
	.long	0xc0000000
l.4946:	! 0.100000
	.long	0x3dcccccd
l.4943:	! 0.200000
	.long	0x3e4ccccd
l.4903:	! 20.000000
	.long	0x41a00000
l.4901:	! 0.050000
	.long	0x3d4ccccd
l.4893:	! 0.250000
	.long	0x3e800000
l.4886:	! 255.000000
	.long	0x437f0000
l.4884:	! 3.141593
	.long	0x40490fdb
l.4882:	! 10.000000
	.long	0x41200000
l.4876:	! 850.000000
	.long	0x44548000
l.4872:	! 0.500000
	.long	0x3f000000
l.4870:	! 0.150000
	.long	0x3e19999a
l.4864:	! 9.549296
	.long	0x4118c9eb
l.4862:	! 15.000000
	.long	0x41700000
l.4860:	! 0.000100
	.long	0x38d1b717
l.4807:	! 100000000.000000
	.long	0x4cbebc20
l.4801:	! 1000000000.000000
	.long	0x4e6e6b28
l.4765:	! -0.100000
	.long	0xbdcccccd
l.4749:	! 0.010000
	.long	0x3c23d70a
l.4747:	! -0.200000
	.long	0xbe4ccccd
l.4715:	! 4.000000
	.long	0x40800000
l.4486:	! -200.000000
	.long	0xc3480000
l.4471:	! 0.017453
	.long	0x3c8efa35
l.4469:	! -1.000000
	.long	0xbf800000
l.4467:	! 1.000000
	.long	0x3f800000
l.4465:	! 0.000000
	.long	0x0
l.4440:	! 2.000000
	.long	0x40000000
.section	".text"
xor.1977:
	addi	$zero, $a0, 0
	bne	$v0, $a0, beq_else.5787
	add	$zero, $v1, $v0
	jr	$ra
beq_else.5787:
	addi	$zero, $v0, 0
	bne	$v1, $v0, beq_else.5788
	addi	$zero, $v0, 1
	jr	$ra
beq_else.5788:
	addi	$zero, $v0, 0
	jr	$ra
fsqr.1980:
	fmul	$f0, $f0, $f0
	jr	$ra
fhalf.1982:
	addi	$zero, $v0, l.4440
	lwc1	$v0, $f1, 0
	fdiv	$f0, $f1, $f0
	jr	$ra
o_texturetype.1984:
	lw	$v0, $v0, 0
	jr	$ra
o_form.1986:
	lw	$v0, $v0, 1
	jr	$ra
o_reflectiontype.1988:
	lw	$v0, $v0, 2
	jr	$ra
o_isinvert.1990:
	lw	$v0, $v0, 6
	jr	$ra
o_isrot.1992:
	lw	$v0, $v0, 3
	jr	$ra
o_param_a.1994:
	lw	$v0, $v0, 4
	lwc1	$v0, $f0, 0
	jr	$ra
o_param_b.1996:
	lw	$v0, $v0, 4
	lwc1	$v0, $f0, 1
	jr	$ra
o_param_c.1998:
	lw	$v0, $v0, 4
	lwc1	$v0, $f0, 2
	jr	$ra
o_param_x.2000:
	lw	$v0, $v0, 5
	lwc1	$v0, $f0, 0
	jr	$ra
o_param_y.2002:
	lw	$v0, $v0, 5
	lwc1	$v0, $f0, 1
	jr	$ra
o_param_z.2004:
	lw	$v0, $v0, 5
	lwc1	$v0, $f0, 2
	jr	$ra
o_diffuse.2006:
	lw	$v0, $v0, 7
	lwc1	$v0, $f0, 0
	jr	$ra
o_hilight.2008:
	lw	$v0, $v0, 7
	lwc1	$v0, $f0, 1
	jr	$ra
o_color_red.2010:
	lw	$v0, $v0, 8
	lwc1	$v0, $f0, 0
	jr	$ra
o_color_green.2012:
	lw	$v0, $v0, 8
	lwc1	$v0, $f0, 1
	jr	$ra
o_color_blue.2014:
	lw	$v0, $v0, 8
	lwc1	$v0, $f0, 2
	jr	$ra
o_param_r1.2016:
	lw	$v0, $v0, 9
	lwc1	$v0, $f0, 0
	jr	$ra
o_param_r2.2018:
	lw	$v0, $v0, 9
	lwc1	$v0, $f0, 1
	jr	$ra
o_param_r3.2020:
	lw	$v0, $v0, 9
	lwc1	$v0, $f0, 2
	jr	$ra
normalize_vector.2022:
	lwc1	$v0, $f0, 0
	sw	$sp, $v1, 0
	sw	$sp, $v0, 1
	sw	$sp, $ra, 2
	jal	fsqr.1980
	lw	$sp, $ra, 2
	lw	$sp, $v0, 1
	lwc1	$v0, $f1, 1
	swc1	$sp, $f0, 2
	fmv	$f1, $f0
	sw	$sp, $ra, 3
	jal	fsqr.1980
	lw	$sp, $ra, 3
	lwc1	$sp, $f1, 2
	fadd	$f1, $f0, $f0
	lw	$sp, $v0, 1
	lwc1	$v0, $f1, 2
	swc1	$sp, $f0, 3
	fmv	$f1, $f0
	sw	$sp, $ra, 4
	jal	fsqr.1980
	lw	$sp, $ra, 4
	lwc1	$sp, $f1, 3
	fadd	$f1, $f0, $f0
	sw	$sp, $ra, 4
	jal	min_caml_sqrt
	lw	$sp, $ra, 4
	addi	$zero, $v0, 0
	lw	$sp, $v1, 0
	bne	$v1, $v0, beq_else.5789
	j	beq_cont.5790
beq_else.5789:
	fnegs	$f0, $f0
beq_cont.5790:
	lw	$sp, $v0, 1
	lwc1	$v0, $f1, 0
	fdiv	$f1, $f0, $f1
	swc1	$v0, $f1, 0
	lwc1	$v0, $f1, 1
	fdiv	$f1, $f0, $f1
	swc1	$v0, $f1, 1
	lwc1	$v0, $f1, 2
	fdiv	$f1, $f0, $f0
	swc1	$v0, $f0, 2
	jr	$ra
sgn.2025:
	addi	$zero, $v0, l.4465
	lwc1	$v0, $f1, 0
	fcondle	$f0, $f1
	bc1f	bc1t_else.5792
	addi	$zero, $v0, l.4469
	lwc1	$v0, $f0, 0
	jr	$ra
bc1t_else.5792:
	addi	$zero, $v0, l.4467
	lwc1	$v0, $f0, 0
	jr	$ra
rad.2027:
	addi	$zero, $v0, l.4471
	lwc1	$v0, $f1, 0
	fmul	$f0, $f1, $f0
	jr	$ra
read_environ.2029:
	addi	$zero, $v0, min_caml_screen
	sw	$sp, $v0, 0
	sw	$sp, $ra, 1
	jal	min_caml_read_float
	lw	$sp, $ra, 1
	lw	$sp, $v0, 0
	swc1	$v0, $f0, 0
	addi	$zero, $v0, min_caml_screen
	sw	$sp, $v0, 1
	sw	$sp, $ra, 2
	jal	min_caml_read_float
	lw	$sp, $ra, 2
	lw	$sp, $v0, 1
	swc1	$v0, $f0, 1
	addi	$zero, $v0, min_caml_screen
	sw	$sp, $v0, 2
	sw	$sp, $ra, 3
	jal	min_caml_read_float
	lw	$sp, $ra, 3
	lw	$sp, $v0, 2
	swc1	$v0, $f0, 2
	sw	$sp, $ra, 3
	jal	min_caml_read_float
	lw	$sp, $ra, 3
	sw	$sp, $ra, 3
	jal	rad.2027
	lw	$sp, $ra, 3
	addi	$zero, $v0, min_caml_cos_v
	swc1	$sp, $f0, 3
	sw	$sp, $v0, 4
	sw	$sp, $ra, 5
	jal	min_caml_cos
	lw	$sp, $ra, 5
	lw	$sp, $v0, 4
	swc1	$v0, $f0, 0
	addi	$zero, $v0, min_caml_sin_v
	lwc1	$sp, $f0, 3
	sw	$sp, $v0, 5
	sw	$sp, $ra, 6
	jal	min_caml_sin
	lw	$sp, $ra, 6
	lw	$sp, $v0, 5
	swc1	$v0, $f0, 0
	sw	$sp, $ra, 6
	jal	min_caml_read_float
	lw	$sp, $ra, 6
	sw	$sp, $ra, 6
	jal	rad.2027
	lw	$sp, $ra, 6
	addi	$zero, $v0, min_caml_cos_v
	swc1	$sp, $f0, 6
	sw	$sp, $v0, 7
	sw	$sp, $ra, 8
	jal	min_caml_cos
	lw	$sp, $ra, 8
	lw	$sp, $v0, 7
	swc1	$v0, $f0, 1
	addi	$zero, $v0, min_caml_sin_v
	lwc1	$sp, $f0, 6
	sw	$sp, $v0, 8
	sw	$sp, $ra, 9
	jal	min_caml_sin
	lw	$sp, $ra, 9
	lw	$sp, $v0, 8
	swc1	$v0, $f0, 1
	sw	$sp, $ra, 9
	jal	min_caml_read_float
	lw	$sp, $ra, 9
	sw	$sp, $ra, 9
	jal	min_caml_read_float
	lw	$sp, $ra, 9
	sw	$sp, $ra, 9
	jal	rad.2027
	lw	$sp, $ra, 9
	swc1	$sp, $f0, 9
	sw	$sp, $ra, 10
	jal	min_caml_sin
	lw	$sp, $ra, 10
	addi	$zero, $v0, min_caml_light
	fnegs	$f0, $f0
	swc1	$v0, $f0, 1
	sw	$sp, $ra, 10
	jal	min_caml_read_float
	lw	$sp, $ra, 10
	sw	$sp, $ra, 10
	jal	rad.2027
	lw	$sp, $ra, 10
	lwc1	$sp, $f1, 9
	swc1	$sp, $f0, 10
	fmv	$f1, $f0
	sw	$sp, $ra, 11
	jal	min_caml_cos
	lw	$sp, $ra, 11
	lwc1	$sp, $f1, 10
	swc1	$sp, $f0, 11
	fmv	$f1, $f0
	sw	$sp, $ra, 12
	jal	min_caml_sin
	lw	$sp, $ra, 12
	addi	$zero, $v0, min_caml_light
	lwc1	$sp, $f1, 11
	fmul	$f1, $f0, $f0
	swc1	$v0, $f0, 0
	lwc1	$sp, $f0, 10
	sw	$sp, $ra, 12
	jal	min_caml_cos
	lw	$sp, $ra, 12
	addi	$zero, $v0, min_caml_light
	lwc1	$sp, $f1, 11
	fmul	$f1, $f0, $f0
	swc1	$v0, $f0, 2
	addi	$zero, $v0, min_caml_beam
	sw	$sp, $v0, 12
	sw	$sp, $ra, 13
	jal	min_caml_read_float
	lw	$sp, $ra, 13
	lw	$sp, $v0, 12
	swc1	$v0, $f0, 0
	addi	$zero, $v0, min_caml_vp
	addi	$zero, $v1, min_caml_cos_v
	lwc1	$v1, $f0, 0
	addi	$zero, $v1, min_caml_sin_v
	lwc1	$v1, $f1, 1
	fmul	$f0, $f1, $f0
	addi	$zero, $v1, l.4486
	lwc1	$v1, $f1, 0
	fmul	$f0, $f1, $f0
	swc1	$v0, $f0, 0
	addi	$zero, $v0, min_caml_vp
	addi	$zero, $v1, min_caml_sin_v
	lwc1	$v1, $f0, 0
	fnegs	$f0, $f0
	addi	$zero, $v1, l.4486
	lwc1	$v1, $f1, 0
	fmul	$f0, $f1, $f0
	swc1	$v0, $f0, 1
	addi	$zero, $v0, min_caml_vp
	addi	$zero, $v1, min_caml_cos_v
	lwc1	$v1, $f0, 0
	addi	$zero, $v1, min_caml_cos_v
	lwc1	$v1, $f1, 1
	fmul	$f0, $f1, $f0
	addi	$zero, $v1, l.4486
	lwc1	$v1, $f1, 0
	fmul	$f0, $f1, $f0
	swc1	$v0, $f0, 2
	addi	$zero, $v0, min_caml_view
	addi	$zero, $v1, min_caml_vp
	lwc1	$v1, $f0, 0
	addi	$zero, $v1, min_caml_screen
	lwc1	$v1, $f1, 0
	fadd	$f0, $f1, $f0
	swc1	$v0, $f0, 0
	addi	$zero, $v0, min_caml_view
	addi	$zero, $v1, min_caml_vp
	lwc1	$v1, $f0, 1
	addi	$zero, $v1, min_caml_screen
	lwc1	$v1, $f1, 1
	fadd	$f0, $f1, $f0
	swc1	$v0, $f0, 1
	addi	$zero, $v0, min_caml_view
	addi	$zero, $v1, min_caml_vp
	lwc1	$v1, $f0, 2
	addi	$zero, $v1, min_caml_screen
	lwc1	$v1, $f1, 2
	fadd	$f0, $f1, $f0
	swc1	$v0, $f0, 2
	jr	$ra
read_nth_object.2031:
	sw	$sp, $v0, 0
	sw	$sp, $ra, 1
	jal	min_caml_read_int
	lw	$sp, $ra, 1
	addi	$zero, $v1, -1
	bne	$v0, $v1, beq_else.5794
	addi	$zero, $v0, 0
	jr	$ra
beq_else.5794:
	sw	$sp, $v0, 1
	sw	$sp, $ra, 2
	jal	min_caml_read_int
	lw	$sp, $ra, 2
	sw	$sp, $v0, 2
	sw	$sp, $ra, 3
	jal	min_caml_read_int
	lw	$sp, $ra, 3
	sw	$sp, $v0, 3
	sw	$sp, $ra, 4
	jal	min_caml_read_int
	lw	$sp, $ra, 4
	addi	$zero, $v1, 3
	addi	$zero, $a0, l.4465
	lwc1	$a0, $f0, 0
	sw	$sp, $v0, 4
	addi	$v1, $v0, 0
	sw	$sp, $ra, 5
	jal	min_caml_create_float_array
	lw	$sp, $ra, 5
	sw	$sp, $v0, 5
	sw	$sp, $ra, 6
	jal	min_caml_read_float
	lw	$sp, $ra, 6
	lw	$sp, $v0, 5
	swc1	$v0, $f0, 0
	sw	$sp, $ra, 6
	jal	min_caml_read_float
	lw	$sp, $ra, 6
	lw	$sp, $v0, 5
	swc1	$v0, $f0, 1
	sw	$sp, $ra, 6
	jal	min_caml_read_float
	lw	$sp, $ra, 6
	lw	$sp, $v0, 5
	swc1	$v0, $f0, 2
	addi	$zero, $v1, 3
	addi	$zero, $a0, l.4465
	lwc1	$a0, $f0, 0
	addi	$v1, $v0, 0
	sw	$sp, $ra, 6
	jal	min_caml_create_float_array
	lw	$sp, $ra, 6
	sw	$sp, $v0, 6
	sw	$sp, $ra, 7
	jal	min_caml_read_float
	lw	$sp, $ra, 7
	lw	$sp, $v0, 6
	swc1	$v0, $f0, 0
	sw	$sp, $ra, 7
	jal	min_caml_read_float
	lw	$sp, $ra, 7
	lw	$sp, $v0, 6
	swc1	$v0, $f0, 1
	sw	$sp, $ra, 7
	jal	min_caml_read_float
	lw	$sp, $ra, 7
	lw	$sp, $v0, 6
	swc1	$v0, $f0, 2
	addi	$zero, $v1, l.4465
	lwc1	$v1, $f0, 0
	swc1	$sp, $f0, 7
	sw	$sp, $ra, 8
	jal	min_caml_read_float
	lw	$sp, $ra, 8
	lwc1	$sp, $f1, 7
	fcondle	$f1, $f0
	bc1f	bc1t_else.5795
	addi	$zero, $v0, 0
	j	bc1t_cont.5796
bc1t_else.5795:
	addi	$zero, $v0, 1
bc1t_cont.5796:
	addi	$zero, $v1, 2
	addi	$zero, $a0, l.4465
	lwc1	$a0, $f0, 0
	sw	$sp, $v0, 8
	addi	$v1, $v0, 0
	sw	$sp, $ra, 9
	jal	min_caml_create_float_array
	lw	$sp, $ra, 9
	sw	$sp, $v0, 9
	sw	$sp, $ra, 10
	jal	min_caml_read_float
	lw	$sp, $ra, 10
	lw	$sp, $v0, 9
	swc1	$v0, $f0, 0
	sw	$sp, $ra, 10
	jal	min_caml_read_float
	lw	$sp, $ra, 10
	lw	$sp, $v0, 9
	swc1	$v0, $f0, 1
	addi	$zero, $v1, 3
	addi	$zero, $a0, l.4465
	lwc1	$a0, $f0, 0
	addi	$v1, $v0, 0
	sw	$sp, $ra, 10
	jal	min_caml_create_float_array
	lw	$sp, $ra, 10
	sw	$sp, $v0, 10
	sw	$sp, $ra, 11
	jal	min_caml_read_float
	lw	$sp, $ra, 11
	lw	$sp, $v0, 10
	swc1	$v0, $f0, 0
	sw	$sp, $ra, 11
	jal	min_caml_read_float
	lw	$sp, $ra, 11
	lw	$sp, $v0, 10
	swc1	$v0, $f0, 1
	sw	$sp, $ra, 11
	jal	min_caml_read_float
	lw	$sp, $ra, 11
	lw	$sp, $v0, 10
	swc1	$v0, $f0, 2
	addi	$zero, $v1, 3
	addi	$zero, $a0, l.4465
	lwc1	$a0, $f0, 0
	addi	$v1, $v0, 0
	sw	$sp, $ra, 11
	jal	min_caml_create_float_array
	lw	$sp, $ra, 11
	addi	$zero, $v1, 0
	lw	$sp, $a0, 4
	bne	$a0, $v1, beq_else.5797
	j	beq_cont.5798
beq_else.5797:
	sw	$sp, $v0, 11
	sw	$sp, $ra, 12
	jal	min_caml_read_float
	lw	$sp, $ra, 12
	sw	$sp, $ra, 12
	jal	rad.2027
	lw	$sp, $ra, 12
	lw	$sp, $v0, 11
	swc1	$v0, $f0, 0
	sw	$sp, $ra, 12
	jal	min_caml_read_float
	lw	$sp, $ra, 12
	sw	$sp, $ra, 12
	jal	rad.2027
	lw	$sp, $ra, 12
	lw	$sp, $v0, 11
	swc1	$v0, $f0, 1
	sw	$sp, $ra, 12
	jal	min_caml_read_float
	lw	$sp, $ra, 12
	sw	$sp, $ra, 12
	jal	rad.2027
	lw	$sp, $ra, 12
	lw	$sp, $v0, 11
	swc1	$v0, $f0, 2
beq_cont.5798:
	addi	$zero, $v1, 2
	lw	$sp, $a0, 2
	bne	$a0, $v1, beq_else.5799
	addi	$zero, $v1, 1
	j	beq_cont.5800
beq_else.5799:
	lw	$sp, $v1, 8
beq_cont.5800:
	add	$zero, $at, $a1
	addi	$at, $at, 10
	sw	$a1, $v0, 9
	lw	$sp, $a2, 10
	sw	$a1, $a2, 8
	lw	$sp, $a2, 9
	sw	$a1, $a2, 7
	sw	$a1, $v1, 6
	lw	$sp, $v1, 6
	sw	$a1, $v1, 5
	lw	$sp, $v1, 5
	sw	$a1, $v1, 4
	lw	$sp, $a2, 4
	sw	$a1, $a2, 3
	lw	$sp, $a3, 3
	sw	$a1, $a3, 2
	sw	$a1, $a0, 1
	lw	$sp, $a3, 1
	sw	$a1, $a3, 0
	addi	$zero, $a3, min_caml_objects
	lw	$sp, $t0, 0
	sll	$t0, $t0, 0
	sw	$a3, $a1, $t0
	addi	$zero, $a1, 3
	sw	$sp, $v0, 11
	bne	$a0, $a1, beq_else.5801
	lwc1	$v1, $f0, 0
	addi	$zero, $a0, l.4465
	lwc1	$a0, $f1, 0
	fcondeq	$f1, $f0
	bc1f	bc1t_else.5803
	addi	$zero, $a0, l.4465
	lwc1	$a0, $f0, 0
	j	bc1t_cont.5804
bc1t_else.5803:
	swc1	$sp, $f0, 12
	sw	$sp, $ra, 13
	jal	sgn.2025
	lw	$sp, $ra, 13
	lwc1	$sp, $f1, 12
	swc1	$sp, $f0, 13
	fmv	$f1, $f0
	sw	$sp, $ra, 14
	jal	fsqr.1980
	lw	$sp, $ra, 14
	lwc1	$sp, $f1, 13
	fdiv	$f1, $f0, $f0
bc1t_cont.5804:
	lw	$sp, $v0, 5
	swc1	$v0, $f0, 0
	lwc1	$v0, $f0, 1
	addi	$zero, $v1, l.4465
	lwc1	$v1, $f1, 0
	fcondeq	$f1, $f0
	bc1f	bc1t_else.5805
	addi	$zero, $v1, l.4465
	lwc1	$v1, $f0, 0
	j	bc1t_cont.5806
bc1t_else.5805:
	swc1	$sp, $f0, 14
	sw	$sp, $ra, 15
	jal	sgn.2025
	lw	$sp, $ra, 15
	lwc1	$sp, $f1, 14
	swc1	$sp, $f0, 15
	fmv	$f1, $f0
	sw	$sp, $ra, 16
	jal	fsqr.1980
	lw	$sp, $ra, 16
	lwc1	$sp, $f1, 15
	fdiv	$f1, $f0, $f0
bc1t_cont.5806:
	lw	$sp, $v0, 5
	swc1	$v0, $f0, 1
	lwc1	$v0, $f0, 2
	addi	$zero, $v1, l.4465
	lwc1	$v1, $f1, 0
	fcondeq	$f1, $f0
	bc1f	bc1t_else.5807
	addi	$zero, $v1, l.4465
	lwc1	$v1, $f0, 0
	j	bc1t_cont.5808
bc1t_else.5807:
	swc1	$sp, $f0, 16
	sw	$sp, $ra, 17
	jal	sgn.2025
	lw	$sp, $ra, 17
	lwc1	$sp, $f1, 16
	swc1	$sp, $f0, 17
	fmv	$f1, $f0
	sw	$sp, $ra, 18
	jal	fsqr.1980
	lw	$sp, $ra, 18
	lwc1	$sp, $f1, 17
	fdiv	$f1, $f0, $f0
bc1t_cont.5808:
	lw	$sp, $v0, 5
	swc1	$v0, $f0, 2
	j	beq_cont.5802
beq_else.5801:
	addi	$zero, $a1, 2
	bne	$a0, $a1, beq_else.5809
	addi	$zero, $a0, 0
	lw	$sp, $a1, 8
	bne	$a1, $a0, beq_else.5811
	addi	$zero, $a0, 1
	j	beq_cont.5812
beq_else.5811:
	addi	$zero, $a0, 0
beq_cont.5812:
	addi	$v1, $v0, 0
	addi	$a0, $v1, 0
	sw	$sp, $ra, 18
	jal	normalize_vector.2022
	lw	$sp, $ra, 18
	j	beq_cont.5810
beq_else.5809:
beq_cont.5810:
beq_cont.5802:
	addi	$zero, $v0, 0
	lw	$sp, $v1, 4
	bne	$v1, $v0, beq_else.5813
	j	beq_cont.5814
beq_else.5813:
	addi	$zero, $v0, min_caml_cs_temp
	lw	$sp, $v1, 11
	lwc1	$v1, $f0, 0
	sw	$sp, $v0, 18
	sw	$sp, $ra, 19
	jal	min_caml_cos
	lw	$sp, $ra, 19
	lw	$sp, $v0, 18
	swc1	$v0, $f0, 10
	addi	$zero, $v0, min_caml_cs_temp
	lw	$sp, $v1, 11
	lwc1	$v1, $f0, 0
	sw	$sp, $v0, 19
	sw	$sp, $ra, 20
	jal	min_caml_sin
	lw	$sp, $ra, 20
	lw	$sp, $v0, 19
	swc1	$v0, $f0, 11
	addi	$zero, $v0, min_caml_cs_temp
	lw	$sp, $v1, 11
	lwc1	$v1, $f0, 1
	sw	$sp, $v0, 20
	sw	$sp, $ra, 21
	jal	min_caml_cos
	lw	$sp, $ra, 21
	lw	$sp, $v0, 20
	swc1	$v0, $f0, 12
	addi	$zero, $v0, min_caml_cs_temp
	lw	$sp, $v1, 11
	lwc1	$v1, $f0, 1
	sw	$sp, $v0, 21
	sw	$sp, $ra, 22
	jal	min_caml_sin
	lw	$sp, $ra, 22
	lw	$sp, $v0, 21
	swc1	$v0, $f0, 13
	addi	$zero, $v0, min_caml_cs_temp
	lw	$sp, $v1, 11
	lwc1	$v1, $f0, 2
	sw	$sp, $v0, 22
	sw	$sp, $ra, 23
	jal	min_caml_cos
	lw	$sp, $ra, 23
	lw	$sp, $v0, 22
	swc1	$v0, $f0, 14
	addi	$zero, $v0, min_caml_cs_temp
	lw	$sp, $v1, 11
	lwc1	$v1, $f0, 2
	sw	$sp, $v0, 23
	sw	$sp, $ra, 24
	jal	min_caml_sin
	lw	$sp, $ra, 24
	lw	$sp, $v0, 23
	swc1	$v0, $f0, 15
	addi	$zero, $v0, min_caml_cs_temp
	addi	$zero, $v1, min_caml_cs_temp
	lwc1	$v1, $f0, 12
	addi	$zero, $v1, min_caml_cs_temp
	lwc1	$v1, $f1, 14
	fmul	$f0, $f1, $f0
	swc1	$v0, $f0, 0
	addi	$zero, $v0, min_caml_cs_temp
	addi	$zero, $v1, min_caml_cs_temp
	lwc1	$v1, $f0, 11
	addi	$zero, $v1, min_caml_cs_temp
	lwc1	$v1, $f1, 13
	fmul	$f0, $f1, $f0
	addi	$zero, $v1, min_caml_cs_temp
	lwc1	$v1, $f1, 14
	fmul	$f0, $f1, $f0
	addi	$zero, $v1, min_caml_cs_temp
	lwc1	$v1, $f1, 10
	addi	$zero, $v1, min_caml_cs_temp
	lwc1	$v1, $f2, 15
	fmul	$f1, $f2, $f1
	fsub	$f0, $f1, $f0
	swc1	$v0, $f0, 1
	addi	$zero, $v0, min_caml_cs_temp
	addi	$zero, $v1, min_caml_cs_temp
	lwc1	$v1, $f0, 10
	addi	$zero, $v1, min_caml_cs_temp
	lwc1	$v1, $f1, 13
	fmul	$f0, $f1, $f0
	addi	$zero, $v1, min_caml_cs_temp
	lwc1	$v1, $f1, 14
	fmul	$f0, $f1, $f0
	addi	$zero, $v1, min_caml_cs_temp
	lwc1	$v1, $f1, 11
	addi	$zero, $v1, min_caml_cs_temp
	lwc1	$v1, $f2, 15
	fmul	$f1, $f2, $f1
	fadd	$f0, $f1, $f0
	swc1	$v0, $f0, 2
	addi	$zero, $v0, min_caml_cs_temp
	addi	$zero, $v1, min_caml_cs_temp
	lwc1	$v1, $f0, 12
	addi	$zero, $v1, min_caml_cs_temp
	lwc1	$v1, $f1, 15
	fmul	$f0, $f1, $f0
	swc1	$v0, $f0, 3
	addi	$zero, $v0, min_caml_cs_temp
	addi	$zero, $v1, min_caml_cs_temp
	lwc1	$v1, $f0, 11
	addi	$zero, $v1, min_caml_cs_temp
	lwc1	$v1, $f1, 13
	fmul	$f0, $f1, $f0
	addi	$zero, $v1, min_caml_cs_temp
	lwc1	$v1, $f1, 15
	fmul	$f0, $f1, $f0
	addi	$zero, $v1, min_caml_cs_temp
	lwc1	$v1, $f1, 10
	addi	$zero, $v1, min_caml_cs_temp
	lwc1	$v1, $f2, 14
	fmul	$f1, $f2, $f1
	fadd	$f0, $f1, $f0
	swc1	$v0, $f0, 4
	addi	$zero, $v0, min_caml_cs_temp
	addi	$zero, $v1, min_caml_cs_temp
	lwc1	$v1, $f0, 10
	addi	$zero, $v1, min_caml_cs_temp
	lwc1	$v1, $f1, 13
	fmul	$f0, $f1, $f0
	addi	$zero, $v1, min_caml_cs_temp
	lwc1	$v1, $f1, 15
	fmul	$f0, $f1, $f0
	addi	$zero, $v1, min_caml_cs_temp
	lwc1	$v1, $f1, 11
	addi	$zero, $v1, min_caml_cs_temp
	lwc1	$v1, $f2, 14
	fmul	$f1, $f2, $f1
	fsub	$f0, $f1, $f0
	swc1	$v0, $f0, 5
	addi	$zero, $v0, min_caml_cs_temp
	addi	$zero, $v1, min_caml_cs_temp
	lwc1	$v1, $f0, 13
	fnegs	$f0, $f0
	swc1	$v0, $f0, 6
	addi	$zero, $v0, min_caml_cs_temp
	addi	$zero, $v1, min_caml_cs_temp
	lwc1	$v1, $f0, 11
	addi	$zero, $v1, min_caml_cs_temp
	lwc1	$v1, $f1, 12
	fmul	$f0, $f1, $f0
	swc1	$v0, $f0, 7
	addi	$zero, $v0, min_caml_cs_temp
	addi	$zero, $v1, min_caml_cs_temp
	lwc1	$v1, $f0, 10
	addi	$zero, $v1, min_caml_cs_temp
	lwc1	$v1, $f1, 12
	fmul	$f0, $f1, $f0
	swc1	$v0, $f0, 8
	lw	$sp, $v0, 5
	lwc1	$v0, $f0, 0
	lwc1	$v0, $f1, 1
	lwc1	$v0, $f2, 2
	addi	$zero, $v1, min_caml_cs_temp
	lwc1	$v1, $f3, 0
	swc1	$sp, $f2, 24
	swc1	$sp, $f1, 25
	swc1	$sp, $f0, 26
	fmv	$f3, $f0
	sw	$sp, $ra, 27
	jal	fsqr.1980
	lw	$sp, $ra, 27
	lwc1	$sp, $f1, 26
	fmul	$f1, $f0, $f0
	addi	$zero, $v0, min_caml_cs_temp
	lwc1	$v0, $f2, 3
	swc1	$sp, $f0, 27
	fmv	$f2, $f0
	sw	$sp, $ra, 28
	jal	fsqr.1980
	lw	$sp, $ra, 28
	lwc1	$sp, $f1, 25
	fmul	$f1, $f0, $f0
	lwc1	$sp, $f2, 27
	fadd	$f2, $f0, $f0
	addi	$zero, $v0, min_caml_cs_temp
	lwc1	$v0, $f2, 6
	swc1	$sp, $f0, 28
	fmv	$f2, $f0
	sw	$sp, $ra, 29
	jal	fsqr.1980
	lw	$sp, $ra, 29
	lwc1	$sp, $f1, 24
	fmul	$f1, $f0, $f0
	lwc1	$sp, $f2, 28
	fadd	$f2, $f0, $f0
	lw	$sp, $v0, 5
	swc1	$v0, $f0, 0
	addi	$zero, $v1, min_caml_cs_temp
	lwc1	$v1, $f0, 1
	sw	$sp, $ra, 29
	jal	fsqr.1980
	lw	$sp, $ra, 29
	lwc1	$sp, $f1, 26
	fmul	$f1, $f0, $f0
	addi	$zero, $v0, min_caml_cs_temp
	lwc1	$v0, $f2, 4
	swc1	$sp, $f0, 29
	fmv	$f2, $f0
	sw	$sp, $ra, 30
	jal	fsqr.1980
	lw	$sp, $ra, 30
	lwc1	$sp, $f1, 25
	fmul	$f1, $f0, $f0
	lwc1	$sp, $f2, 29
	fadd	$f2, $f0, $f0
	addi	$zero, $v0, min_caml_cs_temp
	lwc1	$v0, $f2, 7
	swc1	$sp, $f0, 30
	fmv	$f2, $f0
	sw	$sp, $ra, 31
	jal	fsqr.1980
	lw	$sp, $ra, 31
	lwc1	$sp, $f1, 24
	fmul	$f1, $f0, $f0
	lwc1	$sp, $f2, 30
	fadd	$f2, $f0, $f0
	lw	$sp, $v0, 5
	swc1	$v0, $f0, 1
	addi	$zero, $v1, min_caml_cs_temp
	lwc1	$v1, $f0, 2
	sw	$sp, $ra, 31
	jal	fsqr.1980
	lw	$sp, $ra, 31
	lwc1	$sp, $f1, 26
	fmul	$f1, $f0, $f0
	addi	$zero, $v0, min_caml_cs_temp
	lwc1	$v0, $f2, 5
	swc1	$sp, $f0, 31
	fmv	$f2, $f0
	sw	$sp, $ra, 32
	jal	fsqr.1980
	lw	$sp, $ra, 32
	lwc1	$sp, $f1, 25
	fmul	$f1, $f0, $f0
	lwc1	$sp, $f2, 31
	fadd	$f2, $f0, $f0
	addi	$zero, $v0, min_caml_cs_temp
	lwc1	$v0, $f2, 8
	swc1	$sp, $f0, 32
	fmv	$f2, $f0
	sw	$sp, $ra, 33
	jal	fsqr.1980
	lw	$sp, $ra, 33
	lwc1	$sp, $f1, 24
	fmul	$f1, $f0, $f0
	lwc1	$sp, $f2, 32
	fadd	$f2, $f0, $f0
	lw	$sp, $v0, 5
	swc1	$v0, $f0, 2
	addi	$zero, $v0, l.4440
	lwc1	$v0, $f0, 0
	addi	$zero, $v0, min_caml_cs_temp
	lwc1	$v0, $f2, 1
	lwc1	$sp, $f3, 26
	fmul	$f3, $f2, $f2
	addi	$zero, $v0, min_caml_cs_temp
	lwc1	$v0, $f4, 2
	fmul	$f2, $f4, $f2
	addi	$zero, $v0, min_caml_cs_temp
	lwc1	$v0, $f4, 4
	lwc1	$sp, $f5, 25
	fmul	$f5, $f4, $f4
	addi	$zero, $v0, min_caml_cs_temp
	lwc1	$v0, $f6, 5
	fmul	$f4, $f6, $f4
	fadd	$f2, $f4, $f2
	addi	$zero, $v0, min_caml_cs_temp
	lwc1	$v0, $f4, 7
	fmul	$f1, $f4, $f4
	addi	$zero, $v0, min_caml_cs_temp
	lwc1	$v0, $f6, 8
	fmul	$f4, $f6, $f4
	fadd	$f2, $f4, $f2
	fmul	$f0, $f2, $f0
	lw	$sp, $v0, 11
	swc1	$v0, $f0, 0
	addi	$zero, $v1, l.4440
	lwc1	$v1, $f0, 0
	addi	$zero, $v1, min_caml_cs_temp
	lwc1	$v1, $f2, 0
	fmul	$f3, $f2, $f2
	addi	$zero, $v1, min_caml_cs_temp
	lwc1	$v1, $f4, 2
	fmul	$f2, $f4, $f2
	addi	$zero, $v1, min_caml_cs_temp
	lwc1	$v1, $f4, 3
	fmul	$f5, $f4, $f4
	addi	$zero, $v1, min_caml_cs_temp
	lwc1	$v1, $f6, 5
	fmul	$f4, $f6, $f4
	fadd	$f2, $f4, $f2
	addi	$zero, $v1, min_caml_cs_temp
	lwc1	$v1, $f4, 6
	fmul	$f1, $f4, $f4
	addi	$zero, $v1, min_caml_cs_temp
	lwc1	$v1, $f6, 8
	fmul	$f4, $f6, $f4
	fadd	$f2, $f4, $f2
	fmul	$f0, $f2, $f0
	swc1	$v0, $f0, 1
	addi	$zero, $v1, l.4440
	lwc1	$v1, $f0, 0
	addi	$zero, $v1, min_caml_cs_temp
	lwc1	$v1, $f2, 0
	fmul	$f3, $f2, $f2
	addi	$zero, $v1, min_caml_cs_temp
	lwc1	$v1, $f3, 1
	fmul	$f2, $f3, $f2
	addi	$zero, $v1, min_caml_cs_temp
	lwc1	$v1, $f3, 3
	fmul	$f5, $f3, $f3
	addi	$zero, $v1, min_caml_cs_temp
	lwc1	$v1, $f4, 4
	fmul	$f3, $f4, $f3
	fadd	$f2, $f3, $f2
	addi	$zero, $v1, min_caml_cs_temp
	lwc1	$v1, $f3, 6
	fmul	$f1, $f3, $f1
	addi	$zero, $v1, min_caml_cs_temp
	lwc1	$v1, $f3, 7
	fmul	$f1, $f3, $f1
	fadd	$f2, $f1, $f1
	fmul	$f0, $f1, $f0
	swc1	$v0, $f0, 2
beq_cont.5814:
	addi	$zero, $v0, 1
	jr	$ra
read_object.2033:
	slti	$v0, $cond, 61
	bne	$zero, $cond, beq_else.5815
	jr	$ra
beq_else.5815:
	sw	$sp, $v0, 0
	sw	$sp, $ra, 1
	jal	read_nth_object.2031
	lw	$sp, $ra, 1
	addi	$zero, $v1, 0
	bne	$v0, $v1, beq_else.5817
	jr	$ra
beq_else.5817:
	lw	$sp, $v0, 0
	addi	$v0, $v0, 1
	j	read_object.2033
read_all_object.2035:
	addi	$zero, $v0, 0
	j	read_object.2033
read_net_item.2037:
	sw	$sp, $v0, 0
	sw	$sp, $ra, 1
	jal	min_caml_read_int
	lw	$sp, $ra, 1
	addi	$zero, $v1, -1
	bne	$v0, $v1, beq_else.5819
	lw	$sp, $v0, 0
	addi	$v0, $v0, 1
	addi	$zero, $v1, -1
	j	min_caml_create_array
beq_else.5819:
	lw	$sp, $v1, 0
	addi	$v1, $a0, 1
	sw	$sp, $v0, 1
	addi	$a0, $v0, 0
	sw	$sp, $ra, 2
	jal	read_net_item.2037
	lw	$sp, $ra, 2
	lw	$sp, $v1, 0
	sll	$v1, $v1, 0
	lw	$sp, $a0, 1
	sw	$v0, $a0, $v1
	jr	$ra
read_or_network.2039:
	addi	$zero, $v1, 0
	sw	$sp, $v0, 0
	addi	$v1, $v0, 0
	sw	$sp, $ra, 1
	jal	read_net_item.2037
	lw	$sp, $ra, 1
	addi	$v0, $v1, 0
	lw	$v1, $v0, 0
	addi	$zero, $a0, -1
	bne	$v0, $a0, beq_else.5820
	lw	$sp, $v0, 0
	addi	$v0, $v0, 1
	j	min_caml_create_array
beq_else.5820:
	lw	$sp, $v0, 0
	addi	$v0, $a0, 1
	sw	$sp, $v1, 1
	addi	$a0, $v0, 0
	sw	$sp, $ra, 2
	jal	read_or_network.2039
	lw	$sp, $ra, 2
	lw	$sp, $v1, 0
	sll	$v1, $v1, 0
	lw	$sp, $a0, 1
	sw	$v0, $a0, $v1
	jr	$ra
read_and_network.2041:
	addi	$zero, $v1, 0
	sw	$sp, $v0, 0
	addi	$v1, $v0, 0
	sw	$sp, $ra, 1
	jal	read_net_item.2037
	lw	$sp, $ra, 1
	lw	$v0, $v1, 0
	addi	$zero, $a0, -1
	bne	$v1, $a0, beq_else.5821
	jr	$ra
beq_else.5821:
	addi	$zero, $v1, min_caml_and_net
	lw	$sp, $a0, 0
	sll	$a0, $a1, 0
	sw	$v1, $v0, $a1
	addi	$a0, $v0, 1
	j	read_and_network.2041
read_parameter.2043:
	sw	$sp, $ra, 0
	jal	read_environ.2029
	lw	$sp, $ra, 0
	sw	$sp, $ra, 0
	jal	read_all_object.2035
	lw	$sp, $ra, 0
	addi	$zero, $v0, 0
	sw	$sp, $ra, 0
	jal	read_and_network.2041
	lw	$sp, $ra, 0
	addi	$zero, $v0, min_caml_or_net
	addi	$zero, $v1, 0
	sw	$sp, $v0, 0
	addi	$v1, $v0, 0
	sw	$sp, $ra, 1
	jal	read_or_network.2039
	lw	$sp, $ra, 1
	lw	$sp, $v1, 0
	sw	$v1, $v0, 0
	jr	$ra
solver_rect.2045:
	addi	$zero, $a0, l.4465
	lwc1	$a0, $f0, 0
	lwc1	$v1, $f1, 0
	sw	$sp, $v0, 0
	sw	$sp, $v1, 1
	fcondeq	$f0, $f1
	bc1f	bc1t_else.5824
	addi	$zero, $v0, 0
	j	bc1t_cont.5825
bc1t_else.5824:
	sw	$sp, $ra, 2
	jal	o_isinvert.1990
	lw	$sp, $ra, 2
	addi	$zero, $v1, l.4465
	lwc1	$v1, $f0, 0
	lw	$sp, $v1, 1
	lwc1	$v1, $f1, 0
	fcondle	$f0, $f1
	bc1f	bc1t_else.5826
	addi	$zero, $a0, 0
	j	bc1t_cont.5827
bc1t_else.5826:
	addi	$zero, $a0, 1
bc1t_cont.5827:
	addi	$a0, $v1, 0
	sw	$sp, $ra, 2
	jal	xor.1977
	lw	$sp, $ra, 2
	addi	$zero, $v1, 0
	bne	$v0, $v1, beq_else.5828
	lw	$sp, $v0, 0
	sw	$sp, $ra, 2
	jal	o_param_a.1994
	lw	$sp, $ra, 2
	fnegs	$f0, $f0
	j	beq_cont.5829
beq_else.5828:
	lw	$sp, $v0, 0
	sw	$sp, $ra, 2
	jal	o_param_a.1994
	lw	$sp, $ra, 2
beq_cont.5829:
	addi	$zero, $v0, min_caml_solver_w_vec
	lwc1	$v0, $f1, 0
	fsub	$f0, $f1, $f0
	lw	$sp, $v0, 1
	lwc1	$v0, $f1, 0
	fdiv	$f0, $f1, $f0
	lw	$sp, $v1, 0
	swc1	$sp, $f0, 2
	addi	$v1, $v0, 0
	sw	$sp, $ra, 3
	jal	o_param_b.1996
	lw	$sp, $ra, 3
	lw	$sp, $v0, 1
	lwc1	$v0, $f1, 1
	lwc1	$sp, $f2, 2
	fmul	$f2, $f1, $f1
	addi	$zero, $v1, min_caml_solver_w_vec
	lwc1	$v1, $f3, 1
	fadd	$f1, $f3, $f1
	swc1	$sp, $f0, 3
	fmv	$f1, $f0
	sw	$sp, $ra, 4
	jal	min_caml_abs_float
	lw	$sp, $ra, 4
	lwc1	$sp, $f1, 3
	fcondle	$f1, $f0
	bc1f	bc1t_else.5830
	addi	$zero, $v0, 0
	j	bc1t_cont.5831
bc1t_else.5830:
	lw	$sp, $v0, 0
	sw	$sp, $ra, 4
	jal	o_param_c.1998
	lw	$sp, $ra, 4
	lw	$sp, $v0, 1
	lwc1	$v0, $f1, 2
	lwc1	$sp, $f2, 2
	fmul	$f2, $f1, $f1
	addi	$zero, $v1, min_caml_solver_w_vec
	lwc1	$v1, $f3, 2
	fadd	$f1, $f3, $f1
	swc1	$sp, $f0, 4
	fmv	$f1, $f0
	sw	$sp, $ra, 5
	jal	min_caml_abs_float
	lw	$sp, $ra, 5
	lwc1	$sp, $f1, 4
	fcondle	$f1, $f0
	bc1f	bc1t_else.5832
	addi	$zero, $v0, 0
	j	bc1t_cont.5833
bc1t_else.5832:
	addi	$zero, $v0, min_caml_solver_dist
	lwc1	$sp, $f0, 2
	swc1	$v0, $f0, 0
	addi	$zero, $v0, 1
bc1t_cont.5833:
bc1t_cont.5831:
bc1t_cont.5825:
	addi	$zero, $v1, 0
	bne	$v0, $v1, beq_else.5834
	addi	$zero, $v0, l.4465
	lwc1	$v0, $f0, 0
	lw	$sp, $v0, 1
	lwc1	$v0, $f1, 1
	fcondeq	$f0, $f1
	bc1f	bc1t_else.5835
	addi	$zero, $v0, 0
	j	bc1t_cont.5836
bc1t_else.5835:
	lw	$sp, $v1, 0
	addi	$v1, $v0, 0
	sw	$sp, $ra, 5
	jal	o_isinvert.1990
	lw	$sp, $ra, 5
	addi	$zero, $v1, l.4465
	lwc1	$v1, $f0, 0
	lw	$sp, $v1, 1
	lwc1	$v1, $f1, 1
	fcondle	$f0, $f1
	bc1f	bc1t_else.5837
	addi	$zero, $a0, 0
	j	bc1t_cont.5838
bc1t_else.5837:
	addi	$zero, $a0, 1
bc1t_cont.5838:
	addi	$a0, $v1, 0
	sw	$sp, $ra, 5
	jal	xor.1977
	lw	$sp, $ra, 5
	addi	$zero, $v1, 0
	bne	$v0, $v1, beq_else.5839
	lw	$sp, $v0, 0
	sw	$sp, $ra, 5
	jal	o_param_b.1996
	lw	$sp, $ra, 5
	fnegs	$f0, $f0
	j	beq_cont.5840
beq_else.5839:
	lw	$sp, $v0, 0
	sw	$sp, $ra, 5
	jal	o_param_b.1996
	lw	$sp, $ra, 5
beq_cont.5840:
	addi	$zero, $v0, min_caml_solver_w_vec
	lwc1	$v0, $f1, 1
	fsub	$f0, $f1, $f0
	lw	$sp, $v0, 1
	lwc1	$v0, $f1, 1
	fdiv	$f0, $f1, $f0
	lw	$sp, $v1, 0
	swc1	$sp, $f0, 5
	addi	$v1, $v0, 0
	sw	$sp, $ra, 6
	jal	o_param_c.1998
	lw	$sp, $ra, 6
	lw	$sp, $v0, 1
	lwc1	$v0, $f1, 2
	lwc1	$sp, $f2, 5
	fmul	$f2, $f1, $f1
	addi	$zero, $v1, min_caml_solver_w_vec
	lwc1	$v1, $f3, 2
	fadd	$f1, $f3, $f1
	swc1	$sp, $f0, 6
	fmv	$f1, $f0
	sw	$sp, $ra, 7
	jal	min_caml_abs_float
	lw	$sp, $ra, 7
	lwc1	$sp, $f1, 6
	fcondle	$f1, $f0
	bc1f	bc1t_else.5841
	addi	$zero, $v0, 0
	j	bc1t_cont.5842
bc1t_else.5841:
	lw	$sp, $v0, 0
	sw	$sp, $ra, 7
	jal	o_param_a.1994
	lw	$sp, $ra, 7
	lw	$sp, $v0, 1
	lwc1	$v0, $f1, 0
	lwc1	$sp, $f2, 5
	fmul	$f2, $f1, $f1
	addi	$zero, $v1, min_caml_solver_w_vec
	lwc1	$v1, $f3, 0
	fadd	$f1, $f3, $f1
	swc1	$sp, $f0, 7
	fmv	$f1, $f0
	sw	$sp, $ra, 8
	jal	min_caml_abs_float
	lw	$sp, $ra, 8
	lwc1	$sp, $f1, 7
	fcondle	$f1, $f0
	bc1f	bc1t_else.5843
	addi	$zero, $v0, 0
	j	bc1t_cont.5844
bc1t_else.5843:
	addi	$zero, $v0, min_caml_solver_dist
	lwc1	$sp, $f0, 5
	swc1	$v0, $f0, 0
	addi	$zero, $v0, 1
bc1t_cont.5844:
bc1t_cont.5842:
bc1t_cont.5836:
	addi	$zero, $v1, 0
	bne	$v0, $v1, beq_else.5845
	addi	$zero, $v0, l.4465
	lwc1	$v0, $f0, 0
	lw	$sp, $v0, 1
	lwc1	$v0, $f1, 2
	fcondeq	$f0, $f1
	bc1f	bc1t_else.5846
	addi	$zero, $v0, 0
	j	bc1t_cont.5847
bc1t_else.5846:
	lw	$sp, $v1, 0
	addi	$v1, $v0, 0
	sw	$sp, $ra, 8
	jal	o_isinvert.1990
	lw	$sp, $ra, 8
	addi	$zero, $v1, l.4465
	lwc1	$v1, $f0, 0
	lw	$sp, $v1, 1
	lwc1	$v1, $f1, 2
	fcondle	$f0, $f1
	bc1f	bc1t_else.5848
	addi	$zero, $a0, 0
	j	bc1t_cont.5849
bc1t_else.5848:
	addi	$zero, $a0, 1
bc1t_cont.5849:
	addi	$a0, $v1, 0
	sw	$sp, $ra, 8
	jal	xor.1977
	lw	$sp, $ra, 8
	addi	$zero, $v1, 0
	bne	$v0, $v1, beq_else.5850
	lw	$sp, $v0, 0
	sw	$sp, $ra, 8
	jal	o_param_c.1998
	lw	$sp, $ra, 8
	fnegs	$f0, $f0
	j	beq_cont.5851
beq_else.5850:
	lw	$sp, $v0, 0
	sw	$sp, $ra, 8
	jal	o_param_c.1998
	lw	$sp, $ra, 8
beq_cont.5851:
	addi	$zero, $v0, min_caml_solver_w_vec
	lwc1	$v0, $f1, 2
	fsub	$f0, $f1, $f0
	lw	$sp, $v0, 1
	lwc1	$v0, $f1, 2
	fdiv	$f0, $f1, $f0
	lw	$sp, $v1, 0
	swc1	$sp, $f0, 8
	addi	$v1, $v0, 0
	sw	$sp, $ra, 9
	jal	o_param_a.1994
	lw	$sp, $ra, 9
	lw	$sp, $v0, 1
	lwc1	$v0, $f1, 0
	lwc1	$sp, $f2, 8
	fmul	$f2, $f1, $f1
	addi	$zero, $v1, min_caml_solver_w_vec
	lwc1	$v1, $f3, 0
	fadd	$f1, $f3, $f1
	swc1	$sp, $f0, 9
	fmv	$f1, $f0
	sw	$sp, $ra, 10
	jal	min_caml_abs_float
	lw	$sp, $ra, 10
	lwc1	$sp, $f1, 9
	fcondle	$f1, $f0
	bc1f	bc1t_else.5852
	addi	$zero, $v0, 0
	j	bc1t_cont.5853
bc1t_else.5852:
	lw	$sp, $v0, 0
	sw	$sp, $ra, 10
	jal	o_param_b.1996
	lw	$sp, $ra, 10
	lw	$sp, $v0, 1
	lwc1	$v0, $f1, 1
	lwc1	$sp, $f2, 8
	fmul	$f2, $f1, $f1
	addi	$zero, $v0, min_caml_solver_w_vec
	lwc1	$v0, $f3, 1
	fadd	$f1, $f3, $f1
	swc1	$sp, $f0, 10
	fmv	$f1, $f0
	sw	$sp, $ra, 11
	jal	min_caml_abs_float
	lw	$sp, $ra, 11
	lwc1	$sp, $f1, 10
	fcondle	$f1, $f0
	bc1f	bc1t_else.5854
	addi	$zero, $v0, 0
	j	bc1t_cont.5855
bc1t_else.5854:
	addi	$zero, $v0, min_caml_solver_dist
	lwc1	$sp, $f0, 8
	swc1	$v0, $f0, 0
	addi	$zero, $v0, 1
bc1t_cont.5855:
bc1t_cont.5853:
bc1t_cont.5847:
	addi	$zero, $v1, 0
	bne	$v0, $v1, beq_else.5856
	addi	$zero, $v0, 0
	jr	$ra
beq_else.5856:
	addi	$zero, $v0, 3
	jr	$ra
beq_else.5845:
	addi	$zero, $v0, 2
	jr	$ra
beq_else.5834:
	addi	$zero, $v0, 1
	jr	$ra
solver_surface.2048:
	lwc1	$v1, $f0, 0
	sw	$sp, $v0, 0
	sw	$sp, $v1, 1
	swc1	$sp, $f0, 2
	sw	$sp, $ra, 3
	jal	o_param_a.1994
	lw	$sp, $ra, 3
	lwc1	$sp, $f1, 2
	fmul	$f1, $f0, $f0
	lw	$sp, $v0, 1
	lwc1	$v0, $f1, 1
	lw	$sp, $v1, 0
	swc1	$sp, $f0, 3
	swc1	$sp, $f1, 4
	addi	$v1, $v0, 0
	sw	$sp, $ra, 5
	jal	o_param_b.1996
	lw	$sp, $ra, 5
	lwc1	$sp, $f1, 4
	fmul	$f1, $f0, $f0
	lwc1	$sp, $f1, 3
	fadd	$f1, $f0, $f0
	lw	$sp, $v0, 1
	lwc1	$v0, $f1, 2
	lw	$sp, $v0, 0
	swc1	$sp, $f0, 5
	swc1	$sp, $f1, 6
	sw	$sp, $ra, 7
	jal	o_param_c.1998
	lw	$sp, $ra, 7
	lwc1	$sp, $f1, 6
	fmul	$f1, $f0, $f0
	lwc1	$sp, $f1, 5
	fadd	$f1, $f0, $f0
	addi	$zero, $v0, l.4465
	lwc1	$v0, $f1, 0
	fcondle	$f0, $f1
	bc1f	bc1t_else.5857
	addi	$zero, $v0, 0
	jr	$ra
bc1t_else.5857:
	addi	$zero, $v0, min_caml_solver_w_vec
	lwc1	$v0, $f1, 0
	lw	$sp, $v0, 0
	swc1	$sp, $f0, 7
	swc1	$sp, $f1, 8
	sw	$sp, $ra, 9
	jal	o_param_a.1994
	lw	$sp, $ra, 9
	lwc1	$sp, $f1, 8
	fmul	$f1, $f0, $f0
	addi	$zero, $v0, min_caml_solver_w_vec
	lwc1	$v0, $f1, 1
	lw	$sp, $v0, 0
	swc1	$sp, $f0, 9
	swc1	$sp, $f1, 10
	sw	$sp, $ra, 11
	jal	o_param_b.1996
	lw	$sp, $ra, 11
	lwc1	$sp, $f1, 10
	fmul	$f1, $f0, $f0
	lwc1	$sp, $f1, 9
	fadd	$f1, $f0, $f0
	addi	$zero, $v0, min_caml_solver_w_vec
	lwc1	$v0, $f1, 2
	lw	$sp, $v0, 0
	swc1	$sp, $f0, 11
	swc1	$sp, $f1, 12
	sw	$sp, $ra, 13
	jal	o_param_c.1998
	lw	$sp, $ra, 13
	lwc1	$sp, $f1, 12
	fmul	$f1, $f0, $f0
	lwc1	$sp, $f1, 11
	fadd	$f1, $f0, $f0
	lwc1	$sp, $f1, 7
	fdiv	$f0, $f1, $f0
	addi	$zero, $v0, min_caml_solver_dist
	fnegs	$f0, $f0
	swc1	$v0, $f0, 0
	addi	$zero, $v0, 1
	jr	$ra
in_prod_sqr_obj.2051:
	lwc1	$v1, $f0, 0
	sw	$sp, $v1, 0
	sw	$sp, $v0, 1
	sw	$sp, $ra, 2
	jal	fsqr.1980
	lw	$sp, $ra, 2
	lw	$sp, $v0, 1
	swc1	$sp, $f0, 2
	sw	$sp, $ra, 3
	jal	o_param_a.1994
	lw	$sp, $ra, 3
	lwc1	$sp, $f1, 2
	fmul	$f1, $f0, $f0
	lw	$sp, $v0, 0
	lwc1	$v0, $f1, 1
	swc1	$sp, $f0, 3
	fmv	$f1, $f0
	sw	$sp, $ra, 4
	jal	fsqr.1980
	lw	$sp, $ra, 4
	lw	$sp, $v0, 1
	swc1	$sp, $f0, 4
	sw	$sp, $ra, 5
	jal	o_param_b.1996
	lw	$sp, $ra, 5
	lwc1	$sp, $f1, 4
	fmul	$f1, $f0, $f0
	lwc1	$sp, $f1, 3
	fadd	$f1, $f0, $f0
	lw	$sp, $v0, 0
	lwc1	$v0, $f1, 2
	swc1	$sp, $f0, 5
	fmv	$f1, $f0
	sw	$sp, $ra, 6
	jal	fsqr.1980
	lw	$sp, $ra, 6
	lw	$sp, $v0, 1
	swc1	$sp, $f0, 6
	sw	$sp, $ra, 7
	jal	o_param_c.1998
	lw	$sp, $ra, 7
	lwc1	$sp, $f1, 6
	fmul	$f1, $f0, $f0
	lwc1	$sp, $f1, 5
	fadd	$f1, $f0, $f0
	jr	$ra
in_prod_co_objrot.2054:
	lwc1	$v1, $f0, 1
	lwc1	$v1, $f1, 2
	fmul	$f0, $f1, $f0
	sw	$sp, $v0, 0
	sw	$sp, $v1, 1
	swc1	$sp, $f0, 2
	sw	$sp, $ra, 3
	jal	o_param_r1.2016
	lw	$sp, $ra, 3
	lwc1	$sp, $f1, 2
	fmul	$f1, $f0, $f0
	lw	$sp, $v0, 1
	lwc1	$v0, $f1, 0
	lwc1	$v0, $f2, 2
	fmul	$f1, $f2, $f1
	lw	$sp, $v1, 0
	swc1	$sp, $f0, 3
	swc1	$sp, $f1, 4
	addi	$v1, $v0, 0
	sw	$sp, $ra, 5
	jal	o_param_r2.2018
	lw	$sp, $ra, 5
	lwc1	$sp, $f1, 4
	fmul	$f1, $f0, $f0
	lwc1	$sp, $f1, 3
	fadd	$f1, $f0, $f0
	lw	$sp, $v0, 1
	lwc1	$v0, $f1, 0
	lwc1	$v0, $f2, 1
	fmul	$f1, $f2, $f1
	lw	$sp, $v0, 0
	swc1	$sp, $f0, 5
	swc1	$sp, $f1, 6
	sw	$sp, $ra, 7
	jal	o_param_r3.2020
	lw	$sp, $ra, 7
	lwc1	$sp, $f1, 6
	fmul	$f1, $f0, $f0
	lwc1	$sp, $f1, 5
	fadd	$f1, $f0, $f0
	jr	$ra
solver2nd_mul_b.2057:
	addi	$zero, $a0, min_caml_solver_w_vec
	lwc1	$a0, $f0, 0
	lwc1	$v1, $f1, 0
	fmul	$f0, $f1, $f0
	sw	$sp, $v0, 0
	sw	$sp, $v1, 1
	swc1	$sp, $f0, 2
	sw	$sp, $ra, 3
	jal	o_param_a.1994
	lw	$sp, $ra, 3
	lwc1	$sp, $f1, 2
	fmul	$f1, $f0, $f0
	addi	$zero, $v0, min_caml_solver_w_vec
	lwc1	$v0, $f1, 1
	lw	$sp, $v0, 1
	lwc1	$v0, $f2, 1
	fmul	$f1, $f2, $f1
	lw	$sp, $v1, 0
	swc1	$sp, $f0, 3
	swc1	$sp, $f1, 4
	addi	$v1, $v0, 0
	sw	$sp, $ra, 5
	jal	o_param_b.1996
	lw	$sp, $ra, 5
	lwc1	$sp, $f1, 4
	fmul	$f1, $f0, $f0
	lwc1	$sp, $f1, 3
	fadd	$f1, $f0, $f0
	addi	$zero, $v0, min_caml_solver_w_vec
	lwc1	$v0, $f1, 2
	lw	$sp, $v0, 1
	lwc1	$v0, $f2, 2
	fmul	$f1, $f2, $f1
	lw	$sp, $v0, 0
	swc1	$sp, $f0, 5
	swc1	$sp, $f1, 6
	sw	$sp, $ra, 7
	jal	o_param_c.1998
	lw	$sp, $ra, 7
	lwc1	$sp, $f1, 6
	fmul	$f1, $f0, $f0
	lwc1	$sp, $f1, 5
	fadd	$f1, $f0, $f0
	jr	$ra
solver2nd_rot_b.2060:
	addi	$zero, $a0, min_caml_solver_w_vec
	lwc1	$a0, $f0, 2
	lwc1	$v1, $f1, 1
	fmul	$f0, $f1, $f0
	addi	$zero, $a0, min_caml_solver_w_vec
	lwc1	$a0, $f1, 1
	lwc1	$v1, $f2, 2
	fmul	$f1, $f2, $f1
	fadd	$f0, $f1, $f0
	sw	$sp, $v0, 0
	sw	$sp, $v1, 1
	swc1	$sp, $f0, 2
	sw	$sp, $ra, 3
	jal	o_param_r1.2016
	lw	$sp, $ra, 3
	lwc1	$sp, $f1, 2
	fmul	$f1, $f0, $f0
	addi	$zero, $v0, min_caml_solver_w_vec
	lwc1	$v0, $f1, 0
	lw	$sp, $v0, 1
	lwc1	$v0, $f2, 2
	fmul	$f1, $f2, $f1
	addi	$zero, $v1, min_caml_solver_w_vec
	lwc1	$v1, $f2, 2
	lwc1	$v0, $f3, 0
	fmul	$f2, $f3, $f2
	fadd	$f1, $f2, $f1
	lw	$sp, $v1, 0
	swc1	$sp, $f0, 3
	swc1	$sp, $f1, 4
	addi	$v1, $v0, 0
	sw	$sp, $ra, 5
	jal	o_param_r2.2018
	lw	$sp, $ra, 5
	lwc1	$sp, $f1, 4
	fmul	$f1, $f0, $f0
	lwc1	$sp, $f1, 3
	fadd	$f1, $f0, $f0
	addi	$zero, $v0, min_caml_solver_w_vec
	lwc1	$v0, $f1, 0
	lw	$sp, $v0, 1
	lwc1	$v0, $f2, 1
	fmul	$f1, $f2, $f1
	addi	$zero, $v1, min_caml_solver_w_vec
	lwc1	$v1, $f2, 1
	lwc1	$v0, $f3, 0
	fmul	$f2, $f3, $f2
	fadd	$f1, $f2, $f1
	lw	$sp, $v0, 0
	swc1	$sp, $f0, 5
	swc1	$sp, $f1, 6
	sw	$sp, $ra, 7
	jal	o_param_r3.2020
	lw	$sp, $ra, 7
	lwc1	$sp, $f1, 6
	fmul	$f1, $f0, $f0
	lwc1	$sp, $f1, 5
	fadd	$f1, $f0, $f0
	jr	$ra
solver_second.2063:
	sw	$sp, $v1, 0
	sw	$sp, $v0, 1
	sw	$sp, $ra, 2
	jal	in_prod_sqr_obj.2051
	lw	$sp, $ra, 2
	lw	$sp, $v0, 1
	swc1	$sp, $f0, 2
	sw	$sp, $ra, 3
	jal	o_isrot.1992
	lw	$sp, $ra, 3
	addi	$zero, $v1, 0
	bne	$v0, $v1, beq_else.5858
	lwc1	$sp, $f0, 2
	j	beq_cont.5859
beq_else.5858:
	lw	$sp, $v0, 1
	lw	$sp, $v1, 0
	sw	$sp, $ra, 3
	jal	in_prod_co_objrot.2054
	lw	$sp, $ra, 3
	lwc1	$sp, $f1, 2
	fadd	$f1, $f0, $f0
beq_cont.5859:
	addi	$zero, $v0, l.4465
	lwc1	$v0, $f1, 0
	fcondeq	$f1, $f0
	bc1f	bc1t_else.5860
	addi	$zero, $v0, 0
	jr	$ra
bc1t_else.5860:
	addi	$zero, $v0, l.4440
	lwc1	$v0, $f1, 0
	lw	$sp, $v0, 1
	lw	$sp, $v1, 0
	swc1	$sp, $f0, 3
	swc1	$sp, $f1, 4
	sw	$sp, $ra, 5
	jal	solver2nd_mul_b.2057
	lw	$sp, $ra, 5
	lwc1	$sp, $f1, 4
	fmul	$f1, $f0, $f0
	lw	$sp, $v0, 1
	swc1	$sp, $f0, 5
	sw	$sp, $ra, 6
	jal	o_isrot.1992
	lw	$sp, $ra, 6
	addi	$zero, $v1, 0
	bne	$v0, $v1, beq_else.5861
	lwc1	$sp, $f0, 5
	j	beq_cont.5862
beq_else.5861:
	lw	$sp, $v0, 1
	lw	$sp, $v1, 0
	sw	$sp, $ra, 6
	jal	solver2nd_rot_b.2060
	lw	$sp, $ra, 6
	lwc1	$sp, $f1, 5
	fadd	$f1, $f0, $f0
beq_cont.5862:
	addi	$zero, $v1, min_caml_solver_w_vec
	lw	$sp, $v0, 1
	swc1	$sp, $f0, 6
	sw	$sp, $ra, 7
	jal	in_prod_sqr_obj.2051
	lw	$sp, $ra, 7
	lw	$sp, $v0, 1
	swc1	$sp, $f0, 7
	sw	$sp, $ra, 8
	jal	o_isrot.1992
	lw	$sp, $ra, 8
	addi	$zero, $v1, 0
	bne	$v0, $v1, beq_else.5863
	lwc1	$sp, $f0, 7
	j	beq_cont.5864
beq_else.5863:
	addi	$zero, $v1, min_caml_solver_w_vec
	lw	$sp, $v0, 1
	sw	$sp, $ra, 8
	jal	in_prod_co_objrot.2054
	lw	$sp, $ra, 8
	lwc1	$sp, $f1, 7
	fadd	$f1, $f0, $f0
beq_cont.5864:
	lw	$sp, $v0, 1
	swc1	$sp, $f0, 8
	sw	$sp, $ra, 9
	jal	o_form.1986
	lw	$sp, $ra, 9
	addi	$zero, $v1, 3
	bne	$v0, $v1, beq_else.5865
	addi	$zero, $v0, l.4467
	lwc1	$v0, $f0, 0
	lwc1	$sp, $f1, 8
	fsub	$f1, $f0, $f0
	j	beq_cont.5866
beq_else.5865:
	lwc1	$sp, $f0, 8
beq_cont.5866:
	addi	$zero, $v0, l.4715
	lwc1	$v0, $f1, 0
	lwc1	$sp, $f2, 3
	fmul	$f1, $f2, $f1
	fmul	$f1, $f0, $f0
	lwc1	$sp, $f1, 6
	swc1	$sp, $f0, 9
	fmv	$f1, $f0
	sw	$sp, $ra, 10
	jal	fsqr.1980
	lw	$sp, $ra, 10
	lwc1	$sp, $f1, 9
	fsub	$f0, $f1, $f0
	addi	$zero, $v0, l.4465
	lwc1	$v0, $f1, 0
	fcondle	$f0, $f1
	bc1f	bc1t_else.5867
	addi	$zero, $v0, 0
	jr	$ra
bc1t_else.5867:
	sw	$sp, $ra, 10
	jal	min_caml_sqrt
	lw	$sp, $ra, 10
	lw	$sp, $v0, 1
	swc1	$sp, $f0, 10
	sw	$sp, $ra, 11
	jal	o_isinvert.1990
	lw	$sp, $ra, 11
	addi	$zero, $v1, 0
	bne	$v0, $v1, beq_else.5868
	lwc1	$sp, $f0, 10
	fnegs	$f0, $f0
	j	beq_cont.5869
beq_else.5868:
	lwc1	$sp, $f0, 10
beq_cont.5869:
	addi	$zero, $v0, min_caml_solver_dist
	lwc1	$sp, $f1, 6
	fsub	$f0, $f1, $f0
	addi	$zero, $v1, l.4440
	lwc1	$v1, $f1, 0
	fdiv	$f0, $f1, $f0
	lwc1	$sp, $f1, 3
	fdiv	$f0, $f1, $f0
	swc1	$v0, $f0, 0
	addi	$zero, $v0, 1
	jr	$ra
solver.2066:
	addi	$zero, $a1, min_caml_objects
	sll	$v0, $v0, 0
	lw	$a1, $v0, $v0
	addi	$zero, $a1, min_caml_solver_w_vec
	lwc1	$a0, $f0, 0
	sw	$sp, $v1, 0
	sw	$sp, $v0, 1
	sw	$sp, $a0, 2
	sw	$sp, $a1, 3
	swc1	$sp, $f0, 4
	sw	$sp, $ra, 5
	jal	o_param_x.2000
	lw	$sp, $ra, 5
	lwc1	$sp, $f1, 4
	fsub	$f1, $f0, $f0
	lw	$sp, $v0, 3
	swc1	$v0, $f0, 0
	addi	$zero, $v0, min_caml_solver_w_vec
	lw	$sp, $v1, 2
	lwc1	$v1, $f0, 1
	lw	$sp, $a0, 1
	sw	$sp, $v0, 5
	swc1	$sp, $f0, 6
	addi	$a0, $v0, 0
	sw	$sp, $ra, 7
	jal	o_param_y.2002
	lw	$sp, $ra, 7
	lwc1	$sp, $f1, 6
	fsub	$f1, $f0, $f0
	lw	$sp, $v0, 5
	swc1	$v0, $f0, 1
	addi	$zero, $v0, min_caml_solver_w_vec
	lw	$sp, $v1, 2
	lwc1	$v1, $f0, 2
	lw	$sp, $v1, 1
	sw	$sp, $v0, 7
	swc1	$sp, $f0, 8
	addi	$v1, $v0, 0
	sw	$sp, $ra, 9
	jal	o_param_z.2004
	lw	$sp, $ra, 9
	lwc1	$sp, $f1, 8
	fsub	$f1, $f0, $f0
	lw	$sp, $v0, 7
	swc1	$v0, $f0, 2
	lw	$sp, $v0, 1
	sw	$sp, $ra, 9
	jal	o_form.1986
	lw	$sp, $ra, 9
	addi	$zero, $v1, 1
	bne	$v0, $v1, beq_else.5870
	lw	$sp, $v0, 1
	lw	$sp, $v1, 0
	j	solver_rect.2045
beq_else.5870:
	addi	$zero, $v1, 2
	bne	$v0, $v1, beq_else.5871
	lw	$sp, $v0, 1
	lw	$sp, $v1, 0
	j	solver_surface.2048
beq_else.5871:
	lw	$sp, $v0, 1
	lw	$sp, $v1, 0
	j	solver_second.2063
is_rect_outside.2070:
	sw	$sp, $v0, 0
	sw	$sp, $ra, 1
	jal	o_param_a.1994
	lw	$sp, $ra, 1
	addi	$zero, $v0, min_caml_isoutside_q
	lwc1	$v0, $f1, 0
	swc1	$sp, $f0, 1
	fmv	$f1, $f0
	sw	$sp, $ra, 2
	jal	min_caml_abs_float
	lw	$sp, $ra, 2
	lwc1	$sp, $f1, 1
	fcondle	$f1, $f0
	bc1f	bc1t_else.5872
	addi	$zero, $v0, 0
	j	bc1t_cont.5873
bc1t_else.5872:
	lw	$sp, $v0, 0
	sw	$sp, $ra, 2
	jal	o_param_b.1996
	lw	$sp, $ra, 2
	addi	$zero, $v0, min_caml_isoutside_q
	lwc1	$v0, $f1, 1
	swc1	$sp, $f0, 2
	fmv	$f1, $f0
	sw	$sp, $ra, 3
	jal	min_caml_abs_float
	lw	$sp, $ra, 3
	lwc1	$sp, $f1, 2
	fcondle	$f1, $f0
	bc1f	bc1t_else.5874
	addi	$zero, $v0, 0
	j	bc1t_cont.5875
bc1t_else.5874:
	lw	$sp, $v0, 0
	sw	$sp, $ra, 3
	jal	o_param_c.1998
	lw	$sp, $ra, 3
	addi	$zero, $v0, min_caml_isoutside_q
	lwc1	$v0, $f1, 2
	swc1	$sp, $f0, 3
	fmv	$f1, $f0
	sw	$sp, $ra, 4
	jal	min_caml_abs_float
	lw	$sp, $ra, 4
	lwc1	$sp, $f1, 3
	fcondle	$f1, $f0
	bc1f	bc1t_else.5876
	addi	$zero, $v0, 0
	j	bc1t_cont.5877
bc1t_else.5876:
	addi	$zero, $v0, 1
bc1t_cont.5877:
bc1t_cont.5875:
bc1t_cont.5873:
	addi	$zero, $v1, 0
	bne	$v0, $v1, beq_else.5878
	lw	$sp, $v0, 0
	sw	$sp, $ra, 4
	jal	o_isinvert.1990
	lw	$sp, $ra, 4
	addi	$zero, $v1, 0
	bne	$v0, $v1, beq_else.5879
	addi	$zero, $v0, 1
	jr	$ra
beq_else.5879:
	addi	$zero, $v0, 0
	jr	$ra
beq_else.5878:
	lw	$sp, $v0, 0
	j	o_isinvert.1990
is_plane_outside.2072:
	sw	$sp, $v0, 0
	sw	$sp, $ra, 1
	jal	o_param_a.1994
	lw	$sp, $ra, 1
	addi	$zero, $v0, min_caml_isoutside_q
	lwc1	$v0, $f1, 0
	fmul	$f0, $f1, $f0
	lw	$sp, $v0, 0
	swc1	$sp, $f0, 1
	sw	$sp, $ra, 2
	jal	o_param_b.1996
	lw	$sp, $ra, 2
	addi	$zero, $v0, min_caml_isoutside_q
	lwc1	$v0, $f1, 1
	fmul	$f0, $f1, $f0
	lwc1	$sp, $f1, 1
	fadd	$f1, $f0, $f0
	lw	$sp, $v0, 0
	swc1	$sp, $f0, 2
	sw	$sp, $ra, 3
	jal	o_param_c.1998
	lw	$sp, $ra, 3
	addi	$zero, $v0, min_caml_isoutside_q
	lwc1	$v0, $f1, 2
	fmul	$f0, $f1, $f0
	lwc1	$sp, $f1, 2
	fadd	$f1, $f0, $f0
	addi	$zero, $v0, l.4465
	lwc1	$v0, $f1, 0
	fcondle	$f1, $f0
	bc1f	bc1t_else.5880
	addi	$zero, $v0, 0
	j	bc1t_cont.5881
bc1t_else.5880:
	addi	$zero, $v0, 1
bc1t_cont.5881:
	lw	$sp, $v1, 0
	sw	$sp, $v0, 3
	addi	$v1, $v0, 0
	sw	$sp, $ra, 4
	jal	o_isinvert.1990
	lw	$sp, $ra, 4
	lw	$sp, $v1, 3
	sw	$sp, $ra, 4
	jal	xor.1977
	lw	$sp, $ra, 4
	addi	$zero, $v1, 0
	bne	$v0, $v1, beq_else.5882
	addi	$zero, $v0, 1
	jr	$ra
beq_else.5882:
	addi	$zero, $v0, 0
	jr	$ra
is_second_outside.2074:
	addi	$zero, $v1, min_caml_isoutside_q
	sw	$sp, $v0, 0
	sw	$sp, $ra, 1
	jal	in_prod_sqr_obj.2051
	lw	$sp, $ra, 1
	lw	$sp, $v0, 0
	swc1	$sp, $f0, 1
	sw	$sp, $ra, 2
	jal	o_form.1986
	lw	$sp, $ra, 2
	addi	$zero, $v1, 3
	bne	$v0, $v1, beq_else.5883
	addi	$zero, $v0, l.4467
	lwc1	$v0, $f0, 0
	lwc1	$sp, $f1, 1
	fsub	$f1, $f0, $f0
	j	beq_cont.5884
beq_else.5883:
	lwc1	$sp, $f0, 1
beq_cont.5884:
	lw	$sp, $v0, 0
	swc1	$sp, $f0, 2
	sw	$sp, $ra, 3
	jal	o_isrot.1992
	lw	$sp, $ra, 3
	addi	$zero, $v1, 0
	bne	$v0, $v1, beq_else.5885
	lwc1	$sp, $f0, 2
	j	beq_cont.5886
beq_else.5885:
	addi	$zero, $v1, min_caml_isoutside_q
	lw	$sp, $v0, 0
	sw	$sp, $ra, 3
	jal	in_prod_co_objrot.2054
	lw	$sp, $ra, 3
	lwc1	$sp, $f1, 2
	fadd	$f1, $f0, $f0
beq_cont.5886:
	addi	$zero, $v0, l.4465
	lwc1	$v0, $f1, 0
	fcondle	$f1, $f0
	bc1f	bc1t_else.5887
	addi	$zero, $v0, 0
	j	bc1t_cont.5888
bc1t_else.5887:
	addi	$zero, $v0, 1
bc1t_cont.5888:
	lw	$sp, $v1, 0
	sw	$sp, $v0, 3
	addi	$v1, $v0, 0
	sw	$sp, $ra, 4
	jal	o_isinvert.1990
	lw	$sp, $ra, 4
	lw	$sp, $v1, 3
	sw	$sp, $ra, 4
	jal	xor.1977
	lw	$sp, $ra, 4
	addi	$zero, $v1, 0
	bne	$v0, $v1, beq_else.5889
	addi	$zero, $v0, 1
	jr	$ra
beq_else.5889:
	addi	$zero, $v0, 0
	jr	$ra
is_outside.2076:
	addi	$zero, $v1, min_caml_isoutside_q
	addi	$zero, $a0, min_caml_chkinside_p
	lwc1	$a0, $f0, 0
	sw	$sp, $v0, 0
	sw	$sp, $v1, 1
	swc1	$sp, $f0, 2
	sw	$sp, $ra, 3
	jal	o_param_x.2000
	lw	$sp, $ra, 3
	lwc1	$sp, $f1, 2
	fsub	$f1, $f0, $f0
	lw	$sp, $v0, 1
	swc1	$v0, $f0, 0
	addi	$zero, $v0, min_caml_isoutside_q
	addi	$zero, $v1, min_caml_chkinside_p
	lwc1	$v1, $f0, 1
	lw	$sp, $v1, 0
	sw	$sp, $v0, 3
	swc1	$sp, $f0, 4
	addi	$v1, $v0, 0
	sw	$sp, $ra, 5
	jal	o_param_y.2002
	lw	$sp, $ra, 5
	lwc1	$sp, $f1, 4
	fsub	$f1, $f0, $f0
	lw	$sp, $v0, 3
	swc1	$v0, $f0, 1
	addi	$zero, $v0, min_caml_isoutside_q
	addi	$zero, $v1, min_caml_chkinside_p
	lwc1	$v1, $f0, 2
	lw	$sp, $v1, 0
	sw	$sp, $v0, 5
	swc1	$sp, $f0, 6
	addi	$v1, $v0, 0
	sw	$sp, $ra, 7
	jal	o_param_z.2004
	lw	$sp, $ra, 7
	lwc1	$sp, $f1, 6
	fsub	$f1, $f0, $f0
	lw	$sp, $v0, 5
	swc1	$v0, $f0, 2
	lw	$sp, $v0, 0
	sw	$sp, $ra, 7
	jal	o_form.1986
	lw	$sp, $ra, 7
	addi	$zero, $v1, 1
	bne	$v0, $v1, beq_else.5890
	lw	$sp, $v0, 0
	j	is_rect_outside.2070
beq_else.5890:
	addi	$zero, $v1, 2
	bne	$v0, $v1, beq_else.5891
	lw	$sp, $v0, 0
	j	is_plane_outside.2072
beq_else.5891:
	lw	$sp, $v0, 0
	j	is_second_outside.2074
check_all_inside.2078:
	sll	$v0, $a0, 0
	lw	$v1, $a0, $a0
	addi	$zero, $a1, -1
	bne	$a0, $a1, beq_else.5892
	addi	$zero, $v0, 1
	jr	$ra
beq_else.5892:
	addi	$zero, $a1, min_caml_objects
	sll	$a0, $a0, 0
	lw	$a1, $a0, $a0
	sw	$sp, $v1, 0
	sw	$sp, $v0, 1
	addi	$a0, $v0, 0
	sw	$sp, $ra, 2
	jal	is_outside.2076
	lw	$sp, $ra, 2
	addi	$zero, $v1, 0
	bne	$v0, $v1, beq_else.5893
	lw	$sp, $v0, 1
	addi	$v0, $v0, 1
	lw	$sp, $v1, 0
	j	check_all_inside.2078
beq_else.5893:
	addi	$zero, $v0, 0
	jr	$ra
shadow_check_and_group.2081:
	sll	$v0, $a1, 0
	lw	$v1, $a1, $a1
	addi	$zero, $a2, -1
	bne	$a1, $a2, beq_else.5894
	addi	$zero, $v0, 0
	jr	$ra
beq_else.5894:
	sll	$v0, $a1, 0
	lw	$v1, $a1, $a1
	addi	$zero, $a2, min_caml_light
	sw	$sp, $a0, 0
	sw	$sp, $v1, 1
	sw	$sp, $v0, 2
	sw	$sp, $a1, 3
	addi	$a2, $v1, 0
	addi	$a1, $v0, 0
	sw	$sp, $ra, 4
	jal	solver.2066
	lw	$sp, $ra, 4
	addi	$zero, $v1, min_caml_solver_dist
	lwc1	$v1, $f0, 0
	addi	$zero, $v1, 0
	bne	$v0, $v1, beq_else.5895
	addi	$zero, $v0, 0
	j	beq_cont.5896
beq_else.5895:
	addi	$zero, $v0, l.4747
	lwc1	$v0, $f1, 0
	fcondle	$f1, $f0
	bc1f	bc1t_else.5897
	addi	$zero, $v0, 0
	j	bc1t_cont.5898
bc1t_else.5897:
	addi	$zero, $v0, 1
bc1t_cont.5898:
beq_cont.5896:
	addi	$zero, $v1, 0
	bne	$v0, $v1, beq_else.5899
	addi	$zero, $v0, min_caml_objects
	lw	$sp, $v1, 3
	sll	$v1, $v1, 0
	lw	$v0, $v0, $v1
	sw	$sp, $ra, 4
	jal	o_isinvert.1990
	lw	$sp, $ra, 4
	addi	$zero, $v1, 0
	bne	$v0, $v1, beq_else.5900
	addi	$zero, $v0, 0
	jr	$ra
beq_else.5900:
	lw	$sp, $v0, 2
	addi	$v0, $v0, 1
	lw	$sp, $v1, 1
	lw	$sp, $a0, 0
	j	shadow_check_and_group.2081
beq_else.5899:
	addi	$zero, $v0, l.4749
	lwc1	$v0, $f1, 0
	fadd	$f0, $f1, $f0
	addi	$zero, $v0, min_caml_chkinside_p
	addi	$zero, $v1, min_caml_light
	lwc1	$v1, $f1, 0
	fmul	$f1, $f0, $f1
	lw	$sp, $v1, 0
	lwc1	$v1, $f2, 0
	fadd	$f1, $f2, $f1
	swc1	$v0, $f1, 0
	addi	$zero, $v0, min_caml_chkinside_p
	addi	$zero, $a0, min_caml_light
	lwc1	$a0, $f1, 1
	fmul	$f1, $f0, $f1
	lwc1	$v1, $f2, 1
	fadd	$f1, $f2, $f1
	swc1	$v0, $f1, 1
	addi	$zero, $v0, min_caml_chkinside_p
	addi	$zero, $a0, min_caml_light
	lwc1	$a0, $f1, 2
	fmul	$f1, $f0, $f0
	lwc1	$v1, $f1, 2
	fadd	$f0, $f1, $f0
	swc1	$v0, $f0, 2
	addi	$zero, $v0, 0
	lw	$sp, $a0, 1
	addi	$a0, $v1, 0
	sw	$sp, $ra, 4
	jal	check_all_inside.2078
	lw	$sp, $ra, 4
	addi	$zero, $v1, 0
	bne	$v0, $v1, beq_else.5901
	lw	$sp, $v0, 2
	addi	$v0, $v0, 1
	lw	$sp, $v1, 1
	lw	$sp, $a0, 0
	j	shadow_check_and_group.2081
beq_else.5901:
	addi	$zero, $v0, 1
	jr	$ra
shadow_check_one_or_group.2085:
	sll	$v0, $a1, 0
	lw	$v1, $a1, $a1
	addi	$zero, $a2, -1
	bne	$a1, $a2, beq_else.5902
	addi	$zero, $v0, 0
	jr	$ra
beq_else.5902:
	addi	$zero, $a2, min_caml_and_net
	sll	$a1, $a1, 0
	lw	$a2, $a1, $a1
	addi	$zero, $a2, 0
	sw	$sp, $a0, 0
	sw	$sp, $v1, 1
	sw	$sp, $v0, 2
	addi	$a1, $v1, 0
	addi	$a2, $v0, 0
	sw	$sp, $ra, 3
	jal	shadow_check_and_group.2081
	lw	$sp, $ra, 3
	addi	$zero, $v1, 0
	bne	$v0, $v1, beq_else.5903
	lw	$sp, $v0, 2
	addi	$v0, $v0, 1
	lw	$sp, $v1, 1
	lw	$sp, $a0, 0
	j	shadow_check_one_or_group.2085
beq_else.5903:
	addi	$zero, $v0, 1
	jr	$ra
shadow_check_one_or_matrix.2089:
	sll	$v0, $a1, 0
	lw	$v1, $a1, $a1
	lw	$a1, $a2, 0
	addi	$zero, $a3, -1
	bne	$a2, $a3, beq_else.5904
	addi	$zero, $v0, 0
	jr	$ra
beq_else.5904:
	addi	$zero, $a3, 99
	bne	$a2, $a3, beq_else.5905
	addi	$zero, $a2, 1
	sw	$sp, $a0, 0
	sw	$sp, $v1, 1
	sw	$sp, $v0, 2
	addi	$a1, $v1, 0
	addi	$a2, $v0, 0
	sw	$sp, $ra, 3
	jal	shadow_check_one_or_group.2085
	lw	$sp, $ra, 3
	addi	$zero, $v1, 0
	bne	$v0, $v1, beq_else.5906
	lw	$sp, $v0, 2
	addi	$v0, $v0, 1
	lw	$sp, $v1, 1
	lw	$sp, $a0, 0
	j	shadow_check_one_or_matrix.2089
beq_else.5906:
	addi	$zero, $v0, 1
	jr	$ra
beq_else.5905:
	addi	$zero, $a3, min_caml_light
	sw	$sp, $a1, 3
	sw	$sp, $a0, 0
	sw	$sp, $v1, 1
	sw	$sp, $v0, 2
	addi	$a3, $v1, 0
	addi	$a2, $v0, 0
	sw	$sp, $ra, 4
	jal	solver.2066
	lw	$sp, $ra, 4
	addi	$zero, $v1, 0
	bne	$v0, $v1, beq_else.5907
	lw	$sp, $v0, 2
	addi	$v0, $v0, 1
	lw	$sp, $v1, 1
	lw	$sp, $a0, 0
	j	shadow_check_one_or_matrix.2089
beq_else.5907:
	addi	$zero, $v0, l.4765
	lwc1	$v0, $f0, 0
	addi	$zero, $v0, min_caml_solver_dist
	lwc1	$v0, $f1, 0
	fcondle	$f0, $f1
	bc1f	bc1t_else.5908
	lw	$sp, $v0, 2
	addi	$v0, $v0, 1
	lw	$sp, $v1, 1
	lw	$sp, $a0, 0
	j	shadow_check_one_or_matrix.2089
bc1t_else.5908:
	addi	$zero, $v0, 1
	lw	$sp, $v1, 3
	lw	$sp, $a0, 0
	sw	$sp, $ra, 4
	jal	shadow_check_one_or_group.2085
	lw	$sp, $ra, 4
	addi	$zero, $v1, 0
	bne	$v0, $v1, beq_else.5909
	lw	$sp, $v0, 2
	addi	$v0, $v0, 1
	lw	$sp, $v1, 1
	lw	$sp, $a0, 0
	j	shadow_check_one_or_matrix.2089
beq_else.5909:
	addi	$zero, $v0, 1
	jr	$ra
solve_each_element.2093:
	sll	$v0, $a0, 0
	lw	$v1, $a0, $a0
	addi	$zero, $a1, -1
	bne	$a0, $a1, beq_else.5910
	jr	$ra
beq_else.5910:
	addi	$zero, $a1, min_caml_vscan
	addi	$zero, $a2, min_caml_viewpoint
	sw	$sp, $v0, 0
	sw	$sp, $v1, 1
	sw	$sp, $a0, 2
	addi	$a1, $v1, 0
	addi	$a0, $v0, 0
	addi	$a2, $a0, 0
	sw	$sp, $ra, 3
	jal	solver.2066
	lw	$sp, $ra, 3
	addi	$zero, $v1, 0
	bne	$v0, $v1, beq_else.5912
	addi	$zero, $v0, min_caml_objects
	lw	$sp, $v1, 2
	sll	$v1, $v1, 0
	lw	$v0, $v0, $v1
	sw	$sp, $ra, 3
	jal	o_isinvert.1990
	lw	$sp, $ra, 3
	addi	$zero, $v1, 0
	bne	$v0, $v1, beq_else.5914
	addi	$zero, $v0, min_caml_end_flag
	addi	$zero, $v1, 1
	sw	$v0, $v1, 0
	j	beq_cont.5915
beq_else.5914:
beq_cont.5915:
	j	beq_cont.5913
beq_else.5912:
	addi	$zero, $v1, min_caml_solver_dist
	lwc1	$v1, $f0, 0
	addi	$zero, $v1, l.4765
	lwc1	$v1, $f1, 0
	fcondle	$f0, $f1
	bc1f	bc1t_else.5916
	j	bc1t_cont.5917
bc1t_else.5916:
	addi	$zero, $v1, min_caml_tmin
	lwc1	$v1, $f1, 0
	fcondle	$f1, $f0
	bc1f	bc1t_else.5918
	j	bc1t_cont.5919
bc1t_else.5918:
	addi	$zero, $v1, l.4749
	lwc1	$v1, $f1, 0
	fadd	$f0, $f1, $f0
	addi	$zero, $v1, min_caml_chkinside_p
	addi	$zero, $a0, min_caml_vscan
	lwc1	$a0, $f1, 0
	fmul	$f1, $f0, $f1
	addi	$zero, $a0, min_caml_viewpoint
	lwc1	$a0, $f2, 0
	fadd	$f1, $f2, $f1
	swc1	$v1, $f1, 0
	addi	$zero, $v1, min_caml_chkinside_p
	addi	$zero, $a0, min_caml_vscan
	lwc1	$a0, $f1, 1
	fmul	$f1, $f0, $f1
	addi	$zero, $a0, min_caml_viewpoint
	lwc1	$a0, $f2, 1
	fadd	$f1, $f2, $f1
	swc1	$v1, $f1, 1
	addi	$zero, $v1, min_caml_chkinside_p
	addi	$zero, $a0, min_caml_vscan
	lwc1	$a0, $f1, 2
	fmul	$f1, $f0, $f1
	addi	$zero, $a0, min_caml_viewpoint
	lwc1	$a0, $f2, 2
	fadd	$f1, $f2, $f1
	swc1	$v1, $f1, 2
	addi	$zero, $v1, 0
	lw	$sp, $a0, 1
	sw	$sp, $v0, 3
	swc1	$sp, $f0, 4
	addi	$v1, $v0, 0
	addi	$a0, $v1, 0
	sw	$sp, $ra, 5
	jal	check_all_inside.2078
	lw	$sp, $ra, 5
	addi	$zero, $v1, 0
	bne	$v0, $v1, beq_else.5920
	j	beq_cont.5921
beq_else.5920:
	addi	$zero, $v0, min_caml_tmin
	lwc1	$sp, $f0, 4
	swc1	$v0, $f0, 0
	addi	$zero, $v0, min_caml_crashed_point
	addi	$zero, $v1, min_caml_chkinside_p
	lwc1	$v1, $f0, 0
	swc1	$v0, $f0, 0
	addi	$zero, $v0, min_caml_crashed_point
	addi	$zero, $v1, min_caml_chkinside_p
	lwc1	$v1, $f0, 1
	swc1	$v0, $f0, 1
	addi	$zero, $v0, min_caml_crashed_point
	addi	$zero, $v1, min_caml_chkinside_p
	lwc1	$v1, $f0, 2
	swc1	$v0, $f0, 2
	addi	$zero, $v0, min_caml_intsec_rectside
	lw	$sp, $v1, 3
	sw	$v0, $v1, 0
	addi	$zero, $v0, min_caml_crashed_object
	lw	$sp, $v1, 2
	sw	$v0, $v1, 0
beq_cont.5921:
bc1t_cont.5919:
bc1t_cont.5917:
beq_cont.5913:
	addi	$zero, $v0, min_caml_end_flag
	lw	$v0, $v0, 0
	addi	$zero, $v1, 0
	bne	$v0, $v1, beq_else.5922
	lw	$sp, $v0, 0
	addi	$v0, $v0, 1
	lw	$sp, $v1, 1
	j	solve_each_element.2093
beq_else.5922:
	jr	$ra
solve_one_or_network.2096:
	sll	$v0, $a0, 0
	lw	$v1, $a0, $a0
	addi	$zero, $a1, -1
	bne	$a0, $a1, beq_else.5924
	jr	$ra
beq_else.5924:
	addi	$zero, $a1, min_caml_and_net
	sll	$a0, $a0, 0
	lw	$a1, $a0, $a0
	addi	$zero, $a1, min_caml_end_flag
	addi	$zero, $a2, 0
	sw	$a1, $a2, 0
	addi	$zero, $a1, 0
	sw	$sp, $v1, 0
	sw	$sp, $v0, 1
	addi	$a0, $v1, 0
	addi	$a1, $v0, 0
	sw	$sp, $ra, 2
	jal	solve_each_element.2093
	lw	$sp, $ra, 2
	lw	$sp, $v0, 1
	addi	$v0, $v0, 1
	lw	$sp, $v1, 0
	j	solve_one_or_network.2096
trace_or_matrix.2099:
	sll	$v0, $a0, 0
	lw	$v1, $a0, $a0
	lw	$a0, $a1, 0
	addi	$zero, $a2, -1
	bne	$a1, $a2, beq_else.5926
	jr	$ra
beq_else.5926:
	addi	$zero, $a2, 99
	sw	$sp, $v1, 0
	sw	$sp, $v0, 1
	bne	$a1, $a2, beq_else.5928
	addi	$zero, $a1, 1
	addi	$a0, $v1, 0
	addi	$a1, $v0, 0
	sw	$sp, $ra, 2
	jal	solve_one_or_network.2096
	lw	$sp, $ra, 2
	j	beq_cont.5929
beq_else.5928:
	addi	$zero, $a2, min_caml_vscan
	addi	$zero, $a3, min_caml_viewpoint
	sw	$sp, $a0, 2
	addi	$a3, $a0, 0
	addi	$a2, $v1, 0
	addi	$a1, $v0, 0
	sw	$sp, $ra, 3
	jal	solver.2066
	lw	$sp, $ra, 3
	addi	$zero, $v1, 0
	bne	$v0, $v1, beq_else.5930
	j	beq_cont.5931
beq_else.5930:
	addi	$zero, $v0, min_caml_solver_dist
	lwc1	$v0, $f0, 0
	addi	$zero, $v0, min_caml_tmin
	lwc1	$v0, $f1, 0
	fcondle	$f1, $f0
	bc1f	bc1t_else.5932
	j	bc1t_cont.5933
bc1t_else.5932:
	addi	$zero, $v0, 1
	lw	$sp, $v1, 2
	sw	$sp, $ra, 3
	jal	solve_one_or_network.2096
	lw	$sp, $ra, 3
bc1t_cont.5933:
beq_cont.5931:
beq_cont.5929:
	lw	$sp, $v0, 1
	addi	$v0, $v0, 1
	lw	$sp, $v1, 0
	j	trace_or_matrix.2099
tracer.2102:
	addi	$zero, $v0, min_caml_tmin
	addi	$zero, $v1, l.4801
	lwc1	$v1, $f0, 0
	swc1	$v0, $f0, 0
	addi	$zero, $v0, 0
	addi	$zero, $v1, min_caml_or_net
	lw	$v1, $v1, 0
	sw	$sp, $ra, 0
	jal	trace_or_matrix.2099
	lw	$sp, $ra, 0
	addi	$zero, $v0, min_caml_tmin
	lwc1	$v0, $f0, 0
	addi	$zero, $v0, l.4765
	lwc1	$v0, $f1, 0
	fcondle	$f0, $f1
	bc1f	bc1t_else.5934
	addi	$zero, $v0, 0
	jr	$ra
bc1t_else.5934:
	addi	$zero, $v0, l.4807
	lwc1	$v0, $f1, 0
	fcondle	$f1, $f0
	bc1f	bc1t_else.5935
	addi	$zero, $v0, 0
	jr	$ra
bc1t_else.5935:
	addi	$zero, $v0, 1
	jr	$ra
get_nvector_rect.2105:
	addi	$zero, $v0, min_caml_intsec_rectside
	lw	$v0, $v0, 0
	addi	$zero, $v1, 1
	bne	$v0, $v1, beq_else.5936
	addi	$zero, $v0, min_caml_nvector
	addi	$zero, $v1, min_caml_vscan
	lwc1	$v1, $f0, 0
	sw	$sp, $v0, 0
	sw	$sp, $ra, 1
	jal	sgn.2025
	lw	$sp, $ra, 1
	fnegs	$f0, $f0
	lw	$sp, $v0, 0
	swc1	$v0, $f0, 0
	addi	$zero, $v0, min_caml_nvector
	addi	$zero, $v1, l.4465
	lwc1	$v1, $f0, 0
	swc1	$v0, $f0, 1
	addi	$zero, $v0, min_caml_nvector
	addi	$zero, $v1, l.4465
	lwc1	$v1, $f0, 0
	swc1	$v0, $f0, 2
	jr	$ra
beq_else.5936:
	addi	$zero, $v1, 2
	bne	$v0, $v1, beq_else.5938
	addi	$zero, $v0, min_caml_nvector
	addi	$zero, $v1, l.4465
	lwc1	$v1, $f0, 0
	swc1	$v0, $f0, 0
	addi	$zero, $v0, min_caml_nvector
	addi	$zero, $v1, min_caml_vscan
	lwc1	$v1, $f0, 1
	sw	$sp, $v0, 1
	sw	$sp, $ra, 2
	jal	sgn.2025
	lw	$sp, $ra, 2
	fnegs	$f0, $f0
	lw	$sp, $v0, 1
	swc1	$v0, $f0, 1
	addi	$zero, $v0, min_caml_nvector
	addi	$zero, $v1, l.4465
	lwc1	$v1, $f0, 0
	swc1	$v0, $f0, 2
	jr	$ra
beq_else.5938:
	addi	$zero, $v1, 3
	bne	$v0, $v1, beq_else.5940
	addi	$zero, $v0, min_caml_nvector
	addi	$zero, $v1, l.4465
	lwc1	$v1, $f0, 0
	swc1	$v0, $f0, 0
	addi	$zero, $v0, min_caml_nvector
	addi	$zero, $v1, l.4465
	lwc1	$v1, $f0, 0
	swc1	$v0, $f0, 1
	addi	$zero, $v0, min_caml_nvector
	addi	$zero, $v1, min_caml_vscan
	lwc1	$v1, $f0, 2
	sw	$sp, $v0, 2
	sw	$sp, $ra, 3
	jal	sgn.2025
	lw	$sp, $ra, 3
	fnegs	$f0, $f0
	lw	$sp, $v0, 2
	swc1	$v0, $f0, 2
	jr	$ra
beq_else.5940:
	jr	$ra
get_nvector_plane.2107:
	addi	$zero, $v1, min_caml_nvector
	sw	$sp, $v0, 0
	sw	$sp, $v1, 1
	sw	$sp, $ra, 2
	jal	o_param_a.1994
	lw	$sp, $ra, 2
	fnegs	$f0, $f0
	lw	$sp, $v0, 1
	swc1	$v0, $f0, 0
	addi	$zero, $v0, min_caml_nvector
	lw	$sp, $v1, 0
	sw	$sp, $v0, 2
	addi	$v1, $v0, 0
	sw	$sp, $ra, 3
	jal	o_param_b.1996
	lw	$sp, $ra, 3
	fnegs	$f0, $f0
	lw	$sp, $v0, 2
	swc1	$v0, $f0, 1
	addi	$zero, $v0, min_caml_nvector
	lw	$sp, $v1, 0
	sw	$sp, $v0, 3
	addi	$v1, $v0, 0
	sw	$sp, $ra, 4
	jal	o_param_c.1998
	lw	$sp, $ra, 4
	fnegs	$f0, $f0
	lw	$sp, $v0, 3
	swc1	$v0, $f0, 2
	jr	$ra
get_nvector_second_norot.2109:
	addi	$zero, $a0, min_caml_nvector
	lwc1	$v1, $f0, 0
	sw	$sp, $v1, 0
	sw	$sp, $a0, 1
	sw	$sp, $v0, 2
	swc1	$sp, $f0, 3
	sw	$sp, $ra, 4
	jal	o_param_x.2000
	lw	$sp, $ra, 4
	lwc1	$sp, $f1, 3
	fsub	$f1, $f0, $f0
	lw	$sp, $v0, 2
	swc1	$sp, $f0, 4
	sw	$sp, $ra, 5
	jal	o_param_a.1994
	lw	$sp, $ra, 5
	lwc1	$sp, $f1, 4
	fmul	$f1, $f0, $f0
	lw	$sp, $v0, 1
	swc1	$v0, $f0, 0
	addi	$zero, $v0, min_caml_nvector
	lw	$sp, $v1, 0
	lwc1	$v1, $f0, 1
	lw	$sp, $a0, 2
	sw	$sp, $v0, 5
	swc1	$sp, $f0, 6
	addi	$a0, $v0, 0
	sw	$sp, $ra, 7
	jal	o_param_y.2002
	lw	$sp, $ra, 7
	lwc1	$sp, $f1, 6
	fsub	$f1, $f0, $f0
	lw	$sp, $v0, 2
	swc1	$sp, $f0, 7
	sw	$sp, $ra, 8
	jal	o_param_b.1996
	lw	$sp, $ra, 8
	lwc1	$sp, $f1, 7
	fmul	$f1, $f0, $f0
	lw	$sp, $v0, 5
	swc1	$v0, $f0, 1
	addi	$zero, $v0, min_caml_nvector
	lw	$sp, $v1, 0
	lwc1	$v1, $f0, 2
	lw	$sp, $v1, 2
	sw	$sp, $v0, 8
	swc1	$sp, $f0, 9
	addi	$v1, $v0, 0
	sw	$sp, $ra, 10
	jal	o_param_z.2004
	lw	$sp, $ra, 10
	lwc1	$sp, $f1, 9
	fsub	$f1, $f0, $f0
	lw	$sp, $v0, 2
	swc1	$sp, $f0, 10
	sw	$sp, $ra, 11
	jal	o_param_c.1998
	lw	$sp, $ra, 11
	lwc1	$sp, $f1, 10
	fmul	$f1, $f0, $f0
	lw	$sp, $v0, 8
	swc1	$v0, $f0, 2
	addi	$zero, $v0, min_caml_nvector
	lw	$sp, $v1, 2
	sw	$sp, $v0, 11
	addi	$v1, $v0, 0
	sw	$sp, $ra, 12
	jal	o_isinvert.1990
	lw	$sp, $ra, 12
	addi	$v0, $v1, 0
	lw	$sp, $v0, 11
	j	normalize_vector.2022
get_nvector_second_rot.2112:
	addi	$zero, $a0, min_caml_nvector_w
	lwc1	$v1, $f0, 0
	sw	$sp, $v0, 0
	sw	$sp, $v1, 1
	sw	$sp, $a0, 2
	swc1	$sp, $f0, 3
	sw	$sp, $ra, 4
	jal	o_param_x.2000
	lw	$sp, $ra, 4
	lwc1	$sp, $f1, 3
	fsub	$f1, $f0, $f0
	lw	$sp, $v0, 2
	swc1	$v0, $f0, 0
	addi	$zero, $v0, min_caml_nvector_w
	lw	$sp, $v1, 1
	lwc1	$v1, $f0, 1
	lw	$sp, $a0, 0
	sw	$sp, $v0, 4
	swc1	$sp, $f0, 5
	addi	$a0, $v0, 0
	sw	$sp, $ra, 6
	jal	o_param_y.2002
	lw	$sp, $ra, 6
	lwc1	$sp, $f1, 5
	fsub	$f1, $f0, $f0
	lw	$sp, $v0, 4
	swc1	$v0, $f0, 1
	addi	$zero, $v0, min_caml_nvector_w
	lw	$sp, $v1, 1
	lwc1	$v1, $f0, 2
	lw	$sp, $v1, 0
	sw	$sp, $v0, 6
	swc1	$sp, $f0, 7
	addi	$v1, $v0, 0
	sw	$sp, $ra, 8
	jal	o_param_z.2004
	lw	$sp, $ra, 8
	lwc1	$sp, $f1, 7
	fsub	$f1, $f0, $f0
	lw	$sp, $v0, 6
	swc1	$v0, $f0, 2
	addi	$zero, $v0, min_caml_nvector
	addi	$zero, $v1, min_caml_nvector_w
	lwc1	$v1, $f0, 0
	lw	$sp, $v1, 0
	sw	$sp, $v0, 8
	swc1	$sp, $f0, 9
	addi	$v1, $v0, 0
	sw	$sp, $ra, 10
	jal	o_param_a.1994
	lw	$sp, $ra, 10
	lwc1	$sp, $f1, 9
	fmul	$f1, $f0, $f0
	addi	$zero, $v0, min_caml_nvector_w
	lwc1	$v0, $f1, 1
	lw	$sp, $v0, 0
	swc1	$sp, $f0, 10
	swc1	$sp, $f1, 11
	sw	$sp, $ra, 12
	jal	o_param_r3.2020
	lw	$sp, $ra, 12
	lwc1	$sp, $f1, 11
	fmul	$f1, $f0, $f0
	addi	$zero, $v0, min_caml_nvector_w
	lwc1	$v0, $f1, 2
	lw	$sp, $v0, 0
	swc1	$sp, $f0, 12
	swc1	$sp, $f1, 13
	sw	$sp, $ra, 14
	jal	o_param_r2.2018
	lw	$sp, $ra, 14
	lwc1	$sp, $f1, 13
	fmul	$f1, $f0, $f0
	lwc1	$sp, $f1, 12
	fadd	$f1, $f0, $f0
	sw	$sp, $ra, 14
	jal	fhalf.1982
	lw	$sp, $ra, 14
	lwc1	$sp, $f1, 10
	fadd	$f1, $f0, $f0
	lw	$sp, $v0, 8
	swc1	$v0, $f0, 0
	addi	$zero, $v0, min_caml_nvector
	addi	$zero, $v1, min_caml_nvector_w
	lwc1	$v1, $f0, 1
	lw	$sp, $v1, 0
	sw	$sp, $v0, 14
	swc1	$sp, $f0, 15
	addi	$v1, $v0, 0
	sw	$sp, $ra, 16
	jal	o_param_b.1996
	lw	$sp, $ra, 16
	lwc1	$sp, $f1, 15
	fmul	$f1, $f0, $f0
	addi	$zero, $v0, min_caml_nvector_w
	lwc1	$v0, $f1, 0
	lw	$sp, $v0, 0
	swc1	$sp, $f0, 16
	swc1	$sp, $f1, 17
	sw	$sp, $ra, 18
	jal	o_param_r3.2020
	lw	$sp, $ra, 18
	lwc1	$sp, $f1, 17
	fmul	$f1, $f0, $f0
	addi	$zero, $v0, min_caml_nvector_w
	lwc1	$v0, $f1, 2
	lw	$sp, $v0, 0
	swc1	$sp, $f0, 18
	swc1	$sp, $f1, 19
	sw	$sp, $ra, 20
	jal	o_param_r1.2016
	lw	$sp, $ra, 20
	lwc1	$sp, $f1, 19
	fmul	$f1, $f0, $f0
	lwc1	$sp, $f1, 18
	fadd	$f1, $f0, $f0
	sw	$sp, $ra, 20
	jal	fhalf.1982
	lw	$sp, $ra, 20
	lwc1	$sp, $f1, 16
	fadd	$f1, $f0, $f0
	lw	$sp, $v0, 14
	swc1	$v0, $f0, 1
	addi	$zero, $v0, min_caml_nvector
	addi	$zero, $v1, min_caml_nvector_w
	lwc1	$v1, $f0, 2
	lw	$sp, $v1, 0
	sw	$sp, $v0, 20
	swc1	$sp, $f0, 21
	addi	$v1, $v0, 0
	sw	$sp, $ra, 22
	jal	o_param_c.1998
	lw	$sp, $ra, 22
	lwc1	$sp, $f1, 21
	fmul	$f1, $f0, $f0
	addi	$zero, $v0, min_caml_nvector_w
	lwc1	$v0, $f1, 0
	lw	$sp, $v0, 0
	swc1	$sp, $f0, 22
	swc1	$sp, $f1, 23
	sw	$sp, $ra, 24
	jal	o_param_r2.2018
	lw	$sp, $ra, 24
	lwc1	$sp, $f1, 23
	fmul	$f1, $f0, $f0
	addi	$zero, $v0, min_caml_nvector_w
	lwc1	$v0, $f1, 1
	lw	$sp, $v0, 0
	swc1	$sp, $f0, 24
	swc1	$sp, $f1, 25
	sw	$sp, $ra, 26
	jal	o_param_r1.2016
	lw	$sp, $ra, 26
	lwc1	$sp, $f1, 25
	fmul	$f1, $f0, $f0
	lwc1	$sp, $f1, 24
	fadd	$f1, $f0, $f0
	sw	$sp, $ra, 26
	jal	fhalf.1982
	lw	$sp, $ra, 26
	lwc1	$sp, $f1, 22
	fadd	$f1, $f0, $f0
	lw	$sp, $v0, 20
	swc1	$v0, $f0, 2
	addi	$zero, $v0, min_caml_nvector
	lw	$sp, $v1, 0
	sw	$sp, $v0, 26
	addi	$v1, $v0, 0
	sw	$sp, $ra, 27
	jal	o_isinvert.1990
	lw	$sp, $ra, 27
	addi	$v0, $v1, 0
	lw	$sp, $v0, 26
	j	normalize_vector.2022
get_nvector.2115:
	sw	$sp, $v1, 0
	sw	$sp, $v0, 1
	sw	$sp, $ra, 2
	jal	o_form.1986
	lw	$sp, $ra, 2
	addi	$zero, $v1, 1
	bne	$v0, $v1, beq_else.5944
	j	get_nvector_rect.2105
beq_else.5944:
	addi	$zero, $v1, 2
	bne	$v0, $v1, beq_else.5945
	lw	$sp, $v0, 1
	j	get_nvector_plane.2107
beq_else.5945:
	lw	$sp, $v0, 1
	sw	$sp, $ra, 2
	jal	o_isrot.1992
	lw	$sp, $ra, 2
	addi	$zero, $v1, 0
	bne	$v0, $v1, beq_else.5946
	lw	$sp, $v0, 1
	lw	$sp, $v1, 0
	j	get_nvector_second_norot.2109
beq_else.5946:
	lw	$sp, $v0, 1
	lw	$sp, $v1, 0
	j	get_nvector_second_rot.2112
utexture.2118:
	sw	$sp, $v1, 0
	sw	$sp, $v0, 1
	sw	$sp, $ra, 2
	jal	o_texturetype.1984
	lw	$sp, $ra, 2
	addi	$zero, $v1, min_caml_texture_color
	lw	$sp, $a0, 1
	sw	$sp, $v0, 2
	sw	$sp, $v1, 3
	addi	$a0, $v0, 0
	sw	$sp, $ra, 4
	jal	o_color_red.2010
	lw	$sp, $ra, 4
	lw	$sp, $v0, 3
	swc1	$v0, $f0, 0
	addi	$zero, $v0, min_caml_texture_color
	lw	$sp, $v1, 1
	sw	$sp, $v0, 4
	addi	$v1, $v0, 0
	sw	$sp, $ra, 5
	jal	o_color_green.2012
	lw	$sp, $ra, 5
	lw	$sp, $v0, 4
	swc1	$v0, $f0, 1
	addi	$zero, $v0, min_caml_texture_color
	lw	$sp, $v1, 1
	sw	$sp, $v0, 5
	addi	$v1, $v0, 0
	sw	$sp, $ra, 6
	jal	o_color_blue.2014
	lw	$sp, $ra, 6
	lw	$sp, $v0, 5
	swc1	$v0, $f0, 2
	addi	$zero, $v0, 1
	lw	$sp, $v1, 2
	bne	$v1, $v0, beq_else.5947
	lw	$sp, $v0, 0
	lwc1	$v0, $f0, 0
	lw	$sp, $v1, 1
	swc1	$sp, $f0, 6
	addi	$v1, $v0, 0
	sw	$sp, $ra, 7
	jal	o_param_x.2000
	lw	$sp, $ra, 7
	lwc1	$sp, $f1, 6
	fsub	$f1, $f0, $f0
	addi	$zero, $v0, l.4901
	lwc1	$v0, $f1, 0
	fmul	$f0, $f1, $f1
	swc1	$sp, $f0, 7
	fmv	$f1, $f0
	sw	$sp, $ra, 8
	jal	min_caml_floor
	lw	$sp, $ra, 8
	addi	$zero, $v0, l.4903
	lwc1	$v0, $f1, 0
	fmul	$f0, $f1, $f0
	addi	$zero, $v0, l.4882
	lwc1	$v0, $f1, 0
	lwc1	$sp, $f2, 7
	fsub	$f2, $f0, $f0
	fcondle	$f1, $f0
	bc1f	bc1t_else.5948
	addi	$zero, $v0, 0
	j	bc1t_cont.5949
bc1t_else.5948:
	addi	$zero, $v0, 1
bc1t_cont.5949:
	lw	$sp, $v1, 0
	lwc1	$v1, $f0, 2
	lw	$sp, $v1, 1
	sw	$sp, $v0, 8
	swc1	$sp, $f0, 9
	addi	$v1, $v0, 0
	sw	$sp, $ra, 10
	jal	o_param_z.2004
	lw	$sp, $ra, 10
	lwc1	$sp, $f1, 9
	fsub	$f1, $f0, $f0
	addi	$zero, $v0, l.4901
	lwc1	$v0, $f1, 0
	fmul	$f0, $f1, $f1
	swc1	$sp, $f0, 10
	fmv	$f1, $f0
	sw	$sp, $ra, 11
	jal	min_caml_floor
	lw	$sp, $ra, 11
	addi	$zero, $v0, l.4903
	lwc1	$v0, $f1, 0
	fmul	$f0, $f1, $f0
	addi	$zero, $v0, l.4882
	lwc1	$v0, $f1, 0
	lwc1	$sp, $f2, 10
	fsub	$f2, $f0, $f0
	fcondle	$f1, $f0
	bc1f	bc1t_else.5950
	addi	$zero, $v0, 0
	j	bc1t_cont.5951
bc1t_else.5950:
	addi	$zero, $v0, 1
bc1t_cont.5951:
	addi	$zero, $v1, min_caml_texture_color
	addi	$zero, $a0, 0
	lw	$sp, $a1, 8
	bne	$a1, $a0, beq_else.5952
	addi	$zero, $a0, 0
	bne	$v0, $a0, beq_else.5954
	addi	$zero, $v0, l.4886
	lwc1	$v0, $f0, 0
	j	beq_cont.5955
beq_else.5954:
	addi	$zero, $v0, l.4465
	lwc1	$v0, $f0, 0
beq_cont.5955:
	j	beq_cont.5953
beq_else.5952:
	addi	$zero, $a0, 0
	bne	$v0, $a0, beq_else.5956
	addi	$zero, $v0, l.4465
	lwc1	$v0, $f0, 0
	j	beq_cont.5957
beq_else.5956:
	addi	$zero, $v0, l.4886
	lwc1	$v0, $f0, 0
beq_cont.5957:
beq_cont.5953:
	swc1	$v1, $f0, 1
	jr	$ra
beq_else.5947:
	addi	$zero, $v0, 2
	bne	$v1, $v0, beq_else.5959
	lw	$sp, $v0, 0
	lwc1	$v0, $f0, 1
	addi	$zero, $v0, l.4893
	lwc1	$v0, $f1, 0
	fmul	$f0, $f1, $f0
	sw	$sp, $ra, 11
	jal	min_caml_sin
	lw	$sp, $ra, 11
	sw	$sp, $ra, 11
	jal	fsqr.1980
	lw	$sp, $ra, 11
	addi	$zero, $v0, min_caml_texture_color
	addi	$zero, $v1, l.4886
	lwc1	$v1, $f1, 0
	fmul	$f1, $f0, $f1
	swc1	$v0, $f1, 0
	addi	$zero, $v0, min_caml_texture_color
	addi	$zero, $v1, l.4886
	lwc1	$v1, $f1, 0
	addi	$zero, $v1, l.4467
	lwc1	$v1, $f2, 0
	fsub	$f2, $f0, $f0
	fmul	$f1, $f0, $f0
	swc1	$v0, $f0, 1
	jr	$ra
beq_else.5959:
	addi	$zero, $v0, 3
	bne	$v1, $v0, beq_else.5961
	lw	$sp, $v0, 0
	lwc1	$v0, $f0, 0
	lw	$sp, $v1, 1
	swc1	$sp, $f0, 11
	addi	$v1, $v0, 0
	sw	$sp, $ra, 12
	jal	o_param_x.2000
	lw	$sp, $ra, 12
	lwc1	$sp, $f1, 11
	fsub	$f1, $f0, $f0
	lw	$sp, $v0, 0
	lwc1	$v0, $f1, 2
	lw	$sp, $v0, 1
	swc1	$sp, $f0, 12
	swc1	$sp, $f1, 13
	sw	$sp, $ra, 14
	jal	o_param_z.2004
	lw	$sp, $ra, 14
	lwc1	$sp, $f1, 13
	fsub	$f1, $f0, $f0
	lwc1	$sp, $f1, 12
	swc1	$sp, $f0, 14
	fmv	$f1, $f0
	sw	$sp, $ra, 15
	jal	fsqr.1980
	lw	$sp, $ra, 15
	lwc1	$sp, $f1, 14
	swc1	$sp, $f0, 15
	fmv	$f1, $f0
	sw	$sp, $ra, 16
	jal	fsqr.1980
	lw	$sp, $ra, 16
	lwc1	$sp, $f1, 15
	fadd	$f1, $f0, $f0
	sw	$sp, $ra, 16
	jal	min_caml_sqrt
	lw	$sp, $ra, 16
	addi	$zero, $v0, l.4882
	lwc1	$v0, $f1, 0
	fdiv	$f0, $f1, $f0
	swc1	$sp, $f0, 16
	sw	$sp, $ra, 17
	jal	min_caml_floor
	lw	$sp, $ra, 17
	lwc1	$sp, $f1, 16
	fsub	$f1, $f0, $f0
	addi	$zero, $v0, l.4884
	lwc1	$v0, $f1, 0
	fmul	$f0, $f1, $f0
	sw	$sp, $ra, 17
	jal	min_caml_cos
	lw	$sp, $ra, 17
	sw	$sp, $ra, 17
	jal	fsqr.1980
	lw	$sp, $ra, 17
	addi	$zero, $v0, min_caml_texture_color
	addi	$zero, $v1, l.4886
	lwc1	$v1, $f1, 0
	fmul	$f0, $f1, $f1
	swc1	$v0, $f1, 1
	addi	$zero, $v0, min_caml_texture_color
	addi	$zero, $v1, l.4467
	lwc1	$v1, $f1, 0
	fsub	$f1, $f0, $f0
	addi	$zero, $v1, l.4886
	lwc1	$v1, $f1, 0
	fmul	$f0, $f1, $f0
	swc1	$v0, $f0, 2
	jr	$ra
beq_else.5961:
	addi	$zero, $v0, 4
	bne	$v1, $v0, beq_else.5963
	lw	$sp, $v0, 0
	lwc1	$v0, $f0, 0
	lw	$sp, $v1, 1
	swc1	$sp, $f0, 17
	addi	$v1, $v0, 0
	sw	$sp, $ra, 18
	jal	o_param_x.2000
	lw	$sp, $ra, 18
	lwc1	$sp, $f1, 17
	fsub	$f1, $f0, $f0
	lw	$sp, $v0, 1
	swc1	$sp, $f0, 18
	sw	$sp, $ra, 19
	jal	o_param_a.1994
	lw	$sp, $ra, 19
	sw	$sp, $ra, 19
	jal	min_caml_sqrt
	lw	$sp, $ra, 19
	lwc1	$sp, $f1, 18
	fmul	$f1, $f0, $f0
	lw	$sp, $v0, 0
	lwc1	$v0, $f1, 2
	lw	$sp, $v1, 1
	swc1	$sp, $f0, 19
	swc1	$sp, $f1, 20
	addi	$v1, $v0, 0
	sw	$sp, $ra, 21
	jal	o_param_z.2004
	lw	$sp, $ra, 21
	lwc1	$sp, $f1, 20
	fsub	$f1, $f0, $f0
	lw	$sp, $v0, 1
	swc1	$sp, $f0, 21
	sw	$sp, $ra, 22
	jal	o_param_c.1998
	lw	$sp, $ra, 22
	sw	$sp, $ra, 22
	jal	min_caml_sqrt
	lw	$sp, $ra, 22
	lwc1	$sp, $f1, 21
	fmul	$f1, $f0, $f0
	lwc1	$sp, $f1, 19
	swc1	$sp, $f0, 22
	fmv	$f1, $f0
	sw	$sp, $ra, 23
	jal	fsqr.1980
	lw	$sp, $ra, 23
	lwc1	$sp, $f1, 22
	swc1	$sp, $f0, 23
	fmv	$f1, $f0
	sw	$sp, $ra, 24
	jal	fsqr.1980
	lw	$sp, $ra, 24
	lwc1	$sp, $f1, 23
	fadd	$f1, $f0, $f0
	sw	$sp, $ra, 24
	jal	min_caml_sqrt
	lw	$sp, $ra, 24
	addi	$zero, $v0, l.4860
	lwc1	$v0, $f1, 0
	lwc1	$sp, $f2, 19
	swc1	$sp, $f0, 24
	swc1	$sp, $f1, 25
	fmv	$f2, $f0
	sw	$sp, $ra, 26
	jal	min_caml_abs_float
	lw	$sp, $ra, 26
	lwc1	$sp, $f1, 25
	fcondle	$f1, $f0
	bc1f	bc1t_else.5964
	lwc1	$sp, $f0, 19
	lwc1	$sp, $f1, 22
	fdiv	$f1, $f0, $f0
	sw	$sp, $ra, 26
	jal	min_caml_abs_float
	lw	$sp, $ra, 26
	sw	$sp, $ra, 26
	jal	min_caml_atan
	lw	$sp, $ra, 26
	addi	$zero, $v0, l.4864
	lwc1	$v0, $f1, 0
	fmul	$f0, $f1, $f0
	j	bc1t_cont.5965
bc1t_else.5964:
	addi	$zero, $v0, l.4862
	lwc1	$v0, $f0, 0
bc1t_cont.5965:
	swc1	$sp, $f0, 26
	sw	$sp, $ra, 27
	jal	min_caml_floor
	lw	$sp, $ra, 27
	lwc1	$sp, $f1, 26
	fsub	$f1, $f0, $f0
	lw	$sp, $v0, 0
	lwc1	$v0, $f2, 1
	lw	$sp, $v0, 1
	swc1	$sp, $f0, 27
	swc1	$sp, $f2, 28
	sw	$sp, $ra, 29
	jal	o_param_y.2002
	lw	$sp, $ra, 29
	lwc1	$sp, $f1, 28
	fsub	$f1, $f0, $f0
	lw	$sp, $v0, 1
	swc1	$sp, $f0, 29
	sw	$sp, $ra, 30
	jal	o_param_b.1996
	lw	$sp, $ra, 30
	sw	$sp, $ra, 30
	jal	min_caml_sqrt
	lw	$sp, $ra, 30
	lwc1	$sp, $f1, 29
	fmul	$f1, $f0, $f0
	addi	$zero, $v0, l.4860
	lwc1	$v0, $f1, 0
	lwc1	$sp, $f2, 26
	swc1	$sp, $f0, 30
	swc1	$sp, $f1, 31
	fmv	$f2, $f0
	sw	$sp, $ra, 32
	jal	min_caml_abs_float
	lw	$sp, $ra, 32
	lwc1	$sp, $f1, 31
	fcondle	$f1, $f0
	bc1f	bc1t_else.5966
	lwc1	$sp, $f0, 24
	lwc1	$sp, $f1, 30
	fdiv	$f1, $f0, $f0
	sw	$sp, $ra, 32
	jal	min_caml_abs_float
	lw	$sp, $ra, 32
	sw	$sp, $ra, 32
	jal	min_caml_atan
	lw	$sp, $ra, 32
	addi	$zero, $v0, l.4864
	lwc1	$v0, $f1, 0
	fmul	$f0, $f1, $f0
	j	bc1t_cont.5967
bc1t_else.5966:
	addi	$zero, $v0, l.4862
	lwc1	$v0, $f0, 0
bc1t_cont.5967:
	swc1	$sp, $f0, 32
	sw	$sp, $ra, 33
	jal	min_caml_floor
	lw	$sp, $ra, 33
	lwc1	$sp, $f1, 32
	fsub	$f1, $f0, $f0
	addi	$zero, $v0, l.4870
	lwc1	$v0, $f1, 0
	addi	$zero, $v0, l.4872
	lwc1	$v0, $f2, 0
	lwc1	$sp, $f3, 27
	fsub	$f2, $f3, $f2
	swc1	$sp, $f0, 33
	swc1	$sp, $f1, 34
	fmv	$f2, $f0
	sw	$sp, $ra, 35
	jal	fsqr.1980
	lw	$sp, $ra, 35
	lwc1	$sp, $f1, 34
	fsub	$f1, $f0, $f0
	addi	$zero, $v0, l.4872
	lwc1	$v0, $f1, 0
	lwc1	$sp, $f2, 33
	fsub	$f1, $f2, $f1
	swc1	$sp, $f0, 35
	fmv	$f1, $f0
	sw	$sp, $ra, 36
	jal	fsqr.1980
	lw	$sp, $ra, 36
	lwc1	$sp, $f1, 35
	fsub	$f1, $f0, $f0
	addi	$zero, $v0, min_caml_texture_color
	addi	$zero, $v1, l.4465
	lwc1	$v1, $f1, 0
	fcondle	$f0, $f1
	bc1f	bc1t_else.5968
	addi	$zero, $v1, l.4465
	lwc1	$v1, $f0, 0
	j	bc1t_cont.5969
bc1t_else.5968:
	addi	$zero, $v1, l.4876
	lwc1	$v1, $f1, 0
	fmul	$f0, $f1, $f0
bc1t_cont.5969:
	swc1	$v0, $f0, 2
	jr	$ra
beq_else.5963:
	jr	$ra
in_prod.2121:
	lwc1	$v0, $f0, 0
	lwc1	$v1, $f1, 0
	fmul	$f0, $f1, $f0
	lwc1	$v0, $f1, 1
	lwc1	$v1, $f2, 1
	fmul	$f1, $f2, $f1
	fadd	$f0, $f1, $f0
	lwc1	$v0, $f1, 2
	lwc1	$v1, $f2, 2
	fmul	$f1, $f2, $f1
	fadd	$f0, $f1, $f0
	jr	$ra
accumulate_vec_mul.2124:
	lwc1	$v0, $f1, 0
	lwc1	$v1, $f2, 0
	fmul	$f0, $f2, $f2
	fadd	$f1, $f2, $f1
	swc1	$v0, $f1, 0
	lwc1	$v0, $f1, 1
	lwc1	$v1, $f2, 1
	fmul	$f0, $f2, $f2
	fadd	$f1, $f2, $f1
	swc1	$v0, $f1, 1
	lwc1	$v0, $f1, 2
	lwc1	$v1, $f2, 2
	fmul	$f0, $f2, $f0
	fadd	$f1, $f0, $f0
	swc1	$v0, $f0, 2
	jr	$ra
raytracing.2128:
	addi	$zero, $v1, min_caml_viewpoint
	addi	$zero, $a0, min_caml_vscan
	swc1	$sp, $f0, 0
	sw	$sp, $v0, 1
	addi	$v1, $v0, 0
	addi	$a0, $v1, 0
	sw	$sp, $ra, 2
	jal	tracer.2102
	lw	$sp, $ra, 2
	addi	$zero, $v1, 0
	sw	$sp, $v0, 2
	bne	$v0, $v1, beq_else.5973
	addi	$zero, $v1, 0
	lw	$sp, $a0, 1
	bne	$a0, $v1, beq_else.5975
	j	beq_cont.5976
beq_else.5975:
	addi	$zero, $v1, min_caml_vscan
	addi	$zero, $a1, min_caml_light
	addi	$v1, $v0, 0
	addi	$a1, $v1, 0
	sw	$sp, $ra, 3
	jal	in_prod.2121
	lw	$sp, $ra, 3
	fnegs	$f0, $f0
	addi	$zero, $v0, l.4465
	lwc1	$v0, $f1, 0
	fcondle	$f0, $f1
	bc1f	bc1t_else.5977
	j	bc1t_cont.5978
bc1t_else.5977:
	swc1	$sp, $f0, 3
	sw	$sp, $ra, 4
	jal	fsqr.1980
	lw	$sp, $ra, 4
	lwc1	$sp, $f1, 3
	fmul	$f0, $f1, $f0
	lwc1	$sp, $f1, 0
	fmul	$f0, $f1, $f0
	addi	$zero, $v0, min_caml_beam
	lwc1	$v0, $f2, 0
	fmul	$f0, $f2, $f0
	addi	$zero, $v0, min_caml_rgb
	addi	$zero, $v1, min_caml_rgb
	lwc1	$v1, $f2, 0
	fadd	$f2, $f0, $f2
	swc1	$v0, $f2, 0
	addi	$zero, $v0, min_caml_rgb
	addi	$zero, $v1, min_caml_rgb
	lwc1	$v1, $f2, 1
	fadd	$f2, $f0, $f2
	swc1	$v0, $f2, 1
	addi	$zero, $v0, min_caml_rgb
	addi	$zero, $v1, min_caml_rgb
	lwc1	$v1, $f2, 2
	fadd	$f2, $f0, $f0
	swc1	$v0, $f0, 2
bc1t_cont.5978:
beq_cont.5976:
	j	beq_cont.5974
beq_else.5973:
beq_cont.5974:
	addi	$zero, $v0, 0
	lw	$sp, $v1, 2
	bne	$v1, $v0, beq_else.5979
	jr	$ra
beq_else.5979:
	addi	$zero, $v0, min_caml_objects
	addi	$zero, $v1, min_caml_crashed_object
	lw	$v1, $v1, 0
	sll	$v1, $v1, 0
	lw	$v0, $v0, $v1
	addi	$zero, $v1, min_caml_crashed_point
	sw	$sp, $v0, 4
	sw	$sp, $ra, 5
	jal	get_nvector.2115
	lw	$sp, $ra, 5
	addi	$zero, $v0, 0
	addi	$zero, $v1, min_caml_or_net
	lw	$v1, $v1, 0
	addi	$zero, $a0, min_caml_crashed_point
	sw	$sp, $ra, 5
	jal	shadow_check_one_or_matrix.2089
	lw	$sp, $ra, 5
	addi	$zero, $v1, 0
	bne	$v0, $v1, beq_else.5981
	addi	$zero, $v0, min_caml_nvector
	addi	$zero, $v1, min_caml_light
	sw	$sp, $ra, 5
	jal	in_prod.2121
	lw	$sp, $ra, 5
	fnegs	$f0, $f0
	addi	$zero, $v0, l.4465
	lwc1	$v0, $f1, 0
	fcondle	$f1, $f0
	bc1f	bc1t_else.5983
	addi	$zero, $v0, l.4943
	lwc1	$v0, $f1, 0
	fadd	$f0, $f1, $f0
	j	bc1t_cont.5984
bc1t_else.5983:
	addi	$zero, $v0, l.4943
	lwc1	$v0, $f0, 0
bc1t_cont.5984:
	lwc1	$sp, $f1, 0
	fmul	$f0, $f1, $f0
	lw	$sp, $v0, 4
	swc1	$sp, $f0, 5
	sw	$sp, $ra, 6
	jal	o_diffuse.2006
	lw	$sp, $ra, 6
	lwc1	$sp, $f1, 5
	fmul	$f1, $f0, $f0
	j	beq_cont.5982
beq_else.5981:
	addi	$zero, $v0, l.4465
	lwc1	$v0, $f0, 0
beq_cont.5982:
	addi	$zero, $v1, min_caml_crashed_point
	lw	$sp, $v0, 4
	swc1	$sp, $f0, 6
	sw	$sp, $ra, 7
	jal	utexture.2118
	lw	$sp, $ra, 7
	addi	$zero, $v0, min_caml_rgb
	addi	$zero, $v1, min_caml_texture_color
	lwc1	$sp, $f0, 6
	sw	$sp, $ra, 7
	jal	accumulate_vec_mul.2124
	lw	$sp, $ra, 7
	lw	$sp, $v0, 1
	sgti	$v0, $cond, 4
	bne	$zero, $cond, beq_else.5985
	addi	$zero, $v1, l.4946
	lwc1	$v1, $f0, 0
	lwc1	$sp, $f1, 0
	fcondle	$f1, $f0
	bc1f	bc1t_else.5986
	jr	$ra
bc1t_else.5986:
	addi	$zero, $v1, l.4948
	lwc1	$v1, $f0, 0
	addi	$zero, $v1, min_caml_vscan
	addi	$zero, $a0, min_caml_nvector
	swc1	$sp, $f0, 7
	addi	$v1, $v0, 0
	addi	$a0, $v1, 0
	sw	$sp, $ra, 8
	jal	in_prod.2121
	lw	$sp, $ra, 8
	lwc1	$sp, $f1, 7
	fmul	$f1, $f0, $f0
	addi	$zero, $v0, min_caml_vscan
	addi	$zero, $v1, min_caml_nvector
	sw	$sp, $ra, 8
	jal	accumulate_vec_mul.2124
	lw	$sp, $ra, 8
	lw	$sp, $v0, 4
	sw	$sp, $ra, 8
	jal	o_reflectiontype.1988
	lw	$sp, $ra, 8
	addi	$zero, $v1, 1
	bne	$v0, $v1, beq_else.5988
	addi	$zero, $v0, l.4465
	lwc1	$v0, $f0, 0
	lw	$sp, $v0, 4
	swc1	$sp, $f0, 8
	sw	$sp, $ra, 9
	jal	o_hilight.2008
	lw	$sp, $ra, 9
	lwc1	$sp, $f1, 8
	fcondeq	$f1, $f0
	bc1f	bc1t_else.5989
	jr	$ra
bc1t_else.5989:
	addi	$zero, $v0, min_caml_vscan
	addi	$zero, $v1, min_caml_light
	sw	$sp, $ra, 9
	jal	in_prod.2121
	lw	$sp, $ra, 9
	fnegs	$f0, $f0
	addi	$zero, $v0, l.4465
	lwc1	$v0, $f1, 0
	fcondle	$f0, $f1
	bc1f	bc1t_else.5991
	jr	$ra
bc1t_else.5991:
	sw	$sp, $ra, 9
	jal	fsqr.1980
	lw	$sp, $ra, 9
	sw	$sp, $ra, 9
	jal	fsqr.1980
	lw	$sp, $ra, 9
	lwc1	$sp, $f1, 0
	fmul	$f0, $f1, $f0
	lwc1	$sp, $f1, 6
	fmul	$f0, $f1, $f0
	lw	$sp, $v0, 4
	swc1	$sp, $f0, 9
	sw	$sp, $ra, 10
	jal	o_hilight.2008
	lw	$sp, $ra, 10
	lwc1	$sp, $f1, 9
	fmul	$f1, $f0, $f0
	addi	$zero, $v0, min_caml_rgb
	addi	$zero, $v1, min_caml_rgb
	lwc1	$v1, $f1, 0
	fadd	$f1, $f0, $f1
	swc1	$v0, $f1, 0
	addi	$zero, $v0, min_caml_rgb
	addi	$zero, $v1, min_caml_rgb
	lwc1	$v1, $f1, 1
	fadd	$f1, $f0, $f1
	swc1	$v0, $f1, 1
	addi	$zero, $v0, min_caml_rgb
	addi	$zero, $v1, min_caml_rgb
	lwc1	$v1, $f1, 2
	fadd	$f1, $f0, $f0
	swc1	$v0, $f0, 2
	jr	$ra
beq_else.5988:
	addi	$zero, $v1, 2
	bne	$v0, $v1, beq_else.5994
	addi	$zero, $v0, min_caml_viewpoint
	addi	$zero, $v1, min_caml_crashed_point
	lwc1	$v1, $f0, 0
	swc1	$v0, $f0, 0
	addi	$zero, $v0, min_caml_viewpoint
	addi	$zero, $v1, min_caml_crashed_point
	lwc1	$v1, $f0, 1
	swc1	$v0, $f0, 1
	addi	$zero, $v0, min_caml_viewpoint
	addi	$zero, $v1, min_caml_crashed_point
	lwc1	$v1, $f0, 2
	swc1	$v0, $f0, 2
	addi	$zero, $v0, l.4467
	lwc1	$v0, $f0, 0
	lw	$sp, $v0, 4
	swc1	$sp, $f0, 10
	sw	$sp, $ra, 11
	jal	o_diffuse.2006
	lw	$sp, $ra, 11
	lwc1	$sp, $f1, 10
	fsub	$f1, $f0, $f0
	lwc1	$sp, $f1, 0
	fmul	$f1, $f0, $f0
	lw	$sp, $v0, 1
	addi	$v0, $v0, 1
	j	raytracing.2128
beq_else.5994:
	jr	$ra
beq_else.5985:
	jr	$ra
write_rgb.2131:
	addi	$zero, $v0, min_caml_rgb
	lwc1	$v0, $f0, 0
	sw	$sp, $ra, 0
	jal	min_caml_int_of_float
	lw	$sp, $ra, 0
	sgti	$v0, $cond, 255
	bne	$zero, $cond, beq_else.5997
	j	beq_cont.5998
beq_else.5997:
	addi	$zero, $v0, 255
beq_cont.5998:
	sw	$sp, $ra, 0
	jal	min_caml_print_byte
	lw	$sp, $ra, 0
	addi	$zero, $v0, min_caml_rgb
	lwc1	$v0, $f0, 1
	sw	$sp, $ra, 0
	jal	min_caml_int_of_float
	lw	$sp, $ra, 0
	sgti	$v0, $cond, 255
	bne	$zero, $cond, beq_else.5999
	j	beq_cont.6000
beq_else.5999:
	addi	$zero, $v0, 255
beq_cont.6000:
	sw	$sp, $ra, 0
	jal	min_caml_print_byte
	lw	$sp, $ra, 0
	addi	$zero, $v0, min_caml_rgb
	lwc1	$v0, $f0, 2
	sw	$sp, $ra, 0
	jal	min_caml_int_of_float
	lw	$sp, $ra, 0
	sgti	$v0, $cond, 255
	bne	$zero, $cond, beq_else.6001
	j	beq_cont.6002
beq_else.6001:
	addi	$zero, $v0, 255
beq_cont.6002:
	j	min_caml_print_byte
write_ppm_header.2133:
	addi	$zero, $v0, 80
	sw	$sp, $ra, 0
	jal	min_caml_print_byte
	lw	$sp, $ra, 0
	addi	$zero, $v0, 54
	sw	$sp, $ra, 0
	jal	min_caml_print_byte
	lw	$sp, $ra, 0
	addi	$zero, $v0, 10
	sw	$sp, $ra, 0
	jal	min_caml_print_byte
	lw	$sp, $ra, 0
	addi	$zero, $v0, min_caml_size
	lw	$v0, $v0, 0
	sw	$sp, $ra, 0
	jal	min_caml_print_int
	lw	$sp, $ra, 0
	addi	$zero, $v0, 32
	sw	$sp, $ra, 0
	jal	min_caml_print_byte
	lw	$sp, $ra, 0
	addi	$zero, $v0, min_caml_size
	lw	$v0, $v0, 1
	sw	$sp, $ra, 0
	jal	min_caml_print_int
	lw	$sp, $ra, 0
	addi	$zero, $v0, 10
	sw	$sp, $ra, 0
	jal	min_caml_print_byte
	lw	$sp, $ra, 0
	addi	$zero, $v0, 255
	sw	$sp, $ra, 0
	jal	min_caml_print_int
	lw	$sp, $ra, 0
	addi	$zero, $v0, 10
	j	min_caml_print_byte
scan_point.2135:
	addi	$zero, $v1, min_caml_size
	lw	$v1, $v1, 0
	sgt	$v1, $cond, $v0
	bne	$zero, $cond, beq_else.6003
	jr	$ra
beq_else.6003:
	sw	$sp, $v0, 0
	sw	$sp, $ra, 1
	jal	min_caml_float_of_int
	lw	$sp, $ra, 1
	addi	$zero, $v0, min_caml_scan_offset
	lwc1	$v0, $f1, 0
	fsub	$f0, $f1, $f0
	addi	$zero, $v0, min_caml_scan_d
	lwc1	$v0, $f1, 0
	fmul	$f0, $f1, $f0
	addi	$zero, $v0, min_caml_vscan
	addi	$zero, $v1, min_caml_cos_v
	lwc1	$v1, $f1, 1
	fmul	$f0, $f1, $f1
	addi	$zero, $v1, min_caml_wscan
	lwc1	$v1, $f2, 0
	fadd	$f1, $f2, $f1
	swc1	$v0, $f1, 0
	addi	$zero, $v0, min_caml_vscan
	addi	$zero, $v1, min_caml_scan_sscany
	lwc1	$v1, $f1, 0
	addi	$zero, $v1, min_caml_cos_v
	lwc1	$v1, $f2, 0
	fmul	$f1, $f2, $f1
	addi	$zero, $v1, min_caml_vp
	lwc1	$v1, $f2, 1
	fsub	$f1, $f2, $f1
	swc1	$v0, $f1, 1
	addi	$zero, $v0, min_caml_vscan
	fnegs	$f0, $f1
	addi	$zero, $v1, min_caml_sin_v
	lwc1	$v1, $f2, 1
	fmul	$f1, $f2, $f1
	addi	$zero, $v1, min_caml_wscan
	lwc1	$v1, $f2, 2
	fadd	$f1, $f2, $f1
	swc1	$v0, $f1, 2
	sw	$sp, $ra, 1
	jal	fsqr.1980
	lw	$sp, $ra, 1
	addi	$zero, $v0, min_caml_scan_met1
	lwc1	$v0, $f1, 0
	fadd	$f0, $f1, $f0
	sw	$sp, $ra, 1
	jal	min_caml_sqrt
	lw	$sp, $ra, 1
	addi	$zero, $v0, min_caml_vscan
	addi	$zero, $v1, min_caml_vscan
	lwc1	$v1, $f1, 0
	fdiv	$f1, $f0, $f1
	swc1	$v0, $f1, 0
	addi	$zero, $v0, min_caml_vscan
	addi	$zero, $v1, min_caml_vscan
	lwc1	$v1, $f1, 1
	fdiv	$f1, $f0, $f1
	swc1	$v0, $f1, 1
	addi	$zero, $v0, min_caml_vscan
	addi	$zero, $v1, min_caml_vscan
	lwc1	$v1, $f1, 2
	fdiv	$f1, $f0, $f0
	swc1	$v0, $f0, 2
	addi	$zero, $v0, min_caml_viewpoint
	addi	$zero, $v1, min_caml_view
	lwc1	$v1, $f0, 0
	swc1	$v0, $f0, 0
	addi	$zero, $v0, min_caml_viewpoint
	addi	$zero, $v1, min_caml_view
	lwc1	$v1, $f0, 1
	swc1	$v0, $f0, 1
	addi	$zero, $v0, min_caml_viewpoint
	addi	$zero, $v1, min_caml_view
	lwc1	$v1, $f0, 2
	swc1	$v0, $f0, 2
	addi	$zero, $v0, min_caml_rgb
	addi	$zero, $v1, l.4465
	lwc1	$v1, $f0, 0
	swc1	$v0, $f0, 0
	addi	$zero, $v0, min_caml_rgb
	addi	$zero, $v1, l.4465
	lwc1	$v1, $f0, 0
	swc1	$v0, $f0, 1
	addi	$zero, $v0, min_caml_rgb
	addi	$zero, $v1, l.4465
	lwc1	$v1, $f0, 0
	swc1	$v0, $f0, 2
	addi	$zero, $v0, 0
	addi	$zero, $v1, l.4467
	lwc1	$v1, $f0, 0
	sw	$sp, $ra, 1
	jal	raytracing.2128
	lw	$sp, $ra, 1
	sw	$sp, $ra, 1
	jal	write_rgb.2131
	lw	$sp, $ra, 1
	lw	$sp, $v0, 0
	addi	$v0, $v0, 1
	j	scan_point.2135
scan_line.2137:
	addi	$zero, $v1, min_caml_size
	lw	$v1, $v1, 0
	sgt	$v1, $cond, $v0
	bne	$zero, $cond, beq_else.6005
	jr	$ra
beq_else.6005:
	addi	$zero, $v1, min_caml_scan_sscany
	addi	$zero, $a0, min_caml_scan_offset
	lwc1	$a0, $f0, 0
	addi	$zero, $a0, l.4467
	lwc1	$a0, $f1, 0
	fsub	$f0, $f1, $f0
	sw	$sp, $v0, 0
	sw	$sp, $v1, 1
	swc1	$sp, $f0, 2
	sw	$sp, $ra, 3
	jal	min_caml_float_of_int
	lw	$sp, $ra, 3
	lwc1	$sp, $f1, 2
	fsub	$f1, $f0, $f0
	addi	$zero, $v0, min_caml_scan_d
	lwc1	$v0, $f1, 0
	fmul	$f1, $f0, $f0
	lw	$sp, $v0, 1
	swc1	$v0, $f0, 0
	addi	$zero, $v0, min_caml_scan_met1
	addi	$zero, $v1, min_caml_scan_sscany
	lwc1	$v1, $f0, 0
	sw	$sp, $v0, 3
	sw	$sp, $ra, 4
	jal	fsqr.1980
	lw	$sp, $ra, 4
	addi	$zero, $v0, l.5009
	lwc1	$v0, $f1, 0
	fadd	$f0, $f1, $f0
	lw	$sp, $v0, 3
	swc1	$v0, $f0, 0
	addi	$zero, $v0, min_caml_scan_sscany
	lwc1	$v0, $f0, 0
	addi	$zero, $v0, min_caml_sin_v
	lwc1	$v0, $f1, 0
	fmul	$f0, $f1, $f0
	addi	$zero, $v0, min_caml_wscan
	addi	$zero, $v1, min_caml_sin_v
	lwc1	$v1, $f1, 1
	fmul	$f0, $f1, $f1
	addi	$zero, $v1, min_caml_vp
	lwc1	$v1, $f2, 0
	fsub	$f1, $f2, $f1
	swc1	$v0, $f1, 0
	addi	$zero, $v0, min_caml_wscan
	addi	$zero, $v1, min_caml_cos_v
	lwc1	$v1, $f1, 1
	fmul	$f0, $f1, $f0
	addi	$zero, $v1, min_caml_vp
	lwc1	$v1, $f1, 2
	fsub	$f0, $f1, $f0
	swc1	$v0, $f0, 2
	addi	$zero, $v0, 0
	sw	$sp, $ra, 4
	jal	scan_point.2135
	lw	$sp, $ra, 4
	lw	$sp, $v0, 0
	addi	$v0, $v0, 1
	j	scan_line.2137
scan_start.2139:
	sw	$sp, $ra, 0
	jal	write_ppm_header.2133
	lw	$sp, $ra, 0
	addi	$zero, $v0, min_caml_size
	lw	$v0, $v0, 0
	sw	$sp, $ra, 0
	jal	min_caml_float_of_int
	lw	$sp, $ra, 0
	addi	$zero, $v0, min_caml_scan_d
	addi	$zero, $v1, l.5021
	lwc1	$v1, $f1, 0
	fdiv	$f1, $f0, $f1
	swc1	$v0, $f1, 0
	addi	$zero, $v0, min_caml_scan_offset
	addi	$zero, $v1, l.4440
	lwc1	$v1, $f1, 0
	fdiv	$f0, $f1, $f0
	swc1	$v0, $f0, 0
	addi	$zero, $v0, 0
	j	scan_line.2137
rt.2141:
	addi	$zero, $a1, min_caml_size
	sw	$a1, $v0, 0
	addi	$zero, $v0, min_caml_size
	sw	$v0, $v1, 1
	addi	$zero, $v0, min_caml_dbg
	sw	$v0, $a0, 0
	sw	$sp, $ra, 0
	jal	read_parameter.2043
	lw	$sp, $ra, 0
	j	scan_start.2139
.global	min_caml_start
min_caml_start:
	addi	$zero, $v0, 768
	addi	$zero, $v1, 768
	addi	$zero, $a0, 0
	sw	$sp, $ra, 0
	jal	rt.2141
	lw	$sp, $ra, 0
	jr $ra
	hlt
