	.section 	.rodata
	.align
prompt:
	.asciz	"Enter an integer: "
	.align	2
input:
	.asciz	"%d"
	.align	2
result:
	.asciz	"isdigit(%d) returns %d\n"
	.text
	.align	2
isdigit:
	push	{fp, lr}	@stack setup
	add	fp, sp, #4
	sub	sp, sp, #8	
	str	r0, [fp, #-8]	@store variable
	b	guard		@branch to guard
guard:
	ldr	r0, [fp, #-8]	@load stored variable
	cmp	r0, #0		@cmp the variable to 0
	ble	else		@branch if less than 0
	cmp	r0, #255
	bge	else
	mov	r0, #1		@if not less than 0 return 1/store it
	str	r0, [fp, #-12]
	b	next		@branch to next

else:	
	mov	r0, #0		@return 0/store it
	str	r0, [fp, #-12]
next:
	ldr     r0, [fp, #-12]	@load the stored 1 or 0 and puts it into r0
	sub     sp, fp, #4
        pop     {fp, pc}	@stack teardown
        .text
        .align  2
        .global main

	
main:
	push	{fp, lr}	@stack setup
	add	fp, sp, #4
	sub	sp, sp, #8
	ldr	r0, promptp	@print prompt
	bl	printf
	ldr	r0, inputp	@get input
	sub	r1, fp, #8
	bl	__isoc99_scanf
	ldr	r0, [fp, #-8]	@call the function isneg
	bl	isdigit
	str	r0, [fp, #-12]	@store return value
	ldr	r0, resultp	
	ldr	r1, [fp, #-8]
	ldr	r2, [fp, #-12]	@print the result
	bl	printf
	mov	r0, #0		@stack teardown
	sub	sp, fp, #4
	pop	{fp, pc}
	.align	2
promptp:	.word	prompt		@pointers
inputp:		.word	input
resultp:	.word	result
	
