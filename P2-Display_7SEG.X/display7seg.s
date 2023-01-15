;Autor: MORILLOS VALVERDE, JOSÉ WILFREDO -----
;Fecha:_14/01/2023
;programa: MPLAB X IDE v6.00----compilador xc8
;----PIC18F57Q84-----------------------------    
   
processor 18F57Q84
#include "Bit_config.inc"/* config statements should precede project file includes.*/
#include <xc.inc>
#include "Retardo.inc"
PSECT resetvect,class=CODE,reloc=2
resetvect:
    GOTO main
PSECT CODE
main:
    CALL config_osc,1
    CALL config_port,1
    BTFSS LATA,3,0
    GOTO forma_A   ;nos lleva a la etiqueta forma_A
forma_el_0:
    CALL Delay_250ms  ;
    CALL Delay_250ms  
    MOVLW 01000000B   
    MOVWF LATD,1      
    CALL Delay_250ms
    CALL Delay_250ms
    BTFSS PORTA,3,0
    GOTO forma_A
forma_el_1:
    CALL Delay_250ms
    CALL Delay_250ms
    MOVLW 01111001B ;f
    MOVWF LATD,1
    CALL Delay_250ms
    CALL Delay_250ms
    BTFSS PORTA,3,0
    GOTO forma_A
forma_el_2:
    CALL Delay_250ms
    CALL Delay_250ms
    MOVLW 00100100B
    MOVWF LATD,1
    CALL Delay_250ms
    CALL Delay_250ms
    BTFSS PORTA,3,0
    GOTO forma_A
forma_el_3:
    CALL Delay_250ms
    CALL Delay_250ms
    MOVLW 00110000B
    MOVWF LATD,1
    CALL Delay_250ms
    CALL Delay_250ms
    BTFSS PORTA,3,0
    GOTO forma_A
forma_el_4:
    CALL Delay_250ms
    CALL Delay_250ms
    MOVLW 00011001B
    MOVWF LATD,1
    CALL Delay_250ms
    CALL Delay_250ms
    BTFSS PORTA,3,0
    GOTO forma_A
forma_el_5:
    CALL Delay_250ms
    CALL Delay_250ms
    MOVLW 00010010B
    MOVWF LATD,1
    CALL Delay_250ms
    CALL Delay_250ms
    BTFSS PORTA,3,0
    GOTO forma_A
forma_el_6:
    CALL Delay_250ms
    CALL Delay_250ms
    MOVlW 00000010B
    MOVWF LATD,1
    CALL Delay_250ms
    CALL Delay_250ms
    BTFSS PORTA,3,0
    GOTO forma_A
forma_el_7:
    CALL Delay_250ms
    CALL Delay_250ms
    MOVLW 01111000B
    MOVWF LATD,1
    CALL Delay_250ms
    CALL Delay_250ms
    BTFSS PORTA,3,0
    GOTO forma_A
forma_el_8:
    CALL Delay_250ms
    CALL Delay_250ms
    MOVLW 00000000B
    MOVWF LATD,1
    CALL Delay_250ms
    CALL Delay_250ms
    BTFSS PORTA,3,0
    GOTO forma_A
forma_el_9:
    CALL Delay_250ms
    CALL Delay_250ms
    MOVLW 00011000B
    MOVWF LATD,1
    CALL Delay_250ms
    CALL Delay_250ms
    BTFSS PORTA,3,0
    CALL forma_A
    GOTO forma_el_0
forma_A:
    CALL Delay_250ms
    CALL Delay_250ms
    MOVLW 00001000B
    MOVWF LATD,1
    CALL Delay_250ms
    CALL Delay_250ms
    BTFSC PORTA,3,0
    GOTO forma_el_0
forma_B:
    CALL Delay_250ms
    CALL Delay_250ms
    MOVLW 00000011B
    MOVWF LATD,1
    CALL Delay_250ms
    CALL Delay_250ms
    BTFSC PORTA,3,0
    GOTO forma_el_0
forma_C:
    CALL Delay_250ms
    CALL Delay_250ms
    MOVLW 01000110B
    MOVWF LATD,1
    CALL Delay_250ms
    CALL Delay_250ms
    BTFSC PORTA,3,0
    GOTO forma_el_0
forma_d:
    CALL Delay_250ms
    CALL Delay_250ms
    MOVLW 00100001B
    MOVWF LATD,1
    CALL Delay_250ms
    CALL Delay_250ms
    BTFSC PORTA,3,0
    GOTO forma_el_0
forma_e:
    CALL Delay_250ms
    CALL Delay_250ms
    MOVLW 00000100B
    MOVWF LATD,1
    CALL Delay_250ms
    CALL Delay_250ms
    BTFSC PORTA,3,0
    GOTO forma_el_0
forma_f:
    CALL Delay_250ms
    CALL Delay_250ms
    MOVLW 00001110B
    MOVWF LATD,1
    CALL Delay_250ms
    CALL Delay_250ms
    BTFSC PORTA,3,0
    GOTO forma_el_0
    GOTO forma_A
config_osc:
    BANKSEL OSCCON1
    MOVLW 0X60 ;SELECIONAMOS EL BLOQUE DEL OSCILADOR INTERNO CON UN DIV:1
    MOVWF OSCCON1,1
    BANKSEL OSCFRQ
    MOVLW 0x02;SELECIONAMOS UNA FRECUENCIA DE 8MHZ
    MOVWF OSCFRQ,1
    RETURN
config_port:
    BANKSEL PORTD
    SETF PORTD,1; PORTF=0
    SETF LATD,1; LATF<3>=1 , LED OFF 
    CLRF ANSELD,1; ANSELF <7:0> - PORTF DIGITAL 
    CLRF TRISD,1 ; RF3-> COMO SALIDA 
;configurando boton 
    BANKSEL PORTA 
    SETF PORTA,1 
    CLRF ANSELA,1    ;PORTA DIGITAL 
    BSF TRISA,3,1    ;RA3 COMO ENTRADA
    BSF WPUA,3,1     ;ACTIVAMOS LA RESISTENCIA PULL-UP DEL PIN RA3
    RETURN  
END resetvect




