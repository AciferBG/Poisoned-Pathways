BEGIN ~AC#PPOR2~

//1st

CHAIN IF ~Global("AC#PPTowerGuardian","GLOBAL",0)~ THEN AC#PPOR2 TG.01.00
~Me can see you! Ha! You think you can disturb master?! No one can disturb the master! The tower is locked! Puff! See the fumes?! No one can pass the, only master, his pets, and Wadal Hrun!~
==AC#PPOR2 ~You be lucky Wadal saw you before he could pick a new batch of special arrows, but even without them Wada can kill you! Hahaha!~
DO ~SetGlobal("AC#PPTowerGuardian","GLOBAL",1) Enemy()~ EXIT

//2nd

CHAIN IF ~Global("AC#PPTowerGuardian","GLOBAL",2)~ THEN AC#PPOR2 TG.02.00
~Stupid <PRO_RACE>!~
==AC#PPOR2 ~If Wadal cannot kill <PRO_RACE>, then WADAL will hide and <PRO_RACE> will never enter the tower! And Wadal is very good at hiding, hahaha!~
DO ~SetGlobal("AC#PPTowerGuardian","GLOBAL",3) TriggerActivation("Portral",TRUE) AmbientActivate("PORTALBAM",TRUE) StartCutScene("AC#PPCT5")~ EXIT

//3rd

CHAIN IF ~Global("AC#PPTowerGuardian","GLOBAL",4)~ THEN AC#PPOR2 TG.03.00
~You again?! Agh, Wadal healed, Wadal will continue fighting with you! And mushroom-people are going to help Wadal!~
DO ~DestroyItem("MINHP1") SetGlobal("AC#PPTowerGuardian","GLOBAL",5) Enemy()~ EXIT

//////////////////////////////////
// Dialogue in area acpp72

BEGIN ~AC#PPTA2~

CHAIN IF ~Global("AC#PPFinalBossPrepare","GLOBAL",1)~ THEN AC#PPTA2 hello_00
~Who would have thought that you would walk right into lion's den! Haha! I thought that once you realized that this lion's mouth is just as venomous as that of a viper, you would resign. But no, you had to keep pushing, even if that meant wading through dangerous elven ruins and chilling mud.~
END
IF~~THEN REPLY ~Actually, I love ruins, and I don't mind little mud.~ EXTERN AC#PPTA2 hello_01
IF~~THEN REPLY ~There are times when someone has to do something. I just couldn't ignore the fact there is a lunatic brewing powerful poison in some rotting hideout.~ EXTERN AC#PPTA2 hello_01

CHAIN AC#PPTA2 hello_01
~You insolence is somewhat impressive, that I must admit. But Talona, Mother of all Plagues, is watching over me. How else would I find this place? How else would I manage to run this operation, hmm? I know she's with me and I know she'll be happy to see me kill you.~
==AC#PPTA2 ~And then, I will gladly sell my poison to other people. I believe you've already seen how effective it can be. How powerful. Almost as powerful as The Plague-crone's kiss.~
END
IF~~THEN REPLY ~Do you really think you can win? I am stronger than you think~ EXTERN AC#PPTA2 hello_02
IF~~THEN REPLY ~Give up and perhaps I'll let you live.~ EXTERN AC#PPTA2 hello_03

CHAIN AC#PPTA2 hello_02
~Hahaha! You really think you're going to scare me?~
EXTERN AC#PPTA2 hello_04

CHAIN AC#PPTA2 hello_03
~Hahaha! That's a good one, truly!~
EXTERN AC#PPTA2 hello_04

CHAIN AC#PPTA2 hello_04
~Even if you succeed, there are already several batches of the poison being distributed in Amn. And who knows, perhaps maybe some of these bottles will travel even pass the boarders of Lands of Intrigue.~
==AC#PPTA2 ~I managed to make this happen. I managed to merge light and pox! I tested my wonderful creation on pathetic little creatures! And with all that knowledge, I am going to turn Myth Unnohyr into my lady's toxic domain!~
==AC#PPTA2 ~Now, let's see if you can only bark, dog, or can you truly fight.~
DO ~SetGlobal("AC#PPFinalBossPrepare","GLOBAL",2) Enemy()~ EXIT
