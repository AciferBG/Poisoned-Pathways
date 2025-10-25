BEGIN AC#PPTME

CHAIN IF ~NumTimesTalkedTo(0) AreaCheck("ACPP99")~ THEN AC#PPTME 000
~Oho! You're comin’ from the leafy end o’ the woods, aren’t ya? Duskwood Dell, I’d wager a pouch o’ plums!~
END
IF~~THEN REPLY ~Yes, that's true. I've been there.~ EXTERN AC#PPTME 001
IF~~THEN REPLY ~Duskwood Dell? I don't know what you're talking about.~ EXTERN AC#PPTME 002

CHAIN AC#PPTME 001
~Knew it! Well, least they let *someone* in. Bit sniffy, those grove-folk...~
EXTERN AC#PPTME 003

CHAIN AC#PPTME 002
~No need to fib! I saw you sneakin’ round the mossy bits—unless you’ve got a twin with equally muddy boots!~
EXTERN AC#PPTME 003

CHAIN AC#PPTME 003
~Name's Debbie Gobblebubble—five B’s, two G’s, and a whole lotta charm!~
== MazzyJ IF ~InParty("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN ~By Arvoreen, that's a mouthful! Your parents must have had high hopes for you. Well met, cousin!~
==AC#PPTME ~Tried settin’ up shop in the Dell, y’know, but those leaf-lovin’ tree-huggers told me—and I quote—“You have *far* too many weapons.” Pfft! Rude!~
END
IF~~THEN REPLY ~How in the Nine Hells did you get the idea to sell weapons in the sanctuary of the goddess of peace?~ EXTERN AC#PPTME how_the_hell
IF~~THEN REPLY ~Right...~ EXTERN AC#PPTME which_direction

	CHAIN AC#PPTME how_the_hell
	~Honestly? Because there’s no competition there! Where there’s demand, there’s Debbie. That’s how markets work, even in sacred groves.~
	==AC#PPTME ~Besides, even peace-lovers need to not die sometimes, right?~
	END
	IF~~THEN EXTERN AC#PPTME which_direction

CHAIN AC#PPTME which_direction
~So now I'm off... somewhere. Still mullin’ it over. North? South? East by bellybutton?~
END
IF~~THEN REPLY ~Right...~ EXTERN AC#PPTME 004
IF~~THEN REPLY ~Maybe you should go to Athkatla. There's this huge Promenade there.~ DO ~SetGlobal("AC#PPMerSugAth","GLOBAL",1)~ EXTERN AC#PPTME waukeens_promenade
IF ~GlobalGT("AC#_WaukeenMessage","GLOBAL",1)~ THEN REPLY ~You could travel to the Abbey of the Goldspires — the sacred haven of merchants outside of Athkatla.~ DO ~SetGlobal("AC#PPMerSugGold","GLOBAL",1)~ EXTERN AC#PPTME Goldspires  
IF~OR(3) Global("TMAcceptance","GLOBAL",1) Global("ShTrade","GLOBAL",1) Global("MazzyHappy","GLOBAL",1)~THEN REPLY ~Maybe you should try Trademeet. Sounds like your kind o’ crowd!~ DO ~SetGlobal("AC#PPMerSugTra","GLOBAL",1)~ EXTERN AC#PPTME trademeet

CHAIN AC#PPTME 004
~You’re not much of a talker, huh? That’s all right. I talk enough for two! ‘Course, unless my belly starts hollerin’ for some goulash.~
EXTERN AC#PPTME 006

CHAIN AC#PPTME trademeet
~Huh! Bustling market... sounds promising. I’ll give it a think between spoonfuls o’ goulash.~
END 
IF ~~ THEN DO ~AddJournalEntry(@13072,INFO)~ EXTERN AC#PPTME 006

CHAIN AC#PPTME waukeens_promenade
~Huh! Bustling market... sounds promising. I’ll give it a think between spoonfuls o’ goulash.~
END 
IF ~~ THEN DO ~AddJournalEntry(@13073,INFO)~ EXTERN AC#PPTME 006

CHAIN AC#PPTME Goldspires
~Goldspires? Sounds like a fine name for a merchant’s refuge! All right, I’ll head there.~
END 
IF ~~ THEN DO ~AddJournalEntry(@13074,INFO)~ EXTERN AC#PPTME 006

CHAIN AC#PPTME 006
~Speaking o’ stew—goulash’s almost done! Spiced with Corm Orp herbs, kissed by halfling hands, and stirred with a spoon older than my auntie's gossip. You’re welcome to a bowl, and hey, while we’re both here and breathin’, wanna trade a few trinkets? You never know what treasure hides in a halfling’s rumblin’ belly or a humble halfling’s pouch!~
END
IF~~THEN REPLY ~Sure. Let's see what you have.~ DO ~StartStore("AC#PPTME",LastTalkedToBy())~ EXIT
IF~~THEN REPLY ~Thanks, but I need to go.~ EXTERN AC#PPTME 007

CHAIN AC#PPTME 007
~Fair winds and fewer bandits to ya!~
EXIT

CHAIN IF ~AreaCheck("AR0700")~ THEN AC#PPTME 00A
~Well jiggle me jam jars—it’s you again! Debbie Gobblebubble, at your service, remember? You said Athkatla, so here I am! City’s a bit loud, but the snacks are divine. Care to browse my wares? Got new things since the woods!~
END
IF~~THEN REPLY ~Sure. Let's see what you have.~ DO ~StartStore("AC#PPTME",LastTalkedToBy())~ EXIT
IF~~THEN REPLY ~Thanks, but I need to go.~ EXTERN AC#PPTME 007

CHAIN IF ~AreaCheck("AR2000")~ THEN AC#PPTME 00T
~Ah-ha! Knew I’d bump into you again! You suggested Trademeet, and here I am, tradin’ and meetin’. I heard you cleared up some nastiness here. Brave soul! Fancy a peek at my goods? Got somethin’ spicy since the road!~
END
IF~~THEN REPLY ~Sure. Let's see what you have.~ DO ~StartStore("AC#PPTME",LastTalkedToBy())~ EXIT
IF~~THEN REPLY ~Thanks, but I need to go.~ EXTERN AC#PPTME 007

CHAIN IF ~NumTimesTalkedToGT(0)~ THEN AC#PPTME 00X
~Hey hey! It’s you again! Debbie Gobblebubble, still gabbing and still gobbling up business. Wanna see what I’ve got this time?~
END
IF~~THEN REPLY ~Sure. Let's see what you have.~ DO ~StartStore("AC#PPTME",LastTalkedToBy())~ EXIT
IF~~THEN REPLY ~Thanks, but I need to go.~ EXTERN AC#PPTME 007

// Ondonti orcs in random encounter area acpp97:

BEGIN AC#PP971
BEGIN AC#PP972
BEGIN AC#PP973
BEGIN AC#PPON4
BEGIN AC#PPON5

CHAIN IF ~Global("AttackOrcs","ACPP97",2)~ THEN AC#PP971 after_kill
~So much for peaceful orcs! Hah! Let Eldath weep over the carcasses! Come on, lads, we’re done here.~
DO ~SetGlobal("AttackOrcs","ACPP97",10)
EscapeArea()~ EXIT

CHAIN IF ~Global("AttackOrcs","ACPP97",2)~ THEN AC#PP972 after_kill
~So much for peaceful orcs! Hah! Let Eldath weep over the carcasses! Come on, lads, we’re done here.~
DO ~SetGlobal("AttackOrcs","ACPP97",10)
EscapeArea()~ EXIT

CHAIN IF ~True()~ THEN AC#PP971 hello_thank_you
~Peace-loving orcs! Ha! Don’t make me laugh!~
== AC#PP972 ~I say we finish them quick and move on.~
== AC#PP973 ~Quick? Why quick? Let the beasts squeal a bit.~
== AC#PPON4 ~Please, humans... no! We orcs of Eldath. We no fight, no war.~
== AC#PPON5 ~We walk pilgrimage... Eldath’s holy place we seek.~
== AC#PP971 ~Eldath? You pray to that bitch goddess of still waters?~
== AC#PPON4 ~Please... do not spit on name of our goddess!~
== AC#PP972 ~Enough chatter. Let’s take their heads and be done!~
END
IF~~THEN REPLY ~This will be fun!~ EXTERN AC#PP971 orcs_go_on_fight
IF~~THEN REPLY ~Hold a moment. What’s going on here?~ EXTERN AC#PP971 orcs_not_fight

CHAIN IF ~~ THEN AC#PP971 orcs_not_fight
~What’s going on? We’re making Faerûn a better place, that’s what!~
== AC#PP972 ~Two less orcs stinking up these woods!~
== AC#PPON4 ~Please, my <LADYLORD>... we beg you. We only walk in peace. Orcs of Eldath, nothing more.~
END
IF~~THEN REPLY ~Go on then, kill them.~ EXTERN AC#PP971 orcs_go_on_fight
IF~~THEN REPLY ~You will not harm these Orcs.~ EXTERN AC#PP971 orcs_not_fight_03
IF~~THEN REPLY ~Peaceful orcs? Never heard such a thing.~ EXTERN AC#PP972 orcs_not_fight_02

CHAIN IF ~~ THEN AC#PP972 orcs_not_fight_02
~See? Even this <PRO_RACE> doesn’t believe you. Your goddess seems to be doing you a fine service—by remaining silent. Time to set things right.~
== AC#PPON4 ~No! Eldath watches. Even in silence.~
END
IF ~~ THEN REPLY ~Alright, kill them.~ EXTERN AC#PP971 orcs_go_on_fight
IF ~~ THEN REPLY ~They actually said something priests of Eldath often say.~ EXTERN AC#PPON5 orcs_not_eldath
IF ~~ THEN REPLY ~You will not harm these Orcs.~ EXTERN AC#PP971 orcs_not_fight_03

CHAIN IF ~~ THEN AC#PPON5 orcs_not_eldath
~The <PRO_RACE> is right! Peace guides our hand, not bloodlust.~
== AC#PP971 ~Oh? Then why do you both wield axes?~
== AC#PPON4 ~For the pumpkins.~
== AC#PP971 ~Hahaha! I have never heard such nonsense. Time to tear out your black tongue for that!~
END
IF ~~ THEN REPLY ~Very well. Kill them!~ EXTERN AC#PP971 orcs_go_on_fight
IF ~~ THEN REPLY ~You will not harm these Orcs.~ EXTERN AC#PP971 orcs_not_fight_03


CHAIN IF ~~ THEN AC#PP971 orcs_not_fight_03
~What? You're serious? I am Maddlethorpe Jarn, son of Lord Pompabrace Jarn of Esmeltaran!~
== AC#PP972 ~And I am Wimpley Ormath, heir of House Ormath of Murann!~
== AC#PP973 ~You'd best step aside, rabble, and leave this decision to the nobility.~
== AC#PP971 ~Yep. Listen, smart-mouth: You take our fun from us, we’ll gladly gut a few more bodies instead.~
END
IF~~THEN REPLY ~Just joking. Kill the orcs.~ EXTERN AC#PP971 orcs_go_on_fight
IF~~THEN REPLY ~Touch them and you deal with me.~ EXTERN AC#PP971 orcs_no_fight_bye
IF~~THEN REPLY ~And I am <CHARNAME>, son of the lord of murder.~ EXTERN AC#PP972 orcs_no_fight_son_murder
IF ~~ THEN REPLY ~Don’t you know it brings misfortune to slay a follower of Eldath?~ EXTERN AC#PP972 orcs_misfortune
IF~~THEN REPLY ~Big titles... but I see little men hiding behind them.~ EXTERN AC#PP971 orcs_no_fight_bye
IF~~THEN REPLY ~There’s no honor in butchering pilgrims. Walk away while you can.~ EXTERN AC#PP971 orcs_no_fight_bye

	CHAIN IF ~~ THEN AC#PP972 orcs_misfortune
	~Misfortune? Hah! The only misfortune here is that these beasts still draw breath.~
	== AC#PP971 ~You sound like one of those soft-hearted druids from the north. Do you plan to pray the monsters into submission?~
	== AC#PP972 ~Come now, spare us your sermons. Gold and steel rule Amn — not pity.~
	END
	IF~~THEN REPLY ~Just joking. Kill the orcs.~ EXTERN AC#PP971 orcs_go_on_fight
	IF~~THEN REPLY ~Touch them and you deal with me.~ EXTERN AC#PP971 orcs_no_fight_bye
	
	CHAIN IF ~~ THEN AC#PP972 orcs_no_fight_son_murder
	~Haha! What? So you plan to skin the orcs, then?~
	== AC#PP971 ~Uh... I don't think <PRO_HESHE> wants that... something about <PRO_HIMHER> seems off. Let's get out of here.~
	== AC#PP972 ~Nonsense! I won't be cowed by some random <PRO_RACE>!~
	END
	IF~~THEN REPLY ~Just joking. Kill the orcs.~ EXTERN AC#PP971 orcs_go_on_fight
	IF~~THEN REPLY ~Touch them and you deal with me.~ EXTERN AC#PP971 orcs_no_fight_bye



CHAIN IF ~~ THEN AC#PP971 orcs_go_on_fight
~Come on, lads! Orcs, do us a favor—at least try to fight back, eh?~
DO ~SetGlobal("AttackOrcs","ACPP97",1)~ EXIT

CHAIN IF ~~ THEN AC#PP971 orcs_no_fight_bye
~Looks like the orcs found themselves some friends! Fine by me. Then you can all die together!~
DO ~SetGlobal("OrcsGood","ACPP97",1) Enemy()~ EXIT

CHAIN IF ~Global("OrcsGood","ACPP97",2)~ THEN AC#PPON4 hello_thank_you
~You save us. We thank.~
END
IF~~THEN REPLY ~You could've at least helped defend your heads!~ EXTERN AC#PPON4 orc_want_no_fight
IF~~THEN REPLY ~Where will you go now?~ EXTERN AC#PPON4 duskwood_dell

CHAIN IF ~~ THEN AC#PPON4 orc_want_no_fight
~No… we not fight. Eldath say peace only.~
END
IF~~THEN EXTERN AC#PPON4 duskwood_dell

CHAIN IF ~~ THEN AC#PPON4 duskwood_dell
~We go Duskwood Dell. Maybe we meet again there.~
END
IF~~THEN REPLY ~You know where this place is?~ EXTERN AC#PPON4 know_duskwood_dell
IF~~THEN REPLY ~Then go. We’ll see you there.~ EXTERN AC#PPON4 bye

CHAIN IF ~~ THEN AC#PPON4 know_duskwood_dell
~Yes. Eldath show in dreams... again and again.~
END
IF~~THEN EXTERN AC#PPON4 bye

CHAIN IF ~~ THEN AC#PPON4 bye
~We see you in Duskwood Dell. Farewell.~
DO ~SetGlobal("AC#PP_Helped_Orcs","GLOBAL",1)
AddexperienceParty(500)
ActionOverride("AC#PPON5",EscapeArea())
EscapeArea()~ EXIT

CHAIN IF ~Global("OrcsGood","ACPP97",1)
CombatCounterGT(0)~ THEN AC#PPON4 hello_thank_you
~Me no fight!~
EXIT

CHAIN IF ~Global("OrcsGood","ACPP97",1)
CombatCounterGT(0)~ THEN AC#PPON5 hello_thank_you
~Me no fight!~
EXIT
