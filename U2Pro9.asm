.model small;modelo de pila
.stack 100h;tama?o de pila

.data;inicio de datos
mensaje db 'Conteo ascendente:', 0Dh, 0Ah, '$'
numero db '00', 0Dh, 0Ah, '$';variable para almacenar el numero a imprimir

.code;inicio del codigo
main:;inicio del proceso
    mov ax, @data;inicializar segmento de datos
    mov ds, ax

    mov ah, 09h;funcion para imprimir cadena
    lea dx, mensaje;cargar la direccion del mensaje en DX
    int 21h;llamar a la interrupcion

    mov cx, 99;numero de iteraciones
    mov bx, 1;valor inicial
    mov si, 10;divisor para obtener decenas y unidades

loop_conteo_ascendente:
    mov ax, bx;mover el valor de BX a AX
    xor dx, dx;limpiar DX
    div si               

    cmp al,0;verificar si hay decenas
    je sin_decenas_ascendente
    add al, '0';convertir decenas a caracter ASCII
    mov [numero], al;almacenar el caracter de decenas
    jmp convertir_unidades_ascendente

sin_decenas_ascendente:
    mov byte ptr [numero], ' '

convertir_unidades_ascendente:
    add dl, '0';convertir unidades a caracter ASCII
    mov [numero+1], dl;almacenar el caracter de unidades

    mov ah, 09h;funcion para imprimir cadena
    lea dx, numero;cargar la direccion
    int 21h;llamar a la interrupcion

    inc bx;incrementar BX para el siguiente numero
    loop loop_conteo_ascendente

    mov ah, 4Ch;funcion para terminar el programa
    int 21h;llamar a la interrupcion

end main