
// the Dell-Light Twins
BEGIN AC#PPFAE

CHAIN IF ~Global("AC#PPFairyTwinsKidnapQuest","GLOBAL",10)~ THEN AC#PPFAE hello_saviour
@4850
== AC#PPFAE @4851
== AC#PPFAE @4852
== AC#PPFAE @4853
END   
IF~~THEN REPLY @4854 EXTERN AC#PPFAE Dusklight_Wish  
IF~~THEN REPLY @4855 EXTERN AC#PPFAE Dusklight_riddles 
IF~~THEN REPLY @4856 EXTERN AC#PPFAE Dusklight_Grumpy
IF~~THEN REPLY @4857 EXTERN AC#PPFAE Dusklight_Pass 

// The faeries are freed in Duskwood Dell
CHAIN IF ~Global("AC#PPFairyTwinsKidnapQuest","GLOBAL",8)~ THEN AC#PPFAE hello_free
@4858
== AC#PPFAE @4859
== AC#PPMAN @4860
== AC#PPFAE @4861
== AC#PPMAN @4862
== AC#PPFAE @4863
== AC#PPFAE @4864
== AC#PPFAE @4865
== AC#PPFAE @4866
== AC#PPFAE @4867
== AC#PPFAE @4868
== AC#PPFAE @4869
== AC#PPFAE @4870  
END
IF~~THEN REPLY @4871 EXTERN AC#PPFAE fairy_bless_death
IF~~THEN REPLY @4872 EXTERN AC#PPFAE fairy_bless_spell
IF~~THEN REPLY @4873 EXTERN AC#PPFAE fairy_bless_wand
IF~~THEN REPLY @4874 EXTERN AC#PPFAE fairy_bless_polymorph
IF~~THEN REPLY @4875 EXTERN AC#PPFAE fairy_bless_breath


// Twins react to the chosen blessing
CHAIN AC#PPFAE fairy_bless_death
@4876
== AC#PPFAE @4877
DO ~SetGlobal("AC#PPFaerieBlessing","GLOBAL",1)
ReallyForceSpellRES("AC#PPF1",Player1)
ReallyForceSpell(Myself,FLASHY_2)
SetGlobal("AC#PPFairyTwinsKidnapQuest","GLOBAL",10)
AddJournalEntry(@13004,QUEST_DONE)
EscapeArea()~
EXIT

CHAIN AC#PPFAE fairy_bless_spell
@4876
== AC#PPFAE @4877
DO ~SetGlobal("AC#PPFaerieBlessing","GLOBAL",1)
ReallyForceSpellRES("AC#PPF2",Player1)
ReallyForceSpell(Myself,FLASHY_2)
SetGlobal("AC#PPFairyTwinsKidnapQuest","GLOBAL",10)
AddJournalEntry(@13004,QUEST_DONE)
EscapeArea()~
EXIT

CHAIN AC#PPFAE fairy_bless_wand
@4876
== AC#PPFAE @4877
DO ~SetGlobal("AC#PPFaerieBlessing","GLOBAL",1)
ReallyForceSpellRES("AC#PPF3",Player1)
ReallyForceSpell(Myself,FLASHY_2)
SetGlobal("AC#PPFairyTwinsKidnapQuest","GLOBAL",10)
AddJournalEntry(@13004,QUEST_DONE)
EscapeArea()~
EXIT

CHAIN AC#PPFAE fairy_bless_polymorph
@4876
== AC#PPFAE @4877
DO ~SetGlobal("AC#PPFaerieBlessing","GLOBAL",1)
ReallyForceSpellRES("AC#PPF4",Player1)
ReallyForceSpell(Myself,FLASHY_2)
SetGlobal("AC#PPFairyTwinsKidnapQuest","GLOBAL",10)
AddJournalEntry(@13004,QUEST_DONE)
EscapeArea()~
EXIT

CHAIN AC#PPFAE fairy_bless_breath
@4876
== AC#PPFAE @4877
DO ~SetGlobal("AC#PPFaerieBlessing","GLOBAL",1)
ReallyForceSpellRES("AC#PPF5",Player1)
ReallyForceSpell(Myself,FLASHY_2)
SetGlobal("AC#PPFairyTwinsKidnapQuest","GLOBAL",10)
AddJournalEntry(@13004,QUEST_DONE)
EscapeArea()~
EXIT



// First meeting with the Dell-Light Twins
CHAIN IF ~Global("AC#PP_TalkedToFaeries","GLOBAL",0)~ THEN AC#PPFAE hello_0
@4878
END
IF ~~ THEN DO ~SetGlobal("AC#PP_TalkedToFaeries","GLOBAL",1)~ EXTERN AC#PPFAE hello_monster_cont

CHAIN AC#PPFAE hello_monster_cont  
@4879  
== AC#PPFAE @4880
	END
	IF~~THEN REPLY @4881 EXTERN AC#PPFAE who_are_you 
	IF~~THEN REPLY @4882 EXTERN AC#PPFAE who_are_you 
	IF~~THEN REPLY @4857 EXTERN AC#PPFAE Dusklight_Pass

CHAIN IF ~True()~ THEN AC#PPFAE hello_again
@4883
== AC#PPFAE @4853 
END
IF~~THEN REPLY @4881 EXTERN AC#PPFAE who_are_you    
IF~~THEN REPLY @4854 EXTERN AC#PPFAE Dusklight_Wish  
IF~~THEN REPLY @4855 EXTERN AC#PPFAE Dusklight_riddles 
IF~~THEN REPLY @4856 EXTERN AC#PPFAE Dusklight_Grumpy
IF~~THEN REPLY @4857 EXTERN AC#PPFAE Dusklight_Pass 

CHAIN AC#PPFAE who_are_you
@4884   
END
IF~~THEN REPLY @4885 EXTERN AC#PPFAE dell_light_twins
IF~~THEN REPLY @4886 EXTERN AC#PPFAE what_are_you_really
IF~~THEN REPLY @4857 EXTERN AC#PPFAE Dusklight_Pass

// Dell-Light Twins – Name Explanation
CHAIN AC#PPFAE dell_light_twins
@4887
== AC#PPFAE @4888  
END
IF~~THEN REPLY @4886 EXTERN AC#PPFAE what_are_you_really
IF~~THEN REPLY @4857 EXTERN AC#PPFAE Dusklight_Pass


CHAIN AC#PPFAE what_are_you_really
@4889  
== AC#PPFAE @4890 
== AC#PPFAE @4891    
END
IF~~THEN EXTERN AC#PPFAE hub
	
  
CHAIN AC#PPFAE hub
@4892 
END
IF~~THEN REPLY @4881 EXTERN AC#PPFAE who_are_you    
IF~~THEN REPLY @4854 EXTERN AC#PPFAE Dusklight_Wish  
IF~~THEN REPLY @4855 EXTERN AC#PPFAE Dusklight_riddles 
IF~~THEN REPLY @4856 EXTERN AC#PPFAE Dusklight_Grumpy
IF~~THEN REPLY @4857 EXTERN AC#PPFAE Dusklight_Pass 

// Faerie Riddle Scene
CHAIN AC#PPFAE Dusklight_riddles
@4893
== AC#PPFAE @4894
END 
IF ~Global("AC#PP_RiddleWon","GLOBAL",0)~ THEN EXTERN AC#PPFAE Riddle_01
IF ~Global("AC#PP_RiddleWon","GLOBAL",1)~ THEN EXTERN AC#PPFAE Riddle_02
IF ~Global("AC#PP_RiddleWon","GLOBAL",2)~ THEN EXTERN AC#PPFAE Riddle_03
IF ~Global("AC#PP_RiddleWon","GLOBAL",3)~ THEN EXTERN AC#PPFAE Riddle_No_riddle_left
IF ~Global("AC#PP_RiddleWon","GLOBAL",4)~ THEN EXTERN AC#PPFAE Riddle_finished

	CHAIN AC#PPFAE Riddle_finished
	@4895  
	== AC#PPFAE @4896  
	END
	IF~~THEN EXTERN AC#PPFAE hub

// Riddle # 1:
	CHAIN AC#PPFAE Riddle_01
	@4897  
	END
	IF~~THEN REPLY @4898 EXTERN AC#PPFAE Riddle_01_Wrong
	IF~~THEN REPLY @4899 EXTERN AC#PPFAE Riddle_01_Correct
	IF~~THEN REPLY @4900 EXTERN AC#PPFAE Riddle_01_Wrong
	IF~~THEN REPLY @4901 EXTERN AC#PPFAE Riddle_01_Wrong
	IF~~THEN REPLY @4902 EXTERN AC#PPFAE Riddle_01_Teasing

	// Correct answer – they hate losing
	CHAIN AC#PPFAE Riddle_01_Correct
	@4903
	== AC#PPFAE @4904
	== AC#PPFAE @4905
	== AC#PPFAE @4906
	== AC#PPFAE @4907  
	DO ~SetGlobal("AC#PP_RiddleWon","GLOBAL",1)~  
	EXIT

	// Wrong answer – they mock gently
	CHAIN AC#PPFAE Riddle_01_Wrong
	@4908
	== AC#PPFAE @4909
	== AC#PPFAE @4910  
	END
	IF ~~ THEN REPLY @4911 EXTERN AC#PPFAE Riddle_01
	IF ~~ THEN REPLY @4912 EXTERN AC#PPFAE Riddle_bye

	CHAIN AC#PPFAE Riddle_01_Teasing
	@4913
	== AC#PPFAE @4914
	== AC#PPFAE @4915  
	EXIT

	// Riddle bye
	CHAIN AC#PPFAE Riddle_bye
	@4916
	== AC#PPFAE @4917  
	EXIT

// Riddle #2: – mimic

CHAIN AC#PPFAE Riddle_02
@4918
END
IF~~THEN REPLY @4919 EXTERN AC#PPFAE Riddle_02_Wrong
IF~~THEN REPLY @4920 EXTERN AC#PPFAE Riddle_02_Wrong
IF~~THEN REPLY @4921 EXTERN AC#PPFAE Riddle_02_Wrong
IF~~THEN REPLY @4922 EXTERN AC#PPFAE Riddle_02_Correct
IF~~THEN REPLY @4923 EXTERN AC#PPFAE Riddle_02_Teasing

// Correct answer
CHAIN AC#PPFAE Riddle_02_Correct
@4924
== AC#PPFAE @4925
== AC#PPFAE @4926
== AC#PPFAE @4927  
DO ~SetGlobal("AC#PP_RiddleWon","GLOBAL",2)~  
EXIT

// Wrong answer – generic response
CHAIN AC#PPFAE Riddle_02_Wrong
@4908
== AC#PPFAE @4928
== AC#PPFAE @4929  
END
IF ~~ THEN REPLY @4911 EXTERN AC#PPFAE Riddle_02
IF ~~ THEN REPLY @4930 EXTERN AC#PPFAE Riddle_bye

// Teasing response
CHAIN AC#PPFAE Riddle_02_Teasing
@4931
== AC#PPFAE @4932
== AC#PPFAE @4933  
EXIT

// Riddle #3:  – Frog

CHAIN AC#PPFAE Riddle_03
@4934
== AC#PPFAE @4935
== AC#PPFAE @4936
END
IF~~THEN REPLY @4937 EXTERN AC#PPFAE Riddle_03_Wrong
IF~~THEN REPLY @4938 EXTERN AC#PPFAE Riddle_03_Wrong
IF~~THEN REPLY @4939 EXTERN AC#PPFAE Riddle_03_Correct
IF~~THEN REPLY @4940 EXTERN AC#PPFAE Riddle_03_vampire

CHAIN AC#PPFAE Riddle_03_Correct
@4941
== AC#PPFAE @4942
== AC#PPFAE @4943  
== AC#PPFAE @4944  
DO ~SetGlobal("AC#PP_RiddleWon","GLOBAL",3)~  
EXIT

CHAIN AC#PPFAE Riddle_03_Wrong
@4945
== AC#PPFAE @4946
== AC#PPFAE @4947  
END
IF ~~ THEN REPLY @4911 EXTERN AC#PPFAE Riddle_03
IF ~~ THEN REPLY @4930 EXTERN AC#PPFAE Riddle_bye

CHAIN AC#PPFAE Riddle_03_vampire
@4948
== AC#PPFAE @4949
== AC#PPFAE @4950
== AC#PPFAE @4951
==HEXXATJ IF ~InParty("hexxat") !StateCheck("hexxat",CD_STATE_NOTVALID)~ THEN @4952 
END
IF ~~ THEN REPLY @4911 EXTERN AC#PPFAE Riddle_03
IF ~~ THEN REPLY @4930 EXTERN AC#PPFAE Riddle_bye

// Riddle #4 - but none left!

CHAIN AC#PPFAE Riddle_No_riddle_left
@4953
== AC#PPFAE @4954
== AC#PPFAE @4955
== AC#PPFAE @4956
== AC#PPFAE @4957
== AC#PPFAE @4958
== AC#PPFAE @4959
== AC#PPFAE @4960
== AC#PPFAE @4961
== AC#PPFAE @4962  
== AC#PPFAE @4963  
== AC#PPFAE @4964  
DO ~SetGlobal("AC#PP_RiddleWon","GLOBAL",4) GiveItemCreate("AC#PPPXD",Player1,1,0,0) ReallyForceSpell(Myself,FLASHY_2)~  
EXIT

	
		/*
	CHAIN AC#PPFAE Riddle_01_Wrong
	~^0xFF9ADCE3Tippledew:^–What? Hahaha, <PRO_HESHE> thinks darkness breathes!~
	== AC#PPFAE ~^0xFFE3B0FFLilafern:^–So close, so close – and yet entirely wrong!~
	== AC#PPFAE ~^0xFF9ADCE3Tippledew:^–Guess again when your brain’s had a nap.~  
	EXIT
	*/


	CHAIN AC#PPFAE Dusklight_Grumpy
	@4965
	== AC#PPFAE @4966  
	== AC#PPFAE @4967  
	== AC#PPFAE @4968  
		DO ~~ EXIT

	CHAIN AC#PPFAE Dusklight_Wish
	@4969
	== AC#PPFAE @4970
	== AC#PPFAE @4971
	== AC#PPFAE @4972  
	== AC#PPFAE @4973  
	== AC#PPFAE @4974  
	END
	IF~~THEN EXTERN AC#PPFAE hub

/*	
	CHAIN AC#PPFAE Dusklight_Frog
	~^0xFFE3B0FF Lilafern: ^-Oh yes! Very sacred! Very slimy!~  
	== AC#PPFAE ~^0xFF9ADCE3 Tippledew: ^-We protect them from… well, mostly from needing to kiss the wrong people.~
	== AC#PPFAE ~One traveler tried it once. He wrote poetry. Terrible poetry. Lots of croaking rhymes.~
	== AC#PPFAE ~^0xFF9ADCE3 Tippledew: ^-Now we just keep an eye on them. Someone has to make sure they don’t start a frogolution.~ 
	== AC#PPFAE ~^0xFFE3B0FF Lilafern: ^-Anyway, sacred work. No pay, but excellent splashing privileges.~  
	DO ~ReallyForceSpell(Myself,FLASHY_2)
	RunAwayFrom(LastTalkedToBy(Myself),30)~ EXIT
*/
	CHAIN AC#PPFAE Dusklight_Pass
	@4975   
	== AC#PPFAE @4976  
	DO ~~ EXIT
	
	
// Zar’khaan – the Rakshasa disguised as a merchant
BEGIN AC#PPZAR

CHAIN IF ~Global("AC#PPRakAttack","GLOBAL",1)~ THEN AC#PPZAR hello_attack
@4977
DO ~SetGlobal("AC#PPRakAttack","GLOBAL",2)
SetGlobal("AC#PPFairyTwinsKidnapQuest","GLOBAL",5)
Polymorph(RAKSHASA)
Enemy()~ EXIT

CHAIN IF ~Global("AC#PPRakPrison","GLOBAL",1)~ THEN AC#PPZAR hello_prison
@4978
DO ~SetGlobal("AC#PPRakPrison","GLOBAL",2)
SetGlobal("AC#PPFairyTwinsKidnapQuest","GLOBAL",5)
Enemy()~ EXIT


// Zar'khaan urges the player to use the scroll immediately
CHAIN IF ~Global("AC#PPRakScroll","GLOBAL",1)~ THEN AC#PPZAR sell_wish_followup
@4979
DO ~SetGlobal("AC#PPRakScroll","GLOBAL",2)~ EXTERN AC#PPZAR sell_wish_followup_02

CHAIN AC#PPZAR sell_wish_followup_02
@4980
== AC#PPZAR @4981
END
IF~~THEN REPLY @4982 EXTERN AC#PPZAR sell_scroll_fooled_me
IF~~THEN REPLY @4983 EXTERN AC#PPZAR sell_scroll_alright


CHAIN AC#PPZAR sell_scroll_fooled_me
@4984
END
IF~~THEN REPLY @4983 EXTERN AC#PPZAR sell_scroll_alright


// Player agrees to try the scroll
CHAIN AC#PPZAR sell_scroll_alright
@4985
EXIT


// First greeting
CHAIN IF ~True()~ THEN AC#PPZAR hello_0
@4986
END
IF~Global("AC#PP_RakStoreVisit","GLOBAL",0)~THEN REPLY @4987 DO ~SetGlobal("AC#PP_RakStoreVisit","GLOBAL",1)~ EXTERN AC#PPZAR start_store
IF~Global("AC#PP_RakStoreVisit","GLOBAL",1)~THEN REPLY @4987 EXTERN AC#PPZAR start_store
IF~~THEN REPLY @4988 EXTERN AC#PPZAR strange_accent
IF ~Global("AC#PP_RakStoreVisit","GLOBAL",1)~ THEN REPLY @4989 EXTERN AC#PPZAR store_strange
IF~~THEN REPLY @4990 EXTERN AC#PPZAR what_items
IF~~THEN REPLY @4991 EXTERN AC#PPZAR Farewell


CHAIN AC#PPZAR hub
@4992 
END
IF~Global("AC#PP_RakStoreVisit","GLOBAL",0)~THEN REPLY @4987 DO ~SetGlobal("AC#PP_RakStoreVisit","GLOBAL",1)~ EXTERN AC#PPZAR start_store
IF~Global("AC#PP_RakStoreVisit","GLOBAL",1)~THEN REPLY @4987 EXTERN AC#PPZAR start_store
IF ~Global("AC#PP_RakStoreVisit","GLOBAL",1)~ THEN REPLY @4989 EXTERN AC#PPZAR store_strange
IF~~THEN REPLY @4990 EXTERN AC#PPZAR what_items
IF~~THEN REPLY @4991 EXTERN AC#PPZAR Farewell


// Zar'khaan reacts to comment about strange wares
CHAIN AC#PPZAR store_strange
@4993
== AC#PPZAR @4994
END
IF~~THEN DO ~AddJournalEntry(@13001,QUEST)~ EXTERN AC#PPZAR hub


CHAIN AC#PPZAR start_store
@4995  
DO ~StartStore("AC#PPZAR",LastTalkedToBy())~ EXIT


CHAIN AC#PPZAR Farewell
@4996  
EXIT


// Zar'khaan offers his wares, especially the cursed scroll
CHAIN AC#PPZAR what_items
@4997
== AC#PPZAR @4998
== AC#PPZAR @4999
== AC#PPZAR @5000
END
IF~~THEN REPLY @5001 EXTERN AC#PPZAR wish_doubt
IF~~THEN REPLY @5002 EXTERN AC#PPZAR start_store
IF~~THEN REPLY @5003 EXTERN AC#PPZAR Farewell


CHAIN AC#PPZAR wish_doubt
@5004
== AC#PPZAR @5005
END
IF~~THEN DO ~AddJournalEntry(@13001,QUEST)~ EXTERN AC#PPZAR hub

// accent
CHAIN AC#PPZAR strange_accent
@5006
END
IF ~~ THEN EXTERN AC#PPZAR wares_not_words

// After Zar’khaan dismisses the accent question
CHAIN AC#PPZAR wares_not_words
@5007
END
IF~~THEN REPLY @5008 EXTERN AC#PPZAR twins_accusation
IF~~THEN REPLY @5009 EXTERN AC#PPZAR start_store
IF~~THEN REPLY @4991 EXTERN AC#PPZAR Farewell


CHAIN AC#PPZAR twins_accusation
@5010
END 
IF ~~ THEN EXTERN AC#PPZAR twins_accusation_02
// DO ~SetGlobal("AC#PP_RakAccused","GLOBAL",1)~ EXTERN AC#PPZAR twins_accusation_02

// Player accuses Zar’khaan directly
CHAIN AC#PPZAR twins_accusation_02
@5011
END
IF~~THEN REPLY @5012 EXTERN AC#PPZAR accused_direct
IF~~THEN REPLY @5009 EXTERN AC#PPZAR start_store
IF~~THEN REPLY @5013 EXTERN AC#PPZAR Farewell  

// Zar’khaan drops the act
CHAIN AC#PPZAR accused_direct
@5014
== AC#PPZAR @5015
DO ~SetGlobal("AC#PPRakAttack","GLOBAL",2)
SetGlobal("AC#PPFairyTwinsKidnapQuest","GLOBAL",5)
Polymorph(RAKSHASA)
Enemy()~ EXIT

	
