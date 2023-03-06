title String Examples 3    (string3.asm)

.model small ; one data segment, one code segment
.stack 100h ; reserves 256 bytes for the stack
.386 ; for 32 bit registers
.data ; start definition of variables
foundStr db "found",0ah,0dh,'$'
notFoundStr db "Not found",0ah,0dh,'$'
array  dd  1, 2, 3, 4, 5, 6, 7, 8, 9, 10
array2  dd 10 dup (?)
block1 dw 1,2,3,4,5,6,7,8
block2 dw 1,2,3,4,5,6,7,8

.code ; start code portion of program
main proc ; start of the main procedure
    mov  eax,@data ; load the address of the data segment into eax
    mov  ds,eax ; load the address of the data segment into ds
    mov  es,eax ; load the address of the data segment into es
    ; the two previous instructions initalize the data segment and
    ;part 1
    cld
    mov    edi, offset array    ; pointer to start of array
    mov    ecx, lengthof array  ; number of elements
    mov    eax, 12       ; number to scan for
lp:
    scasd
    je     found
    loop   lp
    mov dx, offset notFoundStr
    jmp    onward
found:
    sub edi, 4  ; edi now points to 12 in array
    mov dx, offset foundStr
onward:
    mov ah, 9
    int 21h

    ;part 2
    cld
    mov    esi, offset block1 ; address of first block
    mov    edi, offset block2 ; address of second block
    mov    ecx, sizeof block1 ; size of blocks in bytes
    repe   cmpsb              ; repeat while Z flag is set
    je     equal              ; if Z set, blocks equal
    ; code to perform if blocks are not equal
    jmp    onward1
equal:
   ; code to perform if equal
onward1:

    ; the following two instructions exit cleanly from the program
    mov  eax,4C00h ; 4C in ah means exit with code 0 (al) (similar to return 0; in C++)
    int  21h ; exit
main endp ; end procedure

end main ; end program
