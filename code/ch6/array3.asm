title Array Examples 3       (array3.asm)

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
;way 1
	mov    ebx, offset array1           ; ebx = address of array1
	mov    dx, 0                 ; dx will hold sum
	mov    ah, 0                 ; ?
	mov    ecx, 5
lp:
	mov    al, [ebx]             ; al = *ebx
	add    dx, ax                ; dx += ax (not al!) \label{line:SumArray1}
	inc    ebx                   ; bx++
	loop   lp
;way2
	mov    ebx, offset array1           ; ebx = address of array1
	mov    dx, 0                 ; dx will hold sum
	mov    ecx, 5
lp1:
      add    dl, [ebx]             ; dl += *ebx}
      jnc    next                  ; if no carry goto next}
      inc    dh                    ; inc dh}
next:
	inc    ebx                   ; bx++
	loop   lp1
;way3
mov    ebx, offset array1           ; ebx = address of array1
mov    dx, 0                 ; dx will hold sum
mov    ecx, 5
lp2:
      add    dl, [ebx]             ; dl += *ebx}
      adc    dh, 0                 ; dh += carry flag + 0}
inc    ebx                   ; bx++
loop   lp2
    ; the following two instructions exit cleanly from the program
    mov  eax,4C00h ; 4C in ah means exit with code 0 (al) (similar to return 0; in C++)
    int  21h ; exit
main endp ; end procedure

end main ; end program
