title Prime Finder (prime.asm)

.model small ; one data segment, one code segment
.stack 100h ; reserves 256 bytes for the stack
.386 ; for 32 bits
.data ; start definition of variables
    limit dd 30;
    output db "found a prime",0dh,0ah,'$'
; your variables go here
.code ; start code portion of program
main proc ; start of the main procedure
    mov  eax,@data ; load the address of the data segment into ax
    mov  ds,eax ; load the address of the data segment into ds
    ; the two previous instructions initalize the data segment
    mov eax,0
    mov ebx,1 ;ebx is guess
    mov edx,0
    mov edi,limit
outerWhileLoop:
    inc ebx  ; increment guess
    cmp ebx,edi
    jg exit
    mov ecx,1 ;ecx is factor
innerWhileLoop:
    inc ecx  ; increment factor
    cmp ecx,ebx
    jge isPrime
    mov eax,ebx ;put guess in eax
    mov edx,0 ;zero out edx
    div ecx ;divide guess and factor and put the remainder in edx
    cmp edx,0 
    jne innerWhileLoop
    jmp outerWhileLoop
isPrime:
    ;the prime value is in ebx
    mov  ah,9 ;setting for outputting a string
    mov  dx,offset output ;point dx to the string
    int  21h ;output the string
    jmp outerWhileLoop


exit:

    ;the following two instructions exit cleanly from the program
    mov  eax,4C00h ; exit (ah) with code 0 (al) (similar to return 0; in C++)
    int  21h ; exit
main endp ; end procedure

end main ; end program
