
// Dialogue Eldathyn priest #3; guard in Duskwood Dell

BEGIN ~AC#PPEL3~

CHAIN IF ~True()~ THEN AC#PPEL3 hello_01
~Peace of the Goddess be upon you. Strangers like you rarely come here. This place can only be found by those who already know of it. How is it that you are here, and the Goddess has granted you passage?~ 
END
IF~~THEN REPLY ~I bring word that a follower of your faith has been poisoned by an unknown assailant. I carry an arrow here, so your order’s leader might trace the source of the poison.~ EXTERN AC#PPEL3 need_go_to_highpriest

	CHAIN IF ~~ THEN AC#PPEL3 need_go_to_highpriest
	~By the Mother Guardian of Groves! So Merethan has failed in his mission? This is dire news. Quickly—bring the poison to our High Priest, Most Exalted Fallskeeper Alatoasz Berendim. You’ll find him in his chambers, in the rearmost tree by the water. But take care not to harm yourself with the poison! Alatoasz will know what must be done. May the Green Goddess grant her blessing upon this place.~
	DO ~EscapeArea()~ EXIT

// Dialogue Eldathyn highpriest #4; tree house in Duskwood Dell

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
	END
	IF~~THEN EXTERN AC#PPEL4 quest_final_bye

		CHAIN IF ~~ THEN AC#PPEL4 quest_final_bye
		~You have done us a great service. For that, I thank you! The gates of Duskwood Dell shall always be open to you. Now we can return to our daily duties—and that is as it should be. May Eldath bless you on your path ahead!~
		EXIT
	
CHAIN IF ~Global("AC#PPSpellCheckPoison","GLOBAL",3)~ THEN AC#PPEL4 hello_03
~<CHARNAME>! I’ve found the answer!~
END
IF~~THEN EXTERN AC#PPEL4 poison_myth_unnhoyr

	CHAIN IF ~~ THEN AC#PPEL4 poison_myth_unnhoyr
	~The poison must be harvested in the ancient city of Myth Unnohyr.~
	END
	IF~~THEN REPLY ~Never heard of that place.~ EXTERN AC#PPEL4 poison_myth_unnhoyr_02

		CHAIN IF ~~ THEN AC#PPEL4 poison_myth_unnhoyr_02
		~I’m not surprised. It is one of the long-lost elven cities of old Keltormir, which once encompassed the Tethir and Mir forests.~
		END
		IF~~THEN EXTERN AC#PPEL4 poison_myth_unnhoyr_03

			CHAIN IF ~~ THEN AC#PPEL4 poison_myth_unnhoyr_03
			~Myth Unnohyr was dedicated to the elven god Corellon Larethian, the Lord of Magic. A mysterious catastrophe caused the Mythal that protected the city to explode, leaving behind nothing but a dark void of dead magic.~
			END
			IF~~THEN REPLY ~And you want me to go there?~ EXTERN AC#PPEL4 dead_magic_area

				CHAIN IF ~~ THEN AC#PPEL4 dead_magic_area
				~Don’t you see? Dead magic? The plants that produce the poison must grow there—infused with the remnants of that dead magic. Our healing spells fail because the poison carries that same dead magic into the body of the victim!~
				END
				IF~~THEN REPLY ~Sounds far-fetched to me.~ EXTERN AC#PPEL4 dead_magic_area_02
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

						CHAIN IF ~~ THEN AC#PPEL4 malagent
						~A Malagent! That makes sense. That’s what the unholy priests of Talona call themselves. Do you know who Talona is?~
						END
						IF~~THEN REPLY ~Yes.~ EXTERN AC#PPEL4 talona_yes
						IF~~THEN REPLY ~No.~ EXTERN AC#PPEL4 talona_no

							CHAIN IF ~~ THEN AC#PPEL4 talona_no
							~Talona is the Mistress of Disease, the Lady of Poison. Her followers wander the world spreading suffering and decay—why not with a newly brewed poison? Her devotees are quite... inventive.~
							END
							IF~~THEN EXTERN AC#PPEL4 talona_yes

							CHAIN IF ~~ THEN AC#PPEL4 talona_yes
							~Then you now know you are dealing with a follower of the Goddess of Poisons.~
							END
							IF~~THEN REPLY ~And I’m to enter this blasted elven ruin.~ EXTERN AC#PPEL4 travel_ruin
							IF~~THEN REPLY ~...who brews his poison within a dead magic zone in Myth Unnohyr.~ EXTERN AC#PPEL4 travel_ruin

								CHAIN IF ~~ THEN AC#PPEL4 travel_ruin
								~Exactly! In Myth Unnohyr you will find both the plant and the culprit. But it will not be easy—I dare not imagine what other creatures might dwell in such a forsaken place. You’ll find the ruins of Myth Unnohyr in the southern remnants of the ancient elven forests. I’ll mark the location on your map. Good luck!~
								DO ~RevealAreaOnMap("ACPP70")
								SetGlobal("AC#PPSpellCheckPoison","GLOBAL",10)	
								SetGlobal("AC#PP_MythUnnohyr","GLOBAL",1)~ EXIT
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
			IF~~THEN REPLY ~Your risk.~ EXTERN AC#PPEL4 poison_investigate_03

				CHAIN IF ~~ THEN AC#PPEL4 poison_investigate_03
				~The taste... unfamiliar, yet somehow known...~
				END
				IF~~THEN DO ~ApplySpellRES("AC#PPPN",Myself)~ EXTERN AC#PPEL4 poison_investigate_04

					CHAIN IF ~~ THEN AC#PPEL4 poison_investigate_04
					~It’s a plant much like foxglove, though a bit more... bitter, more primal...~
					END
					IF~~THEN EXTERN AC#PPEL4 poison_investigate_05

						CHAIN IF ~~ THEN AC#PPEL4 poison_investigate_05
						~Of course! It must be the Vesper Vein—a rare elven plant! Highly toxic and revered by elves for millennia. But its poison is usually easily cured with magic—so why not this time? It makes no sense.~
						END
						IF~~THEN EXTERN AC#PPEL4 poison_investigate_06

							CHAIN IF ~~ THEN AC#PPEL4 poison_investigate_06
							~I would guess that this poison—rare as it is—must come from a place near one of the ancient elven ruins.~
							END
							IF~~THEN REPLY ~And you figured all that out by sniffing the arrow and tasting the poison?~ EXTERN AC#PPEL4 poison_investigate_sure
							IF~~THEN REPLY ~Good thing that stuff didn’t kill you too.~ EXTERN AC#PPEL4 poison_investigate_sure

							CHAIN IF ~~ THEN AC#PPEL4 poison_investigate_sure
							~We often deal with poisons here. Many gravely ill souls come to us, and it falls to us to either heal them or guide them through death. Over time, we’ve gained unfortunate familiarity with some of the foulest substances in the Realms. But never have I encountered something quite like this.~
							END
							IF~~THEN REPLY ~So what’s next?~ EXTERN AC#PPEL4 poison_investigate_further

								CHAIN IF ~~ THEN AC#PPEL4 poison_investigate_further
								~I want to focus on one of the old elven ruins scattered throughout these lands. There are many—but which one is the right one? To determine that, I will need some time.~
								END
								IF~~THEN EXTERN AC#PPEL4 poison_investigate_further_02

									CHAIN IF ~~ THEN AC#PPEL4 poison_investigate_further_02
									~Ah, and where are my manners? You’ve only just arrived, and you must be weary. Rest for a while—this will give me time to study the poison’s origin further. Please, return in two hours—or later, if you prefer. There is no rush. I shall wait for you on the lowest level of this tree. Until then, I’ll walk the woods and hope for a good idea.~
									DO ~SetGlobal("AC#PPSpellCheckPoison","GLOBAL",2)
									SetGlobalTimer("AC#PP_Investigate","GLOBAL",TWO_HOURS)
									EscapeArea()~ EXIT

CHAIN IF ~True()~ THEN AC#PPEL4 hello_01
~May the Mother Guardian of Groves grant you peace and health, stranger. I am Most Exalted Fallskeeper Alatoasz Berendim, a humble servant of Eldath. What brings you to this remote place?~ 
END
IF~~THEN REPLY ~Your priest Merethan was poisoned. I have here an arrow soaked in the toxin. He hoped you might be able to use it to trace the culprit.~ EXTERN AC#PPEL4 about_arrow

	CHAIN IF ~~ THEN AC#PPEL4 about_arrow
	~This is sad news. Merethan was a faithful follower—a Peacewalker—ever traveling to spread the word of our silent goddess throughout the Realms. It pains me that he has left this world in such a way. I know the circumstances—indeed, I was the one who tasked him with investigating the troubling cases of poisoning.~
	=	
	~Let me take a closer look at the arrow...~
	END
	IF~~THEN DO ~TakePartyItem("AC#PPARP")~ EXTERN AC#PPEL4 check_arrow	

		CHAIN IF ~~ THEN AC#PPEL4 check_arrow
		~A strange poison indeed. Merethan must have told you what makes this toxin so troubling?~
		END
		IF~~THEN REPLY ~He said it couldn’t be cured.~ EXTERN AC#PPEL4 about_poison

		CHAIN IF ~~ THEN AC#PPEL4 about_poison
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

