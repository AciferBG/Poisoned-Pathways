// Dialoge Skann Delth// Dialogue Eldath priest #2 in Athkatla

BEGIN ~AC#PPSKD~

CHAIN IF ~StateCheck(Myself,STATE_CHARMED)~ THEN AC#PPSKD hello_charmed
~Hey there, friends! Friends, right? You wanted to know where the nastiest poison comes from, didn’t you? Well—lucky you! I've got a map right here. It shows the spot where I usually meet the fella who brews the real stuff. But, listen—just a word of advice, friend to friend: don’t mess around with that guy—smile at him wrong, and you’ll be coughing blood.~ 
END
IF~Global("AC#PPHasMap","GLOBAL",1)~THEN EXTERN AC#PPSKD wheres_my_map
IF~Global("AC#PPHasMap","GLOBAL",0)~THEN EXTERN AC#PPSKD give_map_charmed

	CHAIN IF ~~ THEN AC#PPSKD wheres_my_map
	~Where's my map? I’m feeling kinda dizzy all of a sudden. Think I’ll head to the tavern, get something strong to clear my head.~
	DO ~ChangeEnemyAlly(Myself,NEUTRAL)
	EscapeAreaDestroy(2)~ EXIT
	
	CHAIN IF ~~ THEN AC#PPSKD give_map_charmed
	~Anyway... here's the map. Farewell for now. I’m feeling kinda dizzy all of a sudden. Think I’ll head to the tavern, get something strong to clear my head.~
	DO ~GiveItem("AC#PPMP1",LastTalkedToBy())
	ChangeEnemyAlly(Myself,NEUTRAL)
	EscapeAreaDestroy(2)~ EXIT

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#PPSKD hello_00
~Well now, what do we have here? You lookin’ for something that makes problems disappear... real quiet-like? I’ve got potions, powders, and little drips of doom—if your coin’s honest and your conscience ain’t too fussy.~
END
IF~~THEN REPLY ~That does sound interesting. What exactly are you offering?~ EXTERN AC#PPSKD interest
IF~~THEN REPLY ~I’m not ready to deal just yet.~ EXTERN AC#PPSKD bye
	
CHAIN IF ~True()~ THEN AC#PPSKD hello_02
~Oh, it's you again! What do you want? I’ve got potions, powders, and little drips of doom—if your coin’s honest and your conscience ain’t too fussy.~
END
IF~~THEN REPLY ~You disgust me. The world needs less filth like you!~ EXTERN AC#PPSKD fight
IF~~THEN REPLY ~That does sound interesting. What exactly are you offering?~ EXTERN AC#PPSKD interest
IF~Global("TellSupplier","LOCALS",1) Global("AC#PPHasMap","GLOBAL",0)~THEN REPLY ~Tell me where you get the real good stuff from.~ EXTERN AC#PPSKD tell_me
IF~~THEN REPLY ~I’m not ready to deal just yet.~ EXTERN AC#PPSKD bye

	CHAIN IF ~~ THEN AC#PPSKD interest
	~Oh, a bit of this and that—venoms to silence a snitch, brews to slow a soldier, drops that’ll send a man coughing up his liver. Handy little tools to make your life easier... and theirs shorter.~
	END
	IF~~THEN REPLY ~You're a blight on this city—I should end you right here!~ EXTERN AC#PPSKD fight
	IF~Global("TellSupplier","LOCALS",0) Global("AC#PPHasMap","GLOBAL",0)~THEN REPLY ~I’m looking for something truly powerful.~ DO ~SetGlobal("TellSupplier","LOCALS",1)~ EXTERN AC#PPSKD special_poison
	IF~Global("TellSupplier","LOCALS",1) Global("AC#PPHasMap","GLOBAL",0)~THEN REPLY ~Tell me where you get the real good stuff from.~ EXTERN AC#PPSKD tell_me
	IF~~THEN REPLY ~Not now. I need to think it through.~ EXTERN AC#PPSKD bye

	CHAIN IF ~~ THEN AC#PPSKD special_poison
	~Truth is, I don’t keep the real nasty stuff on me—too many pryin’ eyes, you feel me? But... for the right coin and the right kind of customer, I might know a bloke who knows a bloke who delivers the deadliest poison you’ve ever seen!~
	END
	IF~~THEN REPLY ~Someone like you has no right to draw breath. Prepare to die!~ EXTERN AC#PPSKD fight
	IF~~THEN REPLY ~I'm looking for the person who makes your deadliest poison.~ EXTERN AC#PPSKD tell_me
	IF~~THEN REPLY ~Tell me where you get the real good stuff from.~ EXTERN AC#PPSKD tell_me
	IF~~THEN REPLY ~This isn't the right moment. I'll be back.~ EXTERN AC#PPSKD bye

	CHAIN IF ~~ THEN AC#PPSKD tell_me
	~Ha! You think I’d spill my supplier to the first smooth-talker with a pouch full of coins? Get real. That kind of info don’t come free—and even if it did, I ain’t riskin’ my neck for a stranger in boots too clean for this part of town. Who do you think you are?~
	END
	IF~~THEN EXTERN AC#PPSKD tell_me_cycle

	CHAIN IF ~~ THEN AC#PPSKD tell_me_cycle
	~You’ll need more than words to get me talking!~
	END
	IF~~THEN REPLY ~Please, just tell me.~ EXTERN AC#PPSKD not_telling_bye
	IF~Global("TellPrice","LOCALS",1)~THEN REPLY ~How much did you say the price was again?~ EXTERN AC#PPSKD pay_gold_01
	IF~Global("TellPrice","LOCALS",0)~THEN REPLY ~Everyone has a price. What’s yours?~ DO ~SetGlobal("TellPrice","LOCALS",1)~ EXTERN AC#PPSKD pay_gold_start
	IF~CheckStatGT(LastTalkedToBy,17,STR)~THEN REPLY ~My strength isn’t for show. Do I really have to beat the answer out of you? Choose wisely which side of my fists you’d like to be on.~ EXTERN AC#PPSKD tell_supplier
	IF ~InParty("minsc") !StateCheck("minsc",CD_STATE_NOTVALID) Global("AC#PP_MinscMuscles","GLOBAL",0)~ THEN REPLY ~Minsc, perhaps Skann would feel more cooperative if you showed him your muscles. Would you be so kind?~ EXTERN MinscJ Minsc_show_muscles
	IF~ReputationLT(Player1,6)~THEN REPLY ~I'm <CHARNAME>. People call me notorious. Ask around what happens to those who cross me.~ EXTERN AC#PPSKD threat_rep
	IF~Dead("maevar")~THEN REPLY ~I helped bring down Mae’Var. So unless you want to follow him, you’ll start talking.~ EXTERN AC#PPSKD threat_rep
	IF~ReputationGT(Player1,16)~THEN REPLY ~You might have heard of me— I'm <CHARNAME>. I've brought down worse than you, and I don't need poison to do it. So tell me what I want to know!~ EXTERN AC#PPSKD threat_rep
	IF~GlobalGT("Linvail","GLOBAL",0)~THEN REPLY ~I work for the Shadow Thieves. I doubt they'd be pleased to hear about your little side business.~ EXTERN AC#PPSKD work_shadow_thieves
	IF~GlobalGT("BodhiJob","GLOBAL",0)~THEN REPLY ~Ever heard of that new guild—the one that drains the blood from their enemies? I doubt your poisons would do them much harm. And, well... I work for them.~ EXTERN AC#PPSKD work_bodhi
	IF~~THEN REPLY ~You disgust me. The world needs less filth like you!~ EXTERN AC#PPSKD fight
	IF~~THEN REPLY ~I don’t deal with back-alley scum like you!~ EXTERN AC#PPSKD fight
	IF~~THEN REPLY ~I’ll return when the time’s right.~ EXTERN AC#PPSKD bye	
	
		CHAIN AC#PPSKD Minsc_show_muscles_02
		~That's a hamster. You're threatening me with a rodent?~		
		== AC#PPSKD ~Take your circus act and scram—unless you’ve got gold in your hand or steel at my throat. I’ve got a reputation to keep!~
		== AerieJ  IF ~InParty("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN ~Oh, Minsc... I don’t think he understood Boo’s warning.~
		==ViconiJ IF ~InParty("viconia") !StateCheck("viconia",CD_STATE_NOTVALID)~ THEN ~Maybe keep the hamster in reserve until we’ve mastered the art of intimidation.~
		==JaheiraJ IF ~InParty("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN ~Perhaps we ought to rehearse that little act before attempting it again.~
		==HAERDAJ IF ~InParty("haerdalis") !StateCheck("haerdalis",CD_STATE_NOTVALID)~ THEN ~A valiant effort... but perhaps best refined before an encore.~
		== MazzyJ IF ~InParty("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN ~A bold attempt. Still, timing and delivery are everything.~
		== BEDWIN IF ~InParty("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN ~That certainly didn’t go as planned. Next time, try cruelty paired with intelligence.~ 
		==KorganJ IF ~InParty("korgan") !StateCheck("korgan",CD_STATE_NOTVALID)~ THEN ~Showin' off muscles? I’d rather show him his own bowels spillin’ out. That gets the chatter started, I tell ya!~
		EXIT

	CHAIN IF ~~ THEN AC#PPSKD pay_gold_start
	~Hah... If I told you, I’d be a dead man by dawn...~
	=	
	~Thinkin’ again... safety’s not exactly my strong suit these days. Maybe it’s time to finally head south, eh? Thing is, passage to Calimshan — real ship, real fast — that don’t come cheap. And settin’ up in Calimport? Let’s just say I’ll need a little help gettin’ back on my feet. So if you’re real keen on supportin’ my fresh start... let’s say ten thousand gold.~ 
	END
	IF~~THEN EXTERN AC#PPSKD pay_gold_01
	
	CHAIN IF ~~ THEN AC#PPSKD pay_gold_01
	~For ten thousand gold, I vanish from this cursed city. For ten thousand gold, I’ll forget I ever knew my supplier—and you’ll know everything I do. Deal?~
	END
	IF~PartyGoldGT(9999)~THEN REPLY ~Very well. Here is your money.~ DO ~TakePartyGold(10000)~ EXTERN AC#PPSKD tell_supplier_gold
	IF~~THEN REPLY ~That is too much.~ EXTERN AC#PPSKD not_telling_bye
	IF~PartyGoldLT(10000)~THEN REPLY ~I don't have that much money.~ EXTERN AC#PPSKD not_telling_bye
	
	CHAIN IF ~~ THEN AC#PPSKD tell_supplier_gold
	~Well then—hand over the coins! I don’t know if you’re just mad or plain stupid, payin’ that much for a scrap of info. Not that I care. Soon I’ll be livin’ like a pasha in Calimport!~
	END
	IF~~THEN EXTERN AC#PPSKD tell_supplier_02

CHAIN IF ~~ THEN AC#PPSKD threat_rep
~Oh, it's you? Now that you mention it—folks been whispering about some notorious <PRO_RACE> like you from the North, stirring up trouble in the city...~
END
IF~~THEN REPLY ~Yep, that's me.~ EXTERN AC#PPSKD tell_supplier
IF~~THEN REPLY ~Trouble is what I do best.~ EXTERN AC#PPSKD tell_supplier
IF~~THEN REPLY ~I’m not here to cause trouble. I’m here to end it.~ EXTERN AC#PPSKD tell_supplier

CHAIN IF ~~ THEN AC#PPSKD work_shadow_thieves
~Oh—you’re with the Shadow Thieves? Tell them that I... uh... look, I never meant to step on anyone’s turf.~
END
IF~~THEN REPLY ~Name your supplier and we’ll call it even.~ EXTERN AC#PPSKD tell_supplier

CHAIN IF ~~ THEN AC#PPSKD work_bodhi
~Ah... that new guild. Yeah, I’ve heard stories—nasty ones. They tore my buddy Therrik to bits!~
END
IF~~THEN REPLY ~Yeah, poor Therrik. Screamed like a stuck pig. Probably would've preferred your poison.~ EXTERN AC#PPSKD tell_supplier
IF~~THEN REPLY ~You consider Therrik's fate bad? There's even worse for those who do not cooperate.~ EXTERN AC#PPSKD tell_supplier
IF~~THEN REPLY ~Before he died, Therrik told my masters about you.~ EXTERN AC#PPSKD tell_supplier

CHAIN IF ~~ THEN AC#PPSKD tell_supplier
~Hey, I don’t want no trouble, right? I—I’m just running a bit of a business here...~
END
IF~~THEN EXTERN AC#PPSKD tell_supplier_02

CHAIN IF ~~ THEN AC#PPSKD tell_supplier_02
~You’re lookin’ for the one behind the real nasty poison? Sure. He’s got a name... and probably more blood on his hands than most!~ 
=
~His name’s Delgorth. Weird fellow. I’ve only met him twice—in a glade out in the Snakewood. That’s all I know of him, swear on the gutter gods. I’ll give you his instructions.~
END
IF~~THEN REPLY ~Smart choice.~ EXTERN AC#PPSKD map_bye
IF~~THEN REPLY ~That’s all I needed.~ EXTERN AC#PPSKD map_bye

CHAIN AC#PPSKD map_bye
~The map’ll get you there. Thing’s burnin’ a hole in my pocket anyway. Here—your problem now, not mine anymore.~
=
~We’re done here. Pleasure doin’ business... sort of! If anyone asks — we never spoke. Time for me to vanish.~
DO ~GiveItem("AC#PPMP1",LastTalkedToBy())
EscapeArea()~ EXIT


CHAIN AC#PPSKD fight
~Well, ain’t you the hero type. Shame you picked the wrong roof to play vigilante on! Let’s fight, then! My little friends, to me!~
DO ~SetGlobal("AC#PP_SkannFight","GLOBAL",1)
Enemy()~ EXIT

CHAIN AC#PPSKD bye
~Fine, fine. Come back if you grow a taste for shadows and want your troubles bottled. I'll be here... till I ain't.~
EXIT

CHAIN AC#PPSKD not_telling_bye
~Pah! You won’t get anything from me unless you got something really good to offer. Get lost!~
EXIT


// Dialogue Talonite priest in glade (ambush area)

BEGIN ~AC#PPOR1~

BEGIN ~AC#PPTA1~

CHAIN IF ~True()~ THEN AC#PPTA1 hello_0
~Hey, you in the back—what was your name again? <CHARNAME>? You can come collect your dying friend! And tell his masters: Never cross a Malagent!~
DO ~SetGlobal("CutsceneAmbush","ACPP30",10)
ClearAllActions()
ActionOverride("CUTSPY",DestroySelf())
ActionOverride("AC#PPOR1",EscapeArea())
Wait(1)
EscapeArea()~ EXIT

// Dialogue Eldath priest #2 in glade (ambush area)

BEGIN ~AC#PPEL2~

CHAIN IF ~Global("CutsceneAmbush","ACPP30",10)~ THEN AC#PPEL2 hello_poison
~<CHARNAME>! We’re lucky! I... *cough*... catched that potent poison!~ 
END
IF~~THEN REPLY ~That is clearly evident.~ EXTERN AC#PPEL2 lucky
IF~~THEN REPLY ~Don't worry! I’ll heal you.~ EXTERN AC#PPEL2 lucky
IF~~THEN REPLY ~If you call that luck, I never want to know what misfortune looks like to you.~ EXTERN AC#PPEL2 lucky
IF~~THEN REPLY ~Splendid! Everything turned out well.~ EXTERN AC#PPEL2 lucky
IF~~THEN REPLY ~What are you talking about?~ EXTERN AC#PPEL2 lucky

CHAIN IF ~~ THEN AC#PPEL2 lucky
~I was hit by the poison, but one of the arrows got lodged in my tunic. The tip's still laced with it.~
END
IF~~THEN REPLY ~Couldn’t have worked out better!~ EXTERN AC#PPEL2 bring_arrow_duskwood_dell
IF~~THEN REPLY ~Poisoned and still clinging to your mission. You Eldathyn really are stubborn.~ EXTERN AC#PPEL2 bring_arrow_duskwood_dell
IF~~THEN REPLY ~That arrow may point us straight to the bastard responsible.~ EXTERN AC#PPEL2 bring_arrow_duskwood_dell
IF~~THEN REPLY ~Meaning?~ EXTERN AC#PPEL2 bring_arrow_duskwood_dell

CHAIN IF ~~ THEN AC#PPEL2 bring_arrow_duskwood_dell
~With the poison in hand, we can study it! Well... not me anymore. Eldath's still waters await me. I can feel her pull already... So the task falls to you now!~ 
== AC#PPEL2~You must... must bring this arrow, poison and all, to Most Exalted Fallskeeper Alatoasz Berendim, high priest of my order, in Duskwood Dell. He’ll know how to proceed.~
END
IF~~THEN REPLY ~That's a very long title your high priest is holding.~ EXTERN AC#PPEL2 what_about_title
IF~~THEN REPLY ~You have my word. I’ll take it to him.~ EXTERN AC#PPEL2 show_duskwood_dell
IF~~THEN REPLY ~The Fallskeeper will know, and someone will pay for what’s been done to you.~ EXTERN AC#PPEL2 show_duskwood_dell
IF~~THEN REPLY ~If it helps end this madness, I’ll do it.~ EXTERN AC#PPEL2 show_duskwood_dell
IF~~THEN REPLY ~What about you? I thought you would be the one to work with me!~ EXTERN AC#PPEL2 what_about_you
IF~~THEN REPLY ~I’ve had enough. I want nothing more to do with this.~ EXTERN AC#PPEL2 dont_know_duskwood_dell

CHAIN AC#PPEL2 what_about_title
~Titles mean little to him, truly. But among our order, it honors his wisdom and years of service. Behind it stands a man of rare peace and purpose—you’ll see.~
END
IF~~THEN REPLY ~What about you?~ EXTERN AC#PPEL2 what_about_you
IF~~THEN REPLY ~Very well. Tell me where this place is.~ EXTERN AC#PPEL2 show_duskwood_dell

CHAIN IF ~~ THEN AC#PPEL2 what_about_you
~You need not worry about me. My path ends here, as a river eventually flows into the vast sea and is lost within it. You must carry on the task and go to Duskwood Dell!~
END
IF~~THEN REPLY ~Very well. Tell me where this place is.~ EXTERN AC#PPEL2 show_duskwood_dell
IF ~~ THEN REPLY ~I don't know. I don't want to be part of this anymore.~ EXTERN AC#PPEL2 dont_know_duskwood_dell

	CHAIN IF ~~ THEN AC#PPEL2 dont_know_duskwood_dell
	~The path has already taken you in, even if you step away. Please... if not for me, then for those who may yet be spared. I can do no more. But you still can. Go to Duskwood Dell.~
	END
	IF~~THEN EXTERN AC#PPEL2 show_duskwood_dell

CHAIN IF ~~ THEN AC#PPEL2 show_duskwood_dell
~Duskwood Dell is the heart of my faith—not just in Amn, but across all of Faerûn. It is there that the trail of poison must be followed. My temple lies hidden within the Snakewood. It is difficult to find under normal circumstances... but I shall tell you how to reach it.~
END
IF~~THEN DO ~RevealAreaOnMap("ACPP01")~ EXTERN AC#PPEL2 tell_malagent


CHAIN IF ~~ THEN AC#PPEL2 tell_malagent
~And I almost forgot—our enemy, in his vanity, revealed his true face! Tell Alatoasz that I was poisoned by a Malagent... he will know what that means.~
END
IF~~THEN EXTERN AC#PPEL2 bye_death

CHAIN IF ~~ THEN AC#PPEL2 bye_death
~No more words... Let this forest cradle my breath, and her breeze carry me to the still waters...~
== AerieJ  IF ~InParty("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN ~He was so kind... I wish we could have done more.~
==RasaadJ IF ~InParty("rasaad") !StateCheck("rasaad",CD_STATE_NOTVALID)~ THEN ~Your path ends in stillness, as all must. May your soul merge with the quiet waters you served so faithfully.~
==ViconiJ IF ~InParty("viconia") !StateCheck("viconia",CD_STATE_NOTVALID)~ THEN ~How touching. The weak always love to pretend their end has meaning.~
==JaheiraJ IF ~InParty("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN ~Rest now, priest of Eldath. The forest will remember you, as will we. May your spirit find stillness.~
==HAERDAJ IF ~InParty("haerdalis") !StateCheck("haerdalis",CD_STATE_NOTVALID)~ THEN ~You exit the stage with naught but a whisper and a breeze... A fitting end for one who worshipped silence.~
==HEXXATJ IF ~InParty("hexxat") !StateCheck("hexxat",CD_STATE_NOTVALID)~ THEN ~Another corpse in the dirt. You flesh-born mourn too easily. At least he didn’t scream—it makes disposal so much simpler.~
==NeeraJ IF ~InParty("neera") !StateCheck("neera",CD_STATE_NOTVALID)~ THEN ~Oh no... That’s just awful. I mean, peaceful and all, but still awful. Do you think his goddess really takes him somewhere?~
==ValygarJ IF ~InParty("valygar") !StateCheck("valygar",CD_STATE_NOTVALID)~ THEN ~You chose your place well, priest. A quiet end beneath ancient boughs... May your spirit drift with the wind, far from this poisoned world.~
== JANJ IF ~InParty("Jan") !StateCheck("Jan",CD_STATE_NOTVALID)~ THEN ~Death is like a bad case of the trots—you never feel it comin’ till it’s too late and halfway down your trousers.~
==CerndJ IF ~InParty("cernd") !StateCheck("cernd",CD_STATE_NOTVALID)~ THEN ~Go gently, brother. The leaves shall whisper your name, and the wind shall carry your breath into the endless cycle.~
== KeldorJ IF ~InParty("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ THEN ~He dies with purpose—and in faith. May his goddess receive him.~
== AnomenJ  IF ~InParty("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN ~I honor your devotion. Rest now, servant of Eldath—your sacrifice shall be remembered.~
==NaliaJ IF ~InParty("nalia") !StateCheck("nalia",CD_STATE_NOTVALID)~ THEN ~You gave everything for your faith... I hope your goddess grants you peace, truly. The world could use more like you.~
==MinscJ IF ~InParty("minsc") !StateCheck("minsc",CD_STATE_NOTVALID)~ THEN ~He was a good man, Boo agrees! May the forest cradle him gently... and may the poisoner feel my righteous fury soon!~
== DornJ  IF ~InParty("Dorn") !StateCheck("Dorn",CD_STATE_NOTVALID)~ THEN ~Peace and poison—a charming combination. I’m sure his goddess approves of the irony.~
== BEDWIN IF ~InParty("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN ~An idealist bleeds out in the dirt, babbling about peace. Let the worms have him—perhaps they’ll be inspired to pacifism.~ 
==KorganJ IF ~InParty("korgan") !StateCheck("korgan",CD_STATE_NOTVALID)~ THEN ~If I ever die like that—flat on me back in a pile o’ birdshite, starin’ up at leaves—ye’d best throw me on a pyre quick, else I’ll rise from the grave, ‘fore the shame kills me twice!~ 
== AC#PPEL2 ~Peace... finally...~
DO ~SetGlobal("Die_Eldath","ACPP30",1)
AddJournalEntry(@12004,QUEST)
Kill(Myself)~ EXIT

CHAIN IF ~Global("CutsceneAmbush","ACPP30",1)~ THEN AC#PPEL2 hello_talonite
~Greetings, stranger. A fine place to conduct business out here in the wilds, isn't it? Plenty of mushrooms around—just be careful not to pick the poisonous ones.~ 
== AC#PPTA1 ~No need to pretend, priest. My contacts in Athkatla told me you were coming.~ [STHMA04]
== AC#PPEL2 ~That's good! Then you have brought the poison I so desire?~ 
== AC#PPTA1 ~I have! And you’ll be tasting it soon enough!~ 
== AC#PPEL2 ~What do you mean...~ 
== AC#PPTA1 ~How stupid do you think I am, Eldathyn? You believe I can’t see through your scheming? That I wouldn’t notice those brutes hiding among the trees?~ 
== AC#PPTA1 ~You meant to ambush me, but instead I’ve turned the trap on you. Wadal, my loyal servant?~ 
== AC#PPOR1 ~Yesss, massster?~
== AC#PPTA1 ~Take the special arrow I prepared. Fire it at that miserable peace-craver.~ 
== AC#PPOR1 ~With eassse... Wadal never misssesss.~ 
== AC#PPEL2 ~<CHARNAME>! To me!~ 
== AC#PPTA1 ~Your <CHARNAME> won’t save you. You’ll get the poison you desire, oh yes! Right in your heart!~ 
END
IF ~~ THEN DO ~SetGlobal("CutsceneAmbush","ACPP30",2)
StartCutSceneMode()
StartCutScene("AC#PPCT3")~ EXIT

CHAIN IF ~True()~ THEN AC#PPEL2 hello_0
~This should be the place. Please wait here—I’ll go ahead and try to negotiate. Only intervene if things go poorly.~
DO ~SetGlobal("CutsceneAmbush","ACPP30",1)
ClearAllActions()
StartCutSceneMode()
StartCutScene("AC#PPCT2")
~ EXIT


// Dialogue Eldath priest #2 in Athkatla

BEGIN ~AC#PPEL1~

CHAIN IF ~Global("AC#PPHasMap","GLOBAL",10)~ THEN AC#PPEL1 hello_glade
~Hello again, <CHARNAME>. Shall we depart to Toadstool Hollow?~
END
IF~~THEN REPLY ~Sure! Let’s go.~ EXTERN AC#PPEL1 lets_go
IF~~THEN REPLY ~Not just yet. I need a little more time.~ EXTERN AC#PPEL1 bye_wait

CHAIN IF ~Global("AC#PP_PlotStart","GLOBAL",3)~ THEN AC#PPEL1 hello_02
~Good to see you again! Were you able to make Skann Delth talk? Do you know where he’s meeting the poison supplier?~
END
IF~Global("AC#PPHasMap","GLOBAL",1)
PartyHasItem("AC#PPMP1") ~THEN REPLY ~Yes, I managed to get the information. I’ve got a document that mentions the location.~ DO ~SetGlobal("AC#PPHasMap","GLOBAL",10) TakePartyItem("AC#PPMP1") DestroyItem("AC#PPMP1")~ EXTERN AC#PPEL1 about_glade
IF~~THEN REPLY ~No, I haven’t found anything yet.~ EXTERN AC#PPEL1 bye_wait

CHAIN IF ~~ THEN AC#PPEL1 about_glade
~Excellent. Let me take a look...~
=
~Toadstool Hollow? I know this place. Secluded, rarely visited—an ideal location for a meeting like this. There’s only one path forward now: We go there and see whether the mysterious poisoner reveals himself. Shall we depart?~
END
IF~~THEN REPLY ~Sure! Let’s go.~ EXTERN AC#PPEL1 lets_go
IF~~THEN REPLY ~Not just yet. I need a little more time.~ EXTERN AC#PPEL1 bye_wait

CHAIN AC#PPEL1 lets_go
~Excellent! The journey shouldn't take too long from here.~
=
~Farewell, my dear Ilmaterian friend, thank you again for your hospitality within these sacred halls.~
== SLILMAT ~Farewell, priest of the Hidden Goddess. May Ilmater’s blessings go with you as well.~
== AC#PPEL1 ~Then let us be on our way.~
DO ~SetGlobal("AC#PP_PlotStart","GLOBAL",4)
ClearAllActions()
StartCutSceneMode()
StartCutScene("AC#PPCT1")~ EXIT


CHAIN AC#PPEL1 bye_wait
~Then I shall remain here and wait for you.~
DO ~AddJournalEntry(@12003,QUEST)~ EXIT

// Dialogue Eldath priest #1 in Athkatla

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#PPEL1 hello_01
~Greetings, <CHARNAME>. Forgive me for addressing you by name, but I have observed you for a while and I've finally decided to approach you. I may have need of your help.~
END
IF~~THEN REPLY ~You have my attention. What sort of help do you require?~ EXTERN AC#PPEL1 job
IF~~THEN REPLY ~Gladly—if the pay is right.~ EXTERN AC#PPEL1 job
IF~~THEN REPLY ~I don’t appreciate being spied on.~ EXTERN AC#PPEL1 dont_like_spies
IF~~THEN REPLY ~Find someone else for your troubles.~ EXTERN AC#PPEL1 bye

	CHAIN IF ~~ THEN AC#PPEL1 dont_like_spies
	~I meant no offense. In times such as these, caution is survival. May I speak to you of what I have to offer?~
	END
	IF~~THEN REPLY ~Tell me what troubles you.~ EXTERN AC#PPEL1 job
	IF~~THEN REPLY ~What is it you want?~ EXTERN AC#PPEL1 job
	IF~~THEN REPLY ~I'll listen—if the pay is right.~ EXTERN AC#PPEL1 job
	IF~~THEN REPLY ~Find someone else for your troubles.~ EXTERN AC#PPEL1 bye

CHAIN IF ~~ THEN AC#PPEL1 job
~Allow me to introduce myself. I am Merethan, devoted servant of Eldath, the goddess of peace and groves.~ 
== JaheiraJ IF ~InParty("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN ~Eldath’s servants are rare in times like these. I hope his words carry more than peaceful pleasantries.~
== CerndJ  IF ~InParty("Cernd") !StateCheck("Cernd",CD_STATE_NOTVALID)~ THEN ~An Eldathyn! A gentle presence in a world far too fond of thunder.~
	END
	IF~~THEN REPLY ~Well met, Merethan. What can I do for you?~ EXTERN AC#PPEL1 about_eldath
	IF~~THEN REPLY ~It’s an honor to meet a servant of Eldath. What brings you to me?~ EXTERN AC#PPEL1 about_eldath
	IF~~THEN REPLY ~You know who I am. But I don’t yet know your purpose here, so let’s hear what you want from me.~ EXTERN AC#PPEL1 about_eldath
	IF~~THEN REPLY ~Eldath? Never heard of her before.~ EXTERN AC#PPEL1 about_eldath
	
	CHAIN IF ~~ THEN AC#PPEL1 about_eldath
	~My goddess is the protector of peace, still waters, and quiet places. She teaches us to heal and do no harm. In her name, I require your help. Allow me to explain.~ 
	END
	IF~~THEN EXTERN AC#PPEL1 about_renfeld_01

CHAIN IF ~~ THEN AC#PPEL1 about_renfeld_01
~Not long ago, you crossed paths with a poisoned man—Renfeld, if I recall correctly. You brought him here to Athkatla, badly poisoned.~
== AC#PPEL1 ~I do not know where he is now, nor how he fares. What I do know, however, is that the toxin which struck him down is cause for grave concern.~
== AC#PPEL1 ~Most types of poison can be cured—or at least delayed—with clerical spells or common antidotes. But none of them worked on poor Renfeld. Whatever was used on him resists all attempts to purge it. And there’s even more to worry about.~
END
IF~~THEN DO ~AddJournalEntry(@12000,QUEST)~ EXTERN AC#PPEL1 about_poison

CHAIN IF ~~ THEN AC#PPEL1 about_poison
~The truly troubling part is: This wasn’t the first time this kind of poison has been used—immune to all magic, beyond any known cure. Such occurrences are becoming disturbingly frequent.~
== HaerdaJ  IF ~InParty("haerdalis") !StateCheck("haerdalis",CD_STATE_NOTVALID)~ THEN ~To be undone by a kiss of venom no prayer can touch... such is the cruelty of a world that sings its sorrow in silence.~
== AerieJ  IF ~InParty("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN ~I’ve studied healing prayers, but... I’ve never heard of anything they couldn’t touch. This must be something truly terrifying.~
== ViconiJ  IF ~InParty("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN  ~How quaint. Natha elg'cahl phor jal elg'cahlen: A poison above all poisons.~
== JaheiraJ IF ~InParty("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN ~An incurable poison? That can't be. I know there is a cure. There always is.~
== CerndJ  IF ~InParty("Cernd") !StateCheck("Cernd",CD_STATE_NOTVALID)~ THEN ~This toxin is a crime against life itself. It's not as cutting down a tree, but corruption of all the water that runs under a forest.~
== MazzyJ IF ~InParty("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN ~By the grace of Arvoreen, we must not allow such vile poison to take root! Whoever crafts such wickedness must be held to account.~
== AnomenJ  IF ~InParty("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN ~No matter what, poison is always a coward’s weapon.~
== KeldorJ IF ~InParty("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ THEN ~If there is a power behind this plague of venom, then it must be cast down, for the sake of all decent folk.~
== NaliaJ IF ~InParty("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN  ~As always, those who suffer most are the ones without coin. No bodyguards. No tasters. Just trust in their water—and death in their cups.~
== DornJ  IF ~InParty("Dorn") !StateCheck("Dorn",CD_STATE_NOTVALID)~ THEN ~A poison beyond the reach of your pitiful prayers? Perhaps your gods are simply not listening.~
== AC#PPEL1 ~Even the calmest waters ripple when danger approaches. By the will of the Church of Eldath, I have been tasked to uncover the secret behind this poison.~
END
IF~~THEN REPLY ~I'm curious. Tell me more.~ EXTERN AC#PPEL1 about_poison_02
IF~~THEN REPLY ~That's horrifying! Who could be responsible for this?~ EXTERN AC#PPEL1 about_poison_02
IF~~THEN REPLY ~If someone’s behind this, they’ll regret it soon enough.~ EXTERN AC#PPEL1 about_poison_02
IF~~THEN REPLY ~Perfect poison for someone with a dagger and dark intentions!~ EXTERN AC#PPEL1 about_poison_02
IF~~THEN REPLY ~Sounds useful, this toxin.~ EXTERN AC#PPEL1 about_poison_02

CHAIN IF ~~ THEN AC#PPEL1 about_poison_02
~I initially suspected that one of Faerûn’s more malevolent groups had devised this terrible poison. But my search uncovered something troubling: The poison has been used by unrelated factions, with no alliance or shared interest between them. No shared ambition—only the same deadly means.~
== AC#PPEL1 ~That can only mean a different power is behind this—one that acts on his own, working in the shadows. Someone who delights in the death this poison leaves behind.~
== JANJ IF ~InParty("Jan") !StateCheck("Jan",CD_STATE_NOTVALID)~ THEN ~Silent but violent... This stuff’s like a flatulence at a turnip banquet: You don’t know who did it, but someone’s definitely going to suffer.~
END
IF~~THEN REPLY ~So you want me to face this poison-maker?~ EXTERN AC#PPEL1 about_person
IF~~THEN REPLY ~And just how are we meant to find this mysterious mastermind?~ EXTERN AC#PPEL1 about_person
IF~~THEN REPLY ~Sounds like you have a task in mind for me...~ EXTERN AC#PPEL1 about_person
IF~~THEN REPLY ~Whatever this is, it’s not my problem. Find someone else.~ EXTERN AC#PPEL1 bye

CHAIN IF ~~ THEN AC#PPEL1 about_person
~It will be difficult to find the real perpetrator. We cannot strike at shadows. We must clear the overgrowth gently, one branch at a time, until the path to the poison reveals itself.~ 
== AC#PPEL1 ~I’ve already tried to make contact with someone who might lead us to the one behind all this. There's a shady figure here in the slums of Athkatla who claims he can procure rare poisons. I pretended to be a potential buyer. Unfortunately, I couldn’t get him to reveal the whereabouts of his supplier. He grew wary—and resentful.~
END
IF~~THEN EXTERN AC#PPEL1 first_task

CHAIN IF ~~ THEN AC#PPEL1 first_task
~I seem to lack the persuasive skills required in such dealings. You, however, may prove more capable in such matters.~
== ViconiJ  IF ~InParty("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN  ~You worship peace, but send others to do your bidding when matters grow inconvenient?~
== KORGANJ  IF ~InParty("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN  ~Persuasion, eh? Nothing persuades better than a broken nose and a few missing teeth.~
== JaheiraJ IF ~InParty("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN ~So even the faithful of the gentle goddess know when to call upon sharper tongues.~
== AC#PPEL1 ~I ask you to seek out a poison dealer named Skann Delth in the slums of Athkatla. He is too dim-witted to brew the poisons himself. He has to get them from someone else. If you discover the source of his supply, I ask you to accompany me to confront the one behind it all.~
END
IF~~THEN REPLY ~Fine, I can do that.~ EXTERN AC#PPEL1 job_payment
IF~~THEN REPLY ~What’s in it for me?~ EXTERN AC#PPEL1 job_payment
IF~~THEN REPLY ~No, I won’t do it.~ EXTERN AC#PPEL1 job_payment

CHAIN IF ~~ THEN AC#PPEL1 job_payment
~I do not expect you to act without reward. Gold means little to those of my faith, but I can offer you a number of soothing potions should you agree to assist me in this matter.~
END
IF~~THEN REPLY ~Very well. I'm in.~ EXTERN AC#PPEL1 job_yes
IF~~THEN REPLY ~I'll help you.~ EXTERN AC#PPEL1 job_yes
IF~~THEN REPLY ~No, I’m not doing this.~ EXTERN AC#PPEL1 bye_sure

CHAIN IF ~~ THEN AC#PPEL1 bye_sure
~Are you certain you won’t help me?~
END
IF~~THEN REPLY ~All right, I’ll help you.~ EXTERN AC#PPEL1 job_yes
IF~~THEN REPLY ~I won’t help you.~ EXTERN AC#PPEL1 bye

CHAIN IF ~~ THEN AC#PPEL1 job_yes
~Excellent! Skann Delth usually lingers on the roof of the Copper Coronet, boasting about his brews. Most of them are of little use—tricks and tinctures for fools. You should insist you're looking for something truly dangerous. Try to find out where he gets his poison from.~
END
IF~~THEN EXTERN AC#PPEL1 wait_bye

CHAIN IF ~~ THEN AC#PPEL1 wait_bye
~I will wait for you at the temple of Ilmater in the Slums. His priests offer me shelter whenever I need it. Find me there once you’ve learned anything—so we know where to continue the search for the source of this mysterious poison.~
DO ~AddJournalEntry(@12001,QUEST)
SetGlobal("AC#PP_PlotStart","GLOBAL",3)
EscapeArea()
~ EXIT

CHAIN IF ~~ THEN AC#PPEL1 bye
~That is unfortunate. Are you sure you don't want to help me?~
END
IF~~THEN REPLY ~Alright, I will try help you.~ EXTERN AC#PPEL1 about_person
IF~~THEN REPLY ~Yes, I'm sure. Find someone else.~ EXTERN AC#PPEL1 bye_definitve

CHAIN IF ~~ THEN AC#PPEL1 bye_definitve
~Alright, I shall have to seek help elsewhere.~
END
IF~~THEN DO ~EraseJournalEntry(@12000)
SetGlobal("AC#PP_PlotStart","GLOBAL",20)
EscapeArea()~ EXIT

APPEND ~MINSCJ~
IF ~~ THEN BEGIN Minsc_show_muscles
   SAY ~Muscles? Nay! But behold—BOO! The fury of righteousness!~
   IF ~~ THEN DO ~SetGlobal("AC#PP_MinscMuscles","GLOBAL",1)~ EXTERN ~AC#PPSKD~ Minsc_show_muscles_02
END
END


