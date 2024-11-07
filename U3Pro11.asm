.model small
.stack 100h
.data
msg1 db 10,13,7,"Ingrese el primer digito: $"
newline db 0Dh,0Ah,'$'
msg2 db 10,13,7,"Ingrese el segundo digito: $"
msg_result db 10,13,7, "El resultado de la resta es: $"
resultado db ?

.code
main:

    mov ax, @data
    mov ds, ax
    
    mov ah,09h
    lea dx,msg1
    int 21h
    
    lea dx,newline
    int 21h
    
    mov ah,01h
    int 21h
    sub al, '0'
    mov bl, al
    
    mov ah,09h
    lea dx,msg2
    int 21h
    
    lea dx, newline
    int 21h
    
    mov ah,01h
    int 21h
    sub al, '0'
    mov bh, al
    
    mov al, bl
    sub al, bh
    jc negativo
    
    add al, '0'
    mov resultado, al
    
    jmp mostrar_resultado
    
negativo:
    mov dl,'-'
    mov ah,02h
    int 21h
    
    neg al
    add al,'0'
    mov resultado, al
    
mostrar_resultado:
    
    mov ah,09h
    lea dx, msg_result
    int 21h
    
    lea dx, newline
    int 21h
    
    mov dl, resultado
    mov ah,02h
    int 21h
    
    mov ah, 4Ch
    int 21h
    
    end main