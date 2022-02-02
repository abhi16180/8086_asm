;linear search
data segment
arr db 1,2,3,4,5
len db $-arr
key db 0
msg1 db "FOUND$" 
msg2 db "NOT FOUND$"
res db 0
data ends

code segment
assume cs:code,ds:data
start:
mov ax,data
mov ds,ax
mov cl,len
mov si,0
mov bl,key
loop1:
mov al,arr[si]
cmp al,bl
jz  true

inc si
loop loop1

lea dx,msg2 
mov ah,09h
int 21h
jmp en
true:
lea dx,msg1
mov ah,09h
int 21h
en:mov ah,4ch
int 21h

code ends
end start
