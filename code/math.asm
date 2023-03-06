title Math Example         (math.asm)


.model small ; one data segment, one code segment
.stack 100h ; reserves 256 bytes for the stack
.386 ; for 32 bits
.data ; start definition of variables
	multiplicand dw 6 ;16 bis
	multiplier db 5 ;8 bits
	divisor dd 492 ;16 bits
	dividend dd 5678 ;32 bits

.code ; start code portion of program
main proc ; start of the main procedure
    mov  eax,@data ; load the address of the data segment into eax
    mov  ds,eax ; load the address of the data segment into ds
    ; the two previous instructions initalize the data segment
    mov ax,multiplicand
    mul multiplier ;do ax=ax*multiplier
    ;ax is now 30
    
    mov edx,0 ;clear dx
    mov eax,dividend
    div divisor ; edx:eax/divisor => eax remainder edx
    ; now eax = 11 and edx = 266
    ; since 5678/492 = 11 R 266
    

    ; the following two instructions exit cleanly from the program
    mov  eax,4C00h ; 4C in ah means exit with code 0 (al) (similar to return 0; in C++)
    int  21h ; exit
main endp ; end procedure

end main ; end program
