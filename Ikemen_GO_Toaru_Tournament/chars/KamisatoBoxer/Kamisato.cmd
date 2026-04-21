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
	name = "RC"
	command = z
	time = 1

[Command]
	name = "Burst"
	command = a+b
	time = 1



[Command]
name = "QCBHCF_c"  
command = ~D, DB, B, DB, F, c
time = 40
buffer.Time=20

[Command]
name = "QCBHCF_c"  
command = ~D, DB, DF, F, c
time = 40
buffer.Time=20

[Command]
name = "QCBHCF_c"  
command = ~D, DB, B, DB, DF, c
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

[Command]
name = "QCBHCF_c"  
command = ~D, DB, D, DF,F, c
time = 20
buffer.Time=10

;--
[Command]
name = "QCBHCF_b"  
command = ~D, DB, B, DB, F, b
time = 40
buffer.Time=20

[Command]
name = "QCBHCF_b"  
command = ~D, DB, DF, F, b
time = 40
buffer.Time=20

[Command]
name = "QCBHCF_b"  
command = ~D, DB, B, DB, DF, b
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
command = ~D, DB, D, DF,F, b
time = 20
buffer.Time=10


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

;-- 
[Command]
name = "QCBHCF_a"  
command = ~D, DB, B, DB, F, a
time = 40
buffer.Time=20


[Command]
name = "QCBHCF_a"  
command = ~D, DB, DF, F, a
time = 40
buffer.Time=20

[Command]
name = "QCBHCF_a"  
command = ~D, DB, B, DB, DF, a
time = 40
buffer.Time=20

[Command]
name = "QCBHCF_a"  
command = ~D, DB, D, DF,F, a
time = 20
buffer.Time=10


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



[Command]
name = "WROHKO"
command = ~F,DF,D,DB,B, x
time = 32
buffer.Time=16

[Command]
name = "WRAttackEX"
command = ~D, DF, F, x
Time=20
buffer.Time=10

[Command]
name = "WRShieldEX"
command = ~D, DB, B, x
Time=20
buffer.Time=10

[Command]
name = "NT14Punch"  
command = ~B, DB, D, DF, F, c
time = 32
buffer.Time=16

[Command]
name = "HCBF_c"
command = ~F,DF,D,DB,B,F, c
time = 32
buffer.Time=16

[Command]
name = "HCBF_c"
command = ~F,DF,D,DB,F,B, c
time = 32
buffer.Time=16


[Command]
name = "HCBF_c"
command = ~F,DF,D,DB,B,DF, c
time = 32
buffer.Time=16

[Command]
name = "HCBF_c"
command = ~F,DF,D,DB,DF, c
time = 32
buffer.Time=16

[Command]
name = "HCBF_c"
command = ~F,DF,D,DB,D,DF, c
time = 32
buffer.Time=16

[Command]
name = "HCBF_c"
command = ~DF,D,DB,B,DF, c
time = 32
buffer.Time=16

[Command]
name = "HCBF_c"
command = ~DF,DB,DF, c
time = 32
buffer.Time=16
[Command]
name = "HCBF_c"
command = ~D,DB,DF, c
time = 32
buffer.Time=16

[Command]
name = "HCBF_c"
command = ~D,B,F, c
time = 32
buffer.Time=16

[Command]
name = "BatonComboEX"   
command = ~B, DB, D, DF, F, b
time = 32
buffer.Time=16


[Command]
name = "HCBF_a"
command = ~F,DF,D,DB,B,F, a
time = 32
buffer.Time=16

[Command]
name = "HCBF_a"
command = ~F,DF,D,DB,F,B, a
time = 32
buffer.Time=16


[Command]
name = "HCBF_a"
command = ~F,DF,D,DB,B,DF, a
time = 32
buffer.Time=16

[Command]
name = "HCBF_a"
command = ~F,DF,D,DB,DF, a
time = 32
buffer.Time=16

[Command]
name = "HCBF_a"
command = ~F,DF,D,DB,D,DF, a
time = 32
buffer.Time=16

[Command]
name = "HCBF_a"
command = ~DF,D,DB,B,DF, a
time = 32
buffer.Time=16

[Command]
name = "HCBF_a"
command = ~DF,DB,DF, a
time = 32
buffer.Time=16
[Command]
name = "HCBF_a"
command = ~D,DB,DF, a
time = 32
buffer.Time=16

[Command]
name = "HCBF_a"
command = ~D,B,F, a
time = 32
buffer.Time=16







[Command]
name = "HCBF_a"
command = ~F,D,B,F, a
time = 40
buffer.Time=20

[Command]
name = "HCBF_a"
command = ~F,D,F,B, a
time = 40
buffer.Time=20

[Command]
name = "HCBF_a"
command = ~F,D,B,DF, a
time = 40
buffer.Time=20



;--

[Command]
name = "HCBF_b"
command = ~F,DF,D,DB,B,F, b
time = 32
buffer.Time=16

[Command]
name = "HCBF_b"
command = ~F,DF,D,DB,F,B, b
time = 32
buffer.Time=16


[Command]
name = "HCBF_b"
command = ~F,DF,D,DB,B,DF, b
time = 32
buffer.Time=16

[Command]
name = "HCBF_b"
command = ~F,DF,D,DB,DF, b
time = 32
buffer.Time=16

[Command]
name = "HCBF_b"
command = ~F,DF,D,DB,D,DF, b
time = 32
buffer.Time=16

[Command]
name = "HCBF_b"
command = ~DF,D,DB,B,DF, b
time = 32
buffer.Time=16

[Command]
name = "HCBF_b"
command = ~DF,DB,DF, b
time = 32
buffer.Time=16
[Command]
name = "HCBF_b"
command = ~D,DB,DF, b
time = 32
buffer.Time=16

[Command]
name = "HCBF_b"
command = ~D,B,F, b
time = 32
buffer.Time=16







[Command]
name = "HCBF_b"
command = ~F,D,B,F, b
time = 40
buffer.Time=20

[Command]
name = "HCBF_b"
command = ~F,D,F,B, b
time = 40
buffer.Time=20

[Command]
name = "HCBF_b"
command = ~F,D,B,DF, b
time = 40
buffer.Time=20



[Command]
name = "CounterEX"
command = ~D,D, x
Time=20
buffer.Time=10

[Command]
name = "QCF_c"
command = ~D, DF, F, c;~B, DB, D, DF, F, a
Time=13
buffer.Time=7

[Command]
name = "ArataEX"
command = D,D,y
time = 20
buffer.Time=10

[Command]
name = "UltraKick_EX"
command = ~D,DB,B,c
Time=20
buffer.Time=10

[Command]
name = "Upkick_EX"
command = ~F,DF,D,DF,c
Time=20
buffer.Time=10




;-| Special Motions |------------------------------------------------------


[Command]
name = "Upkick_1"
command = ~F,DF,D,DF,a
Time=20
buffer.Time=10

[Command]
name = "Upkick_2"
command = ~F,DF,D,DF,b
Time=20
buffer.Time=10

[Command]
name = "DP"
command = ~F,DF,D,DF
Time=20
buffer.Time=10

[Command]
name = "RDP"
command = ~B,DB,D,DB
Time=20
buffer.Time=10

[Command]
name = "DP"
command = ~DF,D,DF
Time=20
buffer.Time=10

[Command]
name = "DP"
command = ~F,DF,F
Time=20
buffer.Time=10


[Command]
name = "RDP"
command = ~DB,D,DB
Time=20
buffer.Time=10

[Command]
name = "RDP"
command = ~B,DB,B
Time=20
buffer.Time=10



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
name = "QCF_a"
command = ~D, DF, F, a;~B, DB, D, DF, F, a
Time=13
buffer.Time=7


[Command]
name = "QCB_a"
command = ~D, DB, B, a
Time=20
buffer.Time=10


[Command]
name = "QCB_c"
command = ~D,DB, B, c;~D, DB, B, c
Time=20
buffer.Time=10


[Command]
name = "QCF_b"
command = ~D, DF, F, b
Time=20
buffer.Time=10

[Command]
name = "QCB_b"
command = ~D, DB, B, b
Time=20
buffer.Time=10




[Command]
name = "Frontkick"
command = c
time = 1



;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10
buffer.time=5

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10
buffer.time=5

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
name = "spot_dodge"
command = a+b
time = 5

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
;Smash Kung Fu Upper (uses one super bar)
;[State -1, Smash Kung Fu Upper]
;type = ChangeState
;value = 3050
;triggerall = command = "SmashKFUpper"
;triggerall = power >= 1000
;triggerall = statetype != A
;trigger1 = ctrl
;trigger2 = hitdefattr = SC, NA, SA, HA
;trigger2 = stateno != [3050,3100)
;trigger2 = movecontact
;trigger3 = stateno = 1310 || stateno = 1330 ;From blocking

;---------------------------------------------------------------------------
;Triple Kung Fu Palm (uses one super bar)
;[State -1, Triple Kung Fu Palm]
;type = ChangeState
;value = 3000
;triggerall = command = "TripleKFPalm"
;triggerall = power >= 1000
;trigger1 = statetype = S
;trigger1 = ctrl
;trigger2 = statetype != A
;trigger2 = hitdefattr = SC, NA, SA, HA
;trigger2 = stateno != [3000,3050)
;trigger2 = movecontact
;trigger3 = stateno = 1310 || stateno = 1330 ;From blocking

;Tackle Grab  EX
[State -1, Upkick_1]
type = ChangeState
value = 2400
triggerall = command = "QCBHCF_c"
triggerall = statetype != A
trigger1 = ctrl
trigger2 =var(1)
trigger3= stateno=1001 ||stateno=1020
trigger4= stateno=1003 && time>=10
trigger5= stateno=1000 && time>=4
;trigger3=stateno=6470 && var(1)

[State -1,WROHKO]
	Type=ChangeState
	value=6420
	TriggerAll=command="WROHKO"
	TriggerAll=StateType!=A
	triggerall = stateno != 6470
	TriggerAll=Power>6499
	triggerall= Life < 0.3*LifeMax
	triggerAll = stateno != 6302
	triggerall = fvar(6)>0
	Trigger1=Ctrl
	Trigger2=var(1)
	trigger3= stateno=1001 ||stateno=1020
	trigger4= stateno=1003 && time>=10
	trigger5= stateno=1000 && time>=4

[State -1,NT14Punch]
	Type=ChangeState
	value=3000
	TriggerAll = command = "NT14Punch"
	TriggerAll = StateType != A
	TriggerAll = Power>2999
	TriggerAll = stateno != 3000
	TriggerAll = stateno != 3001
	Trigger1 = Ctrl
	Trigger2 = var(1)
	trigger3= stateno=1001 ||stateno=1020
	trigger4= stateno=1003 && time>=10
	trigger5= stateno=1000 && time>=4

;Tackle Grab  EX
[State -1, Upkick_1]
type = ChangeState
value = 2400
triggerall = command = "QCBHCF_c"
triggerall = statetype != A
trigger1 = ctrl
trigger2 =var(1)
trigger3= stateno=1001 ||stateno=1020
trigger4= stateno=1003 && time>=10
trigger5= stateno=1000 && time>=4
;trigger3=stateno=6470 && var(1)


[State -1,BatonComboEX]
	Type=null;ChangeState
	value=2200
	TriggerAll = command = "BatonComboEX"
	TriggerAll = StateType != A
	TriggerAll = Power>999
	TriggerAll = stateno != 2200
	TriggerAll = stateno != 2201
	TriggerAll = stateno != 3000
	TriggerAll = stateno != 3001
	Trigger1 = Ctrl
	Trigger2 = var(1)

[State -1,ArataNaTenshiEX]
	Type=ChangeState
	value=6302
	TriggerAll=command="ArataEX"
	TriggerAll=StateType!=A
	triggerall = stateno != 6470
	TriggerAll=Power>999
	triggerAll = stateno != 6302
	Trigger1=Ctrl
	Trigger2=var(1)
	trigger3 = stateno=1001

[State -1,ArataNaTenshi]
	Type=ChangeState
	value=6300
	triggerall = stateno != 6470
	TriggerAll=command="y"
	TriggerAll=StateType!=A
	Trigger1=Ctrl
	Trigger2=var(1)
	trigger3 = stateno=1001
	trigger4= (StateNo=[1010,1014]) && var(1)


[State -1,WRAttackEX]
	Type=ChangeState
	value=6430
	TriggerAll=Alive!=0
	TriggerAll=command="WRAttackEX"
	triggerall = stateno != 2320
	TriggerAll=StateType!=A
	triggerall = stateno != 6470
	TriggerAll=Power>999
	triggerall = fvar(6)>0
	Trigger1=Ctrl
	Trigger2=var(1)
	trigger3= stateno=1001 ||stateno=1020
	trigger4= stateno=1003 && time>=10
	trigger5= stateno=1000 && time>=4

[State -1,WRShieldEX]
	Type=ChangeState
	value=6480
	TriggerAll=Alive!=0
	TriggerAll=command="WRShieldEX"
	TriggerAll=StateType!=A
	triggerall = stateno != 6470
	triggerall=stateno!=6480
	TriggerAll=Power>999
	triggerall = fvar(6)>0
	Trigger1=Ctrl
	Trigger2=var(1)
	trigger3= stateno=1001 ||stateno=1020
	trigger4= stateno=1003 && time>=10
	trigger5= stateno=1000 && time>=4

[State -1,WRAirAttackEX]
	Type=ChangeState
	value=6440
	TriggerAll=Alive!=0
	TriggerAll=command="WRAttackEX"
	TriggerAll=StateType=A
	triggerall = stateno != 6470
	TriggerAll=Power>999
	triggerall = fvar(6)>0
	Trigger1=Ctrl
	Trigger2=var(1)


[State -1,UpkickEX]
	Type=ChangeState
	value=2000
	TriggerAll=Alive!=0
	TriggerAll=command="Upkick_EX"
	triggerall = stateno != 2320
	TriggerAll=StateType!=A
	triggerall = stateno != 6470
	triggerall=stateno !=1003
	triggerall=stateno !=1005
	TriggerAll=Power>999
	Trigger1=Ctrl
	Trigger2=var(1)

[State -1,ComboEX]
	Type=ChangeState
	value=2300
	TriggerAll=Alive!=0
	triggerall = stateno != 6470
	TriggerAll=command="QCF_c"
	TriggerAll=StateType!=A
	
	TriggerAll=Power>1999
	Trigger1=Ctrl
	Trigger2=var(1)
	trigger3= stateno=1001||stateno=1020
	trigger4= stateno=1003 && time>=10
	trigger5= stateno=1000 && time>=4



[State -1,UltraKickEX]
	Type=ChangeState
	value=2100
	TriggerAll=Alive!=0
	triggerall = stateno != 6470
	triggerall = stateno != 2320
	TriggerAll=command="UltraKick_EX"
	TriggerAll=StateType!=A
	
	TriggerAll=Power>999
	Trigger1=Ctrl
	Trigger2=var(1)
	trigger3= stateno=1001||stateno=1020
	trigger4= stateno=1003 && time>=10
	trigger5= stateno=1000 && time>=4

[State -1,CounterEX]
	Type=null;ChangeState
	value=2300
	TriggerAll=Alive!=0
	triggerall = stateno != 6470
	TriggerAll=command="CounterEX"
	TriggerAll=StateType!=A
	
	TriggerAll=Power>999
	Trigger1=Ctrl
;===========================================================================
;This is not a move, but it sets up var(1) to be 1 if conditions are right
;for a combo into a special move (used below).
;Since a lot of special moves rely on the same conditions, this reduces
;redundant logic.
[State -1, Combo condition Reset]
type = VarSet
triggerall=stateno!=55
trigger1 = movetype=H;stateno = [5000,5210]
trigger2 = stateno = [0,160]
var(1) = 0
ignorehitpause=1

;Combo Grab
[State -1, Upkick_1]
type = ChangeState
value = 1300
triggerall = command = "QCBHCF_a"
triggerall = statetype != A
trigger1 = ctrl
trigger2 =(StateNo=[200,499])  && stateno != 211 &&var(1)
trigger3= stateno=1001 || stateno=1020
trigger4= stateno=1003 && time>=10
trigger5= stateno=1000 && time>=4
trigger6= stateno=1021 && var(1)
;trigger3=stateno=6470 && var(1)

;Tackle Grab 
[State -1, Upkick_1]
type = ChangeState
value = 1350
triggerall = command = "QCBHCF_b"
triggerall = statetype != A
trigger1 = ctrl
trigger2 =(StateNo=[200,499])  && stateno != 211 &&var(1)
trigger3= stateno=1001 || stateno=1020
trigger4= stateno=1003 && time>=10
trigger5= stateno=1000 && time>=4
trigger6= stateno=1021 && var(1)
;trigger3=stateno=6470 && var(1)

;--------

;Upkick 1 
[State -1, Upkick_1]
type = ChangeState
value = 1200
triggerall = command = "Upkick_1"
triggerall = statetype != A
trigger1 = ctrl
trigger2 =(StateNo=[200,499])  && stateno != 211 &&var(1)
trigger3=stateno=6470 && var(1)

;Upkick 2 
[State -1, Upkick_2]
type = ChangeState
value = 1205
triggerall = command = "Upkick_2"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 1020 && var(1);Use combo condition (above)
trigger3 =(StateNo=[200,499])  && stateno != 211 &&var(1)
trigger4=stateno=6470 && var(1)
trigger5=stateno=1013 && var(1)

;---------------------------------------------------------------------------
;Fast Kung Fu Knee (1/3 super bar)
;[State -1, Fast Kung Fu Knee]
;type = ChangeState
;value = 1070
;triggerall = command = "FF_ab"
;triggerall = power >= 330
;trigger1 = var(1) ;Use combo condition (above)

;---------------------------------------------------------------------------



[State -1, High Kick Followup]
type = null;ChangeState
value = 1051
triggerall = command = "c"
triggerall = command = "holdback"
triggerall = statetype != A
trigger1 = anim = 235 && var(1);Use combo condition (above)




;Lunge Baton 
[State -1, Lunge Baton]
type = null;ChangeState
value = 1150
;triggerall = command = "LungeBaton"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (StateNo=[200,299])  && stateno != 211 && stateno != 235 &&var(1)

;---------------------------------------------------------------------------
;Heavy Punch B
[State -1, Heavy Punch]
type = null;ChangeState
value = 1125
;triggerall = command = "HeavyPunch"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (StateNo=[200,299])  && stateno != 211 && stateno != 235 &&var(1)
;---------------------------------------------------------------------------
;Uppercut
[State -1, Uppercut]
type = null;ChangeState
value = 1020
triggerall = statetype != A
triggerall = stateno != [3000,3050)
;trigger1 = command = "Uppercut"
trigger1 = ctrl
trigger2 = command = "a"
trigger2 = command = "holdback"
trigger2 = anim = 235 && var(1);Use combo condition (above)
;trigger3 = command = "Uppercut"
trigger3 = anim = 210 && var(1);Use combo condition (above)
;trigger4 = command = "Uppercut"
trigger4 = (StateNo=[200,499]) && stateno != 211 && var(1)

;---------------------------------------------------------------------------
;Strong Gut Punch
[State -1, Strong Gut Punch Follow]
type = null;ChangeState
value = 1100
triggerall = command = "a"
triggerall = statetype != A
triggerall = stateno != [3000,3050)
trigger1 = anim = 235 && var(1);Use combo condition (above)

[State -1, Strong Gut Punch]
type = null;ChangeState
value = 1101
triggerall = statetype != A
;triggerall = command = "StrongGutPunch"
trigger1 = ctrl
trigger2 = (StateNo=[200,499])  && stateno != 240 && stateno != 211 && var(1)

;-------------------------------------------
;Lunge Punch
[State -1, Lunge Punch]
type = ChangeState
value = 1015
triggerall = statetype != A
triggerall = stateno != [3000,3050)
triggerall = command = "QCB_a"
trigger1 = ctrl
trigger2 = (StateNo=[200,499]) && var(1)
trigger3 = StateNo=1023 && var(1)
trigger4=stateno=1310 && var(1)

;Lunge Punch Into Stance
[State -1, Lunge Punch Into Stance]
type = ChangeState
value = 1016
triggerall = statetype != A
triggerall = stateno != [3000,3050)
triggerall = command = "QCB_b"
trigger1 = ctrl
trigger2 = (StateNo=[200,499]) && var(1)
trigger3 = StateNo=1023 && var(1)
trigger4=stateno=1310 && var(1) && var(13)<3




;-----------------------------------------

;Stance End
[State -1, Stance Enter]
type = ChangeState
value = 1002
triggerall = command = "holddown" && command="x"
triggerall = statetype != A
trigger1 = stateno=1001
trigger2= (StateNo=[1010,1014]) && var(1)

[State -1, Stance Spot Dodge]
type = ChangeState
value = 1009
TriggerAll = StateType != A
triggerall = (command = "spot_dodge") || (command = "x")
triggerall=(command!="holddown")
trigger1 = stateno=1001
trigger2= stateno=1000


;Stance Crouch BodyBlow
[State -1, Stance Enter]
type = ChangeState
value = 1021
triggerall = command = "a" || command = "b"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1= stateno=1020
trigger2= stateno=1003 && time>=10
trigger3= stateno=1000 && time>=4

;Stance Crouch Low
[State -1, Stance Enter]
type = ChangeState
value = 1022
triggerall = command = "a"
triggerall = statetype != A
trigger1= stateno=1021 && var(1)

;Stance Crouch Overhead
[State -1, Stance Enter]
type = ChangeState
value = 1023
triggerall = command = "b"
triggerall = statetype != A
trigger1= stateno=1021 && var(1)

;Stance Crouch AntiAir
[State -1, Stance Enter]
type = ChangeState
value = 1024
triggerall = command = "c"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1= stateno=1020
trigger2= stateno=1003 && time>=10
trigger3= stateno=1000 && time>=4




;Stance Jab
[State -1, Stance Enter]
type = ChangeState
value = 1010
triggerall = command = "a"
triggerall = statetype != A
trigger1= stateno=1001 
trigger2= stateno=1003 && time>=10
trigger3= stateno=1000 && time>=4

;Stance Straight
[State -1, Stance Enter]
type = ChangeState
value = 1011
triggerall = command = "a"
triggerall = statetype != A
trigger1= stateno=1010 && animelemtime(3)>=0 

;Stance Overhead
[State -1, Stance Enter]
type = ChangeState
value = 1012
triggerall = command = "b"
triggerall = statetype != A
trigger1= stateno=1001
trigger2= stateno=1013 && var(1) && prevstateno!=1012
trigger3= stateno=1003 && time>=10
trigger4 = stateno=1010 && animelemtime(3)>=0 
trigger5= stateno=1000 && time>=4
trigger6= stateno=1011 && var(1) && target,stateno=[8050,8051]

;Stance Upper
[State -1, Stance Enter]
type = ChangeState
value = 1013
triggerall = command = "c"
triggerall = statetype != A
trigger1= stateno=1001
trigger2= stateno=1012 && var(1) && prevstateno!=1013
trigger3= stateno=1003 && time>=10
trigger4 = stateno=1010 && animelemtime(3)>=0 
trigger5= stateno=1000 && time>=4
trigger6= stateno=1011 && var(1) && target,stateno=[8050,8051]
trigger7= stateno=1022 && var(1)
trigger8= stateno=1024 && var(1)

;Stance Jump Cancel
[State -1, Stance Enter]
type = ChangeState
value = 1030
triggerall = command = "holdup"
trigger1= stateno=1013 && var(1)
trigger1=prevstateno=1024

;Stance Jump Straight
[State -1, Stance Enter]
type = ChangeState
value = 1032
triggerall = command = "a"
triggerall = statetype = A
trigger1= stateno=1030

;Stance Jump Down Strike
[State -1, Stance Enter]
type = ChangeState
value = 1034
triggerall = command = "b"
triggerall = statetype = A
trigger1= stateno=1030

;Stance Jump Upper
[State -1, Stance Enter]
type = ChangeState
value = 1036
triggerall = command = "c"
triggerall = statetype = A
trigger1= stateno=1030


;Lunge Into Stance
[State -1, Lunge Into Stance]
type = ChangeState
value = 1003
triggerall = statetype != A
trigger1= stateno=1001 
triggerall=command="DP"
trigger2=stateno=[1010,1013] && var(4) && !movecontact
trigger3=stateno=1011 && var(1) && (var(9)<2)
trigger4= stateno=1000 && time>=4
trigger5=stateno=2320 && var(1) ;&& target,stateno=[8055,8056]
trigger6=stateno=1310 && var(1) && target,stateno=[8055,8056]
trigger7=stateno=6481

;Lunge Into Stance
[State -1, Lunge Into Stance]
type = ChangeState
value = 1003
triggerall = statetype != A
triggerall=command="holdfwd"
trigger1=stateno=[1010,1013] && var(4) && !movecontact
trigger2=stateno=1011 && var(1) && (var(9)<1)
trigger3=stateno=2320 && var(1) ;&& target,stateno=[8055,8056]
trigger4=stateno=1310 && var(1) && target,stateno=[8055,8056]
trigger5=stateno=6481

;Weaving Dodge Into Stance
[State -1, Weaving Dodge Into Stance]
type = ChangeState
value = 1005
triggerall = statetype != A
trigger1= stateno=1001 
triggerall=command="RDP"
trigger2=stateno=[1010,1013] && var(4) && !movecontact
trigger3= stateno=1000 && time>=4

;Stance Jump 
[State -1, Weaving Dodge Into Stance]
type = ChangeState
value = 1030
triggerall = statetype != A
trigger1= ctrl
triggerall=command="QCF_b"
trigger2= (StateNo=[200,499]) && var(1)



;Stance Enter
[State -1, Stance Enter]
type = ChangeState
value = 1000
triggerall = command = "QCF_a"
triggerall = statetype != A
trigger1= ctrl
trigger2= (StateNo=[200,499]) && var(1)

;---------------------------------------------------------------------------


;---------------------------------------------------------------------------



;---------------------------------------------------------------------------

;Taunt
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = command = "start"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno=1001

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

;===========================================================================
[State -1,JumpC];ジャンプキャンセル
	Type=ChangeState
	value=40
	TriggerAll = StateType != A
	TriggerAll = command = "holdup"
	Trigger1 = StateNo = 1020 || (target,StateType = A && stateno = 1050)
	Trigger1 = var(1)
	trigger2 = stateno = 53
	Trigger2 = (!var(1) && time >= 3) ||(var(1) && time >= 9)
	

;---------------------------------------------------------------------------
;Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
TriggerAll = StateType != A
trigger1 = command = "FF"
trigger1 = ctrl

;---------------------------------------------------------------------------
;Run Back
[State -1, Run Back]
type = ChangeState
value = 105
TriggerAll = StateType != A
trigger1 = command = "BB"
trigger1 = ctrl

[State -1, Spot Dodge]
type = ChangeState
value = 107
TriggerAll = StateType != A
triggerall = command = "spot_dodge"
triggerall=stateno!=100

trigger1 = ctrl
trigger2= stateno = 6480 && animelemtime(3)>=0
trigger3= stateno = 6481

[State -1, Spot Dodge]
type = ChangeState
value = 108
TriggerAll = StateType != A
triggerall = command = "spot_dodge"
trigger1=stateno=100



[State -1,AirDash];空中ダッシュ
	Type=ChangeState
	value=110
	TriggerAll = command = "FF"
	TriggerAll = StateType = A
	triggerall = ishelper = 0
	TriggerAll = pos Y <= -4 + (vel y > 0) * 5
	TriggerAll = anim != 110
	TriggerAll = var(17) < 2
	TriggerAll = stateno != [1700,1750]
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
	triggerall = stateno != 6470	
	trigger2 = stateno=1001


;Roman Cancel
[State -1];????????1
	type = ChangeState
	value = 6700
	triggerall = ifelse(fvar(6)=0,power>999,power>499)
	triggerall = stateno != 1500
	triggerall = stateno != 1550
	;triggerall = stateno != 2100
	triggerall = stateno != 2200
	triggerall = stateno != 2201
	triggerall = stateno != 2500
	triggerall = stateno != 2501
	triggerall = stateno != 3001
	;triggerall = stateno != 6470
	triggerall = command = "RC"
	;triggerall = movetype=A
	trigger1 = var(1)
	trigger2=movecontact && stateno = [1200,1205]
	
;---------------------------------------------------------------------------
;Throw kick
[State -1, Throw]
type = ChangeState
value = 800
triggerall = command = "x"
triggerall = statetype != A
triggerall = ctrl
trigger1 = command = "holdfwd"
trigger2 = command = "holdback"



;===========================================================================
;World Rejecter
[State -1,]
	
	Type=ChangeState
	value=6400
	TriggerAll = command = "x"
	triggerall = fvar(6)>0
	;TriggerAll = command = "hold_x"
	TriggerAll = StateType != A
	TriggerAll = command != "holddown"
	Trigger1 = Ctrl
	Trigger2 = stateno=6405 && var(1)

;Air World Rejecter
[State -1,]
	
	Type=ChangeState
	value=6410
	TriggerAll = command = "x"
	triggerall = fvar(6)>0
	;TriggerAll = command = "hold_x"
	TriggerAll = StateType = A
	;TriggerAll = command != "holddown"
	Trigger1 = Ctrl
;---------------------------------------------------------------------------

;Crouching Jab
[State -1, Crouching Jab]
type = ChangeState
value = 400
triggerall = command = "a"
triggerall = command = "holddown"
triggerall = statetype !=A
trigger1 = ctrl
trigger2 = stateno = 400 && var(1)

;---------------------------------------------------------------------------
;Crouching Crouching Weak Low Kick
[State -1, Crouching Weak Low Kick]
type = ChangeState
value = 410
triggerall = command = "b"
triggerall = command = "holddown"
triggerall = statetype !=A
trigger1 = ctrl
trigger2 = stateno = 400 && var(1)

;---------------------------------------------------------------------------
;Crouching Strong Kick
[State -1, Crouching Strong Kick]
type = ChangeState
value = 430
triggerall = command = "c"
triggerall = command = "holddown"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = StateNo = 400 && var(1)
Trigger3 = StateNo = 410 && var(1)

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

;---------------------------------------------------------------------------

;OLD Baton Grab
[State -1, Baton Grab]
type = null;ChangeState
value = 215
triggerall = command = "b" 
triggerall = command = "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype = S
Trigger1=enemynear,StateType=S||enemynear,StateType=C
Trigger1=enemynear,MoveType!=H
trigger1 = ctrl
;Trigger2 = StateNo = 200 && (var(1) || animelemtime(4)>=0)


;Body Blow CLOSE
[State -1, Baton Combo]
type = ChangeState
value = 219
triggerall = command = "b"
triggerall = command != "holddown"
triggerall = statetype !=A
triggerall = P2dist X <40
trigger1 = ctrl
Trigger2 = StateNo = 200 && (var(1) || animelemtime(4)>=0)
trigger3 = (StateNo = [400,410])&& var(1)


;Direct
[State -1, Baton Combo]
type = ChangeState
value = 218
triggerall = command = "b"
triggerall = command != "holddown"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = StateNo = 200 && (var(1) || animelemtime(4)>=0)
trigger3 = (StateNo = [400,410])&& var(1)


;OLD Baton Combo
[State -1, Baton Combo]
type = null;ChangeState
value = 210
triggerall = command = "b"
triggerall = command != "holddown"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = StateNo = 200 && (var(1) || animelemtime(4)>=0)
trigger3 = (StateNo = [400,410])&& var(1)


;High Kick
[State -1, High Kick]
type = ChangeState
value = 250
triggerall = command = "holdback"
triggerall = command = "c"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1) && stateno = 1020
trigger3 = (StateNo=[200,299])  && stateno != 240 && stateno != 250 && stateno != 235 &&var(1)
trigger4 = target,StateType = A && stateno = 250 && var(1)

;Frontkick
[State -1, Frontkick]
type = ChangeState
value = 240
triggerall = command = "Frontkick"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = StateNo = 211 && var(1)

;Trigger2 = StateNo = 235 && (var(1) || animelemtime(4)>=0)

;---------------------------------------------------------------------------

;Strong Elbow
[State -1, Heavy Punch]
type = ChangeState
value = 238
triggerall = command = "c"
triggerall = command != "holddown"
triggerall = P2dist X <40
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = (StateNo = [200,220]) && var(1)
Trigger3 = (StateNo = [400,410]) && var(1)


;Strong Hook
[State -1, Heavy Punch]
type = ChangeState
value = 237
triggerall = command = "c"
triggerall = command != "holddown"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = (StateNo = [200,220]) && var(1)
Trigger3 = (StateNo = [400,410]) && var(1)


;OLD Heavy Punch
[State -1, Heavy Punch]
type = null;ChangeState
value = 230
triggerall = command = "c"
triggerall = command != "holddown"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = (StateNo = [200,210]) && var(1)
Trigger3 = (StateNo = [400,410]) && var(1)



;---------------------------------------------------------------------------
;Taunt
;[State -1, Taunt]
;type = ChangeState
;value = 195
;triggerall = command = "start"
;trigger1 = statetype != A
;trigger1 = ctrl



;---------------------------------------------------------------------------
;Air jab
[State -1,Air Jab]
	Type=ChangeState
	value=600
	TriggerAll=command="a"
	Trigger1 = StateType = A
	Trigger1 = Ctrl
	Trigger2 = StateNo = 2000 && var(1)

;---------------------------------------------------------------------------
;Air Knee
[State -1, Air Knee]
type = ChangeState
value = 610
triggerall = command = "b"
trigger1 = statetype = A
trigger1 = ctrl
Trigger2 = StateNo = 600 && var(1)

;Air Strong Kick
[State -1,Air Strong Kick]
	Type=ChangeState
	value=620
	TriggerAll=command="c"
	triggerall = command = "holddown"
	Trigger1 = StateType = A
	Trigger1 = Ctrl
	Trigger2 = StateNo = 600 && var(1)
	Trigger3 = StateNo = 615 && var(1)


;Air Front Kick
[State -1, Air Front Kick]
type = ChangeState
value = 615
triggerall = command = "c"
trigger1 = statetype = A
trigger1 = ctrl
Trigger2 = StateNo = 610 && var(1)
Trigger3 = StateNo = 2000 && var(1)
Trigger4 = StateNo = 1205 && var(1)




;---------------------------------------------------------------------------
