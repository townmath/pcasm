title Calculates the nth Fibonacci number      (fiberr.asm)


.model small ; one data segment, one code segment
.stack 100h ; reserves 256 bytes for the stack
.386 ; for 32 bits
.data ; start definition of variables

    fibNum db 5 ; want the fifth fibocnacci num in cx

.code ; start code portion of program
main proc ; start of the main procedure
    mov  eax,@data ; load the address of the data segment into eax
    mov  ds,eax ; load the address of the data segment into ds
    ; the two previous instructions initalize the data segment

	mov ax,fibNum
	mov cx,1
	mov bx,1
fibLoop:
	add cx,bx
	mov dx,bx
	mov bx,cx
	mov cx,bx
	cmp ax,0
	jnz fibLoop

    ; the following two instructions exit cleanly from the program
    mov  eax,4C00h ; 4C in ah means exit with code 0 (al) (similar to return 0; in C++)
    int  21h ; exit
main endp ; end procedure

end main ; end program
