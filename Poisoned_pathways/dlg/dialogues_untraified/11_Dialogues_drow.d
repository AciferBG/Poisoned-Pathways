// Drow leader in Myth Unnohyr

BEGIN ~AC#PPDW1~

CHAIN IF ~True()~ THEN AC#PPDW1 hello_00
~Well now… what have we here? I had begun to think nothing roamed these streets but spiders and scorpions.~
= ~These ruins are now under the dominion of Vhaeraun’s chosen. By trespassing here, you have declared yourselves our enemies. And enemies are to be erased.~
END
IF ~~ THEN REPLY ~We will see about that!~ EXTERN AC#PPDW1 not_nice
IF ~~ THEN REPLY ~I merely need to prepare an antidote. Once that is done, I will be on my way.~ EXTERN AC#PPDW1 antidote_and_begone
IF ~~ THEN REPLY ~I did not clear this whole place of vermin just to let a pack of Drow settle in!~ EXTERN AC#PPDW1 not_nice


CHAIN AC#PPDW1 not_nice
~How charmingly uncivilized of you.~
END
IF ~~ THEN EXTERN AC#PPDW1 antidote_and_begone

CHAIN AC#PPDW1 antidote_and_begone
~You truly believe we would allow you to walk away, now that you have seen us?~
END
IF ~~ THEN EXTERN AC#PPDW1 fight
IF ~HasItemEquipedReal("WA2S1H",Player1)~ THEN EXTERN AC#PPDW1 player1_has_mythrien_amulet
IF ~OR(2)
    HasItemEquipedReal("WA2S1H",Player2)
    HasItemEquipedReal("WA2S1H",Player3)
    HasItemEquipedReal("WA2S1H",Player4)
    HasItemEquipedReal("WA2S1H",Player5)
    HasItemEquipedReal("WA2S1H",Player6)~ THEN EXTERN AC#PPDW1 npc_has_mythrien_amulet

CHAIN AC#PPDW1 player1_has_mythrien_amulet
~Oh! You bear the amulet of that vanished Mythrien. How delightful. In a moment, I shall claim *two* amulets as my own.~
END
IF ~~ THEN EXTERN AC#PPDW1 fight

CHAIN AC#PPDW1 npc_has_mythrien_amulet
~Oh! One among your rabble carries the amulet of that vanished Mythrien. How fitting. Soon I will possess *two* such relics.~
END
IF ~~ THEN EXTERN AC#PPDW1 fight

CHAIN AC#PPDW1 fight
~Enough talk. Slaughter them! Let us educate this <PRO_RACE> in the cost of defying the Masked Lord’s faithful!~
DO ~SetGlobal("AC#PPDrowFight","GLOBAL",2)~
EXIT

