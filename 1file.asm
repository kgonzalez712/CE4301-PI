END equ 250

section	.text
   global _start         ;must be declared for using gcc

_start:                  ;tell linker entry point
    ;create the file
    mov  eax, 8
    mov  ebx, file_out
    mov  ecx, 0777        ;read, write and execute by all
    mov edx,2
    int  0x80             ;call kernel

    mov [fd_out], eax
    mov r9,1
_comp:
    cmp r9,END
    jle _loop
    jmp _done

_loop:
    
   ; write into the file
   mov	edx,len          ;number of bytes
   mov	ecx, msg         ;message to write
   mov	ebx, [fd_out]    ;file descriptor 
   mov	eax,4            ;system call number (sys_write)
   int	0x80             ;call kernel
    inc r9
    jmp _comp

_done:
    ; close the file
    mov eax, 6
    mov ebx, [fd_out]
        
    mov	eax,1             ;system call number (sys_exit)
    int	0x80              ;call kernel

section	.data
msg db '111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111',0x0a
len equ  $-msg
file_out db 'output.txt'


section .bss
fd_out resb 2

