//ELHAN

EXTEND_BOTTOM ~c6elhan2~ 47
IF~Global("AC#PP_MythUnnohyr","GLOBAL",7)~THEN REPLY ~I helped followers of Eldath of Duskwood Dell. Perhaps they will help us if they find out we are going to face vampires and help elves from the Forest of Tethir.~ EXTERN c6elhan2 AC#PP.ELHAN
END

CHAIN c6elhan2 AC#PP.ELHAN
~I know the priest of Duskwood Dell. They are pacifist so I doubt they will help you, but perhaps they have potions and ointments that may help you during you fight with our enemies. If you're in good terms with them, talk to those Eldathyn and see if they can help you. Keep my advice in mind.~
END
IF~Global("ElhanWater","LOCALS",0)~THEN REPLY ~Can you help with special supplies? Holy water and stakes come to mind.~ DO ~AddJournalEntry(57714,INFO) EraseJournalEntry(97341) EraseJournalEntry(97340) AddJournalEntry(97342,QUEST) SetGlobal("ElhanWater","LOCALS",1) SetGlobal("AskedElhanForHolyWater","GLOBAL",1)~ EXTERN c6elhan2 48
IF~Global("ElhanWater","LOCALS",0)~THEN REPLY ~I will do what I can, though Bodhi is very strong. Have you holy water and stakes?~ DO ~AddJournalEntry(57714,INFO) EraseJournalEntry(97341) EraseJournalEntry(97340) AddJournalEntry(97342,QUEST) SetGlobal("ElhanWater","LOCALS",1) SetGlobal("ToldElhanAboutBodhi","GLOBAL",1) SetGlobal("AskedElhanForHolyWater","GLOBAL",1)~ EXTERN c6elhan2 48
IF~Global("ElhanShame","LOCALS",0)~THEN REPLY ~I will get by without your help, then.~ DO ~SetGlobal("ElhanWater","LOCALS",1)~ EXTERN c6elhan2 51
IF~Global("ElhanWater","LOCALS",0)~THEN REPLY ~You mentioned some shame before. What shame has Irenicus caused you?~ DO ~SetGlobal("ElhanShame","LOCALS",1)~ EXTERN c6elhan2 50

//DUSKWOOD DELL CH6 -- FIRST TALK

BEGIN AC#PPMI

CHAIN IF ~Global("AC#PP_MythUnnohyr","GLOBAL",8)~ THEN AC#PPEL4 C6.QUEST.01.00
~<CHARNAME>! You’ve arrived at a crucial moment. There’s trouble brewing, and you are involved, whether by choice or fate.~
==AC#PPMI ~We all have a share in this, Alatoasz Berendim.~
==AC#PPEL4 ~Allow me to introduce High Ranger Mismal Al'Visalle. Once of Gwaeron’s Slumber—now serving among the Mielikkians of Amn.~
==AC#PPMI ~I appreciate the fine introduction, but we’re not gathered here to trade titles, I’m afraid. I wish it were so, but this is no simple matter.~
END
IF~~THEN REPLY ~You sound concerned.~
 EXTERN AC#PPMI C6.QUEST.01.01
IF~~THEN REPLY ~Actually, Alatoasz, I was hoping to ask something of you.~ EXTERN AC#PPEL4 C6.QUEST.01.02

CHAIN AC#PPMI C6.QUEST.01.01
~Indeed, I am concerned—and not without cause.~
END
IF~~THEN REPLY ~Then tell me more.~ EXTERN AC#PPMI C6.QUEST.01.03
IF~~THEN REPLY ~Go on. What’s this about?~ EXTERN AC#PPMI C6.QUEST.01.03
IF~~THEN REPLY ~We all carry our share of burdens.~ EXTERN AC#PPMI C6.QUEST.01.03

CHAIN AC#PPEL4 C6.QUEST.01.02
~You will tell me everything in a moment, friend. Let Mismal introduce you to what we have been discussing for a while now.~
EXTERN AC#PPMI C6.QUEST.01.03

CHAIN AC#PPMI C6.QUEST.01.03
~I’ve heard of your deeds—how you defeated the priest of Talona. It compelled me to learn more, for I was certain I’d come across your name before. And indeed, I had. You helped prevent war between Amn and Baldur’s Gate. You thwarted the Iron Throne’s schemes in the Cloakwood. I must admit: That is no small legacy.~
==AC#PPMI ~And I know you’ve been to Myth Unnohyr. It’s a strange place, as you well know—caught somewhere between life and death. But since your last battle there, things have worsened.~
END
IF~~THEN REPLY ~Worsened? How so? The Talonite is dead.~ EXTERN AC#PPMI C6.QUEST.01.04a
IF~~THEN REPLY ~I had hoped that ordeal was finished. Why, by all the gods, does everyone always want something from me?~ EXTERN AC#PPMI C6.QUEST.01.04a

CHAIN AC#PPMI C6.QUEST.01.04a
~Everything that happened at Myth Unnohyr woke something up. Something old.~
==AC#PPMI ~I am not here to debate whether it stems from the Malagent, from you, or from Talona herself. That question no longer matters. What matters is this: The evil awakened there has begun to spread. Groves, woodland creatures—even the dryads—have been forced to flee. It feels as though the land itself is being consumed: Trees, ponds, and every quiet glade drawn into its hunger.~
==AC#PPMI ~I came here to ask for your help. From the information I gathered, it seems like the power is of undead origin. We suspect a powerful Wyrd, a spirit that took over the dead body of Commander Elv-Esster Aened who died the very same place Myth Unnohyr became what it is today.~
END
IF~Global("BodhiDead","GLOBAL",0)~THEN REPLY ~Truth be told, I came here because I wanted to ask for help with another monster. A powerful vampire named Bodhi. She and her brother, Irenicus, must be stopped.~ EXTERN AC#PPMI C6.QUEST.01.04b
IF~Global("BodhiDead","GLOBAL",0)~THEN REPLY ~Heh. Funny thing. I'm also trying to stop a powerful vampire. Bodhi. She and her accomplice, Irenicus, are getting out of control.~ EXTERN AC#PPMI C6.QUEST.01.04b
IF~Global("BodhiDead","GLOBAL",1)~THEN REPLY ~I actually just killed a powerful vampire. Bodhi. Her brother, Irenicus, should be next.~ EXTERN AC#PPMI C6.QUEST.01.04b

CHAIN AC#PPMI C6.QUEST.01.04b
~Bodhi? Irenicus? I know these names. I've been to Suldanessellar and I know Elhan. Now that you said all of this—I suspect you know him too.~
==AC#PPMI ~We can help each other. And that's what I've been telling the Hight Priest.~
==AC#PPEL4 ~And I've been trying to tell you brother that Duskwood Dell is a place of peace. We took an active part in stopping the Malagent, but that was in the name of peace and to obtain the antidote for those that may need it.~
==AC#PPMI ~Peace is a privilege we may not be cannot afford right now, Alatoasz.~
==AC#PPEL4 ~One can always afford peace, Mismal.~
==AC#PPMI ~You see why we cannot push this matter forward, in the direction of a needed solution, <CHARNAME>. Alatoasz doesn't want to be part of this.~
==AC#PPEL4 ~We are pacifist and we've been walking a thin line before. <CHARNAME> helped, we assisted him. Eldath guided us so we could finally welcome tranquility in our hearts and souls, not to start another war.~
==AC#PPEL4 ~As I told you, we can still help. You can tell everyone that needs to hide, that as long as they can follow our rules, they are welcome here. This may become their sanctuary as well.~
==AC#PPMI ~We may need more than a place to hide. And perhaps we need you.~
END
IF~~THEN REPLY ~Right...~ EXTERN AC#PPMI C6.QUEST.01.04c
IF~~THEN REPLY ~I will gladly help. There is a chance the situation at Myth Unnohyr became more complicated because of me.~ EXTERN AC#PPMI C6.QUEST.01.04c
IF~~THEN REPLY ~Perhaps you do. The question is if you are ready to provide me with a proper reward in exchange for all the effort I would need to put in this.~ EXTERN AC#PPMI C6.QUEST.01.04c

CHAIN AC#PPMI C6.QUEST.01.04c
~It looks like you are dealing with powerful undead creatures yourself. And Alatoasz has something that could both help with the Wyrd and creatures like Bodhi.~
==AC#PPEL4 ~High Ranger...~
==AC#PPMI ~Eldath and Mielikki are like sisters. You are supposed to help us!~
==AC#PPEL4 ~I won't raise my hand in this fight, Mismal Al'Visalle. There are principles and in these circumstances, in the light of previous happenings, I feel I need them more than I ever did.~
==AC#PPMI ~Fine. We won't force your hand, but please, let <CHARNAME> take the sword. And I won't ask you for anything else. I beg you. The blade cannot even harm the living, you will still protect life, it's only the undead that may be affected by it.~
==AC#PPEL4 ~I...~
==AC#PPEL4 ~I will let <PRO_HIMHER> take it. You are right, it cannot do harm to living things. But I cannot do more. I won't do more.~
==AC#PPMI ~That should be enough.~
==AC#PPMI ~Myth Unnohyr is now protected by this barrier. I can get you and the blade inside, but you will need to get the barrier down to leave the place. I presume that killing the Wyrd may be your way out.~
==AC#PPMI ~You will also receive the Memory of the Myths. A powerful sword able to hurt even the strongest of undead. It cannot harm the living, things but its spectral blade can hurt the undead.~
==AC#PPMI ~It shall also be your reward. You will be able to use it to slay those like Bodhi.~
END
IF~~THEN REPLY ~We have a deal.~ EXTERN AC#PPMI C6.QUEST.01.05
IF~~THEN REPLY ~I may need to think about this.~ EXTERN AC#PPMI C6.QUEST.01.06
IF~~THEN REPLY ~I'm not interested. Sorry. There are other urgent matters that cannot wait, thus... I need to leave.~ EXTERN AC#PPMI C6.QUEST.01.07

CHAIN AC#PPMI C6.QUEST.01.05
~Wonderful!~
==AC#PPMI ~When you're ready, we'll go with Alatoasz's blessing to our dryad-friend where heroes leave their weapons.~
==AC#PPEL4 ~...~
==AC#PPMI ~I can also hear your discontent, Alatoasz. Anyway, once we have the blade, I will open a gate to Myth Unnohyr. It should take you close enough, but due to the dead and the wild magic, I won't be able to help you more, so prepare yourself as thoroughly as you can.~
==AC#PPMI ~Let me know when you're ready.~
DO ~SetGlobal("AC#PP_MythUnnohyr","GLOBAL",9)~ EXIT

CHAIN AC#PPMI C6.QUEST.01.06
~I see.~
==AC#PPMI ~If you decide to help, we'll go with Alatoasz's blessing to our dryad-friend where heroes leave their weapons.~
==AC#PPEL4 ~...~
==AC#PPMI ~I can also hear your discontent, Alatoasz. So, <CHARNAME>, if you decide to help, I will open a gate to Myth Unnohyr, but due to the dead and the wild magic, I won't be able to help you more. If you decide the reward is tempting, or your morality get to you, come to me, and we should start our mission.~
DO ~SetGlobal("AC#PP_MythUnnohyr","GLOBAL",9)~ EXIT

CHAIN AC#PPMI C6.QUEST.01.07
~Mhm.~
==AC#PPMI ~If you change your mind, come to me and let me know. We really need your help.~
DO ~SetGlobal("AC#PP_MythUnnohyr","GLOBAL",9)~ EXIT

//DUSKWOOD DELL CH6 -- 2ND TALK (CLERIC)

CHAIN IF ~Global("AC#PP_MythUnnohyr","GLOBAL",9)~ THEN AC#PPEL4 c6.2nd.c.00
~I knot it may seem strange for someone like you that I am not very optimistic about any of this, but I've seen enough suffering. I will do what I must, but I won't rise my hand. I hope you understand.~
END
IF~~THEN REPLY ~I do.~ EXIT
IF~~THEN REPLY ~I will never understand how you can allow such battles happen while you're here, in your little hideout. Goodbye.~ EXIT

//HIGH RANGER

CHAIN IF ~Global("AC#PP_MythUnnohyr","GLOBAL",9)~ THEN AC#PPMI C6.QUEST.02.00
~Are you ready to face the wyrd? If so, we should go for the sword Hight Priest allowed us to take and I shall send you inside Myth Unnohyr.~
END
IF~~THEN REPLY ~I'm ready.~ EXTERN AC#PPMI C6.QUEST.02.01
IF~~THEN REPLY ~I'm not ready yet. Let me take care of something else first.~ EXIT

CHAIN AC#PPMI C6.QUEST.02.01
~Good. Follow me.~
DO ~StartCutScene("AC#PP6C1")~ EXIT

BEGIN AC#PPWYR

//1ST FIGHT

CHAIN IF ~Global("AC#PPChapter6Quest","GLOBAL",2)~ THEN AC#PPWYR 1.00
~** I sensed someone meddling with my minions, in my stronghold! **~
END
IF~~THEN REPLY ~Your stronghold? You are just making it more dangerous. More... dead.~ EXTERN AC#PPWYR 1.01
IF~~THEN REPLY ~You must be the wyrd I heard about. You took over the body of an elf; of a hero that did all she could to defend this place.~ EXTERN AC#PPWYR 1.01
IF~~THEN REPLY ~Well, I heard there is some new monster trying to turn this place into its base, so I came. I wouldn't want to miss all the fun.~ EXTERN AC#PPWYR 1.01

CHAIN AC#PPWYR 1.01
~** Just look at you. You think you can match my power? **~
==AC#PPWYR ~** Believe me or not, but I am an ancient being. I saw the world crumble. I saw it being rebuilt. I've seen all that there is, the rot, the destruction, death, power, fear... and life. And I came, to be part of this. **~
==AC#PPWYR ~** This elf—oh, how she loved this place. And that's why I chose it. So we—me and her—could see this place together. So we could take all the dead parts of it, and build a new enclave. Wild. Dead. And yet... alive. **~
==AC#PPWYR ~** And I know you've been here before. Even then I was already humming my silent song! Lured the poisonous. Lured the wild. Lured the rotten roots. All these things weave so well with the wicked energied engraved in Myth Unnohyr's stones and walls. **~
END
IF~~THEN REPLY ~So you knew about the Talonite that made his base here? And you lured the monsters that came here?~ EXTERN AC#PPWYR 1.02
IF~~THEN REPLY ~It looks like some's been one busy wyrd!~ EXTERN AC#PPWYR 1.03

CHAIN AC#PPWYR 1.02
~** Partially. All these things were here. I just hummed my song. **~
EXTERN AC#PPWYR 1.03

CHAIN AC#PPWYR 1.03
~** You may think that what I am doing here is... evil. Oh, you living things love that word. You want to call thing evil. Wrong. Bad. But I am none of these things. I am ancient. I am above all of this. **~
==AC#PPWYR ~** However, some could say that I am hungry. Just as hungry as Myth Unnohyr and the earth below it! It's already swallowed part of this place before. This time, however, we will feed on dreams, and hopes, and life and... those that dared to came. And it looks like you are on that list. **~
END
IF~~THEN REPLY ~You won't win this.~ EXTERN AC#PPWYR 1.04
IF~~THEN REPLY ~I came armed. You're not going to defeat me, monsters. I shall be your doom.~ EXTERN AC#PPWYR 1.04
IF~~THEN REPLY ~I suppose it was a mistake to come here. Let me leave. I'm not going to fight you. I changed my mind.~ EXTERN AC#PPWYR 1.05

CHAIN AC#PPWYR 1.04
~** Do not make promises that you are unable to hold. **~
EXTERN AC#PPWYR 1.06

CHAIN AC#PPWYR 1.05
~** No. It's too late for you. You will be consumed by us. By this place. Your bones will become part of it. **~
EXTERN AC#PPWYR 1.06

CHAIN AC#PPWYR 1.06
~** Some here. Let's test your weapons and will. Hahaha! **~
DO ~SetGlobal("AC#PPChapter6Quest","GLOBAL",3) CreateCreature("AC#PPSPI",[3730.420],1) CreateVisualEffect("SPFLESHS",[3730.420]) CreateCreature("AC#PPSPI",[3900.490],1) CreateVisualEffect("SPFLESHS",[3900.490]) Enemy()~ EXIT

//2ND TALK - HURT 

CHAIN IF ~Global("AC#PPChapter6Quest","GLOBAL",4)~ THEN AC#PPWYR 2.00
~** You are putting a lot of effort in all of this. It's almost impressive. But this place is mine, and I shall leave just as long as the half-dead and half-wild nature of this place. **~
==AC#PPWYR ~** My beautiful symbiotes link me to this place. You cannot defeat me, but—I encourage you to try. I want to see you tired. I want to see you lose all hope. **~
END
IF~~THEN REPLY ~Symbiotes?~ EXTERN AC#PPWYR 2.01
IF~~THEN REPLY ~I will find some way to destroy you!~ EXTERN AC#PPWYR 2.02

CHAIN AC#PPWYR 2.01
~** Well, everyone has their ways to control the flow of power. And they are mine. But that knowledge will give you nothing. I am too powerful for you, with or without them! **~
EXTERN AC#PPWYR 2.03

CHAIN AC#PPWYR 2.02
~** You are clearly a dreamer, haha! **~
EXTERN AC#PPWYR 2.03

CHAIN AC#PPWYR 2.03
~** I shall watch how you struggle. Remember that. Go. Do you best. And let me enjoy the spectacle, little one. **~
DO ~SetGlobal("AC#PPChapter6Quest","GLOBAL",5) StartCutSceneMode() Wait(1) ScreenShake([20.45],15) Wait(2) EndCutSceneMode() DestroySelf()~ EXIT

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
==AC#PPHEL ~But the rose is still there...! I can feel it. Under one of the bodied! You might have missed it, most did, as he had it under his vest, he wanted to protect it from all the chaos that befell our home...~
==AC#PPHEL ~Search the bodies above us... Find the body of my son and take the rose to the temple of Mythrien, in the very heart of our city, near the magic passage that brought you here. You had to alk through that place.~
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
DO ~SetGlobal("AC#PPChapter6Quest","GLOBAL",17) SetGlobal("AC#PPFixMagic","GLOBAL",1) CreateVisualEffect("SPPORTAL",[710.705]) DestroySelf()~ EXIT

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
