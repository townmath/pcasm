title Subprogram example program        (subproc1.asm)

.model small ; one data segment, one code segment
.stack 100h ; reserves 256 bytes for the stack
.386 ; for 32 bits
.data

.code ; start code portion of program
main proc ; start of the main procedure
    mov  eax,@data ; load the address of the data segment into ax
    mov  ds,eax ; load the address of the data segment into ds
    ; the two previous instructions initalize the data segment

    push   dword ptr 1   ; 1 stored at 00FCh, ESP = 00FCh
    push   dword ptr 2    ; 2 stored at 00F8h, ESP = 00F8h
    push   dword ptr 3   ; 3 stored at 00F4h, ESP = 00F4h
    pop    eax        ; EAX = 3, ESP = 00F8h
    pop    ebx        ; EBX = 2, ESP = 00FCh
    pop    ecx        ; ECX = 1, ESP = 0100h

    ; the following two instructions exit cleanly from the program
    mov  eax,4C00h ; 4C in ah means exit with code 0 (al) (similar to return 0; in C++)
    int  21h ; exit


main endp ; end procedure

end main ; end program
