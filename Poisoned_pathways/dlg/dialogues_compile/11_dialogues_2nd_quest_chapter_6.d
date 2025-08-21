//ELHAN

EXTEND_BOTTOM ~c6elhan2~ 47
IF~Global("AC#PP_MythUnnohyr","GLOBAL",7)~THEN REPLY ~I aided Eldath’s faithful in Duskwood Dell against a great evil in Myth Unnohyr. Perhaps they will aid us now, if they learn we face vampires threatening the elves of Tethir.~ EXTERN c6elhan2 elhan_myth_unnohyr 
END

CHAIN c6elhan2 elhan_myth_unnohyr
~Myth Unnohyr! Long has it been since I heard that name. A city wholly cursed, said to have brought about its own downfall through great tragedy. And the priests of Eldath sent you there? Then surely they are in your debt.~  
END
IF ~~ THEN EXTERN c6elhan2 AC#PP.ELHAN

CHAIN c6elhan2 AC#PP.ELHAN
~But mark this: You know the priests of Duskwood Dell. They are pacifists, and I doubt they will take up arms in your cause. Yet mayhap they possess draughts and balms that may aid you in the struggle ahead. If you are on good terms with them, speak with those Eldathyn and see what help they may offer. Keep my counsel in mind.~  
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
IF ~~ THEN REPLY ~Actually, Alatoasz, I was hoping to ask something of you.~ EXTERN AC#PPEL4 C6.QUEST.01.02

CHAIN AC#PPMI C6.QUEST.01.01
~Aye, I am troubled by this matter, and not without cause.~  
END
IF ~~ THEN REPLY ~Then tell me more.~ EXTERN AC#PPMI C6.QUEST.01.03
IF ~~ THEN REPLY ~Go on. What is this about?~ EXTERN AC#PPMI C6.QUEST.01.03
IF ~~ THEN REPLY ~We all must bear our share of burdens.~ EXTERN AC#PPMI C6.QUEST.01.03

CHAIN AC#PPEL4 C6.QUEST.01.02
~Your questions will be answered soon enough. But first, let Mismal speak of what we have been discussing at length.~  
EXTERN AC#PPMI C6.QUEST.01.03

CHAIN AC#PPMI C6.QUEST.01.03
~I will not cloak this in fair speech. You know Myth Unnohyr, you have walked its ruins. You know how strange it is, caught between life and death. But since your last battle there, the place has worsened.~  
END
IF ~~ THEN REPLY ~Worsened? How so? The Talonite is dead.~ EXTERN AC#PPMI C6.QUEST.01.04a
IF ~~ THEN REPLY ~That happens often enough. Wherever I pass, the place seems worse off after.~ EXTERN AC#PPMI C6.QUEST.01.04a
IF ~~ THEN REPLY ~That is no longer my concern.~ EXTERN AC#PPMI C6.QUEST.01.04a
IF ~~ THEN REPLY ~I had hoped that ordeal was finished. Why, in all the gods’ names, does everyone always want something from me?~ EXTERN AC#PPMI C6.QUEST.01.04a

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
~We suspect a mighty Wyrd, a spirit that seizes the husks of dead elves, has possessed the corpse of Commander Elv-Esster Aened, once leader of Myth Unnohyr’s guard. She was interred within a sealed sarcophagus—but the ward stone was taken, and the Wyrd slipped within to claim her body.~  
=  
~It feeds on the rotten magic of the place to raise further undead. It will not be long before these beings spill into the surrounding lands. You must put an end to that creature.~  
END
IF ~~ THEN REPLY ~Right...~ EXTERN AC#PPMI C6.QUEST.01.04c
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
DO ~SetGlobal("AC#PP_MythUnnohyr","GLOBAL",9)~ EXIT

CHAIN AC#PPMI C6.QUEST.01.07
~If you change your mind, come to me and let me know. We truly need your aid.~  
DO ~SetGlobal("AC#PP_MythUnnohyr","GLOBAL",9)~ EXIT


//DUSKWOOD DELL CH6 -- 2ND TALK (CLERIC)

CHAIN IF ~Global("AC#PP_MythUnnohyr","GLOBAL",9)~ THEN AC#PPEL4 c6.2nd.c.00
~I know it may seem strange for someone like you that I am not very optimistic about any of this, but I've seen enough suffering. I will do what I must, but I won't rise my hand. I hope you understand.~
END
IF~~THEN REPLY ~I do.~ EXIT
IF~~THEN REPLY ~I will never understand how you can allow such battles happen while you're here, in your little hideout. Goodbye.~ EXIT

//HIGH RANGER

CHAIN IF ~Global("AC#PP_MythUnnohyr","GLOBAL",9)~ THEN AC#PPMI C6.QUEST.02.00
~Are you prepared to face the Wyrd?~
END 
IF ~Global("AC#PP_GiveBlade","GLOBAL",1)~ THEN EXTERN AC#PPMI depart_with_sword
IF ~Global("AC#PP_GiveBlade","GLOBAL",0)~ THEN EXTERN AC#PPMI depart_without_sword

CHAIN IF ~~ THEN AC#PPMI depart_with_sword
~If you have taken up the sword entrusted to you by the High Priest, then I can send you into Myth Unnohyr.~  
END
IF ~~ THEN REPLY ~I am ready.~ EXTERN AC#PPMI C6.QUEST.02.01
IF ~~ THEN REPLY ~Not yet. There is something I must attend to first.~ EXIT

CHAIN IF ~~ THEN AC#PPMI depart_without_sword
~I shall send you into Myth Unnohyr if you are ready.~  
END
IF ~~ THEN REPLY ~I am ready.~ EXTERN AC#PPMI C6.QUEST.02.01
IF ~~ THEN REPLY ~Not yet. There is something I must attend to first.~ EXIT


CHAIN AC#PPMI C6.QUEST.02.01
~Good. Follow me.~
DO ~StartCutScene("AC#PP6CA")~ EXIT

BEGIN AC#PPWYR

//1ST FIGHT

CHAIN IF ~Global("AC#PPChapter6Quest","GLOBAL",2)~ THEN AC#PPWYR 1.00
~I sensed someone meddling with my minions, in my stronghold!~
END
IF~~THEN REPLY ~Your stronghold? You are just making it more dangerous. More... dead.~ EXTERN AC#PPWYR 1.01
IF~~THEN REPLY ~You must be the wyrd I heard about. You took over the body of an elf; of a hero that did all she could to defend this place.~ EXTERN AC#PPWYR 1.01
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
~** Some here. Let's test your weapons and will. Hahaha! **~
DO ~SetGlobal("AC#PPChapter6Quest","GLOBAL",3) 
CreateCreature("AC#PPSPI",[522.378],0) 
CreateVisualEffect("SPFLESHS",[522.378]) 
CreateCreature("AC#PPSPI",[825.491],2) 
CreateVisualEffect("SPFLESHS",[825.491]) 
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
StartCutSceneMode() 
Wait(1) 
ScreenShake([20.45],15) 
Wait(2) 
EndCutSceneMode() 
DestroySelf()~ EXIT

//HELPER 

BEGIN AC#PPHEL

CHAIN IF ~Global("AC#PPChapter6Quest","GLOBAL",6)~ THEN AC#PPHEL HELPER.1.00
~Yes...! Destroy these things...!~
==AC#PPHEL ~That... creature—the one that took the body of our dear commander...! It wants you to think none of this matters, that killing these mawed growths doesn't matter... But it does!~
==AC#PPHEL ~Find me where earth devoured our precious towers... and there I shall aid you! I know how to kill this thing! Find me...! Please!~
DO ~SetGlobal("AC#PPChapter6Quest","GLOBAL",7) DestroySelf()~ EXIT

//HELPER 2

CHAIN IF ~Global("AC#PPChapter6Quest","GLOBAL",8)~ THEN AC#PPHEL HELPER.2.00
~You're here... I'm... glad.~
END
IF~~THEN REPLY ~Who are you?~ EXTERN AC#PPHEL HELPER.2.02
IF~~THEN REPLY ~I do not have much choice, truth be told.~ EXTERN AC#PPHEL HELPER.2.01

CHAIN AC#PPHEL HELPER.2.01
~I'm sorry, but... that may be true. But I know how to fix it. All of this...!~
EXTERN AC#PPHEL HELPER.2.02

CHAIN AC#PPHEL HELPER.2.02
~I am Vaxh Aened. Commander Elv-Esster Aened was my wife... That creature you fight took what remained of my wife and treats her bones as something it can wear...!~
==AC#PPHEL ~We must stop that wyrd... For her. For Myth Unnohyr, and the world you come from...! World of the living...!~
END
IF~~THEN REPLY ~You mentioned you know how to stop that creature.~ EXTERN AC#PPHEL HELPER.2.03
IF~~THEN REPLY ~Yes. yes. I know it needs to be stopped. That's why I came here! Tell me something I *don't* know!~ EXTERN AC#PPHEL HELPER.2.03

CHAIN AC#PPHEL HELPER.2.03
~This creature—wyrd—these things don't become so powerful... This one is old. And it came from the soil that was cursed with both dead and wild magic! But... what if that can be fixed? What if magic can be fixed...?~
END
IF~~THEN REPLY ~You know what may be able to fix this place?!~ EXTERN AC#PPHEL HELPER.2.04
IF~~THEN REPLY ~What sort of balderdash is that?~ EXTERN AC#PPHEL HELPER.2.05

CHAIN AC#PPHEL HELPER.2.04
~Not *what*, but... who.~
EXTERN AC#PPHEL HELPER.2.06

CHAIN AC#PPHEL HELPER.2.05
~It's not... I know who we can ask for help.~
EXTERN AC#PPHEL HELPER.2.06

CHAIN AC#PPHEL HELPER.2.06
~The fall of this place is one big mystery... Even most of us do not know what exactly happened. It felt like a disaster, both natural and arcane one...! To us, it felt as if our word shattered.~
==AC#PPHEL ~Our stronghold—it's been a true sanctuary, place where many of us practiced, where we would study culture, magic and nature... We wanted to protect what was most precious to us. But there was an attack... so long ago. I can't even remember who—but I remember the explosion. As if something was destroyed.~
==AC#PPHEL ~And then, an even bigger one. It was our Mythal. Our most sacred magic we erected with a blassing of Mythrien Sarath...! Oh, the pain...! And the fear...! I can almost feel all of this...! All the dread!!!~
END
IF~~THEN REPLY ~It's in the past. I'm here. Please, tell me what happened next.~ EXTERN AC#PPHEL HELPER.2.07
IF~~THEN REPLY ~Stop shouting! Someone can hear us! There are these red spirits all around this place!~ EXTERN AC#PPHEL HELPER.2.07

CHAIN AC#PPHEL HELPER.2.07
~I... I'm sorry. To me, it feels so real... But I feel better now.~
==AC#PPHEL ~During the cataclysm, part of our home fell right into earthy maw behind me... My home was one of those buildings. Now, surrounded by the darkness.~
==AC#PPHEL ~Elv-Esster tried to save us, but she failed. Her magic became unpredictable. We knew we had to ask Mythrien for help, so we sent our son for this... relic... The Green Rose of Mythrien.~
==AC#PPHEL ~It wasn't required for the Mythal to function, but... it was the symbol of our loyalty. Of our hope... We wanted to enter the House of Mythrien with it, but—my son...~
==AC#PPHEL ~He also died... just like his mother. And just like... me.~
==AC#PPHEL ~But the rose is still there...! I can feel it. You might have missed it, most did... but the roses still blossom to this dark day~
==AC#PPHEL ~Find the rose and take it to the temple of Mythrien, in the very heart of our city, near the magic passage that brought you here. You had to walk through that place.~
==AC#PPHEL ~Then, place the rose under Mythrien's feet... He will answer. I know it.~
==AC#PPHEL ~Ask him for help. Destroy the wyrd. Heal this place. And let peace inside these walls...~
END
IF~~THEN REPLY ~I'll do my best.~ EXTERN AC#PPHEL HELPER.2.08
IF~~THEN REPLY ~It sounds difficult...~ EXTERN AC#PPHEL HELPER.2.08

CHAIN AC#PPHEL HELPER.2.08
~I can see more than your flesh... I know you can do wonders. You walk the path of death... but also that of life.~
==AC#PPHEL ~That's why I know you may be able to fix this... And I... I belong with the earth. With death. Good luck, my friend. May Mythrien watch over you...~
==AC#PPHEL ~...and I shall return to dark earth I died in...~
DO ~SetGlobal("AC#PPChapter6Quest","GLOBAL",9) CreateVisualEffect("AC#PPBUR",[2230.800]) DestroySelf()~ EXIT

//SUMMONED

BEGIN AC#PPMYT

CHAIN IF ~Global("AC#PPChapter6Quest","GLOBAL",14)~ THEN AC#PPMYT 01.00
~^0xFF8FAD5DI heard your calling and I came. But—what is this? ^-~
==AC#PPMYT IF ~Race(Player1,ELF)~ THEN ~^0xFF8FAD5DIt's been a while since any elf summoned me here. To Myth Unnohyr. ^-~
==AC#PPMYT IF ~!Race(Player1,ELF)~ THEN ~^0xFF8FAD5DYou must be quite a bold <PRO_RACE> to call me here, to Myth Unnohyr! ^-~
==AC#PPMYT ~^0xFF8FAD5DJust look at this place. Once a place of true glory, of powerful Mythal, but now? Now it all feels like an twisted joke, made by one of a truly dark heart! ^-~
END
IF~~THEN REPLY ~I summoned you for a reason.~ EXTERN AC#PPMYT 01.02
IF~~THEN REPLY ~Yes. And that's why I called you here, Mythrien. We need you help.~ EXTERN AC#PPMYT 01.02
IF~~THEN REPLY ~Is that all you've got to say? Elves that lived here cared about you, and it looks like that some of them remained, as ghosts, bound with this soild, and they still believe in you. But you focus on the past, not the presence. How foolish.~ EXTERN AC#PPMYT 01.01

CHAIN AC#PPMYT 01.01
~^0xFF8FAD5DIs that how you want to spend your time? On scolding one of the Seldarine? You must be a fool, and—no. There must be another reason. ^-~
EXTERN AC#PPMYT 01.02

CHAIN AC#PPMYT 01.02
~^0xFF8FAD5DYou offered me the Rose. Someone must have told you to do that. And there must be some reason for that. Speak!  ^-~
END
IF~~THEN REPLY ~Myth Unnohyr lost its Mythal. All sorts of creatures roam this place, ghost, and now, a powerful wyrd. It took the body of your faithrul commander. Elv-Esster Aened. We need to stop this creature. We need to save people and—maybe we can even save this place and help all those that praised your name, Mythrien Sarath! So please, help us. Let us bring some peace to Myth Unnohyr. this place deserves some peace.~ EXTERN AC#PPMYT 01.03
IF~~THEN REPLY ~Myth Unnohyr lost its Mythal. All sorts of creatures roam this place, ghost, and now, a powerful wyrd. It took the body of your faithrul commander. Elv-Esster Aened. Maybe you remember her name. Now, it has all became even worse. Elven spirits were changed. This place's magic got all wrong. We must defeat the wyrd and—no matter I like it or not, we may need to together.~ EXTERN AC#PPMYT 01.03

CHAIN AC#PPMYT 01.03
~^0xFF8FAD5DElv-Esster Aened. I remember that name... ^-~
==AC#PPMYT ~^0xFF8FAD5DI thought this place is long gone. Dead. Changed beyond recognition. But you brought the Rose. And if there was a spirit here, able to remember our little rites, then perhaps it's worth some of my attention. ^-~
==AC#PPMYT ~^0xFF8FAD5DIt's interesting that a wyrd managed to cause all that trouble. They aren't that powerful. Usually. Before I do anything, I need to ask you something. ^-~
==AC#PPMYT ~^0xFF8FAD5DI can tell you are not a simple <PRO_RACE>. I can see the scars, even those that no moral eye can see. That means you've seen much and your opinion may be important. Maybe. So tell me: is this place truly worth it? ^-~
END
IF~~THEN REPLY ~Yes! Of course it is!~ EXTERN AC#PPMYT 01.04
IF~Race(Player1,ELF)~THEN REPLY ~Yes. It used to be home for our people, Mythrien. So thousand times, yes.~ EXTERN AC#PPMYT 01.04
IF~~THEN REPLY ~You want to know what I think? No. These are just some old ruins, and I don't see why anyone would care about this place. I was sent here by a High Ranger of Mielikki and I fail to see why. But I cannot leave until the wyrd is gone.~ EXTERN AC#PPMYT 01.05

CHAIN AC#PPMYT 01.04
~^0xFF8FAD5DI see. ^-~
EXTERN AC#PPMYT 01.06

CHAIN AC#PPMYT 01.05
~^0xFF8FAD5DA High Ranger of Mielikki? Hmm. Khalreshaar... It seems that someone does care. ^-~
EXTERN AC#PPMYT 01.06

CHAIN AC#PPMYT 01.06
~^0xFF8FAD5DWell, <PRO_RACE>, it looks like you will have a chance to fight arm in arm with Mythrien Sarath. But I shall do more than grand you and Myth Unnohyr my blade! ^-~
==AC#PPMYT ~^0xFF8FAD5DPeace does not urge the sword, but tranquility. So I shall give this place something else. I should give it some time of peace! ^-~
DO ~SetGlobal("AC#PPChapter6Quest","GLOBAL",15) StartCutScene("AC#PP6C4")~ EXIT

//Healed

CHAIN IF ~Global("AC#PPChapter6Quest","GLOBAL",16)~ THEN AC#PPMYT 02.00
~^0xFF8FAD5DI hope the price I needed to pay won't go to waste. ^-~
END
IF~~THEN REPLY ~What happened?~ EXTERN AC#PPMYT 02.01
IF~~THEN REPLY ~Have you—~ EXTERN AC#PPMYT 02.01

CHAIN AC#PPMYT 02.01
~^0xFF8FAD5DI provided this place with a year of peace. ^-~
==AC#PPMYT ~^0xFF8FAD5DI offered a spark of my power to negate the twisted echoes of the catastrophe. This spark of Mythal won't bring it to it's glory, but it shall negate the unpredictable effects of the anomalies that seem to have taken over this place. You will be able to use your magic, and it won't fail you, nor it won't result in all these surges. ^-~
==AC#PPMYT ~^0xFF8FAD5DThat same blessing will prevent the wyrd from sucking energy from this area. ^-~
END
IF~~THEN REPLY ~Hah! Oh, I want to see the wyrd's face. That monster must have felt this.~ EXTERN AC#PPMYT 02.02
IF~~THEN REPLY ~Mhm. Well, I wonder if that's going to be enough...~ EXTERN AC#PPMYT 02.02
IF~~THEN REPLY ~And that's it? You just fixed it?~ EXTERN AC#PPMYT 02.03

CHAIN AC#PPMYT 02.02
~^0xFF8FAD5DIt should help you defeat the monster. ^-~
EXTERN AC#PPMYT 02.04

CHAIN AC#PPMYT 02.03
~^0xFF8FAD5DI just gave this place some time, it's not fixing it. No god should just come and do things for the living. How else will they know how precious some things truly are? ^-~
EXTERN AC#PPMYT 02.04

CHAIN AC#PPMYT 02.04
~^0xFF8FAD5DBut worry not. I will assist you. I want to see this place free. I want peace to come. ^-~
==AC#PPMYT ~^0xFF8FAD5DNow go. Find that creature and I will come when the time is right. ^-~
DO ~SetGlobal("AC#PPChapter6Quest","GLOBAL",17) 
SetGlobal("AC#PPFixMagic","GLOBAL",1) 
CreateVisualEffect("SPPORTAL",[710.705]) 
DestroySelf()~ EXIT

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

CHAIN IF ~Global("AC#PPChapter6Quest","GLOBAL",23)~ THEN AC#PPMYT FINALE.00
~^0xFF8FAD5DAnd it's done. The wyrd is gone, and... perhaps this land will finally rest from all the chaos. ^-~
==AC#PPMYT ~^0xFF8FAD5DI must admit, you are a powerful adventurer, <CHARNAME>. I'm not surprised more and more gods turn their head in your direction. And for your help, I will grand you a special gift. ^-~
==AC#PPMYT ~^0xFF8FAD5DA spark of new power. It looks like you fight truly powerful beings so I shall aid you. This new power will allow you to call a faint breeze of Mythal. It shall protect you and help those around you, by healing their wounds. ^-~
==AC#PPHEL ~I... I wish to thank you... What was left of my wife and my son is now cradled by the earth of our home. Thanks you...~
==AC#PPMYT ~^0xFF8FAD5DIt must be you, who helped our hero. Thank you, spirit. You and your family should rest now. ^-~
==AC#PPHEL ~Thank you, Mythrien...~ DO ~Kill(Myself)~ 
==AC#PPMYT ~^0xFF8FAD5DAnd now, <CHARNAME>, let me return to my duties. You should rest. And rejoice, as you have brought at least some peace to Myth Unnohyr. ^-~
END
IF~~THEN REPLY ~And won't it stay that way? Or will the curse of wild and dead magic return?~ EXTERN AC#PPMYT FINALE.02
IF~~THEN REPLY ~So this is our farewell? Perhaps you want to join my group? We could let our tale continue!~ EXTERN AC#PPMYT FINALE.01

CHAIN AC#PPMYT FINALE.01
~^0xFF8FAD5DHahaha! Who would have thought you are such a joker. No. I won't join your group. ^-~
END
IF~~THEN REPLY ~Well, I had to try.~ EXTERN AC#PPMYT FINALE.01a
IF~~THEN REPLY ~You do not know what you're missing.~ EXTERN AC#PPMYT FINALE.01b

CHAIN AC#PPMYT FINALE.01a
~^0xFF8FAD5DOf course. ^-~
EXTERN AC#PPMYT FINALE.01c

CHAIN AC#PPMYT FINALE.01b
~^0xFF8FAD5DI believe I do. ^-~
EXTERN AC#PPMYT FINALE.01c

CHAIN AC#PPMYT FINALE.01c
~^0xFF8FAD5DAs for this place... ^-~
EXTERN AC#PPMYT FINALE.02

CHAIN AC#PPMYT FINALE.02
~^0xFF8FAD5DMyth Unnohyr receinved a gift of temporal peace. I shall leave to my kin the decision if they want to save this place. If they want to try to erect true Mythal again. ^-~
==AC#PPMYT ~^0xFF8FAD5DI will not make this decision for them. ^-~
==AC#PPMYT ~^0xFF8FAD5DFarewell, <CHARNAME>. Good luck with the fights that still await you. ^-~
DO ~SetGlobal("AC#PPChapter6Quest","GLOBAL",24) OpenDoor("DOOR01") AmbientActivate("Ac#ppblc",FALSE) TriggerActivation("TrACPP71",TRUE) AmbientActivate("AC#PPPP",FALSE) CreateVisualEffect("SPPORTAL",[3800.460]) DestroySelf()~ EXIT

//FINALE 

CHAIN IF ~Global("AC#PPChapter6Quest","GLOBAL",25)~ THEN AC#PPEL4 C6.QUEST.0X.00
~It's good to see you in one piece. Go on. Talk to the High Ranger.~
EXIT

CHAIN IF ~Global("AC#PPChapter6Quest","GLOBAL",25)~ THEN AC#PPMI C6.QUEST.FINALE.00
~It's you! And that means you've defeated the enemy!~
END
IF~~THEN REPLY ~Yes, but it required more effort than we thought. But with some divine intervention, Myth Unnohyr is now safe.~ EXTERN AC#PPMI C6.QUEST.FINALE.01
IF~~THEN REPLY ~You're surprised? Well, you should be! It's all been some sort of nightmare! But the wyrd is gone now. And Myth Unnohyr should be safer from now on. I won't lie, though, you've teleported me right into some... nighmare! I expect some grand reward!~ EXTERN AC#PPMI C6.QUEST.FINALE.01

CHAIN AC#PPMI C6.QUEST.FINALE.01
~Wait—are you saying that the ruins are safe now?~
==AC#PPEL4 ~What would be very good news.~
END
IF~~THEN REPLY ~Yes. Mythrien himself helped me. He did something and Myth Unnohyr will be free of its strange curse for a year. I'd say it's a perfect moment for you to do something to keep it that way.~ EXTERN AC#PPMI C6.QUEST.FINALE.02
IF~~THEN REPLY ~You will need to check the details on your own. I'm done with that place.~ EXTERN AC#PPMI C6.QUEST.FINALE.03

CHAIN AC#PPMI C6.QUEST.FINALE.02
~This is wonderful news! And Mythrien helped you... This is big. I'll need to tell this to others.~
EXTERN AC#PPMI C6.QUEST.FINALE.04

CHAIN AC#PPMI C6.QUEST.FINALE.03
~Of course!~
EXTERN AC#PPMI C6.QUEST.FINALE.04

CHAIN AC#PPMI C6.QUEST.FINALE.04
~What you did is more than any of us could ever dream. Thank you. We will never forget what you did.~
==AC#PPMI ~Here. Your reward. And know that I will always think of you as of my friend.~
==AC#PPEL4 ~Let's hope this is end of our problems and we'll be able to focus on finding peace within ourselves.~
==AC#PPEL4 ~I know that you might have expected more from me, but know that I agreed to give you another gift. the Hight Ranger said it may be a good idea.~
==AC#PPMI ~Yes. And again. Thank you for everything! And whoever is going to stand on your way: I pity them already.~
DO ~SetGlobal("AC#PPChapter6Quest","GLOBAL",26) AddXPObject(Player1,29000) AddXPObject(Player2,29000) AddXPObject(Player3,29000) AddXPObject(Player4,29000) AddXPObject(Player5,29000) AddXPObject(Player6,29000) GiveItemCreate("AC#PPSTA",Player1,1,1,1) GiveGoldForce(10000) EscapeArea()~ EXIT

CHAIN IF ~Global("AC#PPChapter6Quest","GLOBAL",26)~ THEN AC#PPEL4 C6.QUEST.0X.01
~I'll pray for you to find peace.~
EXIT
