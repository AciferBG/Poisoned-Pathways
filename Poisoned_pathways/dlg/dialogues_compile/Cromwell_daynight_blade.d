EXTEND_BOTTOM WSMITH01 13
IF ~OR(2) 
PartyHasItem("AC#PPDN1") 
PartyHasItem("AC#PPDN2")~ THEN GOTO AC#PPDayNightBlade
END

APPEND WSMITH01

  IF ~~ THEN BEGIN AC#PPDayNightBlade
    SAY @5210
    = @5211
    IF ~Global("AC#PPForgeDayNight","GLOBAL",0)
        PartyGoldGT(9999)
        PartyHasItem("AC#PPDN1")
        PartyHasItem("AC#PPDN2")
		PartyHasItem("MISC27") 
		PartyHasItem("MISC18")~
    THEN REPLY @5212 
         DO ~SetGlobal("AC#PPForgeDayNight","GLOBAL",1)
             TakePartyGold(10000)
             DestroyGold(10000)~
         GOTO 56
    IF ~~ THEN REPLY @5213 GOTO AC#PPDayNightBladeNo
  END

  IF ~~ THEN BEGIN AC#PPDayNightBladeNo
    SAY @5214
    COPY_TRANS WSMITH01 13
  END
END
