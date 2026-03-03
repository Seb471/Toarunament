; The CMD file.
;
; Two parts: 1. Command definition and  2. State entry
; (state entry is after the commands def section)
;
; 1. Command definition
; ---------------------
; Note: The commands are CASE-SENSITIVE, and so are the command names.
; The eight directions are:
;   B, DB, D, DF, F, UF, U, UB     (all CAPS)
;   corresponding to back, down-back, down, downforward, etc.
; The six buttons are:
;   a, b, c, x, y, z               (all lower case)
;   In default key config, abc are are the bottom, and xyz are on the
;   top row. For 2 button characters, we recommend you use a and b.
;   For 6 button characters, use abc for kicks and xyz for punches.
;
; Each [Command] section defines a command that you can use for
; state entry, as well as in the CNS file.
; The command section should look like:
;
;   [Command]
;   name = some_name
;   command = the_command
;   time = time (optional)
;   buffer.time = time (optional)
;
; - some_name
;   A name to give that command. You'll use this name to refer to
;   that command in the state entry, as well as the CNS. It is case-
;   sensitive (QCB_a is NOT the same as Qcb_a or QCB_A).
;
; - command
;   list of buttons or directions, separated by commas. Each of these
;   buttons or directions is referred to as a "symbol".
;   Directions and buttons can be preceded by special characters:
;   slash (/) - means the key must be held down
;          egs. command = /D       ;hold the down direction
;               command = /DB, a   ;hold down-back while you press a
;   tilde (~) - to detect key releases
;          egs. command = ~a       ;release the a button
;               command = ~D, F, a ;release down, press fwd, then a
;          If you want to detect "charge moves", you can specify
;          the time the key must be held down for (in game-ticks)
;          egs. command = ~30a     ;hold a for at least 30 ticks, then release
;   dollar ($) - Direction-only: detect as 4-way
;          egs. command = $D       ;will detect if D, DB or DF is held
;               command = $B       ;will detect if B, DB or UB is held
;   plus (+) - Buttons only: simultaneous press
;          egs. command = a+b      ;press a and b at the same time
;               command = x+y+z    ;press x, y and z at the same time
;   greater-than (>) - means there must be no other keys pressed or released
;                      between the previous and the current symbol.
;          egs. command = a, >~a   ;press a and release it without having hit
;                                  ;or released any other keys in between
;   You can combine the symbols:
;     eg. command = ~30$D, a+b     ;hold D, DB or DF for 30 ticks, release,
;                                  ;then press a and b together
;
;   Note: Successive direction symbols are always expanded in a manner similar
;         to this example:
;           command = F, F
;         is expanded when MUGEN reads it, to become equivalent to:
;           command = F, >~F, >F
;
;   It is recommended that for most "motion" commads, eg. quarter-circle-fwd,
;   you start off with a "release direction". This makes the command easier
;   to do.
;
; - time (optional)
;   Time allowed to do the command, given in game-ticks. The default
;   value for this is set in the [Defaults] section below. A typical
;   value is 15.
;
; - buffer.time (optional)
;   Time that the command will be buffered for. If the command is done
;   successfully, then it will be valid for this time. The simplest
;   case is to set this to 1. That means that the command is valid
;   only in the same tick it is performed. With a higher value, such
;   as 3 or 4, you can get a "looser" feel to the command. The result
;   is that combos can become easier to do because you can perform
;   the command early. Attacks just as you regain control (eg. from
;   getting up) also become easier to do. The side effect of this is
;   that the command is continuously asserted, so it will seem as if
;   you had performed the move rapidly in succession during the valid
;   time. To understand this, try setting buffer.time to 30 and hit
;   a fast attack, such as KFM's light punch.
;   The default value for this is set in the [Defaults] section below.
;   This parameter does not affect hold-only commands (eg. /F). It
;   will be assumed to be 1 for those commands.
;
; If you have two or more commands with the same name, all of them will
; work. You can use it to allow multiple motions for the same move.
;
; Some common commands examples are given below.
;
; [Command] ;Quarter circle forward + x
; name = "QCF_x"
; command = ~D, DF, F, x
;
; [Command] ;Half circle back + a
; name = "HCB_a"
; command = ~F, DF, D, DB, B, a
;
; [Command] ;Two quarter circles forward + y
; name = "2QCF_y"
; command = ~D, DF, F, D, DF, F, y
;
; [Command] ;Tap b rapidly
; name = "5b"
; command = b, b, b, b, b
; time = 30
;
; [Command] ;Charge back, then forward + z
; name = "charge_B_F_z"
; command = ~60$B, F, z
; time = 10
;
; [Command] ;Charge down, then up + c
; name = "charge_D_U_c"
; command = ~60$D, U, c
; time = 10


;-| Button Remapping |-----------------------------------------------------
; This section lets you remap the player's buttons (to easily change the
; button configuration). The format is:
;   old_button = new_button
; If new_button is left blank, the button cannot be pressed.
[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s

;-| Default Values |-------------------------------------------------------
[Defaults]
; Default value for the "time" parameter of a Command. Minimum 1.
command.time = 15

; Default value for the "buffer.time" parameter of a Command. Minimum 1,
; maximum 30.
command.buffer.time = 1

;-| Hyper Motions |--------------------------------------------------------

[Command]
name = "HCB_c"
command = ~F,DF,D,DB,B, c
time = 32
buffer.Time=16

[Command]
name = "HCB_b"
command = ~F,DF,D,DB,B, b
time = 32
buffer.Time=16


[Command]
name = "HCF_c"  
command = ~B, DB, D, DF, F, c
time = 32
buffer.Time=16


;-| Super Motions |--------------------------------------------------------
;The following two have the same name, but different motion.
;Either one will be detected by a "command = TripleKFPalm" trigger.
;Time is set to 20 (instead of default of 15) to make the move
;easier to do.
;


[Command]
name = "DD_y"
command = ~D, D, y
time = 20
buffer.time = 10

[Command]
name = "UU_y"
command = ~U, U, y
time = 20
buffer.time = 10



[Command]
name = "RDP_c"
command = ~B,DB,D,DB,c
Time=20
buffer.Time=10

[Command]
name = "DP_c"
command = ~F,DF,D,DF,c
Time=20
buffer.Time=10

[Command]
name = "QCF_c"
command = ~D, DF, F, c
time = 20
buffer.time = 10

[Command]
name = "DD_c"
command = ~D, D, c
time = 20
buffer.time = 10

;-| Special Motions |------------------------------------------------------

[Command]
name = "ChargeY"
command = ~35$B, F, y
time = 20
buffer.Time=10


[Command]
name = "RDP_a"
command = ~B,DB,D,DB,a
Time=20
buffer.Time=10

[Command]
name = "RDP_b"
command = ~B,DB,D,DB,b
Time=20
buffer.Time=10

[Command]
name = "DP_a"
command = ~F,DF,D,DF,a
Time=20
buffer.Time=10

[Command]
name = "DP_b"
command = ~F,DF,D,DF,b
Time=20
buffer.Time=10

[Command]
name = "QCF_a"
command = ~D, DF, F, a
time = 20
buffer.time = 10

[Command]
name = "QCF_b"
command = ~D, DF, F, b
time = 20
buffer.time = 10

[Command]
name = "DD_a"
command = ~D, D, a
time = 20
buffer.time = 10

[Command]
name = "DD_b"
command = ~D, D, b
time = 20
buffer.time = 10

[Command]
name = "F_z"
command = F,z
time = 25
buffer.time = 15

[Command]
name = "B_z"
command = B,z
time = 25
buffer.time = 15


;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10

;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "recovery";Required (do not remove)
command = x
time = 1

[Command]
	name="recovery"
	command=y
	Time=1

[Command]
	name="recovery"
	command=z
	Time=1

[Command]
	name="recovery"
	command=a
	Time=1

[Command]
	name="recovery"
	command=b
	Time=1

[Command]
	name="recovery"
	command=c
	Time=1

[Command]
name = "x+a"
command = x+a
time = 1

[Command]
name = "x+b"
command = x+b
time = 1

[Command]
name = "x+c"
command = x+c
time = 1

;-| Single Button |---------------------------------------------------------
[Command]
name = "a"
command = a
time = 1

[Command]
name = "b"
command = b
time = 1

[Command]
name = "c"
command = c
time = 1

[Command]
name = "x"
command = x
time = 1

[Command]
name = "y"
command = y
time = 1

[Command]
name = "z"
command = z
time = 1

[Command]
name = "start"
command = s
time = 1

[Command]
	name="hold_a"
	command=/a
	time = 1

[Command]
	name="hold_b"
	command=/b
	time = 1

[Command]
	name="hold_c"
	command=/c
	time = 1

[Command]
	name="hold_y"
	command=/y
	time = 1

[Command]
	name="hold_x"
	command=/x
	time = 1

[Command]
	name="hold_z"
	command=/z
	time = 1

;-| Hold Dir |--------------------------------------------------------------
[Command]
name = "holdfwd";Required (do not remove)
command = /$F
time = 1

[Command]
name = "holdback";Required (do not remove)
command = /$B
time = 1

[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 1

[Command]
name = "holddown";Required (do not remove)
command = /$D
time = 1

;---------------------------------------------------------------------------
; 2. State entry
; --------------
; This is where you define what commands bring you to what states.
;
; Each state entry block looks like:
;   [State -1, Label]           ;Change Label to any name you want to use to
;                               ;identify the state with.
;   type = ChangeState          ;Don't change this
;   value = new_state_number
;   trigger1 = command = command_name
;   . . .  (any additional triggers)
;
; - new_state_number is the number of the state to change to
; - command_name is the name of the command (from the section above)
; - Useful triggers to know:
;   - statetype
;       S, C or A : current state-type of player (stand, crouch, air)
;   - ctrl
;       0 or 1 : 1 if player has control. Unless "interrupting" another
;                move, you'll want ctrl = 1
;   - stateno
;       number of state player is in - useful for "move interrupts"
;   - movecontact
;       0 or 1 : 1 if player's last attack touched the opponent
;                useful for "move interrupts"
;
; Note: The order of state entry is important.
;   State entry with a certain command must come before another state
;   entry with a command that is the subset of the first.
;   For example, command "fwd_a" must be listed before "a", and
;   "fwd_ab" should come before both of the others.
;
; For reference on triggers, see CNS documentation.
;
; Just for your information (skip if you're not interested):
; This part is an extension of the CNS. "State -1" is a special state
; that is executed once every game-tick, regardless of what other state
; you are in.


; Don't remove the following line. It's required by the CMD standard.
[Statedef -1]

;----------------------------------------------
;Hypers

;Dragon Breath
[State -1, Dragon Breath]
type = ChangeState
value = 3000
triggerall = (var(15)>30)
triggerall = command = "HCF_c"
triggerall=stateno!=3000
triggerall=power>2999
;triggerall = statetype !=A
trigger1 = (stateno=1 && anim=0) || ctrl
trigger2 = var(1)

;Dragon Breath Extension
[State -1, Dragon Breath Extension]
type = ChangeState
value = 3100
triggerall = (var(15)>30)
triggerall = command = "hold_c"
triggerall=stateno!=[3100,3299]
triggerall=stateno=3000
triggerall=power>1999
;triggerall = statetype !=A
trigger1 = var(1)
trigger1=command!="holdback"

;Feathers
[State -1, Feathers]
type = ChangeState
value = 3200
triggerall = (var(15)>30)
triggerall = command = "hold_c"
triggerall=power>999
;triggerall = statetype !=A
trigger1=stateno=3000
trigger1=command="holdback"
trigger1 = var(1)
trigger2=stateno=3100 && time=105
;trigger2 = var(1)




;Rain of Fire Arrows

[State -1, Rain of Fire Arrows]
type = ChangeState
value = 2900
triggerall = (var(15)>30)
triggerall = command = "HCB_c"
triggerall=stateno!=[3000,3299]
triggerall=stateno!=2900
triggerall=power>1999
;triggerall = statetype !=A
trigger1 = (stateno=1 && anim=0) || ctrl
trigger2 = var(1)


;Grimoire Poison
[State -1, Grimoire Poison]
type = ChangeState
value = 2800
triggerall = (var(15)>30)
triggerall = command = "HCB_b"
triggerall=stateno!=[3000,3299]
triggerall=stateno!=2800
triggerall=power>1999
triggerall=var(9)!=0
triggerall = statetype !=A
trigger1 = (stateno=1 && anim=0) || ctrl
trigger2 = var(1)

;Wings Lasers
[State -1, Wings Lasers]
type = ChangeState
value = 2600
triggerall = (var(15)>30)
triggerall = command = "UU_y"
triggerall=stateno!=[3000,3299]
;triggerall=stateno!=2900
triggerall=stateno!=2600
triggerall=power>1999
triggerall = statetype =A
trigger1 = (stateno=1 && anim=0) || ctrl
trigger2 = var(1)




;--------------------------------------------
;Supers

;Multiple Wings Super
[State -1, Multiple Wings Super]
type = ChangeState
value = 2500
triggerall = (var(15)>30)
triggerall=stateno!=[3000,3299]
triggerall = command = "DD_y"
triggerall=stateno!=2900
triggerall=stateno!=2200
triggerall=stateno!=2500 || (stateno=2500 && time<40)
triggerall=power>999
triggerall = statetype =A
trigger1 = (stateno=1 && anim=0) || ctrl
trigger2 = var(1)

;Wings Deploying EX
[State -1, Wings Deploying EX]
type = ChangeState
value = 2700
triggerall = (var(15)>30)
triggerall=stateno!=[3000,3299]
triggerall = command = "UU_y"
triggerall=stateno!=2900
triggerall=stateno!=2200
triggerall=power>999
triggerall = statetype !=A
trigger1 = (stateno=1 && anim=0) || ctrl
trigger2 = var(1)


;Ground Pound EX
[State -1, Rooting EX]
type = ChangeState
value = 2400
triggerall = (var(15)>30)
triggerall=stateno!=[3000,3299]
triggerall = command = "DD_c"
triggerall=stateno!=2900
triggerall=stateno!=2200
triggerall=power>999
triggerall = statetype =A
trigger1 = (stateno=1 && anim=0) || ctrl
trigger2 = var(1)

;Rooting EX
[State -1, Rooting EX]
type = ChangeState
value = 2300
triggerall = (var(15)>30)
triggerall=stateno!=[3000,3299]
triggerall = command = "DD_c"
triggerall=stateno!=2900
triggerall=stateno!=2200
triggerall=power>999
triggerall=numhelper(2301)=0
triggerall = statetype !=A
trigger1 = (stateno=1 && anim=0) || ctrl
trigger2 = var(1)


;Swords EX
[State -1, Swords EX]
type = ChangeState
value = 2200
triggerall = (var(15)>30)
triggerall=stateno!=[3000,3299]
triggerall = command = "RDP_c"
triggerall=power>1999
triggerall=var(5)=0
;triggerall = statetype !=A
trigger1 = (stateno=1 && anim=0) || ctrl
trigger2 = var(1)

;Pressure EX
[State -1, Pressure EX]
type = ChangeState
value = 2100
triggerall=stateno!=[3000,3299]
triggerall = command = "DP_c"
triggerall=stateno!=2900
triggerall=stateno!=2200
triggerall=power>999
triggerall = statetype !=A
trigger1 = (stateno=1 && anim=0) || ctrl
trigger2 = var(1)


;Beam EX
[State -1, Beam EX]
type = ChangeState
value = 2000
triggerall = (var(15)>30)
triggerall=stateno!=[3000,3299]
triggerall = command = "QCF_c"
triggerall=stateno!=2900
triggerall=stateno!=2200
triggerall=power>999
;triggerall = statetype !=A
trigger1 = (stateno=1 && anim=0) || ctrl
trigger2 = var(1)

;===========================================================================
;Specials

;Dash Move
[State -1, Dash Move]
type = ChangeState
value = 1900
triggerall = (var(15)>30)
triggerall = command = "ChargeY"
triggerall = statetype !=A
trigger1 = (stateno=1 && anim=0) || ctrl
Trigger2 = StateNo = [1300,1350] 
trigger2 = var(1)

;-------------------------------------------
;Ground Pound A
[State -1, Ground Pound A]
type = ChangeState
value = 1400
triggerall = (var(15)>30)
triggerall = command = "DD_a"
triggerall = statetype =A
trigger1 = (stateno=1 && anim=0) || ctrl
Trigger2 = StateNo = [600,699] 
trigger2 = var(1)

;Ground Pound B
[State -1, Ground Pound B]
type = ChangeState
value = 1450
triggerall = (var(15)>30)
triggerall = command = "DD_b"
triggerall = statetype =A
trigger1 = (stateno=1 && anim=0) || ctrl
Trigger2 = StateNo = [600,699] 
trigger2 = var(1)


;-------------------------------------------


;-------------------------------------------
;Rooting A
[State -1, Rooting A]
type = ChangeState
value = 1300
triggerall = (var(15)>30)
triggerall = command = "DD_a"
triggerall = statetype !=A
triggerall=numhelper(1301)=0
triggerall=numhelper(1351)=0
triggerall=numhelper(2301)=0
trigger1 = (stateno=1 && anim=0) || ctrl
;Trigger2 = StateNo = [200,499] 
;trigger2 = var(1)

;Rooting B
[State -1, Rooting B]
type = ChangeState
value = 1350
triggerall = (var(15)>30)
triggerall = command = "DD_b"
triggerall=numhelper(1301)=0
triggerall=numhelper(1351)=0
triggerall=numhelper(2301)=0
triggerall = statetype !=A
trigger1 = (stateno=1 && anim=0) || ctrl
;Trigger2 = StateNo = [200,499] 
;trigger2 = var(1)


;-------------------------------------------

;Swords A
[State -1, Swords A]
type = ChangeState
value = 1200
triggerall = (var(15)>30)
triggerall = command = "RDP_a"
triggerall=var(5)=0
;triggerall = statetype !=A
trigger1 = (stateno=1 && anim=0) || ctrl
Trigger2 = StateNo = [200,499] 
trigger2 = var(1)

;Swords B
[State -1, Swords B]
type = ChangeState
value = 1250
triggerall = (var(15)>30)
triggerall = command = "RDP_b"
triggerall=var(5)=0
;triggerall = statetype !=A
trigger1 = (stateno=1 && anim=0) || ctrl
Trigger2 = StateNo = [200,499] 
trigger2 = var(1)


;--------------------------------------

;Pressure A
[State -1, Pressure A]
type = ChangeState
value = 1100
triggerall = (var(15)>30)
triggerall = command = "DP_a"
triggerall = statetype !=A
trigger1 = (stateno=1 && anim=0) || ctrl
Trigger2 = StateNo = [200,499] 
trigger2 = var(1)

;Pressure B
[State -1, Pressure B]
type = ChangeState
value = 1150
triggerall = (var(15)>30)
triggerall = command = "DP_b"
triggerall = statetype !=A
trigger1 = (stateno=1 && anim=0) || ctrl
Trigger2 = StateNo = [200,499] 
trigger2 = var(1)





;------------------------------------
;Beam A
[State -1, Beam A]
type = ChangeState
value = 1000
triggerall = (var(15)>30)
triggerall = command = "QCF_a"
;triggerall = statetype !=A
trigger1 = (stateno=1 && anim=0) || ctrl
Trigger2 = StateNo = [200,699] 
trigger2 = var(1)

;Beam B
[State -1, Beam B]
type = ChangeState
value = 1050
triggerall = (var(15)>30)
triggerall = command = "QCF_b"
;triggerall = statetype !=A
trigger1 = (stateno=1 && anim=0) || ctrl
Trigger2 = StateNo = [200,699] 
trigger2 = var(1)
;===========================================================================
;This is not a move, but it sets up var(1) to be 1 if conditions are right
;for a combo into a special move (used below).
;Since a lot of special moves rely on the same conditions, this reduces
;redundant logic.
[State -1, Combo condition Reset]
type = VarSet
trigger1 = movetype=H
var(1) = 0
;===========================================================================

;Throw
[State -1]
Type = ChangeState
value = 800
triggerall = command = "x"
triggerall = statetype != A
triggerall = (stateno=1 && anim=0) || ctrl || stateno=[100,101]
trigger1 = command = "holdfwd"
trigger2 = command = "holdback"


;Uninstall
[State -1, Uninstall]
type = ChangeState
value = 776
triggerall = (var(15)>30)
triggerall = var(9)!=0
trigger1 = command = "holddown"
trigger1= command = "hold_x"
trigger1=command = "hold_z"
trigger1=(stateno=1 && anim=0)

;Sheol Fear
[State -1, Sheol Fear]
type = ChangeState
value = 790
triggerall = (var(15)>30)
;triggerall=statetype!=A
triggerall=numhelper(795)=0
;triggerall = var(9)!=0
triggerall=command = "x"
trigger1=(stateno=1 && anim=0)



;------------------------------------------------

;Phys Parry
[State -1, Phys Parry]
type = ChangeState
value = 750
triggerall = (var(15)>30)
triggerall = stateno != [100,115]
;triggerall = command = "F_z"
triggerall = command = "z" && command = "holdfwd"
;triggerall = statetype!=A
trigger1=(stateno=1 && anim=0) || ctrl

;Proj Parry
[State -1, Proj Parry]
type = ChangeState
value = 760
triggerall = (var(15)>30)
triggerall = stateno != [100,115]
;trigger1 = command = "B_z"
trigger1 = command = "z" && command = "holdback"
trigger1=(stateno=1 && anim=0) || ctrl
trigger2 = command = "z"
trigger2=stateno=761
trigger3=command = "z"
trigger3=prevstateno=761
;-------------------------------------------------------

[State -1,Fly]
	Type=ChangeState
	value=41
	triggerall = (var(15)>30)
	TriggerAll = StateType != A
	triggerall=pos Y <=0
	TriggerAll = command = "holdup"
	;triggerall=var(3)=0
	triggerall=command="y"
	trigger1=(stateno=1 && anim=0) || ctrl
	trigger2=stateno=220 && var(1)
	
;---------------------------------------------------------------------------
;Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall = (var(15)>30)
triggerall=stateno!=[2000,3999]
triggerall = statetype != A
triggerall = command = "FF" ||(Command = "holdfwd" && Command = "y" )
trigger1 = (stateno=1 && anim=0) || ctrl
trigger2 = var(1)

;---------------------------------------------------------------------------
;Run Back
[State -1, Run Back]
type = ChangeState
value = 105
triggerall = (var(15)>30)
triggerall=stateno!=[2000,3999]
triggerall = statetype != A
triggerall = command = "BB" ||(Command = "holdback" && Command = "y" )
trigger1 = (stateno=1 && anim=0) || ctrl
trigger2 = var(1)

;-----------------------------------------------------------------------------
;Air Dash
[State -1, Air Dash]
type = ChangeState
value = 110
triggerall = (var(15)>30)
triggerall=stateno!=[110,115]
triggerall=pos Y >=-150
triggerall = statetype = A && var(3)=1
triggerall = command = "FF" || (command ="hold_y" && command="holdfwd")
trigger1 = (stateno=1 && anim=0) || ctrl
trigger2 = var(1)


;Back Air Dash
[State -1, Air Dash]
type = ChangeState
value = 115
triggerall = (var(15)>30)
triggerall=stateno!=[110,115]
triggerall=pos Y >=-150
triggerall = statetype = A && var(3)=1
triggerall = command = "BB"|| (command ="hold_y" && command="holdback")
trigger1 = (stateno=1 && anim=0) || ctrl
trigger2 = var(1)

;Ground Pound Descent
[State -1, Ground Pound Descent]
type = ChangeState
value = 1400
triggerall = (var(15)>30)
triggerall = (command ="hold_y" && command="holddown")
triggerall=  command!="holdback"
triggerall=  command!="holdfwd"
triggerall = statetype =A
trigger1 = (stateno=1 && anim=0) || ctrl
Trigger2 = StateNo = [600,699] 
trigger2 = var(1)
Trigger3 = StateNo = 1000
trigger3 = var(1)


;-----------------------------------------------------------------------------
[State -1,Charge];Charge
	Type=ChangeState
	value=700
	triggerall = (var(15)>30)
	;TriggerAll=StateType!=A
	TriggerAll=command="hold_a"
	TriggerAll=command="hold_c"
	TriggerAll=Power<PowerMax
	Trigger1=(stateno=1 && anim=0) || ctrl

;-------------------------------------------------------

;===========================================================================

;Standing Shockwave A
[State -1, Standing Shockwave A]
type = ChangeState
value = 200
;triggerall = (var(15)>30)
triggerall = command = "a"
;triggerall = command != "holddown"
triggerall = statetype !=A
trigger1 = (stateno=1 && anim=0) || ctrl
Trigger2 = StateNo = 200 && ((var(1)&&time>=8) ||time>=10)
trigger3=stateno=100 && time>=16
trigger4=stateno=1900 && var(1)
trigger5=stateno=110 && time>=16

;Standing Shockwave B
[State -1, Standing Shockwave B]
type = ChangeState
value = 210
;triggerall = (var(15)>30)
triggerall = command = "b"
;triggerall = command != "holddown"
triggerall = statetype !=A
trigger1 = (stateno=1 && anim=0) || ctrl
Trigger2 = StateNo = 200 && var(1)
trigger3=stateno=100 && time>=16
trigger4=stateno=1900 && var(1)
trigger5=stateno=110 && time>=16

;Explosion C
[State -1, Explosion C]
type = ChangeState
value = 220
triggerall = (var(15)>30)
triggerall = command = "c"
;triggerall = command != "holddown"
triggerall = statetype !=A
trigger1 = (stateno=1 && anim=0) || ctrl
Trigger2 = StateNo = 200 && var(1)
Trigger3 = StateNo = 210 && var(1)
trigger4=stateno=100 && time>=16
trigger5=stateno=1900 && var(1)
trigger6=stateno=110 && time>=16

;---------------------------------------------------------------

;Wing Slap A
[State -1, Wing Slap A]
type = ChangeState
value = 600
triggerall = (var(15)>30)
triggerall = command = "a"
;triggerall = command != "holddown"
triggerall = statetype =A
trigger1 = (stateno=1 && anim=0) || ctrl
Trigger2 = StateNo = 600 && ((var(1)&&time>=5) ||time>=11)
trigger3=stateno=110 && time>=16

;Wing Slap B
[State -1, Wing Slap B]
type = ChangeState
value = 610
triggerall = (var(15)>30)
triggerall = command = "b"
;triggerall = command != "holddown"
triggerall = statetype =A
trigger1 = (stateno=1 && anim=0) || ctrl
Trigger2 = StateNo = 600 && var(1)
trigger3=stateno=110 && time>=16

;Wing Slap C
[State -1, Wing Slap C]
type = ChangeState
value = 620
triggerall = (var(15)>30)
triggerall = command = "c"
;triggerall = command != "holddown"
triggerall = statetype =A
trigger1 = (stateno=1 && anim=0) || ctrl
Trigger2 = StateNo = 600 && var(1)
Trigger3 = StateNo = 610 && var(1)
trigger4=stateno=110 && time>=16

