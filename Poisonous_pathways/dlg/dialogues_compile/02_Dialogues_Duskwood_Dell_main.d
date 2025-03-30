
// Dialogue Eldath priest #3; guard in Duskwood Dell

BEGIN ~AC#PPEL3~

CHAIN IF ~True()~ THEN AC#PPEL3 hello_01
~Der Frieden der Göttin sei mit Euch. Es kommen nicht oft Fremde wie Ihr hierher. Dieser Ort kann eigentlich nur von jenen gefunden werden, die ihn bereits kennen. Wie kommt es, dass Ihr hier seid und die Göttin Euch Einlass gewährt hat?~ 
END
IF~~THEN REPLY ~Ich bringe Kunde, dass ein Anhänger Eurer Kirche von einem Unbekannten vergiftet wurde. Ich habe hier einen Pfeil, damit Euer Anführer des Ordens den Urheber des Giftes ausfindig machen kann.~ EXTERN AC#PPEL3 need_go_to_highpriest

	CHAIN IF ~~ THEN AC#PPEL3 need_go_to_highpriest
	~Bei the Mother Guardian of Groves! So ist Merethan bei seiner Suche gescheitert? Das sind schlimme Nachrichten. Schnell bringt das Gift zu unserem obersten Priester, Most Exalted Fallskeeper Alatoasz Berendim. Er befindet sich in seinen Gemächern im hintersten Baum direkt am Wasser. Doch gebt Acht, dass Ihr Euch selbst nicht an dem Gift verletzt! Alatoasz wird wissen, was zu tun ist. Möge the Green Goddess hier ihren Segen schenken.~
	DO ~EscapeArea()~ EXIT
	
// Dialogue Eldath highpriest #4; tree house in Duskwood Dell

BEGIN ~AC#PPEL4~

CHAIN IF ~Global("AC#SpellCheckPoison","GLOBAL",1)~ THEN AC#PPEL4 hello_02
~Selbst dieser Erkenntniszauber schlägt fehl? Wie kann das sein...?~ 
DO ~SetGlobal("AC#SpellCheckPoison","GLOBAL",2)~ EXIT

CHAIN IF ~True()~ THEN AC#PPEL4 hello_01
~Möge the Mother Guardian of Groves Euch Frieden und Gesundheit schenken, Fremde. Ich bin Most Exalted Fallskeeper Alatoasz Berendim, ein bescheidener Diener der Eldath. Was führt Euch an diesen abgelegenen Ort?~ 
END
IF~~THEN REPLY ~Euer Priester Merethan wurde vergiftet. Ich habe hier einen Pfeil, der mit dem Gift getränkt ist. Er hoffte, dass Ihr damit die Spur zu dem Übeltäter aufnehmen könnt.~ EXTERN AC#PPEL4 about_arrow

	CHAIN IF ~~ THEN AC#PPEL4 about_arrow
	~Das sind traurige Neuigkeiten. Merethan war ein treuer Anhänger, und es schmerzt mich, dass er auf diesem Wege aus unserer Welt geschieden ist. Lasst mich den pfeil einmal in Augenschein nehmen...~
	END
	IF~~THEN DO ~TakePartyItem("AC#PPARP")~ EXTERN AC#PPEL4 check_arrow	
	
		CHAIN IF ~~ THEN AC#PPEL4 check_arrow
		~Ein merkwürdiges Gift. Merethan hatte Euch sicher erzählt, was uns an diesem Gift so beunruhigt?~
		END
		IF~~THEN REPLY ~Er erwähnte, dass man es nicht heilen könne.~ EXTERN AC#PPEL4 about_poison
		
		CHAIN IF ~~ THEN AC#PPEL4 about_poison
		~So ist es. Trotz der traurigen Umstände ist es deshalb gut, dass Ihr mir eine Probe von diesem üblen Stoff vorbeigebracht habt!~
		END
		IF~~THEN EXTERN AC#PPEL4 spell_poison
		
		CHAIN IF ~~ THEN AC#PPEL4 spell_poison
		~Lasst mich einen Zauber wirken, um die Beschaffenheit des Giftes weiter zu erkennen...~
		DO ~SetGlobal("AC#SpellCheckPoison","GLOBAL",1)
			ClearAllActions()
			StartCutSceneMode()
			StartCutScene("AC#PPCT4")
			~ EXIT
