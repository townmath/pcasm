title Array Examples 1        (array1.asm)
.model small ; one data segment, one code segment
.stack 100h ; reserves 256 bytes for the stack
.386 ; for 32 bit registers
.data ; start definition of variables
	; define array of 10 double words initialized to 1,2,..,10
	a1 dd 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
	; define array of 10 words initialized to 0
	a2 dw  0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	; same as before using dup
	a3 dw 10 dup (0)
	; define array of bytes with 200 0's and then 100 1's
	a4 db 200 dup (0)
	   db 100 dup (1)
	; define an array of 10 uninitialized double words
	a5 dd 10 dup (?)
	; define an array of 100 uninitialized words
	a6 dw 100 dup (?)

.code ; start code portion of program
main proc ; start of the main procedure
    mov  eax,@data ; load the address of the data segment into eax
    mov  ds,eax ; load the address of the data segment into ds
    ; the two previous instructions initalize the data segment
	mov eax,type a1 ; 4 bytes
	mov eax,sizeof a1 ; 10 array elements
	mov eax,lengthof a1; 40 = 4*10 sizeof is type*lengthof
	mov eax,a1[3*(type a1)] ;this does the same
	mov ebx,offset a1
	mov eax,[ebx+3*(type a1)] ;as this
	add ebx,3*(type a1)
	mov eax,ebx ; and this



    ; the following two instructions exit cleanly from the program
    mov  eax,4C00h ; 4C in ah means exit with code 0 (al) (similar to return 0; in C++)
    int  21h ; exit
main endp ; end procedure

end main ; end program
