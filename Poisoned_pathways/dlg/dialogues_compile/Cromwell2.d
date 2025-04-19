EXTEND_BOTTOM WSMITH01 13
IF ~PartyHasItem("MISC01") PartyHasItem("MISC52") PartyHasItem("MISC12")~ THEN GOTO AC#PPHideA
END 

APPEND WSMITH01

  IF ~~ THEN BEGIN AC#PPHideA
    SAY ~Hmm, this be a bunch of animals parts. A winter wolf pelt? An ankheg Shell? And even a wyvern head! Haha! Well, I heard 'about this... hide armor. A nasty thing. I can try an' make one for you. The cost's going to be 10,000 gp.~
    IF ~Global("AC#PPForgeHide","GLOBAL",0)
        PartyGoldGT(9999)
        PartyHasItem("MISC01")
        PartyHasItem("MISC52")
        PartyHasItem("MISC12")~
    THEN REPLY ~Sounds fine. Let's do this.~
         DO ~SetGlobal("AC#PPForgeHide","GLOBAL",1)
             TakePartyGold(10000)
             DestroyGold(10000)~
         GOTO 56
    IF ~~THEN REPLY ~I'm not interested. Do I have something else?~ GOTO AC#PPHideNo
  END

  IF ~~ THEN BEGIN AC#PPHideNo
    SAY ~Mhm. Let's see if you have anythin' else in here, then.~
    COPY_TRANS WSMITH01 13
  END

END 

