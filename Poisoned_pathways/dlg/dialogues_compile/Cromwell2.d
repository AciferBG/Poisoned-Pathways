EXTEND_BOTTOM WSMITH01 13
IF ~PartyHasItem("MISC01") 
OR(2)
!PartyHasItem("MISC52") !PartyHasItem("MISC12")~ THEN GOTO AC#PPHideWolf
IF ~PartyHasItem("MISC12")
OR(2)
!PartyHasItem("MISC01") !PartyHasItem("MISC52")~ THEN GOTO AC#PPHideAnkheg
IF ~PartyHasItem("MISC52")
OR(2)
!PartyHasItem("MISC01")  !PartyHasItem("MISC12")~ THEN GOTO AC#PPHideWyvern
IF ~PartyHasItem("MISC01") PartyHasItem("MISC52") PartyHasItem("MISC12")~ THEN GOTO AC#PPHideA
END 

APPEND WSMITH01

IF ~~ THEN BEGIN AC#PPHideWolf
  SAY ~Eh? What’s this then? A winter wolf pelt, cold as Auril’s breath. Fine stuff, that — though I don’t usually work with fur, mind ye. Still, if ye bring me an ankheg shell an’ a wyvern head as well, I might forge ye somethin’ worth wearin’.~
  IF ~~ THEN REPLY ~Good, then I’ll look for the other parts.~ GOTO hidearmor_bye
  IF ~~ THEN REPLY ~I’m not interested. Do I have something else?~ GOTO AC#PPHideNo
END

IF ~~ THEN BEGIN AC#PPHideAnkheg
  SAY ~Hah! An ankheg shell, tough as a stone belly. Not my usual work — can’t hammer it like good steel — but it’ll hold. Bring me a winter wolf pelt an’ a wyvern head too, an’ I’ll see if I can shape it into somethin’ fierce.~
  IF ~~ THEN REPLY ~Good, then I’ll look for the other parts.~ GOTO hidearmor_bye
  IF ~~ THEN REPLY ~I’m not interested. Do I have something else?~ GOTO AC#PPHideNo
END

IF ~~ THEN BEGIN AC#PPHideWyvern
  SAY ~That’s a wyvern head, stinkin’ like the Nine Hells. Not exactly what I’d put on me anvil, but it’ll serve. Ye’ll still be needin’ an ankheg shell an’ a winter wolf pelt, though — then I can make ye a proper hide armor.~
  IF ~~ THEN REPLY ~Good, then I’ll look for the other parts.~ GOTO hidearmor_bye
  IF ~~ THEN REPLY ~I’m not interested. Do I have something else?~ GOTO AC#PPHideNo
END

IF ~~ THEN BEGIN hidearmor_bye
  SAY ~Fine then. Come back when ye’ve got all the bloody pieces.~
  IF ~~ THEN EXIT
END

  IF ~~ THEN BEGIN AC#PPHideA
    SAY ~Hmm. What’s all this, then? Hah! A pile o’ beast bits — winter wolf pelt, ankheg shell, even a wyvern’s ugly head! Hah! Can’t say I’m one for workin’ with fur and hide — I’m a hammer man, not a tailor. But for once, I’ll make an exception. Heard tell o’ this foul sort o’ armor... aye, I can forge it for ye. Won’t come cheap, mind ye — 10,000 gold.~
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
    SAY ~Aye, let’s see what else ye’ve stuffed in that pack, eh?~
    COPY_TRANS WSMITH01 13
  END

END 

