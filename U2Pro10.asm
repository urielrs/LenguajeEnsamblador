.model small;modelo de pila
.stack 100h;tama?o de pila
.data;inicio de datos
    mensaje1 db 10,13,"Ingresa el primer numero: $"
    mensaje2 db 10,13,"Ingresa el segundo numero: $"
    mayor_mensaje db 10,13,"El numero mayor es: $"
    numero1 db ?
    numero2 db ?
    resultado db 0
.code;inicio del codigo
main proc;inicio del proceso
    
    mov ax, @data;segmento de datos
    mov ds, ax

    mov ah, 09h;mostrar mensaje 1
    lea dx, mensaje1
    int 21h

    mov ah, 01h;leer primer numero
    int 21h
    sub al, 30h;convertir de ASCII a valor numerico
    mov numero1, al;guardar el primer numero en numero1

    mov ah, 09h;mostrar mensaje 2
    lea dx, mensaje2
    int 21h

    mov ah, 01h;leer segundo numero
    int 21h
    sub al, 30h;convertir de ASCII a valor numerico
    mov numero2, al;guardar el segundo numero en numero2

    mov al, numero1;cargar numero1 en al
    mov bl, numero2;cargar numero2 en bl
    cmp al, bl;comparar los numeros
    jg es_mayor           

    mov al, bl;cargar el numero mayor en al

es_mayor:
    mov resultado, al;guardar el resultado

    mov ah, 09h;mostrar mensaje
    lea dx, mayor_mensaje
    int 21h

    mov al, resultado
    add al, 30h;convertir de valor numerico a ASCII

    mov dl, al
    mov ah, 02h
    int 21h

    mov ah, 4Ch
    int 21h
    main endp;fin del proceso
    end main;fin del programa