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
;

[Command]
name = "Red Spell"
command = ~B,DB,D, DF, F, c
Time=32
buffer.Time=16


[Command]
name = "BlackSpellDragon"
command = ~D, DF, F, c
time = 20
buffer.time = 10

[Command]
name = "QCB_c"
command = ~D, DB, B, c
time = 20
buffer.time = 10

[Command]
name = "WaterPillarZone"
command = ~D,D,c
time = 20
buffer.time = 10


;-| Special Motions |------------------------------------------------------

[Command]
name = "Seiryu"
command = ~F,D,DF, x
time = 20
buffer.time = 10

[Command]
name = "Genbu"
command = ~D, DF, F, x
time = 20
buffer.time = 10

[Command]
name = "Byakko"
command = ~D,D,x
time = 20
buffer.time = 10

[Command]
name = "Suzaku"
command = ~D, DB, B, x
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

[Command]
name = "OrangeSpell"
command = ~D, DF, F, a
time = 20
buffer.time = 10

[Command]
name = "BlackSpellInstant"
command =~DF, F, DF, F, b ;~D, DF, F, D, DF, F, b
time = 32
buffer.time = 20

[Command]
name = "BlackSpellInstant"
command =~D,DF, F, DF, F, b ;~D, DF, F, D, DF, F, b
time = 32
buffer.time = 20

[Command]
name = "BlackSpell"
command = ~D, DF, F, b
time = 20
buffer.time = 10

[Command]
name = "ShortWaterPillar"
command = ~D,D,a
time = 20
buffer.time = 10

[Command]
name = "TallWaterPillar"
command = ~D,D,b
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

[Command]
name = "a+b"
command = a+b

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

;-| Dir |-------------------------------------------------------------------

[command]
name = "fwd"
command = F
time = 0

[command]
name = "back"
command = B
time = 0

[Command]
name = "up" 
command = U
time = 0

[Command]
name = "down"
command = D
time = 0


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
;===========================================================================
;This is not a move, but it sets up var(1) to be 1 if conditions are right
;for a combo into a special move (used below).
;Since a lot of special moves rely on the same conditions, this reduces
;redundant logic.
[State -1, Combo condition Reset]
type = VarSet
trigger1 = movetype=H
trigger2 = (stateno = [0,160]) && (stateno!=100)
var(1) = 0
ignorehitpause=1

;[State -1, Combo condition Check]
;type = VarSet
;trigger1 = statetype != A
;trigger1 = ctrl
;trigger2 = (stateno = [200,299]) || (stateno = [400,499])
;trigger2 = stateno != 440 ;Except for sweep kick
;trigger2 = movecontact
;trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
;var(1) = 1

;Seiryu
[State -1, Seiryu]
type = ChangeState
value = 6330
triggerall = command = "Seiryu"
triggerall = statetype !=A
triggerall = var(24) =0
trigger1 = ctrl
trigger2 = var(1)

;Genbu
[State -1, Genbu]
type = ChangeState
value = 6300
triggerall = command = "Genbu"
triggerall = statetype !=A
triggerall = var(21) =0
trigger1 = ctrl
trigger2 = var(1)

;Byakko
[State -1, Byakko]
type = ChangeState
value = 6310
triggerall = command = "Byakko"
triggerall = statetype !=A
triggerall = var(22) =0
trigger1 = ctrl
trigger2 = var(1)

;Suzaku
[State -1, Suzaku]
type = ChangeState
value = 6320
triggerall = command = "Suzaku"
triggerall = statetype !=A
triggerall = var(23) =0
trigger1 = ctrl
trigger2 = var(1)

[State -1, Custom Combo]
type = ChangeState
value = 900
triggerall = statetype !=A
triggerall = command = "x+a"
triggerall = RoundState = 2
triggerall =  var(21) && var(22) && var(23) && var(24)
triggerall = fvar(20) = 0
trigger1 = ctrl || StateNo = 52 || (StateNo = 100)
trigger2= var(1)

[State -1, Heat Mode]
type = ChangeState
value = 920
triggerall = statetype !=A
triggerall = command = "x+c"
triggerall = RoundState = 2
triggerall = power >= 1000 && var(21) && var(22) && var(23) && var(24)
triggerall = fvar(18) = 0
trigger1 = ctrl || StateNo = 52 || (StateNo = 100)
trigger2= var(1)


;---------------------------------------------------------

;Red Spell (Ultimate)
[State -1, Red Spell (Ultimate)]
type = ChangeState
value = 3000
triggerall = command = "Red Spell"
triggerall = statetype !=A
TriggerAll = power >= 5000 
triggerall = (var(21) && var(22) && var(23) && var(24)) || (life <=0.2*lifemax)
TriggerAll = stateno != 3000 && stateno != 3001 && stateno!=6000 && stateno!=3010
;triggerall =numhelper(2050) = 0
trigger1 = ctrl
;trigger2 =var(1)
;trigger3 = var(4)

;Red Spell (Nerfed)
[State -1, Red Spell (Nerfed)]
type = ChangeState
value = 3001
triggerall = command = "Red Spell"
triggerall = statetype !=A
TriggerAll = fvar(18)>0
TriggerAll = stateno != 3000 && stateno != 3001 && stateno!=6000 && stateno!=3010
;triggerall =numhelper(2050) = 0
trigger1 = ctrl
trigger2 =var(1)
;trigger3 = var(4)


;Black Spell Dragon
[State -1, Black Spell Dragon]
type = ChangeState
value = 2000
triggerall = command = "BlackSpellDragon"
triggerall = statetype !=A
TriggerAll = Power>999 || fvar(18)>0
TriggerAll = stateno != 2000 || fvar(18)>0
triggerall= stateno!=6000
TriggerAll = stateno != 3000 && stateno != 3001 && stateno!=3010
triggerall =numhelper(2050) = 0 || fvar(18)>0
trigger1 = ctrl
trigger2 =var(1)
trigger3 = var(4)

;Lunge Punch EX
[State -1, Lunge Punch EX]
type = ChangeState
value = 2100
triggerall = command = "QCB_c"
triggerall = statetype !=A
TriggerAll = Power>999 || fvar(18)>0
TriggerAll = stateno != 2100 && stateno!=6000
TriggerAll = stateno != 3000 && stateno != 3001 && stateno!=3010
trigger1 = ctrl
trigger2 = var(1)
trigger3 = var(4)
trigger4 = stateno = 751
trigger5 = stateno = 102

;Water Pillar Zone
[State -1, Water Pillar Zone]
type = ChangeState
value = 2200
triggerall = command = "WaterPillarZone"
triggerall = statetype !=A
TriggerAll = Power>999 || fvar(18)>0
TriggerAll = stateno != 2200 && stateno!=6000
TriggerAll = stateno != 3000 && stateno != 3001 && stateno!=3010
trigger1 = ctrl
trigger2 =var(1)
trigger3 = var(4)

;Diving Magic EX
[State -1, Diving Magic EX]
type = ChangeState
value = 2300
triggerall = command = "QCB_c"
triggerall = statetype =A
TriggerAll = Power>999 || fvar(18)>0
TriggerAll = stateno != 2300 && stateno!=6000
TriggerAll = stateno != 3000 && stateno != 3001 && stateno!=3010
trigger1 = ctrl
trigger2 =var(1)
trigger3 = var(4)

;---------------------------------------------------------

;Orange Spell (Fire)
[State -1, Orange Spell (Fire)]
type = ChangeState
value = 1000
triggerall = command = "OrangeSpell"
triggerall = statetype !=A
trigger1 = ctrl
trigger2 =(StateNo=[200,499]) && var(1)
trigger3 = var(4)

;Black Spell (Water) Instant
[State -1, Black Spell (Water) Instant]
type = ChangeState
value = 1160
triggerall = command = "BlackSpellInstant"
triggerall = statetype !=A
triggerall = var(21) = 1
trigger1 = ctrl
trigger2 =(StateNo=[200,499]) && var(1)
trigger3 = var(4)
trigger4 =(StateNo=2350) && var(1)

;Black Spell (Water)
[State -1, Black Spell (Water)]
type = ChangeState
value = 1100
triggerall = command = "BlackSpell"
triggerall = statetype !=A
trigger1 = ctrl
trigger2 =(StateNo=[200,499]) && var(1)
trigger3 = var(4)
trigger4 =(StateNo=2350) && var(1)

;Swift Punch
[State -1, Swift Punch]
type = ChangeState
value = 1200
triggerall = command = "QCB_a"
triggerall = statetype !=A
trigger1 = ctrl
trigger2 =(StateNo=[200,499]) && var(1)
trigger3 = var(4)
trigger4 = stateno = 751
trigger5 = stateno = 102

;Lunge Punch
[State -1, Lunge Punch]
type = ChangeState
value = 1300
triggerall = command = "QCB_b"
triggerall = statetype !=A
trigger1 = ctrl
trigger2 =(StateNo=[200,499]) && var(1)
trigger3 = var(4)
trigger4 = stateno = 751
trigger5 = stateno = 102

;Short Water Pillar
[State -1, Short Water Pillar]
type = ChangeState
value = 1400
triggerall = command = "ShortWaterPillar"
triggerall = statetype !=A
trigger1 = ctrl
trigger2 =(StateNo=[200,499]) && var(1)
trigger3 = var(4)
trigger4 =(StateNo=2100) && var(1)
trigger5 =(StateNo=1300) && var(1)
trigger6 =(StateNo=1701) && var(1)

;Tall Water Pillar
[State -1, Tall Water Pillar]
type = ChangeState
value = 1450
triggerall = command = "TallWaterPillar"
triggerall = statetype !=A
trigger1 = ctrl
trigger2 =(StateNo=[200,499]) && var(1)
trigger3 = var(4)
trigger4 =(StateNo=1300) && var(1)

[State -1,DivekickShort]
	Type=ChangeState
	value=1700
	TriggerAll = command = "QCB_a"
	TriggerAll = StateType = A
	TriggerAll = (pos Y <= -30 && stateno = 630) || pos Y <= -65;-15
	Trigger1 = Ctrl
	Trigger2 = StateNo = [600,699]
	Trigger2 = var(1)
	trigger3 = var(4)

[State -1,DivekickLong]
	Type=ChangeState
	value=1750
	TriggerAll = command = "QCB_b"
	TriggerAll = StateType = A
	TriggerAll =(pos Y <= -30 && stateno = 630) || pos Y <= -65 
	Trigger1 = Ctrl
	Trigger2 = StateNo = [600,699]
	Trigger2 = var(1)
	trigger3 = var(4)

;===========================================================================
;---------------------------------------------------------------------------

[State -1,JumpC];ジャンプキャンセル
	Type=ChangeState
	value=40
	TriggerAll = StateType != A
	TriggerAll = command = "holdup"
	Trigger1 = StateNo = 1400
	Trigger1 = var(1)
	trigger2 = stateno = 53
	Trigger2 = (!var(1) && time >= 3) ||(var(1) && time >= 9)
	trigger3=(stateno=100 && var(1))

;---------------------------------------------------------------------------
;Throw
[State -1, Throw]
Type = ChangeState
Value = 800
triggerall = command = "x"
triggerall = statetype != A
triggerall = command = "holdfwd" || command = "holdback" 
trigger1 = ctrl
trigger2 = stateno=[100,101]

;Back Ducking Step
[State -1, Forward Dodge]
type = ChangeState
value = 104
triggerall = stateno != 101
triggerall = stateno != 105
triggerall = stateno != 6000
triggerall = stateno != [2000,3100]
triggerall = command = "holdback" && command = "z"
triggerall = statetype!=A
trigger1 = ctrl
trigger2 = var(4)
trigger3 = stateno = 195

;Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall = stateno != 100
triggerall = stateno != 105
triggerall = command = "FF"
triggerall = statetype = S
trigger1 = ctrl
trigger2=var(1)

;Front Ducking Step
[State -1, Forward Dodge]
type = ChangeState
value = 102
triggerall = stateno != 101
triggerall = stateno != 105
triggerall = stateno != 6000
triggerall = stateno != [2000,3100]
triggerall = command = "holdfwd" && command = "z"
triggerall = statetype!=A
trigger1 = ctrl
trigger2 = var(4)
trigger3 = stateno = 195

;Forward Dodge
[State -1, Forward Dodge]
type = ChangeState
value = 101
triggerall = stateno != 101
triggerall = stateno != 105
triggerall = stateno != 6000
triggerall = stateno != [2000,3100]
triggerall = command = "holdfwd" && command = "y"
triggerall = statetype!=A
trigger1 = ctrl
trigger2 = var(1) 
trigger3 = var(4)
trigger4 = stateno = 102
trigger5 = stateno = 195

;Fake Spot Dodge
[State -1, Spot Dodge]
type = ChangeState
value = 751
triggerall = stateno != 100
triggerall = stateno != 101
triggerall = stateno != 105
triggerall = stateno != [2000,3100]
triggerall = command = "z"
triggerall = statetype!=A
trigger1 = ctrl
trigger2 = var(4)
trigger3 = stateno = 195

;Spot Dodge
[State -1, Spot Dodge]
type = ChangeState
value = 750
triggerall = stateno != 100
triggerall = stateno != 101
triggerall = stateno != 105
triggerall = stateno != [2000,3100]
triggerall = command = "y"
triggerall = statetype!=A
trigger1 = ctrl
trigger2 = var(1) 
trigger3 = var(4)
trigger4 = stateno = 195

;Magic Parry
[State -1, Magic Parry]
type = ChangeState
value = 760
triggerall = stateno != 100
triggerall = stateno != 101
triggerall = stateno != 105
triggerall = command = "x"
triggerall = statetype!=A
trigger1 = ctrl



;---------------------------------------------------------------------------
;Run Back
[State -1, Run Back]
type = ChangeState
value = 105
triggerall = stateno != 105
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl

[State -1,AirDash];空中ダッシュ
	Type=ChangeState
	value=110
	TriggerAll = command = "FF"
	TriggerAll = StateType = A
	triggerall = ishelper = 0
	TriggerAll = pos Y <= -30 + (vel y > 0) * 20
	TriggerAll = anim != 110
	TriggerAll = var(17) < 2
	;TriggerAll = stateno != [1700,1750]
	Trigger1 = Ctrl
	Trigger2 = var(1)

[State -1,Charge];Charge
	Type=ChangeState
	value=700
	TriggerAll=StateType!=A
	TriggerAll=command="hold_a"
	TriggerAll=command="hold_c"
	TriggerAll=Power<PowerMax
	Trigger1=Ctrl
	;trigger1 = stateno != 6470




;===========================================================================
;---------------------------------------------------------------------------
;Standing Elbow
[State -1, Standing Elbow]
type = ChangeState
value = 205
triggerall = command = "a"
triggerall = command = "holdback"
triggerall = command != "holddown"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = StateNo = 200 && (var(1) || animelemtime(4)>=0)
trigger3 = var(4)
trigger4=(stateno=100 && var(1)) 

;---------------------------------------------------------------------------
;Standing Jab
[State -1, Standing Jab]
type = ChangeState
value = 200
triggerall = command = "a"
triggerall = command != "holddown"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = StateNo = 200 && (var(1) || animelemtime(4)>=0)
trigger3 = var(4)
trigger4=(stateno=100 && var(1))

;---------------------------------------------------------------------------
;Standing Elbow
[State -1, Standing Elbow]
type = ChangeState
value = 215
triggerall = command = "b"
triggerall = command = "holdback"
triggerall = command != "holddown"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = StateNo = 200 && (var(1) || animelemtime(4)>=0)
trigger3 = var(4)
trigger4=(stateno=100 && var(1)) 

;---------------------------------------------------------------------------
;Standing Headbutt
[State -1, Standing Headbutt]
type = ChangeState
value = 210
triggerall = command = "b"
triggerall = command != "holddown"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = StateNo = 200 && (var(1) || animelemtime(4)>=0)
trigger3 = StateNo = 205 && var(1)
trigger4 = StateNo = 215 && var(1)
trigger5= stateno = 195 && animelemtime(4) >= 0
trigger6 = var(4)
trigger7=(stateno=100 && var(1)) 

;---------------------------------------------------------------------------

;Dodge Back Gun
[State -1, Dodge Back Gun]
type = ChangeState
value = 240
triggerall = command = "c"
triggerall = command = "holdback"
triggerall = command != "holddown"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = StateNo = 200 && (var(1) || animelemtime(4)>=0)
trigger3 = StateNo = 205 && var(1)
trigger4 = StateNo = 215 && var(1)
trigger5= stateno = 210 && var(1)
trigger6= stateno = 230 && var(1)
trigger7 =stateno = 231 && var(1)
trigger8 = var(4) && stateno !=240
trigger9=(stateno=100 && var(1)) 

;Back Gun Followup
[State -1, Back Gun Followup]
type = ChangeState
value = 241
triggerall = command = "c"
;triggerall = command = "holdback"
triggerall = command != "holddown"
triggerall = statetype !=A
triggerall = var(5) <3 
Trigger1 = stateno = 240 && animelemtime(19)>=0
trigger2 = StateNo = 241 && animelemtime(5)>=0


;Standing Gun
[State -1, Standing Gun]
type = ChangeState
value = 230
triggerall = command = "c"
triggerall = command != "holddown"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = StateNo = 200 && (var(1) || animelemtime(4)>=0)
trigger3 = StateNo = 205 && var(1)
trigger4= stateno = 210 && var(1)
trigger5 = StateNo = 215 && var(1)
trigger6 = var(4) && stateno !=230
trigger7 = var(4) && stateno =230 && (animelemtime(5)>=0)
trigger8=(stateno=100 && var(1)) 

;Gun Followup
[State -1, Gun Followup]
type = ChangeState
value = 231
triggerall = command = "c"
triggerall = command != "holdback"
triggerall = command != "holddown"
triggerall = statetype !=A
triggerall = var(5) <3 
Trigger1 = stateno = 230 && animelemtime(6)>=0
trigger2 = StateNo = 231 && animelemtime(3)>=0





;---------------------------------------------------------------------------

;---------------------------------------------------------------------------
;Taunt
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = command = "start"
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------


;---------------------------------------------------------------------------
;Crouching Jab
[State -1, Crouching Jab]
type = ChangeState
value = 400
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 400  &&  animelemtime(3) >= 1
trigger3 = var(4) 


;---------------------------------------------------------------------------
;Crouching Crouching Weak Low Kick
[State -1, Crouching Weak Low Kick]
type = ChangeState
value = 410
triggerall = command = "b"
triggerall = command = "holddown"
triggerall = statetype = C
trigger1 = ctrl
trigger2 = stateno = 400 && var(1)
trigger3 = var(4) 

;---------------------------------------------------------------------------
;Crouching Strong Kick
[State -1, Crouching Strong Kick]
type = ChangeState
value = 420
triggerall = command = "c"
triggerall = command = "holddown"
triggerall = statetype = C
trigger1 = ctrl
Trigger2 = StateNo = 400 && var(1)
Trigger3 = StateNo = 410 && var(1)
trigger4 = var(4) 

;---------------------------------------------------------------------------
;Air Knee
[State -1,Air Knee]
	Type=ChangeState
	value=600
	TriggerAll = command = "a"
	TriggerAll = StateType = A
	Trigger1 = Ctrl
	trigger2 = var(4)

;---------------------------------------------------------------------------
;Air FrontKick
[State -1,Air FrontKick]
	Type=ChangeState
	value=610
	TriggerAll = command = "b"
	TriggerAll = StateType = A
	Trigger1 = Ctrl
	trigger2 = stateno = 600 && var(1)
	trigger3 = var(4) 

;---------------------------------------------------------------------------
;Air Gun
[State -1, Air Gun]
type = ChangeState
value = 630
triggerall = command = "c"
TriggerAll = command = "holddown"
triggerall = statetype = A
Trigger1 = Ctrl
trigger2 = stateno = 600 && var(1) 
trigger3 = stateno = 610 && var(1)
trigger4 = stateno = 620 && var(1)
trigger5 = var(4) && stateno !=630
trigger6 = var(4) && stateno =630 && (animelemtime(6)>=0)
;---------------------------------------------------------------------------

;Air Punch
[State -1,Air Punch]
	Type=ChangeState
	value=620
	TriggerAll = command = "c"
	TriggerAll = StateType = A
	Trigger1 = Ctrl
	trigger2 = stateno = 600 && var(1) 
	trigger3 = stateno = 610 && var(1)
	trigger4 = var(4)

;---------------------------------------------------------------------------
