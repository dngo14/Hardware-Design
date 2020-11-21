/* testsumseq.s - ARM assembly test program for sumseq() */

/* string constants */
	.section .rodata
	.align	2
prompt:			@ format string for printf
	.asciz "Enter two integers in increasing order:  "
	.align	2
input:			@ format string for scanf
	.asciz "%d %d"
	.align	2
results:		@ format string for printf
	.asciz "The call sumseq(%d, %d) returns %d\n"

/* REPLACE THIS COMMENT BY YOUR DEFINITION OF sumseq() */
sumseq:
	push 	{fp, lr}
	add	fp, sp, #4	@setup frame
	sub	sp, sp, #16

	str	r0, [fp, #-8]
	str	r1, [fp, #-12]	@store arguments

	mov	r0, #0
	str	r0, [fp, #-16]	@create variable counter

	b	guard	@branch to guard
body:
	ldr	r0, [fp, #-8]
	ldr	r1, [fp, #-16]	@load argument 1 and the counter

	add	r1, r0, r1
	str	r1, [fp, #-16]	@accumulate the counter

	add	r0, r0, #1	@add 1 to argument
	str	r0, [fp, #-8]
guard:
	ldr     r0, [fp, #-8]
	ldr     r1, [fp, #-12]	@load both arguments and compare
	cmp	r0, r1
	ble 	body		@branch if less than or equal to

	ldr	r0, [fp, #-16]	@return the counter

	sub	sp, fp, #4	@teardown frame
	pop	{fp, pc}
/* main program */
	.text
	.align	2
	.global main
main:
	push	{fp, lr}	@ setup stack frame
	add	fp, sp, #4
	sub	sp, sp, #16	@ ADD INLINE DOCUMENTATION
	@ ADD FULL LINE DOCUMENTATION HERE

	ldr	r0, promptP	@ print prompt
	bl	printf

	ldr	r0, inputP	@ read values into a and b
	sub	r1, fp, #8	
	sub	r2, fp, #12	
	bl	__isoc99_scanf

	ldr	r0, [fp, #-8]	@ call sumseq(a, b)
	ldr	r1, [fp, #-12]
	bl	sumseq
	str	r0, [fp, #-16]	@ store return value in local variable ret

	ldr	r0, resultsP	@ print results
	ldr	r1, [fp, #-8]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	bl	printf

	mov	r0, #0		@ load return value
	sub	sp, fp, #4	@ tear down stack frame
	pop	{fp, pc}

/* pointer variables for format strings  */
	.align	2
promptP: 	.word	prompt	
inputP:		.word	input	
resultsP:	.word	results	
