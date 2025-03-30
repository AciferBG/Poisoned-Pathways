
// Dialogue in area acpp72


BEGIN ~AC#PPTA2~

CHAIN IF ~True()~ THEN AC#PPTA2 hello_01
~Ihr seid mir tatasächlich bis hierher gefolgt? Wie war noch Euer Name? <CHARNAME>? Diese Elathyner müssen Euch ja ziemlich die Sinne vernebelt haben, wenn Ihr ihnen so treudoof in Eurem eigenen Tod folgt!~ 
DO ~Enemy()~ EXIT

