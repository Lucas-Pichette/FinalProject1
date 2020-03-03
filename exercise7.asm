;=-=-=BEGINNING=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=80-char=-=-;
TITLE Exercise 7 (execise7.asm)

;~TITLE BLOCK~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
; Author:               Lucas Pichette
; Course/Project ID:    CS271-Exercise7
; Description:          Exercise 7 is aimed to provide practice with FPU and
;                           the stack.
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;



; Tasks:
;   1) Display program title and your name. Then get user's name and greet the
;       user.
;   2) Get user's name and greet user.
;   3) Prompt the user to choose between integer or floating-point arithmetic
;   4) Using a counted loop, prompt the user to give 5 integers or floating-
;       point numbers based on the choice they did. Push the numbers into the
;       integer or floating-point stack based on the choice they did.
;   5) Calculate and display the sum and the average of the entered numbers.
;   6) Ask the user if they want to perform another calculation or exit.
;   7) When the user chooses to exit the program, display a goodbye message 
;       that includes the user's name and terminate the program.

; Requirements:
;   1) Main procedure is disected into the following sections:
;       a) Introduction
;       b) User instructions
;       c) Get the data
;       d) Calculate sum
;       e) Calculate average
;       f) Display numbers
;       g) Choose between continue or exit
;       h) Say goodbye
;   2) The loop that gets the numbers from the user should be implemented as
;       a counted loop
;   3) The program should not use any variables to store the numbers.
;       Everything should be done using the stack and registers should only be
;       used for the operations.
;   4) All the requirements regarding the documentation, readability, and 
;       user-friendliness apply.

; Notes:
;   1) THE INSTRUCTOR STATED THAT WE CAN HAVE A VARIABLE FOR THE RESULT AND 
;       ONLY THE RESULT.


INCLUDE Irvine32.inc

; CONSTANTS
;==============================================================================;



;==============================================================================;



.data ; BUFFER IN RAM
;==============================================================================;

sTitle          BYTE        "Title:     Int & FPU Arith. Using Stack (Exc.6)",0
sAuthor         BYTE        "Author:    Lucas Pichette",0
sPromptForName  BYTE        "What's your name dude? ",0
sGreetings      BYTE        "Hello, ",0
sGoodbye        BYTE        "Goodbye, ",0
sWhiteSpace     BYTE        "     ",0
sName           BYTE        20      DUP(0)

dNameL          DWORD       ?
dTemp           DWORD       ?
dLeftOperand    DWORD       ?
dRightOperand   DWORD       ?
dNumFibResults  DWORD       ?

;==============================================================================;



.code
;==============================================================================;
main PROC

; MY FORMAT:
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
User_Instructions:

Get_the_Data:

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

; EXAMPLE OUTPUT: (Input in brackets '[]')
; Title:     Int & FPU Arith. Using Stack (Exc.6)
; Author:    Lucas Pichette
; 
; What's your name? [Lucas]
; Hello, Lucas
; Would you like to enter integer (0) or floating-point (1) arithmetic? [1]
;
; You chose to perform floating-point arithmetic. Please enter 5 numbers.
; [1]
; [4]
; [3]
; [2]
; [5]
; The sum of the five numbers is 15
; The average of the five numbers is 3
;
; Do you want to exit (0) or perform another calculation (1)? [0]
;
; Goodbye, Lucas