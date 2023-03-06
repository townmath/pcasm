title Subprogram example program using recursion (subproc5.asm)

.model small ; one data segment, one code segment
.stack 100h ; reserves 256 bytes for the stack
.386 ; for 32 bits
.data

.code ; start code portion of program
main proc ; start of the main procedure
    mov  eax,@data ; load the address of the data segment into ax
    mov  ds,eax ; load the address of the data segment into ds
    ; the two previous instructions initalize the data segment
    mov ax,0
    mov word ptr [cs:$+9], 5      ; copy 5 into the word 7 bytes ahead
    add ax, 2                 ; previous statement changes 2 to 5!

    mov eax,5
    push eax
    call factorial
	;answer is in eax

    ; the following two instructions exit cleanly from the program
    mov  eax,4C00h ; 4C in ah means exit with code 0 (al) (similar to return 0; in C++)
    int  21h ; exit

; stack has

main endp ; end procedure

factorial proc
    enter 0,0 ; sets up stack frame
    mov    eax, [ebp+4] ; eax = n retrieve parameter from stack
    cmp    eax, 1 ; check termination condition
    jbe    term_cond    ; if n <= 1, terminate
    dec    eax    ; n--
    push   eax    ; call with (n-1)
    call   factorial ; eax = fact(n-1)
    mul    dword ptr [ebp+4]   ; edx:eax = eax * [ebp+4]
    term_cond:
    leave ; terminates stack frame
    ret 1 ; clean up the eax we pushed earlier
factorial endp

end main ; end program
