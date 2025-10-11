// Messenger in Elhan'S area

BEGIN AC#PPC6E

// Priest of Eldath – first contact in AR2500

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#PPC6E hello_01
~<CHARNAME>! Yes, it must be you!~
== AC#PPC6E ~I am a faithful servant of Eldath, bringing important news from Duskwood Dell.~    
END
IF ~~ THEN EXTERN AC#PPC6E seek_charname_02

CHAIN AC#PPC6E seek_charname_02
~We had been searching for you, but it was as if you had vanished from the face of Faerûn!~    
END

IF ~~ THEN REPLY ~In a manner of speaking, I suppose I did.~ EXTERN AC#PPC6E seek_charname_03
IF ~~ THEN REPLY ~You were looking for me? That usually means trouble.~ EXTERN AC#PPC6E seek_charname_03
IF ~~ THEN REPLY ~And yet, here I stand.~ EXTERN AC#PPC6E seek_charname_03


CHAIN AC#PPC6E seek_charname_03
~I travelled into the Forest of Tethir to ask the elves of Suldanessellar for aid, but they seem... preoccupied with other matters at the moment.~    
END
IF ~~ THEN REPLY ~That’s putting it mildly.~ EXTERN AC#PPC6E problems_unnohyr
IF ~~ THEN REPLY ~I’ve seen what they’re facing. No wonder they have no time for others.~ EXTERN AC#PPC6E problems_unnohyr
IF ~~ THEN REPLY ~Then you’ve heard of the chaos there. But what troubles you?~ EXTERN AC#PPC6E problems_unnohyr


CHAIN AC#PPC6E problems_unnohyr
~There are… problems in Myth Unnohyr. I cannot tell you more, but I beg you to make your way to Duskwood Dell. Most Exalted Fallskeeper Alatoasz Berendim will surely explain everything.~    
END
IF ~~ THEN REPLY ~Ah yes, how I missed that name.~ EXTERN AC#PPC6E seek_charname_bye
IF ~~ THEN REPLY ~Of course. I’ll make a visit when I can.~ EXTERN AC#PPC6E seek_charname_bye
IF ~~ THEN REPLY ~I have quite a few other problems right now.~ EXTERN AC#PPC6E another_problems

CHAIN AC#PPC6E another_problems
~You needn’t leave at once. It’s not that urgent—yet. But at least stop by the Dell and hear what the Fallskeeper has to say.~    
END
IF ~~ THEN EXTERN AC#PPC6E seek_charname_bye

CHAIN AC#PPC6E seek_charname_bye
~You remember the way to Duskwood Dell, I trust. I thank Eldath that I’ve finally found you!~    
DO ~SetGlobal("AC#PP_NewProblemsUnnohyr","GLOBAL",1)
AddJournalEntry(@12200,QUEST)
EscapeArea()~ EXIT



// ELHAN extension

EXTEND_BOTTOM ~c6elhan2~ 47
IF ~Global("AC#PP_MythUnnohyr","GLOBAL",7)~ THEN REPLY
~I aided Eldath’s faithful in Duskwood Dell against a great evil in Myth Unnohyr. Perhaps they will aid us now, if they learn we face vampires threatening the elves of Tethir.~ 
EXTERN c6elhan2 elhan_myth_unnohyr 
END

CHAIN c6elhan2 elhan_myth_unnohyr
~That was you? I have already heard that someone freed our ancient ancestral site from great corruption. In fact, a priest from Duskwood Dell told me of it only recently.~  
END
IF ~~ THEN EXTERN c6elhan2 AC#PP.ELHAN

CHAIN c6elhan2 AC#PP.ELHAN
~It seems, however, that the Eldathyn have troubles of their own—they wished to ask for our help in cleansing something within Myth Unnohyr. Needless to say, we have no time for that now. The priest should still be somewhere nearby; perhaps it would do no harm to speak with him.~  
  
END
IF~Global("ElhanWater","LOCALS",0)~THEN REPLY ~Can you help with special supplies? Holy water and stakes come to mind.~ DO ~AddJournalEntry(57714,INFO) EraseJournalEntry(97341) EraseJournalEntry(97340) AddJournalEntry(97342,QUEST) SetGlobal("ElhanWater","LOCALS",1) SetGlobal("AskedElhanForHolyWater","GLOBAL",1)~ EXTERN c6elhan2 48
IF~Global("ElhanWater","LOCALS",0)~THEN REPLY ~I will do what I can, though Bodhi is very strong. Have you holy water and stakes?~ DO ~AddJournalEntry(57714,INFO) EraseJournalEntry(97341) EraseJournalEntry(97340) AddJournalEntry(97342,QUEST) SetGlobal("ElhanWater","LOCALS",1) SetGlobal("ToldElhanAboutBodhi","GLOBAL",1) SetGlobal("AskedElhanForHolyWater","GLOBAL",1)~ EXTERN c6elhan2 48
IF~Global("ElhanShame","LOCALS",0)~THEN REPLY ~I will get by without your help, then.~ DO ~SetGlobal("ElhanWater","LOCALS",1)~ EXTERN c6elhan2 51
IF~Global("ElhanWater","LOCALS",0)~THEN REPLY ~You mentioned some shame before. What shame has Irenicus caused you?~ DO ~SetGlobal("ElhanShame","LOCALS",1)~ EXTERN c6elhan2 50

//DUSKWOOD DELL CH6 -- FIRST TALK

BEGIN AC#PPMI
CHAIN IF ~Global("AC#PP_MythUnnohyr","GLOBAL",8)~ THEN AC#PPEL4 C6.QUEST.01.00
~<CHARNAME>! You arrive at a crucial moment. Trouble stirs, and you are entwined in it—whether by choice or by fate.~    
== AC#PPEL4 ~Allow me to present Mismal Al’Visalle, once a ranger of Gwaeron’s Slumber, now serving among the Mielikkians of Amn.~  
== AC#PPMI ~A gracious introduction, but we are not gathered here to trade titles, alas. I wish it were so. Yet this is no simple matter.~  
END
IF ~~ THEN REPLY ~You sound troubled.~ EXTERN AC#PPMI C6.QUEST.01.01
IF ~~ THEN REPLY ~Simple matters are rarely laid at my feet either.~ EXTERN AC#PPMI C6.QUEST.01.01

CHAIN AC#PPMI C6.QUEST.01.01
~Aye, I am troubled by this matter, and not without cause.~  
END
IF ~~ THEN REPLY ~Then tell me more.~ EXTERN AC#PPMI C6.QUEST.01.03
IF ~~ THEN REPLY ~Go on. What is this about?~ EXTERN AC#PPMI C6.QUEST.01.03
IF ~~ THEN REPLY ~We all must bear our share of burdens.~ EXTERN AC#PPMI C6.QUEST.01.03

CHAIN AC#PPMI C6.QUEST.01.03
~I will not cloak this in fair speech. You know Myth Unnohyr, you have walked its ruins. You know how strange it is, caught between life and death. But since your last battle there, the place has worsened.~  
END
IF ~~ THEN REPLY ~Worsened? How so? The Talonite is dead.~ EXTERN AC#PPMI C6.QUEST.01.04a
IF ~~ THEN REPLY ~That happens often enough. Wherever I pass, the place seems worse off after.~ EXTERN AC#PPMI C6.QUEST.01.04a
IF ~~ THEN REPLY ~That is no longer my concern.~ EXTERN AC#PPMI C6.QUEST.01.04a
IF ~~ THEN REPLY ~I had hoped that ordeal was finished. Why, in all the gods’ names, does everyone always want something else from me?~ EXTERN AC#PPMI C6.QUEST.01.04a

CHAIN AC#PPMI C6.QUEST.01.04a
~The events at Myth Unnohyr roused something ancient.~  
== AC#PPMI ~It feels as though the land itself is being consumed—trees, ponds, every quiet glade, all drawn into its hunger. Strange beings, remnants of the elven kin, now roam that place. From what I have gathered, the power reeks of elven undeath.~  
END
IF ~Global("BodhiDead","GLOBAL",0)~ THEN REPLY ~Truth be told, I need help with another monster: a vampire named Bodhi. She and her brother, Irenicus, must be stopped.~ EXTERN AC#PPMI bodhi_irenicus_mention
IF ~Global("BodhiDead","GLOBAL",1)~ THEN REPLY ~I have already slain one such monster: the vampire Bodhi. Her brother, Irenicus, shall follow.~ EXTERN AC#PPMI bodhi_irenicus_mention
IF ~~ THEN REPLY ~What kind of undeath are we speaking of, exactly?~ EXTERN AC#PPMI about_wyrd
IF ~~ THEN REPLY ~Whatever it is, it should stay there.~ EXTERN AC#PPMI about_wyrd

CHAIN AC#PPMI bodhi_irenicus_mention
~Bodhi? Irenicus? Aye, I know those names. I have walked in Suldanessellar and spoken with Elhan. And now that you name them—I suspect you know him as well. Perhaps we may aid each other. We can give you something that will help against this creature.~  
END
IF ~~ THEN EXTERN AC#PPMI about_wyrd

CHAIN AC#PPMI about_wyrd
~We suspect a mighty Wyrd, a spirit that seizes the husks of dead elves, has possessed the corpse of Commander Elv-Esster Aened, once leader of Myth Unnohyr’s guard. She was interred within a sealed sarcophagus. But someone removed the wardstone, and the Wyrd slipped within to claim her body.~ 
END
IF ~Global("AC#PP_ZombieWyrdDead","GLOBAL",0)
Global("AC#PP_RemovedWardstone","GLOBAL",1)~ THEN REPLY ~That may well have been me.~ EXTERN AC#PPMI wyrd_player_guilty
IF ~Global("AC#PP_ZombieWyrdDead","GLOBAL",0)~ THEN REPLY ~How could such a thing happen?~ EXTERN AC#PPEL4 wyrd_guilt_not_important
IF ~Global("AC#PP_ZombieWyrdDead","GLOBAL",1)~ THEN REPLY ~I knew this was a trap! It certainly wasn’t me.~ EXTERN AC#PPEL4 wyrd_eldathyn_guilty
IF ~Global("AC#PP_ZombieWyrdDead","GLOBAL",1)~ THEN REPLY ~How could something so foolish have happened?~ EXTERN AC#PPEL4 wyrd_eldathyn_guilty

	CHAIN AC#PPMI wyrd_player_guilty
	~You aided this creature? How so?~ 
	END
	IF ~~ THEN REPLY ~I removed the wardstone to continue my search.~ EXTERN AC#PPEL4 wyrd_guilt_not_important
	IF ~~ THEN REPLY ~Perhaps I was mistaken after all.~ EXTERN AC#PPEL4 wyrd_guilt_not_important
	
	CHAIN AC#PPEL4 wyrd_eldathyn_guilty
	~One of my priests set out for Myth Unnohyr after your success. It seems he wished to help a desperate zombie find final rest with his beloved—and in doing so, removed the seal. But that no longer matters. What matters now is containing this creature without delay!~ 
	END
	IF ~~ THEN EXTERN AC#PPMI wyrd_cont
	
	CHAIN AC#PPEL4 wyrd_guilt_not_important
	~That no longer matters. What matters now is containing this creature.~ 
	END
	IF ~~ THEN EXTERN AC#PPMI wyrd_cont


CHAIN AC#PPMI wyrd_cont 
~This creature feeds on the rotting magic of this place to raise further undead. It will not be long before these beings spill into the surrounding lands. We must put an end to that threat by killing the creature.~  
END
IF ~~ THEN REPLY ~By "we" I assume you mean me?~ EXTERN AC#PPMI C6.QUEST.01.04c
IF ~~ THEN REPLY ~I will gladly help. Perhaps the trouble at Myth Unnohyr grew worse because of me.~ EXTERN AC#PPMI C6.QUEST.01.04c
IF ~~ THEN REPLY ~I do not see what this has to do with me—but very well, I will try to help.~ EXTERN AC#PPMI C6.QUEST.01.04c
IF ~~ THEN REPLY ~Myth Unnohyr? Not ten rothé could drag me back there.~ EXTERN AC#PPMI C6.QUEST.01.04c


CHAIN AC#PPMI C6.QUEST.01.04c
~You have fought similar foes before. Undead, I have heard—under their mistress Bodhi. You may face them again. And Duskwood Dell holds a weapon that could aid against such foes.~   
== AC#PPEL4 ~You mean the Memory of the Myths, that fabled blade, Mismal?~  
== AC#PPMI ~The very same. It has rested here long enough. The time has come to set it against the foes of life. Give it to <CHARNAME>.~   
== AC#PPEL4 ~No. Evil cannot be undone by answering it with further deeds of blood.~  
== AC#PPMI ~The blade I propose was forged to strike the undead. Its spectral edge cannot touch the living, but it shall wound all unliving, such as a Wyrd. It is a blessing against the undead, not a curse upon the living. Let <CHARNAME> take up the weapon that was once laid down in the grotto.~  
== AC#PPEL4 ~What was laid to rest in that grotto must never again be turned to bring death. Such is Eldath’s charge.~  
== AC#PPMI ~The creatures that stand before <CHARNAME> are already dead. They bring only further death. And you know the blade cannot harm the living.~  
== AC#PPEL4 ~No. Eldath would not approve of this.~  
== AC#PPMI ~*Sigh*. <CHARNAME>, perhaps you can persuade Alatoasz to entrust you with the blade? It would be of great use to you—not only on your return to Myth Unnohyr.~  
END
IF ~~ THEN REPLY ~If you would guard life, then give me the means to end what threatens it. This weapon may prevent more deaths.~ EXTERN AC#PPEL4 convince_memory
IF ~~ THEN REPLY ~If the sword must rest in worthy hands, then let it be mine. I will not falter where others would.~ EXTERN AC#PPEL4 convince_memory
IF ~~ THEN REPLY ~If it eases your heart, I swear to return the blade once the Wyrd is undone. Lend it to me only for this task.~ EXTERN AC#PPEL4 convince_memory_return
IF ~~ THEN REPLY ~Why waste such a treasure rotting in your grotto? Hand it over—what I do with it is none of your concern.~ EXTERN AC#PPEL4 deny_memory
IF ~~ THEN REPLY ~The sword belongs in the hands of one strong enough to wield it, not locked away by cowards.~ EXTERN AC#PPEL4 deny_memory
IF ~~ THEN REPLY ~Keep your blade. I trust in my own weapons.~ EXTERN AC#PPMI cont_no_blade

CHAIN AC#PPEL4 convince_memory  
~Your reasoning is sound; you speak with reverence for Eldath’s teaching. If this weapon can preserve life without endangering it, then I cannot deny you. May your hand wield the blade only against those already lost. Take it, and may peace guide each strike. Remember always the charge you carry.~       
== AC#PPMI ~With this weapon, it will be easier for you to defeat the Wyrd.~  
== AC#PPEL4 ~You may collect the blade, the Memory of the Myths, from our handmaiden in Eldath’s Grotto.~   
== AC#PPMI ~When you are ready, go with Alatoasz’s blessing to the grotto where heroes once surrendered their weapons—and claim it.~    
END
IF ~~ THEN DO ~SetGlobal("AC#PP_GiveBlade","GLOBAL",1)~ EXTERN AC#PPMI wyrd_wait_for_start

	CHAIN AC#PPEL4 deny_memory  
	~Such words reek of cruelty. You would turn a gift of peace into a tool of slaughter? I will not be party to such evil.~ 
	END
	IF ~~ THEN EXTERN AC#PPMI cont_no_blade	
	
	
	CHAIN AC#PPMI cont_no_blade
	~So be it. Even without the blade, the time has come to put an end to the Wyrd.~  
	END
	IF ~~ THEN EXTERN AC#PPMI wyrd_wait_for_start
	
	CHAIN AC#PPEL4 convince_memory_return
	~If you give me your solemn word, then so be it. Take the blade, and when the Wyrd is no more, return it here, where it shall rest in peace once more.~  
	== AC#PPMI ~With this weapon, it will be easier for you to defeat the Wyrd.~  
	== AC#PPEL4 ~You may collect the blade from our handmaiden in Eldath’s Grotto.~  
	== AC#PPMI ~When you are ready, go with Alatoasz’s blessing to the grotto where heroes once surrendered their weapons—and claim it.~    
	END
	IF ~~ THEN DO ~SetGlobal("AC#PP_GiveBlade","GLOBAL",1) SetGlobal("AC#PP_ReturnBlade","GLOBAL",1)~ EXTERN AC#PPMI wyrd_wait_for_start

CHAIN AC#PPMI wyrd_wait_for_start
~Myth Unnohyr now lies sealed by a barrier. I can guide you through the thickets to another entrance. Let me know when you are ready.~
END  
IF ~~ THEN REPLY ~Wyrd name, wyrd plan, wyrd ending.~ EXTERN AC#PPMI wyrd_wait_for_start_bye
IF ~~ THEN REPLY ~We have a deal.~ EXTERN AC#PPMI wyrd_wait_for_start_bye
IF ~~ THEN REPLY ~I may need to think about this.~ EXTERN AC#PPMI wyrd_wait_for_start_bye
IF ~~ THEN REPLY ~I'm not interested. Sorry. There are other urgent matters that cannot wait, so I must leave.~ EXTERN AC#PPMI C6.QUEST.01.07

CHAIN AC#PPMI wyrd_wait_for_start_bye
~We shall wait for you here.~  
DO ~SetGlobal("AC#PP_MythUnnohyr","GLOBAL",9)
AddJournalEntry(@12202,QUEST)~ EXIT

CHAIN AC#PPMI C6.QUEST.01.07
~If you change your mind, come to me and let me know. We truly need your aid.~  
DO ~SetGlobal("AC#PP_MythUnnohyr","GLOBAL",9)
AddJournalEntry(@12202,QUEST)~ EXIT


//DUSKWOOD DELL CH6 -- 2ND TALK (CLERIC)

CHAIN IF ~Global("AC#PP_MythUnnohyr","GLOBAL",9)~ THEN AC#PPEL4 c6.2nd.c.00
~I know it may seem strange for someone like you that I am not very optimistic about any of this, but I've seen enough suffering. I will do what I must, but I won't rise my hand. I hope you understand.~
END
IF~~THEN REPLY ~I do.~ EXTERN AC#PPEL4 c6.2nd.c.00_bye
IF~~THEN REPLY ~I will never understand how you can allow such battles happen while you're here. Goodbye.~ EXTERN AC#PPEL4 c6.2nd.c.00_bye

CHAIN AC#PPEL4 c6.2nd.c.00_bye
~Farewell, <CHARNAME>.~
EXIT


//HIGH RANGER

CHAIN IF ~Global("AC#PP_MythUnnohyr","GLOBAL",9)~ THEN AC#PPMI C6.QUEST.02.00
~Are you prepared to face the Wyrd?~
END 
IF ~Global("AC#PP_GiveBlade","GLOBAL",1)~ EXTERN AC#PPMI depart_with_sword
IF ~Global("AC#PP_GiveBlade","GLOBAL",0)~ EXTERN AC#PPMI depart_without_sword

CHAIN IF ~~ THEN AC#PPMI depart_with_sword
~If you have taken up the sword entrusted to you by the High Priest, then I can send you into Myth Unnohyr.~  
END
IF ~~ THEN REPLY ~I am ready.~ EXTERN AC#PPMI C6.QUEST.02.01
IF ~~ THEN REPLY ~Not yet. There is something I must attend to first.~ EXTERN AC#PPMI C6.QUEST.02.01_bye

CHAIN IF ~~ THEN AC#PPMI depart_without_sword
~I shall send you into Myth Unnohyr if you are ready.~  
END
IF ~~ THEN REPLY ~I am ready.~ EXTERN AC#PPMI C6.QUEST.02.01
IF ~~ THEN REPLY ~Not yet. There is something I must attend to first.~ EXTERN AC#PPMI C6.QUEST.02.01_bye 

CHAIN AC#PPMI C6.QUEST.02.01_bye
~I will wait for you here.~
EXIT

CHAIN AC#PPMI C6.QUEST.02.01
~Good. Follow me.~
DO ~StartCutScene("AC#PP6CA")~ EXIT

// High Ranger in Myth Unnohyr
BEGIN AC#PPMI6
CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#PPMI6 hello_01
~We're in Myth Unnohyr again! The path behind us is sealed by a wall of tangled growth. Our only escape lies ahead, through the heart of the shattered city.~
= ~Something unsettling stirs in the north. To reach it, we must pass through the sanctuary once claimed by the priest of Talona.~
= ~We’ll split up. I’ll scout ahead and survey the area. Let’s meet on the other side of the tower. Take care of yourselves!~
DO ~AddJournalEntry(@12207,QUEST)
EscapeArea()~ EXIT


// Wyrd in banshee form
BEGIN AC#PPEEA
BEGIN AC#PPMI7
BEGIN AC#PPWY7

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#PPEEA hello_0
~I am Elv-Esster Aened. By death and duty, I claim this place. Turn back, for thou art no longer welcome here.~ //– or what remains. Another fool steps forth to join my army of the dead!~
== AC#PPMI7 ~You are not Elv-Esster. She died with honor – you wear her face like a mask!~
== AC#PPEEA ~I am more than Elv-Esster – I am what was born of her sacrifice. Her scream echoes within me.~
== AC#PPMI7 ~No. You are the echo of failure. You feed on sorrow and broken vows. I will see you silenced.~
== AC#PPEEA ~Thou shalt behold this world no longer. The forest hath spoken thy end.~
== AC#PPMI7 ~Wha—?~
== AC#PPEEA ~Silence, fool. She hears only me now!~
DO ~SetGlobal("AC#PP_Ch6RangerDead","GLOBAL",1)
StartCutScene("AC#PP6CR")
~ EXIT

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#PPWY7 hello_0
~Another fool come to join my army of the dead! But who are you?~
== AC#PPWY7 IF ~Global("AC#PP_RemovedWardstone","GLOBAL",1)
Global("AC#PP_ZombieWyrdDead","GLOBAL",0)~ THEN ~Oh, I remember you! You were so kind to remove the wardstone for me.~
== AC#PPWY7 IF ~Global("AC#PP_RemovedWardstone","GLOBAL",0)
Global("AC#PP_ZombieWyrdDead","GLOBAL",1)~ THEN ~Oh, I remember you! You struck me down in that miserable zombie form!~
== AC#PPWY7 ~But that no longer matters. You survived the scream of the fool Elv-Esster... but my servants will tear you apart!~
DO ~SetGlobal("AC#PP_Ch6RangerDead","GLOBAL",2)
AddJournalEntry(@12208,QUEST)
CreateVisualEffectObject("SPFLESHS",Myself) Wait(1) DestroySelf()~ EXIT


BEGIN AC#PPWYR

//1ST FIGHT

CHAIN IF ~Global("AC#PPChapter6Quest","GLOBAL",2)~ THEN AC#PPWYR 1.00
~You are still meddling with my minions, in my stronghold!~
END
IF~~THEN REPLY ~Your stronghold? You are just making it more dangerous. More... dead.~ EXTERN AC#PPWYR 1.01
IF~~THEN REPLY ~You must be the one I'm looking for. You took over the body of the elven maiden that did all she could to defend this place.~ EXTERN AC#PPWYR 1.01
IF~~THEN REPLY ~Well, I heard there is some new monster trying to turn this place into its base, so I came. I wouldn't want to miss all the fun.~ EXTERN AC#PPWYR 1.01

CHAIN AC#PPWYR 1.01
~Just look at you. You think you can match my power?~
==AC#PPWYR ~Believe me or not, but I am an ancient being. I saw the world crumble. I saw it being rebuilt. I've seen all that there is, the rot, the destruction, death, power, fear... and life. And I came, to be part of this.~
==AC#PPWYR ~This elf—oh, how she loved this place. And that's why I chose it. So we—me and her—could see this place together. So we could take all the dead parts of it, and build a new enclave. Wild. Dead. And yet... alive.~
==AC#PPWYR ~And I know you've been here before. Even then I was already humming my silent song! Lured the poisonous. Lured the wild. Lured the rotten roots. All these things weave so well with the wicked energied engraved in Myth Unnohyr's stones and walls.~
END
IF~~THEN REPLY ~So you knew about the Talonite that made his base here? And you lured the monsters that came here?~ EXTERN AC#PPWYR 1.02
IF~~THEN REPLY ~It looks like some's been one busy wyrd!~ EXTERN AC#PPWYR 1.03

CHAIN AC#PPWYR 1.02
~Partially. All these things were here. I just hummed my song.~
EXTERN AC#PPWYR 1.03

CHAIN AC#PPWYR 1.03
~You may think that what I am doing here is... evil. Oh, you living things love that word. You want to call thing evil. Wrong. Bad. But I am none of these things. I am ancient. I am above all of this.~
==AC#PPWYR ~However, some could say that I am hungry. Just as hungry as Myth Unnohyr and the earth below it! It's already swallowed part of this place before. This time, however, we will feed on dreams, and hopes, and life and... those that dared to came. And it looks like you are on that list.~
END
IF~~THEN REPLY ~You won't win this.~ EXTERN AC#PPWYR 1.04
IF~~THEN REPLY ~I came armed. You're not going to defeat me, monsters. I shall be your doom.~ EXTERN AC#PPWYR 1.04
IF~~THEN REPLY ~I suppose it was a mistake to come here. Let me leave. I'm not going to fight you. I changed my mind.~ EXTERN AC#PPWYR 1.05

CHAIN AC#PPWYR 1.04
~Do not make promises that you are unable to hold.~
EXTERN AC#PPWYR 1.06

CHAIN AC#PPWYR 1.05
~No. It's too late for you. You will be consumed by us. By this place. Your bones will become part of it.~
EXTERN AC#PPWYR 1.06

CHAIN AC#PPWYR 1.06
~Let's test your weapons and your will!~
DO ~SetGlobal("AC#PPChapter6Quest","GLOBAL",3) 
Enemy()~ EXIT

//2ND TALK - HURT 

CHAIN IF ~Global("AC#PPChapter6Quest","GLOBAL",4)~ THEN AC#PPWYR 2.00
~You are putting a lot of effort in all of this. It's almost impressive. But this place is mine, and I shall leave just as long as the half-dead and half-wild nature of this place.~
==AC#PPWYR ~My beautiful symbiotes link me to this place. You cannot defeat me, but—I encourage you to try. I want to see you tired. I want to see you lose all hope.~
END
IF~~THEN REPLY ~Symbiotes?~ EXTERN AC#PPWYR 2.01
IF~~THEN REPLY ~I will find some way to destroy you!~ EXTERN AC#PPWYR 2.02

CHAIN AC#PPWYR 2.01
~Well, everyone has their ways to control the flow of power. And they are mine. But that knowledge will give you nothing. I am too powerful for you, with or without them!~
EXTERN AC#PPWYR 2.03

CHAIN AC#PPWYR 2.02
~You are clearly a dreamer, haha!~
EXTERN AC#PPWYR 2.03

CHAIN AC#PPWYR 2.03
~I shall watch how you struggle. Remember that. Go. Do you best. And let me enjoy the spectacle, little one.~
DO ~SetGlobal("AC#PPChapter6Quest","GLOBAL",5) 
AddJournalEntry(@12209,QUEST)
StartCutSceneMode() 
Wait(1) 
ScreenShake([20.45],15) 
Wait(2) 
EndCutSceneMode() 
DestroySelf()~ EXIT

//HELPER 

BEGIN AC#PPHEL

CHAIN IF ~Global("AC#PPChapter6Quest","GLOBAL",6)~ THEN AC#PPHEL HELPER.1.00
~You have destroyed the symbiotes!~
== AC#PPHEL ~That abomination—the one that defiled the body of our beloved commander—wants you to believe none of this matters, that slaying its gnawing mouths means nothing... But it does!~
== AC#PPHEL ~Seek me beneath the sacred temple of Mythrien... there I shall aid you. I know how to end the nemesis of our city once more. We did it once—we shall do it again. Come, and I will tell you more when you find me.~
DO ~SetGlobal("AC#PPChapter6Quest","GLOBAL",7)
AddJournalEntry(@12211,QUEST)
 CreateVisualEffectObject("SPFLESHS",Myself) Wait(1) DestroySelf()~ EXIT


//HELPER 2

CHAIN IF ~Global("AC#PPChapter6Quest","GLOBAL",8)~ THEN AC#PPHEL HELPER.2.00
~You have come... I am... glad.~
END
IF~~THEN REPLY ~Who are you?~ EXTERN AC#PPHEL HELPER.2.02
IF~~THEN REPLY ~Truth be told, I had little choice.~ EXTERN AC#PPHEL HELPER.2.01

CHAIN AC#PPHEL HELPER.2.01
~Perhaps so... yet even so, there is a way to set this right. All of it.~
EXTERN AC#PPHEL HELPER.2.02

CHAIN AC#PPHEL HELPER.2.02
~I am Vaxh Aened. Commander Elv-Esster Aened was my wife... That abomination you face has clad itself in her very bones, defiling all that remained of her.~
== AC#PPHEL ~We must end this wyrd— for her, for Myth Unnohyr, and for the world of the living you still walk in.~
END
IF~~THEN REPLY ~You said you know how to stop that creature.~ EXTERN AC#PPHEL HELPER.2.03
IF~~THEN REPLY ~Yes, yes... I know it must be stopped. That’s why I’m here! Tell me something I *don’t* know.~ EXTERN AC#PPHEL HELPER.2.03

CHAIN AC#PPHEL HELPER.2.03
~Such a creature does not gain its strength by chance. This wyrd is ancient, born of soil tainted by both dead and wild magic. But what is broken can be mended. Even magic. Even here.~
END
IF~~THEN REPLY ~You believe this place can be restored?~ EXTERN AC#PPHEL HELPER.2.04
IF~~THEN REPLY ~What nonsense is this?~ EXTERN AC#PPHEL HELPER.2.05


CHAIN AC#PPHEL HELPER.2.04
~Not *what*, but... who.~
EXTERN AC#PPHEL HELPER.2.06

CHAIN AC#PPHEL HELPER.2.05
~It's not... I know who we can ask for help.~
EXTERN AC#PPHEL HELPER.2.06

CHAIN AC#PPHEL HELPER.2.06
~The fall of this place remains a mystery... even to us. Few truly know what befell Myth Unnohyr. It was like a disaster both natural and arcane, as if the very fabric of our world had shattered.~
== AC#PPHEL ~Our stronghold had been a sanctuary—where we studied art, magic, and nature, striving to protect all we held most dear. But then came the attack... so long ago I cannot recall by whom. Only the memory of the blast endures—something was torn apart.~
== AC#PPHEL ~And then... a greater one still. Our Mythal. The most sacred of all magics, woven by the blessing of Mythrien Sarath. When it broke, there was only pain... fear... and a terror that still lingers. I feel it even now... the dread, unending!~
END
IF~~THEN REPLY ~It's in the past. I'm here. Please, tell me what happened next.~ EXTERN AC#PPHEL HELPER.2.07
IF~~THEN REPLY ~Stop shouting! Someone might hear us! There are red spirits all around this place!~ EXTERN AC#PPHEL HELPER.2.07


CHAIN AC#PPHEL HELPER.2.07
~Forgive me. To me it still feels so real...~
== AC#PPHEL ~We must call upon Mythrien—find the Green Rose of Mythrien! The rose yet endures... I can feel it. Most overlook it, but even in this darkness, its blossoms remain.~
== AC#PPHEL ~Seek the rose and carry it to the temple, into the very heart of our city. Lay it at Mythrien’s feet... and he will answer. I know he will.~
== AC#PPHEL ~Ask for his aid. Banish the wyrd. Heal this place. And let peace return within these walls...~
END
IF~~THEN REPLY ~I'll do my best.~ EXTERN AC#PPHEL HELPER.2.08
IF~~THEN REPLY ~It sounds difficult...~ EXTERN AC#PPHEL HELPER.2.08


CHAIN AC#PPHEL HELPER.2.08
~My sight reaches deeper than flesh... I know there is greatness within you. Yours is not the road of death, but the path of life.~
== AC#PPHEL ~I, however... I am bound to to silence and to endings. May Mythrien’s light guide your steps where mine can no longer follow.~
== AC#PPHEL ~Now I sink back into the soil that claimed me... into the darkness where I fell...~
DO ~SetGlobal("AC#PPChapter6Quest","GLOBAL",9)
AddJournalEntry(@12212,QUEST)
 CreateVisualEffect("AC#PPBUR",[2230.800]) DestroySelf()~ EXIT



//MYTHRIEN SUMMONED

BEGIN AC#PPMYT

CHAIN IF ~Global("AC#PPChapter6Quest","GLOBAL",14)~ THEN AC#PPMYT 01.00
~^0xFF8FAD5DYour summons echoes through veils long closed... and I have come. But what shadow clings here? ^-~
==AC#PPMYT IF ~Race(Player1,ELF)~ THEN ~^0xFF8FAD5DA child of my people calls me to broken Unnohyr. Ages have passed since such voices reached me. ^-~
==AC#PPMYT IF ~!Race(Player1,ELF)~ THEN ~^0xFF8FAD5DA bold <PRO_RACE>, daring to touch the frayed skein of a fallen Mythal. ^-~
==AC#PPMYT ~^0xFF8FAD5DThese stones once thrummed with glory. Now they writhe with mockery—wards unbound, oaths sundered. ^-~
END
IF~~THEN REPLY ~I called you for a purpose.~ EXTERN AC#PPMYT 01.02
IF~~THEN REPLY ~We need your strength, Mythrien.~ EXTERN AC#PPMYT 01.02
IF~~THEN REPLY ~You dwell on ruin, yet spirits still cling to you. Do you not see?~ EXTERN AC#PPMYT 01.01

CHAIN AC#PPMYT 01.01
~^0xFF8FAD5DTo chastise the Seldarine is folly… yet your words hold more than rebuke. Speak then. ^-~
EXTERN AC#PPMYT 01.02

CHAIN AC#PPMYT 01.02
~^0xFF8FAD5DAh. The Rose… not by chance. Who guided your hand? For what end? ^-~
END
IF~~THEN REPLY ~This city’s Mythal is shattered. A wyrd has seized your champion’s body. We must end it, and give these souls peace.~ EXTERN AC#PPMYT myth_unnohyr_not_forgotten
IF~~THEN REPLY ~Elv-Esster Aened, your faithful, is defiled. The wyrd twists spirit and magic alike. We cannot prevail without you.~ EXTERN AC#PPMYT 01.03
IF~~THEN REPLY ~I want to leave this place as soon as possible. For that, I need your help.~ EXTERN AC#PPMYT myth_unnohyr_not_forgotten

CHAIN AC#PPMYT 01.03
~^0xFF8FAD5DElv-Esster Aened… yes. I recall her vow. ^-~
END
IF~~THEN EXTERN AC#PPMYT myth_unnohyr_not_forgotten


CHAIN AC#PPMYT myth_unnohyr_not_forgotten 
~^0xFF8FAD5DI thought Unnohyr forgotten, its Weave dissolved. Yet the Rose still breathes, and rites yet whispered… perhaps not wholly forsaken. ^-~
==AC#PPMYT ~^0xFF8FAD5DA wyrd, swelling on broken currents… strange, for such a thing is weak without the wound of a Mythal to feed it. Before I act, tell me: Is this ruin still worth salvation? ^-~
END
IF~~THEN REPLY ~Yes. It must be.~ EXTERN AC#PPMYT 01.04
IF~Race(Player1,ELF)~THEN REPLY ~Yes. It is our home, Mythrien.~ EXTERN AC#PPMYT 01.04
IF~~THEN REPLY ~No. Ruins only. But the wyrd must fall.~ EXTERN AC#PPMYT 01.05

CHAIN AC#PPMYT 01.04
~^0xFF8FAD5DSo be it. ^-~
EXTERN AC#PPMYT 01.06

CHAIN AC#PPMYT 01.05
~^0xFF8FAD5DYet even in dismissal, I hear Eldath's and Khalreshaar’s breath among these woods. Not all seems lost. ^-~
EXTERN AC#PPMYT 01.06

CHAIN AC#PPMYT 01.06
~^0xFF8FAD5DKnow this: I cannot descend with sword in hand. My essence is too frayed, my avatar bound. ^-~
==AC#PPMYT ~^0xFF8FAD5DYours must be the struggle. Yet I shall unbind the flow that fattens the wyrd—no longer shall this broken Mythal lend it strength. ^-~
==AC#PPMYT ~^0xFF8FAD5DThe Weave here will remain wild or dead to gentle touch, perilous to all… but no more shall the corruption swell against you. ^-~
DO ~SetGlobal("AC#PPChapter6Quest","GLOBAL",15) StartCutScene("AC#PP6C4")~ EXIT


//Mythal fixed against wyrd
CHAIN IF ~Global("AC#PPChapter6Quest","GLOBAL",16)~ THEN AC#PPMYT 02.00
~^0xFF8FAD5DThe price is paid… may it not be in vain. ^-~
END
IF~~THEN REPLY ~What happened?~ EXTERN AC#PPMYT 02.01
IF~~THEN REPLY ~Have you—~ EXTERN AC#PPMYT 02.01

CHAIN AC#PPMYT 02.01
~^0xFF8FAD5DI have not mended this Mythal. Its wounds run deeper than my hands may reach. ^-~
==AC#PPMYT ~^0xFF8FAD5DBut I poured a fragment of my essence into its breach, and the wyrd shall drink here no longer. The broken weave will still twist, will still fall dead at times... yet its corruption shall not rise to feed your foe. ^-~
END
IF~~THEN REPLY ~Hah! I’d love to see the wyrd’s face—if it had one.~ EXTERN AC#PPMYT 02.02
IF~~THEN REPLY ~Will that be enough?~ EXTERN AC#PPMYT 02.02
IF~~THEN REPLY ~So… you only weakened it?~ EXTERN AC#PPMYT 02.03

CHAIN AC#PPMYT 02.02
~^0xFF8FAD5DIt is all that can be given. It must suffice. ^-~
EXTERN AC#PPMYT 02.04

CHAIN AC#PPMYT 02.03
~^0xFF8FAD5DNo god should unmake the labors of mortals. I did not heal—only stilled the excess. The rest lies in your hands, as it ever must. ^-~
EXTERN AC#PPMYT 02.04

CHAIN AC#PPMYT 02.04
~^0xFF8FAD5DGo now. Find the creature. End its theft. Return to me when justice is wrought. ^-~
DO ~SetGlobal("AC#PPChapter6Quest","GLOBAL",17) 
SetGlobal("AC#PPFixMagic","GLOBAL",1)
AddJournalEntry(@12214,QUEST)~ EXIT

// Waiting for the defeat of the wyrd
CHAIN IF ~GlobalGT("AC#PPChapter6Quest","GLOBAL",16)
GlobalLT("AC#PPChapter6Quest","GLOBAL",23)~ THEN AC#PPMYT hello_all_fixed
~^0xFF8FAD5DHave you brought the wyrd to its end? ^-~
END
//IF~Dead("AC#PPWYR")~THEN REPLY ~Yes. The wyrd is no more.~ EXTERN AC#PPMYT FINALE.00
IF~~THEN REPLY ~Yes. The wyrd is no more.~ EXTERN AC#PPMYT FINALE.00
IF~~THEN REPLY ~No, not yet.~ EXTERN AC#PPMYT wait_wyrd_defeat_bye

CHAIN AC#PPMYT wait_wyrd_defeat_bye
~^0xFF8FAD5DThen I shall wait here until your return. ^-~
EXIT



//WYRD 2nd Meeting

CHAIN IF ~Global("AC#PPChapter6Quest","GLOBAL",18)~ THEN AC#PPWYR 3.00
~** Mmm. I am getting bored with that struggle of yours. You don't even understand you are destined to lose it. **~
END
IF~~THEN REPLY ~Lose it? Don't you sense what I did?~ EXTERN AC#PPWYR 3.01
IF~~THEN REPLY ~Hah! You are afraid, aren't you? You know it's you who is losing this! Hahaha!~ EXTERN AC#PPWYR 3.01

CHAIN AC#PPWYR 3.01
~** You may think that you sand a chance, but you don't. None of this matters. **~
DO ~StartCutScene("AC#PP6C6")~ EXIT

CHAIN IF ~Global("AC#PPChapter6Quest","GLOBAL",19)~ THEN AC#PPWYR 3.02 //continued
~** What is this?! **~
==AC#PPMYT ~^0xFF8FAD5DIt's time for you to leave Myth Unnohyr, monster. ^-~
==AC#PPWYR ~** No! I still have a few tricks I'm not afraid to use! Die! All of you! **~
DO ~SetGlobal("AC#PPChapter6Quest","GLOBAL",20) CreateCreature("AC#PPSPI",[3730.420],1) CreateVisualEffect("SPFLESHS",[3730.420]) CreateCreature("AC#PPSPI",[3900.490],1) CreateVisualEffect("SPFLESHS",[3900.490]) CreateCreature("AC#PPBGO",[3350.500],1) CreateVisualEffect("SPFLESHS",[3350.500]) CreateCreature("AC#PPBGO",[3880.790],1) CreateVisualEffect("SPFLESHS",[3880.790]) Enemy()~ EXIT

//WYRD 3rd and final

CHAIN IF ~Global("AC#PPChapter6Quest","GLOBAL",21)~ THEN AC#PPWYR 4.00
~** No!!! You cannot win! I still have one more trick! **~
DO ~SetGlobal("AC#PPChapter6Quest","GLOBAL",22) ApplySpell(Myself,CLERIC_HEAL) DestroyItem("MINHP1") ApplySpell(Myself,CLERIC_REGENERATE) ApplySpell(Myself,CLERIC_EARTHQUAKE)~ EXIT

//MYTHRIEN

CHAIN AC#PPMYT FINALE.00
~^0xFF8FAD5DSo it is done. The wyrd is unmade, its hunger silenced... and for the first time in long ages, this land may breathe. ^-~
EXTERN AC#PPMYT wyrd_dead_02

CHAIN AC#PPMYT wyrd_dead_02
~^0xFF8FAD5DMortal, your strength has carried what even I could not. The echo of your deed reaches beyond these broken wards—yes, even the gods turn their gaze toward you. You have given Myth Unnohyr a fragment of peace. For that, I thank you. ^-~
END
IF~~THEN REPLY ~Perhaps you could show your gratitude in a more... tangible way?~ EXTERN AC#PPMYT show_grateful
IF~~THEN REPLY ~Will the curse of wild and dead magic linger on forever?~ EXTERN AC#PPMYT restore_mythal
IF~~THEN REPLY ~What will become of this place now?~ EXTERN AC#PPMYT restore_mythal
IF~~THEN REPLY ~I’ll be glad once I can leave this place behind.~ EXTERN AC#PPMYT restore_mythal

CHAIN AC#PPMYT show_grateful
~^0xFF8FAD5DThat I shall do soon enough. But first, allow me to mend the Mythal of this place—if only in part. ^-~
EXTERN AC#PPMYT restore_mythal

CHAIN AC#PPMYT restore_mythal
~^0xFF8FAD5DI do not possess the strength to renew this Mythal in full. Yet for a brief span I can steady it—enough to still its raving for a single year. During that time, no corruption shall rise to feed upon it. ^-~
DO ~StartCutScene("AC#PP6C7")~ EXIT


CHAIN IF ~Global("AC#PPChapter6Quest","GLOBAL",23)~ THEN AC#PPMYT FINALE.02
~^0xFF8FAD5DA year of quiet is all I can grant. Beyond that, it rests with my kin—if they choose to weave anew, to raise a true Mythal here once more. ^-~
==AC#PPMYT ~^0xFF8FAD5DAs my thanks, I return to you the rose you placed at my feet when you called me forth. May it shield you against the malice of hostile spells. Yet remember—its power, too, shall one day fade into silence. ^-~
END
IF~~THEN DO ~GiveItemCreate("AC#PPMYR",Player1,1,0,0)~ EXTERN AC#PPMYT bye_final

CHAIN AC#PPMYT bye_final
~^0xFF8FAD5DFarewell, <CHARNAME>. May the paths ahead bow to your courage. ^-~
DO ~SetGlobal("AC#PPChapter6Quest","GLOBAL",24) 
AddJournalEntry(@12217,QUEST)
CreateVisualEffect("SPPORTAL",[900.400]) DestroySelf()~ EXIT

BEGIN AC#PPHE2
CHAIN IF ~True()~ THEN AC#PPHE2 hello_thank_you
~You have done what we could not. The silence is lifted. The Mythal breathes again – if only for a time.~
== AC#PPHE2 ~Its strength may fade with the turning of the seasons, but even a single year of peace is more than we dared hope for.~
== AC#PPHE2 ~Myth Unnohyr is no longer a place of sorrow. Thanks to you, its name may be spoken with pride once more!~
== AC#PPHE2 ~Our spirits may rest. Yours... must journey on. But know this: the song of your deed will echo in the roots of this forest for ages to come.~
DO ~SetGlobal("Elves_ByeBye","ACPP90",1)
AddJournalEntry(@12218,QUEST)
CreateVisualEffectObject("SPFLESHS",Myself) Wait(1) DestroySelf()~ EXIT


//FINALE 

CHAIN IF ~Global("AC#PPChapter6Quest","GLOBAL",25)~ THEN AC#PPEL4 C6.QUEST.0X.00
~It's you! That means you've defeated the enemy!~
END
IF~~THEN REPLY ~Yes, but it required more effort than we thought. But with some divine intervention, Myth Unnohyr is now safe.~ EXTERN AC#PPEL4 C6.QUEST.FINALE.01
IF~~THEN REPLY ~You're surprised? Well, you should be! It's all been some sort of nightmare! But the wyrd is gone now. And Myth Unnohyr should be safer from now on. I won't lie, though, you've teleported me right into some... nighmare! I expect some grand reward!~ EXTERN AC#PPEL4 C6.QUEST.FINALE.01

CHAIN AC#PPEL4 C6.QUEST.FINALE.01
~Wait—are you saying that the ruins are safe now?~
END
IF~~THEN REPLY ~Yes. Mythrien appeared me. Myth Unnohyr will be free of its strange curse for a year. I'd say it's a perfect moment for you to do something to keep it that way.~ EXTERN AC#PPEL4 C6.QUEST.FINALE.02
IF~~THEN REPLY ~You will need to check the details on your own. I'm done with that place.~ EXTERN AC#PPEL4 C6.QUEST.FINALE.03

CHAIN AC#PPEL4 C6.QUEST.FINALE.02
~This is wonderful news! And Mythrien helped you... This is big.~
EXTERN AC#PPEL4 C6.QUEST.FINALE.04

CHAIN AC#PPEL4 C6.QUEST.FINALE.03
~Of course!~
EXTERN AC#PPEL4 C6.QUEST.FINALE.04

CHAIN AC#PPEL4 C6.QUEST.FINALE.04
~What you did is more than any of us could ever dream. Thank you. We will never forget what you did.~
==AC#PPMI ~Here. Your reward. Thank you for everything! And whoever is going to stand on your way: I pity them already.~
DO ~SetGlobal("AC#PPChapter6Quest","GLOBAL",26)
AddJournalEntry(@12219,QUEST)
 AddXPObject(Player1,5000) AddXPObject(Player2,5000) AddXPObject(Player3,5000) AddXPObject(Player4,5000) AddXPObject(Player5,5000) AddXPObject(Player6,5000) GiveItemCreate("AC#PPSTA",Player1,1,1,1) GiveGoldForce(1000)~ EXIT

CHAIN IF ~Global("AC#PPChapter6Quest","GLOBAL",26)~ THEN AC#PPEL4 C6.QUEST.0X.01
~I'll pray for you to find peace.~
EXIT
