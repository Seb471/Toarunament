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
name = "HCF_c"  
command = ~B, DB, D, DF, F, c
time = 32
buffer.Time=16

[Command]
name = "HCF_b"  
command = ~B, DB, D, DF, F, b
time = 32
buffer.Time=16

[Command]
name = "RDP_c"
command = ~B,DB,D,DB,c
Time=20
buffer.Time=10


;-| Super Motions |--------------------------------------------------------


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
name = "QCB_c"
command = ~D, DB, B, c
time = 20
buffer.time = 10

;-| Special Motions |------------------------------------------------------

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
name = "QCB_a"
command = ~D, DB, B, a
time = 20
buffer.time = 10

[Command]
name = "QCB_b"
command = ~D, DB, B, b
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

;===========================================================================
;---------------------------------------------------------------------------

;GT Hyper
[State -1, Run EX]
type = ChangeState
value = 3100
triggerall = command = "HCB_c"
TriggerAll = Power>2999 
TriggerAll = stateno != [3000,3199] 
triggerall=(var(2)=1)
trigger1 = ctrl
trigger2 =var(1)
trigger3= (stateno=[750,760]) && stateno!=751


;Fullscreen Hyper
[State -1, Run EX]
type = ChangeState
value = 3000
triggerall = command = "HCF_c"
triggerall = statetype !=A
TriggerAll = Power>2999 
TriggerAll = stateno != [3000,3199] 
triggerall=(var(2)=1) ||(life<=lifemax*0.5)
trigger1 = ctrl
trigger2 =var(1)



;Lightning Hyper
[State -1, Run EX]
type = ChangeState
value = 2800
triggerall = command = "HCF_b"
triggerall = statetype !=A
TriggerAll = Power>999 
TriggerAll = stateno != [2800,3199] 
triggerall=(var(2)=1) ||(life<=lifemax*0.5)
trigger1 = ctrl
trigger2 =var(1)


;Slash Lvl2
[State -1, Run EX]
type = ChangeState
value = 2500
triggerall = command = "RDP_c"
;triggerall = statetype !=A
TriggerAll = Power>1999 
TriggerAll = stateno != 2500
TriggerAll = stateno != [3000,3199] 
triggerall=(var(2)=1)
trigger1 = ctrl
trigger2 =var(1)





;===========================================================================
;This is not a move, but it sets up var(1) to be 1 if conditions are right
;for a combo into a special move (used below).
;Since a lot of special moves rely on the same conditions, this reduces
;redundant logic.


;Air Sword Slashes EX
[State -1, Air Sword EX]
type = ChangeState
value = 2300
triggerall=var(9)<=3
triggerall=(var(2)=1)
triggerall = command = "QCF_c"
triggerall=pos Y <-5
triggerall = statetype =A
TriggerAll = stateno != [1200,1250] 
TriggerAll = stateno != [2300,2399] 
TriggerAll = stateno != [2500,3199] 
TriggerAll = Power>999 
trigger1 = ctrl
trigger2 = var(1)



;DP EX
[State -1, Run EX]
type = ChangeState
value = 2200
triggerall = command = "DP_c"
triggerall = statetype !=A
TriggerAll = Power>999 
TriggerAll =( stateno != [2500,3199] )
trigger1 = ctrl
trigger2 =var(1)


;Run EX
[State -1, Run EX]
type = ChangeState
value = 2000
triggerall = command = "QCF_c"
triggerall = statetype !=A
TriggerAll = Power>999 
TriggerAll = (stateno != [2000,2005])
TriggerAll = (stateno != [2500,3199])
trigger1 = ctrl
trigger2 =var(1)

;Tackle EX
[State -1, Run EX]
type = ChangeState
value = 2100
triggerall = command = "QCB_c"
triggerall = statetype !=A
TriggerAll = Power>999 
;TriggerAll = stateno != 2100
TriggerAll = (stateno != [2500,3199])
trigger1 = ctrl
trigger2 =var(1)



;==========================================================================


;Air Sword Slashes A
[State -1, Air Sword A]
type = ChangeState
value = 1300
triggerall=(var(2)=1)
triggerall = command = "QCF_a"
triggerall=pos Y <-5
triggerall = statetype =A
trigger1 = ctrl
Trigger2 = StateNo = [600,699] 
trigger2 = var(1)
Trigger3 = StateNo = 1260
trigger3 = var(1)


;Air Sword Slashes B
[State -1, Air Sword B]
type = ChangeState
value = 1350
triggerall=(var(2)=1)
triggerall = command = "QCF_b"
triggerall=pos Y <-5
triggerall = statetype =A
trigger1 = ctrl
Trigger2 = StateNo = [600,699] 
trigger2 = var(1)
Trigger3 = StateNo = 1260
trigger3 = var(1)


;---------------------------------------------------------------------------
;DP A 
[State -1, DP A]
type = ChangeState
value = 1200
triggerall = command = "DP_a"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = StateNo = [200,499] 
trigger2 = var(1)

;DP B
[State -1, DP B]
type = ChangeState
value = 1250
triggerall = command = "DP_b"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = StateNo = [200,499] 
trigger2 = var(1)

;DP A Followup
[State -1, DP A]
type = ChangeState
value = 1260
triggerall=var(2)=1
triggerall = command = "a"
trigger1 = stateno = 1200
trigger1=animelemno(0)=[9,12]
Trigger2 = StateNo = 1250
trigger2=animelemno(0)=[13,16]
Trigger3 = StateNo = 2200
trigger3=animelemno(0)=[13,16]

;DP B Followup
[State -1, DP A]
type = ChangeState
value = 1270
triggerall=var(2)=1
triggerall = command = "b"
trigger1 = stateno = 1200
trigger1=animelemno(0)=[9,12]
Trigger2 = StateNo = 1250
trigger2=animelemno(0)=[13,16]
Trigger3 = StateNo = 2200
trigger3=animelemno(0)=[13,16]

;DP C Followup
[State -1, DP A]
type = ChangeState
value = 1280
triggerall=var(2)=1
triggerall = command = "c" || command = "hold_c"
trigger1 = stateno = 1200
trigger1=animelemno(0)=[9,13]
Trigger2 = StateNo = 1250
trigger2=animelemno(0)=[13,17]
Trigger3 = StateNo = 2200
trigger3=animelemno(0)=[13,17]






;-----------------------






;Lunge A
[State -1, Lunge A]
type = ChangeState
value = 1000
triggerall = command = "QCF_a"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = StateNo = [200,499] 
trigger2 = var(1)

;Lunge B
[State -1, Lunge B]
type = ChangeState
value = 1050
triggerall = command = "QCF_b"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = StateNo = [200,499] 
trigger2 = var(1)

;----------------------------

;Tackle A
[State -1, Tackle A]
type = ChangeState
value = 1100
triggerall = command = "QCB_a"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = StateNo = [200,499] 
trigger2 = var(1)
trigger3=stateno=[100,102]

;Tackle B
[State -1, Tackle B]
type = ChangeState
value = 1150
triggerall = command = "QCB_b"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = StateNo = [200,499] 
trigger2 = var(1)
trigger3=stateno=[100,102]



;===========================================================================
[State -1,JumpC];ジャンプキャンセル
	Type=ChangeState
	value=40
	Triggerall = StateType != A
	TriggerAll = command = "holdup"
	Trigger1 = 0
	Trigger1 = var(1)
	trigger2 = stateno = 52
	Trigger2 = (!var(1) && time >= 3) ||(var(1) && time >= 9)
	trigger3=(stateno=100 && time>13) || (stateno=101)

;Air Jump
[State -1]
Type = ChangeState
Value = 45
triggerall=var(2)=1
TriggerAll = StateType = A
TriggerAll = Command = "holdup"
triggerall=var(23)<1
Trigger1 = StateNo = 50 && Time >= 20 || StateNo = 110 || StateNo = 115 || StateNo = 120 || StateNo = 132 || StateNo = 140 || StateNo = 155
Trigger1 = Ctrl
;Trigger1 = Var(2)/100%10 >= 3 && MoveType != H
;trigger2=var(1)
;trigger2=(Stateno = [600,699]) || (stateno= [1020,1030]) || (stateno= [1110,1111])


;-----------------------------------------------------
[State -1,AirDash];空中ダッシュ
	Type=ChangeState
	value=110
	triggerall=var(2)=1
	TriggerAll = command = "FF" ||(Command = "holdfwd" && Command = "y" )
	TriggerAll = StateType = A
	triggerall = ishelper = 0
	TriggerAll = pos Y <= -4 + (vel y > 0) * 5
	TriggerAll = anim != 110
	TriggerAll = var(17) < 2
	TriggerAll = stateno != [2000,3199] 
	Trigger1 = Ctrl
	Trigger2 = var(1)

[State -1, Backairdash];
	Type=ChangeState
	value=115
	triggerall=var(2)=1
	TriggerAll = Alive
	TriggerAll = command="BB" ||(Command = "holdback" && Command = "y" )
	TriggerAll = StateType=A
	triggerall = ishelper = 0
	TriggerAll = pos Y <= -4 + (vel y > 0) * 5
	TriggerAll = var(17) < 2
	TriggerAll = anim!=115
	TriggerAll = stateno != [2000,3199] 
	triggerall=stateno!=105
	Trigger1 = Ctrl
	trigger2 = var(1)




;---------------------------------------------------------------------------
;Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall = command = "FF" ||(Command = "holdfwd" && Command = "y" )
triggerall = statetype!=A
triggerall=stateno!=100
triggerall=stateno!=102
triggerall=var(2)=0
trigger1 = ctrl

;Angel Dash
[State -1, Run Fwd]
type = ChangeState
value = 102
triggerall = command = "FF" ||(Command = "holdfwd" && Command = "y" )
triggerall = statetype!=A
triggerall=stateno!=100
triggerall=stateno!=102
triggerall=var(2)=1
trigger1 = ctrl


;---------------------------------------------------------------------------
;Run Back
[State -1, Run Back]
type = ChangeState
value = 105
triggerall = command = "BB" ||(Command = "holdback" && Command = "y" )
triggerall = statetype!=A
trigger1 = ctrl


;DBFZ Dash Ctrl
[State -1, Phase Out]
type = ChangeState
value = 770
triggerall=var(9)<=2
triggerall = var(2)=1
triggerall = Command = "y" ;command ="holdup" && 
triggerall=stateno!=770
triggerall=stateno!=[100,115]
trigger1 = ctrl
trigger2= stateno=40 && time<10
trigger3= stateno=50 && time<10

;DBFZ Dash Confirm
[State -1, Phase Out]
type = ChangeState
value = 775
triggerall=var(9)<=2
triggerall = var(2)=1
triggerall =  Command = "y" ;command ="holdup" &&
TriggerAll = StateType=A
triggerall=stateno!=[100,115]
TriggerAll = stateno != [2800,3199] 
triggerall=stateno!=770
triggerall=stateno!=775
trigger1 = var(1)


;----------------------------------------------------------------------------
;Phase Out
[State -1, Phase Out]
type = ChangeState
value = 750
triggerall = command = "hold_z"
triggerall = statetype!=A
triggerall=stateno!=750
trigger1 = ctrl

;Air Phase Out
[State -1, Phase Out]
type = ChangeState
value = 760
triggerall = var(2)=1
triggerall = command = "hold_z"
triggerall = statetype=A
triggerall=stateno!=760
trigger1 = ctrl

;-------------------------

[State -1,Charge];Charge
	Type=ChangeState
	value=700
	TriggerAll=StateType!=A
	Trigger1=command="hold_a"
	Trigger1=command="hold_c"
	TriggerAll=Power<PowerMax
	Trigger1=Ctrl
	
;---------------------------------------------------------------------------
;Throw
[State -1, Throw]
type = ChangeState
value = 800
triggerall = command = "x"
triggerall = statetype != A
triggerall = ctrl || stateno=[100,102]
trigger1 = command = "holdfwd"
trigger2 = command = "holdback"

;Scales Summon
[State -1,Scales Summon]
	Type=ChangeState
	value=725
	TriggerAll=StateType!=A
	Triggerall=command="hold_x"
	triggerall=!((numhelper(725)!=0) && (numhelper(726)!=0))
	Trigger1=Ctrl


;===========================================================================
;Crouching Jab
[State -1, Crouching Jab]
type = ChangeState
value = 400
triggerall = command = "a"
triggerall = command = "holddown"
triggerall = statetype!=A
trigger1 = ctrl
trigger2 = stateno = 400 && var(1)
trigger3=stateno=[100,102]

;Crouching Push
[State -1, Crouching Push]
type = ChangeState
value = 410
triggerall = command = "b"
triggerall = command = "holddown"
triggerall = statetype !=A 
trigger1 = ctrl
trigger2 = stateno = 400 && var(1)
trigger3=stateno=[100,102]

;Crouching Sweep
[State -1, Crouching Sweep]
type = ChangeState
value = 425
triggerall = command = "c"
triggerall = command = "holddown"
triggerall = statetype !=A 
trigger1 = ctrl
Trigger2 = StateNo = 400 && var(1)
Trigger3 = StateNo = 410 && var(1)
trigger4=stateno=[100,102]



;===========================================================================
;Standing Jab
[State -1, Standing Jab]
type = ChangeState
value = 200
triggerall = command = "a"
triggerall = command != "holddown"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = StateNo = 200 && (var(1) || animelemtime(4)>=2)
trigger3=stateno=[100,102]

;Standing Push
[State -1, Standing Push]
type = ChangeState
value = 210
triggerall = command = "b"
triggerall = command != "holddown"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = StateNo = 200 && (var(1))
trigger3=stateno=[100,102]

;Standing Double Kick
[State -1, Standing Double Kick]
type = ChangeState
value = 230
triggerall = command = "c"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = StateNo = 220 && (var(1))
trigger3=stateno=[100,102]

;Standing Strong Push
[State -1, Standing High Kick]
type = ChangeState
value = 220
triggerall = command = "c"
triggerall = command != "holddown"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = StateNo = 200 && (var(1))
Trigger3 = StateNo = 210 && (var(1))
trigger4=stateno=[100,102]


;==========================================================
;Air jab
[State -1,Air Jab]
	Type=ChangeState
	value=600
	TriggerAll=command="a"
	Triggerall = StateType = A
	Trigger1 = Ctrl

;Air Low Punch
[State -1,Air Arc Blades]
	Type=ChangeState
	value=610
	TriggerAll=command="b"
	Triggerall = StateType = A
	Trigger1 = Ctrl
	Trigger2 = stateno=600 & var(1)

;Air Down Kick
[State -1,Air Arc Blades]
	Type=ChangeState
	value=625
	TriggerAll=command="holddown"
	TriggerAll=command="c"
	Triggerall = StateType = A
	Trigger1 = Ctrl
	Trigger2 = stateno=600 & var(1)
	Trigger3 = stateno=610 & var(1)

;Air Kick
[State -1,Air Arc Blades]
	Type=ChangeState
	value=620
	TriggerAll=command="c"
	Triggerall = StateType = A
	Trigger1 = Ctrl
	Trigger2 = stateno=600 & var(1)
	Trigger3 = stateno=610 & var(1)




