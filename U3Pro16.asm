imprimir macro cadena
mov ah,09h
lea dx,mensaje1
int 21h

mov ax,0e59h
mov bx,0e41h
mov cx,0e4bh
mov dx,0e4fh

push dx
push cx
push bx
push ax

mov bx,0071h
mov ah,09h
lea dx,espacio
int 21h
pop ax
int 10h

mov ah,09h
lea dx,espacio
int 21h
pop ax
int 10h
mov ah,09h
lea dx,espacio
int 21h
pop ax
int 10h
mov ah,09h
lea dx,espacio
int 21h
pop ax
int 10h
mov ah,09h
lea dx,espacio
int 21h

int 21h
endm

.model small
.stack
.data

mensaje1 db 10,13,7,"Resultado de pila: ","$"
espacio db 10,13,7," ","$"
.code
main proc

mov ax,SEG @data
mov ds,ax

imprimir espacio
imprimir espacio
imprimir espacio

mov ax,4c00h
int 21h

main endp

end main