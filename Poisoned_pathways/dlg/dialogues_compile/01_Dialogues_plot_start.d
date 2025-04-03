// Dialogue Talonie priest in glade (ambush area)

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
~<CHARNAME>! We—we did something truly important...! We’re... lucky! I... argh...~ [GPRIM08]
== ValygarJ IF ~InParty("Valygar") !StateCheck("Valygar",CD_STATE_NOTVALID)~ THEN ~Remain still. Perhaps we can at least try to slow that poison, <CHARNAME>.~
== YoshJ IF ~InParty("yoshimo") !StateCheck("yoshimo",CD_STATE_NOTVALID)~ THEN ~I fear that this man's life is sealed.~
== AC#PPEL2 ~I... I have it...~
END
IF~~THEN REPLY ~You call that luck? You're hurt!~ EXTERN AC#PPEL2 lucky
IF~~THEN REPLY ~What are you even talking about?~ EXTERN AC#PPEL2 lucky
IF~~THEN REPLY ~Hold still! I’ll heal you. I'll fix this!~ EXTERN AC#PPEL2 lucky

CHAIN IF ~~ THEN AC#PPEL2 lucky
~The poison struck true, and soon I’ll stand before the Eternal Waterfalls... but... one arrow missed its mark and lodged here in my tunic... still laced with the poison!~
END
IF~~THEN REPLY ~Couldn’t have worked out better!~ EXTERN AC#PPEL2 bring_arrow_duskwood_dell
IF~~THEN REPLY ~Meaning?~ EXTERN AC#PPEL2 bring_arrow_duskwood_dell

CHAIN IF ~~ THEN AC#PPEL2 bring_arrow_duskwood_dell
~With the poison in hand, we can study it! Well... not me anymore. That task falls to you now! I am sorry, <CHARNAME>. Child of Bhaal. You must... you must bring this arrow, poison and all, to Most Exalted Fallskeeper Alatoasz Berendim, high priest of my order, in Duskwood Dell. He’ll know how to proceed.~
END
IF~~THEN REPLY ~Shush. Please, don't mention it so loudly. And—you knew about my heritage?~ EXTERN AC#PPEL2 what_about_me
IF~~THEN REPLY ~That's... a very long title.~ EXTERN AC#PPEL2 what_about_title
IF~~THEN REPLY ~What about you? I thought you would be the one to work with me!~ EXTERN AC#PPEL2 what_about_you

CHAIN AC#PPEL2 what_about_title
~Heh... it—it is. *cough* But... he'll help you.~
END
IF~~THEN REPLY ~What about you?~ EXTERN AC#PPEL2 what_about_you
IF~~THEN REPLY ~Very well. Tell me where this place is.~ EXTERN AC#PPEL2 show_duskwood_dell

CHAIN AC#PPEL2 what_about_me
~I said I... watched you. You stopped a war... That's why I think you can stop... this.~
END
IF~~THEN REPLY ~What about you?~ EXTERN AC#PPEL2 what_about_you
IF~~THEN REPLY ~Very well. Tell me where this place is.~ EXTERN AC#PPEL2 show_duskwood_dell

CHAIN IF ~~ THEN AC#PPEL2 what_about_you
~You need not worry about me. My path ends here, as a river eventually flows into the vast sea and is lost within it. You must carry on the task and go to Duskwood Dell!~
== JaheiraJ IF ~InParty("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN ~This isn't fair. You should be the one to go there with us.~
== AC#PPEL2 ~Please... At least I know I did the right thing.~
END
IF~~THEN REPLY ~Very well. Tell me where this place is.~ EXTERN AC#PPEL2 show_duskwood_dell
IF~~THEN REPLY ~I... I don't know. I really don't want to be part of any of this.~ EXTERN AC#PPEL2 show_duskwood_dell2

CHAIN IF ~~ THEN AC#PPEL2 show_duskwood_dell
~Duskwood Dell lies hidden within the Snakewood. It's hard to find under normal circumstances, but I shall tell you how to reach it...~
END
IF~~THEN DO ~RevealAreaOnMap("ACPP01")~ EXTERN AC#PPEL2 tell_malagent

CHAIN IF ~~ THEN AC#PPEL2 show_duskwood_dell2
~You are already part of this, I'm afraid... Please. Don't leave it like this. Unsolved. Duskwood Dell lies hidden within the Snakewood. It's hard to find under normal circumstances, but I shall tell you how to reach it...~
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


// Dialogue Eldath priest #2 in Athkatla

BEGIN ~AC#PPEL1~

CHAIN IF ~Global("AC#PP_PlotStart","GLOBAL",3)~ THEN AC#PPEL1 hello_02
~Good to see you again! Shall we go and begin the search for the poisoner?~
END
IF~~THEN REPLY ~Yes, let’s go.~ EXTERN AC#PPEL1 lets_go
IF~~THEN REPLY ~No, I need a little more time.~ EXTERN AC#PPEL1 bye_wait

CHAIN AC#PPEL1 lets_go
~Excellent! My dear friend, would you be so kind as to inform my acolyte that we are departing?~
== SLILMAT ~Of course, priest of the Hidden Goddess.~
== AC#PPEL1 ~Then let us be on our way.~
DO ~SetGlobal("AC#PP_PlotStart","GLOBAL",4)
ClearAllActions()
StartCutSceneMode()
StartCutScene("AC#PPCT1")
~ EXIT

CHAIN AC#PPEL1 bye_wait
~Then I shall remain here and wait for you.~
EXIT

// Dialogue Eldath priest #1 in Athkatla

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#PPEL1 hello_01
~Greetings, <CHARNAME>. Forgive me for addressing you by name, but I have observed you for a while and I've finally decided to approach you. I may have need of your help.~
END
IF~~THEN REPLY ~What is it you want?~ EXTERN AC#PPEL1 job
IF~~THEN REPLY ~Gladly—if the pay is right.~ EXTERN AC#PPEL1 job
IF~~THEN REPLY ~Find someone else for your troubles.~ EXTERN AC#PPEL1 bye

CHAIN IF ~~ THEN AC#PPEL1 job
~Firstly, let me thank you for this moment of your valuable time. I am Merethan, devoted servant of Eldath, the Mother Guardian of Groves. Not long ago, you've encountered a man, poor Renfeld if I heard the name right. He had been poisoned, am I wrong? Let me be clear, I have nothing to do with that cruel act—I investigate this matter solely on behalf of the Church of Eldath. This poison and it's properties troubles me greatly, as it is not the first time someone has been targeted with a toxin for which no magical cure exists. That's what I think it was. A powerful thing, incurable by normal means.~
== NaliaJ IF ~InParty("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN  ~We cannot let people suffer because of this... thing!~
== JaheiraJ IF ~InParty("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN ~Incurable? How is that even possible? I think—no, I know there is a cure. There always is.~
== CerndJ  IF ~InParty("Cernd") !StateCheck("Cernd",CD_STATE_NOTVALID)~ THEN ~It sounds like a crime against life itself. It's not as cutting down a tree, but corruption of all the water that runs under a forest.~
== MazzyJ IF ~InParty("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN ~If what this man is saying is truth, then we cannot ignore presence of such vile threat, <CHARNAME>.~
== MinscJ  IF ~InParty("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN  ~Oh, now Minsc wishes Dynaheir was here—she had sucha a strong brain! She knew how to defeat evil with all that thinking!~
== AC#PPEL1 ~It's as if this poison—it feels like—like it had a will of its own and knew how to enforce that will on others.~
END
IF~~THEN REPLY ~What do you mean?~ EXTERN AC#PPEL1 about_poison
IF~~THEN REPLY ~Go on.~ EXTERN AC#PPEL1 about_poison

CHAIN IF ~~ THEN AC#PPEL1 about_poison
~Look, I know it may sound dramatic, it's not as I really think this poison can think, but it's not normal. It's powerful and feels... wrong.~
== HaerdaJ  IF ~InParty("haerdalis") !StateCheck("haerdalis",CD_STATE_NOTVALID)~ THEN ~Well, it truly sounds like some dark rot tried to reach the hearts of men. 'Tis one of those rots, most likely, that need intervention made by those birds that aspire to being called heroes, hmm? Who knows, perhaps it's our raven that can fly that high.~
== YoshJ IF ~InParty("yoshimo") !StateCheck("yoshimo",CD_STATE_NOTVALID)~ THEN ~It sounds like a gambit or trick that should never be used. Mayhap even too definitive even for a taste of bounty hunters, my friend.~
== AerieJ  IF ~InParty("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN ~It... it does. Even more than that. It sounds like wors nightmares coming true.~
== ViconiJ  IF ~InParty("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN  ~Mmm, it sounds like something that would be eagerly used by Matron Mothers. Natha elg'cahl phor jal elg'cahlen. A poison above all poisons.~
== AC#PPEL1 ~As you may know, most types of poison can be cured—or at least delayed—with simple clerical spells or quite common antidotes. But in this case, even the strongest divine magic has failed. There is no antidote for this poison, for it resists all of our spells and common antidotes are to weak to aid those inflicted with this toxin. All we can do is offer comfort to the dying in their final breaths—or pray for a miracle that their body overcomes it on its own.~
== DornJ  IF ~InParty("Dorn") !StateCheck("Dorn",CD_STATE_NOTVALID)~ THEN ~This poison sounds like something we could use ourselves.~
== AC#PPEL1 ~None of this can be ignored.~
END
IF~~THEN REPLY ~Please, go on.~ EXTERN AC#PPEL1 about_poison_02
IF~~THEN REPLY ~Sounds like something assassins would love to use!~ EXTERN AC#PPEL1 about_poison_02
IF~~THEN REPLY ~Sounds... useful, this toxin.~ EXTERN AC#PPEL1 about_poison_02

CHAIN IF ~~ THEN AC#PPEL1 about_poison_02
~I've seen this poison used by different factions, different people, ones that never worked together, nor they never even shared the same goals. There must be someone else behind it. Someone that is pleased to see how this thing speads and kills almost everyone on its way.~
== AnomenJ  IF ~InParty("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN ~Different factions and people are ready to use this toxin? We should investigate this, <CHARNAME>.~
== KeldorJ IF ~InParty("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ THEN ~Just think how much more tense recent troubles can get if people just start using this poison agains each other.~
== AC#PPEL1 ~We cannot just stand and let this poison kill another dozens or maybe even hundreds of people.~
END
IF~~THEN REPLY ~How do you plan to find such a person?~ EXTERN AC#PPEL1 about_person
IF~~THEN REPLY ~Let me gues: you want me to find this person for you.~ EXTERN AC#PPEL1 about_person
IF~~THEN REPLY ~I think I know where this is going...~ EXTERN AC#PPEL1 about_person
IF~~THEN REPLY ~Let me interrupt you: I'm not interested in any of this. Just leave me be. Go and find someone else to deal with all that crap.~ EXTERN AC#PPEL1 bye

CHAIN IF ~~ THEN AC#PPEL1 about_person
~I’ve already made contact with a person that may be behind all of this. I pretended to be a potential buyer of the poison and I think it worked. The man—he seems to be serious about what he does.~
END
IF~~THEN EXTERN AC#PPEL1 bodyguard

CHAIN IF ~~ THEN AC#PPEL1 bodyguard
~And this is where you come in. I’ve arranged a meeting with that man. But I am a priest of the Goddess of Peace—I do not know how to fight those like him, and I fear all of this may end up with a fight. I ask you to accompany me to the meeting, but remain in the background so as not to startle the stranger. I'll do the talking, but... if anything goes wrong, I'll need you. It is then that you should help me. My life may depend on this.~
END
IF~~THEN REPLY ~I can do that.~ EXTERN AC#PPEL1 job_payment
IF~~THEN REPLY ~What’s in it for me?~ EXTERN AC#PPEL1 job_payment
IF~~THEN REPLY ~No, I won’t do it.~ EXTERN AC#PPEL1 job_payment

CHAIN IF ~~ THEN AC#PPEL1 job_payment
~I do not expect you to act without reward. Gold means little to those of my faith, but I can offer you a number of soothing potions should you agree to assist me in this matter. Perhaps even more than that, perhaps I can organize something else—~
END
IF~~THEN REPLY ~Very well. I'm in.~ EXTERN AC#PPEL1 job_yes
IF~~THEN REPLY ~No worries. I'll help you.~ EXTERN AC#PPEL1 job_yes
IF~~THEN REPLY ~No, I’m not doing this.~ EXTERN AC#PPEL1 bye_sure

CHAIN IF ~~ THEN AC#PPEL1 bye_sure
~Are you certain you won’t help me?~
END
IF~~THEN REPLY ~All right, I’ll help you.~ EXTERN AC#PPEL1 job_yes
IF~~THEN REPLY ~I won’t help you.~ EXTERN AC#PPEL1 bye

CHAIN IF ~~ THEN AC#PPEL1 job_yes
~Excellent! The agreed meeting point lies deep in a remote patch of forest. We need not depart as soon as possible. Prepare yourself and speak to me again when you are ready. Then I’ll send my acolyte to contact the intermediary, and we’ll be on our way.~
END
IF~~THEN EXTERN AC#PPEL1 wait_bye

CHAIN IF ~~ THEN AC#PPEL1 wait_bye
~I will wait for you at the temple of Ilmater in the Slums. They are my allies and they let me stay at their temple whenever I need to. Find me there whenever you're ready, but please, don't make me wait for too long.~
DO ~SetGlobal("AC#PP_PlotStart","GLOBAL",3)
EscapeArea()
~ EXIT

CHAIN IF ~~ THEN AC#PPEL1 bye
~That is unfortunate. Very well, I shall have to seek help elsewhere.~
DO ~SetGlobal("AC#PP_PlotStart","GLOBAL",20)
EscapeArea()~ EXIT


