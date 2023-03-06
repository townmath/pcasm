title Errors Example         (errors.asm)

.model small ; one data segment, one code segment
.stack 100h ; reserves 256 bytes for the stack
.386 ; for 32 bits
.data ; start definition of variables
	tooLarge dd 6 ;32 bis
	tooSmall dw 5 ;16 bits
	test1 dd 492 ;32 bits
	test2 dd 5678 ;32 bits

.code ; start code portion of program
main proc ; start of the main procedure
    mov  eax,@data ; load the address of the data segment into eax
    mov  ds,eax ; load the address of the data segment into ds
    ; the two previous instructions initalize the data segment

    mov ax,tooLarge  ; ax is 16 bits, tooLarge is 32
	mov eax,tooSmall ; ax is 16 bits, tooSmall is 8
	mov eax,ax 	     ; eax is 32 bits, ax is 16
    mov test1,test2  ; same size, but both memory

    ; the following two instructions exit cleanly from the program
    mov  eax,4C00h ; 4C in ah means exit with code 0 (al) (similar to return 0; in C++)
    int  21h ; exit
main endp ; end procedure

end main ; end program
