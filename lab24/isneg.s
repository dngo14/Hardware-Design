	.section 	.rodata
	.align
prompt:
	.asciz	"Enter an integer: "
	.align	2
input:
	.asciz	"%d"
	.align	2
result:
	.asciz	"isneg(%d) returns %d\n"
	.text
	.align	2
	.global main
main:
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	ldr	r0, promptp
	bl	printf
	ldr	r0, inputp
	sub	r1, fp, #8
	bl	__isoc99_scanf
	ldr	r0, resultp
	ldr	r1, [fp, #-8]
	ldr	r2, [fp, #-12]
	bl	printf
	mov	r0, #0
	sub	sp, fp, #4
	pop	{fp, pc}
	.align	2
promptp:	.word	prompt
inputp:		.word	input
resultp:	.word	result
	
