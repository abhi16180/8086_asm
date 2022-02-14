;algorithm
; rotate the number by 1 positon  
; check carry flag   
; if carry=1 increment count   
; repeat  8 times  
; print count   (prints number of 1s)
; subtract count from 8 to get number of 0s 
; print the result

data segment 
a db 01h                ;init a with any 8 bit number
data ends 
;macro to display count 
disp macro count 
mov dl,count          
add dl,30h             
mov ah,02h 
int 21h
endm

code segment
assume cs:code,ds:data 
start:
mov ax,data              ;init 
mov ds,ax 

mov al,a                 ;mov contents of a to al
mov cl,8                 ;8 bits 
mov bl,0                 ;initialise bl with 0

loop1:                   ;loop to count number of 1's
ror al,1                 ;moves bit by one position
jnc continue             ;compares if carry bit is 1
inc bl                   ;if carry =1 then increment bl 
continue:loop loop1      ;if not just continue the loop untill cl becomes 0

                         ;now bl contains number of 1's 

disp bl                  ;display bl 
mov al,08                ;subtract bl from 8 to get number of 0's
sub al,bl                ;al contains number of 0's
disp al                  ;display al



mov ah,4ch               ;terminate prog
int 21h 


code ends 
end start