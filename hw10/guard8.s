/* guard.s - example of guard in assembly */

/* format strings for I/O */	
	.section 	.rodata
	.align	2
prompt:	.asciz "Enter two integers x and y: "
	.align	2
scanf_fmt:
	.asciz "%d %d"
	.align	2
le_msg:	.asciz "%d is between 0 and -10 and plus %d is greater than 7 (AKA 1)\n" 
	.align	2
gt_msg:	.asciz "%d is not between 0 and -10 and/or plus %d not greater than 7(AKA 0)\n"

/* main program */
	.text
	.align	2
	.global	main
main:
	push	{fp, lr}	@ setup stack frame
	add	fp, sp, #4
	sub	sp, sp, #8	@ #8 for 2 local variables
	@ [fp, #-8] is x, first integer variable
	@ [fp, #-12] is y, second integer variable

	ldr	r0, promptP	@ print prompt
	bl	printf
	ldr	r0, scanf_fmtP  @ read values of x and y
	sub	r1, fp, #8
	sub	r2, fp, #12
	bl	__isoc99_scanf

	ldr	r0, [fp, #-8]	
	cmp	r0, #0		
	bgt	else
	ldr	r1, [fp, #-12]
	add	r2, r1, r0
	cmp	r2, #7
	ble	else
	ldr	r0, [fp, #-8]
	cmp	r0, #-10
	bge	else
	ldr	r0, le_msgP	@ then print less-than/equal-to message	
	ldr	r1, [fp, #-8]
	ldr	r2, [fp, #-12]
	bl	printf
	b	next

else:
	ldr	r0, gt_msgP	@ else print greater-than message
	ldr	r1, [fp, #-8]
	ldr	r2, [fp, #-12]
	bl	printf

next:
	mov	r0, #0		@ assign 0 as return value
	sub	sp, fp, #4	@ tear down stack frame
	pop	{fp, pc}

/* pointer variables for format strings */
	.align	2
promptP:
	.word	prompt
scanf_fmtP:
	.word	scanf_fmt	
le_msgP:
	.word	le_msg
gt_msgP:
	.word	gt_msg
