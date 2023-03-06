title Array Examples 2      (array2.asm)

.model small ; one data segment, one code segment
.stack 100h ; reserves 256 bytes for the stack
.386 ; for 32 bit registers
.data ; start definition of variables
array1  db 5, 4, 3, 2, 1     ; array of bytes
array2  dw 5, 4, 3, 2, 1     ; array of words
array3  dd 5, 4, 3, 2, 1     ; array of double words

.code ; start code portion of program
main proc ; start of the main procedure
    mov  eax,@data ; load the address of the data segment into eax
    mov  ds,eax ; load the address of the data segment into ds
    ; the two previous instructions initalize the data segment
	mov    al, [array1]             ; al = array1[0]
	mov    al, array1[1]            ; al = array1[1]
	mov    [array1 + 3], al         ; array1[3] = al
	mov    ax, [array2]             ; ax = array2[0]
	mov    ax, [array2 + 2]         ; ax = array2[1] (NOT array2[2]!)
	mov    [array2 + 6], ax         ; array2[3] = ax
	mov    ax, [array2 + 1]         ; ax = ??

    ; the following two instructions exit cleanly from the program
    mov  eax,4C00h ; 4C in ah means exit with code 0 (al) (similar to return 0; in C++)
    int  21h ; exit
main endp ; end procedure

end main ; end program
