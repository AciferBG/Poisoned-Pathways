// Priest of Oghma

APPEND DOGHMA

IF ~~ THEN BEGIN need_book
   SAY @4800
   =
   @4801
   IF ~~ THEN DO ~SetGlobal("AC#PP_Oghma","GLOBAL",10)
   GiveItemCreate("AC#PPBK1",Player1,1,0,0)~ EXIT
END
END

EXTEND_BOTTOM DOGHMA 0
IF ~Global("AC#PP_Oghma","GLOBAL",1)~ THEN REPLY @4802 GOTO need_book
END


