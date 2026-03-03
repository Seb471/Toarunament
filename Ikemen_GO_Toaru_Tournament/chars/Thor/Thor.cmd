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


;-| Super Motions |--------------------------------------------------------

[Command]
name = "RDP_c"
command = ~B,DB, D, DB, c
time = 20
buffer.time = 10

[Command]
name = "QCF_c"
command = ~D, DF, F, c
time = 10
buffer.time = 7

[Command]
name = "QCB_c"
command = ~D, DB, B, c
time = 10
buffer.time = 7

[Command]
name = "QCB_c_air"
command = ~D, DB, B, c
time = 20
buffer.time = 10

[Command]
name = "DD_c"
command = ~D, D, c
time = 20
buffer.time = 10



;-| Special Motions |------------------------------------------------------


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
name = "DD_y"
command = ~D, D, y
time = 20
buffer.time = 10

[Command]
name = "RDP_a"
command = ~B,DB, D, DB, a
time = 20
buffer.time = 10

[Command]
name = "RDP_b"
command = ~B,DB, D, DB, b
time = 20
buffer.time = 10

[Command]
name = "F_z"
command = F,z
time = 15
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
	name="hold_c"
	command=/c
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
;HYPERS

;Almighty Hyper
[State -1, Almighty Hyper]
type = ChangeState
value = 3100
triggerall = command = "HCB_c"
triggerall= var(3)=1
triggerall = statetype !=A
TriggerAll = Power>2999 || fvar(7)>2
TriggerAll = stateno != [3000,3199] 
trigger1 = ctrl
trigger2 =var(1)

;Mjolnir Hyper
[State -1, Mjolnir Hyper]
type = ChangeState
value = 3000
triggerall = command = "HCF_c"
triggerall = statetype !=A
TriggerAll = (fvar(7)>2 && prevstateno != [3100,3199]) || (fvar(7)>0 && prevstateno = [3100,3199])
TriggerAll = stateno != [3000,3099]
trigger1 = ctrl
trigger2 =var(1)
trigger3=stateno=2150
trigger4=stateno=101
;===========================================================================
;SUPERS

;Almighty Slide Combo EX
[State -1, Almighty Slide Combo EX]
type = ChangeState
value = 2600
triggerall = command = "QCB_c_air"
triggerall = statetype !=A
triggerall= var(3)=1
TriggerAll = Power>1999 || fvar(7)>2 
TriggerAll = stateno != [3000,3199] 
trigger1 = stateno= 101
trigger2=stateno=2150
trigger2=animelemtime(3)<0

;Almighty EX
[State -1, Almighty EX]
type = ChangeState
value = 2400
triggerall = command = "RDP_c"
;triggerall = statetype !=A
TriggerAll = Power>999 || fvar(7)>2
TriggerAll = stateno != [3000,3199] 
triggerall= var(3)=1
trigger1 = ctrl
trigger2 = var(1)

;Slide EX DP
[State -1, Slide EX DP]
type = ChangeState
value = 2200
triggerall = command = "QCF_c"
triggerall = statetype !=A
TriggerAll = Power>999 || fvar(7)>2
TriggerAll = stateno != [3000,3199] 
trigger1 = stateno= 101
trigger2=stateno=2150
trigger2=animelemtime(3)<0


;Arc Blades Combo EX
[State -1, Arc Blades Combo EX]
type = ChangeState
value = 2000
triggerall = command = "QCF_c"
triggerall = statetype !=A
triggerall= fvar(7)=0
TriggerAll = Power>999 
TriggerAll = stateno != [2000,2002] 
TriggerAll = stateno != [3000,3199] 
trigger1 = ctrl
trigger2 =var(1)


;Arc Blades Combo EX MJOLNIR
[State -1, Arc Blades Combo EX MJOLNIR]
type = ChangeState
value = 2001
triggerall = command = "QCF_c"
triggerall = statetype !=A
TriggerAll = fvar(7)>2
TriggerAll = stateno != [2000,2002] 
triggerall=stateno!=2100
TriggerAll = stateno != [3000,3199] 
trigger1 = ctrl
trigger2 =var(1)


;Boosted Lunge Slice EX
[State -1, Boosted Lunge Slice EX]
type = ChangeState
value = 2100
triggerall = command = "QCB_c"
triggerall = statetype !=A
TriggerAll = Power>1999 || fvar(7)>2
TriggerAll = stateno != 2100
TriggerAll = stateno != [3000,3199] 
trigger1 = ctrl
trigger2 =var(1)

;Air Blast EX
[State -1, Air Blast EX]
type = ChangeState
value = 2300
triggerall = command = "DD_c"
triggerall = statetype !=A
TriggerAll = Power>999 || fvar(7)>2 
TriggerAll = stateno != 2100
TriggerAll = stateno != 2300
TriggerAll = stateno != [3000,3199] 
trigger1 = ctrl
trigger2 =var(1)

;Dive EX
[State -1,Dive EX]
	Type=ChangeState
	value=2500
	TriggerAll = command = "QCB_c_air"
	TriggerAll = StateType = A
	TriggerAll = Power>999 || fvar(7)>2
	triggerall=stateno!=[2500,2599]
	TriggerAll = stateno != [3000,3199] 
	TriggerAll = (pos Y <= -30 && stateno = 630) || pos Y <= -45;-15
	Trigger1 = Ctrl
	;Trigger2 = (StateNo = [600,699]) || (stateno=1930&& animelemtime(8)>=0) || (stateno=2200&& animelemtime(8)>=0)
	Trigger2 = var(1)
;===========================================================================
;SPECIALS


;Almighty A
[State -1, Almighty A]
type = ChangeState
value = 1800+(statetype=A)*5
triggerall = command = "RDP_a"
triggerall= var(3)=1
trigger1 = ctrl
Trigger2 = StateNo = [200,499] 
trigger2 = var(1)

;Almighty B
[State -1, Almighty B]
type = ChangeState
value = 1850+(statetype=A)*5
triggerall = command = "RDP_b"
triggerall= var(3)=1
trigger1 = ctrl
Trigger2 = StateNo = [200,499] 
trigger2 = var(1)


;=================================================

;Slide Almighty A
[State -1, Slide Almighty A]
type = ChangeState
value = 1900
triggerall= var(3)=1
triggerall = command = "QCB_a"
triggerall = statetype !=A
trigger1 = stateno= 101
trigger2=stateno=2150
trigger2=animelemtime(3)<0

;Slide Almighty B
[State -1, Slide Almighty B]
type = ChangeState
value = 1950
triggerall= var(3)=1
triggerall = command = "QCB_b"
triggerall = statetype !=A
trigger1 = stateno= 101
trigger2=stateno=2150
trigger2=animelemtime(3)<0


;Slide A Sweep
[State -1, Slide A Sweep]
type = ChangeState
value = 1201
triggerall = command = "QCF_a"
triggerall = statetype !=A
trigger1 = stateno= 101
trigger2=stateno=2150
trigger2=animelemtime(3)<0

;Slide B Overhead
[State -1, Slide B Overhead]
type = ChangeState
value = 1500
triggerall = command = "QCF_b"
triggerall= fvar(7)=0
triggerall = statetype !=A
trigger1 = stateno= 101
trigger2=stateno=2150
trigger2=animelemtime(3)<0

;Slide B Overhead MJOLNIR
[State -1, Slide B Overhead MJOLNIR]
type = ChangeState
value = 1501
triggerall= fvar(7)>=0
triggerall = command = "QCF_b"
triggerall = statetype !=A
trigger1 = stateno= 101
trigger2=stateno=2150
trigger2=animelemtime(3)<0

;=======================================

;Rekka Start
[State -1, Rekka Start]
type = ChangeState
value = 1000
triggerall = command = "QCF_a"
triggerall = statetype !=A
triggerall= fvar(7)=0
trigger1 = ctrl
Trigger2 = StateNo = [200,499] 
trigger2 = var(1)

;Rekka Start Mjolnir
[State -1, Rekka Start Mjolnir]
type = ChangeState
value = 1001
triggerall = command = "QCF_a"
triggerall = statetype !=A
triggerall= fvar(7)>0
trigger1 = ctrl
Trigger2 = StateNo = [200,499] 
trigger2 = var(1)

;Rekka A Second
[State -1, Rekka A Second]
type = ChangeState
value = 1050
triggerall = command = "a"
triggerall = statetype !=A
triggerall= fvar(7)=0
triggerall = stateno= [1000,1001]
Trigger1 = animelemtime(6)>=0
Trigger1 = animelemtime(9)<=0
trigger2= var(1)


;Rekka A Second Mjolnir
[State -1, Rekka A Second Mjolnir]
type = ChangeState
value = 1051
triggerall = command = "a"
triggerall = statetype !=A
triggerall= fvar(7)>0
triggerall = stateno= [1000,1001]
Trigger1 = animelemtime(6)>=0
Trigger1 = animelemtime(9)<=0
trigger2= var(1)


;Rekka A Final
[State -1, Rekka A Final]
type = ChangeState
value = 1070
triggerall = command = "a"
triggerall = statetype !=A
triggerall= fvar(7)=0
triggerall = stateno= [1050,1051]
Trigger1 = animelemtime(6)>=0
Trigger1 = animelemtime(9)<=0
trigger2= var(1)


;Rekka A Final Mjolnir
[State -1, Rekka A Final Mjolnir]
type = ChangeState
value = 1071
triggerall = command = "a"
triggerall = statetype !=A
triggerall= fvar(7)>0
triggerall = stateno= [1050,1051]
Trigger1 = animelemtime(6)>=0
Trigger1 = animelemtime(9)<=0
trigger2= var(1)


;Rekka B Second
[State -1, Rekka B Second]
type = ChangeState
value = 1100
triggerall = command = "b"
triggerall = statetype !=A
triggerall= fvar(7)=0
triggerall = stateno= [1000,1001]
Trigger1 = animelemtime(6)>=0
Trigger1 = animelemtime(9)<=0
trigger2= var(1)


;Rekka B Second Mjolnir
[State -1, Rekka B Second Mjolnir]
type = ChangeState
value = 1101
triggerall = command = "b"
triggerall = statetype !=A
triggerall= fvar(7)>0
triggerall = stateno= [1000,1001]
Trigger1 = animelemtime(6)>=0
Trigger1 = animelemtime(9)<=0
trigger2= var(1)

;Rekka B Final
[State -1, Rekka B Final]
type = ChangeState
value = 1150
triggerall = command = "b"
triggerall = statetype !=A
triggerall= fvar(7)=0
triggerall = stateno= [1100,1101]
Trigger1 = animelemtime(6)>=0
Trigger1 = animelemtime(9)<=0
trigger2= var(1)


;Rekka B Final Mjolnir
[State -1, Rekka B Final Mjolnir]
type = ChangeState
value = 1151
triggerall = command = "b"
triggerall = statetype !=A
triggerall= fvar(7)>0
triggerall = stateno= [1100,1101]
Trigger1 = animelemtime(6)>=0
Trigger1 = animelemtime(9)<=0
trigger2= var(1)

;Rekka C Second (Sweep)
[State -1, Rekka C Second (Sweep)]
type = ChangeState
value = 1200
triggerall = command = "c"
triggerall = statetype !=A
triggerall = stateno= [1000,1001]
Trigger1 = animelemtime(6)>=0
Trigger1 = animelemtime(9)<=0
trigger2= var(1)

;Rekka C Final
[State -1, Rekka B Final]
type = ChangeState
value = 1250
triggerall = command = "c"
triggerall = statetype !=A
triggerall= fvar(7)=0
triggerall = stateno= 1200
Trigger1 = animelemtime(8)>=0
Trigger1 = animelemtime(10)<=0
trigger2= var(1)


;Rekka C Final Mjolnir
[State -1, Rekka B Final Mjolnir]
type = ChangeState
value = 1251
triggerall = command = "c"
triggerall = statetype !=A
triggerall= fvar(7)>0
triggerall = stateno= 1200
Trigger1 = animelemtime(8)>=0
Trigger1 = animelemtime(10)<=0
trigger2= var(1)


;B Rekka Start
[State -1, B Rekka Start]
type = ChangeState
value = 1300
triggerall = command = "QCF_b"
triggerall = statetype !=A
triggerall= fvar(7)=0
trigger1 = ctrl
Trigger2 = (StateNo = [200,499])  || (stateno=[1070,1071])
trigger2 = var(1)

;B Rekka Start MJOLNIR
[State -1, B Rekka Start Mjolnir]
type = ChangeState
value = 1301
triggerall = command = "QCF_b"
triggerall = statetype !=A
triggerall= fvar(7)>=0
trigger1 = ctrl
Trigger2 = (StateNo = [200,499])  || (stateno=[1070,1071])
trigger2 = var(1)

;B Rekka Second
[State -1, B Rekka Second]
type = ChangeState
value = 1350
triggerall = command = "b"
triggerall = statetype !=A
triggerall= fvar(7)=0
Triggerall = (StateNo = [1300,1301])
Trigger1 = animelemtime(7)>=0
Trigger1 = animelemtime(10)<=0
trigger2 = var(1)

;B Rekka Second MJOLNIR
[State -1, B Rekka Second Mjolnir]
type = ChangeState
value = 1351
triggerall = command = "b"
triggerall = statetype !=A
triggerall= fvar(7)>=0
Triggerall = (StateNo = [1300,1301])
Trigger1 = animelemtime(7)>=0
Trigger1 = animelemtime(10)<=0
trigger2 = var(1)

;------------------------------------------------

;Lunge Slice A
[State -1, Lunge Slice A]
type = ChangeState
value = 1400
triggerall = command = "QCB_a"
triggerall = statetype !=A
triggerall= fvar(7)=0
trigger1 = ctrl
Trigger2 = (StateNo = [200,499])  || (stateno=[1150,1151])
trigger2 = var(1)
Trigger3 = (StateNo = 1201)   || (stateno=1910)
trigger3 = var(1)

;Lunge Slice A MJOLNIR
[State -1, Lunge Slice A MJOLNIR]
type = ChangeState
value = 1401
triggerall = command = "QCB_a"
triggerall = statetype !=A
triggerall= fvar(7)>=0
trigger1 = ctrl
Trigger2 = (StateNo = [200,499])  || (stateno=[1150,1151])
trigger2 = var(1)
Trigger3 = (StateNo = 1201)   || (stateno=1910)
trigger3 = var(1)

;Lunge Slice B
[State -1, Lunge Slice B]
type = ChangeState
value = 1450
triggerall = command = "QCB_b"
triggerall = statetype !=A
triggerall= fvar(7)=0
trigger1 = ctrl
Trigger2 = (StateNo = [200,499])  || (stateno=[1150,1151])
trigger2 = var(1)
Trigger3 = (StateNo = 1201)  || (stateno=1910)
trigger3 = var(1)

;Lunge Slice B MJOLNIR
[State -1, Lunge Slice B MJOLNIR]
type = ChangeState
value = 1451
triggerall = command = "QCB_b"
triggerall = statetype !=A
triggerall= fvar(7)>=0
trigger1 = ctrl
Trigger2 = (StateNo = [200,499])  || (stateno=[1150,1151])
trigger2 = var(1)
Trigger3 = (StateNo = 1201)   || (stateno=1910)
trigger3 = var(1)



;============================================================
;Air Blast A
[State -1, Air Blast A]
type = ChangeState
value = 1600
triggerall = command = "DD_a"
triggerall = statetype !=A
triggerall= prevstateno!= [1450,1451]
trigger1 = ctrl
Trigger2 = (StateNo = [200,499]) 
trigger2 = var(1)
;trigger3=stateno=101

;Air Blast B
[State -1, Air Blast B]
type = ChangeState
value = 1650
triggerall = command = "DD_b"
triggerall = statetype !=A
triggerall= prevstateno!= [1450,1451]
trigger1 = ctrl
Trigger2 = (StateNo = [200,499]) 
trigger2 = var(1)
;trigger3=stateno=101

;=============================================================

;Dive A
[State -1,Dive A]
	Type=ChangeState
	value=1700
	TriggerAll = command = "QCB_a"
	TriggerAll = StateType = A
	triggerall= fvar(7)=0
	TriggerAll = (pos Y <= -30 && stateno = 630) || pos Y <= -45;-15
	Trigger1 = Ctrl
	Trigger2 = (StateNo = [600,699]) || (stateno=1930&& animelemtime(8)>=0) || (stateno=2200)|| (stateno=2600)
	Trigger2 = var(1)

;Dive A MJOLNIR
[State -1,Dive A MJOLNIR]
	Type=ChangeState
	value=1701
	TriggerAll = command = "QCB_a"
	TriggerAll = StateType = A
	triggerall= fvar(7)>=0
	TriggerAll = (pos Y <= -30 && stateno = 630) || pos Y <= -45;-15
	Trigger1 = Ctrl
	Trigger2 = (StateNo = [600,699]) || (stateno=1930 && animelemtime(8)>=0)|| (stateno=2200)|| (stateno=2600)
	Trigger2 = var(1)

;Dive B
[State -1,Dive B]
	Type=ChangeState
	value=1750
	TriggerAll = command = "QCB_b"
	triggerall= fvar(7)=0
	TriggerAll = StateType = A
	TriggerAll = (pos Y <= -30 && stateno = 630) || pos Y <= -45;-15
	Trigger1 = Ctrl
	Trigger2 = (StateNo = [600,699]) || (stateno=1930&& animelemtime(8)>=0)|| (stateno=2200)|| (stateno=2600)
	Trigger2 = var(1)

;Dive B MJOLNIR
[State -1,Dive B]
	Type=ChangeState
	value=1751
	TriggerAll = command = "QCB_b"
	TriggerAll = StateType = A
	triggerall= fvar(7)>=0
	TriggerAll = (pos Y <= -30 && stateno = 630) || pos Y <= -45;-15
	Trigger1 = Ctrl
	Trigger2 = (StateNo = [600,699]) || (stateno=1930&& animelemtime(8)>=0)|| (stateno=2200)|| (stateno=2600)
	Trigger2 = var(1)




;=============================================================

;MISC PART 1

[State -1, Combo condition Reset]
type = VarSet
trigger1 = movetype=H;stateno = [5000,5210]
trigger2 = stateno = [0,160]
var(1) = 0
ignorehitpause=1


[State -1,JumpC];ジャンプキャンセル
	Type=ChangeState
	value=40
	TriggerAll = StateType != A
	TriggerAll = command = "holdup"
	Trigger1 = StateNo = [1250,1251]
	Trigger1 = var(1)
	trigger2 = stateno = 52
	Trigger2 = (!var(1) && time >= 5) ||(var(1) && time >= 9)
	trigger3=stateno=100
	trigger4=stateno=220 && var(1)

;---------------------------------------------------------------------------
;Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
trigger1 = command = "FF" ||(Command = "holdfwd" && Command = "y" )
trigger1 = statetype !=A
trigger1 = ctrl

[State -1,AirDash];空中ダッシュ
	Type=ChangeState
	value=110
	TriggerAll = command = "FF" ||(Command = "holdfwd" && Command = "y" )
	TriggerAll = StateType = A
	triggerall = ishelper = 0
	TriggerAll = pos Y <= -4 + (vel y > 0) * 5
	TriggerAll = anim != 110
	TriggerAll = var(17) < 2
	Trigger1 = Ctrl
	Trigger2 = var(1)

;---------------------------------------------------------------------------
;Run Back
[State -1, Run Back]
type = ChangeState
value = 105
trigger1 = command = "BB" ||(Command = "holdback" && Command = "y" )
trigger1=stateno!=105
trigger1 = statetype !=A
trigger1 = ctrl

[State -1, Backairdash];
	Type=ChangeState
	value=115
	TriggerAll = Alive
	TriggerAll = command="BB" ||(Command = "holdback" && Command = "y" )
	TriggerAll = StateType=A
	triggerall = ishelper = 0
	TriggerAll = pos Y <= -4 + (vel y > 0) * 5
	TriggerAll = var(17) < 2
	TriggerAll = anim!=115
	triggerall=stateno!=105
	Trigger1 = Ctrl
	trigger2 = var(1)


;===========================================================================

;MISC PART 2

[State -1, GunTaunt]
type = ChangeState
value =  990
TriggerAll = StateType != A
triggerall=ctrl
triggerall = command = "start"
triggerall=stateno!=990
triggerall=numhelper(991)=0
triggerall=!ishelper
triggerall=stateno!=[200,3999]
;trigger1=roundstate=2
trigger1 = (var(14)>10)
trigger1 = (var(14)<80)


[State -1, Almighty Counter]
type = ChangeState
value = 760
TriggerAll = StateType != A
triggerall = command = "F_z"
triggerall=var(3)=1
trigger1 = ctrl


[State -1, Air Almighty Counter]
type = ChangeState
value = 770
TriggerAll = StateType = A
triggerall = command = "F_z"
triggerall=var(3)=1
trigger1 = ctrl


[State -1,Charge];Charge
	Type=ChangeState
	value=700
	TriggerAll=StateType!=A
	TriggerAll=command="hold_a"
	TriggerAll=command="hold_c"
	TriggerAll=Power<PowerMax
	Trigger1=Ctrl

[State -1, Spot Dodge]
type = ChangeState
value = 750
TriggerAll = StateType != A
triggerall = command = "z"
trigger1 = ctrl



;Mjolnir
[State -1, Mjolnir]
type = ChangeState
value = 970
triggerall = command = "DD_y"
triggerall = statetype !=A
triggerall=power>=3000
triggerall=fvar(7)=0
trigger1 = ctrl
trigger2= var(1)

;Almighty Install
[State -1, Amighty Install]
type = ChangeState
value = 960
triggerall = command = "y"
triggerall = statetype !=A
triggerall=var(3)=0
triggerall=fvar(6)=2400
trigger1 = ctrl

;Grab
[State -1, Throw]
type = ChangeState
value = 800
triggerall = command = "x"
triggerall = statetype != A
triggerall = ctrl || stateno=100
trigger1 = command = "holdfwd"
trigger2 = command = "holdback"	

;===========================================================================
;Crouching Low Kick
[State -1, Crouching Low Kick]
type = ChangeState
value = 400
triggerall = command = "a"
triggerall = command = "holddown"
triggerall = statetype !=A
trigger1 = ctrl
trigger2 = stateno = 400 && var(1)
trigger3=stateno=100

;Crouching Low Kick
[State -1, Crouching Low Kick]
type = ChangeState
value = 400
triggerall = command = "a"
trigger1= stateno=1810 & animelemtime(3)>=0

;Crouching Punch
[State -1, Crouching Punch]
type = ChangeState
value = 410
triggerall = command = "b"
triggerall = command = "holddown"
triggerall = statetype !=A
trigger1 = ctrl
trigger2 = stateno = 400 && var(1)
trigger3=stateno=100

;Crouching Punch
[State -1, Crouching Punch]
type = ChangeState
value = 410
triggerall = command = "b"
trigger1= stateno=1810 & animelemtime(3)>=0

;Crouching Sweep
[State -1, Crouching Sweep]
type = ChangeState
value = 420
triggerall = command = "c"
triggerall = command = "holddown"
triggerall = statetype !=A
trigger1 = ctrl
trigger2 = stateno = 400 && var(1)
trigger3 = stateno = 410 && var(1)
trigger4=stateno=100

;Crouching Sweep
[State -1, Crouching Sweep]
type = ChangeState
value = 420
triggerall = command = "c"
trigger1= stateno=1810 & animelemtime(3)>=0
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
trigger3=stateno=100

;Standing Hook
[State -1, Standing Hook]
type = ChangeState
value = 210
triggerall = command = "b"
triggerall = command != "holddown"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = StateNo = 200 && (var(1))
trigger3=stateno=100

;Standing Double Kick
[State -1, Standing Double Kick]
type = ChangeState
value = 230
triggerall = command = "c"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = StateNo = 200 && (var(1))
Trigger3 = StateNo = 210 && (var(1))
trigger4=stateno=100

;Standing Double Kick Followup
[State -1, Standing Double Kick Followup]
type = ChangeState
value = 231
triggerall = command = "c"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
triggerall = statetype !=A
Trigger1 = StateNo = 220 && (var(1))


;Standing High Kick
[State -1, Standing High Kick]
type = ChangeState
value = 220
triggerall = command = "c"
triggerall = command != "holddown"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = StateNo = 200 && (var(1))
Trigger3 = StateNo = 210 && (var(1))
trigger4=stateno=100




;---------------------------------------------------------------------------

;Air jab
[State -1,Air Jab]
	Type=ChangeState
	value=600
	TriggerAll=command="a"
	Triggerall = StateType = A
	Trigger1 = Ctrl
	trigger2= stateno=1820 & animelemtime(3)>=0
	trigger3= stateno=1930 & var(1)
	trigger4= stateno=2200 & var(1)
	trigger5= stateno=2600 & var(1)

;Air Arc Blades
[State -1,Air Arc Blades]
	Type=ChangeState
	value=610
	TriggerAll=command="b"
	Triggerall = StateType = A
	triggerall= fvar(7) =0
	Trigger1 = Ctrl
	Trigger2 = stateno=600 & var(1)
	trigger3= stateno=1820 & animelemtime(3)>=0
	trigger4= stateno=1930 & var(1)
	trigger5= stateno=2200 & var(1)
	trigger6= stateno=2600 & var(1)

;Air Arc Blades Mjolnir
[State -1,Air Arc Blades Mjolnir]
	Type=ChangeState
	value=611
	TriggerAll=command="b"
	Triggerall = StateType = A
	triggerall= fvar(7)>=0
	Trigger1 = Ctrl
	Trigger2 = stateno=600 & var(1)
	trigger3= stateno=1820 & animelemtime(3)>=0
	trigger4= stateno=1930 & var(1)
	trigger5= stateno=2200 & var(1)
	trigger6= stateno=2600 & var(1)

;Air Stomp
[State -1,Air Stomp]
	Type=ChangeState
	value=630
	TriggerAll=command="c"
	TriggerAll=command="holddown"
	Triggerall = StateType = A
	Trigger1 = Ctrl
	Trigger2 = stateno=600 & var(1)
	Trigger3 = stateno=610 & var(1)
	Trigger4 = stateno=620 & var(1)
	Trigger5 = stateno=611 & var(1)
	trigger6= stateno=1820 & animelemtime(3)>=0
	trigger7= stateno=2200 & var(1)
	trigger8= stateno=2600 & var(1)

;Air Kick
[State -1,Air Kick]
	Type=ChangeState
	value=620
	TriggerAll=command="c"
	Triggerall = StateType = A
	Trigger1 = Ctrl
	Trigger2 = stateno=600 & var(1)
	Trigger3 = stateno=610 & var(1)
	Trigger4 = stateno=611 & var(1)
	trigger5= stateno=1820 & animelemtime(3)>=0
	trigger6= stateno=1930 & var(1)
	trigger7= stateno=2200 & var(1)
	trigger8= stateno=2600 & var(1)

