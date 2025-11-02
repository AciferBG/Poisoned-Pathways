// Token Questline
// MEETING #1
BEGIN AC#PPMA1

CHAIN IF ~True()~ THEN AC#PPMA1 hello_00
~You shouldn’t be wandering here at night. What do you want?~
END
IF ~PartyHasItem("AC#PPCOI")~ THEN REPLY ~I have this coin — a token, I guess? I was told to bring it to someone behind the Temple of Helm here in the Bridge District. I believe it's meant for you.~ EXTERN AC#PPMA1 token_02
IF ~~ THEN REPLY ~Never mind. Farewell.~ EXTERN AC#PPMA1 bye

CHAIN AC#PPMA1 token_02
~The token... so you’re the one they spoke of. I wasn’t sure anyone would come.~
END
IF ~~ THEN REPLY ~Who are you talking about?~ EXTERN AC#PPMA1 token_03


CHAIN AC#PPMA1 token_03 
~Does it matter? We only pass the message along. That’s all any of us ever do.~
END
IF ~~ THEN REPLY ~And what message is that?~ EXTERN AC#PPMA1 token_04

CHAIN AC#PPMA1 token_04
~Go to the Temple District — behind the Temple of Lathander, after nightfall. They’ll be waiting.~
END
IF ~~ THEN REPLY ~Waiting for what?~ EXTERN AC#PPMA1 token_05

CHAIN AC#PPMA1 token_05
~For you, I suppose. Or for what you wanted.~
END
IF ~~ THEN REPLY ~I never said what I wanted.~ EXTERN AC#PPMA1 token_bye

CHAIN AC#PPMA1 token_bye
~Then maybe you’ll find out there. Farewell~
DO ~SetGlobal("AC#PP_MarrikQuest","GLOBAL",3) 
AddJournalEntry(@13131,QUEST)
EscapeArea()~
EXIT

CHAIN AC#PPMA1 bye
~Then keep moving. Night’s not safe for those without purpose.~
EXIT

// MEETING #2
BEGIN AC#PPMA2

CHAIN IF ~True()~ THEN AC#PPMA2 hello_00
~You came. I wasn’t sure you’d find the place.~
END
IF ~PartyHasItem("AC#PPCOI")~ THEN REPLY ~I was told to meet someone here — behind Lathander’s temple. I still don’t know what this token is supposed to mean.~ EXTERN AC#PPMA2 token_02
IF ~~ THEN REPLY ~I think I’ve made a mistake. Farewell.~ EXTERN AC#PPMA2 bye

CHAIN AC#PPMA2 token_02
~You’re not the first to say that. It’s not for us to know — we only send you on.~
END
IF ~~ THEN REPLY ~Then where am I supposed to go next?~ EXTERN AC#PPMA2 token_03

CHAIN AC#PPMA2 token_03
~Go to the Government District. Behind the Temple of Waukeen, after nightfall. Someone will be waiting there — if they still remember why.~
END
IF ~~ THEN REPLY ~And what am I supposed to find there?~ EXTERN AC#PPMA2 token_04

CHAIN AC#PPMA2 token_04
~Whatever it is you’ve been looking for. They always say that, don’t they?~
END
IF ~~ THEN REPLY ~Seems no one actually knows what’s going on.~ EXTERN AC#PPMA2 token_bye

CHAIN AC#PPMA2 token_bye
~Maybe that’s the point. Go on, then — before the dawn finds you.~
DO ~SetGlobal("AC#PP_MarrikQuest","GLOBAL",5)
AddJournalEntry(@13132,QUEST)
EscapeArea()~
EXIT

CHAIN AC#PPMA2 bye
~Then go. The dawn’s coming, and not all lights are kind.~
EXIT

// MEETING #3
BEGIN AC#PPMA3

CHAIN IF ~True()~ THEN AC#PPMA3 hello_00
~Well now... I didn’t expect anyone to actually show up with that thing.~
END
IF ~PartyHasItem("AC#PPCOI")~ THEN REPLY ~This token’s taken me across half the city. I was told to meet someone here, at the Temple of Waukeen.~ EXTERN AC#PPMA3 token_02
IF ~~ THEN REPLY ~Forget it. I’ve had enough of this chase.~ EXTERN AC#PPMA3 bye

CHAIN AC#PPMA3 token_02
~Then you’ve come further than most. Most turn back before they reach the gold gates.~
END
IF ~~ THEN REPLY ~And what am I supposed to find here?~ EXTERN AC#PPMA3 token_03

CHAIN AC#PPMA3 token_03
~Find? Oh, everyone wants to find something. Profit, answers, absolution... doesn’t matter which.~
END
IF ~~ THEN REPLY ~So what now?~ EXTERN AC#PPMA3 token_04

CHAIN AC#PPMA3 token_04
~Now you keep going. The last of them meets behind the Temple of Ilmater — down in the Slums, after nightfall. They’ll know what to do with you.~
END
IF ~~ THEN REPLY ~And what will they tell me?~ EXTERN AC#PPMA3 token_05

CHAIN AC#PPMA3 token_05
~Maybe the truth. Or maybe just the same lie we all keep passing on.~
END
IF ~~ THEN REPLY ~You don’t sound convinced.~ EXTERN AC#PPMA3 token_bye

CHAIN AC#PPMA3 token_bye
~Conviction’s for those who still believe in gain. Me, I just mind the message. Go on — before someone sees you here.~
DO ~SetGlobal("AC#PP_MarrikQuest","GLOBAL",7)
AddJournalEntry(@13133,QUEST)
EscapeArea()~
EXIT

CHAIN AC#PPMA3 bye
~Suit yourself. There’s always someone else chasing promises.~
EXIT

// MEETING #4 — Final Meeting, behind Ilmater’s Temple in the Slums
BEGIN AC#PPMA4

CHAIN IF ~True()~ THEN AC#PPMA4 hello_00
~You’ve come a long way to stand in a place most people avoid.~
END
IF ~PartyHasItem("AC#PPCOI")~ THEN REPLY ~This is where the trail ends, isn’t it? I was told to meet someone behind Ilmater’s temple. I suppose that’s you.~ DO ~TakePartyItem("AC#PPCOI") DestroyItem("AC#PPCOI")~ EXTERN AC#PPMA4 token_02
IF ~~ THEN REPLY ~I must have taken a wrong turn. Farewell.~ EXTERN AC#PPMA4 bye

CHAIN AC#PPMA4 token_02
~Yes... I’ve been waiting. They said you’d bring the token, though no one could tell me why.~
END
IF ~~ THEN REPLY ~Everyone keeps saying I’ll get what I wanted. So — what is it I’m supposed to find here?~ EXTERN AC#PPMA4 token_03
IF ~~ THEN REPLY ~So why don’t you just say it—what is there for me to gain here?~ EXTERN AC#PPMA4 token_03
IF ~~ THEN REPLY ~Don’t toy with me. I’ve come too far for more riddles — what do I GET?~ EXTERN AC#PPMA4 token_03

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
IF ~~ THEN REPLY ~That was a damned useless quest.~ EXTERN AC#PPMA4 token_end
IF ~~ THEN REPLY ~You mean to tell me I’ve been strung along this whole time?~ EXTERN AC#PPMA4 token_end

CHAIN AC#PPMA4 token_end
~Then perhaps that’s the answer you came for. Not all journeys end with treasure — some end when we stop searching. Farewell.~
DO ~SetGlobal("AC#PP_MarrikQuest","GLOBAL",10)
AddexperienceParty(500)
AddJournalEntry(@13134,QUEST_DONE)
EscapeArea()~
EXIT

CHAIN AC#PPMA4 bye
~Then go. Some burdens aren’t meant to be passed on.~
EXIT



