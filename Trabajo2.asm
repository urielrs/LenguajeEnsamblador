CR EQU 13 ;Constante CR (Retorno de acarreo) en decimal

LF EQU 10 ;Constante LF (Salto de linea) en hex es igual



Datos Segment

    Mensaje db CR,LF, 'Hola Mundo! (con Funcion o Procedimiento)',CR,LF,'$'
    
    
Datos Ends



Pila Segment Stack

    db 64 DUP('PILA') ;inicializacion de la pila

Pila Ends



Codigo Segment

    holam3 proc far
    
    Assume CS:Codigo,DS:Datos,SS:Pila
    
    mov ax,Datos ;ax=direccion del segmento de datos
    
    mov ds,ax ;ds=ax indica el segmentode datos
    
    lea dx,Mensaje ;ds:dx= direccion del mensaje
    
    call Escribe;llamar al procedimientp Escribe
    
    mov ax,4c00h;funcion para terminar el programa
    
    int 21h; y volver al DOS
    
    holam3 endp
    
Escribe proc; inicio procedimiento Escribe

    mov ah,9; funcion DOS para escribir texto en pantalla
    
    int 21h; llamar a la interrupcion del DOS
    
    ret;volver o retornar
    
Escribe endp; Fin del Procedimiento Escribe

Codigo Ends

End holam3