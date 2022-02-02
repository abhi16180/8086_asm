code segment
assume cs:code
start:

mov ah,00h
mov al,03h
int 10h

mov dx,0c28h
mov ah,02h
int 10h

mov ah,2ch ;hr:ch,min:cl,sec:dh
int 21h
;disp hr
mov al,ch
aam
mov bx,ax
call disp

mov dl,':'
mov ah,02h
int 21h

mov al,cl
aam
mov bx,ax
call disp

mov dl,':'
mov ah,02h
int 21h


mov al,dh
aam
mov bx,ax
call disp

mov ah,4ch
int 21h


disp proc near
mov dl,bh
add dl,30h
mov ah,02h 
int 21h
mov dl,bl
add dl,30h
mov ah,02h
int 21h
ret
disp endp
code ends
end start
