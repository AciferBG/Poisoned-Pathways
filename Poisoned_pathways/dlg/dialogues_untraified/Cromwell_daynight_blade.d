EXTEND_BOTTOM WSMITH01 13
IF ~OR(2) 
PartyHasItem("AC#PPDN1") 
PartyHasItem("AC#PPDN2")~ THEN GOTO AC#PPDayNightBlade
END

APPEND WSMITH01

  IF ~~ THEN BEGIN AC#PPDayNightBlade
    SAY ~Eh? What’s this, then? Hah! Now there’s a sight I never thought I’d see. These pieces—aye, I’d wager they’re fragments of the old elven sword they called "The Blade of Day and Night". Haven’t seen craft like this since the Time o’ Songs.~
    = ~Hand me both parts, together with a Sunstone gem and a Moonstone gem, and I’ll see if I can set 'em right again. Won’t come cheap, mind ye: 10000 gold for the forge, the tempering oils, and a fair bit o’ dwarven sweat. But ye’ll be gettin’ a blade worthy o’ the old days, sure enough.~
    IF ~Global("AC#PPForgeDayNight","GLOBAL",0)
        PartyGoldGT(9999)
        PartyHasItem("AC#PPDN1")
        PartyHasItem("AC#PPDN2")
		PartyHasItem("MISC27") 
		PartyHasItem("MISC18")~
    THEN REPLY ~Here. Take the fragments — and the gold.~ 
         DO ~SetGlobal("AC#PPForgeDayNight","GLOBAL",1)
             TakePartyGold(10000)
             DestroyGold(10000)~
         GOTO 56
    IF ~~ THEN REPLY ~Not this time. Do I have something else you could work on?~ GOTO AC#PPDayNightBladeNo
  END

  IF ~~ THEN BEGIN AC#PPDayNightBladeNo
    SAY ~Aye, then. I’ll be here, same as always, if ye change yer mind.~
    COPY_TRANS WSMITH01 13
  END
END
