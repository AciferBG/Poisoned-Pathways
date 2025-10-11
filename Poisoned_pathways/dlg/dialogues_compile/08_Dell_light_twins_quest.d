
// the Dell-Light Twins
BEGIN AC#PPFAE

CHAIN IF ~Global("FairyTwinsKidnapQuest","GLOBAL",10)~ THEN AC#PPFAE hello_saviour
~^0xFFE3B0FF Lilafern: ^-<CHARNAME>! The world feels wide again — the air, the light, even the sound of your footsteps!~
== AC#PPFAE ~^0xFF9ADCE3 Tippledew: ^-If we could bottle freedom, it would sound just like that — and sparkle twice as bright!~
== AC#PPFAE ~^0xFFE3B0FF Lilafern: ^-No more bottles, Tippledew — ever. I’d rather sleep in a dragon’s mouth than in another jar!~
== AC#PPFAE ~^0xFF9ADCE3 Tippledew: ^-Have you come to make a wish, or to solve some riddles?~
END   
IF~~THEN REPLY ~A wish, perhaps… can you really grant one?~ EXTERN AC#PPFAE Dusklight_Wish  
IF~~THEN REPLY ~You want to ask riddles? Go ahead.~ EXTERN AC#PPFAE Dusklight_riddles 
IF~~THEN REPLY ~Stop sparkling near my face, please.~ EXTERN AC#PPFAE Dusklight_Grumpy
IF~~THEN REPLY ~Just passing through, little ones.~ EXTERN AC#PPFAE Dusklight_Pass 

// The faeries are freed in Duskwood Dell
CHAIN IF ~Global("FairyTwinsKidnapQuest","GLOBAL",8)~ THEN AC#PPFAE hello_free
~^0xFFE3B0FF Lilafern: ^-We’re free!~
== AC#PPFAE ~^0xFF9ADCE3 Tippledew: ^-The hero <CHARNAME> has freed us!~
== AC#PPMAN ~Oh, it’s so wonderful to see you both again!~
== AC#PPFAE ~^0xFFE3B0FF Lilafern: ^-Brother Edrim! You won’t be angry if we start tugging at your robe again, will you?~
== AC#PPMAN ~No, certainly not. You may tease me as much as you like — I’m just glad you’re safe.~
== AC#PPFAE ~^0xFF9ADCE3 Tippledew: ^-I tell you, that was *quite* an adventure!~
== AC#PPFAE ~^0xFFE3B0FF Lilafern: ^-And all that adventuring makes one terribly sleepy!~
== AC#PPFAE ~^0xFF9ADCE3 Tippledew: ^-Yes, Lilafern. Let’s rest — but not before we thank our rescuer properly.~
== AC#PPFAE ~^0xFFE3B0FF Lilafern: ^-Thank you! A hundred blessings and a hundred sparkles upon you, <CHARNAME>! We’d have kissed your boots if they weren’t so terribly muddy.~
== AC#PPFAE ~^0xFF9ADCE3 Tippledew: ^-Thank you, <CHARNAME> — truly. You’ve given us back the wind, the light, and the laughter. We’ll never forget the sound of your voice breaking that dreadful silence.~  
DO ~SetGlobal("FairyTwinsKidnapQuest","GLOBAL",10)
EscapeArea()~
EXIT


CHAIN IF ~Global("AC#PP_TalkedToFaeries","GLOBAL",0)~ THEN AC#PPFAE hello_0
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

CHAIN IF ~True()~ THEN AC#PPFAE hello_again
~^0xFFE3B0FF Lilafern: ^-The tall one returns — and still unsparkly, I see!~
== AC#PPFAE ~^0xFF9ADCE3 Tippledew: ^-Have you come to make a wish, or to solve some riddles?~ 
END
IF~~THEN REPLY ~Who are you?~ EXTERN AC#PPFAE who_are_you    
IF~~THEN REPLY ~A wish, perhaps… can you really grant one?~ EXTERN AC#PPFAE Dusklight_Wish  
IF~~THEN REPLY ~You want to ask riddles? Go ahead.~ EXTERN AC#PPFAE Dusklight_riddles 
IF~~THEN REPLY ~Stop sparkling near my face, please.~ EXTERN AC#PPFAE Dusklight_Grumpy
IF~~THEN REPLY ~Just passing through, little ones.~ EXTERN AC#PPFAE Dusklight_Pass 

CHAIN AC#PPFAE who_are_you
~^0xFFE3B0FF Lilafern: ^-We are the Dell-Light Twins, keepers of night giggles and guardians of… well, nothing terribly important.~   
END
IF~~THEN REPLY ~Dell-Light Twins?~ EXTERN AC#PPFAE dell_light_twins
IF~~THEN REPLY ~Yes, but what are you? Two glowing dots?~ EXTERN AC#PPFAE what_are_you_really
IF~~THEN REPLY ~Just passing through, little ones.~ EXTERN AC#PPFAE Dusklight_Pass

// Dell-Light Twins – Name Explanation
CHAIN AC#PPFAE dell_light_twins
~^0xFF9ADCE3 Tippledew: ^-A fitting name, don’t you think? We’re making Duskwood Dell lightful!~
== AC#PPFAE ~^0xFFE3B0FF Lilafern: ^-For those who delight the Dell not only in daylight, of course.~  
END
IF~~THEN REPLY ~Yes, but what are you? Two glowing dots?~ EXTERN AC#PPFAE what_are_you_really
IF~~THEN REPLY ~Just passing through, little ones.~ EXTERN AC#PPFAE Dusklight_Pass


CHAIN AC#PPFAE what_are_you_really
~^0xFFE3B0FF Lilafern: ^-We’re faeries, silly! Too small for your eyes, too quick for your hands.~  
== AC#PPFAE ~^0xFF9ADCE3 Tippledew: ^-Duskwood Dell is our home! Someone has to keep this peace-loving crowd from dozing off.~ 
== AC#PPFAE ~^0xFF9ADCE3 Lilafern: ^-It’s called Duskwood Dell, after all — not Duskwood *Dull*!~    
END
IF~~THEN EXTERN AC#PPFAE hub
	
  
CHAIN AC#PPFAE hub
~^0xFF9ADCE3 Tippledew: ^-Anyway. Have you come to make a wish, or to solve some riddles?~ 
END
IF~~THEN REPLY ~Who are you?~ EXTERN AC#PPFAE who_are_you    
IF~~THEN REPLY ~A wish, perhaps… can you really grant one?~ EXTERN AC#PPFAE Dusklight_Wish  
IF~~THEN REPLY ~You want to ask riddles? Go ahead.~ EXTERN AC#PPFAE Dusklight_riddles 
IF~~THEN REPLY ~Stop sparkling near my face, please.~ EXTERN AC#PPFAE Dusklight_Grumpy
IF~~THEN REPLY ~Just passing through, little ones.~ EXTERN AC#PPFAE Dusklight_Pass 

// Faerie Riddle Scene
CHAIN AC#PPFAE Dusklight_riddles
~^0xFFE3B0FF Lilafern: ^-A riddle! A game! Let’s test the tall one’s brain!~
== AC#PPFAE ~^0xFF9ADCE3 Tippledew: ^-Oh yes! Riddles are like sparkles – they reveal who’s dull!~
END 
IF ~Global("AC#PP_RiddleWon","GLOBAL",0)~ THEN EXTERN AC#PPFAE Riddle_01
IF ~Global("AC#PP_RiddleWon","GLOBAL",1)~ THEN EXTERN AC#PPFAE Riddle_02
IF ~Global("AC#PP_RiddleWon","GLOBAL",2)~ THEN EXTERN AC#PPFAE Riddle_03
IF ~Global("AC#PP_RiddleWon","GLOBAL",3)~ THEN EXTERN AC#PPFAE Riddle_No_riddle_left
IF ~Global("AC#PP_RiddleWon","GLOBAL",4)~ THEN EXTERN AC#PPFAE Riddle_finished

	CHAIN AC#PPFAE Riddle_finished
	~^0xFFE3B0FF Lilafern: ^-Already forgotten? You’ve won, remember. No more riddles for now.~  
	== AC#PPFAE ~^0xFF9ADCE3 Tippledew: ^-At least, not for a while.~  
	END
	IF~~THEN EXTERN AC#PPFAE hub

// Riddle # 1:
	CHAIN AC#PPFAE Riddle_01
	~^0xFFE3B0FF Lilafern: ^-Listen then, wanderer of the Dell:
	"I am not alive, yet I grow.  
	I have no lungs, yet I need air.  
	I have no mouth, yet water kills me.  
	What am I?"~  
	END
	IF~~THEN REPLY ~Shurely a mushroom.~ EXTERN AC#PPFAE Riddle_01_Wrong
	IF~~THEN REPLY ~You’re talking about fire.~ EXTERN AC#PPFAE Riddle_01_Correct
	IF~~THEN REPLY ~A shadow, perhaps?~ EXTERN AC#PPFAE Riddle_01_Wrong
	IF~~THEN REPLY ~A gelatinous cube.~ EXTERN AC#PPFAE Riddle_01_Wrong
	IF~~THEN REPLY ~That’s a silly question. None of those things exist.~ EXTERN AC#PPFAE Riddle_01_Teasing

	// Correct answer – they hate losing
	CHAIN AC#PPFAE Riddle_01_Correct
	~^0xFFE3B0FF Lilafern: ^-Fire?! ...Fire, <PRO_HESHE> said fire!~
	== AC#PPFAE ~^0xFF9ADCE3 Tippledew: ^-That’s cheating!~
	== AC#PPFAE ~^0xFFE3B0FF Lilafern: ^-We spent an hour polishing that riddle!~
	== AC#PPFAE ~^0xFF9ADCE3 Tippledew: ^-Next time we’ll ask about metamagics or psionics!~
	== AC#PPFAE ~^0xFFE3B0FF Lilafern: ^-Fine! You win... but only because you’re taller.~  
	DO ~SetGlobal("AC#PP_RiddleWon","GLOBAL",1)~  
	EXIT

	// Wrong answer – they mock gently
	CHAIN AC#PPFAE Riddle_01_Wrong
	~^0xFFE3B0FF Lilafern: ^-Oh, lovely guess! Entirely wrong, but lovely!~
	== AC#PPFAE ~^0xFF9ADCE3 Tippledew: ^- We adore confidence more than accuracy!~
	== AC#PPFAE ~^0xFFE3B0FF Lilafern: ^-Try before we start giving *hints* that make it worse.~  
	END
	IF ~~ THEN REPLY ~All right, I’ll try again.~ EXTERN AC#PPFAE Riddle_01
	IF ~~ THEN REPLY ~No more riddles for now.~ EXTERN AC#PPFAE Riddle_bye

	CHAIN AC#PPFAE Riddle_01_Teasing
	~^0xFFE3B0FF Lilafern: ^-Oh, a skeptic! How *refreshing!*~
	== AC#PPFAE ~^0xFF9ADCE3 Tippledew: ^-Let’s tickle <PRO_HIMHER> anyway, just for balance!~
	== AC#PPFAE ~^0xFFE3B0FF Lilafern: ^-No, no, <PRO_HESHE>’s funny. We’ll keep <PRO_HIMHER> for riddles later.~  
	EXIT

	// Riddle bye
	CHAIN AC#PPFAE Riddle_bye
	~^0xFFE3B0FFLilafern:^– Oh! No more riddles? How tragic!~
	== AC#PPFAE ~^0xFFE3B0FFLilafern:^– Come, Tippledew — let’s find someone who appreciates confusion!~  
	EXIT

// Riddle #2: – mimic

CHAIN AC#PPFAE Riddle_02
~^0xFFE3B0FF Lilafern: ^-All right then, another riddle! Listen closely:
"I lurk in dungeons patiently.
I feast on those who walk too greedily.
Be bold, come close,
and see what lingers —
I glitter for gold,
and charge in fingers.  
What am I?"~
END
IF~~THEN REPLY ~A ghost, perhaps?~ EXTERN AC#PPFAE Riddle_02_Wrong
IF~~THEN REPLY ~A doppleganger.~ EXTERN AC#PPFAE Riddle_02_Wrong
IF~~THEN REPLY ~An echo.~ EXTERN AC#PPFAE Riddle_02_Wrong
IF~~THEN REPLY ~A mimic.~ EXTERN AC#PPFAE Riddle_02_Correct
IF~~THEN REPLY ~That’s nonsense. You just made that up.~ EXTERN AC#PPFAE Riddle_02_Teasing

// Correct answer
CHAIN AC#PPFAE Riddle_02_Correct
~^0xFF9ADCE3 Tippledew: ^-No, <PRO_HESHE> knew; <PRO_HESHE> actually knew!~
== AC#PPFAE ~^0xFFE3B0FF Lilafern: ^-That was supposed to be unsolvable!~
== AC#PPFAE ~^0xFF9ADCE3 Tippledew: ^-Did you bribe a mindflayer for answers?~
== AC#PPFAE ~^0xFFE3B0FF Lilafern: ^-Fine, clever <PRO_RACE>. You win again. But next time, we’ll make it rhyme in Draconic!~  
DO ~SetGlobal("AC#PP_RiddleWon","GLOBAL",2)~  
EXIT

// Wrong answer – generic response
CHAIN AC#PPFAE Riddle_02_Wrong
~^0xFFE3B0FF Lilafern: ^-Oh, lovely guess! Entirely wrong, but lovely!~
== AC#PPFAE ~^0xFF9ADCE3 Tippledew: ^-We adore confidence more than accuracy!~
== AC#PPFAE ~^0xFFE3B0FF Lilafern: ^-Try again before we start giving *terrible* hints.~  
END
IF ~~ THEN REPLY ~All right, I’ll try again.~ EXTERN AC#PPFAE Riddle_02
IF ~~ THEN REPLY ~I’ve had enough of your riddles.~ EXTERN AC#PPFAE Riddle_bye

// Teasing response
CHAIN AC#PPFAE Riddle_02_Teasing
~^0xFFE3B0FF Lilafern: ^-Mocking the questioner? Bold move!~
== AC#PPFAE ~^0xFF9ADCE3 Tippledew: ^-Let’s tickle <PRO_HIMHER> anyway, just for fun!~
== AC#PPFAE ~^0xFFE3B0FF Lilafern: ^-We’ll see if <PRO_HESHE> laughs in echo.~  
EXIT

// Riddle #3:  – Frog

CHAIN AC#PPFAE Riddle_03
~^0xFF9ADCE3 Tippledew: ^-Another challenge! The riddle of mud and majesty!~
== AC#PPFAE ~^0xFFE3B0FF Lilafern: ^-Listen well, wanderer:  
"I live in the quiet, I sing in the rain.  
I leap without fear, yet I never complain.  
My crown is of mud, my throne a bog.  
Kiss me, and you’ll turn into a...?"~
== AC#PPFAE ~^0xFF9ADCE3 Tippledew: ^-Choose wisely! The wrong kiss can last forever!~
END
IF~~THEN REPLY ~A dog.~ EXTERN AC#PPFAE Riddle_03_Wrong
IF~~THEN REPLY ~A hog.~ EXTERN AC#PPFAE Riddle_03_Wrong
IF~~THEN REPLY ~A frog.~ EXTERN AC#PPFAE Riddle_03_Correct
IF~~THEN REPLY ~A vampire.~ EXTERN AC#PPFAE Riddle_03_vampire

CHAIN AC#PPFAE Riddle_03_Correct
~^0xFFE3B0FF Lilafern: ^-Frog, <PRO_HESHE> actually said frog!~
== AC#PPFAE ~^0xFF9ADCE3 Tippledew: ^-Unbelievable!~
== AC#PPFAE ~^0xFFE3B0FF Lilafern: ^-Fine, clever <PRO_RACE>, you win. Again. Stop being right, it’s annoying.~  
== AC#PPFAE ~^0xFF9ADCE3 Tippledew: ^-Next time we’ll ask something unsolvable. Like the mating habits of flumphs.~  
DO ~SetGlobal("AC#PP_RiddleWon","GLOBAL",3)~  
EXIT

CHAIN AC#PPFAE Riddle_03_Wrong
~^0xFFE3B0FF Lilafern: ^-Oh, wonderful! Entirely wrong, but so confident!~
== AC#PPFAE ~^0xFF9ADCE3 Tippledew: ^-We cherish enthusiasm almost as much as accuracy!~
== AC#PPFAE ~^0xFFE3B0FF Lilafern: ^-Try again before we start kissing random guesses!~  
END
IF ~~ THEN REPLY ~All right, I’ll try again.~ EXTERN AC#PPFAE Riddle_03
IF ~~ THEN REPLY ~I’ve had enough of your riddles.~ EXTERN AC#PPFAE Riddle_bye

CHAIN AC#PPFAE Riddle_03_vampire
~^0xFFE3B0FF Lilafern: ^-A vampire?! Ugh! Cold lips, no sense of rhyme!~
== AC#PPFAE ~^0xFF9ADCE3 Tippledew: ^-Imagine the bite marks!~
== AC#PPFAE ~^0xFFE3B0FF Lilafern: ^-And their mirrors never work!~
== AC#PPFAE ~^0xFF9ADCE3 Tippledew: ^-Truly, the saddest kind of immortality. Oh, and before you get too excited: that was, of course, the wrong answer to our riddle.~
==HEXXATJ IF ~InParty("hexxat") !StateCheck("hexxat",CD_STATE_NOTVALID)~ THEN ~How very pedestrian.~ 
END
IF ~~ THEN REPLY ~All right, I’ll try again.~ EXTERN AC#PPFAE Riddle_03
IF ~~ THEN REPLY ~I’ve had enough of your riddles.~ EXTERN AC#PPFAE Riddle_bye

// Riddle #4 - but none left!

CHAIN AC#PPFAE Riddle_No_riddle_left
~^0xFF9ADCE3 Tippledew: ^-All right! One last riddle, the ultimate test of mortal wit!~
== AC#PPFAE ~^0xFFE3B0FF Lilafern: ^-Oh, wonderful! Go on then, Tippledew — dazzle <PRO_HIMHER> with your brilliance!~
== AC#PPFAE ~^0xFF9ADCE3 Tippledew: ^-Me? I thought *you* had one ready!~
== AC#PPFAE ~^0xFFE3B0FF Lilafern: ^-Me? No. You need to think of something!~
== AC#PPFAE ~^0xFF9ADCE3 Tippledew: ^-I am! I’m thinking very loudly!~
== AC#PPFAE ~^0xFFE3B0FF Lilafern: ^-You don’t need to think loudly — you need to think faster!~
== AC#PPFAE ~^0xFF9ADCE3 Tippledew: ^-...~
== AC#PPFAE ~^0xFFE3B0FF Lilafern: ^-Ugh, fine. We give up.~
== AC#PPFAE ~^0xFF9ADCE3 Tippledew: ^-Yes! The clever <PRO_RACE> wins!~
== AC#PPFAE ~^0xFF9ADCE3 Tippledew: ^-Let’s sprinkle <PRO_HIMHER> with sparks. Or maybe fairy dust.~  
DO ~SetGlobal("AC#PP_RiddleWon","GLOBAL",4) ReallyForceSpell(Myself,FLASHY_2) RunAwayFrom(LastTalkedToBy(Myself),30)~  
EXIT

	
		/*
	CHAIN AC#PPFAE Riddle_01_Wrong
	~^0xFF9ADCE3Tippledew:^–What? Hahaha, <PRO_HESHE> thinks darkness breathes!~
	== AC#PPFAE ~^0xFFE3B0FFLilafern:^–So close, so close – and yet entirely wrong!~
	== AC#PPFAE ~^0xFF9ADCE3Tippledew:^–Guess again when your brain’s had a nap.~  
	EXIT
	*/


	CHAIN AC#PPFAE Dusklight_Grumpy
	~^0xE3B0FFTippledew: ^-Near your face? But your face is so *unsparkly*!~
	== AC#PPFAE ~^0xFFE3B0FF Lilafern: ^-It needs help! Urgent sparkle intervention!~  
	== AC#PPFAE ~^0xFFE3B0FF Lilafern: ^-Come, Tippledew — initiate sparkle retreat protocol!~  
	== AC#PPFAE ~^0xFF9ADCE3 Tippledew: ^-Careful, wanderer… if we stop sparkling near your face, who will keep your bad dreams away?~  
		DO ~ReallyForceSpell(Myself,FLASHY_2)
	RunAwayFrom(LastTalkedToBy(Myself),30)~ EXIT

	CHAIN AC#PPFAE Dusklight_Wish
	~^0xFF9ADCE3Tippledew: ^-A wish?! Did you hear that, Lilafern? A *wish*!~
	== AC#PPFAE ~^0xFFE3B0FF Lilafern: ^-Quick, where did we put the paperwork? The forms? The regulations on improbable miracles?!~
	== AC#PPFAE ~^0xFF9ADCE3Tippledew: ^-Shh! We’re off duty tonight. Last wish we granted turned a toad into... a slimy toad.~
	== AC#PPFAE ~^0xFFE3B0FF Lilafern: ^-Very confusing for everyone involved.~  
	== AC#PPFAE ~^0xFF9ADCE3Tippledew: ^-But! If you wish for laughter or moonlight, we can manage those. They’re in surplus.~  
	== AC#PPFAE ~^0xFFE3B0FF Lilafern: ^-Anything bigger, and you’ll have to speak with our superior. That’s Eldath, obviously. She’s terrible with scheduling, though.~  
	END
	IF~~THEN EXTERN AC#PPFAE hub
	
	CHAIN AC#PPFAE Dusklight_Frog
	~^0xFFE3B0FF Lilafern: ^-Oh yes! Very sacred! Very slimy!~  
	== AC#PPFAE ~^0xFF9ADCE3 Tippledew: ^-We protect them from… well, mostly from needing to kiss the wrong people.~
	== AC#PPFAE ~One traveler tried it once. He wrote poetry. Terrible poetry. Lots of croaking rhymes.~
	== AC#PPFAE ~^0xFF9ADCE3 Tippledew: ^-Now we just keep an eye on them. Someone has to make sure they don’t start a frogolution.~ 
	== AC#PPFAE ~^0xFFE3B0FF Lilafern: ^-Anyway, sacred work. No pay, but excellent splashing privileges.~  
	DO ~ReallyForceSpell(Myself,FLASHY_2)
	RunAwayFrom(LastTalkedToBy(Myself),30)~ EXIT

	CHAIN AC#PPFAE Dusklight_Pass
	~^0xFFE3B0FF Lilafern: ^-Fine, pass. Tread softly, tall one — the grass remembers footsteps.~   
	== AC#PPFAE ~^0xFF9ADCE3 Tippledew: ^-Come back when you’re not in such a hurry. We like conversations that wander in circles.~  
	DO ~ReallyForceSpell(Myself,FLASHY_1)
	RunAwayFrom(LastTalkedToBy(Myself),30)~ EXIT
	
	
// Zar’khaan – the Rakshasa disguised as a merchant
BEGIN AC#PPZAR

CHAIN IF ~Global("AC#PPRakAttack","GLOBAL",1)~ THEN AC#PPZAR hello_attack
~You dare to attack me? ME?~
DO ~SetGlobal("AC#PPRakAttack","GLOBAL",2)
SetGlobal("FairyTwinsKidnapQuest","GLOBAL",5)
Polymorph(RAKSHASA)
Enemy()~ EXIT

CHAIN IF ~Global("AC#PPRakPrison","GLOBAL",1)~ THEN AC#PPZAR hello_prison
~Foolish mortal! Another soul in my collection!~
DO ~SetGlobal("AC#PPRakPrison","GLOBAL",2)
SetGlobal("FairyTwinsKidnapQuest","GLOBAL",5)
Enemy()~ EXIT

// Zar'khaan urges the player to use the scroll immediately
CHAIN IF ~Global("AC#PPRakScroll","GLOBAL",1)~ THEN AC#PPZAR sell_wish_followup
~You purchased the wish scroll! My congratulations on such a rare acquisition. Before you go, a small detail — and a curious one at that.~
== AC#PPZAR ~The scroll’s ink is... volatile, shall we say. It holds its power only for a short while after purchase. Forgive me, I may have forgotten to mention that. Call me greedy, but I am a merchant after all, yes? Best to use it while the magic is still awake. What is the point of a wish unspoken?~
== AC#PPZAR ~Go on, try it right here, at once! Simple words, clear intent — that’s all it takes. And should you find yourself struck speechless by joy... do remember who made it possible: me!~
END
IF~~THEN REPLY ~You deceived me. You should have told me that before!~ EXTERN AC#PPZAR sell_scroll_fooled_me
IF~~THEN REPLY ~If you say so...~ EXTERN AC#PPZAR sell_scroll_alright

CHAIN AC#PPZAR sell_scroll_fooled_me
~Oh, no deceit, my friend! The scroll works exactly as you imagine it does. I merely... omitted a minor detail. Forgive a merchant his little secrets.~
END
IF~~THEN REPLY ~If you say so...~ EXTERN AC#PPZAR sell_scroll_alright

// Player agrees to try the scroll
CHAIN AC#PPZAR sell_scroll_alright
~But of course! Why would a successful merchant such as myself ever deceive you?~
EXIT

CHAIN IF ~True()~ THEN AC#PPZAR hello_0
~A traveler of taste and coin approaches! A thousand welcomes to you. I trade in curiosities and comforts, trinkets and temptations — all perfectly harmless, of course.~
END
IF~Global("AC#PP_RakStoreVisit","GLOBAL",0)~THEN REPLY ~Show me what you have for sale.~ DO ~SetGlobal("AC#PP_RakStoreVisit","GLOBAL",1)~ EXTERN AC#PPZAR start_store
IF~Global("AC#PP_RakStoreVisit","GLOBAL",1)~THEN REPLY ~Show me what you have for sale.~ EXTERN AC#PPZAR start_store
IF ~Global("AC#PP_RakStoreVisit","GLOBAL",1)~ THEN REPLY ~You keep some rather unusual things in your shop.~ EXTERN AC#PPZAR store_strange
IF~~THEN REPLY ~What do you sell?~ EXTERN AC#PPZAR what_items
IF~~THEN REPLY ~No thanks, I’m just passing through.~ EXTERN AC#PPZAR Farewell

CHAIN  AC#PPZAR hub
~So then, will you be buying something after all?~ 
END
IF~Global("AC#PP_RakStoreVisit","GLOBAL",0)~THEN REPLY ~Show me what you have for sale.~ DO ~SetGlobal("AC#PP_RakStoreVisit","GLOBAL",1)~ EXTERN AC#PPZAR start_store
IF~Global("AC#PP_RakStoreVisit","GLOBAL",1)~THEN REPLY ~Show me what you have for sale.~ EXTERN AC#PPZAR start_store
IF ~Global("AC#PP_RakStoreVisit","GLOBAL",1)~ THEN REPLY ~You keep some rather unusual things in your shop.~ EXTERN AC#PPZAR store_strange
IF~~THEN REPLY ~What do you sell?~ EXTERN AC#PPZAR what_items
IF~~THEN REPLY ~No thanks, I’m just passing through.~ EXTERN AC#PPZAR Farewell

// Zar'khaan reacts to comment about strange wares
CHAIN AC#PPZAR store_strange
~Unusual? I prefer selective. Every item here has a story, and some stories simply... refuse to end.~
== AC#PPZAR ~Strangeness sells, my friend. Ordinary things have such dull appetites. Still, I admire your eye — most pass by without noticing that my curiosities notice them back.~
END
IF~~THEN EXTERN AC#PPZAR hub


CHAIN AC#PPZAR start_store
~With delight! Step closer, do not be shy. In the marketplace of destiny, hesitation is the costliest of habits.~  
DO ~StartStore("AC#PPZAR",LastTalkedToBy())~ EXIT

CHAIN AC#PPZAR Farewell
~As you will, wanderer. The road forgets no footstep, and my wares forget no gaze.~  
EXIT

// Zar'khaan offers his wares, especially the cursed scroll
CHAIN AC#PPZAR what_items
~A question most welcome! I trade in the curious and the uncommon — things you never knew you needed until you see them.~
== AC#PPZAR ~But among such trifles, there is one treasure of true legend — a scroll of *Wish*!~
== AC#PPZAR ~Yes, you heard it right: *Wish*! The spell that bends the ear of fate itself. I came by it through a bargain with a Djinn of the Calim Desert.~
== AC#PPZAR ~He told me it would answer any voice that dared to command it. No tedious study, no circles of runes — only the courage to speak one’s heart aloud. Of course, the scroll carries a price — I must have my share as well! But surely a hero such as yourself deserves to tempt destiny once, no?~
END
IF~~THEN REPLY ~A scroll of Wish, you say? Sounds too good to be true.~ EXTERN AC#PPZAR wish_doubt
IF~~THEN REPLY ~Let me see that scroll.~ EXTERN AC#PPZAR start_store
IF~~THEN REPLY ~No thanks. I’ll stick to bottled laughter.~ EXTERN AC#PPZAR Farewell

CHAIN AC#PPZAR wish_doubt
~Too good to be true? But truth has never been the measure of value, has it? What matters is that it works.~
== AC#PPZAR ~You doubt, yet you’re still listening. That’s the mark of a wise buyer. Tell you what — take a look at the script yourself. The words are simple, almost childlike. Even fate enjoys a good jest now and then.~
END
IF~~THEN EXTERN AC#PPZAR hub




	
