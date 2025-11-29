// Token Questline
// MEETING #1
BEGIN AC#PPMA1

CHAIN IF ~True()~ THEN AC#PPMA1 hello_00
@5100
END
IF ~PartyHasItem("AC#PPCOI")~ THEN REPLY @5101 EXTERN AC#PPMA1 token_02
IF ~~ THEN REPLY @5102 EXTERN AC#PPMA1 bye

CHAIN AC#PPMA1 token_02
@5103
END
IF ~~ THEN REPLY @5104 EXTERN AC#PPMA1 token_03
IF ~~ THEN REPLY @5105 EXTERN AC#PPMA1 token_03
IF ~~ THEN REPLY @5106 EXTERN AC#PPMA1 token_luck

	CHAIN AC#PPMA1 token_luck 
	@5107
	END
	IF ~~ THEN REPLY @5108 EXTERN AC#PPMA1 token_04
	IF ~~ THEN REPLY @5109 EXTERN AC#PPMA1 token_04

CHAIN AC#PPMA1 token_03 
@5110
END
IF ~~ THEN REPLY @5111 EXTERN AC#PPMA1 token_04

CHAIN AC#PPMA1 token_04
@5112
END
IF ~~ THEN REPLY @5113 EXTERN AC#PPMA1 token_who
IF ~~ THEN REPLY @5114 EXTERN AC#PPMA1 token_05

CHAIN AC#PPMA1 token_who
@5115
END
IF ~~ THEN REPLY @5116 EXTERN AC#PPMA1 token_bye
IF ~~ THEN REPLY @5117 EXTERN AC#PPMA1 token_what_was_it_again

CHAIN AC#PPMA1 token_05
@5118
END
IF ~~ THEN REPLY @5116 EXTERN AC#PPMA1 token_bye
IF ~~ THEN REPLY @5117 EXTERN AC#PPMA1 token_what_was_it_again

CHAIN AC#PPMA1 token_what_was_it_again
@5119
END
IF ~~ THEN REPLY @5116 EXTERN AC#PPMA1 token_bye
IF ~~ THEN REPLY @5120 EXTERN AC#PPMA1 token_bye

CHAIN AC#PPMA1 token_bye
@5121
DO ~SetGlobal("AC#PP_MarrikQuest","GLOBAL",3) 
AddJournalEntry(@13131,QUEST)
EscapeArea()~
EXIT

CHAIN AC#PPMA1 bye
@5122
EXIT


// MEETING #2
BEGIN AC#PPMA2

CHAIN IF ~True()~ THEN AC#PPMA2 hello_00
@5123
END
IF ~PartyHasItem("AC#PPCOI")~ THEN REPLY @5124 EXTERN AC#PPMA2 token_02
IF ~~ THEN REPLY @5125 EXTERN AC#PPMA2 bye

CHAIN AC#PPMA2 token_02
@5126
END
IF ~~ THEN REPLY @5127 EXTERN AC#PPMA2 token_03
IF ~~ THEN REPLY @5128 EXTERN AC#PPMA2 token_03

CHAIN AC#PPMA2 token_03
@5129
END
IF ~~ THEN REPLY @5130 EXTERN AC#PPMA2 token_04
IF ~~ THEN REPLY @5131 EXTERN AC#PPMA2 token_bye

CHAIN AC#PPMA2 token_04
@5132
END
IF ~~ THEN REPLY @5133 EXTERN AC#PPMA2 token_bye
IF ~~ THEN REPLY @5134 EXTERN AC#PPMA2 token_bye

CHAIN AC#PPMA2 token_bye
@5135
DO ~SetGlobal("AC#PP_MarrikQuest","GLOBAL",5)
AddJournalEntry(@13132,QUEST)
EscapeArea()~
EXIT

CHAIN AC#PPMA2 bye
@5136
EXIT


// MEETING #3
BEGIN AC#PPMA3

CHAIN IF ~True()~ THEN AC#PPMA3 hello_00
@5137
END
IF ~PartyHasItem("AC#PPCOI")~ THEN REPLY @5138 EXTERN AC#PPMA3 token_02
IF ~~ THEN REPLY @5139 EXTERN AC#PPMA3 bye

CHAIN AC#PPMA3 token_02
@5140
END
IF ~~ THEN REPLY @5141 EXTERN AC#PPMA3 token_03
IF ~~ THEN REPLY @5142 EXTERN AC#PPMA3 token_03

CHAIN AC#PPMA3 token_03
@5143
END
IF ~~ THEN REPLY @5144 EXTERN AC#PPMA3 token_04
IF ~~ THEN REPLY @5145 EXTERN AC#PPMA3 token_04

CHAIN AC#PPMA3 token_04
@5146
END
IF ~~ THEN REPLY @5147 EXTERN AC#PPMA3 token_05
IF ~~ THEN REPLY @5148 EXTERN AC#PPMA3 token_bye

CHAIN AC#PPMA3 token_05
@5149
END
IF ~~ THEN REPLY @5150 EXTERN AC#PPMA3 token_bye
IF ~~ THEN REPLY @5151 EXTERN AC#PPMA3 token_bye

CHAIN AC#PPMA3 token_bye
@5152
DO ~SetGlobal("AC#PP_MarrikQuest","GLOBAL",7)
AddJournalEntry(@13133,QUEST)
EscapeArea()~
EXIT

CHAIN AC#PPMA3 bye
@5153
EXIT


// MEETING #4 — Final Meeting, behind Ilmater’s Temple in the Slums
BEGIN AC#PPMA4

CHAIN IF ~True()~ THEN AC#PPMA4 hello_00
@5154
END
IF ~PartyHasItem("AC#PPCOI")~ THEN REPLY @5155 DO ~TakePartyItem("AC#PPCOI") DestroyItem("AC#PPCOI")~ EXTERN AC#PPMA4 token_02
IF ~~ THEN REPLY @5156 EXTERN AC#PPMA4 bye

CHAIN AC#PPMA4 token_02
@5157
END
IF ~~ THEN REPLY @5158 EXTERN AC#PPMA4 token_03
IF ~~ THEN REPLY @5159 EXTERN AC#PPMA4 token_03
IF ~~ THEN REPLY @5160 EXTERN AC#PPMA4 token_03

CHAIN AC#PPMA4 token_03
@5161
END
IF ~~ THEN REPLY @5162 EXTERN AC#PPMA4 token_geas_01
IF ~~ THEN REPLY @5163 EXTERN AC#PPMA4 token_geas_01

CHAIN AC#PPMA4 token_geas_01
@5164
END
IF ~~ THEN REPLY @5165 EXTERN AC#PPMA4 token_geas_02
IF ~~ THEN REPLY @5166 EXTERN AC#PPMA4 token_05
IF ~~ THEN REPLY @5167 EXTERN AC#PPMA4 token_05
IF ~NumInPartyGT(1)~ THEN REPLY @5168 EXTERN AC#PPMA4 token_party

	CHAIN AC#PPMA4 token_geas_02
	@5169
	END
	IF ~~ THEN REPLY @5144 EXTERN AC#PPMA4 token_05
	
	CHAIN AC#PPMA4 token_party
	@5170
	END
	IF ~~ THEN REPLY @5144 EXTERN AC#PPMA4 token_05

CHAIN AC#PPMA4 token_05
@5171
END
IF ~~ THEN REPLY @5172 EXTERN AC#PPMA4 token_end
IF ~~ THEN REPLY @5173 EXTERN AC#PPMA4 token_end

CHAIN AC#PPMA4 token_end
@5174
END
IF ~~ THEN EXTERN AC#PPMA4 token_bye

CHAIN AC#PPMA4 token_bye
@5175
DO ~SetGlobal("AC#PP_MarrikQuest","GLOBAL",10)
   AddExperienceParty(500)
   AddJournalEntry(@13134,QUEST_DONE)
   EscapeArea()~
EXIT

CHAIN AC#PPMA4 bye
@5176
EXIT

/*
CHAIN AC#PPMA4 token_03
~That depends. What did you want or expect?~
END
IF ~~ THEN REPLY ~I don’t know. You tell me.~ EXTERN AC#PPMA4 token_04
IF ~~ THEN REPLY ~A handsome reward for all my troubles!~ EXTERN AC#PPMA4 token_05

CHAIN AC#PPMA4 token_04
~Me? I thought you were the one who knew. You’ve followed every word, every whisper... Surely you remember what you were seeking.~ 
END
IF ~~ THEN REPLY ~Gold, perhaps. A reward.~ EXTERN AC#PPMA4 token_05

CHAIN AC#PPMA4 token_05
~A reward? Gold? No, I have none of that. In truth, I’ve nothing to offer you at all — nothing save what you already carry with you. Tell me... is that not enough?~
END
IF ~~ THEN REPLY ~I’m not sure anymore.~ EXTERN AC#PPMA4 token_end
IF ~~ THEN REPLY @5172 EXTERN AC#PPMA4 token_end
IF ~~ THEN REPLY ~You mean to tell me I’ve been strung along this whole time?~ EXTERN AC#PPMA4 token_end

CHAIN AC#PPMA4 token_end
~Then perhaps that’s the answer you came for. Not all journeys end with treasure — some end when we stop searching. Farewell.~
DO ~SetGlobal("AC#PP_MarrikQuest","GLOBAL",10)
AddexperienceParty(500)
AddJournalEntry(@13134,QUEST_DONE)
EscapeArea()~
EXIT
*/



