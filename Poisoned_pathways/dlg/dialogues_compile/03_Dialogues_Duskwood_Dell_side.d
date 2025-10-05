// Dialogue sidechars in Duskwood Dell

// the two faeries
BEGIN AC#PPFAE

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#PPFAE hello_monster
~^0xFFE3B0FF Lilafern: ^-Look, Tippledew! A tall monster!~
END
IF~~THEN DO ~SetGlobal("AC#PP_TalkedToFaeries","GLOBAL",1)~ EXTERN AC#PPFAE hello_monster_cont

	CHAIN AC#PPFAE hello_monster_cont  
	~^0xFF9ADCE3 Tippledew: ^-Oh hush, Lilafern! It's a traveler, silly! You can always tell by the big ears and the bigger feet.~  
	== AC#PPFAE ~^0xFF9ADCE3 Tippledew: ^-Welcome to Duskwood Dell, wanderer of ripples!~
	END
	IF~~THEN REPLY ~Who are you?~ EXTERN AC#PPFAE who_are_you 
	IF~~THEN REPLY ~Who's speaking there?~ EXTERN AC#PPFAE who_are_you 
	IF~~THEN REPLY ~Just passing through, little ones.~ EXTERN AC#PPFAE Dusklight_Pass

CHAIN AC#PPFAE who_are_you
~^0xFFE3B0FF Lilafern: ^-We are the Dusklight Twins, keepers of night giggles and guardians of… well, nothing terribly important.~  
== AC#PPFAE ~^0xFFE3B0FF Lilafern: ^-Unless you count frogs. We guard frogs sometimes. They’re dreadful conversationalists, though.~  
END
IF~~THEN REPLY ~Guardians of frogs? Truly a sacred calling.~ EXTERN AC#PPFAE Dusklight_Frog
IF~~THEN REPLY ~Yes, but what are you? Two glowing dots?~ EXTERN AC#PPFAE what_are_you_really
IF~~THEN REPLY ~Just passing through, little ones.~ EXTERN AC#PPFAE Dusklight_Pass


CHAIN AC#PPFAE what_are_you_really
~^0xFFE3B0FF Lilafern: ^–We’re faeries, silly! Too small for your eyes, too quick for your hands.~  
== AC#PPFAE ~^0xFF9ADCE3Tippledew: ^–We’ve settled here for a while… until the wind tells us to move on again.~  
END
IF~~THEN EXTERN AC#PPFAE hub
	
  
CHAIN AC#PPFAE hub
~^0xFF9ADCE3 Tippledew: ^-Anyway. Have you come to make a wish, or to chase the moonlight?~ 
END
IF~~THEN REPLY ~Just passing through, little ones.~ EXTERN AC#PPFAE Dusklight_Pass    
IF~~THEN REPLY ~A wish, perhaps… can you really grant one?~ EXTERN AC#PPFAE Dusklight_Wish  
IF~~THEN REPLY ~Stop sparkling near my face, please.~ EXTERN AC#PPFAE Dusklight_Grumpy

	CHAIN AC#PPFAE Dusklight_Grumpy
	~^0xE3B0FFTippledew: ^-Near your face? But your face is so *unsparkly*!~
	== AC#PPFAE ~^0xFFE3B0FF Lilafern: ^-It needs help! Urgent sparkle intervention!~  
	== AC#PPFAE ~^0xFFE3B0FF Lilafern: ^-Come, Tippledew — initiate sparkle retreat protocol!~  
	== AC#PPFAE ~^0xFF9ADCE3 Tippledew: ^-Careful, wanderer… if we stop sparkling near your face, who will keep your dreams from fading?~  
	DO ~ReallyForceSpell(Myself,DO_NOTHING)
	RunAwayFrom(LastTalkedToBy(Myself),30)~ EXIT

	CHAIN AC#PPFAE Dusklight_Wish
	~^0xFF9ADCE3Tippledew: ^-A wish?! Did you hear that, Lilafern? A *wish*!~
	== AC#PPFAE ~^0xFFE3B0FF Lilafern: ^-Quick, where did we put the paperwork? The forms? The regulations on improbable miracles?!~
	== AC#PPFAE ~^0xFF9ADCE3Tippledew: ^-Shh! We’re off duty tonight. Last wish we granted turned a toad into... a slimy toad.~
	== AC#PPFAE ~^0xFFE3B0FF Lilafern: ^-Very confusing for everyone involved.~  
	== AC#PPFAE ~^0xFF9ADCE3Tippledew: ^-But! If you wish for laughter or moonlight, we can manage those. They’re in surplus.~  
	== AC#PPFAE ~^0xFFE3B0FF Lilafern: ^-Anything bigger, and you’ll have to speak with our superior. That’s Eldath, obviously. She’s terrible with scheduling, though.~  
	DO ~ReallyForceSpell(Myself,DO_NOTHING)
	RunAwayFrom(LastTalkedToBy(Myself),30)~ EXIT
	
	CHAIN AC#PPFAE Dusklight_Frog
	~^0xFFE3B0FF Lilafern: ^-Oh yes! Very sacred! Very slimy!~  
	== AC#PPFAE ~^0xFF9ADCE3 Tippledew: ^-We protect them from… well, mostly from needing to kiss the wrong people.~
	== AC#PPFAE ~One traveler tried it once. He wrote poetry. Terrible poetry. Lots of croaking rhymes.~
	== AC#PPFAE ~^0xFF9ADCE3 Tippledew: ^-Now we just keep an eye on them. Someone has to make sure they don’t start a frogolution.~ 
	== AC#PPFAE ~^0xFFE3B0FF Lilafern: ^-Anyway, sacred work. No pay, but excellent splashing privileges.~  
	DO ~ReallyForceSpell(Myself,DO_NOTHING)
	RunAwayFrom(LastTalkedToBy(Myself),30)~ EXIT

	CHAIN AC#PPFAE Dusklight_Pass
	~^0xFFE3B0FF Lilafern: ^-Passing through? Through what? Through *our night*? Through *our perfectly arranged starlight*?~  
	== AC#PPFAE ~^0xFF9ADCE3 Tippledew: ^-We spent *hours* polishing those reflections on the pond!~  
	== AC#PPFAE ~^0xFF9ADCE3 Tippledew: ^-But fine, pass. Tread softly, tall one — the grass remembers footsteps.~  
	== AC#PPFAE ~^0xFFE3B0FF Lilafern: ^-And if you find a dream on the way out, tell it we miss it terribly.~  
	== AC#PPFAE ~^0xFF9ADCE3 Tippledew: ^-Come back when you’re not in such a hurry. We like conversations that wander in circles.~  
	DO ~ReallyForceSpell(Myself,DO_NOTHING)
	RunAwayFrom(LastTalkedToBy(Myself),30)~ EXIT

// Bear telling stories in area ACPP08
BEGIN AC#PP06B // Bear

BEGIN AC#PP06R // Rabbit

CHAIN IF ~True()~ THEN AC#PP06R hello_shut_up
~Big ears, bigger stories. Quiet, please—he’s getting to the good part.~
EXIT

BEGIN AC#PP06S // Squirrel

CHAIN IF ~True()~ THEN AC#PP06S hello_shut_up
~Shhh! If you make noise, I’ll forget where we were in the story—and where I buried my snacks.~
EXIT

BEGIN AC#PP06M // Rat

CHAIN IF ~True()~ THEN AC#PP06M hello_shut_up
~Go away! I’ve got a warm spot, a good story, and no patience for interruptions.~
EXIT

BEGIN AC#PP06G // Groundhog

CHAIN IF ~True()~ THEN AC#PP06G hello_shut_up
~Every story needs quiet to grow, like a root in the soil. You’re stomping on mine.~
EXIT

BEGIN AC#PP06P // Pheasant

CHAIN IF ~True()~ THEN AC#PP06P hello_shut_up
~Please! I’m listening intently. It’s rare to find a bear with such narrative rhythm.~
EXIT

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#PP06B story_01
~And that, little ones, is how the squirrel saved the oak by making the storm cough.~
==AC#PP06R ~That was wonderful! I liked the part where the clouds cried from laughter!~
==AC#PP06S ~You always like the funny bits. I liked when the squirrel tricked the thunder itself.~
==AC#PP06G ~But it wasn’t fair. The beetle didn’t deserve to be squashed like that.~
==AC#PP06P ~I still say the beetle had it coming. Stupid beetle.~
==AC#PP06M ~It’s just a story... or is it? Maybe it really happened once.~
==AC#PP06B ~All stories carry truth, little ones. You must listen with more than ears.~
==AC#PP06R ~With ears like mine, I could hear even the stars whisper!~
==AC#PP06G ~Well, mine aren’t that big, and I’m still listening! Most of the time, anyway...~
==AC#PP06R ~Do you know another one? One with a rabbit in it?~
==AC#PP06B ~Very well. Settle down. This is the tale of the moonlit grove and the rabbit who outran time...~
==AC#PP06P ~Oh, not the time story again...~
==AC#PP06S ~Shhh! I love that one.~
==AC#PP06B ~Long ago, before even the stars had names...~
==AC#PP06M ~Ohh!~
EXIT

CHAIN IF ~NumTimesTalkedTo(1)~ THEN AC#PP06B hello_listen
~Greetings, two-legged creatures. Listen carefully, but don't scare my little ones, will you? I'm telling stories here.~
EXIT

CHAIN IF ~RandomNum(3,1)~ THEN AC#PP06B story_02
~And that, little ones, is how the hedgehog tricked the sun into sleeping late, so the flowers could bloom longer.~
==AC#PP06R ~That hedgehog was so clever! I bet he never gets sunburned.~
==AC#PP06G ~I still think it’s rude to fool the sun. What if it gets angry?~
==AC#PP06S ~Then we’d have night-time all the time! Imagine the nuts I could stash!~
==AC#PP06M ~What did the sun do after? Did it chase the hedgehog?~
==AC#PP06B ~Ah, that is another tale... for another time.~
EXIT

CHAIN IF ~RandomNum(3,2)~ THEN AC#PP06B story_03
~Once, the wind fell in love with a songbird, and followed her so closely it blew all her feathers the wrong way.~
==AC#PP06R ~That's why birds look so messy after a storm! I knew it!~
==AC#PP06S ~Is that why the wind always whistles? Because it’s lonely now?~
==AC#PP06P ~That bird should’ve sung a lullaby. Might’ve calmed the wind down.~
==AC#PP06G ~But what happened to her? Did she fly away?~
==AC#PP06B ~She sang one final note so sweet, the wind carried it across the world. Some say it's still echoing, in the quiet before dawn.~
EXIT

CHAIN IF ~RandomNum(3,3)~ THEN AC#PP06B story_04
~And so, the tiny mouse climbed the old cloud giant’s shoulder—not to conquer him, but to whisper a song into the hollow of his heart.~
==AC#PP06R ~That’s not bravery. That’s foolishness with tiny paws.~
==AC#PP06M ~And what good’s a song against a creature taller than ten trees?~
==AC#PP06G ~It’s not the size of the paws—it’s the sharpness of the note.~
==AC#PP06S ~I once gnawed through a harp string. Does that count?~
==AC#PP06P ~If the giant had stepped on it, there’d be no tale to tell. Just pulp.~
==AC#PP06B ~But the giant did not step. He listened. And in his stillness, the world grew a little kinder.~
EXIT

// Eldathyn that can be angered
BEGIN ~AC#PPMAN~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_0
  SAY ~Welcome, traveler. Few arrive in Duskwood Dell by chance. What brings you beneath these boughs?~
  IF ~~ THEN REPLY ~What is this place?~ GOTO chain_place
  IF ~~ THEN REPLY ~I would like to know more about the Church of Eldath here.~ GOTO chain_church
  IF ~Global("AC#PPSpellCheckPoison","GLOBAL",0)~ THEN REPLY ~I'm looking for your high priest.~ GOTO looking_for_highpriest
  IF~Global("WrongHighPriestName","ACPP01",0)~THEN REPLY ~I'm looking for the Moist Exulted Flailweeper Alabath Bumbleditch.~ DO ~SetGlobal("WrongHighPriestName","ACPP01",1)~ EXTERN AC#PPMAN seek_highpriest_wrong_name
  IF~Global("WrongHighPriestName","ACPP01",1)~THEN REPLY ~I'm still looking for the Moss-Exalting Fallskipper Alatoss Boringdim.~ DO ~SetGlobal("WrongHighPriestName","ACPP01",2)~ EXTERN AC#PPMAN seek_highpriest_wrong_name_2
  IF~Global("WrongHighPriestName","ACPP01",2)~THEN REPLY ~I'm eager trying to find the Moist Exhaling Failsweeper Alatooth Brushdent.~ DO ~SetGlobal("WrongHighPriestName","ACPP01",3)~ EXTERN AC#PPMAN seek_highpriest_wrong_name_3
  IF~Global("WrongHighPriestName","ACPP01",3)~THEN REPLY ~Still no luck locating the Most Exhausted Flatkeeper Alatoast Berrydrink.~ DO ~SetGlobal("WrongHighPriestName","ACPP01",4)~ EXTERN AC#PPMAN seek_highpriest_wrong_name_4
  IF~Global("WrongHighPriestName","ACPP01",4)~THEN REPLY ~My search continues for the Most Inflated Fartsleeper Analoss Bladderbim.~ DO ~SetGlobal("WrongHighPriestName","ACPP01",5)~ EXTERN AC#PPMAN seek_highpriest_wrong_name_5
  IF~Global("AC#PPSpellCheckPoison","GLOBAL",0)~THEN REPLY ~I'm looking for the Most Exalted Fallskeeper Alatoasz Berendim.~ EXTERN AC#PPMAN looking_for_highpriest
  IF ~Global("AC#PPWormQuest","GLOBAL",1) Global("AC##PPWormQuestOrc","GLOBAL",0)~THEN REPLY ~I'm searching for an earthworm. Have you seen one by chance?~ EXTERN AC#PPMAN seek_worm
  IF ~~ THEN REPLY ~This is not the moment for quiet reflection.~ GOTO bye
END

IF ~Global("WrongHighPriestName","ACPP01",10)~ THEN BEGIN hello__10
  SAY ~Before you're asking: You'll find the Most Exalted Fallskeeper Alatoasz Berendim in the northeastern treehouse, near the water. Anything else?~
  IF ~~ THEN REPLY ~Tell me about this place.~ GOTO chain_place
  IF ~~ THEN REPLY ~I would like to know more about the Church of Eldath here.~ GOTO chain_church
  IF ~Global("AC#PPWormQuest","GLOBAL",1) Global("AC##PPWormQuestOrc","GLOBAL",0)~THEN REPLY ~I'm searching for an earthworm. Have you seen one by chance?~ EXTERN AC#PPMAN seek_worm
  IF ~~ THEN REPLY ~This is not the moment for quiet reflection.~ GOTO bye
END

IF ~True()~ THEN BEGIN hello_1
  SAY ~Greetings again. What can I do for you, seeker of peace?~
  IF ~~ THEN REPLY ~Tell me about this place.~ GOTO chain_place
  IF ~~ THEN REPLY ~I would like to know more about the Church of Eldath here.~ GOTO chain_church
  IF ~Global("AC#PPSpellCheckPoison","GLOBAL",0)~ THEN REPLY ~I'm looking for your high priest.~ GOTO looking_for_highpriest
  IF~Global("WrongHighPriestName","ACPP01",0)~THEN REPLY ~I'm looking for the Moist Exulted Flailweeper Alabath Bumbleditch.~ DO ~SetGlobal("WrongHighPriestName","ACPP01",1) SetGlobal("AC#PPWrongPriestName","GLOBAL",1)~ EXTERN AC#PPMAN seek_highpriest_wrong_name
  IF~Global("WrongHighPriestName","ACPP01",1)~THEN REPLY ~I'm still looking for the Moss-Exalting Fallskipper Alatoss Boringdim.~ DO ~SetGlobal("WrongHighPriestName","ACPP01",2)~ EXTERN AC#PPMAN seek_highpriest_wrong_name_2
  IF~Global("WrongHighPriestName","ACPP01",2)~THEN REPLY ~I'm eager trying to find the Moist Exhaling Failsweeper Alatooth Brushdent.~ DO ~SetGlobal("WrongHighPriestName","ACPP01",3)~ EXTERN AC#PPMAN seek_highpriest_wrong_name_3
  IF~Global("WrongHighPriestName","ACPP01",3)~THEN REPLY ~Still no luck locating the Most Exhausted Flatkeeper Alatoast Berrydrink.~ DO ~SetGlobal("WrongHighPriestName","ACPP01",4)~ EXTERN AC#PPMAN seek_highpriest_wrong_name_4
  IF~Global("WrongHighPriestName","ACPP01",4)~THEN REPLY ~My search continues for the Most Inflated Fartsleeper Analoss Bladderbim.~ DO ~SetGlobal("WrongHighPriestName","ACPP01",5)~ EXTERN AC#PPMAN seek_highpriest_wrong_name_5
  IF~Global("AC#PPSpellCheckPoison","GLOBAL",0)~THEN REPLY ~I'm looking for the Most Exalted Fallskeeper Alatoasz Berendim.~ EXTERN AC#PPMAN looking_for_highpriest
  IF ~Global("AC#PPWormQuest","GLOBAL",1) Global("AC##PPWormQuestOrc","GLOBAL",0)~THEN REPLY ~I'm searching for an earthworm. Have you seen one by chance?~ EXTERN AC#PPMAN seek_worm
  IF ~~ THEN REPLY ~This is not the moment for quiet reflection.~ GOTO bye
END

IF ~~ THEN BEGIN bye
  SAY ~May your path be soft beneath your feet, and your spirit undisturbed.~
  IF ~~ THEN EXIT
END

CHAIN IF ~~ THEN AC#PPMAN looking_for_highpriest
~Oh, you're looking for Most Exalted Fallskeeper Alatoasz Berendim? He can be found in one of the trees — the northeastern one, near the water. You'll most likely find him in the canopy, where he discusses difficult matters with the birds of the forest.~
END
  IF ~~ THEN REPLY ~All right. I’ll go find him there.~ GOTO looking_for_highpriest_bye
  IF ~~ THEN REPLY ~Right then. Into the trees we go.~ GOTO looking_for_highpriest_bye
  IF ~~ THEN REPLY ~I have another question.~ GOTO questions

CHAIN IF ~~ THEN AC#PPMAN seek_highpriest_wrong_name
~You must mean the Most Exalted Fallskeeper Alatoasz Berendim. Please do not mock his name—it is a sacred title. You’ll find him in the northeastern treehouse, near the water.~
==MinscJ IF ~InParty("minsc") !StateCheck("minsc",CD_STATE_NOTVALID)~ THEN  ~Strange name for a holy man, but Minsc has heard stranger! Onward to the tree with the water!~
END
  IF ~~ THEN REPLY ~Uh, all right. I’ll go find him there.~ GOTO looking_for_highpriest_bye
  IF ~~ THEN REPLY ~Sorry, I'll be on my way.~ GOTO looking_for_highpriest_bye
  IF ~~ THEN REPLY ~I have another question.~ GOTO questions
  
CHAIN IF ~~ THEN AC#PPMAN seek_highpriest_wrong_name_2
~Sigh. It's Most Exalted Fallskeeper Alatoasz Berendim. Please show some respect—this is a sanctuary, not a tavern full of jesters. You’ll find him in the northeastern treehouse by the water. And try to compose yourself before you speak to him.~
==MinscJ IF ~InParty("minsc") !StateCheck("minsc",CD_STATE_NOTVALID)~ THEN  ~Why are you always asking the same question, <CHARNAME>? We know the priest you’re looking for lives in the tree by the water.~
==JaheiraJ IF ~InParty("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN ~Must you really mock a servant of Eldath? Their patience is not a challenge for your amusement. Show some respect.~
==ViconiJ IF ~InParty("viconia") !StateCheck("viconia",CD_STATE_NOTVALID)~ THEN ~Oh, do go on, <CHARNAME>! I so enjoy watching sanctimonious fools squirm.~
END
  IF ~~ THEN REPLY ~Apologies. I'll head to his tree.~ GOTO looking_for_highpriest_bye
  IF ~~ THEN REPLY ~I’ve fought dragons with fewer names. Anyway, I'll be on my way.~ GOTO looking_for_highpriest_bye
  IF ~~ THEN REPLY ~I have another question.~ GOTO questions
  
  CHAIN IF ~~ THEN AC#PPMAN seek_highpriest_wrong_name_3
	~Most Exalted Fallskeeper Alatoasz Berendim! Not anything else! By the still waters, how hard is that? Show some reverence or the trees themselves might sigh at your ignorance. Go on, you’ll find him by the water’s edge.~ 
	==HAERDAJ IF ~InParty("haerdalis") !StateCheck("haerdalis",CD_STATE_NOTVALID)~ THEN ~To provoke a priest of peace—what melody do you expect, my raven? A scream? A sonnet? There is no drama in still waters.~
	== KeldorJ IF ~InParty("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ THEN ~It is unwise to test the patience of one who has sworn never to lose it. There is no honor in mocking restraint.~
	== DornJ  IF ~InParty("Dorn") !StateCheck("Dorn",CD_STATE_NOTVALID)~ THEN ~A little blasphemy never hurt anyone—except mayhap the pride of pious weaklings.~
	==ViconiJ IF ~InParty("viconia") !StateCheck("viconia",CD_STATE_NOTVALID)~ THEN ~Words sting more than blades, they say. I almost feel sorry for this moss-addled relic. Almost.~
	==KorganJ IF ~InParty("korgan") !StateCheck("korgan",CD_STATE_NOTVALID)~ THEN ~Go on then—let’s see if the priest’ll shed his peaceful skin and bare some teeth!~
	END
  IF ~~ THEN REPLY ~Forgive me, I’m just bad with so many silly—uh, I mean syllables. Bye.~ GOTO looking_for_highpriest_bye
  IF ~~ THEN REPLY ~I have another question.~ GOTO questions
  
   CHAIN IF ~~ THEN AC#PPMAN seek_highpriest_wrong_name_4
	~It's Most Exalted Fallskeeper Alatoasz Berendim! Say it with me: Ber-en-dim! If you can’t manage that, at least keep your lips sealed while you head northeast toward his chambers.~
	== JANJ IF ~InParty("Jan") !StateCheck("Jan",CD_STATE_NOTVALID)~ THEN ~Don’t worry, We’ll just call him Fallsy from now on.~
	== BEDWIN IF ~InParty("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN ~Hah. It takes wit, not war, to make a priest of peace lose his composure. (Naturally, I excel at both.)~
	END
  IF ~~ THEN REPLY ~I meant no offense. Bye.~ GOTO looking_for_highpriest_bye
  IF ~~ THEN REPLY ~Right then. Into the trees we go.~ GOTO looking_for_highpriest_bye
  IF ~~ THEN REPLY ~I have another question.~ GOTO questions

   CHAIN IF ~~ THEN AC#PPMAN seek_highpriest_wrong_name_5
	~That’s enough. You’d do well to use the stillness of this grove to reflect on your behavior!~
	DO ~SetGlobal("WrongHighPriestName","ACPP01",10) ReallyForceSpellRES("AC#PPSC",LastTalkedToBy())~ EXIT
	
	CHAIN IF ~~ THEN AC#PPMAN looking_for_highpriest_bye
	~Do that. He’ll be glad to meet you.~
	EXIT


CHAIN IF ~~ THEN AC#PPMAN seek_worm
~Earthworms? You’d have to dig up the whole sacred ground to find one. No, I’m afraid I can’t help you there.~
END
  IF ~~ THEN REPLY ~I have another question.~ GOTO questions
  IF ~~ THEN REPLY ~That would be all. Farewell.~ GOTO bye

CHAIN IF ~~ THEN AC#PPMAN questions
~You have questions? Gladly! I only hope I have answers you'll like.~
END
IF ~~ THEN REPLY ~Tell me about this place.~ GOTO chain_place
IF ~~ THEN REPLY ~I would like to know more about the Church of Eldath here.~ GOTO chain_church
IF ~Global("AC#PPSpellCheckPoison","GLOBAL",0)~ THEN REPLY ~I'm looking for your high priest.~ GOTO looking_for_highpriest
IF~Global("WrongHighPriestName","ACPP01",0)~THEN REPLY ~I'm looking for the Moist Exulted Flailweeper Alabath Bumbleditch.~ DO ~SetGlobal("WrongHighPriestName","ACPP01",1)~ EXTERN AC#PPMAN seek_highpriest_wrong_name
IF~Global("WrongHighPriestName","ACPP01",1)~THEN REPLY ~I'm still looking for the Moss-Exalting Fallskipper Alatoss Boringdim.~ DO ~SetGlobal("WrongHighPriestName","ACPP01",2)~ EXTERN AC#PPMAN seek_highpriest_wrong_name_2
IF~Global("WrongHighPriestName","ACPP01",2)~THEN REPLY ~I'm eager trying to find the Moist Exhaling Failsweeper Alatooth Brushdent.~ DO ~SetGlobal("WrongHighPriestName","ACPP01",3)~ EXTERN AC#PPMAN seek_highpriest_wrong_name_3
IF~Global("WrongHighPriestName","ACPP01",3)~THEN REPLY ~Still no luck locating the Most Exhausted Flatkeeper Alatoast Berrydrink.~ DO ~SetGlobal("WrongHighPriestName","ACPP01",4)~ EXTERN AC#PPMAN seek_highpriest_wrong_name_4
IF~Global("WrongHighPriestName","ACPP01",4)~THEN REPLY ~My search continues for the Most Inflated Fartsleeper Analoss Bladderbim.~ DO ~SetGlobal("WrongHighPriestName","ACPP01",5)~ EXTERN AC#PPMAN seek_highpriest_wrong_name_5
IF ~Global("AC#PPWormQuest","GLOBAL",1) Global("AC##PPWormQuestOrc","GLOBAL",0)~THEN REPLY ~I'm searching for an earthworm. Have you seen one by chance?~ EXTERN AC#PPMAN seek_worm
IF ~~ THEN REPLY ~I must be going.~ GOTO bye


CHAIN IF ~~ THEN AC#PPMAN chain_church
~Our church is guided by Most Exalted Fallskeeper Alatoasz Berendim, the wisest and most peace-minded of our order. All other priests you see here serve under his guidance. Unlike other faiths, we hold no rigid hierarchy — our belief in nature's harmony unites us and guides our service to the community.~
==AC#PPMAN ~Some priests are occasionally sent out to make the world a more peaceful place. We call them Freewalkers — they travel to places shown to them by our goddess, seeking to ease conflict and end strife. A dangerous path, but a worthy one.~
END
  IF ~~ THEN REPLY ~I have another question.~ GOTO questions
  IF ~~ THEN REPLY ~I should be on my way.~ GOTO bye

CHAIN IF ~~ THEN AC#PPMAN chain_place
~This is Duskwood Dell — a hidden glade nurtured by the faith of Eldath, the goddess of still waters and quiet groves. It is a haven for those who seek peace and balance. Do you wish to know more?~
END
  IF ~~ THEN REPLY ~Yes, tell me more.~ GOTO chain_place_more
  IF ~~ THEN REPLY ~No, I should be on my way.~ GOTO bye

CHAIN IF ~~ THEN AC#PPMAN chain_place_more 
~Duskwood Dell has existed in this forest since time immemorial — when the woods were still young and untouched. The first followers of Eldath settled this glade back then. In the murmuring waters, they first heard the voice of the goddess, and built a sanctuary here in her honor.~
==AC#PPMAN ~They built no walls. The trees have embraced us ever since. We sleep in hammocks between the limbs, our breath shared with wind and leaf.~
==AC#PPMAN ~The waters around us are part of the Green Goddess Falls, sacred cascades that gather in pools at the glade before flowing on as the River Rimril, joining the Trifin Creek and eventually feeding into the Amstel River.~
END
  IF ~GlobalGT("PeaceNPCReaction_MAN","ACPP01",0)~ THEN REPLY ~And what is the purpose of this place?~ GOTO chain_place_more_02
  IF ~Global("PeaceNPCReaction_MAN","ACPP01",0)~ THEN REPLY ~And what is the purpose of this place?~ DO ~SetGlobal("PeaceNPCReaction_MAN","ACPP01",1)~ GOTO chain_place_more_02_NPC
  IF ~~ THEN REPLY ~You've given me much to reflect on. Farewell.~ GOTO bye

CHAIN IF ~~ THEN AC#PPMAN chain_place_more_02_NPC
~The purpose of this place? What purpose does peace need? You will find no temples of carved stone here. Only open sky, and the gentle song of streams below. Peace is the will to let go of burden, blade, and bitterness, and there is no better place to let go.~
== AnomenJ IF ~InParty("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN ~Clinging to peace is cowardice dressed in silk. Helm teaches justice through righteous strength, not passive prayer.~
== CERNDJ IF ~InParty("Cernd") !StateCheck("Cernd",CD_STATE_NOTVALID)~ THEN ~There is beauty in stillness... but refusing to act invites ruin. Even forests must defend themselves.~
== MinscJ IF ~InParty("minsc") !StateCheck("minsc",CD_STATE_NOTVALID)~ THEN ~No fighting? But how will evil learn its lesson? Boo and I are very good teachers!~
== JaheiraJ IF ~InParty("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN ~Peace is a luxury of those not burdened with the world's reality. Nature can be as cruel as it is calm.~
== BEDWIN IF ~InParty("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN ~A stagnant concept for the meek and magicless. Power, not pacifism, shapes the Realms!~
== HEXXATJ IF ~InParty("hexxat") !StateCheck("hexxat",CD_STATE_NOTVALID)~ THEN ~How very mortal. Come back to me when you've been torn apart and still choose kindness.~
== RASAADJ IF ~InParty("RASAAD") !StateCheck("RASAAD",CD_STATE_NOTVALID)~ THEN ~My brothers teach that peace is the goal, not the absence of conflict but the end of it. In this, I think we and the Eldathyn are not so different~
== IMOEN2J IF ~InParty("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN ~The Weave isn’t peaceful. It shifts, it burns, it consumes. Can peace truly last in a world like this?~
== ValygarJ IF ~InParty("valygar") !StateCheck("valygar",CD_STATE_NOTVALID)~ THEN ~You speak of peace like it’s a place we can walk to. But I’ve never seen a road leading to this place.~
== YoshJ IF ~InParty("yoshimo") !StateCheck("yoshimo",CD_STATE_NOTVALID)~ THEN ~Peace is for people who never had to fight for their next breath.~
== MazzyJ IF ~InParty("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN ~Maybe peace isn’t the absence of conflict... just the courage not to feed it.~
END  
  IF ~~ THEN REPLY ~Nice ideals. But I’ve found that peace only follows a blade.~ EXTERN AC#PPMAN peace_dicussion_bye
  IF ~~ THEN REPLY ~Sounds great!~ EXTERN AC#PPMAN peace_dicussion_bye
  IF ~~ THEN REPLY ~Thank you for your insights. I must go.~ EXTERN AC#PPMAN bye
  IF ~~ THEN REPLY ~That’s enough wisdom for now. Time to move on.~ EXTERN AC#PPMAN bye
  
CHAIN IF ~~ THEN AC#PPMAN chain_place_more_02
~The purpose of this place? What purpose does peace need? You will find no temples of carved stone here. Only open sky, and the gentle song of streams below. Peace is the will to let go of burden, blade, and bitterness, and there is no better place to let go.~
END  
  IF ~~ THEN REPLY ~Nice ideals. But I’ve found that peace only follows a blade.~ EXTERN AC#PPMAN peace_dicussion_bye
  IF ~~ THEN REPLY ~Sounds great!~ EXTERN AC#PPMAN peace_dicussion_bye
  IF ~~ THEN REPLY ~Thank you for your insights. I must go.~ EXTERN AC#PPMAN bye
  IF ~~ THEN REPLY ~That’s enough wisdom for now. Time to move on.~ EXTERN AC#PPMAN bye  
 
CHAIN IF ~~ THEN AC#PPMAN peace_dicussion_bye 
  ~Rivers do not rush to war, yet they shape the land more deeply than any army. Consider that, my <LADYLORD>. Farewell.~
EXIT


// Two Eldathyn priests debating

BEGIN AC#PPST1 
BEGIN AC#PPST2

// Dialog between two Eldathyn (AC#PPST1, AC#PPST2) and Korgan (KORGANJ) Priest #1
CHAIN IF ~InParty("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)
Global("DebatingKorgan","ACPP01",0)~ THEN AC#PPST1 hello_korgan
~Look, brother! A new soul has arrived in Duskwood Dell.~
==AC#PPST2 ~Peace be upon you, dwarven seeker of stillness...~
==KORGANJ ~Hmph.~
==AC#PPST1 ~Tell us, brother—what is your name?~
==KORGANJ ~Korgan. BLOOD-Axe.~
==AC#PPST2 ~Ah. So tell us, brother—when was the last time you truly felt peace?~
==KORGANJ ~When I chopped off Timble’s ugly head.~
==AC#PPST1 ~Uh... and when did you last hear the eternal silence?~
==KORGANJ ~When I cut out Larry’s jabbering tongue.~
==AC#PPST2 ~Erm... a-and when, brother, did you last listen through another’s ears?~
==KORGANJ ~Last time I wore that nice necklace o’ cut-off ears. Lost it in battle. Real shame.~
==AC#PPST2 ~By Eldath, you have problems with your temper!~
==KORGANJ ~No, *you* have problems with your delusions!~
==AC#PPST1 ~By the Green Goddess! He’s beyond reach.~
==KORGANJ ~Aye. And proud of it!~
END
IF ~~ THEN DO ~SetGlobal("DebatingKorgan","ACPP01",1)~ EXIT

// Dialog between two Eldathyn (AC#PPST1, AC#PPST2) and Korgan (KORGANJ) Priest #2
CHAIN IF ~InParty("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)
Global("DebatingKorgan","ACPP01",0)~ THEN AC#PPST2 hello_korgan
~Look, brother! A new soul has arrived in Duskwood Dell.~
==AC#PPST1 ~Peace be upon you, dwarven seeker of stillness...~
==KORGANJ ~Hmph.~
==AC#PPST1 ~Tell us, brother—what is your name?~
==KORGANJ ~Korgan. BLOOD-Axe.~
==AC#PPST2 ~Ah. So tell us, brother—when was the last time you truly felt peace?~
==KORGANJ ~When I chopped off Timble’s ugly head.~
==AC#PPST1 ~Uh... and when did you last hear the eternal silence?~
==KORGANJ ~When I cut out Larry’s jabbering tongue.~
==AC#PPST2 ~Erm... a-and when, brother, did you last listen through another’s ears?~
==KORGANJ ~Last time I wore that nice necklace o’ cut-off ears. Lost it in battle. Real shame.~
==AC#PPST2 ~By Eldath, you have problems with your temper!~
==KORGANJ ~No, *you* have problems with your delusions!~
==AC#PPST1 ~By the Green Goddess! He’s beyond reach.~
==KORGANJ ~Aye. And proud of it!~
END
IF ~~ THEN DO ~SetGlobal("DebatingKorgan","ACPP01",1)~ EXIT


// Eldathyn #1
CHAIN IF ~RandomNum(3,1)~ THEN AC#PPST1 hello_1
~That path of thought bears further walking.~
END
IF~RandomNum(3,1)~THEN EXTERN AC#PPST1 stillness
IF~RandomNum(3,2)~THEN EXTERN AC#PPST1 war
IF~RandomNum(3,3)~THEN EXTERN AC#PPST1 water

CHAIN IF ~RandomNum(3,2)~ THEN AC#PPST1 hello_2
~A thoughtful point, brother.~
END
IF~RandomNum(3,1)~THEN EXTERN AC#PPST1 stillness
IF~RandomNum(3,2)~THEN EXTERN AC#PPST1 war
IF~RandomNum(3,3)~THEN EXTERN AC#PPST1 water

CHAIN IF ~RandomNum(3,3)~ THEN AC#PPST1 hello_3
~Peaceful thoughts lead to clear insight.~
END
IF~RandomNum(3,1)~THEN EXTERN AC#PPST1 stillness
IF~RandomNum(3,2)~THEN EXTERN AC#PPST1 war
IF~RandomNum(3,3)~THEN EXTERN AC#PPST1 water

// Eldathyn #2 
CHAIN IF ~RandomNum(3,1)~ THEN AC#PPST2 hello_1
~A petal of truth, carried on calm wind.~
END
IF~RandomNum(3,1)~THEN EXTERN AC#PPST1 stillness
IF~RandomNum(3,2)~THEN EXTERN AC#PPST1 war
IF~RandomNum(3,3)~THEN EXTERN AC#PPST1 water

CHAIN IF ~RandomNum(3,2)~ THEN AC#PPST2 hello_2
~That path of thought bears further walking.~
END
IF~RandomNum(3,1)~THEN EXTERN AC#PPST1 stillness
IF~RandomNum(3,2)~THEN EXTERN AC#PPST1 war
IF~RandomNum(3,3)~THEN EXTERN AC#PPST1 water

CHAIN IF ~RandomNum(3,3)~ THEN AC#PPST2 hello_3
~It is a view worth holding to the light.~
END
IF~RandomNum(3,1)~THEN EXTERN AC#PPST1 stillness
IF~RandomNum(3,2)~THEN EXTERN AC#PPST1 war
IF~RandomNum(3,3)~THEN EXTERN AC#PPST1 water


// Dialog between two Eldathyn (AC#PPST1, AC#PPST2) and Korgan (KORGANJ)

CHAIN IF ~~ THEN AC#PPST1 hello_korgan
~Look, brother! A new soul has arrived in Duskwood Dell.~
==AC#PPST2 ~Peace be upon you, dwarven seeker of stillness...~
==AC#PPST1 ~A still pond reflects more clearly than a rushing stream. Action must follow reflection.~
==KORGANJ ~Hmph.~
==AC#PPST1 ~Tell us, brother—what is your name?~
==KORGANJ ~Korgan. BLOOD-Axe.~
==AC#PPST2 ~Ah. So tell us, brother—when was the last time you truly felt peace?~
==KORGANJ ~When I chopped off Timble’s bloody head.~
==AC#PPST1 ~Uh... and when did you last hear the eternal silence?~
==KORGANJ ~When I cut out Larry’s jabbering tongue.~
==AC#PPST2 ~Erm... a-and when, brother, did you last listen through another’s ears?~
==KORGANJ ~Last time I wore that nice necklace o’ cut-off ears. Lost it in battle. Real shame.~
==AC#PPST2 ~By the Green Goddess! He’s beyond reach.~
==KORGANJ ~Aye. And proud of it!~
EXIT


CHAIN IF ~~ THEN AC#PPST1 stillness
~Stillness is the essence of Eldath’s teaching. In silence, we find truth.~
==AC#PPST2 ~Silence, yes—but not passivity. Even the river flows, though it makes no noise in the deep.~
==AC#PPST1 ~And yet, a still pool reflects more clearly than rushing water. Action must come only after reflection.~
==AC#PPST2 ~Reflection without movement is stagnation. Peace must walk the land, not only dream beneath it.~
==AC#PPST1 ~Then we are agreed, perhaps: peace is not the absence of motion, but its guidance.~
==AC#PPST2 ~Well said. May our steps remain light, and our purpose rooted.~
EXIT

CHAIN IF ~~ THEN AC#PPST1 war
~War is the great wound of the world. Wherever it passes, peace must struggle to grow again.~
==AC#PPST2 ~True—but some say without war, peace would have no meaning. What do we tell them?~
==AC#PPST1 ~That peace is not the absence of pain, but the healing that follows. War is a fire; peace is the rain.~
==AC#PPST2 ~And yet some rains come too late. I have seen fields scorched beyond all tending.~
==AC#PPST1 ~Even the blackest earth may bloom again, if given time and care. Eldath does not give up on any soil.~
==AC#PPST2 ~And in time, may flowers grow where banners once stood.~
== KORGANJ IF ~InParty("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN ~If I hear "peace" again, I swear I’ll start chopping trees. Then people. In that order.~
EXIT

CHAIN IF ~~ THEN AC#PPST1 water
~Water is the voice of Eldath. It sings in streams and whispers in the mist.~
==AC#PPST2 ~And yet it has no shape of its own. It takes the form of all things, and resists none.~
==AC#PPST1 ~That is its strength. In yielding, it endures. In softness, it wears down stone.~
==AC#PPST2 ~And when troubled, it reflects nothing. It reminds us to still our thoughts.~
EXIT

// honey making Eldathyn in area ACPP01:

BEGIN ~AC#PPELH~

CHAIN IF ~RandomNum(4,1)~ THEN AC#PPELH hello_01
~The bees teach us much: they labor in silence, ask for nothing, and still leave behind sweetness and healing.~
EXIT

CHAIN IF ~RandomNum(4,2)~ THEN AC#PPELH hello_02
~I make my honey slow and gently filtered, as Eldath would want it. No smoke, no fire—only patience and cool hands.~
EXIT

CHAIN IF ~RandomNum(4,3)~ THEN AC#PPELH hello_03
~Honey calms the throat, seals wounds, and carries the scent of every flower it was born from. It is a quiet blessing in golden form.~
EXIT

CHAIN IF ~RandomNum(4,4)~ THEN AC#PPELH hello_04
~Each jar I seal is a little peace preserved. When the world stings, a spoon of honey reminds us that not all things hurt.~
EXIT

// walking Eldathyn priest
BEGIN ~AC#PPELR~

CHAIN IF ~RandomNum(8,1)~ THEN AC#PPELR hello_01
~The garden teaches us: Grow in silence, protect what is gentle, and bloom only when the time is right.~
EXIT

CHAIN IF ~RandomNum(8,2)~ THEN AC#PPELR hello_02
~War wounds the world. Flowers help it heal. Eldath knew what she was doing when she gave us petals instead of blades.~
EXIT

CHAIN IF ~RandomNum(8,3)~ THEN AC#PPELR hello_03
~Peace takes root slowly—like a flower in spring. You can’t force it open. You can only care for the soil and wait.~
EXIT

CHAIN IF ~RandomNum(8,4)~ THEN AC#PPELR hello_04
~May your anger wither like frost at dawn, and may your words bloom like soft meadow flowers.~
EXIT

CHAIN IF ~RandomNum(8,5)~ THEN AC#PPELR hello_05
~Some say flowers are fragile. I say they are brave—for they bloom even knowing how short their season may be.~
EXIT

CHAIN IF ~RandomNum(8,6)~ THEN AC#PPELR hello_06
~I speak with the plants each morning. They never rush, never shout, and yet they grow just fine.~
EXIT

CHAIN IF ~RandomNum(8,7)~ THEN AC#PPELR hello_07
~Violence may trample the field—but give it time, and green will return. Always.~
EXIT

CHAIN IF ~RandomNum(8,8)~ THEN AC#PPELR hello_08
~Not all healing comes through herbs. Sometimes, a quiet place and the scent of blooming things are enough.~
EXIT
/************************************************
// Mannatarv, the dying man
*******************************************************************/

BEGIN AC#PPILL

//3rd encounter: Mannatarv's request after Alatoasz' quest has started
	CHAIN IF ~Global("DyingMan","ACPP01",3)~ THEN AC#PPILL hello_waiting_poison
	~Have you found the plant yet?~ 
	END
	IF ~~ THEN REPLY ~No, not yet.~ EXTERN AC#PPILL farewell
	IF ~PartyHasItem("AC#PPPUB")~ THEN REPLY ~I have the plant here with me.~ EXTERN AC#PPILL yes_have_plant
	IF ~~ THEN REPLY ~I'm not going to help you after all.~ EXTERN AC#PPILL not_help_02

CHAIN IF ~Global("DyingMan","ACPP01",2)~ THEN AC#PPILL request
~You’ve spoken with the High One, haven’t you? Alatoasz sent you after the Talona priest... and the flower. The Groveglove. Everyone whispers of it. A poison so pure even the gentle hands of Eldath cannot undo it.~
== AC#PPILL IF ~Global("MetMannatarv","ACPP01",0)~ THEN ~We haven't met yet. My name is Mannatarv. I am old and sick, very sick. All I want is to die. But they won't let me.~ 
== AC#PPILL IF ~GlobalGT("MetMannatarv","ACPP01",0)~ THEN ~We've met before. My name is Mannatarv. You know I am old and sick, very sick. All I want is to die. But they won't let me.~ 
== AC#PPILL ~The priests heal me every day. They pour their light into me, knit my wounds, call me back when I slip away. But I am tired. My bones rot, my breath burns. Each day they gift me is another day of pain. I want no more gifts.~  
== AC#PPILL ~I beg you: Bring me a fragment of that flower before they make an antidote. Just a single leaf. Let me ingest its venom and be done. Let me leave this world in silence, not in their endless chants.~
==ViconiJ IF ~InParty("viconia") !StateCheck("viconia",CD_STATE_NOTVALID)~ THEN ~A soul begging for the kiss of death. I would grant it gladly… but not swiftly.~
==JaheiraJ IF ~InParty("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN ~We must not meddle with the path of nature. Life and death are not ours to grant.~
==HEXXATJ IF ~InParty("hexxat") !StateCheck("hexxat",CD_STATE_NOTVALID)~ THEN ~Why waste words? If he wants death, let’s grant it. No need for some poisoned flowers, though.~
==ValygarJ IF ~InParty("valygar") !StateCheck("valygar",CD_STATE_NOTVALID)~ THEN ~Some burdens may be heavier than any man can carry.~
==CerndJ IF ~InParty("cernd") !StateCheck("cernd",CD_STATE_NOTVALID)~ THEN ~If his time has come, the river of life will claim him. We should not hasten its current, nor hold it back.~
== KeldorJ IF ~InParty("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ THEN ~Mercy and murder walk a fine line here. I could not in good conscience aid him.~
== AnomenJ  IF ~InParty("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN ~Such thoughts are blasphemy. It is not for us to grant an easy death.~
== DornJ  IF ~InParty("Dorn") !StateCheck("Dorn",CD_STATE_NOTVALID)~ THEN ~Life is suffering. If he craves the end, I’ll cut it short for him gladly.~
== BEDWIN IF ~InParty("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN ~His misery is not our concern. Just keep him from delaying us.~ 
==KorganJ IF ~InParty("korgan") !StateCheck("korgan",CD_STATE_NOTVALID)~ THEN ~If the old fool wants to croak, hand him the bloody weed.~   
END
IF ~~ THEN REPLY ~You want to kill yourself with this plant?~ EXTERN AC#PPILL kill_plant
IF ~~ THEN REPLY ~No. I won’t be party to your death.~ EXTERN AC#PPILL refuse
IF ~~ THEN REPLY ~If this is your wish, I will bring it to you.~ EXTERN AC#PPILL accept
IF ~~ THEN REPLY ~Perhaps there is another way.~ EXTERN AC#PPILL alternative
IF ~~ THEN REPLY ~Why wait for the plant? I can give you a quick death myself.~ EXTERN AC#PPILL kill_instantly
	
// 1st encounter
CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#PPILL hello
~Huh... another visitor. Spare me your cheer, stranger. Words are heavy, and I have little strength left to carry them.~ 
DO ~SetGlobal("MetMannatarv","ACPP01",1)~ EXTERN AC#PPILL priests_fuss

  
	CHAIN AC#PPILL priests_fuss
	~The priests fuss enough over me already. Let an old man keep to himself, for I have no life left worth speaking of. Better leave me to the scraps of existence that remain.~  
	END
	IF ~~ THEN REPLY ~I meant no harm.~ EXTERN AC#PPILL farewell
	IF ~~ THEN REPLY ~You sound unwell. Can I do something for you?~ EXTERN AC#PPILL brush_off

	CHAIN AC#PPILL brush_off
	~Hmph. No, nothing you can mend. My flesh betrays me, my bones gnaw at me, and still they will not let me go. Better to leave me be, before you waste your pity here.~  
	END
	IF ~~ THEN REPLY ~As you wish. Farewell.~ EXTERN AC#PPILL farewell

	CHAIN AC#PPILL farewell
	~Enough words… each one wears me thinner. Farewell.~  
	EXIT
	
	CHAIN IF ~NumTimesTalkedToGT(0)~ THEN AC#PPILL again
	~Still here? Hm. I've no fresh words for you... only the same old pain. Go on, stranger. Let the wind carry your steps elsewhere.~  
	END
	IF ~~ THEN REPLY ~Very well. Farewell.~ EXTERN AC#PPILL farewell

	CHAIN AC#PPILL yes_have_plant
	~You're actually bringing it to me? You're a good <PRO_RACE>! Let me see...~
	== AC#PPILL ~So beautiful and yet so deadly... here, I'll just take one leaf. Everyone else should get the antidote, just not me...~
	== AC#PPILL ~Ugh, that tastes bitter! I didn't think that...~
	DO ~SetGlobal("DyingMan","ACPP01",10)
	Kill(Myself)~
	EXIT
	
	CHAIN AC#PPILL not_help_02
	~Then leave me to my torment. The priests will be pleased.~
	EXIT

	// Mannatarv lehnt entschieden ab
	CHAIN AC#PPILL kill_instantly
	~No! Not here, not in the sanctuary of Eldath. No blood must be spilled on this sacred ground. If you truly mean me mercy, let it be without violence.~  
	END
	IF ~~ THEN REPLY ~You want to kill yourself with this plant?~ EXTERN AC#PPILL kill_plant
	IF ~~ THEN REPLY ~No. I won’t be party to your death.~ EXTERN AC#PPILL refuse
	IF ~~ THEN REPLY ~If this is your wish, I will bring it to you.~ EXTERN AC#PPILL accept
	IF ~~ THEN REPLY ~Perhaps there is another way.~ EXTERN AC#PPILL alternative


CHAIN AC#PPILL kill_plant
~If you wish to see it that way, yes. I see it as a release.~ 
END
IF ~~ THEN REPLY ~No. I won’t be party to your death.~ EXTERN AC#PPILL refuse
IF ~~ THEN REPLY ~If this is your wish, I will bring it to you.~ EXTERN AC#PPILL accept
IF ~~ THEN REPLY ~Perhaps there is another way.~ EXTERN AC#PPILL alternative

CHAIN AC#PPILL refuse
~Then leave me to my torment. The priests will be pleased. Farewell~
DO ~EscapeArea()~ EXIT

CHAIN AC#PPILL accept
~You... you would truly do this for me? I thank you already for even considering it. You may think me mad, but you have shown mercy where others offered only healing. I will wait for you by the stump in the water. Remember: you must give me a leaf of the plant before you bring it to Alatoasz! Once he crafts an antidote, I will have no hope left of passing peacefully from this world.~ 
== AC#PPILL ~Good luck with your search, <PRO_RACE>. I’m counting on you and will be waiting for you.~   
DO ~SetGlobal("DyingMan","ACPP01",3)
EscapeArea()~ EXIT

CHAIN AC#PPILL alternative
~Another way? No. I’ve tried everything. Even pleaded with the High Priest himself. Nothing helps. That's why I need your help.~  
END
IF ~~ THEN REPLY ~No. I won’t be party to your death.~ EXTERN AC#PPILL refuse
IF ~~ THEN REPLY ~If this is your wish, I will bring it to you.~ EXTERN AC#PPILL accept



// "Leaves' Embrace", tavern in area ACPP11 
BEGIN ~AC#PPELS~

IF ~True()~ THEN BEGIN 0
  SAY ~Welcome, traveler. The boughs above have whispered of your coming. You’ve found your way to Leaves' Embrace—rest, if you wish, is easily given.~ 
  IF ~~ THEN REPLY ~What exactly do you offer here?~ GOTO chain_about_shop
  IF ~~ THEN REPLY ~Not today. Perhaps another time.~ GOTO 1
  IF ~~ THEN REPLY ~Show me what comforts you provide.~ DO ~StartStore("AC#PPELS",LastTalkedToBy())~ EXIT
END

IF ~~ THEN BEGIN 1
  SAY ~Then may the wind carry you gently, and peace follow your steps.~
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 2
  SAY ~A place to rest beneath the open sky, cradled in the arms of the trees. Blankets warmed by the day’s sun, hammocks swaying between ancient limbs... and a soft hush, broken only by birdsong.~
  IF ~~ THEN REPLY ~That sounds like something I could use.~ GOTO shop
  IF ~~ THEN REPLY ~I’ll pass, for now.~ GOTO 1
END

IF ~~ THEN BEGIN shop
  SAY ~Then lie back, and let the leaves hold your weight. In this place, the world forgets its noise.~ 
  IF ~~ THEN DO ~StartStore("AC#PPELS",LastTalkedToBy())~ EXIT
END

CHAIN IF ~~ THEN AC#PPELS chain_about_shop
~This is a refuge, not just a hostel. We offer shelter among the branches—sleeping places strung like nests between the limbs, for those who trust the trees to carry them.~
==AC#PPELS ~We serve warm tea brewed from grove herbs and—should you wish—candles to ease the mind or soothe dreamless sleep.~
==AC#PPELS ~Peace is our only true offering. But sometimes, that is more than enough.~
END  
  IF ~~ THEN REPLY ~I think I’ll stay. The world can wait.~ EXTERN AC#PPELS shop
  IF ~~ THEN REPLY ~Another time, perhaps.~ EXTERN AC#PPELS 1


// mystic, store in area ACPP13
BEGIN ~AC#PPMYS~

IF ~True()~ THEN BEGIN 0
  SAY ~*Cough, cough*! Pardon the haze! Too many wicks burning. Still... welcome! Looking for candles, plain or powerful?~ 
  IF ~~ THEN REPLY ~What exactly do you offer?~ GOTO chain_about_shop
  IF ~~ THEN REPLY ~Candles?~ GOTO 2
  IF ~~ THEN REPLY ~Not today. Perhaps another time.~ GOTO 1
  IF ~~ THEN REPLY ~Let me see what you have.~ DO ~StartStore("AC#PPMYS",LastTalkedToBy())~ EXIT
  IF ~~ THEN REPLY ~Aren’t you afraid all these candles might set the whole tree ablaze?~ GOTO fire_question
END

IF ~~ THEN BEGIN fire_question
  SAY ~Oh, no... *cough*! The smoke keeps the bugs away, and Eldath watches the flames. Besides... I only set one branch aflame last year, and my brothers and sisters were quick with their rain spells.~
  IF ~~ THEN REPLY ~What exactly do you offer?~ GOTO chain_about_shop
  IF ~~ THEN REPLY ~I'll take my leave.~ GOTO 1
  IF ~~ THEN REPLY ~Let me see what you have.~ DO ~StartStore("AC#PPMYS",LastTalkedToBy())~ EXIT
END


IF ~~ THEN BEGIN 1
  SAY ~Then walk in peace... *cough*... and may your flame never falter.~ 
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 2
  SAY ~Candles, yes... poured with blessing and prayer. And sometimes with a touch of magic, if I’m honest.~ 
  IF ~~ THEN REPLY ~Let me see what you have.~ GOTO shop
  IF ~~ THEN REPLY ~I’ll pass, for now.~ GOTO 1
END

IF ~~ THEN BEGIN shop
  SAY ~Here, here... *sniff*... some candles are for warmth, some for light, and a few... oh, they’re special. Careful with the drippings, though!~
  IF ~~ THEN DO ~StartStore("AC#PPMYS",LastTalkedToBy())~ EXIT
END


CHAIN IF ~~ THEN AC#PPMYS chain_about_shop
~I do have a few scrolls, but more important are the candles. Some simple, others woven with prayer. They can soothe the heart... sharpen the mind... or hold back creeping shadows.~ 
==AC#PPMYS ~Some call it candle-magic. I... eh... call it just a quiet flame.~ 
==AC#PPMYS ~And see here—this scroll explains how to pour a magical candle yourself. Not too hard, really, so long as you don’t forget the wick. Heh!~
END  
  IF ~~ THEN REPLY ~All right, let me have a look. Words carry power... and so does flame.~ EXTERN AC#PPMYS shop
  IF ~~ THEN REPLY ~I’ll pass, for now.~ EXTERN AC#PPMYS 1

// priest of Eldath, store in area ACPP02
BEGIN ~AC#PPEL8~

IF ~True()~ THEN BEGIN 0
  SAY ~Welcome, my <BROTHERSISTER>. You stand in a place of stillness, under the gentle grace of Eldath, the Quiet One. May her peace settle upon your heart.~
  IF ~~ THEN REPLY ~I would like to see your services.~ GOTO 1
  IF ~Global("MinscViconia_ACPP02","ACPP02",1)~ THEN REPLY ~Could you tell me more about Eldath?~ GOTO 2
  IF ~Global("MinscViconia_ACPP02","ACPP02",0)~ THEN REPLY ~Could you tell me more about Eldath?~ GOTO eldath_once
  IF ~~ THEN REPLY ~I see. I shall be going.~ GOTO 3
END

IF ~~ THEN BEGIN 1
  SAY ~Of course, my <BROTHERSISTER>. Step softly, and let peace guide your path.~
  IF ~~ THEN DO ~StartStore("AC#PPEL8",LastTalkedToBy(Myself))~ EXIT
END

IF ~~ THEN BEGIN 3
  SAY ~May the soft winds of Eldath guide you, <BROTHERSISTER>.~
  IF ~~ THEN EXIT
END

  CHAIN AC#PPEL8 eldath_once
  ~Eldath is the goddess of peace, still waters, and quiet groves. We offer sanctuary to those seeking harmony, far from the clamor of the world. No blade is drawn where her blessing lingers.~
  == MinscJ IF ~InParty("minsc") !StateCheck("minsc",CD_STATE_NOTVALID)~ THEN ~No sword? No smashing? Even not a little butt-kicking? How confusing...~
  == ViconiJ IF ~InParty("viconia") !StateCheck("viconia",CD_STATE_NOTVALID)~ THEN ~A goddess of peace... How quaint. If she exists, she’ll be the first to bleed.~
  == AC#PPEL8 ~Many laughed at us when we planted the first saplings here. Yet now you stand in their shade.~
  END
  IF ~~ THEN DO ~SetGlobal("MinscViconia_ACPP02","ACPP02",1)~ EXTERN AC#PPEL8 eldath_once_2
  
  CHAIN AC#PPEL8 eldath_once_2
  ~Anything else?~
  END
  IF ~~ THEN REPLY ~Could I see your services?~ EXTERN AC#PPEL8 1
  IF ~~ THEN REPLY ~I see. I shall be going.~ EXTERN AC#PPEL8 3
  
  CHAIN AC#PPEL8 2
  ~Eldath is the goddess of peace, still waters, and quiet groves. We offer sanctuary to those seeking harmony, far from the clamor of the world. No blade is drawn where her blessing lingers.~
  END
  IF ~~ THEN REPLY ~Could I see your services?~ EXTERN AC#PPEL8 1
  IF ~~ THEN REPLY ~I see. I shall be going.~ EXTERN AC#PPEL8 3

// honey-maker in area acpp07:
BEGIN ~AC#PPON2~

//old- now with cutscene
/*
CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#PPON2 hello_00
~Mmm... oh-ho-ho! Hmmm. Such sweetness! Crunchy comb, golden nectar... *slurp* Ahhh, bliss indeed!~
== AC#PPON2 ~Oh! By the Gentle Broodkeeper herself... I did not expect company while I indulged.~ 
END 
IF ~~ THEN DO ~CreateVisualEffectObject("SPFLESHS",Myself)
Polymorph(MONK)
SetGlobal("BearChange","ACPP07",1)~
EXIT
*/

CHAIN IF ~Global("BearChange","ACPP07",1)~ THEN AC#PPON2 hello_sorry
~Ah, that is much better. Forgive me. I sometimes take the form of a bear when the craving grows too great. Honey tastes sweeter when gathered with a muzzle and tongue, or so I tell myself.~ 
END
IF~~THEN DO ~SetGlobal("BearChange","ACPP07",2)~ EXTERN AC#PPON2 human_form

// Rückkehr zum Honigmönch nach dem Verkauf in den Five Flagons
CHAIN IF ~True()~ THEN AC#PPON2 hello_again
~Greetings again, lover of honey! What sweetness brings you back to me this day?~ 
END
IF~GlobalGT("AC#PP_HoneyQuest","GLOBAL",0)
GlobalLT("AC#PP_HoneyQuest","GLOBAL",10)~THEN REPLY ~It is about the mead.~ EXTERN AC#PPON2 about_mead
IF~~THEN REPLY ~I shall not keep you from your honey. Farewell.~ EXTERN AC#PPON2 bye


CHAIN AC#PPON2 about_mead
~Oh! Do you bring good news, I hope?~ 
END
IF~GlobalGT("AC#PP_HoneyQuest","GLOBAL",1)
GlobalLT("AC#PP_HoneyQuest","GLOBAL",10)~THEN REPLY ~I delivered the cask to the innkeeper of the Five Flagons.~ EXTERN AC#PPON2 about_mead_02
IF~~THEN REPLY ~No, there is nothing to report yet.~ EXTERN AC#PPON2 bye


CHAIN AC#PPON2 about_mead_02
~And? Did he pay you a proper price for it? A year’s labor went into that nectar.~ 
END
IF~~THEN REPLY ~He gave me one hundred gold pieces.~ EXTERN AC#PPON2 about_mead_100
IF~~THEN REPLY ~He gave me five hundred gold pieces.~ EXTERN AC#PPON2 about_mead_500
IF~~THEN REPLY ~He gave me seven hundred and fifty gold pieces.~ EXTERN AC#PPON2 about_mead_750
IF~~THEN REPLY ~He gave me a thousand gold pieces.~ EXTERN AC#PPON2 about_mead_1000
IF~~THEN REPLY ~No, there is nothing to report yet.~ EXTERN AC#PPON2 bye


// Spieler meldet nur 100 Gold
CHAIN AC#PPON2 about_mead_100
~Only a hundred? That is… disappointing. Samuel must think Eldath’s peace worth less than a common ale. Still, what is done is done. I shall make do, though my heart is heavy.~ 
DO ~SetGlobal("AC#PP_HoneyQuest","GLOBAL",10)~ 
EXIT


// Spieler meldet 500 Gold
CHAIN AC#PPON2 about_mead_500
~Ahh, five hundred gold! That is fair recompense for a year’s tending. Eldath’s gardens will bloom brighter for it. Here, take a hundred coins for your trouble—peace is sweet, but labor must not go unrewarded.~ 
DO ~GiveGoldForce(100) SetGlobal("AC#PP_HoneyQuest","GLOBAL",10)~ 
EXIT


// Spieler meldet 750 Gold
CHAIN AC#PPON2 about_mead_750
~Seven hundred and fifty! Ha! More than fair, more than I dared hope! Truly, Eldath smiles upon us today. Take these 250 gold for yourself, and know that your words have bought more than coin—they have bought respect. May your name be blessed as honey on the tongue.~ 
DO ~GiveGoldForce(250) ReputationInc(1) SetGlobal("AC#PP_HoneyQuest","GLOBAL",10)~ 
EXIT


// Spieler meldet 1000 Gold
CHAIN AC#PPON2 about_mead_1000
~A thousand gold? That is beyond generous—nay, it is wondrous! Samuel must have seen not only the worth of the mead, but the worth of peace itself. Take these 500 coins, and accept this gift as well—a cloak woven with Eldath’s blessing, proof against stings both great and small.~ 
DO ~GiveGoldForce(500) GiveItemCreate("AC#PPIMK",Player1,1,0,0) ReputationInc(1) SetGlobal("AC#PP_HoneyQuest","GLOBAL",10)~ 
EXIT


CHAIN AC#PPON2 human_form
~Now that I stand before you in my own skin again... what service might a humble monk of Eldath offer you?~
END
IF~~THEN REPLY ~What are you doing here?~ EXTERN AC#PPON2 what_do_you_do
IF~~THEN REPLY ~I shall not keep you from your honey. Goodbye.~ EXTERN AC#PPON2 bye

	CHAIN AC#PPON2 what_do_you_do
	~What am I doing? Why, I tend the bees, of course! Together we weave harmony into honeycomb, turning blossoms into liquid sunlight. It is not just honey that we make here, but peace itself—thick and golden, sweet upon the tongue. Many wanderers pass by with burdens heavy on their shoulders, and I give them a spoonful. You would be surprised how many quarrels melt away when lips are sticky with honey.~ 
	END
	IF~~THEN REPLY ~I shall not keep you from your honey. Goodbye.~ EXTERN AC#PPON2 five_flagons_quest_start
	
// Einstieg: erkennt den Spieler
CHAIN AC#PPON2 five_flagons_quest_start
~Oh, now that you stand before me, I recognize you. You are the <PRO_RACE> from Athkatla, are you not? I would have a task for you, should you return to the City of Coin.~ 
END
    IF~~THEN REPLY ~Why would a priest of Eldath concern himself with the City of Coin?~ EXTERN AC#PPON2 five_flagons_quest
    IF~~THEN REPLY ~What is it you ask of me?~ EXTERN AC#PPON2 five_flagons_quest
    IF~~THEN REPLY ~I am no errand runner for monks and mead. Find another to carry your casks.~ EXTERN AC#PPON2 five_flagons_refuse


// Start: Questangebot
CHAIN AC#PPON2 five_flagons_quest
~In Athkatla there stands a house of laughter and song, the Five Flagons Inn. Its master, Samuel, is a man of wit and words—yet even such a stage may be gladdened by sweetness. Would you carry a cask of my honeymead to him? Negotiate a fair price in Eldath’s name, that the Quiet One’s temples and gardens may share in the coin.~ 
END
  IF~~THEN REPLY ~Very well. I will deliver your honeymead to Samuel of the Five Flagons.~ DO ~SetGlobal("AC#PP_HoneyQuest","GLOBAL",1)~ EXTERN AC#PPON2 five_flagons_accept
  IF~~THEN REPLY ~What do you mean by negotiating a fair price?~ EXTERN AC#PPON2 five_flagons_quest_02
  IF~~THEN REPLY ~I am no errand runner for monks and mead. Find another to carry your casks.~ EXTERN AC#PPON2 five_flagons_refuse


// Nachfrage: fairer Preis
CHAIN AC#PPON2 five_flagons_quest_02
~You likely know the ways of trade better than I. Ask for a sum that honors the worth of the mead, then return to me with the payment. With those coins, we shall purchase fresh candles and herbs for Eldath’s sanctuary here in the Dell, so that peace may be tended as carefully as the hive.~ 
END
  IF~~THEN REPLY ~Very well. I will deliver your honeymead to Samuel of the Five Flagons.~  DO ~SetGlobal("AC#PP_HoneyQuest","GLOBAL",1)~  EXTERN AC#PPON2 five_flagons_accept
  IF~~THEN REPLY ~I am no errand runner for monks and mead. Find another to carry your casks.~ EXTERN AC#PPON2 five_flagons_refuse


// Spieler akzeptiert
CHAIN AC#PPON2 five_flagons_accept
~My thanks flow as freely as the hive’s nectar. May your words in that tavern be as smooth as honey, and may Samuel see wisdom in fair trade. Return to me with the payment, and I shall grant you a share, for even those who serve peace must taste a little sweetness for their labor.~ 
DO ~GiveItemCreate("AC#PPHYM",Player1,1,0,0)~ 
EXIT


// Spieler lehnt ab
CHAIN AC#PPON2 five_flagons_refuse
~Then let it be so. The hive teaches patience; perhaps another day another person will carry Eldath’s sweetness into the world.~ 
EXIT
	
	CHAIN AC#PPON2 bye
	~Goodbye! Stay calm and honey-comb along.~ 
	EXIT

CHAIN IF ~RandomNum(4,1)~ THEN AC#PPON2 hello_01
~Hive teaches us: Work in silence, guard the sweet, sting only when you must.~ 
EXIT

CHAIN IF ~RandomNum(4,2)~ THEN AC#PPON2 hello_02
~May your anger melt like wax before the flame, and may every word that leaves your lips be as gentle and sweet as the summer’s honey. Go in peace, stranger, and carry a little sweetness into the world.~ 
EXIT

CHAIN IF ~RandomNum(4,3)~ THEN AC#PPON2 hello_03
~It takes patience to make peace... just like good honey. You can’t rush the bees, you can’t rush the fighters.~ 
EXIT

CHAIN IF ~RandomNum(4,4)~ THEN AC#PPON2 hello_04
~May your anger melt like wax, and may your words be sweet as summer honey.~ 
EXIT

// Samuel Thunderburp – Erweiterung für den Five Flagons-Dialog
EXTEND_BOTTOM ~FFBART~ 0
IF ~PartyHasItem("AC#PPHYM")~ THEN REPLY ~I have here a cask of honeymead from a monk of Eldath of Duskwood Dell.~ 
  EXTERN FFBART samuel_mead_duskwood_dell_01 
END

EXTEND_BOTTOM ~FFBART~ 8
IF ~PartyHasItem("AC#PPHYM")~ THEN REPLY ~I have here a cask of honeymead from a monk of Eldath of Duskwood Dell.~ 
  EXTERN FFBART samuel_mead_duskwood_dell_01 
END

// Spieler übergibt den Met
CHAIN FFBART samuel_mead_duskwood_dell_01
~By the gods, look at that golden glow! If the taste matches the hue, this is no mere peasant’s brew. A monk of Eldath, you say? How quaint—and how clever. Peace in a bottle, sweetness in a cask! My patrons will toast to harmony, and quarrels will dissolve before the first jug is empty.~ 
END
  IF~~THEN REPLY ~The monk asked that you pay a fair price, that the Quiet One’s temples might share in the profit.~ EXTERN FFBART samuel_mead_duskwood_dell_price
  IF~~THEN REPLY ~Such mead deserves no ordinary price. What will you offer for it, Samuel?~  EXTERN FFBART samuel_mead_duskwood_dell_price


// Price depending on Charisma
CHAIN FFBART samuel_mead_duskwood_dell_price
~Ah, a reasonable request—and I am no miser when it comes to quality. How much would you ask for the mead?~ 
END
  IF ~~ THEN REPLY ~I ask one hundred gold pieces.~ EXTERN FFBART samuel_mead_duskwood_dell_pay100
  IF ~CheckStatGT(LastTalkedToBy,10,CHR)
  CheckStatLT(LastTalkedToBy,15,CHR)~ THEN REPLY ~I ask five hundred gold pieces.~ EXTERN FFBART samuel_mead_duskwood_dell_pay500
  IF ~CheckStatGT(LastTalkedToBy,14,CHR) CheckStatLT(LastTalkedToBy,18,CHR)~ THEN REPLY ~I ask seven hundred and fifty gold pieces.~ EXTERN FFBART samuel_mead_duskwood_dell_pay750
  IF ~CheckStatGT(LastTalkedToBy,17,CHR)~ THEN REPLY ~I ask one thousand gold pieces.~ EXTERN FFBART samuel_mead_duskwood_dell_pay1000


// Purchase
CHAIN FFBART samuel_mead_duskwood_dell_pay100
~What a bargain! The priests of Eldath seem not to know the true worth of their drink. Here, take your hundred gold pieces.~ 
END
IF ~~ THEN DO ~TakePartyItem("AC#PPHYM") GiveGoldForce(100) SetGlobal("AC#PP_HoneyQuest","GLOBAL",2)~ EXTERN FFBART bye_mead

CHAIN FFBART samuel_mead_duskwood_dell_pay500
~Very well! Here, five hundred gold. A fair sum for a fair cask—tell your monk it shall bring peace to both tavern and temple.~ 
END
IF ~~ THEN DO ~TakePartyItem("AC#PPHYM") GiveGoldForce(500) SetGlobal("AC#PP_HoneyQuest","GLOBAL",2)~ EXTERN FFBART bye_mead

CHAIN FFBART samuel_mead_duskwood_dell_pay750
~Agreed! Seven hundred and fifty gold! The nectar is fine, the cause is finer still. May Eldath smile on my generosity—and on my patrons’ thirst!~ 
END
IF ~~ THEN DO ~TakePartyItem("AC#PPHYM") GiveGoldForce(750) SetGlobal("AC#PP_HoneyQuest","GLOBAL",3)~ EXTERN FFBART bye_mead

CHAIN FFBART samuel_mead_duskwood_dell_pay1000
~A king’s ransom! Yet such sweetness cannot truly be measured in coin. Still—take a thousand gold. Let it be said that Samuel Thunderburp rewards excellence in both brew and deed!~ 
END
IF ~~ THEN DO ~TakePartyItem("AC#PPHYM") GiveGoldForce(1000) SetGlobal("AC#PP_HoneyQuest","GLOBAL",4)~ EXTERN FFBART bye_mead

// Samuel dismisses the player
CHAIN FFBART bye_mead
~Do give the Eldathyn my regards. I never thought they were capable of anything quite so... useful!~ 
EXIT

// Woodcarver Craven – in Area ACPP09 
BEGIN ~AC#PPWOC~

// Erstes Treffen
CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#PPWOC FirstMeet
~Welcome, friend. Name’s Craven. I carve beasts and little figures to bring folk some joy.~
== AC#PPWOC ~At times, I also shape masks, armor, or gloves of wood — useful things, if you need them.~
== AC#PPWOC ~Would you like to see my work?~
END
++ ~Show me what you’ve made.~ DO ~StartStore("AC#PPWOC",LastTalkedToBy())~ EXIT
IF ~RandomNum(4,1)~ THEN REPLY ~Not now.~ EXTERN AC#PPWOC Farewell_1
IF ~RandomNum(4,2)~ THEN REPLY ~Not now.~ EXTERN AC#PPWOC Farewell_2
IF ~RandomNum(4,3)~ THEN REPLY ~Not now.~ EXTERN AC#PPWOC Farewell_3
IF ~RandomNum(4,4)~ THEN REPLY ~Not now.~ EXTERN AC#PPWOC Farewell_4
++ ~Why do you carve wood?~ EXTERN AC#PPWOC WhyCarve
++ ~Don’t you ever run out of trees here?~ EXTERN AC#PPWOC Trees
++ ~Do folk truly value your work?~ EXTERN AC#PPWOC Value

// Wiederholtes Ansprechen
CHAIN IF ~NumTimesTalkedToGT(0)~ THEN AC#PPWOC Again
~Back again? The wood keeps me busy. Do you wish to look over my work?~
END
++ ~Yes, let me see.~ DO ~StartStore("AC#PPWOC",LastTalkedToBy())~ EXIT
IF ~RandomNum(4,1)~ THEN REPLY ~Not today.~ EXTERN AC#PPWOC Farewell_1
IF ~RandomNum(4,2)~ THEN REPLY ~Not today.~ EXTERN AC#PPWOC Farewell_2
IF ~RandomNum(4,3)~ THEN REPLY ~Not today.~ EXTERN AC#PPWOC Farewell_3
IF ~RandomNum(4,4)~ THEN REPLY ~Not today.~ EXTERN AC#PPWOC Farewell_4
++ ~Why do you carve wood?~ EXTERN AC#PPWOC WhyCarve
++ ~Don’t you ever run out of trees here?~ EXTERN AC#PPWOC Trees
++ ~Do folk truly value your work?~ EXTERN AC#PPWOC Value

// Zusatzfragen -> führen zu Hub
CHAIN AC#PPWOC WhyCarve
~It steadies the hands and the heart. A small carving can carry more comfort than coin.~
== AC#PPWOC ~If you like, I can show you what I’ve made.~
EXTERN AC#PPWOC Hub

CHAIN AC#PPWOC Trees
~I never cut living wood. Stormfall and time leave more than enough for willing hands.~
== AC#PPWOC ~Would you care to look?~
EXTERN AC#PPWOC Hub

CHAIN AC#PPWOC Value
~Enough do. A smile paid in full is fair trade.~
== AC#PPWOC ~Shall I lay out my work?~
EXTERN AC#PPWOC Hub

// Hub: Store oder Verabschieden
CHAIN AC#PPWOC Hub
~What will it be?~
END
++ ~Show me your work.~ DO ~StartStore("AC#PPWOC",LastTalkedToBy())~ EXIT
IF ~RandomNum(4,1)~ THEN REPLY ~Another time.~ EXTERN AC#PPWOC Farewell_1
IF ~RandomNum(4,2)~ THEN REPLY ~Another time.~ EXTERN AC#PPWOC Farewell_2
IF ~RandomNum(4,3)~ THEN REPLY ~Another time.~ EXTERN AC#PPWOC Farewell_3
IF ~RandomNum(4,4)~ THEN REPLY ~Another time.~ EXTERN AC#PPWOC Farewell_4

// Verschiedene Abschiede
CHAIN AC#PPWOC Farewell_1
~Very well. The wood will wait.~
EXIT

CHAIN AC#PPWOC Farewell_2
~As you wish. I’ll keep the shavings tidy.~
EXIT

CHAIN AC#PPWOC Farewell_3
~Come back when the grain calls to you.~
EXIT

CHAIN AC#PPWOC Farewell_4
~Another day, another carving. Safe paths.~
EXIT


// Ondonti orcs in area ACPP05
BEGIN ~AC#PPON1~
BEGIN ~AC#PPON3~

CHAIN IF ~True()~ THEN AC#PPON3 hello_again
~Ah, friend! We thank you still. You saved our lives on the road.~
== AC#PPON1 ~Now our axe only split pumpkin, not heads. Better work. Better life.~
END

IF~~THEN REPLY ~An orc! I’ll take your head off!~ EXTERN AC#PPON3 orc_hostile
IF~~THEN REPLY ~I don’t believe you for a moment.~ EXTERN AC#PPON3 orc_skeptical
IF~~THEN REPLY ~Good to see you alive. Glad you found peace.~ EXTERN AC#PPON3 orc_friendly
IF~~THEN REPLY ~Why pumpkins, of all things?~ EXTERN AC#PPON3 orc_why_pumpkin
IF~~THEN REPLY ~Need any help with those?~ EXTERN AC#PPON3 orc_offer_help
IF~~THEN REPLY ~I’ll leave you to your pumpkins.~ EXTERN AC#PPON3 bye

    CHAIN IF ~~ THEN AC#PPON3 orc_hostile
    ~No! No fight! Please, we only split pumpkin now. They not scream.~
    == AC#PPON1 ~If you strike, Eldath frown. We beg you, do not make us fight.~
    EXIT

    CHAIN IF ~~ THEN AC#PPON3 orc_skeptical
    ~You not believe? That fine. We were like you once. Listen—~
    == AC#PPON3 ~I am Peacefang. Orc of Eldath. My clan left old gods, left blood. Now we tend land, split harvest.~
    == AC#PPON1 ~Me Quietbrook. ~
	END
	IF~~THEN EXTERN AC#PPON3 orc_friendly

    CHAIN IF ~~ THEN AC#PPON3 orc_friendly
    ~You kind. We thank again. You made new life for us.~
    == AC#PPON3 ~You come to Duskwood Dell, we sing small thanks and share stew.~
    END
	IF~~THEN REPLY ~I may stop by.~ EXTERN AC#PPON3 orc_invite_accept
    IF~~THEN REPLY ~Keep your songs for yourselves.~ EXTERN AC#PPON3 orc_invite_decline
	
        CHAIN IF ~~ THEN AC#PPON3 orc_invite_accept
        ~Good. You welcome. Eldath bless road that brought you.~
        EXIT
		
        CHAIN IF ~~ THEN AC#PPON3 orc_invite_decline
        ~As you wish. Still you saved us. We remember.~
        EXIT

    CHAIN IF ~~ THEN AC#PPON3 orc_why_pumpkin
    ~Pumpkin give food. Pumpkin fells like head, not bring blood. Eldath say tend land, be gentle.~
    == AC#PPON1 ~Axe still heavy, but heart lighter. Pumpkins need split — we very busy and happy.~
    END
	IF~~THEN REPLY ~Sounds peaceful enough.~ EXTERN AC#PPON3 orc_why_ok
    IF~~THEN REPLY ~You could be lying to hide something.~ EXTERN AC#PPON3 orc_why_suspicious
	
        CHAIN IF ~~ THEN AC#PPON3 orc_why_ok
        ~Yes. Peace good. Thank you.~
        EXIT
		
        CHAIN IF ~~ THEN AC#PPON3 orc_why_suspicious
        ~We not hide. You watch. If we fight, you see. If we not, you see also.~
        EXIT


    CHAIN IF ~~ THEN AC#PPON3 orc_offer_help
    ~Help? No help, we happy. Many pumpkins, many hands make work quick.~
    == AC#PPON1 ~If you help, we share stew and seeds. Eldath smiles on those who feed the land.~
    END
	IF~~THEN REPLY ~All right, show me how to split one.~ EXTERN AC#PPON3 orc_show_split
    IF~~THEN REPLY ~No thanks — you two seem fine.~ EXTERN AC#PPON3 orc_decline_help
        
		CHAIN IF ~~ THEN AC#PPON3 orc_show_split
        ~Good! Here, take small axe. Hold steady, strike top, then drive through. We teach.~
        EXIT
		
        CHAIN IF ~~ THEN AC#PPON3 orc_decline_help
        ~That fine. You safe now. We grateful always.~
        EXIT

    CHAIN IF ~~ THEN AC#PPON3 bye
    ~Farewell then. Keep axe sharp, friend — but for pumpkin now!~
    EXIT

CHAIN IF ~True()~ THEN AC#PPON1 hello_again
~Now our axe only split pumpkin, not heads. Better work. Better life.~
EXIT

	
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////

BEGIN AC#PPCHA
BEGIN AC#PPCAA

//1st talk

CHAIN IF ~Global("AC#PPFlowerDelivery","GLOBAL",0)~ THEN AC#PPCHA 01.00
~Excuse me... You're the one who helped our High Priest, aren't you? I was wondering if you might help me as well... just for a moment.~
END
IF~~THEN REPLY ~Depends. What do you need?~ EXTERN AC#PPCHA 01.01
IF~~THEN REPLY ~I have no time on helping boys that do not even shave themselves yet. Go play in the trees.~ EXTERN AC#PPCHA 01.02

CHAIN AC#PPCHA 01.01
~You see, it was recently that I run away from home. I... I just couldn't live the life I was expected to live! My parents passed when I was still young, and I was raised by my aunt—Pesca. She lives in the Government District of Athkatla. Her world is... marble, silk, and coin. She wanted me to become a refined, wealthy man. Polished. Privileged. Fat. Lazy.~
==AC#PPCHA ~But none of it ever felt like mine. Not the clothes, not the manners, not the future. One day, I heard something—felt something. A stillness. A call. Eldath’s voice in the wind, maybe.~
==AC#PPCHA ~So I came here, to Duskwood Dell, to learn, to breathe, to find a path of my own. But... I left without a word. Just vanished. That wasn’t right.~
==AC#PPCHA ~I can't return—she'd never let me go again. But maybe, if someone brought her this flower... told her I'm safe and where I am... maybe then, peace can grow between us again.~
==AC#PPCHA ~She's living in Athkatla. She often walks through the gardens of the Government District. Will you take this flower to her, and pass on my message?~
END
IF~~THEN REPLY ~Alright. I’ll do it.~ EXTERN AC#PPCHA 01.03
IF~~THEN REPLY ~That’s your problem, not mine.~ EXTERN AC#PPCHA 01.02

CHAIN AC#PPCHA 01.03
~Truly? Thank you. Here—take it. She rarely leaves the District; she always said the City of Coins was all she needed.~
==AC#PPCHA ~Let me know once you’ve given it to her. I’d really appreciate it.~
DO ~GiveItemCreate("AC#PPFLW",Player1,1,1,0) SetGlobal("AC#PPFlowerDelivery","GLOBAL",1)~ EXIT

CHAIN AC#PPCHA 01.02
~R-right... I’m sorry to have bothered you.~
DO ~EscapeArea()~ EXIT

// 2nd talk

CHAIN IF ~OR(3) Global("AC#PPFlowerDelivery","GLOBAL",1) Global("AC#PPFlowerDelivery","GLOBAL",2) Global("AC#PPFlowerDelivery","GLOBAL",3)~ THEN AC#PPCHA 02.00
~I really hope my aunt will understand I needed to breath. That I needed something else than she does. I didn’t run from her—I ran toward something I needed.~
END
IF~Global("AC#PPFlowerDelivery","GLOBAL",2)~THEN REPLY ~I passed your message and gave the flower to your aunt. She suggested that maybe in a while you should give her some flowers on your own.~ EXTERN AC#PPCHA 02.01
IF~Global("AC#PPFlowerDelivery","GLOBAL",3)~THEN REPLY ~I gave her the flower. I’m not surprised you left. She seems... horrible.~ EXTERN AC#PPCHA 02.02
IF~~THEN REPLY ~Hmm.~ EXIT

CHAIN AC#PPCHA 02.01
~She said that? Huh... I wasn’t expecting that.~
EXTERN AC#PPCHA 02.03

CHAIN AC#PPCHA 02.02
~Well, she's not THAT bad. I mean... she can be nice sometimes.~ 
EXTERN AC#PPCHA 02.03

CHAIN AC#PPCHA 02.03
~Thank you for doing this. It means more than I can say. Now that she knows I’m safe, I can truly begin focusing on what matters.~
==AC#PPCHA ~Whatever that is, exactly. Still figuring that out. But thanks. Really. You’re alright.~
DO ~SetGlobal("AC#PPFlowerDelivery","GLOBAL",4) AddExperienceParty(500)~ EXIT

// After

CHAIN IF ~Global("AC#PPFlowerDelivery","GLOBAL",4)~ THEN AC#PPCHA 03.00
~Peace be with you! You carry the scent of earth and danger—were you in some ruin or dark place? I’m not sure I’m made for such paths… but I hope the stillness I find here helps someone, too.~ 
EXIT

/*
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
*/

////////////////////////////////////////////
CHAIN IF ~Global("AC#PPFlowerDelivery","GLOBAL",1)~ THEN AC#PPCAA 01.00
~What is this rabble now? I have neither time nor patience for unsolicited interruptions. Be gone, unless you bear something of true importance.~
END
IF~PartyHasItem("AC#PPFLW")~THEN REPLY ~Actually, I believe I do. I spoke to your nephew. He left because he wishes to discover life on his own terms. But he wanted you to know he’s well—and he asked me to give you this flower.~ DO ~TakePartyItem("AC#PPFLW") DestroyItem("AC#PPFLW")~ EXTERN AC#PPCAA 01.01
IF~~THEN REPLY ~Right. I'll be leaving then.~ EXIT 

CHAIN AC#PPCAA 01.01
~He did *what*? He’s alive? I thought… I feared the worst. And yet he runs off, vanishing without so much as a word? The *audacity*!~
==AC#PPCAA ~Ungrateful whelp! I sheltered him, clothed him, educated him, gave him *everything*—and this is how he repays me?~
END
IF~~THEN REPLY ~Perhaps that’s exactly the problem.~ EXTERN AC#PPCAA 01.02
IF~~THEN REPLY ~Look, madam, I’m just delivering a message. He’s safe. You’ll see him again, I’m sure. That’s all you need to know.~ EXTERN AC#PPCAA 01.03

CHAIN AC#PPCAA 01.02
~How *dare* you imply such a thing?~
END
IF~~THEN REPLY ~He wants to live his own life. To make his own mistakes. He knows you meant well—but he needs to find his own way.~ EXTERN AC#PPCAA 01.04
IF~~THEN REPLY ~Look, madam, I’m just delivering a message. He’s safe. You’ll see him again, I’m sure. That’s all you need to know.~ EXTERN AC#PPCAA 01.03

CHAIN AC#PPCAA 01.04
~And what, pray tell, did he lack *here*? We have everything—comfort, beauty, security! Look at this district! There’s nothing beyond these walls that could serve him better than what I’ve already provided.~
END
IF~~THEN REPLY ~He’s fine. Just… give him time. Let him stumble. Let him grow.~ EXTERN AC#PPCAA 01.05
IF~~THEN REPLY ~Look, madam, I’m just delivering a message. He’s safe. You’ll see him again, I’m sure. That’s all you need to know.~ EXTERN AC#PPCAA 01.03

CHAIN AC#PPCAA 01.05
~I…~
END
IF~~THEN REPLY ~He’s doing well. Try to focus on *that*.~ EXTERN AC#PPCAA 01.06
IF~~THEN REPLY ~Look, madam, I’m just delivering a message. He’s safe. You’ll see him again, I’m sure. That’s all you need to know.~ EXTERN AC#PPCAA 01.03

CHAIN AC#PPCAA 01.06
~Very well… Tell him… tell him that next time, he ought to bring me the flowers himself. Hmph. That impudent, stupid, beloved boy!~
DO ~SetGlobal("AC#PPFlowerDelivery","GLOBAL",3) EscapeArea()~ EXIT

CHAIN AC#PPCAA 01.03
~Hmph! Then begone, meddler, and take your leave from my sight!~
DO ~SetGlobal("AC#PPFlowerDelivery","GLOBAL",2) EscapeArea()~ EXIT

/*
CHAIN IF ~Global("AC#PPFlowerDelivery","GLOBAL",1)~ THEN AC#PPCAA 01.00
~Who are you? I'm not in the mood for talks with some vagabonds. Leave me be.~
END
IF~PartyHasItem("AC#PPFLW")~THEN REPLY ~I think it's you I've been looking for. I talked to your nephew. He run away from you, because he wants to learn what it means to be alive and to make decisions. But he wants you to know that he's fine and he wanted me to give you that flower.~ DO ~TakePartyItem("AC#PPFLW") DestroyItem("AC#PPFLW")~ EXTERN AC#PPCAA 01.01
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
~Fine. But tell him that... that next time he'd better just come on his own and give me some flowers! That... stupid... wonderful brat!~
DO ~SetGlobal("AC#PPFlowerDelivery","GLOBAL",3) EscapeArea()~ EXIT

CHAIN AC#PPCAA 01.03
~Humph! Just... just go already, will you?!~
DO ~SetGlobal("AC#PPFlowerDelivery","GLOBAL",2) EscapeArea()~ EXIT
*/

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
IF~~THEN REPLY ~How does a child like you end up in a place like this?~ EXTERN AC#PPBOY child


CHAIN AC#PPBOY 01.01
~What—ew! It's not what I meant!~
EXTERN AC#PPBOY 01.03

CHAIN AC#PPBOY 01.02
~Oh... okay. A pity, though.~
EXTERN AC#PPBOY 01.03

CHAIN AC#PPBOY child
~I’m an orphan. The priests here took me in when I had nowhere else to go. They say the goddess doesn’t turn away even the smallest leaf caught in the current.~
EXTERN AC#PPBOY what_about_worms

	CHAIN IF ~~ THEN AC#PPBOY what_about_worms
	~Anyway… are you gonna help me find worms, or not?~
	END
	IF~~THEN REPLY ~No, I'm of very good health.~ EXTERN AC#PPBOY 01.01
	IF~~THEN REPLY ~Erm, I don't think so. Sorry.~ EXTERN AC#PPBOY 01.02
	IF~~THEN REPLY ~I'm not even going to answer that question. Goodbye.~ EXIT

CHAIN AC#PPBOY 01.03
~I REALLY want to catch some good fish and show everyone what a good fisher-boy I can be! But I need a nice fat worm to do that! Let me know if you find one!~
==AC#PPBOY ~There must be some worm around here...~
DO ~SetGlobal("AC#PPWormQuest","GLOBAL",1)~ EXIT

//2nd 

CHAIN IF ~Global("AC#PPWormQuest","GLOBAL",1)~ THEN AC#PPBOY 02.00
~Eh, still no luck with all that worm-hunting job. Seriously, how hard it can be. Where are all the worms when a man needs one! I've looked everywhere.~
END
IF~PartyHasItem("AC#PPWRM")~ THEN REPLY ~Guess what! I've got a worm for you.~ DO ~TakePartyItem("AC#PPWRM") DestroyItem("AC#PPWRM")~ EXTERN AC#PPBOY 02.01
IF~~THEN REPLY ~How does a child like you end up in a place like this?~ EXTERN AC#PPBOY child
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

CHAIN IF ~GlobalLT("AC#PPSymbolQuest","GLOBAL",10)~ THEN AC#PPMON 01.00
~Eldath watch over you, my friend... though my soul drifts heavy, like water burdened by storm.~
END
IF~Global("AC#PPSymbolQuest","GLOBAL",1) Global("AC#PP_AlaAgreesSymbol","GLOBAL",0) PartyHasItem("AC#PPSYM")~THEN REPLY ~I think you deserve this. This is the emblem of Eldath that Merethan carried when he passed. I believe he would have wanted it to be used again.~ EXTERN AC#PPMON 01.03
IF~Global("AC#PPSymbolQuest","GLOBAL",2) Global("AC#PP_AlaAgreesSymbol","GLOBAL",1) PartyHasItem("AC#PPSYM")~THEN REPLY ~I have spoken with Alatoasz. He agrees—you are worthy to bear Merethan’s emblem.~ EXTERN AC#PPMON 01.04
IF~Global("AC#PPSymbolQuest","GLOBAL",0)~THEN REPLY ~You seem somewhat sad. Is something wrong?~ DO ~SetGlobal("AC#PPSymbolQuest","GLOBAL",1)~ EXTERN AC#PPMON 01.01
IF~~THEN REPLY ~How do you like this place, priestess? Duskwood Dell seems like a tranquil enclave in a troubled world.~ EXTERN AC#PPMON 01.02
IF~~THEN REPLY ~This isn't my concern. Goodbye.~ EXTERN AC#PPMON bye
IF~~THEN REPLY ~I hope your heart finds calm soon. Farewell.~ EXTERN AC#PPMON bye  

CHAIN AC#PPMON 01.01
~It’s just... Well, I have lived here for some months now, among the brothers, sisters, and travelers who find shelter beneath Eldath’s peace. I truly believe this is where I am meant to be.~
==AC#PPMON ~The next step in my spiritual journey was to carve the emblem of Eldath myself... but my hands have grown unsteady with age.~
==AC#PPMON ~Despite my best efforts, an old ailment leaves my fingers numb and clumsy. I have tried, again and again, yet I fail each time.~
==AC#PPMON ~I will keep trying... but sometimes I wonder if this task is simply beyond me. Forgive me—you must have heard such tales a thousand times before.~
==AC#PPMON ~Now, tell me—is there anything else you require?~
END
IF~Global("AC#PPSymbolQuest","GLOBAL",1) PartyHasItem("AC#PPSYM")~THEN REPLY ~I think you deserve this. This is the emblem of Eldath that Merethan carried when he passed. I believe he would have wanted it to be used again.~ EXTERN AC#PPMON 01.03
IF~~THEN REPLY ~How do you like this place, priestess? Duskwood Dell seems like a tranquil enclave in a troubled world.~ EXTERN AC#PPMON 01.02
IF~~THEN REPLY ~No. I need to go, I'm done listening to your babbling.~ EXTERN AC#PPMON bye
IF~~THEN REPLY ~No. Have a wonderful day, my friend.~ EXTERN AC#PPMON bye  

CHAIN AC#PPMON 01.02
~Yes... this place is so quiet. After the endless noise of the cities, it feels like a forgotten dream.~
==AC#PPMON ~Here, you hear the song of the waters, the whisper of leaves, the creak of trees dancing in the wind.~
END
IF~Global("AC#PPSymbolQuest","GLOBAL",1) PartyHasItem("AC#PPSYM")~THEN REPLY ~I think you deserve this. This is the emblem of Eldath that Merethan carried when he passed. I believe he would have wanted it to be used again.~ EXTERN AC#PPMON 01.03
IF~Global("AC#PPSymbolQuest","GLOBAL",0)~THEN REPLY ~Yet I hear a shade of sadness in your voice. Is something wrong?~ DO ~SetGlobal("AC#PPSymbolQuest","GLOBAL",1)~ EXTERN AC#PPMON 01.01
IF~~THEN REPLY ~Right. Whatever. I need to go.~ EXTERN AC#PPMON bye
IF~~THEN REPLY ~Thank you for sharing this. May your heart find peace.~ EXTERN AC#PPMON bye  

CHAIN AC#PPMON 01.03
~You would offer me the emblem of a fallen Freewalker of Eldath? That is a great honor... but I cannot accept it lightly. Such a decision must come from the High Fallskeeper himself.~
END
IF~~THEN REPLY ~Shall I speak to the High Fallskeeper on your behalf?~ EXTERN AC#PPMON talk_high_fallskeeper
IF~Global("AC#PP_AlaAgreesSymbol","GLOBAL",1)~THEN REPLY ~I have already spoken with him. He wishes for you to carry it.~ EXTERN AC#PPMON 01.04
IF~~THEN REPLY ~It was only an idea. I have other matters to attend to.~ EXTERN AC#PPMON bye

CHAIN AC#PPMON talk_high_fallskeeper
~That would be a kindness beyond measure. If you could speak a good word for me, it would warm the heart of this old priestess.~
DO ~SetGlobal("AC#PPSymbolQuest","GLOBAL",2)~ EXIT

CHAIN AC#PPMON 01.04  
~The High Fallskeeper grants me the honor of carrying Merethan’s emblem? I am humbled beyond words.~  
==AC#PPMON ~You have shown compassion in a world that often forgets it. Such kindness is rare—and sacred.~  
==AC#PPMON ~I have nothing but my sincere gratitude to offer you, yet know that I shall always include you in my prayers to the Lady of the Still Waters!~  
DO ~TakePartyItem("AC#PPSYM") AddExperienceParty(400) SetGlobal("AC#PPSymbolQuest","GLOBAL",10) ReputationInc(1)~ EXIT  

CHAIN IF ~Global("AC#PPSymbolQuest","GLOBAL",10)~ THEN AC#PPMON 02.00  
~Thanks to you, I may walk the path of peace once more—not in haste, but with patient, steadfast steps.~  
EXIT  

CHAIN AC#PPMON bye
~Farewell, then. May calm guide your hand. Mine tremble too much these days—but you are young. Use your strength to plant seeds of peace, wherever you walk.~
EXIT


////////////////////////////////////////////////////////
////////////////////////////////////////////////////////

////////////////////////////////////////////////////////
////////////////////////////////////////////////////////

BEGIN AC#PPSIR

CHAIN IF ~Global("AC#PPSirineQuest","GLOBAL",0)~ THEN AC#PPSIR 01.00
~Argh!~
END
IF~~THEN REPLY ~Well, it looks like someone's angry.~ DO ~SetGlobal("AC#PPSirineQuest","GLOBAL",1)~ EXTERN AC#PPSIR 01.01
IF~~THEN REPLY ~You’re the only one in this place who does not show harmony.~ DO ~SetGlobal("AC#PPSirineQuest","GLOBAL",1)~ EXTERN AC#PPSIR 01.01
IF~~THEN REPLY ~I think I'll leave you be.~ EXTERN AC#PPSIR bye

CHAIN AC#PPSIR 01.01
~Of course I’m angry! When all songs of the world turn to screams, how could I not be? The Realms shudder with war and madness, as if Toril itself has gone mad.~
==AC#PPSIR ~I came here after my kin clashed with pirates. I saw death... blood... sorrow. Far too much. And now it burns in me—with every breath.~
==AC#PPSIR ~Sometimes I just want to draw another arrow and end it all—to force the world into peace, if that’s what it takes.~
==AC#PPSIR ~But I sought peace, not vengeance. So when Eldath’s voice reached me—gentle as waves upon a sleeping shore—I thought I could let the fury sink. But it clings to me still, like seaweed around the heart.~
END
IF~~THEN REPLY ~I'm really sorry to hear that.~ EXTERN AC#PPSIR 01.02
IF~~THEN REPLY ~I didn’t know Eldath’s call reached voices like yours.~ EXTERN AC#PPSIR eldath_siren
IF~~THEN REPLY ~I don’t think I care about this. I think I’ll just go.~ EXTERN AC#PPSIR 01.03

	CHAIN AC#PPSIR eldath_siren
	~Surprised? So was I. But even storm-bound hearts crave calm. And hers was the only voice that didn’t ask for blood.~
	END
	IF~~THEN REPLY ~Interesting.~ EXTERN AC#PPSIR 01.02
	IF~~THEN REPLY ~I don’t think I care about this. I think I’ll just go.~ EXTERN AC#PPSIR 01.03

CHAIN AC#PPSIR 01.02
~My heart mourns, truly it does... but the fury howls within me like a rising tide.~
DO ~SetGlobal("AC#PPSirineQuest","GLOBAL",1)~ EXIT

CHAIN AC#PPSIR 01.03
~Then go. Leave. The sooner you're gone, the quieter it gets.~
DO ~SetGlobal("AC#PPSirineQuest","GLOBAL",1)~ EXIT

CHAIN AC#PPSIR bye
~Then go. Leave. The sooner you're gone, the quieter it gets.~
EXIT

/*
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
*/

//2nd 

CHAIN IF ~Global("AC#PPSirineQuest","GLOBAL",1)~ THEN AC#PPSIR 02.00
~Argh!~
END
IF~~THEN REPLY ~I'll just leave you be.~ EXIT
IF~PartyHasItem("AC#PPTEA")~THEN REPLY ~I spoke with the dryad in Eldath’s grotto. She believes you should accept that some anger will remain. She gave me this herbal brew to calm you down.~ EXTERN AC#PPSIR 02.01
IF ~PartyHasItem("AC#PPTEA")~ THEN REPLY ~Here — a mouthful of this herbal brew, and your troubles will be gone. Or so the dryad claims.~ EXTERN AC#PPSIR 02.01


CHAIN AC#PPSIR 02.01
~Herbal brew? You think a few sips will make me forget all the terrible things I’ve seen?~
END
IF ~~ THEN REPLY ~Well, it might be worth a try.~ EXTERN AC#PPSIR 02.02
IF ~~ THEN REPLY ~Do you have a better idea?~ EXTERN AC#PPSIR 02.02
IF ~~ THEN REPLY ~To be honest: no.~ EXTERN AC#PPSIR 02.02
IF ~~ THEN REPLY ~Do as you wish. I tried to help, but perhaps you're not ready to feel better.~ EXTERN AC#PPSIR 02.02


CHAIN AC#PPSIR 02.02
~Well... I suppose I can at least give it a chance.~
= ~...~
END
IF ~~ THEN DO ~TakePartyItem("AC#PPTEA") 
DestroyItem("AC#PPTEA")
CreateVisualEffectObject("SPHEALIN",Myself)~ EXTERN AC#PPSIR 02.08

CHAIN AC#PPSIR 02.08
~It does feel... comfortable.~
END
IF ~~ THEN REPLY ~See? That wasn’t so hard.~ EXTERN AC#PPSIR give_arrows
IF ~~ THEN REPLY ~That went better than I expected.~ EXTERN AC#PPSIR give_arrows
IF ~~ THEN REPLY ~Just enjoy this moment. I’ll leave you now.~ EXTERN AC#PPSIR give_arrows

CHAIN AC#PPSIR give_arrows
~A breath of calm at last... the only weight I still carry is this quiver of arrows, forever reminding me of the life I once led.~
== AC#PPSIR ~I’ve held these arrows close for longer than I can remember, but now I feel them pulling me back instead of setting me free — at least within these waters.~ 
= ~You, on the other hand, look like someone who can still make use of them. Take them. They have served me well, but I think they might serve you better. You have my thanks... and perhaps a measure of my peace.~
END
IF ~~ THEN DO ~GiveItemCreate("AC#PPARO",LastTalkedToBy,10,0,0)
GiveItemCreate("AROW05",LastTalkedToBy,10,0,0)
SetGlobal("AC#PPSirineQuest","GLOBAL",2) 
AddexperienceParty(300)~ EXIT


CHAIN IF ~Global("AC#PPSirineQuest","GLOBAL",2)~ THEN AC#PPSIR 03.00
~I’d rather not talk right now... I just want to watch the water.~
EXIT

CHAIN IF ~Global("AC#PPSirineQuest","GLOBAL",3)~ THEN AC#PPSIR 03.0b
~I don’t know why I ever thought this place would make things better...~
EXIT

CHAIN IF ~~ THEN AC#PPSIR bye_no_help
~*sigh*~
EXIT

