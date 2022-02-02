data segment
msg db 10,13,"Enter the character $" 
data ends 

code segment 
assume cs:code,ds:data  
start: 
mov ax,data 
mov ds,ax  

lea dx,msg 
mov ah,09h 
int 21h


;read the char
mov ah,01h
int 21h 


mov bl,al ;keep copy of original 
;clear screen
mov ah,00h 
mov al,03h 
int 10h
;set cursor 
mov dx,0c28h
mov ah,02h 
int 10h 
;
mov al,bl

and al,0f0h ;to get first 4 bits 
mov cl,04h  ;to shift 4 bits to the right by 4 position
shr al,cl 
cmp al,0ah  ;compare if it is less than 0ah 
jl next     ;if less than 0ah ,only add 30h
add al,07h  ;if not.then add 07h ,30h
next: 
add al,30h 

mov ah,02h  ;display first char
mov dl,al 
int 21h
 
and bl,0fh 
cmp bl,0ah  
jl next1 
add bl,07h  
next1: 
add bl,30h 
mov dl,bl  ;display seconad char
mov ah,02h 
int 21h

code ends 
end start