/* example of assembly programming
	RAB 10/21/20 */

/* string constants */
	.section .rodata
	.align	2
hello:					@ format string for printf
	.ascii "Hello, world!\012\000"
	.align	2
name:
	.asciz	"My Name is Daniel Ngo\n" @new string
	.align	2
hexa:
	.asciz	"The hexadecimal form of %d is %x\n"	@new string
/* main program */
	.text
	.align	2
	.global main
main:
	push	{fp, lr}		@ setup stack frame
	add	fp, sp, #4
	sub	sp, sp, #8		
	
	ldr	r0, helloP		@ call printf
	bl	printf

	ldr	r0, nameP		@puts string in register r0
	bl	printf			@prints the string

	mov	r0, #29			@puts 29 in r0
	str	r0, [fp, #-4]		@puts r0/29 at adress fp-4
	ldr	r0, hexaP		@loads string in r0
	ldr	r1, [fp, #-4]		@loads value at fp-4 into r1
	ldr	r2, [fp, #-4]		@loads value at fp-4 into r2
	bl	printf			@prints the string hexaa with the values from r1 and r2

	mov	r0, #0			@ return 0 from main
	sub	sp, fp, #4		@ tear down stack frame
	pop	{fp, pc}

/* pointer variable for format string */
	.align	2
helloP:	.word	hello			@ pointer to string hello
nameP:	.word	name			@ pointer to string name
hexaP:	.word	hexa			@ pointer to string hexa
