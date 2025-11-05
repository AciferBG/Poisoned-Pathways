// Eldathyns hiding in Myth Unnohyr

BEGIN AC#PPELX
BEGIN AC#PPELY
BEGIN AC#PPELZ

// First meeting
CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#PPELX hello_charname
~A friendly face in this blighted place... we did not dare hope for it. Eldath be praised!~
== AC#PPELY ~Look, brothers — it is <CHARNAME>!~
== AC#PPELZ ~Then we are not abandoned after all!~
END
  IF ~~ THEN REPLY ~Come on, out of there. It’s not safe.~ EXTERN AC#PPELX out_here
  IF ~~ THEN REPLY ~I’ve been looking for you.~ EXTERN AC#PPELX go_on_01
  IF ~~ THEN REPLY ~How did you end up here of all places?~ EXTERN AC#PPELX how_get_here

CHAIN AC#PPELX go_on_01
~Then the Fallskeeper’s word reached you. Good... good. We held to this hollow and waited.~
END
  IF ~~ THEN REPLY ~All right, let’s get you out.~ EXTERN AC#PPELX out_here
  IF ~~ THEN REPLY ~You chose a cursed orchard to hide in...~ EXTERN AC#PPELX out_here

CHAIN AC#PPELX how_get_here
~We came to cleanse what we could — to make the waters run gentle again and let roots take hold.~
== AC#PPELY ~But the corruption was stronger than we thought, and then these creatures swarmed the woods.~
== AC#PPELZ ~So we sealed this little chamber... and prayed someone would pass by.~
END
  IF ~~ THEN REPLY ~Then come. I’ll get you out.~ EXTERN AC#PPELX out_here
  IF ~~ THEN REPLY ~Well... that went thoroughly wrong, didn’t it?~ EXTERN AC#PPELX out_here


CHAIN AC#PPELX out_here
~We would gladly flee this place at once...~
== AC#PPELY ~...but the wound in the Mythal still festers. If we leave it now, it may swallow more of the ruins.~
== AC#PPELZ ~And you may yet need us. We are no warriors, but we can mend wounds and soothe poison, should you require it.~
END
  IF ~~ THEN REPLY ~Fine. Stay close and help where you can.~ EXTERN AC#PPELX stay_and_help
  IF ~~ THEN REPLY ~I’ll manage without you. Get yourselves to safety.~ EXTERN AC#PPELX go_away

CHAIN AC#PPELX stay_and_help
~As you wish. We will keep our wards low and our voices lower. Call, and healing water shall rise for you.~
DO ~SetGlobal("AC#PP70_Eldathyn_Stay","GLOBAL",1)~
EXIT

CHAIN AC#PPELX go_away
~Very well. Eldath teaches us not to hinder the river’s course. We shall follow the quiet path out.~
== AC#PPELY ~May stillness find you amid all this violence, <CHARNAME>.~
== AC#PPELZ ~And may the forest remember you kindly.~
DO ~SetGlobal("AC#PP70_Eldathyn_Leave","GLOBAL",1)
EscapeArea()~
EXIT

// Eldathyn blessings if they stay

CHAIN IF ~True()~ THEN AC#PPELX bless_charname
~Peace follow your steps, <CHARNAME>. Even here, in this wounded grove, the Goddess watches.~
END
  IF ~~ THEN REPLY ~What do you know about this place?~ EXTERN AC#PPELX about_myth_unnohyr_01  
  IF ~GlobalLT("Eldathyn_Healing","ACPP75",4)~ THEN REPLY ~I am in need of healing.~ EXTERN AC#PPELX need_healing  
  IF ~GlobalGT("Eldathyn_Healing","ACPP75",3)
  !GlobalTimerExpired("Eldathyn_Healing_Timer","ACPP75")~ THEN REPLY ~I am in need of healing.~ EXTERN AC#PPELX need_healing_wait  

CHAIN IF ~True()~ THEN AC#PPELY bless_charname
~The waters remember kindness. Should you fall, may they cradle you gently and bear you home.~
EXIT

CHAIN IF ~True()~ THEN AC#PPELZ bless_charname
~Be as the still pool, <CHARNAME> — calm above, strong beneath. Eldath’s grace be with you.~
EXIT

// healing
CHAIN AC#PPELX need_healing
~That can be arranged. Remain still... let the quiet waters of Eldath flow through you.~
DO ~ForceSpell(LastTalkedToBy(),CLERIC_MASS_CURE)
IncrementGlobal("Eldathyn_Healing","ACPP75",1)~
EXIT

// healing
CHAIN AC#PPELX need_healing_wait
~Forgive me, but my healing prayers are spent for the day. Come again tomorrow, and I shall aid you then.~
EXIT

// about the place:
// Eldathyn knowledge dialogue

CHAIN AC#PPELX about_myth_unnohyr_01
~Little enough... and yet too much for peace of mind. This place was once an elven city — Myth Unnohyr, they called it.~
== AC#PPELY ~A haven of magic and grace, they say, before the ages turned and the Mythal guarding it grew ill.~
== AC#PPELX ~We came believing we could soothe it... but there is something else here, something that feeds on death.~
== AC#PPELY ~A spirit, perhaps — or many bound as one. We have seen the dead walk, and heard voices not our own whisper through them.~
== AC#PPELZ ~It moves among the corpses of elves, wearing them like robes of memory.~
== AC#PPELY ~We do not know its name, only that it will not rest while the Mythal bleeds.~ 
== AC#PPELX ~And the Mythal bleeds because the old guardian of this place, Mythrien Sarath, seems to have fallen silent.~  
END  
  IF ~~ THEN REPLY ~Mythrien Sarath? Who is that?~ EXTERN AC#PPELX about_mythrien_01  
  IF ~~ THEN REPLY ~It sounds as if even the earth itself is sick here.~ EXTERN AC#PPELX about_myth_unnohyr_02
  IF ~~ THEN REPLY ~I’ll see what can be done.~ EXTERN AC#PPELX stay_and_help


CHAIN AC#PPELX about_myth_unnohyr_02
~So it is. The soil trembles with old power, wounded and unhealed. No gentle hand has tended it in centuries.~
== AC#PPELY ~Where Eldath’s waters should flow clear, they seep black beneath the stones.~
== AC#PPELZ ~But perhaps, with time... and with courage, it can be cleansed again.~
END  
  IF ~~ THEN REPLY ~Mythrien Sarath? Who is that?~ EXTERN AC#PPELX about_mythrien_01  
  IF ~~ THEN REPLY ~I’ll see what can be done.~ EXTERN AC#PPELX stay_and_help


CHAIN AC#PPELX about_mythrien_01
~Mythrien Sarath is a forgotten elven deity and the ancient protector of the elves, a guardian of their wards.~
== AC#PPELY ~Some call him the Watcher of Mythals. His touch could weave magic strong enough to shield entire cities.~
== AC#PPELZ ~If he still watches, he must weep for this place. His wards lie broken, his name almost forgotten.~
== AC#PPELX ~Whether his light yet reaches these ruins, we cannot say. But perhaps your coming here was no accident.~
END   
  IF ~~ THEN REPLY ~It sounds as if even the earth itself is sick here.~ EXTERN AC#PPELX about_myth_unnohyr_02
  IF ~~ THEN REPLY ~I’ll see what can be done.~ EXTERN AC#PPELX stay_and_help




BEGIN AC#PPC6E

// Messenger from Duskwood Dell
CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#PPC6E hello_01
~<CHARNAME>! You are here!~
== AC#PPC6E ~I am a faithful servant of Eldath, bringing important news from Duskwood Dell.~    
END
IF ~~ THEN EXTERN AC#PPC6E seek_charname_02

CHAIN AC#PPC6E seek_charname_02
~We’ve been searching for you, but it was as if you had vanished from the face of Faerûn!~    
END
IF ~~ THEN REPLY ~In a manner of speaking, I suppose I did.~ EXTERN AC#PPC6E seek_charname_03
IF ~~ THEN REPLY ~You were looking for me? That usually means trouble.~ EXTERN AC#PPC6E seek_charname_03
IF ~~ THEN REPLY ~And yet, here I stand.~ EXTERN AC#PPC6E seek_charname_03

CHAIN AC#PPC6E seek_charname_03
~There are problems. We have asked many others for aid, but it has been difficult. I even travelled into the Forest of Tethir to seek help from the elves, but they seem preoccupied with other matters these days. So I turn to you.~    
END
IF ~~ THEN REPLY ~What kind of problems?~ EXTERN AC#PPC6E problems_unnohyr

CHAIN AC#PPC6E problems_unnohyr
~New troubles have arisen in Myth Unnohyr. I cannot tell you more, but I beg you to make your way to Duskwood Dell. Most Exalted Fallskeeper Alatoasz Berendim will explain everything.~    
END
IF ~~ THEN REPLY ~Ah, how I missed that name.~ EXTERN AC#PPC6E seek_charname_bye
IF ~~ THEN REPLY ~Of course. I’ll visit when I can.~ EXTERN AC#PPC6E seek_charname_bye
IF ~~ THEN REPLY ~I’ve quite a few other problems at the moment.~ EXTERN AC#PPC6E another_problems

CHAIN AC#PPC6E another_problems
~You needn’t leave at once. It isn’t that urgent—at least, not yet. But do stop by the Dell when you can and hear what the Fallskeeper has to say.~    
END
IF ~~ THEN EXTERN AC#PPC6E seek_charname_bye

CHAIN AC#PPC6E seek_charname_bye
~You remember the way to Duskwood Dell, I trust. May Eldath bless this meeting—at last I have found you!~    
DO ~SetGlobal("AC#PP_NewProblemsUnnohyr","GLOBAL",1)
AddJournalEntry(@12200,QUEST)
EscapeArea()~ EXIT


//DUSKWOOD DELL CH6 -- FIRST TALK

BEGIN AC#PPMI
CHAIN IF ~Global("AC#PP_MythUnnohyr","GLOBAL",8)~ THEN AC#PPEL4 C6.QUEST.01.00
~<CHARNAME>! You arrive at a crucial moment. Trouble stirs, and you are entwined in it—whether by choice or by fate.~    
== AC#PPEL4 ~Allow me to present Mismal Al’Visalle, once a ranger of Gwaeron’s Slumber, now serving among the Mielikkians of Amn.~  
== AC#PPMI ~A gracious introduction, but we are not gathered here to trade titles, alas. I wish it were so. Yet this is no simple matter.~  
END
IF ~~ THEN REPLY ~You sound troubled.~ EXTERN AC#PPMI C6.QUEST.01.01
IF ~~ THEN REPLY ~Simple matters are rarely laid at my feet either.~ EXTERN AC#PPMI C6.QUEST.01.01

CHAIN AC#PPMI C6.QUEST.01.01
~Aye, I am troubled by this matter, and not without cause.~  
END
IF ~~ THEN REPLY ~Then tell me more.~ EXTERN AC#PPMI C6.QUEST.01.03
IF ~~ THEN REPLY ~Go on. What is this about?~ EXTERN AC#PPMI C6.QUEST.01.03
IF ~~ THEN REPLY ~We all must bear our share of burdens.~ EXTERN AC#PPMI C6.QUEST.01.03

CHAIN AC#PPMI C6.QUEST.01.03
~I will not cloak this in fair speech. You know Myth Unnohyr, you have walked its ruins. You know how strange it is, caught between life and death. But since your last battle there, the place has worsened.~  
END
IF ~~ THEN REPLY ~Worsened? How so? The Talonite is dead.~ EXTERN AC#PPMI C6.QUEST.01.04a
IF ~~ THEN REPLY ~That happens often enough. Wherever I pass, the place seems worse off after.~ EXTERN AC#PPMI C6.QUEST.01.04a
IF ~~ THEN REPLY ~That is no longer my concern.~ EXTERN AC#PPMI C6.QUEST.01.04a
IF ~~ THEN REPLY ~I had hoped that ordeal was finished. Why, in all the gods’ names, does everyone always want something else from me?~ EXTERN AC#PPMI C6.QUEST.01.04a

CHAIN AC#PPMI C6.QUEST.01.04a
~The events at Myth Unnohyr roused something ancient. Strange beings, remnants of the elven kin, now roam that place. From what I have gathered, the power reeks of elven undeath.~  
END
IF ~~ THEN REPLY ~What kind of undeath are we speaking of, exactly?~ EXTERN AC#PPMI about_wyrd
IF ~~ THEN REPLY ~Whatever it is, it should stay there.~ EXTERN AC#PPMI about_wyrd

// About the Wyrd
CHAIN AC#PPMI about_wyrd
~We believe that an ancient evil—the very one that brought about Myth Unnohyr’s downfall—has begun to stir once more. A creature that seizes the husks of dead elves has crept into the long-sealed sarcophagi. Someone must have removed the wardstones, allowing the being to slip within and claim their bodies.~
END

IF ~Global("AC#PP_ZombieWyrdDead","GLOBAL",0)
Global("AC#PP_RemovedWardstone","GLOBAL",1)~ THEN REPLY ~That may well have been me.~ EXTERN AC#PPMI wyrd_player_guilty
IF ~Global("AC#PP_ZombieWyrdDead","GLOBAL",0)~ THEN REPLY ~How could such a thing happen?~ EXTERN AC#PPEL4 wyrd_guilt_not_important
IF ~Global("AC#PP_ZombieWyrdDead","GLOBAL",1)~ THEN REPLY ~I knew this was a trap! It certainly wasn’t me.~ EXTERN AC#PPEL4 wyrd_eldathyn_guilty
IF ~Global("AC#PP_ZombieWyrdDead","GLOBAL",1)~ THEN REPLY ~How could something so foolish have happened?~ EXTERN AC#PPEL4 wyrd_eldathyn_guilty

	CHAIN AC#PPMI wyrd_player_guilty
	~You aided this creature? How so?~ 
	END
	IF ~~ THEN REPLY ~I removed the wardstone to continue my search.~ EXTERN AC#PPEL4 wyrd_guilt_not_important
	IF ~~ THEN REPLY ~Perhaps I was mistaken after all.~ EXTERN AC#PPEL4 wyrd_guilt_not_important
	
	CHAIN AC#PPEL4 wyrd_eldathyn_guilty
	~One of my priests set out for Myth Unnohyr after your success. It seems he wished to help a desperate zombie find final rest with his beloved—and in doing so, removed the seal. But that no longer matters. What matters now is containing this creature without delay!~ 
	END
	IF ~~ THEN EXTERN AC#PPMI wyrd_cont
	
	CHAIN AC#PPEL4 wyrd_guilt_not_important
	~That no longer matters. What matters now is containing this creature.~ 
	END
	IF ~~ THEN EXTERN AC#PPMI wyrd_cont


// Continuing about the Wyrd
CHAIN AC#PPMI wyrd_cont
~This ancient evil feeds upon the rotting magic that lingers in these ruins, using it to raise more of the dead. It will not be long before such abominations spill into the surrounding lands. We must end this threat by destroying the creature.~
END
IF ~~ THEN REPLY ~By "we" I assume you mean me?~ EXTERN AC#PPMI grant_blade_idea
IF ~~ THEN REPLY ~I will gladly help. Perhaps the trouble at Myth Unnohyr grew worse because of me.~ EXTERN AC#PPMI grant_blade_idea
IF ~~ THEN REPLY ~I do not see what this has to do with me—but very well, I will try to help.~ EXTERN AC#PPMI grant_blade_idea
IF ~~ THEN REPLY ~Myth Unnohyr? Not ten rothé could drag me back there.~ EXTERN AC#PPMI grant_blade_idea


// Discussion about granting the blade
CHAIN AC#PPMI grant_blade_idea
~I know we ask much of you already. Perhaps there is aid to be found in the relics that rest within Eldath’s sanctuary, Alatoasz.~
== AC#PPEL4 ~You speak of the Memory of the Myths, the fabled blade?~  
== AC#PPMI ~The very same. It has lain here long enough. The time has come to turn it against the foes of life. Give it to <CHARNAME>.~  
== AC#PPEL4 ~No. Evil cannot be undone by answering it with the tools of bloodshed. Such ways are not ours.~  
== AC#PPMI ~This blade was forged to strike only the undead. Its edge cannot harm the living—it severs only the unlife that mocks true peace. It is a blessing, not a curse. Let <CHARNAME> take up the weapon that was once laid to rest in the grotto.~  
== AC#PPEL4 ~What was laid to rest in Eldath’s waters must not be raised again to bring death, no matter its purpose. The Quiet One forbids it.~  
== AC#PPMI ~Then so be it. I will not quarrel with you, Fallskeeper. Even without the blade, the time has come to end the unrest within Myth Unnohyr.~  
END
IF ~~ THEN EXTERN AC#PPMI wyrd_wait_for_start



// Waiting for the player to begin the Wyrd quest
CHAIN AC#PPMI wyrd_wait_for_start
~We must go to Myth Unnohyr. In a desperate act, we sealed the approaches to the old elven city, which now lies behind a barrier. I can lift the wards and grant us passage into the ruins. Together, we may yet put an end to this creature once and for all.~
END
IF ~~ THEN REPLY ~We have a deal.~ EXTERN AC#PPMI wyrd_wait_for_start_bye
IF ~~ THEN REPLY ~I may need to think about this.~ EXTERN AC#PPMI C6.QUEST.01.07
IF ~~ THEN REPLY ~I'm not interested. Sorry. There are other urgent matters that cannot wait.~ EXTERN AC#PPMI C6.QUEST.01.07

CHAIN AC#PPMI wyrd_wait_for_start_bye
~Excellent! I will set out for Myth Unnohyr at once and scout the area ahead. Meet me before the gates—once you arrive, I shall lift the barrier, and together we will enter the city.~
DO ~SetGlobal("AC#PP_MythUnnohyr","GLOBAL",10)
SetGlobal("AC#PPChapter6Quest","GLOBAL",1)
AddJournalEntry(@12202,QUEST)~ EXIT


CHAIN AC#PPMI C6.QUEST.01.07
~If you change your mind, come to me and let me know. We truly need your aid.~  
DO ~~ EXIT


// Duskwood Dell CH6 -- 2nd Talk (Cleric)

CHAIN IF ~Global("AC#PP_MythUnnohyr","GLOBAL",10)~ THEN AC#PPEL4 c6.2nd.c.00
~Good fortune out there, <CHARNAME>.~
END
IF ~~ THEN REPLY ~Thank you.~ EXTERN AC#PPEL4 c6.2nd.c.00_bye

CHAIN AC#PPEL4 c6.2nd.c.00_bye
~Farewell.~
EXIT



//HIGH RANGER
CHAIN IF ~True()~ THEN AC#PPMI C6.QUEST.02.00
~Are you prepared to face the danger in Myth Unnohyr once more?~
END
IF ~~ THEN REPLY ~I am.~ EXTERN AC#PPMI wyrd_wait_for_start_bye
IF ~~ THEN REPLY ~I may need to think about this.~ EXTERN AC#PPMI C6.QUEST.01.07 
/*
CHAIN IF ~Global("AC#PP_MythUnnohyr","GLOBAL",9)~ THEN AC#PPMI C6.QUEST.02.00
~Are you prepared to face the danger in Myth Unnohyr once more?~
END 
//IF ~Global("AC#PP_GiveBlade","GLOBAL",1)~ EXTERN AC#PPMI depart_with_sword
IF ~Global("AC#PP_GiveBlade","GLOBAL",0)~ EXTERN AC#PPMI depart_without_sword
*/
/*
CHAIN IF ~~ THEN AC#PPMI depart_with_sword
~If you have taken up the sword entrusted to you by the High Priest, then I can send you into Myth Unnohyr.~  
END
IF ~~ THEN REPLY ~I am ready.~ EXTERN AC#PPMI C6.QUEST.02.01
IF ~~ THEN REPLY ~Not yet. There is something I must attend to first.~ EXTERN AC#PPMI C6.QUEST.02.01_bye
*/
/*
CHAIN IF ~~ THEN AC#PPMI depart_without_sword
~I shall send you into Myth Unnohyr if you are ready.~  
END
IF ~~ THEN REPLY ~I am ready.~ EXTERN AC#PPMI C6.QUEST.02.01
IF ~~ THEN REPLY ~Not yet. There is something I must attend to first.~ EXTERN AC#PPMI C6.QUEST.02.01_bye 

CHAIN AC#PPMI C6.QUEST.02.01_bye
~I will wait for you here.~
EXIT

CHAIN AC#PPMI C6.QUEST.02.01
~Good. Follow me.~
DO ~StartCutScene("AC#PP6CA")~ EXIT
*/

// High Ranger in Myth Unnohyr
BEGIN AC#PPMI6
// Entering Myth Unnohyr again
CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#PPMI6 hello_01
~We're back in Myth Unnohyr! Let's make our way through the heart of the shattered city. Something stirs in the north—an unsettling presence near the old tomb of the elven commanders.~
= ~I’ll lift the barrier now. We’ll meet inside the city!~
DO ~AddJournalEntry(@12207,QUEST)
StartCutScene("AC#PP6CB")~ EXIT


// Wyrd in banshee form
BEGIN AC#PPEEA
BEGIN AC#PPMI7
BEGIN AC#PPWY7

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#PPEEA hello_0
~I am Elv-Esster Aened, commander of the elven city. By death and duty, I claim this place. Turn back, for you are not welcome here.~ //– or what remains. Another fool steps forth to join my army of the dead!~
== AC#PPMI7 ~You are not Elv-Esster. She died with honor – you wear her face like a mask!~
== AC#PPEEA ~I am more than Elv-Esster – I am what was born of her sacrifice. Her scream echoes within me.~
== AC#PPMI7 ~No. You are the echo of failure. You feed on sorrow and broken vows. I will see you silenced.~
== AC#PPEEA ~You shall look upon this world no more. The forest has decreed your death.~
== AC#PPMI7 ~What?~
== AC#PPEEA ~Die, fool!~
DO ~SetGlobal("AC#PP_Ch6RangerDead","GLOBAL",1)
StartCutScene("AC#PP6CR")
~ EXIT

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#PPWY7 hello_0
~Still more fools come to join my army of the dead?~
== AC#PPWY7 IF ~Global("AC#PP_RemovedWardstone","GLOBAL",1)
Global("AC#PP_ZombieWyrdDead","GLOBAL",0)~ THEN ~I remember you! You were so kind to remove the wardstone for me.~
== AC#PPWY7 IF ~Global("AC#PP_RemovedWardstone","GLOBAL",0)
Global("AC#PP_ZombieWyrdDead","GLOBAL",1)~ THEN ~I remember you! You struck me down in that miserable zombie form!~
== AC#PPWY7 ~That no longer matters. You have survived until now... but my new servant will tear you apart! Rise again, doomed ranger!~
DO ~SetGlobal("AC#PP_Ch6RangerDead","GLOBAL",2)
AddJournalEntry(@12208,QUEST)
StartCutScene("AC#PP6CS")~ EXIT

//wyrd again in front of tomb
BEGIN AC#PPWY8

// Confrontation at the tomb entrance
CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#PPWY8 hello_0
~You're still here!~
END
IF ~~ THEN REPLY ~I'll leave when you're gone.~ EXTERN AC#PPWY8 wyrd_front_tomb_02
IF ~~ THEN REPLY ~Don't think for a moment that I like being here.~ EXTERN AC#PPWY8 wyrd_front_tomb_02

CHAIN AC#PPWY8 wyrd_front_tomb_02
~Then enter my tomb, if you dare!~
DO ~EscapeAreaObject("Tracpp77")~ EXIT


BEGIN AC#PPWYR

//1ST FIGHT

CHAIN IF ~Global("AC#PPChapter6Quest","GLOBAL",2)~ THEN AC#PPWYR 1.00
~You are still meddling with my minions, in my stronghold!~
END
IF~~THEN REPLY ~Your stronghold? You are just making it more dangerous. More... dead.~ EXTERN AC#PPWYR 1.01
IF~~THEN REPLY ~You must be the one I'm looking for. You took over the body of the elven maiden that did all she could to defend this place.~ EXTERN AC#PPWYR 1.01
IF~~THEN REPLY ~Well, I heard there is some new monster trying to turn this place into its base, so I came. I wouldn't want to miss all the fun.~ EXTERN AC#PPWYR 1.01

CHAIN AC#PPWYR 1.01
~Just look at you. You think you can match my power?~
==AC#PPWYR ~Believe me or not, but I am an ancient being. I saw the world crumble. I saw it being rebuilt. I've seen all that there is, the rot, the destruction, death, power, fear... and life. And I came, to be part of this.~
==AC#PPWYR ~This elf—oh, how she loved this place. And that's why I chose it. So we—me and her—could see this place together. So we could take all the dead parts of it, and build a new enclave. Wild. Dead. And yet... alive.~
==AC#PPWYR ~And I know you've been here before. Even then I was already humming my silent song! Lured the poisonous. Lured the wild. Lured the rotten roots. All these things weave so well with the wicked energied engraved in Myth Unnohyr's stones and walls.~
END
IF~~THEN REPLY ~So you knew about the Talonite that made his base here? And you lured the monsters that came here?~ EXTERN AC#PPWYR 1.02
IF~~THEN REPLY ~It looks like some's been one busy wyrd!~ EXTERN AC#PPWYR 1.03

CHAIN AC#PPWYR 1.02
~Partially. All these things were here. I just hummed my song.~
EXTERN AC#PPWYR 1.03

CHAIN AC#PPWYR 1.03
~You may think that what I am doing here is... evil. Oh, you living things love that word. You want to call thing evil. Wrong. Bad. But I am none of these things. I am ancient. I am above all of this.~
==AC#PPWYR ~However, some could say that I am hungry. Just as hungry as Myth Unnohyr and the earth below it! It's already swallowed part of this place before. This time, however, we will feed on dreams, and hopes, and life and... those that dared to came. And it looks like you are on that list.~
END
IF~~THEN REPLY ~You won't win this.~ EXTERN AC#PPWYR 1.04
IF~~THEN REPLY ~I came armed. You're not going to defeat me, monsters. I shall be your doom.~ EXTERN AC#PPWYR 1.04
IF~~THEN REPLY ~I suppose it was a mistake to come here. Let me leave. I'm not going to fight you. I changed my mind.~ EXTERN AC#PPWYR 1.05

CHAIN AC#PPWYR 1.04
~Do not make promises that you are unable to hold.~
EXTERN AC#PPWYR 1.06

CHAIN AC#PPWYR 1.05
~No. It's too late for you. You will be consumed by us. By this place. Your bones will become part of it.~
EXTERN AC#PPWYR 1.06

CHAIN AC#PPWYR 1.06
~Let's test your weapons and your will!~
DO ~SetGlobal("AC#PPChapter6Quest","GLOBAL",3) 
Enemy()~ EXIT

//2ND TALK - HURT 

CHAIN IF ~Global("AC#PPChapter6Quest","GLOBAL",4)~ THEN AC#PPWYR 2.00
~You are putting a lot of effort in all of this. It's almost impressive. But this place is mine, and I shall leave just as long as the half-dead and half-wild nature of this place.~
==AC#PPWYR ~My beautiful symbiotes link me to this place. You cannot defeat me, but—I encourage you to try. I want to see you tired. I want to see you lose all hope.~
END
IF~~THEN REPLY ~Symbiotes?~ EXTERN AC#PPWYR 2.01
IF~~THEN REPLY ~I will find some way to destroy you!~ EXTERN AC#PPWYR 2.02

CHAIN AC#PPWYR 2.01
~Well, everyone has their ways to control the flow of power. And they are mine. But that knowledge will give you nothing. I am too powerful for you, with or without them!~
EXTERN AC#PPWYR 2.03

CHAIN AC#PPWYR 2.02
~You are clearly a dreamer, haha!~
EXTERN AC#PPWYR 2.03

CHAIN AC#PPWYR 2.03
~I shall watch how you struggle. Remember that. Go. Do you best. And let me enjoy the spectacle, little one.~
DO ~SetGlobal("AC#PPChapter6Quest","GLOBAL",5) 
AddJournalEntry(@12209,QUEST)
StartCutSceneMode() 
Wait(1) 
ScreenShake([20.45],15) 
Wait(2) 
EndCutSceneMode() 
DestroySelf()~ EXIT

//HELPER 

BEGIN AC#PPHEL

CHAIN IF ~Global("AC#PPChapter6Quest","GLOBAL",6)~ THEN AC#PPHEL HELPER.1.00
~You have destroyed the symbiotes!~
== AC#PPHEL ~That abomination—the one that defiled the body of our beloved commander—wants you to believe none of this matters, that slaying its gnawing mouths means nothing... But it does!~
== AC#PPHEL ~Seek me beneath the sacred temple of Mythrien... there I shall aid you. I know how to end the nemesis of our city once more. We did it once—we shall do it again. Come, and I will tell you more when you find me.~
DO ~SetGlobal("AC#PPChapter6Quest","GLOBAL",7)
AddJournalEntry(@12211,QUEST)
 CreateVisualEffectObject("SPFLESHS",Myself) Wait(1) DestroySelf()~ EXIT


//HELPER 2

CHAIN IF ~Global("AC#PPChapter6Quest","GLOBAL",8)~ THEN AC#PPHEL HELPER.2.00
~You have come... I am... glad.~
END
IF~~THEN REPLY ~Who are you?~ EXTERN AC#PPHEL HELPER.2.02
IF~~THEN REPLY ~Truth be told, I had little choice.~ EXTERN AC#PPHEL HELPER.2.01

CHAIN AC#PPHEL HELPER.2.01
~Perhaps so... yet even so, there is a way to set this right. All of it.~
EXTERN AC#PPHEL HELPER.2.02

CHAIN AC#PPHEL HELPER.2.02
~I am Vaxh Aened. Commander Elv-Esster Aened was my wife... That abomination you face has clad itself in her very bones, defiling all that remained of her.~
== AC#PPHEL ~We must end this wyrd— for her, for Myth Unnohyr, and for the world of the living you still walk in.~
END
IF~~THEN REPLY ~You said you know how to stop that creature.~ EXTERN AC#PPHEL HELPER.2.03
IF~~THEN REPLY ~Yes, yes... I know it must be stopped. That’s why I’m here! Tell me something I *don’t* know.~ EXTERN AC#PPHEL HELPER.2.03

CHAIN AC#PPHEL HELPER.2.03
~Such a creature does not gain its strength by chance. This wyrd is ancient, born of soil tainted by both dead and wild magic. But what is broken can be mended. Even magic. Even here.~
END
IF~~THEN REPLY ~You believe this place can be restored?~ EXTERN AC#PPHEL HELPER.2.04
IF~~THEN REPLY ~What nonsense is this?~ EXTERN AC#PPHEL HELPER.2.05


CHAIN AC#PPHEL HELPER.2.04
~Not *what*, but... who.~
EXTERN AC#PPHEL HELPER.2.06

CHAIN AC#PPHEL HELPER.2.05
~It's not... I know who we can ask for help.~
EXTERN AC#PPHEL HELPER.2.06

CHAIN AC#PPHEL HELPER.2.06
~The fall of this place remains a mystery... even to us. Few truly know what befell Myth Unnohyr. It was like a disaster both natural and arcane, as if the very fabric of our world had shattered.~
== AC#PPHEL ~Our stronghold had been a sanctuary—where we studied art, magic, and nature, striving to protect all we held most dear. But then came the attack... so long ago I cannot recall by whom. Only the memory of the blast endures—something was torn apart.~
== AC#PPHEL ~And then... a greater one still. Our Mythal. The most sacred of all magics, woven by the blessing of Mythrien Sarath. When it broke, there was only pain... fear... and a terror that still lingers. I feel it even now... the dread, unending!~
END
IF~~THEN REPLY ~It's in the past. I'm here. Please, tell me what happened next.~ EXTERN AC#PPHEL HELPER.2.07
IF~~THEN REPLY ~Stop shouting! Someone might hear us! There are red spirits all around this place!~ EXTERN AC#PPHEL HELPER.2.07


CHAIN AC#PPHEL HELPER.2.07
~Forgive me. To me it still feels so real...~
== AC#PPHEL ~We must call upon Mythrien—find the Green Rose of Mythrien! The rose yet endures... I can feel it. Most overlook it, but even in this darkness, its blossoms remain.~
== AC#PPHEL ~Seek the rose and carry it to the temple, into the very heart of our city. Lay it at Mythrien’s feet... and he will answer. I know he will.~
== AC#PPHEL ~Ask for his aid. Banish the wyrd. Heal this place. And let peace return within these walls...~
END
IF~~THEN REPLY ~I'll do my best.~ EXTERN AC#PPHEL HELPER.2.08
IF~~THEN REPLY ~It sounds difficult...~ EXTERN AC#PPHEL HELPER.2.08


CHAIN AC#PPHEL HELPER.2.08
~My sight reaches deeper than flesh... I know there is greatness within you. Yours is not the road of death, but the path of life.~
== AC#PPHEL ~I, however... I am bound to to silence and to endings. May Mythrien’s light guide your steps where mine can no longer follow.~
== AC#PPHEL ~Now I sink back into the soil that claimed me... into the darkness where I fell...~
DO ~SetGlobal("AC#PPChapter6Quest","GLOBAL",9)
AddJournalEntry(@12212,QUEST)
 CreateVisualEffect("AC#PPBUR",[2230.800]) DestroySelf()~ EXIT



//MYTHRIEN SUMMONED

BEGIN AC#PPMYT

CHAIN IF ~Global("AC#PPChapter6Quest","GLOBAL",14)~ THEN AC#PPMYT 01.00
~^0xFF8FAD5DYour summons echoes through veils long closed... and I have come. But what shadow clings here? ^-~
==AC#PPMYT IF ~Race(Player1,ELF)~ THEN ~^0xFF8FAD5DA child of my people calls me to broken Unnohyr. Ages have passed since such voices reached me. ^-~
==AC#PPMYT IF ~!Race(Player1,ELF)~ THEN ~^0xFF8FAD5DA bold <PRO_RACE>, daring to touch the frayed skein of a fallen Mythal. ^-~
==AC#PPMYT ~^0xFF8FAD5DThese stones once thrummed with glory. Now they writhe with mockery—wards unbound, oaths sundered. ^-~
END
IF~~THEN REPLY ~I called you for a purpose.~ EXTERN AC#PPMYT 01.02
IF~~THEN REPLY ~We need your strength, Mythrien.~ EXTERN AC#PPMYT 01.02
IF~~THEN REPLY ~You dwell on ruin, yet spirits still cling to you. Do you not see?~ EXTERN AC#PPMYT 01.01

CHAIN AC#PPMYT 01.01
~^0xFF8FAD5DTo chastise the Seldarine is folly… yet your words hold more than rebuke. Speak then. ^-~
EXTERN AC#PPMYT 01.02

CHAIN AC#PPMYT 01.02
~^0xFF8FAD5DAh. The Rose… not by chance. Who guided your hand? For what end? ^-~
END
IF~~THEN REPLY ~This city’s Mythal is shattered. A wyrd has seized your champion’s body. We must end it, and give these souls peace.~ EXTERN AC#PPMYT myth_unnohyr_not_forgotten
IF~~THEN REPLY ~Elv-Esster Aened, your faithful, is defiled. The wyrd twists spirit and magic alike. We cannot prevail without you.~ EXTERN AC#PPMYT 01.03
IF~~THEN REPLY ~I want to leave this place as soon as possible. For that, I need your help.~ EXTERN AC#PPMYT myth_unnohyr_not_forgotten

CHAIN AC#PPMYT 01.03
~^0xFF8FAD5DElv-Esster Aened… yes. I recall her vow. ^-~
END
IF~~THEN EXTERN AC#PPMYT myth_unnohyr_not_forgotten


CHAIN AC#PPMYT myth_unnohyr_not_forgotten 
~^0xFF8FAD5DI thought Unnohyr forgotten, its Weave dissolved. Yet the Rose still breathes, and rites yet whispered… perhaps not wholly forsaken. ^-~
==AC#PPMYT ~^0xFF8FAD5DA wyrd, swelling on broken currents… strange, for such a thing is weak without the wound of a Mythal to feed it. Before I act, tell me: Is this ruin still worth salvation? ^-~
END
IF~~THEN REPLY ~Yes. It must be.~ EXTERN AC#PPMYT 01.04
IF~Race(Player1,ELF)~THEN REPLY ~Yes. It is our home, Mythrien.~ EXTERN AC#PPMYT 01.04
IF~~THEN REPLY ~No. Ruins only. But the wyrd must fall.~ EXTERN AC#PPMYT 01.05

CHAIN AC#PPMYT 01.04
~^0xFF8FAD5DSo be it. ^-~
EXTERN AC#PPMYT 01.06

CHAIN AC#PPMYT 01.05
~^0xFF8FAD5DYet even in dismissal, I hear Eldath's and Khalreshaar’s breath among these woods. Not all seems lost. ^-~
EXTERN AC#PPMYT 01.06

CHAIN AC#PPMYT 01.06
~^0xFF8FAD5DKnow this: I cannot descend with sword in hand. My essence is too frayed, my avatar bound. ^-~
==AC#PPMYT ~^0xFF8FAD5DYours must be the struggle. Yet I shall unbind the flow that fattens the wyrd—no longer shall this broken Mythal lend it strength. ^-~
==AC#PPMYT ~^0xFF8FAD5DThe Weave here will remain wild or dead to gentle touch, perilous to all… but no more shall the corruption swell against you. ^-~
DO ~SetGlobal("AC#PPChapter6Quest","GLOBAL",15) StartCutScene("AC#PP6C4")~ EXIT


//Mythal fixed against wyrd
CHAIN IF ~Global("AC#PPChapter6Quest","GLOBAL",16)~ THEN AC#PPMYT 02.00
~^0xFF8FAD5DThe price is paid… may it not be in vain. ^-~
END
IF~~THEN REPLY ~What happened?~ EXTERN AC#PPMYT 02.01
IF~~THEN REPLY ~Have you—~ EXTERN AC#PPMYT 02.01

CHAIN AC#PPMYT 02.01
~^0xFF8FAD5DI have not mended this Mythal. Its wounds run deeper than my hands may reach. ^-~
==AC#PPMYT ~^0xFF8FAD5DBut I poured a fragment of my essence into its breach, and the wyrd shall drink here no longer. The broken weave will still twist, will still fall dead at times... yet its corruption shall not rise to feed your foe. ^-~
END
IF~~THEN REPLY ~Hah! I’d love to see the wyrd’s face—if it had one.~ EXTERN AC#PPMYT 02.02
IF~~THEN REPLY ~Will that be enough?~ EXTERN AC#PPMYT 02.02
IF~~THEN REPLY ~So… you only weakened it?~ EXTERN AC#PPMYT 02.03

CHAIN AC#PPMYT 02.02
~^0xFF8FAD5DIt is all that can be given. It must suffice. ^-~
EXTERN AC#PPMYT 02.04

CHAIN AC#PPMYT 02.03
~^0xFF8FAD5DNo god should unmake the labors of mortals. I did not heal—only stilled the excess. The rest lies in your hands, as it ever must. ^-~
EXTERN AC#PPMYT 02.04

CHAIN AC#PPMYT 02.04
~^0xFF8FAD5DGo now. Find the creature. End its theft. Return to me when justice is wrought. ^-~
DO ~SetGlobal("AC#PPChapter6Quest","GLOBAL",17) 
SetGlobal("AC#PPFixMagic","GLOBAL",1)
AddJournalEntry(@12214,QUEST)~ EXIT

// Waiting for the defeat of the wyrd
CHAIN IF ~GlobalGT("AC#PPChapter6Quest","GLOBAL",16)
GlobalLT("AC#PPChapter6Quest","GLOBAL",23)~ THEN AC#PPMYT hello_all_fixed
~^0xFF8FAD5DHave you brought the wyrd to its end? ^-~
END
//IF~Dead("AC#PPWYR")~THEN REPLY ~Yes. The wyrd is no more.~ EXTERN AC#PPMYT FINALE.00
IF~~THEN REPLY ~Yes. The wyrd is no more.~ EXTERN AC#PPMYT FINALE.00
IF~~THEN REPLY ~No, not yet.~ EXTERN AC#PPMYT wait_wyrd_defeat_bye

CHAIN AC#PPMYT wait_wyrd_defeat_bye
~^0xFF8FAD5DThen I shall wait here until your return. ^-~
EXIT



//WYRD 2nd Meeting

CHAIN IF ~Global("AC#PPChapter6Quest","GLOBAL",18)~ THEN AC#PPWYR 3.00
~** Mmm. I am getting bored with that struggle of yours. You don't even understand you are destined to lose it. **~
END
IF~~THEN REPLY ~Lose it? Don't you sense what I did?~ EXTERN AC#PPWYR 3.01
IF~~THEN REPLY ~Hah! You are afraid, aren't you? You know it's you who is losing this! Hahaha!~ EXTERN AC#PPWYR 3.01

CHAIN AC#PPWYR 3.01
~** You may think that you sand a chance, but you don't. None of this matters. **~
DO ~StartCutScene("AC#PP6C6")~ EXIT

CHAIN IF ~Global("AC#PPChapter6Quest","GLOBAL",19)~ THEN AC#PPWYR 3.02 //continued
~** What is this?! **~
==AC#PPMYT ~^0xFF8FAD5DIt's time for you to leave Myth Unnohyr, monster. ^-~
==AC#PPWYR ~No! I still have a few tricks I'm not afraid to use! Die! All of you!~
DO ~SetGlobal("AC#PPChapter6Quest","GLOBAL",20) CreateCreature("AC#PPSPI",[3730.420],1) CreateVisualEffect("SPFLESHS",[3730.420]) CreateCreature("AC#PPSPI",[3900.490],1) CreateVisualEffect("SPFLESHS",[3900.490]) CreateCreature("AC#PPBGO",[3350.500],1) CreateVisualEffect("SPFLESHS",[3350.500]) CreateCreature("AC#PPBGO",[3880.790],1) CreateVisualEffect("SPFLESHS",[3880.790]) Enemy()~ EXIT

//WYRD 3rd and final

CHAIN IF ~Global("AC#PPChapter6Quest","GLOBAL",21)~ THEN AC#PPWYR 4.00
~** No!!! You cannot win! I still have one more trick! **~
DO ~SetGlobal("AC#PPChapter6Quest","GLOBAL",22) ApplySpell(Myself,CLERIC_HEAL) DestroyItem("MINHP1") ApplySpell(Myself,CLERIC_REGENERATE) ApplySpell(Myself,CLERIC_EARTHQUAKE)~ EXIT

//MYTHRIEN

CHAIN AC#PPMYT FINALE.00
~^0xFF8FAD5DSo it is done. The wyrd is unmade, its hunger silenced... and for the first time in long ages, this land may breathe. ^-~
EXTERN AC#PPMYT wyrd_dead_02

CHAIN AC#PPMYT wyrd_dead_02
~^0xFF8FAD5DMortal, your strength has carried what even I could not. The echo of your deed reaches beyond these broken wards—yes, even the gods turn their gaze toward you. You have given Myth Unnohyr a fragment of peace. For that, I thank you. ^-~
END
IF~~THEN REPLY ~Perhaps you could show your gratitude in a more... tangible way?~ EXTERN AC#PPMYT show_grateful
IF~~THEN REPLY ~Will the curse of wild and dead magic linger on forever?~ EXTERN AC#PPMYT restore_mythal
IF~~THEN REPLY ~What will become of this place now?~ EXTERN AC#PPMYT restore_mythal
IF~~THEN REPLY ~I’ll be glad once I can leave this place behind.~ EXTERN AC#PPMYT restore_mythal

CHAIN AC#PPMYT show_grateful
~^0xFF8FAD5DThat I shall do soon enough. But first, allow me to mend the Mythal of this place—if only in part. ^-~
EXTERN AC#PPMYT restore_mythal

CHAIN AC#PPMYT restore_mythal
~^0xFF8FAD5DI do not possess the strength to renew this Mythal in full. Yet for a brief span I can steady it—enough to still its raving for a single year. During that time, no corruption shall rise to feed upon it. ^-~
DO ~StartCutScene("AC#PP6C7")~ EXIT


CHAIN IF ~Global("AC#PPChapter6Quest","GLOBAL",23)~ THEN AC#PPMYT FINALE.02
~^0xFF8FAD5DA year of quiet is all I can grant. Beyond that, it rests with my kin—if they choose to weave anew, to raise a true Mythal here once more. ^-~
==AC#PPMYT ~^0xFF8FAD5DAs my thanks, I return to you the rose you placed at my feet when you called me forth. May it shield you against the malice of hostile spells. Yet remember—its power, too, shall one day fade into silence. ^-~
END
IF~~THEN DO ~GiveItemCreate("AC#PPMYR",Player1,1,0,0)~ EXTERN AC#PPMYT bye_final

CHAIN AC#PPMYT bye_final
~^0xFF8FAD5DFarewell, <CHARNAME>. May the paths ahead bow to your courage. ^-~
DO ~SetGlobal("AC#PPChapter6Quest","GLOBAL",24) 
AddJournalEntry(@12217,QUEST)
CreateVisualEffect("SPPORTAL",[900.400]) DestroySelf()~ EXIT

BEGIN AC#PPHE2
CHAIN IF ~True()~ THEN AC#PPHE2 hello_thank_you
~You have done what we could not. The silence is lifted. The Mythal breathes again – if only for a time.~
== AC#PPHE2 ~Its strength may fade with the turning of the seasons, but even a single year of peace is more than we dared hope for.~
== AC#PPHE2 ~Myth Unnohyr is no longer a place of sorrow. Thanks to you, its name may be spoken with pride once more!~
== AC#PPHE2 ~Our spirits may rest. Yours... must journey on. But know this: the song of your deed will echo in the roots of this forest for ages to come.~
DO ~SetGlobal("Elves_ByeBye","ACPP90",1)
AddJournalEntry(@12218,QUEST)
GiveItemCreate("AC#PPBE",Player1,1,0,0)
CreateVisualEffectObject("SPFLESHS",Myself) Wait(1) DestroySelf()~ EXIT


// FINALE – Return to Alatoasz

CHAIN IF ~Global("AC#PPChapter6Quest","GLOBAL",25)~ THEN AC#PPEL4 C6.QUEST.0X.00
~You have returned! Does this mean you have banished the evil haunting Myth Unnohyr once and for all?~
END
IF ~~ THEN REPLY ~Yes, though it required far more effort than we imagined. With a touch of divine intervention, Myth Unnohyr is safe again.~ EXTERN AC#PPEL4 C6.QUEST.FINALE.01
IF ~~ THEN REPLY ~Surprised? It was like a nightmare come to life—but it’s over now. The evil will trouble no one for a long while.~ EXTERN AC#PPEL4 C6.QUEST.FINALE.01

CHAIN AC#PPEL4 C6.QUEST.FINALE.01
~Are you certain the ruins are at peace again?~
END
IF ~~ THEN REPLY ~Yes. I was able to call upon Mythrien himself. His blessing will keep Myth Unnohyr free from corruption for a year.~ EXTERN AC#PPEL4 C6.QUEST.FINALE.02
IF ~~ THEN REPLY ~You’ll have to see for yourself. My part in this is done.~ EXTERN AC#PPEL4 C6.QUEST.FINALE.03

CHAIN AC#PPEL4 C6.QUEST.FINALE.02
~Truly? This is wondrous news! And Mythrien’s hand was in it... that is no small thing.~
EXTERN AC#PPEL4 C6.QUEST.FINALE.04

CHAIN AC#PPEL4 C6.QUEST.FINALE.03
~Of course.~
EXTERN AC#PPEL4 C6.QUEST.FINALE.04

CHAIN AC#PPEL4 C6.QUEST.FINALE.04
~What you have done surpasses all we had hoped for. The grove and all its faithful shall remember your name.~
== AC#PPEL4 ~I have long pondered something. You may remember the blade kept hidden here in the Dell—a weapon of great power, one that can harm only the undead. My former hesitation to release it was misguided. This blade does not destroy life—it unravels unlife, that which stands in defiance of Eldath’s peace.~
== AC#PPEL4 ~With her blessing, I wish to grant you this weapon as a reward. May you wield it against the foes of life itself, and let each strike serve peace rather than wrath.~
== AC#PPEL4 ~The weapon rests at the bottom of Eldath’s Grotto. You need only ask the Maiden who guards those waters—she will not deny you.~
END
IF ~~ THEN REPLY ~It will be an honor. I shall wield it in Eldath’s name, and for the peace she teaches.~ EXTERN AC#PPEL4 bye_mythblade
IF ~~ THEN REPLY ~I am glad you changed your mind, Fallskeeper.~ EXTERN AC#PPEL4 bye_mythblade

CHAIN AC#PPEL4 bye_mythblade
~Go with Eldath’s blessing, <CHARNAME>. Whoever stands in your way—I pity them already.~
DO ~SetGlobal("AC#PPChapter6Quest","GLOBAL",26)
SetGlobal("AC#PP_GiveBlade","GLOBAL",1)
AddJournalEntry(@12219,QUEST)
AddXPObject(Player1,5000)
AddXPObject(Player2,5000)
AddXPObject(Player3,5000)
AddXPObject(Player4,5000)
AddXPObject(Player5,5000)
AddXPObject(Player6,5000)~ EXIT

CHAIN IF ~Global("AC#PPChapter6Quest","GLOBAL",26)~ THEN AC#PPEL4 C6.QUEST.0X.01
~May the waters of peace ever flow around you, my friend.~
EXIT

