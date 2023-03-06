title Struct         (errors.asm)

.model small ; one data segment, one code segment
.stack 100h ; reserves 256 bytes for the stack
.386 ; for 32 bits
includelib printInc.lib ;include external subprocedures
extern printDec:proc
extern crlf:proc
.data ; start definition of variables
exampleStruct struct
	x dw 1
	y dd 2
	z dq 3
exampleStruct ends
s exampleStruct <4,5,6>
s2 exampleStruct <7,,9>
.code ; start code portion of program
main proc ; start of the main procedure
    mov  eax,@data ; load the address of the data segment into eax
    mov  ds,eax ; load the address of the data segment into ds
    ; the two previous instructions initalize the data segment
	mov ax,s.x
	mov ebx,s.y
	mov ecx,dword ptr s.z
	mov ax,s2.x
	mov ebx,s2.y
	mov ecx,dword ptr s2.z
	mov esi,offset s
	mov eax,[esi]
	call printDec
    ; the following two instructions exit cleanly from the program
    mov  eax,4C00h ; 4C in ah means exit with code 0 (al) (similar to return 0; in C++)
    int  21h ; exit
main endp ; end procedure

end main ; end program
