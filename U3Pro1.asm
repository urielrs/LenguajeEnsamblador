.model small
.stack
.data

numero1 db 0
numero2 db 0
suma db 0
resta db 0

mensaje1 db 10,13, "Ingresa el primer numero","$"
mensaje2 db 10,13, "Ingresa el segundo numero","$"
mensaje3 db 10,13, "La suma es:","$"
mensaje4 db 10,13, "la resta es:","$"

.code
begin proc far
mov ax,@data
mov ds,ax
mov ah,09h
lea dx,mensaje1
int 21h
mov ah,01
int 21h
mov ah,01
int 21h
sub al,30h
mov numero1,al

mov ah,09h
lea dx,mensaje2
int 21h
mov ah,01
int 21h
sub al,30h
mov numero2,al

mov al,numero1
add al,numero2
mov suma,al

mov al,numero1
sub al,numero2
mov resta,al

mov ah,09h
lea dx,mensaje3
int 21h
mov al,suma
add al,30h
mov ah,02
int 21h

mov ah,09h
lea dx,mensaje4
int 21h
mov dl,resta
add al,30h
mov ah,02
int 21h

begin endp
end  begin