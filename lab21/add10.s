	.section	.rodata
	.align
	/* strings */
prompt:	
	.asciz	"Enter an Integer: "
	.align	2
input:
	.asciz	"%d"
	.align	2
result:
	.asciz	"Ten plus %d equals %d\n"
	.text
	.align
	.global main
main:	/* main function */
	push	{fp, lr}	@setup frame
	add	fp, sp, #4
	sub	sp, sp, #8
	ldr	r0, promptP	@prints the prompt
	bl	printf
	ldr	r0, inputP	@gets the input
	sub	r1, fp, #8
	bl	__isoc99_scanf
	ldr	r1, [fp, #-8]	@adds 10 to the input
	add	r2, r1, #10
	str	r2,[fp, #-12]	@stores the new number
	ldr	r0, resultP
	ldr	r1, [fp, #-8]
	ldr	r2, [fp, #-12]	@gets the new number and prints it
	bl	printf
	mov	r0, #0	@returns 0 in main
	sub	sp, fp, #4	@tears down frame
	pop	{fp, pc}
	.align	2
promptP:	.word	prompt
inputP:		.word	input
resultP:	.word	result
