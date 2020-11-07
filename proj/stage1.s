	.section	.rodata
	.align	2
prompt:
	.asciz	"Enter a line of input: "	
	.align	2
result:
	.asciz "%s\n"
	.text
	.align2

gettrans:
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	
	
	.text
	.align 	2
	.global main
main:
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	ldr	r0, promptp
	bl	printf

	ldr	r0, buffp
	mov	r1, #100
	bl	get_line
	str	r0, [fp, #-8]
	
	ldr	r1, resultp
	ldr	r0, buffp
	bl	printf
	mov	r0, #0

	sub	sp, fp, #4
	pop	{fp, pc}


	.align	2
	
buffp:		.word	buff
promptp:	.word	prompt
resultp:	.word	result
	.data
	.align	2
buff:	.skip	100
