// Dialogue wyrd in zombie shape in ACPP70
BEGIN ~AC#PPWY2~

CHAIN IF ~Global("ByeTomb","ACPP77",1)~ THEN AC#PPWY2 hello_bye_tomb
~Es ist offen! Ihr habt das Siegel gebannt! Nun sind wir vereint, für immer vereint, meine geliebte Elv-Esster Aened!!~
END
IF~~THEN DO ~SetGlobal("ByeTomb","ACPP77",10)
CreateVisualEffectObject("SPDEATH3",Myself)
ReallyForceSpell("Wardstone",BEHOLDER_BLAST_VISUAL2)
AddexperienceParty(200)
Kill(Myself)~ EXIT

CHAIN IF ~True()~ THEN AC#PPWY2 hello_open_tomb
~Hier ist es... das Grab meiner Geliebten! Rasch, entfernt das Siegel, damit ich ruhen kann und Ihr weiterreisen könnt!~
END
IF~~THEN EXIT

// Dialogue wyrd in zombie shape in ACPP70
BEGIN ~AC#PPWY1~

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#PPWY1 hello_tree_fallen
~Halt! Haltet ein, Fremde! Hier geht es nicht mehr weiter...~
END
IF~~THEN REPLY ~Was ist passiert?~ EXTERN AC#PPWY1 no_way

	CHAIN IF ~~ THEN AC#PPWY1 no_way
	~Die... die Bäume... sie versperren den Weg... doch ich... ich kann Euch helfen! Ich erkenne, dass Ihr passieren müsst. Ich... ich weiß, wie!~
	END
	IF~~THEN REPLY ~Wie könnt Ihr mir helfen?~ EXTERN AC#PPWY1 help_way
	
	CHAIN IF ~~ THEN AC#PPWY1 help_way
	~Ich helfe Euch, indem Ihr mir helft. Ihr könnt die Bäume wegbewegen... sie... sie werden von den Zombie-Treants kontrolliert. Wenn Ihr die Zombie-Treants bannt, werden sich die Bäume Euch beugen.~
	END
	IF~~THEN REPLY ~Wie soll ich das bewerkstelligen?~ EXTERN AC#PPWY1 how_help
	
	CHAIN IF ~~ THEN AC#PPWY1 how_help
	~Es... es gibt in der Nähe ein Grabmal... dessen Siegel... Untote fernhält. Untote wie mich! Ich muss in dieses Grabmal. Ihr nehmt das Siegel, sodass ich letzte Ruhe finde.~
	END
	IF~~THEN  EXTERN AC#PPWY1 how_help_02
	
	CHAIN IF ~~ THEN AC#PPWY1 how_help_02
	~Habt Ihr das Siegel, könnt Ihr die untoten Bäume bannen. Und ich bin am Ziel meiner Reise und kann ruhen.~
	END
	IF~~THEN REPLY ~Warum ruhen?~ EXTERN AC#PPWY1 about_tomb
	
		CHAIN IF ~~ THEN AC#PPWY1 about_tomb
		~Seht mich doch an! Ein rastloser Untoter, getrieben von Sehnsucht nach ewiger Ruhe. Ruhe in den Armen meiner Geliebten! Der Geliebten, die in ihrem Grab ruht. Ein Grab, das mir durch das Siegel verwehrt bleibt.~
		END
		IF~~THEN REPLY ~Wer liegt in dem Grab?~ EXTERN AC#PPWY1 about_tomb_02
		
		CHAIN IF ~~ THEN AC#PPWY1 about_tomb_02
		~Meine geliebte Elv-Esster Aened! Die Liebe meines Lebens. Die Liebe meines Todes. Die Liebe meines Untodes.~
		END
		IF~~THEN EXTERN AC#PPWY1 follow_me
		
			CHAIN AC#PPWY1 follow_me
			~Ihr wollt weiterkommen, ich will heimkommen. Folgt mir, das Grabmal ist gleich im Norden!~  
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


