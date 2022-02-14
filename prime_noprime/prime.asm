disp macro msg  
lea dx,msg  
mov ah,09h  
int 21h 
endm 

data segment
prime db 10,13,"Prime$"  
noprime db 10,13,"Not prime$"  
a dw 13h 
data ends  

code segment
assume cs:code,ds:data  

start:
mov ax,data  
mov ds,ax    
mov ax,a  
cmp ax,3  
jl p 
 
mov cx,a 
shr cx,1 
mov bl,2 
 
 
loop1:
        mov ax, a
        div bl   
        mov dl,ah      
        cmp dl,0  
        jz no  
        inc bl
        
        loop loop1 
 
p:disp prime 
jmp en 
no: 
disp noprime 
 
 
en: 
mov ah,4ch 
int 21h  
code ends  
end start