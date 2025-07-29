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
IF~~THEN REPLY ~Maybe you should go to Athkatla. There's this huge Promenade there.~ DO ~SetGlobal("AC#PPMerSugAth","GLOBAL",1)~ EXTERN AC#PPTME 005
IF~OR(3) Global("TMAcceptance","GLOBAL",1) Global("ShTrade","GLOBAL",1) Global("MazzyHappy","GLOBAL",1)~THEN REPLY ~Maybe you should try Trademeet. Sounds like your kind o’ crowd!~ DO ~SetGlobal("AC#PPMerSugTra","GLOBAL",1)~ EXTERN AC#PPTME 005

CHAIN AC#PPTME 004
~You’re not much of a talker, huh? That’s all right. I talk enough for two! ‘Course, unless my belly starts hollerin’ for some goulash.~
EXTERN AC#PPTME 006

CHAIN AC#PPTME 005
~Huh! Big city or bustling market... sounds promising. I’ll give it a think between spoonfuls o’ goulash.~
EXTERN AC#PPTME 006

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


/*
CHAIN IF ~NumTimesTalkedTo(0) AreaCheck("ACPP99")~ THEN AC#PPTME 000
~Hello! It looks like you're coming from Duskwood Dell's direction.~
END
IF~~THEN REPLY ~Yes, that's true. I've been there.~ EXTERN AC#PPTME 001
IF~~THEN REPLY ~Duskwood Dell? I don't know what you are talking about.~ EXTERN AC#PPTME 002

CHAIN AC#PPTME 001
~Rigth. Well, at least they let SOMEONE in.~
EXTERN AC#PPTME 003

CHAIN AC#PPTME 002
~No need to lie, really. I think I saw you there.~
EXTERN AC#PPTME 003

CHAIN AC#PPTME 003
~I'm Debbie Gobblebubble. Yes. There are five b letters in my surname and I don't mind it. With my name, that's seven of these.~
==AC#PPTME ~You see I wanted to sell a few things in Duskwood Dell, but the priests and druids weren't really happy, because I, and this is a quote, "have too many weapons". Phew! These guys are WEIRD.~
==AC#PPTME ~Anyway, I am on my way... well... somewhere else. I'm still deciding where should I go.~
END
IF~~THEN REPLY ~Right...~ EXTERN AC#PPTME 004
IF~~THEN REPLY ~Maybe you should go to Athkatla. There is this huge Promenade there?~ DO ~SetGlobal("AC#PPMerSugAth","GLOBAL",1)~ EXTERN AC#PPTME 005
IF~OR(3) Global("TMAcceptance","GLOBAL",1) Global("ShTrade","GLOBAL",1) Global("MazzyHappy","GLOBAL",1)~THEN REPLY ~Maybe you should go to Trademeet. It sounds like a fine place to, well... trade!~ DO ~SetGlobal("AC#PPMerSugTra","GLOBAL",1)~ EXTERN AC#PPTME 005

CHAIN AC#PPTME 004
~...~
EXTERN AC#PPTME 006

CHAIN AC#PPTME 005
~I'll think about this.~
EXTERN AC#PPTME 006

CHAIN AC#PPTME 006
~Anyway, I'm making some goulash, you can have some if you want. And... since we are both here, and adventurers like yourself need all sorts of things, we can also trade, if you want.~
END
IF~~THEN REPLY ~Sure. Let's see what you have.~ DO ~StartStore("AC#PPTME",LastTalkedToBy())~ EXIT
IF~~THEN REPLY ~Thanks, but I need to go.~ EXTERN AC#PPTME 007

CHAIN AC#PPTME 007
~Sure, have a good one!~
EXIT

CHAIN IF ~AreaCheck("AR0700")~ THEN AC#PPTME 00A
~Oh! It's you! Well, of course it's you. It's me: Debbie! Debbie Gobblebubble! You suggested that I should see Athkatla so... here I am! Would you like to buy something? I've got something new since we met on the road.~
END
IF~~THEN REPLY ~Sure. Let's see what you have.~ DO ~StartStore("AC#PPTME",LastTalkedToBy())~ EXIT
IF~~THEN REPLY ~Thanks, but I need to go.~ EXTERN AC#PPTME 007

CHAIN IF ~AreaCheck("AR2000")~ THEN AC#PPTME 00T
~Oh! It's you! Well, of course it's you. It's me: Debbie! Debbie Gobblebubble! You suggested that I should see Trademeet so... here I am! I heard the place had few problems, but I was told you handled them! Nice! I've got something new since we met on the road. Would you like to take a look?~
END
IF~~THEN REPLY ~Sure. Let's see what you have.~ DO ~StartStore("AC#PPTME",LastTalkedToBy())~ EXIT
IF~~THEN REPLY ~Thanks, but I need to go.~ EXTERN AC#PPTME 007


CHAIN IF ~NumTimesTalkedToGT(0)~ THEN AC#PPTME 00X
~Hello again! You remember me? It's Debbie! Debbie Gobblebubble! Maybe you'd like to buy something?~
END
IF~~THEN REPLY ~Sure. Let's see what you have.~ DO ~StartStore("AC#PPTME",LastTalkedToBy())~ EXIT
IF~~THEN REPLY ~Thanks, but I need to go.~ EXTERN AC#PPTME 007
*/