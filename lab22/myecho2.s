	.section        .rodata
	.align 2
space:
	.asciz	"\n"
	.align	2
prompt:                         @ format string for printf
	.asciz  "\nEnter a line of input (up to 99 chars):  "
        .text
        .align  2
	.global main
main:
        push    {fp, lr}        @ setup stack frame
        add     fp, sp, #4
        @sub    sp, sp, #8      @ no local variables (commented this line out)
        ldr     r0, promptP     @ print prompt
        bl      printf
        ldr     r0, buffP       @ call get_line(buff, 100)
        mov     r1, #100
        bl      get_line
	
	bl	print_dec
	
	ldr	r0, buffP
	mov	r1, #1
	mov 	r2, #'X'
	bl	put_byte

	ldr     r0, spaceP
        bl      printf
	
        ldr     r0, buffP       @ call puts(buff)
        bl      puts            @ (puts instead of printf since buff may have %) 
        mov     r0, #0          @ return 0
        sub     sp, fp, #4      @ tear down stack frame and return
        pop     {fp, pc}

       .align  2
buffP:		.word   buff

promptP:	.word  prompt

spaceP:		.word	space
        .data
        .align  2
buff:	.skip   100             
