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
;   1) 

; Notes:
;   1) This is a comment. We can communicate big ideas here, or even just
;		smaller questions.



INCLUDE Irvine32.inc

; CONSTANTS
;==============================================================================;

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

; FORMAT:
; opcode    op1, op2        source
Introduction:
    mov     EDX, OFFSET     sTitle
    call    WriteString
    call    Crlf

    mov     EDX, OFFSET     sAuthor
    call    WriteString
    call    Crlf

    mov     EDX, OFFSET     sPromptForName
    call    WriteString
    call    Crlf

    mov     EDX, OFFSET     sGreetings
    call    WriteString
    
    mov     EDX, OFFSET     sName
    mov     ECX,            20
    call    ReadString
    mov     dNameL,         EAX
Goodbye:
    call    Crlf
    mov     EDX, OFFSET     sGoodbye
    call    WriteString
    mov     EDX, OFFSET     sName
    call    WriteString
    call    Crlf
    exit

main ENDP
END main
;==============================================================================;
;=-=END=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;