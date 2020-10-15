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
	.file	"rfact.c"
	.text
	.align	2
	.global	fact
	.arch armv6
	.syntax unified
	.arm
	.fpu vfp
	.type	fact, %function
fact:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L2
	mov	r3, #1
	b	.L3
.L2:
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	mov	r0, r3
	bl	fact
	mov	r2, r0
	ldr	r3, [fp, #-8]
	mul	r3, r3, r2
.L3:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	fact, .-fact
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Enter a non-negative integer: \000"
	.align	2
.LC1:
	.ascii	"%d\000"
	.align	2
.LC2:
	.ascii	"error, negative integer entered\000"
	.align	2
.LC3:
	.ascii	"The factorial of %d is %d\012\000"
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfp
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	ldr	r0, .L8
	bl	printf
	sub	r3, fp, #12
	mov	r1, r3
	ldr	r0, .L8+4
	bl	__isoc99_scanf
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bge	.L5
	ldr	r0, .L8+8
	bl	puts
	mvn	r3, #0
	b	.L7
.L5:
	ldr	r3, [fp, #-12]
	mov	r0, r3
	bl	fact
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-8]
	mov	r1, r3
	ldr	r0, .L8+12
	bl	printf
	mov	r3, #0
.L7:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L9:
	.align	2
.L8:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.size	main, .-main
	.ident	"GCC: (Raspbian 8.3.0-6+rpi1) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
