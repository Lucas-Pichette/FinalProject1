;=-=-=BEGINNING=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=80-char=-=-;
TITLE FinalProject1 (FinalProject1.asm)

;~TITLE BLOCK~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
; Author:               Lucas Pichette, Sean Sullivan
; Course/Project ID:    CS271-FinalProject1
; Description:          This final project is aimed 
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;



; Tasks:
;   1) Display program title and your name. Then get user's name and greet the
;       user.
;   ?) Display a goodbye message that includes the user's name and terminates
;       the program.

; Requirements:
;   1) There needs to be ascii art for whatever reason
;   2) There should be at least one procedure
;   3) At least 2-deep nested storyline. 

; Notes:
;   1) This is a comment. We can communicate big ideas here, or even just
;		smaller questions.
;   2) Story setting: Doesn't matter, we just need to have one.s


INCLUDE Irvine32.inc

; CONSTANTS
;==============================================================================;

MIN             =           1
MAX             =           3

;==============================================================================;



.data ; BUFFER IN RAM
;==============================================================================;

sTitle          BYTE        "Title:     TBD (Final Project 1)",0
sAuthor         BYTE        "Author:    Lucas Pichette, Sean Sullivan",0
sPromptForName  BYTE        "What's your name broseph? ",0
sGreetings      BYTE        "Hello, ",0
sGoodbye        BYTE        "Goodbye, ",0



sName           BYTE        20      DUP(0)

dNameL          DWORD       ?

;==============================================================================;



.code
;==============================================================================;
main PROC
    push    OFFSET sName
    push    OFFSET sGreetings
    push    OFFSET sPromptForName
    push    OFFSET sAuthor
    push    OFFSET sTitle
    call    Introduction

    call    StoryOrigin ; This will have almost everything pushed to it. 

    push    OFFSET sName
    push    OFFSET sGoodbye
    call    Goodbye

    exit

main ENDP

Introduction PROC
    push    EBP
    mov     EBP,            ESP

    mov     EDX,            [EBP+8]
    call    WriteString
    call    Crlf

    mov     EDX,            [EBP+12]
    call    WriteString
    call    Crlf

    mov     EDX,            [EBP+16]
    call    WriteString
    call    Crlf

    mov     EDX,            [EBP+20]
    call    WriteString
    
    mov     EDX,            [EBP+24]
    mov     ECX,            20
    call    ReadString
    mov     dNameL,         EAX

    pop     EBP

    ret     20
Introduction ENDP


StoryOrigin PROC
    push    EBP
    mov     EBP,            ESP

    Input:
        ;Storyline
        call    ReadInt

        cmp     EAX,            1
        je      L1a
        cmp     EAX,            2
        je      L1b
        cmp     EAX,            3
        je      L1c
        jmp     IncorrectInput

    LeaveGame:
        pop     EBP

        ret     ; This will return a LOT, but will only get triggered
                ;       after rest of functions are returning.

    IncorrectInput:
        ;Display incorrect input message
        jmp     Input
    L1a:
        call    Story1a
        jmp     LeaveGame
    L1b:
        call    Story1b
        jmp     LeaveGame
    L1c:
        call    Story1c
        jmp     LeaveGame
StoryOrigin ENDP


Story1a PROC
    push    EBP
    mov     EBP,            ESP

    Input:
        ;Storyline
        call    ReadInt

        cmp     EAX,            1
        je      L1a
        cmp     EAX,            2
        je      L1b
        cmp     EAX,            3
        je      L1c
        jmp     IncorrectInput

    LeaveFunc:
        pop     EBP
        ret

    IncorrectInput:
        ;Display incorrect input message
        jmp     Input
    L2a:
        call    Story2a
        jmp     LeaveFunc
    L2b:
        call    Story2b
        jmp     LeaveFunc
    L2c:
        call    Story2c
        jmp     LeaveFunc
Story1a ENDP


Story1b PROC
    push    EBP
    mov     EBP,            ESP

    Input:
        ;Storyline
        call    ReadInt

        cmp     EAX,            1
        je      L1a
        cmp     EAX,            2
        je      L1b
        cmp     EAX,            3
        je      L1c
        jmp     IncorrectInput

    LeaveFunc:
        pop     EBP
        ret

    IncorrectInput:
        ;Display incorrect input message
        jmp     Input
    L2a:
        call    Story2a
        jmp     LeaveFunc
    L2b:
        call    Story2b
        jmp     LeaveFunc
    L2c:
        call    Story2c
        jmp     LeaveFunc
Story1b ENDP


Story1c PROC
    push    EBP
    mov     EBP,            ESP

    Input:
        ;Storyline
        call    ReadInt

        cmp     EAX,            1
        je      L1a
        cmp     EAX,            2
        je      L1b
        cmp     EAX,            3
        je      L1c
        jmp     IncorrectInput

    LeaveFunc:
        pop     EBP
        ret

    IncorrectInput:
        ;Display incorrect input message
        jmp     Input
    L2a:
        call    Story2a
        jmp     LeaveFunc
    L2b:
        call    Story2b
        jmp     LeaveFunc
    L2c:
        call    Story2c
        jmp     LeaveFunc
Story1c ENDP


Story2a PROC
    push    EBP
    mov     EBP,            ESP

    Input:
        ;Storyline
        call    ReadInt

        cmp     EAX,            1
        je      L1a
        cmp     EAX,            2
        je      L1b
        cmp     EAX,            3
        je      L1c
        jmp     IncorrectInput

    LeaveFunc:
        pop     EBP
        ret

    IncorrectInput:
        ;Display incorrect input message
        jmp     Input
    L3a:
        call    Story3a
        jmp     LeaveFunc
    L3b:
        call    Story3b
        jmp     LeaveFunc
    L3c:
        call    Story3c
        jmp     LeaveFunc
Story2a ENDP


Story2b PROC
    push    EBP
    mov     EBP,            ESP

    Input:
        ;Storyline
        call    ReadInt

        cmp     EAX,            1
        je      L1a
        cmp     EAX,            2
        je      L1b
        cmp     EAX,            3
        je      L1c
        jmp     IncorrectInput

    LeaveFunc:
        pop     EBP
        ret

    IncorrectInput:
        ;Display incorrect input message
        jmp     Input
    L3a:
        call    Story3a
        jmp     LeaveFunc
    L3b:
        call    Story3b
        jmp     LeaveFunc
    L3c:
        call    Story3c
        jmp     LeaveFunc
Story2b ENDP


Story2c PROC
    push    EBP
    mov     EBP,            ESP

    Input:
        ;Storyline
        call    ReadInt

        cmp     EAX,            1
        je      L1a
        cmp     EAX,            2
        je      L1b
        cmp     EAX,            3
        je      L1c
        jmp     IncorrectInput


    LeaveFunc:
        pop     EBP
        ret

    IncorrectInput:
        ;Display incorrect input message
        jmp     Input
    L3a:
        call    Story3a
        jmp     LeaveFunc
    L3b:
        call    Story3b
        jmp     LeaveFunc
    L3c:
        call    Story3c
        jmp     LeaveFunc
Story2c ENDP


Story3a PROC
    push    EBP
    mov     EBP,            ESP

    pop     EBP

    ret
Story2a ENDP


Story3b PROC
    push    EBP
    mov     EBP,            ESP

    pop     EBP

    ret
Story2b ENDP


Story3c PROC
    push    EBP
    mov     EBP,            ESP

    pop     EBP

    ret
Story3c ENDP


Goodbye PROC
    push    EBP
    mov     EBP,            ESP

    call    Crlf
    mov     EDX,            [EBP+8]
    call    WriteString
    mov     EDX,            [EBP+12]
    call    WriteString
    call    Crlf

    pop     EBP

    ret     8
Goodbye ENDP

END main

;==============================================================================;
;=-=END=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;