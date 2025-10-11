EXTEND_BOTTOM WSMITH01 13
IF ~OR(2) PartyHasItem("AC#PPEL1") PartyHasItem("AC#PPEL2")~ THEN GOTO AC#PPBuckler
END 

APPEND WSMITH01

  IF ~~ THEN BEGIN AC#PPBuckler
    SAY ~Eh? What’s this? Hah! I’ve heard tell o’ such a trinket before. Looks like it fits that old elven buckler, the Leafrunner. A fine piece, that. Hand me both bits, and I’ll see it made whole again — strong as ever. Won’t come cheap, mind ye: 7500 gold. But you’ll be gettin’ a right sturdy toy for yer coin!~
    IF ~Global("AC#PPForgeBuckler","GLOBAL",0)
        PartyGoldGT(7499)
        PartyHasItem("AC#PPEL1")
        PartyHasItem("AC#PPEL2")~
    THEN REPLY ~Sounds fine. Let's do this.~
         DO ~SetGlobal("AC#PPForgeBuckler","GLOBAL",1)
             TakePartyGold(7500)
             DestroyGold(7500)~
         GOTO 56
    IF ~~THEN REPLY ~I'm not interested. Do I have something else?~ GOTO AC#PPBucklerNo
  END

  IF ~~ THEN BEGIN AC#PPBucklerNo
    SAY ~Aye, I’ll look at it again, if ye insist.~
    COPY_TRANS WSMITH01 13
  END

END 

