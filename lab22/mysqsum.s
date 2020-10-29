	.section .rodata
	.align 2
prompt:
	.asciz	"Enter a positive integer: "
	.align	2
input:
	.asciz	"%d"
	.align	2
result:
	.asciz	"The sum of the first %d squares is %d\n"
	.text
	.align	2
square:
        push	{fp,lr}
        add     fp, sp, #4
        sub     sp, sp, #8
        str     r0, [fp, #-8]
        ldr     r0, [fp, #-8]
        mul     r0, r0, r0
	sub	sp,fp,#4
	pop	{fp,pc}
	.text
        .align  2
	.global main
main:
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	ldr	r0, promptP
	bl	printf
	ldr	r0, inputP
	sub	r1, fp, #8
	bl	__isoc99_scanf
	mov	r0, #0
	str	r0, [fp, #-12]
	mov	r0, #0
	str	r0, [fp, #-16]
	b	guard
body:
	ldr	r0, [fp,#-12]
	bl	square
	ldr	r1, [fp,#-16]
	add	r1,r0,r1
	str	r1,[fp, #-16]
	ldr	r0,[fp,#-12]
	add	r0,r0,#1
	str	r0, [fp, #-12]
	
guard:
	ldr	r0, [fp, #-12]
	ldr	r1, [fp, #-8]
	cmp	r0,r1
	ble	body
        ldr     r2, [fp, #-16]
        ldr     r1, [fp, #-8]
        ldr     r0, resultP
        bl      printf
        mov     r0, #0
        sub     sp,fp,#4
        pop     {fp,pc}
	.align	2
	
promptP:	.word	prompt
inputP:		.word	input
resultP:	.word	result
	
