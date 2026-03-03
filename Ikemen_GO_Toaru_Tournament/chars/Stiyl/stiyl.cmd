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
name = "HCB_c"
command = ~F,DF,D,DB,B, c
time = 32
buffer.Time=16


[Command]
name = "41236_c"
command = ~B, DB, D, DF, F, c
time = 32
buffer.Time=16


[Command]
name = "214_a"
command = ~D, DB, B, a
time = 20
buffer.Time=10

[Command]
name = "214_b"
command = ~D, DB, B, b
time = 20
buffer.Time=10

[Command]
name = "214_c"
command = ~D, DB, B, c
time = 20
buffer.Time=10


[Command]
name = "236_a"
command = ~D, DF, F, a
time = 20
buffer.Time=10

[Command]
name = "236_b"
command = ~D, DF, F, b
time = 20
buffer.Time=10

[Command]
name = "236_c"
command = ~D, DF, F, c
time = 20
buffer.Time=10


[Command]
name = "[4]]6[_a"
command = ~35$B, F, a;~45$B, F, a
time = 20
buffer.Time=10

[Command]
name = "[4]]6[_b"
command = ~35$B, F, b;~45$B, F, b
time = 20
buffer.Time=10

[Command]
name = "[4]]6[_c"
command = ~35$B, F, c
time = 20
buffer.Time=10

[Command]
name = "FF_ab"
command = F, F, a+b
time = 20
buffer.Time=10

[Command]
name = "FF_a"
command = F, F, a
time = 20
buffer.Time=10

[Command]
name = "FF_b"
command = F, F, b
time = 20
buffer.Time=10

[Command]
name = "22x"
command = D, D, x
time = 20
buffer.Time=10

[Command]
name = "a+b"
command = a+b
time = 1

[Command]
name = "/a"
command = /a

[Command]
name = "~a"
command = ~a

[Command]
name = "/b"
command = /b

[Command]
name = "22a"
command = D, D, a
time = 20
buffer.Time=10

[Command]
name = "22b"
command = D, D, b
time = 20
buffer.Time=10

[Command]
name = "22c"
command = D, D, c
time = 20
buffer.Time=10

[Command]
name = "BB_x"
command = B, B, x
time = 20
buffer.Time=10


[Command]
name = "623a"
command =  ~F, D, DF, a
time = 20
buffer.time = 10

[Command]
name = "623b"
command =  ~F, D, DF, b
time = 20
buffer.time = 10

[Command]
name = "623c"
command =  ~F, D, DF, c
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
name = "toronzon"
command = y+c
time = 1

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
name = "hold_x"
command = /x
time = 1
[Command]
name = "hold_y"
command = /y
time = 1
[Command]
name = "hold_z"
command = /z
time = 1
[Command]
name = "hold_a"
command = /a
time = 1
[Command]
name = "hold_c"
command = /c
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
;===========================================================================
;This is not a move, but it sets up var(1) to be 1 if conditions are right
;for a combo into a special move (used below).
;Since a lot of special moves rely on the same conditions, this reduces
;redundant logic.
[State -1, Combo condition Reset]
type = varset
trigger1=movetype=H
trigger2 = stateno = [0,160]
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


[State -1,41236c]
type = Changestate
value = 3000
triggerall = command = "41236_c"
triggerall=stateno!=3000
triggerall=power>=3000
triggerall=var(20)>=200 || var(21)
triggerall = statetype!=A
trigger1=ctrl
trigger2=var(1)

[State -1,214c]
type = Changestate
value = 2500
triggerall = command = "214_c"
triggerall=stateno!=3000
triggerall=stateno!=2500
triggerall=power>=2000
triggerall=var(20)>=120 || var(21)
triggerall = statetype!=A
trigger1=ctrl
trigger2=var(1)

;---------------------------------------------------------------------------


[State -1,623c]
type = ChangeState
value = 2200
triggerall=stateno!=3000
triggerall=stateno!=2500
triggerall=power>=1000
triggerall = command = "623c" && var(20)>=75 * -(var(21)-1);you have 30 card at least
triggerall = statetype!=A
trigger1=ctrl
trigger2=var(1)

[State -1,236c]
type = ChangeState
value = 1070
triggerall = command = "236_c" && power>=1000 && var(20)>=60* -(var(21)-1) && statetype!=A
trigger1=ctrl
trigger2 =stateno!=3000 &&var(1)
trigger3=(stateno = 1050&& animelemtime(5)>=0) || (stateno = 1060&& animelemtime(4)>=1)

[State -1236c air]
type = ChangeState
value = 2300
triggerall = command = "236_c" && var(20)>=75
triggerall = statetype=A
trigger1=ctrl
trigger2=var(1)


[State -1,22c]
type = ChangeState
value = 1020
triggerall = command = "22c" && power >= 1000 && var(20)>4 ;you have 5 cards at least
triggerall=stateno!=2500
triggerall=stateno!=3000
triggerall = statetype!=A
trigger1=ctrl
trigger2=var(1) && stateno=[200,499]

[State -1, (4))6(_c]
type = ChangeState
value = 1120
triggerall = command = "[4]]6[_c" && statetype!=A && var(20) >= 80 * -(var(21)-1) && power>=1000 && numhelper(1121)=0
trigger1=ctrl
trigger2 =(StateNo!=3000) && var(1)


[State -1,236a air]
type = ChangeState
value = 1300
triggerall = command = "236_a"; && var(20)>=35
triggerall = statetype=A
trigger1=ctrl
trigger2=var(1) && stateno=[600,699]

[State -1,236b air]
type = ChangeState
value = 1350
triggerall = command = "236_b"; && var(20)>=45
triggerall = statetype=A
trigger1=ctrl
trigger2=var(1) && stateno=[600,699]


[State -1,623a]
type = ChangeState
value = 1200
triggerall = command = "623a"; && var(20)>=30
triggerall = statetype!=A
trigger1=ctrl
trigger2=var(1) && stateno=[200,499]

[State -1,623b]
type = ChangeState
value = 1250
triggerall = command = "623b"; && var(20)>=50
triggerall = statetype!=A
trigger1=ctrl
trigger2=var(1) && stateno=[200,499]

[State -1,22a]
type = ChangeState
value = 1000
triggerall = command = "22a" && var(20)>0;you have 1 card at least
triggerall = statetype!=A
trigger1=ctrl
trigger2=var(1) && stateno=[200,499]


[State -1,22b]
type = ChangeState
value = 1010
triggerall = command = "22b" && var(20)>0;you have 1 card at least
triggerall = statetype!=A
trigger1=ctrl
trigger2=var(1) && stateno=[200,499]


;---------------------------------------------------------------------------
[State -1, 214a]
type = ChangeState
value = 1050
triggerall = command = "214_a" && statetype!=A
trigger1=ctrl
trigger2 =(StateNo=[200,499]) && var(1)
;trigger2=stateno=1050

;---------------------------------------------------------------------------
[State -1, 214b]
type = ChangeState
value = ifelse(statetype!=A,1060,1061)
triggerall = command = "214_b"
trigger1=ctrl
trigger2 =(StateNo=[200,499]) && var(1)
trigger3 = stateno = 1050 && var(1)
trigger4 =(StateNo=[600,699]) && var(1)
trigger5 = stateno=1300 || stateno=1350 || (stateno=2300 && anim=2300 && animelemtime(1)>32)

;---------------------------------------------------------------------------
[State -1, (4))6(_a]
type = ChangeState
value = 1100
triggerall = command = "[4]]6[_a" && statetype!=A; && var(20) >= 40
trigger1=ctrl
trigger2 =(StateNo=[200,499]) && var(1)

;---------------------------------------------------------------------------
[State -1, (4))6(_b]
type = ChangeState
value = 1110
triggerall = command = "[4]]6[_b" && statetype!=A; && var(20) >= 60
trigger1=ctrl
trigger2 =(StateNo=[200,499]) && var(1)




;===========================================================================

;Toronzon
[State -1, Toronzon]
type = ChangeState
value = 6200
triggerall = command = "toronzon"
triggerall=stateno!=3000
triggerall=power>=1500 && var(21)=0 
triggerall=var(20)<999
triggerall = statetype !=A
trigger1 = ctrl
trigger2=var(1) 

;---------------------------------------------------------------------------
;Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
trigger1 = command = "FF" || (command = "holdfwd" && command = "y")
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Run Back
[State -1, Run Back]
type = ChangeState
value = 105
trigger1 = command = "BB" || (command = "holdback" && command = "y")
trigger1 = statetype != A
trigger1 = ctrl


[State -1, Backairdash];
	Type=ChangeState
	value=115
	TriggerAll = Alive
	TriggerAll = command="BB" || (command = "holdback" && command = "y")
	TriggerAll = StateType=A
	TriggerAll = pos Y<=-30+(vel y>0)*20
	TriggerAll = var(17) < 2
	TriggerAll = anim!=115
	Trigger1 = Ctrl
	trigger2 = var(1)

[State -1,JumpC];ジャンプキャンセル
	Type=ChangeState
	value=40
	TriggerAll = StateType != A
	TriggerAll = command = "holdup"
	Trigger1 = (stateno = 420)
	Trigger1 = var(1)
	trigger2 = stateno = 52
	Trigger2 = (!var(1) && time >= 3) ||(var(1) && time >= 9)
	trigger3 = (stateno=[1200,1250]) && var(1)
	trigger4 = stateno=2200 && var(1)
	trigger5 = (stateno=[6200,6301]) && var(1)

;---------------------------------------------------------------------------
;Throw
[State -1, Throw]
type = ChangeState
value = 800
triggerall = command = "x"
triggerall = statetype != A
triggerall = ctrl
trigger1 = command = "holdfwd"
trigger2 = command = "holdback"


[State -1, 5a+c]
	Type=ChangeState
	value=850
	TriggerAll = StateType != A
	triggerall = ((command = "hold_y") || (command = "hold_a" && command = "hold_c")) && !(command =  "holdback" || command = "holdfwd")
	TriggerAll = Power < PowerMax
	trigger1 = ctrl

;===========================================================================

;---------------------------------------------------------------------------
[State -1, 5a]
type = ChangeState
value = 200
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
Trigger2 = StateNo = 200 && (var(1) || animelemtime(4)>=0)
;---------------------------------------------------------------------------
[State -1, 5b]
type = ChangeState
value = 210
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
Trigger2 = StateNo = 200 && (var(1) || animelemtime(4)>=0)
trigger3 = (StateNo = [400,410])&& var(1)

;---------------------------------------------------------------------------
[State -1, 5c]
type = ChangeState
value = 220
triggerall = command = "c"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
Trigger2 = (StateNo = [200,210]) && var(1)
Trigger3 = (StateNo = [400,410]) && var(1)

;---------------------------------------------------------------------------
[State -1, 22x]
type = ChangeState
value = ifelse(statetype != A,6301,6302)
triggerall = alive
triggerall = (command = "22x" || (command = "a+b" && movetype = H)) && var(20)>=931
;triggerall = command != "holddown"
trigger1 = ctrl
trigger2 = stateno = 5000 && time > 0
trigger3 = stateno = 5010 && time > 0
trigger4 = stateno = 5020 && time > 0
trigger5 = stateno = 5070 && time > 0
trigger6 = stateno != 5000 && stateno != 5010 && stateno != 5020 && stateno != 5070
trigger6 = stateno = [5001,5099]

;---------------------------------------------------------------------------
;Card charge EX
[State -1, 2x]
type = ChangeState
value = 6250
triggerall = command = "holddown"
triggerall = command = "x"
triggerall = var(21)=0 && var(20)<999
triggerall = power >= 750
triggerall=stateno!=2200
triggerall=stateno!=2500
triggerall=stateno!=6200
triggerall=stateno!=3000
triggerall=stateno!=[1070,1099]
triggerall = statetype = C
trigger1 = ctrl
trigger2 = var(1)

;---------------------------------------------------------------------------
;Card charge
[State -1, 5x]
type = ChangeState
value = 6300
triggerall = command = "x"
triggerall = var(21)=0 && var(20)<999
triggerall=stateno!=2200
triggerall=stateno!=2500
triggerall=stateno!=6200
triggerall=stateno!=3000
triggerall=stateno!=[1070,1099]
triggerall = statetype = S
trigger1 = ctrl
trigger2 = var(1)

[State -1, 5z_hold]
type = ChangeState
value = 703
triggerall = command = "hold_z" && var(24)=-1 && power>=500
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno=[120,169]


[State -1, 5z]
type = ChangeState
value = 700
triggerall = command = "z" && var(20)>=20 * -(var(21)-1)
triggerall=numhelper(701)<3
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno=700 || stateno=195

;---------------------------------------------------------------------------
;Taunt
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = command = "start"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno=700 || stateno=195

;---------------------------------------------------------------------------
[State -1, 2a]
type = ChangeState
value = 400
triggerall = command = "a"
triggerall = command = "holddown"
triggerall = statetype !=A
trigger1 = ctrl
trigger2 = stateno = 400 && var(1)

;---------------------------------------------------------------------------
[State -1, 2b]
type = ChangeState
value = 410
triggerall = command = "b"
triggerall = command = "holddown"
triggerall = statetype !=A
trigger1 = ctrl
trigger2 = stateno = 400 && var(1)
;---------------------------------------------------------------------------
[State -1, 2c]
type = ChangeState
value = 420
triggerall = command = "c"
triggerall = command = "holddown"
triggerall = statetype !=A
trigger1 = ctrl
trigger2 = (stateno = 400 || stateno = 410) && var(1)
;---------------------------------------------------------------------------

[State -1, j.a]
type = ChangeState
value = 600
triggerall = command = "a"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 && var(1)
trigger3 = stateno=1350 && var(1)

;---------------------------------------------------------------------------

[State -1, j.b]
type = ChangeState
value = 610
triggerall = command = "b"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 && var(1)
trigger3 = stateno=1350 && var(1)

;---------------------------------------------------------------------------
[State -1, j.c]
type = ChangeState
value = 620
triggerall = command = "c"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 600 || stateno = 610) && var(1)
trigger3 = stateno=1350 && var(1)

