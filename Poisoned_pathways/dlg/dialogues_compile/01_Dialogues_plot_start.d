// Dialoge Skann Delth// Dialogue Eldath priest #2 in Athkatla

BEGIN ~AC#PPSKD~

CHAIN IF ~StateCheck(Myself,STATE_CHARMED)~ THEN AC#PPSKD hello_charmed
~Hey there, friends! Friends, right? You wanted to know where the nastiest poison comes from, didn’t you? Well—lucky you! I've got a map right here. It shows the spot where I usually meet the fella who brews the real stuff. But, listen—just a word of advice, friend to friend: don’t mess around with that guy—smile at him wrong, and you’ll be coughing blood.~ 
=
~Anyway... here's the map. Farewell for now. I’m feeling kinda dizzy all of a sudden. Think I’ll head to the tavern, get something strong to clear my head.~
DO ~GiveItem("AC#PPMP1",LastTalkedToBy())
ChangeEnemyAlly(Myself,NEUTRAL)
EscapeAreaDestroy(2)~ EXIT

CHAIN IF ~True()~ THEN AC#PPSKD hello_02
~Well now, what do we have here? You lookin’ for something that makes problems disappear... real quiet-like? I’ve got potions, powders, and little drips of doom—if your coin’s honest and your conscience ain’t too fussy.~
END
IF~~THEN REPLY ~You disgust me. The world needs less filth like you!~ EXTERN AC#PPSKD fight
IF~~THEN REPLY ~That does sound interesting. What exactly are you offering?~ EXTERN AC#PPSKD interest
IF~~THEN REPLY ~I’m not ready to deal just yet.~ EXTERN AC#PPSKD bye

CHAIN IF ~~ THEN AC#PPSKD interest
~Oh, a bit of this and that—venoms to silence a snitch, brews to slow a soldier, drops that’ll send a man coughing up his liver. Handy little tools to make your life easier... and theirs shorter.~
END
IF~~THEN REPLY ~You're a blight on this city—I should end you right here!~ EXTERN AC#PPSKD fight
IF~~THEN REPLY ~I’m looking for something more powerful.~ EXTERN AC#PPSKD special_poison
IF~~THEN REPLY ~Not now. I need to think it through.~ EXTERN AC#PPSKD bye

CHAIN IF ~~ THEN AC#PPSKD special_poison
~Truth is, I don’t keep the real nasty stuff on me—too many pryin’ eyes, you feel me? But... for the right coin and the right kind of customer, I might know a bloke who knows a bloke...~
END
IF~~THEN REPLY ~Someone like you has no right to draw breath. Prepare to die!~ EXTERN AC#PPSKD fight
IF~~THEN REPLY ~Tell me where you get it from!~ EXTERN AC#PPSKD not_telling_bye
IF~~THEN REPLY ~Please, I need to know.~ EXTERN AC#PPSKD tell_me
IF~~THEN REPLY ~Alright, tell me where you get the real good stuff from.~ EXTERN AC#PPSKD tell_me
IF~GlobalGT("BodhiJob","GLOBAL",0)~THEN REPLY ~Ever heard of that new guild—the one that drains the blood from their enemies? I doubt your poisons would do them much harm. And, well... I work for them.~ EXTERN AC#PPSKD work_bodhi
IF~~THEN REPLY ~This isn't the right moment. I'll be back.~ EXTERN AC#PPSKD bye

CHAIN IF ~~ THEN AC#PPSKD tell_me
~Ha! You think I’d spill my supplier to the first smooth-talker with a pouch full of coins? Get real. That kind of info don’t come free—and even if it did, I ain’t riskin’ my neck for a stranger in boots too clean for this part of town. Who do you think you are?~
END
IF~~THEN REPLY ~Tell me where you get it from!~ EXTERN AC#PPSKD not_telling_bye
IF~~THEN REPLY ~Please, just tell me.~ EXTERN AC#PPSKD not_telling_bye
IF~CheckStatLT(LastTalkedToBy,18,STR)~THEN REPLY ~I’ve left bigger fish than you face-down in alleyways. You really want to test me?~ EXTERN AC#PPSKD not_telling_bye
IF~CheckStatGT(LastTalkedToBy,17,STR)~THEN REPLY ~I’ve left bigger fish than you face-down in alleyways. You really want to test me?~ EXTERN AC#PPSKD threat_rep
IF~ReputationLT(Player1,6)~THEN REPLY ~I'm <CHARNAME>. You know who I am, right? Maybe ask around what happens to those who cross me.~ EXTERN AC#PPSKD threat_rep
IF~ReputationGT(Player1,16)~THEN REPLY ~You might have heard of me—<CHARNAME>. I've brought down worse than you, and I don't need poison to do it. Think carefully about who you're dealing with.~ EXTERN AC#PPSKD threat_rep
IF~GlobalGT("Linvail","GLOBAL",0)~THEN REPLY ~I work for the Shadow Thieves... and I doubt they'd be pleased to hear about your little side business.~ EXTERN AC#PPSKD work_shadow_thieves
IF~GlobalGT("BodhiJob","GLOBAL",0)~THEN REPLY ~Ever heard of that new guild—the one that drains the blood from their enemies? I doubt your poisons would do them much harm. And, well... I work for them.~ EXTERN AC#PPSKD work_bodhi
IF~~THEN REPLY ~I don’t deal with back-alley scum like you!~ EXTERN AC#PPSKD fight
IF~~THEN REPLY ~I’ll return when the time’s right.~ EXTERN AC#PPSKD bye

CHAIN IF ~~ THEN AC#PPSKD threat_rep
~Oh, it's you? Now that you mention it—folks been whispering about some <PRO_RACE> like you from the North, stirring up trouble in the city...~
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
~A-all right, all right! I’ll tell you where I get the real stuff. Name’s Delgorth. Weird fellow. I’ve only met him twice—in a glade out in the Snakewood. I... I’ll give you his instructions. Here!~
END
IF~~THEN REPLY ~Smart choice.~ EXTERN AC#PPSKD map_bye
IF~~THEN REPLY ~That’s all I needed.~ EXTERN AC#PPSKD map_bye

CHAIN AC#PPSKD map_bye
~The map’ll show you the way. It’s all there. Th-the stuff’s too hot for me anyway. Here—take it! I’m done with this.~
DO ~GiveItem("AC#PPMP1",LastTalkedToBy())
EscapeArea()~ EXIT


CHAIN AC#PPSKD fight
~Well, ain’t you the hero type. Shame you picked the wrong roof to play vigilante on! Let’s fight, then!~
DO ~Enemy()~ EXIT

CHAIN AC#PPSKD bye
~Fine, fine. Come back if you grow a taste for shadows and want your troubles bottled. I'll be here... till I ain't.~
EXIT

CHAIN AC#PPSKD not_telling_bye
~Yeah, sure. Keep on pressing, but you won’t get anything from me unless you got something really good to offer.~
EXIT


// Dialogue Talonite priest in glade (ambush area)

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
~With the poison in hand, we can study it! Well... not me anymore. That task falls to you now! You must... must bring this arrow, poison and all, to Most Exalted Fallskeeper Alatoasz Berendim, high priest of my order, in Duskwood Dell. He’ll know how to proceed.~
END
IF~~THEN REPLY ~That's... a very long title.~ EXTERN AC#PPEL2 what_about_title
IF~~THEN REPLY ~What about you? I thought you would be the one to work with me!~ EXTERN AC#PPEL2 what_about_you

CHAIN AC#PPEL2 what_about_title
~Heh... it—it is. *cough* But... he'll help you.~
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
== AC#PPEL2 ~That's good! Then you have brought the poison I so desire?~ 
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
~Good to see you again! Were you able to make Skann Delth talk? Do you know where he’s meeting the poison supplier?~
END
IF~Global("AC#PPHasMap","GLOBAL",1)~THEN REPLY ~Yes, I managed to get the information. I’ve got a document that mentions the location.~ DO ~SetGlobal("AC#PPHasMap","GLOBAL",10)~ EXTERN AC#PPEL1 about_glade
IF~~THEN REPLY ~No, I haven’t found anything yet.~ EXTERN AC#PPEL1 bye_wait

CHAIN IF ~~ THEN AC#PPEL1 about_glade
~Excellent. Let me take a look…~
=
~Lowshade Glade? Yes, I know of it. Secluded, rarely visited—an ideal place for a meeting like this. There’s only one path forward now: we go there and see whether the mysterious poisoner reveals himself. Shall we depart?~
END
IF~~THEN REPLY ~Yes, let’s go.~ EXTERN AC#PPEL1 lets_go
IF~~THEN REPLY ~Not just yet. I need a little more time.~ EXTERN AC#PPEL1 bye_wait

CHAIN AC#PPEL1 lets_go
~Excellent! My dear friend, thank you again for your hospitality within these sacred halls.~
== SLILMAT ~Of course, priest of the Hidden Goddess. May Ilmater’s blessings go with you as well.~
== AC#PPEL1 ~Then let us be on our way.~
DO ~SetGlobal("AC#PP_PlotStart","GLOBAL",4)
ClearAllActions()
StartCutSceneMode()
StartCutScene("AC#PPCT1")~ EXIT


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
~Thank you for this moment of your valuable time. I am Merethan, devoted servant of Eldath, the Mother Guardian of Groves.~ 
== JaheiraJ IF ~InParty("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN ~Eldath’s servants are rare in times like these. I hope his words carry more than peaceful pleasantries.~
== CerndJ  IF ~InParty("Cernd") !StateCheck("Cernd",CD_STATE_NOTVALID)~ THEN ~Eldath! A gentle presence in a world far too fond of thunder.~
== AC#PPEL1 ~Not long ago, you crossed paths with a poisoned man—Renfeld, if I recall correctly. The toxin used against him troubles me greatly, for it is not the first time someone has been afflicted with a poison that no magic can cure.~
== AC#PPEL1 ~This is no ordinary toxin. Its effects linger and resist healing in ways that defy what we know of alchemy and magic alike.~
END
IF~~THEN REPLY ~What do you mean?~ EXTERN AC#PPEL1 about_poison
IF~~THEN REPLY ~Go on.~ EXTERN AC#PPEL1 about_poison

CHAIN IF ~~ THEN AC#PPEL1 about_poison
~As you may know, most types of poison can be cured—or at least delayed—with simple clerical spells or quite common antidotes. But in this case, even the strongest divine magic has failed.~
== HaerdaJ  IF ~InParty("haerdalis") !StateCheck("haerdalis",CD_STATE_NOTVALID)~ THEN ~Well, it truly sounds like some dark rot tried to reach the hearts of men. 'Tis one of those rots, most likely, that need intervention made by those birds that aspire to being called heroes, hmm? Who knows, perhaps it's our raven that can fly that high.~
== YoshJ IF ~InParty("yoshimo") !StateCheck("yoshimo",CD_STATE_NOTVALID)~ THEN ~It sounds like a gambit or trick that should never be used. Mayhap even too definitive even for a taste of bounty hunters, my friend.~
== AerieJ  IF ~InParty("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN ~It... it does. Even more than that. It sounds like wors nightmares coming true.~
== ViconiJ  IF ~InParty("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN  ~Mmm, it sounds like something that would be eagerly used by Matron Mothers. Natha elg'cahl phor jal elg'cahlen. A poison above all poisons.~
== AC#PPEL1 ~There is no antidote for this poison, for it resists all of our spells and common antidotes are too weak to aid those inflicted with this toxin. All we can do is offer comfort to the dying in their final breaths—or pray for a miracle that their body overcomes it on its own.~
== JaheiraJ IF ~InParty("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN ~Incurable? How is that even possible? I think—no, I know there is a cure. There always is.~
== CerndJ  IF ~InParty("Cernd") !StateCheck("Cernd",CD_STATE_NOTVALID)~ THEN ~It sounds like a crime against life itself. It's not as cutting down a tree, but corruption of all the water that runs under a forest.~
== MazzyJ IF ~InParty("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN ~If what this man is saying is truth, then we cannot ignore presence of such vile threat, <CHARNAME>.~
== MinscJ  IF ~InParty("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN  ~Oh, Minsc wishes Dynaheir was here—she had such a strong wit! She knew how to defeat evil with all that thinking!~
== DornJ  IF ~InParty("Dorn") !StateCheck("Dorn",CD_STATE_NOTVALID)~ THEN ~This poison sounds like something we could use ourselves.~
== AC#PPEL1 ~By the will of the Church of Eldath, I have been tasked to uncover the truth behind this poison. Even the calmest waters ripple when danger approaches—and this cannot be ignored.~
END
IF~~THEN REPLY ~Please, go on.~ EXTERN AC#PPEL1 about_poison_02
IF~~THEN REPLY ~Perfect poison for someone with a dagger and dark intentions!~ EXTERN AC#PPEL1 about_poison_02
IF~~THEN REPLY ~Sounds... useful, this toxin.~ EXTERN AC#PPEL1 about_poison_02

CHAIN IF ~~ THEN AC#PPEL1 about_poison_02
~I've seen this poison used by different factions, different people, ones that never worked together, nor they never even shared the same goals. There must be someone else behind it. Someone that is pleased to see how this thing speads and kills almost everyone on its way.~
== AnomenJ  IF ~InParty("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN ~Different factions and people are ready to use this toxin? We should investigate this, <CHARNAME>.~
== KeldorJ IF ~InParty("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ THEN ~Just think how much more tense recent troubles can get if people just start using this poison agains each other.~
== AC#PPEL1 ~We cannot simply stand by and let this poison claim dozens—perhaps even hundreds—of lives.~
END
IF~~THEN REPLY ~How can we track down the one responsible?~ EXTERN AC#PPEL1 about_person
IF~~THEN REPLY ~You need someone willing to confront this poison-maker, don't you?~ EXTERN AC#PPEL1 about_person
IF~~THEN REPLY ~Sounds like you have a task in mind for me...~ EXTERN AC#PPEL1 about_person
IF~~THEN REPLY ~Let me interrupt you: I'm not interested in any of this. Just leave me be. Go and find someone else to deal with all that crap.~ EXTERN AC#PPEL1 bye

CHAIN IF ~~ THEN AC#PPEL1 about_person
~I’ve already tried to make contact with someone who might lead us to the one behind all this. There's a shady figure here in the slums of Athkatla who claims he can procure rare poisons. I pretended to be a potential buyer. Unfortunately, I couldn’t get him to reveal the whereabouts of his supplier. He grew wary—and afraid.~
END
IF~~THEN EXTERN AC#PPEL1 first_task

CHAIN IF ~~ THEN AC#PPEL1 first_task
~I may lack the... persuasive skills required in such dealings. You, however, may prove more capable in such matters.~
== ViconiJ  IF ~InParty("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN  ~You worship peace, but send others to do your bidding when matters grow inconvenient?~
== KORGANJ  IF ~InParty("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN  ~Persuasion, eh? Nothing persuades better than a broken nose and a few missing teeth.~
== JaheiraJ IF ~InParty("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN ~So even the faithful of the gentle goddess know when to call upon sharper tongues.~
== NaliaJ IF ~InParty("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN  ~We cannot let people suffer because of this... thing!~
== AC#PPEL1 ~I kindly ask you to seek out a poison dealer named Skann Delth in the slums of Athkatla. If you can discover the source of his supply, then I ask you to accompany me to confront the one behind it all. Just remember—I seek truth, not violence.~
END
IF~~THEN REPLY ~Fine, I can do that.~ EXTERN AC#PPEL1 job_payment
IF~~THEN REPLY ~What’s in it for me?~ EXTERN AC#PPEL1 job_payment
IF~~THEN REPLY ~No, I won’t do it.~ EXTERN AC#PPEL1 job_payment

CHAIN IF ~~ THEN AC#PPEL1 job_payment
~I do not expect you to act without reward. Gold means little to those of my faith, but I can offer you a number of soothing potions should you agree to assist me in this matter. Mayhap even more than that and I can organize something else...~
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
~Excellent! Skann Delth usually lingers on the roof of the Copper Coronet, boasting about his brews. Most of them are of little use—tricks and tinctures for fools. But you should insist you're looking for something truly dangerous. Try to find out where he gets his poison from.~
END
IF~~THEN EXTERN AC#PPEL1 wait_bye

CHAIN IF ~~ THEN AC#PPEL1 wait_bye
~I will wait for you at the temple of Ilmater in the Slums. They are my allies and offer me shelter whenever I need it. Find me there once you’ve learned anything—when we know where to continue the search for the source of this mysterious poison.~
DO ~SetGlobal("AC#PP_PlotStart","GLOBAL",3)
EscapeArea()
~ EXIT

CHAIN IF ~~ THEN AC#PPEL1 bye
~That is unfortunate. Very well, I shall have to seek help elsewhere.~
DO ~SetGlobal("AC#PP_PlotStart","GLOBAL",20)
EscapeArea()~ EXIT


