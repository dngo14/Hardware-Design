	.section	.rodata
	.align	2
prompt:
	.asciz	"Enter a line of input: "	
	.align	2
resultchar:
	.asciz	"The characters with index 0 and 2 are %c and %c\n"
	.align	2
resultstring:
	.asciz "%s\n"
	.text
	.align	2

gettrans:
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-8]
	
	ldr	r0, [fp, #-8]
	mov	r1, #1
	bl	get_byte
	cmp	r0, #''
	beq	else

	ldr	r0, [fp, #-8]
	mov	r1, #3
	bl	get_byte
	cmp	r0, #'\n'
	beq	else
	
	ldr     r0, [fp, #-8]
	mov     r1, #4
	bl	get_byte
	cmp	r0, #0
	beq	else

	ldr	r0, [fp, #-8]
	mov	r1, #0
	bl	get_byte
	mov	r4, r0

	ldr	r0, [fp, #-8]
	mov	r1, #2
	bl	get_byte
	mov	r5, r0

	mov     r0, #1
	b 	next
else:
        mov     r0, #0	
next:
	sub	sp, fp, #4
	pop	{fp, pc}
        .text
        .align  2
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

	ldr	r0, buffp
	bl	gettrans
	
	ldr	r0, resultcharp
	mov	r1, r4
	mov	r2, r5
        bl      printf

	
	ldr	r1, resultstringp
	ldr	r0, buffp
	bl	printf
	mov	r0, #0

	sub	sp, fp, #4
	pop	{fp, pc}


	.align	2
	
buffp:		.word	buff
promptp:	.word	prompt
resultstringp:	.word	resultstring
resultcharp:	.word	resultchar
	.data
	.align	2
buff:	.skip	100
