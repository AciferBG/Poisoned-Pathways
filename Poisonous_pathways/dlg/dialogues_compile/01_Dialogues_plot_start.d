// Dialogue Talonie priest  in glade (ambush area)

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
~<CHARNAME>! We’re... lucky! I... argh...~ [GPRIM08]
END
IF~~THEN REPLY ~You call that luck?~ EXTERN AC#PPEL2 lucky
IF~~THEN REPLY ~So it seems.~ EXTERN AC#PPEL2 lucky
IF~~THEN REPLY ~Hold still! I’ll heal you.~ EXTERN AC#PPEL2 lucky

	CHAIN IF ~~ THEN AC#PPEL2 lucky
	~The poison struck true, and soon I’ll stand before the Eternal Waterfalls... but... one arrow missed its mark and lodged here in my tunic... still laced with the poison!~
	END
	IF~~THEN REPLY ~Couldn’t have worked out better!~ EXTERN AC#PPEL2 bring_arrow_duskwood_dell
	IF~~THEN REPLY ~Meaning?~ EXTERN AC#PPEL2 bring_arrow_duskwood_dell
	
		CHAIN IF ~~ THEN AC#PPEL2 bring_arrow_duskwood_dell
		~With the poison in hand, we can study it! Well... not me anymore. That task falls to you now! You must... you must bring this arrow, poison and all, to Most Exalted Fallskeeper Alatoasz Berendim, high priest of my order, in Duskwood Dell. He’ll know how to proceed.~
		END
		IF~~THEN REPLY ~What about you?~ EXTERN AC#PPEL2 what_about_you
		IF~~THEN REPLY ~Very well. Tell me where this place is.~ EXTERN AC#PPEL2 show_duskwood_dell
		
CHAIN IF ~~ THEN AC#PPEL2 what_about_you
	~You need not worry about me. My path ends here, as a river eventually flows into the vast sea and is lost within it. You must carry on the task and go to Duskwood Dell!~
	END
	IF~~THEN REPLY ~Very well. Tell me where this place is.~ EXTERN AC#PPEL2 show_duskwood_dell

	CHAIN IF ~~ THEN AC#PPEL2 show_duskwood_dell
	~Duskwood Dell lies hidden within the Snakewood. It's hard to find under normal circumstances, but I shall tell you how to reach it...~
	END
	IF~~THEN DO ~RevealAreaOnMap("ACPP01")~ EXTERN AC#PPEL2 tell_malagent

		CHAIN IF ~~ THEN AC#PPEL2 tell_malagent
		~And I almost forgot—our enemy, in his vanity, revealed his true face! Tell Alatoasz that I was poisoned by a Malagent... he will know what that means.~
		END
		IF~~THEN EXTERN AC#PPEL2 bye_death

CHAIN IF ~~ THEN AC#PPEL2 bye_death
	~Let me take my final breath here in this beautiful forest. I can feel the breath of the goddess... peace...~ 
	DO ~SetGlobal("Die_Eldath","ACPP30",1)
	Kill(Myself)~ EXIT

CHAIN IF ~Global("CutsceneAmbush","ACPP30",1)~ THEN AC#PPEL2 hello_talonite
	~Greetings, stranger. A fine place to conduct business out here in the wilds, wouldn’t you say? Plenty of mushrooms around—just be careful not to pick the poisonous ones.~ 
	== AC#PPTA1 ~No need to pretend, priest. My contacts in Athkatla told me you were coming.~ [STHMA04]
	== AC#PPEL2 ~Then you have brought the poison I so desire?~ 
	== AC#PPTA1 ~I have! And you’ll be tasting it soon enough!~ 
	== AC#PPEL2 ~What do you mean...~ 
	== AC#PPTA1 ~How stupid do you think I am, Eldathyn? You believe I can’t see through your scheming? That I wouldn’t notice those brutes hiding among the trees?~ 
	== AC#PPTA1 ~You meant to ambush me, but instead I’ve turned the trap on you.~ 
	== AC#PPEL2 ~<CHARNAME>! To me!~ 
	== AC#PPTA1 ~Your <CHARNAME> won’t save you. You’ll get the poison you crave, oh yes. Right in the heart!~ 
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


// Dialogue Eldath priest #1 in Athkatla

BEGIN ~AC#PPEL1~

CHAIN IF ~Global("AC#PP_PlotStart","GLOBAL",3)~ THEN AC#PPEL1 hello_02
~Good to see you again! Shall we go and begin the search for the poisoner?~
END
IF~~THEN REPLY ~Yes, let’s go.~ EXTERN AC#PPEL1 lets_go
IF~~THEN REPLY ~No, I need a little more time.~ EXTERN AC#PPEL1 bye_wait

	CHAIN IF ~~ THEN AC#PPEL1 lets_go
	~Excellent! My dear friend, would you be so kind as to inform my acolyte that we are departing?~
	== SLILMAT ~Of course, priest of the Hidden Goddess.~
	== AC#PPEL1 ~Then let us be on our way.~
	DO ~SetGlobal("AC#PP_PlotStart","GLOBAL",4)
	ClearAllActions()
	StartCutSceneMode()
	StartCutScene("AC#PPCT1")
	~ EXIT

CHAIN IF ~~ THEN AC#PPEL1 bye_wait
~Then I shall remain here and wait for you.~
EXIT

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#PPEL1 hello_01
~Greetings, <CHARNAME>. Forgive me for addressing you by name, but I have observed you for a time and believe I may have need of your help.~
END
IF~~THEN REPLY ~What is it you want?~ EXTERN AC#PPEL1 job
IF~~THEN REPLY ~Gladly—if the pay is right.~ EXTERN AC#PPEL1 job
IF~~THEN REPLY ~Find someone else for your troubles.~ EXTERN AC#PPEL1 bye

CHAIN IF ~~ THEN AC#PPEL1 job
~Thank you for offering me a moment of your valuable time. I am Merethan, devoted servant of Eldath, the Green Goddess. Allow me to get to the point: not long ago, you rescued poor Renfeld and brought him to Athkatla, after he had been poisoned by unknown assailants. I am not affiliated with any of the factions involved—I investigate solely on behalf of the Church of Eldath. The appearance of this poison greatly troubles me, as it is not the first time someone has been targeted with a toxin for which no magical cure exists.~
END
IF~~THEN REPLY ~What do you mean?~ EXTERN AC#PPEL1 about_poison
IF~~THEN REPLY ~Go on.~ EXTERN AC#PPEL1 about_poison

	CHAIN IF ~~ THEN AC#PPEL1 about_poison
	~As you may know, most types of poison can be cured—or at least delayed—with simple clerical spells. But in this case, even the strongest divine magic has failed. There is no antidote for this poison, for it resists all of our spells. All we can do is offer comfort to the dying in their final breaths—or pray for a miracle that their body overcomes it on its own.~
	END
	IF~~THEN REPLY ~Please, go on.~ EXTERN AC#PPEL1 about_poison_02

	CHAIN IF ~~ THEN AC#PPEL1 about_poison_02
	~Since this poison has been used by various opposing factions, it seems unlikely that any one group created it—especially as they are now turning it against one another. Someone—or something—else must be behind it. And I intend to find out who.~
	END
	IF~~THEN REPLY ~How do you plan to find such a person?~ EXTERN AC#PPEL1 about_person
	IF~~THEN REPLY ~And you want me to find this person for you.~ EXTERN AC#PPEL1 about_person

	CHAIN IF ~~ THEN AC#PPEL1 about_person
	~I’ve already made contact with this person, posing as a potential buyer of the poison. At least, I hope I have. All the intermediaries I dealt with after Renfeld’s poisoning were... shady, to say the least.~
	END
	IF~~THEN EXTERN AC#PPEL1 bodyguard

CHAIN IF ~~ THEN AC#PPEL1 bodyguard
~And this is where you come in. I’ve arranged a meeting with the unknown poisoner. But I am a priest of the Goddess of Peace—my spells seem ineffective against this foe, and without them I may struggle to bring the culprit to justice. I ask you to accompany me to the meeting, but remain in the background so as not to startle the stranger. Still, your presence is for my protection, so let me speak plainly.~
END
IF~~THEN REPLY ~I can do that.~ EXTERN AC#PPEL1 job_payment
IF~~THEN REPLY ~What’s in it for me?~ EXTERN AC#PPEL1 job_payment
IF~~THEN REPLY ~No, I won’t do it.~ EXTERN AC#PPEL1 job_payment

	CHAIN IF ~~ THEN AC#PPEL1 job_payment
	~I do not expect you to act without reward. Gold means little to those of my faith, but I can offer you a number of soothing potions should you agree to assist me in this matter.~
	END
	IF~~THEN REPLY ~Very well.~ EXTERN AC#PPEL1 job_yes
	IF~~THEN REPLY ~No, I’m not doing this.~ EXTERN AC#PPEL1 bye_sure

		CHAIN IF ~~ THEN AC#PPEL1 bye_sure
		~Are you certain you won’t help me?~
		END
		IF~~THEN REPLY ~All right, I’ll help you.~ EXTERN AC#PPEL1 job_yes
		IF~~THEN REPLY ~I won’t help you.~ EXTERN AC#PPEL1 bye

		CHAIN IF ~~ THEN AC#PPEL1 job_yes
		~Excellent! The agreed meeting point lies deep in a remote patch of forest. We need not depart immediately. Prepare yourself and speak to me again when you are ready. Then I’ll send my acolyte to contact the intermediary, and we’ll be on our way.~
		END
		IF~~THEN EXTERN AC#PPEL1 wait_bye

CHAIN IF ~~ THEN AC#PPEL1 wait_bye
~I will wait for you at the temple of Ilmater in the slums. Find me there when you are ready to depart!~
DO ~SetGlobal("AC#PP_PlotStart","GLOBAL",3)
EscapeArea()
~ EXIT

CHAIN IF ~~ THEN AC#PPEL1 bye
~That is unfortunate. Very well, I shall have to seek help elsewhere.~
DO ~SetGlobal("AC#PP_PlotStart","GLOBAL",20)
EscapeArea()~ EXIT


