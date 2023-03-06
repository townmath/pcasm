title Hello World Program         (hello.asm)

;This program displays "Hello, world!"
.model small ;small 64k 16 bit
.stack 100h ;reserves 256 bytes for the stack
.data ;start definition of variables
;define message as an array of characters
message db "Hello, world!",0dh,0ah,'$' 

.code ;start code portion of program
main proc ;start of the main procedure
    mov  ax,@data ;load the address of the data segment into ax
    mov  ds,ax ;load the address of the data segment into ds

    mov  ah,9 ;setting for outputting a string
    mov  dx,offset message ;point dx to the string
    int  21h ;output the string

    mov  ax,4C00h ;exit (ah) with code 0 (al)
    int  21h ;exit
main endp ;end procedure

end main ;end program
