// Dialogue wyrd in zombie shape in ACPP70
BEGIN ~AC#PPWY2~

CHAIN IF ~Global("ByeTomb","ACPP77",1)~ THEN AC#PPWY2 hello_bye_tomb
~It is open! You have broken the seal! Now we are united, forever united, my beloved Elv-Esster Aened!!~
END
IF~~THEN DO ~SetGlobal("ByeTomb","ACPP77",10)
CreateVisualEffectObject("SPDEATH3",Myself)
ReallyForceSpell("Wardstone",BEHOLDER_BLAST_VISUAL2)
AddexperienceParty(200)
Kill(Myself)~ EXIT

CHAIN IF ~True()~ THEN AC#PPWY2 hello_open_tomb
~Here it is... the tomb of my beloved! Quickly, remove the seal, so that I may rest at last and you may continue on your journey!~
END
IF~~THEN EXIT

// Dialogue wyrd in zombie shape in ACPP70
BEGIN ~AC#PPWY1~

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#PPWY1 hello_tree_fallen
~Stop! Halt, strangers! You cannot pass this way...~
END
IF~~THEN REPLY ~What happened here?~ EXTERN AC#PPWY1 no_way

    CHAIN IF ~~ THEN AC#PPWY1 no_way
    ~The... the trees... they block the path... but I... I can help you! I can see you need to pass. I... I know how!~
    END
    IF~~THEN REPLY ~How can you help me?~ EXTERN AC#PPWY1 help_way
    
    CHAIN IF ~~ THEN AC#PPWY1 help_way
    ~I will help you, if you help me. The trees... they are bound by the will of the zombie-treants. If you banish them, the path will open for you.~
    END
    IF~~THEN REPLY ~How am I supposed to do that?~ EXTERN AC#PPWY1 how_help
    
    CHAIN IF ~~ THEN AC#PPWY1 how_help
    ~There is a tomb nearby... its seal repels the undead. Undead like me! I need to reach that tomb. You must take the seal, so that I can finally rest.~
    END
    IF~~THEN  EXTERN AC#PPWY1 how_help_02
    
    CHAIN IF ~~ THEN AC#PPWY1 how_help_02
    ~With the seal in your hands, you can banish the undead trees. And I... I will at last reach my destination and know peace.~
    END
    IF~~THEN REPLY ~Why do you seek rest?~ EXTERN AC#PPWY1 about_tomb
    
        CHAIN IF ~~ THEN AC#PPWY1 about_tomb
        ~Look at me! A restless undead, driven only by longing for eternal rest. Rest in the arms of my beloved! My beloved who lies sealed in her tomb, denied to me by this cursed ward.~
        END
        IF~~THEN REPLY ~Who lies in the tomb?~ EXTERN AC#PPWY1 about_tomb_02
        
        CHAIN IF ~~ THEN AC#PPWY1 about_tomb_02
        ~My beloved Elv-Esster Aened! The love of my life. The love of my death. The love of my unlife.~
        END
        IF~~THEN EXTERN AC#PPWY1 follow_me
        
            CHAIN AC#PPWY1 follow_me
            ~You wish to go on, I wish to go home. Follow me, the tomb is just north of here!~
            DO ~SetGlobal("AC#PPOpenTomb","GLOBAL",1)
            EscapeAreaObject("Tracpp77")~ EXIT


// Dialogue Banshee in ACPP76
BEGIN ~AC#PPBA1~

CHAIN IF ~Global("AC#PPBansheeHead","GLOBAL",1)~ THEN AC#PPBA1 hello_need_head
~My mourning echoes through these shattered woods...~
END
IF~~THEN REPLY ~Die, undead wretch!~ EXTERN AC#PPBA1 fight
IF~PartyHasItem("AC#PPHD1")~THEN REPLY ~I believe I’ve found your lover’s head.~ EXTERN AC#PPBA1 have_head
IF~~THEN REPLY ~I’ll be going now.~ EXTERN AC#PPBA1 bye

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
IF~~THEN REPLY ~I’ll find your beloved one's head. I promise.~ EXTERN AC#PPBA1 search_head_bye
IF~PartyHasItem("AC#PPHD1")~THEN REPLY ~Would this be the head you’re looking for?~ EXTERN AC#PPBA1 have_head
IF~~THEN REPLY ~Mhm. Right. Whatever. I need to go.~ EXTERN AC#PPBA1 search_head_bye

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

///BLOOD ANIMOTE

BEGIN AC#PPBLO

CHAIN IF ~True()~ THEN AC#PPBLO BLOOD.000
~Arghhh—another vessel. Sack of Blood. We can hear it beat and flow inside your veins. Red rivers. Gahhh! Yours is especially... dark. Hahaha. Mmm.~
END
IF~~THEN REPLY ~What are you?~ EXTERN AC#PPBLO BLOOD.002
IF~~THEN REPLY ~Ah. I had a feeling I should have swam here...~ EXTERN AC#PPBLO BLOOD.001

CHAIN AC#PPBLO BLOOD.001
~It's too late to turn back now, mhhh.~
EXTERN AC#PPBLO BLOOD.002

CHAIN AC#PPBLO BLOOD.002
~We are the blood of those that bled on this ground. We are their plasma and their ichor and their precious scarlet claret.~
==AC#PPBLO ~We were called blood amniote by other blood sacks that came here. Only one left. One they called Elv-Esster Aened. She imprissoned me here, this damned place...! Aghhh. But at least we took life of those she loved.~
END
IF~~THEN REPLY ~You killed them? When was it?~ EXTERN AC#PPBLO BLOOD.003
IF~~THEN REPLY ~I don't understand any of your babbling, monster.~ EXTERN AC#PPBLO BLOOD.003

CHAIN AC#PPBLO BLOOD.003
~Many years ago. When this place was still ruled by elves. Hah. Their city started to crumble. Of their towers were claimed by earth. Elves... were smashed! Many died. Many fed the earth. And through with their blood, we were born.~
==AC#PPBLO ~Their blood all gathered in the soil—and the fear, and the despair, and—pain. When they realized that I was born, they called their commander. She came when I was devouring her brothers and sisters and children! Mmm.~
==AC#PPBLO ~She couldn't stop me then, she had to stop the fall of her little enclave. But we waited. We grew. With each death, we became better. Stronger.~
==AC#PPBLO ~And now you came. Mhhh. And we want you to become part of us. We want you. We want your precious claret.~
==AC#PPBLO ~We cannot leave. But it doesn't matter. Because you came to us!~
DO ~Enemy()~ EXIT


