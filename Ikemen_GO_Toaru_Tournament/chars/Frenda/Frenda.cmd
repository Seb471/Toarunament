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
name = "HCF_a"  
command = ~B, DB, D, DF, F, a
time = 32
buffer.Time=16

[Command]
	name="HCF_a"
	command=~D, DB, B, D, DF, F,a
Time=32
buffer.Time=16

[Command]
	name="HCF_b"
	command=~D, DB, B, D, DF, F,b
Time=32
buffer.Time=16

[Command]
	name="HCF_c"
	command=~D, DB, B, D, DF, F,c
Time=32
buffer.Time=16

[Command]
	name="HCB_a"
	command=~D, DF, F, D, DB, B,a
Time=32
buffer.Time=16

[Command]
	name="HCB_b"
	command=~D, DF, F, D, DB, B,b
Time=32
buffer.Time=16

[Command]
	name="HCB_c"
	command=~D, DF, F, D, DB, B,c
Time=32
buffer.Time=16
	
	

[Command]
name = "HCF_b"  
command = ~B, DB, D, DF, F, b
time = 32
buffer.Time=16


;-| Super Motions |--------------------------------------------------------

[Command]
name = "DP_c"
command = ~F,DF,D,DF,c
Time=20
buffer.Time=10

[Command]
name = "DP_c"
command = ~DF,D,DF,c
Time=20
buffer.Time=10

[Command]
name = "[4]]6[_c"
command = ~25$B, F, c
time = 20
buffer.Time=10


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
name = "DP_a"
command = ~DF,D,DF,a
Time=20
buffer.Time=10

[Command]
name = "DP_b"
command = ~F,DF,D,DF,b
Time=20
buffer.Time=10

[Command]
name = "DP_b"
command = ~DF,D,DF,b
Time=20
buffer.Time=10


[Command]
name = "[4]]6[_a"
command = ~25$B, F, a;~45$B, F, a
time = 20
buffer.Time=10

[Command]
name = "[4]]6[_b"
command = ~25$B, F, b;~45$B, F, b
time = 20
buffer.Time=10

[Command]
name = "QCF_z"
command = ~D, DF, F, z
time = 20
buffer.time = 10

[Command]
name = "QCB_z"
command = ~D, DB, B, z
time = 20
buffer.time = 10


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

[Command]
	name = "Burst"
	command = a+b
	time = 1



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

[Command]
	name="hold_y"
	command=/y
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

;Ha Det Bra
[State -1, Boosted Lunge Slice EX]
type = ChangeState
value = 3000
triggerall = command = "HCB_c"
triggerall = statetype !=A
TriggerAll = Power>2999
TriggerAll = stateno != [2800,3199] 
trigger1 = ctrl
trigger2 =var(1)
trigger3=stateno=750


;Boosted Lunge Slice EX
[State -1, Boosted Lunge Slice EX]
type = ChangeState
value = 2800
triggerall = command = "HCF_c"
triggerall = statetype !=A
TriggerAll = Power>1999
TriggerAll = stateno != [2800,3199] 
trigger1 = ctrl
trigger2 =var(1)
trigger3=stateno=750

;Ignis Gas
[State -1, Baton Hyper]
type = ChangeState
value = 2600
triggerall = command = "HCF_b"
triggerall = statetype !=A
TriggerAll = stateno != [3000,3199] 
triggerall=numhelper(2650)=0
triggerall=power>1999
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=750

;--------------------------------

;EX Air Missiles
[State -1, Arc Blades Combo EX]
type = ChangeState
value = 2400
triggerall = command = "QCF_c"
triggerall = statetype =A
TriggerAll = Power>999 
;TriggerAll = stateno != [2000,2002] 
TriggerAll = stateno != [2800,3199] 
TriggerAll = stateno != 4000 
trigger1 = ctrl
trigger2 =var(1)
trigger3=stateno=750

;EX DP
[State -1, Arc Blades Combo EX]
type = ChangeState
value = 2200
triggerall = command = "DP_c"
triggerall = statetype !=A
TriggerAll = Power>999 
;TriggerAll = stateno != [2000,2002] 
TriggerAll = stateno != [2800,3199] 
TriggerAll = stateno != 4000 
trigger1 = ctrl
trigger2 =var(1)
trigger3=stateno=750

;EX Dolls
[State -1, Arc Blades Combo EX]
type = ChangeState
value = 2100
triggerall = command = "QCB_c"
triggerall = statetype !=A
TriggerAll = Power>999 
;TriggerAll = stateno != [2000,2002] 
TriggerAll = stateno != [2800,3199] 
TriggerAll = stateno != 4000 
trigger1 = ctrl
trigger2 =var(1)
trigger3=stateno=750

;EX Missiles
[State -1, Arc Blades Combo EX]
type = ChangeState
value = 2000
triggerall = command = "QCF_c"
triggerall = statetype !=A
TriggerAll = Power>999 
;TriggerAll = stateno != [2000,2002] 
TriggerAll = stateno != [2800,3199] 
TriggerAll = stateno != 4000 
trigger1 = ctrl
trigger2 =var(1)
trigger3=stateno=750

;EX Detonate
[State -1, Arc Blades Combo EX]
type = ChangeState
value = 2300
triggerall = command = "DD_c"
triggerall = statetype !=A
TriggerAll = Power>999 
;TriggerAll = stateno != [2000,2002] 
triggerall=var(4)>0
TriggerAll = stateno != [3000,3199] 
TriggerAll = stateno != 4000 
trigger1 = ctrl
trigger2 =var(1)
trigger3=stateno=750



;--------------------------------------------


;Air Small Bombs
[State -1, Rekka Start]
type = ChangeState
value = 1800
triggerall = statetype =A
trigger1= command = "QCF_a"
trigger1 = ctrl
trigger2= command = "QCF_a"
Trigger2 = StateNo = [600,699] 
trigger2 = var(1)
trigger3= command = "QCF_a"  || (command = "a" && command = "holdback")
Trigger3 = StateNo = 635
trigger3 = animelemno(0)>2

;Air Missile
[State -1, Rekka Start]
type = ChangeState
value = 1850
triggerall = statetype =A
trigger1 = ctrl
trigger1 = command = "QCF_b"
trigger2 = command = "QCF_b"
Trigger2 = StateNo = [600,699] 
trigger2 = var(1)
trigger3= command = "QCF_b"  || (command = "b" && command = "holdback")
Trigger3 = StateNo = 635
trigger3 = animelemno(0)>2




;DP A (Physical)
[State -1, DP A]
type = ChangeState
value = 1400
triggerall = command = "DP_a"
triggerall = statetype !=A
triggerall =stateno!=52
;triggerall=var(5)>1 ;Bullets
trigger1 = ctrl
Trigger2 = StateNo = [200,499] 
trigger2 = var(1)

;DP B Anti Air Missile
[State -1, DP A]
type = ChangeState
value = 1500
triggerall = command = "DP_b"
triggerall = statetype !=A
triggerall =stateno!=52
;triggerall=var(5)>1 ;Bullets
trigger1 = ctrl
Trigger2 = StateNo = [200,499] 
trigger2 = var(1)




;Bomb Setup
[State -1, Rekka Start]
type = ChangeState
value = 1300
triggerall = command = "QCB_a"
triggerall = statetype !=A
triggerall=var(4)<=5
trigger1 = ctrl
Trigger2 = StateNo = [200,499] 
trigger2 = var(1)
Trigger3 = StateNo = 810
trigger3 = var(1)
Trigger4 = StateNo = 1300
trigger4 = var(1) && time>=19

;Bomb Throw
[State -1, Rekka Start]
type = ChangeState
value = 1350
triggerall = command = "QCB_b"
triggerall = statetype !=A
triggerall=var(4)<=5
trigger1 = ctrl
Trigger2 = StateNo = [200,499] 
trigger2 = var(1)
Trigger3 = StateNo = 810
trigger3 = var(1)


;Dodge Small Bombs
[State -1, Rekka Start]
type = ChangeState
value = 1200
triggerall= command= "[4]]6[_a"
triggerall=command!="DP_a"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = StateNo = [200,499] 
trigger2 = var(1)

;Dodge Missile
[State -1, Rekka Start]
type = ChangeState
value = 1250
triggerall= command= "[4]]6[_b"
triggerall=command!="DP_b"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = StateNo = [200,499] 
trigger2 = var(1)


;Short Small Bombs
[State -1, Rekka Start]
type = ChangeState
value = 1201
triggerall= command= "QCF_a"
Trigger1 = StateNo = 105
trigger1 = animelemtime(4)>=0 || var(6)>=1
trigger2=Stateno=106






;Slow Missiles
[State -1, Rekka Start]
type = ChangeState
value = 1000
triggerall = command = "QCF_a"
triggerall= command!= "[4]]6[_a"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = StateNo = [200,499] 
trigger2 = var(1)

;Slow Two Missiles
[State -1, Rekka Start]
type = ChangeState
value = 1100
triggerall = command = "QCF_b"
triggerall= command!= "[4]]6[_b"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = StateNo = [200,499] 
trigger2 = var(1)

;Ignite
[State -1, DP A]
type = ChangeState
value = 1600
triggerall = command = "DD_a" || command = "DD_b"
triggerall = statetype !=A
triggerall=var(4)>5
triggerall=(numhelper(1320)>0) || (numhelper(21011)>0) || (numhelper(21021)>0) || (numhelper(21031)>0)
trigger1 = ctrl
Trigger2 = StateNo = [200,499] 
trigger2 = var(1)
Trigger3 = (StateNo = 1300) || (stateno = 1350) || (stateno = 2100)
trigger3 = var(1)

;Ignite
[State -1, DP A]
type = ChangeState
value = 1600
triggerall = command = "c" || command = "hold_c"
triggerall= command = "hold_y"
triggerall = statetype !=A || stateno=105
triggerall=((numhelper(1320)>0) || (numhelper(21011)>0) || (numhelper(21021)>0) || (numhelper(21031)>0)) && (var(4)>0)
trigger1 = ctrl
Trigger2 = StateNo = [200,499] 
trigger2 = var(1)
Trigger3 = StateNo = [1700,1750]
trigger3 = anim=1701 && animelemtime(7)>=0
Trigger4 = (StateNo = 1300) || (stateno = 1350) || (stateno = 2100)
trigger4 = var(1)
Trigger5 = StateNo = 105
trigger5 = animelemtime(4)>=0 || var(6)>=1


;Ignite Laying Down
[State -1, DP A]
type = ChangeState
value = 751
triggerall = command = "c" || command = "hold_c"
triggerall= command = "hold_y"
triggerall = stateno =750
triggerall= anim=755
trigger1=(numhelper(1320)>0) || (numhelper(21011)>0) || (numhelper(21021)>0) || (numhelper(21031)>0)

;DodgeBack Setup Once
[State -1, DP A]
type = ChangeState
value = 1700
triggerall = command = "DD_a" 
triggerall = statetype !=A
triggerall=var(4)<=5
trigger1 = ctrl
Trigger2 = StateNo = [200,499] 
trigger2 = var(1)
Trigger3 = StateNo = 810
trigger3 = var(1)


;DodgeBack Setup Twice
[State -1, DP A]
type = ChangeState
value = 1750
triggerall = command = "DD_b" 
triggerall = statetype !=A
triggerall=var(4)<=5
trigger1 = ctrl
Trigger2 = StateNo = [200,499] 
trigger2 = var(1)
Trigger3 = StateNo = 810
trigger3 = var(1)









;=====================================================

;Throw
[State -1]
Type = ChangeState
value = 800
triggerall = command = "x"
triggerall = statetype != A
triggerall = ctrl || stateno=[100,101]
trigger1 = command = "holdfwd"
trigger2 = command = "holdback"

;Taunt
[State -1]
Type = ChangeState
value = 195
triggerall = command = "start"
triggerall = statetype != A
trigger1 = ctrl

[State -1]
	type = ChangeState
	value = 6200
	TriggerAll = Alive
	triggerall = command =  "Burst"
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
	TriggerAll=command="hold_a"
	TriggerAll=command="hold_c"
	TriggerAll=Power<PowerMax
	Trigger1=Ctrl


[State -1, Slide Dodge]
type = ChangeState
value = 760
TriggerAll = StateType != A
triggerall = command = "z"
trigger1=stateno=[100,101]

;Stun Grenade
[State -1, Run Fwd]
type = ChangeState
value = 780
triggerall = command = "QCB_z"
triggerall=power>499
triggerall = statetype !=A
trigger1 = ctrl
trigger2=stateno=[100,101]

[State -1, Dodge]
type = ChangeState
value = 720
TriggerAll = StateType != A
triggerall = command = "z"
triggerall = command != "QCF_z"
triggerall = command != "QCB_z"
trigger1=ctrl



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
	trigger1 = stateno = 52
	Trigger1 = (!var(1) && time >= 5) ||(var(1) && time >= 9)
	trigger2=stateno=[100,101]


;Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
trigger1 = command = "FF" ||(Command = "holdfwd" && Command = "y" )
trigger1 = statetype !=A
trigger1 = ctrl

;Run Back
[State -1, Run Fwd]
type = ChangeState
value = 105
triggerall = command = "BB" ||(Command = "holdback" && Command = "y" )
triggerall = statetype !=A
trigger1 = ctrl
trigger2= anim= 101 
trigger3= stateno=1000 || stateno=1100
trigger3= time<(25+(5*(stateno=1100)))

;Lay Down
[State -1, Run Fwd]
type = ChangeState
value = 750
triggerall = (command = "hold_y" && command = "holddown") 
triggerall = statetype !=A
trigger1 = ctrl
trigger2=stateno=[100,101]






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
trigger3=stateno=[100,101]

;Crouching Kick Poke
[State -1, Crouching Low Kick]
type = ChangeState
value = 410
triggerall = command = "b"
triggerall = command = "holddown"
triggerall = statetype !=A
trigger1 = ctrl
trigger2 = stateno = 400 && var(1)
trigger3=stateno=[100,101]


;Anti Air Kick
[State -1, Crouching Sweep]
type = ChangeState
value = 430
triggerall = command = "c"
triggerall = command = "holddown"
triggerall = command = "holdfwd"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = StateNo = 420 && (var(1))
trigger3=stateno=[100,101]

;Anti Air Kick
[State -1, Crouching Sweep]
type = ChangeState
value = 430
triggerall = command = "c"
triggerall = statetype !=A
Trigger1 = StateNo = 1300 && (var(1))


;Standing Knee Followup
[State -1, Standing Hook]
type = ChangeState
value = 211
triggerall = command = "c" || command ="b"
triggerall = statetype !=A
Trigger1 = StateNo = 420 && (var(1))



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
trigger4=stateno=[100,101]






;-------------------------------------------------------------------------

;Standing Jab
[State -1, Standing Jab]
type = ChangeState
value = 200
triggerall = command = "a"
triggerall = command != "holddown"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = StateNo = 200 && (var(1) || animelemtime(4)>=0)
trigger3=stateno=[100,101]

;Upper Knee
[State -1, Standing Hook]
type = ChangeState
value = 220
triggerall = command = "b"
triggerall = command = "holdback"
triggerall = command != "holddown"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = StateNo = 200 && (var(1))
Trigger3 = StateNo = 211 && (var(1))
trigger4=stateno=[100,101]

;Standing Knee
[State -1, Standing Hook]
type = ChangeState
value = 210
triggerall = command = "b"
triggerall = command != "holddown"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = StateNo = 200 && (var(1))
trigger3=stateno=[100,101]

;Standing Knee Followup
[State -1, Standing Hook]
type = ChangeState
value = 211
triggerall = command = "b" || command ="c"
triggerall = command != "holddown"
triggerall = statetype !=A
Trigger1 = StateNo = 210 && (var(1))


;Overhead Kick Combo
[State -1, Standing Hook]
type = ChangeState
value = 240
triggerall = command = "c"
triggerall = command = "holdback"
triggerall = command != "holddown"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = StateNo = 200 && (var(1))
Trigger3 = StateNo = [210,211] && (var(1))
trigger4=stateno=[100,101]


;C Kick Combo
[State -1, Standing Hook]
type = ChangeState
value = 230
triggerall = command = "c"

triggerall = statetype !=A
trigger1 = ctrl
trigger1 = command != "holddown"
Trigger2 = StateNo = 200 && (var(1))
Trigger3 = StateNo = [210,211] && (var(1))
trigger4=stateno=[100,101]

;C Kick Combo
[State -1, Standing Hook]
type = ChangeState
value = 230
triggerall = command = "c"
triggerall = statetype !=A
Trigger1 = StateNo = 1350 && (var(1))


;--------------------------------------------

;Air jab
[State -1,Air Jab]
	Type=ChangeState
	value=600
	TriggerAll=command="a"
	Triggerall = StateType = A
	Trigger1 = Ctrl
	trigger2= stateno=220 && var(1)

;Air Straight KIck
[State -1,Air Jab]
	Type=ChangeState
	value=610
	TriggerAll=command="b"
	Triggerall = StateType = A
	Trigger1 = Ctrl
	trigger2= stateno=600 && var(1)
	trigger3= stateno=220 && var(1)

;Air Stomp 
[State -1,Air Jab]
	Type=ChangeState
	value=630
	TriggerAll=command="c"
	TriggerAll=command="holddown"
	Triggerall = StateType = A
	Trigger1 = Ctrl
	trigger2= stateno=600 && var(1)
	trigger3= stateno=610 && var(1)
	trigger4= stateno=220 && var(1)

;Air DropKIck
[State -1,Air Jab]
	Type=ChangeState
	value=620
	TriggerAll=command="c"
	Triggerall = StateType = A
	Trigger1 = Ctrl
	trigger2= stateno=600 && var(1)
	trigger3= stateno=610 && var(1)
	trigger4= stateno=220 && var(1)