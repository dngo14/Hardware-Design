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

	/* REPLACE THIS COMMENT BY YOUR DEFINITION OF pow() */
	.text
	.align	2
pow:
        push    {fp, lr}
        add     fp, sp, #4	@setup
        sub     sp, sp, #16

        str     r0, [fp, #-8]	@stores x
        str     r1, [fp, #-12]	@stores p

        mov     r0, #0
        str     r0, [fp, #-16]	@creates counter

        mov     r0, #1
        str     r0, [fp, #-20]	@creates the product

        b       guard
body:
        ldr     r0, [fp, #-8]
        ldr     r1, [fp, #-20]	@loads x and the product then multiplies
        mul     r2, r1, r0
        str     r2, [fp, #-20]

        ldr     r0, [fp, #-16]
        add     r0, r0, #1	@add 1 to the counter
        str     r0, [fp, #-16]

guard:
        ldr     r0, [fp, #-16]
        ldr     r1, [fp, #-12]	@compares the counter to p and branches if less than p
        cmp     r0, r1
        blt     body

        ldr     r0, [fp, #-20]	@returns the product

        sub     sp, fp, #4	@teardown
        pop     {fp, pc}
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
