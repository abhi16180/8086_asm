;working properly

include read.inc 
include write.inc 
include display.inc 

data segment 
str1 db 10 dup(?)
str2 db 10 dup(?)
msg1 db 0ah,0dh, "Enter the string $"
msg2 db 0ah,0dh, "The reveresed string is $" 
msg3 db 0ah,0dh, "String is a palindrome $"
msg4 db 0ah,0dh, "String is not palindrome $"
data ends

code segment 
assume cs:code,ds:data,es:data

start:
  mov ax,data 
  mov ds,ax
  mov es,ax
  display msg1 
  lea si,str1 
  mov cx,00h

loop1:
  read
  cmp al,0dh
  jz next
  mov [si],al 
  inc si 
  inc cx 
  jmp loop1

next:
  display msg2 
  lea di,str2 
  mov bx, cx  

loop2:
  dec si
  mov al,[si] 
  mov [di],al 
  write 
  inc di 
  loop loop2 

compare: 
  lea si,str1 
  lea di,str2 
  mov cx,bx
  cld
  repe cmpsb 
  jne nopal
  display msg3
  jmp end_p 

nopal:
  display msg4 

end_p:
  mov ah,4ch
  int 21h

code ends
end start
