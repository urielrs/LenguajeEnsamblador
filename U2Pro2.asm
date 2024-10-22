.model small; se asigna tama?o de memoria
.stack;modelo de pila
.data;inicio de datos

.code;inicio del codigo
main proc;inicia proceso principal
mov cx,9
ciclo:


mov ah,02
mov dx,cx
add dx,30h
int 21h


loop ciclo

mov ax,4c00h;salir del pograma
int 21h
main endp;termina procedimiento
end main