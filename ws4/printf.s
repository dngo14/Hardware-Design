	.arch armv6
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"sumdbl.c"
	.text
	.align	2
	.global	dbl
	.arch armv6
	.syntax unified
	.arm
	.fpu vfp
	.type	dbl, %function
dbl:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	add	r3, r3, r3
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	dbl, .-dbl
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Enter two integers in increasing order:  \000"
	.align	2
.LC1:
	.ascii	"%d %d\000"
	.align	2
.LC2:
	.ascii "Start value is %d\012\000"
	.align	2
.LC3:
	 .ascii  "The sum of dbl() calls up to %d is %d\012\000"
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfp
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	mov	r3, #0
	str	r3, [fp, #-8]
	ldr	r0, .L7
	bl	printf
	sub	r2, fp, #16
	sub	r3, fp, #12
	mov	r1, r3
	ldr	r0, .L7+4
	bl	__isoc99_scanf
	ldr     r3, [fp, #-12]
        mov     r1, r3
        ldr     r0, .L7+8
        bl      printf
	b	.L4
.L5:
	ldr	r3, [fp, #-12]
	mov	r0, r3
	bl	dbl
	mov	r2, r0
	ldr	r3, [fp, #-8]
	add	r3, r3, r2
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L4:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	ble	.L5
	ldr     r3, [fp, #-16]
        ldr     r2, [fp, #-8]
        mov     r1, r3
        ldr     r0, .L7+12
	bl	printf
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L8:
	.align	2
.L7:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.size	main, .-main
	.ident	"GCC: (Raspbian 8.3.0-6+rpi1) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
