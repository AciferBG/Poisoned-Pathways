CHAIN IF ~~ THEN AC#PPEL4 C6.QUEST.01.00
~<CHARNAME>! I'm glad to see you. There are some discussions taking place, I thought I would invite you, friend, as the—well, they involve you, in a way.~
==AC#PPMI ~It does involve <PRO_HIMHER>, just as it should involve you, Alatoasz Berendim.~
==AC#PPEL4 ~ Let me introduce you to High Ranger Mismal Al'Visalle. Once, from Gwaeron's Slumber, but he is now part of Amnian Mielikkians.~
==AC#PPMI ~I'm honored that you want to introduce me well, but we're not gathering here to write biographies, I'm afraid. I wish that were the case, but the matter is somewhat more serious.~
END
IF~~THEN REPLY ~Ah. I can tell that by your tone, High Ranger.~ EXTERN AC#PPMI C6.QUEST.01.01
IF~~THEN REPLY ~I actually came here to ask you for some help Alatoasz.~ EXTERN AC#PPEL4 C6.QUEST.01.02

CHAIN AC#PPMI C6.QUEST.01.01
~There's a reason behind that tone, Child of Bhaal.~
END
IF~~THEN REPLY ~Someone did their homework.~ EXTERN AC#PPMI C6.QUEST.01.03
IF~~THEN REPLY ~Child of Bhaal? I don't know what you are talking about.~ EXTERN AC#PPMI C6.QUEST.01.03

CHAIN AC#PPEL4 C6.QUEST.01.02
~You will tell me everything in a moment, friend. Let Mismal introduce you to what we have been discussing for a while now.~
EXTERN AC#PPMI C6.QUEST.01.03

CHAIN AC#PPMI C6.QUEST.01.03
~I heard about you and that you helped in a battle against the cleric of Talona. Then, I tried to learn more about you, because I thought I heard your name before. And I did. You stopped a war between Amn and Baldur's Gate. And you saved Cloakwood from the Iron Throne. I must say that's very impressive.~
==AC#PPMI ~I know you were in Myth Unnohyr. It's an odd place, as you know it. It's strange how it seems both dead and alive. But since your last fight there, it has got worse.~
END
IF~~THEN REPLY ~Worse? What do you mean? I got rid of the Talonite. The Malagent.~ EXTERN AC#PPMI C6.QUEST.01.04
IF~~THEN REPLY ~I hoped that the case is closed. Why for all the gods everyone seems to want something from me...?~ EXTERN AC#PPMI C6.QUEST.01.04

CHAIN AC#PPMI C6.QUEST.01.04
~Everything that happened at Myth Unnohyr woke something up. something old.~
==AC#PPMI ~I really don't want to discuss if it's because of the Malagent, because of you, or if it's even because of Talona herself. I do not care. But the evil that woke up in there started spreading. Groves. Forest critters. Dryads. They all had to move away from Myth Unnohyr. It feels like that place tried to swallow trees, ponds, and glades around it.~
==AC#PPMI ~I came here to ask for your help. From the information I gathered, it seems like the power is of undead origin. We suspect a powerful Wyrd, a spirit that took over the dead body of Commander Elv-Esster Aened that fallen the very same place Myth Unnohyr became what it is today.~
END
IF~Global("BodhiDead","GLOBAL",0)~THEN REPLY ~Truth be told, I came here because I wanted to ask for help with another monster. A powerful vampire named Bodhi. She and her brother, Irenicus, must be stopped.~ EXTERN AC#PPMI C6.QUEST.01.04
IF~Global("BodhiDead","GLOBAL",0)~THEN REPLY ~Heh. Funny thing. I'm also trying to stop a powerful vampire. Bodhi. She and her accomplice, Irenicus, are getting out of control.~ EXTERN AC#PPMI C6.QUEST.01.04
IF~Global("BodhiDead","GLOBAL",1)~THEN REPLY ~I actually just killed a powerful vampire. Bodhi. Her brother, Irenicus, should be next.~ EXTERN AC#PPMI C6.QUEST.01.04

CHAIN AC#PPMI C6.QUEST.01.04
~Bodhi? Irenicus? I know these names. I've been to Suldanessellar and I know Elhan. Now that you said all of this—I suspect you know him too.~
==AC#PPMI ~We can help each other. And that's what I've been telling the Hight Priest.~
==AC#PPEL4 ~And I've been trying to tell you brother that Duskwood Dell is a place of peace. We took an active part in stopping the Malagent, but that was in the name of the piece and to obtain the antidote for those that may need it.~
==AC#PPMI ~Peace is a privilege we may not be cannot afford right now, Alatoasz.~
==AC#PPEL4 ~One can always afford peace, Mismal.~
==AC#PPMI ~You see why we cannot push this matter forward, in the direction of a needed solution, <CHARNAME>. Alatoasz doesn't want to be part of this.~
==AC#PPEL4 ~We are pacifist and we've been walking a thin line before. <CHARNAME> helped, we only assisted him. Eldath guided us so we could finally welcome tranquility in our hearts and souls, not to start another war.~
==AC#PPEL4 ~As I told you, we can still help. You can tell everyone that needs to hide, that as long as they can follow our rules, they are welcome here. This may become their sanctuary as well.~
==AC#PPMI ~We may need more than a place to hide.~
==AC#PPMI ~And perhaps we need you, Child of Bhaal.~
END
IF~~THEN REPLY ~Right...~ EXTERN AC#PPMI C6.QUEST.01.04
IF~~THEN REPLY ~I will gladly help. There is a chance the situation at Myth Unnohyr became more complicated because of me.~ EXTERN AC#PPMI C6.QUEST.01.04
IF~~THEN REPLY ~Perhaps you do. The question is if you are ready to provide me with a proper reward in exchange for all the effort I would need to put in this.~ EXTERN AC#PPMI C6.QUEST.01.04

CHAIN AC#PPMI C6.QUEST.01.04
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
DO ~~ EXIT

CHAIN AC#PPMI C6.QUEST.01.06
~I see.~
==AC#PPMI ~If you decide to help, we'll go with Alatoasz's blessing to our dryad-friend where heroes leave their weapons.~
==AC#PPEL4 ~...~
==AC#PPMI ~I can also hear your discontent, Alatoasz. So, <CHARNAME>, if you decide to help, I will open a gate to Myth Unnohyr, but due to the dead and the wild magic, I won't be able to help you more. If you decide the reward is tempting, or your morality get to you, come to me, and we should start our mission.~
DO ~~ EXIT

CHAIN AC#PPMI C6.QUEST.01.07
~Mhm.~
==AC#PPMI ~If you change your mind, come to me and let me know. We really need your help.~
DO ~~ EXIT