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
name = "HCF_a"  
command = ~B, DB, D, DF, F, a
time = 32
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
	name="hold_b"
	command=/b
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
;HYPERS

;Processor Suit
[State -1, Processor Suit]
type = ChangeState
value = 3100
triggerall = command = "HCB_c"
triggerall = statetype !=A
triggerall=stateno!=[3000,3999]
triggerall=var(3)>0
triggerall=power>3000
trigger1 = ctrl
trigger2 = var(1)


;Dragon Rider
[State -1, Dragon Rider]
type = ChangeState
value = 3000
triggerall = command = "HCF_c"
triggerall = statetype !=A
triggerall=stateno!=[3000,3999]
triggerall=var(3)>0
triggerall=power>3000
trigger1 = ctrl
trigger2 = var(1)

;Baton Hyper
[State -1, Baton Hyper]
type = ChangeState
value = 2500
triggerall = command = "HCF_b"
triggerall = statetype !=A
triggerall=var(3)>0
triggerall=stateno!=[2400,2599]
triggerall=stateno!=[2700,3999]
triggerall=power>1999
trigger1 = ctrl
trigger2 = var(1)

;Power Lifter
[State -1, PowerLifter]
type = ChangeState
value = 2400
triggerall = command = "HCF_a"
triggerall = statetype !=A
triggerall=var(3)>0
triggerall=stateno!=[2400,2599]
triggerall=stateno!=[2700,3999]
triggerall=power>1999
trigger1 = ctrl
trigger2 = var(1)



;===========================================================================
;SUPERS

;Air Rifle EX
[State -1, LMG EX]
type = ChangeState
value = 2600
triggerall = command = "QCF_c"
triggerall = statetype =A
triggerall=stateno!=2600
triggerall=stateno!=[2400,3999]
triggerall=power>999
trigger1 = ctrl
trigger2 = var(1)

;AntiAir EX
[State -1, AntiAir EX]
type = ChangeState
value = 2300
triggerall = command = "DP_c"
triggerall = statetype !=A
triggerall=stateno!=[2400,2599]
triggerall=stateno!=[2700,3999]
triggerall=power>999
trigger1 = ctrl
trigger2 = var(1)


;LMG EX
[State -1, LMG EX]
type = ChangeState
value = 2000
triggerall = command = "QCF_c"
triggerall = statetype !=A
triggerall=stateno!=2000
triggerall=stateno!=[2400,2599]
triggerall=stateno!=[2700,3999]
triggerall=power>999
trigger1 = ctrl
trigger2 = var(1)

;RPG EX
[State -1, RPG EX]
type = ChangeState
value = 2100
triggerall = command = "QCB_c"
triggerall = statetype !=A
triggerall=stateno!=[2400,2599]
triggerall=stateno!=[2700,3999]
triggerall=power>999
trigger1 = ctrl
trigger2 = var(1)

;Mines EX
[State -1, Mines EX]
type = ChangeState
value = 2200
triggerall = command = "DD_c"
triggerall = statetype !=A
triggerall=stateno!=[2400,2599]
triggerall=stateno!=[2700,3999]
triggerall=var(9) <2
triggerall=power>999
trigger1 = ctrl
trigger2 = var(1)


;===========================================================================

;SPECIALS

;Air Rifle A
[State -1, Rifle A]
type = ChangeState
value = 1600
triggerall = command = "QCF_a"
triggerall = statetype =A
triggerall=cond(vel Y <0,pos Y <=-49,1)
triggerall=var(4)>=10 ;Bullets 
trigger1 = ctrl
Trigger2 = StateNo = [600,699] 
trigger2 = var(1)

;Air Rifle B
[State -1, Rifle A]
type = ChangeState
value = 1650
triggerall = command = "QCF_b"
triggerall = statetype =A
triggerall=var(4)>=10 ;Bullets 
trigger1 = ctrl
Trigger2 = StateNo = [600,699] 
trigger2 = var(1)



;DP A (Physical)
[State -1, DP A]
type = ChangeState
value = 1300
triggerall = command = "DP_a"
triggerall = statetype !=A
;triggerall=var(5)>1 ;Bullets
trigger1 = ctrl
Trigger2 = StateNo = [200,499] 
trigger2 = var(1)

;DP B (Gun Diagonal)
[State -1, DP B]
type = ChangeState
value = 1350
triggerall = command = "DP_b"
triggerall = statetype !=A
triggerall=var(4)>=10 ;Bullets 
trigger1 = ctrl
Trigger2 = StateNo = [200,499] 
trigger2 = var(1)

;Rifle A
[State -1, Rifle A]
type = ChangeState
value = 1000
triggerall = command = "QCF_a"
triggerall = statetype !=A
triggerall=var(4)>=10 ;Bullets 
trigger1 = ctrl
Trigger2 = StateNo = [200,499] 
trigger2 = var(1)

;Rifle B
[State -1, Rifle B]
type = ChangeState
value = 1050
triggerall = command = "QCF_b"
triggerall = statetype !=A
triggerall=var(4)>=15 ;Bullets 
trigger1 = ctrl
Trigger2 = StateNo = [200,499] 
trigger2 = var(1)

;Grenade A
[State -1, Grenade A]
type = ChangeState
value = 1100
triggerall = command = "QCB_a"
triggerall = statetype !=A
triggerall=var(20)!=0
triggerall=var(8) <(1+(var(3)>1))
trigger1 = ctrl
Trigger2 = StateNo = [200,499] 
trigger2 = var(1)

;Grenade B
[State -1, Grenade B]
type = ChangeState
value = 1150
triggerall = command = "QCB_b"
triggerall = statetype !=A
triggerall=var(20)!=0
triggerall=var(8) <(1+(var(3)>1))
trigger1 = ctrl
Trigger2 = StateNo = [200,499] 
trigger2 = var(1)

;Mine A
[State -1, Mine A]
type = ChangeState
value = 1200
triggerall = command = "DD_a"
triggerall = statetype !=A
triggerall=var(21)!=0
triggerall=var(9) <1
trigger1 = ctrl
Trigger2 = StateNo = [200,499] 
trigger2 = var(1)

;Mine B
[State -1, Mine B]
type = ChangeState
value = 1250
triggerall = command = "DD_b"
triggerall = statetype !=A
triggerall=var(21)!=0
triggerall=var(9) <1
trigger1 = ctrl
Trigger2 = StateNo = [200,499] 
trigger2 = var(1)



;===========================================================================

;MISC PART 1
;Burst
[State -1]
	type = ChangeState
	value = ifelse(statetype != A,6200,6250)
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

[State -1,Good Luck]
	Type=ChangeState
	value=6300
	TriggerAll=command="y"
	triggerall= stateno!=6300
	TriggerAll=StateType!=A
	triggerall=var(3)=1
	Trigger1=Ctrl
	Trigger2=var(1)

[State -1,Great Luck]
	Type=ChangeState
	value=6400
	TriggerAll=command="y"
	triggerall= stateno!=6400
	TriggerAll=StateType!=A
	triggerall=var(3)=2
	triggerall=power>2999
	Trigger1=Ctrl
	Trigger2=var(1)

[State -1, Combo condition Reset]
type = varset
trigger1=movetype=H
trigger2 = stateno = [0,160]
var(1) = 0
ignorehitpause=1



;---------------------------------------------------------------------------
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
	trigger4= stateno=1350 && var(1)
	trigger5= stateno=2200 && var(1)
	;trigger6= stateno=2300 && var(1)

;---------------------------------------------------------------------------
;Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;Dash Back
[State -1, Dash Back]
type = ChangeState
value = 105
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl

;Run Back
[State -1, Run Back]
type = ChangeState
value = 107
trigger1 = command = "holdback"
trigger1 = stateno=106
trigger1=time>=3

;---------------------------------------------------------------------------------

[State -1,Charge];Charge
	Type=ChangeState
	value=700
	TriggerAll=StateType!=A
	TriggerAll=command="hold_a"
	TriggerAll=command="hold_c"
	TriggerAll=Power<PowerMax
	Trigger1=Ctrl


;=================================================================================
;MISC PART 2

[State -1, Reload]
type = ChangeState
value = 900
TriggerAll = StateType != A
triggerall=var(5)<14
triggerall=var(4)>0
triggerall = command = "x"
triggerall=command!="holdfwd"
triggerall=command!="holdback"
triggerall=command="holddown"
trigger1 = ctrl
;trigger2=var(1)

[State -1, Air Roll]
type = ChangeState
value = 780
TriggerAll = StateType = A
triggerall = command = "z"
trigger1 = ctrl

[State -1, Run Roll]
type = ChangeState
value = 770
;TriggerAll = StateType != A
triggerall = command = "z"
trigger1 = stateno=100
trigger2= stateno=107

[State -1, Forward Roll]
type = ChangeState
value = 760
TriggerAll = StateType != A
triggerall = command = "z"
triggerall=command="holdfwd"
triggerall=command!="holdback"
;triggerall=command!="holddown"
trigger1 = ctrl

[State -1, Backwards Roll]
type = ChangeState
value = 761
TriggerAll = StateType != A
triggerall = command = "z"
triggerall=command!="holdfwd"
triggerall=command="holdback"
;triggerall=command!="holddown"
trigger1 = ctrl

[State -1, Spot Dodge]
type = ChangeState
value = 750
TriggerAll = StateType != A
triggerall = command = "z"
triggerall=command!="holdfwd"
triggerall=command!="holdback"
trigger1 = ctrl
trigger2 = stateno=6300 && time<170

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
;CROUCH NORMALS
;Crouching Jab
[State -1, Crouching Jab]
type = ChangeState
value = 400
triggerall = command = "a"
triggerall = command = "holddown"
triggerall = statetype !=A
trigger1 = ctrl
trigger2 = stateno = 400 && var(1)
trigger3=stateno=[100,101]

;Crouching Sweep
[State -1, Crouching Sweep]
type = ChangeState
value = 410
triggerall = command = "b"
triggerall = command = "holddown"
triggerall = statetype !=A
trigger1 = ctrl
trigger2 = stateno = 400 && var(1)
trigger3=stateno=[100,101]

;Crouching Gun
[State -1, Crouching Gun]
type = ChangeState
value = 420
triggerall = command = "c"
;triggerall = command = "holddown"
triggerall = statetype !=A
triggerall=var(5)>0 ;Bullets 
trigger1 = ctrl
trigger1 = command = "holddown"
trigger2 = stateno = 400 && var(1)
trigger2 = command = "holddown"
trigger3 = stateno = 410 && var(1)
trigger3 = command = "holddown"
trigger4 = (stateno = [760,761]) && animelemtime(6)>=1 && var(3)>1
trigger5 = (stateno = 770) && animelemtime(7)>=1 && var(3)>1
trigger6 = (stateno = 780) && animelemtime(8)>=1 && var(3)>1
trigger7=stateno=[100,101]

;Crouching Gun Followup
[State -1, Crouching Gun]
type = ChangeState
value = 421
triggerall = command = "c"
;triggerall = command = "holddown"
triggerall = statetype !=A
triggerall=var(5)>0 ;Bullets 
trigger1 = stateno=420 && animelemtime(6)>=0
trigger2= stateno=421 && animelemtime(4)>=0 
trigger2=var(3)>1 && var(7)<4 ;Can only shoot up to 4 times
trigger3= stateno=421 && animelemtime(4)>=0 
trigger3=var(3)<2 && var(7)<2 ;Can only shoot up to 2 times


;---------------------------------------------------------------------------
;STANDING NORMALS
;Standing Elbow
[State -1, Standing Elbow]
type = ChangeState
value = 200
triggerall = command = "a"
triggerall = command != "holddown"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = StateNo = 200 && (var(1) || animelemtime(4)>=0)
trigger3=stateno=[100,101]

;Standing Tackle
[State -1, Standing Baton]
type = ChangeState
value = 220
triggerall = command = "b"
triggerall = command != "holddown"
triggerall = statetype !=A
trigger1 = ctrl
trigger1 = command = "holdback"
Trigger2 = StateNo = 200 && var(1)
trigger2 = command = "holdback"
trigger3=stateno=[100,101]

;Standing Baton
[State -1, Standing Baton]
type = ChangeState
value = 210
triggerall = command = "b"
triggerall = command != "holddown"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = StateNo = 200 && var(1)
;trigger3=stateno=[100,101]

;Standing Front Kick
[State -1, Standing Front Kick]
type = ChangeState
value = 250
triggerall = command = "c"
triggerall=command="holdfwd"
triggerall = command != "holddown"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = StateNo = 200 && var(1)
Trigger3 = (StateNo = [210,220]) && var(1)
trigger4=stateno=[100,101]

;Standing Gun ONE HIT
[State -1, Standing Gun ONE HIT]
type = ChangeState
value = 230
triggerall = command = "c"
triggerall = command != "holddown"
triggerall = statetype !=A
triggerall=var(5)>0 ;Bullets 
triggerall=var(3)<2 ;Unlucky/HardLuck
trigger1 = ctrl
Trigger2 = StateNo = 200 && var(1)
Trigger3 = (StateNo = [210,220]) && var(1)
trigger4=stateno=[100,101]
trigger5=StateNo = 250 && var(1)
trigger6 = (StateNo = [400,410])&& var(1)

;Standing Gun Multihit
[State -1, Standing Gun Multihit]
type = ChangeState
value = 240
triggerall = command = "c"
triggerall = command != "holddown"
triggerall = statetype !=A
triggerall=stateno!=241
triggerall=var(5)>0 ;Bullets 
triggerall=var(3)>1 ;GoodLuck
trigger1 = ctrl
Trigger2 = StateNo = 200 && var(1)
Trigger3 = (StateNo = [210,220]) && var(1)
trigger4=stateno=[100,101]
trigger5=StateNo = 250 && var(1)
trigger6 = (StateNo = [400,410])&& var(1)

;Standing Gun Multihit Followup
[State -1, Standing Gun Followup]
type = ChangeState
value = 241
triggerall = command = "c"
;triggerall = command != "holddown"
triggerall = statetype !=A
triggerall=var(5)>0 ;Bullets 
triggerall=var(3)>1 ;GoodLuck
triggerall=var(7)<5 ;Can only shoot up to 5 times
trigger1 = stateno=240 && animelemtime(5)>=0
trigger2= stateno=241 && animelemtime(3)>=0 

;=========================================================
;AIR NORMALS

;Air jab
[State -1,Air Jab]
	Type=ChangeState
	value=600
	TriggerAll=command="a"
	Triggerall = StateType = A
	Trigger1 = Ctrl

;Air knee
[State -1,Air Knee]
	Type=ChangeState
	value=610
	TriggerAll=command="b"
	Triggerall = StateType = A
	Trigger1 = Ctrl
	Trigger2 = StateNo = 600 && var(1)

;Air Gun
[State -1, Air Gun]
type = ChangeState
value = 630
triggerall = command = "c"
TriggerAll = command = "holddown"
triggerall=var(5)>0 ;Bullets 
triggerall = statetype = A
Trigger1 = Ctrl
trigger2 = stateno = 600 && var(1) 
trigger3 = stateno = 610 && var(1)
trigger4 = stateno = 620 && var(1)

;Air Stomp
[State -1,Air Stomp]
	Type=ChangeState
	value=620
	TriggerAll=command="c"
	Triggerall = StateType = A
	Trigger1 = Ctrl
	Trigger2 = StateNo = 600 && var(1)
	Trigger3 = StateNo = 610 && var(1)


