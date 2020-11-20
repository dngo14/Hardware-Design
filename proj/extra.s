	.section	.rodata
	.align	2
prompt:
	.asciz	"Enter a line of input: "		@strings 	
	.align	2
prompt2:
	.asciz	"Enter another line of input: "
	.align	2
resultchar:
	.asciz	"The characters with index 0 and 2 are %c and %c\n"
	.align	2
summary:
	.asciz "Summary: \n %d characters\n %d words\n %d lines\n "
	.align	2
summary2:
	.asciz	"%d substitutions\n %d punctuations\n %d digits\n"
	.align	2
resultstring:
	.asciz "%s\n"
	.text
	.align	2
is_digit:
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8	@setup

	cmp	r0, #48
	blt	else11		@compare to ascii 0

	cmp	r0, #57		@compare to ascii 9
	bgt	else11

	mov	r1, #1		@move 1 into register r1

	b	nextd
else11:
	mov	r1, #0		@move 0 into ascii r1
nextd:
	sub     sp, fp, #4
        pop     {fp, pc}        @teardown
        .text
        .align  2
is_upper:
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8	@setup

	str	r1, [fp, #-12]
	
	cmp	r0, #65
	blt	else5		@cmp ascii 65

	cmp	r0, #90		@cmp ascii 90
	bgt	else5

	mov	r1, #1		@put 1 into r1

	b	next
else5:
	mov	r1, #0		@put 0 into r1
next2:
	sub	sp, fp, #4
	pop	{fp, pc}	@teardown
	.text
	.align	2
is_lower:
        push    {fp, lr}
        add     fp, sp, #4	@setup
        sub     sp, sp, #8
	
        str     r1, [fp, #-12]

        cmp     r0, #97	@compares to ascii 97
        blt     else5

        cmp     r0, #122
        bgt     else5		@compares to ascii 122

        mov     r1, #1	@put 1 into r1
	
        b       next
else6:
        mov     r1, #0	@put 0 into r1
next3:
        sub     sp, fp, #4
        pop     {fp, pc}	@teardown
        .text
	.punctuationp:	@creates pointer to global punctuation
		.word	punctuation
	.digitp:
		.word	digit	@pointer to global digit
	.align  2
print_summary:
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8	@setup

	str	r0, [fp, #-8]
	
	ldr	r0, summaryp
	mov	r1, r6
	mov	r2, r8		@print summary
	mov	r3, r7
	bl	printf


	ldr     r4, .punctuationp
	ldr	r6, .digitp		@loads the pointers
	
	ldr	r0, summary2p
	ldr     r1, [fp, #-8]	@load values and prints
	ldr	r2, [r4]
	ldr	r3, [r6]
	bl	printf
	
	sub	sp, fp, #4
	pop	{fp, pc}	@teardown
	.text
	.punctuationp2:	@creates pointer to global punctuation
		.word	punctuation
	
	.digitp2:	@another pointer to global digit
		.word	digit
	.align	2
	
translate:
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16	@setup frame
	str	r0, [fp, #-8]

	mov	r3, #0
	str	r3, [fp, #-16]	@count
	
	mov	r3, #0
	str	r3, [fp, #-12]	@makes index

	mov	r3, #0
	str	r3, [fp, #-20]	@count for substitutions

	b	guard
	
else2:
	ldr     r0, buffp
        ldr     r1, [fp, #-12]
        mov     r2, r5		@replaces char in string
        bl      put_byte
	
	ldr	r3, [fp, #-20]
	add	r3, r3, #1	@count substitutions
	str	r3, [fp, #-20]

        ldr     r3, [fp, #-12]
        add     r3, r3, #1	@update index and r6
        str     r3, [fp, #-12]
        add     r6, r6, #1
	b	guard
else3:
	add	r7, r7, #1	@add to r7

	ldr     r3, [fp, #-12]
	add     r3, r3, #1	@update index and r6
	str     r3, [fp, #-12]
	add     r6, r6, #1
	
	b       guard
else4:
	mov	r1, #0
	ldr	r3, [fp, #-12]
	
	bl	is_upper
	cmp	r1, #1		@checks for uppercases
	beq	else7
	
	bl	is_lower
	cmp	r1, #1		@checks for lowercases
	beq	else7
	
	ldr     r3, [fp, #-12]
        add     r3, r3, #1	@updates index and r6
        str     r3, [fp, #-12]
        add     r6, r6, #1

	b	guard
else7:
	ldr	r1, [fp, #-16]
	cmp	r1, #0		@checks null byte
	beq	else8

	ldr     r3, [fp, #-12]
	add     r3, r3, #1	@updates index and r6
	str     r3, [fp, #-12]
	add     r6, r6, #1

	b       guard
else8:
	add	r8, r8, #1
	mov	r1, #1		@checks for 1 in r8
	str	r1, [fp, #-16]	

	ldr     r3, [fp, #-12]
        add     r3, r3, #1
        str     r3, [fp, #-12]	@updates index and r6
        add     r6, r6, #1

        b       guard
else10:
	ldr	r0, .punctuationp2	@pointer to global
	ldr	r1, [r0]
	add	r1, r1, #1		@add to global
	str	r1, [r0]

	ldr     r3, [fp, #-12]
        add     r3, r3, #1
        str     r3, [fp, #-12]  @updates index and r6
        add     r6, r6, #1

        b       guard
else12:
	ldr	r0, .digitp2	@pointer to global
        ldr     r1, [r0]
        add     r1, r1, #1              @add to global
        str     r1, [r0]

	ldr     r3, [fp, #-12]
        add     r3, r3, #1
        str     r3, [fp, #-12]  @updates index and r6
        add     r6, r6, #1

        b       guard
body:
	ldr	r0, buffp
	ldr	r1, [fp, #-12]	@get the byte at the index in r1
	bl	get_byte

	cmp	r0, r4		@compares byte to inchar 
	beq	else2

	bl	is_digit	@checks for digits by branching to function
	cmp	r1, #1		@if returned value is 1 branch to else12
	beq	else12

	cmp     r0, #'.' 	@checks for periods
        beq     else10

	cmp	r0, #'!'	@checks for exclamation points
	beq	else10

	cmp	r0, #'?'	@checks question marks
	beq	else10

	cmp	r0, #'\n'	@compares byte to end line
	beq	else3

	cmp	r0, #' '	@compares to space
	bne	else4

	ldr	r1, [fp, #-16]
	cmp	r1, #1		@compares to 1
	bne	else4

	mov	r1, #0
	str	r1, [fp, #-16]	@compares to null byte

	ldr     r3, [fp, #-12]
        add     r3, r3, #1
        str     r3, [fp, #-12]	@update index and r6
        add     r6, r6, #1
guard:
	ldr     r0, buffp
        ldr	r1, [fp, #-12]	@gets byte 
	bl	get_byte
	
	cmp	r0, #0		@compares to null byte
	bne	body

	ldr	r0, buffp	@return buffp
	ldr	r1, [fp, #-20]	@return	substitutions
	
	sub     sp, fp, #4
	pop     {fp, pc}	@teardown
	.text
	.align  2
	
gettrans:
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16	@setup
	str	r0, [fp, #-8]

	ldr	r0, [fp, #-8]
	mov	r1, #0
	bl	get_byte	@gets byte and compares to null
	cmp	r0, #0
	beq	else
	
	ldr	r0, [fp, #-8]
	mov	r1, #1
	bl	get_byte	@compares to space
	cmp	r0, #' '
	bne	else

	ldr     r0, [fp, #-8]
	mov     r1, #2
	bl      get_byte	@compares to null
	cmp     r0, #0
	beq     else
	
	ldr	r0, [fp, #-8]
	mov	r1, #3
	bl	get_byte	@compares to endline
	cmp	r0, #'\n'
	bne	else
	
	ldr     r0, [fp, #-8]
	mov     r1, #4
	bl	get_byte	@compares to 0
	cmp	r0, #0
	bne	else

	ldr	r0, [fp, #-8]
	mov	r1, #0		@strs byte
	bl	get_byte
	str	r0, [fp, #-12]

	ldr	r0, [fp, #-8]
	mov	r1, #2
	bl	get_byte	@gets byte
	str	r0, [fp, #-16]

	mov     r0, #1
	ldr	r4, [fp, #-12]	@strs inchar and outchar
	ldr	r5, [fp, #-16]
	b 	next
else:
        mov     r0, #0
	mov	r4, #'0'	@puts 0 into registers
	mov	r5, #'0'
next:
	sub	sp, fp, #4
	pop	{fp, pc}
        .text	@tear down
        .align  2
        .global main	
main:
	push	{fp, lr}
	add	fp, sp, #4	@setup
	sub	sp, sp, #16

	ldr	r0, buffp
	mov	r1, #100
	bl	get_line	@gets string
	str	r0, [fp, #-8]

	ldr	r0, buffp
	bl	gettrans	
	
	mov	r6, #0
	mov	r7, #0		@setup registers
	mov	r8, #0
	mov	r9, #0

	mov	r0, #0
	str	r0, [fp, #-12]	@number of substitutions

	b	guard2

body2:
	ldr     r0, buffp
        bl      translate
	
	ldr	r3, [fp, #-12]
	add	r3, r3, r1	@adds to amount of substitutions
	str	r3, [fp, #-12]	

	ldr	r1, resultstringp	@print
	ldr	r0, buffp
	bl	printf

guard2:
	ldr     r0, buffp
        mov     r1, #100
        bl      get_line
        str     r0, [fp, #-20]	@str and cmp
	ldr	r0, [fp, #-20]
	cmp	r0, #2
	bge	body2

	ldr	r0, [fp, #-12]	@loads substitutions
	bl	print_summary	
	
	mov	r0, #0	@return 0

	sub	sp, fp, #4
	pop	{fp, pc}


	.align	2
	
buffp:		.word	buff
promptp:	.word	prompt
prompt2p:	.word	prompt2		@pointers
resultstringp:	.word	resultstring
resultcharp:	.word	resultchar
summaryp:	.word	summary
summary2p:	.word	summary2
	.data
	.align	2	@array
buff:	.skip	100
	.align	2
punctuation:	.word	0
digit:		.word	0
