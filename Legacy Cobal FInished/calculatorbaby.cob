IDENTIFICATION DIVISION.
PROGRAM-ID. calculatorbaby. 

DATA DIVISION.

WORKING-STORAGE SECTION.
77 DIFF   PIC 9(11)V9(6).
77 K      PIC 9(11)V9(6).
77 TEMP   PIC 9(11)V9(6).
77 X      PIC 9(11)V9(6).

*>link x and num
LINKAGE SECTION.
77 num   PIC 9(11)V9(6). 
77 Y     PIC 9(11)V9(6).

*> links external function too code
PROCEDURE DIVISION USING num, Y.

*>accuracy checks accuracy that doesn't Reach error
accuracy. 
    
    COMPUTE X = num/2.
    MOVE 0.000001 TO DIFF.
    PERFORM calc 
        VARYING K FROM 1 BY 1 
        UNTIL K > 1000.

*> Computes the equation
calc. 
    COMPUTE Y = 0.5 * (X + num / X).
    COMPUTE TEMP = Y - X.
       IF TEMP / (Y+X) > DIFF
          MOVE Y TO X
          END-IF.
               

