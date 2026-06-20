// Dialogue sidechars in Duskwood Dell

// Bear telling stories in area ACPP08
BEGIN AC#PP06B // Bear

BEGIN AC#PP06R // Rabbit

CHAIN IF ~True()~ THEN AC#PP06R hello_shut_up
@3700
EXIT

BEGIN AC#PP06S // Squirrel

CHAIN IF ~True()~ THEN AC#PP06S hello_shut_up
@3701
EXIT

BEGIN AC#PP06M // Rat

CHAIN IF ~True()~ THEN AC#PP06M hello_shut_up
@3702
EXIT

BEGIN AC#PP06G // Groundhog

CHAIN IF ~True()~ THEN AC#PP06G hello_shut_up
@3703
EXIT

BEGIN AC#PP06P // Pheasant

CHAIN IF ~True()~ THEN AC#PP06P hello_shut_up
@3704
EXIT

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#PP06B story_01
@3705
==AC#PP06R @3706
==AC#PP06S @3707
==AC#PP06G @3708
==AC#PP06P @3709
==AC#PP06M @3710
==AC#PP06B @3711
==AC#PP06R @3712
==AC#PP06G @3713
==AC#PP06R @3714
==AC#PP06B @3715
==AC#PP06P @3716
==AC#PP06S @3717
==AC#PP06B @3718
==AC#PP06M @3719
EXIT

CHAIN IF ~NumTimesTalkedTo(1)~ THEN AC#PP06B hello_listen
@3720
EXIT

CHAIN IF ~RandomNum(3,1)~ THEN AC#PP06B story_02
@3721
==AC#PP06R @3722
==AC#PP06G @3723
==AC#PP06S @3724
==AC#PP06M @3725
==AC#PP06B @3726
EXIT

CHAIN IF ~RandomNum(3,2)~ THEN AC#PP06B story_03
@3727
==AC#PP06R @3728
==AC#PP06S @3729
==AC#PP06P @3730
==AC#PP06G @3731
==AC#PP06B @3732
EXIT

CHAIN IF ~RandomNum(3,3)~ THEN AC#PP06B story_04
@3733
==AC#PP06R @3734
==AC#PP06M @3735
==AC#PP06G @3736
==AC#PP06S @3737
==AC#PP06P @3738
==AC#PP06B @3739
EXIT

// Brother Edrim, name prank; Dell-Light Twins quest
BEGIN ~AC#PPMAN~

IF ~NumTimesTalkedTo(0)
!Global("AC#PPFairyTwinsKidnapQuest","GLOBAL",2)~ THEN BEGIN hello_0
  SAY @3740
  IF ~~ THEN REPLY @3741 GOTO chain_place
  IF ~~ THEN REPLY @3742 GOTO chain_church
  IF ~Global("AC#PPSpellCheckPoison","GLOBAL",0)~ THEN REPLY @3743 GOTO looking_for_highpriest
  IF~Global("WrongHighPriestName","ACPP01",0)~THEN REPLY @3744 DO ~SetGlobal("WrongHighPriestName","ACPP01",1)~ EXTERN AC#PPMAN seek_highpriest_wrong_name
  IF~Global("WrongHighPriestName","ACPP01",1)~THEN REPLY @3745 DO ~SetGlobal("WrongHighPriestName","ACPP01",2)~ EXTERN AC#PPMAN seek_highpriest_wrong_name_2
  IF~Global("WrongHighPriestName","ACPP01",2)~THEN REPLY @3746 DO ~SetGlobal("WrongHighPriestName","ACPP01",3)~ EXTERN AC#PPMAN seek_highpriest_wrong_name_3
  IF~Global("WrongHighPriestName","ACPP01",3)~THEN REPLY @3747 DO ~SetGlobal("WrongHighPriestName","ACPP01",4)~ EXTERN AC#PPMAN seek_highpriest_wrong_name_4
  IF~Global("WrongHighPriestName","ACPP01",4)~THEN REPLY @3748 DO ~SetGlobal("WrongHighPriestName","ACPP01",5)~ EXTERN AC#PPMAN seek_highpriest_wrong_name_5
  IF~Global("AC#PPSpellCheckPoison","GLOBAL",0)~THEN REPLY @3749 EXTERN AC#PPMAN looking_for_highpriest
  IF ~Global("AC#PPWormQuest","GLOBAL",1) Global("AC##PPWormQuestOrc","GLOBAL",0)~THEN REPLY @3750 EXTERN AC#PPMAN seek_worm
  IF ~~ THEN REPLY @3751 GOTO bye
END

IF ~Global("WrongHighPriestName","ACPP01",10)
Global("HighPriestDirection","ACPP01",0)
!Global("AC#PPFairyTwinsKidnapQuest","GLOBAL",2)~ THEN BEGIN hello__10
  SAY @3752
  IF ~~ THEN REPLY @3753 DO ~SetGlobal("HighPriestDirection","ACPP01",1)~ GOTO chain_place
  IF ~~ THEN REPLY @3742 DO ~SetGlobal("HighPriestDirection","ACPP01",1)~ GOTO chain_church
  IF ~Global("AC#PPWormQuest","GLOBAL",1) Global("AC##PPWormQuestOrc","GLOBAL",0)~THEN REPLY @3750 DO ~SetGlobal("HighPriestDirection","ACPP01",1)~ EXTERN AC#PPMAN seek_worm
  IF ~GlobalGT("AC#PPFairyTwinsKidnapQuest","GLOBAL",3)
  GlobalLT("AC#PPFairyTwinsKidnapQuest","GLOBAL",10)~ THEN REPLY @3754 DO ~SetGlobal("HighPriestDirection","ACPP01",1)~ GOTO chain_about_dell_light_twins_kidnapped
  IF ~~ THEN REPLY @3751 DO ~SetGlobal("HighPriestDirection","ACPP01",1)~ GOTO bye
END

IF ~True()
!Global("AC#PPFairyTwinsKidnapQuest","GLOBAL",2)~ THEN BEGIN hello_1
  SAY @3755
  IF ~~ THEN REPLY @3753 GOTO chain_place
  IF ~~ THEN REPLY @3742 GOTO chain_church
  IF ~Global("AC#PPSpellCheckPoison","GLOBAL",0)~ THEN REPLY @3743 GOTO looking_for_highpriest
  IF~Global("WrongHighPriestName","ACPP01",0)~THEN REPLY @3744 DO ~SetGlobal("WrongHighPriestName","ACPP01",1) SetGlobal("AC#PPWrongPriestName","GLOBAL",1)~ EXTERN AC#PPMAN seek_highpriest_wrong_name
  IF~Global("WrongHighPriestName","ACPP01",1)~THEN REPLY @3745 DO ~SetGlobal("WrongHighPriestName","ACPP01",2)~ EXTERN AC#PPMAN seek_highpriest_wrong_name_2
  IF~Global("WrongHighPriestName","ACPP01",2)~THEN REPLY @3746 DO ~SetGlobal("WrongHighPriestName","ACPP01",3)~ EXTERN AC#PPMAN seek_highpriest_wrong_name_3
  IF~Global("WrongHighPriestName","ACPP01",3)~THEN REPLY @3747 DO ~SetGlobal("WrongHighPriestName","ACPP01",4)~ EXTERN AC#PPMAN seek_highpriest_wrong_name_4
  IF~Global("WrongHighPriestName","ACPP01",4)~THEN REPLY @3748 DO ~SetGlobal("WrongHighPriestName","ACPP01",5)~ EXTERN AC#PPMAN seek_highpriest_wrong_name_5
  IF~Global("AC#PPSpellCheckPoison","GLOBAL",0)~THEN REPLY @3749 EXTERN AC#PPMAN looking_for_highpriest
  IF ~Global("AC#PPWormQuest","GLOBAL",1) Global("AC##PPWormQuestOrc","GLOBAL",0)~THEN REPLY @3750 EXTERN AC#PPMAN seek_worm
  IF ~GlobalGT("AC#PPFairyTwinsKidnapQuest","GLOBAL",3)
  GlobalLT("AC#PPFairyTwinsKidnapQuest","GLOBAL",10)~ THEN REPLY @3754 GOTO chain_about_dell_light_twins_kidnapped

  IF ~~ THEN REPLY @3751 GOTO bye
END

IF ~~ THEN BEGIN bye
  SAY @3756
  IF ~~ THEN EXIT
END

// Brother Edrim – reports the missing faeries two days later
CHAIN IF ~Global("AC#PPFairyTwinsKidnapQuest","GLOBAL",2)~ THEN AC#PPMAN hello_twins_kidnapped
@3757
END
IF ~~ THEN REPLY @3758 EXTERN AC#PPMAN twins_kidnapped_01
IF ~~ THEN REPLY @3759 EXTERN AC#PPMAN twins_kidnapped_01
IF ~~ THEN REPLY @3760 EXTERN AC#PPMAN twins_kidnapped_01
IF ~~ THEN REPLY @3761 EXTERN AC#PPMAN twins_kidnapped_01

	CHAIN IF ~~ THEN AC#PPMAN twins_kidnapped_01
	@3762
	END
	IF ~~ THEN DO ~SetGlobal("AC#PPFairyTwinsKidnapQuest","GLOBAL",3)~ EXTERN AC#PPMAN twins_kidnapped_02

	CHAIN IF ~~ THEN AC#PPMAN twins_kidnapped_02
	@3763
	END
	IF ~~ THEN REPLY @3764 EXTERN AC#PPMAN twins_kidnapped_03
	IF ~~ THEN REPLY @3765 EXTERN AC#PPMAN twins_kidnapped_decline_bye

	CHAIN IF ~~ THEN AC#PPMAN twins_kidnapped_03
	@3766
	=	
	@3767
	=
	@3768
	END
	IF ~~ THEN REPLY @3769 EXTERN AC#PPMAN twins_kidnapped_turned_invisible
	IF ~~ THEN REPLY @3770 EXTERN AC#PPMAN twins_kidnapped_turned_invisible
	IF ~~ THEN REPLY @3771 EXTERN AC#PPMAN twins_kidnapped_04
	IF ~~ THEN REPLY @3772 EXTERN AC#PPMAN twins_kidnapped_decline_bye

		CHAIN IF ~~ THEN AC#PPMAN twins_kidnapped_turned_invisible
		@3773
		END
		IF ~~ THEN REPLY @3771 EXTERN AC#PPMAN twins_kidnapped_04
		IF ~~ THEN REPLY @3774 EXTERN AC#PPMAN twins_kidnapped_decline_bye


	CHAIN IF ~~ THEN AC#PPMAN twins_kidnapped_04
	@3775
	END
	IF ~~ THEN REPLY @3776 EXTERN AC#PPMAN twins_kidnapped_any_clue
	IF ~~ THEN REPLY @3777 EXTERN AC#PPMAN twins_kidnapped_any_clue
	IF ~~ THEN REPLY @3774 EXTERN AC#PPMAN twins_kidnapped_decline_bye


	CHAIN IF ~~ THEN AC#PPMAN twins_kidnapped_any_clue
	@3778
	END
	IF ~~ THEN REPLY @3779 EXTERN AC#PPMAN twins_kidnapped_05
	IF ~~ THEN REPLY @3774 EXTERN AC#PPMAN twins_kidnapped_decline_bye


	CHAIN IF ~~ THEN AC#PPMAN twins_kidnapped_05
	@3780
	END
	IF ~~ THEN DO ~SetGlobal("AC#PPFairyTwinsKidnapQuest","GLOBAL",4)
	AddJournalEntry(@13000,QUEST)~ EXIT


	CHAIN IF ~~ THEN AC#PPMAN twins_kidnapped_decline_bye
	@3781
	EXIT


CHAIN IF ~~ THEN AC#PPMAN looking_for_highpriest
@3782
END
  IF ~~ THEN REPLY @3783 GOTO looking_for_highpriest_bye
  IF ~~ THEN REPLY @3784 GOTO looking_for_highpriest_bye
  IF ~~ THEN REPLY @3785 GOTO questions

CHAIN IF ~~ THEN AC#PPMAN seek_highpriest_wrong_name
@3786
==MinscJ IF ~InParty("minsc") !StateCheck("minsc",CD_STATE_NOTVALID)~ THEN  @3787
END
  IF ~~ THEN REPLY @3788 GOTO looking_for_highpriest_bye
  IF ~~ THEN REPLY @3789 GOTO looking_for_highpriest_bye
  IF ~~ THEN REPLY @3785 GOTO questions
  
CHAIN IF ~~ THEN AC#PPMAN seek_highpriest_wrong_name_2
@3790
==MinscJ IF ~InParty("minsc") !StateCheck("minsc",CD_STATE_NOTVALID)~ THEN  @3791
==JaheiraJ IF ~InParty("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN @3792
==ViconiJ IF ~InParty("viconia") !StateCheck("viconia",CD_STATE_NOTVALID)~ THEN @3793
END
  IF ~~ THEN REPLY @3794 GOTO looking_for_highpriest_bye
  IF ~~ THEN REPLY @3795 GOTO looking_for_highpriest_bye
  IF ~~ THEN REPLY @3785 GOTO questions
  
  CHAIN IF ~~ THEN AC#PPMAN seek_highpriest_wrong_name_3
	@3796 
	==HAERDAJ IF ~InParty("haerdalis") !StateCheck("haerdalis",CD_STATE_NOTVALID)~ THEN @3797
	== KeldorJ IF ~InParty("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ THEN @3798
	== DornJ  IF ~InParty("Dorn") !StateCheck("Dorn",CD_STATE_NOTVALID)~ THEN @3799
	==ViconiJ IF ~InParty("viconia") !StateCheck("viconia",CD_STATE_NOTVALID)~ THEN @3800
	==KorganJ IF ~InParty("korgan") !StateCheck("korgan",CD_STATE_NOTVALID)~ THEN @3801
	END
  IF ~~ THEN REPLY @3802 GOTO looking_for_highpriest_bye
  IF ~~ THEN REPLY @3785 GOTO questions
  
   CHAIN IF ~~ THEN AC#PPMAN seek_highpriest_wrong_name_4
	@3803
	== JANJ IF ~InParty("Jan") !StateCheck("Jan",CD_STATE_NOTVALID)~ THEN @3804
	== BEDWIN IF ~InParty("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN @3805
	END
  IF ~~ THEN REPLY @3806 GOTO looking_for_highpriest_bye
  IF ~~ THEN REPLY @3784 GOTO looking_for_highpriest_bye
  IF ~~ THEN REPLY @3785 GOTO questions

   CHAIN IF ~~ THEN AC#PPMAN seek_highpriest_wrong_name_5
	@3807
	DO ~SetGlobal("WrongHighPriestName","ACPP01",10) ReputationInc(-1) ReallyForceSpellRES("AC#PPSC",LastTalkedToBy())~ EXIT
	
	CHAIN IF ~~ THEN AC#PPMAN looking_for_highpriest_bye
	@3808
	EXIT

// Player returns to speak about the missing faeries
CHAIN IF ~~ THEN AC#PPMAN chain_about_dell_light_twins_kidnapped
@3809
END
  IF ~PartyHasItem("AC#PPFYG")~ THEN REPLY @3810 GOTO twins_jar
  IF ~~ THEN REPLY @3811 GOTO twins_search_bye

CHAIN IF ~~ THEN AC#PPMAN twins_jar
@3812
END
  IF ~~ THEN DO ~TakePartyItem("AC#PPFYG") DestroyItem("AC#PPFYG")~ GOTO twins_jar_02

CHAIN IF ~~ THEN AC#PPMAN twins_jar_02
@3813
END
  IF ~~ THEN REPLY @3814 GOTO twins_jar_03
  IF ~~ THEN REPLY @3815 GOTO twins_jar_03
  IF ~~ THEN REPLY @3816 GOTO twins_jar_03
  IF ~~ THEN REPLY @3817 GOTO twins_jar_03


	CHAIN IF ~~ THEN AC#PPMAN twins_jar_03
	@3818
	END
	 IF ~~ THEN DO ~SetGlobal("AC#PPFairyTwinsKidnapQuest","GLOBAL",8)
	CreateCreature("AC#PPFAE",[-1.-1],S)~ EXIT

	CHAIN IF ~~ THEN AC#PPMAN twins_search_bye 
	@3819
	EXIT

  
CHAIN IF ~~ THEN AC#PPMAN seek_worm
@3820
END
  IF ~~ THEN REPLY @3785 GOTO questions
  IF ~~ THEN REPLY @3821 GOTO bye

CHAIN IF ~~ THEN AC#PPMAN questions
@3822
END
IF ~~ THEN REPLY @3753 GOTO chain_place
IF ~~ THEN REPLY @3742 GOTO chain_church
IF ~Global("AC#PPSpellCheckPoison","GLOBAL",0)~ THEN REPLY @3743 GOTO looking_for_highpriest
IF~Global("WrongHighPriestName","ACPP01",0)~THEN REPLY @3744 DO ~SetGlobal("WrongHighPriestName","ACPP01",1)~ EXTERN AC#PPMAN seek_highpriest_wrong_name
IF~Global("WrongHighPriestName","ACPP01",1)~THEN REPLY @3745 DO ~SetGlobal("WrongHighPriestName","ACPP01",2)~ EXTERN AC#PPMAN seek_highpriest_wrong_name_2
IF~Global("WrongHighPriestName","ACPP01",2)~THEN REPLY @3746 DO ~SetGlobal("WrongHighPriestName","ACPP01",3)~ EXTERN AC#PPMAN seek_highpriest_wrong_name_3
IF~Global("WrongHighPriestName","ACPP01",3)~THEN REPLY @3747 DO ~SetGlobal("WrongHighPriestName","ACPP01",4)~ EXTERN AC#PPMAN seek_highpriest_wrong_name_4
IF~Global("WrongHighPriestName","ACPP01",4)~THEN REPLY @3748 DO ~SetGlobal("WrongHighPriestName","ACPP01",5)~ EXTERN AC#PPMAN seek_highpriest_wrong_name_5
IF ~Global("AC#PPWormQuest","GLOBAL",1) Global("AC##PPWormQuestOrc","GLOBAL",0)~THEN REPLY @3750 EXTERN AC#PPMAN seek_worm
IF ~~ THEN REPLY @3823 GOTO bye


CHAIN IF ~~ THEN AC#PPMAN chain_church
@3824
==AC#PPMAN @3825
END
  IF ~~ THEN REPLY @3785 GOTO questions
  IF ~~ THEN REPLY @3826 GOTO bye

CHAIN IF ~~ THEN AC#PPMAN chain_place
@3827
END
  IF ~~ THEN REPLY @3828 GOTO chain_place_more
  IF ~~ THEN REPLY @3829 GOTO bye

CHAIN IF ~~ THEN AC#PPMAN chain_place_more 
@3830
==AC#PPMAN @3831
==AC#PPMAN @3832
END
  IF ~GlobalGT("PeaceNPCReaction_MAN","ACPP01",0)~ THEN REPLY @3833 GOTO chain_place_more_02
  IF ~Global("PeaceNPCReaction_MAN","ACPP01",0)~ THEN REPLY @3833 DO ~SetGlobal("PeaceNPCReaction_MAN","ACPP01",1)~ GOTO chain_place_more_02_NPC
  IF ~~ THEN REPLY @3834 GOTO bye

CHAIN IF ~~ THEN AC#PPMAN chain_place_more_02_NPC
@3835
== AnomenJ IF ~InParty("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN @3836
== CERNDJ IF ~InParty("Cernd") !StateCheck("Cernd",CD_STATE_NOTVALID)~ THEN @3837
== MinscJ IF ~InParty("minsc") !StateCheck("minsc",CD_STATE_NOTVALID)~ THEN @3838
== JaheiraJ IF ~InParty("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN @3839
== BEDWIN IF ~InParty("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN @3840
== HEXXATJ IF ~InParty("hexxat") !StateCheck("hexxat",CD_STATE_NOTVALID)~ THEN @3841
== RASAADJ IF ~InParty("RASAAD") !StateCheck("RASAAD",CD_STATE_NOTVALID)~ THEN @3842
== IMOEN2J IF ~InParty("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN @3843
== ValygarJ IF ~InParty("valygar") !StateCheck("valygar",CD_STATE_NOTVALID)~ THEN @3844
== YoshJ IF ~InParty("yoshimo") !StateCheck("yoshimo",CD_STATE_NOTVALID)~ THEN @3845
== MazzyJ IF ~InParty("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN @3846
END  
  IF ~~ THEN REPLY @3847 EXTERN AC#PPMAN peace_dicussion_bye
  IF ~~ THEN REPLY @3848 EXTERN AC#PPMAN peace_dicussion_bye
  IF ~~ THEN REPLY @3849 EXTERN AC#PPMAN bye
  IF ~~ THEN REPLY @3850 EXTERN AC#PPMAN bye
  
CHAIN IF ~~ THEN AC#PPMAN chain_place_more_02
@3835
END  
  IF ~~ THEN REPLY @3847 EXTERN AC#PPMAN peace_dicussion_bye
  IF ~~ THEN REPLY @3848 EXTERN AC#PPMAN peace_dicussion_bye
  IF ~~ THEN REPLY @3849 EXTERN AC#PPMAN bye
  IF ~~ THEN REPLY @3850 EXTERN AC#PPMAN bye  
 
CHAIN IF ~~ THEN AC#PPMAN peace_dicussion_bye 
  @3851
EXIT


// Two Eldathyn priests debating

BEGIN AC#PPST1 
BEGIN AC#PPST2

// Dialog between two Eldathyn (AC#PPST1, AC#PPST2) and Korgan (KORGANJ) Priest #1
CHAIN IF ~InParty("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)
Global("DebatingKorgan","ACPP01",0)~ THEN AC#PPST1 hello_korgan
@3852
==AC#PPST2 @3853
==KORGANJ @3854
==AC#PPST1 @3855
==KORGANJ @3856
==AC#PPST2 @3857
==KORGANJ @3858
==AC#PPST1 @3859
==KORGANJ @3860
==AC#PPST2 @3861
==KORGANJ @3862
//==AC#PPST2 @3865
//==KORGANJ @3866
==AC#PPST1 @3863
==KORGANJ @3864
END
IF ~~ THEN DO ~SetGlobal("DebatingKorgan","ACPP01",1)~ EXIT

// Dialog between two Eldathyn (AC#PPST1, AC#PPST2) and Korgan (KORGANJ) Priest #2
CHAIN IF ~InParty("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)
Global("DebatingKorgan","ACPP01",0)~ THEN AC#PPST2 hello_korgan
@3852
==AC#PPST1 @3853
==KORGANJ @3854
==AC#PPST1 @3855
==KORGANJ @3856
==AC#PPST2 @3857
==KORGANJ @3858
==AC#PPST1 @3859
==KORGANJ @3860
==AC#PPST2 @3861
==KORGANJ @3862
==AC#PPST2 @3865
==KORGANJ @3866
==AC#PPST1 @3867
==KORGANJ @3864
END
IF ~~ THEN DO ~SetGlobal("DebatingKorgan","ACPP01",1)~ EXIT

// Jan und Eldathyns
CHAIN IF ~InParty("Jan") !StateCheck("Jan",CD_STATE_NOTVALID) Global("DebatingJan","ACPP01",0)~ 
THEN AC#PPST1 hello_jan
@3868
==JANJ @3869
==JANJ @3870
==AC#PPST2 @3871
DO ~SetGlobal("DebatingJan","ACPP01",1)~
EXIT

// Jan und Eldathyns
CHAIN IF ~InParty("Jan") !StateCheck("Jan",CD_STATE_NOTVALID) Global("DebatingJan","ACPP01",0)~ 
THEN AC#PPST2 hello_jan
@3868
==JANJ @3869
==JANJ @3870
==AC#PPST1 @3871
DO ~SetGlobal("DebatingJan","ACPP01",1)~
EXIT

// Neera and the Eldathyn
CHAIN IF ~InParty("Neera") !StateCheck("Neera",CD_STATE_NOTVALID) Global("DebatingNeera","ACPP01",0)~
THEN AC#PPST1 hello_neera
@3872
==NEERAJ @3873
==AC#PPST1 @3874
==NEERAJ @3875
==AC#PPST2 @3876
==NEERAJ @3877
DO ~SetGlobal("DebatingNeera","ACPP01",1)~
EXIT

// Neera and the Eldathyn
CHAIN IF ~InParty("Neera") !StateCheck("Neera",CD_STATE_NOTVALID) Global("DebatingNeera","ACPP01",0)~
THEN AC#PPST2 hello_neera
@3872
==NEERAJ @3873
==AC#PPST2 @3874
==NEERAJ @3875
==AC#PPST1 @3876
==NEERAJ @3877
DO ~SetGlobal("DebatingNeera","ACPP01",1)~
EXIT

// Eldathyn and Viconia – the fading enthusiasm of faith
CHAIN IF ~InParty("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID) Global("DebatingViconia","ACPP01",0)~
THEN AC#PPST1 hello_viconia
@3878
==VICONIJ @3879
==AC#PPST2 @3880
==VICONIJ @3881
==AC#PPST1 @3882
==VICONIJ @3883
==AC#PPST2 @3884
==VICONIJ @3885
==AC#PPST1 @3886
DO ~SetGlobal("DebatingViconia","ACPP01",1)~ EXIT


// Eldathyn and Viconia – the fading enthusiasm of faith
CHAIN IF ~InParty("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID) Global("DebatingViconia","ACPP01",0)~
THEN AC#PPST2 hello_viconia
@3878
==VICONIJ @3879
==AC#PPST1 @3880
==VICONIJ @3881
==AC#PPST2 @3882
==VICONIJ @3883
==AC#PPST1 @3884
==VICONIJ @3885
==AC#PPST2 @3886
DO ~SetGlobal("DebatingViconia","ACPP01",1)~ EXIT

// Eldathyn and Minsc
CHAIN IF ~InParty("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID) Global("EldMinsc1","ACPP01",0)~
THEN AC#PPST1 EldMinsc_surrender1
@3887
==MINSCJ @3888
==AC#PPST2 @3889
==MINSCJ @3890
DO ~SetGlobal("EldMinsc1","ACPP01",1)~ EXIT


// Eldathyn and Minsc
CHAIN IF ~InParty("Minsc") !StateCheck("minsc",CD_STATE_NOTVALID) Global("EldMinsc1","ACPP01",0)~
THEN AC#PPST2 EldMinsc_surrender1
@3887
==MINSCJ @3888
==AC#PPST1 @3889
==MINSCJ @3890
DO ~SetGlobal("EldMinsc1","ACPP01",1)~ EXIT


// Eldathyn #1
CHAIN IF ~RandomNum(3,1)~ THEN AC#PPST1 hello_1
@3891
END
IF~RandomNum(3,1)~THEN EXTERN AC#PPST1 stillness
IF~RandomNum(3,2)~THEN EXTERN AC#PPST1 war
IF~RandomNum(3,3)~THEN EXTERN AC#PPST1 water

CHAIN IF ~RandomNum(3,2)~ THEN AC#PPST1 hello_2
@3892
END
IF~RandomNum(3,1)~THEN EXTERN AC#PPST1 stillness
IF~RandomNum(3,2)~THEN EXTERN AC#PPST1 war
IF~RandomNum(3,3)~THEN EXTERN AC#PPST1 water

CHAIN IF ~RandomNum(3,3)~ THEN AC#PPST1 hello_3
@3893
END
IF~RandomNum(3,1)~THEN EXTERN AC#PPST1 stillness
IF~RandomNum(3,2)~THEN EXTERN AC#PPST1 war
IF~RandomNum(3,3)~THEN EXTERN AC#PPST1 water

// Eldathyn #2 
CHAIN IF ~RandomNum(3,1)~ THEN AC#PPST2 hello_1
@3894
END
IF~RandomNum(3,1)~THEN EXTERN AC#PPST1 stillness
IF~RandomNum(3,2)~THEN EXTERN AC#PPST1 war
IF~RandomNum(3,3)~THEN EXTERN AC#PPST1 water

CHAIN IF ~RandomNum(3,2)~ THEN AC#PPST2 hello_2
@3891
END
IF~RandomNum(3,1)~THEN EXTERN AC#PPST1 stillness
IF~RandomNum(3,2)~THEN EXTERN AC#PPST1 war
IF~RandomNum(3,3)~THEN EXTERN AC#PPST1 water

CHAIN IF ~RandomNum(3,3)~ THEN AC#PPST2 hello_3
@3895
END
IF~RandomNum(3,1)~THEN EXTERN AC#PPST1 stillness
IF~RandomNum(3,2)~THEN EXTERN AC#PPST1 war
IF~RandomNum(3,3)~THEN EXTERN AC#PPST1 water


// Dialog between two Eldathyn (AC#PPST1, AC#PPST2) and Korgan (KORGANJ)

CHAIN IF ~~ THEN AC#PPST1 hello_korgan
@3852
==AC#PPST2 @3853
==AC#PPST1 @3896
==KORGANJ @3854
==AC#PPST1 @3855
==KORGANJ @3856
==AC#PPST2 @3857
==KORGANJ @3858
==AC#PPST1 @3859
==KORGANJ @3860
==AC#PPST2 @3861
==KORGANJ @3862
==AC#PPST2 @3867
==KORGANJ @3864
EXIT


CHAIN IF ~~ THEN AC#PPST1 stillness
@3897
==AC#PPST2 @3898
==AC#PPST1 @3899
END 
IF ~~ THEN REPLY @3900 EXTERN AC#PPST2 stillness_02
IF ~~ THEN REPLY @3901 EXTERN AC#PPST2 stillness_02

CHAIN IF ~~ THEN AC#PPST2 stillness_02
@3902
==AC#PPST1 @3903
==AC#PPST2 @3904
END 
IF ~~ THEN REPLY @3905 EXTERN AC#PPST1 stillness_03

CHAIN IF ~~ THEN AC#PPST1 stillness_03
@3906
EXIT

CHAIN IF ~~ THEN AC#PPST1 war
@3907
==AC#PPST2 @3908
==AC#PPST1 @3909
END 
IF ~~ THEN REPLY @3910 EXTERN AC#PPST2 war_02
 
CHAIN IF ~~ THEN AC#PPST2 war_02
@3911
==AC#PPST1 @3912
END 
IF ~~ THEN REPLY @3913 EXTERN AC#PPST2 war_03 

CHAIN IF ~~ THEN AC#PPST2 war_03
@3914
==AC#PPST1 @3915
==AC#PPST2 @3916
EXIT

CHAIN IF ~~ THEN AC#PPST1 water
@3917
==AC#PPST2 @3918
END 
IF ~~ THEN REPLY @3919  EXTERN AC#PPST1 water_02

CHAIN IF ~~ THEN AC#PPST1 water_02
@3920
==AC#PPST2 @3921
==AC#PPST1 @3922
EXIT

// honey making Eldathyn in area ACPP01:

BEGIN ~AC#PPELH~

CHAIN IF ~RandomNum(4,1)~ THEN AC#PPELH hello_01
@3923
EXIT

CHAIN IF ~RandomNum(4,2)~ THEN AC#PPELH hello_02
@3924
EXIT

CHAIN IF ~RandomNum(4,3)~ THEN AC#PPELH hello_03
@3925
EXIT

CHAIN IF ~RandomNum(4,4)~ THEN AC#PPELH hello_04
@3926
EXIT

// walking Eldathyn priest
BEGIN ~AC#PPELR~

CHAIN IF ~RandomNum(8,1)~ THEN AC#PPELR hello_01
@3927
EXIT

CHAIN IF ~RandomNum(8,2)~ THEN AC#PPELR hello_02
@3928
EXIT

CHAIN IF ~RandomNum(8,3)~ THEN AC#PPELR hello_03
@3929
EXIT

CHAIN IF ~RandomNum(8,4)~ THEN AC#PPELR hello_04
@3930
EXIT

CHAIN IF ~RandomNum(8,5)~ THEN AC#PPELR hello_05
@3931
EXIT

CHAIN IF ~RandomNum(8,6)~ THEN AC#PPELR hello_06
@3932
EXIT

CHAIN IF ~RandomNum(8,7)~ THEN AC#PPELR hello_07
@3933
EXIT

CHAIN IF ~RandomNum(8,8)~ THEN AC#PPELR hello_08
@3934
EXIT
/************************************************
// Mannatarv, the dying man
*******************************************************************/

BEGIN AC#PPILL

	CHAIN IF ~Global("AC#PP_DyingMan","GLOBAL",20)~ THEN AC#PPILL hello_quest_failed
	@3965  
	EXIT

//3rd encounter: Mannatarv's request after Alatoasz' quest has started
	CHAIN IF ~Global("AC#PP_DyingMan","GLOBAL",3)~ THEN AC#PPILL hello_waiting_poison
	@3935 
	END
	IF ~~ THEN REPLY @3936 EXTERN AC#PPILL farewell
	IF ~PartyHasItem("AC#PPPUB")~ THEN REPLY @3937 EXTERN AC#PPILL yes_have_plant
	IF ~~ THEN REPLY @3938 DO ~SetGlobal("AC#PP_DyingMan","GLOBAL",20)    AddJournalEntry(@13083,QUEST_DONE)~ EXTERN AC#PPILL not_help_02

CHAIN IF ~Global("AC#PP_DyingMan","GLOBAL",1)~ THEN AC#PPILL request
@3939
== AC#PPILL IF ~Global("MetMannatarv","ACPP01",0)~ THEN @3940 
== AC#PPILL IF ~GlobalGT("MetMannatarv","ACPP01",0)~ THEN @3941 
== AC#PPILL @3942
DO ~SetGlobal("AC#PP_DyingMan","GLOBAL",2)
AddJournalEntry(@13080,QUEST)~ EXTERN AC#PPILL request_02

CHAIN AC#PPILL request_02
@3943
==ViconiJ IF ~InParty("viconia") !StateCheck("viconia",CD_STATE_NOTVALID)~ THEN @3944
==JaheiraJ IF ~InParty("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN @3945
==HEXXATJ IF ~InParty("hexxat") !StateCheck("hexxat",CD_STATE_NOTVALID)~ THEN @3946
==ValygarJ IF ~InParty("valygar") !StateCheck("valygar",CD_STATE_NOTVALID)~ THEN @3947
==CerndJ IF ~InParty("cernd") !StateCheck("cernd",CD_STATE_NOTVALID)~ THEN @3948
== KeldorJ IF ~InParty("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ THEN @3949
== AnomenJ  IF ~InParty("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN @3950
== DornJ  IF ~InParty("Dorn") !StateCheck("Dorn",CD_STATE_NOTVALID)~ THEN @3951
== BEDWIN IF ~InParty("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN @3952 
==KorganJ IF ~InParty("korgan") !StateCheck("korgan",CD_STATE_NOTVALID)~ THEN @3953   
END
IF ~~ THEN REPLY @3954 EXTERN AC#PPILL kill_plant
IF ~~ THEN REPLY @3955 EXTERN AC#PPILL refuse
IF ~~ THEN REPLY @3956 EXTERN AC#PPILL accept
IF ~~ THEN REPLY @3957 EXTERN AC#PPILL alternative
IF ~~ THEN REPLY @3958 EXTERN AC#PPILL kill_instantly
	
// 1st encounter
CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#PPILL hello
@3959 
DO ~SetGlobal("MetMannatarv","ACPP01",1)~ EXTERN AC#PPILL priests_fuss

  
	CHAIN AC#PPILL priests_fuss
	@3960  
	END
	IF ~~ THEN REPLY @3961 EXTERN AC#PPILL farewell
	IF ~~ THEN REPLY @3962 EXTERN AC#PPILL brush_off

	CHAIN AC#PPILL brush_off
	@3963  
	END
	IF ~~ THEN REPLY @3964 EXTERN AC#PPILL farewell

	CHAIN AC#PPILL farewell
	@3965  
	EXIT
	
	CHAIN IF ~NumTimesTalkedToGT(0)~ THEN AC#PPILL again
	@3966  
	END
	IF ~~ THEN REPLY @3967 EXTERN AC#PPILL farewell

	CHAIN AC#PPILL yes_have_plant
	@3968
	== AC#PPILL @3969
	== AC#PPILL @3970
	DO ~SetGlobal("AC#PP_DyingMan","GLOBAL",10)
	AddexperienceParty(300)
	AddJournalEntry(@13082,QUEST_DONE)
	Kill(Myself)~
	EXIT
	
	CHAIN AC#PPILL not_help_02
	@3971
	EXIT

	// Mannatarv lehnt entschieden ab
	CHAIN AC#PPILL kill_instantly
	@3972  
	END
	IF ~~ THEN REPLY @3954 EXTERN AC#PPILL kill_plant
	IF ~~ THEN REPLY @3955 EXTERN AC#PPILL refuse
	IF ~~ THEN REPLY @3956 EXTERN AC#PPILL accept
	IF ~~ THEN REPLY @3957 EXTERN AC#PPILL alternative


CHAIN AC#PPILL kill_plant
@3973 
END
IF ~~ THEN REPLY @3955 EXTERN AC#PPILL refuse
IF ~~ THEN REPLY @3956 EXTERN AC#PPILL accept
IF ~~ THEN REPLY @3957 EXTERN AC#PPILL alternative

CHAIN AC#PPILL refuse
@3971
DO ~AddJournalEntry(@13083,QUEST_DONE)
SetGlobal("AC#PP_DyingMan","GLOBAL",20)
EscapeArea()~ EXIT

CHAIN AC#PPILL accept
@3974 
== AC#PPILL @3975   
DO ~SetGlobal("AC#PP_DyingMan","GLOBAL",3)
AddJournalEntry(@13081,QUEST)
EscapeArea()~ EXIT

CHAIN AC#PPILL alternative
@3976  
END
IF ~~ THEN REPLY @3955 EXTERN AC#PPILL refuse
IF ~~ THEN REPLY @3956 EXTERN AC#PPILL accept



// "Treetop Tavern", tavern in area ACPP11 
BEGIN ~AC#PPELS~

IF ~True()~ THEN BEGIN 0
  SAY @3977 
  IF ~~ THEN REPLY @3978 GOTO chain_about_shop
  IF ~~ THEN REPLY @3979 GOTO 1
  IF ~~ THEN REPLY @3980 DO ~StartStore("AC#PPELS",LastTalkedToBy())~ EXIT
END

IF ~~ THEN BEGIN 1
  SAY @3981
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 2
  SAY @3982
  IF ~~ THEN REPLY @3983 GOTO shop
  IF ~~ THEN REPLY @3984 GOTO 1
END

IF ~~ THEN BEGIN shop
  SAY @3985 
  IF ~~ THEN DO ~StartStore("AC#PPELS",LastTalkedToBy())~ EXIT
END

CHAIN IF ~~ THEN AC#PPELS chain_about_shop
@3986
==AC#PPELS @3987
==AC#PPELS @3988
END  
  IF ~~ THEN REPLY @3989 EXTERN AC#PPELS shop
  IF ~~ THEN REPLY @3990 EXTERN AC#PPELS 1


// mystic, store in area ACPP13
BEGIN ~AC#PPMYS~

IF ~True()~ THEN BEGIN 0
  SAY @3991 
  IF ~~ THEN REPLY @3992 GOTO chain_about_shop
  IF ~~ THEN REPLY @3979 GOTO 1
  IF ~~ THEN REPLY @3993 DO ~StartStore("AC#PPMYS",LastTalkedToBy())~ EXIT
  IF ~~ THEN REPLY @3994 GOTO fire_question
END

IF ~~ THEN BEGIN fire_question
  SAY @3995
  IF ~~ THEN REPLY @3992 GOTO chain_about_shop
  IF ~~ THEN REPLY @3996 GOTO 1
  IF ~~ THEN REPLY @3993 DO ~StartStore("AC#PPMYS",LastTalkedToBy())~ EXIT
END


IF ~~ THEN BEGIN 1
  SAY @3997 
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN shop
  SAY @3998
  IF ~~ THEN DO ~StartStore("AC#PPMYS",LastTalkedToBy())~ EXIT
END


CHAIN IF ~~ THEN AC#PPMYS chain_about_shop
@3999 
END  
  IF ~~ THEN REPLY @4000 EXTERN AC#PPMYS shop
  IF ~~ THEN REPLY @3984 EXTERN AC#PPMYS 1

// priest of Eldath, store in area ACPP02
BEGIN ~AC#PPEL8~

IF ~True()~ THEN BEGIN 0
  SAY @4001
  IF ~~ THEN REPLY @4002 GOTO 1
  IF ~Global("MinscViconia_ACPP02","ACPP02",1)~ THEN REPLY @4003 GOTO 2
  IF ~Global("MinscViconia_ACPP02","ACPP02",0)~ THEN REPLY @4003 GOTO eldath_once
  IF ~~ THEN REPLY @4004 GOTO 3
END

IF ~~ THEN BEGIN 1
  SAY @4005
  IF ~~ THEN DO ~StartStore("AC#PPEL8",LastTalkedToBy(Myself))~ EXIT
END

IF ~~ THEN BEGIN 3
  SAY @4006
  IF ~~ THEN EXIT
END

  CHAIN AC#PPEL8 eldath_once
  @4007
  == KORGANJ IF ~InParty("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN @4008
  == MinscJ IF ~InParty("minsc") !StateCheck("minsc",CD_STATE_NOTVALID)~ THEN @4009
  == ViconiJ IF ~InParty("viconia") !StateCheck("viconia",CD_STATE_NOTVALID)~ THEN @4010
  == AC#PPEL8 @4011
  END
  IF ~~ THEN DO ~SetGlobal("MinscViconia_ACPP02","ACPP02",1)~ EXTERN AC#PPEL8 eldath_once_2
  
  CHAIN AC#PPEL8 eldath_once_2
  @4012
  END
  IF ~~ THEN REPLY @4013 EXTERN AC#PPEL8 1
  IF ~~ THEN REPLY @4004 EXTERN AC#PPEL8 3
  
  CHAIN AC#PPEL8 2
  @4007
  END
  IF ~~ THEN REPLY @4013 EXTERN AC#PPEL8 1
  IF ~~ THEN REPLY @4004 EXTERN AC#PPEL8 3

// honey-maker in area acpp07:
BEGIN ~AC#PPON2~

CHAIN IF ~Global("BearChange","ACPP07",1)~ THEN AC#PPON2 hello_sorry
@4014 
END
IF~~THEN DO ~SetGlobal("BearChange","ACPP07",2)~ EXTERN AC#PPON2 human_form

// Rückkehr zum Honigmönch nach dem Verkauf in den Five Flagons
CHAIN IF ~True()~ THEN AC#PPON2 hello_again
@4015 
END
IF~GlobalGT("AC#PP_HoneyQuest","GLOBAL",0)
GlobalLT("AC#PP_HoneyQuest","GLOBAL",10)~THEN REPLY @4016 EXTERN AC#PPON2 about_mead
IF~~THEN REPLY @4017 EXTERN AC#PPON2 what_do_you_do
IF~~THEN REPLY @4018 EXTERN AC#PPON2 bye


CHAIN AC#PPON2 about_mead
@4019 
END
IF~GlobalGT("AC#PP_HoneyQuest","GLOBAL",1)
GlobalLT("AC#PP_HoneyQuest","GLOBAL",10)~THEN REPLY @4020 EXTERN AC#PPON2 about_mead_02
IF~~THEN REPLY @4021 EXTERN AC#PPON2 bye


CHAIN AC#PPON2 about_mead_02
@4022 
END
IF~~THEN REPLY @4023 DO ~TakePartyGold(100)~ EXTERN AC#PPON2 about_mead_100
IF~~THEN REPLY @4024 DO ~TakePartyGold(500)~ EXTERN AC#PPON2 about_mead_500
IF~~THEN REPLY @4025 DO ~TakePartyGold(750)~ EXTERN AC#PPON2 about_mead_750
IF~~THEN REPLY @4026 DO ~TakePartyGold(1000)~ EXTERN AC#PPON2 about_mead_1000
IF~~THEN REPLY @4021 EXTERN AC#PPON2 bye


// Spieler meldet nur 100 Gold
CHAIN AC#PPON2 about_mead_100
@4027 
DO ~SetGlobal("AC#PP_HoneyQuest","GLOBAL",10) AddJournalEntry(@13036,QUEST_DONE)~ 
EXIT


// Spieler meldet 500 Gold
CHAIN AC#PPON2 about_mead_500
@4028 
DO ~GiveGoldForce(100) SetGlobal("AC#PP_HoneyQuest","GLOBAL",10) AddJournalEntry(@13037,QUEST_DONE)~ 
EXIT


// Spieler meldet 750 Gold
CHAIN AC#PPON2 about_mead_750
@4029 
DO ~GiveGoldForce(250) ReputationInc(1) SetGlobal("AC#PP_HoneyQuest","GLOBAL",10) AddJournalEntry(@13038,QUEST_DONE)~ 
EXIT


// Spieler meldet 1000 Gold
CHAIN AC#PPON2 about_mead_1000
@4030 
DO ~GiveGoldForce(500) GiveItemCreate("AC#PPIMK",Player1,1,0,0) ReputationInc(1) SetGlobal("AC#PP_HoneyQuest","GLOBAL",10) AddJournalEntry(@13039,QUEST_DONE)~ 
EXIT


CHAIN AC#PPON2 human_form
@4031
END
IF~~THEN REPLY @4017 EXTERN AC#PPON2 what_do_you_do
IF~GlobalGT("AC#PP_HoneyQuest","GLOBAL",1)~THEN REPLY @4032 EXTERN AC#PPON2 bye
IF~Global("AC#PP_HoneyQuest","GLOBAL",0)~THEN REPLY @4032 EXTERN AC#PPON2 five_flagons_quest_start

	CHAIN AC#PPON2 what_do_you_do
	@4033 
	=
	@4034 
	END
	IF~GlobalGT("AC#PP_HoneyQuest","GLOBAL",0)~THEN REPLY @4032 EXTERN AC#PPON2 bye
	IF~Global("AC#PP_HoneyQuest","GLOBAL",0)~THEN REPLY @4032 EXTERN AC#PPON2 five_flagons_quest_start
	
// Einstieg: erkennt den Spieler
CHAIN AC#PPON2 five_flagons_quest_start
@4035 
END
    IF~~THEN REPLY @4036 EXTERN AC#PPON2 five_flagons_quest
    IF~~THEN REPLY @4037 EXTERN AC#PPON2 five_flagons_quest
    IF~~THEN REPLY @4038 EXTERN AC#PPON2 five_flagons_refuse


// Start: Questangebot
CHAIN AC#PPON2 five_flagons_quest
@4039 
END
  IF~~THEN REPLY @4040 DO ~SetGlobal("AC#PP_HoneyQuest","GLOBAL",1)~ EXTERN AC#PPON2 five_flagons_accept
  IF~~THEN REPLY @4041 EXTERN AC#PPON2 five_flagons_quest_02
  IF~~THEN REPLY @4038 EXTERN AC#PPON2 five_flagons_refuse


// Nachfrage: fairer Preis
CHAIN AC#PPON2 five_flagons_quest_02
@4042 
END
  IF~~THEN REPLY @4040  DO ~SetGlobal("AC#PP_HoneyQuest","GLOBAL",1)~  EXTERN AC#PPON2 five_flagons_accept
  IF~~THEN REPLY @4038 EXTERN AC#PPON2 five_flagons_refuse


// Spieler akzeptiert
CHAIN AC#PPON2 five_flagons_accept
@4043 
DO ~GiveItemCreate("AC#PPHYM",Player1,1,0,0) AddJournalEntry(@13030,QUEST)~ 
EXIT


// Spieler lehnt ab
CHAIN AC#PPON2 five_flagons_refuse
@4044 
EXIT
	
	CHAIN AC#PPON2 bye
	@4045 
	EXIT

CHAIN IF ~RandomNum(4,1)~ THEN AC#PPON2 hello_01
@4046 
EXIT

CHAIN IF ~RandomNum(4,2)~ THEN AC#PPON2 hello_02
@4047 
EXIT

CHAIN IF ~RandomNum(4,3)~ THEN AC#PPON2 hello_03
@4048 
EXIT

CHAIN IF ~RandomNum(4,4)~ THEN AC#PPON2 hello_04
@4049 
EXIT

// Samuel Thunderburp – Erweiterung für den Five Flagons-Dialog
EXTEND_BOTTOM ~FFBART~ 0
IF ~PartyHasItem("AC#PPHYM")~ THEN REPLY @4050 
  EXTERN FFBART samuel_mead_duskwood_dell_01 
END

EXTEND_BOTTOM ~FFBART~ 8
IF ~PartyHasItem("AC#PPHYM")~ THEN REPLY @4050 
  EXTERN FFBART samuel_mead_duskwood_dell_01 
END

// Spieler übergibt den Met
CHAIN FFBART samuel_mead_duskwood_dell_01
@4051 
END
  IF~~THEN REPLY @4052 EXTERN FFBART samuel_mead_duskwood_dell_price
  IF~~THEN REPLY @4053  EXTERN FFBART samuel_mead_duskwood_dell_price


// Price depending on Charisma
CHAIN FFBART samuel_mead_duskwood_dell_price
@4054 
END
  IF ~~ THEN REPLY @4055 EXTERN FFBART samuel_mead_duskwood_dell_pay100
  IF ~CheckStatGT(LastTalkedToBy,10,CHR)
  CheckStatLT(LastTalkedToBy,15,CHR)~ THEN REPLY @4056 EXTERN FFBART samuel_mead_duskwood_dell_pay500
  IF ~CheckStatGT(LastTalkedToBy,14,CHR) CheckStatLT(LastTalkedToBy,18,CHR)~ THEN REPLY @4057 EXTERN FFBART samuel_mead_duskwood_dell_pay750
  IF ~CheckStatGT(LastTalkedToBy,17,CHR)~ THEN REPLY @4058 EXTERN FFBART samuel_mead_duskwood_dell_pay1000


// Purchase
CHAIN FFBART samuel_mead_duskwood_dell_pay100
@4059 
END
IF ~~ THEN DO ~TakePartyItem("AC#PPHYM") GiveGoldForce(100) SetGlobal("AC#PP_HoneyQuest","GLOBAL",2) AddJournalEntry(@13032,QUEST)~ EXTERN FFBART bye_mead

CHAIN FFBART samuel_mead_duskwood_dell_pay500
@4060 
END
IF ~~ THEN DO ~TakePartyItem("AC#PPHYM") GiveGoldForce(500) SetGlobal("AC#PP_HoneyQuest","GLOBAL",2) AddJournalEntry(@13033,QUEST)~ EXTERN FFBART bye_mead

CHAIN FFBART samuel_mead_duskwood_dell_pay750
@4061 
END
IF ~~ THEN DO ~TakePartyItem("AC#PPHYM") GiveGoldForce(750) SetGlobal("AC#PP_HoneyQuest","GLOBAL",3) AddJournalEntry(@13034,QUEST)~ EXTERN FFBART bye_mead

CHAIN FFBART samuel_mead_duskwood_dell_pay1000
@4062 
END
IF ~~ THEN DO ~TakePartyItem("AC#PPHYM") GiveGoldForce(1000) SetGlobal("AC#PP_HoneyQuest","GLOBAL",4) AddJournalEntry(@13035,QUEST)~ EXTERN FFBART bye_mead

// Samuel dismisses the player
CHAIN FFBART bye_mead
@4063 
EXIT

// Woodcarver – in Area ACPP09 
BEGIN ~AC#PPWOC~

// Erstes Treffen
CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#PPWOC FirstMeet
@4064
== AC#PPWOC @4065
END
++ @4066 DO ~StartStore("AC#PPWOC",LastTalkedToBy())~ EXIT
IF ~RandomNum(4,1)~ THEN REPLY @4067 EXTERN AC#PPWOC Farewell_1
IF ~RandomNum(4,2)~ THEN REPLY @4067 EXTERN AC#PPWOC Farewell_2
IF ~RandomNum(4,3)~ THEN REPLY @4067 EXTERN AC#PPWOC Farewell_3
IF ~RandomNum(4,4)~ THEN REPLY @4067 EXTERN AC#PPWOC Farewell_4
++ @4068 EXTERN AC#PPWOC WhyCarve
++ @4069 EXTERN AC#PPWOC Trees
++ @4070 EXTERN AC#PPWOC Value

// Wiederholtes Ansprechen
CHAIN IF ~NumTimesTalkedToGT(0)~ THEN AC#PPWOC Again
@4071
END
++ @4072 DO ~StartStore("AC#PPWOC",LastTalkedToBy())~ EXIT
IF ~RandomNum(4,1)~ THEN REPLY @4073 EXTERN AC#PPWOC Farewell_1
IF ~RandomNum(4,2)~ THEN REPLY @4073 EXTERN AC#PPWOC Farewell_2
IF ~RandomNum(4,3)~ THEN REPLY @4073 EXTERN AC#PPWOC Farewell_3
IF ~RandomNum(4,4)~ THEN REPLY @4073 EXTERN AC#PPWOC Farewell_4
++ @4068 EXTERN AC#PPWOC WhyCarve
++ @4069 EXTERN AC#PPWOC Trees
++ @4070 EXTERN AC#PPWOC Value

// Zusatzfragen -> führen zu Hub
CHAIN AC#PPWOC WhyCarve
@4074
== AC#PPWOC @4075
EXTERN AC#PPWOC Hub

CHAIN AC#PPWOC Trees
@4076
== AC#PPWOC @4077
EXTERN AC#PPWOC Hub

CHAIN AC#PPWOC Value
@4078
== AC#PPWOC @4079
EXTERN AC#PPWOC Hub

// Hub: Store oder Verabschieden
CHAIN AC#PPWOC Hub
@4080
END
++ @4081 DO ~StartStore("AC#PPWOC",LastTalkedToBy())~ EXIT
IF ~RandomNum(4,1)~ THEN REPLY @4082 EXTERN AC#PPWOC Farewell_1
IF ~RandomNum(4,2)~ THEN REPLY @4082 EXTERN AC#PPWOC Farewell_2
IF ~RandomNum(4,3)~ THEN REPLY @4082 EXTERN AC#PPWOC Farewell_3
IF ~RandomNum(4,4)~ THEN REPLY @4082 EXTERN AC#PPWOC Farewell_4

// Verschiedene Abschiede
CHAIN AC#PPWOC Farewell_1
@4083
EXIT

CHAIN AC#PPWOC Farewell_2
@4084
EXIT

CHAIN AC#PPWOC Farewell_3
@4085
EXIT

CHAIN AC#PPWOC Farewell_4
@4086
EXIT


// Ondonti orcs in area ACPP05
BEGIN ~AC#PPON1~
BEGIN ~AC#PPON3~

CHAIN IF ~Global("ThankYou","ACPP05",0)~ THEN AC#PPON3 hello_saved_ON3
@4087
== AC#PPON1 @4088
END
IF~~THEN EXTERN AC#PPON3 orc_thank_you_axe_01

CHAIN AC#PPON3 orc_thank_you_axe_01
@4089
END
IF~~THEN DO ~GiveItemCreate("AX1H02",Player1,1,0,0)
/*GiveItemCreate("AC#PPAX1",Player1,1,0,0) */
SetGlobal("ThankYou","ACPP05",1)~ EXTERN AC#PPON1 orc_thank_you_axe_02

CHAIN IF ~~ THEN AC#PPON1 orc_thank_you_axe_02
@4090
END
    IF~~THEN REPLY @4091 EXTERN AC#PPON3 bye
    IF~~THEN REPLY @4092 EXTERN AC#PPON3 bye
    IF~~THEN REPLY @4093 EXTERN AC#PPON3 bye


CHAIN IF ~True()~ THEN AC#PPON3 hello_again
@4094
END
IF~~THEN REPLY @4095 EXTERN AC#PPON3 orc_friendly
IF~~THEN REPLY @4096 EXTERN AC#PPON3 orc_why_pumpkin
IF~~THEN REPLY @4097 EXTERN AC#PPON3 bye

    CHAIN IF ~~ THEN AC#PPON3 orc_friendly
    @4098
    == AC#PPON3 @4099
    END
	IF~~THEN REPLY @4100 EXTERN AC#PPON3 orc_invite_accept
    IF~~THEN REPLY @4101 EXTERN AC#PPON3 orc_invite_decline
	
        CHAIN IF ~~ THEN AC#PPON3 orc_invite_accept
        @4102
        EXIT
		
        CHAIN IF ~~ THEN AC#PPON3 orc_invite_decline
        @4103
        EXIT

    CHAIN IF ~~ THEN AC#PPON3 orc_why_pumpkin
    @4104
    == AC#PPON1 @4105
    END
	IF~~THEN REPLY @4106 EXTERN AC#PPON3 orc_why_ok
    IF~~THEN REPLY @4107 EXTERN AC#PPON3 orc_why_suspicious
	
        CHAIN IF ~~ THEN AC#PPON3 orc_why_ok
        @4108
        EXIT
		
        CHAIN IF ~~ THEN AC#PPON3 orc_why_suspicious
        @4109
        EXIT

    CHAIN IF ~~ THEN AC#PPON3 bye
    @4110
    EXIT

CHAIN IF ~Global("ThankYou","ACPP05",0)~ THEN AC#PPON1 hello_save_on1
@4111
== AC#PPON3 @4088
END
IF~~THEN EXTERN AC#PPON3 orc_thank_you_axe_01

CHAIN IF ~True()~ THEN AC#PPON1 hello_again
@4088
EXIT

	
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////

BEGIN AC#PPCHA
BEGIN AC#PPCAA

//1st talk

CHAIN IF ~Global("AC#PPFlowerDelivery","GLOBAL",0)~ THEN AC#PPCHA 01.00
@4112
END
IF~~THEN REPLY @4113 EXTERN AC#PPCHA 01.01
IF~~THEN REPLY @4114 EXTERN AC#PPCHA 01.02

CHAIN AC#PPCHA 01.01
@4115
==AC#PPCHA @4116
==AC#PPCHA @4117
==AC#PPCHA @4118
==AC#PPCHA @4119
END
IF~~THEN REPLY @4120 EXTERN AC#PPCHA 01.03
IF~~THEN REPLY @4121 EXTERN AC#PPCHA 01.02

CHAIN AC#PPCHA 01.03
@4122
==AC#PPCHA @4123
DO ~GiveItemCreate("AC#PPFLW",Player1,1,1,0) SetGlobal("AC#PPFlowerDelivery","GLOBAL",1) AddJournalEntry(@13120,QUEST)~ EXIT

CHAIN AC#PPCHA 01.02
@4124
DO ~EscapeArea()~ EXIT

// 2nd talk

CHAIN IF ~OR(3) Global("AC#PPFlowerDelivery","GLOBAL",1) Global("AC#PPFlowerDelivery","GLOBAL",2) Global("AC#PPFlowerDelivery","GLOBAL",3)~ THEN AC#PPCHA 02.00
@4125
END
IF~Global("AC#PPFlowerDelivery","GLOBAL",2)~THEN REPLY @4126 EXTERN AC#PPCHA 02.01
IF~Global("AC#PPFlowerDelivery","GLOBAL",3)~THEN REPLY @4127 EXTERN AC#PPCHA 02.02
IF~~THEN REPLY @4128 EXIT

CHAIN AC#PPCHA 02.01
@4129
EXTERN AC#PPCHA 02.03

CHAIN AC#PPCHA 02.02
@4130 
EXTERN AC#PPCHA 02.03

CHAIN AC#PPCHA 02.03
@4131
==AC#PPCHA @4132
DO ~SetGlobal("AC#PPFlowerDelivery","GLOBAL",4) AddJournalEntry(@13122,QUEST_DONE) AddexperienceParty(500)~ EXIT

// After

CHAIN IF ~Global("AC#PPFlowerDelivery","GLOBAL",4)~ THEN AC#PPCHA 03.00
@4133 
EXIT

////////////////////////////////////////////
CHAIN IF ~Global("AC#PPFlowerDelivery","GLOBAL",1)~ THEN AC#PPCAA 01.00
@4134
END
IF~PartyHasItem("AC#PPFLW")~THEN REPLY @4135 DO ~TakePartyItem("AC#PPFLW") DestroyItem("AC#PPFLW")~ EXTERN AC#PPCAA 01.01
IF~~THEN REPLY @4136 EXIT 

CHAIN AC#PPCAA 01.01
@4137
==AC#PPCAA @4138
END
IF~~THEN REPLY @4139 EXTERN AC#PPCAA 01.02
IF~~THEN REPLY @4140 EXTERN AC#PPCAA 01.03

CHAIN AC#PPCAA 01.02
@4141
END
IF~~THEN REPLY @4142 EXTERN AC#PPCAA 01.04
IF~~THEN REPLY @4140 EXTERN AC#PPCAA 01.03

CHAIN AC#PPCAA 01.04
@4143
END
IF~~THEN REPLY @4144 EXTERN AC#PPCAA 01.05
IF~~THEN REPLY @4140 EXTERN AC#PPCAA 01.03

CHAIN AC#PPCAA 01.05
@4145
END
IF~~THEN REPLY @4146 EXTERN AC#PPCAA 01.06
IF~~THEN REPLY @4140 EXTERN AC#PPCAA 01.03

CHAIN AC#PPCAA 01.06
@4147
DO ~SetGlobal("AC#PPFlowerDelivery","GLOBAL",3) AddJournalEntry(@13121,QUEST) EscapeArea()~ EXIT

CHAIN AC#PPCAA 01.03
@4148
DO ~SetGlobal("AC#PPFlowerDelivery","GLOBAL",2) AddJournalEntry(@13123,QUEST) EscapeArea()~ EXIT

////////////////////////////////////////////////////////
////////////////////////////////////////////////////////

BEGIN AC#PPBOY

//1st

CHAIN IF ~Global("AC#PPWormQuest","GLOBAL",0)~ THEN AC#PPBOY 01.00
@4149
END
IF~~THEN REPLY @4150 EXTERN AC#PPBOY 01.01
IF~~THEN REPLY @4151 EXTERN AC#PPBOY 01.02
IF~~THEN REPLY @4152 EXIT
IF~~THEN REPLY @4153 EXTERN AC#PPBOY child


CHAIN AC#PPBOY 01.01
@4154
EXTERN AC#PPBOY 01.03

CHAIN AC#PPBOY 01.02
@4155
EXTERN AC#PPBOY 01.03

CHAIN AC#PPBOY child
@4156
EXTERN AC#PPBOY what_about_worms

	CHAIN IF ~~ THEN AC#PPBOY what_about_worms
	@4157
	END
	IF~~THEN REPLY @4150 EXTERN AC#PPBOY 01.01
	IF~~THEN REPLY @4151 EXTERN AC#PPBOY 01.02
	IF~~THEN REPLY @4152 EXIT

CHAIN AC#PPBOY 01.03
@4158
==AC#PPBOY @4159
DO ~SetGlobal("AC#PPWormQuest","GLOBAL",1)
AddJournalEntry(@13040,QUEST)~ EXIT

//2nd 

CHAIN IF ~Global("AC#PPWormQuest","GLOBAL",1)~ THEN AC#PPBOY 02.00
@4160
END
IF~PartyHasItem("AC#PPWRM")~ THEN REPLY @4161 DO ~TakePartyItem("AC#PPWRM") DestroyItem("AC#PPWRM")~ EXTERN AC#PPBOY 02.01
IF~~THEN REPLY @4153 EXTERN AC#PPBOY child
IF~~THEN REPLY @4162 EXIT

CHAIN AC#PPBOY 02.01
@4163
==AC#PPBOY @4164
==AC#PPBOY @4165
==AC#PPBOY @4166
==AC#PPBOY @4167
==AC#PPBOY @4168
==AC#PPBOY @4169
END
IF~~THEN REPLY @4170 EXTERN AC#PPBOY 02.02
IF~~THEN REPLY @4171 EXTERN AC#PPBOY 02.03

CHAIN AC#PPBOY 02.02
@4172
==AC#PPBOY @4173
==AC#PPBOY @4174
DO ~SetGlobal("AC#PPWormQuest","GLOBAL",2) AddExperienceParty(100) ReputationInc(1) AddJournalEntry(@13042,QUEST_DONE)~ EXIT

CHAIN AC#PPBOY 02.03
@4175
DO ~SetGlobal("AC#PPWormQuest","GLOBAL",3) AddExperienceParty(100) 
AddJournalEntry(@13043,QUEST_DONE)
ReputationInc(-1) EscapeArea()~ EXIT

//3rd

CHAIN IF ~Global("AC#PPWormQuest","GLOBAL",2)~ THEN AC#PPBOY 03.00
@4176
EXIT

////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
BEGIN AC#PPMON

CHAIN IF ~True()~ THEN AC#PPMON 01.00  // former: GlobalLT("AC#PPSymbolQuest","GLOBAL",10)
@4177
END
IF~Global("AC#PPSymbolQuest","GLOBAL",1) Global("AC#PP_AlaAgreesSymbol","GLOBAL",0) PartyHasItem("AC#PPSYM")~THEN REPLY @4178 EXTERN AC#PPMON 01.03
IF~Global("AC#PPSymbolQuest","GLOBAL",2) Global("AC#PP_AlaAgreesSymbol","GLOBAL",1) PartyHasItem("AC#PPSYM")~THEN REPLY @4179 EXTERN AC#PPMON 01.04
IF~Global("AC#PPSymbolQuest","GLOBAL",0)~THEN REPLY @4180 DO ~SetGlobal("AC#PPSymbolQuest","GLOBAL",1) AddJournalEntry(@13050,QUEST)~ EXTERN AC#PPMON 01.01
IF~~THEN REPLY @4181 EXTERN AC#PPMON 01.02
IF~~THEN REPLY @4182 EXTERN AC#PPMON bye
IF~~THEN REPLY @4183 EXTERN AC#PPMON bye  
IF~Global("AC#PPSirineQuest","GLOBAL",1) Global("AC#PPSirineQuest_d","GLOBAL",0)~THEN REPLY @4184 EXTERN AC#PPMON hello_s_00

CHAIN AC#PPMON 01.01
@4185
==AC#PPMON @4186
==AC#PPMON @4187
==AC#PPMON @4188
==AC#PPMON @4189
END
IF~Global("AC#PPSymbolQuest","GLOBAL",1) PartyHasItem("AC#PPSYM")~THEN REPLY @4178 EXTERN AC#PPMON 01.03
IF~~THEN REPLY @4181 EXTERN AC#PPMON 01.02
IF~~THEN REPLY @4190 EXTERN AC#PPMON bye
IF~~THEN REPLY @4191 EXTERN AC#PPMON bye

CHAIN AC#PPMON 01.02
@4192
==AC#PPMON @4193
END
IF~Global("AC#PPSymbolQuest","GLOBAL",1) PartyHasItem("AC#PPSYM")~THEN REPLY @4178 EXTERN AC#PPMON 01.03
IF~Global("AC#PPSymbolQuest","GLOBAL",0)~THEN REPLY @4194 DO ~SetGlobal("AC#PPSymbolQuest","GLOBAL",1)~ EXTERN AC#PPMON 01.01
IF~~THEN REPLY @4195 EXTERN AC#PPMON bye
IF~~THEN REPLY @4196 EXTERN AC#PPMON bye  

CHAIN AC#PPMON 01.03
@4197
END
IF~~THEN REPLY @4198 EXTERN AC#PPMON talk_high_fallskeeper
IF~Global("AC#PP_AlaAgreesSymbol","GLOBAL",1)~THEN REPLY @4199 EXTERN AC#PPMON 01.04
IF~~THEN REPLY @4200 EXTERN AC#PPMON bye

CHAIN AC#PPMON talk_high_fallskeeper
@4201
DO ~SetGlobal("AC#PPSymbolQuest","GLOBAL",2)~ EXIT

CHAIN AC#PPMON 01.04  
@4202
==AC#PPMON @4203  
DO ~TakePartyItem("AC#PPSYM") AddExperienceParty(400) SetGlobal("AC#PPSymbolQuest","GLOBAL",10) AddJournalEntry(@13052,QUEST_DONE) ReputationInc(1)~ EXIT  

CHAIN IF ~Global("AC#PPSymbolQuest","GLOBAL",10)~ THEN AC#PPMON 02.00  
@4204
EXIT  

CHAIN AC#PPMON bye
@4205
EXIT

	CHAIN AC#PPMON hello_s_00
	@4206
	END
	IF~~THEN EXTERN AC#PPMON hello_s_01

CHAIN IF ~~ THEN AC#PPMON hello_s_01
@4207
== JaheiraJ IF ~InParty("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID) InParty("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN @4208
== KORGANJ IF ~InParty("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID) InParty("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN @4209
END
IF~~THEN DO ~SetGlobal("AC#PPSirineQuest_d","GLOBAL",1) GiveItemCreate("AC#PPTEA",Player1,1,1,0) AddJournalEntry(@13061,QUEST)~ EXTERN AC#PPMON hello_s_02

CHAIN IF ~~ THEN AC#PPMON hello_s_02
@4210
END
IF~~THEN REPLY @4211 EXTERN AC#PPMON hello_s_bye
IF~~THEN REPLY @4212 EXTERN AC#PPMON hello_s_bye
IF~~THEN REPLY @4213 EXTERN AC#PPMON hello_s_bye

	CHAIN IF ~~ THEN AC#PPMON hello_s_bye
	@4214
	EXIT

////////////////////////////////////////////////////////
////////////////////////////////////////////////////////

BEGIN AC#PPSIR

CHAIN IF ~Global("AC#PPSirineQuest","GLOBAL",0)~ THEN AC#PPSIR 01.00
@4215
END
IF~~THEN REPLY @4216 DO ~SetGlobal("AC#PPSirineQuest","GLOBAL",1)~ EXTERN AC#PPSIR 01.01
IF~~THEN REPLY @4217 DO ~SetGlobal("AC#PPSirineQuest","GLOBAL",1)~ EXTERN AC#PPSIR 01.01
IF~~THEN REPLY @4218 EXTERN AC#PPSIR bye

CHAIN AC#PPSIR 01.01
@4219
==AC#PPSIR @4220
==AC#PPSIR @4221
==AC#PPSIR @4222
END
IF~~THEN REPLY @4223 EXTERN AC#PPSIR 01.02
IF~~THEN REPLY @4224 EXTERN AC#PPSIR eldath_siren
IF~~THEN REPLY @4225 EXTERN AC#PPSIR 01.03

	CHAIN AC#PPSIR eldath_siren
	@4226
	END
	IF~~THEN REPLY @4227 EXTERN AC#PPSIR 01.02
	IF~~THEN REPLY @4225 EXTERN AC#PPSIR 01.03

CHAIN AC#PPSIR 01.02
@4228
DO ~SetGlobal("AC#PPSirineQuest","GLOBAL",1) AddJournalEntry(@13060,QUEST)~ EXIT

CHAIN AC#PPSIR 01.03
@4229
DO ~SetGlobal("AC#PPSirineQuest","GLOBAL",1) AddJournalEntry(@13060,QUEST)~ EXIT

CHAIN AC#PPSIR bye
@4229
EXIT

CHAIN IF ~Global("AC#PPSirineQuest","GLOBAL",1)~ THEN AC#PPSIR 02.00
@4230
END
IF~~THEN REPLY @4231 EXIT
IF~PartyHasItem("AC#PPTEA")~THEN REPLY @4232 EXTERN AC#PPSIR 02.01
IF ~PartyHasItem("AC#PPTEA")~ THEN REPLY @4233 EXTERN AC#PPSIR 02.01


CHAIN AC#PPSIR 02.01
@4234
END
IF ~~ THEN REPLY @4235 EXTERN AC#PPSIR 02.02
IF ~~ THEN REPLY @4236 EXTERN AC#PPSIR 02.02
IF ~~ THEN REPLY @4237 EXTERN AC#PPSIR 02.02
IF ~~ THEN REPLY @4238 EXTERN AC#PPSIR 02.02


CHAIN AC#PPSIR 02.02
@4239
= @4166
END
IF ~~ THEN DO ~TakePartyItem("AC#PPTEA") 
DestroyItem("AC#PPTEA")
CreateVisualEffectObject("SPHEALIN",Myself)~ EXTERN AC#PPSIR 02.08

CHAIN AC#PPSIR 02.08
@4240
END
IF ~~ THEN REPLY @4241 EXTERN AC#PPSIR give_arrows
IF ~~ THEN REPLY @4242 EXTERN AC#PPSIR give_arrows
IF ~~ THEN REPLY @4243 EXTERN AC#PPSIR give_arrows

CHAIN AC#PPSIR give_arrows
@4244
== AC#PPSIR @4245 
= @4246
END
IF ~~ THEN DO ~GiveItemCreate("AC#PPARO",LastTalkedToBy,10,0,0)
GiveItemCreate("AROW05",LastTalkedToBy,10,0,0)
SetGlobal("AC#PPSirineQuest","GLOBAL",2) 
AddJournalEntry(@13062,QUEST_DONE)
AddexperienceParty(300)~ EXIT


CHAIN IF ~Global("AC#PPSirineQuest","GLOBAL",2)~ THEN AC#PPSIR 03.00
@4247
EXIT

CHAIN IF ~Global("AC#PPSirineQuest","GLOBAL",3)~ THEN AC#PPSIR 03.0b
@4248
EXIT

CHAIN IF ~~ THEN AC#PPSIR bye_no_help
@4249
EXIT

