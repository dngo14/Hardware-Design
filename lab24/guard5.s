/* guard.s - example of guard in assembly */

/* format strings for I/O */	
	.section 	.rodata
	.align	2
prompt:	.asciz "Enter x: "
	.align	2
scanf_fmt:
	.asciz "%d"
	.align	2
le_msg:	.asciz "%d is not greater than '0' and/or not less than '9'\n"
	.align	2
gt_msg:	.asciz "%d is greater than '0' and less than '9'\n"

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
	bl	__isoc99_scanf

	ldr	r0, [fp, #-8]		
	cmp	r0, #'0'		
	bgt	else
	cmp	r0, #'9'
	ldr	r0, le_msgP	
	ldr	r1, [fp, #-8]		
	bl	printf
	b	next

else:
	ldr	r0, gt_msgP	@ else print greater-than message
	ldr	r1, [fp, #-8]		
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
