// dryad in area acpp06 (Eldath's Peace Grotto):
BEGIN ~AC#PPDR1~ //Dryad
BEGIN ~AC#PPFI1~ //Fighter
BEGIN ~AC#PPCHT~ // Cheat code creature for testing the grotto system

CHAIN
IF ~true()~ THEN AC#PPCHT AC#PPCHT_intro
@4400
END
IF ~~ THEN REPLY @4401 DO ~StartCutScene("AC#PPCH1")~ EXIT
IF ~~ THEN REPLY @4402 DO ~StartCutScene("AC#PPCH2")~ EXIT
IF ~~ THEN REPLY @4403 EXTERN AC#PPCHT stuff
IF ~~ THEN REPLY @4404 EXIT

CHAIN AC#PPCHT stuff
@4405 
 DO ~GiveItemCreate("WAND02",Player1,5,0,0)
    GiveItemCreate("WAND03",Player1,5,0,0)
    GiveItemCreate("WAND04",Player1,5,0,0)
    GiveItemCreate("WAND10",Player1,5,0,0)
    GiveItemCreate("WAND11",Player1,5,0,0)
    GiveItemCreate("RING02",Player1,5,0,0)
    GiveItemCreate("RING07",Player1,5,0,0)
    GiveItemCreate("RING09",Player1,5,0,0)
    GiveItemCreate("RING05",Player1,5,0,0)
    GiveItemCreate("RING20",Player1,5,0,0)
    GiveItemCreate("RING27",Player1,5,0,0)
    GiveItemCreate("RING31",Player1,5,0,0)
    GiveItemCreate("RING33",Player1,5,0,0)
    GiveItemCreate("BLUN19",Player1,5,0,0)
    GiveItemCreate("BLUN25",Player1,5,0,0)
    GiveItemCreate("AMUL21",Player1,5,0,0)
    GiveItemCreate("AMUL22",Player1,5,0,0)~ EXIT



// Dialogue in Eldath’s Grotto – between a dryad (AC#PPDR1) and a repentant warrior (AC#PPFI1)

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#PPFI1 hello_peace
@4406
==AC#PPDR1 @4407
==AC#PPFI1 @4408
==AC#PPDR1 @4409
==AC#PPFI1 @4410
DO ~CreateVisualEffectObject("SPHEALIN",Myself)
DropInventory()
DestroyItem("PLAT01")
DestroyItem("HELM01")
EscapeAreaDestroy(3)~
EXIT

// Dryad in Eldath's grotto main dialogues

// Dialogue: Offering to trade named weapons for Eldath's blessing
CHAIN IF ~Global("AC#PP_TradeWeapons","GLOBAL",1)~ THEN AC#PPDR1 hello_trade_weapons
@4411
END
IF ~~ THEN REPLY @4412 DO ~SetGlobal("AC#PP_TradeWeapons","GLOBAL",2)~ EXTERN AC#PPDR1 trade_weapons_02
IF ~~ THEN REPLY @4413 DO ~SetGlobal("AC#PP_TradeWeapons","GLOBAL",2)~ EXTERN AC#PPDR1 trade_weapons_02
IF ~~ THEN REPLY @4414 DO ~SetGlobal("AC#PP_TradeWeapons","GLOBAL",2)~ EXTERN AC#PPDR1 trade_weapons_02
IF ~~ THEN REPLY @4415 EXTERN AC#PPDR1 bye_trade_weapons

CHAIN IF ~~ THEN AC#PPDR1 bye_trade_weapons
@4416
DO ~SetGlobal("AC#PP_TradeWeapons","GLOBAL",10)~
EXIT

CHAIN IF ~~ THEN AC#PPDR1 trade_weapons_02
@4417
END
IF ~~ THEN EXTERN AC#PPDR1 trade_weapons_03

CHAIN IF ~~ THEN AC#PPDR1 trade_weapons_03
@4418
END
IF ~~ THEN EXTERN AC#PPDR1 trade_weapons_04

CHAIN IF ~~ THEN AC#PPDR1 trade_weapons_04
@4419
== KORGANJ IF ~InParty("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN @4420 
END
IF ~~ THEN REPLY @4421 EXTERN AC#PPDR1 trade_weapons_05
IF ~~ THEN REPLY @4422 EXTERN AC#PPDR1 trade_weapons_what_do_i_get
IF ~~ THEN REPLY @4415 EXTERN AC#PPDR1 bye_trade_weapons

CHAIN IF ~~ THEN AC#PPDR1 trade_weapons_05
@4423
== AerieJ IF ~InParty("aerie") !StateCheck("aerie",CD_STATE_NOTVALID)~ THEN @4424
== KeldorJ IF ~InParty("keldorn") !StateCheck("keldorn",CD_STATE_NOTVALID)~ THEN @4425
== BEDWIN IF ~InParty("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN @4426
== DORNJ IF ~InParty("Dorn") !StateCheck("Dorn",CD_STATE_NOTVALID)~ THEN @4427
== NEERAJ IF ~InParty("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID)~ THEN @4428
== HAERDAJ IF ~InParty("HaerDalis") !StateCheck("HaerDalis",CD_STATE_NOTVALID)~ THEN @4429
== JaheiraJ IF ~InParty("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN @4430
== CERNDJ IF ~InParty("Cernd") !StateCheck("Cernd",CD_STATE_NOTVALID)~ THEN @4431
END
IF ~~ THEN REPLY @4422 EXTERN AC#PPDR1 trade_weapons_what_do_i_get
IF ~~ THEN REPLY @4432 EXTERN AC#PPDR1 trade_weapons_what_do_i_get
IF ~~ THEN REPLY @4433 EXTERN AC#PPDR1 trade_weapons_what_do_i_get

CHAIN IF ~~ THEN AC#PPDR1 trade_weapons_what_do_i_get
@4434 
END
IF ~~ THEN EXTERN AC#PPDR1 trade_weapons_hub

CHAIN IF ~~ THEN AC#PPDR1 trade_weapons_hub
@4435
END
IF ~~ THEN REPLY @4436 EXTERN AC#PPDR1 trade_weapons_which_weapons
IF ~~ THEN REPLY @4421 EXTERN AC#PPDR1 trade_weapons_05
IF ~~ THEN REPLY @4437 EXTERN AC#PPDR1 trade_weapons_exact_benefit

	CHAIN IF ~~ THEN AC#PPDR1 trade_weapons_exact_benefit
	@4438
	END
	IF ~~ THEN REPLY @4436 EXTERN AC#PPDR1 trade_weapons_which_weapons
	IF ~~ THEN REPLY @4439 EXTERN AC#PPDR1 bye_trade_weapons

CHAIN IF ~~ THEN AC#PPDR1 trade_weapons_which_weapons
@4440  
=  
@4441
END
IF ~~ THEN REPLY @4442 EXTERN AC#PPDR1 trade_root
IF ~~ THEN REPLY @4437 EXTERN AC#PPDR1 trade_weapons_exact_benefit
IF ~~ THEN REPLY @4443 EXTERN AC#PPDR1 trade_think_about_it
IF ~~ THEN REPLY @4444 EXTERN AC#PPDR1 trade_think_about_it
IF ~~ THEN REPLY @4439 EXTERN AC#PPDR1 bye_trade_weapons

CHAIN IF ~~ THEN AC#PPDR1 trade_think_about_it
@4445
DO ~AddJournalEntry(@13110,QUEST)~ EXIT


CHAIN IF ~True()~ THEN AC#PPDR1 hello_01
@4446 
END
IF~Global("NPC_ThrowWeapon","ACPP06",0)~THEN REPLY @4447 EXTERN AC#PPDR1 what_place
IF~Global("NPC_ThrowWeapon","ACPP06",1)~THEN REPLY @4447 EXTERN AC#PPDR1 what_place_2
IF~~THEN REPLY @4448 EXTERN AC#PPDR1 who_are_you
IF~~THEN REPLY @4449 EXTERN AC#PPDR1 bye
IF~Global("AC#PP_TradeWeapons","GLOBAL",2)~THEN REPLY @4450 EXTERN AC#PPDR1 trade_root
IF~Global("AC#PP_TradeWeapons","GLOBAL",2)~THEN REPLY @4451 EXTERN AC#PPDR1 trade_weapons_hub
IF ~Global("AC#PP_HolyWater","GLOBAL",1)~ THEN REPLY @4452 EXTERN AC#PPDR1 need_singing_water
//IF ~Global("AC#PP_GiveBlade","GLOBAL",1)~ THEN REPLY ~Alatoasz told me to collect a weapon here, one to aid me against the undead.~ EXTERN AC#PPDR1 need_blade_01

/*
CHAIN IF ~~ THEN AC#PPDR1 need_blade_01
~You seek the blade that may wound only dead flesh? I can scarce believe the Fallskeeper allowed it. Weapons laid down here are meant to rest forever.~  
END
IF ~~ THEN REPLY ~Then this time, it shall be otherwise.~ EXTERN AC#PPDR1 need_blade_02
IF ~~ THEN REPLY ~Well, it was promised to me, and I would like to claim it now.~ EXTERN AC#PPDR1 need_blade_02
IF ~~ THEN REPLY ~I understand your concerns, but it would be a welcome aid against all undead.~ EXTERN AC#PPDR1 need_blade_02
IF ~~ THEN REPLY ~Enough of this prattle. Give me the blade that is mine by right!~ EXTERN AC#PPDR1 need_blade_unfriendly


CHAIN IF ~~ THEN AC#PPDR1 need_blade_unfriendly
~Such rudeness! What was the Fallskeeper thinking, to permit you this?~
== AC#PPDR1 ~Still... it is not mine to decide.~  
END
IF ~~ THEN EXTERN AC#PPDR1 need_blade_02

CHAIN IF ~~ THEN AC#PPDR1 need_blade_02
~Take the blade, <PRO_RACE>. I return to your hands what has rested in silence for ages. This is the Memory of the Myths — a sword forged in elder days to wound only that which should not walk. It has slumbered long beneath the waters. Treat it with reverence. And may its purpose serve you well.~ 
DO ~SetGlobal("AC#PP_GiveBlade","GLOBAL",10) 
AddJournalEntry(@12220,QUEST_DONE) 
GiveItemCreate("AC#PPMYT",Player1,1,0,0)~ EXIT
*/

	CHAIN IF ~~ THEN AC#PPDR1 need_singing_water
	@4453
	DO ~SetGlobal("AC#PP_HolyWater","GLOBAL",10)
	GiveItemCreate("AC#PPWA",Player1,1,0,0)
	AddJournalEntry(@12106,QUEST_DONE)~ EXIT


	CHAIN IF ~~ THEN AC#PPDR1 who_are_you
	@4454 
	END
	IF~Global("NPC_ThrowWeapon","ACPP06",0)~THEN REPLY @4447 EXTERN AC#PPDR1 what_place
	IF~Global("NPC_ThrowWeapon","ACPP06",1)~THEN REPLY @4447 EXTERN AC#PPDR1 what_place_2
	IF~~THEN REPLY @4449 EXTERN AC#PPDR1 bye
	

	CHAIN IF ~~ THEN AC#PPDR1 what_place
	@4455
	=@4456
	== AnomenJ IF ~InParty("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN @4457
	== MazzyJ IF ~InParty("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN @4458
	== DORNJ IF ~InParty("Dorn") !StateCheck("Dorn",CD_STATE_NOTVALID)~ THEN @4459
	== KeldorJ IF ~InParty("keldorn") !StateCheck("keldorn",CD_STATE_NOTVALID)~ THEN @4460
	END
	IF~~THEN DO ~SetGlobal("NPC_ThrowWeapon","ACPP06",1)~ EXTERN AC#PPDR1 throw_weapon_too
	
		CHAIN IF ~~ THEN AC#PPDR1 what_place_2
	@4455
	= @4456
	END
	IF~~THEN EXTERN AC#PPDR1 throw_weapon_too

	CHAIN IF ~~ THEN AC#PPDR1 throw_weapon_too
	@4461
	END
	
	IF~~THEN REPLY @4462 EXTERN AC#PPDR1 weapon_01
	IF~~THEN REPLY @4463 EXTERN AC#PPDR1 weapon_01
	IF~~THEN REPLY @4464 EXTERN AC#PPDR1 weapon_01
	IF~~THEN REPLY @4465 EXTERN AC#PPDR1 weapon_01
	IF~~THEN REPLY @4466 EXTERN AC#PPDR1 take_some_weapons
	IF~~THEN REPLY @4449 EXTERN AC#PPDR1 bye
	
	CHAIN IF ~~ THEN AC#PPDR1 weapon_01
	@4467 
	END
	IF~~THEN REPLY @4449 EXTERN AC#PPDR1 bye
	
	
		CHAIN IF ~~ THEN AC#PPDR1 take_some_weapons
		@4468 
		END
		//IF~~THEN REPLY @4469 EXTERN AC#PPDR1 spectral_blade
		IF~~THEN REPLY @4470 EXTERN AC#PPDR1 bye
		IF~~THEN REPLY @4449 EXTERN AC#PPDR1 bye
		
		
		CHAIN IF ~~ THEN AC#PPDR1 spectral_blade
		@4471 
		END
		IF~~THEN REPLY @4472 EXTERN AC#PPDR1 give_spectral_blade
		IF~~THEN REPLY @4449 EXTERN AC#PPDR1 bye
		
		
			CHAIN IF ~~ THEN AC#PPDR1 give_spectral_blade
			@4473 
			END
			IF~~THEN REPLY @4474 EXTERN AC#PPDR1 bye
			IF~~THEN REPLY @4475 EXTERN AC#PPDR1 bye
			IF~~THEN REPLY @4449 EXTERN AC#PPDR1 bye
			

	CHAIN IF ~~ THEN AC#PPDR1 bye
	@4476
	EXIT	
	
	CHAIN IF ~~ THEN AC#PPDR1 no_trade_bye
	@4477 
	EXIT
	
// =====================================================
// Eldath Dryad – Weapon Cleansing Trade Hub (cleaned)
// Legendary: +2 Max HP (AC#PPH2) + 1% Resist (AC#PPGR) + XP
// Lesser:    +1 Max HP (AC#PPH1) + XP
// =====================================================

// ---------- ROOT ----------
CHAIN IF ~~ THEN AC#PPDR1 trade_root
@4478
END
		IF ~~ THEN REPLY @4479 EXTERN AC#PPDR1 trade_lesser_menu
		IF ~~ THEN REPLY @4480 EXTERN AC#PPDR1 trade_legend_menu
		IF ~~ THEN REPLY @4481 EXTERN AC#PPDR1 no_trade_bye
		IF ~~ THEN REPLY @4482 EXTERN AC#PPDR1 no_trade_bye
		IF ~~ THEN REPLY @4483 EXTERN AC#PPDR1 trade_gain

	CHAIN IF ~~ THEN AC#PPDR1 trade_gain
	@4484
	END
	IF ~~ THEN REPLY @4485 EXTERN AC#PPDR1 trade_gain_02
	IF ~~ THEN REPLY @4486 EXTERN AC#PPDR1 trade_root
	IF ~~ THEN REPLY @4487 EXTERN AC#PPDR1 no_trade_bye

	  
	  CHAIN IF ~~ THEN AC#PPDR1 trade_gain_02
    @4488
	END
	IF ~~ THEN REPLY @4486 EXTERN AC#PPDR1 trade_root
	IF ~~ THEN REPLY @4487 EXTERN AC#PPDR1 no_trade_bye

// =====================================================
// LEGENDARY BRANCH
// =====================================================

CHAIN IF ~~ THEN AC#PPDR1 trade_legend_menu
@4489
END
	//Equalizer
  IF ~PartyHasItem("SW1H54") Global("AC#TradeEqualizer","GLOBAL",0)~
  THEN REPLY @4490 EXTERN AC#PPDR1 trade_legend_equalizer
  
	//Carsomyr
  IF ~PartyHasItem("SW2H10") Global("AC#TradeCarsomyr","GLOBAL",0)~
  THEN REPLY @4491 EXTERN AC#PPDR1 trade_legend_carsomyr
  
	//Flail of Ages
  IF ~PartyHasItem("BLUN14") Global("AC#TradeFoA","GLOBAL",0)~
  THEN REPLY @4492 EXTERN AC#PPDR1 trade_legend_foa

	//Crom Faeyr
  IF ~PartyHasItem("HAMM09") Global("AC#TradeCrom","GLOBAL",0)~
  THEN REPLY @4493 EXTERN AC#PPDR1 trade_legend_crom

	//Soul Reaver
  IF ~PartyHasItem("SW2H08") Global("AC#TradeSoulReaver","GLOBAL",0)~
  THEN REPLY @4494 EXTERN AC#PPDR1 trade_legend_soulreaver

	//Blackrazor
  IF ~PartyHasItem("MISCBC") Global("AC#TradeBlackrazor","GLOBAL",0)~
  THEN REPLY @4495 EXTERN AC#PPDR1 trade_legend_blackrazor

	//Lilarcor
  IF ~PartyHasItem("SW2H14") Global("AC#TradeLilarcor","GLOBAL",0)~
  THEN REPLY @4496 EXTERN AC#PPDR1 trade_legend_lilarcor
  
  //Celestial Fury
  IF ~PartyHasItem("SW1H51") Global("AC#TradeCelFury","GLOBAL",0)~
  THEN REPLY @4497 EXTERN AC#PPDR1 trade_legend_celestialfury

// Warblade +4 (SW2H09)
IF ~PartyHasItem("SW2H09") Global("AC#TradeWarblade","GLOBAL",0)~
THEN REPLY @4498 EXTERN AC#PPDR1 trade_legend_warblade

// Silver Sword (SW2H15)
IF ~PartyHasItem("SW2H15") Global("AC#TradeSilverSword","GLOBAL",0)~
THEN REPLY @4499 EXTERN AC#PPDR1 trade_legend_silversword

// Shortbow of Gesen (BOW19)
IF ~PartyHasItem("BOW19") Global("AC#TradeGesen","GLOBAL",0)~
THEN REPLY @4500 EXTERN AC#PPDR1 trade_legend_gesen

// Icingdeath +3 (SW1H15) — Drizzt’s blade
IF ~PartyHasItem("SW1H15") Global("AC#TradeIcingdeath","GLOBAL",0)~
THEN REPLY @4501 EXTERN AC#PPDR1 trade_legend_icingdeath

// Twinkle (SW1H16) — Drizzt’s blade
IF ~PartyHasItem("SW1H16") Global("AC#TradeTwinkle","GLOBAL",0)~
THEN REPLY @4502 EXTERN AC#PPDR1 trade_legend_twinkle

// Staff of the Magi (STAF11)
IF ~PartyHasItem("STAF11") Global("AC#TradeSotM","GLOBAL",0)~
THEN REPLY @4503 EXTERN AC#PPDR1 trade_legend_sotm

// Doomed Loser +5 (AC#WSW50)
IF ~PartyHasItem("AC#WSW50") Global("AC#TradeDoomedLoser","GLOBAL",0)~
THEN REPLY @4504 EXTERN AC#PPDR1 trade_legend_doomedloser

// Flayer Slayer
IF ~PartyHasItem("AC#MGFL") Global("AC#TradeFlayerSlayer","GLOBAL",0)~
  THEN REPLY @4505 EXTERN AC#PPDR1 trade_legend_flayerslayer
  
IF ~~ THEN REPLY @4481 EXTERN AC#PPDR1 trade_root  
IF ~~ THEN REPLY @4506 EXTERN AC#PPDR1 trade_root
IF ~~ THEN REPLY @4507 EXTERN AC#PPDR1 no_trade_bye 

CHAIN AC#PPDR1 trade_legend_flayerslayer
@4508
DO ~TakePartyItem("AC#MGFL")
   SetGlobal("AC#TradeFlayerSlayer","GLOBAL",1)
   ApplySpellRES("AC#PPH2",Player1)
   ApplySpellRES("AC#PPGR",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)
~ EXIT

CHAIN AC#PPDR1 trade_legend_doomedloser
@4509
DO ~TakePartyItem("AC#WSW50")
   SetGlobal("AC#TradeDoomedLoser","GLOBAL",1)
   ApplySpellRES("AC#PPH2",Player1)
   ApplySpellRES("AC#PPGR",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)
~ EXIT

CHAIN AC#PPDR1 trade_legend_silversword
@4510
DO ~TakePartyItem("SW2H15")
   SetGlobal("AC#TradeSilverSword","GLOBAL",1)
   ApplySpellRES("AC#PPH2",Player1)
   ApplySpellRES("AC#PPGR",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT


CHAIN AC#PPDR1 trade_legend_gesen
@4511
DO ~TakePartyItem("BOW19")
   SetGlobal("AC#TradeGesen","GLOBAL",1)
   ApplySpellRES("AC#PPH2",Player1)
   ApplySpellRES("AC#PPGR",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_legend_icingdeath
@4512
DO ~TakePartyItem("SW1H15")
   SetGlobal("AC#TradeIcingdeath","GLOBAL",1)
   ApplySpellRES("AC#PPH2",Player1)
   ApplySpellRES("AC#PPGR",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_legend_twinkle
@4513
DO ~TakePartyItem("SW1H16")
   SetGlobal("AC#TradeTwinkle","GLOBAL",1)
   ApplySpellRES("AC#PPH2",Player1)
   ApplySpellRES("AC#PPGR",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_legend_sotm
@4514
DO ~TakePartyItem("STAF11")
   SetGlobal("AC#TradeSotM","GLOBAL",1)
   ApplySpellRES("AC#PPH2",Player1)
   ApplySpellRES("AC#PPGR",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_legend_warblade
@4515
DO ~TakePartyItem("SW2H09")
   SetGlobal("AC#TradeWarblade","GLOBAL",1)
   ApplySpellRES("AC#PPH2",Player1)
   ApplySpellRES("AC#PPGR",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_legend_equalizer
@4516
DO ~TakePartyItem("SW1H54")
   SetGlobal("AC#TradeEqualizer","GLOBAL",1)
   ApplySpellRES("AC#PPH2",Player1)
   ApplySpellRES("AC#PPGR",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_legend_carsomyr
@4517
DO ~TakePartyItem("SW2H10")
   SetGlobal("AC#TradeCarsomyr","GLOBAL",1)
   ApplySpellRES("AC#PPH2",Player1)
   ApplySpellRES("AC#PPGR",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_legend_foa
@4518
DO ~TakePartyItem("BLUN14")
   SetGlobal("AC#TradeFoA","GLOBAL",1)
   ApplySpellRES("AC#PPH2",Player1)
   ApplySpellRES("AC#PPGR",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_legend_crom
@4519
DO ~TakePartyItem("HAMM09")
   SetGlobal("AC#TradeCrom","GLOBAL",1)
   ApplySpellRES("AC#PPH2",Player1)
   ApplySpellRES("AC#PPGR",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_legend_soulreaver
@4520
DO ~TakePartyItem("SW2H08")
   SetGlobal("AC#TradeSoulReaver","GLOBAL",1)
   ApplySpellRES("AC#PPH2",Player1)
   ApplySpellRES("AC#PPGR",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_legend_blackrazor
@4521
DO ~TakePartyItem("MISCBC")
   SetGlobal("AC#TradeBlackrazor","GLOBAL",1)
   ApplySpellRES("AC#PPH2",Player1)
   ApplySpellRES("AC#PPGR",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_legend_celestialfury
@4522
DO ~TakePartyItem("SW1H51")
   SetGlobal("AC#TradeCelFury","GLOBAL",1)
   ApplySpellRES("AC#PPH2",Player1)
   ApplySpellRES("AC#PPGR",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_legend_lilarcor
@4523
DO ~TakePartyItem("SW2H14")
   SetGlobal("AC#TradeLilarcor","GLOBAL",1)
   ApplySpellRES("AC#PPH2",Player1)
   ApplySpellRES("AC#PPGR",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   //DisplayString(Player1,@908)
   //DisplayString(Player1,@909)
   AddexperienceParty(300)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT 

CHAIN IF ~~ THEN AC#PPDR1 trade_legend_refresh
@4524
END
  IF ~~ THEN REPLY @4525 EXTERN AC#PPDR1 trade_legend_menu
  IF ~~ THEN REPLY @4526 EXTERN AC#PPDR1 trade_root
  IF ~~ THEN REPLY @4482 EXTERN AC#PPDR1 no_trade_bye
 

// =====================================================
// LESSER / OTHER BRANCH
// =====================================================

CHAIN IF ~~ THEN AC#PPDR1 trade_lesser_menu
@4527
END

// Skullcrusher +3 (BLUN18)
IF ~PartyHasItem("BLUN18") Global("AC#TradeSkullcrusher","GLOBAL",0)~
THEN REPLY @4528 EXTERN AC#PPDR1 trade_legend_skullcrusher

// Hammer of Thunderbolts +3 (HAMM07)
IF ~PartyHasItem("HAMM07") Global("AC#TradeThunderbolts","GLOBAL",0)~
THEN REPLY @4529 EXTERN AC#PPDR1 trade_legend_thunderbolts

// Dwarven Thrower +3 (HAMM06)
IF ~PartyHasItem("HAMM06") Global("AC#TradeDwarvenThrower","GLOBAL",0)~
THEN REPLY @4530 EXTERN AC#PPDR1 trade_legend_dwarventhrower

// Boneblade +4 (DAGG14)
IF ~PartyHasItem("DAGG14") Global("AC#TradeBoneblade","GLOBAL",0)~
THEN REPLY @4531 EXTERN AC#PPDR1 trade_legend_boneblade

// Blackblood +3 (BLUN22)
IF ~PartyHasItem("BLUN22") Global("AC#TradeBlackblood","GLOBAL",0)~
THEN REPLY @4532 EXTERN AC#PPDR1 trade_legend_blackblood

// Blade of Searing +3 (SW1H39)
IF ~PartyHasItem("SW1H39") Global("AC#TradeSearing","GLOBAL",0)~
THEN REPLY @4533 EXTERN AC#PPDR1 trade_legend_searing

// Azuredge +3 (AX1H10)
IF ~PartyHasItem("AX1H10") Global("AC#TradeAzuredge","GLOBAL",0)~
THEN REPLY @4534 EXTERN AC#PPDR1 trade_legend_azuredge

// Heartseeker +3 (BOW10)
IF ~PartyHasItem("BOW10") Global("AC#TradeHeartseeker","GLOBAL",0)~
THEN REPLY @4535 EXTERN AC#PPDR1 trade_legend_heartseeker

// Elven Court Bow (BOW12)
IF ~PartyHasItem("BOW12") Global("AC#TradeCourtBow","GLOBAL",0)~
THEN REPLY @4536 EXTERN AC#PPDR1 trade_legend_courtbow

// Impaler +3 (SPER08)
IF ~PartyHasItem("SPER08") Global("AC#TradeImpaler","GLOBAL",0)~
THEN REPLY @4537 EXTERN AC#PPDR1 trade_legend_impaler

// Spear of Withering (SPER10)
IF ~PartyHasItem("SPER10") Global("AC#TradeWithering","GLOBAL",0)~
THEN REPLY @4538 EXTERN AC#PPDR1 trade_legend_withering

// Frostreaver +3 (AX1H13)
IF ~PartyHasItem("AX1H13") Global("AC#TradeFrostreaver","GLOBAL",0)~
THEN REPLY @4539 EXTERN AC#PPDR1 trade_legend_frostreaver

  IF ~PartyHasItem("SW1H40") Global("AC#TradeL_BladeRoses","GLOBAL",0)~
  THEN REPLY @4540 EXTERN AC#PPDR1 trade_lesser_bladeroses

  IF ~PartyHasItem("AX1H12") Global("AC#TradeL_Stonefire","GLOBAL",0)~
  THEN REPLY @4541 EXTERN AC#PPDR1 trade_lesser_stonefire

  IF ~PartyHasItem("AX1H09") Global("AC#TradeL_Rifthome","GLOBAL",0)~
  THEN REPLY @4542 EXTERN AC#PPDR1 trade_lesser_rifthome

  IF ~PartyHasItem("HALB04") Global("AC#TradeL_DragBreath","GLOBAL",0)~
  THEN REPLY @4543 EXTERN AC#PPDR1 trade_lesser_dragonsbreath

  IF ~PartyHasItem("HALB09") Global("AC#TradeL_WaveHalb","GLOBAL",0)~
  THEN REPLY @4544 EXTERN AC#PPDR1 trade_lesser_wave

  IF ~PartyHasItem("SW1H33") Global("AC#TradeL_Ras","GLOBAL",0)~
  THEN REPLY @4545 EXTERN AC#PPDR1 trade_lesser_ras

  IF ~PartyHasItem("DAGG13") Global("AC#TradeL_PixiePrick","GLOBAL",0)~
  THEN REPLY @4546 EXTERN AC#PPDR1 trade_lesser_pixie

  IF ~PartyHasItem("SW1H33") Global("AC#TradeL_Cutthroat","GLOBAL",0)~
  THEN REPLY @4547 EXTERN AC#PPDR1 trade_lesser_cutthroat

  IF ~PartyHasItem("SW1H68") Global("AC#TradeL_SpectralBrand","GLOBAL",0)~
  THEN REPLY @4548 EXTERN AC#PPDR1 trade_lesser_spectral

  IF ~PartyHasItem("SW1H35") Global("AC#TradeL_Adjatha","GLOBAL",0)~
  THEN REPLY @4549 EXTERN AC#PPDR1 trade_lesser_adjatha

  IF ~PartyHasItem("SW2H16") Global("AC#TradeL_SwordChaos","GLOBAL",0)~
  THEN REPLY @4550 EXTERN AC#PPDR1 trade_lesser_chaos

  IF ~PartyHasItem("SW1H34") Global("AC#TradeL_Albruin","GLOBAL",0)~
  THEN REPLY @4551 EXTERN AC#PPDR1 trade_lesser_albruin

  IF ~PartyHasItem("SW1H53") Global("AC#TradeL_SwordFlame","GLOBAL",0)~
  THEN REPLY @4552 EXTERN AC#PPDR1 trade_lesser_flame

  IF ~PartyHasItem("SW1H31") Global("AC#TradeL_Daystar","GLOBAL",0)~
  THEN REPLY @4553 EXTERN AC#PPDR1 trade_lesser_daystar

  IF ~PartyHasItem("SW1H10") Global("AC#TradeL_SSBackstab","GLOBAL",0)~
  THEN REPLY @4554 EXTERN AC#PPDR1 trade_lesser_ssbackstab

  IF ~PartyHasItem("SW1H30") Global("AC#TradeL_Belm","GLOBAL",0)~
  THEN REPLY @4555 EXTERN AC#PPDR1 trade_lesser_belm

  IF ~PartyHasItem("MISC75") Global("AC#TradeL_DagVenom","GLOBAL",0)~
  THEN REPLY @4556 EXTERN AC#PPDR1 trade_lesser_dagvenom
  
  IF ~PartyHasItem("SW1H38") Global("AC#TradeL_Jhor","GLOBAL",0)~ 
  THEN REPLY @4557 EXTERN AC#PPDR1 trade_lesser_jhor 

// Lesser Weapons - Poisoned Pathways
// Blade of the Elven Mycologist
IF ~PartyHasItem("AC#PPSW") Global("AC#TradeMycologistBlade","GLOBAL",0)~
THEN REPLY @4558 EXTERN AC#PPDR1 trade_lesser_mycologist_blade

// Mirage’s Edge – Spielerantwort:
IF ~PartyHasItem("AC#PPSCI") Global("AC#TradeMirageEdge","GLOBAL",0)~
THEN REPLY @4559 EXTERN AC#PPDR1 trade_lesser_mirageedge

// Scolopendra's Spit +3
IF ~PartyHasItem("AC#PPSCO") Global("AC#TradeScolopendra","GLOBAL",0)~
THEN REPLY @4560 EXTERN AC#PPDR1 trade_lesser_scolopendra

// Good Luck, Honeysuckle +3
IF ~PartyHasItem("AC#PP2HA") Global("AC#TradeHoneysuckle","GLOBAL",0)~
THEN REPLY @4561 EXTERN AC#PPDR1 trade_lesser_honeysuckle

// Bard's Love Letter +3
IF ~PartyHasItem("AC#PPBOW") Global("AC#TradeLoveLetter","GLOBAL",0)~
THEN REPLY @4562 EXTERN AC#PPDR1 trade_lesser_loveletter

// Hammer of Powerful Yet Unlikely Blows +4
IF ~PartyHasItem("AC#PPHME") Global("AC#TradeUnlikelyHammer","GLOBAL",0)~
THEN REPLY @4563 EXTERN AC#PPDR1 trade_lesser_unlikelyhammer

// Godcall items

// False Pride +3 (AC#W75SW)
IF ~PartyHasItem("AC#W75SW") Global("AC#TradeFalsePride","GLOBAL",0)~
THEN REPLY @4564 EXTERN AC#PPDR1 trade_legend_falsepride

// Skull Mace (AC#WSKCL)
IF ~PartyHasItem("AC#WSKCL") Global("AC#TradeSkullMace","GLOBAL",0)~
THEN REPLY @4565 EXTERN AC#PPDR1 trade_legend_skullmace

// Flesh and Boils +4 (AC#WFLBO)
IF ~PartyHasItem("AC#WFLBO") Global("AC#TradeFleshBoils","GLOBAL",0)~
THEN REPLY @4566 EXTERN AC#PPDR1 trade_legend_fleshboils

// Meatshaper +3 (AC#WMSHP)
IF ~PartyHasItem("AC#WMSHP") Global("AC#TradeMeatshaper","GLOBAL",0)~
THEN REPLY @4567 EXTERN AC#PPDR1 trade_legend_meatshaper

// Heads +3 (AC#W901)
IF ~PartyHasItem("AC#W901") Global("AC#TradeHeads","GLOBAL",0)~
THEN REPLY @4568 EXTERN AC#PPDR1 trade_legend_heads

// Tails +3 (AC#W902)
IF ~PartyHasItem("AC#W902") Global("AC#TradeTails","GLOBAL",0)~
THEN REPLY @4569 EXTERN AC#PPDR1 trade_legend_tails

// Venom Slicer (AC#W90SC)
IF ~PartyHasItem("AC#W90SC") Global("AC#TradeVenomSlicer","GLOBAL",0)~
THEN REPLY @4570 EXTERN AC#PPDR1 trade_legend_venomslicer

// Bloodblade (AC#W90DG)
IF ~PartyHasItem("AC#W90DG") Global("AC#TradeBloodblade","GLOBAL",0)~
THEN REPLY @4571 EXTERN AC#PPDR1 trade_legend_bloodblade

// Rust Spreader +3 (AC#WRUSP)
IF ~PartyHasItem("AC#WRUSP") Global("AC#TradeRustSpreader","GLOBAL",0)~
THEN REPLY @4572 EXTERN AC#PPDR1 trade_legend_rustspreader

// Heart-Shaped-Razor +3 (AC#WHSRZ)
IF ~PartyHasItem("AC#WHSRZ") Global("AC#TradeHeartRazor","GLOBAL",0)~
THEN REPLY @4573 EXTERN AC#PPDR1 trade_legend_heartrazor
// Mad God items
IF ~PartyHasItem("AC#MGSP1") Global("AC#TradeBlackbite","GLOBAL",0)~
THEN REPLY @4574 EXTERN AC#PPDR1 trade_lesser_blackbite

IF ~PartyHasItem("AC#MGMS1") Global("AC#TradeBonefang","GLOBAL",0)~
THEN REPLY @4575 EXTERN AC#PPDR1 trade_lesser_bonefang

IF ~PartyHasItem("AC#MGAMB") Global("AC#TradeAstralMace","GLOBAL",0)~
THEN REPLY @4576 EXTERN AC#PPDR1 trade_lesser_astralmace

IF ~PartyHasItem("AC#CLKBL") Global("AC#TradeClockworkBlade","GLOBAL",0)~
THEN REPLY @4577 EXTERN AC#PPDR1 trade_lesser_clockworkblade

IF ~PartyHasItem("AC#MGTRH") Global("AC#TradeGrubnuksHand","GLOBAL",0)~
THEN REPLY @4578 EXTERN AC#PPDR1 trade_lesser_grubnuk

IF ~PartyHasItem("AC#MGSCI") Global("AC#TradePrismaticScimitar","GLOBAL",0)~
THEN REPLY @4579 EXTERN AC#PPDR1 trade_lesser_prismaticscimitar

IF ~PartyHasItem("AC#MGHMA") Global("AC#TradeAirHammer","GLOBAL",0)~
THEN REPLY @4580 EXTERN AC#PPDR1 trade_lesser_airhammer

IF ~~ THEN REPLY @4481 EXTERN AC#PPDR1 trade_root  
IF ~~ THEN REPLY @4506 EXTERN AC#PPDR1 trade_root
IF ~~ THEN REPLY @4507 EXTERN AC#PPDR1 no_trade_bye 


// ----- Lesser turn-ins (apply AC#PPH1) -----

CHAIN AC#PPDR1 trade_legend_skullcrusher
@4581
DO ~TakePartyItem("BLUN18")
   SetGlobal("AC#TradeSkullcrusher","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)   
   AddexperienceParty(300)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT


CHAIN AC#PPDR1 trade_legend_thunderbolts
@4582
DO ~TakePartyItem("HAMM07")
   SetGlobal("AC#TradeThunderbolts","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT


CHAIN AC#PPDR1 trade_legend_dwarventhrower
@4583
DO ~TakePartyItem("HAMM06")
   SetGlobal("AC#TradeDwarvenThrower","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT


CHAIN AC#PPDR1 trade_legend_boneblade
@4584
DO ~TakePartyItem("DAGG14")
   SetGlobal("AC#TradeBoneblade","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT


CHAIN AC#PPDR1 trade_legend_blackblood
@4585
DO ~TakePartyItem("BLUN22")
   SetGlobal("AC#TradeBlackblood","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT


CHAIN AC#PPDR1 trade_legend_searing
@4586
DO ~TakePartyItem("SW1H39")
   SetGlobal("AC#TradeSearing","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT


CHAIN AC#PPDR1 trade_legend_azuredge
@4587
DO ~TakePartyItem("AX1H10")
   SetGlobal("AC#TradeAzuredge","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT


CHAIN AC#PPDR1 trade_legend_falsepride
@4588
DO ~TakePartyItem("AC#W75SW")
   SetGlobal("AC#TradeFalsePride","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)    
   AddexperienceParty(300)
~ EXIT

CHAIN AC#PPDR1 trade_legend_skullmace
@4589
DO ~TakePartyItem("AC#WSKCL")
   SetGlobal("AC#TradeSkullMace","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)     
   AddexperienceParty(300)
~ EXIT

CHAIN AC#PPDR1 trade_legend_fleshboils
@4590
DO ~TakePartyItem("AC#WFLBO")
   SetGlobal("AC#TradeFleshBoils","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
  
   AddexperienceParty(300)
~ EXIT

CHAIN AC#PPDR1 trade_legend_meatshaper
@4591
DO ~TakePartyItem("AC#WMSHP")
   SetGlobal("AC#TradeMeatshaper","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)     
   AddexperienceParty(300)
~ EXIT

CHAIN AC#PPDR1 trade_legend_heads
@4592
DO ~TakePartyItem("AC#W901")
   SetGlobal("AC#TradeHeads","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)   
   AddexperienceParty(300)
~ EXIT

CHAIN AC#PPDR1 trade_legend_tails
@4593
DO ~TakePartyItem("AC#W902")
   SetGlobal("AC#TradeTails","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)    
   AddexperienceParty(300)
~ EXIT

CHAIN AC#PPDR1 trade_legend_venomslicer
@4594
DO ~TakePartyItem("AC#W90SC")
   SetGlobal("AC#TradeVenomSlicer","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)     
   AddexperienceParty(300)
~ EXIT

CHAIN AC#PPDR1 trade_legend_bloodblade
@4595
DO ~TakePartyItem("AC#W90DG")
   SetGlobal("AC#TradeBloodblade","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)     
   AddexperienceParty(300)
~ EXIT

CHAIN AC#PPDR1 trade_legend_rustspreader
@4596
DO ~TakePartyItem("AC#WRUSP")
   SetGlobal("AC#TradeRustSpreader","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)     
   AddexperienceParty(300)
~ EXIT


CHAIN AC#PPDR1 trade_legend_heartrazor
@4597
DO ~TakePartyItem("AC#WHSRZ")
   SetGlobal("AC#TradeHeartRazor","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)     
   AddexperienceParty(300)
~ EXIT

CHAIN AC#PPDR1 trade_legend_heartseeker
@4598
DO ~TakePartyItem("BOW10")
   SetGlobal("AC#TradeHeartseeker","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_legend_courtbow
@4599
DO ~TakePartyItem("BOW12")
   SetGlobal("AC#TradeCourtBow","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT


CHAIN AC#PPDR1 trade_legend_impaler
@4600
DO ~TakePartyItem("SPER08")
   SetGlobal("AC#TradeImpaler","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT


CHAIN AC#PPDR1 trade_legend_withering
@4601
DO ~TakePartyItem("SPER10")
   SetGlobal("AC#TradeWithering","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT


CHAIN AC#PPDR1 trade_legend_frostreaver
@4602
DO ~TakePartyItem("AX1H13")
   SetGlobal("AC#TradeFrostreaver","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_lesser_blackbite
@4603
DO ~TakePartyItem("AC#MGSP1")
   SetGlobal("AC#TradeBlackbite","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)
~ EXIT

CHAIN AC#PPDR1 trade_lesser_bonefang
@4604
DO ~TakePartyItem("AC#MGMS1")
   SetGlobal("AC#TradeBonefang","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)
~ EXIT

CHAIN AC#PPDR1 trade_lesser_astralmace
@4605
DO ~TakePartyItem("AC#MGAMB")
   SetGlobal("AC#TradeAstralMace","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)
~ EXIT

CHAIN AC#PPDR1 trade_lesser_clockworkblade
@4606
DO ~TakePartyItem("AC#CLKBL")
   SetGlobal("AC#TradeClockworkBlade","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)
~ EXIT

CHAIN AC#PPDR1 trade_lesser_grubnuk
@4607
DO ~TakePartyItem("AC#MGTRH")
   SetGlobal("AC#TradeGrubnuksHand","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)
~ EXIT

CHAIN AC#PPDR1 trade_lesser_prismaticscimitar
@4608
DO ~TakePartyItem("AC#MGSCI")
   SetGlobal("AC#TradePrismaticScimitar","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)
~ EXIT

CHAIN AC#PPDR1 trade_lesser_airhammer
@4609
DO ~TakePartyItem("AC#MGHMA")
   SetGlobal("AC#TradeAirHammer","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)
~ EXIT

CHAIN AC#PPDR1 trade_lesser_mycologist_blade
@4610
DO ~TakePartyItem("AC#PPSW")
   SetGlobal("AC#TradeMycologistBlade","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)~
EXIT

CHAIN AC#PPDR1 trade_lesser_mirageedge
@4611
DO ~TakePartyItem("AC#PPSCI")
   SetGlobal("AC#TradeMirageEdge","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)~
EXIT

CHAIN AC#PPDR1 trade_lesser_scolopendra
@4612
DO ~TakePartyItem("AC#PPSCO")
   SetGlobal("AC#TradeScolopendra","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)~
EXIT


CHAIN AC#PPDR1 trade_lesser_honeysuckle
@4613
DO ~TakePartyItem("AC#PP2HA")
   SetGlobal("AC#TradeHoneysuckle","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)~
EXIT

CHAIN AC#PPDR1 trade_lesser_loveletter
@4614
DO ~TakePartyItem("AC#PPBOW")
   SetGlobal("AC#TradeLoveLetter","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)~
EXIT

CHAIN AC#PPDR1 trade_lesser_unlikelyhammer
@4615
DO ~TakePartyItem("AC#PPHME")
   SetGlobal("AC#TradeUnlikelyHammer","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)~
EXIT

CHAIN AC#PPDR1 trade_lesser_jhor
@4616
DO ~TakePartyItem("SW1H38")
   SetGlobal("AC#TradeL_Jhor","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_lesser_bladeroses
@4617
DO ~TakePartyItem("SW1H40")
   SetGlobal("AC#TradeL_BladeRoses","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_lesser_stonefire
@4618
DO ~TakePartyItem("AX1H12")
   SetGlobal("AC#TradeL_Stonefire","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_lesser_rifthome
@4619
DO ~TakePartyItem("AX1H09")
   SetGlobal("AC#TradeL_Rifthome","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_lesser_dragonsbreath
@4620
DO ~TakePartyItem("HALB04")
   SetGlobal("AC#TradeL_DragBreath","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_lesser_wave
@4621
DO ~TakePartyItem("HALB09")
   SetGlobal("AC#TradeL_WaveHalb","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_lesser_ras
@4622
DO ~TakePartyItem("SW1H33")
   SetGlobal("AC#TradeL_Ras","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_lesser_pixie
@4623
DO ~TakePartyItem("DAGG13")
   SetGlobal("AC#TradeL_PixiePrick","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_lesser_cutthroat
@4624
DO ~TakePartyItem("SW1H33")
   SetGlobal("AC#TradeL_Cutthroat","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_lesser_spectral
@4625
DO ~TakePartyItem("SW1H68")
   SetGlobal("AC#TradeL_SpectralBrand","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_lesser_adjatha
@4626
DO ~TakePartyItem("SW1H35")
   SetGlobal("AC#TradeL_Adjatha","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_lesser_chaos
@4627
DO ~TakePartyItem("SW2H16")
   SetGlobal("AC#TradeL_SwordChaos","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_lesser_albruin
@4628
DO ~TakePartyItem("SW1H34")
   SetGlobal("AC#TradeL_Albruin","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_lesser_flame
@4629
DO ~TakePartyItem("SW1H53")
   SetGlobal("AC#TradeL_SwordFlame","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_lesser_daystar
@4630
DO ~TakePartyItem("SW1H31")
   SetGlobal("AC#TradeL_Daystar","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_lesser_ssbackstab
@4631
DO ~TakePartyItem("SW1H10")
   SetGlobal("AC#TradeL_SSBackstab","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_lesser_belm
@4632
DO ~TakePartyItem("SW1H30")
   SetGlobal("AC#TradeL_Belm","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_lesser_dagvenom
@4633
DO ~TakePartyItem("MISC75")
   SetGlobal("AC#TradeL_DagVenom","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   IncrementGlobal("AC#PPTradeItems","GLOBAL",1)  
   AddexperienceParty(300)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT


// Lesser refresh: loop if more lesser remain; else back to root
CHAIN IF ~~ THEN AC#PPDR1 trade_lesser_refresh
@4634
END
  IF ~~ THEN REPLY @4635 EXTERN AC#PPDR1 trade_lesser_menu
  IF ~~ THEN REPLY @4526 EXTERN AC#PPDR1 trade_root
  IF ~~ THEN REPLY @4482 EXTERN AC#PPDR1 no_trade_bye
	

