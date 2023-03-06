title Subprogram example program using uses  (subproc3.asm)

.model small ; one data segment, one code segment
.stack 100h ; reserves 256 bytes for the stack
.386 ; for 32 bits
.data
    prompt db    "Enter a digit: ", "$"       ; don't forget $ terminator
    outmsg db    0ah,0dh,"You entered ", "$"
    input  db 0

.code ; start code portion of program
main proc ; start of the main procedure
    mov  eax,@data ; load the address of the data segment into ax
    mov  ds,eax ; load the address of the data segment into ds
    ; the two previous instructions initalize the data segment

        ; read in first digit
        mov dx, offset prompt ; load address of prompt1
        mov ah, 9              ; load command
        int 21h                ; print out prompt1

        mov ebx, offset input ; store address of input into ebx
        call get_digit    ; read digit

        ; print the result
        mov dx, offset outmsg
        mov ah, 9
        int 21h ; print outmsg

        mov dl, input
        or  dl, 30h ;digit to ascii
        mov ah, 2
        int 21h  ; print out input

        ; the following two instructions exit cleanly from the program
        mov  eax,4C00h ; 4C in ah means exit with code 0 (al) (similar to return 0; in C++)
        int  21h ; exit
main endp ; end procedure
; subprogram get_digit
; Parameters:
;   ebx - address of byte to store integer into
; Notes:
;   value of eax is preserved
get_digit proc uses eax
    ;push eax ;don't need if using uses
    mov ah, 1
    int 21h
    and al, 0fh     ; char to int
    mov [ebx], al   ; store input into memory
    ;pop eax ;don't need if using uses
    ret
get_digit endp

end main ; end program
