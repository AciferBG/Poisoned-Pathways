// Drow leader in Myth Unnohyr

BEGIN ~AC#PPDW1~

CHAIN IF ~True()~ THEN AC#PPDW1 hello_00
@5400
= @5401
END
IF ~~ THEN REPLY @5402 EXTERN AC#PPDW1 not_nice
IF ~~ THEN REPLY @5403 EXTERN AC#PPDW1 antidote_and_begone
IF ~~ THEN REPLY @5404 EXTERN AC#PPDW1 not_nice


CHAIN AC#PPDW1 not_nice
@5405
END
IF ~~ THEN EXTERN AC#PPDW1 antidote_and_begone

CHAIN AC#PPDW1 antidote_and_begone
@5406
END
IF ~~ THEN EXTERN AC#PPDW1 fight
IF ~PartyHasItem("AC#PPCO3")~ THEN EXTERN AC#PPDW1 npc_has_mythrien_amulet

CHAIN AC#PPDW1 npc_has_mythrien_amulet
@5407
END
IF ~~ THEN EXTERN AC#PPDW1 fight

CHAIN AC#PPDW1 fight
@5408
DO ~SetGlobal("AC#PPDrowFight","GLOBAL",2)
Shout(151)
Enemy()~
EXIT

