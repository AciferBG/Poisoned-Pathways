// Hezrou in Area ACPP71

BEGIN ~AC#PPHEZ~

CHAIN IF ~True()~ THEN AC#PPHEZ hello_00
@5300
DO ~SetGlobal("Slime","ACPP71",1)
Enemy()~ EXIT


BEGIN ~AC#PPOR2~

//1st

CHAIN IF ~Global("AC#PPTowerGuardian","GLOBAL",0)~ THEN AC#PPOR2 TG.01.00
@5301
==AC#PPOR2 @5302
DO ~SetGlobal("AC#PPTowerGuardian","GLOBAL",1) Enemy()~ EXIT

//2nd

CHAIN IF ~Global("AC#PPTowerGuardian","GLOBAL",2)~ THEN AC#PPOR2 TG.02.00
@5303
==AC#PPOR2 @5304 
DO ~ClearAllActions()
SetGlobal("AC#PPTowerGuardian","GLOBAL",3) 
StartCutSceneMode() 
StartCutScene("AC#PPCT5")~ EXIT

//3rd

CHAIN IF ~Global("AC#PPTowerGuardian","GLOBAL",4)~ THEN AC#PPOR2 TG.03.00
@5305
DO ~DestroyItem("MINHP1") SetGlobal("AC#PPTowerGuardian","GLOBAL",5) Enemy()~ EXIT


//////////////////////////////////
// Dialogue in area acpp72

BEGIN ~AC#PPTA2~

CHAIN IF ~Global("FinalBossBreak","ACPP72",1)~ THEN AC#PPTA2 hello_break
@5306
DO ~DestroyItem("minhp1")
ApplySpell(Myself,RESTORE_FULL_HEALTH)
SetGlobal("FinalBossBreak","ACPP72",2)
SetGlobal("PPFinalBoss2ND","ACPP72",1)~
EXIT


CHAIN IF ~True()~ THEN AC#PPTA2 hello_00
@5307
END
IF~~THEN REPLY @5308 EXTERN AC#PPTA2 hello_01
IF~~THEN REPLY @5309 EXTERN AC#PPTA2 hello_01
IF~~THEN REPLY @5310 EXTERN AC#PPTA2 hello_01
IF~~THEN REPLY @5311 EXTERN AC#PPTA2 hello_01
IF~~THEN REPLY @5312 EXTERN AC#PPTA2 hello_01

CHAIN AC#PPTA2 hello_01
@5313
==AC#PPTA2 @5314
END
IF~~THEN REPLY @5315 EXTERN AC#PPTA2 hello_02
IF~~THEN REPLY @5316 EXTERN AC#PPTA2 hello_02
IF~~THEN REPLY @5317 EXTERN AC#PPTA2 hello_02
IF~~THEN REPLY @5318 EXTERN AC#PPTA2 hello_03
IF~~THEN REPLY @5319 EXTERN AC#PPTA2 hello_03

CHAIN AC#PPTA2 hello_02
@5320
EXTERN AC#PPTA2 hello_04

CHAIN AC#PPTA2 hello_03
@5321
EXTERN AC#PPTA2 hello_04

CHAIN AC#PPTA2 hello_04
@5322
==AC#PPTA2 @5323
DO ~AddJournalEntry(@12007,QUEST)
SetGlobal("AC#PPFinalBossPrepare","GLOBAL",2)~ EXIT
