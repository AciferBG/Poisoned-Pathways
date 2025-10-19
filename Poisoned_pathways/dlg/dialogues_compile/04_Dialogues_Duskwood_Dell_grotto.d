// dryad in area acpp06 (Eldath's Peace Grotto):
BEGIN ~AC#PPDR1~ //Dryad
BEGIN ~AC#PPFI1~ //Fighter
BEGIN ~AC#PPCHT~ // Cheat code creature for testing the grotto system

CHAIN
IF ~true()~ THEN AC#PPCHT AC#PPCHT_intro
~Greetings. What treasures do you seek? I can offer you all legendary weapons—or the common relics of battle.~
END
IF ~~ THEN REPLY ~Give me the legendary weapons.~ DO ~StartCutScene("AC#PPCH1")~ EXIT
IF ~~ THEN REPLY ~Give me the other weapons.~ DO ~StartCutScene("AC#PPCH2")~ EXIT
IF ~~ THEN REPLY ~Nothing today.~ EXIT


// Dialogue in Eldath’s Grotto – between a dryad (AC#PPDR1) and a repentant warrior (AC#PPFI1)

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#PPFI1 hello_peace
~I’ve carried steel and blood on my hands for too many years... I want it to end. No more battles. No more killing.~
==AC#PPDR1 ~Then lay down your weapon, brave one, and let the weight of war drift away like leaves upon a gentle current. The Mother of Groves does not judge the past—only the courage to choose stillness now.~
==AC#PPFI1 ~So... let this tool of destruction rest. May my hands learn to heal instead of harm.~
==AC#PPDR1 ~Eldath smiles upon your choice. Drink of Her blessed waters and walk on unburdened, with soft moss to cradle every step.~
==AC#PPFI1 ~I feel... relieved...~
DO ~CreateVisualEffectObject("SPHEALIN",Myself)
DropInventory()
DestroyItem("PLAT01")
DestroyItem("HELM01")
EscapeAreaDestroy(3)~
EXIT

// Dryad in Eldath's grotto main dialogues

// Dialogue: Offering to trade named weapons for Eldath's blessing
CHAIN IF ~Global("AC#PP_TradeWeapons","GLOBAL",1)~ THEN AC#PPDR1 hello_trade_weapons
~A word with you, <PRO_RACE>. I see your weapons. Though I may not understand it, I can tell you cannot yet part with those you bear—at least not all of them. Others, perhaps, you could.~
END
IF ~~ THEN REPLY ~What do you mean by that?~ DO ~SetGlobal("AC#PP_TradeWeapons","GLOBAL",2)~ EXTERN AC#PPDR1 trade_weapons_02
IF ~~ THEN REPLY ~Could you perhaps be a little less cryptic?~ DO ~SetGlobal("AC#PP_TradeWeapons","GLOBAL",2)~ EXTERN AC#PPDR1 trade_weapons_02
IF ~~ THEN REPLY ~That sounds interesting.~ DO ~SetGlobal("AC#PP_TradeWeapons","GLOBAL",2)~ EXTERN AC#PPDR1 trade_weapons_02
IF ~~ THEN REPLY ~I have no interest in this conversation. Farewell.~ EXTERN AC#PPDR1 bye_trade_weapons

CHAIN IF ~~ THEN AC#PPDR1 bye_trade_weapons
~As you wish. Farewell.~
DO ~SetGlobal("AC#PP_TradeWeapons","GLOBAL",10)~
EXIT

CHAIN IF ~~ THEN AC#PPDR1 trade_weapons_02
~It is rare that people like you pass through here—those who do not seek peace, but simply move on. You have seen many battles, of that I am sure. And you have collected many weapons whose former owners are no longer among the living.~
END
IF ~~ THEN EXTERN AC#PPDR1 trade_weapons_03

CHAIN IF ~~ THEN AC#PPDR1 trade_weapons_03
~You gather these weapons, sell them, and a new hand wields them to bring more death and suffering. It does not have to be so—not anymore.~
END
IF ~~ THEN EXTERN AC#PPDR1 trade_weapons_04

CHAIN IF ~~ THEN AC#PPDR1 trade_weapons_04
~If you were to bring all the weapons you have gathered here, they would harm no one again. In Eldath’s embrace, they shall be kept safe. It costs you nothing—you will still keep your own arms. But those you no longer need, leave them here.~
== KORGANJ IF ~InParty("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN ~Hah! Strip myself of spoils after battle? Ye ask a warrior’s folly.~ 
END
IF ~~ THEN REPLY ~You want to take all the weapons I find from my enemies?~ EXTERN AC#PPDR1 trade_weapons_05
IF ~~ THEN REPLY ~What do I get in return?~ EXTERN AC#PPDR1 trade_weapons_what_do_i_get
IF ~~ THEN REPLY ~I have no interest in this conversation. Farewell.~ EXTERN AC#PPDR1 bye_trade_weapons

CHAIN IF ~~ THEN AC#PPDR1 trade_weapons_05
~Not all weapons—that would be more than even our sacred grove could bear. No, I mean the special ones, the unique ones. Those that have been swung in hundreds of battles, that have taken hundreds of lives. Bring such weapons here, and Eldath will bless you.~
== AerieJ IF ~InParty("aerie") !StateCheck("aerie",CD_STATE_NOTVALID)~ THEN ~That... that sounds right. So much pain lingers in these blades. To put them to rest would be a kindness.~
== KeldorJ IF ~InParty("keldorn") !StateCheck("keldorn",CD_STATE_NOTVALID)~ THEN ~A wise proposal. Far too many weapons of dread pass from hand to hand, leaving only grief behind.~
== BEDWIN IF ~InParty("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN ~Yes, splendid. Let us all hand our power to the shrubbery. Truly, a masterstroke of silly strategy.~
== DORNJ IF ~InParty("Dorn") !StateCheck("Dorn",CD_STATE_NOTVALID)~ THEN ~What weak sentiment. Weapons are meant to kill. I will not coddle blades that thirst for blood.~
== NEERAJ IF ~InParty("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID)~ THEN ~Uh. I dunno. I kind of like collecting weird, dangerous weapons. Makes me feel sparkly.~
== HAERDAJ IF ~InParty("HaerDalis") !StateCheck("HaerDalis",CD_STATE_NOTVALID)~ THEN ~Blades thirst for blood, but even thirst can be slaked. To trade the clamor of battle for the hush of leaves...how sweet the verse.~
== JaheiraJ IF ~InParty("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN ~One less blade sowing bloodshed—such is a gain for the balance. I will not stand against it.~
== CERNDJ IF ~InParty("Cernd") !StateCheck("Cernd",CD_STATE_NOTVALID)~ THEN ~In the harmony of the grove, the echoes of steel may be quieted at last. This is well.~
END
IF ~~ THEN REPLY ~What do I get in return?~ EXTERN AC#PPDR1 trade_weapons_what_do_i_get
IF ~~ THEN REPLY ~I never would have guessed you deal in weapons.~ EXTERN AC#PPDR1 trade_weapons_what_do_i_get
IF ~~ THEN REPLY ~Selling those weapons is how I make my living!~ EXTERN AC#PPDR1 trade_weapons_what_do_i_get

CHAIN IF ~~ THEN AC#PPDR1 trade_weapons_what_do_i_get
~I cannot give you gold. But Eldath’s blessing is yours to take. With each weapon you surrender, she will grace you—granting you life and vitality beyond what killing alone could bring. With every blade you give up, you grow and thrive, even as others will *not* die by it anymore.~ 
END
IF ~~ THEN EXTERN AC#PPDR1 trade_weapons_hub

CHAIN IF ~~ THEN AC#PPDR1 trade_weapons_hub
~One less weapon, more life for you—that is Eldath’s bargain.~
END
IF ~~ THEN REPLY ~Which weapons exactly are we talking about?~ EXTERN AC#PPDR1 trade_weapons_which_weapons
IF ~~ THEN REPLY ~You want to take all the weapons I find from my enemies?~ EXTERN AC#PPDR1 trade_weapons_05
IF ~~ THEN REPLY ~You must be clearer about what I gain from this trade.~ EXTERN AC#PPDR1 trade_weapons_exact_benefit

	CHAIN IF ~~ THEN AC#PPDR1 trade_weapons_exact_benefit
	~Weapons take life. Eldath gives life. If you give up a weapon, your life force will increase—a little more with each one surrendered.~
	END
	IF ~~ THEN REPLY ~Which weapons exactly are we talking about?~ EXTERN AC#PPDR1 trade_weapons_which_weapons
	IF ~~ THEN REPLY ~Not a chance!~ EXTERN AC#PPDR1 bye_trade_weapons

CHAIN IF ~~ THEN AC#PPDR1 trade_weapons_which_weapons
~You will know them—the weapons that bear a name. A named weapon has claimed many lives. Such weapons will earn you Eldath’s blessing.~  
=  
~And those that have already become legend will grant you even greater vitality. So, what do you say?~
END
IF ~~ THEN REPLY ~Let's see if I have any weapons to offer Eldath.~ EXTERN AC#PPDR1 trade_root
IF ~~ THEN REPLY ~You must be clearer about what I gain from this trade.~ EXTERN AC#PPDR1 trade_weapons_exact_benefit
IF ~~ THEN REPLY ~I will think on it.~ EXTERN AC#PPDR1 trade_think_about_it
IF ~~ THEN REPLY ~If this brings honor to Eldath, I shall gladly leave a blade or two behind.~ EXTERN AC#PPDR1 trade_think_about_it
IF ~~ THEN REPLY ~Not a chance!~ EXTERN AC#PPDR1 bye_trade_weapons

CHAIN IF ~~ THEN AC#PPDR1 trade_think_about_it
~I ask no more of you. Whenever you find a blade you will not wield yourself, think of Eldath—and take the chance to carry peace into the world. Farewell, <PRO_RACE>.~
EXIT


CHAIN IF ~True()~ THEN AC#PPDR1 hello_01
~Greetings, <RACE>. Have you come to lay down your arms and receive the blessing of the Goddess?~ 
END
IF~Global("NPC_ThrowWeapon","ACPP06",0)~THEN REPLY ~What is this place?~ EXTERN AC#PPDR1 what_place
IF~Global("NPC_ThrowWeapon","ACPP06",1)~THEN REPLY ~What is this place?~ EXTERN AC#PPDR1 what_place_2
IF~~THEN REPLY ~Who are you?~ EXTERN AC#PPDR1 who_are_you
IF~~THEN REPLY ~I think I'll be going now.~ EXTERN AC#PPDR1 bye
IF~Global("AC#PP_TradeWeapons","GLOBAL",2)~THEN REPLY ~I have weapons I’d like to lay to rest here.~ EXTERN AC#PPDR1 trade_root
IF~Global("AC#PP_TradeWeapons","GLOBAL",2)~THEN REPLY ~Remind me, how was it again with the weapons I was to give you?~ EXTERN AC#PPDR1 trade_weapons_hub
IF ~Global("AC#PP_HolyWater","GLOBAL",1)~ THEN REPLY ~Your High Priest has sent me. I am to collect a carafe of Eldath’s sacred singing water.~ EXTERN AC#PPDR1 need_singing_water
IF ~Global("AC#PP_GiveBlade","GLOBAL",1) !Dead("AC#PPWYR")~ THEN REPLY ~I was told to collect a weapon here, one said to aid me against the undead.~ EXTERN AC#PPDR1 need_blade_01

CHAIN IF ~~ THEN AC#PPDR1 need_blade_01
~You seek the blade that may wound only dead flesh? I can scarce believe the Fallskeeper allowed it. Weapons laid down here are meant to rest forever.~  
END
IF ~~ THEN REPLY ~Then this time, it shall be otherwise.~ EXTERN AC#PPDR1 need_blade_02
IF ~~ THEN REPLY ~I would not ask, were it not urgent.~ EXTERN AC#PPDR1 need_blade_02
IF ~~ THEN REPLY ~Enough of this prattle. Give me the blade that is mine by right!~ EXTERN AC#PPDR1 need_blade_unfriendly
IF ~Global("AC#PP_ReturnBlade","GLOBAL",1)~ THEN REPLY ~I have sworn to return it once the battle is done.~ EXTERN AC#PPDR1 need_blade_give_back_later

CHAIN IF ~~ THEN AC#PPDR1 need_blade_give_back_later
~Very well. If you vow to wield it only against dead flesh, then mayhap the Fallskeeper had reason to entrust it to you.~  
END
IF ~~ THEN EXTERN AC#PPDR1 need_blade_02

CHAIN IF ~~ THEN AC#PPDR1 need_blade_unfriendly
~Such rudeness! What was the Fallskeeper thinking, to permit you this? Still... it is not mine to decide.~  
END
IF ~~ THEN EXTERN AC#PPDR1 need_blade_02

CHAIN IF ~~ THEN AC#PPDR1 need_blade_02
~Here is the weapon. It is called the Memory of the Myths. Treat it with care.~  
DO ~SetGlobal("AC#PP_GiveBlade","GLOBAL",10)  
GiveItemCreate("AC#PPMYT",Player1,1,0,0)~ EXIT

	CHAIN IF ~~ THEN AC#PPDR1 need_singing_water
	~The singing water? Of course. Here it is — handle it with care, for it is as precious as the peace it brings.~
	DO ~SetGlobal("AC#PP_HolyWater","GLOBAL",10)
	GiveItemCreate("AC#PPWA",Player1,1,0,0)
	AddJournalEntry(@12106,QUEST_DONE)~ EXIT


	CHAIN IF ~~ THEN AC#PPDR1 who_are_you
	~I am a spirit bound to this grove. Long ago, Eldath’s touch calmed my frightened heart, and since then I serve as her gentle warden here. My soul is tied to its waters and the quiet breath of Eldath herself.~ 
	END
	IF~Global("NPC_ThrowWeapon","ACPP06",0)~THEN REPLY ~What is this place?~ EXTERN AC#PPDR1 what_place
	IF~Global("NPC_ThrowWeapon","ACPP06",1)~THEN REPLY ~What is this place?~ EXTERN AC#PPDR1 what_place_2
	IF~~THEN REPLY ~I think I'll be going now.~ EXTERN AC#PPDR1 bye
	

	CHAIN IF ~~ THEN AC#PPDR1 what_place
	~This is Eldath’s sacred grotto, where absolute peace prevails.~
	=~Here, many brave warriors have chosen to abandon their trade and follow the path of peace instead. Do you see the many weapons? Each one once belonged to a soul whose life was shaped by war and bloodshed—until they laid down their arms here and chose a different path.~
	== AnomenJ IF ~InParty("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN ~All these weapons just thrown aside? So much steel, wasted... I can’t decide if it’s inspiring or foolish.~
	== MazzyJ IF ~InParty("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN ~Peace is well and good—until the next pack of bandits shows up. Then what? Sing them to death?~
	== DORNJ IF ~InParty("Dorn") !StateCheck("Dorn",CD_STATE_NOTVALID)~ THEN ~A sword keeps you alive. Giving it up? That’s as good as digging your own grave.~
	== KeldorJ IF ~InParty("keldorn") !StateCheck("keldorn",CD_STATE_NOTVALID)~ THEN ~That’s... admirable. To turn away from war takes more courage than swinging a blade ever could.~
	END
	IF~~THEN DO ~SetGlobal("NPC_ThrowWeapon","ACPP06",1)~ EXTERN AC#PPDR1 throw_weapon_too
	
		CHAIN IF ~~ THEN AC#PPDR1 what_place_2
	~This is Eldath’s sacred grotto, where absolute peace prevails.~
	= ~Here, many brave warriors have chosen to abandon their trade and follow the path of peace instead. Do you see the many weapons? Each one once belonged to a soul whose life was shaped by war and bloodshed—until they laid down their arms here and chose a different path.~
	END
	IF~~THEN EXTERN AC#PPDR1 throw_weapon_too

	CHAIN IF ~~ THEN AC#PPDR1 throw_weapon_too
	~Have you come to lay down your weapons here as well, in the name of peace?~
	END
	
	IF~~THEN REPLY ~Tempus forbid, no!~ EXTERN AC#PPDR1 weapon_01
	IF~~THEN REPLY ~To each their own, but I prefer keeping my weapon close at hand.~ EXTERN AC#PPDR1 weapon_01
	IF~~THEN REPLY ~If I could, I would... but I’m not ready yet.~ EXTERN AC#PPDR1 weapon_01
	IF~~THEN REPLY ~Let’s just hope none of them regret leaving their blades behind someday.~ EXTERN AC#PPDR1 weapon_01
	IF~~THEN REPLY ~You don’t mind if I take a look at those weapons, do you? Maybe one or two could still be of use to me.~ EXTERN AC#PPDR1 take_some_weapons
	IF~~THEN REPLY ~I think I'll be going now.~ EXTERN AC#PPDR1 bye
	
	CHAIN IF ~~ THEN AC#PPDR1 weapon_01
	~Peace is never forced here. Whether you hold a blade or set it down, only your heart can choose its path.~ 
	END
	IF~~THEN REPLY ~I think I'll be going now.~ EXTERN AC#PPDR1 bye
	
	
		CHAIN IF ~~ THEN AC#PPDR1 take_some_weapons
		~These weapons have already tasted blood. Whether they lie here or in your hands makes little difference to the past. Peace cannot be forced on the unwilling.~ 
		END
		IF~~THEN REPLY ~Do you perhaps keep any special weapons here—ones I might put to use?~ EXTERN AC#PPDR1 spectral_blade
		IF~~THEN REPLY ~Then I’ll take a look around, see if anything’s worth keeping.~ EXTERN AC#PPDR1 bye
		IF~~THEN REPLY ~I think I'll be going now.~ EXTERN AC#PPDR1 bye
		
		
		CHAIN IF ~~ THEN AC#PPDR1 spectral_blade
		~A single blade among these still hums with ancient grief. It carries the weight of old vows, sworn in battles long past. If you are truly set on walking a path against the dead, it may answer your call. Perhaps it waits for someone bold enough to wield it once more.~ 
		END
		IF~~THEN REPLY ~Could you give it to me?~ EXTERN AC#PPDR1 give_spectral_blade
		IF~~THEN REPLY ~I think I'll be going now.~ EXTERN AC#PPDR1 bye
		
		
			CHAIN IF ~~ THEN AC#PPDR1 give_spectral_blade
			~No, not yet. You are not ready for such a burden. If fate wills it, it will one day rest in your grasp. Be patient... perhaps, in time, you'll be chosen to wield the blade.~ 
			END
			IF~~THEN REPLY ~Then I’ll prove myself, no matter what trials lie ahead.~ EXTERN AC#PPDR1 bye
			IF~~THEN REPLY ~If it’s waiting for someone bold and handsome, I think I’m already the best candidate, but let's wait.~ EXTERN AC#PPDR1 bye
			IF~~THEN REPLY ~I think I'll be going now.~ EXTERN AC#PPDR1 bye
			

	CHAIN IF ~~ THEN AC#PPDR1 bye
	~Peace to you, traveler. May your path be soft beneath your feet.~
	EXIT	
	
	CHAIN IF ~~ THEN AC#PPDR1 no_trade_bye
	~Return when you have weapons you wish to lay to rest.~ 
	EXIT
	
// =====================================================
// Eldath Dryad – Weapon Cleansing Trade Hub (cleaned)
// Legendary: +2 Max HP (AC#PPH2) + 1% Resist (AC#PPGR) + XP
// Lesser:    +1 Max HP (AC#PPH1) + XP
// =====================================================

// ---------- ROOT ----------
CHAIN IF ~~ THEN AC#PPDR1 trade_root
~So, you wish to trade a weapon for a bit more of your life? Eldath accepts all offerings.~
END
		IF ~~ THEN REPLY ~I’d like to give you a famous weapon.~ EXTERN AC#PPDR1 trade_lesser_menu
		IF ~~ THEN REPLY ~I’d like to give you a legendary weapon.~ EXTERN AC#PPDR1 trade_legend_menu
		IF ~~ THEN REPLY ~It seems I carry no weapon that I could leave here.~ EXTERN AC#PPDR1 no_trade_bye
		IF ~~ THEN REPLY ~Not now.~ EXTERN AC#PPDR1 no_trade_bye
		IF ~~ THEN REPLY ~What do I gain from this?~ EXTERN AC#PPDR1 trade_gain

	CHAIN IF ~~ THEN AC#PPDR1 trade_gain
	~You shall receive Eldath’s blessing — your life will grow a little stronger.~
	END
	IF ~~ THEN REPLY ~Could you be a bit more specific?~ EXTERN AC#PPDR1 trade_gain_02
	IF ~~ THEN REPLY ~That’s all I wanted to know.~ EXTERN AC#PPDR1 trade_root
	IF ~~ THEN REPLY ~I’ve changed my mind and will be on my way now.~ EXTERN AC#PPDR1 no_trade_bye

	  
	  CHAIN IF ~~ THEN AC#PPDR1 trade_gain_02
    ~With each weapon surrendered, you’ll feel your life grow—just a little for a lesser blade, more for a legendary one. Only Eldath knows the true worth of each weapon that vanishes from the world.~
	END
	IF ~~ THEN REPLY ~That’s all I wanted to know.~ EXTERN AC#PPDR1 trade_root
	IF ~~ THEN REPLY ~I’ve changed my mind and will be on my way now.~ EXTERN AC#PPDR1 no_trade_bye

// =====================================================
// LEGENDARY BRANCH
// =====================================================

CHAIN IF ~~ THEN AC#PPDR1 trade_legend_menu
~Legendary blades have stirred armies and sundered vows. Which of these weapons will you lay down?~
END
	//Equalizer
  IF ~PartyHasItem("SW1H54") Global("AC#TradeEqualizer","GLOBAL",0)~
  THEN REPLY ~The Equalizer balanced nothing but corpses. Let the water end its argument.~ EXTERN AC#PPDR1 trade_legend_equalizer
  
	//Carsomyr
  IF ~PartyHasItem("SW2H10") Global("AC#TradeCarsomyr","GLOBAL",0)~
  THEN REPLY ~Carsomyr’s zeal cuts too deep. I surrender it to stillness.~ EXTERN AC#PPDR1 trade_legend_carsomyr
  
	//Flail of Ages
  IF ~PartyHasItem("BLUN14") Global("AC#TradeFoA","GLOBAL",0)~
  THEN REPLY ~The Flail of Ages bound three tempests to war; unbind it here.~ EXTERN AC#PPDR1 trade_legend_foa

	//Crom Faeyr
  IF ~PartyHasItem("HAMM09") Global("AC#TradeCrom","GLOBAL",0)~
  THEN REPLY ~Crom Faeyr shook mountains; let it trouble roots and moss no more.~ EXTERN AC#PPDR1 trade_legend_crom

	//Soul Reaver
  IF ~PartyHasItem("SW2H08") Global("AC#TradeSoulReaver","GLOBAL",0)~
  THEN REPLY ~Soul Reaver drinks hope; I give it to waters that heal.~ EXTERN AC#PPDR1 trade_legend_soulreaver

	//Blackrazor
  IF ~PartyHasItem("MISCBC") Global("AC#TradeBlackrazor","GLOBAL",0)~
  THEN REPLY ~Blackrazor whispers of hunger. May the pool teach it silence.~ EXTERN AC#PPDR1 trade_legend_blackrazor

	//Lilarcor
  IF ~PartyHasItem("SW2H14") Global("AC#TradeLilarcor","GLOBAL",0)~
  THEN REPLY ~I can’t stand Lilarcor's chatter anymore. Take it. If anyone can hush it, it’s you.~ EXTERN AC#PPDR1 trade_legend_lilarcor
  
  //Celestial Fury
  IF ~PartyHasItem("SW1H51") Global("AC#TradeCelFury","GLOBAL",0)~
  THEN REPLY ~Celestial Fury’s thunder belongs to the sky, not to wandering hands.~ EXTERN AC#PPDR1 trade_legend_celestialfury

// Warblade +4 (SW2H09)
IF ~PartyHasItem("SW2H09") Global("AC#TradeWarblade","GLOBAL",0)~
THEN REPLY ~I offer the Warblade—its edge has tasted enough blood.~ EXTERN AC#PPDR1 trade_legend_warblade

// Silver Sword (SW2H15)
IF ~PartyHasItem("SW2H15") Global("AC#TradeSilverSword","GLOBAL",0)~
THEN REPLY ~Take the Silver Sword—may it claim no more minds or lives.~ EXTERN AC#PPDR1 trade_legend_silversword

// Shortbow of Gesen (BOW19)
IF ~PartyHasItem("BOW19") Global("AC#TradeGesen","GLOBAL",0)~
THEN REPLY ~The Shortbow of Gesen—let its lightning sleep in peace.~ EXTERN AC#PPDR1 trade_legend_gesen

// Icingdeath +3 (SW1H15) — Drizzt’s blade
IF ~PartyHasItem("SW1H15") Global("AC#TradeIcingdeath","GLOBAL",0)~
THEN REPLY ~Even Icingdeath’s chill should rest now.~ EXTERN AC#PPDR1 trade_legend_icingdeath

// Twinkle (SW1H16) — Drizzt’s blade
IF ~PartyHasItem("SW1H16") Global("AC#TradeTwinkle","GLOBAL",0)~
THEN REPLY ~Twinkle’s light can fade in peace here.~ EXTERN AC#PPDR1 trade_legend_twinkle

// Staff of the Magi (STAF11)
IF ~PartyHasItem("STAF11") Global("AC#TradeSotM","GLOBAL",0)~
THEN REPLY ~Even the Staff of the Magi can be laid to rest.~ EXTERN AC#PPDR1 trade_legend_sotm

// Doomed Loser +5 (AC#WSW50)
IF ~PartyHasItem("AC#WSW50") Global("AC#TradeDoomedLoser","GLOBAL",0)~
THEN REPLY ~This blade calls itself the Doomed Loser. Let it vanish into still waters instead.~ EXTERN AC#PPDR1 trade_legend_doomedloser

// Flayer Slayer
IF ~PartyHasItem("AC#MGFL") Global("AC#TradeFlayerSlayer","GLOBAL",0)~
  THEN REPLY ~The Flayer Slayer has cleaved through horrors best left forgotten. Let Eldath’s waters wash its memory away.~ EXTERN AC#PPDR1 trade_legend_flayerslayer
  
IF ~~ THEN REPLY ~It seems I carry no weapon that I could leave here.~ EXTERN AC#PPDR1 trade_root  
IF ~~ THEN REPLY ~Perhaps we should start over, then.~ EXTERN AC#PPDR1 trade_root
IF ~~ THEN REPLY ~I changed my mind and will leave. Farewell.~ EXTERN AC#PPDR1 no_trade_bye 

CHAIN AC#PPDR1 trade_legend_flayerslayer
~Some battles leave wounds that no healer can close—save time and stillness.~
DO ~TakePartyItem("AC#MGFL")
   SetGlobal("AC#TradeFlayerSlayer","GLOBAL",1)
   ApplySpellRES("AC#PPH2",Player1)
   ApplySpellRES("AC#PPGR",Player1)
   AddexperienceParty(1000)
~ EXIT

CHAIN AC#PPDR1 trade_legend_doomedloser
~By Eldath… a sword that flees after failure. What a cruel jest of the Abyss. Let it trouble no hands again.~
DO ~TakePartyItem("AC#WSW50")
   SetGlobal("AC#TradeDoomedLoser","GLOBAL",1)
   ApplySpellRES("AC#PPH2",Player1)
   ApplySpellRES("AC#PPGR",Player1)
   AddexperienceParty(1000)
~ EXIT

CHAIN AC#PPDR1 trade_legend_silversword
~A gleam that severed thought and fate; let it fade beneath still waters.~
DO ~TakePartyItem("SW2H15")
   SetGlobal("AC#TradeSilverSword","GLOBAL",1)
   ApplySpellRES("AC#PPH2",Player1)
   ApplySpellRES("AC#PPGR",Player1)
   AddexperienceParty(1000)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT


CHAIN AC#PPDR1 trade_legend_gesen
~Storms belong to the sky, not the vein. The pool will quiet its spark.~
DO ~TakePartyItem("BOW19")
   SetGlobal("AC#TradeGesen","GLOBAL",1)
   ApplySpellRES("AC#PPH2",Player1)
   ApplySpellRES("AC#PPGR",Player1)
   AddexperienceParty(1000)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_legend_icingdeath
~A famed frost laid to thaw; may peace melt its legend to quiet.~
DO ~TakePartyItem("SW1H15")
   SetGlobal("AC#TradeIcingdeath","GLOBAL",1)
   ApplySpellRES("AC#PPH2",Player1)
   ApplySpellRES("AC#PPGR",Player1)
   AddexperienceParty(1000)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_legend_twinkle
~Brightness is not always kindness; let gentler stars watch over it.~
DO ~TakePartyItem("SW1H16")
   SetGlobal("AC#TradeTwinkle","GLOBAL",1)
   ApplySpellRES("AC#PPH2",Player1)
   ApplySpellRES("AC#PPGR",Player1)
   AddexperienceParty(1000)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_legend_sotm
~Great power stirs great tempests; here, it will know still waters.~
DO ~TakePartyItem("STAF11")
   SetGlobal("AC#TradeSotM","GLOBAL",1)
   ApplySpellRES("AC#PPH2",Player1)
   ApplySpellRES("AC#PPGR",Player1)
   AddexperienceParty(1000)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_legend_warblade
~Steel that fed on war should sleep, not sing. Let the grove still its hunger.~
DO ~TakePartyItem("SW2H09")
   SetGlobal("AC#TradeWarblade","GLOBAL",1)
   ApplySpellRES("AC#PPH2",Player1)
   ApplySpellRES("AC#PPGR",Player1)
   AddexperienceParty(1000)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_legend_equalizer
~Endless balance sought through endless strife... let the water end the argument.~
DO ~TakePartyItem("SW1H54")
   SetGlobal("AC#TradeEqualizer","GLOBAL",1)
   ApplySpellRES("AC#PPH2",Player1)
   ApplySpellRES("AC#PPGR",Player1)
   AddexperienceParty(1000)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_legend_carsomyr
~Holy or not, such a sword has ended many lives. Be still now.~
DO ~TakePartyItem("SW2H10")
   SetGlobal("AC#TradeCarsomyr","GLOBAL",1)
   ApplySpellRES("AC#PPH2",Player1)
   ApplySpellRES("AC#PPGR",Player1)
   AddexperienceParty(1000)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_legend_foa
~Shards of three tempests belong in one calm pool.~
DO ~TakePartyItem("BLUN14")
   SetGlobal("AC#TradeFoA","GLOBAL",1)
   ApplySpellRES("AC#PPH2",Player1)
   ApplySpellRES("AC#PPGR",Player1)
   AddexperienceParty(1000)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_legend_crom
~Strength that breaks mountains can also break the quiet. Lay it down.~
DO ~TakePartyItem("HAMM09")
   SetGlobal("AC#TradeCrom","GLOBAL",1)
   ApplySpellRES("AC#PPH2",Player1)
   ApplySpellRES("AC#PPGR",Player1)
   AddexperienceParty(1000)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_legend_soulreaver
~A draught of despair clings to this steel. The moss will drink it away.~
DO ~TakePartyItem("SW2H08")
   SetGlobal("AC#TradeSoulReaver","GLOBAL",1)
   ApplySpellRES("AC#PPH2",Player1)
   ApplySpellRES("AC#PPGR",Player1)
   AddexperienceParty(1000)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_legend_blackrazor
~Hush. Your hunger will trouble the grove no longer.~
DO ~TakePartyItem("MISCBC")
   SetGlobal("AC#TradeBlackrazor","GLOBAL",1)
   ApplySpellRES("AC#PPH2",Player1)
   ApplySpellRES("AC#PPGR",Player1)
   AddexperienceParty(1000)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_legend_celestialfury
~Thunder belongs to the sky, not to mortal tempers. Sleep now.~
DO ~TakePartyItem("SW1H51")
   SetGlobal("AC#TradeCelFury","GLOBAL",1)
   ApplySpellRES("AC#PPH2",Player1)
   ApplySpellRES("AC#PPGR",Player1)
   AddexperienceParty(1000)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_legend_lilarcor
~Even in silence, I hear the chatter. The pool will teach you quiet.~
DO ~TakePartyItem("SW2H14")
   SetGlobal("AC#TradeLilarcor","GLOBAL",1)
   ApplySpellRES("AC#PPH2",Player1)
   ApplySpellRES("AC#PPGR",Player1)
   //DisplayString(Player1,@908)
   //DisplayString(Player1,@909)
   AddexperienceParty(1000)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT 

CHAIN IF ~~ THEN AC#PPDR1 trade_legend_refresh
~The pool is ready for another burden of legend.~
END
  IF ~~ THEN REPLY ~I have another legendary blade.~ EXTERN AC#PPDR1 trade_legend_menu
  IF ~~ THEN REPLY ~Perhaps we can start over.~ EXTERN AC#PPDR1 trade_root
  IF ~~ THEN REPLY ~Not now.~ EXTERN AC#PPDR1 no_trade_bye
 

// =====================================================
// LESSER / OTHER BRANCH
// =====================================================

CHAIN IF ~~ THEN AC#PPDR1 trade_lesser_menu
~A wise decision. Which magical weapons will you surrender?~
END

// Skullcrusher +3 (BLUN18)
IF ~PartyHasItem("BLUN18") Global("AC#TradeSkullcrusher","GLOBAL",0)~
THEN REPLY ~The Skullcrusher belongs where skulls are safe. Take it.~ EXTERN AC#PPDR1 trade_legend_skullcrusher

// Hammer of Thunderbolts +3 (HAMM07)
IF ~PartyHasItem("HAMM07") Global("AC#TradeThunderbolts","GLOBAL",0)~
THEN REPLY ~The Hammer of Thunderbolts should thunder no more.~ EXTERN AC#PPDR1 trade_legend_thunderbolts

// Dwarven Thrower +3 (HAMM06)
IF ~PartyHasItem("HAMM06") Global("AC#TradeDwarvenThrower","GLOBAL",0)~
THEN REPLY ~Let the Dwarven Thrower find stillness here.~ EXTERN AC#PPDR1 trade_legend_dwarventhrower

// Boneblade +4 (DAGG14)
IF ~PartyHasItem("DAGG14") Global("AC#TradeBoneblade","GLOBAL",0)~
THEN REPLY ~The Boneblade has feasted on enough death. Keep it safe.~ EXTERN AC#PPDR1 trade_legend_boneblade

// Blackblood +3 (BLUN22)
IF ~PartyHasItem("BLUN22") Global("AC#TradeBlackblood","GLOBAL",0)~
THEN REPLY ~Take Blackblood—may it never taste life again.~ EXTERN AC#PPDR1 trade_legend_blackblood

// Blade of Searing +3 (SW1H39)
IF ~PartyHasItem("SW1H39") Global("AC#TradeSearing","GLOBAL",0)~
THEN REPLY ~The Blade of Searing shall burn no more flesh.~ EXTERN AC#PPDR1 trade_legend_searing

// Azuredge +3 (AX1H10)
IF ~PartyHasItem("AX1H10") Global("AC#TradeAzuredge","GLOBAL",0)~
THEN REPLY ~Azuredge can rest; its crusade is done.~ EXTERN AC#PPDR1 trade_legend_azuredge

// Heartseeker +3 (BOW10)
IF ~PartyHasItem("BOW10") Global("AC#TradeHeartseeker","GLOBAL",0)~
THEN REPLY ~I part with Heartseeker—no more hearts shall it find.~ EXTERN AC#PPDR1 trade_legend_heartseeker

// Elven Court Bow (BOW12)
IF ~PartyHasItem("BOW12") Global("AC#TradeCourtBow","GLOBAL",0)~
THEN REPLY ~The Elven Court Bow belongs to memory, not to murder. Take it.~ EXTERN AC#PPDR1 trade_legend_courtbow

// Impaler +3 (SPER08)
IF ~PartyHasItem("SPER08") Global("AC#TradeImpaler","GLOBAL",0)~
THEN REPLY ~The Impaler has ended enough lives. Keep it where it can harm none.~ EXTERN AC#PPDR1 trade_legend_impaler

// Spear of Withering (SPER10)
IF ~PartyHasItem("SPER10") Global("AC#TradeWithering","GLOBAL",0)~
THEN REPLY ~I surrender the Spear of Withering—no more decay for the living.~ EXTERN AC#PPDR1 trade_legend_withering

// Frostreaver +3 (AX1H13)
IF ~PartyHasItem("AX1H13") Global("AC#TradeFrostreaver","GLOBAL",0)~
THEN REPLY ~Take Frostreaver—its cold bite ends here.~ EXTERN AC#PPDR1 trade_legend_frostreaver

  IF ~PartyHasItem("SW1H40") Global("AC#TradeL_BladeRoses","GLOBAL",0)~
  THEN REPLY ~This Blade of Roses has stained too many proud hearts; I bring it to you now.~ EXTERN AC#PPDR1 trade_lesser_bladeroses

  IF ~PartyHasItem("AX1H12") Global("AC#TradeL_Stonefire","GLOBAL",0)~
  THEN REPLY ~Here, take Stonefire. May its flames trouble no more hearts.~ EXTERN AC#PPDR1 trade_lesser_stonefire

  IF ~PartyHasItem("AX1H09") Global("AC#TradeL_Rifthome","GLOBAL",0)~
  THEN REPLY ~The Rifthome Axe split enough skulls in its time. It’s yours to keep from harm.~ EXTERN AC#PPDR1 trade_lesser_rifthome

  IF ~PartyHasItem("HALB04") Global("AC#TradeL_DragBreath","GLOBAL",0)~
  THEN REPLY ~Dragon’s Bane has no place in a peaceful grove. I give it to you freely.~ EXTERN AC#PPDR1 trade_lesser_dragonsbreath

  IF ~PartyHasItem("HALB09") Global("AC#TradeL_WaveHalb","GLOBAL",0)~
  THEN REPLY ~The Wave Halberd belongs to calmer tides. Let it rest here.~ EXTERN AC#PPDR1 trade_lesser_wave

  IF ~PartyHasItem("SW1H33") Global("AC#TradeL_Ras","GLOBAL",0)~
  THEN REPLY ~Ras was called by blood’s ghost; I set it free from summoning’s chain.~ EXTERN AC#PPDR1 trade_lesser_ras

  IF ~PartyHasItem("DAGG13") Global("AC#TradeL_PixiePrick","GLOBAL",0)~
  THEN REPLY ~Pixie Prick sleeps with stolen breath; I return it to stillness here.~ EXTERN AC#PPDR1 trade_lesser_pixie

  IF ~PartyHasItem("SW1H33") Global("AC#TradeL_Cutthroat","GLOBAL",0)~
  THEN REPLY ~Named for murder’s hand, Cutthroat finds no welcome here. I surrender it gladly.~ EXTERN AC#PPDR1 trade_lesser_cutthroat

  IF ~PartyHasItem("SW1H68") Global("AC#TradeL_SpectralBrand","GLOBAL",0)~
  THEN REPLY ~Spectral Brand tastes of undead sorrow; may its echo fade in the pool’s embrace.~ EXTERN AC#PPDR1 trade_lesser_spectral

  IF ~PartyHasItem("SW1H35") Global("AC#TradeL_Adjatha","GLOBAL",0)~
  THEN REPLY ~Adjatha the Drinker fed on magic—let its thirst end under your watch.~ EXTERN AC#PPDR1 trade_lesser_adjatha

  IF ~PartyHasItem("SW2H16") Global("AC#TradeL_SwordChaos","GLOBAL",0)~
  THEN REPLY ~Sword of Chaos hurled fate-poison blindly; I gift it to the roots of stillness.~ EXTERN AC#PPDR1 trade_lesser_chaos

  IF ~PartyHasItem("SW1H34") Global("AC#TradeL_Albruin","GLOBAL",0)~
  THEN REPLY ~Albruin was forged for hunts long past. I lay it down so nothing hunts here.~ EXTERN AC#PPDR1 trade_lesser_albruin

  IF ~PartyHasItem("SW1H53") Global("AC#TradeL_SwordFlame","GLOBAL",0)~
  THEN REPLY ~Flame in the steel split more than bodies. Let it cool in this hush.~ EXTERN AC#PPDR1 trade_lesser_flame

  IF ~PartyHasItem("SW1H31") Global("AC#TradeL_Daystar","GLOBAL",0)~
  THEN REPLY ~Daystar cut through darkness—but light can blind as fiercely. This is its rest.~ EXTERN AC#PPDR1 trade_lesser_daystar

  IF ~PartyHasItem("SW1H10") Global("AC#TradeL_SSBackstab","GLOBAL",0)~
  THEN REPLY ~Betrayal’s short sword sits heavy in the soul. I leave it for still water’s healing.~ EXTERN AC#PPDR1 trade_lesser_ssbackstab

  IF ~PartyHasItem("SW1H30") Global("AC#TradeL_Belm","GLOBAL",0)~
  THEN REPLY ~Belm swung for vengeance. May its arc end in silent grace.~ EXTERN AC#PPDR1 trade_lesser_belm

  IF ~PartyHasItem("MISC75") Global("AC#TradeL_DagVenom","GLOBAL",0)~
  THEN REPLY ~A dagger of venom finds no purchase here. I give it to the roots and let it rot in quiet.~ EXTERN AC#PPDR1 trade_lesser_dagvenom
  
  IF ~PartyHasItem("SW1H38") Global("AC#TradeL_Jhor","GLOBAL",0)~ 
  THEN REPLY ~I wish to part with Jhor the Bleeder—it has drawn enough blood in its time.~ EXTERN AC#PPDR1 trade_lesser_jhor 

// Lesser Weapons - Poisoned Pathways
// Blade of the Elven Mycologist
IF ~PartyHasItem("AC#PPSW") Global("AC#TradeMycologistBlade","GLOBAL",0)~
THEN REPLY ~The Blade of the Elven Mycologist… its edge smells faintly of damp earth. May it return to the soil.~ EXTERN AC#PPDR1 trade_lesser_mycologist_blade

// Scolopendra's Spit +3
IF ~PartyHasItem("AC#PPSCO") Global("AC#TradeScolopendra","GLOBAL",0)~
THEN REPLY ~Scolopendra's Spit… venomous, patient, and silent. I will not miss its company.~ EXTERN AC#PPDR1 trade_lesser_scolopendra

// Good Luck, Honeysuckle +3
IF ~PartyHasItem("AC#PP2HA") Global("AC#TradeHoneysuckle","GLOBAL",0)~
THEN REPLY ~Good Luck, Honeysuckle… may its fortune bloom for another, far from the clash of blades.~ EXTERN AC#PPDR1 trade_lesser_honeysuckle

// Bard's Love Letter +3
IF ~PartyHasItem("AC#PPBOW") Global("AC#TradeLoveLetter","GLOBAL",0)~
THEN REPLY ~Bard's Love Letter… words unspoken now whispered only by the bowstring.~ EXTERN AC#PPDR1 trade_lesser_loveletter

// Hammer of Powerful Yet Unlikely Blows +4
IF ~PartyHasItem("AC#PPHME") Global("AC#TradeUnlikelyHammer","GLOBAL",0)~
THEN REPLY ~Hammer of Powerful Yet Unlikely Blows… each strike a story, each miss an even better one.~ EXTERN AC#PPDR1 trade_lesser_unlikelyhammer

// Godcall items

// False Pride +3 (AC#W75SW)
IF ~PartyHasItem("AC#W75SW") Global("AC#TradeFalsePride","GLOBAL",0)~
THEN REPLY ~I surrender False Pride—may humility drown its conceit.~ EXTERN AC#PPDR1 trade_legend_falsepride

// Skull Mace (AC#WSKCL)
IF ~PartyHasItem("AC#WSKCL") Global("AC#TradeSkullMace","GLOBAL",0)~
THEN REPLY ~Take this Skull Mace—its hunger for strength ends here.~ EXTERN AC#PPDR1 trade_legend_skullmace

// Flesh and Boils +4 (AC#WFLBO)
IF ~PartyHasItem("AC#WFLBO") Global("AC#TradeFleshBoils","GLOBAL",0)~
THEN REPLY ~Here—‘Flesh and Boils’. It belongs nowhere among the living.~ EXTERN AC#PPDR1 trade_legend_fleshboils

// Meatshaper +3 (AC#WMSHP)
IF ~PartyHasItem("AC#WMSHP") Global("AC#TradeMeatshaper","GLOBAL",0)~
THEN REPLY ~The Meatshaper warps flesh with every blow. End it here.~ EXTERN AC#PPDR1 trade_legend_meatshaper

// Heads +3 (AC#W901)
IF ~PartyHasItem("AC#W901") Global("AC#TradeHeads","GLOBAL",0)~
THEN REPLY ~‘Heads’—a coin turned killer. I give it to the pool.~ EXTERN AC#PPDR1 trade_legend_heads

// Tails +3 (AC#W902)
IF ~PartyHasItem("AC#W902") Global("AC#TradeTails","GLOBAL",0)~
THEN REPLY ~‘Tails’—let the other half of this blade rest as well.~ EXTERN AC#PPDR1 trade_legend_tails

// Venom Slicer (AC#W90SC)
IF ~PartyHasItem("AC#W90SC") Global("AC#TradeVenomSlicer","GLOBAL",0)~
THEN REPLY ~The Venom Slicer carries the Abyss in its bite. Take it.~ EXTERN AC#PPDR1 trade_legend_venomslicer

// Bloodblade (AC#W90DG)
IF ~PartyHasItem("AC#W90DG") Global("AC#TradeBloodblade","GLOBAL",0)~
THEN REPLY ~This Bloodblade drips with the Lower Planes. Let it bleed out here.~ EXTERN AC#PPDR1 trade_legend_bloodblade

// Rust Spreader +3 (AC#WRUSP)
IF ~PartyHasItem("AC#WRUSP") Global("AC#TradeRustSpreader","GLOBAL",0)~
THEN REPLY ~The Rust Spreader corrupts all it touches—end its creeping rot.~ EXTERN AC#PPDR1 trade_legend_rustspreader

// Heart-Shaped-Razor +3 (AC#WHSRZ)
IF ~PartyHasItem("AC#WHSRZ") Global("AC#TradeHeartRazor","GLOBAL",0)~
THEN REPLY ~This heart-shaped razor was made for butchery, not love—take it.~ EXTERN AC#PPDR1 trade_legend_heartrazor
// Mad God items
IF ~PartyHasItem("AC#MGSP1") Global("AC#TradeBlackbite","GLOBAL",0)~
THEN REPLY ~Blackbite has bitten enough in its time. Let the waters wash away its venom.~ EXTERN AC#PPDR1 trade_lesser_blackbite

IF ~PartyHasItem("AC#MGMS1") Global("AC#TradeBonefang","GLOBAL",0)~
THEN REPLY ~The Bonefang has crushed enough skulls. I think it’s time it found peace here.~ EXTERN AC#PPDR1 trade_lesser_bonefang

IF ~PartyHasItem("AC#MGAMB") Global("AC#TradeAstralMace","GLOBAL",0)~
THEN REPLY ~The Astral Mace of Blasting should mark no more endings. Let it rest under Eldath’s gaze.~ EXTERN AC#PPDR1 trade_lesser_astralmace

IF ~PartyHasItem("AC#CLKBL") Global("AC#TradeClockworkBlade","GLOBAL",0)~
THEN REPLY ~The Clockwork Blade of Venom has ticked its last strike. Let the gears wind down in peace.~ EXTERN AC#PPDR1 trade_lesser_clockworkblade

IF ~PartyHasItem("AC#MGTRH") Global("AC#TradeGrubnuksHand","GLOBAL",0)~
THEN REPLY ~Grubnuk’s Hand has clutched enough lives. I think it’s time it let go forever.~ EXTERN AC#PPDR1 trade_lesser_grubnuk

IF ~PartyHasItem("AC#MGSCI") Global("AC#TradePrismaticScimitar","GLOBAL",0)~
THEN REPLY ~The Prismatic Scimitar has shone enough colors in battle. Time to let it fade into quiet waters.~ EXTERN AC#PPDR1 trade_lesser_prismaticscimitar

IF ~PartyHasItem("AC#MGHMA") Global("AC#TradeAirHammer","GLOBAL",0)~
THEN REPLY ~The Air Hammer has cleared enough storms. Let the winds settle here.~ EXTERN AC#PPDR1 trade_lesser_airhammer

IF ~~ THEN REPLY ~It seems I carry no weapon that I could leave here.~ EXTERN AC#PPDR1 trade_root  
IF ~~ THEN REPLY ~Perhaps we should start over, then.~ EXTERN AC#PPDR1 trade_root
IF ~~ THEN REPLY ~I changed my mind and will leave. Farewell.~ EXTERN AC#PPDR1 no_trade_bye 


// ----- Lesser turn-ins (apply AC#PPH1) -----

CHAIN AC#PPDR1 trade_legend_skullcrusher
~Let bone be shielded by mercy, not broken by rage.~
DO ~TakePartyItem("BLUN18")
   SetGlobal("AC#TradeSkullcrusher","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(500)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT


CHAIN AC#PPDR1 trade_legend_thunderbolts
~Boom becomes hush; may the sky forgive what the forge demanded.~
DO ~TakePartyItem("HAMM07")
   SetGlobal("AC#TradeThunderbolts","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(500)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT


CHAIN AC#PPDR1 trade_legend_dwarventhrower
~A faithful tool of war can be faithful to peace.~
DO ~TakePartyItem("HAMM06")
   SetGlobal("AC#TradeDwarvenThrower","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(500)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT


CHAIN AC#PPDR1 trade_legend_boneblade
~Let marrow remember life, not cutting.~
DO ~TakePartyItem("DAGG14")
   SetGlobal("AC#TradeBoneblade","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(500)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT


CHAIN AC#PPDR1 trade_legend_blackblood
~Let this bitter club be sweetened by stillness.~
DO ~TakePartyItem("BLUN22")
   SetGlobal("AC#TradeBlackblood","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(500)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT


CHAIN AC#PPDR1 trade_legend_searing
~Fire forgets itself in water; so too shall this blade.~
DO ~TakePartyItem("SW1H39")
   SetGlobal("AC#TradeSearing","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(500)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT


CHAIN AC#PPDR1 trade_legend_azuredge
~Even righteous edges can cut too deep. The grove will keep it gentle.~
DO ~TakePartyItem("AX1H10")
   SetGlobal("AC#TradeAzuredge","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(500)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT


CHAIN AC#PPDR1 trade_legend_falsepride
~Pride cuts deeper than steel. The pool will teach this blade to be still.~
DO ~TakePartyItem("AC#W75SW")
   SetGlobal("AC#TradeFalsePride","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)  
   AddexperienceParty(500)
~ EXIT

CHAIN AC#PPDR1 trade_legend_skullmace
~A fallen paladin’s skull profaned… what horrors mortals make. Let mercy close its teeth forever.~
DO ~TakePartyItem("AC#WSKCL")
   SetGlobal("AC#TradeSkullMace","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)   
   AddexperienceParty(500)
~ EXIT

CHAIN AC#PPDR1 trade_legend_fleshboils
~A club of meat and acid… the Abyss mocks the body itself. Let the waters unmake this blight.~
DO ~TakePartyItem("AC#WFLBO")
   SetGlobal("AC#TradeFleshBoils","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
  
   AddexperienceParty(500)
~ EXIT

CHAIN AC#PPDR1 trade_legend_meatshaper
~Sinew threaded with cruelty. Peace will not abide such stitching.~
DO ~TakePartyItem("AC#WMSHP")
   SetGlobal("AC#TradeMeatshaper","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)   
   AddexperienceParty(500)
~ EXIT

CHAIN AC#PPDR1 trade_legend_heads
~Wealth twisted into death… may the water cool its greed.~
DO ~TakePartyItem("AC#W901")
   SetGlobal("AC#TradeHeads","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1) 
   AddexperienceParty(500)
~ EXIT

CHAIN AC#PPDR1 trade_legend_tails
~Two halves of one greed. Both will sink, and none shall drown by them again.~
DO ~TakePartyItem("AC#W902")
   SetGlobal("AC#TradeTails","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)  
   AddexperienceParty(500)
~ EXIT

CHAIN AC#PPDR1 trade_legend_venomslicer
~Tharzax’s poison has no voice in this grove. The waters will silence its sting.~
DO ~TakePartyItem("AC#W90SC")
   SetGlobal("AC#TradeVenomSlicer","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)   
   AddexperienceParty(500)
~ EXIT

CHAIN AC#PPDR1 trade_legend_bloodblade
~Sap that keeps wounds from closing… abominations upon healing. Peace will close what this opened.~
DO ~TakePartyItem("AC#W90DG")
   SetGlobal("AC#TradeBloodblade","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)   
   AddexperienceParty(500)
~ EXIT

CHAIN AC#PPDR1 trade_legend_rustspreader
~A blade that gnaws even its wielder… such misery belongs to the depths.~
DO ~TakePartyItem("AC#WRUSP")
   SetGlobal("AC#TradeRustSpreader","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)   
   AddexperienceParty(500)
~ EXIT


CHAIN AC#PPDR1 trade_legend_heartrazor
~‘You cannot crush the heart that’s already missing’… such cruelty shall not echo here.~
DO ~TakePartyItem("AC#WHSRZ")
   SetGlobal("AC#TradeHeartRazor","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)   
   AddexperienceParty(500)
~ EXIT

CHAIN AC#PPDR1 trade_legend_heartseeker
~Let arrows stray from sorrow; may this bow learn gentleness at last.~
DO ~TakePartyItem("BOW10")
   SetGlobal("AC#TradeHeartseeker","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(500)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_legend_courtbow
~An heirloom of grace turned grim—let the grove return it to grace.~
DO ~TakePartyItem("BOW12")
   SetGlobal("AC#TradeCourtBow","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(500)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT


CHAIN AC#PPDR1 trade_legend_impaler
~A point made too often dulls the world. The waters will blunt it kindly.~
DO ~TakePartyItem("SPER08")
   SetGlobal("AC#TradeImpaler","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(500)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT


CHAIN AC#PPDR1 trade_legend_withering
~Let blight unlearn its path; the pool remembers only growth.~
DO ~TakePartyItem("SPER10")
   SetGlobal("AC#TradeWithering","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(500)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT


CHAIN AC#PPDR1 trade_legend_frostreaver
~Winter’s edge has no place in a summer grove.~
DO ~TakePartyItem("AX1H13")
   SetGlobal("AC#TradeFrostreaver","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(500)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_lesser_blackbite
~A dragon’s fang should rest in still waters, not in fresh blood.~
DO ~TakePartyItem("AC#MGSP1")
   SetGlobal("AC#TradeBlackbite","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(500)
~ EXIT

CHAIN AC#PPDR1 trade_lesser_bonefang
~Even a giant’s strength can be laid to rest in the waters.~
DO ~TakePartyItem("AC#MGMS1")
   SetGlobal("AC#TradeBonefang","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(500)
~ EXIT

CHAIN AC#PPDR1 trade_lesser_astralmace
~Even the stars fade into stillness in time.~
DO ~TakePartyItem("AC#MGAMB")
   SetGlobal("AC#TradeAstralMace","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(500)
~ EXIT

CHAIN AC#PPDR1 trade_lesser_clockworkblade
~Even time itself can be coaxed into stillness.~
DO ~TakePartyItem("AC#CLKBL")
   SetGlobal("AC#TradeClockworkBlade","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(500)
~ EXIT

CHAIN AC#PPDR1 trade_lesser_grubnuk
~Even a troll’s grasp loosens when offered peace.~
DO ~TakePartyItem("AC#MGTRH")
   SetGlobal("AC#TradeGrubnuksHand","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(500)
~ EXIT

CHAIN AC#PPDR1 trade_lesser_prismaticscimitar
~Even light can rest when the fight is done.~
DO ~TakePartyItem("AC#MGSCI")
   SetGlobal("AC#TradePrismaticScimitar","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(500)
~ EXIT

CHAIN AC#PPDR1 trade_lesser_airhammer
~Even the wind grows weary and seeks calm.~
DO ~TakePartyItem("AC#MGHMA")
   SetGlobal("AC#TradeAirHammer","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(500)
~ EXIT

CHAIN AC#PPDR1 trade_lesser_mycologist_blade
~Even steel may grow weary of blood. Let the moss claim it now.~
DO ~TakePartyItem("AC#PPSW")
   SetGlobal("AC#TradeMycologistBlade","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(750)~
EXIT

CHAIN AC#PPDR1 trade_lesser_scolopendra
~Venom without a hand to guide it drips harmless into the earth.~
DO ~TakePartyItem("AC#PPSCO")
   SetGlobal("AC#TradeScolopendra","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(750)~
EXIT


CHAIN AC#PPDR1 trade_lesser_honeysuckle
~Some luck is better sown than swung. Let the grove be its new keeper.~
DO ~TakePartyItem("AC#PP2HA")
   SetGlobal("AC#TradeHoneysuckle","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(750)~
EXIT

CHAIN AC#PPDR1 trade_lesser_loveletter
~Let the wind carry its verses, not its arrows.~
DO ~TakePartyItem("AC#PPBOW")
   SetGlobal("AC#TradeLoveLetter","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(750)~
EXIT

CHAIN AC#PPDR1 trade_lesser_unlikelyhammer
~May its next tale be of peace, not shattering.~
DO ~TakePartyItem("AC#PPHME")
   SetGlobal("AC#TradeUnlikelyHammer","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(750)~
EXIT

CHAIN AC#PPDR1 trade_lesser_jhor
~Then let its thirst be quenched forever, and its memory sink into still waters.~
DO ~TakePartyItem("SW1H38")
   SetGlobal("AC#TradeL_Jhor","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(800)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_lesser_bladeroses
~May the brightness of peace outshine any duel this blade once starred in.~
DO ~TakePartyItem("SW1H40")
   SetGlobal("AC#TradeL_BladeRoses","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(800)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_lesser_stonefire
~From molten memory to the calm of stone and water.~
DO ~TakePartyItem("AX1H12")
   SetGlobal("AC#TradeL_Stonefire","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(800)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_lesser_rifthome
~Axes remember feuds long after the names are gone.~
DO ~TakePartyItem("AX1H09")
   SetGlobal("AC#TradeL_Rifthome","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(800)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_lesser_dragonsbreath
~Let the flame that once burned dragons fade into silent ash.~
DO ~TakePartyItem("HALB04")
   SetGlobal("AC#TradeL_DragBreath","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(800)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_lesser_wave
~A tide turned to killing is no tide for this grove.~
DO ~TakePartyItem("HALB09")
   SetGlobal("AC#TradeL_WaveHalb","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(800)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_lesser_ras
~Let the dead rest. No more summons.~
DO ~TakePartyItem("SW1H33")
   SetGlobal("AC#TradeL_Ras","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(800)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_lesser_pixie
~Sleep should be mercy, not ambush.~
DO ~TakePartyItem("DAGG13")
   SetGlobal("AC#TradeL_PixiePrick","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(800)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_lesser_cutthroat
~Steel named for murder needs quiet most of all.~
DO ~TakePartyItem("SW1H33")
   SetGlobal("AC#TradeL_Cutthroat","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(800)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_lesser_spectral
~Let echoes return to silence.~
DO ~TakePartyItem("SW1H68")
   SetGlobal("AC#TradeL_SpectralBrand","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(800)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_lesser_adjatha
~Thirst for magic is still thirst. Be satisfied no more.~
DO ~TakePartyItem("SW1H35")
   SetGlobal("AC#TradeL_Adjatha","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(800)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_lesser_chaos
~Chaos feeds on crowds. Here, it starves.~
DO ~TakePartyItem("SW2H16")
   SetGlobal("AC#TradeL_SwordChaos","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(800)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_lesser_albruin
~Hunters of the hidden often become what they fear. Rest now.~
DO ~TakePartyItem("SW1H34")
   SetGlobal("AC#TradeL_Albruin","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(800)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_lesser_flame
~Fire in a hilt is still fire. The pool will cool it.~
DO ~TakePartyItem("SW1H53")
   SetGlobal("AC#TradeL_SwordFlame","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(800)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_lesser_daystar
~Light can blind as surely as it guides.~
DO ~TakePartyItem("SW1H31")
   SetGlobal("AC#TradeL_Daystar","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(800)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_lesser_ssbackstab
~Let betrayal find no purchase here.~
DO ~TakePartyItem("SW1H10")
   SetGlobal("AC#TradeL_SSBackstab","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(800)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_lesser_belm
~A quick hand learns patience, in time.~
DO ~TakePartyItem("SW1H30")
   SetGlobal("AC#TradeL_Belm","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(800)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT

CHAIN AC#PPDR1 trade_lesser_dagvenom
~Venom loses its sting in still water.~
DO ~TakePartyItem("MISC75")
   SetGlobal("AC#TradeL_DagVenom","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(800)
   SetGlobal("EldathBless","ACPP06",1)
~ EXIT


// Lesser refresh: loop if more lesser remain; else back to root
CHAIN IF ~~ THEN AC#PPDR1 trade_lesser_refresh
~The pool is ready for another burden.~
END
  IF ~~ THEN REPLY ~I have another weapon to surrender.~ EXTERN AC#PPDR1 trade_lesser_menu
  IF ~~ THEN REPLY ~Perhaps we can start over.~ EXTERN AC#PPDR1 trade_root
  IF ~~ THEN REPLY ~Not now.~ EXTERN AC#PPDR1 no_trade_bye
	

