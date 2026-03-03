[Statedef -2]


[State 0, Width]
type = Width
trigger1 = stateno!=[2000,3999]
trigger1=stateno!=[920,950]
edge = 15,0
;value = 0,0
ignorehitpause = 1
;persistent = 


[State 0, Helper]
type = Helper
;trigger1 =  roundstate = 0 
trigger1=numhelper(961)=0
trigger1=(p2name="Misaka Mikoto") 
trigger1=teamside=2
helpertype = normal ;player
name = "Aura FX"
ID = 961
stateno = 961
pos = 0,-60
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 99999
pausemovetime = 99999
ignorehitpause = 1


[State -2, DefenceMulSet]
Type = DefenceMulSet
Trigger1 = Life <= 300
Value = 0.7
IgnoreHitPause = 1

[State -2, DefenceMulSet]
Type = DefenceMulSet
Trigger1 = Life <= 150
Value = 0.5
IgnoreHitPause = 1

[State -2, PowerAdd]
type = PowerAdd
trigger1 = 1
value = 0

;Gives 1000 at the start of the battle
[State -2,初期ゲージ設定]
	Type= PowerSet
	trigger1 = roundsexisted = 0 && roundstate = 0 && roundno = 1;
	value = 1000 ; 0?6000で設定可能 1000単位で1本 デフォルトは1000

;DamageDampening Reset
[State -2]
	type = Varset
	trigger1 = enemy,movetype != H
	trigger2 = enemy,stateno = [120,155]
	fv = 0
	value = 1
	ignorehitpause = 1


[State -2];補正
	type = Varset
	trigger1 = enemy,movetype != H
	trigger2 = enemy,stateno = [120,155]
	fv = 10
	value = 1
	ignorehitpause = 1

;Cornerpush reset
[State -2];ヒットバック
	type = Varset
	trigger1 = enemy,movetype != H
	trigger2 = enemy,stateno = [120,155]
	fvar(11)=0
	ignorehitpause = 1
;Air dash count reset
[State -2];ループ
 	type = Varset
 	triggerAll = var(17)
	trigger1 = statetype != A
	trigger2 = movetype = H
 	var(17)=0
	ignorehitpause = 1

;Wall reset
[State -2]
type = VarSet
trigger1 = statetype != A
trigger1 = stateno != [930,940]
var(8) = 0
ignorehitpause=1

;Wall reset
[State -2]
type = VarSet
trigger1 = statetype != A
trigger1 = stateno != [930,940]
var(9) = 0
ignorehitpause=1


;---------------------------------------------------------------
;          hit数計測
;---------------------------------------------------------------
[State -2];ヒット数計測
type = null;Varadd
trigger1=movehit=1
v = 15
value = 1
ignorehitpause = 1
persistent= 0

[State -2];補正
type = null;Varset
trigger1 = var(15) < 4
v = 15
value = 0
ignorehitpause = 1

[State -2]
type = null;Varset
trigger1 = NumHelper(7500) > 0
trigger1 = helper(7500),movehit
fv = 1
value = fVar(1)*0.93
ignorehitpause = 1 

;---------------------------------------------------------------
;くらいボイス
;---------------------------------------------------------------
[State -1, VarRandom]
Type = VarRandom
TriggerAll = Time = 0
Trigger1 = StateNo = 5000
Trigger2 = StateNo = 5010
Trigger3 = StateNo = 5020
Trigger4 = StateNo = 5070
V = 11
Range = 3,8
IgnoreHitPause = 1

[State -2, 喰らい]
Type = PlaySnd
TriggerAll = Time = 1
TriggerAll = alive = 1
Trigger1 = StateNo = 5000
Trigger2 = StateNo = 5010
Trigger3 = StateNo = 5020
Trigger4 = StateNo = 5070
Value = s11,var(11)
volume = 255


;---------------------------------------------------------------
;          起き上がり
;---------------------------------------------------------------
[State -2,起き上がり]
type = PlaySnd
Trigger1 = StateNo = 5120
Trigger1 =time =1
Value = s11,1
Channel = 0
Volume=255

;---------------------------------------------------------------
;          その他
;---------------------------------------------------------------
[State -2, StopSnd]
type = StopSnd
trigger1 = command != "hold_x"
trigger2 = Power >= 5000
channel = 2

[State -2, StopSnd]
type = RemoveExplod
trigger1 = stateno!=700
trigger2 = Power >= Powermax
ID = 130
;---------------------------------------------------------------
;          根性値
;---------------------------------------------------------------
;BurstHelper
[State -2]
	type = Helper
	trigger1 = Numhelper(30002) = 0
	trigger1 = time = 1
	stateno = 30002
	ID = 30002
	pos = 0,0
	postype = left
	helpertype = normal
	name = "burstgauge"
	keyctrl = 0
	ownpal = 1
	pausemovetime = 9999
	supermovetime = 9999