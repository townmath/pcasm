title Read key         (readkey.asm)

.model small ; one data segment, one code segment
.stack 100h ; reserves 256 bytes for the stack
.386 ; for 32 bits
.data
    greater5 db " is greater than 5",0ah,0dh,'$'
    lessthan5 db " is less than or equal to 5",0ah,0dh,'$'
.code ; start code portion of program
main proc ; start of the main procedure
    mov  eax,@data ; load the address of the data segment into ax
    mov  ds,eax ; load the address of the data segment into ds
    ; the two previous instructions initalize the data segment

    mov ah,01h ; read from keyboard with echo
    int 21h    ; interrupt to read from the keyboard, al=char

    and al,0fh ; numbers 0-9 are ascii 30h-39h, so zero out the 3
    ;sub al,30h ; this would work too
    cmp al,5 ; if al>5
    jbe elseBlock
    mov dx,offset greater5 ; pointer to string in dx
    jmp printMessage
elseBlock: ; al<=5
    mov dx,offset lessthan5 ; pointer to string in dx
printMessage:
    mov ah,9 ; output string
    int 21h  ; interrupt to print the string

    ;the following two instructions exit cleanly from the program
    mov  eax,4C00h ; exit (ah) with code 0 (al) (similar to return 0; in C++)
    int  21h ; exit
main endp ; end procedure

end main ; end program
