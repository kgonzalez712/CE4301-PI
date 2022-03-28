%include "seek.asm"

section .text
    mov r13d,5
    mov r14d,5
    mov r15d,2

_breCirc:
    ;inputs: Xc,Yc,r ->r13,r14,r15
    mov r8d,0 ;r8 stores x
    mov r9d,r15d ;r9 stores y
    mov r10d,3 ;r10 will store the value of d
    mov r11d,r9d
    imul r11d,2
    sub r10d,r11d
    mov r11d,0 ; free up r11
    mov r15d,0 ; free up r15, r14d and r13d
    call _calcCentr ;r15d now stores the center of the circle
    call _drawPoints;called to draw the circle

    jmp _while

_while: ;getting the values of x and y
    cmp r9d,r8d
    jl _finish
    inc r8d
    call _ifElse
    call _drawPoints
    jmp _while

_ifElse:
    cmp r10d,0
    jge _if2
    jmp _else
_result:
    ret

_if2:
    dec r9d
    mov r11d,r8d
    add r10d,10
    sub r11d,r9d
    imul r11d,4
    add r10d,r11d
    jmp _result


_else:
    add r10d,6
    mov r11d, r8d
    imul r11d,4
    add r10d,r11d
    jmp _result

;get teh center of the circle
_calcCentr:
    mov r15d,r14d
    imul r15d,250
    add r15d,r13d
    mov r13d,0 ;free up r13d
    mov r14d,0 ;free up r14d
    ret

;draw the points of the circle
_drawPoints:
    call _pt1
    call _seek
    call _pt2
    call _seek
    call _pt3
    call _seek
    call _pt4
    call _seek
    call _pt5
    call _seek
    call _pt6
    call _seek
    call _pt7
    call _seek
    call _pt8
    call _seek

_pt1:
    mov r12d,r15d ;copiamos el valor del centro
    mov r14d,r9d
    mov r13d,r8d
    call _calcNewpoint
    ret
_pt2:
    mov r12d,r15d ;copiamos el valor del centro
    mov r14d,r9d
    mov r13d,r8d
    imul r13d,-1
    call _calcNewpoint
    ret
_pt3:
    mov r12d,r15d ;copiamos el valor del centro
    mov r14d,r9d
    imul r14d,-1
    mov r13d,r8d
    call _calcNewpoint
    ret
_pt4:
    mov r12d,r15d ;copiamos el valor del centro
    mov r14d,r9d
    imul r14d,-1
    mov r13d,r8d
    imul r13d,-1
    call _calcNewpoint
    ret
_pt5:
    mov r12d,r15d ;copiamos el valor del centro
    mov r14d,r8d
    mov r13d,r9d
    call _calcNewpoint
    ret
_pt6:
    mov r12d,r15d ;copiamos el valor del centro
    mov r14d,r8d
    imul r14d,-1
    mov r13d,r9d
    call _calcNewpoint
    ret
_pt7:
    mov r12d,r15d ;copiamos el valor del centro
    mov r14d,r8d
    mov r13d,r9d
    imul r13d,-1
    call _calcNewpoint
    ret
_pt8:
    mov r12d,r15d ;copy the centre
    mov r14d,r8d
    mov r13d,r9d
    imul r13d,-1
    imul r14d,-1
    call _calcNewpoint
    ret

_calcNewpoint:
    imul r14d,250
    add r12d,r14d
    add r12d,r13d
    ret  

_finish:
    ;exit the program
    mov	eax,1	; system call number (sys_exit)
    int	0x80	; call kernel

