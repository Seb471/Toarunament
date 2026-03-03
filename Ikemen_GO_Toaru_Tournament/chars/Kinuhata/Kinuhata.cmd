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
	name = "Burst"
	command = a+b
	time = 1



[Command]
name = "HCF_c"
command = ~B, DB,D,DF, F, c
Time=32
buffer.Time=16

[Command]
name = "HCB_c"
command = ~F, DF,D,DB, B, c
Time=32
buffer.Time=16





;-| Special Motions |------------------------------------------------------




[Command]
name = "QCF_c"
command = ~D, DF, F, c
Time=20
	buffer.Time=10

[Command]
name = "DD_c"
command = ~D,D, c
Time=20
	buffer.Time=10

[Command]
name = "QCB_c"
command = ~D, DB, B, c
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
name = "DD_a"
command = ~D,D, a
Time=20
	buffer.Time=10


[Command]
name = "DD_b"
command = ~D,D, b
Time=20
	buffer.Time=10




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

[Command]
name = "jump"    
command = $D, UF
time = 11

[Command]
name = "jump2"    
command = $D, U
time = 11

[Command]
name = "Bottle_EX"    
command = ~D,D,z
time = 24
buffer.time = 12



[Command]
name = "Bottle"    
command = $D, z
time = 20

[Command]
name = "Offense"    
command = $F, z
time = 11

[Command]
name = "Defense"    
command = $B, z
time = 11

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

;---------------------------------------------------------------------------

;Heaviest Palm
[State -1, Heaviest Palm]
type = ChangeState
value = 3000
triggerall = command = "HCF_c"
triggerall = statetype !=A
triggerall = power > 2999
trigger1 = ctrl
trigger2 =  var(1)

;Pocket Rockets
[State -1, Pocket Rockets]
type = ChangeState
value = 2500
triggerall = command = "HCB_c"
triggerall = statetype !=A
triggerall = power > 1999
trigger1 = ctrl
trigger2 =  var(1)
;---------------------------------------------------------------------------

;---------------------------------------------------------------------------
;Combo EX
[State -1, Combo EX]
type = ChangeState
value = 2000
triggerall = command = "QCF_c"
triggerall = statetype !=A
triggerall = power > 999
trigger1 = ctrl
trigger2 =  var(1)


;Lunge Punch EX
[State -1, Lunge Punch EX]
type = ChangeState
value = 2200
triggerall = command = "QCB_c"
triggerall = statetype !=A
triggerall = power > 999
trigger1 = ctrl
trigger2 =  var(1)

;Ground Punch EX
[State -1, Combo EX]
type = ChangeState
value = 2300
triggerall = command = "DD_c"
triggerall = statetype !=A
triggerall = power > 999
trigger1 = ctrl
trigger2 =  var(1)

;Air Ground Punch EX
[State -1, Combo EX]
type = ChangeState
value = 2400
triggerall = command = "DD_c"
triggerall = statetype =A
triggerall = power > 999
trigger1 = ctrl
trigger2 =  var(1)
;---------------------------------------------------------------------------
;Rekka QCF A Finisher
[State -1, Rekka QCF A Finisher]
type = ChangeState
value = 1100
triggerall = command = "a" && command ="holdfwd"
triggerall = statetype !=A
trigger1 = stateno = 1050 
trigger1 =var(1) ||animelemtime(8) >=0
trigger1= var(20) = 1
trigger2 =stateno = 1050 
trigger2 = var(20) != 1
trigger2 =var(1) ||animelemtime(6) >=0
trigger3 = stateno = 1055 
trigger3=var(20) = 1
trigger3=var(1) ||animelemtime(12) >=0
trigger4=stateno = 1055 
trigger4=var(20) != 1
trigger4=var(1) ||animelemtime(9) >=0




trigger5 = stateno = 1060  
trigger5= var(1) ||animelemtime(8) >=0
trigger6 = stateno = 1065 
trigger6= var(1) ||animelemtime(8) >=0

;Rekka QCB A Finisher
[State -1, Rekka QCB A Finisher]
type = ChangeState
value = 1105
triggerall = command = "a" && command ="holdback"
triggerall = statetype !=A
trigger1 = stateno = 1050 
trigger1 =var(1) ||animelemtime(8) >=0
trigger1= var(20) = 1
trigger2 =stateno = 1050 
trigger2 = var(20) != 1
trigger2 =var(1) ||animelemtime(6) >=0
trigger3 = stateno = 1055 
trigger3=var(20) = 1
trigger3=var(1) ||animelemtime(12) >=0
trigger4=stateno = 1055 
trigger4=var(20) != 1
trigger4=var(1) ||animelemtime(9) >=0




trigger5 = stateno = 1060  
trigger5= var(1) ||animelemtime(8) >=0
trigger6 = stateno = 1065 
trigger6= var(1) ||animelemtime(8) >=0

;Rekka QCF B Finisher
[State -1, Rekka QCF B Finisher]
type = ChangeState
value = 1110
triggerall = command = "b" && command ="holdfwd"
triggerall = statetype !=A
trigger1 = stateno = 1050 
trigger1 =var(1) ||animelemtime(8) >=0
trigger1= var(20) = 1
trigger2 =stateno = 1050 
trigger2 = var(20) != 1
trigger2 =var(1) ||animelemtime(6) >=0
trigger3 = stateno = 1055 
trigger3=var(20) = 1
trigger3=var(1) ||animelemtime(12) >=0
trigger4=stateno = 1055 
trigger4=var(20) != 1
trigger4=var(1) ||animelemtime(9) >=0




trigger5 = stateno = 1060  
trigger5= var(1) ||animelemtime(8) >=0
trigger6 = stateno = 1065 
trigger6= var(1) ||animelemtime(8) >=0
;Rekka QCB B Finisher
[State -1, Rekka QCB B Finisher]
type = ChangeState
value = 1115
triggerall = command = "b" && command ="holdback"
triggerall = statetype !=A
trigger1 = stateno = 1050 
trigger1 =var(1) ||animelemtime(8) >=0
trigger1= var(20) = 1
trigger2 =stateno = 1050 
trigger2 = var(20) != 1
trigger2 =var(1) ||animelemtime(6) >=0
trigger3 = stateno = 1055 
trigger3=var(20) = 1
trigger3=var(1) ||animelemtime(12) >=0
trigger4=stateno = 1055 
trigger4=var(20) != 1
trigger4=var(1) ||animelemtime(9) >=0




trigger5 = stateno = 1060  
trigger5= var(1) ||animelemtime(8) >=0
trigger6 = stateno = 1065 
trigger6= var(1) ||animelemtime(8) >=0



;Rekka QCF A Mid
[State -1, Rekka QCF A Mid]
type = ChangeState
value = 1050
triggerall = command = "a" && command ="holdfwd"
triggerall = statetype !=A
trigger1 = stateno = 1000 
trigger1= var(1) || animelemtime(8)>=0
trigger2 = stateno = 1005 
trigger2=var(20)=1
trigger2= var(1) ||animelemtime(9) >=0
trigger3 = stateno = 1005 
trigger3=var(20)!=1
trigger3= var(1) ||animelemtime(7) >=0

;Rekka QCB A Mid
[State -1, Rekka QCB A Mid]
type = ChangeState
value = 1055
triggerall = command = "a" && command ="holdback"
triggerall = statetype !=A
trigger1 = stateno = 1000 
trigger1= var(1) || animelemtime(8)>=0
trigger2 = stateno = 1005 
trigger2=var(20)=1
trigger2= var(1) ||animelemtime(9) >=0
trigger3 = stateno = 1005 
trigger3=var(20)!=1
trigger3= var(1) ||animelemtime(7) >=0

;Rekka QCF B Mid
[State -1, Rekka QCF B Mid]
type = ChangeState
value = 1060
triggerall = command = "b" && command ="holdfwd"
triggerall = statetype !=A
trigger1 = stateno = 1000 
trigger1= var(1) || animelemtime(8)>=0
trigger2 = stateno = 1005 
trigger2=var(20)=1
trigger2= var(1) ||animelemtime(9) >=0
trigger3 = stateno = 1005 
trigger3=var(20)!=1
trigger3= var(1) ||animelemtime(7) >=0

;Rekka QCB B Mid
[State -1, Rekka QCF B Mid]
type = ChangeState
value = 1065
triggerall = command = "b" && command ="holdback"
triggerall = statetype !=A
trigger1 = stateno = 1000 
trigger1= var(1) || animelemtime(8)>=0
trigger2 = stateno = 1005 
trigger2=var(20)=1
trigger2= var(1) ||animelemtime(9) >=0
trigger3 = stateno = 1005 
trigger3=var(20)!=1
trigger3= var(1) ||animelemtime(7) >=0



;Rekka A Starter
[State -1, Rekka A Starter]
type = ChangeState
value = 1000
triggerall = command = "QCF_a"
triggerall = statetype !=A
trigger1 = ctrl
trigger2 = (StateNo=[200,499]) && var(1)
trigger3 = StateNo = 1200 && var(1) && Var(2) >= 2;When counter attacking and doing a lunge punch A
trigger4 = StateNo = 1250 && var(1) && Var(2) >= 2;When counter attacking and doing a lunge punch B

;Rekka B Starter
[State -1, Rekka B Starter]
type = ChangeState
value = 1005
triggerall = command = "QCF_b"
triggerall = statetype !=A
trigger1 = ctrl
trigger2 = (StateNo=[200,499]) && var(1)
trigger3 = StateNo = 1200 && var(1) && Var(2) >= 2;When counter attacking and doing a lunge punch A
trigger4 = stateno = 1250 && var(1)



;---------------------------------------------------------------------------
;Lunge Punch A
[State -1, Lunge Punch A]
type = ChangeState
value = 1200
triggerall = command = "QCB_a"
triggerall = statetype !=A
trigger1 = ctrl
trigger2 = (StateNo=[200,499]) && var(1)

;Lunge Punch B
[State -1, Lunge Punch B]
type = ChangeState
value = 1250
triggerall = command = "QCB_b"
triggerall = statetype !=A
trigger1 = ctrl
trigger2 = (StateNo=[200,499]) && var(1)


;--------------------------------------------------------------

;Ground Punch A
[State -1, Ground Punch A]
type = ChangeState
value = 1300
triggerall = command = "DD_a"
triggerall = statetype !=A
trigger1 = ctrl
trigger2 = (StateNo=[200,499]) && var(1)

;Ground Punch B
[State -1, Ground Punch B]
type = ChangeState
value = 1350
triggerall = command = "DD_b"
triggerall = statetype !=A
trigger1 = ctrl
trigger2 = (StateNo=[200,499]) && var(1)


;Air Ground Punch A
[State -1, Ground Punch A]
type = ChangeState
value = 1400
triggerall = command = "DD_a"
triggerall = statetype =A
trigger1 = ctrl
trigger2 = (StateNo=[600,699]) && var(1)

;Air Ground Punch B
[State -1, Ground Punch A]
type = ChangeState
value = 1450
triggerall = command = "DD_b"
triggerall = statetype =A
trigger1 = ctrl
trigger2 = (StateNo=[600,699]) && var(1)



;===========================================================================
;Burst
[State -1]
	type = ChangeState
	value = ifelse(statetype != A,6200,6250)
	TriggerAll = Alive
	triggerall = command =  "Burst"
	triggerall = MoveType = H
	triggerall = fvar(6)>=1500 ||var(3) >0
	trigger1 = stateno = 5000 && time > 0
	trigger2 = stateno = 5010 && time > 0
	trigger3 = stateno = 5020 && time > 0
	trigger4 = stateno = 5070 && time > 0
	trigger5 = stateno != 5000 && stateno != 5010 && stateno != 5020 && stateno != 5070
	trigger5 = stateno = [5001,5099]
;---------------------------------------------------------------------------
[State -1,JumpC];ジャンプキャンセル
	Type=ChangeState
	value=40
	TriggerAll = StateType != A
	TriggerAll = command = "holdup"
	Trigger1 = StateNo = 1105 || StateNo = 1115
	Trigger1 = var(1)
	trigger2 = stateno = 52
	Trigger2 = (!var(1) && time >= 3) ||(var(1) && time >= 9)

;Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall=ifelse(var(20) = 1,1,stateno!=[2000,3999])
triggerall = command = "FF"||(Command = "holdfwd" && Command = "y" && stateno != 4000) 
triggerall = statetype !=A
trigger1 = ctrl
trigger2 = var(1)
trigger2=var(7)<4;5

;---------------------------------------------------------------------------
;Run Back
[State -1, Run Back]
type = ChangeState
value = 105
triggerall=ifelse(var(20) = 1,1,stateno!=[2000,3999])
triggerall = command = "BB" || (Command = "holdback" && Command = "y" && stateno != 4000) 
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)

[State -1, Charge Power]
type = ChangeState
value = 4000
triggerall = ((command = "hold_y") || (command = "hold_a" && command = "hold_c")) && !(command =  "holdback" || command = "holdfwd")
triggerall = power<powermax
;triggerall = prevstateno != 100 && prevstateno!=105
triggerall = statetype !=A
trigger1 = ctrl



;Offense Mode Switch
[State -1, Offense Mode Switch]
type = ChangeState
value = 700
;triggerall = command = "Offense"
triggerall=stateno!=701
triggerall = command = "holdfwd"
triggerall = command = "z"
triggerall = statetype !=A
triggerall=!ishelper
triggerall=var(26)<1
trigger1 = fvar(6)>800
trigger1 =  var(20) !=1
trigger1 = ctrl
trigger2 = var(20) = 1
trigger2 = ctrl
trigger3 = fvar(6)>800
trigger3 =  var(20) !=1
trigger3 = var(1)
trigger4 = var(20) = 1
trigger4 = var(1)

[State -1, Defense Mode Switch]
type = ChangeState
value = 701
triggerall=stateno!=700
;triggerall = command = "Defense"
triggerall = command = "holdback"
triggerall = command = "z"
triggerall = statetype !=A
triggerall=var(26)<1
triggerall=!ishelper
trigger1 = fvar(6)>800
trigger1 =  var(20) !=2
trigger1 = ctrl
trigger2 = var(20) = 2
trigger2 = ctrl
trigger3 = fvar(6)>800
trigger3 =  var(20) !=2
trigger3 = var(1)
trigger4 = var(20) = 2
trigger4=  var(1)

[State -1, Bottle EX]
type = ChangeState
value = 703
triggerall = command = "Bottle_EX"
triggerall = statetype !=A

triggerall = fvar(6)<1600
triggerall =  var(3) > 0
triggerall = power > 999
trigger1= ctrl
trigger2 = var(1)


[State -1, Bottle Slow]
type = ChangeState
value = 702

triggerall = statetype !=A

triggerall = fvar(6)<1600
triggerall =  var(3) > 0
;trigger1 = command = "x" && command = "holddown"
triggerall = command = "holddown"
triggerall = command = "z"
triggerall=!(command = "holdfwd" || command = "holdback")
trigger1 = ctrl
trigger2 = var(1)




;Throw 
[State -1, Throw]
Type = ChangeState
value = 800
	TriggerAll=Alive!=0
	TriggerAll = StateType != A
	TriggerAll=command="x"
	triggerall = ctrl
	triggerall=!ishelper
	trigger1 = command = "holdfwd"
	trigger2 = command = "holdback"
	

;===========================================================================
;---------------------------------------------------------------------------
;Stand Quick Punch
[State -1, Stand Light Punch]
type = ChangeState
value = 200
triggerall = command = "a"
triggerall = command != "holddown"
triggerall = statetype !=A
trigger1 = ctrl
trigger2 = stateno = 200
trigger2= StateNo = 200 && (var(1) || animelemtime(4)>0)
trigger3 = (stateno = 211) && var(1) && var(30)!=1


;---------------------------------------------------------------------------


;Tackle
[State -1, Tackle]
type = ChangeState
value = 220
triggerall = command = "b"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
triggerall = statetype !=A
trigger1 = ctrl
trigger2 = (stateno = 200) && var(1)
trigger3 = (stateno = 100) && var(1)
trigger4 = (stateno = 250) && var(1) 

;Elbow Quick Hit
[State -1, Elbow Quick Hit]
type = ChangeState
value = 210
triggerall = command = "b"
triggerall = command != "holddown"
triggerall = statetype !=A
trigger1 = ctrl
trigger2 = (stateno = 200) && var(1) && var(30)=1
trigger3 = (stateno = 230) && var(1) && var(30)=-1
trigger4 = (stateno = 420) && var(1)

;---------------------------------------------------------------------------

;Heavy Double Punch
[State -1, Double Punch]
type = ChangeState
value = 240
triggerall = command = "c"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
triggerall = statetype !=A
trigger1 = ctrl
;trigger2 = (stateno = 200) && var(1)
;trigger3 = (stateno = 100) && var(1)
;trigger4 = (stateno = 230) && var(1) && var(20) =1

;Nitrogen Ball
[State -1, Ball]
type = ChangeState
value = 250
triggerall = command = "c"
triggerall = command = "holdback"
triggerall = command != "holddown"
triggerall = fvar(6) >100
triggerall = statetype !=A
trigger1 = ctrl
;trigger2 = (stateno = 200) && var(1)
;trigger3 = (stateno = 100) && var(1)
;trigger4 = (stateno = 230) && var(1) && var(20) =1


;Heavy Palm
[State -1, Heavy Palm]
type = ChangeState
value = 230
triggerall = command = "c"
triggerall = command != "holddown"
triggerall = statetype !=A
trigger1 = ctrl
trigger2 = (stateno = [210,211]) && var(1) && var(30)!=-1
;trigger3 = (stateno = 230) && time > 9



;---------------------------------------------------------------------------

;---------------------------------------------------------------------------

;---------------------------------------------------------------------------

;---------------------------------------------------------------------------
;Crouching Punch
[State -1, Crouching Punch]
type = ChangeState
value = 400
triggerall = command = "a"
triggerall = command = "holddown"
triggerall = statetype !=A
trigger1 = ctrl
trigger2 = stateno = 400
trigger2= (var(1) || animelemtime(4)>0)
trigger3 = (stateno = 1115) && var(1)

;---------------------------------------------------------------------------
;Crouching Kick
[State -1, Crouching Kick]
type = ChangeState
value = 410
triggerall = command = "b"
triggerall = command = "holddown"
triggerall = statetype !=A
trigger1 = ctrl
trigger2 = (stateno = 400) && var(1)
trigger3 = (stateno = 1115) && var(1)
;trigger2 = (time > 9) || (movecontact && time > 5)

;Crouching Sweep
[State -1, Crouching Sweep]
type = ChangeState
value = 420
triggerall = command = "c"
triggerall = command = "holddown"
triggerall = statetype !=A
trigger1 = ctrl
trigger2 = (stateno = 400) && var(1)
trigger3 = (stateno = 410) && var(1)
trigger4 = (stateno = 1115) && var(1)

;---------------------------------------------------------------------------


;---------------------------------------------------------------------------
;Jump Punch
[State -1, Jump Punch]
type = ChangeState
value = 600
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Jump Double Palm
[State -1, Jump Double Palm]
type = ChangeState
value = 610
triggerall = command = "b"
trigger1 = statetype = A
trigger1 = ctrl
Trigger2 = StateNo = 600 && var(1)
Trigger3 = StateNo = 630 && var(1) && var(20) = 1


;---------------------------------------------------------------------------
;Jump Shockwave
[State -1, Jump Shockwave]
type = ChangeState
value = 630
triggerall = command = "c"
triggerall = command = "holddown"
trigger1 = statetype = A
trigger1 = ctrl
Trigger2 = StateNo = 600 && var(1)
Trigger3 = StateNo = 610 && var(1)
Trigger4 = StateNo = 620 && var(1)

;Jump Gorilla Hit
[State -1, Jump Gorilla Hit]
type = ChangeState
value = 620
triggerall = command = "c"
trigger1 = statetype = A
trigger1 = ctrl
Trigger2 = StateNo = 600 && var(1)
Trigger3 = StateNo = 610 && var(1)
Trigger4 = StateNo = 630 && var(1) && var(20) = 1


;---------------------------------------------------------------------------


;Super Armor
[State -1, Super Armor]
type = ChangeState
value = 750
triggerall = command = "x"
trigger1 = ctrl
trigger1 = fvar(6) >200

