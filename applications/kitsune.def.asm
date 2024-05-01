; kitsune syscall definitions for Okameron programs

; PROCEDURE Syscall(
;    arg0, arg1, arg2, arg3, arg4, arg5, arg6: INT;
;    syscall: INT;
; ): INT;
Syscall:
    int 0x80
    ret

; PROCEDURE BreakPoint(
;    arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7: INT;
; );
BreakPoint:
    brk
    ret

; PROCEDURE NewProcess(
;    fileName: POINTER TO CHAR;
;    ioPtr: POINTER TO FileOrStream;
;    argument: INT;
;    table: POINTER TO POINTER TO CHAR;
; ): INT;
NewProcess:
    mov r7, 0
    rjmp Syscall

; PROCEDURE YieldProcess();
YieldProcess:
    mov r7, 1
    rjmp Syscall

; PROCEDURE EndProcess(
;    processId: INT;
; );
EndProcess:
    mov r7, 2
    rjmp Syscall

; PROCEDURE MyProcess(): INT;
MyProcess:
    mov r7, 3
    rjmp Syscall

; PROCEDURE GetProcess(
;    processId: INT;
; ): POINTER TO Process;
GetProcess:
    mov r7, 4
    rjmp Syscall

; PROCEDURE Open(
;    fileName: POINTER TO CHAR;
;    struct: POINTER TO FileOrStream;
; ): INT;
Open:
    mov r7, 5
    rjmp Syscall

; PROCEDURE Seek(
;    offset: INT;
;    struct: POINTER TO FileOrStream;
; );
Seek:
    mov r7, 6
    rjmp Syscall

; PROCEDURE Tell(
;    struct: POINTER TO FileOrStream;
; ): INT;
Tell:
    mov r7, 7
    rjmp Syscall

; PROCEDURE GetSize(
;    struct: POINTER TO FileOrStream;
; ): INT;
GetSize:
    mov r7, 8
    rjmp Syscall

; PROCEDURE Read(
;    size: INT;
;    struct: POINTER TO FileOrStream;
;    destination: POINTER TO CHAR;
; );
Read:
    mov r7, 9
    rjmp Syscall

; PROCEDURE Write(
;    size: INT;
;    struct: POINTER TO FileOrStream;
;    source: POINTER TO CHAR;
; );
Write:
    mov r7, 10
    rjmp Syscall

; PROCEDURE Allocate(
;    size: INT;
; ): PTR;
Allocate:
    mov r7, 11
    rjmp Syscall

; PROCEDURE Free(
;    block: PTR;
; );
Free:
    mov r7, 12
    rjmp Syscall
