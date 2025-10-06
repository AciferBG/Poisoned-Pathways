
// Dialogue Eldathyn priest #3; guard in Duskwood Dell

BEGIN ~AC#PPEL3~

CHAIN IF ~True()~ THEN AC#PPEL3 hello_01
~Peace of the Goddess be upon you. It is rare for strangers to find their way here. This grove reveals itself only to those who already know of it.~ 
= ~How is it, then, that you have come—and that Eldath has allowed your steps to pass?~ 
END
IF~~THEN REPLY ~A follower of your faith has been poisoned by an unknown assailant. I carry an arrow here, so your order’s leader might trace the source of the poison.~ EXTERN AC#PPEL3 need_go_to_highpriest
IF~~THEN REPLY ~Long story short: One of your people has fallen, and he sent us here before his end.~ EXTERN AC#PPEL3 need_go_to_highpriest
IF~~THEN REPLY ~Some poison, dying people... look, I don’t have time for pleasantries. Just point me to your leader.~ EXTERN AC#PPEL3 need_go_to_highpriest
IF~~THEN REPLY ~Honestly? One of yours is dead, and now I’m the one cleaning up the mess because you're all too weak to act. Where’s your spineless leader hiding?~ EXTERN AC#PPEL3 need_go_to_highpriest2
IF~~THEN REPLY ~I'm looking for the Most Exhausted Fallseater Alabass Berendish.~ EXTERN AC#PPEL3 seek_highpriest_wrong_name
IF~~THEN REPLY ~I'm looking for the Most Exalted Fallskeeper Alatoasz Berendim.~ EXTERN AC#PPEL3 seek_highpriest_right__name

CHAIN IF ~~ THEN AC#PPEL3 need_go_to_highpriest
~By the Mother Guardian of Groves! Then Merethan has fallen? It is him you speak of, yes? This is grave news indeed...~ 
=
~Quickly—bring the poisoned arrow to our High Priest. You’ll find him in his chambers, in the rearmost northeastern tree by the water’s edge. But be careful—the venom seems potent, and even a trace may do harm. Alatoasz will know how to proceed.~
== AC#PPEL3 ~Despite these troubling times, I bid you welcome to our grove. May the Green Goddess grant you her blessing.~
DO ~EscapeArea()~ EXIT

CHAIN IF ~~ THEN AC#PPEL3 need_go_to_highpriest2
~You'll find him in his chambers, in the rearmost tree by the water. Now go—and trouble others no more.~
DO ~ReputationInc(-1) EscapeArea()~ EXIT

CHAIN IF ~~ THEN AC#PPEL3 seek_highpriest_wrong_name
~I believe you’re referring to the Most Exalted Fallskeeper Alatoasz Berendim. Peace teaches us patience, but even names deserve respect. He resides in the treehouse by the water, northeast of here.~
DO ~EscapeArea()~ EXIT

CHAIN IF ~~ THEN AC#PPEL3 seek_highpriest_right__name
~You’ll find our High Priest in his chambers, in the northeastern tree at the water’s edge. May he grant you the Green Goddess’s blessing.~
DO ~EscapeArea()~ EXIT

//////////////////////////////////////////////////////////////
// First talk with Exalted Fallskeeper Alatoasz Berendim

CHAIN IF ~Global("AC#PPSpellCheckPoison","GLOBAL",0)~ THEN AC#PPEL4 hello_01
~May the Mother Guardian of Groves grant you peace and health, stranger. I am Most Exalted Fallskeeper Alatoasz Berendim, a humble servant of Eldath. What brings you to our sanctuary?~ 
END
IF~~THEN REPLY ~Let's make it brief: Merethan is dead. He was killed with this poison. We need to find out who made it.~ EXTERN AC#PPEL4 about_arrow
IF~~THEN REPLY ~Your priest, Merethan, was poisoned. I have here an arrow soaked in the toxin. He hoped you might be able to use it to trace the culprit.~ EXTERN AC#PPEL4 about_arrow
IF~~THEN REPLY ~Merethan died choking on his peace. This poisoned arrow’s all that’s left.~ EXTERN AC#PPEL4 about_arrow
IF~~THEN REPLY ~Greetings, Most Exalted Fallskeeper. I bring sad news—your priest Merethan was poisoned. This arrow carries the same toxin that killed him... and others. Merethan hoped you could trace its source.~ EXTERN AC#PPEL4 about_arrow
IF~Global("AC#PPWrongPriestName","GLOBAL",1)~THEN REPLY ~I'm looking for the Moist Exulted Flailweeper Appletoast Barelydim.~ DO ~SetGlobal("AC#PPWrongPriestName","GLOBAL",2)~ EXTERN AC#PPEL4 wrong_name_fun

	CHAIN IF ~~ THEN AC#PPEL4 wrong_name_fun
	~Blast it! You’ve seen through my disguise! I’m not Alatoasz at all... I'm Appletoast! A pity... I worked hard on the beard and the title. Would you still care to talk to this imposter, or shall I bow out and leave you to your heroic wandering?~
	END
	IF~~THEN REPLY ~Let's make it brief: Merethan is dead. He was killed with this poison. We need to find out who made it.~ EXTERN AC#PPEL4 about_arrow
	IF~~THEN REPLY ~Your priest, Merethan, was poisoned. I have here an arrow soaked in the toxin. He hoped you might be able to use it to trace the culprit.~ EXTERN AC#PPEL4 about_arrow
	IF~~THEN REPLY ~Merethan died choking on his peace. This poisoned arrow’s all that’s left.~ EXTERN AC#PPEL4 about_arrow
	IF~~THEN REPLY ~Greetings, Most Exalted Fallskeeper. I bring sad news—your priest Merethan was poisoned. This arrow carries the same toxin that killed him... and others. Merethan hoped you could trace its source.~ EXTERN AC#PPEL4 about_arrow


CHAIN IF ~~ THEN AC#PPEL4 about_arrow
~This is sad news. Merethan was a faithful follower—a Freewalker—traveling to spread the word of peace throughout the Realms. It pains me that he has left our world. I know the circumstances—indeed, I was the one who tasked him with investigating the troubling cases of poisoning.~
= ~Let me take a closer look at the arrow...~
END
IF~~THEN DO ~TakePartyItem("AC#PPARP")~ EXTERN AC#PPEL4 check_arrow

CHAIN IF ~~ THEN AC#PPEL4 check_arrow
~A strange poison indeed. Merethan must have told you what makes this toxin so troubling?~
END
IF~~THEN REPLY ~More or less.~ EXTERN AC#PPEL4 about_poison
IF~~THEN REPLY ~I prefered you reminded me why it scares you so much.~ EXTERN AC#PPEL4 about_poison
IF~~THEN REPLY ~He said it couldn’t be cured.~ EXTERN AC#PPEL4 about_poison2

CHAIN IF ~~ THEN AC#PPEL4 about_poison
~Neither magic nor simple antidotes are swift enough to rid the body of this toxin. All our prayers, all our powers—none can turn back its corruption.~
=
~Yet there is hope. Despite these grim circumstances, it is a blessing that you have brought me a sample of this vile substance.~
END
IF~~THEN EXTERN AC#PPEL4 spell_poison

CHAIN IF ~~ THEN AC#PPEL4 about_poison2
~Exactly. Despite the grim circumstances, it is fortunate that you brought me a sample of this vile substance.~
END
IF~~THEN EXTERN AC#PPEL4 spell_poison

CHAIN IF ~~ THEN AC#PPEL4 spell_poison
~Let me cast a spell to better understand the nature of the poison...~
DO ~SetGlobal("AC#PPSpellCheckPoison","GLOBAL",1)
ClearAllActions()
StartCutSceneMode()
StartCutScene("AC#PPCT4")
~ EXIT

//Second talk with Exalted Fallskeeper Alatoasz Berendim

CHAIN IF ~Global("AC#PPSpellCheckPoison","GLOBAL",1)~ THEN AC#PPEL4 hello_02
~Even a divination spell fails? How can that be...?~
END
IF~~THEN EXTERN AC#PPEL4 poison_investigate

CHAIN IF ~~ THEN AC#PPEL4 poison_investigate
~Well then, if magic fails, we must rely on our senses. I smell something on this arrow—a peculiar scent, sharp and sweet. A plant-based poison, for sure...~
END
IF~~THEN EXTERN AC#PPEL4 poison_investigate_02

CHAIN IF ~~ THEN AC#PPEL4 poison_investigate_02
~Let me taste a small amount of the poison.~
END
IF~~THEN REPLY ~You’re not seriously putting that in your mouth, are you?~ EXTERN AC#PPEL4 poison_investigate_03
IF~~THEN REPLY ~Careful! I don’t want to lose a second Eldathyn.~ EXTERN AC#PPEL4 poison_investigate_03
IF~~THEN REPLY ~If tasting it brings us answers, then so be it.~ EXTERN AC#PPEL4 poison_investigate_tasting
IF~~THEN REPLY ~Use at your own risk.~ EXTERN AC#PPEL4 poison_investigate_03

CHAIN IF ~~ THEN AC#PPEL4 poison_investigate_03
~I know the risk, but we have no time. If this toxin spreads to even more dangerous hands, the cost will be far greater.~
END
IF~~THEN EXTERN AC#PPEL4 poison_investigate_tasting

CHAIN IF ~~ THEN AC#PPEL4 poison_investigate_tasting
~Hmm... The taste is like the nectar of a flower long forgotten—sweet, yet slipping through memory like petals on the wind. The scent lingers like overripe fruit in a sun-dappled grove, fragrant one moment, lost the next.~
END
IF~~THEN DO ~ApplySpellRES("AC#PPPN",Myself)~ EXTERN AC#PPEL4 poison_investigate_04

CHAIN IF ~~ THEN AC#PPEL4 poison_investigate_04
~There is a bitterness, like foxglove, but something older lingers within it... something raw and untamed. The numbness spreads, slow and deliberate, reaching toward my heart. Could it be—~
END
IF~~THEN EXTERN AC#PPEL4 poison_investigate_05

CHAIN IF ~~ THEN AC#PPEL4 poison_investigate_05
~Of course! It must be the Groveglove—a rare elven plant! Highly toxic and revered by elves for millennia.~ 
=
~Yet its poison is usually easily cured by magic—so why does it fail now? It makes no sense.~ 
END 
IF~~THEN REPLY ~Good thing that stuff didn’t kill you too.~ EXTERN AC#PPEL4 no_matter
IF~~THEN REPLY ~You seem to place a lot of trust in the protection of your goddess. Don't overdo it.~ EXTERN AC#PPEL4 no_matter
IF~~THEN REPLY ~And you figured all that out by sniffing the arrow and tasting the poison?~ EXTERN AC#PPEL4 no_matter


CHAIN IF ~~ THEN AC#PPEL4 no_matter
~We often deal with poisons here. Many gravely ill souls come to us, and it falls to us to either heal them or guide them through death. Over time, we’ve gained unfortunate familiarity with some of the foulest substances in the Realms. But never have I encountered something like this. Well, no matter. For now, we know where our search must begin.~
END
IF~~THEN EXTERN AC#PPEL4 poison_investigate_06

CHAIN IF ~~ THEN AC#PPEL4 poison_investigate_06
~The plant used to create this poison grows near the ruins of ancient elven cities, where the land still remembers its old magic. That must be where the poison is being produced. We need to focus on one of the old elven ruins scattered throughout these lands. But there are many. Finding the right one will be our first task.~
END
IF~~THEN REPLY ~How many possible ancient elven ruins are we talking about?~ EXTERN AC#PPEL4 about_keltormir
IF~~THEN REPLY ~Elven cities, old magic, mysterious poison plants—this keeps getting better and better.~ EXTERN AC#PPEL4 about_keltormir
IF~~THEN REPLY ~Your knowledge is impressive.~ EXTERN AC#PPEL4 about_keltormir

CHAIN IF ~~ THEN AC#PPEL4 about_keltormir
~This region, as you may know, was once blanketed by a vast and unbroken forest—the ancient heart of the elven kingdom of Keltormir. The elves built many splendid cities within those woods, and though their time has passed, ruins remain... and so do rare plants. Plants that may lead us to the right place.~
== IMOEN2J IF ~InParty("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN ~Keltormir? Sure, Candlekeep had stuff on it. All leaves and legends. Elves love their trees, don’t they?~
END
IF~Race(Player1,ELF)~THEN REPLY ~The tale of Keltormir is well known among my people. It is our lost heritage... but all that remains are memories.~ EXTERN AC#PPEL4 about_keltormir_02
IF~CheckStatGT(Player1,49,LORE)~THEN REPLY ~I believe I've come across the name Keltormir in my studies. Familiar... but long vanished.~ EXTERN AC#PPEL4 about_keltormir_02
IF~~THEN REPLY ~And where should I begin the search?~ EXTERN AC#PPEL4 about_keltormir_02
IF~~THEN REPLY ~Time to uncover what’s left of Keltormir.~ EXTERN AC#PPEL4 about_keltormir_02

CHAIN IF ~~ THEN AC#PPEL4 about_keltormir_02
~Unfortunately, I am no scholar of ancient history. My expertise lies in nature. But fortunately, I know someone who is.~
=
~I ask you to visit the Temple of Oghma in Athkatla. They keep many ancient tomes there, including some that speak of the old elven cities. If I can obtain even a single clue, I may be able to narrow our search considerably.~
END
IF~~THEN REPLY ~Back to Athkatla, then.~ EXTERN AC#PPEL4 to_oghma
IF~~THEN REPLY ~I just arrived here from Athkatla, and you're already sending me back?~ EXTERN AC#PPEL4 to_oghma
IF~~THEN REPLY ~I don’t usually run errands for books... but fine.~ EXTERN AC#PPEL4 to_oghma
IF~~THEN REPLY ~If you say it helps, I’ll fetch your book.~ EXTERN AC#PPEL4 to_oghma
IF~GlobalGT("ElvenCityTree","GLOBAL",0)~THEN REPLY ~What about Suldanesselar? Perhaps we should seek answers there?~ EXTERN AC#PPEL4 suldanesselar  
IF~GlobalGT("AC#SK_MythRhynn_Visit","GLOBAL",0)~THEN REPLY ~I have already been to Myth Rhynn, searching for the ancient prophecies of Calim and Memnon. Perhaps that is where we should begin our search?~ EXTERN AC#PPEL4 skyfire_myth_rhynn  

CHAIN IF ~~ THEN AC#PPEL4 suldanesselar  
~Suldanesselar? I know the place. They have many troubles, but none that connect to ours.~  
END
IF~~THEN EXTERN AC#PPEL4 need_search_elven_cities  

CHAIN IF ~~ THEN AC#PPEL4 skyfire_myth_rhynn  
~Myth Rhynn, the elven city of the dead? No, I do not believe our answers lie there.~  
END
IF~~THEN EXTERN AC#PPEL4 need_search_elven_cities  

CHAIN IF ~~ THEN AC#PPEL4 need_search_elven_cities  
~There’s no way around it—you must seek the Temple of Oghma in Athkatla. They keep many tomes, including some that speak of the old elven cities. If I can find even a single clue, I may be able to narrow our search considerably.~  
END  
IF~~THEN REPLY ~Back to Athkatla, then.~ EXTERN AC#PPEL4 to_oghma  
IF~~THEN REPLY ~I just came from Athkatla, and now you’re sending me back?~ EXTERN AC#PPEL4 to_oghma  
IF~~THEN REPLY ~I don’t usually run errands for books... but fine.~ EXTERN AC#PPEL4 to_oghma  
IF~~THEN REPLY ~If you think it’ll help, I’ll fetch your book.~ EXTERN AC#PPEL4 to_oghma  


CHAIN IF ~~ THEN AC#PPEL4 to_oghma
~In the meantime, I shall reflect further on the nature of this poison. You were kind enough to bring me a sample... though it came at the cost of a good priest’s life.~
END
IF~~THEN REPLY ~I’ll be on my way, then.~ EXTERN AC#PPEL4 to_oghma_bye
IF~PartyHasItem("AC#PPSYM")~THEN REPLY ~One more thing—I have Merethan’s symbol of Eldath with me.~ EXTERN AC#PPEL4 Merethan_emblem

CHAIN IF ~~ THEN AC#PPEL4 Merethan_emblem
~Such emblems are usually passed from one priest to another. Yet for now, I know no one who should carry it. Keep it with you for the time being—mayhap we shall find a worthy soul to whom it may be entrusted.~
END
IF~Global("AC#PPSymbolQuest","GLOBAL",2)~THEN REPLY ~I might know someone—Montrassa, the elder priestess. Her hands have grown too frail to craft her own emblem.~ EXTERN AC#PPEL4 emblem_montrassa
IF~~THEN REPLY ~I’ll be on my way, then.~ EXTERN AC#PPEL4 to_oghma_bye

CHAIN IF ~~ THEN AC#PPEL4 emblem_montrassa
~Montrassa? She never spoke of such difficulty... but it makes perfect sense. A thoughtful suggestion! Give her the emblem, with my blessing. And afterward, please proceed to the Temple of Oghma in Athkatla, as we discussed.~
END
IF~~THEN DO ~SetGlobal("AC#PP_AlaAgreesSymbol","GLOBAL",1)~ EXTERN AC#PPEL4 to_oghma_bye

CHAIN IF ~~ THEN AC#PPEL4 to_oghma_bye
~I shall send a dove ahead to the Temple of Oghma, so their scribes may ready the proper volume. Return to me once you have the book. I shall be waiting below, on the lower level of this tree. May Eldath's blessings guide your steps.~
DO ~SetGlobal("AC#PPSpellCheckPoison","GLOBAL",2)
AddJournalEntry(@12005,QUEST)
SetGlobal("AC#PP_Oghma","GLOBAL",1)
EscapeAreaDestroy(2)~ EXIT

// Third talk with Exalted Fallskeeper Alatoasz Berendim
CHAIN IF ~Global("AC#PPSpellCheckPoison","GLOBAL",3) GlobalGT("AC#PP_Oghma","GLOBAL",0)~ THEN AC#PPEL4 hello_03
~<CHARNAME>! You have returned. Have you brought the book from the Temple of Oghma?~
END
IF~PartyHasItem("AC#PPBK1")~THEN REPLY ~Yes, here it is.~ DO ~TakePartyItem("AC#PPBK1")~ EXTERN AC#PPEL4 read_book
IF~~THEN REPLY ~Give me another moment. I’ll get back to you as soon as I can.~ EXTERN AC#PPEL4 hello_03x
IF~PartyHasItem("AC#PPSYM") Global("AC#PP_AlaAgreesSymbol","GLOBAL",0)~THEN REPLY ~One more thing—I have Merethan’s symbol of Eldath with me.~ EXTERN AC#PPEL4 Merethan_emblem_02

CHAIN IF ~~ THEN AC#PPEL4 Merethan_emblem_02
~Such emblems are usually passed from one priest to another. Yet at this moment, I know no one to whom it should be given. Hold onto it for now—perhaps we shall find a fitting bearer.~
END
IF~Global("AC#PPSymbolQuest","GLOBAL",2)~THEN REPLY ~I believe I know someone—Montrassa, the elder priestess, whose hands can no longer craft her own.~ EXTERN AC#PPEL4 emblem_montrassa_02
IF~~THEN REPLY ~I’ll be on my way, then.~ EXTERN AC#PPEL4 hello_03x

CHAIN IF ~~ THEN AC#PPEL4 emblem_montrassa_02
~Montrassa? She never spoke of such a hardship, but... yes. It is a sound suggestion. Give her the emblem with my blessing.~
END
IF~~THEN REPLY ~I shall be honored to deliver your blessing to her.~ DO ~SetGlobal("AC#PP_AlaAgreesSymbol","GLOBAL",1)~ EXTERN AC#PPEL4 emblem_montrassa_bye

CHAIN AC#PPEL4 emblem_montrassa_bye
~Do so. She will surely be uplifted by your kindness.~
EXIT

CHAIN IF ~~ THEN AC#PPEL4 read_book
~Interesting... A well-crafted tome, with valuable insights. Three Mythal-cities are mentioned explicitly here: Myth Rhynn, Myth Unnohyr, and Myth Tellaren. Hmm. Oh! This is promising—mayhap even a true lead.~
=
~Of the three cities, which calls to you as the source? Where do you feel the trail leads?~
END
IF~~THEN REPLY ~Myth Rhynn.~ EXTERN AC#PPEL4 wrong_myth_rhynn
IF~~THEN REPLY ~Myth Unnohyr.~ EXTERN AC#PPEL4 right_myth_unnohyr
IF~~THEN REPLY ~Myth Tellaren.~ EXTERN AC#PPEL4 wrong_myth_tellaren
IF~~THEN REPLY ~I’m not sure.~ EXTERN AC#PPEL4 right_myth_unnohyr
IF~~THEN REPLY ~I’ve only examined the book’s cover.~ EXTERN AC#PPEL4 right_myth_unnohyr

CHAIN IF ~~ THEN AC#PPEL4 wrong_myth_rhynn
~Myth Rhynn—the elven necropolis? An intriguing thought, but no... I don’t believe that’s where we’ll find our answer.~
END
IF~~THEN REPLY ~Maybe Myth Tellaren?~ EXTERN AC#PPEL4 wrong_myth_tellaren
IF~~THEN REPLY ~Then it must be Myth Unnohyr.~ EXTERN AC#PPEL4 right_myth_unnohyr

CHAIN IF ~~ THEN AC#PPEL4 wrong_myth_tellaren
~Myth Tellaren, buried in the sands of Calimshan? We’ll not find a single living plant there—certainly not the one we’re seeking. I’m afraid that can’t be it.~
END
IF~~THEN REPLY ~Myth Rhynn?~ EXTERN AC#PPEL4 wrong_myth_rhynn
IF~~THEN REPLY ~Then Myth Unnohyr must be the one.~ EXTERN AC#PPEL4 right_myth_unnohyr


CHAIN IF ~~ THEN AC#PPEL4 right_myth_unnohyr
~It's Myth Unnohyr! That must be the place. Listen to this passage: 'When his blessing was withdrawn, the mythal shattered in silent judgment, leaving behind a zone of wild and dead magic—a festering wound in the Weave that endures to this day. Now, few dare to approach its ruins, where even divine power falters, and plants whisper poison into the soil.'~
= ~That explains why our attempts at healing fail—it carries the essence of Myth Unnohyr’s broken mythal!~
END
IF ~~ THEN REPLY ~If you say so.~ EXTERN AC#PPEL4 poison_myth_unnhoyr_03
IF ~~ THEN REPLY ~If that’s where the plant grows, that’s where we’ll go.~ EXTERN AC#PPEL4 poison_myth_unnhoyr_03
IF ~~ THEN REPLY ~Not exactly a pleasant destination.~ EXTERN AC#PPEL4 poison_myth_unnhoyr_03
IF ~~ THEN REPLY ~You mean the plant feeds on dead magic? Wicked.~ EXTERN AC#PPEL4 poison_myth_unnhoyr_03  

CHAIN AC#PPEL4 hello_03x
~I'll wait here, then.~
EXIT

CHAIN IF ~~ THEN AC#PPEL4 poison_myth_unnhoyr_03
~Myth Unnohyr seems to have once been a glorious, mythal-shrouded elven city. But one day, a mysterious catastrophe caused that mythal to implode, leaving behind a vast magical abomination: a wild magic zone by day and a dead magic zone by night.~
== NEERAJ IF ~InParty("Neera") !StateCheck("Neera",CD_STATE_NOTVALID)~ THEN ~Wild magic?! Gods, yes! Or no. Or maybe! I love it when even reality can’t make up its mind.~
== VALYGARJ IF ~InParty("Valygar") !StateCheck("Valygar",CD_STATE_NOTVALID)~ THEN ~Elven ruins or not, this mythal was never meant for mortal hands. And now it bleeds its vengeance into the land.~
== HAERDAJ IF ~InParty("HaerDalis") !StateCheck("HaerDalis",CD_STATE_NOTVALID)~ THEN ~Creepy ruins, cursed mythals, shattered relics—these elves had a real flair for drama.~
== HEXXATJ IF ~InParty("Hexxat") !StateCheck("Hexxat",CD_STATE_NOTVALID)~ THEN ~When gods fall silent, the poison sings.~
== AC#PPEL4 ~Since that time, magic there has been unstable—at least the kind that relies on spellcraft. Whether innate gifts or enchanted items still function, I cannot say.~
END
IF ~~ THEN REPLY ~And you want me to go there?~ EXTERN AC#PPEL4 dead_magic_areab
IF ~~ THEN REPLY ~So we’ll have to rely on steel and wits.~ EXTERN AC#PPEL4 dead_magic_areab
IF ~~ THEN REPLY ~I suppose I fight the battles while you stay clean and speak of stillness?~ EXTERN AC#PPEL4 poison_myth_unnhoyr_conflict_01
IF ~~ THEN REPLY ~Easy to preach peace from the safety of a grove, while I wade through blood in your name.~ EXTERN AC#PPEL4 poison_myth_unnhoyr_conflict_01
IF ~~ THEN REPLY ~Magic or no magic, death still listens when I speak.~ EXTERN AC#PPEL4 dead_magic_areab

CHAIN AC#PPEL4 poison_myth_unnhoyr_conflict_01
~I am no warrior—only a voice that tries to guide the blade toward mercy. Do not mistake stillness for blindness. I know what I ask of you, and I do not ask it lightly. But even the dirtiest task can plant a seed. Let us hope something better grows from it.~
END
IF ~~ THEN EXTERN AC#PPEL4 dead_magic_areab

CHAIN AC#PPEL4 dead_magic_areab
~The poisonous plant must grow there—twisted by wild magic and infused with death magic. Its venom carries that same warped magic into the body of its victims.~
END
IF ~~ THEN REPLY ~That’s an interesting theory.~ EXTERN AC#PPEL4 dead_magic_area_02
IF ~~ THEN REPLY ~Alright. To cure the victims, we’d have to cure magic itself—or what’s left of it.~ EXTERN AC#PPEL4 dead_magic_area_02
IF ~~ THEN REPLY ~Then we’ve half-solved the problem already.~ EXTERN AC#PPEL4 dead_magic_area_02

CHAIN IF ~~ THEN AC#PPEL4 dead_magic_area_02
~The only remaining question is who is crafting the poison. Did you catch a glimpse of Merethan’s killer?~
END
IF ~~ THEN REPLY ~Not really. He said something like Mal... Malar...~ EXTERN AC#PPEL4 malagent_what
IF ~~ THEN REPLY ~Couldn't you have asked me that earlier? Now I’ve forgotten it again.~ EXTERN AC#PPEL4 malagent_forgotten
IF ~~ THEN REPLY ~Strange fellow with a strange name. Something like Mala-something.~ EXTERN AC#PPEL4 malagent_what
IF ~~ THEN REPLY ~He called himself Malagent.~ EXTERN AC#PPEL4 malagent


	CHAIN IF ~~ THEN AC#PPEL4 malagent_forgotten
	~Think back. Did he give you any name that might help us?~
	END
	IF~~THEN REPLY ~Not really. He said something like Mal... Malar...~ EXTERN AC#PPEL4 malagent_what
	IF~~THEN REPLY ~Strange fellow with a strange name. Something like Mala-something.~ EXTERN AC#PPEL4 malagent_what
	IF~~THEN REPLY ~He called himself Malagent.~ EXTERN AC#PPEL4 malagent

CHAIN IF ~~ THEN AC#PPEL4 malagent_what
~Malagent?~
END
IF~~THEN REPLY ~Yes, that must be it.~ EXTERN AC#PPEL4 malagent
IF~~THEN REPLY ~Maybe?~ EXTERN AC#PPEL4 malagent
IF~~THEN REPLY ~I don't know and I don't care.~ EXTERN AC#PPEL4 malagent

CHAIN IF ~~ THEN AC#PPEL4 malagent
~A Malagent! That fits perfectly. That’s what the unholy agents of Talona call themselves—poisoners, corrupters, bringers of decay. Do you know who Talona is?~
END
IF~~THEN REPLY ~Yes.~ EXTERN AC#PPEL4 talona_yes
IF~~THEN REPLY ~No.~ EXTERN AC#PPEL4 talona_no

CHAIN IF ~~ THEN AC#PPEL4 talona_no
~Talona is the Lady of Poison and Mistress of Disease. Her followers wander the world spreading suffering and decay—why not with a newly brewed poison? Her devotees are quite... inventive.~
END
IF~~THEN EXTERN AC#PPEL4 talona_yes

CHAIN IF ~~ THEN AC#PPEL4 talona_yes
~Then it all makes sense. The incurable poison, the corrupted magic... it all bears Talona's mark. We now know that our enemy serves none other than the Lady of Poisons herself. This Malagent is working as her hand, spreading poison everywhere. We have the answers. Now we seek the source.~
END
IF~~THEN REPLY ~Let me guess—I get to face the poisoned arrows and monsters and traps, and you get to write a prayer about it.~ EXTERN AC#PPEL4 travel_ruin_b
IF~~THEN REPLY ~His poison lingers. So will our blade.~ EXTERN AC#PPEL4 travel_ruin_b
IF~~THEN REPLY ~Then let’s not waste time.~ EXTERN AC#PPEL4 travel_ruin
IF~~THEN REPLY ~The path is clear. Faith and steel shall see us through.~ EXTERN AC#PPEL4 travel_ruin
IF~~THEN REPLY ~Fine. But I expect at least one uneventful day after this.~ EXTERN AC#PPEL4 travel_ruin
IF~~THEN REPLY ~Seeking answer’s the easy part. What comes after tends to get messy.~ EXTERN AC#PPEL4 travel_ruin
IF ~~ THEN REPLY ~One question, though... are any fights allowed under Eldath’s rules? Or is all violence forbidden?~ GOTO allowed_to_fight_01

	CHAIN IF ~~ THEN AC#PPEL4 allowed_to_fight_01
	~Some things have strayed too far from nature's balance, there are afflictions no prayer can cleanse, only removal.~
	== AC#PPEL4 ~Undead, for example. They are a distortion of the natural cycle. They cling to suffering and bring only more of it.~
	== AC#PPEL4 ~Some beings are twisted by foul magic—poisoned roots, cursed beasts, unholy revenants. If they cannot be saved... they must be stilled.~
	== AC#PPEL4 ~To protect life from such corruption is not to betray peace. But violence must always be the last word, not the first.~
	END
	  IF ~~ THEN REPLY ~Seems even your goddess allows for a bit of bloodshed when things go bad.~ GOTO travel_ruin_b
	  IF ~~ THEN REPLY ~Phew. For a moment, I thought I'd have to hug a ghul.~ GOTO travel_ruin_b
	  IF ~~ THEN REPLY ~Great news. I'd hate to throw all my weapons into a pond.~ GOTO travel_ruin_b
	  IF ~~ THEN REPLY ~So I can still defend myself, if it’s truly needed. I’ll take that.~ GOTO travel_ruin_b
	  IF ~~ THEN REPLY ~I can live with that. Peace when possible, power when required.~ GOTO travel_ruin_b
	  IF ~~ THEN REPLY ~That’s all I needed to know.~ GOTO travel_ruin_b

	CHAIN IF ~~ THEN AC#PPEL4 travel_ruin_b
	~Eldath has shown you the path—now you must walk it on your own.~ 
	END 
	IF~~THEN EXTERN AC#PPEL4 travel_ruin

CHAIN IF ~~ THEN AC#PPEL4 travel_ruin
~In Myth Unnohyr you will find both the plant and the culprit. But it will not be easy—I dare not imagine what other creatures might dwell in such a forsaken place. You’ll find the ruins of Myth Unnohyr in the southern remnants of the ancient elven forests. I’ll mark the location on your map.~
==ViconiJ IF ~InParty("viconia") !StateCheck("viconia",CD_STATE_NOTVALID)~ THEN ~The weak weep for balance. The strong thrive in chaos. I say let this Mythal rot—it is not our concern.~
== MinscJ IF ~InParty("minsc") !StateCheck("minsc",CD_STATE_NOTVALID)~ THEN ~Evil magic in the air? Boo says it feels like we should hit something until it’s peaceful again!~
== CERNDJ IF ~InParty("Cernd") !StateCheck("Cernd",CD_STATE_NOTVALID)~ THEN ~The poisoner has made his mark. Now let nature guide our retribution.~
== KeldorJ IF ~InParty("keldorn") !StateCheck("keldorn",CD_STATE_NOTVALID)~ THEN ~Such defilement is a blight upon the realms. It offends all that is sacred. It must be ended.~
== JaheiraJ IF ~InParty("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN ~May our steps disturb not the ruins, but leave a mark where balance must be restored.~
== AerieJ IF ~InParty("aerie") !StateCheck("aerie",CD_STATE_NOTVALID)~ THEN ~Please, let’s be careful. I fear whatever broke the Mythal still lingers—and it doesn’t welcome visitors.~
==AC#PPEL4 ~One more thing: Should you come across the flower he twisted to his ends, bring it to me. I shall seek to cleanse its purpose and create an antidote.~ 
=
~Go now, and put an end to the servant of Talona. May the blessings of Eldath guide your next steps.~
DO ~RevealAreaOnMap("ACPP70")
AddJournalEntry(@12006,QUEST)
SetGlobal("AC#PPSpellCheckPoison","GLOBAL",10)
SetGlobal("AC#PP_MythUnnohyr","GLOBAL",1)~ EXIT

// FINAL: Dialogue Eldathyn highpriest #4; tree house in Duskwood Dell

BEGIN ~AC#PPEL4~

CHAIN IF ~Global("AC#PP_MythUnnohyr","GLOBAL",1)~ THEN AC#PPEL4 hello_04
~You have returned! Have you found the one behind the poison and brought him to justice?~
END
IF~Dead("AC#PPTA2")~THEN REPLY ~The Malagent is dead.~ EXTERN AC#PPEL4 malagent_dead
IF~~THEN REPLY ~I have nothing to report yet.~ EXTERN AC#PPEL4 no_news
IF ~~ THEN REPLY ~One thing keeps bugging me: Are there any creatures I'm actually allowed to fight in your name?~ GOTO allowed_to_fight
IF~PartyHasItem("AC#PPSYM") Global("AC#PP_AlaAgreesSymbol","GLOBAL",0)~THEN REPLY ~One more thing—I have Merethan’s symbol of Eldath with me.~ EXTERN AC#PPEL4 Merethan_emblem_03

CHAIN IF ~~ THEN AC#PPEL4 Merethan_emblem_03
~Such emblems are usually passed from one priest to another. Yet at this moment, I know no one to whom it should be given. Hold onto it for now—perhaps we shall find a fitting bearer.~
END
IF~Global("AC#PPSymbolQuest","GLOBAL",2)~THEN REPLY ~I believe I know someone—Montrassa, the elder priestess, whose hands can no longer craft her own.~ EXTERN AC#PPEL4 emblem_montrassa_03
IF~~THEN REPLY ~I’ll be on my way, then.~ EXTERN AC#PPEL4 no_news

CHAIN IF ~~ THEN AC#PPEL4 emblem_montrassa_03
~Montrassa? She never spoke of such a hardship, but... yes. It is a sound suggestion. Give her the emblem with my blessing.~
END
IF~~THEN REPLY ~I shall be honored to deliver your blessing to her.~ DO ~SetGlobal("AC#PP_AlaAgreesSymbol","GLOBAL",1)~ EXTERN AC#PPEL4 emblem_montrassa_bye_03

CHAIN AC#PPEL4 emblem_montrassa_bye_03
~Do so. She will surely be uplifted by your kindness.~
EXIT

	CHAIN IF ~~ THEN AC#PPEL4 allowed_to_fight
	~We do not seek battle—but there are things that no longer belong in this world.~
	== AC#PPEL4 ~Undead, for example. They are a distortion of the natural cycle. They cling to suffering and bring only more of it.~
	== AC#PPEL4 ~Some beings are twisted by foul magic—poisoned roots, cursed beasts, unholy revenants. If they cannot be saved... they must be stilled.~
	== AC#PPEL4 ~To protect life from such corruption is not to betray peace. But violence must always be the last word, not the first.~
	END
	  IF ~~ THEN REPLY ~Seems even your goddess allows for a bit of steel when things go bad.~ GOTO no_news
	  IF ~~ THEN REPLY ~That’s all I needed to know.~ GOTO no_news

CHAIN IF ~~ THEN AC#PPEL4 no_news
~You know best how to proceed. I shall wait here for your return.~
EXIT

CHAIN IF ~~ THEN AC#PPEL4 malagent_dead
~That is heartening news! Though I am no friend to violence, at times it is better that a wrongdoer troubles another realm rather than this one.~
== AC#PPEL4 ~You are most deserving of a reward for what you have done—for us, for Amn, and for all who might have fallen prey to that vile toxin. Here, I have gathered as much gold as I could for you.~
DO ~GiveGoldForce(6500) AddXPObject(Player1,6200) AddXPObject(Player2,6200) AddXPObject(Player3,6200) AddXPObject(Player4,6200) AddXPObject(Player5,6200) AddXPObject(Player6,6200) AddJournalEntry(@12009,QUEST_DONE)~
== AC#PPEL4 ~You have rendered us a great service, and for that I thank you! Yet the matter may still be set to greater rights.~
END
IF ~~ THEN EXTERN AC#PPEL4 antidote_quest_01

CHAIN IF ~~ THEN AC#PPEL4 antidote_quest_01
~With the proper antidote, we could nullify all the poisons this venom-brewer has already loosed upon the land. But to craft it, we require a sample of the plant the Malagent used for his foul draughts. Were you able to secure a specimen of Groveglove?~
END
IF ~PartyHasItem("AC#PPPUB")~ THEN REPLY ~I have brought you a specimen of that plant.~ EXTERN AC#PPEL4 malagent_dead_flo
IF ~PartyHasItem("AC#PPPUB")~ THEN REPLY ~Would this little flower be the one you seek?~ EXTERN AC#PPEL4 malagent_dead_flo
IF ~!PartyHasItem("AC#PPPUB")~ THEN REPLY ~I have not yet come across such a plant.~ EXTERN AC#PPEL4 malagent_dead_no_flo
IF ~~ THEN REPLY ~I am weary and would rest now. Let us speak of this another time.~ EXTERN AC#PPEL4 malagent_dead_no_flo


CHAIN AC#PPEL4 malagent_dead_flo
~So, you have it! That is most welcome news.~
DO ~SetGlobal("AC#PP_MythUnnohyr","GLOBAL",2) SetGlobal("AC#PP_ShowFlower","GLOBAL",1)~ EXTERN AC#PPEL4 cnt.01.01

CHAIN AC#PPEL4 malagent_dead_no_flo
~I see. Then I can only ask that you search once more within the ruins of Myth Unnohyr for this plant. Return to me when you have secured the specimen.~
DO ~SetGlobal("AC#PP_MythUnnohyr","GLOBAL",2)~ EXIT


//CONTINUATION AFTER THE MAIN PLOT:
CHAIN IF ~Global("AC#PP_MythUnnohyr","GLOBAL",2)~ THEN AC#PPEL4 cnt.01.00
~Ah, you’ve returned! I trust this means you're still invested in our cause. Though the main threat has been dealt with, our task is not yet complete.~
==AC#PPEL4 IF ~Global("AC#PP_ShowFlower","GLOBAL",1)~ THEN ~We spoke of the flower before—do you recall? That is what I wish to discuss now.~
==AC#PPEL4 IF ~Global("AC#PP_ShowFlower","GLOBAL",0)~ THEN ~Before your journey to Myth Unnohyr, I asked you to search for the plant our enemy used to brew the poison.~
==AC#PPEL4 ~Though the source has been silenced, I fear the poison is already out there in the Realms—passed from hand to hand, vial to vial. I wish to craft an antidote, and I hope you will aid me in this final step.~
DO ~SetGlobal("AC#PP_MythUnnohyr","GLOBAL",3)~
==AC#PPEL4 ~But knowledge alone won’t suffice. First, we need the flower itself. Have you brought it?~
END
IF~PartyHasItem("AC#PPPUB")~THEN REPLY ~Yes. It is here.~ EXTERN AC#PPEL4 cnt.01.01
IF~!PartyHasItem("AC#PPPUB")~THEN REPLY ~I’m afraid not.~ EXTERN AC#PPEL4 cnt.01.02

CHAIN IF ~Global("AC#PP_MythUnnohyr","GLOBAL",3)~ THEN AC#PPEL4 cnt.01.0B
~I’m glad you’re here. Have you found the flower?~
END
IF~PartyHasItem("AC#PPPUB")~THEN REPLY ~Yes, I have it with me.~ EXTERN AC#PPEL4 cnt.01.01
IF~!PartyHasItem("AC#PPPUB")~THEN REPLY ~No, not yet.~ EXTERN AC#PPEL4 cnt.01.02
IF~~THEN REPLY ~Give me a moment. I’ll be back shortly.~ EXIT
IF~PartyHasItem("AC#PPSYM") Global("AC#PP_AlaAgreesSymbol","GLOBAL",0)~THEN REPLY ~One more thing—I have Merethan’s symbol of Eldath with me.~ EXTERN AC#PPEL4 Merethan_emblem_04

CHAIN IF ~~ THEN AC#PPEL4 Merethan_emblem_04
~Such emblems are usually passed from one priest to another. Yet at this moment, I know no one to whom it should be given. Hold onto it for now—perhaps we shall find a fitting bearer.~
END
IF~Global("AC#PPSymbolQuest","GLOBAL",2)~THEN REPLY ~I believe I know someone—Montrassa, the elder priestess, whose hands can no longer craft her own.~ EXTERN AC#PPEL4 emblem_montrassa_04
IF~~THEN REPLY ~I’ll be on my way, then.~ EXTERN AC#PPEL4 no_news

CHAIN IF ~~ THEN AC#PPEL4 emblem_montrassa_04
~Montrassa? She never spoke of such a hardship, but... yes. It is a sound suggestion. Give her the emblem with my blessing.~
END
IF~~THEN REPLY ~I shall be honored to deliver your blessing to her.~ DO ~SetGlobal("AC#PP_AlaAgreesSymbol","GLOBAL",1)~ EXTERN AC#PPEL4 emblem_montrassa_bye_04

CHAIN AC#PPEL4 emblem_montrassa_bye_04
~Do so. She will surely be uplifted by your kindness.~
EXIT

CHAIN AC#PPEL4 cnt.01.02
~You don’t have it? That is most unfortunate.~
==AC#PPEL4 ~If we are to prepare the antidote, the flower is essential. Please, continue your search. I shall remain here and wait. May Eldath guide your steps.~
EXIT

CHAIN AC#PPEL4 cnt.01.01
~Let me take a look at the plant. Keep it with you, however, for you shall soon have need of it. So, this is the Groveglove—grown in a dead-magic zone within Myth Unnohyr. How very curious...~
== AC#PPEL4 ~It is in fine condition, yes. And it has grown tall, laden with venomous blossoms—more than enough for an antidote!~
== AC#PPEL4 ~While you strove to thwart our foe, I searched through all my books, and I believe I have found a way to fashion such an antidote. For it, we require both the flower and knowledge of the precise place—the cauldron or laboratory—where the poison was first brewed.~
END
IF ~~ THEN REPLY ~I recall the place well. A cauldron stood there, steeped in the venom of his craft. It seemed the work was left unfinished.~ EXTERN AC#PPEL4 cnt.01.03
IF ~~ THEN REPLY ~You mean the chamber where I struck down Talona’s servant? There was a cauldron there, no doubt meant for his next brew of poison.~ EXTERN AC#PPEL4 cnt.01.03
IF ~~ THEN REPLY ~A cauldron, yes—I saw it when I fought him. The stench alone told me it was not yet complete.~ EXTERN AC#PPEL4 cnt.01.03
IF ~~ THEN REPLY ~I did notice a cauldron there, though I had little mind for it while trading blows. If that is what you need, I can lead you to it.~ EXTERN AC#PPEL4 cnt.01.03
IF ~~ THEN REPLY ~Oh, that bubbling pot? Looked like something half-finished—and wholly unpleasant.~ EXTERN AC#PPEL4 cnt.01.03



CHAIN AC#PPEL4 cnt.01.03
~That is precisely what I had hoped. Yet more is still required. Allow me to share what I discovered in my books.~
== AC#PPEL4 ~Know this: Three blessings of the gods must be inscribed upon this flower. One or two alone shall not avail, for the dead magic that has fed it is grievously strong. Only when it is sanctified with life, compassion, and renewal may the corruption be purged.~ 
== AC#PPEL4 ~I cannot bestow all three blessings myself. For this, we must seek the aid of other faiths. And I know well where to turn for such help.~
== AC#PPEL4 ~You must travel to Athkatla and speak with the priest of Ilmater in the Slums. Ask him for the Blessing of Compassion. He and I are on good terms—I believe he will support our cause without hesitation.~
== AC#PPEL4 ~You should also visit the Church of Lathander in the city and request the Blessing of Renewal. I shall send a white dove ahead with my message. By the time you arrive, they will already be prepared to aid you.~ 
== KORGANJ IF ~InParty("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN ~Compassion? Renewal? Sounds like a feast fer cowards.~
== HEXXATJ IF ~InParty("hexxat") !StateCheck("hexxat",CD_STATE_NOTVALID)~ THEN ~Oh splendid. A holy scavenger hunt. Shall we embroider the petals with lace as well?~
== ViconiJ IF ~InParty("viconia") !StateCheck("viconia",CD_STATE_NOTVALID)~ THEN ~Renewal? Life? You would have us grovel before Ilmater’s sniveling flock? The weak cling to such words when truth and strength fail them.~
== DORNJ IF ~InParty("Dorn") !StateCheck("Dorn",CD_STATE_NOTVALID)~ THEN ~Compassion is for the meek. Renewal is for the broken. Neither are for me.~
== BEDWIN IF ~InParty("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN ~If I wanted sermons, I would have stayed in Thay—at least there they come with necromancy and a sacrifice.~
== AC#PPEL4 ~As for the third part, I shall bestow upon you the Blessing of Life myself.~
DO ~StartCutSceneMode() ForceSpell(Myself,DO_NOTHING) SmallWait(2) CreateVisualEffectObject("AC#PPRAI",Player1) CreateVisualEffectObject("AC#PPRAI",Player2) CreateVisualEffectObject("AC#PPRAI",Player3) CreateVisualEffectObject("AC#PPRAI",Player4) CreateVisualEffectObject("AC#PPRAI",Player5) CreateVisualEffectObject("AC#PPRAI",Player6) Wait(2) SetGlobal("AC#PP_MythUnnohyr","GLOBAL",4) SmallWait(1) EndCutSceneMode()
AddJournalEntry(@12100,QUEST)
AddJournalEntry(@12101,QUEST)
AddJournalEntry(@12102,QUEST)
AddJournalEntry(@12103,QUEST)
~ EXIT

CHAIN IF ~Global("AC#PP_MythUnnohyr","GLOBAL",4) Global("AC#PP_BonusBlessing","GLOBAL",0)~ THEN AC#PPEL4 cnt.01.04
~Done. These blessings should rest upon you as well, so that should the flower resist even prayer, your own hands may yet bear the grace to pass them on.~
END
// Player1 is a priest of Lathander:
IF ~Kit(Player1,GODLATHANDER)~ THEN REPLY ~The Morninglord’s servant stands before you; permit me to bless the flower.~ EXTERN AC#PPEL4 blessing_player_priest_lathander
// Player1 is either a cleric, druid, or paladin, but not a priest of Lathander:
IF~!Kit(Player1,GODLATHANDER)
OR(2) 
Alignment(Player1,MASK_GOOD) Alignment(Player1,MASK_GENEUTRAL) 
OR(3)
 Class(Player1,CLERIC_ALL) Class(Player1,DRUID_ALL) Class(Player1,PALADIN_ALL)~THEN REPLY ~What about me? Perhaps I should bless the flower, too? I am also a person of faith!~ EXTERN  AC#PPEL4 cnt.01.05a
// player1 is an evil cleric:
IF~Alignment(Player1,MASK_EVIL) OR(3) Class(Player1,CLERIC_ALL) Class(Player1,DRUID_ALL) Class(Player1,PALADIN_ALL)~THEN REPLY ~What about me? Perhaps I should bless the flower, too? I am also a person of faith!~ EXTERN  AC#PPEL4 cnt.01.05b
// player's other responses:
IF ~~ THEN REPLY ~Very well. Once the blessings are gathered, I shall return to you without delay.~ EXTERN AC#PPEL4 cnt.01.08
IF ~~ THEN REPLY ~I will do as you ask, though it seems no simple errand.~ EXTERN AC#PPEL4 cnt.01.08
IF ~~ THEN REPLY ~If the gods themselves are to be invoked, I can only hope the reward proves as divine as the task.~ EXTERN AC#PPEL4 cnt.01.07
IF ~~ THEN REPLY ~I trust there will be due reward for all the effort and time this task demands of me?~ EXTERN AC#PPEL4 cnt.01.07

CHAIN AC#PPEL4 blessing_player_priest_lathander
~Ah, I had not considered that—of course! Very well, then. Proceed, and lay your blessing upon it.~
DO ~StartCutSceneMode() SmallWait(2) ActionOverride(Player1,ForceSpell(Myself,DO_NOTHING)) CreateVisualEffectObject("SPROTECT",Player1) CreateVisualEffectObject("SPROTECT",Player2) CreateVisualEffectObject("SPROTECT",Player3) CreateVisualEffectObject("SPROTECT",Player4) CreateVisualEffectObject("SPROTECT",Player5) CreateVisualEffectObject("SPROTECT",Player6) Wait(2) SetGlobal("AC#PP_LathanderBlessing","GLOBAL",1) SetGlobal("AC#PP_BonusBlessing","GLOBAL",1) SmallWait(1) EndCutSceneMode()~ EXIT

CHAIN AC#PPEL4 cnt.01.05a
~I remain certain that these priests must aid us—I have already sent letters, and they will be expecting you. Yet your blessing, too, may lend strength to our cause.~
DO ~StartCutSceneMode() SmallWait(2) CreateVisualEffectObject("SPROTECT",Player1) CreateVisualEffectObject("SPROTECT",Player2) CreateVisualEffectObject("SPROTECT",Player3) CreateVisualEffectObject("SPROTECT",Player4) CreateVisualEffectObject("SPROTECT",Player5) CreateVisualEffectObject("SPROTECT",Player6) Wait(2) SetGlobal("AC#PP_BonusBlessing","GLOBAL",1) SmallWait(1) EndCutSceneMode()~ EXIT

CHAIN AC#PPEL4 cnt.01.05b
~While I do like you, there is this dark part in you. I am sorry, but we need something else than this. But I do appreciate your offer.~
EXTERN AC#PPEL4 cnt.01.08

CHAIN IF ~Global("AC#PP_MythUnnohyr","GLOBAL",4) Global("AC#PP_BonusBlessing","GLOBAL",1)~ THEN AC#PPEL4 cnt.01.0BB
~Thank you. Yet remember, we shall need the blessings of all faiths I spoke of.~
EXTERN AC#PPEL4 cnt.01.08

CHAIN AC#PPEL4 cnt.01.07
~Of course. I'll prepare something for you. Not gold, but something else. Something that will be of use during your journeys.~
EXTERN AC#PPEL4 cnt.01.08

CHAIN AC#PPEL4 cnt.01.08
~In addition, you will need a jug of Eldath’s singing water from our grotto. Speak to Eldath’s handmaiden near the water; she will give you a carafe of the sacred water.~
=
~When you have the water and the blessings of Lathander and Ilmater, return to me. Then I shall tell you what must be done next.~
=
~I'm counting on you, <CHARNAME>. We will be able to halt the spread of this vile poison — of that I am certain. Return to me once you have gathered everything.~
DO ~SetGlobal("AC#PP_MythUnnohyr","GLOBAL",5)
SetGlobal("AC#PP_HolyWater","GLOBAL",1)~ EXIT


//ILMATER

EXTEND_BOTTOM ~SLILMAT~ 6
IF~PartyHasItem("AC#PPPUB") Global("AC#PP_MythUnnohyr","GLOBAL",5) Global("AC#PP_IlmaterBlessing","GLOBAL",0)~THEN REPLY ~I was sent here from Duskwood Dell. I have this flower and I need a Blessing of Compassion. I believe you may have already received a letter describing the details.~ EXTERN SLILMAT AC#IL.BLESS
END

EXTEND_BOTTOM ~SLILMAT~ 0
IF~PartyHasItem("AC#PPPUB") Global("AC#PP_MythUnnohyr","GLOBAL",5) Global("AC#PP_IlmaterBlessing","GLOBAL",0)~THEN REPLY ~I was sent here from Duskwood Dell. I have this flower and I need a Blessing of Compassion. I believe you may have already received a letter describing the details.~ EXTERN SLILMAT AC#IL.BLESS
END

CHAIN SLILMAT AC#IL.BLESS
~Ah… yes. I had thought they would send one of their own, yet it matters not. You have come, and you shall not be denied my blessing.~  
== SLILMAT ~Hear me, Ilmater, Crying God, Endurer of all torments. Look with pity upon those who suffer and grant them the strength to endure. Let their burdens be eased, if only for a moment, and let their pain be mine to bear. Weep for the wounded, shield the broken, and clothe us all in patience and mercy. In your compassion lies our only hope—so let that hope flow now into this flower, that it may carry solace where poison once was sown.~  
== SLILMAT ~The blessing is given. Take it, my child, and let your heart weep for others, as my god has ever wept for you.~
DO ~SetGlobal("AC#PP_IlmaterBlessing","GLOBAL",1) CreateVisualEffectObject("AC#PPARM",Player1) CreateVisualEffectObject("AC#PPARM",Player2) CreateVisualEffectObject("AC#PPARM",Player3) CreateVisualEffectObject("AC#PPARM",Player4) CreateVisualEffectObject("AC#PPARM",Player5) CreateVisualEffectObject("AC#PPARM",Player6)
AddJournalEntry(@12104,QUEST_DONE)~ EXIT

//LATHANDER

EXTEND_BOTTOM ~DAWNMAS~ 0
IF~PartyHasItem("AC#PPPUB") Global("AC#PP_MythUnnohyr","GLOBAL",5) Global("AC#PP_LathanderBlessing","GLOBAL",0)~THEN REPLY ~I was sent here from Duskwood Dell. I have this flower and I need a Blessing of Renewal. I believe you may have already received a letter describing the details.~ EXTERN DAWNMAS AC#DM.BLESS
END

CHAIN DAWNMAS AC#DM.BLESS
~Yes, yes—I did receive the letter, and of course I shall grant you my blessing, that you may continue your quest with the Morninglord’s light at your side.~  
== DAWNMAS ~Lathander, Bringer of the Dawn, Herald of Renewal, grant this <PRO_RACE> your blessing. Fill <PRO_HIMHER> with the warmth of the rising sun, that <PRO_HESHE> may carry its light even into the coldest shadows and darkest dens.~
== DAWNMAS ~The blessing is bestowed. Go now with the Morninglord’s light upon you—may his dawn ever rise within your heart, and may each step you take carry the promise of renewal.~
DO ~SetGlobal("AC#PP_LathanderBlessing","GLOBAL",1) CreateVisualEffectObject("SPHOLYMT",Player1) CreateVisualEffectObject("SPHOLYMT",Player2) CreateVisualEffectObject("SPHOLYMT",Player3) CreateVisualEffectObject("SPHOLYMT",Player4) CreateVisualEffectObject("SPHOLYMT",Player5) CreateVisualEffectObject("SPHOLYMT",Player6)
AddJournalEntry(@12105,QUEST_DONE)~ EXIT

//BLESSING

CHAIN IF ~Global("AC#PP_MythUnnohyr","GLOBAL",5)~ THEN AC#PPEL4 cnt.02.00
~Welcome back. Have you received the blessings already and gathered some of Eldath's singing water from our grotto?~
END
IF~PartyHasItem("AC#PPWA") PartyHasItem("AC#PPPUB") Global("AC#PP_LathanderBlessing","GLOBAL",1) Global("AC#PP_IlmaterBlessing","GLOBAL",1)~THEN REPLY ~Yes, I have. What's next?~ EXTERN AC#PPEL4 have_blessings_have_flower_have_water
IF~~THEN REPLY ~I'm still working on this.~ EXTERN AC#PPEL4 cnt.02.01

CHAIN AC#PPEL4 cnt.02.01
~I see. Return to me when you're done with that part. Eldath bless you!~
EXIT

CHAIN AC#PPEL4 have_blessings_have_flower_have_water
//DO ~GiveItemCreate("AC#PPWA",Player1,1,0,0)~
~We have the flower, the singing water of Eldath, and we have the blessings. And we know where the poison was prepared. Now, we're going to use that exact place to give the shape to the toxin and prepare the antidote.~
END
IF~~THEN EXTERN AC#PPEL4 have_blessings_have_flower_have_water_02


CHAIN AC#PPEL4 have_blessings_have_flower_have_water_02
~You must remember: We are contending with wild magic, dead magic, and sacred blessing—a volatile mixture indeed. Yet I believe it shall hold… no, it must hold.~
== JaheiraJ IF ~InParty("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN ~It will. I know it.~
== CerndJ  IF ~InParty("Cernd") !StateCheck("Cernd",CD_STATE_NOTVALID)~ THEN ~A risk must be taken, if a bird is to learn how to fly. And we are such birds. We need to do whatever we can, and we'll sly above the threats.~
== RasaadJ IF ~InParty("Rasaad") !StateCheck("Rasaad",CD_STATE_NOTVALID)~ THEN ~Even though we cannot be completely sure about how the dead magic zone may affect the plan, we should indeed do our best. There are people who depend on us.~
==AC#PPEL4 ~You must return to Myth Unnohyr and place the blessed flower and Eldath’s singing water within the malagent’s cauldron. When they mingle with the poison’s remnants, the toxin will take form—defeat it, and an antidote shall be wrought.~
== AnomenJ IF ~InParty("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN ~Then let the vile concoction be given flesh, that we might smite it in righteous combat!~
== NEERAJ IF ~InParty("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID)~ THEN ~This is either going to end in glorious salvation... or one really big kaboom.~
== IMOEN2J IF ~InParty("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN ~So, we toss blessings in, stir thrice clockwise, and hope it doesn’t explode in our faces? Sounds like my first cooking attempts with Winthrop back in Candlekeep.~
== MinscJ IF ~InParty("minsc") !StateCheck("minsc",CD_STATE_NOTVALID)~ THEN ~If the cauldron brews a monster, then we make chopped monster stew! Justice will be well-fed today!~
== JANJ IF ~InParty("Jan") !StateCheck("Jan",CD_STATE_NOTVALID)~ THEN ~If it starts sprouting tentacles, just remember: Tentacles first, clean-up later. Worked for Aunt Belba’s laundry cauldron.~
== AC#PPEL4 ~Return to me with the completed antidote, and you shall have both my gratitude and a fitting reward. May Eldath’s peace enfold you on your path and may shield you from all harm until we meet again.~
DO ~SetGlobal("AC#PP_MythUnnohyr","GLOBAL",6)~ EXIT

//ANTIDOTE

CHAIN IF ~Global("AC#PP_MythUnnohyr","GLOBAL",6)~ THEN AC#PPEL4 cnt.03.00
~Have you fashioned the antidote? Is that why you have returned—to bring me good news?~
END
IF ~PartyHasItem("AC#PPANT")~ THEN REPLY ~Yes. Here it is—but it was no easy task.~ DO ~TakePartyItem("AC#PPANT") DestroyItem("AC#PPANT")~ EXTERN AC#PPEL4 cnt.03.02
IF ~PartyHasItem("AC#PPANT")~ THEN REPLY ~The antidote is made. May it spare many lives.~ DO ~TakePartyItem("AC#PPANT") DestroyItem("AC#PPANT")~ EXTERN AC#PPEL4 cnt.03.02
IF ~PartyHasItem("AC#PPANT")~ THEN REPLY ~Here—freshly wrought, and hard-won.~ DO ~TakePartyItem("AC#PPANT") DestroyItem("AC#PPANT")~ EXTERN AC#PPEL4 cnt.03.02
IF ~PartyHasItem("AC#PPANT")~ THEN REPLY ~It is done, and no small thanks to your guidance. Here is the remedy.~ DO ~TakePartyItem("AC#PPANT") DestroyItem("AC#PPANT")~ EXTERN AC#PPEL4 cnt.03.02
IF ~PartyHasItem("AC#PPANT")~ THEN REPLY ~This little vial cost me blood, sweat, and more than a few corpses. Take it, before I change my mind.~ DO ~TakePartyItem("AC#PPANT") DestroyItem("AC#PPANT")~ EXTERN AC#PPEL4 cnt.03.02
IF ~~ THEN REPLY ~Not yet.~ EXTERN AC#PPEL4 cnt.03.01
IF~PartyHasItem("AC#PPSYM") Global("AC#PP_AlaAgreesSymbol","GLOBAL",0)~THEN REPLY ~One more thing—I have Merethan’s symbol of Eldath with me.~ EXTERN AC#PPEL4 Merethan_emblem_05

CHAIN IF ~~ THEN AC#PPEL4 Merethan_emblem_05
~Such emblems are usually passed from one priest to another. Yet at this moment, I know no one to whom it should be given. Hold onto it for now—perhaps we shall find a fitting bearer.~
END
IF~Global("AC#PPSymbolQuest","GLOBAL",2)~THEN REPLY ~I believe I know someone—Montrassa, the elder priestess, whose hands can no longer craft her own.~ EXTERN AC#PPEL4 emblem_montrassa_05
IF~~THEN REPLY ~I’ll be on my way, then.~ EXTERN AC#PPEL4 no_news

CHAIN IF ~~ THEN AC#PPEL4 emblem_montrassa_05
~Montrassa? She never spoke of such a hardship, but... yes. It is a sound suggestion. Give her the emblem with my blessing.~
END
IF~~THEN REPLY ~I shall be honored to deliver your blessing to her.~ DO ~SetGlobal("AC#PP_AlaAgreesSymbol","GLOBAL",1)~ EXTERN AC#PPEL4 emblem_montrassa_bye_05

CHAIN AC#PPEL4 emblem_montrassa_bye_05
~Do so. She will surely be uplifted by your kindness.~
EXIT

CHAIN AC#PPEL4 cnt.03.01
~I understand. Return to me as soon as it is complete. This is of great import, and we are close now.~
EXIT


CHAIN AC#PPEL4 cnt.03.02
~Oh, blessed day! You have done a deed of true compassion. Few could be called a greater friend to peace than you.~  
== AC#PPEL4 ~With this antidote, we shall answer whenever word reaches us of one stricken by a poison or ailment untouched by magic. Through it, lives will be spared, and suffering eased.~  
== AC#PPEL4 ~For all you have done—for the people of Amn, and for Duskwood Dell—I offer my deepest thanks. And as I promised, I have something for you. May it aid you in the trials and journeys yet before you.~  
== AC#PPEL4 ~And know this: Whenever you are in need of shelter or rest, Duskwood Dell shall welcome you with open arms, under the peace of Eldath’s embrace.~  
DO ~SetGlobal("AC#PP_MythUnnohyr","GLOBAL",7) GiveItemCreate("AC#PPRE",Player1,1,0,0) AddXPObject(Player1,4200) AddXPObject(Player2,4200) AddXPObject(Player3,4200) AddXPObject(Player4,4200) AddXPObject(Player5,4200) AddXPObject(Player6,4200)
AddJournalEntry(@12111,QUEST_DONE)~ EXIT


//FINISHED

CHAIN IF ~Global("AC#PP_MythUnnohyr","GLOBAL",7)~ THEN AC#PPEL4 cnt.04.00
~It gladdens me to see you again, <CHARNAME>. As I have said before, Duskwood Dell shall ever welcome you in peace.~  
END
IF~~THEN REPLY ~Thank you, I appreciate that.~ EXTERN AC#PPEL4 bye_finished
IF~~THEN REPLY ~I must be going.~ EXTERN AC#PPEL4 bye_finished
IF~PartyHasItem("AC#PPSYM") Global("AC#PP_AlaAgreesSymbol","GLOBAL",0)~THEN REPLY ~One more thing—I have Merethan’s symbol of Eldath with me.~ EXTERN AC#PPEL4 Merethan_emblem_06

CHAIN IF ~~ THEN AC#PPEL4 Merethan_emblem_06
~Such emblems are usually passed from one priest to another. Yet at this moment, I know no one to whom it should be given. Hold onto it for now—perhaps we shall find a fitting bearer.~
END
IF~Global("AC#PPSymbolQuest","GLOBAL",2)~THEN REPLY ~I believe I know someone—Montrassa, the elder priestess, whose hands can no longer craft her own.~ EXTERN AC#PPEL4 emblem_montrassa_06
IF~~THEN REPLY ~I’ll be on my way, then.~ EXTERN AC#PPEL4 bye_finished

CHAIN IF ~~ THEN AC#PPEL4 emblem_montrassa_06
~Montrassa? She never spoke of such hardship, but... yes. It is a sound suggestion. Give her the emblem with my blessing.~
END
IF~~THEN REPLY ~I shall be honored to deliver your blessing to her.~ DO ~SetGlobal("AC#PP_AlaAgreesSymbol","GLOBAL",1)~ EXTERN AC#PPEL4 emblem_montrassa_bye_06

CHAIN AC#PPEL4 emblem_montrassa_bye_06
~Do so. She will surely be uplifted by your kindness.~
EXIT

CHAIN AC#PPEL4 bye_finished
~May the blessing of Eldath be with you.~
EXIT

/*
IF~~THEN REPLY ~Thank you.~ EXIT
IF~Global("AC#PPSymbolQuest","GLOBAL",1) Global("AC#PPSymbolAskNow","GLOBAL",0)~THEN REPLY ~One of your sisters has been trying to make this Eldath emblem, but she cannot succeed. She is suffering from serious numbness in her hands. Perhaps you have some emblem, or a symbol I could give her. I think she deserves it.~ DO ~SetGlobal("AC#PPSymbolAskNow","GLOBAL",1)~ EXTERN AC#PPEL4 cnt.04.01
IF~InMyArea("AC#PPMON")~THEN REPLY ~I can see our mutual friend came here to thank you for the symbol.~ EXTERN AC#PPEL4 cnt.04.02

CHAIN AC#PPEL4 cnt.04.01
~I think I know the person you are speaking of. Yes. I should have something here. You can take it and give it to her. It sounds like someone with a strong spirit and she should truly have it, the symbol.~
DO ~GiveItemCreate("AC#PPSYM",Player1,1,0,0)~ EXIT

CHAIN AC#PPEL4 cnt.04.02
~Yes. And I must say that it may be quite interesting to teach this one. I'm glad she came to me.~
EXIT
*/

// Eldathyn high priest and novice
BEGIN ~AC#PPST4~
CHAIN IF ~True()~ THEN AC#PPST4 hello_novice
~Exalted Fallskeeper... why do we never carry weapons, even when others do? Isn’t peace worth defending?~
==AC#PPEL4 ~Peace is not a thing we carry in our hands, but in our hearts. A blade can silence a voice—but never spread stillness.~
==AC#PPST4 ~But what if someone brings violence to our grove? What if they don’t listen?~
==AC#PPEL4 ~Then we listen more. Words can reach where arrows cannot. And if they strike, we do not answer with pain, but with presence.~
==AC#PPST4 ~I don’t think I understand yet... but I will try.~
==AC#PPEL4 ~Then you already walk her path. Eldath asks for no haste—only the courage not to halt. Go now, and let each step be as soft as falling rain.~  
==AC#PPST4 ~Thank you for your guidance, Exalted Fallskeeper. I hope that one day I will come to understand Eldath's teachings in all her glory.~
DO ~EscapeAreaDestroy(1)~ EXIT
