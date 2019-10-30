; ***********************************************************************
; *  File : lab1.asm
; *  Author : Adam McDaniel
; *  Description: computes x^y
; *  Register use:
;       eax: holds result of x^y
; ***********************************************************************

.386
.MODEL FLAT
ExitProcess PROTO NEAR32 stdcall, dwExitCode:DWORD
PUBLIC _start   ; make procedure _start public
; ***********************************************************************
; *                     Data Segment                                 
; ***********************************************************************
.DATA
	x DWORD 2 ; x = 2
	y DWORD 16 ; y = 3

; ***********************************************************************
; *                     Stack Segment                                 
; ***********************************************************************
.STACK  4096
; ***********************************************************************
; *                     Code Segment                                  
; ***********************************************************************
.CODE
power PROC NEAR32 ; begin power
        push ebp  ; establish power stack frame
        mov ebp, esp    
        pushfd    ; save flags

        mov eax, 1 ; eax = accumulator
        mov ebx, [ebp+12] ; ebx = 1st parameter
        mov ecx, [ebp+8]  ; ecx = 2nd parameter

        cmp ecx, 0
        je endloop
        beginloop:
            imul eax, ebx
            sub ecx, 1
            cmp ecx, 0
            jg beginloop
        endloop:

        popfd             ; pop flags
        pop ebp           ; restore calling stack frame
        ret	   ; pops address off stack into EIP
power ENDP ; end power

_start  PROC    NEAR32    ; start procedure called _start. Use flat, 32-bit address memory model
        push x
        push y
        call power

exit:   EVEN              ; Make rest of code aligned on an even-addressed byte
        INVOKE  ExitProcess, 0  ; like return( 0 ); in C

_start  ENDP               ; end procedure _start
        END
