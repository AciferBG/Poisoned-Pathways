// dryad in area acpp06 (Eldath's Peace Grotto):
BEGIN ~AC#PPDR1~ //Dryad
BEGIN ~AC#PPFI1~ //Fighter

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
IF ~~ THEN REPLY ~I have no interest in this conversation. Farewell.~ EXTERN AC#PPDR1 bye_trade_weapons

CHAIN IF ~~ THEN AC#PPDR1 bye_trade_weapons
~As you wish. Farewell.~
EXIT

CHAIN IF ~~ THEN AC#PPDR1 trade_weapons_02
~It is rare that... people like you pass through here—those who do not seek peace, but simply move on. You have seen many battles, of that I am sure. And you have seen many weapons whose owners are no longer among the living.~
END
IF ~~ THEN EXTERN AC#PPDR1 trade_weapons_03

CHAIN IF ~~ THEN AC#PPDR1 trade_weapons_03
~You gather these weapons, sell them... and a new hand wields them to bring more death and suffering. It does not have to be so—not anymore.~
END
IF ~~ THEN EXTERN AC#PPDR1 trade_weapons_04

CHAIN IF ~~ THEN AC#PPDR1 trade_weapons_04
~If you were to bring such weapons here instead, they would harm no one again. Here, in Eldath’s embrace, they would be kept safe. It costs you nothing—you still keep your own arms. But those you no longer need, leave them here.~
END
IF ~~ THEN REPLY ~You want to take all the weapons I find from my enemies?~ EXTERN AC#PPDR1 trade_weapons_05

CHAIN IF ~~ THEN AC#PPDR1 trade_weapons_05
~Not all weapons—that would be more than even our sacred grove could bear. No, I mean the special ones, the unique ones. Those that have been swung in hundreds of battles, that have taken hundreds of lives. Bring such weapons here, and Eldath will bless you.~
END
IF ~~ THEN REPLY ~What do I get in return?~ EXTERN AC#PPDR1 trade_weapons_what_do_i_get
IF ~~ THEN REPLY ~Selling those weapons is how I make my living!~ EXTERN AC#PPDR1 trade_weapons_what_do_i_get

CHAIN IF ~~ THEN AC#PPDR1 trade_weapons_what_do_i_get
~I... I cannot give you gold. But Eldath’s blessing is yours to take. With each weapon you surrender, she will grace you—granting you strength and vitality beyond what killing alone could bring. With every blade you give up, you will grow and thrive, even as others will *not* die by it anymore.~ 
=
~One less weapon, more life for you—that is Eldath’s bargain.~
END
IF ~~ THEN REPLY ~Which weapons exactly are we talking about?~ EXTERN AC#PPDR1 trade_weapons_which_weapons

CHAIN IF ~~ THEN AC#PPDR1 trade_weapons_which_weapons
~You will know them—the weapons that bear a name. A named weapon has claimed many lives. Such weapons will earn you Eldath’s blessing.~  
=  
~And those that have already become legend will grant you even greater vitality. So, what do you say?~
END
IF ~~ THEN REPLY ~Do I have any such weapons with me?~ EXTERN AC#PPDR1 trade_root
IF ~~ THEN REPLY ~I will think on it.~ EXTERN AC#PPDR1 trade_think_about_it
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
IF~Global("AC#PPSirineQuest","GLOBAL",1) Global("AC#PPSirineQuest_d","GLOBAL",0)~THEN REPLY ~I met a sirine outside, full of anger. You live by peace and calm—can you tell me how to help her?~ EXTERN AC#PPDR1 hello_s_00

	CHAIN IF ~~ THEN AC#PPDR1 who_are_you
	~I am a dryad, bound to this grove. Long ago, Eldath’s touch calmed my frightened heart, and since then I serve as her gentle warden here. My spirit is tied to its trees, its waters, and the quiet breath of Eldath herself.~ 
	END
	IF~Global("NPC_ThrowWeapon","ACPP06",0)~THEN REPLY ~What is this place?~ EXTERN AC#PPDR1 what_place
	IF~Global("NPC_ThrowWeapon","ACPP06",1)~THEN REPLY ~What is this place?~ EXTERN AC#PPDR1 what_place_2
	IF~~THEN REPLY ~I think I'll be going now.~ EXTERN AC#PPDR1 bye
	IF~Global("AC#PPSirineQuest","GLOBAL",1) Global("AC#PPSirineQuest_d","GLOBAL",0)~THEN REPLY ~I met a sirine outside, full of anger. You live by peace and calm—can you tell me how to help her?~ EXTERN AC#PPDR1 hello_s_00

	CHAIN IF ~~ THEN AC#PPDR1 what_place
	~Here, many brave warriors have chosen to abandon their trade and follow the path of peace instead. Do you see the many weapons? Each one once belonged to a soul whose life was shaped by war and bloodshed—until they laid down their arms here and chose a different path.~
	== AnomenJ IF ~InParty("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN ~All these weapons just thrown aside? So much steel, wasted... I can’t decide if it’s inspiring or foolish.~
	== MazzyJ IF ~InParty("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN ~Peace is well and good—until the next pack of bandits shows up. Then what? Sing them to death?~
	== DORNJ IF ~InParty("Dorn") !StateCheck("Dorn",CD_STATE_NOTVALID)~ THEN ~A sword keeps you alive. Giving it up? That’s as good as digging your own grave.~
	== KeldorJ IF ~InParty("keldorn") !StateCheck("keldorn",CD_STATE_NOTVALID)~ THEN ~That’s... admirable. To turn away from war takes more courage than swinging a blade ever could.~
	END
	IF~~THEN DO ~SetGlobal("NPC_ThrowWeapon","ACPP06",1)~ EXTERN AC#PPDR1 throw_weapon_too
	
		CHAIN IF ~~ THEN AC#PPDR1 what_place_2
	~Here, many brave warriors have chosen to abandon their trade and follow the path of peace instead. Do you see the many weapons? Each one once belonged to a soul whose life was shaped by war and bloodshed—until they laid down their arms here and chose a different path.~
	END
	IF~~THEN EXTERN AC#PPDR1 throw_weapon_too

	CHAIN IF ~~ THEN AC#PPDR1 throw_weapon_too
	~Have you come to lay down your weapons here as well, in the name of peace?~
	END
	IF~Global("AC#PPSirineQuest","GLOBAL",1) Global("AC#PPSirineQuest_d","GLOBAL",0)~THEN REPLY ~I met a sirine outside, full of anger. You live by peace and calm—can you tell me how to help her?~ EXTERN AC#PPDR1 hello_s_00
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
	IF~Global("AC#PPSirineQuest","GLOBAL",1) Global("AC#PPSirineQuest_d","GLOBAL",0)~THEN REPLY ~I met a sirine outside, full of anger. You live by peace and calm—can you tell me how to help her?~ EXTERN AC#PPDR1 hello_s_00
	
		CHAIN IF ~~ THEN AC#PPDR1 take_some_weapons
		~These weapons have already tasted blood. Whether they lie here or in your hands makes little difference to the past. Peace cannot be forced on the unwilling.~ 
		END
		IF~~THEN REPLY ~Do you perhaps keep any special weapons here—ones I might put to use?~ EXTERN AC#PPDR1 spectral_blade
		IF~~THEN REPLY ~Then I’ll take a look around, see if anything’s worth keeping.~ EXTERN AC#PPDR1 bye
		IF~~THEN REPLY ~I think I'll be going now.~ EXTERN AC#PPDR1 bye
		IF~Global("AC#PPSirineQuest","GLOBAL",1) Global("AC#PPSirineQuest_d","GLOBAL",0)~THEN REPLY ~I met a sirine outside, full of anger. You live by peace and calm—can you tell me how to help her?~ EXTERN AC#PPDR1 hello_s_00
		
		CHAIN IF ~~ THEN AC#PPDR1 spectral_blade
		~A single blade among these still hums with ancient grief. It carries the weight of old vows, sworn in battles long past. If you are truly set on walking a path against the dead, it may answer your call. Perhaps it waits for someone bold enough to wield it once more.~ 
		END
		IF~~THEN REPLY ~Could you give it to me?~ EXTERN AC#PPDR1 give_spectral_blade
		IF~~THEN REPLY ~I think I'll be going now.~ EXTERN AC#PPDR1 bye
		IF~Global("AC#PPSirineQuest","GLOBAL",1) Global("AC#PPSirineQuest_d","GLOBAL",0)~THEN REPLY ~I met a sirine outside, full of anger. You live by peace and calm—can you tell me how to help her?~ EXTERN AC#PPDR1 hello_s_00
		
			CHAIN IF ~~ THEN AC#PPDR1 give_spectral_blade
			~No, not yet. You are not ready for such a burden. If fate wills it, it will one day rest in your grasp. Be patient... perhaps, in time, you'll be chosen to wield the blade.~ 
			END
			IF~~THEN REPLY ~Then I’ll prove myself, no matter what trials lie ahead.~ EXTERN AC#PPDR1 bye
			IF~~THEN REPLY ~If it’s waiting for someone bold and handsome, I think I’m already the best candidate, but let's wait.~ EXTERN AC#PPDR1 bye
			IF~~THEN REPLY ~I think I'll be going now.~ EXTERN AC#PPDR1 bye
			IF~Global("AC#PPSirineQuest","GLOBAL",1) Global("AC#PPSirineQuest_d","GLOBAL",0)~THEN REPLY ~I met a sirine outside, full of anger. You live by peace and calm—can you tell me how to help her?~ EXTERN AC#PPDR1 hello_s_00

	CHAIN IF ~~ THEN AC#PPDR1 bye
	~Peace to you, traveler. May your path be soft beneath your feet.~
	EXIT
	
	CHAIN AC#PPDR1 hello_s_00
	~My sister of the tides wanders lost in her fury, unable to hear the whispers of still water?~
	END
	IF~~THEN EXTERN AC#PPDR1 hello_s_01

CHAIN IF ~~ THEN AC#PPDR1 hello_s_01
~Bring her this. Blessed water mingled with chamomile, wild honey, blackberry, and lavender—each a whisper of calm from the grove. May it melt her wrath like morning sun on winter frost, leaving only quiet within.~
== JaheiraJ IF ~InParty("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN ~Perhaps we could offer some of that brew to our angry dwarf here as well?~
== KORGANJ IF ~InParty("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN ~Ha! Very funny, half-elf! My rage bows to no potion—and that’s the way I like it! Now shut yer mouth before I find a new reason to get truly mad!~
END
IF~~THEN DO ~SetGlobal("AC#PPSirineQuest_d","GLOBAL",1) GiveItemCreate("AC#PPTEA",Player1,1,1,0)~ EXTERN AC#PPDR1 hello_s_02

CHAIN IF ~~ THEN AC#PPDR1 hello_s_02
~Let my siren sister drink this potion beneath the open sky. If her spirit is willing, Eldath’s calm will seep through the anger like sunlight thawing frozen waters.~
END
IF~~THEN REPLY ~Thank you, this will help her.~ EXTERN AC#PPDR1 hello_s_bye
IF~~THEN REPLY ~Hopefully this will work.~ EXTERN AC#PPDR1 hello_s_bye
IF~~THEN REPLY ~Alright. I'll bring your brew to your salty sister.~ EXTERN AC#PPDR1 hello_s_bye

	CHAIN IF ~~ THEN AC#PPDR1 hello_s_bye
	~Carry calm as your shield, and kindness as your blade.~
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
~If you carry steel born of quarrel or grief, the waters can quiet it. Will you trade a weapon for a touch more life in you?~
END
  IF ~OR(8)
        PartyHasItem("SW1H54")    // The Equalizer
        PartyHasItem("SW2H10")     // Carsomyr +5
        PartyHasItem("BLUN14")          // Flail of Ages
        PartyHasItem("HAMM09")         // Crom Faeyr
        PartyHasItem("SW2H08")   // Soul Reaver +4
        PartyHasItem("MISCBC")   // Blackrazor
        PartyHasItem("SW1H51")   // Celestial Fury +3
        PartyHasItem("SW2H14")     // Lilarcor~ THEN REPLY ~I’d like to surrender a legendary weapon.~ EXTERN AC#PPDR1 trade_legend_menu
  IF ~OR(18)
        PartyHasItem("SW1H40")      // Blade of Roses
        PartyHasItem("AX1H12")        // Stonefire +3
        PartyHasItem("AX1H09")         // Rifthome Axe +3
        PartyHasItem("HALB04")   // Dragon’s Bane +3
        PartyHasItem("HALB09")     // Wave Halberd +4
        PartyHasItem("SW1H33")              // Ras +2
        PartyHasItem("DAGG13")      // Pixie Prick +3
        PartyHasItem("SW1H33")        // Cutthroat +4
        PartyHasItem("SW1H68")   // Spectral Brand +4
        PartyHasItem("SW1H35")          // Adjatha the Drinker +2
        PartyHasItem("SW2H16")      // Sword of Chaos +2
        PartyHasItem("SW1H34")          // Albruin +1
        PartyHasItem("SW1H53")      // Sword of Flame +1/+3
        PartyHasItem("SW1H31")          // Daystar +2
        PartyHasItem("SW1H10")      // The Shadow's Blade +3
        PartyHasItem("SW1H30")             // Belm +2
        PartyHasItem("MISC75")     // Dagger of Venom +2
        PartyHasItem("SW1H38")     // Jhor the Bleeder +2
		~ THEN REPLY ~I’d like to surrender another weapon.~ EXTERN AC#PPDR1 trade_lesser_menu
		IF ~~ THEN REPLY ~It seems I carry no weapon that I could leave here.~ EXTERN AC#PPDR1 no_trade_bye
		IF ~~ THEN REPLY ~Not now.~ EXTERN AC#PPDR1 no_trade_bye
		IF ~~ THEN REPLY ~And what do I gain from this?~ EXTERN AC#PPDR1 trade_gain

	CHAIN IF ~~ THEN AC#PPDR1 trade_gain
	~You shall receive a blessing of Eldath—one that will help you bear the weight of life a little more lightly.~
	END
	IF ~~ THEN REPLY ~Could you be a bit more specific?~ EXTERN AC#PPDR1 trade_gain_02
	IF ~~ THEN REPLY ~That’s all I wanted to know.~ EXTERN AC#PPDR1 trade_root
	IF ~~ THEN REPLY ~I’ve changed my mind and will be on my way now.~ EXTERN AC#PPDR1 no_trade_bye

	  
	  CHAIN IF ~~ THEN AC#PPDR1 trade_gain_02
    ~Parting with a weapon is an act of strength—strength that grants you vitality.~
	= ~With each weapon surrendered, you’ll feel your life grow—just a little for a lesser blade, more for a legendary one. Only Eldath knows the true worth of each weapon that vanishes from the world.~
	END
	IF ~~ THEN REPLY ~That’s all I wanted to know.~ EXTERN AC#PPDR1 trade_root
	IF ~~ THEN REPLY ~I’ve changed my mind and will be on my way now.~ EXTERN AC#PPDR1 no_trade_bye

// =====================================================
// LEGENDARY BRANCH
// =====================================================

CHAIN IF ~~ THEN AC#PPDR1 trade_legend_menu
~These are blades that stirred armies and sundered vows. Which burden will you lay down?~
END
  IF ~PartyHasItem("SW1H54") Global("AC#TradeEqualizer","GLOBAL",0)~
  THEN REPLY ~The Equalizer balanced nothing but corpses. Let the water end its argument.~ EXTERN AC#PPDR1 trade_legend_equalizer

  IF ~PartyHasItem("SW2H10") Global("AC#TradeCarsomyr","GLOBAL",0)~
  THEN REPLY ~Carsomyr’s zeal cuts too deep. I surrender it to stillness.~ EXTERN AC#PPDR1 trade_legend_carsomyr

  IF ~PartyHasItem("BLUN14") Global("AC#TradeFoA","GLOBAL",0)~
  THEN REPLY ~The Flail of Ages bound three tempests to war; unbind it here.~ EXTERN AC#PPDR1 trade_legend_foa

  IF ~PartyHasItem("HAMM09") Global("AC#TradeCrom","GLOBAL",0)~
  THEN REPLY ~Crom Faeyr shook mountains; let it trouble roots and moss no more.~ EXTERN AC#PPDR1 trade_legend_crom

  IF ~PartyHasItem("SW2H08") Global("AC#TradeSoulReaver","GLOBAL",0)~
  THEN REPLY ~Soul Reaver drinks hope; I give it to waters that heal.~ EXTERN AC#PPDR1 trade_legend_soulreaver

  IF ~PartyHasItem("MISCBC") Global("AC#TradeBlackrazor","GLOBAL",0)~
  THEN REPLY ~Blackrazor whispers of hunger. May the pool teach it silence.~ EXTERN AC#PPDR1 trade_legend_blackrazor

  IF ~PartyHasItem("SW1H51") Global("AC#TradeCelFury","GLOBAL",0)~
  THEN REPLY ~Celestial Fury’s thunder belongs to the sky, not to wandering hands.~ EXTERN AC#PPDR1 trade_legend_celestialfury

  IF ~PartyHasItem("SW2H14") Global("AC#TradeLilarcor","GLOBAL",0)~
  THEN REPLY ~I can’t stand Lilarcor's chatter anymore. Take it. If anyone can hush it, it’s you.~ EXTERN AC#PPDR1 trade_legend_lilarcor

  IF ~~ THEN REPLY ~Never mind—back to the start.~ EXTERN AC#PPDR1 trade_root


// ----- Legendary turn-ins (apply AC#PPH2 + AC#PPGR) -----

CHAIN AC#PPDR1 trade_legend_equalizer
~Endless balance sought through endless strife... let the water end the argument.~
DO ~TakePartyItem("SW1H54")
   SetGlobal("AC#TradeEqualizer","GLOBAL",1)
   ApplySpellRES("AC#PPH2",Player1)
   ApplySpellRES("AC#PPGR",Player1)
   AddexperienceParty(1000)
~ EXTERN AC#PPDR1 trade_legend_refresh

CHAIN AC#PPDR1 trade_legend_carsomyr
~Holy or not, such a sword has ended many lives. Be still now.~
DO ~TakePartyItem("SW2H10")
   SetGlobal("AC#TradeCarsomyr","GLOBAL",1)
   ApplySpellRES("AC#PPH2",Player1)
   ApplySpellRES("AC#PPGR",Player1)
   AddexperienceParty(1000)
~ EXTERN AC#PPDR1 trade_legend_refresh

CHAIN AC#PPDR1 trade_legend_foa
~Shards of three tempests belong in one calm pool.~
DO ~TakePartyItem("BLUN14")
   SetGlobal("AC#TradeFoA","GLOBAL",1)
   ApplySpellRES("AC#PPH2",Player1)
   ApplySpellRES("AC#PPGR",Player1)
   AddexperienceParty(1000)
~ EXTERN AC#PPDR1 trade_legend_refresh

CHAIN AC#PPDR1 trade_legend_crom
~Strength that breaks mountains can also break the quiet. Lay it down.~
DO ~TakePartyItem("HAMM09")
   SetGlobal("AC#TradeCrom","GLOBAL",1)
   ApplySpellRES("AC#PPH2",Player1)
   ApplySpellRES("AC#PPGR",Player1)
   AddexperienceParty(1000)
~ EXTERN AC#PPDR1 trade_legend_refresh

CHAIN AC#PPDR1 trade_legend_soulreaver
~A draught of despair clings to this steel. The moss will drink it away.~
DO ~TakePartyItem("SW2H08")
   SetGlobal("AC#TradeSoulReaver","GLOBAL",1)
   ApplySpellRES("AC#PPH2",Player1)
   ApplySpellRES("AC#PPGR",Player1)
   AddexperienceParty(1000)
~ EXTERN AC#PPDR1 trade_legend_refresh

CHAIN AC#PPDR1 trade_legend_blackrazor
~Hush. Your hunger will trouble the grove no longer.~
DO ~TakePartyItem("MISCBC")
   SetGlobal("AC#TradeBlackrazor","GLOBAL",1)
   ApplySpellRES("AC#PPH2",Player1)
   ApplySpellRES("AC#PPGR",Player1)
   AddexperienceParty(1000)
~ EXTERN AC#PPDR1 trade_legend_refresh

CHAIN AC#PPDR1 trade_legend_celestialfury
~Thunder belongs to the sky, not to mortal tempers. Sleep now.~
DO ~TakePartyItem("SW1H51")
   SetGlobal("AC#TradeCelFury","GLOBAL",1)
   ApplySpellRES("AC#PPH2",Player1)
   ApplySpellRES("AC#PPGR",Player1)
   AddexperienceParty(1000)
~ EXTERN AC#PPDR1 trade_legend_refresh

CHAIN AC#PPDR1 trade_legend_lilarcor
~Even in silence, I hear the chatter. The pool will teach you quiet.~
DO ~TakePartyItem("SW2H14")
   SetGlobal("AC#TradeLilarcor","GLOBAL",1)
   ApplySpellRES("AC#PPH2",Player1)
   ApplySpellRES("AC#PPGR",Player1)
   AddexperienceParty(1000)
~ EXTERN AC#PPDR1 trade_legend_refresh

// Legend refresh: loop if more legendary remain; else back to root
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
~Quarrels don’t need legends to cut deep. Which other burden will you surrender?~
END
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

  IF ~~ THEN REPLY ~Never mind—back to the start.~ EXTERN AC#PPDR1 trade_root


// ----- Lesser turn-ins (apply AC#PPH1) -----

CHAIN AC#PPDR1 trade_lesser_jhor
~Then let its thirst be quenched forever, and its memory sink into still waters.~
DO ~TakePartyItem("SW1H38")
   SetGlobal("AC#TradeL_Jhor","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(800)
~ EXTERN AC#PPDR1 trade_lesser_refresh

CHAIN AC#PPDR1 trade_lesser_bladeroses
~May the brightness of peace outshine any duel this blade once starred in.~
DO ~TakePartyItem("SW1H40")
   SetGlobal("AC#TradeL_BladeRoses","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(800)
~ EXTERN AC#PPDR1 trade_lesser_refresh

CHAIN AC#PPDR1 trade_lesser_stonefire
~From molten memory to the calm of stone and water.~
DO ~TakePartyItem("AX1H12")
   SetGlobal("AC#TradeL_Stonefire","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(800)
~ EXTERN AC#PPDR1 trade_lesser_refresh

CHAIN AC#PPDR1 trade_lesser_rifthome
~Axes remember feuds long after the names are gone.~
DO ~TakePartyItem("AX1H09")
   SetGlobal("AC#TradeL_Rifthome","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(800)
~ EXTERN AC#PPDR1 trade_lesser_refresh

CHAIN AC#PPDR1 trade_lesser_dragonsbreath
~Let the flame that once burned dragons fade into silent ash.~
DO ~TakePartyItem("HALB04")
   SetGlobal("AC#TradeL_DragBreath","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(800)
~ EXTERN AC#PPDR1 trade_lesser_refresh

CHAIN AC#PPDR1 trade_lesser_wave
~A tide turned to killing is no tide for this grove.~
DO ~TakePartyItem("HALB09")
   SetGlobal("AC#TradeL_WaveHalb","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(800)
~ EXTERN AC#PPDR1 trade_lesser_refresh

CHAIN AC#PPDR1 trade_lesser_ras
~Let the dead rest. No more summons.~
DO ~TakePartyItem("SW1H33")
   SetGlobal("AC#TradeL_Ras","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(800)
~ EXTERN AC#PPDR1 trade_lesser_refresh

CHAIN AC#PPDR1 trade_lesser_pixie
~Sleep should be mercy, not ambush.~
DO ~TakePartyItem("DAGG13")
   SetGlobal("AC#TradeL_PixiePrick","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(800)
~ EXTERN AC#PPDR1 trade_lesser_refresh

CHAIN AC#PPDR1 trade_lesser_cutthroat
~Steel named for murder needs quiet most of all.~
DO ~TakePartyItem("SW1H33")
   SetGlobal("AC#TradeL_Cutthroat","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(800)
~ EXTERN AC#PPDR1 trade_lesser_refresh

CHAIN AC#PPDR1 trade_lesser_spectral
~Let echoes return to silence.~
DO ~TakePartyItem("SW1H68")
   SetGlobal("AC#TradeL_SpectralBrand","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(800)
~ EXTERN AC#PPDR1 trade_lesser_refresh

CHAIN AC#PPDR1 trade_lesser_adjatha
~Thirst for magic is still thirst. Be satisfied no more.~
DO ~TakePartyItem("SW1H35")
   SetGlobal("AC#TradeL_Adjatha","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(800)
~ EXTERN AC#PPDR1 trade_lesser_refresh

CHAIN AC#PPDR1 trade_lesser_chaos
~Chaos feeds on crowds. Here, it starves.~
DO ~TakePartyItem("SW2H16")
   SetGlobal("AC#TradeL_SwordChaos","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(800)
~ EXTERN AC#PPDR1 trade_lesser_refresh

CHAIN AC#PPDR1 trade_lesser_albruin
~Hunters of the hidden often become what they fear. Rest now.~
DO ~TakePartyItem("SW1H34")
   SetGlobal("AC#TradeL_Albruin","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(800)
~ EXTERN AC#PPDR1 trade_lesser_refresh

CHAIN AC#PPDR1 trade_lesser_flame
~Fire in a hilt is still fire. The pool will cool it.~
DO ~TakePartyItem("SW1H53")
   SetGlobal("AC#TradeL_SwordFlame","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(800)
~ EXTERN AC#PPDR1 trade_lesser_refresh

CHAIN AC#PPDR1 trade_lesser_daystar
~Light can blind as surely as it guides.~
DO ~TakePartyItem("SW1H31")
   SetGlobal("AC#TradeL_Daystar","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(800)
~ EXTERN AC#PPDR1 trade_lesser_refresh

CHAIN AC#PPDR1 trade_lesser_ssbackstab
~Let betrayal find no purchase here.~
DO ~TakePartyItem("SW1H10")
   SetGlobal("AC#TradeL_SSBackstab","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(800)
~ EXTERN AC#PPDR1 trade_lesser_refresh

CHAIN AC#PPDR1 trade_lesser_belm
~A quick hand learns patience, in time.~
DO ~TakePartyItem("SW1H30")
   SetGlobal("AC#TradeL_Belm","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(800)
~ EXTERN AC#PPDR1 trade_lesser_refresh

CHAIN AC#PPDR1 trade_lesser_dagvenom
~Venom loses its sting in still water.~
DO ~TakePartyItem("MISC75")
   SetGlobal("AC#TradeL_DagVenom","GLOBAL",1)
   ApplySpellRES("AC#PPH1",Player1)
   AddexperienceParty(800)
~ EXTERN AC#PPDR1 trade_lesser_refresh


// Lesser refresh: loop if more lesser remain; else back to root
CHAIN IF ~~ THEN AC#PPDR1 trade_lesser_refresh
~The pool is ready for another burden.~
END
  IF ~~ THEN REPLY ~I have another weapon to surrender.~ EXTERN AC#PPDR1 trade_lesser_menu
  IF ~~ THEN REPLY ~Perhaps we can start over.~ EXTERN AC#PPDR1 trade_root
  IF ~~ THEN REPLY ~Not now.~ EXTERN AC#PPDR1 no_trade_bye
	

