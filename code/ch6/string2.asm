title String Examples 2    (string2.asm)

.model small ; one data segment, one code segment
.stack 100h ; reserves 256 bytes for the stack
.386 ; for 32 bit registers
.data ; start definition of variables
string db "test",0
array1  dd  1, 2, 3, 4, 5, 6, 7, 8, 9, 10
array2  dd 10 dup (?)

.code ; start code portion of program
main proc ; start of the main procedure
    mov  eax,@data ; load the address of the data segment into eax
    mov  ds,eax ; load the address of the data segment into ds
    mov  es,eax ; load the address of the data segment into es
    ; the two previous instructions initalize the data segment and

    ;copies array1 into array2
      cld                   ; don't forget this!
      mov    esi, offset array1
      mov    edi, offset array2
      mov    ecx, lengthof array1
;lp:
      ;lodsd
      ;stosd
      ;;movsd ; this and lines 24-25 do the same thing
      ;loop  lp
      rep movsd ; this and lines 23-27 do the same thing


    ; the following two instructions exit cleanly from the program
    mov  eax,4C00h ; 4C in ah means exit with code 0 (al) (similar to return 0; in C++)
    int  21h ; exit
main endp ; end procedure

end main ; end program
