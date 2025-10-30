// Hezrou in Area ACPP71

BEGIN ~AC#PPHEZ~

CHAIN IF ~True()~ THEN AC#PPHEZ hello_00
~You mewling mortals dare to enter the chamber of the master? You will fail miserably! This is the heart of dead magic in this cursed place. No spell you so dearly rely upon will work here! But unlike you pitiful worms, I still have my stench with which I will destroy you!~ [AC#HEZRA]
DO ~Enemy()~ EXIT


BEGIN ~AC#PPOR2~

//1st

CHAIN IF ~Global("AC#PPTowerGuardian","GLOBAL",0)~ THEN AC#PPOR2 TG.01.00
~Ssso, you dare draw near? Foolissshh creature... You would trespassss upon the massster’s tower?! None ssshall disssturb him! The path isss sssealed, cloaked in vaporsss... only the massster, hisss choosssen beasts, and Wadal Hrun may passss.~
==AC#PPOR2 ~You ssshould consssider yourssself fortunate... Wadal sssaw you before he could fetch hisss venom-tipped arrowsss... the onesss laced with incurable poissson. Yet even without them, Wadal can end you sssso easssily!~
DO ~SetGlobal("AC#PPTowerGuardian","GLOBAL",1) Enemy()~ EXIT

//2nd

CHAIN IF ~Global("AC#PPTowerGuardian","GLOBAL",2)~ THEN AC#PPOR2 TG.02.00
~Wretched little <PRO_RACE>... Ssscuttling vermin!~
==AC#PPOR2 ~If Wadal cannot ssstrike you down, then Wadal ssshall vanisssh into the fog... and you ssshall never enter the tower! Hsss... Wadal isss a massster of ssshadowsss!~ 
DO ~ClearAllActions()
SetGlobal("AC#PPTowerGuardian","GLOBAL",3) 
StartCutSceneMode() 
StartCutScene("AC#PPCT5")~ EXIT

//3rd

CHAIN IF ~Global("AC#PPTowerGuardian","GLOBAL",4)~ THEN AC#PPOR2 TG.03.00
~You return...? Impudent ssstain. Wadal hasss healed — and now, you ssshall feel the wrath of hisss allies... the myconid brood risesss with him!~
DO ~DestroyItem("MINHP1") SetGlobal("AC#PPTowerGuardian","GLOBAL",5) Enemy()~ EXIT


//////////////////////////////////
// Dialogue in area acpp72

BEGIN ~AC#PPTA2~

CHAIN IF ~Global("FinalBossBreak","ACPP72",1)~ THEN AC#PPTA2 hello_break
~You cannot defeat me! I have endured this far! I have merged light and pox! My power is far from spent; my life force awakens anew!~
DO ~DestroyItem("minhp1")
ApplySpell(Myself,RESTORE_FULL_HEALTH)
SetGlobal("FinalBossBreak","ACPP72",2)
SetGlobal("PPFinalBoss2ND","ACPP72",1)~
EXIT


CHAIN IF ~True()~ THEN AC#PPTA2 hello_00
~Who would have thought that you would walk right into a viper’s nest! Haha! I thought once you realized this viper could strike just as hard as it hisses, you’d know better than to stay. But no, you had to keep pushing, even if that meant wading through dangerous elven ruins and chilling mud.~
END
IF~~THEN REPLY ~Actually, I love ruins, and I don't mind little mud.~ EXTERN AC#PPTA2 hello_01
IF~~THEN REPLY ~If standing for the innocent means walking into vipers’ nests, then so be it.~ EXTERN AC#PPTA2 hello_01
IF~~THEN REPLY ~Danger and chill I can handle. It’s your smugness that’s truly unbearable.~ EXTERN AC#PPTA2 hello_01
IF~~THEN REPLY ~You talk like rot—loud, foul, and hollow. Let’s see if you spread like it too.~ EXTERN AC#PPTA2 hello_01
IF~~THEN REPLY ~There are times when someone has to do something. I just couldn't ignore the fact there is a lunatic brewing powerful poison in some rotting hideout.~ EXTERN AC#PPTA2 hello_01

CHAIN AC#PPTA2 hello_01
~Your insolence is somewhat impressive, that I must admit. But Talona, Mother of all Plagues, is watching over me. She led me here, whispered how to let the sickness bloom. And now she watches, eager to see you perish by her servant’s hand.~
==AC#PPTA2 ~Afterwards, I’ll gladly share my poison with others. You’ve already witnessed its grace—how swift, how certain. Almost as potent as the Plague-Crone’s kiss herself.~
END
IF~~THEN REPLY ~Do you really think you can win? I am stronger than you think!~ EXTERN AC#PPTA2 hello_02
IF~~THEN REPLY ~Your faith is as rotten as your breath!~ EXTERN AC#PPTA2 hello_02
IF~~THEN REPLY ~You’ve already taken too many lives. That ends now.~ EXTERN AC#PPTA2 hello_02
IF~~THEN REPLY ~You and your bubbling pot are no match for us. Surrender now!~ EXTERN AC#PPTA2 hello_03
IF~~THEN REPLY ~Interesting. Maybe I’ll take your recipe... once I’ve peeled it off your corpse.~ EXTERN AC#PPTA2 hello_03

CHAIN AC#PPTA2 hello_02
~Hahaha! You really think you're going to scare me?~
EXTERN AC#PPTA2 hello_04

CHAIN AC#PPTA2 hello_03
~Hahaha! That's a good one, truly!~
EXTERN AC#PPTA2 hello_04

CHAIN AC#PPTA2 hello_04
~Even if you succeed, several batches of the poison are already being distributed throughout Amn. And who’s to say some of those vials won’t find their way beyond the borders of the Lands of Intrigue?~
//==AC#PPTA2 ~I managed to make this happen. I managed to merge light and pox! I tested my wonderful creation on pathetic little creatures! And with all that knowledge, I am going to turn Myth Unnohyr into my lady's toxic domain!~
==AC#PPTA2 ~With all that knowledge, I am going to turn Myth Unnohyr into my lady's toxic domain! You’ve stepped into the temple of decay—let’s see if you bloom like a blight or wither like a leaf!~
DO ~AddJournalEntry(@12007,QUEST)
SetGlobal("AC#PPFinalBossPrepare","GLOBAL",2)~ EXIT
