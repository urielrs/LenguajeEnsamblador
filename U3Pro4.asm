.model small
.stack
.data

input db 10 dup(""),"$"

.code

main proc
mov ax,@data
mov ds,ax

mov ah,3fh;leer informacion de un archivo
mov bx,00h;mueve el identificador del archivo de entrada
mov cx,10;indica el tama?o del buffer de entrada
mov dx,offset[input];muevela direccion de memoria del buffer
int 21h

mov ah,02h;llamada para limpiar en pantalla
mov dl,10
int 21h

mov ah,09h;carga la direccion de la cadena
mov dl,offset[input]
int 21h

mov ah,01
int 21h

mov ah,4ch
int 21h



main endp

end main