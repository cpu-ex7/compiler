.section	".rodata"
.align	8
.section	".text"
f.4:
	add	%i2, %i3, %i2
	retl
	nop
g.7:
	st	%o7, [%i0 + 4]
	call	f.4
	add	%i0, 8, %i0	! delay slot
	sub	%i0, 8, %i0
	ld	[%i0 + 4], %o7
	mov	%i2, %i3
	b	f.4
	nop
h.10:
	st	%o7, [%i0 + 4]
	call	g.7
	add	%i0, 8, %i0	! delay slot
	sub	%i0, 8, %i0
	ld	[%i0 + 4], %o7
	mov	%i2, %i3
	b	g.7
	nop
.global	min_caml_start
min_caml_start:
	save	%sp, -112, %sp
	set	2, %i2
	set	3, %i3
	st	%o7, [%i0 + 4]
	call	h.10
	add	%i0, 8, %i0	! delay slot
	sub	%i0, 8, %i0
	ld	[%i0 + 4], %o7
	st	%o7, [%i0 + 4]
	call	min_caml_print_int
	add	%i0, 8, %i0	! delay slot
	sub	%i0, 8, %i0
	ld	[%i0 + 4], %o7
	ret
	restore
