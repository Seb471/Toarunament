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
name = "22_x"
command = D, D, x
time = 20
buffer.Time=10

[Command]
name = "22_z"
command = D, D, z
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
name = "22_a"
command = D, D, a
time = 20
buffer.Time=10

[Command]
name = "22_b"
command = D, D, b
time = 20
buffer.Time=10

[Command]
name = "22_c"
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

;---------------------------------------------------------------------------
[State -1, 214a]
type = ChangeState
value = 1100
triggerall = command = "214_a"
triggerall = statetype!=A
trigger1=ctrl
trigger2 =(StateNo=[200,499]) && var(1)
;trigger2=stateno=1050

;---------------------------------------------------------------------------
[State -1, 214b]
type = ChangeState
value = 1110
triggerall = command = "214_b"
triggerall = statetype!=A
trigger1=ctrl
trigger2 =(StateNo=[200,499]) && var(1)
;trigger2=stateno=1050

;---------------------------------------------------------------------------
[State -1, 236a]
type = ChangeState
value = 1000
triggerall = command = "236_a"
triggerall = statetype!=A
trigger1=ctrl
trigger2 =(StateNo=[200,499]) && var(1)
;trigger2=stateno=1050

;---------------------------------------------------------------------------
[State -1, 236b]
type = ChangeState
value = 1010
triggerall = command = "236_b"
triggerall = statetype!=A
trigger1=ctrl
trigger2 =(StateNo=[200,499]) && var(1)
;trigger2=stateno=1050

;---------------------------------------------------------------------------
[State -1, 22a]
type = ChangeState
value = 1200
triggerall = command = "22_a"
triggerall = statetype!=A
trigger1=ctrl
trigger2 =(StateNo=[200,499]) && var(1)
;trigger2=stateno=1050

;---------------------------------------------------------------------------
[State -1, 22a]
type = ChangeState
value = 1210
triggerall = command = "22_b"
triggerall = statetype!=A
trigger1=ctrl
trigger2 =(StateNo=[200,499]) && var(1)
;trigger2=stateno=1050

;---------------------------------------------------------------------------
[State -1, Jump Cancel]
type = changestate
value = 40
triggerall = !ishelper
triggerall = command = "holdup"
trigger1 = Stateno = 100

;===========================================================================
;---------------------------------------------------------------------------
;Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall = !ishelper
trigger1 = command = "FF"
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Run Back
[State -1, Back Dash]
type = ChangeState
value = 105
triggerall = !ishelper
trigger1 = command = "BB"
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
[State -1, 22z]
type = ChangeState
value = 950;ifelse(statetype != A,6301,6302)
triggerall = alive
triggerall = !ishelper
triggerall = power >= 4000
triggerall = var(20) = 0
triggerall = (command = "22_z" || (command = "a+b" && movetype = H))
;triggerall = command != "holddown"
trigger1 = ctrl

;---------------------------------------------------------------------------
[State -1, 5z]
type = ChangeState
value = 960;ifelse(statetype != A,6301,6302)
triggerall = alive
triggerall = !ishelper
triggerall = statetype != A
triggerall = power >= 2000
triggerall = command = "z"
triggerall = numhelper(965)=0
;triggerall = command != "holddown"
trigger1 = ctrl

;---------------------------------------------------------------------------
[State -1, 5a]
type = ChangeState
value = 200
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
Trigger2 = StateNo = 200 && var(1)
;---------------------------------------------------------------------------
[State -1, 5b]
type = ChangeState
value = 210
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
Trigger2 = StateNo = 200 && var(1)
trigger3 = (StateNo = [400,410])&& var(1)

;---------------------------------------------------------------------------
[State -1, 5c]
type = ChangeState
value = 220
triggerall = command = "c"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
Trigger2 = ((StateNo = [200,210]) && var(1)) || (stateno = 210 && animelemtime(4)>=0)
Trigger3 = (StateNo = [400,410]) && var(1)

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

;---------------------------------------------------------------------------
[State -1, j.b]
type = ChangeState
value = 610
triggerall = command = "b"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 && var(1)

;---------------------------------------------------------------------------
[State -1, j.c]
type = ChangeState
value = 620
triggerall = command = "c"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 600 || stateno = 610) && var(1)

;---------------------------------------------------------------------------
;Will stab
[State -1, 5x]
type = ChangeState
value = 900
triggerall = command = "x"
triggerall = statetype != A
triggerall = var(20)=0
trigger1 = ctrl
trigger2 = var(1)
