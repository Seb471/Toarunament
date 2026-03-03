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
; This  section lets you remap the player's buttons (to easily change the
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
name = "RagingDemon"
command = ~F,a, a, F, b, c
time = 48
buffer.time=40


[Command]
name = "RagingDemon"
command = F,a, a, F, b, c
time = 48
buffer.time=40


[Command]
name = "RagingDemon"
command = ~F,a, a, ~F, b, c
time = 48
buffer.time=40

[Command]
name = "RagingDemon"
command = ~F,a, a, F, b+c
time = 48
buffer.time=40

[Command]
name = "RagingDemon"
command = /F,a, a, F, b,c
time = 48
buffer.time=40

[Command]
name = "RagingDemon"
command = ~F,a, a, /F, b,c
time = 48
buffer.time=40



[Command]
name = "RagingDemonBack"
command = ~B,a, a, B, b, c
time = 48
buffer.time=40

[Command]
name = "RagingDemonBack"
command = ~B,a, a, ~B, b, c
time = 48
buffer.time=40

[Command]
name = "RagingDemonBack"
command = B,a, a, ~B, b, c
time = 48
buffer.time=40

[Command]
name = "RagingDemonBack"
command = ~B,a, a, B, b+c
time = 48
buffer.time=40

[Command]
name = "RagingDemonBack"
command = /B,a, a, B, b,c
time = 48
buffer.time=40


[Command]
name = "RagingDemonBack"
command = ~B,a, a, /B, b,c
time = 48
buffer.time=40

[Command]
name = "Misogi"  
command = ~D,D,D,x
time = 32
buffer.Time=16


;------------------------------------
[Command]
name = "QCBHCF_c"  
command = ~D, DB, B, DB, F, c
time = 40
buffer.Time=20

[Command]
name = "QCBHCF_c"  
command = ~D, DB, B, DB, D, DF, F, c
time = 40
buffer.Time=20

[Command]
name = "QCBHCF_c"  
command = ~D, B, D, F, c
time = 40
buffer.Time=20

[Command]
name = "QCBHCF_c"  
command = ~B, DB, B, D, F, c
time = 40
buffer.Time=20

[Command]
name = "QCBHCF_c"  
command = ~B, DB, B, DB, D, DF, F, c
time = 40
buffer.Time=20

[Command]
name = "QCBHCF_c"  
command = ~D, DB, DB, D, DF, F, c
time = 40
buffer.Time=20

;----------------------------------
[Command]
name = "QCBHCF_b"  
command = ~D, DB, B, DB, F, b
time = 40
buffer.Time=20

[Command]
name = "QCBHCF_b"  
command = ~D, DB, B, DB, D, DF, F, b
time = 40
buffer.Time=20

[Command]
name = "QCBHCF_b"  
command = ~D, B, D, F, b
time = 40
buffer.Time=20

[Command]
name = "QCBHCF_b"  
command = ~B, DB, B, D, F, b
time = 40
buffer.Time=20

[Command]
name = "QCBHCF_b"  
command = ~B, DB, B, DB, D, DF, F, b
time = 40
buffer.Time=20

[Command]
name = "QCBHCF_b"  
command = ~D, DB, DB, D, DF, F, b
time = 40
buffer.Time=20


;------------------------------
[Command]
name = "QCBHCF_a"  
command = ~D, DB, B, DB, F, a
time = 40
buffer.Time=20

[Command]
name = "QCBHCF_a"  
command = ~D, DB, B, DB, D, DF, F, a
time = 40
buffer.Time=20

[Command]
name = "QCBHCF_a"  
command = ~D, B, D, F, a
time = 40
buffer.Time=20

[Command]
name = "QCBHCF_a"  
command = ~B, DB, B, D, F, a
time = 40
buffer.Time=20

[Command]
name = "QCBHCF_a"  
command = ~B, DB, B, DB, D, DF, F, a
time = 40
buffer.Time=20

[Command]
name = "QCBHCF_a"  
command = ~D, DB, DB, D, DF, F, a
time = 40
buffer.Time=20


;------------------------------

[Command]
name = "HCF_a+b"  
command = ~B, DB, D, DF, F, a+b
time = 40
buffer.Time=20


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
name = "HCF_c"  
command = ~DB, D, DF, F, c
time = 32
buffer.Time=16


[Command]
name = "HCF_b"  
command = ~B, DB, D, DF, F, b
time = 32
buffer.Time=16

[Command]
name = "HCF_b"  
command = ~B, DB, D, DF, b
time = 32
buffer.Time=16

[Command]
name = "HCF_b"  
command = ~DB, D, DF, F, b
time = 32
buffer.Time=16


[Command]
name = "HCF_a"  
command = ~B, DB, D, DF, F, a
time = 32
buffer.Time=16

[Command]
name = "HCF_a"  
command = ~B, DB, D, DF, a
time = 32
buffer.Time=16


[Command]
name = "HCF_a"  
command = ~DB, D, DF, F, a
time = 32
buffer.Time=16



;-| Super Motions |--------------------------------------------------------

[Command]
name = "DP_c"
command = ~F,DF,D,DF, c
time = 20
buffer.time = 10


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
name = "QCF_y"
command = ~D, DF, F, y
time = 20
buffer.time = 10

[Command]
name = "QCB_y"
command = ~D, DB, B, y
time = 20
buffer.time = 10

[Command]
name = "QCF_z"
command = ~D, DF, F, z
time = 10
buffer.time = 7

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
name = "DD_s"
command = ~D, D, s
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
name = "recovery" ;必須コマンド名
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
	name="hold_y"
	command=/y
	time = 1

[Command]
name = "a+b"
command = a+b
time = 3




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

;===========================================================================
;This is not a move, but it sets up var(1) to be 1 if conditions are right
;for a combo into a special move (used below).
;Since a lot of special moves rely on the same conditions, this reduces
;redundant logic.
[State -1, Combo condition Reset]
type = VarSet
trigger1 = movetype=H;stateno = [5000,5210]
trigger2 = stateno = [0,160]
var(1) = 0
ignorehitpause=1
;Hypers
;==================================================


;Raging Demon
[State -1, Raging Demon]
type = ChangeState
value = 3300
triggerall = command = "RagingDemon"
triggerall = statetype !=A
TriggerAll = Power>1999 || (fvar(8)!=0)
TriggerAll = stateno != [3000,3199] 
TriggerAll = stateno != [930,935]
trigger1 =ctrl
trigger2 =var(1)
trigger3=stateno=[200,220]


;Raging Demon Counter
[State -1, Raging Demon Counter]
type = ChangeState
value = 3400
triggerall = command = "RagingDemonBack"
triggerall = statetype !=A
TriggerAll = Power>1999 || (fvar(8)!=0)
TriggerAll = stateno != [3000,3199] 
TriggerAll = stateno != [930,935]
trigger1 =ctrl
trigger2 =var(1)
trigger3=stateno=[200,220]


;Hyper Gutsy Combo
[State -1, Super Amazing Punch]
type = ChangeState
value = 3100
triggerall = command = "HCB_c"
triggerall = statetype !=A
Triggerall= (fvar(7)=100) || (life<=lifemax*0.3) || (fvar(8)!=0)
TriggerAll = Power>4999 || (fvar(8)!=0)
TriggerAll = stateno != [3000,3199] 
TriggerAll = stateno != [930,935]
trigger1 =ctrl
trigger2 =var(1) && var(8)!=0


;Super Amazing Punch
[State -1, Super Amazing Punch]
type = ChangeState
value = 3000
triggerall = command = "QCBHCF_c"
triggerall = statetype !=A
TriggerAll = Power>2999 || (fvar(8)!=0)
TriggerAll = stateno != [3000,3199] 
TriggerAll = stateno != [930,935]
triggerall=enemy,movetype=H
trigger1 =ctrl
trigger2 =var(1)

;Super Amazing Punch (Raw)
[State -1, Super Amazing Punch]
type = ChangeState
value = 3050
triggerall = command = "QCBHCF_c"
triggerall = statetype !=A
TriggerAll = Power>2999 || (fvar(8)!=0)
TriggerAll = stateno != [3000,3199] 
TriggerAll = stateno != [930,935]
triggerall=enemy,movetype!=H
trigger1 =ctrl
trigger2 =var(1)

;Giga Extreme Amazing Punch
[State -1, Giga Extreme Amazing Punch]
type = ChangeState
value = 2900
triggerall = command = "HCF_c"
;triggerall = statetype !=A
TriggerAll = Power>1999 
trigger1 = stateno=106

;Electric Amazing Punch
[State -1, Electric Amazing Punch]
type = ChangeState
value = 2850
triggerall = command ="QCBHCF_b" ;"HCF_b"
triggerall = command != "DP_b"
triggerall = statetype !=A
TriggerAll = Power>1999 || (fvar(8)!=0)
triggerall= stateno!=[2850,2899]
TriggerAll = stateno != [3000,3199] 
TriggerAll = stateno != [930,935]
triggerall=fvar(9)<75
trigger1 = ctrl
trigger2 =var(1)

;Huge Ass Punch
[State -1, Huge Ass Punch]
type = ChangeState
value = 2800
triggerall = command = "QCBHCF_a";"HCF_a"
triggerall = statetype !=A
TriggerAll = Power>1999 || (fvar(8)!=0)
TriggerAll = stateno != [3000,3199] 
TriggerAll = stateno != [930,935]
triggerall=fvar(9)<75
trigger1 = ctrl
trigger2 =var(1)

[State -1,Endure];Misogi
	Type=ChangeState
	value=927
	;TriggerAll=StateType!=A
	
	triggerall=power>1999 || (fvar(8)!=0)
	TriggerAll = stateno != [3000,3199] 
	TriggerAll = stateno != [930,935]
	triggerall = (statetype!=A) || (statetype=A && var(23)<3)
	triggerall=command="Misogi"
	trigger1=ctrl
	trigger2 =var(1)

;Supers
;==================================================

;Air Amazing Punch Dist EX
[State -1, Air Amazing Punch EX]
type = ChangeState
value = 2600
triggerall = command = "QCF_c"
triggerall = statetype =A
TriggerAll = Power>999 || (fvar(8)!=0)
TriggerAll = stateno != [3000,3199] 
TriggerAll = stateno != [2800,3000] 
TriggerAll = stateno != [930,935]
triggerall= !(fvar(8)=1 && (enemynear,statetype=L))
triggerall=fvar(9)<75
trigger1 = ctrl
trigger2 =var(1)


;Air Amazing Kick Combo EX
[State -1, Air Amazing Kick Combo EX]
type = ChangeState
value = 2700
triggerall = command = "QCB_c"
triggerall = statetype =A
TriggerAll = Power>999 || (fvar(8)!=0)
TriggerAll = stateno != [3000,3199] 
TriggerAll = stateno != [2800,3000] 
TriggerAll = stateno != [930,935]
triggerall=fvar(9)<75
trigger1 = ctrl
trigger2 =var(1)


;------------------------------------------------

;Messatsu DP EX
[State -1, DP EX]
type = ChangeState
value = 2300
triggerall = command = "DP_c"
triggerall = statetype !=A
TriggerAll = Power>999 || (fvar(8)!=0)
TriggerAll = stateno != [3000,3199] 
TriggerAll = stateno != [2800,3000] 
TriggerAll = stateno != [930,935]
triggerall=fvar(9)<75
trigger1 = ctrl
trigger2 =var(1)

;EX Throw
[State -1, Throw EX]
type = ChangeState
value = 2400
triggerall = command = "RDP_c"
triggerall = statetype !=A
TriggerAll = Power>999 || (fvar(8)!=0)
TriggerAll = stateno != [2800,3000] 
TriggerAll = stateno != [3000,3199] 
TriggerAll = stateno != [930,935]
triggerall=fvar(9)<75
trigger1 = ctrl
trigger2 =var(1)



;Lariat
[State -1, Rushing Punches]
type = ChangeState
value = 2500
triggerall = command = "QCF_c"
triggerall = statetype !=A
TriggerAll = Power>999 || (fvar(8)!=0)
TriggerAll = stateno != [2000,2010] 
TriggerAll = stateno != [2800,3000] 
TriggerAll = stateno != [3000,3199] 
TriggerAll = stateno != [930,935]
triggerall=fvar(9)<75
trigger1 = stateno=1750
;trigger1=var(1)
trigger2 = stateno=1755
;trigger2=var(1) && time<=10

;Lariat
[State -1, Rushing Punches]
type = ChangeState
value = 2500
triggerall = command = "c"
;triggerall = statetype !=A
TriggerAll = Power>999 || (fvar(8)!=0)
trigger1 = stateno=102
triggerall=fvar(9)<75


;Rushing Punches
[State -1, Rushing Punches]
type = ChangeState
value = 2000
triggerall = command = "QCF_c"
triggerall = statetype !=A
TriggerAll = Power>999 || (fvar(8)!=0)
Triggerall=stateno!=[1750,1755]
TriggerAll = stateno != [2000,2010] 
TriggerAll = stateno != [2800,3000] 
TriggerAll = stateno != [3000,3199] 
TriggerAll = stateno != [930,935]
triggerall=fvar(9)<75
trigger1 = ctrl
trigger2 =var(1)

;Lunge Punch Combo
[State -1, Lunge Punch Combo]
type = ChangeState
value = 2100
triggerall = command = "QCB_c"
triggerall = cond(power>4999,command != "HCB_c",1)
triggerall = statetype !=A
TriggerAll = Power>999 || (fvar(8)!=0)
TriggerAll = stateno != [3000,3199] 
TriggerAll = stateno != [2800,3000] 
TriggerAll = stateno != [930,935]
triggerall=fvar(9)<75
trigger1 = ctrl
trigger2 =var(1)

;Shockwave EX
[State -1, Shockwave EX]
type = ChangeState
value = 2200
triggerall = command = "DD_c"
triggerall = statetype !=A
TriggerAll = Power>999 || (fvar(8)!=0)
TriggerAll = stateno != [3000,3199] 
TriggerAll = stateno != [2800,3000] 
triggerall= !(fvar(8)=1 && (enemynear,statetype=L))
TriggerAll = stateno != [930,935]
triggerall=fvar(9)<75
trigger1 = ctrl
trigger2 =var(1)




;Specials
;===============================================

;Air Flying Kick A
[State -1, Flying Kick A]
type = ChangeState
value = 1900
triggerall = command = "QCB_a"
triggerall = statetype =A
triggerall=pos Y <-15
trigger1 = ctrl
Trigger2 = (StateNo = [600,699])
trigger2 = var(1)
Trigger3 = (StateNo = 2440)
trigger3 = var(1)

;Air Dive Kick B
[State -1, Dive Kick B]
type = ChangeState
value = 1950
triggerall = command = "QCB_b"
triggerall = statetype =A
triggerall=pos Y <-15
trigger1 = ctrl
Trigger2 = (StateNo = [600,699])
trigger2 = var(1)
Trigger3 = (StateNo = 2440)
trigger3 = var(1)
Trigger4 = (StateNo = 2600)
trigger4 = var(1)

;---------------------------------------------

;Air Amazing Punch
[State -1, Air Amazing Punch A]
type = ChangeState
value = 1800
triggerall = command = "QCF_a"
triggerall = statetype =A
trigger1 = ctrl
Trigger2 = (StateNo = [600,699])
trigger2 = var(1)
Trigger3 = (StateNo = 1350)
trigger3 = var(1)
Trigger4 = (StateNo = 1770)
trigger4 = var(1)
Trigger5 = (StateNo = 2440)
trigger5 = var(1)

;Air Amazing Punch Dist
[State -1, Air Amazing Punch B]
type = ChangeState
value = 1850
triggerall = command = "QCF_b"
triggerall = statetype =A
trigger1 = ctrl
Trigger2 = (StateNo = [600,699])
trigger2 = var(1)
Trigger3 = (StateNo = 1350)
trigger3 = var(1)
Trigger4 = (StateNo = 1770)
trigger4 = var(1)
Trigger5 = (StateNo = 2440)
trigger5 = var(1)




;==============================================

;Slide QCF A
[State -1, Slide QCF A]
type = ChangeState
value = 1700
triggerall = command = "QCF_a"
triggerall = statetype !=A
trigger1 = stateno=106 

;Slide QCF B A Follow
[State -1, Slide QCF B A Follow]
type = ChangeState
value = 1760
triggerall = command = "a"
trigger1 = stateno=102



;Slide QCF B
[State -1, Slide QCF B]
type = ChangeState
value = 1750
triggerall = statetype !=A
trigger1= command = "QCF_b"
trigger1 = stateno=106 
trigger2= command = "b"
trigger2= command = "holdfwd"
trigger2 = stateno=1020
trigger2=animelemtime(6)>=0 
trigger2=animelemtime(8)<=0


;Slide QCF B A Follow
[State -1, Slide QCF B A Follow]
type = ChangeState
value = 1760
triggerall = command = "holdfwd"
triggerall = command = "a"
triggerall = statetype !=A
trigger1 = stateno=1750
trigger1=var(1)
trigger2 = stateno=1755
trigger2=var(1) && time<=10
trigger3 = stateno=1020
trigger3=animelemtime(6)>=0 
trigger3=animelemtime(8)<=0

;Slide QCF B B Follow
[State -1, Slide QCF B B Follow]
type = ChangeState
value = 1770
triggerall = command = "holdfwd"
triggerall = command = "b"
triggerall = statetype !=A
trigger1 = stateno=1750
trigger1=var(1)
trigger2 = stateno=1755
trigger2=var(1) && time<=10
;trigger3 = stateno=1020
;trigger3=animelemtime(6)>=0 
;trigger3=animelemtime(8)<=0

;======================================
;Push
[State -1, Push]
type = ChangeState
value = 1600
triggerall = command = "RDP_a"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = (StateNo = [200,499])
trigger2 = var(1)

;Spinning Grab 
[State -1, Push]
type = ChangeState
value = 1650
triggerall = command = "RDP_b"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = (StateNo = [200,499])
trigger2 = var(1)




;======================================
;Shockwave A
[State -1, Shockwave A]
type = ChangeState
value = 1500
triggerall = command = "DD_a"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = (StateNo = [200,499])
trigger2 = var(1)

;Shockwave H
[State -1, Shockwave A]
type = ChangeState
value = 1550
triggerall = command = "DD_b"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = (StateNo = [200,499])
trigger2 = var(1)


;======================================
;Distance DP
[State -1, Diagonal DP]
type = ChangeState
value = 1400
triggerall = command = "DP_b"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = (StateNo = [200,499])
trigger2 = var(1)
Trigger3 = (StateNo = 1660)
trigger3 = var(1)
Trigger4 = (StateNo = 2420)
trigger4 = var(1)





;Diagonal DP
[State -1, Diagonal DP]
type = ChangeState
value = 1350
triggerall = command = "hold_y"
triggerall = command = "DP_a"
triggerall=fvar(7)>=10 || (fvar(8)!=0) 
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = (StateNo = [200,499])
trigger2 = var(1)
Trigger3 = (StateNo = 2420)
trigger3 = var(1)



;SugoiRyuken A
[State -1, SugoiRyuken A]
type = ChangeState
value = 1300
triggerall = command != "hold_y"
triggerall = command = "DP_a"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = (StateNo = [200,499])
trigger2 = var(1)


;======================================
;Lunge Amazing Punch A
[State -1, Amazing Punch A]
type = ChangeState
value = 1200
triggerall = command = "QCB_a"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = (StateNo = [200,499])
trigger2 = var(1)

;Lunge Amazing Punch B
[State -1, Amazing Punch B]
type = ChangeState
value = 1250
triggerall = command = "QCB_b"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = (StateNo = [200,499])
trigger2 = var(1)

;=======================================

;Distance Amazing Punch B
[State -1, Amazing Punch B]
type = ChangeState
value = 1100
triggerall = command = "QCF_b"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = (StateNo = [200,499])
trigger2 = var(1)


;=======================================

;Physical Amazing Punch A
[State -1, Amazing Punch A]
type = ChangeState
value = 1000
triggerall = command = "QCF_a"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = (StateNo = [200,499])
trigger2 = var(1)

;A Followup
[State -1, Amazing Punch A]
type = ChangeState
value = 1010
triggerall = command = "a"
triggerall = command = "holdfwd"
triggerall = statetype !=A
trigger1 = stateno=1000
trigger1 = var(1)

;B Followup
[State -1, Amazing Punch A]
type = ChangeState
value = 1020
triggerall = command = "b"
triggerall = command = "holdfwd"
triggerall = statetype !=A
trigger1 = stateno=1000
;trigger1 = var(1)

;C Followup
[State -1, Amazing Punch A]
type = ChangeState
value = 1030
triggerall = command = "c"
triggerall = command = "holdfwd"
triggerall = statetype !=A
triggerall=fvar(7)>=10 || (fvar(8)!=0)
trigger1 = stateno=1000
trigger1 = var(1)








;=======================================
;Amazing Down Dash
[State -1,Air Jab]
	Type=ChangeState
	value=690
	TriggerAll=command="c"
	TriggerAll=command="hold_y"
	;triggerall=command!="holdfwd"
	triggerall=command="holddown"
	triggerall = fvar(7) >=10 || (fvar(8)!=0)
	Triggerall = StateType = A
	Trigger1 = Ctrl
	trigger2= stateno=217 & var(1) & pos Y < -13
	trigger3= stateno=[600,650] & var(1)
	trigger4= stateno=1770 & var(1)  
	trigger5= stateno=1350 & var(1)  
	trigger6= stateno=1800 & var(1) 
	trigger7= stateno=1820 & var(1)  
	trigger8= stateno=2300 & var(1)  
	trigger9= stateno=2750 & var(1)  




;=======================================

[State -1,Grab];Grab
	Type=ChangeState
	value=800
	triggerall = command = "x"
	triggerall = statetype != A
	triggerall = ctrl || (stateno=1020 && animelemtime(6)>=0)
	trigger1 = command = "holdfwd"
	trigger2 = command = "holdback"
	;trigger2=animelemtime(8)<=0


[State -1,Endure];Guard Burst
	Type=ChangeState
	value=920
	TriggerAll=StateType!=A
	triggerall=fvar(7)>=50
	triggerall=stateno!=920
	Triggerall=stateno=[120,160]
	Trigger1=command="a" && command="b"
	trigger2=command="a+b"

[State -1,Endure];Burst Misogi
	Type=ChangeState
	value=925
	TriggerAll=StateType!=A
	triggerall=power>999
	triggerall=fvar(7)>=25
	triggerall=stateno!=925
	Triggerall=movetype=H
	triggerall=stateno!=920
	trigger1=command="Misogi"
	trigger2=command="HCF_a+b"




;Proj Slap
[State -1, Proj Slap]
type = ChangeState
value = 960
triggerall = command = "QCF_z"
triggerall=statetype!=A
trigger1 = ctrl

;Proj Slap Followup
[State -1, Proj Slap]
type = ChangeState
value = 960
triggerall = command = "z"
triggerall=statetype!=A
trigger1 = stateno=961
trigger1 = time<=10
ignorehitpause=1



;Gutsy Parry
[State -1, Gutsy Parry]
type = ChangeState
value = 950
triggerall = command = "F_z"
triggerall = command != "QCF_z"
triggerall=stateno!=[950,953]
triggerall=statetype!=A
triggerall =fvar(8)=0
trigger1 = ctrl
trigger1 = fvar(7) >=10 

[State -1,Endure];Endure
	Type=ChangeState
	value=940
	TriggerAll=StateType!=A
	TriggerAll=(command="x") || (command = "hold_x")
	triggerall =fvar(8)=0
	triggerall=fvar(7)>0
	Trigger1=Ctrl



[State -1,Gutsy Dash];Gutsy Dash
	Type=ChangeState
	value=930
	triggerall=fvar(7)>=10 || (fvar(8)!=0)
	TriggerAll=command="QCB_y"
	triggerall = command != "DP_a"
	Trigger1=Ctrl
	trigger2 = stateno=106
	trigger3=stateno=930 && var(1)
	trigger4=stateno=1660 && var(1)
	trigger5=stateno=1010 && var(1)
	trigger6=stateno=1020 
	trigger6=animelemtime(4)>=0 
	trigger6=animelemtime(8)<=0
	trigger7 = stateno=1850 && var(1)
	trigger8= stateno=1030 & var(1)  
	trigger9= stateno=2110 & var(1)  
	trigger10= stateno=2600 & var(1) 
	trigger11= stateno=2510 & var(1)  

[State -1,Gutsy Dash];Gutsy Dash FRONT
	Type=ChangeState
	value=935
	triggerall=fvar(7)>=10 || (fvar(8)!=0)
	TriggerAll=command="QCF_y"
	triggerall = command != "DP_a"
	Trigger1=Ctrl
	trigger2 = stateno=106
	trigger3=stateno=930 && var(1)
	trigger4=stateno=1660 && var(1)
	trigger5=stateno=1010 && var(1)
	trigger6=stateno=1020 
	trigger6=animelemtime(4)>=0 
	trigger6=animelemtime(8)<=0
	trigger7 = stateno=1850 && var(1)
	trigger8= stateno=1030 & var(1)  
	trigger9= stateno=2110 & var(1)  
	trigger10= stateno=2600 & var(1)  
	trigger11= stateno=2510 & var(1)  
	
[State -1,Gutsy Dash];Gutsy Dash
	Type=ChangeState
	value=930
	TriggerAll=command="b"
	Trigger1=stateno=102

[State -1,Fireworks];Hype Mode
	Type=ChangeState
	value=980
	TriggerAll=StateType!=A
	TriggerAll=command="DD_y"
	triggerall=fvar(7)=100
	triggerall =fvar(8)=0
	triggerall=power>2999	
	Trigger1=Ctrl
	trigger2=var(1) && stateno!= [3000,3999]


[State -1,Fireworks];EX Fires Up
	Type=ChangeState
	value=910
	TriggerAll=StateType!=A
	TriggerAll=command="DD_s"
	triggerall =fvar(8)=0
	triggerall=stateno!=910
	triggerall=fvar(7)<100
	triggerall=power>1999	
	Trigger1=Ctrl
	trigger2=var(1) && stateno!= [3000,3999]


[State -1,Fireworks];Fireworks
	Type=ChangeState
	value=900
	TriggerAll=StateType!=A
	TriggerAll=command="start"
	triggerall=command!="DD_s"
	triggerall =fvar(8)=0
	Trigger1=Ctrl
	trigger2=var(1) && stateno!= [2000,3999]





[State -1,Charge];Charge
	Type=ChangeState
	value=700
	triggerall =fvar(8)=0
	TriggerAll=StateType!=A
	TriggerAll=command="hold_a"
	TriggerAll=command="hold_c"
	TriggerAll=Power<PowerMax
	Trigger1=Ctrl




;---------------------------------------------------------------------------

[State -1,JumpC];ƒWƒƒƒ“ƒvƒLƒƒƒ“ƒZƒ‹
	Type=null;ChangeState
	value=40
	TriggerAll = StateType != A
	TriggerAll = command = "holdup"
	Trigger1 = StateNo = [1250,1251]
	Trigger1 = var(1)
	trigger2 = stateno = 52
	Trigger2 = (!var(1) && time >= 5) ||(var(1) && time >= 9)
	trigger3=stateno=100
	trigger4=stateno=220 && var(1)

[State -1,AirJumpC];ƒWƒƒƒ“ƒvƒLƒƒƒ“ƒZƒ‹
	Type=ChangeState
	value=45
	TriggerAll = StateType = A
	TriggerAll = command = "holdup"
	TriggerAll = stateno!=45
	triggerall = var(23) = 0 || var(23)=2 ;var(23) has to be pair to be considered "not holding up"
	triggerall=var(11)=0
	triggerall=fvar(7)>=5 || (fvar(8)!=0) 
	
	trigger1=(stateno=50) && time>=15
	;Trigger2 = var(1)

;Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
trigger1 = command = "FF"
trigger1 = statetype !=A 
trigger1 = ctrl


;Jump Run
[State -1, Run Fwd]
type = ChangeState
value = 102
trigger1 = command = "FF"
trigger1 = statetype !=A 
trigger1 = stateno=106

;---------------------------------------------------------------------------
;Run Back
[State -1, Run Back]
type = ChangeState
value = 105
trigger1 = command = "BB"
trigger1 = statetype !=A 
trigger1 = ctrl

;=============================================================================
;Crouching Low Kick
[State -1, Crouching Low Kick]
type = ChangeState
value = 400
triggerall = command = "a"
triggerall = (command = "holddown") || (stateno=1020)
triggerall = statetype !=A
trigger1 = ctrl
trigger2 = stateno = 400 && var(1)
;trigger3=stateno=1020 
;trigger3=animelemtime(6)>=0 
;trigger3=animelemtime(8)<=0

;Crouching Punch
[State -1, Crouching Punch]
type = ChangeState
value = 410
triggerall = command = "b"
triggerall = (command = "holddown") || (stateno=1020)
triggerall = statetype !=A
trigger1 = ctrl
trigger2 = stateno = 400 && var(1)
;trigger3=stateno=1020 
;trigger3=animelemtime(6)>=0 
;trigger3=animelemtime(8)<=0

;Crouching Upper
[State -1, Crouching Sweep]
type = ChangeState
value = 430
triggerall = command = "c"
triggerall = (command = "holddown") || (stateno=1020)
triggerall = command = "holdfwd"
triggerall = statetype !=A
trigger1 = ctrl
trigger2 = stateno = 420 && var(1)
trigger3=stateno=1020 
trigger3=animelemtime(4)>=0 
trigger3=animelemtime(8)<=0



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

;----------------------------------------------------------------------------

;Standing Jab
[State -1, Standing Jab]
type = ChangeState
value = 200
triggerall = command = "a"
triggerall = command != "holddown"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = StateNo = 201 && (var(1) || animelemtime(4)>=0)
trigger3=stateno=100

;Standing Jab Followup
[State -1, Standing Jab]
type = ChangeState
value = 201
triggerall = command = "a"
triggerall = command != "holddown"
triggerall = statetype !=A
Trigger1 = StateNo = 200 && (var(1) || animelemtime(4)>=0)

;Standing Knee
[State -1, Standing Knee]
type = ChangeState
value = 215
triggerall = command = "b"
triggerall = command != "holddown"
triggerall = statetype !=A
trigger1 = ctrl
trigger1=command="holdback"
Trigger2 = StateNo = 201 && (var(1))
trigger3=stateno=100


;Standing Strong Left
[State -1, Standing Strong Left]
type = ChangeState
value = 210
triggerall = command = "b"
triggerall = command != "holddown"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = StateNo = 200 && (var(1))
;trigger3=stateno=100

;Standing Small Amazing Punch
[State -1, Standing High Kick]
type = ChangeState
value = 230
triggerall = command = "c"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
triggerall = statetype !=A
triggerall=fvar(7)>=10 || (fvar(8)!=0)
trigger1 = ctrl
Trigger2 = StateNo = 220 && var(1)
trigger3=stateno=100
trigger4=stateno=[930,935] && var(1)




;Standing High Kick
[State -1, Standing High Kick]
type = ChangeState
value = 220
triggerall = command = "c"
triggerall = command != "holddown"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = StateNo = 200 && (var(1))
Trigger3 = StateNo = 201 && (var(1))
Trigger4 = StateNo = 210 && (var(1))
Trigger5 = StateNo = 215 && (var(1))
trigger6=stateno=100

;----------------------------------------------
;Air jab
[State -1,Air Jab]
	Type=ChangeState
	value=600
	TriggerAll=command="a"
	Triggerall = StateType = A
	triggerall=cond(vel Y <0,pos Y <=-19,1)
	Trigger1 = Ctrl
	trigger2= stateno=217 & var(1) & pos Y < -13
	trigger3= stateno=1770 & var(1)

;Air Upkick
[State -1,Air Jab]
	Type=ChangeState
	value=615
	TriggerAll=command="b"
	triggerall=command="holdup"
	Triggerall = StateType = A
	Trigger1 = Ctrl
	trigger2= stateno=217 & var(1) & pos Y < -13
	trigger3= stateno=600 & var(1) 
	trigger4= stateno=1770 & var(1)


;Air Chop
[State -1,Air Jab]
	Type=ChangeState
	value=610
	TriggerAll=command="b"
	triggerall=command!="holdback"
	Triggerall = StateType = A
	Trigger1 = Ctrl
	trigger2= stateno=217 & var(1) & pos Y < -13
	trigger3= stateno=600 & var(1) 
	trigger4= stateno=1770 & var(1)

;Air Amazing Kick
[State -1,Air Jab]
	Type=ChangeState
	value=640
	TriggerAll=command="c"
	triggerall=command!="holddown"
	triggerall=command="holdfwd"
	Triggerall = StateType = A
	triggerall=fvar(7)>=5 || (fvar(8)!=0)
	Trigger1 = 0;Ctrl
	trigger2= stateno=217 & var(1) & pos Y < -13
	;trigger3= stateno=600 & var(1) 
	;trigger4= stateno=610 & var(1) 
	trigger3= 0;stateno=615 & var(1) 
	trigger4= stateno=640 & var(1) 
	trigger5= stateno=620 & var(1) 
	trigger6= stateno=1770 & var(1) 


;Air Gorilla Stomp
[State -1,Air Jab]
	Type=ChangeState
	value=630
	TriggerAll=command="c"
	;triggerall=command!="holdfwd"
	triggerall=command="holddown"
	Triggerall = StateType = A
	Trigger1 = Ctrl
	trigger2= stateno=217 & var(1) & pos Y < -13
	trigger3= stateno=600 & var(1) 
	trigger4= stateno=610 & var(1) 
	trigger5= stateno=615 & var(1)
	trigger6= stateno=1770 & var(1)


;Air Spin Kick
[State -1,Air Jab]
	Type=ChangeState
	value=620
	TriggerAll=command="c"
	;triggerall=command!="holdfwd"
	triggerall=command!="holddown"
	Triggerall = StateType = A
	Trigger1 = Ctrl
	trigger2= stateno=217 & var(1) & pos Y < -13
	trigger3= stateno=600 & var(1) 
	trigger4= stateno=610 & var(1) 
	trigger5= stateno=615 & var(1) 
	trigger6= stateno=1770 & var(1)
