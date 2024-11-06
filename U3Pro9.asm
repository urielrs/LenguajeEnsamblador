.model small
.stack 64
.data

msg db "mensaje$"
len equ $ - msg - 1
.code
inicio:
mov ax, @data
mov ds, ax

mov ah, 02h
mov dl, 0ah
int 21h

mov ah, 02h
mov dl, 0dh
int 21h

mov si, len

ciclo_inverso:
dec si                     
mov dl, msg[si]      
cmp si, -1               
jl fuera_ciclo          

mov ah, 02h               
int 21h                 

jmp ciclo_inverso         

fuera_ciclo:

mov ah, 02h
mov dl, 0ah            
int 21h

mov dl, 0dh              
int 21h


mov si, 0                

ciclo_vertical:
mov dl, msg[si]        
cmp msg[si], '$'         
je fin                   

mov ah, 02h               
int 21h                   

mov ah, 02h
mov dl, 0ah              
int 21h

mov dl, 0dh              
int 21h

inc si                    
jmp ciclo_vertical        

fin:
mov ax, 4c00h            
int 21h

end inicio