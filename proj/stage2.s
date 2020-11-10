	.section	.rodata
	.align	2
prompt:
	.asciz	"Enter a line of input: "	
	.align	2
prompt2:
	.asciz	"Enter another line of input: "
	.align	2
resultchar:
	.asciz	"The characters with index 0 and 2 are %c and %c\n"
	.align	2
summary:
	.asciz "Summary: \n %d characters\n"
	.align	2
resultstring:
	.asciz "%s\n"
	.text
	.align	2
	
print_summary:
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8

	ldr	r0, summaryp
	mov	r1, r6
	bl	printf
	
	sub	sp, fp, #4
	pop	{fp, pc}
	.text
	.align	2
	
translate:
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, fp, #16
	str	r0, [fp, #-8]

	mov	r3, #0
	str	r3, [fp, #-12]
	b	guard
	
else2:
	ldr     r0, buffp
        ldr     r1, [fp, #-12]
        mov     r2, r5
        bl      put_byte

        ldr     r3, [fp, #-12]
        add     r3, r3, #1
        str     r3, [fp, #-12]
        add     r6, r6, #1
	b	guard
body:
	ldr	r0, buffp
	ldr	r1, [fp, #-12]
	bl	get_byte

	cmp	r0, r4
	beq	else2

	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
	add	r6, r6, #1
	
guard:
	ldr     r0, buffp
        ldr	r1, [fp, #-12]
	bl	get_byte
	
	cmp	r0, #0
	bne	body

	ldr	r0, buffp
	
	sub     sp, fp, #4
	pop     {fp, pc}
	.text
	.align  2
	
gettrans:
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-8]

	ldr	r0, [fp, #-8]
	mov	r1, #0
	bl	get_byte
	cmp	r0, #0
	beq	else
	
	ldr	r0, [fp, #-8]
	mov	r1, #1
	bl	get_byte
	cmp	r0, #' '
	bne	else

	ldr     r0, [fp, #-8]
	mov     r1, #2
	bl      get_byte
	cmp     r0, #0
	beq     else
	
	ldr	r0, [fp, #-8]
	mov	r1, #3
	bl	get_byte
	cmp	r0, #'\n'
	bne	else
	
	ldr     r0, [fp, #-8]
	mov     r1, #4
	bl	get_byte
	cmp	r0, #0
	bne	else

	ldr	r0, [fp, #-8]
	mov	r1, #0
	bl	get_byte
	str	r0, [fp, #-12]

	ldr	r0, [fp, #-8]
	mov	r1, #2
	bl	get_byte
	str	r0, [fp, #-16]

	mov     r0, #1
	ldr	r4, [fp, #-12]
	ldr	r5, [fp, #-16]
	b 	next
else:
        mov     r0, #0
	mov	r4, #'0'
	mov	r5, #'0'
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

	ldr	r0, prompt2p
	bl	printf

	ldr	r0, buffp
	mov	r1, #100
	bl	get_line
	str	r0, [fp, #-20]

	mov	r6, #0
	ldr	r0, buffp
	bl	translate
	
	ldr	r1, resultstringp
	ldr	r0, buffp
	bl	printf

	bl	print_summary
	
	mov	r0, #0

	sub	sp, fp, #4
	pop	{fp, pc}


	.align	2
	
buffp:		.word	buff
promptp:	.word	prompt
prompt2p:	.word	prompt2
resultstringp:	.word	resultstring
resultcharp:	.word	resultchar
summaryp:	.word	summary
	.data
	.align	2
buff:	.skip	100
