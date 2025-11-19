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
IF~~THEN REPLY ~Who are you?~ EXTERN AC#PPWY1 who_are_you_zombie

	CHAIN IF ~~ THEN AC#PPWY1 who_are_you_zombie
    ~Who I am is not important. What matters is what I once was — a living resident of this once-thriving city. Yet I cannot rest — hear me!~
    END
    IF~~THEN EXTERN AC#PPWY1 no_way

    CHAIN IF ~~ THEN AC#PPWY1 no_way
    ~The trees... they block the path... but I... I can help you! I can see you need to pass. I... I know how!~
    END
    IF~~THEN REPLY ~How can you help me?~ EXTERN AC#PPWY1 help_way
    IF~~THEN REPLY ~I will not be helped by a zombie!~ EXTERN AC#PPWY1 help_way
    
    CHAIN IF ~~ THEN AC#PPWY1 help_way
    ~I will help you, if you help me. The trees... they are bound by the will of the undead treants. If you banish them, the path will open for you.~
    END
    IF~~THEN REPLY ~How am I supposed to do that?~ EXTERN AC#PPWY1 how_help
    IF~~THEN REPLY ~No problem. They wouldn't be the first undead I've torn to pieces.~ EXTERN AC#PPWY1 kill_undead
	IF~~THEN REPLY ~Why should I trust the word of a rotting corpse?~ EXTERN AC#PPWY1 doubt_truth
	
		CHAIN IF ~~ THEN AC#PPWY1 kill_undead
		~The undead are not the problem, but the trees that block the way!~
		END
		IF~~THEN  EXTERN AC#PPWY1 how_help
    
    CHAIN IF ~~ THEN AC#PPWY1 doubt_truth
    ~I have nothing left to lose...~
    END
    IF~~THEN  EXTERN AC#PPWY1 how_help
	
	CHAIN IF ~~ THEN AC#PPWY1 how_help
    ~There is a tomb nearby... its seal repels the undead. Undead like me! I need to reach that tomb. You must take the seal, so that I can finally rest.~
    END
    IF~~THEN DO ~SetGlobal("AC#PPOpenTomb","GLOBAL",1) DestroyItem("MINHP1")~ EXTERN AC#PPWY1 how_help_02
    
    CHAIN IF ~~ THEN AC#PPWY1 how_help_02
    ~With the seal in your hands, you can banish the undead trees. And I... I will at last reach my destination and know peace.~
    END
    IF~~THEN REPLY ~Why do you seek rest?~ EXTERN AC#PPWY1 about_tomb
	IF~~THEN REPLY ~Perhaps it is better if you never reach that tomb.~ EXTERN AC#PPWY1 about_tomb
	IF~~THEN REPLY ~And what happens once the seal is gone? What will you do?~ EXTERN AC#PPWY1 about_tomb
    
        CHAIN IF ~~ THEN AC#PPWY1 about_tomb
        ~Look at me! A restless undead, driven only by longing for eternal rest. Rest in the arms of my beloved! My beloved who lies sealed in her tomb, denied to me by this cursed ward.~
        END
        IF~~THEN REPLY ~Who lies in the tomb?~ EXTERN AC#PPWY1 about_tomb_02
        
        CHAIN IF ~~ THEN AC#PPWY1 about_tomb_02
        ~My beloved Elv-Esster Aened! The love of my life. The love of my death. The love of my unlife.~
        END
        IF~~THEN REPLY ~Alright. Lead the way.~ EXTERN AC#PPWY1 follow_me
		IF~~THEN REPLY ~If she truly loved you, why would her tomb be warded against you?~ EXTERN AC#PPWY1 logic_doubt
		IF~~THEN REPLY ~I could simply burn the fallen trees instead of meddling with tombs.~ EXTERN AC#PPWY1 burn_trees
		IF~~THEN REPLY ~Preposterous. I'll destroy you instead!~ EXTERN AC#PPWY1 kill_zombie
		
			CHAIN IF ~~ THEN AC#PPWY1 logic_doubt
			~The wards were never meant for me! They were to keep others away from her rest. Cruel fate twisted them, barring even my steps. Do not mistake her love—this prison is not of her will!~
			END
			IF~~THEN EXTERN AC#PPWY1 follow_me
			
			CHAIN IF ~~ THEN AC#PPWY1 burn_trees
			~You think flames could harm them? These trees are not wood as you know it. They are husks, undead, bound by the seal itself. Burn them, and they shall only rise again from the ashes. Only by breaking the ward can they be laid to rest—and only then will your path open.~
			END
			IF~~THEN EXTERN AC#PPWY1 follow_me
        
            CHAIN AC#PPWY1 follow_me
            ~You wish to go on, I wish to go home...~ 
			END
			IF~~THEN EXTERN AC#PPWY1 follow_me_bye
			
			CHAIN AC#PPWY1 follow_me_bye
			~Follow me, the tomb is just north of here!~
            DO ~SetGlobal("AC#PPHelpZombie","GLOBAL",1)
			EscapeAreaObject("Tracpp77")~ EXIT
			
			CHAIN AC#PPWY1 kill_zombie
            ~Pah! I am still too weak, but I will find another one to give me a new husk!~
            DO ~Enemy()~ EXIT



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
DO ~AddJournalEntry(@13020,QUEST)
SetGlobal("AC#PPBansheeHead","GLOBAL",1)~ EXIT

CHAIN AC#PPBA1 have_head
~You have it! His head... oh, you have it! At last, I can sleep... I can let go...~
DO ~SetGlobal("AC#PPBansheeHead","GLOBAL",10)
CreateVisualEffectObject("SPDEATH3",Myself)
TakePartyItem("AC#PPHD1")
DestroyItem("AC#PPHD1")
AddexperienceParty(4000)
AddJournalEntry(@13022,QUEST_DONE)
DropItem("AC#PPCO1",[-1.-1])
DestroySelf()~ EXIT

CHAIN AC#PPBA1 fight
~You would hear my voice? Then hear it—and despair!~  
DO ~Enemy()~ EXIT

CHAIN AC#PPBA1 bye
~My mourning echoes through these shattered woods...~  
EXIT

// BLOOD AMNIOTE

BEGIN AC#PPBLO

CHAIN IF ~True()~ THEN AC#PPBLO BLOOD.000
~Another vessel… another bearer of blood. We can hear it coursing through your veins. Red rivers… gahhh!~
END
IF ~~ THEN REPLY ~Who—or what—are you?~ EXTERN AC#PPBLO BLOOD.002
IF ~~ THEN REPLY ~Ah. I had a feeling I shouldn’t have swum down here...~ EXTERN AC#PPBLO BLOOD.001

CHAIN AC#PPBLO BLOOD.001
~Too late to turn back now!~
EXTERN AC#PPBLO BLOOD.002

CHAIN AC#PPBLO BLOOD.002
~Many years ago, when elves still ruled this place, their city crumbled; their towers sank into the earth. Elves were crushed, broken—spilled open like ripe fruit. All their blood seeped into the ground, along with their fear, their despair, their final screams. Many fed the soil with their blood… and from that blood, *we* were born. ~
END
IF ~~ THEN REPLY ~Lovely.~ EXTERN AC#PPBLO BLOOD.003
IF ~~ THEN REPLY ~All that tragedy just to make you? What a waste.~ EXTERN AC#PPBLO BLOOD.003
IF ~~ THEN REPLY ~If blood birthed you, blood will also your end.~ EXTERN AC#PPBLO BLOOD.003

CHAIN AC#PPBLO BLOOD.003
~And now you have come. We want you to join us... to become part of us. We want your precious lifeblood.~
DO ~Enemy()~
EXIT




