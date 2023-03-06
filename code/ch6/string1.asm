title String Examples 1    (string1.asm)

.model small ; one data segment, one code segment
.stack 100h ; reserves 256 bytes for the stack
.386 ; for 32 bit registers
.data ; start definition of variables
string db "test",0
array1  dd  1, 2, 3, 4, 5, 6, 7, 8, 9, 10
array2  dd 10 dup (?)
array dd 10 dup (5)
string2 db "end"


.code ; start code portion of program
main proc ; start of the main procedure
    mov  eax,@data ; load the address of the data segment into eax
    mov  ds,eax ; load the address of the data segment into ds
    mov  es,eax ; load the address of the data segment into es
    ; the two previous instructions initalize the data segment
    mov    esi, offset array1 ;source
    mov    edi, offset array2 ;destination
    LODSB ; AL = [ESI] ESI = ESI +- 1
    STOSB ; [EDI] = AL; EDI = EDI +- 1

    LODSW ; AX = [ESI] ESI = ESI +- 2
    STOSW ; [EDI] = AX EDI = EDI +- 2

    LODSD ; EAX = [ESI] ESI = ESI +- 4
    STOSD ; [EDI] = EAX\newline EDI = EDI +- 4

    MOVSB ; byte [ES:EDI] = byte [DS:ESI]  ESI = ESI+- 1 EDI = EDI +- 1
    MOVSW ; word [ES:EDI] = word [DS:ESI]  ESI = ESI+- 2 EDI = EDI +- 2
    MOVSD ; dword [ES:EDI] = dword [DS:ESI]  ESI = ESI +- 4 EDI = EDI +- 4
    CMPSB ; compares byte [DS:ESI] and byte [ES:EDI]  ESI = ESI +- 1  EDI = EDI +- 1
    CMPSW ; compares word [DS:ESI] and word [ES:EDI]  ESI = ESI +- 2  EDI = EDI +- 2
    CMPSD ; compares dword [DS:ESI] and dword [ES:EDI]  ESI = ESI +- 4 EDI = EDI +- 4
    SCASB ; compares AL and [ES:EDI] EDI +- 1
    SCASW ; compares AX and [ES:EDI] EDI +- 2
    SCASD ; compares EAX and [ES:EDI] EDI +- 4

    cld    ; don't forget this!
    mov    edi, offset array
    mov    ecx, 10
    xor    eax, eax
    rep    stosd

    ; the following two instructions exit cleanly from the program
    mov  eax,4C00h ; 4C in ah means exit with code 0 (al) (similar to return 0; in C++)
    int  21h ; exit
main endp ; end procedure

end main ; end program
