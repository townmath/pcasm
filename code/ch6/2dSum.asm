title Sum a 2D Array     (2dSum.asm)

.model small ; one data segment, one code segment
.stack 100h ; reserves 256 bytes for the stack
.386 ; for 32 bit registers
includelib printInc.lib ;include external subprocedures
extern printDec:proc
extern crlf:proc
.data ; start definition of variables
array2d  dd  1, 2, 3,  4, 5,  ; 2d array of double words
             2, 4, 6,  8, 10,
             3, 6, 9, 12, 15
COLS equ 5
ROWS equ 3

.code ; start code portion of program
main proc ; start of the main procedure
    mov  eax,@data ; load the address of the data segment into eax
    mov  ds,eax ; load the address of the data segment into ds
    ; the two previous instructions initalize the data segment
    mov eax,0 ; eax is i
    mov ebx,0 ; ebx is j
    mov edx,0 ; edx is the sum
while_row:
    cmp eax,ROWS*COLS ; while i<numRows
    jge exit ; else exit
    while_col:
        cmp ebx,COLS*(type array2d) ; while j<numCols
        jge while_row_rest ; else return to outer loop
        add edx,array2d[(type array2d)*eax+ebx] ;array2d[i][j]
        add ebx,type array2d
        jmp while_col
    while_row_rest:
        add eax,COLS
        mov ebx,0
        jmp while_row

exit:
    mov eax,edx
    call printDec
    call crlf
    ; the following two instructions exit cleanly from the program
    mov  eax,4C00h ; 4C in ah means exit with code 0 (al) (similar to return 0; in C++)
    int  21h ; exit
main endp ; end procedure

end main ; end program
