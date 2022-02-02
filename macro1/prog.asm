;read char without echo and display the character using macros
include read.inc 
include disp.inc 
data segment 
msg db 10,13,"Enter a character$ " 
data ends 

code segment 
assume cs:code,ds:data
start:
;init data segment 
mov ax,data 
mov ds,ax  

;display msg
lea dx,msg 
mov ah,09h 
int 21h 

l1:read  
cmp al,0dh 
jz en   
disp
jmp l1 

en:              
mov ah,4ch
int 21h

code ends 
end start