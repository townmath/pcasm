title Array Examples 4        (array4.asm)


.model small ; one data segment, one code segment
.stack 100h ; reserves 256 bytes for the stack
.386 ; for 32 bit registers
.data ; start definition of variables
array1  db  5, 4, 3, 2, 1     ; array of bytes
array2  dw  5, 4, 3, 2, 1     ; array of words
array3  dd  5, 4, 3, 2, 1     ; array of double words

.code ; start code portion of program
main proc ; start of the main procedure
    mov  eax,@data ; load the address of the data segment into eax
    mov  ds,eax ; load the address of the data segment into ds
    ; the two previous instructions initalize the data segment
;way 4
	lea   ebx, array3    ; testing
    ;mov ebx,offset array3 ; ebx = address of array3
	mov    edx, 0                 ; edx will hold sum
	mov    ecx, 5                 ; ecx is our loop counter
lp:            ;[baseReg + factor*indexReg + constant]
	add    edx, [ebx+(type array3)*ecx-(type array3)]; edx += array3[ecx-1]
	loop   lp

;using lea to multiply
    mov eax,4
    lea    ebx, [4*eax + eax]

    ; the following two instructions exit cleanly from the program
    mov  eax,4C00h ; 4C in ah means exit with code 0 (al) (similar to return 0; in C++)
    int  21h ; exit
main endp ; end procedure

end main ; end program
