section	.text
	
_read:                  ;tell linker entry point

    mov     ecx, 0              ; Open file
    mov     ebx, file_name
    mov     eax, 5
    int     80h
 
    mov     edx,700           ; number of bytes to read - one for each letter of the file contents
    mov     ecx, info   ; move the memory address of our file contents variable into ecx
    mov     ebx, eax            ; move the opened file descriptor into EBX
    mov     eax, 3              ; invoke SYS_READ (kernel opcode 3)
    int     80h                 ; call the kernel
    
    ;close the file
    mov     eax, 6
    mov     ebx, [fd_in]
    int     80h

   mov r8b, byte[info + ebp]
   ret

section	.data
file_name db 'readme.txt'

section .bss
fd_out resb 1
fd_in  resb 1
info resb 700