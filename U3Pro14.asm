;macro
imprimir macro cadena
mov ah,09h
lea dx,cadena
int 21h
endm

;fin macro

;inicio de codigo

.model small
.stack
.data

frase db 10,13,7,"Buen Dia Panchis","$"

.code
main proc

mov ax,@data
mov dx,ax

;imprime macro

imprimir frase
imprimir frase
imprimir frase

mov ah,4ch
int 21h

.exit
main endp

end main