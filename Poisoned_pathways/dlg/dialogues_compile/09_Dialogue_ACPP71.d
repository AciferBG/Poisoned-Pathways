BEGIN ~AC#PPOR3~

// Torvak Hrun - Dialog
CHAIN IF ~True()~ THEN AC#PPOR3 hello_01
~You here? Means you killed my brother, Wadal!~
END
IF~~THEN REPLY ~Uh... yeah, that might be true.~ EXTERN AC#PPOR3 fight
IF~~THEN REPLY ~Step aside—or I'll send you to join him.~ EXTERN AC#PPOR3 fight
IF~~THEN REPLY ~Stand in my way, and you'll share his grave.~ EXTERN AC#PPOR3 fight
IF~~THEN REPLY ~We don't seek a fight with you. We're after the Talonite.~ EXTERN AC#PPOR3 seek_talonite

CHAIN AC#PPOR3 seek_talonite
~You hunt Malagent? Foolish! Many hunt him. None return. Malagent pay good—Hrun brothers stay loyal. Hmm... Only one Hrun now.~
END
IF~~THEN EXTERN AC#PPOR3 fight

CHAIN AC#PPOR3 fight
~No need magic! Me axe sharp enough to carve your bones! I crush you for Wadal!~
DO ~Enemy()~ EXIT

