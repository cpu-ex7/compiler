.section	".rodata"
.align	8
l.24:	! 0.000000
	.long	0x0
	.long	0x0
l.22:	! 10.000000
	.long	0x0
	.long	0x40240000
l.20:	! 1.000000
	.long	0x0
	.long	0x3ff00000
l.18:	! 0.200000
	.long	0x9999999a
	.long	0x3fc99999
.section	".text"
mul.8:
	set	l.18, %i2
	ldd	[%i2 + 0], %f4
	fcmpd	%f4, %f0
	nop
	fbg	fble_else.27
	nop
	set	l.20, %i2
	ldd	[%i2 + 0], %f4
	fsubd	%f0, %f4, %f4
	faddd	%f0, %f2, %f2
	fmovs	%f4, %f0
	fmovs	%f5, %f1
	b	mul.8
	nop
fble_else.27:
	fmovs	%f2, %f0
	fmovs	%f3, %f1
	retl
	nop
.global	min_caml_start
min_caml_start:
	save	%sp, -112, %sp
	set	l.22, %i2
	ldd	[%i2 + 0], %f0
	set	l.24, %i2
	ldd	[%i2 + 0], %f2
	st	%o7, [%i0 + 4]
	call	mul.8
	add	%i0, 8, %i0	! delay slot
	sub	%i0, 8, %i0
	ld	[%i0 + 4], %o7
	st	%o7, [%i0 + 4]
	call	min_caml_print_float
	add	%i0, 8, %i0	! delay slot
	sub	%i0, 8, %i0
	ld	[%i0 + 4], %o7
	ret
	restore
