    opton

const SYSTEM_STACK: 0x01FFF800

    mov rsp, SYSTEM_STACK

    ; the bootloader passed the boot disk id in r0
    call Main

    ; Main() should never return, but just in case it does, hang
    rjmp 0
