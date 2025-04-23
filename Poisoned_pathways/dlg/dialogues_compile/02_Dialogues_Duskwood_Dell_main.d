
// Dialogue Eldathyn priest #3; guard in Duskwood Dell

BEGIN ~AC#PPEL3~

CHAIN IF ~True()~ THEN AC#PPEL3 hello_01
~Peace of the Goddess be upon you. It is rare for strangers to find their way here. This grove reveals itself only to those who already know of it. How is it, then, that you have come—and that Eldath has allowed your steps to pass?~ 
END
IF~~THEN REPLY ~I bring word that a follower of your faith has been poisoned by an unknown assailant. I carry an arrow here, so your order’s leader might trace the source of the poison.~ EXTERN AC#PPEL3 need_go_to_highpriest
IF~~THEN REPLY ~There is a dangerous foe—skilled in poisons. Long story short: One of your people has fallen, and he sent us here before his end.~ EXTERN AC#PPEL3 need_go_to_highpriest
IF~~THEN REPLY ~Some threat, some poison, dying people... look, I don’t have time for pleasantries. Just point me to your leader.~ EXTERN AC#PPEL3 need_go_to_highpriest
IF~~THEN REPLY ~Honestly? One of yours is dead, and now I’m the one cleaning up the mess because you're all too weak to act. Where’s your spineless leader hiding?~
 EXTERN AC#PPEL3 need_go_to_highpriest2

CHAIN IF ~~ THEN AC#PPEL3 need_go_to_highpriest
~By the Mother Guardian of Groves! Then Merethan has fallen? It is him you speak of, yes? This is grave news indeed...~ 
=
~Quickly—bring the poisoned arrow to our High Priest. You’ll find him in his chambers, in the rearmost tree by the water’s edge. But be careful—the venom seems potent, and even a trace may do harm. Alatoasz will know how to proceed.~
== JaheiraJ IF ~InParty("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN ~We certainly hope so.~
== CerndJ  IF ~InParty("Cernd") !StateCheck("Cernd",CD_STATE_NOTVALID)~ THEN ~I believe Eldath wouldn't want to see any more of the nature's children sway and fall.~
== RasaadJ IF ~InParty("Rasaad") !StateCheck("Rasaad",CD_STATE_NOTVALID)~ THEN ~And we will gladly aid him with our knowledge and skills. This poison must be stopped.~
== AC#PPEL3 ~May the Mother Guardian of Groves and Waters grant you her blessing.~
DO ~EscapeArea()~ EXIT

CHAIN IF ~~ THEN AC#PPEL3 need_go_to_highpriest2
~You'll find him in his chambers, in the rearmost tree by the water. Now go—and trouble others no more.~
DO ~ReputationInc(-1) EscapeArea()~ EXIT

//////////////////////////////////////////////////////////////
// First talk with Exalted Fallskeeper Alatoasz Berendim

CHAIN IF ~Global("AC#PPSpellCheckPoison","GLOBAL",0)~ THEN AC#PPEL4 hello_01
~May the Mother Guardian of Groves grant you peace and health, stranger. I am Most Exalted Fallskeeper Alatoasz Berendim, a humble servant of Eldath. What brings you to our sanctuary?~ 
END
IF~~THEN REPLY ~Let's make it brief: Merethan is dead. He was killed with this poison. We need to find out who made it.~ EXTERN AC#PPEL4 about_arrow
IF~~THEN REPLY ~Your priest, Merethan, was poisoned. I have here an arrow soaked in the toxin. He hoped you might be able to use it to trace the culprit.~ EXTERN AC#PPEL4 about_arrow
IF~~THEN REPLY ~Greetings, Most Exalted Fallskeeper Alatoasz Berendim. I come with sad news. Your priest, Merethan, was poisoned. Here. I have an arrow soaked in the toxin that ended his life. One that was also used lately by kill others, like Renfeld, a man from Athkatla. He hoped you might be able to use it to trace the one responsible for creating this vile thing.~ EXTERN AC#PPEL4 about_arrow

CHAIN IF ~~ THEN AC#PPEL4 about_arrow
~This is sad news. Merethan was a faithful follower—a Freewalker—ever traveling to spread the word of our silent goddess throughout the Realms. It pains me that he has left this world in such a way. I know the circumstances—indeed, I was the one who tasked him with investigating the troubling cases of poisoning.~
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
~Well then, if magic fails, we must once again rely on our senses, mustn’t we? I can smell something on this arrow—a peculiar scent, sharp and sweet. A plant-based poison, that much is certain...~
END
IF~~THEN EXTERN AC#PPEL4 poison_investigate_02

CHAIN IF ~~ THEN AC#PPEL4 poison_investigate_02
~Let me taste a small amount of the poison...~
END
IF~~THEN REPLY ~You’re not seriously putting that in your mouth, are you?~ EXTERN AC#PPEL4 poison_investigate_03
IF~~THEN REPLY ~Careful! I don’t want to lose a second Eldathyn.~ EXTERN AC#PPEL4 poison_investigate_03
IF~~THEN REPLY ~Use at your own risk.~ EXTERN AC#PPEL4 poison_investigate_03

CHAIN IF ~~ THEN AC#PPEL4 poison_investigate_03
~I know the risk, but we have no time. If this toxin spreads to even more dangerous hands, the cost will be far greater. So... now or never.~
==AC#PPEL4 ~The taste eludes clear memory—faint, almost ghostly. And the scent... it clings like the echo of a dream, fading even as I try to grasp it.~
END
IF~~THEN DO ~ApplySpellRES("AC#PPPN",Myself)~ EXTERN AC#PPEL4 poison_investigate_04

CHAIN IF ~~ THEN AC#PPEL4 poison_investigate_04
~There is a bitterness, like foxglove, but something older lingers within it... something raw and untamed. The numbness spreads, slow and deliberate, reaching toward my heart. Could it be—~
END
IF~~THEN EXTERN AC#PPEL4 poison_investigate_05

CHAIN IF ~~ THEN AC#PPEL4 poison_investigate_05
~Of course! It must be the Vesper Vein—a rare elven plant! Highly toxic and revered by elves for millennia.~ 
=
~Yet its poison is usually easily cured by magic—so why does it fail now? It makes no sense.~ 
END 
IF~~THEN REPLY ~Good thing that stuff didn’t kill you too.~ EXTERN AC#PPEL4 no_matter
IF~~THEN REPLY ~And you figured all that out by sniffing the arrow and tasting the poison?~ EXTERN AC#PPEL4 no_matter


CHAIN IF ~~ THEN AC#PPEL4 no_matter
~We often deal with poisons here. Many gravely ill souls come to us, and it falls to us to either heal them or guide them through death. Over time, we’ve gained unfortunate familiarity with some of the foulest substances in the Realms. But never have I encountered something like this. Well, no matter. For now, we know where our search must begin.~
END
IF~~THEN EXTERN AC#PPEL4 poison_investigate_06

CHAIN IF ~~ THEN AC#PPEL4 poison_investigate_06
~The plant used to create this poison grows only near the ruins of ancient elven cities, where the land still remembers the old magic.~
END
IF~~THEN REPLY ~So what’s next?~ EXTERN AC#PPEL4 poison_investigate_further
IF~~THEN REPLY ~Your knowledge is... impressive!~ EXTERN AC#PPEL4 poison_investigate_further_b

CHAIN AC#PPEL4 poison_investigate_further_b
~Thank you, but I hope it will be enough to find the actual place.~
EXTERN AC#PPEL4 poison_investigate_further

CHAIN IF ~~ THEN AC#PPEL4 poison_investigate_further
~I want to focus on one of the old elven ruins scattered throughout these lands, but... which one? There are many—too many. Finding the right one will be our first true task.~
END
IF~~THEN EXTERN AC#PPEL4 about_keltormir

CHAIN IF ~~ THEN AC#PPEL4 about_keltormir
~As you may know, the region now called the Lands of Intrigue was once a vast, continuous forest—home to the elven kingdom of Keltormir. The elves built splendid cities within those woods, and though their time has passed, ruins remain... and so do rare plants. Plants that may lead us to the right place.~
END
IF~~THEN REPLY ~And where should I begin the search?~ EXTERN AC#PPEL4 about_keltormir_02
IF~~THEN REPLY ~Then let’s get to those ruins!~ EXTERN AC#PPEL4 about_keltormir_02

CHAIN IF ~~ THEN AC#PPEL4 about_keltormir_02
~If only it were that simple. I am no scholar of ancient history. My expertise lies in nature. But... fortunately, I know someone who is.~
=
~I ask you to visit the Temple of Oghma in Athkatla. They keep many tomes, including some that speak of the old elven cities. If I can get even a general clue, I may be able to narrow our search considerably.~
END
IF~~THEN REPLY ~Back to Athkatla, then.~ EXTERN AC#PPEL4 to_oghma
IF~~THEN REPLY ~I don’t usually run errands for books... but fine.~ EXTERN AC#PPEL4 to_oghma
IF~~THEN REPLY ~If you say it helps, I’ll fetch your book.~ EXTERN AC#PPEL4 to_oghma

CHAIN IF ~~ THEN AC#PPEL4 to_oghma
~In the meantime, I shall reflect further on the nature of this poison. You were kind enough to bring me a sample... though it came at the cost of a good priest’s life.~
END
IF~~THEN REPLY ~I’ll be on my way, then.~ EXTERN AC#PPEL4 to_oghma_bye
IF~PartyHasItem("AC#PPSYM")~THEN REPLY ~One more thing—I have Merethan’s symbol of Eldath with me.~ EXTERN AC#PPEL4 Merethan_emblem

CHAIN IF ~~ THEN AC#PPEL4 Merethan_emblem
~Such emblems are usually passed from one priest to another. Yet for now, I know no one who should carry it. Keep it with you for the time being—mayhap we shall find a worthy soul to whom it may be entrusted.~
END
IF~~THEN REPLY ~I might know someone—Montrassa, the elder priestess. Her hands have grown too frail to craft her own emblem.~ EXTERN AC#PPEL4 emblem_montrassa
IF~~THEN REPLY ~I’ll be on my way, then.~ EXTERN AC#PPEL4 to_oghma_bye

CHAIN IF ~~ THEN AC#PPEL4 emblem_montrassa
~Montrassa? She never spoke of such difficulty... but it makes perfect sense. A thoughtful suggestion! Give her the emblem, with my blessing. And afterward, please proceed to the Temple of Oghma in Athkatla, as we discussed.~
END
IF~~THEN DO ~SetGlobal("AC#PP_AlaAgreesSymbol","GLOBAL",1)~ EXTERN AC#PPEL4 to_oghma_bye

CHAIN IF ~~ THEN AC#PPEL4 to_oghma_bye
~I shall send a dove ahead to the Temple of Oghma, so their scribes may ready the proper volume. Return to me once you have the book. I shall be waiting below, on the lower level of this tree. May Eldath's blessings guide your steps, my friend.~
DO ~SetGlobal("AC#PPSpellCheckPoison","GLOBAL",2)
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


/*
CHAIN IF ~Global("AC#PPSpellCheckPoison","GLOBAL",3) Global("AC#PP_Oghma","GLOBAL",1)~ THEN AC#PPEL4 hello_03
~<CHARNAME>! I’ve found the answer! But—as I feared, this mission will be dangerous and I cannot send you there without proper protection. To grant it, I will need that golden necklace I mentioned earlier. The matter is urgent, but I am not going to condemn you to death! I want to enchant it for you, you'll need it. Do you have it?~
END
IF~PartyHasItem("AMUL10")~THEN REPLY ~Yes. Here it is.~ DO ~TakePartyItem("AMUL10")~ EXTERN AC#PPEL4 hello_03b
IF~~THEN REPLY ~You know what, give me another moment. I'll get back to you as soon as possible.~ EXTERN AC#PPEL4 hello_03x
*/

CHAIN IF ~~ THEN AC#PPEL4 read_book
~Interesting... A well-crafted tome, with valuable insights. Ah—three Mythal-cities are mentioned explicitly here: Myth Rhynn, Myth Unnohyr, and Myth Tellaren. Hmm. Oh! This is promising—mayhap even a true lead.~
=
~Of the three cities, which calls to you as the source? Where do you feel the trail leads?~
END
IF~~THEN REPLY ~Myth Rhynn.~ EXTERN AC#PPEL4 wrong_myth_rhynn
IF~~THEN REPLY ~Myth Unnohyr.~ EXTERN AC#PPEL4 right_myth_unnohyr
IF~~THEN REPLY ~Myth Tellaren.~ EXTERN AC#PPEL4 wrong_myth_tellaren
IF~~THEN REPLY ~I’m not sure.~ EXTERN AC#PPEL4 right_myth_unnohyr

CHAIN IF ~~ THEN AC#PPEL4 wrong_myth_rhynn
~Myth Rhynn—the elven necropolis? An intriguing thought, but no... I don’t believe that’s where we’ll find our answer.~
END
IF~~THEN REPLY ~Then it must be Myth Unnohyr.~ EXTERN AC#PPEL4 right_myth_unnohyr

CHAIN IF ~~ THEN AC#PPEL4 wrong_myth_tellaren
~Myth Tellaren, buried in the sands of Calimshan? We’ll not find a single living plant there—certainly not the one we’re seeking. I’m afraid that can’t be it.~
END
IF~~THEN REPLY ~Then Myth Unnohyr must be the one.~ EXTERN AC#PPEL4 right_myth_unnohyr

CHAIN IF ~~ THEN AC#PPEL4 right_myth_unnohyr
~Yes... Myth Unnohyr. That must be the place. Listen to this passage: 'When his blessing was withdrawn, the mythal shattered in silent judgment, leaving behind a zone of wild and dead magic—a festering wound in the Weave that endures to this day. Now, few dare to approach its ruins, where even divine power falters, and plants whisper poison into the soil.'~
=
~That explains why our spells fail, and why this poison defies all healing—it carries the essence of Myth Unnohyr’s broken mythal, steeped in dead magic!~
END
IF~~THEN REPLY ~If you say so.~ EXTERN AC#PPEL4 poison_myth_unnhoyr_03
IF~Race(Player1,ELF)~THEN REPLY ~Myth Unnohyr... I’ve heard of ruins left by my people, but this place... is weird.~ EXTERN AC#PPEL4 poison_myth_unnhoyr_03
IF~~THEN REPLY ~Not exactly a pleasant destination.~ EXTERN AC#PPEL4 poison_myth_unnhoyr_03


CHAIN AC#PPEL4 hello_03x
~I'll wait here, then.~
EXIT

CHAIN AC#PPEL4 hello_03b
~Splendid! I'll talk as I gather ingredients needed to enchant this fine piece of jewlery. Where should I start...~
EXTERN AC#PPEL4 poison_myth_unnhoyr

CHAIN IF ~~ THEN AC#PPEL4 poison_myth_unnhoyr
~As you know, I tried to find out where this poison could be brewed. I believe the plant used in creating this poison must be harvested in the ancient city of Myth Unnohyr.~
END
IF~~THEN REPLY ~Never heard of that place.~ EXTERN AC#PPEL4 poison_myth_unnhoyr_02
IF~Race(Player1,ELF)~THEN REPLY ~Myth Unnohyr—I remember you mentioned ruins left by my kin, elves, but...~ EXTERN AC#PPEL4 poison_myth_unnhoyr_02b
IF~CheckStatGT(Player1,34,LORE)~THEN REPLY ~I think I heard about this place, Myth Unnohyr. This is an old elven city, Mythal was erected there, once.~ EXTERN AC#PPEL4 poison_myth_unnhoyr_02c

CHAIN AC#PPEL4 poison_myth_unnhoyr_02b
~Ah, yes. You're an elf. It is your culture we're discussing here.~
EXTERN AC#PPEL4 poison_myth_unnhoyr_02

CHAIN AC#PPEL4 poison_myth_unnhoyr_02c
~Yes. You're correct.~
EXTERN AC#PPEL4 poison_myth_unnhoyr_02

CHAIN IF ~~ THEN AC#PPEL4 poison_myth_unnhoyr_02
~It is one of the long-lost elven cities of old Keltormir, which once encompassed the Tethir and Mir forests. One of my close friends been there, even brought me few samples.~
END
IF~~THEN EXTERN AC#PPEL4 poison_myth_unnhoyr_03

CHAIN IF ~~ THEN AC#PPEL4 poison_myth_unnhoyr_03
~Myth Unnohyr was dedicated to an unknown elven god. A mysterious catastrophe caused the Mythal that protected the city to implode, leaving behind nothing but a magical abomination. It's a wild magic zone by day, and a dark void of dead magic by night.~
== NeeraJ  IF ~InParty("Neera") !StateCheck("Neera",CD_STATE_NOTVALID)~ THEN ~Wild magic zone AND dark void of dead magic? Wow. That's... encouraging. I'm being sarcastic, by the way.~
== AC#PPEL4 ~By day, it's chaos. By night, magic just... doesn't exist there. Not in the usual sense. Maybe innate metamagic held by some creatures or items could partially work, but... I don't know. It's a theory. And I wouldn't depend on untested ideas.~
END
IF~~THEN REPLY ~And you want me to go there?~ EXTERN AC#PPEL4 dead_magic_area
IF~~THEN REPLY ~Ah. That means I'll need to equip myself with lots of weapons...~ EXTERN AC#PPEL4 dead_magic_area2

CHAIN IF ~~ THEN AC#PPEL4 dead_magic_area
~Don’t you see? It's not just wild magic in there! It's also dead magic!~
EXTERN AC#PPEL4 dead_magic_areab

CHAIN IF ~~ THEN AC#PPEL4 dead_magic_area2
~You may need more than just weapons, but remember: Even without control over magic, a keen mind can help you when facing all sorts of tasks.~
EXTERN AC#PPEL4 dead_magic_areab

CHAIN AC#PPEL4 dead_magic_areab
~The plants that produce the poison must grow there—twisted by the wild magic and infused with the remnants of that dead magic itself. Our healing spells fail because the poison carries that same dead magic into the body of the victim! This is why this poison cannot be healed.~
END
IF~~THEN REPLY ~That’s an interesting theory.~ EXTERN AC#PPEL4 dead_magic_area_02
IF~~THEN REPLY ~Then we’ve solved the riddle.~ EXTERN AC#PPEL4 dead_magic_area_02

CHAIN IF ~~ THEN AC#PPEL4 dead_magic_area_02
~Now the only question is who is crafting the poison. Did you catch a glimpse of Merethan’s killer?~
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
~A Malagent! Of course. That fits perfectly. That’s what the unholy agents of Talona call themselves—poisoners, corrupters, bringers of decay. Do you know who Talona is?~
END
IF~~THEN REPLY ~Yes.~ EXTERN AC#PPEL4 talona_yes
IF~~THEN REPLY ~No.~ EXTERN AC#PPEL4 talona_no

CHAIN IF ~~ THEN AC#PPEL4 talona_no
~Talona is the Lady of Poison and Mistress of Disease. Her followers wander the world spreading suffering and decay—why not with a newly brewed poison? Her devotees are quite... inventive.~
END
IF~~THEN EXTERN AC#PPEL4 talona_yes

CHAIN IF ~~ THEN AC#PPEL4 talona_yes
~Then we now know that our enemy serves none other than the Lady of Poisons herself.~
END
IF~~THEN REPLY ~And I’m to enter this blasted elven ruin.~ EXTERN AC#PPEL4 travel_ruin
IF~~THEN REPLY ~...who brews poison within a dead magic zone in Myth Unnohyr.~ EXTERN AC#PPEL4 travel_ruin

CHAIN IF ~~ THEN AC#PPEL4 travel_ruin
~Exactly! In Myth Unnohyr you will find both the plant and the culprit. But it will not be easy—I dare not imagine what other creatures might dwell in such a forsaken place. You’ll find the ruins of Myth Unnohyr in the southern remnants of the ancient elven forests. I’ll mark the location on your map.~
==AC#PPEL4 ~Go now, and put an end to the servant of Talona. Oh, one more thing: Should you come across the flower he twisted to his ends, bring it to me. I shall seek to cleanse its purpose and create an antidote. And now go. May the blessings of Eldath guide your steps.~
DO ~RevealAreaOnMap("ACPP70")
SetGlobal("AC#PPSpellCheckPoison","GLOBAL",10)
SetGlobal("AC#PP_MythUnnohyr","GLOBAL",1)~ EXIT

/*
CHAIN IF ~~ THEN AC#PPEL4 travel_ruin
~Exactly! In Myth Unnohyr you will find both the plant and the culprit. But it will not be easy—I dare not imagine what other creatures might dwell in such a forsaken place. You’ll find the ruins of Myth Unnohyr in the southern remnants of the ancient elven forests. I’ll mark the location on your map.~
== AC#PPEL4 ~Before you go, however, I promised you something. I shall now enchant this amulet for you. One, that will help you survive in that bizarre place.~
DO ~SetGlobal("AC#PPCreateAmulet","GLOBAL",1) StartCutSceneMode() Wait(1) CreateVisualEffectObject("SPBASERD",Myself) Wait(3) EndCutSceneMode() StartDialogueNoSet(Player1)~ EXIT

CHAIN IF ~Global("AC#PPCreateAmulet","GLOBAL",1)~THEN AC#PPEL4 travel_ruin_fin
~Here—take this amulet. I have woven into it the soil of Myth Unnohyr… and a full year of my own life and strength. It carries my sacrifice, and with it, you may briefly draw upon that essence—to cast spells and shield yourself against the wild magic that haunts that place.~
==AC#PPEL4 ~But remember, this effect is going to last only for a moment. It also won't affect the wild magic engraved in a person, so if there is a wild mage among you, they will be protected only by that place's effect, not their own power.~
==AC#PPEL4 ~Good luck, my friend. Go and stop the servant of the Talona, and mayhap, if possible, bring me the flower he used to create the poison. Mayhap I'll find a way to use it properly.~
DO ~GiveItemCreate("AC#PPAM",Player1,8,0,0)
SetGlobal("AC#PPCreateAmulet","GLOBAL",2)
RevealAreaOnMap("ACPP70")
SetGlobal("AC#PPSpellCheckPoison","GLOBAL",10)
SetGlobal("AC#PP_MythUnnohyr","GLOBAL",1)~ EXIT
*/

// FINAL: Dialogue Eldathyn highpriest #4; tree house in Duskwood Dell

BEGIN ~AC#PPEL4~

CHAIN IF ~Global("AC#PP_MythUnnohyr","GLOBAL",1)~ THEN AC#PPEL4 hello_04
~You have returned! Have you found the one behind the poison and brought him to justice?~
END
IF~Dead("AC#PPTA2")~THEN REPLY ~The Malagent is dead.~ EXTERN AC#PPEL4 malagent_dead
IF~~THEN REPLY ~I have nothing to report yet.~ EXTERN AC#PPEL4 no_news

CHAIN IF ~~ THEN AC#PPEL4 no_news
~Very well. You will know best how to proceed. I shall wait for your return.~
EXIT

CHAIN IF ~~ THEN AC#PPEL4 malagent_dead
~That is good news! Though I am no friend of violence, in some cases, it is better that a wrongdoer troubles another world, rather than this one.~
== AC#PPEL4 ~You deserve a fine reward for what you have done for us, Amn, and all potential victims of that diabolical toxin. Here. I gathered as much gold as I could for you, my friend.~
DO ~GiveGoldForce(6500) AddXPObject(Player1,6200) AddXPObject(Player2,6200) AddXPObject(Player3,6200) AddXPObject(Player4,6200) AddXPObject(Player5,6200) AddXPObject(Player6,6200)~
== AC#PPEL4 ~You have done us a great service. For that, I thank you! The gates of Duskwood Dell shall always be open to you. And... if you have some more time, we could still make the situation even better.~
== AC#PPEL4 ~But—I'm sure you are tired. Rest. And stay with us as long as you'd like. If you think you can spare some more of your time on fighting against Talona's wicked plans, visit me. I'll present you my offer.~
END
IF~PartyHasItem("AC#PPPUB")~THEN REPLY ~And what about the plant you told me to bring?~ EXTERN AC#PPEL4 malagent_dead_flo
IF~!PartyHasItem("AC#PPPUB")~THEN REPLY ~Understood.~ EXTERN AC#PPEL4 malagent_dead_no_flo
IF~~THEN REPLY ~I'm half-asleep right now. We'll tak some other time. Toodles!~ DO ~SetGlobal("AC#PP_MythUnnohyr","GLOBAL",2)~ EXIT

CHAIN AC#PPEL4 malagent_dead_flo
~So you have it! Wonderful. Guard it for a another moment and—I promise to tell you what's on my mind. Just tell me when you're ready.~
DO ~SetGlobal("AC#PP_MythUnnohyr","GLOBAL",2) SetGlobal("AC#PP_ShowFlower","GLOBAL",1)~ EXIT

CHAIN AC#PPEL4 malagent_dead_no_flo
~Good. Now again: rest. And if you want to hear what's on my mind, just visit me whenever you're ready for some additional work, my friend.~
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
IF~~THEN REPLY ~Ah—give me a moment. I’ll be back shortly.~ EXIT

CHAIN AC#PPEL4 cnt.01.02
~You... you don’t have it? That is most unfortunate.~
==AC#PPEL4 ~If we are to prepare the antidote, the flower is essential. Please, continue your search. I shall remain here and wait. May Eldath guide your steps.~
EXIT

/*
CHAIN IF ~Global("AC#PP_MythUnnohyr","GLOBAL",2)~ THEN AC#PPEL4 cnt.01.00
~Ah, you're back! I may only assume, my friend, that this is because you're interested in what I have to say and—I suppose that while the main threat is eliminated, our work isn't entirely done.~
==AC#PPEL4 IF ~Global("AC#PP_ShowFlower","GLOBAL",1)~ THEN ~We discusses the flower and the last time we talked you mentioned it too. And this is what I wished to discuss.~
==AC#PPEL4 IF ~Global("AC#PP_ShowFlower","GLOBAL",0)~ THEN ~Just before you set off to Myth Unnohyr, I asked you to look for the plant our enemy used to brew the toxin.~
==AC#PPEL4 ~While no more of the poison should be created by our enemy, some of it is already there, in the world. I want to prepare the antidote and I hope you can help me.~
DO ~SetGlobal("AC#PP_MythUnnohyr","GLOBAL",3)~
==AC#PPEL4 ~To do so,, I'll need more than knoweldge. First of all, we need the flower. Do you have it?~
END
IF~PartyHasItem("AC#PPPUB")~THEN REPLY ~Yes. It is here.~ EXTERN AC#PPEL4 cnt.01.01
IF~!PartyHasItem("AC#PPPUB")~THEN REPLY ~Sorry, but no. I don't.~ EXTERN AC#PPEL4 cnt.01.02

CHAIN IF ~Global("AC#PP_MythUnnohyr","GLOBAL",3)~ THEN AC#PPEL4 cnt.01.0B
~Ah, I'm so glad you're here. Have you found the flower?~
END
IF~PartyHasItem("AC#PPPUB")~THEN REPLY ~Yes, I have. It is here.~ EXTERN AC#PPEL4 cnt.01.01
IF~!PartyHasItem("AC#PPPUB")~THEN REPLY ~Sorry, but no.~ EXTERN AC#PPEL4 cnt.01.02
IF~~THEN REPLY ~Hm? What? I mean... I'll be right back.~ EXIT

CHAIN AC#PPEL4 cnt.01.02
~You—you don't have it? That's bad. That's very bad.~
==AC#PPEL4 ~I need you to find it, if we are to create this antidote. Please, look for it. I'll wait for you here. It's important we had it.~
EXIT
*/

CHAIN AC#PPEL4 cnt.01.01
~Wonderful! Not let's see...~
== AC#PPEL4 ~It's in a good state, yes. And it's rather big, so... it should be enough, yes!~
== AC#PPEL4 ~I searched all my books when you were trying to stop our enemy and I might have found a way to create an antidote. To create it, we need the flower and we need to know the exact spot, the couldron or laboratory when it was created.~
END
IF~~THEN REPLY ~It's the spot where I fought the servant to Talona. There was a cauldron there. One with, what I presume, is an unfinished next batch of the poison.~ EXTERN  AC#PPEL4 cnt.01.03

CHAIN AC#PPEL4 cnt.01.03
~Yes, that's exactly what I hoped for. But that's not all we need. Let me share what I have found in my books.~
==AC#PPEL4 ~You see, we need a blessing of three different gods or goddesses to be engraved in this flower. One or two are not enough, the dead magic this flower was fed with is powerful. We need to mark this flower with life, symphathy and warmth.~
==AC#PPEL4 ~And I know exactly where to turn for help. You must travel to Athkatla and speak with the priest of Ilmater in the Slums. Ask him for the Blessing of Sympathy. He and I are on good terms—I believe he will support our cause without hesitation.~
=
~You should also visit the Church of Lathander in the city and request the Blessing of Warmth. I will send a white dove to carry my message. When you reach the temples, they will already be prepared to aid you.~ 
=
~As for the third part, I shall grant you the Blessing of Life myself.~
DO ~StartCutSceneMode() SmallWait(2) CreateVisualEffectObject("SPRAISEI",Player1) CreateVisualEffectObject("SPRAISEI",Player2) CreateVisualEffectObject("SPRAISEI",Player3) CreateVisualEffectObject("SPRAISEI",Player4) CreateVisualEffectObject("SPRAISEI",Player5) CreateVisualEffectObject("SPRAISEI",Player6) Wait(2) SetGlobal("AC#PP_MythUnnohyr","GLOBAL",4) SmallWait(1) EndCutSceneMode()~ EXIT

CHAIN IF ~Global("AC#PP_MythUnnohyr","GLOBAL",4) Global("AC#PP_BonusBlessing","GLOBAL",0)~ THEN AC#PPEL4 cnt.01.04
~Done. These blessings should also apply to you, as perhaps if the flower somehow resists even prayers, then maybe your hands will at least pass it to the flower.~
END
IF~OR(2) Alignment(Player1,MASK_GOOD) Alignment(Player1,MASK_GENEUTRAL) OR(3) Class(Player1,CLERIC_ALL) Class(Player1,DRUID_ALL) Class(Player1,PALADIN_ALL)~THEN REPLY ~What about me? Perhaps I should bless the flower, too? I am also a person of faith!~ EXTERN  AC#PPEL4 cnt.01.05a
IF~Alignment(Player1,MASK_EVIL) OR(3) Class(Player1,CLERIC_ALL) Class(Player1,DRUID_ALL) Class(Player1,PALADIN_ALL)~THEN REPLY ~What about me? Perhaps I should bless the flower, too? I am also a person of faith!~ EXTERN  AC#PPEL4 cnt.01.05b
IF~~THEN REPLY ~Right. I should get back to work then. I presume that once I have the blessings, I should return here, to you. Yes?~ EXTERN AC#PPEL4 cnt.01.06
IF~~THEN REPLY ~I hope you'll pay me for all the effort and time I'm supposed to invest in this, hmm?~ EXTERN AC#PPEL4 cnt.01.07

CHAIN AC#PPEL4 cnt.01.05a
~I still believe these priests should help us, I already sent some letters, they will be expecting you, but... I suppose your blessing can be helpful, too.~ 
DO ~StartCutSceneMode() SmallWait(2) CreateVisualEffectObject("SPROTECT",Player1) CreateVisualEffectObject("SPROTECT",Player2) CreateVisualEffectObject("SPROTECT",Player3) CreateVisualEffectObject("SPROTECT",Player4) CreateVisualEffectObject("SPROTECT",Player5) CreateVisualEffectObject("SPROTECT",Player6) Wait(2) SetGlobal("AC#PP_BonusBlessing","GLOBAL",1) SmallWait(1) EndCutSceneMode()~ EXIT

CHAIN AC#PPEL4 cnt.01.05b
~While I do like you, there is this dark part in you. I am sorry, but we need something else than this. But I do appreciate your offer.~
EXTERN AC#PPEL4 cnt.01.08

CHAIN IF ~Global("AC#PP_MythUnnohyr","GLOBAL",4) Global("AC#PP_BonusBlessing","GLOBAL",1)~ THEN AC#PPEL4 cnt.01.0BB
~Thank you. But remember that we will also need the blessings of the two priests I mentioned. They were heads of their churches for a while, this isn't just magic what we're doing, it's symbollic. It's faith. And hope.~
EXTERN AC#PPEL4 cnt.01.08

CHAIN AC#PPEL4 cnt.01.06
~Yes.~
EXTERN AC#PPEL4 cnt.01.08

CHAIN AC#PPEL4 cnt.01.07
~Of course. I'll prepare something for you. Perhaps not gold, but something else. Something that will be of use during your journeys.~
EXTERN AC#PPEL4 cnt.01.08

CHAIN AC#PPEL4 cnt.01.08
~Remember that I'm counting on you, my friends, and I truly believe you are right next to the plants, a second crucial part of this puzzle. One that's the key to our victory.~
==AC#PPEL4 ~Return to me when you gather the blessings.~
DO ~SetGlobal("AC#PP_MythUnnohyr","GLOBAL",5)~ EXIT

//ILMATER

EXTEND_BOTTOM ~SLILMAT~ 6
IF~PartyHasItem("AC#PPPUB") Global("AC#PP_MythUnnohyr","GLOBAL",5) Global("AC#PP_IlmaterBlessing","GLOBAL",0)~THEN REPLY ~I was sent here from the Duskwood Dell. I have this flowere here and I need a Blessing of Symphathy. I believe you may have already received a letter describing the details.~ EXTERN SLILMAT AC#IL.BLESS
END

EXTEND_BOTTOM ~SLILMAT~ 0
IF~PartyHasItem("AC#PPPUB") Global("AC#PP_MythUnnohyr","GLOBAL",5) Global("AC#PP_IlmaterBlessing","GLOBAL",0)~THEN REPLY ~I was sent here from the Duskwood Dell. I have this flowere here and I need a Blessing of Symphathy. I believe you may have already received a letter describing the details.~ EXTERN SLILMAT AC#IL.BLESS
END

CHAIN SLILMAT AC#IL.BLESS
~Ah. Yes. Hmm, I thought they would send someone of their own, but you shall receive my blessing. Ilmater, watch over those that need you the most. Weep for them and equip us with hope.~
== SLILMAT ~Take the blessing, my child, and weep for others, just like my god wept for you and your success.~
DO ~SetGlobal("AC#PP_IlmaterBlessing","GLOBAL",1) CreateVisualEffectObject("SPARMOUR",Player1) CreateVisualEffectObject("SPARMOUR",Player2) CreateVisualEffectObject("SPARMOUR",Player3) CreateVisualEffectObject("SPARMOUR",Player4) CreateVisualEffectObject("SPARMOUR",Player5) CreateVisualEffectObject("SPARMOUR",Player6)~ EXIT

//LATHANDER

EXTEND_BOTTOM ~DAWNMAS~ 0
IF~PartyHasItem("AC#PPPUB") Global("AC#PP_MythUnnohyr","GLOBAL",5) Global("AC#PP_LathanderBlessing","GLOBAL",0)~THEN REPLY ~I was sent here from the Duskwood Dell. I have this flowere here and I need a Blessing of Warmth. I believe you may have already received a letter describing the details.~ EXTERN DAWNMAS AC#DM.BLESS
END

CHAIN DAWNMAS AC#DM.BLESS
~Yes, yes. I indeed received a letter, and of course, I will give you my blessing so you could continue with your quest.~
== DAWNMAS ~Lathander, Bringer of the Dawn, grand this adventurer your blessing, and grand them warmth so they could carry them even into the coldest dens!~
DO ~SetGlobal("AC#PP_LathanderBlessing","GLOBAL",1) CreateVisualEffectObject("SPHOLYMT",Player1) CreateVisualEffectObject("SPHOLYMT",Player2) CreateVisualEffectObject("SPHOLYMT",Player3) CreateVisualEffectObject("SPHOLYMT",Player4) CreateVisualEffectObject("SPHOLYMT",Player5) CreateVisualEffectObject("SPHOLYMT",Player6)~ EXIT

//BLESSING

CHAIN IF ~Global("AC#PP_MythUnnohyr","GLOBAL",5)~ THEN AC#PPEL4 cnt.02.00
~Welcome back. Have you received the blessings already?~
END
IF~PartyHasItem("AC#PPPUB") Global("AC#PP_LathanderBlessing","GLOBAL",1) Global("AC#PP_IlmaterBlessing","GLOBAL",1)~THEN REPLY ~Yes, I have. What's next?~ EXTERN AC#PPEL4 cnt.02.02
IF~~THEN REPLY ~I'm still working on this.~ EXTERN AC#PPEL4 cnt.02.01

CHAIN AC#PPEL4 cnt.02.01
~I see. Return to me when you're done with that part. Eldath bless you, my friend!~
EXIT

CHAIN AC#PPEL4 cnt.02.02
~Wonderful!~
DO ~GiveItemCreate("AC#PPWA",Player1,1,0,0)~
==AC#PPEL4 ~We have the flower, we have the blessings. And we know where the poison was prepared. Now, we're going to use that exact place to give the shape to the toxin and prepare the antidote. But you will also need this: the singing water of Eldath.~
==AC#PPEL4 ~What you need to do is bring these to Myth Unnohyr and place the blessed flower and the singing water of Eldath inside that cauldron you mentioned. When it all mixes, the remains of the poison, its source, the blessed flower and the water, it should conjure the manifestation of the toxin and when it's defeated, some antidote should be created.~
==AC#PPEL4 ~We need toremember we are dealing with wild magic, dead magic, blessing and—it's an explosive concoction. But I think it may work—no: It has to work.~
== JaheiraJ IF ~InParty("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN ~It will. I know it.~
== CerndJ  IF ~InParty("Cernd") !StateCheck("Cernd",CD_STATE_NOTVALID)~ THEN ~A risk must be taken, if a bird is to learn how to fly. And we are such birds. We need to do whatever we can, and we'll sly above the threats.~
== RasaadJ IF ~InParty("Rasaad") !StateCheck("Rasaad",CD_STATE_NOTVALID)~ THEN ~Even though we cannot be completely sure about how the dead magic zone may affect the plan, we should indeed do our best. There are people who depend on us.~
==AC#PPEL4 ~Return to me with the antidote, and I promise you a proper reward my friend.~
DO ~SetGlobal("AC#PP_MythUnnohyr","GLOBAL",6)~ EXIT

//ANTIDOTE

CHAIN IF ~Global("AC#PP_MythUnnohyr","GLOBAL",6)~ THEN AC#PPEL4 cnt.03.00
~Have you created the antidote, my friend? Is that why you came back? To tell me the good news?~
END
IF~PartyHasItem("AC#PPANT")~THEN REPLY ~Yes. It is here. But that wasn't an easy task.~ DO ~TakePartyItem("AC#PPANT") DestroyItem("AC#PPANT")~ EXTERN AC#PPEL4 cnt.03.02
IF~~THEN REPLY ~No, not yet.~ EXTERN AC#PPEL4 cnt.03.01

CHAIN AC#PPEL4 cnt.03.01
~I see. Please, return to me once you have it. It's very important and... and we're almost there.~
EXIT

CHAIN AC#PPEL4 cnt.03.02
~Yes! Oh, joyful day! You are truly a hero! And one of the most... heroic ones!~
==AC#PPEL4 ~I thank you for everything you have done for us. For the people of Amn, and for the Duskwood Dell, of course. Just as a I promised, I have something for you. Hopefully it's going to help you during all sorts of missions and adventures.~
==AC#PPEL4 ~I will use this antidote whenever we'll hear about someone struck by a magic-resistant disease or poison. This will truly save lives.~
==AC#PPEL4 ~Whenever you'll need a place to stay and rest, Duskwell Dell will greet you with open arms, my friend.~
DO ~SetGlobal("AC#PP_MythUnnohyr","GLOBAL",7) GiveItemCreate("AC#PPRE",Player1,1,0,0) AddXPObject(Player1,4200) AddXPObject(Player2,4200) AddXPObject(Player3,4200) AddXPObject(Player4,4200) AddXPObject(Player5,4200) AddXPObject(Player6,4200)~ EXIT

//FINISHED

CHAIN IF ~Global("AC#PP_MythUnnohyr","GLOBAL",7)~ THEN AC#PPEL4 cnt.04.00
~It's good to see you my friend. As I once said, you're always welcome in Duskwood Dell.~
END
IF~~THEN REPLY ~Thank you.~ EXIT
IF~Global("AC#PPSymbolQuest","GLOBAL",1) Global("AC#PPSymbolAskNow","GLOBAL",0)~THEN REPLY ~One of your sisters has been trying to make this Eldath emblem, but she cannot succeed. She is suffering from serious numbness in her hands. Perhaps you have some emblem, or a symbol I could give her. I think she deserves it.~ DO ~SetGlobal("AC#PPSymbolAskNow","GLOBAL",1)~ EXTERN AC#PPEL4 cnt.04.01
IF~InMyArea("AC#PPMON")~THEN REPLY ~I can see our mutual friend came here to thank you for the symbol.~ EXTERN AC#PPEL4 cnt.04.02

CHAIN AC#PPEL4 cnt.04.01
~I think I know the person you are speaking of. Yes. I should have something here. You can take it and give it to her. It sounds like someone with a strong spirit and she should truly have it, the symbol.~
DO ~GiveItemCreate("AC#PPSYM",Player1,1,0,0)~ EXIT

CHAIN AC#PPEL4 cnt.04.02
~Yes. And I must say that it may be quite interesting to teach this one. I'm glad she came to me.~
EXIT

// Eldathyn high priest and novice
BEGIN ~AC#PPST4~
CHAIN IF ~True()~ THEN AC#PPST4 hello_novice
~Exalted Fallskeeper... why do we never carry weapons, even when others do? Isn’t peace worth defending?~
==AC#PPEL4 ~Peace is not a thing we carry in our hands, but in our hearts. A blade can silence a voice—but never spread stillness.~
==AC#PPST4 ~But what if someone brings violence to our grove? What if they don’t listen?~
==AC#PPEL4 ~Then we listen more. Words can reach where arrows cannot. And if they strike, we do not answer with pain, but with presence.~
==AC#PPST4 ~I don’t think I understand yet... but I will try.~
==AC#PPEL4 ~Then you already walk her path. Eldath asks for no perfection—only the courage not to halt. Go now, and let each step be as soft as falling rain.~  
==AC#PPST4 ~Thank you for your guidance, Exalted Fallskeeper. I hope that one day I will come to understand Eldath's teachings in all her glory.~
DO ~EscapeAreaDestroy(1)~ EXIT
