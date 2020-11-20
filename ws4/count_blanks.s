	.section	.rodata
	.align	2
prompt:						@strings
	.asciz	"Enter a line of input\n"	
	.align	2
summary:
	.asciz "There were %d characters including 3 spaces.\n"
	.text
	.align	2
	.global	main
main:
	push	{fp, lr}
	add	fp, sp, #4	@setup
	sub	sp, sp, #16
	
	ldr	r0, promptp	@print prompt
	bl	printf

	ldr	r0, buffp	@get line input from user
	mov	r1, #100
	bl	get_line

	mov	r1, #0		@initialize count with 0
	str	r1, [fp, #-8]

	mov	r1, #0		@initialize i with 0
	str	r1, [fp, #-12]

	b	guard		@branch to guard
else:
	ldr	r1, [fp, #-8]
	add	r1, r1, #1	@add 1 to count
	str	r1, [fp, #-8]
	
	ldr     r1, [fp, #-12]
	add     r1, r1, #1	@add 1 to i
	str     r1, [fp, #-12]

	b	guard		@branch to guard
body:
	cmp	r0, #' '	@compare to a space
	beq	else

	ldr	r1, [fp, #-12]
	add	r1, r1, #1	@if not a space just add 1 to i
	str	r1, [fp, #-12]
	
guard:
	ldr	r0, buffp
	ldr	r1, [fp, #-12]	@get byte at index i
	bl	get_byte
	cmp	r0, #0		@compares to nullbyte
	bne	body

	ldr	r0, summaryp
	ldr	r1, [fp, #-12]	@load local variables and prints summary
	ldr	r2, [fp, #-8]
	bl	printf
	
	mov	r0, #0		@return 0

	sub	sp, fp, #4	@teardown
	pop	{fp, pc}


	.align	2
	
buffp:		.word	buff
promptp:	.word	prompt	@pointers
summaryp:	.word	summary
	.data
	.align	2	@creates array to hold input
buff:	.skip	100

