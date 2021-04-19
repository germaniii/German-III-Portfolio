ORG 100H

STRING1 DB "THIS IS A SAMPLE STRING $"
STRING2 DB "TH1S 1S 4 S4MPL3 STR1NG $"
STRING3 DB "NO NUMBER $"
STRING4 DB "HAS NUMBER $"

START:
        
    MOV DH, 0
    MOV DL, 0
    CALL SET_CURSOR_POS
    
    LEA DX, STRING2   ;change to either STRING1 or STRING2
    CALL DISP_MESS
    
    CLD
    LEA SI, STRING2   ;change to either STRING1 or STRING2
    CALL COMPARE
    
    JMP END_PROG
    
    
    
    
    
    
COMPARE:     
     
    LODSB  
     
    CMP AL, "1"
    JZ HAS
    CMP AL, "2"
    JZ HAS
    CMP AL, "3"
    JZ HAS
    CMP AL, "4"
    JZ HAS
    CMP AL, "5"
    JZ HAS
    CMP AL, "6"
    JZ HAS
    CMP AL, "7"
    JZ HAS
    CMP AL, "8"
    JZ HAS
    CMP AL, "9"
    JZ HAS
    CMP AL, "0"
    JZ HAS
    
    CMP AL, "$"
    JZ NONE 
    
    JMP COMPARE
    
HAS:

    MOV DH, 05
    MOV DL, 0
    CALL SET_CURSOR_POS
    
    MOV DX, OFFSET STRING4
    CALL DISP_MESS
    
    RET
      
    

NONE:

    MOV DH, 05
    MOV DL, 0
    CALL SET_CURSOR_POS
    
    MOV DX, OFFSET STRING3
    CALL DISP_MESS
    
    RET   


DISP_MESS:
    
    MOV AH, 09H
    INT 21H
    RET
    
    
SET_CURSOR_POS:

    MOV AH, 02H     ; SET CURSOR POSITION
    MOV BH, 00H
    INT 10H
    RET
       
       
END_PROG:
    
    END
     


                  

    