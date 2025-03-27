// Dialogue Talonie priest  in glade (ambush area)

BEGIN ~AC#PPTA1~

CHAIN IF ~True()~ THEN AC#PPTA1 hello_0
~So, Ihr da hinten, wie war noch Euer Name? <CHARNAME>? Ihr könnt Euren sterbenden Freund hier abholen! Und richtet seinen Auftraggebern aus, dass man sich niemals mit einem Malagenten anlegen sollte!~
DO ~SetGlobal("CutsceneAmbush","ACPP30",10)
	ClearAllActions()
	ActionOverride("CUTSPY",DestroySelf())
	ActionOverride("AC#PPOR1",EscapeArea())
	Wait(1)
	EscapeArea()~ EXIT

// Dialogue Eldath priest #2 in glade (ambush area)

BEGIN ~AC#PPEL2~

CHAIN IF ~Global("CutsceneAmbush","ACPP30",10)~ THEN AC#PPEL2 hello_poison
~Verflucht, was für... ein... argh... ich... kann.. nicht mehr...~ [GPRIM08]
DO ~SetGlobal("Die_Eldath","ACPP30",1)
Kill(Myself)~ EXIT

CHAIN IF ~Global("CutsceneAmbush","ACPP30",1)~ THEN AC#PPEL2 hello_talonite
	~Seid gegrüßt, Fremder. Ein schöner Ort, um hier in der Wildnis seinen Geschäften nachzugehen, findet Ihr nicht? Hier gibt es jede Menge Pilze. Man muss nur aufpassen, keine Giftigen zu erwischen.~ 
	== AC#PPTA1 ~Kein Grund, sich zu verstellen, Priester. Meine Kontakte in Athkatla haben Euer Kommen angekündigt.~ [STHMA04]
	== AC#PPEL2 ~So habt Ihr also das Gift mitgebracht, nach dem ich mich sehne?~ 
	== AC#PPTA1 ~Das habe ich! Und Ihr werdet es auch selbst gleich kosten!~ 
	== AC#PPEL2 ~Wie meint Ihr...~ 
	== AC#PPTA1 ~Für wie dumm haltet Ihr mich eigentlich, Eldathiner? Denkt Ihr, ich durchschaue Euer Ränkespiel nicht? Denkt Ihr, ich würde diese ungeschlachten Gestalten da hinten zwischen den Bäumen nicht bemerken?~ 
	== AC#PPTA1 ~Ihr wolltet mir einen Hinterhalt stellen, und statt dessen habe ich nun Euch einen gestellt.~ 
	== AC#PPEL2 ~<CHARNAME>! Zu mir!~ 
	== AC#PPTA1 ~Euer <CHARNAME> wird Euch nicht helfen. Ihr bekommt das Gift, nach dem Ihr Euch so sehnt, oh ja. Und zwar Mitten ins Herz!~ 
	END
	IF ~~ THEN DO ~SetGlobal("CutsceneAmbush","ACPP30",2)
	StartCutSceneMode()
	StartCutScene("AC#PPCT3")~ EXIT	
	
CHAIN IF ~True()~ THEN AC#PPEL2 hello_0
~Hier müsste es sein. Bitte wartet hier, ich werde vorausgehen und versuchen, einen Handel zu arrangieren. Greift bitte erst ein, wenn sich das Blatt zum Schlechten wendet.~
DO ~SetGlobal("CutsceneAmbush","ACPP30",1)
	ClearAllActions()
	StartCutSceneMode()
	StartCutScene("AC#PPCT2")
	~ EXIT

// Dialogue Eldath priest #1 in Athkatla

BEGIN ~AC#PPEL1~

CHAIN IF ~Global("AC#PP_PlotStart","GLOBAL",3)~ THEN AC#PPEL1 hello_02
~Schön, Euch hier wiederzusehen! Können wir gehen und die Suche nach dem Giftmischer beginnen?~
END
IF~~THEN REPLY ~Ja, gehen wir.~ EXTERN AC#PPEL1 lets_go
IF~~THEN REPLY ~Nein, ich brauche noch etwas Zeit.~ EXTERN AC#PPEL1 bye_wait

	CHAIN IF ~~ THEN AC#PPEL1 lets_go
	~Ausgezeichnet! Mein lieber Freund, wäret Ihr so freundlich, meinem Akolythen zu sagen, dass wir aufbrechen?~
	== SLILMAT ~Selbstverständlich, Priester der versteckten Göttin.~
	== AC#PPEL1 ~So lasst uns also gehen.~
	DO ~SetGlobal("AC#PP_PlotStart","GLOBAL",4)
	ClearAllActions()
	StartCutSceneMode()
	StartCutScene("AC#PPCT1")
	~ EXIT

CHAIN IF ~~ THEN AC#PPEL1 bye_wait
~Dann werde ich hier weiter auf Euch warten.~
EXIT


CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#PPEL1 hello_01
~Seid gegrüßt, <CHARNAME>. Verzeiht, dass ich Euch direkt mit Namen anspreche, doch ich habe Euch ein wenig beobachtet und könnte Eure Hilfe gebrauchen.~
END
IF~~THEN REPLY ~Worum geht es?~ EXTERN AC#PPEL1 job
IF~~THEN REPLY ~Sehr gerne, wenn die Bezahlung stimmt.~ EXTERN AC#PPEL1 job
IF~~THEN REPLY ~Sucht Euch jemand anderen für Euer Anliegen.~ EXTERN AC#PPEL1 bye

CHAIN IF ~~ THEN AC#PPEL1 job
~Danke, dass Ihr mir Eure wertvolle Zeit schenkt. Ich bin Merethan, treuer Diener der Eldath, the Green Goddess. Ich möchte gleich zur Sache kommen: Ihr hattet vor Kurzem den armen Renfeld gerettet und nach Athkatla gebracht, nachdem er von Unbekannten vergiftet wurde. Ich gehöre keiner der Beteiligten Organisationen an und untersuche allein im Anliegen der Kirche Eldaths. Das Auftreten des Giftes hat mich sehr beunruhigt, denn es ist nicht der erste Fall, dass jemand mit einem Gift getötet werden soll, von dem es keine magische Heilung gibt.~
END
IF~~THEN REPLY ~Wie meint Ihr das?~ EXTERN AC#PPEL1 about_poison
IF~~THEN REPLY ~Fahrt fort.~ EXTERN AC#PPEL1 about_poison

	CHAIN IF ~~ THEN AC#PPEL1 about_poison
	~Wie Ihr vielleicht wisst, kann man die meisten Formen von Giften mit einfachen klerikalen Zaubern heilen - oder zumindest verzögern. Hier ist es jedoch anders, denn selbst die stärkste göttliche Magie hat versagt. Es gibt kein Gegenmittel gegen dieses Gift, denn es widersetzt sich unseren Zaubern. So bleibt nur, dem Vergifteten in seinen letzten Atemzügen Beistand zu leisten oder auf ein Wunder zu hoffen, dass er es schafft, die Wirkung selbst abzuschütteln.~
	END
	IF~~THEN REPLY ~Fahrt fort.~ EXTERN AC#PPEL1 about_poison_02
	
	CHAIN IF ~~ THEN AC#PPEL1 about_poison_02
	~Da verschiedene unterschiedliche Organisationen dieses Gift einsetzen, scheint es, dass es nicht von einer dieser Vereinigungen geschaffen wurde, da sie es auch gegeneinander einsetzen. Jemand - oder etwas - Drittes scheint hier im Spiel zu sein; und ich möchte herausfinden, wer es ist.~
	END
	IF~~THEN REPLY ~Wie ist so jemand zu finden?~ EXTERN AC#PPEL1 about_person
	IF~~THEN REPLY ~Und ich soll diese Person für Euch suchen.~ EXTERN AC#PPEL1 about_person
	
	CHAIN IF ~~ THEN AC#PPEL1 about_person
	~Ich habe schon Kontakt zu dieser Person hergestellt und mich als interessierter Abnehmer des Giftes ausgegeben. Zumindest hoffe ich, dass dem so ist, denn die verschiedenen Mittelsmänner, mit denen ich nach Renfelds Vergiftung verhandeln musste, waren allesamt zwielichtige Gesellen.~
	END
	IF~~THEN EXTERN AC#PPEL1 bodyguard
	
		CHAIN IF ~~ THEN AC#PPEL1 bodyguard
		~Und hier kommt Ihr ins Spiel. Ich habe ein Treffen mit dem unbekannten Giftmischer arrangiert. Doch ich bin ein Priester der Göttin des Friedens, meine Zauber scheinen gegen diesen Gegner wirkungslos, und ohne diese könnte ich Schwierigkeiten haben, den Übeltäter dingfest zu machen. Ich bitte Euch, dass Ihr mich zu dem Treffen begleitet, aber im Hintergrund wartet, um den Unbekannten nicht zu verscheuchen. Aber Ihr sollt mich beschützen, darum möchte ich gar nicht lange herumreden.~
		END
		IF~~THEN REPLY ~Das kann ich machen.~ EXTERN AC#PPEL1 job_payment
		IF~~THEN REPLY ~Was bekomme ich dafür?~ EXTERN AC#PPEL1 job_payment
		IF~~THEN REPLY ~Nein, das werde ich nicht machen.~ EXTERN AC#PPEL1 job_payment
		
		CHAIN IF ~~ THEN AC#PPEL1 job_payment
		~Ihr sollt es auch nicht umsonst machen. Geld spielt für Angehörige meines Glaubens keine große Rolle, doch ich kann Euch mit zahlreichen wohltuenden Tränken versorgen, wenn Ihr mir bei meinem Anliegen helfen würdet.~
		END
		IF~~THEN REPLY ~In Ordnung.~ EXTERN AC#PPEL1 job_yes
		IF~~THEN REPLY ~Nein, das werde ich nicht machen.~ EXTERN AC#PPEL1 bye_sure
		
				CHAIN IF ~~ THEN AC#PPEL1 bye_sure
				~Seid Ihr sicher, dass Ihr mir nicht helfen werdet?~
				END
				IF~~THEN REPLY ~Nun gut, ich werde Euch helfen.~ EXTERN AC#PPEL1 job_yes
				IF~~THEN REPLY ~Ich werde Euch nicht helfen.~ EXTERN AC#PPEL1 bye
			
			CHAIN IF ~~ THEN AC#PPEL1 job_yes
			~Ausgezeichnet! Der vereinbarte Treffpunkt ist in einem schwer zugänglichen Waldstück. Wir müssen nicht sofort aufbrechen. Rüstet Euch aus und sprecht mich wieder an, wenn Ihr soweit seid. Dann werde ich meinen Akolyten zu dem Mittelsmann schicken und wir können uns auf den Weg zum Treffpunkt machen.~
			END
			IF~~THEN EXTERN AC#PPEL1 wait_bye


CHAIN IF ~~ THEN AC#PPEL1 wait_bye
~Ich werde so lange im Tempel Ilmaters in den Slums auf Euch warten. Sucht mich dort auf, wenn Ihr bereit zum Aufbruch seid!~
DO ~SetGlobal("AC#PP_PlotStart","GLOBAL",3)
EscapeArea()
~ EXIT


CHAIN IF ~~ THEN AC#PPEL1 bye
~Wie schade. Nun gut, dann muss ich mich wohl woanders nach Hilfe umsehen.~
DO ~SetGlobal("AC#PP_PlotStart","GLOBAL",20)
EscapeArea()~ EXIT

