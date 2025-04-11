// Dialogue Banshee in ACPP76
BEGIN ~AC#PPBA1~

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#PPBA1 hello_01
~Oh, my beloved... my beloved! Why did I take your life? What have I done? I could scream from grief!~
END
IF~~THEN REPLY ~Die, undead wretch!~ EXTERN AC#PPBA1 fight
IF~~THEN REPLY ~No, anything but screaming—please!~ EXTERN AC#PPBA1 help
IF~~THEN REPLY ~Please, lady, let me help you.~ EXTERN AC#PPBA1 help
IF~~THEN REPLY ~Wrong tower. I’ll be going now.~ EXTERN AC#PPBA1 bye

CHAIN IF ~True()~ THEN AC#PPBA1 hello_02
~My mourning echoes through these shattered woods...~
END
IF~~THEN REPLY ~Die, undead wretch!~ EXTERN AC#PPBA1 fight
IF~~THEN REPLY ~How can I help you?~ EXTERN AC#PPBA1 help
IF~PartyHasItem("AC#PPHD1")~THEN REPLY ~I believe I’ve found your lover’s head.~ EXTERN AC#PPBA1 have_head
IF~~THEN REPLY ~I’ll be going now.~ EXTERN AC#PPBA1 bye

CHAIN IF ~~ THEN AC#PPBA1 help
~Help me? You? I can feel your warmth through the chill of my cruelty... Why would a mortal offer aid to something like me?~
END
IF~~THEN REPLY ~You’re right. Why help you when I could destroy you instead?~ EXTERN AC#PPBA1 fight
IF~~THEN REPLY ~That’s just who I am. What do you need to find peace?~ EXTERN AC#PPBA1 eternal_rest
IF~~THEN REPLY ~I’ll come back later.~ EXTERN AC#PPBA1 bye

CHAIN IF ~~ THEN AC#PPBA1 eternal_rest
~On the night the city fell into ruin, I only meant to shield him... to hold him close. But my sorrow, my power... it became a noose. My hair wrapped around his throat, and I—oh gods—I didn’t even realize... until it was too late.~
=
~With sorrow as my only companion, I retreated to this lonely spire… but even here, solace slips through my flowing hair like mist. If only I had his head—his beautiful face—to cradle in my arms once more... then perhaps I could sleep.~
END
IF~~THEN REPLY ~I’ll find it. I promise.~ EXTERN AC#PPBA1 search_head_bye
IF~PartyHasItem("AC#PPHD1")~THEN REPLY ~Would this be the head you’re looking for?~ EXTERN AC#PPBA1 have_head

CHAIN AC#PPBA1 search_head_bye
~Find him... and I shall finally rest.~  
DO ~SetGlobal("AC#PPBansheeHead","GLOBAL",1)~ EXIT

CHAIN AC#PPBA1 have_head
~You have it! His head... oh, you have it! At last, I can sleep... I can let go...~
DO ~SetGlobal("AC#PPBansheeHead","GLOBAL",10)
CreateVisualEffectObject("SPDEATH3",Myself)
TakePartyItem("AC#PPHD1")
DestroyItem("AC#PPHD1")
AddexperienceParty(4000)
DropItem("AC#PPCO1",[-1.-1])
DestroySelf()~ EXIT

CHAIN AC#PPBA1 fight
~You would hear my voice? Then hear it—and despair!~  
DO ~Enemy()~ EXIT

CHAIN AC#PPBA1 bye
~My mourning echoes through these shattered woods...~  
EXIT


