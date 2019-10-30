; ***********************************************************************
; *  File : add.asm
; *  Author : your name here
; *  Description: Adds 2 + 2
; *  Register use:
;       eax: holds 2 then the sum 5
; ***********************************************************************

        .386
        .MODEL FLAT
        ExitProcess PROTO NEAR32 stdcall, dwExitCode:DWORD
        PUBLIC _start   ; make procedure _start public
; ***********************************************************************
; *                     Data Segment                                 
; ***********************************************************************
	.DATA
	num1 DWORD 2     ; num1 = 2
	num2 DWORD 3     ; num2 = 3
	sum DWORD ?       ; will hold sum of num1 + num2

; ***********************************************************************
; *                     Stack Segment                                 
; ***********************************************************************
	.STACK  4096
; ***********************************************************************
; *                     Code Segment                                  
; ***********************************************************************
	.CODE
_start  PROC    NEAR32    ; start procedure called _start. Use flat, 32-bit address memory model
; your code goes here
	mov eax, num1     ; eax = num1
	add eax, num2      ; eax = eax + num2
	mov sum, eax       ; sum = eax
        EVEN                          ; Make rest of code aligned on an even-addressed byte
exit:   INVOKE  ExitProcess, 0  ; like return( 0 ); in C
_start  ENDP                        ; end procedure _start
        END
