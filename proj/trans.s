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
	.asciz "Summary: \n %d characters\n %d words\n %d lines\n"
	.align	2
resultstring:
	.asciz "%s\n"
	.text
	.align	2
is_upper:
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8

	str	r1, [fp, #-12]
	
	cmp	r0, #65
	blt	else5

	cmp	r0, #90
	bgt	else5

	mov	r1, #1
	
	b	next
else5:
	mov	r1, #0
next2:
	sub	sp, fp, #4
	pop	{fp, pc}
	.text
	.align	2
is_lower:
        push    {fp, lr}
        add     fp, sp, #4
        sub     sp, sp, #8
	
        str     r1, [fp, #-12]

        cmp     r0, #97
        blt     else5

        cmp     r0, #122
        bgt     else5

        mov     r1, #1

        b       next
else6:
        mov     r1, #0
next3:
        sub     sp, fp, #4
        pop     {fp, pc}
        .text
        .align  2
print_summary:
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8

	ldr	r0, summaryp
	mov	r1, r6
	mov	r2, r8
	mov	r3, r7
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
	str	r3, [fp, #-16]
	
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
else3:
	add	r7, r7, #1

	ldr     r3, [fp, #-12]
	add     r3, r3, #1
	str     r3, [fp, #-12]
	add     r6, r6, #1
	
	b       guard
else4:
	mov	r1, #0
	ldr	r3, [fp, #-12]
	
	bl	is_upper
	cmp	r1, #1
	beq	else7
	
	bl	is_lower
	cmp	r1, #1
	beq	else7
	
	ldr     r3, [fp, #-12]
        add     r3, r3, #1
        str     r3, [fp, #-12]
        add     r6, r6, #1

	b	guard
else7:
	ldr	r1, [fp, #-16]
	cmp	r1, #0
	beq	else8

	ldr     r3, [fp, #-12]
	add     r3, r3, #1
	str     r3, [fp, #-12]
	add     r6, r6, #1

	b       guard
else8:
	add	r8, r8, #1
	mov	r1, #1
	str	r1, [fp, #-16]

	ldr     r3, [fp, #-12]
        add     r3, r3, #1
        str     r3, [fp, #-12]
        add     r6, r6, #1

        b       guard
body:
	ldr	r0, buffp
	ldr	r1, [fp, #-12]
	bl	get_byte

	cmp	r0, r4
	beq	else2

	cmp	r0, #'\n'
	beq	else3

	cmp	r0, #' '
	bne	else4

	ldr	r1, [fp, #-16]
	cmp	r1, #1
	bne	else4

	mov	r1, #0
	str	r1, [fp, #-16]

	ldr     r3, [fp, #-12]
        add     r3, r3, #1
        str     r3, [fp, #-12]
        add     r6, r6, #1
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

	ldr	r0, buffp
	mov	r1, #100
	bl	get_line
	str	r0, [fp, #-8]

	ldr	r0, buffp
	bl	gettrans
	
	mov	r6, #0
	mov	r7, #0
	mov	r8, #0

	b	guard2

body2:
	ldr     r0, buffp
        bl      translate

	ldr	r1, resultstringp
	ldr	r0, buffp
	bl	printf

guard2:
	ldr     r0, buffp
        mov     r1, #100
        bl      get_line
        str     r0, [fp, #-20]
	ldr	r0, [fp, #-20]
	cmp	r0, #2
	bge	body2
	
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
