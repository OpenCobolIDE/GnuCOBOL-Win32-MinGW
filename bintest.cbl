       IDENTIFICATION DIVISION.
       PROGRAM-ID. bintest.
      *****************************************************************
      ** This program demonstrates various characteristics of binary **
      ** (i.e. USAGE COMP or COMP-5) data in OpenCobol.  The output  **
      ** explains what is being demonstrated.                        **
      **                                                             **
      ** AUTHOR:       GARY L. CUTLER                                **
      **               CutlerGL@gmail.com                            **
      **                                                             **
      ** DATE-WRITTEN: June 10, 2009                                 **
      **                                                             **
      *****************************************************************
      **  DATE  CHANGE DESCRIPTION                                   **
      ** ====== ==================================================== **
      ** GC0609 INITIAL CODING.                                      **
      ** AT0816 CHANGE DATE FOR GnuCOBOL 2.0.0 RC1.                  **
      *****************************************************************
       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01  test-Item                  PIC S999V99 VALUE -2.45.

       01  Group-Item.
           05 FILLER                  PIC X(8)  VALUE ' COMP: "'.
           05 GI-Comp         COMP    PIC 9(9).
           05 FILLER                  PIC X(12) VALUE '"  COMP-5: "'.
           05 GI-Comp-5       COMP-5  PIC 9(9).
           05 FILLER                  PIC X(1)  VALUE '"'.

       01  Various-Items.
           05 VI-Pic-X-1              PIC X(1)  VALUE '{'.
           05 VI-Pic-9-1 REDEFINES VI-Pic-X-1
                              COMP    PIC 9(1).
           05 VI-Pic-9-2      COMP    PIC 9(2).
           05 VI-Pic-9-3      COMP    PIC 9(3).
           05 VI-Pic-9-4      COMP    PIC 9(4).
           05 VI-Pic-9-5      COMP    PIC 9(5).
           05 VI-Pic-9-6      COMP    PIC 9(6).
           05 VI-Pic-9-7      COMP    PIC 9(7).
           05 VI-Pic-9-8      COMP    PIC 9(8).
           05 VI-Pic-9-9      COMP    PIC 9(9).
           05 VI-Pic-9-10     COMP    PIC 9(10).
           05 VI-Pic-9-11     COMP    PIC 9(11).
           05 VI-Pic-9-12     COMP    PIC 9(12).
           05 VI-Pic-9-13     COMP    PIC 9(13).
           05 VI-Pic-9-14     COMP    PIC 9(14).
           05 VI-Pic-9-15     COMP    PIC 9(15).
           05 VI-Pic-9-16     COMP    PIC 9(16).
           05 VI-Pic-9-17     COMP    PIC 9(17).
           05 VI-Pic-9-18     COMP    PIC 9(18).
           05 VI-Pic-9-3-Disp DISPLAY PIC 9(3).
           05 VI-Result       COMP    PIC 9(5).

       PROCEDURE DIVISION.

       000-Main.
           MOVE 541608225 TO GI-Comp
                             GI-Comp-5.
           DISPLAY ' '.
           DISPLAY 'See the difference between COMP and COMP-5 items '
                   'when 541608225 is MOVEd to each:'.
           DISPLAY Group-Item.
           DISPLAY ' '.
           DISPLAY '# of bytes allocated for COMP/COMP-5 fields:'.
           DISPLAY 'PIC 9(1) COMP  LENGTH = '
                   FUNCTION BYTE-LENGTH(VI-Pic-9-1).
           DISPLAY 'PIC 9(2) COMP  LENGTH = '
                   FUNCTION BYTE-LENGTH(VI-Pic-9-2).
           DISPLAY 'PIC 9(3) COMP  LENGTH = '
                   FUNCTION BYTE-LENGTH(VI-Pic-9-3).
           DISPLAY 'PIC 9(4) COMP  LENGTH = '
                   FUNCTION BYTE-LENGTH(VI-Pic-9-4).
           DISPLAY 'PIC 9(5) COMP  LENGTH = '
                   FUNCTION BYTE-LENGTH(VI-Pic-9-5).
           DISPLAY 'PIC 9(6) COMP  LENGTH = '
                   FUNCTION BYTE-LENGTH(VI-Pic-9-6).
           DISPLAY 'PIC 9(7) COMP  LENGTH = '
                   FUNCTION BYTE-LENGTH(VI-Pic-9-7).
           DISPLAY 'PIC 9(8) COMP  LENGTH = '
                   FUNCTION BYTE-LENGTH(VI-Pic-9-8).
           DISPLAY 'PIC 9(9) COMP  LENGTH = '
                   FUNCTION BYTE-LENGTH(VI-Pic-9-9).
           DISPLAY 'PIC 9(10) COMP LENGTH = '
                   FUNCTION BYTE-LENGTH(VI-Pic-9-10).
           DISPLAY 'PIC 9(11) COMP LENGTH = '
                   FUNCTION BYTE-LENGTH(VI-Pic-9-11).
           DISPLAY 'PIC 9(12) COMP LENGTH = '
                   FUNCTION BYTE-LENGTH(VI-Pic-9-12).
           DISPLAY 'PIC 9(13) COMP LENGTH = '
                   FUNCTION BYTE-LENGTH(VI-Pic-9-13).
           DISPLAY 'PIC 9(14) COMP LENGTH = '
                   FUNCTION BYTE-LENGTH(VI-Pic-9-14).
           DISPLAY 'PIC 9(15) COMP LENGTH = '
                   FUNCTION BYTE-LENGTH(VI-Pic-9-15).
           DISPLAY 'PIC 9(16) COMP LENGTH = '
                   FUNCTION BYTE-LENGTH(VI-Pic-9-16).
           DISPLAY 'PIC 9(17) COMP LENGTH = '
                   FUNCTION BYTE-LENGTH(VI-Pic-9-17).
           DISPLAY 'PIC 9(18) COMP LENGTH = '
                   FUNCTION BYTE-LENGTH(VI-Pic-9-18).
           DISPLAY ' '.
           DISPLAY 'Effect of binary truncation being on (default) or '
                   'off (-fnotrunc):'.
           DISPLAY ' '.
           DISPLAY 'PIC 9(1) COMP item with a value of 123 will display'
                   ' as ' VI-Pic-9-1.
           DISPLAY ' '.
           MOVE VI-Pic-9-1 TO VI-Pic-9-3-Disp.
           DISPLAY 'When MOVEd to a "PIC 9(3) USAGE DISPLAY" field '
                   'we get:'.
           DISPLAY VI-Pic-9-3-Disp.
           DISPLAY ' '.
           COMPUTE VI-Result = VI-Pic-9-1 + 1.
           DISPLAY 'but when we ADD 1 to that field, we get: '
                   VI-Result.
           DISPLAY '(Try compiling with and without the "-fnotrunc" '
                   'switch!)'.
           STOP RUN.
