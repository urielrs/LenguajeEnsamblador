CR EQU 13;retorno de carro
LF EQU 10;salto de l?nea

DATOS SEGMENT;Inicio de la secci?n de datos
       LINEA1 DB CR,LF,'Uriel Rodriguez Salazar',CR,LF,'$';Definici?n de la primera l?nea de texto
       LINEA2 DB 'Tecnologico de Estudios Superiores de Jilotepec',CR,LF,'$';Segunda l?nea de texto
       LINEA3 DB 'ING. SISTEMAS COMPUTACIONALES',CR,LF,'$';Tercera l?nea de texto
       LINEA4 DB 'PANCHIS ;-;',CR,LF,'$';Cuarta l?nea de texto
DATOS ENDS;Fin de la secci?n de datos

PILA SEGMENT STACK;Pila
    DB 64 DUP('PILA')
PILA ENDS;Fin de pila

CODIGO SEGMENT;Inicio de c?digo
    LN PROC FAR;Procedimiento

    ASSUME CS:CODIGO,DS:DATOS,SS:PILA;Asignaci?n de segmentos
    MOV AX,DATOS;Carga la direcci?n del segmento de datos en AX
    MOV DS,AX;Mueve la direcci?n de AX al registro DS para acceder a los datos

    LEA DX,LINEA1;Carga la direcci?n de LINEA1 en DX
    CALL ESCRIBE;Llama al procedimiento ESCRIBE para imprimir LINEA1
    LEA DX,LINEA2;Carga la direcci?n de LINEA2 en DX
    CALL ESCRIBE;Llama al procedimiento ESCRIBE para imprimir LINEA2
    LEA DX,LINEA3;Carga la direcci?n de LINEA3 en DX
    CALL ESCRIBE;Llama al procedimiento ESCRIBE para imprimir LINEA3
    LEA DX,LINEA4;Carga la direcci?n de LINEA4 en DX
    CALL ESCRIBE;Llama al procedimiento ESCRIBE para imprimir LINEA4

    MOV AX,4C00H;Termina el programa
    INT 21H;Interrupci?n 21h

    LN ENDP                  

    ESCRIBE PROC;Inicio del procedimiento ESCRIBE
    MOV AH,9;Imprimir una cadena de texto
    INT 21H;Llama a la interrupci?n 21h
    RET;Retorna del procedimiento ESCRIBE
    ESCRIBE ENDP;Fin del procedimiento ESCRIBE

    CODIGO ENDS;Fin del c?digo

    END LN;Indica el final
