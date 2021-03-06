IDENTIFICATION DIVISION.
PROGRAM-ID. sqrtbabyex.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
SELECT STANDARD-OUTPUT ASSIGN TO DISPLAY.

DATA DIVISION.
FILE SECTION.
FD STANDARD-OUTPUT.
  01 out-line pic X(80).

*>intialize variables 
WORKING-STORAGE SECTION.
77 num     PIC 9(11)V9(6).
77 IN-num  PIC S9(11)V9(6) SIGN LEADING SEPARATE.
77 Y       PIC 9(11)V9(6).

*>user information set 
01 TITLE-LINE.
   02 FILLER PIC X(9) VALUE SPACES.
   02 FILLER PIC X(26) VALUE 'SQUARE ROOT APPROXIMATIONS'.

01 UNDER-LINE.
   02 FILLER PIC X(44) VALUE 
      '--------------------------------------------'.

01 COL-HEADS.
   02 FILLER PIC X(8) VALUE SPACES.
   02 FILLER PIC X(6) VALUE 'NUMBER'.
   02 FILLER PIC X(15) VALUE SPACES.
   02 FILLER PIC X(11) VALUE 'SQUARE ROOT'.

01 UNDERLINE-2.
   02 FILLER PIC X(20) VALUE ' -------------------'.
   02 FILLER PIC X(5) VALUE SPACES.
   02 FILLER PIC X(19) VALUE '------------------'.

01 PRINT-LINE.
   02 FILLER PIC X VALUE SPACE.
   02 OUT-num  PIC Z(11)9.9(6).
   02 FILLER PIC X(5) VALUE SPACES.
   02 OUT-Y  PIC Z(11)9.9(6).

01 ENTER-VALUE.
  02 FILLER PIC X(15) VALUE 
       'enter a value: '.

01 ABORT-MESS.
   02 FILLER PIC X(22) VALUE
      'negitve number to exit'.
01 ABORT.
  02 FILLER PIC X(17) VALUE
     'Aborting Program.'.

PROCEDURE DIVISION.
    OPEN OUTPUT STANDARD-OUTPUT.
INFORM.
    WRITE OUT-LINE FROM TITLE-LINE.
    WRITE OUT-LINE FROM ABORT-MESS.
    WRITE OUT-LINE FROM UNDER-LINE.
*>checks if the number inputed is positive or negitive

    PERFORM USER-INPUT THRU DISPLAY-OUT UNTIL IN-num < 0.
    USER-INPUT.
       WRITE OUT-LINE FROM ENTER-VALUE. 
       ACCEPT IN-num
    IF IN-num < 0
       PERFORM finish
           END-IF.
           MOVE IN-num TO num.

*>call external function 
CALCULATOR-BABY. 
    CALL "calculatorbaby" USING num, Y. 
    MOVE num TO OUT-num. 
    MOVE Y TO OUT-Y.
    

    DISPLAY-OUT.
    WRITE OUT-LINE FROM COL-HEADS.
    WRITE OUT-LINE FROM PRINT-LINE.
FINISH.

WRITE OUT-LINE FROM ABORT. 
    
STOP RUN.