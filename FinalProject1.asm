;=-=-=BEGINNING=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=80-char=-=-;
TITLE FinalProject1 (FinalProject1.asm)

;~TITLE BLOCK~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
; Author:               Lucas Pichette, Sean Sullivan
; Course/Project ID:    CS271-FinalProject1
; Description:          This final project is aimed 
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;



; Tasks:
;   1) Display program title and your name. Then get user's name and greet the
;       user.
;   ?) Display a goodbye message that includes the user's name and terminates
;       the program.

; Requirements:
;   1) There needs to be ascii art for whatever reason
;   2) There should be at least one procedure
;   3) At least 2-deep nested storyline. 

; Notes:
;   1) This is a comment. We can communicate big ideas here, or even just
;		smaller questions.
;   2) Story setting: Doesn't matter, we just need to have one.s


INCLUDE Irvine32.inc

; CONSTANTS
;==============================================================================;

MIN             =           1
MAX             =           2

;==============================================================================;



.data ; BUFFER IN RAM
;==============================================================================;

sTitle          BYTE        "Title:     TBD (Final Project 1)",0
sAuthor         BYTE        "Author:    Lucas Pichette, Sean Sullivan",0
sPromptForName  BYTE        "What's your name broseph? ",0
sBadInput       BYTE        "Bad Input. Retry... ",0
sGreetings      BYTE        "Hello, ",0
sGoodbye        BYTE        "Goodbye, ",0

sDecision       BYTE        "Which will you do? ...->] ",0

; 16 pushes for story part 1
; 5 lines of ascii for story part 1
sAscii1a        BYTE        "                               |    |",0
sAscii1b        BYTE        "      o  /   xxxxxx            |    |",0
sAscii1c        BYTE        "     -|-/    ======         o /  o /  ",0
sAscii1d        BYTE        "   j====-----\====/        |\x\ |\x\  ",0
sAscii1e        BYTE        "    |  |    0      0         /\    /\  ",0
; 9 strings for story part 1
sStory1a        BYTE        "...!>] Thunder cracks across the sky as the highwaymen circle the cart you are held in.",0
sStory1b        BYTE        "Their swords gleam like their smiles, both dripping with anticipation...and is that blood? ",0
sStory1c        BYTE        "The warden who holds the keys, both literally and figuratively to your escape isn't scared. ",0
sStory1d        BYTE        "The two mercenaries he's hired just for this circumstance are readying their weapons with silent calculability that reverberates fear. ",0
sStory1e        BYTE        "The battle is set and the time for talking is over. You look down. Your shackles are heavy, which could work to your advantage. ",0
sStory1f        BYTE        "You can see the shadow of a highwayman on the tarp that covers the cart you ride in. ",0
sStory1g        BYTE        "With any luck at all, you could jump out and surprise him, giving the warden an advantage. ",0
sStory1h        BYTE        "However, both the warden and the mercenaries have their back to you, ",0
sStory1i        BYTE        "and a konniving chap like yourself could be freed by the highwaymen if you gave assistance...",0
; 2 prompts for story part 1
sPrompt1a       BYTE        "...?> Protect the Cart",0
sPrompt1b       BYTE        "...?> Ambush the Warden",0

; 12 pushes for story part 2a
; 5 lines of ascii for story part 2a
sAscii2aa       BYTE        "                         \\ /                  ",0
sAscii2ab       BYTE        "      o  /   xxxxxx       --\-o                ",0
sAscii2ac       BYTE        "     -|-/    ======         /                 >> o   ",0
sAscii2ad       BYTE        "   j====-----\====/            __    //    >>  //x/\  ",0
sAscii2ae       BYTE        "    |  |    0      0           __-\x\-o      >> /\  ",0
; 5 strings for story partg 2a
sStory2aa       BYTE        "...!> Your resolve hardens. It's time to help the warden and the mercenaries since they are law-abiding citizens.",0
sStory2ab       BYTE        "With the poise of a sickly cat, you launch yourself through the canvas...Directly onto the head of a passing highwayman! ",0
sStory2ac       BYTE        "With the grace of a sickly person still bound in a set of shackles and a modest amount of chains, you conk the highwayman on the head.",0
sStory2ad       BYTE        "The loss of a member is enough to make the highwaymen run away, they relied on numbers and ambushes, a fair fight isn't for them!",0
sStory2ae       BYTE        "The warden approaches you his face looks surprised, maybe you'll get your freedom? But what if he throws you back in the cart?!",0
; 2 prompts for story part 2a
sPrompt2aa      BYTE        "...?> Steal the key to your shackles",0
sPrompt2ab      BYTE        "...?> Wait and see what happens",0

; 19 pushes for story part 2b
; 6 lines of ascii for story part 2b
sAscii2ba       BYTE        "                          o",0
sAscii2bb       BYTE        "                         -|-                            |    |",0
sAscii2bc       BYTE        "                          xxxxxx                        |    |",0
sAscii2bd       BYTE        "  o                       ======        o     o      o /  o /  ",0
sAscii2be       BYTE        " \x\___    __   j====-----\====/    __/m/ __/m/      |\x\ |\x\  ",0
sAscii2bf       BYTE        " /\    o/--__     |  |    0     0      /\    /\        /\    /\  ",0
; 11 strings for story part 2b
sStory2ba       BYTE        "...!> An evil smile cracks across your dirty face.",0
sStory2bb       BYTE        " It's payback time against the system that put you in these chains.",0
sStory2bc       BYTE        "With deviant glee you creep towards the warden, the dragging of your chains on the cart floor is masked by the initial skirmishes of the highwaymen and the mercenaries, the warden completely engrossed in the battle.",0
sStory2bd       BYTE        " Suddenly from the corner of your eye, you see a highwayman, probably the one the saw through the canvas cover of the cart.",0
sStory2be       BYTE        " You make eye contact and there is an understanding between you and him.",0
sStory2bf       BYTE        " Carefully you get closer and closer to the warden. When you are within range.",0
sStory2bg       BYTE        " You jam your shoulder into the wardens back pushing him off the front seat of the cart and directly to the feet of the highwayman you made eye contact with.",0
sStory2bh       BYTE        " The warden's death is painless and swift, not making a sound.",0
sStory2bi       BYTE        " The mercenaries are still fighting, not seeing the highwayman ambush the warden. They are completely exposed to an ambush.",0
sStory2bj       BYTE        " You could yell out to them, warning them of the danger. After all, they didn't see you kill the warden.",0
sStory2bk       BYTE        " OR, you could remain silent and watch the battle conclude.",0
; 2 prompts for story part 2b
sPrompt2ba      BYTE        "...?> Warn the Mercenaries",0
sPrompt2bb      BYTE        "...?> Shut Your Mouth",0

; 14 pushes for story part 3a
; 4 lines of ascii for story part 3a
sAscii3aa       BYTE        "      o      xxxxxx <<<<",0
sAscii3ab       BYTE        "     -|-     =k o = <<<<<<<",0
sAscii3ac       BYTE        "   j====-----\====/ <<<<<<<<<",0
sAscii3ad       BYTE        "    |  |    0      0  <<<     ",0
; 8 strings for story part 3a
sStory3aa       BYTE        "...!> You decide that you can't trust the warden. He approaches you and begins to thank you, however, you're not really listening.",0
sStory3ab       BYTE        " Feigning fatigue, you fall into the warden, grabbing the key and hiding it before you hit the floor. The mercenaries tense but the warden wave them off.",0
sStory3ac       BYTE        " The warden carries you back into the depths of the cart.",0
sStory3ad       BYTE        " The journey to your prison is resumed, but this time you have a key to your shackles.",0
sStory3ae       BYTE        "As you are bumping along nite falls and the warden stops the cart for the night.",0
sStory3af       BYTE        " A mercenary is put on guard but they quickly fall asleep.",0
sStory3ag       BYTE        " This could be a chance to excape.",0
sStory3ah       BYTE        " OR you could stay where you are and wait for a better opportunity.",0
; 2 prompts for story part 3a
sPrompt3aa      BYTE        "...?> Shuffle into Woods",0
sPrompt3ab      BYTE        "...?> Wait for Morning",0

; 12 pushes for story part 3b
; 4 lines of ascii for story part 3b
; !!! USES SAME ASCII AS 3A
; 10 strings for story part 3b
sStory3ba       BYTE        "...!> You push the thievish thought of stealing the key to your shackles out of your head.",0
sStory3bb       BYTE        "After all, that's what got you here in the first place!",0
sStory3bc       BYTE        "The warden approaches you and thanks to you for your assistance.",0
sStory3bd       BYTE        "He checks your shackles, loosens them a tad (not enough to escape but enough to be more comfortable).",0
sStory3be       BYTE        "He gives you a nod and forces his horse to keep taking the cart towards your prison. ",0
sStory3bf       BYTE        "You are carried for many hours down a dirt path and the scenery begins to turn into a deep forest.",0
sStory3bg       BYTE        " After a while, the warden decides to settle for the night. Hours pass and eventually the warden decides to go to sleep.",0
sStory3bh       BYTE        " This time, however, he forgets to assign a guard for night watch! This could be your chance to escape.",0
sStory3bi       BYTE        " With no night watchman, you can attempt to steal the key to your shackles from the sleeping warden, however, he might wake up.",0
sStory3bj       BYTE        " You could also just shuffle into the forest, but much louder and slower.",0
; 2 prompts for story part 3b
sPrompt3ba      BYTE        "...?> Try to Steal the Shackles Key from the Sleeping Warden",0
sPrompt3bb      BYTE        "...?> Shuffle into the Woods",0

; 22 pushes for story part 3c
; 11 lines of ascii for story part 3c
sAscii3ca       BYTE        "  X           XX",0
sAscii3cb       BYTE        "  XX        XXX",0
sAscii3cc       BYTE        "+--XXX----XXX----+",0
sAscii3cd       BYTE        "|       XXX      |",0
sAscii3ce       BYTE        "|   X       X    |",0
sAscii3cf       BYTE        "|   XX      X    |",0
sAscii3cg       BYTE        "|    X      X    |",0
sAscii3ch       BYTE        "|                |",0
sAscii3ci       BYTE        "|       XXXXXX   |",0
sAscii3cj       BYTE        "|    XXXX     XX |",0
sAscii3ck       BYTE        "+----------------+",0
; 9 strings for story part 3c
sStory3ca       BYTE        "...!> You decide you have done enough damage to human lives and yell out to warn the mercenaries.",0
sStory3cb       BYTE        "You muster all of your sickly strength to shout: run away! at the mercenaries.",0
sStory3cc       BYTE        "They glance back form their battles and see a warden collapsed on the ground, you stand where he stood.",0
sStory3cd       BYTE        "It doesn't take a genius to understand what happened, but the mercs are still thankful.",0
sStory3ce       BYTE        "They run off into the woods.",0
sStory3cf       BYTE        "It looks like the highwayman who assisted in killing the warden is dripping with rage.",0
sStory3cg       BYTE        "He is walking towards you. ",0
sStory3ch       BYTE        "He looks very angry.",0
sStory3ci       BYTE        "It looks like you only have two options since fighting is out of the questions.",0
; 2 prompts for story part 3c
sPrompt3ca      BYTE        "...?> Run Away in Your Shackles",0
sPrompt3cb      BYTE        "...?> Wait for Him to Reach You",0

; x pushes for story part 3d
; 12 lines of ascii for story part 3d
sAscii3da       BYTE        "+-------------------+",0
sAscii3db       BYTE        "|                   |",0
sAscii3dc       BYTE        "|                   |",0
sAscii3dd       BYTE        "|    XX         XX  |",0
sAscii3de       BYTE        "|   XXXX       XXXX |",0
sAscii3df       BYTE        "|                   |",0
sAscii3dg       BYTE        "|                   |",0
sAscii3dh       BYTE        "|    XX          X  |",0
sAscii3di       BYTE        "|     XXXX     XX   |",0
sAscii3dj       BYTE        "|         XXXXXX    |",0
sAscii3dk       BYTE        "|                   |",0
sAscii3dl       BYTE        "+-------------------+",0
; x strings for story part 3d
sStory3da       BYTE        "...!> If you're going to be bad might as well be the worst right?",0
sStory3db       BYTE        "You watch the highwayman who killed the warden circle the mercenaries and make quick work of them.",0
sStory3dc       BYTE        "The highwayman turns and approaches you.",0
sStory3dd       BYTE        "He has a deviant glee on your face.",0
sStory3de       BYTE        "There is something unnerving about it.",0
; 2 prompts for story part 3d
sPrompt3da      BYTE        "...?> Run Away in Your Shackles",0
sPrompt3db      BYTE        "...?> Wait for Him to Reach You",0

; x pushes for story part 4a
; 11 lines of ascii for story part 4a
sAscii4aa       BYTE        "                     XXXX",0
sAscii4ab       BYTE        "+--------------------XXXX----+",0
sAscii4ac       BYTE        "|                  X  XX   X |",0
sAscii4ad       BYTE        "| +--+            X  X X XX  |",0
sAscii4ae       BYTE        "| |  +---+---+   X     X     |",0
sAscii4af       BYTE        "| +--+   |   |        X X    |",0
sAscii4ag       BYTE        "|   <----+---+-------X--->X  |",0
sAscii4ah       BYTE        "|                            |",0
sAscii4ai       BYTE        "|                            |",0
sAscii4aj       BYTE        "|                            |",0
sAscii4ak       BYTE        "+----------------------------+",0
; 10 strings for story part 4a
sStory4aa       BYTE        "...!> With key in hand you sit there, contemplating life and your decicions. ",0
sStory4ab       BYTE        "Maybe you belive that by doing nothing you are paying your dues to society.",0
sStory4ac       BYTE        "Maybe you just think that you wont make it.",0
sStory4ad       BYTE        "Regardless, nothing happens and you just sit looking at the stars until morning.",0
sStory4ae       BYTE        "The warden wakes up and is shocked that you are still around.",0
sStory4af       BYTE        "He states that he knew you took the key and was giving you the option to excape the previous night.",0
sStory4ag       BYTE        "He glances at the still asleep mercenaries. ",0
sStory4ah       BYTE        "There is still an opportunity to do so he wispers, his eyes looking into the distance.",0
sStory4ai       BYTE        "He points to a sack of supplies he left out.",0
sStory4aj       BYTE        "It seems like he wants you to take it and run.",0
; 2 prompts for story part 4a
sPrompt4aa      BYTE        "...?> Do You Accept the Standard-Shackle Escape Tools?",0
sPrompt4ab      BYTE        "...?> Stay and Get Taken to Town",0

; x pushes for story part 4b
; 6 lines of ascii for story part 4b
sAscii4ba       BYTE        " XXXXXXXXXXXXXXXXX",0
sAscii4bb       BYTE        " XX                    XXXXXXXXXXX",0
sAscii4bc       BYTE        "   XXXXXXXXX            XXX             XXXXXXX",0
sAscii4bd       BYTE        "           XXXX           XXX            XXX",0
sAscii4be       BYTE        "              XX             XXX            XXXX",0
sAscii4bf       BYTE        "XXXXXXXXXXXXXXXXXX     XXXXXXXXXX        XXXXXXXX",0
; 5 strings for story part 4b
sStory4ba       BYTE        "You creep up to the sleeping warden.",0
sStory4bb       BYTE        "Your heartbeat is the only thing you can hear as you get closer and closer.",0
sStory4bc       BYTE        "You can hear their breath.",0
sStory4bd       BYTE        "You hear a sudden inhale from somewhere in the group.",0
sStory4be       BYTE        "Have your steps awoken someone?",0
; 2 prompts for story part 4b
sPrompt4ba      BYTE        "...?> Stick to the Plan",0
sPrompt4bb      BYTE        "...?> Walk Back Carefully, Holding Your Shackles to Prevent a Sound",0

; x pushes for story part 4c
; 12 lines of ascii for story part 4c
sAscii4ca       BYTE        "+----------------+               XXXXXXXX",0
sAscii4cb       BYTE        "|      ||        |              X     XXXX",0
sAscii4cc       BYTE        "|      ||        |             XX    XX  X",0
sAscii4cd       BYTE        "|      ||     +----+          XX    XX   XX",0
sAscii4ce       BYTE        "+---+-+--+---------|       XXXX     X      X",0
sAscii4cf       BYTE        "    | |  |    |   ||      X        XX       X",0
sAscii4cg       BYTE        "    | |  |    +----+     X         XX       XXX",0
sAscii4ch       BYTE        "    | |  +--+-----+      X          XXX       XXXX",0
sAscii4ci       BYTE        "    | |     |    |       X            X          XX",0
sAscii4cj       BYTE        "    | |     |    |        X         XX            X",0
sAscii4ck       BYTE        "    | |     |    |       XX         X",0
sAscii4cl       BYTE        "    + +     +    +      X          X",0
; 7 strings for story part 4c
sStory4ca       BYTE        "...!> You sneer to yourself and turn to the woods, you're no dummy.",0
sStory4cb       BYTE        "You look around and see a bag of supplies that was ment for the warden and his men.",0
sStory4cc       BYTE        "With barely and thought you pick up the bag and sling it over your back.",0
sStory4cd       BYTE        "In your mind you know that a 7 hour headstart will be more than enough to evade the warden and his men.",0
sStory4ce       BYTE        "With this thought swimming in your head you look to the woods.",0
sStory4cf       BYTE        "Theres a darker path that leads deeper in the forest.",0
sStory4cg       BYTE        "There is a more brambled path that leads up and circles back across the road.",0
; 2 prompts for story part 4c
sPrompt4ca      BYTE        "...?> Dark Path",0
sPrompt4cb      BYTE        "...?> Brambled Path",0

; x pushes for story part 4d
; 12 lines of ascii for story part 4d
sAscii4da       BYTE        "  XXXXXXXXXXXXXXXXXXXX",0
sAscii4db       BYTE        "XXX                 XX    X",0
sAscii4dc       BYTE        "                XXXX   XXX",0
sAscii4dd       BYTE        "               XX       XX",0
sAscii4de       BYTE        "              XX     XXXXXXXX",0
sAscii4df       BYTE        "             XX         XX",0
sAscii4dg       BYTE        "             X         X X",0
sAscii4dh       BYTE        "            XX          X",0
sAscii4di       BYTE        "            X",0
sAscii4dj       BYTE        "            X",0
sAscii4dk       BYTE        "            X",0 ; I know that these 4 strings being the same is needless. It helps me.
sAscii4dl       BYTE        "            X",0
; 7 strings for story part 4d
sStory4da       BYTE        "...!> You desperatly try to shuffle away. The highwayman lets you run.",0
sStory4db       BYTE        "...Until he kicks you in the back while you try to excape.",0
sStory4dc       BYTE        "You tumble down a hill qathering speed. ",0
sStory4dd       BYTE        "As the highwaymen fade from view you cant help but feel that the path you are falling down is darkening, the leaves overhead getting thicker.",0
sStory4de       BYTE        "Maybe it's just youre concience, but you think you can hear wispers. ",0
sStory4df       BYTE        "There looks like there is another path, quite brambly and it loops back on the road already traveled.",0
sStory4dg       BYTE        "However, the dark confines of the forst are almost calling to you...",0
; 2 prompts for story part 4d
sPrompt4da      BYTE        "...?> Seek Your Destiny",0
sPrompt4db      BYTE        "...?> Walk to the Bramble Path",0

; x pushes for story part 4e
; 8 strings for story part 4e
sStory4ea       BYTE        "...!> The angry highwayman approaches.",0
sStory4eb       BYTE        "He drags his weapon on the ground like an executioner about to lop off a convicts head.",0
sStory4ec       BYTE        "This is bad news for you as you are a convict.",0
sStory4ed       BYTE        "You look to your left.",0
sStory4ee       BYTE        "You look to your right.",0
sStory4ef       BYTE        "You look at your options.",0
sStory4eg       BYTE        "Looks like you can stay and be killed,",0
sStory4eh       BYTE        "or roll down a cliff into the forest below.",0
; 2 prompts for story part 4e
sPrompt4ea      BYTE        "...?> Stay and Become a Lot Lighter",0
sPrompt4eb      BYTE        "...?> Make Like a Banana and Split",0

; 5 pushes for story part 5a
; 5 strings for story part 5a
sStory5aa       BYTE        "...!> You decide to risk it. Quickly you wander up and pickup the key with your hand.",0
sStory5ab       BYTE        " It feels cold like the deeds you've done to get here.",0
sStory5ac       BYTE        "With a guilty concience you sneak away and try the key on your locks.",0
sStory5ad       BYTE        " Someone comes whistling and tells you that you should not have done this.",0
sStory5ae       BYTE        " He stabs the key into your eye and kills you... end",0

; 31 pushes for story part 5b
; 9 lines of ascii for story part 5b
sAscii5ba       BYTE        "                        XXXX",0
sAscii5bb       BYTE        "                        XXXXX",0
sAscii5bc       BYTE        "   +---------------+ X   XX",0
sAscii5bd       BYTE        "   |               | XXXXXX",0
sAscii5be       BYTE        " XXXX              |     XXX",0
sAscii5bf       BYTE        "XX | XX          XXXX    X XXX",0
sAscii5bg       BYTE        "X  +--X---------XX-+ X   X    X",0
sAscii5bh       BYTE        "XX   XX         X    X",0
sAscii5bi       BYTE        " XXXXX           XXXXX",0
; 20 strings for story part 5b
sStory5ba       BYTE        "...!> You retreat into the cart back where you where.",0
sStory5bb       BYTE        "You don't know why you did this. ",0
sStory5bc       BYTE        "You are for sure going to get hanged for your past crimes.",0
sStory5bd       BYTE        "Maybe this is a turning point for you and your life.",0
sStory5be       BYTE        "Maybe you just aren't up for it.",0
sStory5bf       BYTE        "Either way, you go back to sleep.",0
sStory5bg       BYTE        "In the morning the warden walks over to you and wakes you up.",0
sStory5bh       BYTE        "Time for a long day on the road... He sneers.",0
sStory5bi       BYTE        "You're picked up and put back into the wagon.",0
sStory5bj       BYTE        "With the lone cart trooping along you eventually come into a terrible worn down town.",0
sStory5bk       BYTE        "It looks like there hasn't been any kind new economic activity here in years.",0
sStory5bl       BYTE        "People line the streets to watch you be carted in like some kind of sick parade.",0
sStory5bm       BYTE        "You see a noose dangling in the distance.",0
sStory5bn       BYTE        "Is this the end for you?",0
sStory5bo       BYTE        "Suddenly the cart is jostled.",0
sStory5bp       BYTE        "Looking left and right you see the crowd isnt just there for show.",0
sStory5bq       BYTE        "They look angry.",0
sStory5br       BYTE        "Really angry.",0
sStory5bs       BYTE        "Your cart is shaken and tipped over.",0
sStory5bt       BYTE        "Looks like you have an opportunity, and that means you have to make a decision. ",0
; 2 prompts for story part 5b
sPrompt5ba      BYTE        "...?> You can Crawl Out of the Cart into the Feat of the Angry Mob.",0
sPrompt5bb      BYTE        "...?> You can Fight With the mob Against the Warden",0

; 21 pushes for story part 5c
; 10 lines of ascii for story part 5c
sAscii5ca       BYTE        "     +",0
sAscii5cb       BYTE        "     |",0
sAscii5cc       BYTE        "     | X",0
sAscii5cd       BYTE        "   X |  X",0
sAscii5ce       BYTE        "  X  |  XX       +------------+",0
sAscii5cf       BYTE        "  XXX|XXXX       |            |",0
sAscii5cg       BYTE        "+------XXX       | +------->  |",0
sAscii5ch       BYTE        "|      X|        |            |",0
sAscii5ci       BYTE        "|       |        +------------+",0
sAscii5cj       BYTE        "+-------+",0
; 9 strings for story part 5c
sStory5ca       BYTE        "...!> You decend into the woods. The path is easy despite your shackles.",0
sStory5cb       BYTE        "The forest almost seems to accept you.",0
sStory5cc       BYTE        "As the leaves get closer and closer to you, you begin to see a glimer in the distance.",0
sStory5cd       BYTE        "You quicken your pace.",0
sStory5ce       BYTE        "You see a war axe placed into a stump.",0
sStory5cf       BYTE        "Its calling to you.",0
sStory5cg       BYTE        "You feel hesistant to approach it.",0
sStory5ch       BYTE        "It seems bad. Real Bad.",0
sStory5ci       BYTE        "You kinda want to leave.",0
sStory5cj       BYTE        "BUT....From the looks of it you could break your chains on this axe....",0
; 2 prompts for story part 5c
sPrompt5ca      BYTE        "...?> Break Your Chains and Grab the Axe",0
sPrompt5cb      BYTE        "...?> Walk Away",0

; 6 pushes for story part 5d
; 4 strings for story part 5d
sStory5da       BYTE        "...!> You go farther into the woods and see a large war axe punched into a stump.",0
sStory5db       BYTE        "It wisper dark secrets into your ear as all suspicious axes should.",0
sStory5dc       BYTE        "It is calling to youuuu.",0
sStory5dd       BYTE        "However, this could be useful in aiding your escape.",0
; 2 prompts for story part 5d
sPrompt5da      BYTE        "...?> However, This Could be Useful in Aiding Your Escape.",0
sPrompt5db      BYTE        "...?> Run Away",0

; 18 pushes for story part 5e
; 9 lines of ascii for story part 5e
sAscii5ea       BYTE        "                       X",0
sAscii5eb       BYTE        "                      X X",0
sAscii5ec       BYTE        "                     X    X",0
sAscii5ed       BYTE        "    XXX             X      X",0
sAscii5ee       BYTE        "   X  X X           XXXXXXXXX",0
sAscii5ef       BYTE        "  X    X            X       X",0
sAscii5eg       BYTE        "  X    X            X       X",0
sAscii5eh       BYTE        "  X    X            X       X",0
sAscii5ei       BYTE        "  X    X            X       X",0
; 9 strings for story part 5e
sStory5ea       BYTE        "...!> You decide the forest is too spooky and begin to climb the brambled path.",0
sStory5eb       BYTE        "It's exhasusting work. ",0
sStory5ec       BYTE        "But maybe it's worth it?",0
sStory5ed       BYTE        "As you climb and climb you cant help but reflect on they journey you have had so far.",0
sStory5ee       BYTE        "The moment passes and over the hills that you have been climbing you see a city in the distance.",0
sStory5ef       BYTE        "Low on food and with no where to go, it looks like this is your only option.",0
sStory5eg       BYTE        "You start to walk twords the city.",0
sStory5eh       BYTE        "To new beginnings.",0
sStory5ei       BYTE        "Hopefully your past decisions wont haunt you...",0

; 9 pushes for story part 5f
; 9 strings for story part 5f
sStory5fa       BYTE        "...!> You walk along the brambled path still in your shackles.",0
sStory5fb       BYTE        "This is the definition of misery you think to yourself.",0
sStory5fc       BYTE        "Suddenly you see a  glimmer ahead of you.",0
sStory5fd       BYTE        "It looks like it is a brilliant city, with bustling streets, far below.",0
sStory5fe       BYTE        "This must be the city you where supposed to be taken to.",0
sStory5ff       BYTE        "If only the cains that bound you would fall off so you could begin anew.",0
sStory5fg       BYTE        "Sadly, that wont happen.",0
sStory5fh       BYTE        "You sadly trudge ao the trail.",0
sStory5fi       BYTE        "Hopefully you will find santurary somethere...",0

; 16 pushes for story part 5g
; 12 lines of ascii for story part 5g
sAscii5ga       BYTE        "         XXXX",0
sAscii5gb       BYTE        "     XXX  X XX",0
sAscii5gc       BYTE        "    X X    XXX",0
sAscii5gd       BYTE        "    X     X X    X",0
sAscii5ge       BYTE        "    XXXX   X  XXX",0
sAscii5gf       BYTE        "            XXX",0
sAscii5gg       BYTE        " XXX   X   X",0
sAscii5gh       BYTE        "   XXXX   XX",0
sAscii5gi       BYTE        "      X   X",0
sAscii5gj       BYTE        "      X  XX",0
sAscii5gk       BYTE        "      X   X",0
sAscii5gl       BYTE        "XXXXXX    XX XXX",0
; 4 strings for story part 5g
sStory5ga       BYTE        "...!> The highwayman reaches up and pulls a massive axe off his back.",0
sStory5gb       BYTE        "With one big swing he chopps you in half.",0
sStory5gc       BYTE        "Thats all folks.",0
sStory5gd       BYTE        "A fitting end to a thief don't you think...",0

; 5 pushes for story part 5h
; 5 strings for story part 5h
sStory5ha       BYTE        "...!> The highwayman yells to you. Telling you how slow you are.",0
sStory5hb       BYTE        "You run, and run, and run.",0
sStory5hc       BYTE        "You hear his yells getting louder.",0
sStory5hd       BYTE        "You can feel his aggression.",0
sStory5he       BYTE        "He catches up to you...",0

; 18 pushes for story part 6a
; 12 lines of ascii for story part 6a
sAscii6aa       BYTE        "       XX   X",0
sAscii6ab       BYTE        "      X      X",0
sAscii6ac       BYTE        "      XX    XX",0
sAscii6ad       BYTE        "      XXXXXXXX",0
sAscii6ae       BYTE        "      XX  X XX",0
sAscii6af       BYTE        "      X   X  X",0
sAscii6ag       BYTE        "X      X  X X",0
sAscii6ah       BYTE        "XX        X",0
sAscii6ai       BYTE        "XXXXXXXXXXXX",0
sAscii6aj       BYTE        "XXXXXXXXXXXX",0
sAscii6ak       BYTE        "          X",0
sAscii6al       BYTE        "          X",0
; 6 strings for story part 6a
sStory6aa       BYTE        "...!> The dark axe attracts you.",0
sStory6ab       BYTE        "You reach for it.",0
sStory6ac       BYTE        "It draws you in.",0
sStory6ad       BYTE        "You grab the axe and smash your chains.",0
sStory6ae       BYTE        "Evil power flows through you.",0
sStory6af       BYTE        "You are completely corrupted and turn into a demon...",0

; 21 pushes for story part 6b
; 15 lines of ascii for story part 6b
sAscii6ba       BYTE        "                              XXX      XXXXXXX",0
sAscii6bb       BYTE        "                 XXX        XXX XXXX   XX     XXXX",0
sAscii6bc       BYTE        " XXXXXX        XXX XXXX   XXX      X    X        X",0
sAscii6bd       BYTE        "XX    X        X      XX XX       XX    X       XX",0
sAscii6be       BYTE        "X              X       XXX       XX    XX      XX",0
sAscii6bf       BYTE        "XX     XXXX    XX      X XXXXXXXXX     X     XXX",0
sAscii6bg       BYTE        " XX      X      XXXX XX                 XXXXXX",0
sAscii6bh       BYTE        "   XXXXXXX         XXX",0
sAscii6bi       BYTE        "           XXXXXX          XXX         XXXXXXXX",0
sAscii6bj       BYTE        "                XXXXX     XX  XX       X    XX",0
sAscii6bk       BYTE        "               XX        XX    XX      X XXXX",0
sAscii6bl       BYTE        "           X  XX         XX    XX      X XX XXX",0
sAscii6bm       BYTE        "           XXXX           XXXXXX      XX      XX",0
sAscii6bn       BYTE        "                                        XX     XX",0
sAscii6bo       BYTE        "                                        XXXXXX",0
;  strings for story part 6b
sStory6ba       BYTE        "...!> A sudden change of heart sways you away from the axe.",0
sStory6bb       BYTE        "You begin to back away and feel the effects of the dark weapon shrink.",0
sStory6bc       BYTE        "It knows you have made a choice.",0
sStory6bd       BYTE        "You walk deeper into the woods.",0
sStory6be       BYTE        "Maybe there is a weapon that isn't so evil?",0
sStory6bf       BYTE        "regardless, youll need something in the journey to come...",0

; 12 pushes for story part 7a
; 8 lines of ascii for story part 7a
sAscii7aa       BYTE        "         XX",0
sAscii7ab       BYTE        "         XX",0
sAscii7ac       BYTE        "         XX",0
sAscii7ad       BYTE        "         XXXXX",0
sAscii7ae       BYTE        "      x",0
sAscii7af       BYTE        "  X  X   +----+",0
sAscii7ag       BYTE        " XXXXXXXX| XX |",0
sAscii7ah       BYTE        "XX   X   +----+",0
; 4 strings for story part 7a
sStory7aa       BYTE        "...!> You get crushed underfoot instantly.",0
sStory7ab       BYTE        "People jostle all over you. ",0
sStory7ac       BYTE        "Maybe they cant hear your screams or dont care.",0
sStory7ad       BYTE        "Ouch...",0

; 11 pushes for story part 7b
; 6 lines of ascii for story part 7b
sAscii7ba       BYTE        "    X   X   X",0
sAscii7bb       BYTE        "  XXXX X X  XX",0
sAscii7bc       BYTE        "XX    X   XX XX",0
sAscii7bd       BYTE        "X             X",0
sAscii7be       BYTE        "X             X",0
sAscii7bf       BYTE        "XXXXXXXXXXXXXXX",0
; 5 strings for story part 7b
sStory7ba       BYTE        "...!> You decide it's time to stick it to the man!",0
sStory7bb       BYTE        "You raise your shackled arms and prepeare to fight.",0
sStory7bc       BYTE        "With the assistance of the mob you beat up the warden and the mercenaries.",0
sStory7bd       BYTE        "The mob frees you and you are now a champion of the people.",0
sStory7be       BYTE        "Huzzah....",0



sName           BYTE        20      DUP(0)

dBalance        DWORD       ?
dNameL          DWORD       ?

;==============================================================================;



.code
;==============================================================================;
main PROC
    push    OFFSET sName
    push    OFFSET sGreetings
    push    OFFSET sPromptForName
    push    OFFSET sAuthor
    push    OFFSET sTitle
    call    Introduction

    push    OFFSET sBadInput
    push    dBalance

    ; no prompts for story part 7b
    push    OFFSET sStory7ba
    push    OFFSET sStory7ba
    push    OFFSET sStory7ba
    push    OFFSET sStory7ba
    push    OFFSET sStory7ba
    ; 5 strings for story part 7b
    push    OFFSET sAscii7ba
    push    OFFSET sAscii7ba
    push    OFFSET sAscii7ba
    push    OFFSET sAscii7ba
    push    OFFSET sAscii7ba
    push    OFFSET sAscii7ba
    ; 6 lines of ascii for story part 7b

    ; no prompts for story part 7a
    push    OFFSET sStory7ad
    push    OFFSET sStory7ac
    push    OFFSET sStory7ab
    push    OFFSET sStory7aa
    ; 4 strings for story part 7a
    push    OFFSET sAscii7ah
    push    OFFSET sAscii7ag
    push    OFFSET sAscii7af
    push    OFFSET sAscii7ae
    push    OFFSET sAscii7ad
    push    OFFSET sAscii7ac
    push    OFFSET sAscii7ab
    push    OFFSET sAscii7aa
    ; 8 lines of ascii for story part 7a

    ; no prompts for story part 6b
    push    OFFSET sStory6bf
    push    OFFSET sStory6be
    push    OFFSET sStory6bd
    push    OFFSET sStory6bc
    push    OFFSET sStory6bb
    push    OFFSET sStory6ba
    ; 6 strings for story part 6b
    push    OFFSET sAscii6bo
    push    OFFSET sAscii6bn
    push    OFFSET sAscii6bm
    push    OFFSET sAscii6bl
    push    OFFSET sAscii6bk
    push    OFFSET sAscii6bj
    push    OFFSET sAscii6bi
    push    OFFSET sAscii6bh
    push    OFFSET sAscii6bg
    push    OFFSET sAscii6bf
    push    OFFSET sAscii6be
    push    OFFSET sAscii6bd
    push    OFFSET sAscii6bc
    push    OFFSET sAscii6bb
    push    OFFSET sAscii6ba
    ; 15 lines of ascii for story part 6b

    ; no prompts for story part 6a
    push    OFFSET sStory6af
    push    OFFSET sStory6ae
    push    OFFSET sStory6ad
    push    OFFSET sStory6ac
    push    OFFSET sStory6ab
    push    OFFSET sStory6aa
    ; 6 strings for story part 6a
    push    OFFSET sAscii6al
    push    OFFSET sAscii6ak
    push    OFFSET sAscii6aj
    push    OFFSET sAscii6ai
    push    OFFSET sAscii6ah
    push    OFFSET sAscii6ag
    push    OFFSET sAscii6af
    push    OFFSET sAscii6ae
    push    OFFSET sAscii6ad
    push    OFFSET sAscii6ac
    push    OFFSET sAscii6ab
    push    OFFSET sAscii6aa
    ; 12 lines of ascii for story part 6a

    ; no prompts for story part 5h
    push    OFFSET sStory5he
    push    OFFSET sStory5hd
    push    OFFSET sStory5hc
    push    OFFSET sStory5hb
    push    OFFSET sStory5ha
    ; 5 strings for story part 5h
    ; no lines of ascii for story part 5h

    ; no prompts for story part 5g
    push    OFFSET sStory5gd
    push    OFFSET sStory5gc
    push    OFFSET sStory5gb
    push    OFFSET sStory5ga
    ; 4 strings for story part 5g
    push    OFFSET sAscii5gl
    push    OFFSET sAscii5gk
    push    OFFSET sAscii5gj
    push    OFFSET sAscii5gi
    push    OFFSET sAscii5gh
    push    OFFSET sAscii5gg
    push    OFFSET sAscii5gf
    push    OFFSET sAscii5ge
    push    OFFSET sAscii5gd
    push    OFFSET sAscii5gc
    push    OFFSET sAscii5gb
    push    OFFSET sAscii5ga
    ; 12 lines of ascii for story part 5g

    ; no prompts for story part 5f
    push    OFFSET sStory5fi
    push    OFFSET sStory5fh
    push    OFFSET sStory5fg
    push    OFFSET sStory5ff
    push    OFFSET sStory5fe
    push    OFFSET sStory5fd
    push    OFFSET sStory5fc
    push    OFFSET sStory5fb
    push    OFFSET sStory5fa
    ; 9 strings for story part 5f
    ; no lines of ascii for story part 5f

    ; no prompts for story part 5e
    push    OFFSET sStory5ei
    push    OFFSET sStory5eh
    push    OFFSET sStory5eg
    push    OFFSET sStory5ef
    push    OFFSET sStory5ee
    push    OFFSET sStory5ed
    push    OFFSET sStory5ec
    push    OFFSET sStory5eb
    push    OFFSET sStory5ea
    ; 9 strings for story part 5e
    push    OFFSET sAscii5ei
    push    OFFSET sAscii5eh
    push    OFFSET sAscii5eg
    push    OFFSET sAscii5ef
    push    OFFSET sAscii5ed
    push    OFFSET sAscii5ed
    push    OFFSET sAscii5ec
    push    OFFSET sAscii5eb
    push    OFFSET sAscii5ea
    ; 9 lines of ascii for story part 5e

    ; no 5d for my sanity

    push    OFFSET sPrompt5cb
    push    OFFSET sPrompt5ca
    ; 2 prompts for story part 5c
    push    OFFSET sStory5cj
    push    OFFSET sStory5ci
    push    OFFSET sStory5ch
    push    OFFSET sStory5cg
    push    OFFSET sStory5cf
    push    OFFSET sStory5ce
    push    OFFSET sStory5cd
    push    OFFSET sStory5cc
    push    OFFSET sStory5cb
    push    OFFSET sStory5ca
    ; 10 strings for story part 5c
    push    OFFSET sAscii5cj
    push    OFFSET sAscii5ci
    push    OFFSET sAscii5ch
    push    OFFSET sAscii5cg
    push    OFFSET sAscii5cf
    push    OFFSET sAscii5ce
    push    OFFSET sAscii5cd
    push    OFFSET sAscii5cc
    push    OFFSET sAscii5cb
    push    OFFSET sAscii5ca
    ; 10 lines of ascii for story part 5c

    push    OFFSET sPrompt5bb
    push    OFFSET sPrompt5ba
    ; 2 prompts for story part 5b
    push    OFFSET sStory5bt
    push    OFFSET sStory5bs
    push    OFFSET sStory5br
    push    OFFSET sStory5bq
    push    OFFSET sStory5bp
    push    OFFSET sStory5bo
    push    OFFSET sStory5bn
    push    OFFSET sStory5bm
    push    OFFSET sStory5bl
    push    OFFSET sStory5bk
    push    OFFSET sStory5bj
    push    OFFSET sStory5bi
    push    OFFSET sStory5bh
    push    OFFSET sStory5bg
    push    OFFSET sStory5bf
    push    OFFSET sStory5be
    push    OFFSET sStory5bd
    push    OFFSET sStory5bc
    push    OFFSET sStory5bb
    push    OFFSET sStory5ba
    ; 20 strings for story part 5b
    push    OFFSET sAscii5bi
    push    OFFSET sAscii5bh
    push    OFFSET sAscii5bg
    push    OFFSET sAscii5bf
    push    OFFSET sAscii5be
    push    OFFSET sAscii5bd
    push    OFFSET sAscii5bc
    push    OFFSET sAscii5bb
    push    OFFSET sAscii5ba
    ; 9 lines of ascii for story part 5b

    ; no prompts for story part 5a
    push    OFFSET sStory5ae
    push    OFFSET sStory5ad
    push    OFFSET sStory5ac
    push    OFFSET sStory5ab
    push    OFFSET sStory5aa
    ; 5 strings for story part 5a
    ; no lines of ascii for story part 5a

    push    OFFSET sPrompt4eb
    push    OFFSET sPrompt4ea
    ; 2 prompts for story part 4e
    push    OFFSET sStory4eh
    push    OFFSET sStory4eg
    push    OFFSET sStory4ef
    push    OFFSET sStory4ee
    push    OFFSET sStory4ed
    push    OFFSET sStory4ec
    push    OFFSET sStory4eb
    push    OFFSET sStory4ea
    ; 8 strings for story part 4e
    ; no lines of ascii for story part 4e

    push    OFFSET sPrompt4db
    push    OFFSET sPrompt4da
    ; 2 prompts for story part 4d
    push    OFFSET sStory4dg
    push    OFFSET sStory4df
    push    OFFSET sStory4de
    push    OFFSET sStory4dd
    push    OFFSET sStory4dc
    push    OFFSET sStory4db
    push    OFFSET sStory4da
    ; 7 strings for story part 4d
    push    OFFSET sAscii4dl
    push    OFFSET sAscii4dk
    push    OFFSET sAscii4dj
    push    OFFSET sAscii4di
    push    OFFSET sAscii4dh
    push    OFFSET sAscii4dg
    push    OFFSET sAscii4df
    push    OFFSET sAscii4de
    push    OFFSET sAscii4dd
    push    OFFSET sAscii4dc
    push    OFFSET sAscii4db
    push    OFFSET sAscii4da
    ; 12 lines of ascii for story part 4d

    push    OFFSET sPrompt4cb
    push    OFFSET sPrompt4ca
    ; 2 prompts for story part 4c
    push    OFFSET sStory4cg
    push    OFFSET sStory4cf
    push    OFFSET sStory4ce
    push    OFFSET sStory4cd
    push    OFFSET sStory4cc
    push    OFFSET sStory4cb
    push    OFFSET sStory4ca
    ; 7 strings for story part 4c
    push    OFFSET sAscii4cl
    push    OFFSET sAscii4ck
    push    OFFSET sAscii4cj
    push    OFFSET sAscii4ci
    push    OFFSET sAscii4ch
    push    OFFSET sAscii4cg
    push    OFFSET sAscii4cf
    push    OFFSET sAscii4ce
    push    OFFSET sAscii4cd
    push    OFFSET sAscii4cc
    push    OFFSET sAscii4cb
    push    OFFSET sAscii4ca
    ; 12 lines of ascii for story part 4c

    push    OFFSET sPrompt4bb
    push    OFFSET sPrompt4ba
    ; 2 prompts for story part 4b
    push    OFFSET sStory4be
    push    OFFSET sStory4bd
    push    OFFSET sStory4bc
    push    OFFSET sStory4bb
    push    OFFSET sStory4ba
    ; 5 strings for story part 4b
    push    OFFSET sAscii4bf
    push    OFFSET sAscii4be
    push    OFFSET sAscii4bd
    push    OFFSET sAscii4bc
    push    OFFSET sAscii4bb
    push    OFFSET sAscii4ba
    ; 6 lines of ascii for story part 4b

    push    OFFSET sPrompt4ab
    push    OFFSET sPrompt4aa
    ; 2 prompts for story part 4a
    push    OFFSET sStory4aj
    push    OFFSET sStory4ai
    push    OFFSET sStory4ah
    push    OFFSET sStory4ag
    push    OFFSET sStory4af
    push    OFFSET sStory4ae
    push    OFFSET sStory4ad
    push    OFFSET sStory4ac
    push    OFFSET sStory4ab
    push    OFFSET sStory4aa
    ; 10 strings for story part 4a
    push    OFFSET sAscii4ak
    push    OFFSET sAscii4aj
    push    OFFSET sAscii4ai
    push    OFFSET sAscii4ah
    push    OFFSET sAscii4ag
    push    OFFSET sAscii4af
    push    OFFSET sAscii4ae
    push    OFFSET sAscii4ad
    push    OFFSET sAscii4ac
    push    OFFSET sAscii4ab
    push    OFFSET sAscii4aa
    ; 11 lines of ascii for story part 4a

    push    OFFSET sPrompt3db
    push    OFFSET sPrompt3da
    ; 2 prompts for story part 3d
    push    OFFSET sStory3de
    push    OFFSET sStory3dd
    push    OFFSET sStory3dc
    push    OFFSET sStory3db
    push    OFFSET sStory3da
    ; 5 strings for story part 3d
    push    OFFSET sAscii3dl
    push    OFFSET sAscii3dk
    push    OFFSET sAscii3dj
    push    OFFSET sAscii3di
    push    OFFSET sAscii3dh
    push    OFFSET sAscii3dg
    push    OFFSET sAscii3df
    push    OFFSET sAscii3de
    push    OFFSET sAscii3dd
    push    OFFSET sAscii3dc
    push    OFFSET sAscii3db
    push    OFFSET sAscii3da
    ; 12 lines of ascii for story part 3d

    push    OFFSET sPrompt3cb
    push    OFFSET sPrompt3ca
    ; 2 prompts for story part 3c
    push    OFFSET sStory3ci
    push    OFFSET sStory3ch
    push    OFFSET sStory3cg
    push    OFFSET sStory3cf
    push    OFFSET sStory3ce
    push    OFFSET sStory3cd
    push    OFFSET sStory3cc
    push    OFFSET sStory3cb
    push    OFFSET sStory3ca
    ; 9 strings for story part 3c
    push    OFFSET sAscii3ck
    push    OFFSET sAscii3cj
    push    OFFSET sAscii3ci
    push    OFFSET sAscii3ch
    push    OFFSET sAscii3cg
    push    OFFSET sAscii3cf
    push    OFFSET sAscii3ce
    push    OFFSET sAscii3cd
    push    OFFSET sAscii3cc
    push    OFFSET sAscii3cb
    push    OFFSET sAscii3ca
    ; 11 lines of ascii for story part 3c

    push    OFFSET sPrompt3bb
    push    OFFSET sPrompt3ba
    ; 2 prompts for story part 3b
    push    OFFSET sStory3bj
    push    OFFSET sStory3bi
    push    OFFSET sStory3bh
    push    OFFSET sStory3bg
    push    OFFSET sStory3bf
    push    OFFSET sStory3be
    push    OFFSET sStory3bd
    push    OFFSET sStory3bc
    push    OFFSET sStory3bb
    push    OFFSET sStory3ba
    ; 10 strings for story part 3b
    push    OFFSET sAscii3ad
    push    OFFSET sAscii3ac
    push    OFFSET sAscii3ab
    push    OFFSET sAscii3aa
    ; 4 lines of ascii for story part 3b

    push    OFFSET sPrompt3ab
    push    OFFSET sPrompt3aa
    ; 2 prompts for story part 3a
    push    OFFSET sStory3ah
    push    OFFSET sStory3ag
    push    OFFSET sStory3af
    push    OFFSET sStory3ae
    push    OFFSET sStory3ad
    push    OFFSET sStory3ac
    push    OFFSET sStory3ab
    push    OFFSET sStory3aa
    ; 8 strings for story part 3a
    push    OFFSET sAscii3ad
    push    OFFSET sAscii3ac
    push    OFFSET sAscii3ab
    push    OFFSET sAscii3aa
    ; 4 lines of ascii for story part 3a

    push    OFFSET sPrompt3ab
    push    OFFSET sPrompt3aa
    ; 2 prompts for story part 2b
    push    OFFSET sStory2bk
    push    OFFSET sStory2bj
    push    OFFSET sStory2bi
    push    OFFSET sStory2bh
    push    OFFSET sStory2bg
    push    OFFSET sStory2bf
    push    OFFSET sStory2be
    push    OFFSET sStory2bd
    push    OFFSET sStory2bc
    push    OFFSET sStory2bb
    push    OFFSET sStory2ba
    ; 11 strings for story part 2b
    push    OFFSET sAscii2bf
    push    OFFSET sAscii2be
    push    OFFSET sAscii2bd
    push    OFFSET sAscii2bc
    push    OFFSET sAscii2bb
    push    OFFSET sAscii2ba
    ; 6 lines of ascii for story part 2b

    push    OFFSET sPrompt2ab
    push    OFFSET sPrompt2aa
    ; 2 prompts for story part 2a
    push    OFFSET sStory2ae
    push    OFFSET sStory2ad
    push    OFFSET sStory2ac
    push    OFFSET sStory2ab
    push    OFFSET sStory2aa
    ; 5 strings for story part 2a
    push    OFFSET sAscii2ae
    push    OFFSET sAscii2ad
    push    OFFSET sAscii2ac
    push    OFFSET sAscii2ab
    push    OFFSET sAscii2aa
    ; 5 lines of ascii for story part 2a

    push    OFFSET sDecision
    ; 1 Decision
    push    OFFSET sPrompt1a
    push    OFFSET sPrompt1b
    ; 2 prompts for story part 1 (origin)
    push    OFFSET sStory1i
    push    OFFSET sStory1h
    push    OFFSET sStory1g
    push    OFFSET sStory1f
    push    OFFSET sStory1e
    push    OFFSET sStory1d
    push    OFFSET sStory1c
    push    OFFSET sStory1b
    push    OFFSET sStory1a
    ; 9 strings for story part 1 (origin)
    push    OFFSET sAscii1e
    push    OFFSET sAscii1d
    push    OFFSET sAscii1c
    push    OFFSET sAscii1b
    push    OFFSET sAscii1a
    ; 5 lines of ascii for story part 1 (origin)
    call    StoryOrigin ; This will have almost everything pushed to it. 

    push    OFFSET sName
    push    OFFSET sGoodbye
    call    Goodbye

    exit

main ENDP

Introduction PROC
    push    EBP
    mov     EBP,            ESP

    mov     EDX,            [EBP+8]
    call    WriteString
    call    Crlf

    mov     EDX,            [EBP+12]
    call    WriteString
    call    Crlf

    mov     EDX,            [EBP+16]
    call    WriteString
    call    Crlf

    mov     EDX,            [EBP+20]
    call    WriteString
    
    mov     EDX,            [EBP+24]
    mov     ECX,            20
    call    ReadString
    mov     dNameL,         EAX

    pop     EBP

    ret     20
Introduction ENDP


StoryOrigin PROC
    push    EBP
    mov     EBP,            ESP

    Input:
        ; 5 ascii
        mov     EDX,            [EBP+8]
        call    WriteString
        call    Crlf
        mov     EDX,            [EBP+12]
        call    WriteString
        call    Crlf
        mov     EDX,            [EBP+16]
        call    WriteString
        call    Crlf
        mov     EDX,            [EBP+20]
        call    WriteString
        call    Crlf
        mov     EDX,            [EBP+24]
        call    WriteString
        call    Crlf
        ; 9 storylines
        mov     EDX,            [EBP+28]
        call    WriteString
        call    Crlf
        mov     EDX,            [EBP+32]
        call    WriteString
        call    Crlf
        mov     EDX,            [EBP+36]
        call    WriteString
        call    Crlf
        mov     EDX,            [EBP+40]
        call    WriteString
        call    Crlf
        mov     EDX,            [EBP+44]
        call    WriteString
        call    Crlf
        mov     EDX,            [EBP+48]
        call    WriteString
        call    Crlf
        mov     EDX,            [EBP+52]
        call    WriteString
        call    Crlf
        mov     EDX,            [EBP+56]
        call    WriteString
        call    Crlf
        mov     EDX,            [EBP+60]
        call    WriteString
        call    Crlf
        ; 2 prompts/options
        mov     EDX,            [EBP+64]
        call    WriteString
        call    Crlf
        mov     EDX,            [EBP+68]
        call    WriteString
        call    Crlf

        ; 1 Decision
        mov     EDX,            [EBP+72]
        call    WriteString
        call    Crlf

        call    ReadInt

        cmp     EAX,            1
        je      L2a
        cmp     EAX,            2
        je      L2b
        jmp     IncorrectInput

    LeaveGame:
        ret     1508 ; This will return a LOT, but will only get triggered
                ;       after rest of functions are returning.
                ; Ples don't give me sheyt

    IncorrectInput:
        mov     EDX,                 [EBP+1512]
        call    WriteString
        call    Crlf
        jmp     Input
    L2a:
        pop     EBP
        call    Story2a
        jmp     LeaveGame
    L2b:
        pop     EBP
        call    Story2b
        jmp     LeaveGame
StoryOrigin ENDP


Story2a PROC
    push    EBP
    mov     EBP,            ESP


    call    ClrScr
    ; 5 ascii
    mov     EDX,            [EBP+76]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+80]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+84]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+88]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+92]
    call    WriteString
    call    Crlf
    ;5 storylines
    mov     EDX,            [EBP+96]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+100]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+104]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+108]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+112]
    call    WriteString
    call    Crlf
    ;2 prompts
    mov     EDX,            [EBP+116]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+120]
    call    WriteString
    call    Crlf

    Input:
        mov     EDX,            [EBP+72]
        call    WriteString
        call    Crlf
        call    ReadInt

        cmp     EAX,            1
        je      L3a
        cmp     EAX,            2
        je      L3b
        jmp     IncorrectInput

    LeaveFunc:
        ret

    IncorrectInput:
        mov     EDX,                 [EBP+1512]
        call    WriteString
        call    Crlf
        jmp     Input
    L3a:
        pop     EBP
        call    Story3a
        jmp     LeaveFunc
    L3b:
        pop     EBP
        call    Story3b
        jmp     LeaveFunc
Story2a ENDP


Story2b PROC
    push    EBP
    mov     EBP,            ESP

    call    ClrScr
    ; 6 ascii
    mov     EDX,            [EBP+124]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+128]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+132]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+136]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+140]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+144]
    call    WriteString
    call    Crlf
    ; 11 storylines
    mov     EDX,            [EBP+148]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+152]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+156]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+160]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+164]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+168]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+172]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+176]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+180]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+184]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+188]
    call    WriteString
    call    Crlf
    ; 2 prompts
    mov     EDX,            [EBP+192]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+196]
    call    WriteString
    call    Crlf

    Input:
        mov     EDX,            [EBP+72]
        call    WriteString
        call    ReadInt

        cmp     EAX,            1
        je      L3c
        cmp     EAX,            2
        je      L3d
        jmp     IncorrectInput

    LeaveFunc:
        ret

    IncorrectInput:
        mov     EDX,                 [EBP+1512]
        call    WriteString
        call    Crlf
        jmp     Input
    L3c:
        pop     EBP
        call    Story3c
        jmp     LeaveFunc
    L3d:
        pop     EBP
        call    Story3d
        jmp     LeaveFunc
Story2b ENDP


Story3a PROC
    push    EBP
    mov     EBP,            ESP

    call    ClrScr
    ; 4 ascii
    mov     EDX,            [EBP+200]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+204]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+208]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+212]
    call    WriteString
    call    Crlf
    ; 8 storylines
    mov     EDX,            [EBP+216]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+220]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+224]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+228]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+232]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+236]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+240]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+244]
    call    WriteString
    call    Crlf
    ; 2 prompts
    mov     EDX,            [EBP+248]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+252]
    call    WriteString
    call    Crlf

    Input:
        mov     EDX,            [EBP+72]
        call    WriteString
        call    ReadInt

        cmp     EAX,            1
        je      L4c
        cmp     EAX,            2
        je      L4a
        jmp     IncorrectInput

    LeaveFunc:
        ret

    IncorrectInput:
        mov     EDX,                 [EBP+1512]
        call    WriteString
        call    Crlf
        jmp     Input
    L4c:
        pop     EBP
        call    Story4c
        jmp     LeaveFunc
    L4a:
        pop     EBP
        call    Story4a
        jmp     LeaveFunc
Story3a ENDP


Story3b PROC
    push    EBP
    mov     EBP,            ESP

    call    ClrScr
    ; 4 ascii
    mov     EDX,            [EBP+256]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+260]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+264]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+268]
    call    WriteString
    call    Crlf
    ; 10 storylines
    mov     EDX,            [EBP+272]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+276]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+280]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+284]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+288]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+292]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+296]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+300]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+304]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+308]
    call    WriteString
    call    Crlf
    ; 2 prompts
    mov     EDX,            [EBP+312]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+316]
    call    WriteString
    call    Crlf

    Input:
        mov     EDX,            [EBP+72]
        call    WriteString
        call    ReadInt

        cmp     EAX,            1
        je      L4b
        cmp     EAX,            2
        je      L4c
        jmp     IncorrectInput

    LeaveFunc:
        ret

    IncorrectInput:
        mov     EDX,                 [EBP+1512]
        call    WriteString
        call    Crlf
        jmp     Input
    L4b:
        pop     EBP
        call    Story4b
        jmp     LeaveFunc
    L4c:
        pop     EBP
        call    Story4c
        jmp     LeaveFunc
Story3b ENDP


Story3c PROC
    push    EBP
    mov     EBP,            ESP

    call    ClrScr
    ; 11 ascii
    mov     EDX,            [EBP+320]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+324]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+328]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+332]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+336]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+340]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+344]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+348]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+352]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+356]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+360]
    call    WriteString
    call    Crlf
    ; 9 storylines
    mov     EDX,            [EBP+364]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+368]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+372]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+376]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+380]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+384]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+388]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+392]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+396]
    call    WriteString
    call    Crlf
    ; 2 prompts
    mov     EDX,            [EBP+400]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+404]
    call    WriteString
    call    Crlf

    Input:
        mov     EDX,            [EBP+72]
        call    WriteString
        call    ReadInt

        cmp     EAX,            1
        je      L4d
        cmp     EAX,            2
        je      L4e
        jmp     IncorrectInput

    LeaveFunc:
        ret

    IncorrectInput:
        mov     EDX,                 [EBP+1512]
        call    WriteString
        call    Crlf
        jmp     Input
    L4d:
        pop     EBP
        call    Story4d
        jmp     LeaveFunc
    L4e:
        pop     EBP
        call    Story4e
        jmp     LeaveFunc
Story3c ENDP

Story3d PROC
    push    EBP
    mov     EBP,            ESP

    call    ClrScr
    ; 12 ascii
    mov     EDX,            [EBP+408]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+412]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+416]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+420]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+424]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+428]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+432]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+436]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+440]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+444]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+448]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+452]
    call    WriteString
    call    Crlf
    ; 5 storylines
    mov     EDX,            [EBP+456]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+460]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+464]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+468]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+472]
    call    WriteString
    call    Crlf
    ; 2 prompts
    mov     EDX,            [EBP+476]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+480]
    call    WriteString
    call    Crlf

    Input:
        mov     EDX,            [EBP+72]
        call    WriteString
        call    ReadInt

        cmp     EAX,            1
        je      L4d
        cmp     EAX,            2
        je      L4e
        jmp     IncorrectInput

    LeaveFunc:
        ret

    IncorrectInput:
        mov     EDX,                 [EBP+1508]
        call    WriteString
        call    Crlf
        jmp     Input
    L4d:
        pop     EBP
        call    Story4d
        jmp     LeaveFunc
    L4e:
        pop     EBP
        call    Story4e
        jmp     LeaveFunc
Story3d ENDP


Story4a PROC
    push    EBP
    mov     EBP,            ESP

    call    ClrScr
    ; 11 ascii
    mov     EDX,            [EBP+484]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+488]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+492]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+496]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+500]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+504]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+508]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+512]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+516]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+520]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+524]
    call    WriteString
    call    Crlf
    ; 10 storylines
    mov     EDX,            [EBP+528]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+532]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+536]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+540]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+544]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+548]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+552]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+556]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+560]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+564]
    call    WriteString
    call    Crlf
    ; 2 prompts
    mov     EDX,            [EBP+568]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+572]
    call    WriteString
    call    Crlf

    Input:
        mov     EDX,            [EBP+72]
        call    WriteString
        call    ReadInt

        cmp     EAX,            1
        je      L5c
        cmp     EAX,            2
        je      L5e
        jmp     IncorrectInput

    LeaveFunc:
        ret

    IncorrectInput:
        mov     EDX,                 [EBP+1508]
        call    WriteString
        call    Crlf
        jmp     Input
    L5c:
        pop     EBP
        call    Story5c
        jmp     LeaveFunc
    L5e:
        pop     EBP
        call    Story5e
        jmp     LeaveFunc
Story4a ENDP


Story4b PROC
    push    EBP
    mov     EBP,            ESP

    call    ClrScr
    ; 6 ascii
    mov     EDX,            [EBP+576]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+580]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+584]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+588]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+592]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+596]
    call    WriteString
    call    Crlf
    ; 5 storylines
    mov     EDX,            [EBP+600]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+604]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+608]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+612]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+616]
    call    WriteString
    call    Crlf
    ; 2 prompts
    mov     EDX,            [EBP+620]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+624]
    call    WriteString
    call    Crlf

    Input:
        mov     EDX,            [EBP+72]
        call    WriteString
        call    ReadInt

        cmp     EAX,            1
        je      L5a
        cmp     EAX,            2
        je      L5b
        jmp     IncorrectInput

    LeaveFunc:
        ret

    IncorrectInput:
        mov     EDX,                 [EBP+1508]
        call    WriteString
        call    Crlf
        jmp     Input
    L5a:
        pop     EBP
        call    Story5a
        jmp     LeaveFunc
    L5b:
        pop     EBP
        call    Story5b
        jmp     LeaveFunc
Story4b ENDP


Story4c PROC
    push    EBP
    mov     EBP,            ESP

    call    ClrScr
    ; 12 ascii
    mov     EDX,            [EBP+628]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+632]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+636]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+640]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+644]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+648]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+652]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+656]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+660]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+664]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+668]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+672]
    call    WriteString
    call    Crlf
    ; 7 storylines
    mov     EDX,            [EBP+676]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+680]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+684]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+688]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+692]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+696]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+700]
    call    WriteString
    call    Crlf
    ; 2 prompts
    mov     EDX,            [EBP+704]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+708]
    call    WriteString
    call    Crlf

    Input:
        mov     EDX,            [EBP+72]
        call    WriteString
        call    ReadInt

        cmp     EAX,            1
        je      L5c
        cmp     EAX,            2
        je      L5e
        jmp     IncorrectInput

    LeaveFunc:
        ret

    IncorrectInput:
        mov     EDX,                 [EBP+1508]
        call    WriteString
        call    Crlf
        jmp     Input
    L5c:
        pop     EBP
        call    Story5c
        jmp     LeaveFunc
    L5e:
        pop     EBP
        call    Story5e
        jmp     LeaveFunc
Story4c ENDP


Story4d PROC
    push    EBP
    mov     EBP,            ESP

    call    ClrScr
    ; 12 ascii
    mov     EDX,            [EBP+712]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+716]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+720]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+724]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+728]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+732]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+736]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+740]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+744]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+748]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+752]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+756]
    call    WriteString
    call    Crlf
    ; 7 storylines
    mov     EDX,            [EBP+760]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+764]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+768]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+772]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+776]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+780]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+784]
    call    WriteString
    call    Crlf
    ; 2 prompts
    mov     EDX,            [EBP+788]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+792]
    call    WriteString
    call    Crlf

    Input:
        mov     EDX,            [EBP+72]
        call    WriteString
        call    ReadInt

        cmp     EAX,            1
        je      L5c
        cmp     EAX,            2
        je      L5f
        jmp     IncorrectInput

    LeaveFunc:
        ret

    IncorrectInput:
        mov     EDX,                 [EBP+1508]
        call    WriteString
        call    Crlf
        jmp     Input
    L5c:
        pop     EBP
        call    Story5c
        jmp     LeaveFunc
    L5f:
        pop     EBP
        call    Story5f
        jmp     LeaveFunc
Story4d ENDP

Story4e PROC
    push    EBP
    mov     EBP,            ESP


    call    ClrScr
    ; N/A ascii
    ; 8 storylines
    mov     EDX,            [EBP+796]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+800]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+804]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+808]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+812]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+816]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+820]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+824]
    call    WriteString
    call    Crlf
    ; 2 prompts
    mov     EDX,            [EBP+828]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+832]
    call    WriteString
    call    Crlf

    Input:
        mov     EDX,            [EBP+72]
        call    WriteString
        call    ReadInt

        cmp     EAX,            1
        je      L5g
        cmp     EAX,            2
        je      L5h
        jmp     IncorrectInput

    LeaveFunc:
        ret

    IncorrectInput:
        mov     EDX,                 [EBP+1508]
        call    WriteString
        call    Crlf
        jmp     Input
    L5g:
        pop     EBP
        call    Story5g
        jmp     LeaveFunc
    L5h:
        pop     EBP
        call    Story5h
        jmp     LeaveFunc
Story4e ENDP


Story5a PROC
    push    EBP
    mov     EBP,            ESP

    call    ClrScr
    ; N/A ascii
    ; 5 storylines
    mov     EDX,            [EBP+836]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+840]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+844]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+848]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+852]
    call    WriteString
    call    Crlf
    ; N/A prompts

        pop     EBP
        ret
Story5a ENDP


Story5b PROC
    push    EBP
    mov     EBP,            ESP


    call    ClrScr
    ; 9 ascii
    mov     EDX,            [EBP+856]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+860]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+864]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+868]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+872]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+876]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+880]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+884]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+888]
    call    WriteString
    call    Crlf
    ; 20 storylines
    mov     EDX,            [EBP+892]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+896]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+900]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+904]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+908]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+912]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+916]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+920]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+924]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+928]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+932]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+936]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+940]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+944]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+948]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+952]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+956]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+960]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+964]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+968]
    call    WriteString
    call    Crlf
    ; 2 prompts
    mov     EDX,            [EBP+972]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+976]
    call    WriteString
    call    Crlf

    Input:
        mov     EDX,            [EBP+72]
        call    WriteString
        call    ReadInt

        cmp     EAX,            1
        je      L7a
        cmp     EAX,            2
        je      L7b
        jmp     IncorrectInput

    LeaveFunc:
        ret

    IncorrectInput:
        mov     EDX,                 [EBP+1508]
        call    WriteString
        call    Crlf
        jmp     Input
    L7a:
        pop     EBP
        call    Story7a
        jmp     LeaveFunc
    L7b:
        pop     EBP
        call    Story7b
        jmp     LeaveFunc
Story5b ENDP


Story5c PROC
    push    EBP
    mov     EBP,            ESP


    call    ClrScr
    ; 10 ascii
    mov     EDX,            [EBP+980]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+984]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+988]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+992]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+996]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1000]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1004]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1008]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1012]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1016]
    call    WriteString
    call    Crlf
    ; 10 storylines
    mov     EDX,            [EBP+1020]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1024]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1028]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1032]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1036]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1040]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1044]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1048]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1052]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1056]
    call    WriteString
    call    Crlf
    ; 2 prompts
    mov     EDX,            [EBP+1060]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1064]
    call    WriteString
    call    Crlf

    Input:
        mov     EDX,            [EBP+72]
        call    WriteString
        call    ReadInt

        cmp     EAX,            1
        je      L6a
        cmp     EAX,            2
        je      L6b
        jmp     IncorrectInput

    LeaveFunc:
        ret

    IncorrectInput:
        mov     EDX,                 [EBP+1512]
        call    WriteString
        call    Crlf
        jmp     Input
    L6a:
        pop     EBP
        call    Story6a
        jmp     LeaveFunc
    L6b:
        pop     EBP
        call    Story6b
        jmp     LeaveFunc
Story5c ENDP


; no 5d, for my sanity I didn't go through and change the names
Story5e PROC
    push    EBP
    mov     EBP,            ESP


    call    ClrScr
    ; 9 ascii
    mov     EDX,            [EBP+1068]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1072]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1076]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1080]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1084]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1088]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1092]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1096]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1100]
    call    WriteString
    call    Crlf
    ; 9 storylines
    mov     EDX,            [EBP+1104]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1108]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1112]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1116]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1120]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1124]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1128]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1132]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1136]
    call    WriteString
    call    Crlf
    ; N/A prompts

    pop     EBP
    ret
Story5e ENDP


Story5f PROC
    push    EBP
    mov     EBP,            ESP


    call    ClrScr
    ; N/A ascii
    ; 9 storylines
    mov     EDX,            [EBP+1140]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1144]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1148]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1152]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1156]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1160]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1164]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1168]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1172]
    call    WriteString
    call    Crlf
    ; N/A prompts

    pop     EBP
    ret
Story5f ENDP


Story5g PROC
    push    EBP
    mov     EBP,            ESP


    call    ClrScr
    ; 12 ascii
    mov     EDX,            [EBP+1176]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1180]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1184]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1188]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1192]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1196]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1200]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1204]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1208]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1212]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1216]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1220]
    call    WriteString
    call    Crlf
    ; 4 storylines
    mov     EDX,            [EBP+1224]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1228]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1232]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1236]
    call    WriteString
    call    Crlf
    ; N/A prompts

    pop     EBP
    ret
Story5g ENDP


Story5h PROC
    push    EBP
    mov     EBP,            ESP


    call    ClrScr
    ; N/A ascii
    ; 5 storylines
    mov     EDX,            [EBP+1240]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1244]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1248]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1252]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1256]
    call    WriteString
    call    Crlf
    ; N/A prompts

    pop     EBP
    ret
Story5h ENDP


Story6a PROC
    push    EBP
    mov     EBP,            ESP


    call    ClrScr
    ; 12 ascii
    mov     EDX,            [EBP+1260]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1264]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1268]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1272]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1276]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1280]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1284]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1288]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1292]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1296]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1300]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1305]
    call    WriteString
    call    Crlf
    ; 6 storylines
    mov     EDX,            [EBP+1308]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1312]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1316]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1320]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1324]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1328]
    call    WriteString
    call    Crlf
    ; N/A prompts

    pop     EBP
    ret
Story6a ENDP


Story6b PROC
    push    EBP
    mov     EBP,            ESP


    call    ClrScr
    ; 15 ascii
    mov     EDX,            [EBP+1332]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1336]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1340]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1344]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1348]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1352]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1356]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1360]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1364]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1368]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1372]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1376]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1380]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1384]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1388]
    call    WriteString
    call    Crlf
    ; 6 storylines
    mov     EDX,            [EBP+1392]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1396]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1400]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1404]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1408]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1412]
    call    WriteString
    call    Crlf
    ; N/A prompts

    pop     EBP
    ret
Story6b ENDP


Story7a PROC
    push    EBP
    mov     EBP,            ESP


    call    ClrScr
    ; 8 ascii
    mov     EDX,            [EBP+1416]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1420]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1424]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1428]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1432]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1436]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1440]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1444]
    call    WriteString
    call    Crlf
    ; 4 storylines
    mov     EDX,            [EBP+1448]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1452]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1456]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1460]
    call    WriteString
    call    Crlf
    ; N/A prompts

    pop     EBP
    ret
Story7a ENDP

Story7b PROC
    push    EBP
    mov     EBP,            ESP


    call    ClrScr
    ; 6 ascii
    mov     EDX,            [EBP+1464]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1468]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1472]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1476]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1480]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1484]
    call    WriteString
    call    Crlf
    ; 5 storylines
    mov     EDX,            [EBP+1488]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1492]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1496]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1500]
    call    WriteString
    call    Crlf
    mov     EDX,            [EBP+1504]
    call    WriteString
    call    Crlf
    ; N/A prompts

    pop     EBP
    ret
Story7b ENDP


Goodbye PROC
    push    EBP
    mov     EBP,            ESP

    call    Crlf
    mov     EDX,            [EBP+8]
    call    WriteString
    mov     EDX,            [EBP+12]
    call    WriteString
    call    Crlf

    pop     EBP

    ret     8
Goodbye ENDP

END main

;==============================================================================;
;=-=END=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;