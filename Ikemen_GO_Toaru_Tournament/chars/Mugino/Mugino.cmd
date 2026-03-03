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


;-| Super Motions |--------------------------------------------------------
;The following two have the same name, but different motion.
;Either one will be detected by a "command = TripleKFPalm" trigger.
;Time is set to 20 (instead of default of 15) to make the move
;easier to do.

[Command]
name = "DD_abc"
command = ~D,D,a+b+c
Time=20
buffer.Time=10


[Command]
name = "HCF_a"
command = ~B, DB, D, DF, F, a
Time=32
buffer.Time=16

[Command]
name = "HCF_b"
command = ~B, DB, D, DF, F, b
Time=32
buffer.Time=16

[Command]
name = "HCF_c"
command = ~B, DB, D, DF, F, c
Time=32
buffer.Time=16

[Command]
name = "HCB_c"
command = ~F, DF, D, DB, B, c
Time=32
buffer.Time=16

[Command]
name = "QCF_c"
command = ~D, DF, F, c
time = 20
buffer.time = 10





[Command]
name = "QCB_c"
command = ~D, DB, B, c
time = 20
buffer.time = 10




[Command]
name = "BDB_c"
command =  ~B, D, DB, c
time = 20
buffer.time = 10




[Command]
name = "FDF_c"
command =  ~F, D, DF, c
time = 20
buffer.time = 10




;-| Special Motions |------------------------------------------------------
[Command]
name = "blocking"
command = $F,x
time = 3

[Command]
name = "blocking" ;Same name as above (buttons in opposite order)
command = x,$F
time = 3

[Command]
name = "QCF_a"
command = ~D, DF, F, a
Time=20
	buffer.Time=10


[Command]
name = "QCF_b"
command = ~D, DF, F, b
Time=20
	buffer.Time=10



[Command]
name = "QCB_a"
command = ~D, DB, B, a
Time=20
	buffer.Time=10


[Command]
name = "QCB_b"
command = ~D, DB, B, b
Time=20
	buffer.Time=10



[Command]
name = "BDB_a"
command = ~B, D, DB, a
time = 20
buffer.time = 10




[Command]
name = "BDB_b"
command =  ~B, D, DB, b
time = 20
buffer.time = 10


[Command]
name = "DP_x"
command =  ~F, D, DF, x
time = 20
buffer.time = 10

[Command]
name = "FDF_a"
command =  ~F, D, DF, a
time = 20
buffer.time = 10




[Command]
name = "FDF_b"
command =  ~F, D, DF, b
time = 20
buffer.time = 10







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
name = "recovery2" ;必須コマンド名
command = a+b
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
;-| Dir + Button |---------------------------------------------------------
[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
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

[Command]
	name="hold_b"
	command=/b

[Command]
	name="hold_c"
	command=/c

[Command]
	name="hold_x"
	command=/x

[Command]
	name="hold_y"
	command=/y

[Command]
	name="hold_z"
	command=/z

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


;===========================================================================


;Body Crystal Hyper
[State -1, Body Crystal Hyper]
type = ChangeState
value = 3100
triggerall = command = "DD_abc"
triggerall = statetype != A
triggerall = power > 4999
triggerall=life<(lifemax*0.3)
trigger1 = ctrl
;trigger2 =var(1) && stateno != [2600,3000]
triggerall=stateno!=[800,850]


;Meltdowner Hyper Beam
[State -1, Meltdowner Hyper Beam]
type = ChangeState
value = 3000
triggerall = command = "HCF_c"
triggerall = statetype != A
triggerall = power > 2999
trigger1 = ctrl
trigger2 =var(1) && stateno != [2600,3000]
triggerall=stateno!=[800,850]


;Meltdowner Shield
[State -1, Meltdowner Shield]
type = ChangeState
value = 2800
triggerall = command = "HCB_c"
triggerall = statetype != A
triggerall = power > 1999
triggerall = numhelper(2800) = 0
trigger1 = ctrl
trigger2 =var(1) && stateno != [2500,3000]
triggerall=stateno!=[800,850]

;EX Air Beams
[State -1, Air Beams EX]
type = ChangeState
value = 2600
triggerall = command = "QCF_c"
triggerall = statetype = A
triggerall = power > 999
trigger1 = ctrl
trigger2 =var(1)
triggerall=stateno!=[800,850]


;Meltdowner Grab
[State -1, Meltdowner Grab]
type = ChangeState
value = 2400
triggerall = command = "BDB_c"
triggerall = statetype != A
triggerall = power > 999
trigger1 = ctrl
trigger2 =var(1) && stateno != [2500,3000]
triggerall=stateno!=[800,850]

;Instant Upwards Beams EX 
[State -1, Instant Upwards Beams EX ]
type = ChangeState
value = 2200
triggerall = command = "FDF_c"
triggerall = statetype != A
triggerall = power > 999
trigger1 = ctrl
trigger2 =var(1) && stateno != [2500,3000]
triggerall=stateno!=[800,850]


;Beam Combo
[State -1, Laser Kick EX]
type = ChangeState
value = 2500
triggerall = command = "QCF_c"
triggerall = statetype != A
triggerall = power > 1999
trigger1 = ctrl
trigger2 =var(1) && stateno != [2500,3000]
triggerall=stateno!=[800,850]

;Laser Kick EX
[State -1, Laser Kick EX]
type = ChangeState
value = 2300
triggerall = command = "QCB_c"
triggerall = statetype != A
triggerall = power > 999
trigger1 = ctrl
trigger2 =var(1) && stateno != [2500,3000]
triggerall=stateno!=[800,850]


;Instant Single Beam EX
[State -1, Instant Single Beam EX]
type = ChangeState
value = 2000
triggerall = command = "HCF_a"
triggerall = statetype != A
triggerall = power > 999
trigger1 = ctrl
trigger2 =var(1) && stateno != [2500,3000]
triggerall=stateno!=[800,850]

;Instant Multiple Beams EX
[State -1, Instant Multiple Beams EX]
type = ChangeState
value = 2100
triggerall = command = "HCF_b"
triggerall = statetype != A
triggerall = power > 999
trigger1 = ctrl
trigger2 =var(1) && stateno != [2500,3000]
triggerall=stateno!=[800,850]


;===========================================================================
;Short Gorilla Grab
[State -1, Short Gorilla Grab]
type = ChangeState
value = 1500
triggerall = command = "BDB_a"
triggerall = statetype != A
trigger1 = ctrl
;trigger2 = (stateno = [200,499]) && var(1) 



;Long Gorilla Grab
[State -1, Long Gorilla Grab]
type = ChangeState
value = 1600
triggerall = command = "BDB_b"
triggerall = statetype != A

trigger1 = ctrl
trigger2 = (stateno = [200,499]) && var(1) 



;---------------------------------------------------------------------------
;Short Laser Kick
[State -1, Short Laser Kick]
type = ChangeState
value = 1400
triggerall = command = "QCB_a"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,499]) && var(1) 
trigger3 = stateno = 1530 && var(1) 

;Long Laser Kick
[State -1, Long Laser Kick]
type = ChangeState
value = 1450
triggerall = command = "QCB_b"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,499]) && var(1) 
trigger3 = stateno = 1530 && var(1) 
;---------------------------------------------------------------------------


;Upwards Multiple Beam
[State -1, Multiple Upwards Beam]
type = ChangeState
value = 1300
triggerall = command = "FDF_b"
triggerall = statetype != A
triggerall = (helper(6500),stateno != [6541,6543]) || var(2) = 0
triggerall = (helper(6700),stateno != [6741,6743]) || var(2) <2
trigger1 = ctrl
trigger2 = (stateno = [200,499]) && var(1) 
trigger3 = 0;(stateno = [1400,1499]) && var(1) 
trigger4 = stateno = 1520 && var(1) 

;Upwards Single Beam
[State -1, Single Upwards Beam]
type = ChangeState
value = 1200
triggerall = command = "FDF_a"
triggerall = statetype != A
triggerall = (helper(6500),stateno != [6531,6533]) || var(2) = 0
triggerall = (helper(6700),stateno != [6731,6733]) || var(2) <2
trigger1 = ctrl
trigger2 = (stateno = [200,499]) && var(1) 
trigger3 = 0;(stateno = [1400,1499]) && var(1) 
trigger4 = stateno = 1520 && var(1) 
;---------------------------------------------------------------------------
;Straight Single Beam
[State -1, Straight Single Beam]
type = ChangeState
value = 1000
triggerall = command = "QCF_a"
triggerall = statetype != A
triggerall = (helper(6500),stateno != [6511,6513]) || var(2) = 0
triggerall = (helper(6700),stateno != [6711,6713]) || var(2) <2
trigger1 = ctrl
trigger2 = (stateno = [200,499]) && var(1) 
trigger3 = (stateno = [1450,1499]) && var(1) 
trigger4 = stateno = 1530 && var(1) 

;Multiple Straight Beam
[State -1, Multiple Straight Beam]
type = ChangeState
value = 1100
triggerall = command = "QCF_b"
triggerall = statetype != A
triggerall = (helper(6500),stateno != [6521,6523]) || var(2) = 0
triggerall = (helper(6700),stateno != [6721,6723]) || var(2) <2
trigger1 = ctrl
trigger2 = (stateno = [200,499]) && var(1) 
trigger3 = (stateno = [1450,1499]) && var(1) 
trigger4 = stateno = 1530 && var(1) 


;---------------------------------------------------

;Air Downwards Beam
[State -1, Air Sraight Beam]
type = ChangeState
value = 1700
triggerall = command = "QCF_a"
triggerall = statetype = A
triggerall = (helper(6500),stateno != [6511,6513]) || var(2) = 0
triggerall = (helper(6700),stateno != [6711,6713]) || var(2) <2
triggerall=cond(vel Y <0,pos Y <=-49,1)
trigger1 = ctrl
Trigger2 = StateNo = [600,699]
Trigger2 = var(1)



;Air Straight Beam
[State -1, Air Sraight Beam]
type = ChangeState
value = 1800
triggerall = command = "QCF_b"
triggerall = statetype = A
triggerall = (helper(6500),stateno != [6511,6513]) || var(2) = 0
triggerall = (helper(6700),stateno != [6711,6713]) || var(2) <2
triggerall=cond(vel Y <0,pos Y <=-49,1)
trigger1 = ctrl
Trigger2 = StateNo = [600,699]
Trigger2 = var(1)



;---------------------------------------------------------------------------

;AntiAir Throw
[State -1]
Type = ChangeState
value = 830
	TriggerAll=Alive!=0
	TriggerAll = StateType != A
	TriggerAll=command="DP_x"
	Trigger1=Ctrl
	trigger2=stateno=[100,101]


;Throw
[State -1]
Type = ChangeState
value = 800
triggerall = command = "x"
triggerall = statetype != A
triggerall = ctrl || stateno=[100,101]
trigger1 = command = "holdfwd"
trigger2 = command = "holdback"





;===========================================================================
[State -1,JumpC];ジャンプキャンセル
	Type=ChangeState
	value=40
	Triggerall = StateType != A
	TriggerAll = command = "holdup"
	Trigger1 = (stateno = 1200 && anim=1202) ||(stateno = 1200 && anim=1203)|| (stateno = 1300 && anim=1302) ||(stateno = 1300 && anim=1303 && animelemtime(13)>=0) || (stateno = 2200 && animelemtime(19)>=1);|| StateNo = 1520
	Trigger1 = var(1)
	trigger2 = stateno = 52
	Trigger2 = (!var(1) && time >= 3) ||(var(1) && time >= 9)
	trigger3=(stateno=100 && time>13) || (stateno=101)


[State -1,AirDash];空中ダッシュ
	Type=ChangeState
	value=110
	TriggerAll = command = "FF" || (command ="y" && command ="holdfwd")
	TriggerAll = StateType = A
	triggerall = ishelper = 0
	TriggerAll = pos Y <= -4 + (vel y > 0) * 5
	TriggerAll = anim != 110
	TriggerAll = var(17) < 2
	;TriggerAll = stateno != [1700,1750]
	Trigger1 = Ctrl
	Trigger2 = var(1)



;---------------------------------------------------------------------------
;Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall=var(7)<=2
triggerall = command = "FF" ||(Command = "holdfwd" && Command = "y" )
triggerall = statetype!=A
trigger1 = ctrl
trigger2=var(1) 
trigger2=stateno!=[2000,3999]
trigger3=var(1) 
trigger3=stateno!=[3000,3999]
trigger3=var(2)=2

;---------------------------------------------------------------------------
;Run Back
[State -1, Run Back]
type = ChangeState
value = 105
trigger1 = command = "BB"||(Command = "holdback" && Command = "y" )
trigger1 = statetype !=A
trigger1 = ctrl

;---------------------------------------------------------------------------
[State -1,Ball Charge];Ball Charge
	Type=ChangeState
	value=750
	TriggerAll=StateType!=A
	triggerall = stateno != 64
	triggerall = numhelper(6700) = 0
	Triggerall=command="hold_x"
	triggerall = !(command = "holdfwd") && !(command = "holdback")
	Trigger1=Ctrl
	;Trigger2=var(1)
	
;Spot Dodge
[State -1, 回避]
type = ChangeState
value = 107
triggerall = command = "y"
triggerall = !(command = "holdfwd") && !(command = "holdback")
triggerall = statetype != A
trigger1 = ctrl 
;trigger2=stateno=100
	



;===========================================================================
[State -1];Burst
type = ChangeState
value = ifelse(statetype !=A,860,870)
TriggerAll = Alive
triggerall = command = "recovery2"
triggerall = MoveType = H 
triggerall = var(14) = 0
trigger1 = stateno = 5000 && time > 0
trigger2 = stateno = 5010 && time > 0
trigger3 = stateno = 5020 && time > 0
trigger4 = stateno = 5070 && time > 0
trigger5 = stateno != 5000 && stateno != 5010 && stateno != 5020 && stateno != 5070
trigger5 = stateno = [5001,5099] 


[State -1,Charge];Charge
	Type=ChangeState
	value=700
	TriggerAll=StateType!=A
	trigger1 = stateno != 64
	TriggerAll=Power<PowerMax
	Triggerall=Ctrl
	
	Trigger1=command="hold_a"
	Trigger1=command="hold_c"
	Trigger2=command="hold_z"





;---------------------------------------------------------------------------

;---------------------------------------------------------------------------
;Low Jab
[State -1, Low Jab]
type = ChangeState
value = 400
triggerall = command = "a"
triggerall = command = "holddown"
triggerall = statetype !=A
trigger1 = ctrl
trigger2 = stateno = 400 && var(1)
trigger3=(stateno=100 && time>13) || (stateno=101)
;---------------------------------------------------------------------------
;Crouching Kick
[State -1, Crouching Kick]
type = ChangeState
value = 410
triggerall = command = "b"
triggerall = command = "holddown"
triggerall = statetype !=A
trigger1 = ctrl
trigger2 = stateno = 400 && var(1)
trigger3 = stateno = 205 && var(1)
trigger4=(stateno=100 && time>13) || (stateno=101)
;---------------------------------------------------------------------------
;Sweep
[State -1, Sweep]
type = ChangeState
value = 420
triggerall = command = "c"
triggerall = command = "holddown"
triggerall = statetype !=A
trigger1 = ctrl
trigger2 = stateno = 400 && var(1)
trigger3 = stateno = 410 && var(1)
trigger4 = stateno = 205 && var(1)
trigger5=(stateno=100 && time>13) || (stateno=101)
;=================================================

;LowKick
[State -1, Low Kick]
type = ChangeState
value = 205
triggerall = command = "a"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype !=A
trigger1 = ctrl
Trigger2 = StateNo = 200 && var(1) 
trigger3=(stateno=100 && time>13) || (stateno=101)

;Standing Jab
[State -1, Standing Jab]
type = ChangeState
value = 200
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype !=A
trigger1 = ctrl
Trigger2 = StateNo = 200 && (var(1) || animelemtime(4)>=0)
Trigger3 = StateNo = 205 && var(1)
trigger4=(stateno=100 && time>13) || (stateno=101)


;---------------------------------------------------------------------------

;Side Kick
[State -1, Side Kick]
type = ChangeState
value = 210

triggerall = command = "b"
triggerall = command = "holdback"
triggerall = command != "holddown"
trigger1 = statetype !=A
trigger1 = ctrl
trigger2 = (stateno = 200) && var(1)
Trigger3 = StateNo = 205 && var(1)
trigger4=(stateno=100 && time>13) || (stateno=101)


;Standing Knee
[State -1, Standing Knee]
type = ChangeState
value = 215
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype !=A
trigger1 = ctrl
Trigger2 = StateNo = 200 && var(1)
Trigger3 = StateNo = 205 && var(1)
trigger4=(stateno=100 && time>13) || (stateno=101)


[State -1, Step On]
type = ChangeState
value = 240
triggerall = command = "c"
triggerall = command = "holdback"
triggerall = command != "holddown"
;triggerall = stateno != 220 && prevstateno != 220
trigger1 = statetype !=A
trigger1 = ctrl
trigger2 = (stateno = 200) && var(1)
trigger3 = (stateno = 210) && var(1)
trigger4 = (stateno = 215) && var(1)
trigger5 = (stateno = 205) && var(1)
trigger6 = (stateno = 420) && var(1)
trigger7 = (stateno = 1550) && var(1)
trigger8=(stateno=100 && time>13) || (stateno=101)
trigger9=stateno=810 && var(1)
trigger10=stateno=840 && var(1)

[State -1, Step On]
type = ChangeState
value = 240
triggerall = command = "c"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
;triggerall = stateno != 220 && prevstateno != 220
trigger1=stateno=810 && var(1)
trigger2=stateno=840 && var(1)

[State -1, Front Kick]
type = ChangeState
value = 230
triggerall = command = "c"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
;triggerall = stateno != 220 && prevstateno != 220
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && var(1)
trigger3 = (stateno = 210) && var(1)
trigger4 = (stateno = 215) && var(1)
trigger5 = (stateno = 205) && var(1)
trigger6=(stateno=100 && time>13) || (stateno=101)

;High Kick
[State -1, High Kick]
type = ChangeState
value = 220
triggerall = command = "c"
triggerall = command != "holddown"
trigger1 = statetype !=A
trigger1 = ctrl
trigger2 = (stateno = 200) && var(1)
trigger3 = (stateno = 210) && var(1)
trigger4 = (stateno = 215) && var(1)
trigger5 = (stateno = 205) && var(1)
trigger6=(stateno=100 && time>8) ||(stateno=101)



;---------------------------------------------------------------------------

;---------------------------------------------------------------------------

;---------------------------------------------------------------------------


;---------------------------------------------------------------------------

;---------------------------------------------------------------------------
;Air jab
[State -1, Air jab]
type = ChangeState
value = 600
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = ctrl


;---------------------------------------------------------------------------
;Air Kick
[State -1, Air Kick]
type = ChangeState
value = 610
triggerall = command = "b"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 && var(1)


;---------------------------------------------------------------------------

;Air Strong Kick
[State -1, Air Strong Kick]
type = ChangeState
value = 620
triggerall = command = "c"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 && var(1)
trigger3 = stateno = 610 && var(1)


;---------------------------------------------------------------------------
