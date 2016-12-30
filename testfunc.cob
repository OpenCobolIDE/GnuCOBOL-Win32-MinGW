       IDENTIFICATION DIVISION.
       PROGRAM-ID.             TESTFUNC. 
      *AUTHOR.                 ARNOLD J. TREMBLEY.
      *DATE-WRITTEN.           01/20/2014.           

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  800-WHEN-COMPILED.
           05  800-COMPILED-DATE-YYYY      PIC X(04)   VALUE SPACES.
           05  800-COMPILED-DATE-MM        PIC X(02)   VALUE SPACES.
           05  800-COMPILED-DATE-DD        PIC X(02)   VALUE SPACES.
           05  800-COMPILED-TIME-HH        PIC X(02)   VALUE SPACES.
           05  800-COMPILED-TIME-MM        PIC X(02)   VALUE SPACES.
           05  800-COMPILED-TIME-SS        PIC X(02)   VALUE SPACES.
           05  FILLER                      PIC X(07)   VALUE SPACES.
       01  800-CURRENT-DATE.
           05  800-CURRENT-DATE-YYYY       PIC X(04)   VALUE SPACES.
           05  800-CURRENT-DATE-MM         PIC X(02)   VALUE SPACES.
           05  800-CURRENT-DATE-DD         PIC X(02)   VALUE SPACES.
           05  800-CURRENT-TIME-HH         PIC X(02)   VALUE SPACES.
           05  800-CURRENT-TIME-MM         PIC X(02)   VALUE SPACES.
           05  800-CURRENT-TIME-SS         PIC X(02)   VALUE SPACES.
           05  FILLER                      PIC X(07)   VALUE SPACES.

       PROCEDURE DIVISION.
       MAINLINE.                       
           DISPLAY 'TESTFUNC Start - GnuCOBOL 2.0.0 06NOV2016 RC-2' 
           MOVE FUNCTION WHEN-COMPILED TO 800-WHEN-COMPILED
           MOVE FUNCTION CURRENT-DATE  TO 800-CURRENT-DATE 
           DISPLAY 'TESTFUNC Compiled = ' 
               800-compiled-date-yyyy '/' 
               800-compiled-date-mm   '/' 
               800-compiled-date-dd   space 
               800-compiled-time-hh   ':'   
               800-compiled-time-mm   ':'   
               800-compiled-time-ss         
           DISPLAY 'TESTFUNC Executed = ' 
               800-current-date-yyyy '/' 
               800-current-date-mm   '/' 
               800-current-date-dd   space 
               800-current-time-hh   ':'   
               800-current-time-mm   ':'   
               800-current-time-ss         
           DISPLAY 'TESTFUNC Successfully Completed'
           STOP RUN.
