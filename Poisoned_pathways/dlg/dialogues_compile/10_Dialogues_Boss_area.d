BEGIN ~AC#PPOR2~

//1st

CHAIN IF ~Global("AC#PPTowerGuardian","GLOBAL",0)~ THEN AC#PPOR2 TG.01.00
~Ssso, you dare draw near? Foolissshh creature... You would trespassss upon the massster’s tower?! None ssshall disssturb him! The path isss sssealed, cloaked in vaporsss... only the massster, hisss choosssen beasts, and Wadal Hrun may passss.~
==AC#PPOR2 ~You ssshould consssider yourssself fortunate... Wadal sssaw you before fetching hisss venom-tipped arrowsss. Yet even unarmed, Wadal can end you. Sssso easily...~
DO ~SetGlobal("AC#PPTowerGuardian","GLOBAL",1) Enemy()~ EXIT

//2nd

CHAIN IF ~Global("AC#PPTowerGuardian","GLOBAL",2)~ THEN AC#PPOR2 TG.02.00
~Wretched little <PRO_RACE>... Ssscuttling vermin!~
==AC#PPOR2 ~If Wadal cannot ssstrike you down, then Wadal ssshall vanisssh into the fog... and you ssshall never enter the tower! Hsss... Wadal isss a massster of ssshadowsss!~ 
DO ~ClearAllActions()
SetGlobal("AC#PPTowerGuardian","GLOBAL",3) 
TriggerActivation("Portral",TRUE) 
AmbientActivate("PORTALBAM",TRUE)
StartCutSceneMode() 
StartCutScene("AC#PPCT5")~ EXIT

//3rd

CHAIN IF ~Global("AC#PPTowerGuardian","GLOBAL",4)~ THEN AC#PPOR2 TG.03.00
~You return...? Impudent ssstain. Wadal hasss healed — and now, you ssshall feel the wrath of hisss allies... the myconid brood risesss with him!~
DO ~DestroyItem("MINHP1") SetGlobal("AC#PPTowerGuardian","GLOBAL",5) Enemy()~ EXIT


//////////////////////////////////
// Dialogue in area acpp72

BEGIN ~AC#PPTA2~

CHAIN IF ~Global("AC#PPFinalBossPrepare","GLOBAL",1)~ THEN AC#PPTA2 hello_00
~Who would have thought that you would walk right into a viper’s nest! Haha! I thought once you realized this viper could strike just as hard as it hisses, you’d know better than to stay. But no, you had to keep pushing, even if that meant wading through dangerous elven ruins and chilling mud.~
END
IF~~THEN REPLY ~Actually, I love ruins, and I don't mind little mud.~ EXTERN AC#PPTA2 hello_01
IF~~THEN REPLY ~There are times when someone has to do something. I just couldn't ignore the fact there is a lunatic brewing powerful poison in some rotting hideout.~ EXTERN AC#PPTA2 hello_01

CHAIN AC#PPTA2 hello_01
~Your insolence is somewhat impressive, that I must admit. But Talona, Mother of all Plagues, is watching over me. How else would I find this place? How else would I manage to run this operation? I know she's with me and I know she'll be happy to see me kill you.~
==AC#PPTA2 ~And then, I will gladly sell my poison to other people. I believe you've already seen how effective it can be. How powerful. Almost as powerful as The Plague-crone's kiss.~
END
IF~~THEN REPLY ~Do you really think you can win? I am stronger than you think!~ EXTERN AC#PPTA2 hello_02
IF~~THEN REPLY ~Give up and perhaps I'll let you live.~ EXTERN AC#PPTA2 hello_03

CHAIN AC#PPTA2 hello_02
~Hahaha! You really think you're going to scare me?~
EXTERN AC#PPTA2 hello_04

CHAIN AC#PPTA2 hello_03
~Hahaha! That's a good one, truly!~
EXTERN AC#PPTA2 hello_04

CHAIN AC#PPTA2 hello_04
~Even if you succeed, several batches of the poison are already being distributed throughout Amn. And who’s to say some of those vials won’t find their way beyond the borders of the Lands of Intrigue?~
==AC#PPTA2 ~I managed to make this happen. I managed to merge light and pox! I tested my wonderful creation on pathetic little creatures! And with all that knowledge, I am going to turn Myth Unnohyr into my lady's toxic domain!~
==AC#PPTA2 ~Now, let's see if you can only bark, dog, or can you truly fight.~
DO ~SetGlobal("AC#PPFinalBossPrepare","GLOBAL",2) Enemy()~ EXIT
