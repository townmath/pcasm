title Fixed Errors Example         (noerrors.asm)

.model small ; one data segment, one code segment
.stack 100h ; reserves 256 bytes for the stack
.386 ; for 32 bits
.data ; start definition of variables
	tooLarge dw 6 ;16 bis, no longer too large
	tooSmall dd 5 ;32 bits, no longer too small
	test1 dd 492 ;32 bits
	test2 dd 5678 ;32 bits

.code ; start code portion of program
main proc ; start of the main procedure
	mov  eax,@data ; load the address of the data segment into eax
	mov  ds,eax ; load the address of the data segment into ds
    ; the two previous instructions initalize the data segment

	mov ax,tooLarge  ; move 6 into ax
	mov eax,tooSmall ; move 5 into eax
	movzx eax,ax 	     ; extend ax to eax
	mov ebx,test2      ; store test2 temporarily into ebx
	mov test1,ebx      ; now move it into test1

    ; the following two instructions exit cleanly from the program
	mov  eax,4C00h ; 4C in ah means exit with code 0 (al) (similar to return 0; in C++)
	int  21h ; exit
main endp ; end procedure

end main ; end program
