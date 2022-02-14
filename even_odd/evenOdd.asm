; algorithm 
; read a number  
; shift the number by 1 position 
; if carry flag=0 then print even  
; if carry flag=1 then print odd 



data segment 
msg  db 10,13,"Enter a digit $"
msg1 db 10,13,"Even$"
msg2 db 10,13,"Odd$"
data ends 

code segment 
assume cs:code,ds:data
start:
mov ax,data 
mov ds,ax 

lea dx,msg 
mov ah,09h 
int 21h

mov ah,01h     ;read 
int 21h 
 
shr al,1       ;shift by 1 pos
jc false       ;jmp to falser if carry not equal to 1
lea dx,msg1    ; if carry=0  load msg1
jmp en 
false:
lea dx,msg2    ;if carry=1 load msg2

en:
mov ah,09h
int 21h        ;interrupt to display msg
mov ah,4ch 
int 21h 
code ends 
end start