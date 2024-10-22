.model small
.stack
.data

mensaje db "Tecnologico de Estudios Superiores de Jilotepec","$"
mensaje2 db 10,13,"Ing. Sistemas Computacionales","$"
mensaje3 db "                                      ","$"
.code
main proc
mov cx,5
ciclo:
mov ax, SEG @data
mov ds, ax
mov ah,09
lea dx,mensaje
int 21h

mov ah,09

lea dx, mensaje3
int 21h

mov ah,09

lea dx,mensaje2
int 21h

loop ciclo

mov ax,4c00h
int 21h
main endp
end main