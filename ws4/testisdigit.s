/* string constants */
	.section .rodata
	.align	2
prompt:			@ format string for printf
	.asciz "Enter an integer ASCII code:  "
	.align	2
input:			@ format string for scanf
	.asciz "%d"
	.align	2
results:			@ format string for printf
	.asciz "The call isdigit(%d) returns %d\n"

/* REPLACE THIS COMMENT BY YOUR DEFINITION OF isdigit() */
	.text
	.align	2
isdigit:
	push	{fp, lr}
	add	fp, sp, #4	@setup
	sub	sp, sp, #16

	str	r0, [fp, #-8]
	ldr	r0, [fp, #-8]	@str argument

	cmp	r0, #'0'	@compares if argument is less than '0'
	blt	else

	cmp	r0, #'9'	@compares if argument is greater than '9'
	bgt	else

	mov	r0, #1		@str 1 in local variable
	str	r0, [fp, #-12]

	b	next		@branch to next
else:
	mov	r0, #0		@str 0 in local variable
	str	r0, [fp, #-12]
next:
	ldr	r0, [fp, #-12]	@return local variable
	sub	sp, fp, #4
	pop	{fp, pc}	@teardown
/* main program */
	.text
	.align	2
	.global main
main:
	push	{fp, lr}	@ setup stack frame
	add	fp, sp, #4
	sub	sp, sp, #8	@ ADD INLINE DOCUMENTATION
	@ ADD FULL LINE DOCUMENTATION HERE

	ldr	r0, promptP	@ print prompt
	bl	printf

	ldr	r0, inputP	@ read value into x
	sub	r1, fp, #8	
	bl	__isoc99_scanf

	ldr	r0, [fp, #-8]	@ call isdigit(x)
	bl	isdigit
	str	r0, [fp, #-12]	@ store return value in local variable ret

	ldr	r0, resultsP	@ print results
	ldr	r1, [fp, #-8]
	ldr	r2, [fp, #-12]
	bl	printf

	mov	r0, #0		@ load return value
	sub	sp, fp, #4	@ tear down stack frame
	pop	{fp, pc}

/* pointer variables for format strings  */
	.align	2
promptP: 	.word	prompt	
inputP:		.word	input	
resultsP:	.word	results	
