
// Dialogue sidechars in Duskwood Dell

// dryad in area acpp06 (Eldath's Peace Grotto):
BEGIN ~AC#PPDR1~

CHAIN IF ~True()~ THEN AC#PPDR1 hello_01
~Greetings, <RACE>. Have you come to lay down your arms and receive the blessing of the Goddess?~ 
END
IF~~THEN REPLY ~What is this place?~ EXTERN AC#PPDR1 what_place
IF~~THEN REPLY ~I think I'll be going now.~ EXTERN AC#PPDR1 bye

	CHAIN IF ~~ THEN AC#PPDR1 what_place
	~Here, many brave warriors have chosen to abandon their trade and follow the path of peace instead. Do you see the many weapons? Each one once belonged to a soul whose life was shaped by war and bloodshed—until they laid down their arms here and chose a different path.~ 
	END
	IF~~THEN REPLY ~I think I'll be going now.~ EXTERN AC#PPDR1 bye

	CHAIN IF ~~ THEN AC#PPDR1 bye
	~Peace to you, traveler. May your path be soft beneath your feet.~
	DO ~~ EXIT

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

	CHAIN IF ~~ THEN AC#PPON3 orc_fight
	~No! Don’t fight!~ 
	END
	IF~~THEN EXTERN AC#PPON3 orc_not_expecting

	CHAIN IF ~~ THEN AC#PPON3 orc_not_expecting
	~I am Peacefang. I follow Eldath. Left behind the wicked gods of my kin. I live in peace—with others, with the land.~ 
	END
	IF~~THEN REPLY ~And I’m supposed to believe that?~ EXTERN AC#PPON3 orc_believe
	IF~~THEN REPLY ~Then I’ll let you get back to your work.~ EXTERN AC#PPON3 bye

	CHAIN IF ~~ THEN AC#PPON3 orc_believe
	~Yes. I only lift axe to split pumpkin now. Pumpkin harder to split than human head! But Peacefang doesn’t mind the work.~ 
	END
	IF~~THEN REPLY ~Then I’ll let you get back to your work.~ EXTERN AC#PPON3 bye

	CHAIN IF ~~ THEN AC#PPON3 bye
	~Keep axe sharp! For chopping pumpkin.~ 
	DO ~~ EXIT

	
