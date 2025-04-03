
// Dialogue sidechars in Duskwood Dell

// dryad in area acpp06 (Eldath's Peace Grotto):
BEGIN ~AC#PPDR1~

CHAIN IF ~True()~ THEN AC#PPDR1 hello_01
~Greetings, <RACE>. Have you come to lay down your arms and receive the blessing of the Goddess?~ 
END
IF~~THEN REPLY ~What is this place?~ EXTERN AC#PPDR1 what_place
IF~~THEN REPLY ~I think I'll be going now.~ EXTERN AC#PPDR1 bye
IF~Global("AC#PPSirineQuest","GLOBAL",1) Global("AC#PPSirineQuest_d","GLOBAL",0)~THEN REPLY ~I met this sirine outside. She's so full of anger. I'm sure you too had to find a way to live here, and with your goal here, it seems like you value peace and calmness of the soul. Do you know how may I help her?~ EXTERN AC#PPDR1 hello_s_00

	CHAIN IF ~~ THEN AC#PPDR1 what_place
	~Here, many brave warriors have chosen to abandon their trade and follow the path of peace instead. Do you see the many weapons? Each one once belonged to a soul whose life was shaped by war and bloodshed—until they laid down their arms here and chose a different path.~ 
	END
	IF~~THEN REPLY ~I think I'll be going now.~ EXTERN AC#PPDR1 bye
	IF~Global("AC#PPSirineQuest","GLOBAL",1) Global("AC#PPSirineQuest_d","GLOBAL",0)~THEN REPLY ~I met this sirine outside. She's so full of anger. I'm sure you too had to find a way to live here, and with your goal here, it seems like you value peace and calmness of the soul. Do you know how may I help her?~ EXTERN AC#PPDR1 hello_s_00

	CHAIN IF ~~ THEN AC#PPDR1 bye
	~Peace to you, traveler. May your path be soft beneath your feet.~
	DO ~~ EXIT
	
	CHAIN AC#PPDR1 hello_s_00
	~I think it's different for everyone. I had to leave my trusted dagger here, on this pile. Others find peace in these little things. The way you speak of her—it feels like she may need to give up.~
	END
	IF~~THEN REPLY ~Give up?~ EXTERN AC#PPDR1 hello_s_01
	IF~~THEN REPLY ~What sort of stupid idea is that?~ EXTERN AC#PPDR1 hello_s_01
	
CHAIN AC#PPDR1 hello_s_01
~It sounds as if there was still some sort of fight inside of her. And it's going to lose until one part of her looses. Perhaps she needs to accept that despire she's a sirine, there is a burning fire inside her, and it's not going to disappear.~
==AC#PPDR1 ~I hope she can accept it and perhaps, at least that fire won't hurt her so much. Maybe it will become... acceptable. I wish I could give you something more, but—~
==AC#PPDR1 ~—wait. Maybe there is something. I mentined that she may need to enjoy little things. Perhaps help her with our special brew. There's some chamomile, wild honey, blackberry and some lavender. And ask her to let her accept that there are things she may feel angry about. That may be a first step to becoming more calm.~
==AC#PPDR1 ~Truth be told, though, she needs to let her feel that tranquility. Without that step, no brew, no book and no god is going to help her.~
DO ~SetGlobal("AC#PPSirineQuest_d","GLOBAL",1) GiveItemCreate("AC#PPTEA",Player1,1,1,0)~ EXIT

// honey-making orc in area acpp07:
BEGIN ~AC#PPON2~

CHAIN IF ~RandomNum(4,1)~ THEN AC#PPON2 hello_01
~Hive teaches us: Work in silence, guard the sweet, sting only when you must.~ 
EXIT

CHAIN IF ~RandomNum(4,2)~ THEN AC#PPON2 hello_02
~War leaves wounds. Honey heals 'em. Eldath knew what she was doin’ when she made bees.~ 
EXIT

CHAIN IF ~RandomNum(4,3)~ THEN AC#PPON2 hello_03
~Takes patience to make peace... just like good honey. Can’t rush the bees, can’t rush the fighters.~ 
EXIT

CHAIN IF ~RandomNum(4,4)~ THEN AC#PPON2 hello_04
~May your anger melt like wax, and may your words be sweet as summer honey.~ 
EXIT

// Ondonti orcs in pumpkin area acpp05:
BEGIN ~AC#PPON1~
CHAIN IF ~True()~ THEN AC#PPON1 hello_again
~Peace be your weapon.~ 
EXIT

BEGIN ~AC#PPON3~

CHAIN IF ~True()~ THEN AC#PPON3 hello_again
~Quiet hands, quiet heart, <RACE>.~ 
END
IF~~THEN REPLY ~An orc! I’ll take your head off!~ EXTERN AC#PPON3 orc_fight
IF~~THEN REPLY ~Didn’t expect to see someone like you here.~ EXTERN AC#PPON3 orc_not_expecting
IF~~THEN REPLY ~I think I’ll leave you to your work.~ EXTERN AC#PPON3 bye
IF~Global("AC#PPWormQuest","GLOBAL",1) Global("AC##PPWormQuestOrc","GLOBAL",0)~THEN REPLY ~It looks like there's a lot of dirt around and it's somewhat humid—I'm looking for a earthworm. I know it sounds strange, but maybe you've seen one around?~ EXTERN AC#PPON3 hello_worm

	CHAIN IF ~~ THEN AC#PPON3 orc_fight
	~No! Don’t fight!~ 
	END
	IF~~THEN EXTERN AC#PPON3 orc_not_expecting

	CHAIN IF ~~ THEN AC#PPON3 orc_not_expecting
	~I am Peacefang. I follow Eldath. Left behind the wicked gods of my kin. I live in peace—with others, with the land.~ 
	END
	IF~~THEN REPLY ~And I’m supposed to believe that?~ EXTERN AC#PPON3 orc_believe
	IF~~THEN REPLY ~Then I’ll let you get back to your work.~ EXTERN AC#PPON3 bye
	IF~Global("AC#PPWormQuest","GLOBAL",1) Global("AC##PPWormQuestOrc","GLOBAL",0)~THEN REPLY ~It looks like there's a lot of dirt around and it's somewhat humid—I'm looking for a earthworm. I know it sounds strange, but maybe you've seen one around?~ EXTERN AC#PPON3 hello_worm

	CHAIN IF ~~ THEN AC#PPON3 orc_believe
	~Yes. I only lift axe to split pumpkin now. Pumpkin harder to split than human head! But Peacefang doesn’t mind the work.~ 
	END
	IF~~THEN REPLY ~Then I’ll let you get back to your work.~ EXTERN AC#PPON3 bye
	IF~Global("AC#PPWormQuest","GLOBAL",1) Global("AC##PPWormQuestOrc","GLOBAL",0)~THEN REPLY ~It looks like there's a lot of dirt around and it's somewhat humid—I'm looking for a earthworm. I know it sounds strange, but maybe you've seen one around?~ EXTERN AC#PPON3 hello_worm

	CHAIN IF ~~ THEN AC#PPON3 bye
	~Keep axe sharp! For chopping pumpkin.~ 
	DO ~~ EXIT
	
	CHAIN  AC#PPON3 hello_worm
	~You need worm? Hmm. If you need worm, then me give you worm. Nice, hmm? Here. You may take it.~
	== AC#PPON3 ~Bye bye, worm.~
	DO ~GiveItemCreate("AC#PPWRM",Player1,1,1,0) SetGlobal("AC##PPWormQuestOrc","GLOBAL",1)~ EXIT

	
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////

BEGIN AC#PPCHA
BEGIN AC#PPCAA

//1st talk

CHAIN IF ~Global("AC#PPFlowerDelivery","GLOBAL",0)~ THEN AC#PPCHA 01.00
~Excuse me. You are the person that helped our High Priest, yes? I thought that—that maybe you could help me too.~
END
IF~~THEN REPLY ~It depends on what do you need.~ EXTERN AC#PPCHA 01.01
IF~~THEN REPLY ~I have no time on helping boys that do not even shave themselves yet. Get lost.~ EXTERN AC#PPCHA 01.02

CHAIN AC#PPCHA 01.01
~You see, it was recently that I run away from home. I... I just couldn't live the life I was expected to live! My parents—they're dead, and I've been living with my Aunt Pesca, and she's just so—demanding! Agh!~
==AC#PPCHA ~I'm sorry, as you can see, it's still very difficult to me. The thing is that I realized that I should have left her a note or something. I dislike that life she prepared for me, but running away without telling her anything... well, that's somewhat harsh, isn't it? Perhaps even unfair.~
==AC#PPCHA ~I cannot return there, she would try to keep me, so I would like someone to take this flower and deliver it to her and tell her that I am alright, and maybe we will see again, when I am grown man and I find my own path I would like to follow.~
==AC#PPCHA ~She's living in Athkatla. In the Government District. She usually goes on a walks. Could you do me a favor and give her this flower and pass her the message? Please?~
END
IF~~THEN REPLY ~Fine. I'll do it.~ EXTERN AC#PPCHA 01.03
IF~~THEN REPLY ~I don't have time for such things. Get lost.~ EXTERN AC#PPCHA 01.02

CHAIN AC#PPCHA 01.03
~Oh, thank you so much! Here! Give it to her. She usually goes on the walks, but she never leaves the district. She calls it her whole world.~
==AC#PPCHA ~Please, let me know once you do that. I'd truly appreciate this.~
DO ~GiveItemCreate("AC#PPFLW",Player1,1,1,0) SetGlobal("AC#PPFlowerDelivery","GLOBAL",1)~ EXIT

CHAIN AC#PPCHA 01.02
~Y-yes. of course. I'm... I'm sorry I bothered you.~
DO ~EscapeArea()~ EXIT

//2nd talk

CHAIN IF ~OR(3) Global("AC#PPFlowerDelivery","GLOBAL",1) Global("AC#PPFlowerDelivery","GLOBAL",2) Global("AC#PPFlowerDelivery","GLOBAL",3)~ THEN AC#PPCHA 02.00
~I really hope my aunt will understand I needed to breath. That I needed something else than she does.~
END
IF~Global("AC#PPFlowerDelivery","GLOBAL",2)~THEN REPLY ~I passed your message and gave the flower to your aunt. She suggested that maybe in a while you should give her some flowers on your own.~ EXTERN AC#PPCHA 02.01
IF~Global("AC#PPFlowerDelivery","GLOBAL",3)~THEN REPLY ~I passed your message and gave the flower to your aunt. I'm not surprised you run away. She is a horrible person.~ EXTERN AC#PPCHA 02.02
IF~~THEN REPLY ~Right.~ EXIT

CHAIN AC#PPCHA 02.01
~What?! She really said that? Well, that's... unexpected.~
EXTERN AC#PPCHA 02.03

CHAIN AC#PPCHA 02.02
~Well, she's not THAT bad. I mean... she can be nice sometimes.~
EXTERN AC#PPCHA 02.03

CHAIN AC#PPCHA 02.03
~Anyway, thank you for helping me! It's really nice of you. Now, that I know she knows I'm alright, it will be easier for me to focus on what's really important! Like... Huh. Well. I still need to figure that out.~
==AC#PPCHA ~Anyway, thanks! You're cool.~
DO ~SetGlobal("AC#PPFlowerDelivery","GLOBAL",4) AddExperienceParty(1800)~ EXIT

//AFTER

CHAIN IF ~Global("AC#PPFlowerDelivery","GLOBAL",4)~ THEN AC#PPCHA 03.00
~Oh! Hi! You look cool with all that stuff you probably found in some dungeon or something. Maybe I should try something like that one day. But I guess I may need to work out a bit first.~
EXIT

////////////////////////////////////////////

CHAIN IF ~Global("AC#PPFlowerDelivery","GLOBAL",1)~ THEN AC#PPCAA 01.00
~Who are you? Agh, I'm not in the mood for talks with some vagabonds. Leave me be, please.~
END
IF~PartyHasItem("AC#PPFLW")~THEN REPLY ~Ah, I think it's you I've been looking for. I talked to your nephew. He run away from you, because he needs to learn what it means to be alive and to make decisions. But he wants you to know that he's fine and he wanted me to give you that flower.~ DO ~TakePartyItem("AC#PPFLW") DestroyItem("AC#PPFLW")~ EXTERN AC#PPCAA 01.01
IF~~THEN REPLY ~Right. I guess I just won't trouble you then.~ EXIT 

CHAIN AC#PPCAA 01.01
~What?! He's alive and—I thought he's dead! Like his damn parents! How could he do something like that to me?! That... ungrateful brat!~
==AC#PPCAA ~I took care of him, gave him everything I could, protected him from everyone!~
END
IF~~THEN REPLY ~I see. Well, that may be part of the problem.~ EXTERN AC#PPCAA 01.02
IF~~THEN REPLY ~Look, lady, I'm just delivering a message. He's fine, and the two of you will probably meet again once. That's all you need to know. Bye.~ EXTERN AC#PPCAA 01.03

CHAIN AC#PPCAA 01.02
~Excuse me?!~
END
IF~~THEN REPLY ~He wants to live. He wants to make decision. He wants to see how it feels. He understands you want what you think is best for him, but he wants to find what's best for him on his own.~ EXTERN AC#PPCAA 01.04
IF~~THEN REPLY ~Look, lady, I'm just delivering a message. He's fine, and the two of you will probably meet again once. That's all you need to know. Bye.~ EXTERN AC#PPCAA 01.03

CHAIN AC#PPCAA 01.04
~And can't he dou that here? We've got everything we need in here. Just look at the architecture, and it's safe—well, safer than he will ever be—wherever he is.~
END
IF~~THEN REPLY ~He is fine. Just give him some time. Let him grow up. Break his leg. Learn new things.~ EXTERN AC#PPCAA 01.05
IF~~THEN REPLY ~Look, lady, I'm just delivering a message. He's fine, and the two of you will probably meet again once. That's all you need to know. Bye.~ EXTERN AC#PPCAA 01.03

CHAIN AC#PPCAA 01.05
~I...~
END
IF~~THEN REPLY ~He's doing fine. Focus on that.~ EXTERN AC#PPCAA 01.06
IF~~THEN REPLY ~Look, lady, I'm just delivering a message. He's fine, and the two of you will probably meet again once. That's all you need to know. Bye.~ EXTERN AC#PPCAA 01.03

CHAIN AC#PPCAA 01.06
~Fine. But tell him that... that next time he'd better just come on his own and give me some flowers! That... stipid... wonderful brat. Agh!~
DO ~SetGlobal("AC#PPFlowerDelivery","GLOBAL",3) EscapeArea()~ EXIT

CHAIN AC#PPCAA 01.03
~Humph! Just... just go already, will you?!~
DO ~SetGlobal("AC#PPFlowerDelivery","GLOBAL",2) EscapeArea()~ EXIT

////////////////////////////////////////////////////////
////////////////////////////////////////////////////////

BEGIN AC#PPBOY

//1st

CHAIN IF ~Global("AC#PPWormQuest","GLOBAL",0)~ THEN AC#PPBOY 01.00
~Hey! You've got worms?~
END
IF~~THEN REPLY ~No, I'm of very good health.~ EXTERN AC#PPBOY 01.01
IF~~THEN REPLY ~Erm, I don't think so. Sorry.~ EXTERN AC#PPBOY 01.02
IF~~THEN REPLY ~I'm not even going to answer that question. Goodbye.~ EXIT

CHAIN AC#PPBOY 01.01
~What—ew! It's not what I meant!~
EXTERN AC#PPBOY 01.03

CHAIN AC#PPBOY 01.02
~Oh... okay. A pity, though.~
EXTERN AC#PPBOY 01.03

CHAIN AC#PPBOY 01.03
~I REALLY want to catch some good fish and show everyone what a good fisher-boy I can be! But I need a nice fat worm to do that! Let me know if you find one!~
==AC#PPBOY ~There must be some worm around here...~
DO ~SetGlobal("AC#PPWormQuest","GLOBAL",1)~ EXIT

//2nd 

CHAIN IF ~Global("AC#PPWormQuest","GLOBAL",1)~ THEN AC#PPBOY 02.00
~Eh, still no luck with all that worm-hunting job. Seriously, how hard it can be. Where are all the worms when a man needs one! I've looked everywhere.~
END
IF~PartyHasItem("AC#PPWRM")~ THEN REPLY ~Guess what! I've got a worm for you.~ DO ~TakePartyItem("AC#PPWRM") DestroyItem("AC#PPWRM")~ EXTERN AC#PPBOY 02.01
IF~~THEN REPLY ~Patience. You'll find it, I feel it my guts.~ EXIT

CHAIN AC#PPBOY 02.01
~You do?! That's amazing!~
==AC#PPBOY ~Just look how big it is! And how pink! And he moves in such a funny way!~
==AC#PPBOY ~Sorry, but I'll need to put you on the hook now. I really hope it's not gonna hurt you that much.~
==AC#PPBOY ~...~
==AC#PPBOY ~...erm...~
==AC#PPBOY ~Oh shoot. I cannot just kill him. He looks so nice. And I... I just wanna call him "Noodle" and teach him tricks!~
==AC#PPBOY ~You were supposed to be a fish food!~
END
IF~~THEN REPLY ~It looks like you just like him too much.~ EXTERN AC#PPBOY 02.02
IF~~THEN REPLY ~Ugh, I'm tired with this. (take the worm and throw it into the water)~ EXTERN AC#PPBOY 02.03

CHAIN AC#PPBOY 02.02
~I kinda do.~
==AC#PPBOY ~Eh, I suppose I won't become a fisher-boy, then. But you know what? I can become a worm-trainer!~
==AC#PPBOY ~Thanks for bringing him to me. I think we're gonna be good friends.~
DO ~SetGlobal("AC#PPWormQuest","GLOBAL",2) AddExperienceParty(800) ReputationInc(1)~ EXIT

CHAIN AC#PPBOY 02.03
~What?! What have you done! You are sooo stupid and I'm gonna tell everyone you're horrible and that you wanted to hit me! And no one is going to like you! EVER!~
DO ~SetGlobal("AC#PPWormQuest","GLOBAL",3) AddExperienceParty(800) ReputationInc(-1) EscapeArea()~ EXIT

//3rd

CHAIN IF ~Global("AC#PPWormQuest","GLOBAL",2)~ THEN AC#PPBOY 03.00
~Hey! You know what? I taught Noodle a new trick! Maybe I'm gonna show you next time.~
EXIT

////////////////////////////////////////////////////////
////////////////////////////////////////////////////////

BEGIN AC#PPMON

CHAIN IF ~OR(2) Global("AC#PPSymbolQuest","GLOBAL",0) Global("AC#PPSymbolQuest","GLOBAL",1)~ THEN AC#PPMON 01.00
~Eldath protect you my friend...~
END
IF~Global("AC#PPSymbolQuest","GLOBAL",1) PartyHasItem("AC#PPSYM")~THEN REPLY ~I remember you have these problems with making the emblem of Eldath. I think you deserve this. Here. I got it for you.~ EXTERN AC#PPMON 01.03
IF~~THEN REPLY ~You seem somewhat sad. Is something wrong?~ DO ~SetGlobal("AC#PPSymbolQuest","GLOBAL",1)~ EXTERN AC#PPMON 01.01
IF~~THEN REPLY ~How do you like this place, priestess? Duskwood Dell seems like a tranquil enclave in a troubled world.~ EXTERN AC#PPMON 01.02
IF~~THEN REPLY ~Mhm. Whatever. I need to go.~ EXIT
IF~~THEN REPLY ~Mhm. Have a wonderful day, my friend.~ EXIT  

CHAIN AC#PPMON 01.01
~It's just... Well, I've been here for month, and other brothers and sisters, and all the visitors are very nice. I believe this is the place where I should be.~
==AC#PPMON ~The next step of my spiritual journey was creating the emblem of Eldath myself. I wanted to carve it in wood, but I'm no longer young. And while I do all I can, I have this ailment that results in numbness in my hands and fingers. I've been trying to make this symbol, but I just fail over and over again.~
==AC#PPMON ~I'll keep trying, but I fear that this task may be too difficult for me and—I'm sorry. I'm sure you have heard such stories a million times. There's nothing you can do about this.~
==AC#PPMON ~Now tell me, is there anything else you need?~
END
IF~Global("AC#PPSymbolQuest","GLOBAL",1) PartyHasItem("AC#PPSYM")~THEN REPLY ~I think you deserve this. Here. I got it for you. The emblem of Eldath.~ EXTERN AC#PPMON 01.03
IF~~THEN REPLY ~How do you like this place, priestess? Duskwood Dell seems like a tranquil enclave in a troubled world.~ EXTERN AC#PPMON 01.02
IF~~THEN REPLY ~No. I need to go, I'm done listening to your babbling.~ EXIT
IF~~THEN REPLY ~No. Have a wonderful day, my friend.~ EXIT  

CHAIN AC#PPMON 01.02
~Yes. This place is so quiet. I've been tired with all the noise and here—here it's mostly the sound of sea, of leaves, creaking of the trees as they dance when the wind is stronger. Squirrels, birds... we even have a moose here. He's a nice fella... Mhm...~
END
IF~Global("AC#PPSymbolQuest","GLOBAL",1) PartyHasItem("AC#PPSYM")~THEN REPLY ~I remember you have these problems with making the emblem of Eldath. I think you deserve this. Here. I got it for you.~ EXTERN AC#PPMON 01.03
IF~~THEN REPLY ~Yet I can hear some sadness in your voice. Is something wrong?~ DO ~SetGlobal("AC#PPSymbolQuest","GLOBAL",1)~ EXTERN AC#PPMON 01.01
IF~~THEN REPLY ~Right. Whatever. I need to go.~ EXIT
IF~~THEN REPLY ~Thank you for telling me this. Have a wonderful day, my friend, I need to go.~ EXIT  

CHAIN AC#PPMON 01.03
~I don't know what to say. On one hand, I wanted to do this on my own, but on the other hand—it looks amazing.~
END
IF~~THEN REPLY ~Well, the decision is your. Just do whatever you think is right.~ EXTERN AC#PPMON 01.04
IF~~THEN REPLY ~Keep it. If your hands get better, you will make a new emblem. But until then, you should have this one. You deserve it.~ EXTERN AC#PPMON 01.04

CHAIN AC#PPMON 01.04
~Thank you. And—I know it belonged to the Hight Priest. I need to go and thank him.~
==AC#PPMON ~I feel you also deserve something, a reward. I... I found this on my way here, near some old forest ruins. I'm not sure what it is, but you should have it. Perhaps you'll find a way to fix this.~
==AC#PPMON ~Goodbye.~
DO ~GiveItemCreate("AC#PPEL1",Player1,1,0,0) TakePartyItem("AC#PPSYM") AddExperienceParty(4000) SetGlobal("AC#PPSymbolQuest","GLOBAL",2) EscapeArea()~ EXIT

CHAIN IF ~Global("AC#PPSymbolQuest","GLOBAL",2)~ THEN AC#PPMON 02.00
~I told our priest that I am thankful for the emblem you gave me. He offered he could teach me and I said yes.~
==AC#PPMON ~I must say I feel proud of myself. I am happy that I've decided to come here. And I am also grateful that I met you, my friend.~
EXIT

////////////////////////////////////////////////////////
////////////////////////////////////////////////////////

////////////////////////////////////////////////////////
////////////////////////////////////////////////////////

BEGIN AC#PPSIR

CHAIN IF ~Global("AC#PPSirineQuest","GLOBAL",0)~ THEN AC#PPSIR 01.00
~Argh!!!~
END
IF~~THEN REPLY ~Well, it looks like someone's angry.~ DO ~SetGlobal("AC#PPSirineQuest","GLOBAL",1)~ EXTERN AC#PPSIR 01.01
IF~~THEN REPLY ~I... I think I'll leave you be.~ EXIT

CHAIN AC#PPSIR 01.01
~Well, of course I'm angry! Haven't yu realized that this is all like some huge mess?!~
==AC#PPSIR ~People are killing each other. Or they are killing themselves. There are wars, people act like—like they were just a bunch of fools!~
==AC#PPSIR ~I came here, because my people were fighting pirates lately. I've seen so much death, so much blood. And I feel so angry all the time. I want to take another arrow and just do whatever it takes to finally feel peace!~
==AC#PPSIR ~But I also know I cannot just kill in the name of peace. It feels wrong. That's why I came here, but the anger doesn't leave me. It's still there and I just don't know how to let it go. It's always there, pulsing, drilling, grasping my heart and soul and mind. An I want this to end.~
END
IF~~THEN REPLY ~I'm really sorry to hear that.~ EXTERN AC#PPSIR 01.02
IF~~THEN REPLY ~I don't think I care about this. I think I'll just go.~ EXTERN AC#PPSIR 01.03

CHAIN AC#PPSIR 01.02
~Believe me, I feel sorry, too. And I'm feeling so damn... angry.~
DO ~SetGlobal("AC#PPSirineQuest","GLOBAL",1)~ EXIT

CHAIN AC#PPSIR 01.03
~Go then. Leave. The sooner, the better.~
DO ~SetGlobal("AC#PPSirineQuest","GLOBAL",1)~ EXIT

//2nd 

CHAIN IF ~Global("AC#PPSirineQuest","GLOBAL",1)~ THEN AC#PPSIR 02.00
~Argh!!!~
END
IF~~THEN REPLY ~I'll just leave you be.~ EXIT
IF~PartyHasItem("AC#PPTEA")~THEN REPLY ~I consulted with another person from the Duskwood Dell and she suggested that you should try and accept that there may be some anger with you. Look, we all feel angry, even those priests and people in Duskwood Dell. It's not going to disappear, but maybe let yourself rest. Drink this tea with me. Please.~ EXTERN AC#PPSIR 02.01

CHAIN AC#PPSIR 02.01
~Tea?! You're giving me... tea?!~
END
IF~~THEN REPLY ~Let's at least try, hmm?~ EXTERN AC#PPSIR 02.02
IF~~THEN REPLY ~Oh? And do you have a better idea?~ EXTERN AC#PPSIR 02.02
IF~~THEN REPLY ~Just do whatever you want. I tried to help you, but maybe you're just not ready to feel better.~ EXTERN AC#PPSIR 02.02

CHAIN AC#PPSIR 02.02
~Agh, fine. Just give me that.~
DO ~TakePartyItem("AC#PPTEA") DestroyItem("AC#PPTEA")~
==AC#PPSIR ~So I should drink this and what? It's going to help?~
END
IF~~THEN REPLY ~I think it's a start.~ EXTERN AC#PPSIR 02.03
IF~~THEN REPLY ~I think you also need to learn how to enjoy little things. And these moments when people acting like some furious honeybagers and just try to help.~ EXTERN AC#PPSIR 02.04
IF~~THEN REPLY ~I don't know. But it's worth a try, no?~ EXTERN AC#PPSIR 02.05

CHAIN AC#PPSIR 02.03
~Eh...~
EXTERN AC#PPSIR 02.06

CHAIN AC#PPSIR 02.04
~Hmm. That's not easy.~ 
EXTERN AC#PPSIR 02.06

CHAIN AC#PPSIR 02.05
~I suppose it is.~
EXTERN AC#PPSIR 02.06

CHAIN AC#PPSIR 02.06
~I just want it all to be better. And it won't be better if there are so many people playing with power and knowledge they can't even usu properly.~
END
IF~~THEN REPLY ~You are doing all you can. You are trying to be calm. But you need to let yourself feel alright about what you feel and want.~ EXTERN AC#PPSIR 02.07
IF~~THEN REPLY ~It feels like you are still taking an active part in some sort of battle. Perhaps... let it go. Somtimes loosing can make us better.~ EXTERN AC#PPSIR 02.07
IF~~THEN REPLY ~Look, I'm done. Just do whatever you want. I'm leaving.~ DO ~SetGlobal("AC#PPSirineQuest","GLOBAL",3) AddExperienceParty(100)~ EXIT

CHAIN AC#PPSIR 02.07
~I don't know how to do that.~
END
IF~~THEN REPLY ~Then drink. And breath. And perhaps sit down for a bit. The world won't shatter only because you sat down for a moment.~ EXTERN AC#PPSIR 02.08
IF~~THEN REPLY ~You don't want to feel better, then don't. I'm done wasting my time on this. I'm leaving.~ DO ~SetGlobal("AC#PPSirineQuest","GLOBAL",3) AddExperienceParty(100)~ EXIT

CHAIN AC#PPSIR 02.08
~It does feel comfortable.~
END
IF~~THEN REPLY ~Then let yourself sit here for a while. And perhaps one day you will be ready to leave your bow in this chamber over there. People leave there their swords, hammers, bows. Perhaps you can do that, too. When you're ready, of course.~ EXTERN  AC#PPSIR 02.09
IF~~THEN REPLY ~Just enjoy this moment. I'll leave you know. Do not hurry to do anything, just let yourself to have that break.~ EXTERN AC#PPSIR 02.10

CHAIN AC#PPSIR 02.09
~I'll think about this.~
DO ~SetGlobal("AC#PPSirineQuest","GLOBAL",2) AddExperienceParty(1900)~ EXIT

CHAIN AC#PPSIR 02.10
~I'll try.~
DO ~SetGlobal("AC#PPSirineQuest","GLOBAL",2) AddExperienceParty(1900)~ EXIT

//3rd

CHAIN IF ~Global("AC#PPSirineQuest","GLOBAL",2)~ THEN AC#PPSIR 03.00
~(The sirine ignores you. She's just sitting and looking on the horizon.)~
EXIT

CHAIN IF ~Global("AC#PPSirineQuest","GLOBAL",3)~ THEN AC#PPSIR 03.0b
~I don't know why I thought this place would make things better...~
EXIT