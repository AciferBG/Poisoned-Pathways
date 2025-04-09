// Priest of Oghma

APPEND DOGHMA

IF ~~ THEN BEGIN need_book
   SAY ~Ah, yes—your arrival was foretold by the wings of knowledge itself. A dove bearing the seal of Eldath arrived not long ago.~
   =
   ~The tome has already been retrieved from our archives. Here it is. And should you see Fallskeeper Berendim again, extend to him both my gratitude and respect. The tinctures he provided for my ailing kin acted with remarkable precision. May Oghma’s light illuminate your path, and may the written word never fail you.~
   IF ~~ THEN DO ~SetGlobal("AC#PP_Oghma","GLOBAL",10)
   GiveItemCreate("AC#PPBK1",Player1,1,0,0)~ EXIT
END
END

EXTEND_BOTTOM DOGHMA 0
IF ~Global("AC#PP_Oghma","GLOBAL",1)~ THEN REPLY ~I come at the request of Fallskeeper Alatoasz Berendim. He seeks a tome concerning the ancient elven cities of Keltormir.~ GOTO need_book
END


