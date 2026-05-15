
// Dialogue Eldathyn priest #3; guard in Duskwood Dell

BEGIN ~AC#PPEL3~

CHAIN IF ~True()~ THEN AC#PPEL3 hello_01
@3400 
= @3401 
END
IF~~THEN REPLY @3402 EXTERN AC#PPEL3 need_go_to_highpriest
//IF~~THEN REPLY ~Long story short: One of your people has died, and he sent us here before his end.~ EXTERN AC#PPEL3 need_go_to_highpriest
IF~~THEN REPLY @3403 EXTERN AC#PPEL3 need_go_to_highpriest
IF~~THEN REPLY @3404 EXTERN AC#PPEL3 need_go_to_highpriest2
IF~~THEN REPLY @3405 EXTERN AC#PPEL3 seek_highpriest_wrong_name
IF~~THEN REPLY @3406 EXTERN AC#PPEL3 seek_highpriest_right__name

CHAIN IF ~~ THEN AC#PPEL3 need_go_to_highpriest
@3407 
=
@3408
== AC#PPEL3 @3409
DO ~EscapeArea()~ EXIT

CHAIN IF ~~ THEN AC#PPEL3 need_go_to_highpriest2
@3410
DO ~ReputationInc(-1) EscapeArea()~ EXIT

CHAIN IF ~~ THEN AC#PPEL3 seek_highpriest_wrong_name
@3411
DO ~EscapeArea()~ EXIT

CHAIN IF ~~ THEN AC#PPEL3 seek_highpriest_right__name
@3412
DO ~EscapeArea()~ EXIT

//////////////////////////////////////////////////////////////
// First talk with Exalted Fallskeeper Alatoasz Berendim

CHAIN IF ~Global("AC#PPSpellCheckPoison","GLOBAL",0)~ THEN AC#PPEL4 hello_01
@3413 
END
IF~~THEN REPLY @3414 EXTERN AC#PPEL4 about_arrow
IF~~THEN REPLY @3415 EXTERN AC#PPEL4 about_arrow
IF~~THEN REPLY @3416 EXTERN AC#PPEL4 about_arrow
IF~~THEN REPLY @3417 EXTERN AC#PPEL4 about_arrow
IF~Global("AC#PPWrongPriestName","GLOBAL",1)~THEN REPLY @3418 DO ~SetGlobal("AC#PPWrongPriestName","GLOBAL",2)~ EXTERN AC#PPEL4 wrong_name_fun

	CHAIN IF ~~ THEN AC#PPEL4 wrong_name_fun
	@3419
	END
	IF~~THEN REPLY @3414 EXTERN AC#PPEL4 about_arrow
	IF~~THEN REPLY @3415 EXTERN AC#PPEL4 about_arrow
	IF~~THEN REPLY @3416 EXTERN AC#PPEL4 about_arrow
	IF~~THEN REPLY @3417 EXTERN AC#PPEL4 about_arrow


CHAIN IF ~~ THEN AC#PPEL4 about_arrow
@3420
= @3421
END
IF~~THEN DO ~TakePartyItem("AC#PPARP")~ EXTERN AC#PPEL4 check_arrow

CHAIN IF ~~ THEN AC#PPEL4 check_arrow
@3422
END
IF~~THEN REPLY @3423 EXTERN AC#PPEL4 about_poison
IF~~THEN REPLY @3424 EXTERN AC#PPEL4 about_poison
IF~~THEN REPLY @3425 EXTERN AC#PPEL4 about_poison2

CHAIN IF ~~ THEN AC#PPEL4 about_poison
@3426
=
@3427
END
IF~~THEN EXTERN AC#PPEL4 spell_poison

CHAIN IF ~~ THEN AC#PPEL4 about_poison2
@3428
END
IF~~THEN EXTERN AC#PPEL4 spell_poison

CHAIN IF ~~ THEN AC#PPEL4 spell_poison
@3429
DO ~SetGlobal("AC#PPSpellCheckPoison","GLOBAL",1)
ClearAllActions()
StartCutSceneMode()
StartCutScene("AC#PPCT4")
~ EXIT

//Second talk with Exalted Fallskeeper Alatoasz Berendim

CHAIN IF ~Global("AC#PPSpellCheckPoison","GLOBAL",1)~ THEN AC#PPEL4 hello_02
@3430
END
IF~~THEN EXTERN AC#PPEL4 poison_investigate

CHAIN IF ~~ THEN AC#PPEL4 poison_investigate
@3431
END
IF~~THEN EXTERN AC#PPEL4 poison_investigate_02

CHAIN IF ~~ THEN AC#PPEL4 poison_investigate_02
@3432
END
IF~~THEN REPLY @3433 EXTERN AC#PPEL4 poison_investigate_03
IF~~THEN REPLY @3434 EXTERN AC#PPEL4 poison_investigate_03
IF~~THEN REPLY @3435 EXTERN AC#PPEL4 poison_investigate_tasting
IF~~THEN REPLY @3436 EXTERN AC#PPEL4 poison_investigate_03

CHAIN IF ~~ THEN AC#PPEL4 poison_investigate_03
@3437
END
IF~~THEN EXTERN AC#PPEL4 poison_investigate_tasting

CHAIN IF ~~ THEN AC#PPEL4 poison_investigate_tasting
@3438
END
IF~~THEN DO ~ApplySpellRES("AC#PPPN",Myself)~ EXTERN AC#PPEL4 poison_investigate_04

CHAIN IF ~~ THEN AC#PPEL4 poison_investigate_04
@3439
END
IF~~THEN EXTERN AC#PPEL4 poison_investigate_05

CHAIN IF ~~ THEN AC#PPEL4 poison_investigate_05
@3440 
=
@3441 
END 
IF~~THEN REPLY @3442 EXTERN AC#PPEL4 no_matter
IF~~THEN REPLY @3443 EXTERN AC#PPEL4 no_matter
IF~~THEN REPLY @3444 EXTERN AC#PPEL4 no_matter


CHAIN IF ~~ THEN AC#PPEL4 no_matter
@3445
END
IF~~THEN EXTERN AC#PPEL4 poison_investigate_06

CHAIN IF ~~ THEN AC#PPEL4 poison_investigate_06
@3446
END
IF~~THEN REPLY @3447 EXTERN AC#PPEL4 about_keltormir
IF~~THEN REPLY @3448 EXTERN AC#PPEL4 about_keltormir
IF~~THEN REPLY @3449 EXTERN AC#PPEL4 about_keltormir

CHAIN IF ~~ THEN AC#PPEL4 about_keltormir
@3450
== IMOEN2J IF ~InParty("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN @3451
END
IF~Race(Player1,ELF)~THEN REPLY @3452 EXTERN AC#PPEL4 about_keltormir_02
IF~CheckStatGT(Player1,49,LORE)~THEN REPLY @3453 EXTERN AC#PPEL4 about_keltormir_02
IF~~THEN REPLY @3454 EXTERN AC#PPEL4 about_keltormir_02
IF~~THEN REPLY @3455 EXTERN AC#PPEL4 about_keltormir_02

CHAIN IF ~~ THEN AC#PPEL4 about_keltormir_02
@3456
=
@3457
END
IF~~THEN REPLY @3458 EXTERN AC#PPEL4 to_oghma
IF~~THEN REPLY @3459 EXTERN AC#PPEL4 to_oghma
IF~~THEN REPLY @3460 EXTERN AC#PPEL4 to_oghma
IF~~THEN REPLY @3461 EXTERN AC#PPEL4 to_oghma
IF~GlobalGT("ElvenCityTree","GLOBAL",0)~THEN REPLY @3462 EXTERN AC#PPEL4 suldanesselar  
IF~GlobalGT("AC#SK_MythRhynn_Visit","GLOBAL",0)~THEN REPLY @3463 EXTERN AC#PPEL4 skyfire_myth_rhynn  

CHAIN IF ~~ THEN AC#PPEL4 suldanesselar  
@3464  
END
IF~~THEN EXTERN AC#PPEL4 need_search_elven_cities  

CHAIN IF ~~ THEN AC#PPEL4 skyfire_myth_rhynn  
@3465  
END
IF~~THEN EXTERN AC#PPEL4 need_search_elven_cities  

CHAIN IF ~~ THEN AC#PPEL4 need_search_elven_cities  
@3466  
END  
IF~~THEN REPLY @3458 EXTERN AC#PPEL4 to_oghma  
IF~~THEN REPLY @3467 EXTERN AC#PPEL4 to_oghma  
IF~~THEN REPLY @3460 EXTERN AC#PPEL4 to_oghma  
IF~~THEN REPLY @3468 EXTERN AC#PPEL4 to_oghma  


CHAIN IF ~~ THEN AC#PPEL4 to_oghma
@3469
END
IF~~THEN REPLY @3470 EXTERN AC#PPEL4 to_oghma_bye
IF~PartyHasItem("AC#PPSYM")~THEN REPLY @3471 EXTERN AC#PPEL4 Merethan_emblem

CHAIN IF ~~ THEN AC#PPEL4 Merethan_emblem
@3472
END
IF~Global("AC#PPSymbolQuest","GLOBAL",2)~THEN REPLY @3473 EXTERN AC#PPEL4 emblem_montrassa
IF~~THEN REPLY @3470 EXTERN AC#PPEL4 to_oghma_bye

CHAIN IF ~~ THEN AC#PPEL4 emblem_montrassa
@3474
END
IF~~THEN DO ~SetGlobal("AC#PP_AlaAgreesSymbol","GLOBAL",1) AddJournalEntry(@13051,QUEST)~ EXTERN AC#PPEL4 to_oghma_bye

CHAIN IF ~~ THEN AC#PPEL4 to_oghma_bye
@3475
DO ~SetGlobal("AC#PPSpellCheckPoison","GLOBAL",2)
AddJournalEntry(@12005,QUEST)
SetGlobal("AC#PP_Oghma","GLOBAL",1)
EscapeAreaDestroy(2)~ EXIT

// Third talk with Exalted Fallskeeper Alatoasz Berendim
CHAIN IF ~Global("AC#PPSpellCheckPoison","GLOBAL",3) GlobalGT("AC#PP_Oghma","GLOBAL",0)~ THEN AC#PPEL4 hello_03
@3476
END
IF~PartyHasItem("AC#PPBK1")~THEN REPLY @3477 DO ~TakePartyItem("AC#PPBK1")~ EXTERN AC#PPEL4 read_book
IF~~THEN REPLY @3478 EXTERN AC#PPEL4 hello_03x
IF~PartyHasItem("AC#PPSYM") Global("AC#PP_AlaAgreesSymbol","GLOBAL",0)~THEN REPLY @3471 EXTERN AC#PPEL4 Merethan_emblem_02

CHAIN IF ~~ THEN AC#PPEL4 Merethan_emblem_02
@3479
END
IF~Global("AC#PPSymbolQuest","GLOBAL",2)~THEN REPLY @3480 EXTERN AC#PPEL4 emblem_montrassa_02
IF~~THEN REPLY @3470 EXTERN AC#PPEL4 hello_03x

CHAIN IF ~~ THEN AC#PPEL4 emblem_montrassa_02
@3481
END
IF~~THEN REPLY @3482 DO ~SetGlobal("AC#PP_AlaAgreesSymbol","GLOBAL",1) AddJournalEntry(@13051,QUEST)~ EXTERN AC#PPEL4 emblem_montrassa_bye

CHAIN AC#PPEL4 emblem_montrassa_bye
@3483
EXIT

CHAIN IF ~~ THEN AC#PPEL4 read_book
@3484
=
@3485
END
IF~~THEN REPLY @3486 EXTERN AC#PPEL4 wrong_myth_rhynn
IF~~THEN REPLY @3487 EXTERN AC#PPEL4 right_myth_unnohyr
IF~~THEN REPLY @3488 EXTERN AC#PPEL4 wrong_myth_tellaren
IF~~THEN REPLY @3489 EXTERN AC#PPEL4 right_myth_unnohyr
IF~~THEN REPLY @3490 EXTERN AC#PPEL4 right_myth_unnohyr
IF~~THEN REPLY @3491 EXTERN AC#PPEL4 right_myth_unnohyr

CHAIN IF ~~ THEN AC#PPEL4 wrong_myth_rhynn
@3492
END
IF~~THEN REPLY @3493 EXTERN AC#PPEL4 wrong_myth_tellaren
IF~~THEN REPLY @3494 EXTERN AC#PPEL4 right_myth_unnohyr

CHAIN IF ~~ THEN AC#PPEL4 wrong_myth_tellaren
@3495
END
IF~~THEN REPLY @3496 EXTERN AC#PPEL4 wrong_myth_rhynn
IF~~THEN REPLY @3497 EXTERN AC#PPEL4 right_myth_unnohyr


CHAIN IF ~~ THEN AC#PPEL4 right_myth_unnohyr
@3498
= @3499
END
IF ~~ THEN REPLY @3500 EXTERN AC#PPEL4 poison_myth_unnhoyr_03
IF ~~ THEN REPLY @3501 EXTERN AC#PPEL4 poison_myth_unnhoyr_03
IF ~~ THEN REPLY @3502 EXTERN AC#PPEL4 poison_myth_unnhoyr_03
IF ~~ THEN REPLY @3503 EXTERN AC#PPEL4 poison_myth_unnhoyr_03  

CHAIN AC#PPEL4 hello_03x
@3504
EXIT

CHAIN IF ~~ THEN AC#PPEL4 poison_myth_unnhoyr_03
@3505
== NEERAJ IF ~InParty("Neera") !StateCheck("Neera",CD_STATE_NOTVALID)~ THEN @3506
== VALYGARJ IF ~InParty("Valygar") !StateCheck("Valygar",CD_STATE_NOTVALID)~ THEN @3507
== HAERDAJ IF ~InParty("HaerDalis") !StateCheck("HaerDalis",CD_STATE_NOTVALID)~ THEN @3508
== HEXXATJ IF ~InParty("Hexxat") !StateCheck("Hexxat",CD_STATE_NOTVALID)~ THEN @3509
== AC#PPEL4 @3510
END
IF ~~ THEN REPLY @3511 EXTERN AC#PPEL4 dead_magic_areab
IF ~~ THEN REPLY @3512 EXTERN AC#PPEL4 dead_magic_areab
IF ~~ THEN REPLY @3513 EXTERN AC#PPEL4 poison_myth_unnhoyr_conflict_01
IF ~~ THEN REPLY @3514 EXTERN AC#PPEL4 poison_myth_unnhoyr_conflict_01
IF ~~ THEN REPLY @3515 EXTERN AC#PPEL4 dead_magic_areab

CHAIN AC#PPEL4 poison_myth_unnhoyr_conflict_01
@3516
END
IF ~~ THEN EXTERN AC#PPEL4 dead_magic_areab

CHAIN AC#PPEL4 dead_magic_areab
@3517
END
IF ~~ THEN REPLY @3518 EXTERN AC#PPEL4 dead_magic_area_02
IF ~~ THEN REPLY @3519 EXTERN AC#PPEL4 dead_magic_area_02
IF ~~ THEN REPLY @3520 EXTERN AC#PPEL4 dead_magic_area_02

CHAIN IF ~~ THEN AC#PPEL4 dead_magic_area_02
@3521
END
IF ~~ THEN REPLY @3522 EXTERN AC#PPEL4 malagent_what
IF ~~ THEN REPLY @3523 EXTERN AC#PPEL4 malagent_forgotten
IF ~~ THEN REPLY @3524 EXTERN AC#PPEL4 malagent_what
IF ~~ THEN REPLY @3525 EXTERN AC#PPEL4 malagent


	CHAIN IF ~~ THEN AC#PPEL4 malagent_forgotten
	@3526
	END
	IF~~THEN REPLY @3522 EXTERN AC#PPEL4 malagent_what
	IF~~THEN REPLY @3524 EXTERN AC#PPEL4 malagent_what
	IF~~THEN REPLY @3525 EXTERN AC#PPEL4 malagent

CHAIN IF ~~ THEN AC#PPEL4 malagent_what
@3527
END
IF~~THEN REPLY @3528 EXTERN AC#PPEL4 malagent
IF~~THEN REPLY @3529 EXTERN AC#PPEL4 malagent
IF~~THEN REPLY @3530 EXTERN AC#PPEL4 malagent

CHAIN IF ~~ THEN AC#PPEL4 malagent
@3531
END
IF~~THEN REPLY @3532 EXTERN AC#PPEL4 talona_yes
IF~~THEN REPLY @3533 EXTERN AC#PPEL4 talona_no

CHAIN IF ~~ THEN AC#PPEL4 talona_no
@3534
END
IF~~THEN EXTERN AC#PPEL4 talona_yes

CHAIN IF ~~ THEN AC#PPEL4 talona_yes
@3535
END
//IF~~THEN REPLY @3536 EXTERN AC#PPEL4 travel_ruin_b
//IF~~THEN REPLY @3537 EXTERN AC#PPEL4 travel_ruin_b
IF~~THEN REPLY @3538 EXTERN AC#PPEL4 travel_ruin
IF~~THEN REPLY @3539 EXTERN AC#PPEL4 travel_ruin
IF~~THEN REPLY @3540 EXTERN AC#PPEL4 travel_ruin
IF~~THEN REPLY @3541 EXTERN AC#PPEL4 travel_ruin
IF ~~ THEN REPLY @3542 GOTO allowed_to_fight_01

	CHAIN IF ~~ THEN AC#PPEL4 allowed_to_fight_01
	@3543
	== AC#PPEL4 @3544
	== AC#PPEL4 @3545
	== AC#PPEL4 @3546
	END
	  IF ~~ THEN REPLY @3547 GOTO travel_ruin_b
	  IF ~~ THEN REPLY @3548 GOTO travel_ruin_b
	  IF ~~ THEN REPLY @3549 GOTO travel_ruin_b
	  IF ~~ THEN REPLY @3550 GOTO travel_ruin_b
	  IF ~~ THEN REPLY @3551 GOTO travel_ruin_b
	  IF ~~ THEN REPLY @3552 GOTO travel_ruin_b

	CHAIN IF ~~ THEN AC#PPEL4 travel_ruin_b
	@3553 
	END 
	IF~~THEN EXTERN AC#PPEL4 travel_ruin

CHAIN IF ~~ THEN AC#PPEL4 travel_ruin
@3554
==ViconiJ IF ~InParty("viconia") !StateCheck("viconia",CD_STATE_NOTVALID)~ THEN @3555
== MinscJ IF ~InParty("minsc") !StateCheck("minsc",CD_STATE_NOTVALID)~ THEN @3556
== CERNDJ IF ~InParty("Cernd") !StateCheck("Cernd",CD_STATE_NOTVALID)~ THEN @3557
== KeldorJ IF ~InParty("keldorn") !StateCheck("keldorn",CD_STATE_NOTVALID)~ THEN @3558
== JaheiraJ IF ~InParty("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN @3559
== AerieJ IF ~InParty("aerie") !StateCheck("aerie",CD_STATE_NOTVALID)~ THEN @3560
==AC#PPEL4 @3561 
=
@3562
DO ~RevealAreaOnMap("ACPP70")
AddJournalEntry(@12006,QUEST)
SetGlobal("AC#PPSpellCheckPoison","GLOBAL",10)
SetGlobal("AC#PP_MythUnnohyr","GLOBAL",1)~ EXIT

// FINAL: Dialogue Eldathyn highpriest #4; tree house in Duskwood Dell

BEGIN ~AC#PPEL4~

CHAIN IF ~Global("AC#PP_MythUnnohyr","GLOBAL",1)~ THEN AC#PPEL4 hello_04
@3563
END
IF~Dead("AC#PPTA2")~THEN REPLY @3564 EXTERN AC#PPEL4 malagent_dead
IF~~THEN REPLY @3565 EXTERN AC#PPEL4 no_news
IF ~~ THEN REPLY @3566 GOTO allowed_to_fight
IF~PartyHasItem("AC#PPSYM") Global("AC#PP_AlaAgreesSymbol","GLOBAL",0)~THEN REPLY @3471 EXTERN AC#PPEL4 Merethan_emblem_03

CHAIN IF ~~ THEN AC#PPEL4 Merethan_emblem_03
@3479
END
IF~Global("AC#PPSymbolQuest","GLOBAL",2)~THEN REPLY @3480 EXTERN AC#PPEL4 emblem_montrassa_03
IF~~THEN REPLY @3470 EXTERN AC#PPEL4 no_news

CHAIN IF ~~ THEN AC#PPEL4 emblem_montrassa_03
@3481
END
IF~~THEN REPLY @3482 DO ~SetGlobal("AC#PP_AlaAgreesSymbol","GLOBAL",1) AddJournalEntry(@13051,QUEST)~ EXTERN AC#PPEL4 emblem_montrassa_bye_03

CHAIN AC#PPEL4 emblem_montrassa_bye_03
@3483
EXIT

	CHAIN IF ~~ THEN AC#PPEL4 allowed_to_fight
	@3567
	== AC#PPEL4 @3544
	== AC#PPEL4 @3545
	== AC#PPEL4 @3546
	END
	  IF ~~ THEN REPLY @3568 GOTO no_news
	  IF ~~ THEN REPLY @3552 GOTO no_news

CHAIN IF ~~ THEN AC#PPEL4 no_news
@3569
EXIT

CHAIN IF ~~ THEN AC#PPEL4 malagent_dead
@3570
== AC#PPEL4 @3571
DO ~GiveGoldForce(6500) AddXPObject(Player1,6200) AddXPObject(Player2,6200) AddXPObject(Player3,6200) AddXPObject(Player4,6200) AddXPObject(Player5,6200) AddXPObject(Player6,6200) AddJournalEntry(@12009,QUEST_DONE)~
== AC#PPEL4 @3572
END
IF ~~ THEN EXTERN AC#PPEL4 antidote_quest_01

CHAIN IF ~~ THEN AC#PPEL4 antidote_quest_01
@3573
END
IF ~PartyHasItem("AC#PPPUB")~ THEN REPLY @3574 EXTERN AC#PPEL4 malagent_dead_flo
IF ~PartyHasItem("AC#PPPUB")~ THEN REPLY @3575 EXTERN AC#PPEL4 malagent_dead_flo
IF ~!PartyHasItem("AC#PPPUB")~ THEN REPLY @3576 EXTERN AC#PPEL4 malagent_dead_no_flo
IF ~~ THEN REPLY @3577 EXTERN AC#PPEL4 malagent_dead_no_flo


CHAIN AC#PPEL4 malagent_dead_flo
@3578
DO ~SetGlobal("AC#PP_MythUnnohyr","GLOBAL",2) SetGlobal("AC#PP_ShowFlower","GLOBAL",1)~ EXTERN AC#PPEL4 cnt.01.01

CHAIN AC#PPEL4 malagent_dead_no_flo
@3579
DO ~SetGlobal("AC#PP_MythUnnohyr","GLOBAL",2)~ EXIT


//CONTINUATION AFTER THE MAIN PLOT:
CHAIN IF ~Global("AC#PP_MythUnnohyr","GLOBAL",2)~ THEN AC#PPEL4 cnt.01.00
@3580
==AC#PPEL4 IF ~Global("AC#PP_ShowFlower","GLOBAL",1)~ THEN @3581
==AC#PPEL4 IF ~Global("AC#PP_ShowFlower","GLOBAL",0)~ THEN @3582
==AC#PPEL4 @3583
DO ~SetGlobal("AC#PP_MythUnnohyr","GLOBAL",3)~
==AC#PPEL4 @3584
END
IF~PartyHasItem("AC#PPPUB")~THEN REPLY @3585 EXTERN AC#PPEL4 cnt.01.01
IF~!PartyHasItem("AC#PPPUB")~THEN REPLY @3586 EXTERN AC#PPEL4 cnt.01.02

CHAIN IF ~Global("AC#PP_MythUnnohyr","GLOBAL",3)~ THEN AC#PPEL4 cnt.01.0B
@3587
END
IF~PartyHasItem("AC#PPPUB")~THEN REPLY @3588 EXTERN AC#PPEL4 cnt.01.01
IF~!PartyHasItem("AC#PPPUB")~THEN REPLY @3589 EXTERN AC#PPEL4 cnt.01.02
IF~~THEN REPLY @3590 EXIT
IF~PartyHasItem("AC#PPSYM") Global("AC#PP_AlaAgreesSymbol","GLOBAL",0)~THEN REPLY @3471 EXTERN AC#PPEL4 Merethan_emblem_04

CHAIN IF ~~ THEN AC#PPEL4 Merethan_emblem_04
@3479
END
IF~Global("AC#PPSymbolQuest","GLOBAL",2)~THEN REPLY @3480 EXTERN AC#PPEL4 emblem_montrassa_04
IF~~THEN REPLY @3470 EXTERN AC#PPEL4 no_news

CHAIN IF ~~ THEN AC#PPEL4 emblem_montrassa_04
@3481
END
IF~~THEN REPLY @3482 DO ~SetGlobal("AC#PP_AlaAgreesSymbol","GLOBAL",1) AddJournalEntry(@13051,QUEST)~ EXTERN AC#PPEL4 emblem_montrassa_bye_04

CHAIN AC#PPEL4 emblem_montrassa_bye_04
@3483
EXIT

CHAIN AC#PPEL4 cnt.01.02
@3591
==AC#PPEL4 @3592
EXIT

CHAIN AC#PPEL4 cnt.01.01
@3593
== AC#PPEL4 @3594
== AC#PPEL4 @3595
END
IF ~~ THEN REPLY @3596 EXTERN AC#PPEL4 cnt.01.03
IF ~~ THEN REPLY @3597 EXTERN AC#PPEL4 cnt.01.03
IF ~~ THEN REPLY @3598 EXTERN AC#PPEL4 cnt.01.03

CHAIN AC#PPEL4 cnt.01.03
@3599
== AC#PPEL4 @3600 
== AC#PPEL4 @3601
== AC#PPEL4 @3602
== AC#PPEL4 @3603 
== KORGANJ IF ~InParty("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN @3604
== HEXXATJ IF ~InParty("hexxat") !StateCheck("hexxat",CD_STATE_NOTVALID)~ THEN @3605
== ViconiJ IF ~InParty("viconia") !StateCheck("viconia",CD_STATE_NOTVALID)~ THEN @3606
== DORNJ IF ~InParty("Dorn") !StateCheck("Dorn",CD_STATE_NOTVALID)~ THEN @3607
== BEDWIN IF ~InParty("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN @3608
== AC#PPEL4 @3609
DO ~StartCutSceneMode() ForceSpell(Myself,DO_NOTHING) SmallWait(2) CreateVisualEffectObject("AC#PPRAI",Player1) CreateVisualEffectObject("AC#PPRAI",Player2) CreateVisualEffectObject("AC#PPRAI",Player3) CreateVisualEffectObject("AC#PPRAI",Player4) CreateVisualEffectObject("AC#PPRAI",Player5) CreateVisualEffectObject("AC#PPRAI",Player6) Wait(2) SetGlobal("AC#PP_MythUnnohyr","GLOBAL",4) SmallWait(1) EndCutSceneMode()
AddJournalEntry(@12100,QUEST)
AddJournalEntry(@12101,QUEST)
AddJournalEntry(@12102,QUEST)
AddJournalEntry(@12103,QUEST)
~ EXIT

CHAIN IF ~Global("AC#PP_MythUnnohyr","GLOBAL",4) Global("AC#PP_BonusBlessing","GLOBAL",0)~ THEN AC#PPEL4 cnt.01.04
@3610
END
// Player1 is a priest of Lathander:
IF ~Kit(Player1,GODLATHANDER)~ THEN REPLY @3611 EXTERN AC#PPEL4 blessing_player_priest_lathander
// Player1 is either a cleric, druid, or paladin, but not a priest of Lathander:
IF~!Kit(Player1,GODLATHANDER)
OR(2) 
Alignment(Player1,MASK_GOOD) Alignment(Player1,MASK_GENEUTRAL) 
OR(3)
 Class(Player1,CLERIC_ALL) Class(Player1,DRUID_ALL) Class(Player1,PALADIN_ALL)~THEN REPLY @3612 EXTERN  AC#PPEL4 cnt.01.05a
// player1 is an evil cleric:
IF~Alignment(Player1,MASK_EVIL) OR(3) Class(Player1,CLERIC_ALL) Class(Player1,DRUID_ALL) Class(Player1,PALADIN_ALL)~THEN REPLY @3612 EXTERN  AC#PPEL4 cnt.01.05b
// player's other responses:
IF ~~ THEN REPLY @3613 EXTERN AC#PPEL4 cnt.01.08
IF ~~ THEN REPLY @3614 EXTERN AC#PPEL4 cnt.01.08
IF ~~ THEN REPLY @3615 EXTERN AC#PPEL4 cnt.01.07
IF ~~ THEN REPLY @3616 EXTERN AC#PPEL4 cnt.01.07

CHAIN AC#PPEL4 blessing_player_priest_lathander
@3617
DO ~StartCutSceneMode() SmallWait(2) ActionOverride(Player1,ForceSpell(Myself,DO_NOTHING)) CreateVisualEffectObject("SPROTECT",Player1) CreateVisualEffectObject("SPROTECT",Player2) CreateVisualEffectObject("SPROTECT",Player3) CreateVisualEffectObject("SPROTECT",Player4) CreateVisualEffectObject("SPROTECT",Player5) CreateVisualEffectObject("SPROTECT",Player6) Wait(2) SetGlobal("AC#PP_LathanderBlessing","GLOBAL",1) SetGlobal("AC#PP_BonusBlessing","GLOBAL",1) SmallWait(1) EndCutSceneMode()AddJournalEntry(@12105,QUEST_DONE)~ EXIT

CHAIN AC#PPEL4 cnt.01.05a
@3618
DO ~StartCutSceneMode() SmallWait(2) CreateVisualEffectObject("SPROTECT",Player1) CreateVisualEffectObject("SPROTECT",Player2) CreateVisualEffectObject("SPROTECT",Player3) CreateVisualEffectObject("SPROTECT",Player4) CreateVisualEffectObject("SPROTECT",Player5) CreateVisualEffectObject("SPROTECT",Player6) Wait(2) SetGlobal("AC#PP_BonusBlessing","GLOBAL",1) SmallWait(1) EndCutSceneMode()~ EXIT

CHAIN AC#PPEL4 cnt.01.05b
@3619
EXTERN AC#PPEL4 cnt.01.08

CHAIN IF ~Global("AC#PP_MythUnnohyr","GLOBAL",4) Global("AC#PP_BonusBlessing","GLOBAL",1)~ THEN AC#PPEL4 cnt.01.0BB
@3620
EXTERN AC#PPEL4 cnt.01.08

CHAIN AC#PPEL4 cnt.01.07
@3621
EXTERN AC#PPEL4 cnt.01.08

CHAIN AC#PPEL4 cnt.01.08
@3622
=
@3623
=
@3624
DO ~SetGlobal("AC#PP_MythUnnohyr","GLOBAL",5)
SetGlobal("AC#PP_HolyWater","GLOBAL",1)~ EXIT


//ILMATER

EXTEND_BOTTOM ~SLILMAT~ 6
IF~PartyHasItem("AC#PPPUB") Global("AC#PP_MythUnnohyr","GLOBAL",5) Global("AC#PP_IlmaterBlessing","GLOBAL",0)~THEN REPLY @3625 EXTERN SLILMAT AC#IL.BLESS
END

EXTEND_BOTTOM ~SLILMAT~ 0
IF~PartyHasItem("AC#PPPUB") Global("AC#PP_MythUnnohyr","GLOBAL",5) Global("AC#PP_IlmaterBlessing","GLOBAL",0)~THEN REPLY @3625 EXTERN SLILMAT AC#IL.BLESS
END

CHAIN SLILMAT AC#IL.BLESS
@3626  
== SLILMAT @3627  
== SLILMAT @3628
DO ~SetGlobal("AC#PP_IlmaterBlessing","GLOBAL",1) CreateVisualEffectObject("AC#PPARM",Player1) CreateVisualEffectObject("AC#PPARM",Player2) CreateVisualEffectObject("AC#PPARM",Player3) CreateVisualEffectObject("AC#PPARM",Player4) CreateVisualEffectObject("AC#PPARM",Player5) CreateVisualEffectObject("AC#PPARM",Player6)
AddJournalEntry(@12104,QUEST_DONE)~ EXIT

//LATHANDER

EXTEND_BOTTOM ~DAWNMAS~ 0
IF~PartyHasItem("AC#PPPUB") Global("AC#PP_MythUnnohyr","GLOBAL",5) Global("AC#PP_LathanderBlessing","GLOBAL",0)~THEN REPLY @3629 EXTERN DAWNMAS AC#DM.BLESS
END

CHAIN DAWNMAS AC#DM.BLESS
@3630  
== DAWNMAS @3631
== DAWNMAS @3632
DO ~SetGlobal("AC#PP_LathanderBlessing","GLOBAL",1) CreateVisualEffectObject("SPHOLYMT",Player1) CreateVisualEffectObject("SPHOLYMT",Player2) CreateVisualEffectObject("SPHOLYMT",Player3) CreateVisualEffectObject("SPHOLYMT",Player4) CreateVisualEffectObject("SPHOLYMT",Player5) CreateVisualEffectObject("SPHOLYMT",Player6)
AddJournalEntry(@12105,QUEST_DONE)~ EXIT

//BLESSING

CHAIN IF ~Global("AC#PP_MythUnnohyr","GLOBAL",5)~ THEN AC#PPEL4 cnt.02.00
@3633
END
IF~PartyHasItem("AC#PPWA") PartyHasItem("AC#PPPUB") Global("AC#PP_LathanderBlessing","GLOBAL",1) Global("AC#PP_IlmaterBlessing","GLOBAL",1)~THEN REPLY @3634 EXTERN AC#PPEL4 have_blessings_have_flower_have_water
IF~~THEN REPLY @3635 EXTERN AC#PPEL4 cnt.02.01

CHAIN AC#PPEL4 cnt.02.01
@3636
EXIT

CHAIN AC#PPEL4 have_blessings_have_flower_have_water
//DO ~GiveItemCreate("AC#PPWA",Player1,1,0,0)~
@3637
END
IF~~THEN EXTERN AC#PPEL4 have_blessings_have_flower_have_water_02


CHAIN AC#PPEL4 have_blessings_have_flower_have_water_02
@3638 
== AnomenJ IF ~InParty("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN @3639
== NEERAJ IF ~InParty("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID)~ THEN @3640
== IMOEN2J IF ~InParty("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN @3641
== MinscJ IF ~InParty("minsc") !StateCheck("minsc",CD_STATE_NOTVALID)~ THEN @3642
== JANJ IF ~InParty("Jan") !StateCheck("Jan",CD_STATE_NOTVALID)~ THEN @3643
== AC#PPEL4 @3644
DO ~SetGlobal("AC#PP_MythUnnohyr","GLOBAL",6) 
AddJournalEntry(@12108,QUEST)~ EXIT

//ANTIDOTE

CHAIN IF ~Global("AC#PP_MythUnnohyr","GLOBAL",6)~ THEN AC#PPEL4 cnt.03.00
@3645
END
IF ~PartyHasItem("AC#PPANT")~ THEN REPLY @3646 DO ~TakePartyItem("AC#PPANT") DestroyItem("AC#PPANT")~ EXTERN AC#PPEL4 cnt.03.02
IF ~PartyHasItem("AC#PPANT")~ THEN REPLY @3647 DO ~TakePartyItem("AC#PPANT") DestroyItem("AC#PPANT")~ EXTERN AC#PPEL4 cnt.03.02
IF ~PartyHasItem("AC#PPANT")~ THEN REPLY @3648 DO ~TakePartyItem("AC#PPANT") DestroyItem("AC#PPANT")~ EXTERN AC#PPEL4 cnt.03.02
IF ~~ THEN REPLY @3649 EXTERN AC#PPEL4 cnt.03.01
IF~PartyHasItem("AC#PPSYM") Global("AC#PP_AlaAgreesSymbol","GLOBAL",0)~THEN REPLY @3471 EXTERN AC#PPEL4 Merethan_emblem_05

CHAIN IF ~~ THEN AC#PPEL4 Merethan_emblem_05
@3479
END
IF~Global("AC#PPSymbolQuest","GLOBAL",2)~THEN REPLY @3480 EXTERN AC#PPEL4 emblem_montrassa_05
IF~~THEN REPLY @3470 EXTERN AC#PPEL4 no_news

CHAIN IF ~~ THEN AC#PPEL4 emblem_montrassa_05
@3481
END
IF~~THEN REPLY @3482 DO ~SetGlobal("AC#PP_AlaAgreesSymbol","GLOBAL",1) AddJournalEntry(@13051,QUEST)~ EXTERN AC#PPEL4 emblem_montrassa_bye_05

CHAIN AC#PPEL4 emblem_montrassa_bye_05
@3483
EXIT

CHAIN AC#PPEL4 cnt.03.01
@3650
EXIT


CHAIN AC#PPEL4 cnt.03.02
@3651  
== AC#PPEL4 @3652  
== AC#PPEL4 @3653  
== AC#PPEL4 @3654  
DO ~SetGlobal("AC#PP_MythUnnohyr","GLOBAL",7) GiveItemCreate("AC#PPRE",Player1,1,1,1) AddXPObject(Player1,4200) AddXPObject(Player2,4200) AddXPObject(Player3,4200) AddXPObject(Player4,4200) AddXPObject(Player5,4200) AddXPObject(Player6,4200)
AddJournalEntry(@12111,QUEST_DONE)~ EXIT


//FINISHED

CHAIN IF ~Global("AC#PP_MythUnnohyr","GLOBAL",7)~ THEN AC#PPEL4 cnt.04.00
@3655  
END
IF~~THEN REPLY @3656 EXTERN AC#PPEL4 bye_finished
IF~~THEN REPLY @3657 EXTERN AC#PPEL4 bye_finished
IF~PartyHasItem("AC#PPSYM") Global("AC#PP_AlaAgreesSymbol","GLOBAL",0)~THEN REPLY @3471 EXTERN AC#PPEL4 Merethan_emblem_06

CHAIN IF ~~ THEN AC#PPEL4 Merethan_emblem_06
@3479
END
IF~Global("AC#PPSymbolQuest","GLOBAL",2)~THEN REPLY @3480 EXTERN AC#PPEL4 emblem_montrassa_06
IF~~THEN REPLY @3470 EXTERN AC#PPEL4 bye_finished

CHAIN IF ~~ THEN AC#PPEL4 emblem_montrassa_06
@3658
END
IF~~THEN REPLY @3482 DO ~SetGlobal("AC#PP_AlaAgreesSymbol","GLOBAL",1) AddJournalEntry(@13051,QUEST)~ EXTERN AC#PPEL4 emblem_montrassa_bye_06

CHAIN AC#PPEL4 emblem_montrassa_bye_06
@3483
EXIT

CHAIN AC#PPEL4 bye_finished
@3659
EXIT

/*
IF~~THEN REPLY ~Thank you.~ EXIT
IF~Global("AC#PPSymbolQuest","GLOBAL",1) Global("AC#PPSymbolAskNow","GLOBAL",0)~THEN REPLY ~One of your sisters has been trying to make this Eldath emblem, but she cannot succeed. She is suffering from serious numbness in her hands. Perhaps you have some emblem, or a symbol I could give her. I think she deserves it.~ DO ~SetGlobal("AC#PPSymbolAskNow","GLOBAL",1)~ EXTERN AC#PPEL4 cnt.04.01
IF~InMyArea("AC#PPMON")~THEN REPLY ~I can see our mutual friend came here to thank you for the symbol.~ EXTERN AC#PPEL4 cnt.04.02

CHAIN AC#PPEL4 cnt.04.01
~I think I know the person you are speaking of. Yes. I should have something here. You can take it and give it to her. It sounds like someone with a strong spirit and she should truly have it, the symbol.~
DO ~GiveItemCreate("AC#PPSYM",Player1,1,0,0)~ EXIT

CHAIN AC#PPEL4 cnt.04.02
~Yes. And I must say that it may be quite interesting to teach this one. I'm glad she came to me.~
EXIT
*/

// Eldathyn high priest and novice
BEGIN ~AC#PPST4~
CHAIN IF ~True()~ THEN AC#PPST4 hello_novice
@3660
==AC#PPEL4 @3661
==AC#PPST4 @3662
==AC#PPEL4 @3663
==AC#PPST4 @3664
==AC#PPEL4 @3665  
==AC#PPST4 @3666
DO ~EscapeAreaDestroy(1)~ EXIT
