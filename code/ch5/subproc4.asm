title Subprogram example program using the stack (subproc4.asm)

.model small ; one data segment, one code segment
.stack 100h ; reserves 256 bytes for the stack
.386 ; for 32 bits
.data
    sump dd 0

.code ; start code portion of program
main proc ; start of the main procedure
    mov  eax,@data ; load the address of the data segment into ax
    mov  ds,eax ; load the address of the data segment into ds
    ; the two previous instructions initalize the data segment
    mov eax,5
    push offset sump
    push eax
    call cal_sum
    add esp,6

    ; the following two instructions exit cleanly from the program
    mov  eax,4C00h ; 4C in ah means exit with code 0 (al) (similar to return 0; in C++)
    int  21h ; exit

; stack has
cal_sum:
      push   ebp
      mov    ebp, esp
      sub    esp, 4               ; make room for local sum

      mov    dword ptr [ebp - 4], 0   ; sum = 0
      mov    ebx, 1               ; ebx (i) = 1
for_loop:
      cmp    ebx, [ebp+6]         ; is i <= n?
      jnle   end_for

      add    [ebp-4], ebx         ; sum += i
      inc    ebx
      jmp    short for_loop

end_for:
      mov    ebx, [ebp+8]        ; ebx = sump
      mov    eax, [ebp-4]         ; eax = sum
      mov    [ebx], eax           ; *sump = sum;

      mov    esp, ebp
      pop    ebp
      ret
main endp ; end procedure
end main ; end program
