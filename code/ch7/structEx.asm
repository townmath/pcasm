title Struct Example        (structEx.asm)

.model small ; one data segment, one code segment
.stack 100h ; reserves 256 bytes for the stack
.386 ; for 32 bits
includelib printInc.lib ;include external subprocedures
extern printDec:proc
extern crlf:proc
.data ; start definition of variables
currentID dd 0c123h
userData struct
	fullName db 20 dup (?)
	idNum dd ?
userData ends
userTest userData <"Fake Name",>
userNew userData <>
prompt db "Please enter your name: ",'$'
replyName db "Your name is: ", '$'
replyID db "Your ID number is: ",'$'
.code ; start code portion of program
main proc ; start of the main procedure
    mov  eax,@data ; load the address of the data segment into eax
    mov  ds,eax ; load the address of the data segment into ds
	mov  es,eax ; load es for string operations
    ; the two previous instructions initalize the data segment
	mov eax,currentID
	mov userTest.idNum,eax ; give Fake Name an ID Number
	inc currentID ; increment current ID
    ; get new user set up
	mov eax,currentID
	mov userNew.idNum,eax
	mov ecx,lengthof userNew.fullName
	mov edi,offset userNew.fullName
	; ask for their name
	mov dx,offset prompt
	mov ah,9
	int 21h
	cld
nameLoop: ; read in their name
	mov ah,1
	int 21h
	cmp al,0dh ; enter key
	je printData
	stosb
	loop nameLoop
printData: ; print their data
    mov al,'$'
	stosb ; add a '$' to the end of their name 
	call crlf
	mov dx,offset replyName
	mov ah,9
	int 21h
	mov dx,offset userNew.fullName
	mov ah,9
	int 21h
	call crlf
	mov dx,offset replyID
	mov ah,9
	int 21h
	mov eax,userNew.idNum
	call printDec

    ; the following two instructions exit cleanly from the program
    mov  eax,4C00h ; 4C in ah means exit with code 0 (al) (similar to return 0; in C++)
    int  21h ; exit
main endp ; end procedure

end main ; end program
