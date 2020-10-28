/* testdouble.s - ARM assembly test program for double() */

/* string constants */
	.section .rodata
	.align	2
prompt:			@ format string for printf
	.asciz "Enter an integer:  "
	.align	2
input:			@ format string for scanf
	.asciz "%d"
	.align	2
results:			@ format string for printf
	.asciz "The call double(%d) returns %d\n"

	/* REPLACE THIS BY YOUR DEFINITION OF double() HERE */
	.text
	.align 2
double:
	push	{fp,lr}	@setup stack
	add	fp,sp,#4
	sub	sp,sp,#8
	str	r0,[fp,#-8]	@store argument
	ldr	r0,[fp,#-8]
	add	r0, r0, r0	@does evaulation double
	sub	sp,fp,#4	@tear down stack
	pop	{fp,pc}
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

	ldr	r0, [fp, #-8]	@ call double(x)
	bl	double
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
