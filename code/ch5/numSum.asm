title Number Sum         (numSum.asm)


.model small ; one data segment, one code segment
.stack 100h ; reserves 256 bytes for the stack
.386 ; for 32 bit registers
includelib printInc.lib ;include external subprocedures
;prototypes for external subprocs
extern printDec:proc
extern crlf:proc
extern get_digit:proc

.data ; start definition of variables
sum     dd   0
input   dd   1

; pseudo-code algorithm
; i = 1;
; input = 1;
; sum = 0;
; while(input != 0) {
;   input = get_int()
;   sum += input;
;   i++;
; }
; print_sum(num);

.code ; start code portion of program
main proc ; start of the main procedure
    mov  eax,@data ; load the address of the data segment into eax
    mov  ds,eax ; load the address of the data segment into ds
    ; the two previous instructions initalize the data segment

    mov edx, 1          ; edx is 'i' in pseudo-code so i=1
while_loop:
    push edx            ; save i on stack
    push offset input   ; push address of input on stack
    call get_int
    add esp, 2          ; remove &input from stack
    pop edx				; remove i from the stack and save it in edx
    mov eax, input
    cmp eax, 0
    je end_while
    add sum, eax        ; sum += input
    inc edx
    jmp while_loop

end_while:
    push sum       ; push value of sum onto stack
    call print_sum
    add esp,4      ; remove sum from stack

    ; the following two instructions exit cleanly from the program
    mov  eax,4C00h ; 4C in ah means exit with code 0 (al) (similar to return 0; in C++)
    int  21h ; exit
 main endp ; end procedure

; subprogram get_int
; Parameters (in order pushed on stack)
;   number of input (at [ebp + 8])
;   address of word to store input into (at [ebp + 6])
; Notes:
;   values of eax, edx, and ebx are destroyed
get_int proc
.data
    prompt db ") Enter a digit (0 to quit): ", '$'

.code
    push ebp
    mov ebp, esp

    mov eax, [ebp + 8]
    call printDec

    push eax
    mov dx, offset prompt
    mov	ah,9
    int 21h
    pop eax

    call get_digit
    mov bx, [ebp + 6]
    mov [bx], eax         ; store input into memory

    pop ebp
    ret                  ; jump back to caller
get_int endp
; subprogram print_sum
; prints out the sum
; Parameter:
;   sum to print out (at [ebp+6])
; Note: destroys value of eax and edx
;
print_sum proc
.data
result db "The sum is ", '$'

.code
    push ebp
    mov ebp, esp

    push eax
    mov dx, offset result
    mov	ah,9
    int 21h
    pop eax

    mov eax,[ebp+6]
    call printDec
    call crlf
    pop ebp
    ret
print_sum endp
end main ; end program
