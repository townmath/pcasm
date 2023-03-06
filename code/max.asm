title Tricky Max       (max.asm)
.model small ;
.stack 100h ; reserves 256 bytes for the stack
.386 ; for 32 bits
.data ;start data segment
firstNumber  dd 056h
secondNumber dd 0afh

.code ; start code portion of program
main proc ; start of the main procedure
    mov  eax,@data ; load the address of the data segment into ax
    mov  ds,eax ; load the address of the data segment into ds
    ; the two previous instructions initalize the data segment
    mov eax,firstNumber
    xor ebx,ebx  ; ebx = 0
    cmp eax,secondNumber  ; compare second and first number
    setg bl      ; ebx = (input2 > input1) ?          1 : 0
    neg ebx      ; ebx = (input2 > input1) ? 0xFFFFFFFF : 0
    mov ecx,ebx  ; ecx = (input2 > input1) ? 0xFFFFFFFF : 0
    and ecx,eax  ; ecx = (input2 > input1) ?     input2 : 0
    not ebx      ; ebx = (input2 > input1) ?          0 : 0xFFFFFFFF
    and ebx,secondNumber  ; ebx = (input2 > input1) ?          0 : input1
    or  ecx,ebx  ; ecx = (input2 > input1) ?     input2 : input1
    ; ecx now has the greater value

    mov  eax,4C00h ; exit (ah) with code 0 (al)
    int  21h ; exit
main endp ; end procedure

end main ; end program
