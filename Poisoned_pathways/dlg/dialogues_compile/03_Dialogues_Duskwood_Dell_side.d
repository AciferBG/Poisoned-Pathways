// Dialogue sidechars in Duskwood Dell

// Bear telling stories in area ACPP08
BEGIN AC#PP06B // Bear
BEGIN AC#PP06R // Rabbit
BEGIN AC#PP06S // Squirrel
BEGIN AC#PP06M // Rat
BEGIN AC#PP06G // Groundhog
BEGIN AC#PP06P // Pheasant

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

// Dialogue Mannatarv 
BEGIN ~AC#PPMAN~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_0
  SAY ~Welcome, traveler. Few arrive in Duskwood Dell by chance. What brings you beneath these boughs?~
  IF ~~ THEN REPLY ~What is this place?~ GOTO chain_place
  IF ~~ THEN REPLY ~I would like to know more about the Church of Eldath here.~ GOTO chain_church
  IF ~Global("AC#PPSpellCheckPoison","GLOBAL",0)~ THEN REPLY ~I'm looking for your high priest.~ GOTO looking_for_highpriest
  IF ~Global("AC#PPWormQuest","GLOBAL",1) Global("AC##PPWormQuestOrc","GLOBAL",0)~THEN REPLY ~I'm searching for an earthworm. Have you seen one by chance?~ EXTERN AC#PPMAN seek_worm
  IF ~~ THEN REPLY ~This is not the moment for quiet reflection.~ GOTO bye
END

IF ~True()~ THEN BEGIN hello_1
  SAY ~Greetings again. What can I do for you, seeker of peace?~
  IF ~~ THEN REPLY ~Tell me about this place.~ GOTO chain_place
  IF ~~ THEN REPLY ~I would like to know more about the Church of Eldath here.~ GOTO chain_church
  IF ~Global("AC#PPSpellCheckPoison","GLOBAL",0)~ THEN REPLY ~I'm looking for your high priest.~ GOTO looking_for_highpriest
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
  IF ~~ THEN REPLY ~Uh, all right. I’ll go find him there.~ GOTO looking_for_highpriest_bye
  IF ~~ THEN REPLY ~Right then. Into the trees we go.~ GOTO looking_for_highpriest_bye
  IF ~~ THEN REPLY ~I have another question.~ GOTO questions

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
  IF ~~ THEN REPLY ~And what is the purpose of this place?~ GOTO chain_place_more_02
  IF ~~ THEN REPLY ~You've given me much to reflect on. Farewell.~ GOTO bye

CHAIN IF ~~ THEN AC#PPMAN chain_place_more_02
~The purpose of this place? What purpose does peace need? Peace is the will to let go of burden, blade, and bitterness. You will find no temples of carved stone here. Only open sky, and the gentle song of streams below.~
END  
  IF ~~ THEN REPLY ~Thank you for your insights. I must go.~ EXTERN AC#PPMAN bye
  IF ~~ THEN REPLY ~That’s enough wisdom for now. Time to move on.~ EXTERN AC#PPMAN bye



// Two Eldathyn priests debating

BEGIN AC#PPST1 
BEGIN AC#PPST2

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

CHAIN IF ~~ THEN AC#PPST1 stillness
~Stillness is the essence of Eldath’s teaching. In silence, we find truth.~
==AC#PPST2 ~Silence, yes—but not passivity. Even the river flows, though it makes no noise in the deep.~
==AC#PPST1 ~And yet, a still pool reflects more clearly than rushing water. Action must come only after reflection.~
==AC#PPST2 ~Reflection without movement is stagnation. Peace must walk the land, not only dream beneath it.~
==AC#PPST1 ~I do not dispute the need to act—but our first duty is to preserve calm, not chase conflict.~
==AC#PPST2 ~Nor do I seek conflict. But even a gentle hand must lift a branch when it blocks the light.~
==AC#PPST1 ~Then we are agreed, perhaps: peace is not the absence of motion, but its guidance.~
==AC#PPST2 ~Well said. May our steps remain light, and our purpose rooted.~
EXIT

CHAIN IF ~~ THEN AC#PPST1 war
~War is the great wound of the world. Wherever it passes, peace must struggle to grow again.~
==AC#PPST2 ~True—but some say without war, peace would have no meaning. What do we tell them?~
==AC#PPST1 ~That peace is not the absence of pain, but the healing that follows. War is a fire; peace is the rain.~
==AC#PPST2 ~And yet some rains come too late. I have seen fields scorched beyond all tending.~
==AC#PPST1 ~Even the blackest earth may bloom again, if given time and care. Eldath does not give up on any soil.~
==AC#PPST2 ~Then neither shall we. But what of those who march now, sword in hand, claiming their cause is just?~
==AC#PPST1 ~Let them march. We shall walk. And wherever they burn, we shall plant.~
==AC#PPST2 ~And in time, may flowers grow where banners once stood.~
EXIT

CHAIN IF ~~ THEN AC#PPST1 water
~Water is the voice of Eldath. It sings in streams and whispers in the mist.~
==AC#PPST2 ~And yet it has no shape of its own. It takes the form of all things, and resists none.~
==AC#PPST1 ~That is its strength. In yielding, it endures. In softness, it wears down stone.~
==AC#PPST2 ~And when troubled, it reflects nothing. It reminds us to still our thoughts.~
==AC#PPST1 ~But when it is clear, it reveals truth—even when we are not ready to see it.~
==AC#PPST2 ~It quenches thirst, nourishes life, and yet... in floods, it destroys.~
==AC#PPST1 ~Even peace must be balanced. Eldath’s waters flow gently, but they do not forget their power.~
==AC#PPST2 ~Then let us serve as she does: quiet, giving... and strong beneath the surface.~
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
  SAY ~Magic. Memory. Meaning. All pass through here, as do you. Shall we speak of what lingers?~ 
  IF ~~ THEN REPLY ~What exactly do you offer?~ GOTO chain_about_shop
  IF ~~ THEN REPLY ~Not today. Perhaps another time.~ GOTO 1
  IF ~~ THEN REPLY ~Let me see what you have.~ DO ~StartStore("AC#PPMYS",LastTalkedToBy())~ EXIT
END

IF ~~ THEN BEGIN 1
  SAY ~Then walk in balance, and may no veil cloud your vision.~
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 2
  SAY ~Magic, drawn from the currents of arcane and divine thought.~ 
  IF ~~ THEN REPLY ~Let me see what knowledge you've gathered.~ GOTO shop
  IF ~~ THEN REPLY ~I’ll pass, for now.~ GOTO 1
END

IF ~~ THEN BEGIN shop
  SAY ~Then gaze with care. Some knowledge glows to guide—but some burns if held too tightly.~
  IF ~~ THEN DO ~StartStore("AC#PPMYS",LastTalkedToBy())~ EXIT
END


CHAIN IF ~~ THEN AC#PPMYS chain_about_shop
~I offer scrolls—threads of arcane thought inked by steady hands. Spells, yes, but more than that: intentions given form, memory made fire.~ 
==AC#PPMYS ~And for those attuned to subtler currents... I offer candles. Crafted with sigils, wax, and prayer. They burn with purpose—some to soothe the spirit, others to sharpen the mind, or hold back what creeps in the dark.~
==AC#PPMYS ~They call it candle-magic. I call it quiet power.~
END  
  IF ~~ THEN REPLY ~I’ll look, then. Words have power, and so does flame.~ EXTERN AC#PPMYS shop
  IF ~~ THEN REPLY ~I’ll pass, for now.~ EXTERN AC#PPMYS 1

// priest of Eldath, store in area ACPP02
BEGIN ~AC#PPEL8~

IF ~True()~ THEN BEGIN 0
  SAY ~Welcome, my <BROTHERSISTER>. You stand in a place of stillness, under the gentle grace of Eldath, the Quiet One. May her peace settle upon your heart.~
  IF ~~ THEN REPLY ~I would like to see your services.~ GOTO 1
  IF ~~ THEN REPLY ~Could you tell me more about Eldath?~ GOTO 2
  IF ~~ THEN REPLY ~I see. I shall be going.~ GOTO 3
END

IF ~~ THEN BEGIN 1
  SAY ~Of course, my <BROTHERSISTER>. Step softly, and let peace guide your path.~
  IF ~~ THEN DO ~StartStore("AC#PPEL8",LastTalkedToBy(Myself))~ EXIT
END

IF ~~ THEN BEGIN 2
  SAY ~Eldath is the goddess of peace, still waters, and quiet groves. We offer sanctuary to those seeking harmony, far from the clamor of the world. No blade is drawn where her blessing lingers.~
  IF ~~ THEN REPLY ~Could I see your services?~ GOTO 1
  IF ~~ THEN REPLY ~I see. I shall be going.~ GOTO 3
END

IF ~~ THEN BEGIN 3
  SAY ~May the soft winds of Eldath guide you, <BROTHERSISTER>.~
  IF ~~ THEN EXIT
END

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
DO ~SetGlobal("AC#PPFlowerDelivery","GLOBAL",4) AddExperienceParty(1800)~ EXIT

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
==AC#PPMON ~Please, take this in gratitude. I have kept this necklace for many years. Its light is gentle, yet enduring... much like the path you now walk.~
==AC#PPMON ~May it strengthen your heart when shadows gather, and remind you that even the smallest kindness can ripple far beyond your sight.~
==AC#PPMON ~Let mercy be your shield, and compassion your guide. Farewell, traveler.~
DO ~GiveItemCreate("AC#PPAM",Player1,1,0,0) TakePartyItem("AC#PPSYM") AddExperienceParty(4000) SetGlobal("AC#PPSymbolQuest","GLOBAL",10) EscapeArea()~ EXIT

CHAIN IF ~Global("AC#PPSymbolQuest","GLOBAL",10)~ THEN AC#PPMON 02.00
~I told our High Fallskeeper how grateful I am for the emblem you gave me. He has offered to teach me further, and I have gladly accepted.~
==AC#PPMON ~I feel... proud of myself. I am glad I chose this path. And I am grateful to have met you, my friend.~
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
~Argh!!!~
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
~Fine. Just give me that.~
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