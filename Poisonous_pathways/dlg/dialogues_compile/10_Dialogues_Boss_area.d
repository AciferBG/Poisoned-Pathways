// Dialogue in area acpp72

BEGIN ~AC#PPTA2~

CHAIN IF ~True()~ THEN AC#PPTA2 hello_01
~You actually followed me all the way here? What was your name again? <CHARNAME>? Those Eldathyn must have thoroughly clouded your mind if you're foolish enough to follow them straight into your own death!~ 
DO ~Enemy()~ EXIT
