;-------------------------------------------------------------------------------
;@file:        Retardos.inc
;@author:      Rumiche Chunga Gian Pierre Alexis
;@date:        08/01/2023
;@Tarjeta:     Curiosity  Nano PIC18f57q84
;@brief:        El presente programa esta elaborado para la implementacion de
;           los retardos en ms como en us,la frecuencia del oscilador es de 4MHz.
;@Version and program:  MPLAB X IDE v6.00
;------------------------------------------------------------------------------   

PSECT udata_acs
Contador1: DS 1
Contador2: DS 1
  
PSECT code

;Retardo de 250ms    
;250ms 



delay_250ms:              ; 2 Tcy
    MOVLW   250           ; 1 Tcy --k2
    MOVWF   Contador2,0   ; 1 Tcy
   ;T=(6+4k)us            ; 1Tcy=1us
Ext_Loop:
    MOVLW   249           ;1 Tcy--k1
    MOVWF   Contador1,0   ;1 Tcy
Int_Loop:
    NOP                   ; k1*Tcy
    DECFSZ Contador1,1,0  ; (k1-1)+3Tcy
    GOTO Int_Loop         ; (k1-1)*2Tcy
    DECFSZ Contador2,1,0
    GOTO Ext_Loop
    RETURN		  ;2 Tcy