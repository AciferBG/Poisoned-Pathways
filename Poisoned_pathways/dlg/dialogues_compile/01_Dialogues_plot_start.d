// Dialoge Skann Delth// Dialogue Eldath priest #2 in Athkatla

BEGIN ~AC#PPSKD~

CHAIN IF ~StateCheck(Myself,STATE_CHARMED)~ THEN AC#PPSKD hello_charmed
@3000 
END
IF~Global("AC#PPHasMap","GLOBAL",1)~THEN EXTERN AC#PPSKD wheres_my_map
IF~Global("AC#PPHasMap","GLOBAL",0)~THEN EXTERN AC#PPSKD give_map_charmed

	CHAIN IF ~~ THEN AC#PPSKD wheres_my_map
	@3001
	DO ~ChangeEnemyAlly(Myself,NEUTRAL)
	EscapeAreaDestroy(2)~ EXIT
	
	CHAIN IF ~~ THEN AC#PPSKD give_map_charmed
	@3002
	DO ~GiveItem("AC#PPMP1",LastTalkedToBy())
	ChangeEnemyAlly(Myself,NEUTRAL)
	EscapeAreaDestroy(2)~ EXIT

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#PPSKD hello_00
@3003
END
IF~~THEN REPLY @3004 EXTERN AC#PPSKD interest
IF~~THEN REPLY @3005 EXTERN AC#PPSKD bye
	
CHAIN IF ~True()~ THEN AC#PPSKD hello_02
@3006
END
IF~~THEN REPLY @3007 EXTERN AC#PPSKD fight
IF~~THEN REPLY @3004 EXTERN AC#PPSKD interest
IF~Global("TellSupplier","LOCALS",1) Global("AC#PPHasMap","GLOBAL",0)~THEN REPLY @3008 EXTERN AC#PPSKD tell_me
IF~~THEN REPLY @3005 EXTERN AC#PPSKD bye

	CHAIN IF ~~ THEN AC#PPSKD interest
	@3009
	END
	IF~~THEN REPLY @3010 EXTERN AC#PPSKD fight
	IF~Global("TellSupplier","LOCALS",0) Global("AC#PPHasMap","GLOBAL",0)~THEN REPLY @3011 DO ~SetGlobal("TellSupplier","LOCALS",1)~ EXTERN AC#PPSKD special_poison
	IF~Global("TellSupplier","LOCALS",1) Global("AC#PPHasMap","GLOBAL",0)~THEN REPLY @3008 EXTERN AC#PPSKD tell_me
	IF~~THEN REPLY @3012 EXTERN AC#PPSKD bye

	CHAIN IF ~~ THEN AC#PPSKD special_poison
	@3013
	END
	IF~~THEN REPLY @3014 EXTERN AC#PPSKD fight
	IF~~THEN REPLY @3015 EXTERN AC#PPSKD tell_me
	IF~~THEN REPLY @3008 EXTERN AC#PPSKD tell_me
	IF~~THEN REPLY @3016 EXTERN AC#PPSKD bye

	CHAIN IF ~~ THEN AC#PPSKD tell_me
	@3017
	END
	IF~~THEN EXTERN AC#PPSKD tell_me_cycle

	CHAIN IF ~~ THEN AC#PPSKD tell_me_cycle
	@3018
	END
	IF~~THEN REPLY @3019 EXTERN AC#PPSKD not_telling_bye
	IF~Global("TellPrice","LOCALS",1)~THEN REPLY @3020 EXTERN AC#PPSKD pay_gold_01
	IF~Global("TellPrice","LOCALS",0)~THEN REPLY @3021 DO ~SetGlobal("TellPrice","LOCALS",1)~ EXTERN AC#PPSKD pay_gold_start
	IF~CheckStatGT(LastTalkedToBy,17,STR)~THEN REPLY @3022 EXTERN AC#PPSKD tell_supplier
	IF ~InParty("minsc") !StateCheck("minsc",CD_STATE_NOTVALID) Global("AC#PP_MinscMuscles","GLOBAL",0)~ THEN REPLY @3023 EXTERN MinscJ Minsc_show_muscles
	IF~ReputationLT(Player1,6)~THEN REPLY @3024 EXTERN AC#PPSKD threat_rep
	IF~Dead("maevar")~THEN REPLY @3025 EXTERN AC#PPSKD threat_rep
	IF~ReputationGT(Player1,16)~THEN REPLY @3026 EXTERN AC#PPSKD threat_rep
	IF~GlobalGT("Linvail","GLOBAL",0)~THEN REPLY @3027 EXTERN AC#PPSKD work_shadow_thieves
	IF~GlobalGT("BodhiJob","GLOBAL",0)~THEN REPLY @3028 EXTERN AC#PPSKD work_bodhi
	IF~~THEN REPLY @3007 EXTERN AC#PPSKD fight
	IF~~THEN REPLY @3029 EXTERN AC#PPSKD fight
	IF~~THEN REPLY @3030 EXTERN AC#PPSKD bye	
	
		CHAIN AC#PPSKD Minsc_show_muscles_02
		@3031		
		== AC#PPSKD @3032
		== AerieJ  IF ~InParty("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @3033
		==ViconiJ IF ~InParty("viconia") !StateCheck("viconia",CD_STATE_NOTVALID)~ THEN @3034
		==JaheiraJ IF ~InParty("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN @3035
		==HAERDAJ IF ~InParty("haerdalis") !StateCheck("haerdalis",CD_STATE_NOTVALID)~ THEN @3036
		//== MazzyJ IF ~InParty("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN @3037
		== BEDWIN IF ~InParty("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN @3038 
		==KorganJ IF ~InParty("korgan") !StateCheck("korgan",CD_STATE_NOTVALID)~ THEN @3039
		EXIT

	CHAIN IF ~~ THEN AC#PPSKD pay_gold_start
	@3040
	=	
	@3041 
	END
	IF~~THEN EXTERN AC#PPSKD pay_gold_01
	
	CHAIN IF ~~ THEN AC#PPSKD pay_gold_01
	@3042
	END
	IF~PartyGoldGT(9999)~THEN REPLY @3043 DO ~TakePartyGold(10000)~ EXTERN AC#PPSKD tell_supplier_gold
	IF~~THEN REPLY @3044 EXTERN AC#PPSKD not_telling_bye
	IF~PartyGoldLT(10000)~THEN REPLY @3045 EXTERN AC#PPSKD not_telling_bye
	
	CHAIN IF ~~ THEN AC#PPSKD tell_supplier_gold
	@3046
	END
	IF~~THEN EXTERN AC#PPSKD tell_supplier_02

CHAIN IF ~~ THEN AC#PPSKD threat_rep
@3047
END
IF~~THEN REPLY @3048 EXTERN AC#PPSKD tell_supplier
IF~~THEN REPLY @3049 EXTERN AC#PPSKD tell_supplier
IF~~THEN REPLY @3050 EXTERN AC#PPSKD tell_supplier

CHAIN IF ~~ THEN AC#PPSKD work_shadow_thieves
@3051
END
IF~~THEN REPLY @3052 EXTERN AC#PPSKD tell_supplier

CHAIN IF ~~ THEN AC#PPSKD work_bodhi
@3053
END
IF~~THEN REPLY @3054 EXTERN AC#PPSKD tell_supplier
IF~~THEN REPLY @3055 EXTERN AC#PPSKD tell_supplier
IF~~THEN REPLY @3056 EXTERN AC#PPSKD tell_supplier

CHAIN IF ~~ THEN AC#PPSKD tell_supplier
@3057
END
IF~~THEN EXTERN AC#PPSKD tell_supplier_02

CHAIN IF ~~ THEN AC#PPSKD tell_supplier_02
@3058 
=
@3059
END
IF~~THEN REPLY @3060 EXTERN AC#PPSKD map_bye
IF~~THEN REPLY @3061 EXTERN AC#PPSKD map_bye

CHAIN AC#PPSKD map_bye
@3062
=
@3063
DO ~GiveItem("AC#PPMP1",LastTalkedToBy())
EscapeArea()~ EXIT


CHAIN AC#PPSKD fight
@3064
DO ~SetGlobal("AC#PP_SkannFight","GLOBAL",1)
Enemy()~ EXIT

CHAIN AC#PPSKD bye
@3065
EXIT

CHAIN AC#PPSKD not_telling_bye
@3066
EXIT


// Dialogue Talonite priest in glade (ambush area)

BEGIN ~AC#PPOR1~

BEGIN ~AC#PPTA1~

CHAIN IF ~True()~ THEN AC#PPTA1 hello_0
@3067
DO ~SetGlobal("CutsceneAmbush","ACPP30",10)
ClearAllActions()
ActionOverride("CUTSPY",DestroySelf())
ActionOverride("AC#PPOR1",EscapeArea())
Wait(1)
EscapeArea()~ EXIT

// Dialogue Eldath priest #2 in glade (ambush area)

BEGIN ~AC#PPEL2~

CHAIN IF ~Global("CutsceneAmbush","ACPP30",10)~ THEN AC#PPEL2 hello_poison
@3068 
END
IF~~THEN REPLY @3069 EXTERN AC#PPEL2 lucky
IF~~THEN REPLY @3070 EXTERN AC#PPEL2 lucky
IF~~THEN REPLY @3071 EXTERN AC#PPEL2 lucky
IF~~THEN REPLY @3072 EXTERN AC#PPEL2 lucky
IF~~THEN REPLY @3073 EXTERN AC#PPEL2 lucky

CHAIN IF ~~ THEN AC#PPEL2 lucky
@3074
END
IF~~THEN REPLY @3075 EXTERN AC#PPEL2 bring_arrow_duskwood_dell
IF~~THEN REPLY @3076 EXTERN AC#PPEL2 bring_arrow_duskwood_dell
IF~~THEN REPLY @3077 EXTERN AC#PPEL2 bring_arrow_duskwood_dell
IF~~THEN REPLY @3078 EXTERN AC#PPEL2 bring_arrow_duskwood_dell

CHAIN IF ~~ THEN AC#PPEL2 bring_arrow_duskwood_dell
@3079 
== AC#PPEL2@3080
END
IF~~THEN REPLY @3081 EXTERN AC#PPEL2 what_about_title
IF~~THEN REPLY @3082 EXTERN AC#PPEL2 show_duskwood_dell
IF~~THEN REPLY @3083 EXTERN AC#PPEL2 show_duskwood_dell
IF~~THEN REPLY @3084 EXTERN AC#PPEL2 show_duskwood_dell
IF~~THEN REPLY @3085 EXTERN AC#PPEL2 what_about_you
IF~~THEN REPLY @3086 EXTERN AC#PPEL2 dont_know_duskwood_dell

CHAIN AC#PPEL2 what_about_title
@3087
END
IF~~THEN REPLY @3088 EXTERN AC#PPEL2 what_about_you
IF~~THEN REPLY @3089 EXTERN AC#PPEL2 show_duskwood_dell

CHAIN IF ~~ THEN AC#PPEL2 what_about_you
@3090
END
IF~~THEN REPLY @3089 EXTERN AC#PPEL2 show_duskwood_dell
IF ~~ THEN REPLY @3091 EXTERN AC#PPEL2 dont_know_duskwood_dell

	CHAIN IF ~~ THEN AC#PPEL2 dont_know_duskwood_dell
	@3092
	END
	IF~~THEN EXTERN AC#PPEL2 show_duskwood_dell

CHAIN IF ~~ THEN AC#PPEL2 show_duskwood_dell
@3093
END
IF~~THEN DO ~RevealAreaOnMap("ACPP01")~ EXTERN AC#PPEL2 tell_malagent


CHAIN IF ~~ THEN AC#PPEL2 tell_malagent
@3094
END
IF~~THEN EXTERN AC#PPEL2 bye_death

CHAIN IF ~~ THEN AC#PPEL2 bye_death
@3095
== AerieJ  IF ~InParty("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @3096
//==RasaadJ IF ~InParty("rasaad") !StateCheck("rasaad",CD_STATE_NOTVALID)~ THEN @3097
==ViconiJ IF ~InParty("viconia") !StateCheck("viconia",CD_STATE_NOTVALID)~ THEN @3098
//==JaheiraJ IF ~InParty("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN @3099
==HAERDAJ IF ~InParty("haerdalis") !StateCheck("haerdalis",CD_STATE_NOTVALID)~ THEN @3100
==HEXXATJ IF ~InParty("hexxat") !StateCheck("hexxat",CD_STATE_NOTVALID)~ THEN @3101
//==NeeraJ IF ~InParty("neera") !StateCheck("neera",CD_STATE_NOTVALID)~ THEN @3102
//==ValygarJ IF ~InParty("valygar") !StateCheck("valygar",CD_STATE_NOTVALID)~ THEN @3103
//== JANJ IF ~InParty("Jan") !StateCheck("Jan",CD_STATE_NOTVALID)~ THEN @3104
==CerndJ IF ~InParty("cernd") !StateCheck("cernd",CD_STATE_NOTVALID)~ THEN @3105
== KeldorJ IF ~InParty("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ THEN @3106
//== AnomenJ  IF ~InParty("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN @3107
//==NaliaJ IF ~InParty("nalia") !StateCheck("nalia",CD_STATE_NOTVALID)~ THEN @3108
==MinscJ IF ~InParty("minsc") !StateCheck("minsc",CD_STATE_NOTVALID)~ THEN @3109
== DornJ  IF ~InParty("Dorn") !StateCheck("Dorn",CD_STATE_NOTVALID)~ THEN @3110
== BEDWIN IF ~InParty("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN @3111 
==KorganJ IF ~InParty("korgan") !StateCheck("korgan",CD_STATE_NOTVALID)~ THEN @3112 
== AC#PPEL2 @3113
DO ~SetGlobal("Die_Eldath","ACPP30",1)
AddJournalEntry(@12004,QUEST)
Kill(Myself)~ EXIT

CHAIN IF ~Global("CutsceneAmbush","ACPP30",1)~ THEN AC#PPEL2 hello_talonite
@3114 
== AC#PPTA1 @3115
== AC#PPEL2 @3116 
== AC#PPTA1 @3117 
== AC#PPEL2 @3118 
== AC#PPTA1 @3119 
== AC#PPTA1 @3120 
== AC#PPOR1 @3121
== AC#PPTA1 @3122 
== AC#PPOR1 @3123 
== AC#PPEL2 @3124 
== AC#PPTA1 @3125 
END
IF ~~ THEN DO ~SetGlobal("CutsceneAmbush","ACPP30",2)
StartCutSceneMode()
StartCutScene("AC#PPCT3")~ EXIT

CHAIN IF ~True()~ THEN AC#PPEL2 hello_0
@3126
DO ~SetGlobal("CutsceneAmbush","ACPP30",1)
ClearAllActions()
StartCutSceneMode()
StartCutScene("AC#PPCT2")
~ EXIT


// Dialogue Eldath priest #2 in Athkatla

BEGIN ~AC#PPEL1~

CHAIN IF ~Global("AC#PPHasMap","GLOBAL",10)~ THEN AC#PPEL1 hello_glade
@3127
END
IF~~THEN REPLY @3128 EXTERN AC#PPEL1 lets_go
IF~~THEN REPLY @3129 EXTERN AC#PPEL1 bye_wait

CHAIN IF ~Global("AC#PP_PlotStart","GLOBAL",3)~ THEN AC#PPEL1 hello_02
@3130
END
IF~Global("AC#PPHasMap","GLOBAL",1)
PartyHasItem("AC#PPMP1") ~THEN REPLY @3131 DO ~SetGlobal("AC#PPHasMap","GLOBAL",10) TakePartyItem("AC#PPMP1") DestroyItem("AC#PPMP1") AddJournalEntry(@12003,QUEST)~ EXTERN AC#PPEL1 about_glade
IF~~THEN REPLY @3132 EXTERN AC#PPEL1 bye_wait

CHAIN IF ~~ THEN AC#PPEL1 about_glade
@3133
=
@3134
END
IF~~THEN REPLY @3128 EXTERN AC#PPEL1 lets_go
IF~~THEN REPLY @3129 EXTERN AC#PPEL1 bye_wait

CHAIN AC#PPEL1 lets_go
@3135
=
@3136
== SLILMAT @3137
== AC#PPEL1 @3138
DO ~SetGlobal("AC#PP_PlotStart","GLOBAL",4)
ClearAllActions()
StartCutSceneMode()
StartCutScene("AC#PPCT1")~ EXIT


CHAIN AC#PPEL1 bye_wait
@3139
EXIT

// Dialogue Eldath priest #1 in Athkatla

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#PPEL1 hello_01
@3140
END
IF~~THEN REPLY @3141 EXTERN AC#PPEL1 job
IF~~THEN REPLY @3142 EXTERN AC#PPEL1 job
IF~~THEN REPLY @3143 EXTERN AC#PPEL1 dont_like_spies
IF~~THEN REPLY @3144 EXTERN AC#PPEL1 bye

	CHAIN IF ~~ THEN AC#PPEL1 dont_like_spies
	@3145
	END
	IF~~THEN REPLY @3146 EXTERN AC#PPEL1 job
	IF~~THEN REPLY @3147 EXTERN AC#PPEL1 job
	IF~~THEN REPLY @3148 EXTERN AC#PPEL1 job
	IF~~THEN REPLY @3144 EXTERN AC#PPEL1 bye

CHAIN IF ~~ THEN AC#PPEL1 job
@3149 
== JaheiraJ IF ~InParty("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @3150
== CerndJ  IF ~InParty("Cernd") !StateCheck("Cernd",CD_STATE_NOTVALID)~ THEN @3151
	END
	IF~~THEN REPLY @3152 EXTERN AC#PPEL1 about_eldath
	IF~~THEN REPLY @3153 EXTERN AC#PPEL1 about_eldath
	IF~~THEN REPLY @3154 EXTERN AC#PPEL1 about_eldath
	IF~~THEN REPLY @3155 EXTERN AC#PPEL1 about_eldath
	
	CHAIN IF ~~ THEN AC#PPEL1 about_eldath
	@3156 
	END
	IF~~THEN EXTERN AC#PPEL1 about_renfeld_01

CHAIN IF ~~ THEN AC#PPEL1 about_renfeld_01
@3157
== AC#PPEL1 @3158
== AC#PPEL1 @3159
END
IF~~THEN DO ~AddJournalEntry(@12000,QUEST)~ EXTERN AC#PPEL1 about_poison

CHAIN IF ~~ THEN AC#PPEL1 about_poison
@3160
== HaerdaJ  IF ~InParty("haerdalis") !StateCheck("haerdalis",CD_STATE_NOTVALID)~ THEN @3161
== AerieJ  IF ~InParty("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @3162
== ViconiJ  IF ~InParty("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN  @3163
== JaheiraJ IF ~InParty("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @3164
== CerndJ  IF ~InParty("Cernd") !StateCheck("Cernd",CD_STATE_NOTVALID)~ THEN @3165
== MazzyJ IF ~InParty("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN @3166
== AnomenJ  IF ~InParty("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN @3167
== KeldorJ IF ~InParty("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ THEN @3168
== NaliaJ IF ~InParty("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN  @3169
== DornJ  IF ~InParty("Dorn") !StateCheck("Dorn",CD_STATE_NOTVALID)~ THEN @3170
== AC#PPEL1 @3171
END
IF~~THEN REPLY @3172 EXTERN AC#PPEL1 about_poison_02
IF~~THEN REPLY @3173 EXTERN AC#PPEL1 about_poison_02
IF~~THEN REPLY @3174 EXTERN AC#PPEL1 about_poison_02
IF~~THEN REPLY @3175 EXTERN AC#PPEL1 about_poison_02
IF~~THEN REPLY @3176 EXTERN AC#PPEL1 about_poison_02

CHAIN IF ~~ THEN AC#PPEL1 about_poison_02
@3177
== AC#PPEL1 @3178
== JANJ IF ~InParty("Jan") !StateCheck("Jan",CD_STATE_NOTVALID)~ THEN @3179
END
IF~~THEN REPLY @3180 EXTERN AC#PPEL1 about_person
IF~~THEN REPLY @3181 EXTERN AC#PPEL1 about_person
IF~~THEN REPLY @3182 EXTERN AC#PPEL1 about_person
IF~~THEN REPLY @3183 EXTERN AC#PPEL1 bye

CHAIN IF ~~ THEN AC#PPEL1 about_person
@3184 
== AC#PPEL1 @3185
END
IF~~THEN EXTERN AC#PPEL1 first_task

CHAIN IF ~~ THEN AC#PPEL1 first_task
@3186
== ViconiJ  IF ~InParty("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN  @3187
== KORGANJ  IF ~InParty("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN  @3188
== JaheiraJ IF ~InParty("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @3189
== AC#PPEL1 @3190
END
IF~~THEN REPLY @3191 EXTERN AC#PPEL1 job_payment
IF~~THEN REPLY @3192 EXTERN AC#PPEL1 job_payment
IF~~THEN REPLY @3193 EXTERN AC#PPEL1 job_payment

CHAIN IF ~~ THEN AC#PPEL1 job_payment
@3194
END
IF~~THEN REPLY @3195 EXTERN AC#PPEL1 job_yes
IF~~THEN REPLY @3196 EXTERN AC#PPEL1 job_yes
IF~~THEN REPLY @3197 EXTERN AC#PPEL1 bye_sure

CHAIN IF ~~ THEN AC#PPEL1 bye_sure
@3198
END
IF~~THEN REPLY @3199 EXTERN AC#PPEL1 job_yes
IF~~THEN REPLY @3200 EXTERN AC#PPEL1 bye

CHAIN IF ~~ THEN AC#PPEL1 job_yes
@3201
END
IF~~THEN EXTERN AC#PPEL1 wait_bye

CHAIN IF ~~ THEN AC#PPEL1 wait_bye
@3202
DO ~AddJournalEntry(@12001,QUEST)
SetGlobal("AC#PP_PlotStart","GLOBAL",3)
EscapeArea()
~ EXIT

CHAIN IF ~~ THEN AC#PPEL1 bye
@3203
END
IF~~THEN REPLY @3204 EXTERN AC#PPEL1 job
IF~~THEN REPLY @3205 EXTERN AC#PPEL1 bye_definitve

CHAIN IF ~~ THEN AC#PPEL1 bye_definitve
@3206
END
IF~~THEN DO ~EraseJournalEntry(@12000)
SetGlobal("AC#PP_PlotStart","GLOBAL",20)
EscapeArea()~ EXIT

APPEND ~MINSCJ~
IF ~~ THEN BEGIN Minsc_show_muscles
   SAY @3207
   IF ~~ THEN DO ~SetGlobal("AC#PP_MinscMuscles","GLOBAL",1)~ EXTERN ~AC#PPSKD~ Minsc_show_muscles_02
END
END


