.model small;tama?o de memoria
.stack;pila
.data;inicio de la secci?n de datos

u db 0;inicializa en 0
d db 0;inicializa en 0
n db 0;inicializa en 0

mensaje db 10,13,7, "Ingrese un numero ",'$';mensaje para solicitar un n?mero
mensaje2 db 10,13,7, "Numero ingresado ",'$';mensaje que se mostrar? despu?s de ingresar el n?mero

.code;inicio de c?digo
main proc;procedimiento

mov ax, SEG @data;carga el segmento de datos en AX
mov ds, ax;mueve el valor de AX al registro de segmento de datos DS

mov ah,09;impresi?n de cadena
lea dx,mensaje;carga la direcci?n del mensaje en DX
int 21h;interrupci?n 21h

mov ah,01h;lectura de car?cter
int 21h;llama a la interrupci?n 21h
sub al,30h;convierte el car?cter ASCII le?do a su valor num?rico
mov d,al;almacena el valor de la decena en la variable d

mov ah,01h;lectura de car?cter
int 21h;llama a la interrupci?n 21h 
sub al,30h;convierte el car?cter ASCII le?do a su valor num?rico
mov u,al;almacena el valor de la unidad en la variable u

mov al,d;carga el valor de d en AL
mov bl,10;carga 10 en BL para multiplicar
mul bl;multiplica AL por BL
add al,u;Suma el valor de u a AL
mov n,al;almacena el resultado final en la variable n

mov ah,09h;imprimir el segundo mensaje
lea dx, mensaje2;carga la direcci?n del segundo mensaje en DX
int 21h;llama a la interrupci?n 21h

mov al,n;carga el resultado final en AL
AAM                          
mov bx,ax                    

mov ah,02h;imprimir un car?cter
mov dl,bh;carga la decena en DL
add dl,30h;convierte el n?mero a su car?cter ASCII
int 21h;llama a la interrupci?n 21h

mov ah,02h;imprimir otro car?cter
mov dl,bl;carga la unidad en DL
add dl,30h;convierte el n?mero a su car?cter ASCII
int 21h;llama a la interrupci?n 21h

main endp;fin del procedimiento

end main;indica el final