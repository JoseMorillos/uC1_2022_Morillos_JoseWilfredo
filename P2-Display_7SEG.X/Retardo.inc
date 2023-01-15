PSECT udata_acs
Contador1: DS 1
Contador2: DS 1
  
PSECT code

;Retardo de 250ms    
;250ms 



Delay_250ms:              ; 2 Tcy
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





