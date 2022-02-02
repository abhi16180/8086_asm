;read string and display it in newline 

include read.inc 
include disp.inc
data segment 
str1 db 100 dup(?) 
newline db 10,13,"$"
data ends 

code segment 
assume cs:code,ds:data  
start: 
mov ax,data 
mov ds,ax  

lea si,str1 
mov cl,00h 
loop1: 
read
mov [si],al 
inc si 
inc cl  
cmp al,0dh  
jnz loop1 

lea dx,newline 
mov ah,09h 
int 21h 
lea si,str1 


loop2:
dec cl 
cmp cl,00h 
jz next
mov al,[si] 
disp
inc si 
jmp loop2 

next:



mov ah,4ch
int 21h 
code ends 
end start