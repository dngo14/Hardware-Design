	.section	.rodata
	.align 2
prompt:
	.asciz	"Enter a character: "
	.align	2
input:
	.asciz	"%c"
	.align	2
prompt2:
	.asciz	"Enter a line of input: \n"
	.align	2
space:
	.asciz	" "
	.align	2
tab:
	.asciz "\n"
	.align	2
result:
	.asciz "Indices of the character %c: \n"
	.text
	.align	2
	.global main
	
main:
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	
	ldr	r0, promptp
	bl	printf

	ldr     r0, inputp
        sub     r1, fp, #8
        bl      __isoc99_scanf
	
	ldr	r0, prompt2p
	bl	printf
	ldr	r0, buffp
	mov	r1, #100
	bl	get_line
	str	r0, [fp, #-12]
	
	mov	r0, #0
	str	r0, [fp, #-16]
	ldr	r0, resultp
	ldr	r1, [fp, #-8]
	bl	printf
	b	guard
else:
        ldr     r0, [fp, #-16]
        bl      print_dec
        ldr     r0, spacep
        bl      printf
        ldr     r0, [fp, #-16]
        add     r0,r0,#1
        str     r0, [fp, #-16]
	b	guard

body:
	ldr	r0, buffp
	ldr	r1, [fp, #-16]
	bl	get_byte
	str	r0, [fp, #-20]
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-8]
	cmp	r0, r1
	beq	else
	ldr	r0, [fp, #-16]
	add	r0, r0, #1
	str	r0, [fp, #-16]
	
guard:	
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-16]
	cmp	r0, r1
	ble	body
	ldr	r0, tabp
	bl	printf
	mov	r0, #0
	sub	sp, fp, #4
	pop	{fp, pc}
	.align	2
spacep:		.word	space
tabp:		.word	tab
buffp:		.word	buff
promptp:	.word	prompt
prompt2p:	.word	prompt2
inputp:		.word	input
input2:		.word	input2
resultp:	.word	result
	.data
	.align	2
buff:	.skip	100
