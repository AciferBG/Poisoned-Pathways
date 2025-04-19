BEGIN AC#PPTME

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#PPTME 000
~Hello! It looks like you're comming from Duskwood Dell's direction.~
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

CHAIN IF ~NumTimesTalkedToGT(0)~ THEN AC#PPTME 00X
~Hello again! You remember me? It's Debbie! Debbie Gobblebubble! Maybe you'd like to buy something?~
END
IF~~THEN REPLY ~Sure. Let's see what you have.~ DO ~StartStore("AC#PPTME",LastTalkedToBy())~ EXIT
IF~~THEN REPLY ~Thanks, but I need to go.~ EXTERN AC#PPTME 007