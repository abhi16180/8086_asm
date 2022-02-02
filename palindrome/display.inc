display macro msg 
lea dx,msg 
mov ah,09h
int 21h
endm