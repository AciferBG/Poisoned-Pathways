
// Dialogue sidechars in Duskwood Dell

// dryad in area acpp06 (eldaths peace grotto):
BEGIN ~AC#PPDR1~

CHAIN IF ~True()~ THEN AC#PPDR1 hello_01
~Seid gegrüßt, <RACE>. Wollt Ihr auch dem Kampfe abschwören und den Segen der Göttin empfangen?~ 
END
IF~~THEN REPLY ~Was ist das für ein Ort hier?~ EXTERN AC#PPDR1 what_place
IF~~THEN REPLY ~Ich gehe dann mal wieder.~ EXTERN AC#PPDR1 bye

	CHAIN IF ~~ THEN AC#PPDR1 what_place
	~An diesem Ort haben schon viele tapfere Krieger beschlossen, ihr Handwerk niederzulegen und stattdessen den Pfad des Friedens weiter zu gehen. Seht Ihr die vielen Waffen? Eine jede gehörte einst einem Wesen, dessen Leben von Kampf und Gewalt bestimmt war und irgendwann beschlossen, die Waffen hier abzulegen und einem friedlichen Pfad zu folgen.~ 
	END
	IF~~THEN REPLY ~Ich gehe dann mal wieder.~ EXTERN AC#PPDR1 bye

	CHAIN IF ~~ THEN AC#PPDR1 bye
	~Peace to you, traveler. May your path be soft beneath your feet.~
	DO ~~ EXIT

// honey making orc in area acpp07:
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
IF~~THEN REPLY ~Ein Ork! Euch mache ich einen Kopf kürzer.~ EXTERN AC#PPON3 orc_fight
IF~~THEN REPLY ~Mit jemandem wie Euch habe ich hier nicht gerechnet.~ EXTERN AC#PPON3 orc_not_expecting
IF~~THEN REPLY ~Ich gehe dann mal wieder.~ EXTERN AC#PPON3 bye
	
	CHAIN IF ~~ THEN AC#PPON3 orc_fight
	~Nein! Nichts tun!~
	END
	IF~~THEN EXTERN AC#PPON3 orc_not_expecting
	
	CHAIN IF ~~ THEN AC#PPON3 orc_not_expecting
	~Ich bin Peacefang. Glaube an Eldath. Hab dem bösen Glauben an die Götter meiner Rasse abgeschworen. Lebe hier in Frieden und Eintracht mit allen anderen und der Natur.~
	END
	IF~~THEN REPLY ~Und das soll ich Euch glauben?~ EXTERN AC#PPON3 orc_believe
	IF~~THEN REPLY ~Dann werde ich Euch einmal wieder Eurer Arbeit überlassen.~ EXTERN AC#PPON3 bye
	
	CHAIN IF ~~ THEN AC#PPON3 orc_believe
	~Ja. Nehme Axt nur noch zum Kürbis spalten. Kürbis viel schwieriger zu spalten als Menschenkopf! Aber Peacefang macht die Arbeit gerne.~
	END
	IF~~THEN REPLY ~Dann werde ich Euch einmal wieder Eurer Arbeit überlassen.~ EXTERN AC#PPON3 bye
	
	CHAIN IF ~~ THEN AC#PPON3 bye
	~Keep axe sharp! For chopping pumpkin.~
	DO ~~ EXIT
	
	
