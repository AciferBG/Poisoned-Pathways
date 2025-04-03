EXTEND_BOTTOM WSMITH01 13
IF ~OR(2) PartyHasItem("AC#PPEL1") PartyHasItem("AC#PPEL2")~ THEN GOTO AC#PPBuckler
END 

APPEND WSMITH01

  IF ~~ THEN BEGIN AC#PPBuckler
    SAY ~What be this, hmm? Ah! I may have heard about this little thing. It looks like a part of this old elven buckler, The Leafrunner. Give me both pieces, and I should be able to make it work well again. The cost: 7500 gp. It ain't cheap, but we're talking about providing you with nice and strong toy here.~
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
    SAY ~Hmm, I can have another look.~
    COPY_TRANS WSMITH01 13
  END

END 

