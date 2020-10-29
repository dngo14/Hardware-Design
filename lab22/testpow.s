/* testpow.s - ARM assembly test program for pow() */

/* string constants */
	.section .rodata
	.align	2
prompt:			@ format string for printf
	.asciz "Enter two integers:  "
	.align	2
input:			@ format string for scanf
	.asciz "%d %d"
	.align	2
results:			@ format string for printf
	.asciz "The call pow(%d, %d) returns %d\n"
	.text
	.align 2

/* REPLACE THIS COMMENT BY YOUR DEFINITION OF power */
pow:
	push	{fp,lr}
	add	fp,sp,#4
	sub	sp,sp,#16
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	mov	r2, #0
	str	r2, [fp, #-16]
	mov	r2, #1
	str	r2, [fp, #-20]
	b	guard
body:
	ldr	r0,[fp,#-8]
	ldr	r1, [fp, #-20]
	mul	r3,r1,r0
	str	r3, [fp, #-20]
	ldr	r1, [fp,#-16]
	add	r1, r1, #1
	str	r1, [fp, #-16]
guard:
        ldr     r1, [fp, #-12]
        ldr	r2, [fp, #-16]
        cmp     r2, r1
        blt     body
	ldr	r0, [fp, #-20]
	sub	sp,fp,#4
	pop	{fp,pc}
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

	ldr	r0, inputP	@ read values into x and p
	sub	r1, fp, #8	
	sub	r2, fp, #12	
	bl	__isoc99_scanf

	ldr	r0, [fp, #-8]	@ call pow(x, p)
	ldr	r1, [fp, #-12]
	bl	pow
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
