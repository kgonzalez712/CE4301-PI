%include        'seek.asm'
%include        'read.asm'
%include        'lines.asm'

; ----------------------------------------------------------------------------------------
;                           CONSTANTS
; ----------------------------------------------------------------------------------------

ZERO equ 0
LEN equ 499

; ----------------------------------------------------------------------------------------

global  _start
section .text
_start:

;------------------- THIS ARE THE HOLY GRAIL OF REGISTERS --------------------------------
;------------------- EBP ESI EDI ---------------------------------------------------------

    mov ebp,0; character counter
    mov esi,0; x pointer
    mov edi,0; y pointer

_mainLoop:
    cmp ebp,LEN
    je _lastJob
    call _read
    cmp r15d,1
    je _EOF
    cmp r8b,20h
    je _check
_EOF:
    cmp r8b,41h
    je _A
    cmp r8b,42h
    je _B
    cmp r8b,43h
    je _C
    cmp r8b,44h
    je _D
    cmp r8b,45h
    je _E
    cmp r8b,46h
    je _F
    cmp r8b,47h
    je _G
    cmp r8b,48h
    je _H
    cmp r8b,49h
    je _I
    cmp r8b,4Ah
    je _J
    cmp r8b,4Bh
    je _K
    cmp r8b,4Ch
    je _L
    cmp r8b,4Dh
    je _M
    cmp r8b,4Eh
    je _N
    cmp r8b,4Fh
    je _O
    cmp r8b,50h
    je _P
    cmp r8b,51h
    je _Q    
    cmp r8b,52h
    je _R
    cmp r8b,53h
    je _S
    cmp r8b,54h
    je _T
    cmp r8b,55h
    je _U
    cmp r8b,56h
    je _V
    cmp r8b,57h
    je _W
    cmp r8b,58h
    je _X
    cmp r8b,59h
    je _Y
    cmp r8b,5Ah
    je _Z
    cmp r8b,2Ch
    je _COMA
    cmp r8b,0Ah
    je _ignore
    jmp _quit

_check:
    mov r11d, ebp ; char counter one ahead
    add r11d,1
    mov r10,6
    jmp _Fits

_Fits:
    cmp r11d,500
    je _specialCase
    mov r9b, byte[r14d + r11d]
    cmp r9b,20h ;r9b parses the characters
    jne _fitAux
    jmp _newLine
     
_fitAux:  
    inc r11d
    add r10,6
    jmp _Fits

_newLine:
    mov r15d, esi
    add r15d,r10d
    cmp r15,250
    jle _ignore
    mov esi,0
    add edi,6
    jmp _ignore

_next:
    inc ebp
    call _incPointer
    jmp _mainLoop

_ignore:
    inc ebp
    add esi,2
    jmp _mainLoop

_incPointer:
    cmp esi,238
    jge _incAux
    add esi,6
_toRet:
    ret
    
_specialCase:
    mov r15d,1 
    jmp _ignore


_incAux:
    mov esi,0
    add edi,7
    jmp _toRet

_lastJob:    
    mov r13d,103
    mov r14d,83
    mov r15d,10
    call _breCirc
    mov esi,98; x pointer
    mov edi,80; y pointer
    call _SHLU
    call _bres
    call _VLL
    call _bres
    call _HLD
    call _bres
    call _SVLR
    call _bres
    call _HLG
    call _bres
    mov esi,103; x pointer
    mov edi,80; y pointer
    call _HLU
    call _bres
    call _HLM
    call _bres
    call _HLD
    call _bres
    call _S1
    call _bres
    call _S2
    call _bres

    jmp _quit

; ----------------------------------------------------------------------------------------
;                           BRESENHAN ALG. LINES
; ----------------------------------------------------------------------------------------
_bres:

    mov r15d,r11d
    mov r13d,r10d
    sub r15d,r9d
    sub r13d,r8d 
    shl r15d,1 
    mov [mNew],r15d ;store mnew
    sub r15d,r13d ;store slope error new
    shl r13d,1 ; store 2(x2-x1)
    mov [xDif],r13d ; store 2(x2-x1)

_for:
    mov r14d,ZERO ;y timescounter
    mov r12d,ZERO ;file position variable
    cmp r8d,r10d  ;vertical line check
    jne _regFlow

_vertical:
    call _calcPt
    call _seek ;escribir X y Y
    cmp r9d,r11d
    je _done ;if same end 
    inc r9d ;y1++
    jmp _for

_regFlow:
    call _calcPt
    call _seek ;escribir X y Y
    cmp r8d,r10d
    jge _done
    add r15d,[mNew]
    ;comparison of the slope
    cmp r15d,ZERO
    jge _if
    inc r8d
    jmp _for

_if:
    inc r9d
    sub r15d,[xDif]
    inc r8d
    jmp _for

_calcPt:
    mov r12d,r9d
    imul r12d,250
    add r12d,r8d
    ret

_done:
    ret

; ----------------------------------------------------------------------------------------
;                           BRESENHAN ALG. Circles
; ----------------------------------------------------------------------------------------

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
    call _drawPoints;aqui tengo que llamar a dibujar el circulo

    jmp _while

_while:
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

_calcCentr:
    mov r15d,r14d
    imul r15d,250
    add r15d,r13d
    mov r13d,0 ;free up r13d
    mov r14d,0 ;free up r14d
    ret

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
    ret

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
    mov r12d,r15d ;copiamos el valor del centro
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
    ret

_quit:
    ;exit the program
    mov	eax,1	; system call number (sys_exit)
    int	0x80	; call kernel



; ----------------------------------------------------------------------------------------
;                          Letters
; ----------------------------------------------------------------------------------------



_A:
    call _HLU
    call _bres
    call _VLL
    call _bres
    call _VLR
    call _bres
    call _HLM
    call _bres

    jmp _next
_B:
    call _SHLU
    call _bres
    call _SVLM
    call _bres
    call _VLL
    call _bres
    call _HLM
    call _bres
    call _HLD
    call _bres
    call _SVLR
    call _bres

    jmp _next

_C:

    call _HLU
    call _bres
    call _VLL
    call _bres
    call _HLD
    call _bres

    jmp _next

_D:

    call _HLU
    call _bres
    call _VLL
    call _bres
    call _SVLD
    call _bres
    call _HLD
    call _bres


    jmp _next


_E:
    call _HLU
    call _bres
    call _VLL
    call _bres
    call _HLM
    call _bres
    call _HLD
    call _bres

    jmp _next
_F:
    call _HLU
    call _bres
    call _VLL
    call _bres
    call _HLM
    call _bres

    jmp _next

_G:
    call _SHLU
    call _bres
    call _VLL
    call _bres
    call _HLD
    call _bres
    call _SVLR
    call _bres
    call _HLG
    call _bres

    jmp _next
_H:
    call _HLM
    call _bres
    call _VLL
    call _bres
    call _VLR
    call _bres

    jmp _next

_I:
    call _VLM
    call _bres

    jmp _next

_J:
    call _VLR
    call _bres
    call _HLD
    call _bres
    call _SVLL
    call _bres

    jmp _next

_K:
    call _VLL
    call _bres
    call _K1
    call _bres
    call _K2
    call _bres
    call _K3
    call _bres
    call _K4
    call _bres

    jmp _next

_L:
    call _HLD
    call _bres
    call _VLL
    call _bres

    jmp _next

_M:
    call _HLU
    call _bres
    call _VLM
    call _bres
    call _VLL
    call _bres
    call _VLR
    call _bres

    jmp _next

_N:
    call _HLU
    call _bres
    call _VLL
    call _bres
    call _VLR
    call _bres

    jmp _next

_O:
    call _HLU
    call _bres
    call _VLL
    call _bres
    call _VLR
    call _bres
    call _HLD
    call _bres

    jmp _next

_P:
    call _SHLU
    call _bres
    call _SVLM
    call _bres
    call _VLL
    call _bres
    call _K1
    call _bres

    jmp _next

_Q:
    call _HLU
    call _bres
    call _VLR
    call _bres
    call _Q1
    call _bres
    call _Q2
    call _bres

    jmp _next

_R:
    call _SHLU
    call _bres
    call _VLL
    call _bres
    call _K1
    call _bres
    call _K2
    call _bres
    call _K3
    call _bres

    jmp _next

_S:
    call _HLU
    call _bres
    call _HLM
    call _bres
    call _HLD
    call _bres
    call _S1
    call _bres
    call _S2
    call _bres

    jmp _next

_T:    
    call _HLU
    call _bres
    call _VLM
    call _bres

    jmp _next

_U:
    call _HLD
    call _bres
    call _VLL
    call _bres
    call _VLR
    call _bres

    jmp _next

_V:
    call _V1
    call _bres
    call _V2
    call _bres
    call _Q2
    call _bres

    jmp _next


_W:
    call _HLD
    call _bres
    call _VLM
    call _bres
    call _VLL
    call _bres
    call _VLR
    call _bres

    jmp _next

_X:
    call _X1
    call _bres
    call _X2
    call _bres
    call _X3
    call _bres
    call _X4
    call _bres
    call _X5
    call _bres


    jmp _next

_Y:
    call _S1
    call _bres
    call _Y1
    call _bres
    call _Y2
    call _bres
    call _HLM
    call _bres

    jmp _next


_Z:
    call _HLU
    call _bres
    call _Z1
    call _bres
    call _Z2
    call _bres
    call _HLM
    call _bres
    call _HLD
    call _bres

    jmp _next

_COMA:
    call _LCOMA
    call _bres

    jmp _ignore



section .data

section .bss
mNew resb 4
xDif resb 4
