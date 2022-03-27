section .text

_VLR:
    mov r8d,4 ; store x1
    mov r9d,0 ; store y1
    mov r10d,4 ; store x2
    mov r11d,4; store y2
    call _ADDPTR
    ret
_VLL:
    mov r8d,0 ; store x1
    mov r9d,0 ;store y1
    mov r10d,0 ; store x2
    mov r11d,4; store y2
    call _ADDPTR
    ret
_VLM:
    mov r8d,2 ; store x1
    mov r9d,0 ;store y1
    mov r10d,2 ; store x2
    mov r11d,4; store y2
    call _ADDPTR
    ret
_HLU:
    mov r8d,0 ; store x1
    mov r9d,0 ;store y1
    mov r10d,4 ; store x2
    mov r11d,0; store y2
    call _ADDPTR
    ret
_HLD:
    mov r8d,0 ; store x1
    mov r9d,4;store y1
    mov r10d,4 ; store x2
    mov r11d,4; store y2
    call _ADDPTR
    ret
_HLM:
    mov r8d,0 ; store x1
    mov r9d,2 ;store y1
    mov r10d,4 ; store x2
    mov r11d,2; store y2
    call _ADDPTR
    ret
_SHLU:
    mov r8d,0 ; store x1
    mov r9d,0 ;store y1
    mov r10d,2 ; store x2
    mov r11d,0; store y2
    call _ADDPTR
    ret
_SVLM:
    mov r8d,3 ; store x1
    mov r9d,0 ;store y1
    mov r10d,3 ; store x2
    mov r11d,2; store y2
    call _ADDPTR
    ret

_SVLR:
    mov r8d,4 ; store x1
    mov r9d,2 ; store y1
    mov r10d,4 ; store x2
    mov r11d,4; store y2
    call _ADDPTR
    ret
_SVLL:
    mov r8d,0 ; store x1
    mov r9d,2 ; store y1
    mov r10d,0 ; store x2
    mov r11d,4; store y2
    call _ADDPTR
    ret
_HLG:
    mov r8d,1 ; store x1
    mov r9d,2 ;store y1
    mov r10d,4 ; store x2
    mov r11d,2; store y2
    call _ADDPTR
    ret

_SVLD:
    mov r8d,4 ; store x1
    mov r9d,0 ; store y1
    mov r10d,4 ; store x2
    mov r11d,3; store y2
    call _ADDPTR
    ret
_SHLD:
    mov r8d,0 ; store x1
    mov r9d,3 ; store y1
    mov r10d,3 ; store x2
    mov r11d,3; store y2
    call _ADDPTR
    ret

_K1:
    mov r8d,0 ; store x1
    mov r9d,2 ; store y1
    mov r10d,3 ; store x2
    mov r11d,2; store y2
    call _ADDPTR
    ret
_K2:
    mov r8d,3 ; store x1
    mov r9d,0; store y1
    mov r10d,3 ; store x2
    mov r11d,2; store y2
    call _ADDPTR
    ret
_K3:
    mov r8d,2 ; store x1
    mov r9d,2 ; store y1
    mov r10d,4 ; store x2
    mov r11d,4; store y2
    call _ADDPTR
    ret

_Q1:
    mov r8d,0 ; store x1
    mov r9d,3;store y1
    mov r10d,4; store x2
    mov r11d,3; store y2
    call _ADDPTR
    ret
_Q2:
    mov r8d,0 ; store x1
    mov r9d,0;store y1
    mov r10d,0; store x2
    mov r11d,3; store y2
    call _ADDPTR
    ret

_S1:
    mov r8d,0 ; store x1
    mov r9d,0;store y1
    mov r10d,0; store x2
    mov r11d,2; store y2
    call _ADDPTR
    ret

_S2:
    mov r8d,4 ; store x1
    mov r9d,2;store y1
    mov r10d,4; store x2
    mov r11d,4; store y2
    call _ADDPTR
    ret

_V1:
    mov r8d,1 ; store x1
    mov r9d,4;store y1
    mov r10d,3 ; store x2
    mov r11d,4; store y2
    call _ADDPTR
    ret
_V2:
    mov r8d,4 ; store x1
    mov r9d,0;store y1
    mov r10d,4; store x2
    mov r11d,3; store y2
    call _ADDPTR
    ret
_X1:
    mov r8d,0 ; store x1
    mov r9d,0;store y1
    mov r10d,4; store x2
    mov r11d,4; store y2
    call _ADDPTR
    ret
_X2:
    mov r8d,0 ; store x1
    mov r9d,4;store y1
    mov r10d,0; store x2
    mov r11d,4; store y2
    call _ADDPTR
    ret
_X3:
    mov r8d,1 ; store x1
    mov r9d,3;store y1
    mov r10d,1; store x2
    mov r11d,3; store y2
    call _ADDPTR
    ret
_X4:
    mov r8d,3 ; store x1
    mov r9d,1;store y1
    mov r10d,3; store x2
    mov r11d,1; store y2
    call _ADDPTR
    ret
_X5:
    mov r8d,4 ; store x1
    mov r9d,0;store y1
    mov r10d,4; store x2
    mov r11d,0; store y2
    call _ADDPTR
    ret

_Y1:
    mov r8d,2 ; store x1
    mov r9d,2;store y1
    mov r10d,2; store x2
    mov r11d,4; store y2
    call _ADDPTR
    ret
_Y2:
    mov r8d,4 ; store x1
    mov r9d,0;store y1
    mov r10d,4; store x2
    mov r11d,1; store y2
    call _ADDPTR
    ret


_Z1:
    mov r8d,4 ; store x1
    mov r9d,0;store y1
    mov r10d,4; store x2
    mov r11d,2; store y2
    call _ADDPTR
    ret

_Z2:
    mov r8d,0 ; store x1
    mov r9d,2;store y1
    mov r10d,0; store x2
    mov r11d,4; store y2
    call _ADDPTR
    ret

_LCOMA:
    mov r8d,0 ; store x1
    mov r9d,4;store y1
    mov r10d,0; store x2
    mov r11d,5; store y2
    call _ADDPTR
    ret

_ADDPTR:
    add r8d,esi
    add r9d,edi
    add r10d,esi
    add r11d,edi
    ret