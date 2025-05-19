org 100h
.data
str db "dove lanciare la pallina? 0=esci$"  
err db "posizione invalida, reinserire: $"   
mess db "sistemando il muro...$"      
stirato db "soldi insufficienti...$"          
cost db "costo tiro: 15$" 
win db "saldo corrente:$"
soldi dw 45
strsoldi db ""
.code       
mov dh,04h
mov dl,3h
mov ah,02h
int 10h
mov dx,offset win
mov ah,09h
int 21h
mov dh,05h
mov dl,3h
mov ah,02h
int 10h
call convertisoldi 
mov bx,00h
mov cx,00h
lea dx,  strsoldi
mov ah,09h
int 21h 
mov dh,07h
mov dl,3h
mov ah,02h
int 10h
mov dx,offset cost
mov ah,09h
int 21h

mov dh,01h 
mov dl,18h
mov ah,02h 
int 10h     
mov ch, 014h
tetto: 
mov al, '_'
mov ah, 0eh 
int 10h
dec ch
cmp ch,00h
jne tetto 
mov al, 0ah
mov ah, 0eh 
int 10h

 
mov dh,01h 
mov dl,18h
mov ah,02h 
int 10h     
mov ch, 014h
murosx:
mov al, 0ah
mov ah, 0eh 
int 10h
mov al, 08h
mov ah, 0eh 
int 10h 
mov al, 'I'
mov ah, 0eh 
int 10h  
dec ch
cmp ch,00h
jne murosx
mov dh,02h
murodx:   
mov dl,2ch
mov ah,02h 
int 10h  
mov al, 'I'
mov ah, 0eh 
int 10h 
inc dh
cmp dh,16h
jne murodx 

mov dl,1ah
mov dh,04h 
jmp puntini
riga:
mov dl,1ah
add dh,02h
puntini:  
mov ah,02h 
int 10h
mov al, '.'
mov ah, 0eh 
int 10h
add dl,04h
cmp dl,2ch
jb puntini
cmp dh,14h
jb riga     


mov dl,1ch
mov dh,05h 
jmp puntini2
riga2:
mov dl,1ch
add dh,02h
puntini2:  
mov ah,02h 
int 10h
mov al, '.'
mov ah, 0eh 
int 10h
add dl,04h
cmp dl,2ch
jb puntini2
cmp dh,14h
jb riga2         

mov dh,17h
mov dl,18h 
bicch:
mov ah,02h
int 10h
mov al, '|'
mov ah, 0eh 
int 10h     
inc dl 
mov ah,02h
int 10h
mov al, '_'
mov ah, 0eh 
int 10h         
inc dl  
mov ah,02h
int 10h
mov al, '_'
mov ah, 0eh 
int 10h    
inc dl
mov ah,02h
int 10h
mov al, '|' 
mov ah, 0eh 
int 10h   
inc dl
cmp dl,2ch
jb bicch


mov dh,18h     ;1$
mov dl, 18h 
mov ah,02h
int 10h
mov al, '1'
mov ah, 0eh 
int 10h 
inc dl
mov ah,02h
int 10h
mov al, '$'
mov ah, 0eh 
int 10h 
inc dl
mov ah,02h
int 10h

mov dl,1ch     ;25$
mov ah,02h
int 10h
mov al, '2'
mov ah, 0eh 
int 10h 
inc dl
mov ah,02h
int 10h
mov al, '5'
mov ah, 0eh 
int 10h 
inc dl
mov ah,02h
int 10h
mov al, '$'
mov ah, 0eh 
int 10h

mov dl,20h     ;100$
mov ah,02h
int 10h
mov al, '1'
mov ah, 0eh 
int 10h 
inc dl
mov ah,02h
int 10h
mov al, '0'
mov ah, 0eh 
int 10h 
inc dl
mov ah,02h
int 10h
mov al, '0'
mov ah, 0eh 
int 10h 
inc dl
mov ah,02h
int 10h
mov al, '$'
mov ah, 0eh 
int 10h 

mov dl,24h     ;25$
mov ah,02h
int 10h
mov al, '2'
mov ah, 0eh 
int 10h 
inc dl
mov ah,02h
int 10h
mov al, '5'
mov ah, 0eh 
int 10h  
inc dl
mov ah,02h
int 10h
mov al, '$'
mov ah, 0eh 
int 10h

mov dl,28h     ;1$
mov ah,02h
int 10h
mov al, '1'
mov ah, 0eh 
int 10h 
inc dl
mov ah,02h
int 10h
mov al, '$'
mov ah, 0eh 
int 10h
          
mov al,31h
mov dl,1ah
mov dh,00h
num:
mov ah,02h
int 10h
mov ah,0eh
int 10h
inc al
add dl,04h
cmp al,36h
jne num
   
cmp si,01h
jne prima
mov dl,030h
mov dh,06h
mov ah,02h
int 10h
mov si,15h  
canc2:
mov al, 20h
mov ah, 0eh 
int 10h
dec si
cmp si,00
jne canc2    
prima:   
mov dl,30h
mov dh,00h  
mov ah,02h
int 10h
mov dx,offset str
mov ah,09h
int 21h 
mov dl,30h
mov dh,01h 
reinse:       
mov ah,02h
int 10h 
mov ah,01h
int 21h
mov dh,02h
mov dl,1ah  
cmp al,31h
je uno
cmp al,32h
je due
cmp al,33h
je tre
cmp al,34h
je quattro
cmp al,35h
je cinque
cmp al,030h
je esci
mov dx, offset err   
mov ah,09h
int 21h 
mov dl,30h
mov dh,02h
jmp reinse
uno:
mov ah,02h
int 10h
mov al, 'o'
mov ah, 0eh 
int 10h
sub soldi,0fh 
jmp palla
due:   
add dl,04h 
mov ah,02h
int 10h 
mov al, 'o'
mov ah, 0eh 
int 10h    
sub soldi,0fh
jmp palla
tre: 
add dl,08h  
mov ah,02h
int 10h
mov al, 'o'
mov ah, 0eh 
int 10h   
sub soldi,0fh   
jmp palla
quattro:
add dl,0ch  
mov ah,02h
int 10h
mov al, 'o'
mov ah, 0eh 
int 10h   
sub soldi,0fh  
jmp palla
cinque:   
add dl,010h 
mov ah,02h
int 10h
mov al, 'o'
mov ah, 0eh 
int 10h   
sub soldi,0fh
palla:
push dx
mov ah, 2ch
int 21h 
mov bl,dl  
pop dx
mov al, 08h
mov ah, 0eh 
int 10h
mov al, 20h
mov ah, 0eh 
int 10h   
inc dh
mov ah,02h
int 10h 
mov al, 020h
mov ah, 0eh 
int 10h 
mov al, 'o'
mov ah, 0eh 
int 10h
cmp dh,17h
je contasoldi 
rcr bl,1
mov al,bl
mov ah,00h
mov cl,0bh
div cl
cmp ah,02h
jb dex
dec dl
jmp checkmuro
dex:
inc dl
checkmuro:
cmp dl,19h
je rimbdx:
cmp dl,2bh
je rimbsx
jmp palla
rimbdx:        
add dl,02h  
jmp palla 
rimbsx:  
sub dl,02h  
jmp palla 
contasoldi:
mov bl, dl
mov dh,04h
mov dl,3h
mov ah,02h
int 10h
mov dx,offset win
mov ah,09h
int 21h
mov dh,05h
mov dl,3h
mov ah,02h
int 10h
cmp bl,1bh
jb unos 
cmp bl,1bh
je unos
cmp bl,29h
ja unos  
cmp bl,29h
je unos
cmp bl,1fh
jb vencin 
cmp bl,1fh
je vencin
cmp bl,25h
ja vencin
cmp bl,25h
je vencin
jmp cento
unos:  
add soldi,1d
jmp fine
vencin:     
add soldi,25d
jmp fine
cento:     
add soldi,100d
fine:
call convertisoldi  
mov bx,00h
mov cx,00h
mov al, 20h
mov ah, 0eh 
int 10h
mov al, 20h
mov ah, 0eh 
int 10h
mov al, 20h
mov ah, 0eh 
int 10h
mov al, 20h
mov ah, 0eh 
int 10h
mov dh,05h
mov dl,3h
mov ah,02h
int 10h
lea dx,  strsoldi
mov ah,09h
int 21h   
cmp soldi,10h
jb stirats
mov al,00  
mov dl,30h
mov dh,01h
mov ah,02h
int 10h
mov si,20h
canc:
mov al, 20h
mov ah, 0eh 
int 10h
dec si
cmp si,00h
jne canc 
mov dl,30h
mov dh,02h
mov ah,02h
int 10h  
mov al, 20h
mov ah, 0eh 
int 10h 
mov dl,030h
mov dh,06h
mov ah,02h
int 10h  
mov dx,offset mess
mov ah,09h
int 21h
mov dl,1ah
mov dh,4h
mov si,01h
jmp puntini 
stirats:
mov dl,030h
mov dh,06h
mov ah,02h
int 10h  
mov dx,offset stirato
mov ah,09h
int 21h
esci:
mov ah,4ch
int 21h

convertisoldi proc
    mov SI,00h
    mov ax,soldi
    mov bl,0ah  
    cicl:
    inc SI
    div bl
    mov ah,00
    cmp ax,00
    jne cicl 
    mov ax,soldi
    lea bx,strsoldi
    mov [bx+si],'$'
    cicl2:  
    dec SI
    mov bh,00
    mov bl,0ah
    div bl
    lea bx,strsoldi
    add ah,030h
    mov [bx+si],ah
    mov ah,00
    cmp si,00h
    jne cicl2
    ret
convertisoldi endp
end