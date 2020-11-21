	.section	.rodata
	.align	2
prompt:
	.asciz	"Enter a line of input:\n"	@strings
	.align	2
sum:
	.asciz	"The sum is %d\n"
	.text
	.align	2
	.global main
main:
	push	{fp, lr}
	add	fp, sp, #4	@setup stack
	sub	sp, sp, $16

	ldr	r0, promptp	@print prompt
	bl	printf

	ldr	r0, buffp
	mov	r1, #100	@get line
	bl	get_line

	mov	r0, #0
	str	r0, [fp, #-8]	@initialize sum

	mov	r0, #0
	str	r0, [fp, #-12]	@initialize j

	b	guard	@branch to guard
else:
	ldr	r1, [fp, #-12]
	add	r1, r1, #1	@add 1 to j
	str	r1, [fp, #-12]

	b	guard	@branch to guard
body:
	cmp	r0, #'0'	@compare to ascii 0
	blt	else

	cmp	r0, #'9'	@compare to ascii 9
	bgt	else

	ldr     r1, [fp, #-8]
        ldr     r2, [fp, #-16]	@load sum and ch

        add     r1, r1, r2
	str	r1, [fp, #-8]	@add to sum and subtract '0' from sum
	ldr	r1, [fp, #-8]
        sub     r1, r1, #'0'
        str     r1, [fp, #-8]

        ldr     r0, buffp
        ldr     r1, [fp, #-12]	@put * at byte j
        mov     r2, #'*'
        bl      put_byte
	
	ldr	r1, [fp, #-12]
	add	r1, r1, #1	@add 1 to j
	str	r1, [fp, #-12]
guard:
	ldr	r0, buffp
	ldr	r1, [fp, #-12]	@get byte at j
	bl	get_byte

	str	r0, [fp, #-16]	@store byte j
	ldr	r0, [fp, #-16]
	cmp	r0, #0	@compare to null byte
	bne	body

	ldr	r0, buffp
	bl	puts		@print string

	ldr	r0, sump
	ldr	r1, [fp, #-8]	@print sum
	bl	printf

	mov	r0, #0	@return 0

	sub	sp, fp, #4	@teardown
	pop	{fp, pc}
	.align	2


promptp:	.word	prompt
sump:		.word	sum	@pointers
buffp:		.word	buff
	.data
	.align	2
buff:	.skip	100	@array
