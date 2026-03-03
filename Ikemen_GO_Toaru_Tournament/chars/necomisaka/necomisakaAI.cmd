;==============================================================================
; Win版専用パート
;==============================================================================
;------------------------------------------------------------------------------
;-| ボタンリマップ（ボタンコンフィグ）|---------------------------------------- 第１部

[Remap]
x = x      ;Ｘボタンの入力判定を実際に押すボタンに割り当てる。
y = y      ;Ｙボタン　　　　　　　　　〃
z = z      ;Ｚボタン　　　　　　　　　〃
a = a      ;Ａボタン　　　　　　　　　〃
b = b      ;Ｂボタン　　　　　　　　　〃
c = c      ;Ｃボタン　　　　　　　　　〃
s = s      ;スタートボタン　　　　　　〃

;-| デフォルト設定 |----------------------------------------------------------- 第２部

[Defaults]
command.time = 15  ;標準のコマンド入力受付時間。
                   ;各コマンドで省略している場合に有効。
                   ;このパラメータを消した場合、デフォルトは１フレームになる。
                   ;（　M.U.G.E.Nでの１フレーム　＝　１／６０秒　）

command.buffer.time = 1  ;標準のコマンド入力記憶時間。
                         ;入力した直後にコマンドを記憶し、
                         ;指を離してもコマンドが成功している状態を
                         ;ここで設定した時間の分維持する。
                         ;１～３０フレームまでの間で設定可能。
                         ;デフォルトは１フレーム。

;============================================================================== 第３部
; コマンド定義パート（入力キーを設定する）
;==============================================================================
;-| 超必殺技 |-----------------------------------------------------------------

;※名前が同じならば、違うコマンドでも同じステートの技を出す事が可能。

[Command]
name = "214214_c"
command = ~D, DB, B, D, DB, B, c
time = 24

[Command]
name = "2222_c"
command = ~D, D, D, D, c
time = 30

[Command]
name = "63214_c"
command = ~F, DF, D, DB, B, c
time = 18

[Command]
name = "41236_c"
command = ~B, DB, D, DF, F, c
time = 18

;------------------------------------------------------------------------------
;-| 必殺技 |-------------------------------------------------------------------

[Command]
name = "236_a"
command = ~D, DF, F, a
time = 14

[Command]
name = "236_b"
command = ~D, DF, F, b
time = 14

[Command]
name = "236_c"
command = ~D, DF, F, c
time = 14

[Command]
name = "421_a"
command = ~B, D, DB, a
time = 14

[Command]
name = "421_b"
command = ~B, D, DB, b
time = 14

[Command]
name = "421_c"
command = ~B, D, DB, c
time = 14

[Command]
name = "214_a"
command = ~D, DB, B, a
time = 14

[Command]
name = "214_b"
command = ~D, DB, B, b
time = 14

[Command]
name = "214_c"
command = ~D, DB, B, c
time = 14

[Command]
name = "214_z"
command = ~D, DB, B, z
time = 14

[Command]
name = "22_a"
command = ~D, D, a
time = 14

[Command]
name = "22_b"
command = ~D, D, b
time = 14

[Command]
name = "22_c"
command = ~D, D, c
time = 14

;------------------------------------------------------------------------------
;-| キー２回連続入力 |---------------------------------------------------------

[Command]
name = "FF"       ;必須コマンド名
command = F, F
time = 10

[Command]
name = "BB"       ;必須コマンド名
command = B, B
time = 10

[Command]
name = "HJF"       ;必須コマンド名
command = D, UF
time = 10

;------------------------------------------------------------------------------
;-| 同時押し |-----------------------------------------------------------------

[Command]
name = "recovery"
command = x+y
time = 1

[Command]
name = "a+z"
command = a+z
time = 1

[Command]
name = "a+b"
command = a+b
time = 1

[Command]
name = "b+c"
command = b+c
time = 1

[Command]
name = "a+c"
command = a+c
time = 1

;------------------------------------------------------------------------------
;-| 方向キー＋ボタン |---------------------------------------------------------

[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

;------------------------------------------------------------------------------
;-| ボタン単発 |---------------------------------------------------------------

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

;------------------------------------------------------------------------------
;-| 溜め |---------------------------------------------------------------
[Command]
name = "hold_a"
command = /a
time = 1

[Command]
name = "hold_b"
command = /b
time = 1

[Command]
name = "hold_c"
command = /c
time = 1

[Command]
name = "hold_z"
command = /z
time = 1

;------------------------------------------------------------------------------
;-| 方向キー |-----------------------------------------------------------------

[Command]
name = "holdfwd"   ;必須コマンド名
command = /$F
time = 1

[Command]
name = "holdback"  ;必須コマンド名
command = /$B
time = 1

[Command]
name = "holdup"    ;必須コマンド名
command = /$U
time = 1

[Command]
name = "holddown"  ;必須コマンド名
command = /$D
time = 1

;-| AI |--------------------------------------------------------
[Command]
Name = "AI_00"
Command = a, b, c, x, y, z
Time = 0

[Command]
Name = "AI_01"
Command = b, a, c, x, y, z
Time = 0

[Command]
Name = "AI_02"
Command = b, a, c, x, y, z
Time = 0

[Command]
Name = "AI_03"
Command = b, a, c, x, y, z
Time = 0

[Command]
Name = "AI_04"
Command = b, a, c, x, y, z
Time = 0

[Command]
Name = "AI_05"
Command = b, a, c, x, y, z
Time = 0

[Command]
Name = "AI_06"
Command = b, a, c, x, y, z
Time = 0

[Command]
Name = "AI_07"
Command = b, a, c, x, y, z
Time = 0

[Command]
Name = "AI_08"
Command = b, a, c, x, y, z
Time = 0

[Command]
Name = "AI_09"
Command = b, a, c, x, y, z
Time = 0

[Command]
Name = "AI_10"
Command = b, a, c, x, y, z
Time = 0

[Command]
Name = "AI_11"
Command = b, a, c, x, y, z
Time = 0

[Command]
Name = "AI_12"
Command = b, a, c, x, y, z
Time = 0

[Command]
Name = "AI_13"
Command = b, a, c, x, y, z
Time = 0

[Command]
Name = "AI_14"
Command = b, a, c, x, y, z
Time = 0

[Command]
Name = "AI_15"
Command = b, a, c, x, y, z
Time = 0

[Command]
Name = "AI_16"
Command = b, a, c, x, y, z
Time = 0

[Command]
Name = "AI_17"
Command = b, a, c, x, y, z
Time = 0

[Command]
Name = "AI_18"
Command = b, a, c, x, y, z
Time = 0

[Command]
Name = "AI_19"
Command = b, a, c, x, y, z
Time = 0

[Command]
Name = "AI_20"
Command = b, a, c, x, y, z
Time = 0

[Command]
Name = "AI_21"
Command = b, a, c, x, y, z
Time = 0

[Command]
Name = "AI_22"
Command = b, a, c, x, y, z
Time = 0

[Command]
Name = "AI_23"
Command = b, a, c, x, y, z
Time = 0

[Command]
Name = "AI_24"
Command = b, a, c, x, y, z
Time = 0

[Command]
Name = "AI_25"
Command = b, a, c, x, y, z
Time = 0

[Command]
Name = "AI_26"
Command = b, a, c, x, y, z
Time = 0

[Command]
Name = "AI_27"
Command = b, a, c, x, y, z
Time = 0

[Command]
Name = "AI_28"
Command = b, a, c, x, y, z
Time = 0

[Command]
Name = "AI_29"
Command = b, a, c, x, y, z
Time = 0

[Command]
Name = "AI_30"
Command = b, a, c, x, y, z
Time = 0

[Command]
Name = "AI_31"
Command = b, a, c, x, y, z
Time = 0

[Command]
Name = "AI_32"
Command = b, a, c, x, y, z
Time = 0

[Command]
Name = "AI_33"
Command = b, a, c, x, y, z
Time = 0

[Command]
Name = "AI_34"
Command = b, a, c, x, y, z
Time = 0

[Command]
Name = "AI_35"
Command = b, a, c, x, y, z
Time = 0

[Command]
Name = "AI_36"
Command = b, a, c, x, y, z
Time = 0

[Command]
Name = "AI_37"
Command = b, a, c, x, y, z
Time = 0

[Command]
Name = "AI_38"
Command = b, a, c, x, y, z
Time = 0

[Command]
Name = "AI_39"
Command = b, a, c, x, y, z
Time = 0

[Command]
Name = "AI_40"
Command = b, a, c, x, y, z
Time = 0

[Command]
Name = "AI_41"
Command = b, a, c, x, y, z
Time = 0

[Command]
Name = "AI_42"
Command = b, a, c, x, y, z
Time = 0

[Command]
Name = "AI_43"
Command = b, a, c, x, y, z
Time = 0

[Command]
Name = "AI_44"
Command = b, a, c, x, y, z
Time = 0

[Command]
Name = "AI_45"
Command = b, a, c, x, y, z
Time = 0

[Command]
Name = "AI_46"
Command = b, a, c, x, y, z
Time = 0

[Command]
Name = "AI_47"
Command = b, a, c, x, y, z
Time = 0

[Command]
Name = "AI_48"
Command = b, a, c, x, y, z
Time = 0

;============================================================================== 第４部
; ステートエントリーパート（技などを出せるようにするための条件を設定）
;==============================================================================
;------------------------------------------------------------------------------
; コマンド名と入力するコマンドを設定しただけじゃ意味が無いので、ここから
;「実際に入力したコマンドでどの番号のステートをどういう条件で出せるか」
; を決めなければならない。
;
; ステートコントローラ「ChangeState」しか使わないけど、
; そんなに難しくないのでトリガーを覚えてたらすぐ出来る。
;
; ここさえ押さえておけば簡単なトリガー設定の流れは覚えられるかと。
;
; エントリーの順番にはある程度の法則があるけど、
; おまけフォルダの「小ネタ.txt」を参照。（波動拳が暴発ﾅﾝﾀﾗｶﾝﾀﾗ）
;
; ChangeStateなどステートコントローラの基本的な設置例は
; おまけフォルダの「テンプレート.txt」を参照。
;------------------------------------------------------------------------------
; ■準常時監視ステート（－１）■
; コマンドファイル（のステートエントリーパート）に必要な項目です。
; 絶対に消してはいけないので要注意。
;
; 通常の食らい状態以外の「P2StateNo」や「TargetState」等で制御された、
; 作成者が任意に指定した相手側の食らいステートに限り、
; 登録したステートコントローラが有効にはなりません。
;------------------------------------------------------------------------------

[Statedef -1] ;←この行は絶対に消さないでね。必須項目です。

;==============================================================================
; 超必殺技
;==============================================================================

;------------------------------------------------------------------------------
[State -1, レールガン]
type = ChangeState
value = ifelse(var(21) = 3,3050,3000)
TriggerAll = Var(59) <= 0
triggerall = command = "41236_c"
triggerall = power >= 3000 || var(21)
triggerall = statetype != A
triggerall = movetype != H
triggerall = var(6) = 0
trigger1 = ctrl
trigger2 = Var(2) >1
trigger3 = stateno = [1100,1110]
trigger3 = animelemno(0) = [8,10]
trigger4 = stateno = 1000
trigger4 = animelemno(0) > 7
trigger5 = movehit
trigger5 = StateNo = 902 || StateNo = 903 || StateNo = 912 || StateNo = 913 || StateNo = 922  || StateNo = 923

[State -1, ウェーブ];ゲージレベル１
type = ChangeState
value = 2500
TriggerAll = Var(59) <= 0
triggerall = command = "2222_c"
triggerall = power >= 1500 || var(21)
triggerall = statetype != A
triggerall = MoveType != H
triggerall = numhelper(2510) = 0
trigger1 = ctrl
trigger2 = Var(2) >1
trigger3 = stateno = [1100,1110]
trigger3 = animelemno(0) = [8,10]
trigger4 = stateno = 1000
trigger4 = animelemno(0) > 7
trigger5 = movehit
trigger5 = StateNo = 902 || StateNo = 903 || StateNo = 912 || StateNo = 913 || StateNo = 922  || StateNo = 923

[State -1, イリュージョン];ゲージレベル１
type = ChangeState
value = 2501
TriggerAll = Var(59) <= 0
triggerall = command = "214214_c"
triggerall = power >= 1500 || var(21)
triggerall = statetype != A
triggerall = MoveType != H
trigger1 = ctrl
trigger2 = Var(2) >1
trigger3 = stateno = [1100,1110]
trigger3 = animelemno(0) = [8,10]
trigger4 = stateno = 1000
trigger4 = animelemno(0) > 7
trigger5 = movehit
trigger5 = StateNo = 902 || StateNo = 903 || StateNo = 912 || StateNo = 913 || StateNo = 922  || StateNo = 923

[State -1, ネットワーク];ゲージレベル１
type = ChangeState
value = 2502
TriggerAll = Var(59) <= 0
triggerall = command = "63214_c"
triggerall = power >= 1500 || var(21)
triggerall = statetype != A
triggerall = MoveType != H
triggerall = numhelper(2530) = 0
trigger1 = ctrl
trigger2 = Var(2) >1
trigger3 = stateno = [1100,1110]
trigger3 = animelemno(0) = [8,10]
trigger4 = stateno = 1000
trigger4 = animelemno(0) > 7
trigger5 = movehit
trigger5 = StateNo = 902 || StateNo = 903 || StateNo = 912 || StateNo = 913 || StateNo = 922  || StateNo = 923

;==============================================================================
; 必殺技
;==============================================================================
[State -1, 電磁跳躍F]
type = ChangeState
value = 2200+ifelse(statetype = A,5,0)
TriggerAll = Var(59) <= 0
triggerall = command = "421_c"
triggerall = power >= 1000 || var(21)
triggerall = movetype != H
triggerall = var(8) = 0
trigger1 = ctrl
trigger2 = Var(2) >1
trigger3 = stateno = [1100,1110]
trigger3 = animelemno(0) = [8,10]
trigger4 = stateno = 1000
trigger4 = animelemno(0) > 7
trigger5 = stateno = 1300
trigger5 = animelemno(-1) > 4
trigger6 = movehit
trigger6 = StateNo = 902 || StateNo = 912 || StateNo = 922
trigger7 = time > 12
trigger7 = StateNo = 903 || StateNo = 913 || StateNo = 923

[State -1, 電磁跳躍A]
type = ChangeState
value = 1201+ifelse(statetype = A,3,0)
TriggerAll = Var(59) <= 0
triggerall = command = "421_b" || command = "421_c"
triggerall = movetype != H
triggerall = var(8) = 0
trigger1 = ctrl
trigger2 = Var(2) >1
trigger3 = movehit
trigger3 = StateNo = 902 || StateNo = 912 || StateNo = 922
trigger4 = time > 12
trigger4 = StateNo = 903 || StateNo = 913 || StateNo = 923

[State -1, 電磁跳躍B]
type = ChangeState
value = 1200+ifelse(statetype = A,3,0)
TriggerAll = Var(59) <= 0
triggerall = command = "421_a"
triggerall = movetype != H
triggerall = var(8) = 0
trigger1 = ctrl
trigger2 = Var(2) >1
trigger3 = movehit
trigger3 = StateNo = 902 || StateNo = 912 || StateNo = 922
trigger4 = time > 12
trigger4 = StateNo = 903 || StateNo = 913 || StateNo = 923

;------------------------------------------------------------------------------
[State -1, 壁張り付き電撃]
type = ChangeState
value = 1220
ctrl = 1
TriggerAll = Var(59) <= 0
trigger1 = command = "214_a" || command = "214_b" || command = "214_c"
trigger1 = stateno = 1210
trigger1 = var(8) = 2

[State -1, 壁張り付き対岸跳躍]
type = ChangeState
value = 1212
TriggerAll = Var(59) <= 0
trigger1 = command = "236_a" || command = "236_b" || command = "236_c"
trigger1 = stateno = 1210
trigger1 = var(8) = 2

[State -1, 壁張り付き電磁跳躍A]
type = ChangeState
value = 1211
TriggerAll = Var(59) <= 0
trigger1 = command = "a" || command = "b" || command = "c"
trigger1 = stateno = 1210
trigger1 = var(8) = 2

;------------------------------------------------------------------------------
[State -1, 磁性操作雷]
type = ChangeState
value = 2320
TriggerAll = Var(59) <= 0
triggerall = command = "236_c"
triggerall = power >= 1000 || var(21)
triggerall = statetype = A
triggerall = movetype != H
triggerall = var(6) = 0
trigger1 = ctrl
trigger2 = Var(2) >1
trigger3 = stateno = 1300
trigger3 = animelemno(-1) > 4
trigger4 = movehit
trigger4 = StateNo = 902 || StateNo = 912 || StateNo = 922
trigger5 = time > 12
trigger5 = StateNo = 903 || StateNo = 913 || StateNo = 923

[State -1, 磁性操作雹]
type = ChangeState
value = 1310
TriggerAll = Var(59) <= 0
triggerall = command = "236_b" || command = "236_c"
triggerall = statetype = A
triggerall = movetype != H
trigger1 = ctrl
trigger2 = Var(2) >1
trigger3 = movehit
trigger3 = StateNo = 902 || StateNo = 912 || StateNo = 922
trigger4 = time > 12
trigger4 = StateNo = 903 || StateNo = 913 || StateNo = 923

[State -1, 磁性操作霰]
type = ChangeState
value = 1300
TriggerAll = Var(59) <= 0
triggerall = command = "236_a"
triggerall = statetype = A
triggerall = movetype != H
trigger1 = ctrl
trigger2 = Var(2) >1
trigger3 = movehit
trigger3 = StateNo = 902 || StateNo = 912 || StateNo = 922
trigger4 = time > 12
trigger4 = StateNo = 903 || StateNo = 913 || StateNo = 923

;------------------------------------------------------------------------------
[State -1, 雷撃波]
type = ChangeState
value = 2020
TriggerAll = Var(59) <= 0
triggerall = command = "236_c"
triggerall = power >= 1000 || var(21)
triggerall = statetype != A
triggerall = movetype != H
triggerall = var(6) = 0
trigger1 = ctrl
trigger2 = Var(2) >1
trigger2 = Var(12)%100%16 < 8
trigger3 = stateno = [1100,1110]
trigger3 = animelemno(0) = [8,10]
trigger4 = stateno = 1000
trigger4 = animelemno(0) > 7
trigger5 = movehit
trigger5 = StateNo = 902 || StateNo = 912 || StateNo = 922
trigger6 = time > 12
trigger6 = StateNo = 903 || StateNo = 913 || StateNo = 923

[State -1, 電撃波中]
type = ChangeState
value = 1010
TriggerAll = Var(59) <= 0
triggerall = command = "236_b" || command = "236_c"
triggerall = statetype != A
triggerall = movetype != H
trigger1 = ctrl
trigger2 = Var(2) >1
trigger3 = movehit
trigger3 = StateNo = 902 || StateNo = 912 || StateNo = 922
trigger4 = time > 12
trigger4 = StateNo = 903 || StateNo = 913 || StateNo = 923

[State -1, 電撃波弱]
type = ChangeState
value = 1000
TriggerAll = Var(59) <= 0
triggerall = command = "236_a"
triggerall = statetype != A
triggerall = movetype != H
trigger1 = ctrl
trigger2 = Var(2) >1
trigger3 = movehit
trigger3 = StateNo = 902 || StateNo = 912 || StateNo = 922
trigger4 = time > 12
trigger4 = StateNo = 903 || StateNo = 913 || StateNo = 923

;------------------------------------------------------------------------------
[State -1, 磁性操作引]
type = ChangeState
value = 2120
TriggerAll = Var(59) <= 0
triggerall = command = "214_c"
triggerall = power >= 1000 || var(21)
triggerall = statetype != A
triggerall = movetype != H
triggerall = numhelper(2121) = 0
trigger1 = ctrl
trigger2 = Var(2) >1
trigger2 = Var(12)%100%16 < 8
trigger3 = stateno = [1100,1110]
trigger3 = animelemno(0) = [8,10]
trigger4 = stateno = 1000
trigger4 = animelemno(0) > 7
trigger5 = movehit
trigger5 = StateNo = 902 || StateNo = 912 || StateNo = 922
trigger6 = time > 12
trigger6 = StateNo = 903 || StateNo = 913 || StateNo = 923

[State -1, ブラシ投げ中]
type = ChangeState
value = 1110
TriggerAll = Var(59) <= 0
triggerall = command = "214_b" || command = "214_c"
triggerall = statetype != A
triggerall = movetype != H
trigger1 = ctrl
trigger2 = Var(2) >1
trigger3 = movehit
trigger3 = StateNo = 902 || StateNo = 912 || StateNo = 922
trigger4 = time > 12
trigger4 = StateNo = 903 || StateNo = 913 || StateNo = 923

[State -1, ブラシ投げ弱]
type = ChangeState
value = 1100
TriggerAll = Var(59) <= 0
triggerall = command = "214_a"
triggerall = statetype != A
triggerall = movetype != H
trigger1 = ctrl
trigger2 = Var(2) >1
trigger3 = movehit
trigger3 = StateNo = 902 || StateNo = 912 || StateNo = 922
trigger4 = time > 12
trigger4 = StateNo = 903 || StateNo = 913 || StateNo = 923

;------------------------------------------------------------------------------
[State -1, 招雷]
type = ChangeState
value = 2420
TriggerAll = Var(59) <= 0
triggerall = command = "22_c"
triggerall = power >= 1000 || var(21)
triggerall = statetype != A
triggerall = movetype != H
triggerall = var(6) = 0
trigger1 = ctrl
trigger2 = Var(2) >1
trigger2 = Var(12)%100%16 < 8
trigger3 = stateno = [1100,1110]
trigger3 = animelemno(0) = [8,10]
trigger4 = stateno = 1000
trigger4 = animelemno(0) > 7
trigger5 = movehit
trigger5 = StateNo = 902 || StateNo = 912 || StateNo = 922
trigger6 = time > 12
trigger6 = StateNo = 903 || StateNo = 913 || StateNo = 923

[State -1, 這電]
type = ChangeState
value = 1410
TriggerAll = Var(59) <= 0
triggerall = command = "22_b" || command = "22_c"
triggerall = statetype != A
triggerall = movetype != H
trigger1 = ctrl
trigger2 = Var(2) >1
trigger3 = movehit
trigger3 = StateNo = 902 || StateNo = 912 || StateNo = 922
trigger4 = time > 12
trigger4 = StateNo = 903 || StateNo = 913 || StateNo = 923

[State -1, 跳電]
type = ChangeState
value = 1400
TriggerAll = Var(59) <= 0
triggerall = command = "22_a"
triggerall = statetype != A
triggerall = movetype != H
trigger1 = ctrl
trigger2 = Var(2) >1
trigger3 = movehit
trigger3 = StateNo = 902 || StateNo = 912 || StateNo = 922
trigger4 = time > 12
trigger4 = StateNo = 903 || StateNo = 913 || StateNo = 923

;==============================================================================
; 特殊技
;==============================================================================
;------------------------------------------------------------------------------

[State -1, 地上投げ]
type = ChangeState
value = 800
TriggerAll = Var(59) <= 0
triggerall = command = "y" || command = "a+z"
triggerall = command = "holdfwd" || command = "holdback"
triggerall = statetype = S
triggerall = MoveType != H
trigger1 = ctrl
trigger1 = stateno != 105
trigger2 = movecontact = 0
trigger2 = Var(2) = 201 || Var(2) = 401
trigger3 = Var(2) =[900,920]

[State -1, 空中投げ]
type = ChangeState
value = 810
TriggerAll = Var(59) <= 0
triggerall = command = "y" || command = "a+z"
triggerall = command = "holdfwd" || command = "holdback"
triggerall = statetype = A
triggerall = movetype != H
triggerall = p2statetype = A
triggerall = P2BodyDist X = [0,15]
triggerall = P2BodyDist Y = [-20,40]
trigger1 = ctrl
trigger2 = Var(2) >1

[State -1, 避け]
type = ChangeState
value = 850
TriggerAll = Var(59) <= 0
triggerall = command = "y" || command = "a+b"
triggerall = command = "holddown"
triggerall = statetype != A
triggerall = MoveType != H
trigger1 = ctrl
trigger2 = Var(2) =[900,920]
trigger3 = Var(2) >1
trigger3 = StateNo = 200 || StateNo = 400 || StateNo = 600

[State -1, 強制解放]
type = ChangeState
value = 700
TriggerAll = Var(59) <= 0
triggerall = command = "y" || command = "b+c" || command = "a+c"
triggerall = statetype != A
triggerall = MoveType != H
triggerall = power >= 1000 || Var(21) = 1
triggerall = Var(21) = [0,1]
trigger1 = ctrl
trigger2 = Var(2) =[900,920]

[State -1, サーキットスパーク]
type = ChangeState
value = 710
TriggerAll = Var(59) <= 0
triggerall = command = "y" || command = "b+c" || command = "a+c"
triggerall = statetype = S || statetype = C
triggerall = MoveType = H
triggerall = StateNo != 150 || StateNo != 152
triggerall = hitshakeover != 0
triggerall = var(6) = 0
trigger1 = power >= 2000
trigger2 = Var(21) = [1,3]

;------------------------------------------------------------------------------

[State -1, シールドバンカー]
type = ChangeState
value = 930
TriggerAll = Var(59) <= 0
triggerall = statetype != A
triggerall = command = "214_z"
trigger1 = ctrl
trigger2 = Var(2) >1
trigger3 = movehit
trigger3 = StateNo = 902 || StateNo = 912 || StateNo = 922
trigger4 = time > 12
trigger4 = StateNo = 903 || StateNo = 913 || StateNo = 923
trigger5 = power >= 500 || var(21) = [1,3]
trigger5 = StateNo = 151 || StateNo = 153

[State -1, シールド]
type = ChangeState
value = ifelse(statetype = A,920,ifelse(statetype = C,910,900))
TriggerAll = Var(59) <= 0
triggerall = MoveType != H
triggerall = command = "z"
trigger1 = ctrl
trigger2 = movehit
trigger2 = StateNo = 902 || StateNo = 912 || StateNo = 922
trigger3 = time > 12
trigger3 = StateNo = 903 || StateNo = 913 || StateNo = 923
trigger4 = Var(2) >1
trigger4 = StateNo = 200 || StateNo = 400 || StateNo = 600
trigger5 = Var(2) = [900,950]

;==============================================================================
; 移動関連
;==============================================================================
;------------------------------------------------------------------------------

[State -1, 走る]
type = ChangeState
value = 100
TriggerAll = Var(59) <= 0
triggerall = command = "FF" || command = "a+b" && command = "holdfwd"
triggerall = statetype = S
triggerall = MoveType != H
triggerall = stateno != 100
trigger1 = ctrl
trigger2 = Var(2) = [900,920]

[State -1, バックステップ]
type = ChangeState
value = 105
TriggerAll = Var(59) <= 0
triggerall = command = "BB" || command = "a+b" && command = "holdback"
triggerall = statetype = S
triggerall = MoveType != H
trigger1 = ctrl
trigger2 = Var(2) = [900,920]

[State -1, ハイジャンプ]
type = ChangeState
value = 41
TriggerAll = Var(59) <= 0
triggerall = statetype != A
triggerall = MoveType != H
triggerall = Command = "HJF"
triggerall = stateno != 105
triggerall = stateno != [120,155]
trigger1 = ctrl

[State -1, 空中ジャンプ]
type = ChangeState
value = 45
TriggerAll = Var(59) <= 0
triggerall = statetype = A
triggerall = MoveType != H
triggerall = Command = "holdup"
triggerall = Var(9)%4 > 1 && Var(9)%8 < 4
triggerall = stateno != 105
triggerall = stateno != [120,155]
triggerall = Pos Y < -30
trigger1 = ctrl
trigger1 = StateNo = 50 && Time >= 8
trigger2 = ctrl
trigger2 = StateNo = 120 || StateNo = 132 || StateNo = 140 || StateNo = 155 || StateNo = 1201
trigger3 = Var(2) >1 

[State -1, 空中ダッシュF]
type = ChangeState
value = 42
TriggerAll = Var(59) <= 0
triggerall = statetype = A
triggerall = MoveType != H
triggerall = Var(9)%4 > 1 && Var(9)%16 < 8
triggerall = command = "holdfwd" || command = "holdback"
triggerall = command = "a+b" || command = "FF" || command = "BB"
triggerall = stateno != 105
triggerall = stateno != [120,155]
trigger1 = ctrl
trigger1 = StateNo = 50 && Time >= 8
trigger2 = ctrl
trigger2 = StateNo = 120 || StateNo = 132 || StateNo = 140 || StateNo = 155 || StateNo = 1201
trigger3 = Var(2) >1 

[State -1, ジャンプ]
type = ChangeState
value = 40
TriggerAll = Var(59) <= 0
triggerall = statetype != A
triggerall = MoveType != H
triggerall = Command = "holdup"
triggerall = stateno != [120,155]
triggerall = stateno != 105
trigger1 = ctrl
trigger2 = Var(2) >1 
trigger2 = Var(9)%2 = 0 && movehit

;==============================================================================
; 通常攻撃技
;==============================================================================
;------------------------------------------------------------------------------
[State -1, 立ち弱]
type = ChangeState
value = 200
TriggerAll = Var(59) <= 0
triggerall = command = "a"
triggerall = command != "holddown"
triggerall = statetype != A
triggerall = movetype != H
trigger1 = ctrl
trigger2 = Var(2) >1
trigger2 = Var(10)%100%2 < 1
trigger3 = Var(2) >1
trigger3 = stateno = 200 || stateno = 400

[State -1, 立ち中]
type = ChangeState
value = 210
TriggerAll = Var(59) <= 0
triggerall = command = "b"
triggerall = command != "holddown"
triggerall = statetype != A
triggerall = movetype != H
trigger1 = ctrl
trigger2 = Var(2) >1
trigger2 = Var(11)%100%2 < 1

[State -1, 4強]
type = ChangeState
value = 230
TriggerAll = Var(59) <= 0
triggerall = command = "c"
triggerall = command = "holdback"
triggerall = command != "holddown"
triggerall = statetype != A
triggerall = movetype != H
trigger1 = ctrl
trigger2 = Var(2) >1
trigger2 = Var(12)%100%4 < 2

[State -1, 立ち強]
type = ChangeState
value = 220
TriggerAll = Var(59) <= 0
triggerall = command = "c"
triggerall = command != "holddown"
triggerall = statetype != A
triggerall = movetype != H
trigger1 = ctrl
trigger2 = Var(2) >1
trigger2 = Var(12)%2 < 1

;------------------------------------------------------------------------------

[State -1, 屈弱]
type = ChangeState
value = 400
TriggerAll = Var(59) <= 0
triggerall = command = "a"
triggerall = command = "holddown"
triggerall = statetype != A
triggerall = movetype != H
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = Var(2) >1
trigger2 = Var(10)%100%4 < 2
trigger3 = Var(2) >1
trigger3 = stateno = 200 || stateno = 400

[State -1, 3中]
type = ChangeState
value = 411
TriggerAll = Var(59) <= 0
triggerall = command = "b"
triggerall = command = "holddown"
triggerall = command = "holdfwd"
triggerall = statetype != A
triggerall = movetype != H
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = Var(2) >1
trigger2 = Var(11)%100%8 < 4

[State -1, 屈中]
type = ChangeState
value = 410
TriggerAll = Var(59) <= 0
triggerall = command = "b"
triggerall = command = "holddown"
triggerall = statetype != A
triggerall = movetype != H
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = Var(2) >1
trigger2 = Var(11)%100%4 < 2

[State -1, 屈強]
type = ChangeState
value = 420
TriggerAll = Var(59) <= 0
triggerall = command = "c"
triggerall = command = "holddown"
triggerall = statetype != A
triggerall = movetype != H
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = Var(2) >1
trigger2 = Var(12)%100%8 < 4

;------------------------------------------------------------------------------
[State -1, 空中弱]
type = ChangeState
value = 600
TriggerAll = Var(59) <= 0
triggerall = command = "a"
triggerall = statetype = A
triggerall = movetype != H
trigger1 = ctrl
trigger2 = Var(2) >1
trigger2 = Var(10)%100%8 < 4

[State -1, 空中2中]
type = ChangeState
value = 611
TriggerAll = Var(59) <= 0
triggerall = command = "b"
triggerall = command = "holddown"
triggerall = statetype = A
triggerall = movetype != H
trigger1 = ctrl
trigger2 = Var(2) >1

[State -1, 空中中]
type = ChangeState
value = 610
TriggerAll = Var(59) <= 0
triggerall = command = "b"
triggerall = statetype = A
triggerall = movetype != H
trigger1 = ctrl
trigger2 = Var(2) >1
trigger2 = Var(11)%100%16 < 8

[State -1, 空中2強]
type = ChangeState
value = 621
TriggerAll = Var(59) <= 0
triggerall = command = "c"
triggerall = command = "holddown"
triggerall = statetype = A
triggerall = movetype != H
trigger1 = ctrl
trigger2 = Var(2) >1

[State -1, 空中強]
type = ChangeState
value = 620
TriggerAll = Var(59) <= 0
triggerall = command = "c"
triggerall = statetype = A
triggerall = movetype != H
trigger1 = ctrl
trigger2 = Var(2) >1
trigger2 = Var(12)%100%16 < 8

;------------------------------------------------------------------------------

[State -1, 挑発]
type = ChangeState
value = 195
TriggerAll = Var(59) <= 0
triggerall = command = "start"
trigger1 = statetype != A
trigger1 = ctrl

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;以下、AI用追記場所
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[State -1, AI]
type = VarSet
TriggerAll = Var(59) <= 0
TriggerAll = RoundState = [1,2]
trigger1  = (Command = "AI_00") || (Command = "AI_01") || (Command = "AI_02") || (Command = "AI_03") 
trigger2  = (Command = "AI_04") || (Command = "AI_05") || (Command = "AI_06") || (Command = "AI_07")
trigger3  = (Command = "AI_08") || (Command = "AI_09") || (Command = "AI_10") || (Command = "AI_11") || (Command = "AI_12") || (Command = "AI_13") || (Command = "AI_14") || (Command = "AI_15")
trigger4  = (Command = "AI_16") || (Command = "AI_17") || (Command = "AI_18") || (Command = "AI_19") || (Command = "AI_20") || (Command = "AI_21") || (Command = "AI_22") || (Command = "AI_23")
trigger5  = (Command = "AI_24") || (Command = "AI_25") || (Command = "AI_26") || (Command = "AI_27") || (Command = "AI_28") || (Command = "AI_29") || (Command = "AI_30") || (Command = "AI_31")
trigger6 = (Command = "AI_32") || (Command = "AI_33") || (Command = "AI_34") || (Command = "AI_35") || (Command = "AI_36") || (Command = "AI_37") || (Command = "AI_38") || (Command = "AI_39")
trigger7 = (Command = "AI_40") || (Command = "AI_41") || (Command = "AI_42") || (Command = "AI_43") || (Command = "AI_44") || (Command = "AI_45") || (Command = "AI_46") || (Command = "AI_47")
trigger8 = (Command = "AI_48") 
;----------------------------------------------------------------
Trigger9 = 1 ;AI常時起動　切るときは先頭に;をつける 
;----------------------------------------------------------------
var(59) = 1;←の値を変更することでAIレベルを設定可能(現在はOFF:0 ON:1のみ)
;----------------------------------------------------------------

[State -1, AI]　
Type = VarSet
TriggerAll = Var(59) >= 1　　　　 ；AI発動中
Trigger1 = RoundState >= 3 　　；戦闘後にvarスイッチを切る。
V = 59
Value = 0

;----------------------------------------------------------------
[State -1,勝ち挑発スイッチ]
type = varset
Trigger1 = RoundState != 3
v = 57
value= 1 ;←の値を変更することで勝ち挑発の制御が可能
         ;0:off
         ;1:on(Default)

;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;以下、いじらない
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[State -1, タッグ用生死判別];
Type = VarSet
triggerall = var(59)
trigger1 = RoundState = 2
var(52) = 0 + (NumEnemy = 2 && EnemyNear(var(52)),life <= 0)
IgnoreHitPause = 1

;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;挑発
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

;勝ち挑発
[State -1,勝ち挑発]
type = ChangeState
value = 195
TriggerAll = var(59) > 0
TriggerAll = var(57) = 1
TriggerAll = Alive
TriggerAll = RoundState = 3
TriggerAll = Win && (!WinTime)
triggerall = statetype != A
triggerAll = ctrl
Trigger1 = random < 500


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;切り返しや割り込み、リバーサルなど
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;バックステップ・投げと攻撃回避
[State -1]
type = ChangeState
value = 105
TriggerAll = var(59) > 0
TriggerAll = RoundState = 2
TriggerAll = EnemyNear(var(52)),StateType != L
TriggerAll = StateNo != [100,106]
triggerAll = (statetype = S) && (ctrl = 1)
TriggerAll = BackEdgeBodyDist > 50
TriggerAll = Random < 250
Trigger1 = InGuardDist && P2BodyDist X = [45,65]
Trigger1 = EnemyNear(var(52)),Time > 8
Trigger2 = EnemyNear(var(52)),HitDefAttr = SCA,NT,ST,HT ;投げ属性

;---------------------------------------------------------------------------
;割り込み招雷
[State -1, 割り込み招雷]
type = ChangeState
value = 2420
TriggerAll = var(59) > 0
triggerall = statetype != A
triggerall = ctrl
triggerall = stateno != 100
TriggerAll = RoundState = 2
triggerall = power >= 1000 || var(21)
triggerall = var(6) = 0
TriggerAll = P2BodyDist X = [-20,40]
TriggerAll = EnemyNear(var(52)),StateType = S || EnemyNear(var(52)),StateType = C
TriggerAll = Random < 150+var(21)*150
Trigger1 = (PrevStateNo=[120,159])

;割り込み投げ
[State -1, 割り込み投げ]
type = ChangeState
value = 800
TriggerAll = var(59) > 0
triggerall = statetype != A
triggerall = ctrl
triggerall = stateno != 100
TriggerAll = RoundState = 2
TriggerAll = P2BodyDist X = [0,12]
TriggerAll = EnemyNear(var(52)),StateType = S || EnemyNear(var(52)),StateType = C
TriggerAll = Random < 350
Trigger1 = (PrevStateNo=[120,159])

;リバサ電磁跳躍突撃
[State -2, 電磁跳躍突撃]
type = VarSet
TriggerAll = var(59) > 0
TriggerAll = P2BodyDist X = [0,30]
TriggerAll = P2BodyDist Y > -30
TriggerAll = EnemyNear(var(52)),MoveType = A
triggerall = power >= 1000 || var(21)
triggerall = stateno = 5120 && var(19) = 0
trigger1 = animtime > -5
;Trigger1 = Random < (100+var(21)*50)*(animtime+5)
var(19) = 2200

;リバサ投げ
[State -1, リバサ投げ]
type = VarSet
TriggerAll = var(59) > 0
TriggerAll = P2BodyDist X = [0,12]
TriggerAll = EnemyNear(var(52)),StateType = S || EnemyNear(var(52)),StateType = C
triggerall = stateno = 5120 && var(19) = 0
trigger1 = animtime > -5
Trigger1 = Random < 50*(animtime+5)
var(19) = 800

;リバサ跳電
[State -2, 跳電]
type = VarSet
TriggerAll = var(59) > 0
TriggerAll = P2BodyDist X = [0,50]
TriggerAll = P2BodyDist Y > -50
triggerall = stateno = 5120 && var(19) = 0
trigger1 = animtime > -5
Trigger1 = Random < 50*(animtime+5)
var(19) = 1400

;---------------------------------------------------------------------------
;受け身
[State -1, Recover near ground]
type = ChangeState
value = 5200
TriggerAll = var(59) > 0
triggerall = statetype = A
triggerall = movetype = H
triggerall = Vel Y > 0
triggerall = Pos Y >= -20
triggerall = alive
trigger1 = CanRecover
Trigger1 = stateno != [120,155]

[State -1, Recover in mid air]
type = ChangeState
value = 5210
TriggerAll = var(59) > 0
triggerall = statetype = A
triggerall = movetype = H
triggerall = Vel Y > -1
triggerall = alive
trigger1 = CanRecover
Trigger1 = stateno != [120,155]

;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;状況判断変数
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;====================================================================================
;行動制御変数 リセット
;====================================================================================
[State -1,reset1]
type = varset
triggerall = var(55)
;途中で攻撃食らったら中断
trigger1 = statetype = L || movetype = H
Trigger2 = !Alive
Trigger3 = var(55) = 1
Trigger3 = stateno != 21
Trigger4 = var(55) = 5 || var(55) = 101
Trigger4 = stateno != [100,101]
var(55) = 999

[State -1,reset]
type = varset
trigger1 = var(55) = 999
var(55) = 0


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;コンボ記述
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;====================================================================================
;行動制御変数 リセット
;====================================================================================
[State -1,reset1]
type = varset
triggerall = var(58)
trigger1 = p2movetype != H || p2statetype = L
;trigger1 = (var(58) != [2,4]) || (var(58) != [41,44])
;途中で攻撃食らったら中断
trigger2 = statetype = L || movetype = H
;コンボ空かして、相手が動いてるようなら中段
trigger3 = P2stateno=[10,110] 
Trigger4 = !Alive
var(58) = 999

[State -1,reset]
type = varset
trigger1 = var(58) = 999
var(58) = 0

;====================================================================================
;行動制御変数 メモ
;====================================================================================
;var(58) = 900 ;= 地上ジャンプ
;var(58) = 901 ;= 地上ジャンプ前
;var(58) = 902 ;= 地上ジャンプ後
;var(58) = 910 ;= 空中ジャンプ
;var(58) = 911 ;= 空中ジャンプ前
;var(58) = 912 ;= 空中ジャンプ後
;var(58) = 920 ;= 空中ダッシュ前
;var(58) = 921 ;= 空中ダッシュ後

;====================================================================================
;基本コンボ　1-
;====================================================================================

;====================================================================================
;屈A、立Aヒット時　相手、地上
;====================================================================================
;---------------------------------------------------------------------------
;コンボ移行用記述
;---------------------------------------------------------------------------
;牽制弱ヒット時
[State -1,コンボ移行用]
type = varset
TriggerAll = var(59) != 0
triggerAll = var(58) = 0
triggerall = P2statetype != A && var(15) = 0
trigger1 = movehit
trigger1 = stateno = 200
trigger2 = movehit
trigger2 = stateno = 400
var(58) = 1

;牽制弱空中ヒット時
[State -1,コンボ移行用]
type = varset
TriggerAll = var(59) != 0
triggerAll = var(58) = 0
triggerall = P2statetype = A && var(15) = 0
trigger1 = movehit
trigger1 = stateno = 200
trigger2 = movehit
trigger2 = stateno = 400
var(58) = 5

;BE立ち強ヒット時
[State -1,コンボ移行用]
type = varset
TriggerAll = var(59) != 0
triggerAll = var(58) = 0
triggerall = P2statetype != A && var(15) = 0
trigger1 = movehit
trigger1 = stateno = 222
var(58) = 151

;屈中ヒット時
[State -1,コンボ移行用]
type = varset
TriggerAll = var(59) != 0
triggerAll = var(58) = 0 || var(58) = 102
triggerall = P2statetype != A && var(15) = 0
trigger1 = P2BodyDist X < 30
trigger1 = movehit
trigger1 = stateno = 410
var(58) = 2

;屈中空中ヒット時
[State -1,コンボ移行用]
type = null
TriggerAll = var(59) != 0
triggerAll = var(58) = 0 || var(58) = 102
triggerall = P2statetype = A && var(15) = 0
triggerall = movehit
triggerall = stateno = 410
trigger1 = P2BodyDist X < 30
trigger1 = var(58) := 5
trigger2 = var(58) := 101

;3中ヒット時
[State -1,コンボ移行用]
type = null
TriggerAll = var(59) != 0
triggerAll = var(58) = 0 || var(58) = 21
triggerall = var(15) = 0
triggerAll = movehit
triggerAll = stateno = 411
trigger1 = var(58) = 0
trigger1 = var(58) := 21
;距離が近い時エリアルへ
trigger2 = animelemno(0) = 11
trigger2 = P2BodyDist X < 35
trigger2 = var(58) := 22
;距離が遠い時撃ち落としへ
trigger3 = animelemno(0) >= 9
trigger3 = P2BodyDist X >= 35
trigger3 = var(58) := 101

;BE屈強ヒット時
[State -1,コンボ移行用]
type = null
TriggerAll = var(59) != 0
triggerAll = var(58) = 0 || var(58) = 21
triggerall = var(15) = 0
triggerall = movehit
triggerall = stateno = 422
trigger1 = var(58) = 0
trigger1 = var(58) := 21
;距離が近い時エリアルへ
trigger2 = P2BodyDist X < 25
trigger2 = var(58) := 5
;距離が遠い時電撃波
trigger3 = animelemno(0) >= 17
trigger3 = var(58) := 141

;飛び込みヒット時
[State -1,コンボ移行用]
type = null
TriggerAll = var(59) != 0
triggerAll = var(58) = 0
triggerall = var(15) = 0
triggerAll = stateno = 52
triggerAll = ctrl
triggerall = EnemyNear(Var(52)),MoveType = H
triggerall = EnemyNear(Var(52)),StateType = S || EnemyNear(Var(52)),StateType = C
;屈弱
trigger1 = EnemyNear(Var(52)),GetHitVar(hittime)>5
trigger1 = P2BodyDist X < 15-facing*EnemyNear(Var(52)),facing*EnemyNear(Var(52)),Vel X*3.2
trigger1 = var(58) := 121
;立中
trigger2 = EnemyNear(Var(52)),GetHitVar(hittime)>7
trigger2 = P2BodyDist X < 20-facing*EnemyNear(Var(52)),facing*EnemyNear(Var(52)),Vel X*4.2
trigger2 = var(58) := 2
;屈中
trigger3 = EnemyNear(Var(52)),GetHitVar(hittime)>8
trigger3 = P2BodyDist X < 35-facing*EnemyNear(Var(52)),facing*EnemyNear(Var(52)),Vel X*4.5
trigger3 = var(58) := 1

;空弱空中ヒット時
[State -1,コンボ移行用]
type = null
TriggerAll = var(59) != 0
triggerAll = var(58) = 0
triggerall = var(15) = 0
triggerAll = stateno = [600,601]
triggerall = movehit
trigger1 = Var(9)%4 > 1 && Var(9)%8 < 4
trigger1 = p2bodydist X - vel X*5 + facing*EnemyNear(Var(52)),facing*EnemyNear(Var(52)),vel X*5 < 20
trigger1 = p2dist Y - vel Y*5-const(movement.yaccel)*10 + EnemyNear(Var(52)),vel Y*5+EnemyNear(Var(52)),const(movement.yaccel)*10 > -20
trigger1 = p2dist Y - vel Y*5-const(movement.yaccel)*10 + EnemyNear(Var(52)),vel Y*5+EnemyNear(Var(52)),const(movement.yaccel)*10 < -EnemyNear(Var(52)),const(size.head.pos.y)
trigger1 = var(58) := 51
trigger2 = Var(9)%4 > 1 && Var(9)%8 < 4
trigger2 = p2bodydist X-vel X*8 + facing*EnemyNear(Var(52)),facing*EnemyNear(Var(52)),vel X*8 < 30
trigger2 = p2dist Y - vel Y*8-const(movement.yaccel)*28 + EnemyNear(Var(52)),vel Y*8+EnemyNear(Var(52)),const(movement.yaccel)*28 > -35
trigger2 = p2dist Y - vel Y*8-const(movement.yaccel)*28 + EnemyNear(Var(52)),vel Y*8+EnemyNear(Var(52)),const(movement.yaccel)*28 < -10-EnemyNear(Var(52)),const(size.head.pos.y)
trigger2 = var(58) := 52
trigger3 = Var(9)%4 > 1 && Var(9)%8 < 4
trigger3 = var(58) := 902
trigger4 = p2bodydist X - vel X*5 + facing*EnemyNear(Var(52)),facing*EnemyNear(Var(52)),vel X*5 < 20
trigger4 = p2dist Y - vel Y*5-const(movement.yaccel)*10 + EnemyNear(Var(52)),vel Y*5+EnemyNear(Var(52)),const(movement.yaccel)*10 > -20
trigger4 = p2dist Y - vel Y*5-const(movement.yaccel)*10 + EnemyNear(Var(52)),vel Y*5+EnemyNear(Var(52)),const(movement.yaccel)*10 < -EnemyNear(Var(52)),const(size.head.pos.y)
trigger4 = var(58) := 53
trigger5 = p2bodydist X-vel X*8 + facing*EnemyNear(Var(52)),facing*EnemyNear(Var(52)),vel X*8 < 30
trigger5 = p2dist Y - vel Y*8-const(movement.yaccel)*28 + EnemyNear(Var(52)),vel Y*8+EnemyNear(Var(52)),const(movement.yaccel)*28 > -35
trigger5 = p2dist Y - vel Y*8-const(movement.yaccel)*28 + EnemyNear(Var(52)),vel Y*8+EnemyNear(Var(52)),const(movement.yaccel)*28 < -10-EnemyNear(Var(52)),const(size.head.pos.y)
trigger5 = var(58) := 54
trigger6 = var(58) := 55

;空中空中ヒット時
[State -1,コンボ移行用]
type = null
TriggerAll = var(59) != 0
triggerAll = var(58) = 0
triggerall = var(15) = 0
triggerAll = stateno = 610
triggerall = movehit
trigger1 = Var(9)%4 > 1 && Var(9)%8 < 4
trigger1 = p2bodydist X-vel X*8 + facing*EnemyNear(Var(52)),facing*EnemyNear(Var(52)),vel X*8 < 30
trigger1 = p2dist Y - vel Y*8-const(movement.yaccel)*28 + EnemyNear(Var(52)),vel Y*8+EnemyNear(Var(52)),const(movement.yaccel)*28 > -35
trigger1 = p2dist Y - vel Y*8-const(movement.yaccel)*28 + EnemyNear(Var(52)),vel Y*8+EnemyNear(Var(52)),const(movement.yaccel)*28 < -10-EnemyNear(Var(52)),const(size.head.pos.y)
trigger1 = var(58) := 52
trigger2 = Var(9)%4 > 1 && Var(9)%8 < 4
trigger2 = var(58) := 902
trigger3 = p2bodydist X-vel X*8 + facing*EnemyNear(Var(52)),facing*EnemyNear(Var(52)),vel X*8 < 30
trigger3 = p2dist Y - vel Y*8-const(movement.yaccel)*28 + EnemyNear(Var(52)),vel Y*8+EnemyNear(Var(52)),const(movement.yaccel)*28 > -35
trigger3 = p2dist Y - vel Y*8-const(movement.yaccel)*28 + EnemyNear(Var(52)),vel Y*8+EnemyNear(Var(52)),const(movement.yaccel)*28 < -10-EnemyNear(Var(52)),const(size.head.pos.y)
trigger3 = var(58) := 54
trigger4 = var(58) := 55

;空強空中ヒット時
[State -1,コンボ移行用]
type = null
TriggerAll = var(59) != 0
triggerAll = var(58) = 0
triggerall = var(15) = 0
triggerAll = stateno = 620
triggerall = movehit
trigger1 = Var(9)%4 > 1 && Var(9)%8 < 4
trigger1 = var(58) := 902
trigger2 = p2bodydist X-vel X*8 + facing*EnemyNear(Var(52)),facing*EnemyNear(Var(52)),vel X*8 < 30
trigger2 = p2dist Y - vel Y*8-const(movement.yaccel)*28 + EnemyNear(Var(52)),vel Y*8+EnemyNear(Var(52)),const(movement.yaccel)*28 > -35
trigger2 = p2dist Y - vel Y*8-const(movement.yaccel)*28 + EnemyNear(Var(52)),vel Y*8+EnemyNear(Var(52)),const(movement.yaccel)*28 < -10-EnemyNear(Var(52)),const(size.head.pos.y)
trigger2 = var(58) := 54
trigger3 = var(58) := 55

;シールドバンカーヒット時
[State -1,コンボ移行用]
type = null
TriggerAll = var(59) != 0
triggerAll = var(58) = 0
triggerall = var(15) = 0
triggerAll = movehit
triggerAll = stateno = 932
triggerAll = AnimTime = -1
trigger1 = var(58) := 141

;磁性操作引ヒット時
[State -1,コンボ移行用]
type = varset
TriggerAll = var(59) != 0
triggerAll = var(58) = 0
triggerall = P2statetype != A && var(15) = 0
trigger1 = var(2) = 2120
trigger1 = stateno = 2120
var(58) = 31

;ブラシ弱地上ヒット時
[State -1,コンボ移行用]
type = null
TriggerAll = var(59) != 0
triggerAll = var(58) = 0
triggerAll = stateno = 1100
triggerAll = numhelper(1104)
triggerAll = helper(1104),movehit
triggerAll = P2StateType != A && var(15) = 0
triggerAll = P2MoveType = H
;MAX,HEAT,BLOODHEAT時
trigger1 = var(21)
trigger1 = FrontEdgeDist < 20
trigger1 = var(58) := 111
;MAX,HEAT,BLOODHEAT時
trigger2 = var(21)
trigger2 = FrontEdgeDist-P2Dist X*2+10+P2BodyDist X < 40
trigger2 = var(58) := 41
;ゲージがある時
trigger3 = power >= 1000
trigger3 = FrontEdgeDist < 20
trigger3 = var(58) := 111
;ゲージがある時
trigger4 = power >= 1000
trigger4 = random < 100
trigger4 = FrontEdgeDist-P2Dist X*2+10+P2BodyDist X < 40
trigger4 = var(58) := 41

;ブラシ中地上ヒット時
[State -1,コンボ移行用]
type = null
TriggerAll = var(59) != 0
triggerAll = var(58) = 0
triggerAll = stateno = 1110
triggerAll = numhelper(1114)
triggerAll = helper(1114),movehit
triggerAll = P2StateType != A && var(15) = 0
triggerAll = P2MoveType = H
;MAX,HEAT,BLOODHEAT時
trigger1 = var(21)
trigger1 = FrontEdgeDist < 20
trigger1 = var(58) := 111
;MAX,HEAT,BLOODHEAT時
trigger2 = var(21)
trigger2 = FrontEdgeDist-P2Dist X*2+10+P2BodyDist X < 40
trigger2 = var(58) := 41
;ゲージがある時
trigger3 = power >= 1000
trigger3 = FrontEdgeDist < 20
trigger3 = var(58) := 111
;ゲージがある時
trigger4 = power >= 1000
trigger4 = random < 100
trigger4 = FrontEdgeDist-P2Dist X*2+10+P2BodyDist X < 40
trigger4 = var(58) := 41

;ブラシ中ヒット時
[State -1,コンボ移行用]
type = null
TriggerAll = var(59) != 0
triggerAll = var(58) = 0
triggerAll = stateno = 1110
triggerAll = numhelper(1114)
triggerAll = helper(1114),movehit
triggerAll = P2StateType = A && var(15) = 0
triggerAll = P2MoveType = H
;MAX,HEAT,BLOODHEAT時
trigger1 = var(21)
trigger1 = P2BodyDist X < 40
trigger1 = P2BodyDist Y < -40
trigger1 = var(58) := 111
;ゲージがある時
trigger2 = power >= 1000
trigger2 = random < 100
trigger2 = P2BodyDist X < 40
trigger2 = P2BodyDist Y < -40
trigger2 = var(58) := 111
;撃ち落とし中へ
trigger3 = P2BodyDist X < 80
trigger3 = P2BodyDist Y < -100
trigger3 = var(58) := 101
;撃ち落とし弱へ
trigger4 = P2BodyDist X+P2BodyDist Y*2 < 30
trigger4 = var(58) := 103

;磁性操作雹ヒット時
[State -1,コンボ移行用]
type = null
TriggerAll = var(59) != 0
triggerAll = var(58) = 0
triggerAll = numhelper(1301)
triggerAll = helper(1301),movehit
triggerall = helper(1301),time<6
triggerAll = P2StateType != A && var(15) = 0
triggerAll = P2MoveType = H
;MAX,HEAT,BLOODHEAT時
trigger1 = var(21)
trigger1 = FrontEdgeDist-P2Dist X*2+10+P2BodyDist X < 40
trigger1 = var(58) := 41
;ゲージがある時
trigger2 = power >= 1000
trigger2 = random < 100
trigger2 = FrontEdgeDist-P2Dist X*2+10+P2BodyDist X < 40
trigger2 = var(58) := 41
;接近
trigger3 = P2BodyDist X < numhelper(1301)*30
trigger3 = var(58) := 42

;地上電磁跳躍突撃ヒット時
[State -1,コンボ移行用]
type = null
TriggerAll = var(59) != 0
triggerAll = var(58) = 0
triggerAll = stateno = 1206
triggerAll = numtarget(2200) >= 1
trigger1 = var(58) := 112

;招雷空中カウンターヒット時
[State -1,コンボ移行用]
type = null
TriggerAll = var(59) != 0
triggerAll = var(58) = 0
triggerAll = stateno = 2420
triggerAll = movehit
triggerAll = EnemyNear(Var(52)),gethitvar(fall.recover) = 0
trigger1 = var(58) := 131

;地上Exシールド成立時
[State -1, 屈弱]
type = ChangeState
value = 400
TriggerAll = var(59) != 0
triggerAll = var(58) = 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerall = statetype != A
triggerall = movetype != H
triggerAll = P2StateType != A && var(15) = 0
triggerAll = stateno = 900 || stateno = 901 || stateno = 910 || stateno = 911
trigger1 = var(21) != 3
trigger1 = Var(2) >1
trigger1 = P2BodyDist X < 12
trigger1 = var(58) := 1
trigger2 = var(21) != 3
trigger2 = Var(2) >1
trigger2 = P2BodyDist X < 40
trigger2 = EnemyNear(Var(52)),Animtime < -11
trigger2 = var(58) := 42

;空中Exシールド成立時
[State -1, 空弱]
type = ChangeState
value = 600
TriggerAll = var(59) != 0
triggerAll = var(58) = 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerall = movetype != H
triggerAll = stateno = 920 || stateno = 921
triggerall = Var(2) >1
triggerall = p2bodydist X - vel X*3 < 10
triggerall = p2dist Y - vel Y*3-const(movement.yaccel)*3 > -50
triggerall = p2dist Y - vel Y*3-const(movement.yaccel)*3 < -30-EnemyNear(Var(52)),const(size.head.pos.y)
trigger1 = Var(9)%4 > 1 && Var(9)%8 < 4
trigger1 = var(58) := 51
trigger2 = Var(9)%4 <= 1 && Var(9)%8 >= 4
trigger2 = var(58) := 53


;---------------------------------------------------------------------------
;基本コンボ１ 地上から空中コンボへ
;---------------------------------------------------------------------------

[State -1, 屈中]
type = ChangeState
value = 410
TriggerAll = var(59) != 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerAll = movehit
triggerAll = var(58) = 1
triggerall = statetype != A
triggerall = movetype != H
trigger1 = Var(2) >1
trigger1 = Var(11)%100%4 < 2
trigger1 = var(58) := 2

[State -1, ];ゲージがあり相手がしゃがみで補正が弱い時、地上コンボ締めへ移行
type = null
TriggerAll = var(59) != 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerAll = movehit
triggerall = statetype != A
triggerall = movetype != H
triggerall = P2statetype = C
triggerall = var(6) = 0
triggerall = FVar(5) > .8
triggerall = var(58) = 2
triggerall = P2BodyDist X > 25-facing*EnemyNear(Var(52)),facing*EnemyNear(Var(52)),Vel X*5
trigger1 = power >= 1000
trigger1 = random < 250
trigger1 = var(58) := 6
trigger2 = power >= 500
trigger2 = Var(2) >1
trigger2 = var(58) := 6

[State -1, 立ち中スキップ]
type = null
TriggerAll = var(59) != 0
triggerAll = movehit
triggerall = statetype != A
triggerall = movetype != H
trigger1 = P2BodyDist X > 20-facing*EnemyNear(Var(52)),facing*EnemyNear(Var(52)),Vel X*4.2
trigger1 = var(58) = 2
trigger1 = var(58) := 3

[State -1, 立ち中]
type = ChangeState
value = 210
TriggerAll = var(59) != 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerAll = movehit
triggerall = statetype != A
triggerall = movetype != H
triggerall = Var(2) >1
triggerall = Var(11)%100%2 < 1
triggerall = var(58) = 2
trigger1 = stateno = 410
trigger1 = random < animelemtime(4)*60
trigger1 = var(58) := 3
trigger2 = stateno != 410
trigger2 = var(58) := 3

[State -1, 4強スキップ]
type = null
TriggerAll = var(59) != 0
triggerAll = movehit
triggerall = statetype != A
triggerall = movetype != H
trigger1 = P2BodyDist X > 30-facing*EnemyNear(Var(52)),facing*EnemyNear(Var(52)),Vel X*6
trigger1 = var(58) = 3
trigger1 = var(58) := 4

[State -1, 4強]
type = ChangeState
value = 230
TriggerAll = var(59) != 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerAll = movehit
triggerall = statetype != A
triggerall = movetype != H
triggerall = Var(2) >1
triggerall = Var(12)%100%4 < 2
triggerall = var(58) = 3
trigger1 = stateno = 410
trigger1 = random < animelemno(0)*100
trigger2 = var(58) := 4
trigger2 = stateno != 410
trigger2 = var(58) := 4
;地上コンボルート用
trigger3 = Var(2) >1
trigger3 = Var(12)%2 < 1
trigger3 = var(58) = 7
trigger3 = var(58) := 8

[State -1, 屈強]
type = ChangeState
value = 420
TriggerAll = var(59) != 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerAll = movehit
triggerall = statetype != A
triggerall = movetype != H
trigger1 = Var(2) >1
trigger1 = Var(12)%100%8 < 4
trigger1 = var(58) = 4
trigger1 = var(58) := 5

[State -1, 立ち強]
type = ChangeState
value = 220
TriggerAll = var(59) != 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerAll = movehit
triggerall = statetype != A
triggerall = movetype != H
trigger1 = Var(2) >1
trigger1 = Var(12)%2 < 1
trigger1 = var(58) = 5
trigger1 = var(58) := 901
;地上コンボルート用
trigger2 = random < animelemtime(4)*60
trigger2 = Var(2) >1
trigger2 = Var(12)%2 < 1
trigger2 = var(58) = 6
trigger2 = var(58) := 7

[State -1, レールガン]
type = ChangeState
value = ifelse(var(21) = 3,3050,3000)
TriggerAll = var(59) != 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerall = power >= 3000 || var(21)
triggerall = statetype != A
triggerall = movetype != H
triggerall = var(6) = 0
trigger1 = movehit
trigger1 = Var(2) >1
trigger1 = var(58) = 8
trigger1 = var(58) := 999

[State -1, 雷撃波]
type = ChangeState
value = 2020
TriggerAll = var(59) != 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerall = statetype != A
triggerall = movetype != H
triggerall = power >= 1000 || var(21)
triggerall = var(6) = 0
trigger1 = movehit
trigger1 = Var(2) >1
trigger1 = var(58) = 8
trigger1 = var(58) := 999

;---------------------------------------------------------------------------
;3中 地上から空中コンボへ 21-
;---------------------------------------------------------------------------

[State -1,Jump]
type = ChangeState
value = 43
TriggerAll = var(59) != 0
TriggerAll = RoundState = 2
TriggerAll = Alive
trigger1 = statetype != A
trigger1 = movehit
trigger1 = var(58) = 22
trigger1 = var(58) := 23

[State -1, 空中中]
type = ChangeState
value = 610
TriggerAll = var(59) != 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerall = statetype = A
triggerall = movetype != H
trigger1 = ctrl
trigger1 = time = 7
trigger1 = var(58) = 23
trigger1 = var(58) := 52

;---------------------------------------------------------------------------
;磁性操作引 地上から空中コンボへ 31-
;---------------------------------------------------------------------------

[State -1, 立ち中]
type = ChangeState
value = 210
TriggerAll = var(59) != 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerall = statetype != A
triggerall = movetype != H
trigger1 = Var(2) >1
trigger1 = Var(11)%100%2 < 1
trigger1 = var(58) = 31
trigger1 = var(58) := 32

[State -1, 屈強]
type = ChangeState
value = 420
TriggerAll = var(59) != 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerAll = movehit
triggerall = statetype != A
triggerall = movetype != H
trigger1 = Var(2) >1
trigger1 = Var(12)%100%8 < 4
trigger1 = var(58) = 32
trigger1 = var(58) := 5

;---------------------------------------------------------------------------
;磁性操作雹 地上から空中コンボへ 41-
;---------------------------------------------------------------------------

[State -1, 磁性操作引スキップ]
type = varset
TriggerAll = var(59) != 0
trigger1 = p2statetype = A || p2statetype = L
trigger1 = var(58) = 41
var(58) = 999

[State -1, 磁性操作引]
type = ChangeState
value = 2120
TriggerAll = var(59) != 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerall = power >= 1000 || var(21)
triggerall = statetype != A
triggerall = movetype != H
triggerall = numhelper(2121) = 0
triggerall = p2statetype != A && p2statetype != L
triggerall = var(58) = 41
trigger1 = ctrl
trigger1 = var(58) := 31
trigger2 = stateno = [1100,1110]
trigger2 = animelemno(0) = [8,10]
trigger2 = var(58) := 31

[State -1, ダッシュ]
type = ChangeState
value = 100
TriggerAll = var(59) != 0
triggerall = statetype != A
triggerall = movetype != H
triggerAll = stateno != 100
trigger1 = ctrl
trigger1 = var(58) = 42

[State -1, 屈強]
type = ChangeState
value = 420
TriggerAll = var(59) != 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerall = statetype != A
triggerall = movetype != H
trigger1 = P2BodyDist X < 30
trigger1 = ctrl
trigger1 = Var(12)%100%8 < 4
trigger1 = var(58) = 42
trigger1 = var(58) := 5

;---------------------------------------------------------------------------
;ジャンプ～エリアル 51-
;---------------------------------------------------------------------------

;浮かせた後、前方ジャンプ
[State -1,Jump]
type = ChangeState
value = 43
TriggerAll = var(59) != 0
trigger1 = statetype != A
trigger1 = movehit
trigger1 = var(58) = 901
trigger1 = var(58) := 51

;2段ジャンプ追撃
[State -1,Jump]
type = ChangeState
value = 46
trigger1 = statetype = A
trigger1 = movehit
trigger1 = var(58) = 902
;trigger1 = time = 53
trigger1 = var(58) := 53

[State -1, 空中中]
type = ChangeState
value = 610
TriggerAll = var(59) != 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerall = statetype = A
triggerall = movetype != H
trigger1 = ctrl
trigger1 = time = 7
trigger1 = var(58) = 51
trigger1 = var(58) := 52
trigger2 = ctrl
trigger2 = Var(11)%100%16 < 8
trigger2 = var(58) = 53
trigger2 = var(58) := 54

[State -1, 空中強]
type = ChangeState
value = 620
TriggerAll = var(59) != 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerall = statetype = A
triggerall = movetype != H
triggerall = movehit
triggerall = Var(2) >1
trigger1 = Var(12)%100%16 < 8
trigger1 = var(58) = 52
trigger1 = var(58) := 902
;MAX,HEAT,BLOODHEAT時
trigger2 = var(21)
trigger2 = var(58) = 54
trigger2 = P2Dist Y < -10
trigger2 = var(58) := 57
trigger3 = var(21)
trigger3 = var(58) = 54
trigger3 = var(58) := ifelse(FrontEdgeDist-P2Dist X*2+8+P2BodyDist X < 5,57,56+random%2)
;ゲージがある時
trigger4 = power >= 1000
trigger4 = random < 100
trigger4 = var(58) = 54
trigger4 = P2Dist Y < -10
trigger4 = var(58) := 57
trigger5 = power >= 1000
trigger5 = random < 100
trigger5 = var(58) = 54
trigger5 = var(58) := ifelse(FrontEdgeDist-P2Dist X*2+8+P2BodyDist X < 5,57,56+random%2)
;ゲージないとき
trigger6 = Var(12)%100%16 < 8
trigger6 = var(58) = 54
trigger6 = var(58) := 55

[State -1, 空中投げ]
type = ChangeState
value = 810
TriggerAll = var(59) != 0
triggerall = statetype = A
triggerall = movetype != H
triggerall = p2statetype = A
triggerall = P2BodyDist X = [0,15]
triggerall = P2BodyDist Y = [-20,40]
trigger1 = movehit
trigger1 = Var(2) >1
trigger1 = var(58) = 55
trigger1 = var(58) := 999

[State -1, 電磁跳躍F]
type = ChangeState
value = 2200+ifelse(statetype = A,5,0)
TriggerAll = var(59) != 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerall = movetype != H
triggerall = power >= 1000 || var(21)
triggerall = var(8) = 0
trigger1 = movehit
trigger1 = Var(2) >1
trigger1 = var(58) = 56
trigger1 = var(58) := 999

[State -1, 磁性操作雷]
type = ChangeState
value = 2320
TriggerAll = var(59) != 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerall = statetype = A
triggerall = movetype != H
triggerall = power >= 1000 || var(21)
triggerall = var(6) = 0
trigger1 = movehit
trigger1 = Var(2) >1
trigger1 = var(58) = 57
trigger1 = var(58) := 999

;---------------------------------------------------------------------------
;撃ち落とし 101-
;---------------------------------------------------------------------------

[State -1, ブラシ投げ中]
type = ChangeState
value = 1110
TriggerAll = var(59) != 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerall = statetype != A
triggerall = movetype != H
triggerall = Var(2) >1 || ctrl
triggerall = var(58) = 101
trigger1 = var(58) := 102

[State -1, 電撃波弱]
type = ChangeState
value = 1000
TriggerAll = var(59) != 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerall = statetype != A
triggerall = movetype != H
trigger1 = ctrl
trigger1 = var(58) = 102
trigger1 = var(58) := 999

[State -1, ブラシ投げ弱]
type = ChangeState
value = 1100
TriggerAll = var(59) != 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerall = statetype != A
triggerall = movetype != H
triggerall = Var(2) >1 || ctrl
triggerall = var(58) = 103
trigger1 = P2BodyDist X < 75
trigger1 = var(58) := 102
trigger2 = var(58) := 999

;---------------------------------------------------------------------------
;ブラシ中空中ヒット 111-
;---------------------------------------------------------------------------

[State -1, 電磁跳躍Fキャンセル]
type = varset
TriggerAll = var(59) != 0
triggerall = var(58) = 111
trigger1 = power < 1000 && var(21) = 0
trigger2 = P2BodyDist X+P2Dist Y < -20
var(58) = 101

[State -1, 電磁跳躍F]
type = ChangeState
value = 2200
TriggerAll = var(59) != 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerall = power >= 1000 || var(21)
triggerall = statetype != A
triggerall = movetype != H
triggerall = var(58) = 111
triggerall = P2BodyDist X+P2Dist Y > -20
trigger1 = stateno = [1100,1110]
trigger1 = animelemno(0) = [8,10]
trigger1 = var(58) := 112
trigger2 = ctrl
trigger2 = var(58) := 112

[State -1, 立ち弱]
type = ChangeState
value = 200
TriggerAll = var(59) != 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerall = statetype != A
triggerall = movetype != H
trigger1 = Var(2) >1
trigger1 = Var(10)%100%2 < 1
trigger1 = var(58) = 112
trigger1 = var(58) := 5

;---------------------------------------------------------------------------
;屈弱 121-
;---------------------------------------------------------------------------
[State -1, 屈弱]
type = ChangeState
value = 400
TriggerAll = var(59) != 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerall = statetype != A
triggerall = movetype != H
triggerAll = ctrl
trigger1 = var(58) = 121
trigger1 = var(58) := 2


;---------------------------------------------------------------------------
;招雷拾い 131-
;---------------------------------------------------------------------------
[State -1, 立ち中]
type = ChangeState
value = 210
TriggerAll = var(59) != 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerall = statetype != A
triggerall = movetype != H
trigger1 = ctrl
trigger1 = var(58) = 131
trigger1 = P2BodyDist X < 20-facing*EnemyNear(Var(52)),facing*EnemyNear(Var(52)),Vel X*6
trigger1 = EnemyNear(Var(52)),Pos Y+EnemyNear(Var(52)),Vel Y*5+.45*10 < 10
trigger1 = EnemyNear(Var(52)),Pos Y+EnemyNear(Var(52)),Vel Y*6+.45*15 > 5
trigger1 = var(58) := 5

[State -1, 立ち弱]
type = ChangeState
value = 200
TriggerAll = var(59) != 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerall = statetype != A
triggerall = movetype != H
trigger1 = ctrl
trigger1 = var(58) = 141
trigger1 = EnemyNear(Var(52)),Pos Y+EnemyNear(Var(52)),Vel Y*3+.45*3 < 10
trigger1 = EnemyNear(Var(52)),Pos Y+EnemyNear(Var(52)),Vel Y*4+.45*6 > -5
trigger1 = var(58) := 5


;---------------------------------------------------------------------------
;シールドバンカー拾い 141-
;---------------------------------------------------------------------------
[State -1, 立ち中]
type = ChangeState
value = 210
TriggerAll = var(59) != 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerall = statetype != A
triggerall = movetype != H
trigger1 = ctrl
trigger1 = var(58) = 141
trigger1 = P2BodyDist X+facing*EnemyNear(Var(52)),facing*EnemyNear(Var(52)),Vel X*6 < 30
trigger1 = EnemyNear(Var(52)),Pos Y+EnemyNear(Var(52)),Vel Y*5+.45*10 > -15
trigger1 = EnemyNear(Var(52)),Pos Y+EnemyNear(Var(52)),Vel Y*6+.45*15 < 5
trigger1 = var(58) := 5

[State -1, 電撃波中]
type = ChangeState
value = 1010
TriggerAll = var(59) != 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerall = statetype != A
triggerall = movetype != H
trigger1 = ctrl
trigger1 = var(58) = 141
trigger1 = P2BodyDist X+facing*EnemyNear(Var(52)),facing*EnemyNear(Var(52)),Vel X*20 = [20,90]
trigger1 = var(58) := 999

[State -1, ブラシ投げ弱]
type = ChangeState
value = 1100
TriggerAll = var(59) != 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerall = statetype != A
triggerall = movetype != H
trigger1 = ctrl
trigger1 = var(58) = 141
trigger1 = P2BodyDist X+facing*EnemyNear(Var(52)),facing*EnemyNear(Var(52)),Vel X*20 > 90
trigger1 = var(58) := 999


;---------------------------------------------------------------------------
;BE立ち強 151-
;---------------------------------------------------------------------------
[State -1, 4強]
type = ChangeState
value = 230
TriggerAll = var(59) != 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerAll = movehit
triggerall = statetype != A
triggerall = movetype != H
triggerall = Var(2) >1
triggerall = Var(12)%100%4 < 2
triggerall = var(58) = 151
trigger1 = var(58) := 152

[State -1, 屈強]
type = ChangeState
value = 420
TriggerAll = var(59) != 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerAll = movehit
triggerall = statetype != A
triggerall = movetype != H
trigger1 = Var(2) >1
trigger1 = Var(12)%100%8 < 4
trigger1 = var(58) = 152
trigger1 = var(58) := 153

[State -1, 3中]
type = ChangeState
value = 411
TriggerAll = var(59) != 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerAll = movehit
triggerall = statetype != A
triggerall = movetype != H
trigger1 = Var(2) >1
trigger1 = var(58) = 153
trigger1 = var(58) := 999


;====================================================================================
;固め用コンボ　501-
;====================================================================================
;地上弱ガード時用牽制コンボ
[State -1,コンボ移行用]
type = varset
TriggerAll = var(59) != 0
trigger1 = MoveGuarded
trigger1 = stateno = 200
trigger2 = MoveGuarded
trigger2 = stateno = 400
var(58) = 501

[State -1, 屈中]
type = ChangeState
value = 410
TriggerAll = var(59) != 0
triggerAll = MoveGuarded
triggerAll = var(58) = 101
triggerall = statetype != A
triggerall = movetype != H
trigger1 = Var(2) >1
trigger1 = Var(11)%100%4 < 2
trigger1 = var(58) := 502

[State -1, 屈強]
type = ChangeState
value = 420
TriggerAll = var(59) != 0
triggerAll = MoveGuarded
triggerall = statetype != A
triggerall = movetype != H
trigger1 = Var(2) >1
trigger1 = Var(12)%100%8 < 4
trigger1 = var(58) = 502
trigger1 = var(58) := 503

[State -1, 這電]
type = ChangeState
value = 1400
TriggerAll = var(59) != 0
triggerAll = MoveGuarded
triggerall = statetype != A
triggerall = movetype != H
trigger1 = Var(2) >1
trigger1 = var(58) = 503
trigger1 = var(58) := 999


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;飛び込み
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;距離が離れている時、飛び込みを試みる
[State -1, ハイジャンプ]
type = ChangeState
value = 41
TriggerAll = var(59) > 0
TriggerAll = RoundState = 2
TriggerAll = Alive
TriggerAll = var(58) = 0
triggerall = statetype != A
triggerall = MoveType != H
triggerall = stateno != 105
triggerall = stateno != [120,155]
trigger1 = ctrl
trigger1 = P2BodyDist X >= 120
trigger1 = P2MoveType = A && P2StateType != A && EnemyNear(Var(52)),Time < 10
trigger1 = Random < EnemyNear(Var(52)),Time*(40-(Var(21)=3)*30)

;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;ガード記述
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[State -1, 防御]
Type = ChangeState
Value = 120
TriggerAll = Var(59) > 0
TriggerAll = Alive
triggerall = StateNo!=[120,155]
TriggerAll = RoundState = 2
TriggerAll = Ctrl || (StateNo = [100,105]) 
TriggerAll = EnemyNear(var(52)),MoveType = A || InGuardDist
Trigger1 = InGuardDist
Trigger1 = !(EnemyNear(var(52)),HitDefAttr = SCA,NT,ST,HT) ;投げ以外
Trigger1 = Random <= (950) ;硬くする場合、場合によっては削除
Trigger2 = var(21) != 3
Trigger2 = EnemyNear(var(52)),MoveType = A
Trigger2 = P2BodyDist X < 0
Trigger2 = Random <= (950) ;硬くする場合、場合によっては削除
Trigger3 = InGuardDist
Trigger3 = P2BodyDist X > 80 || EnemyNear(var(52)),Time > 50
Trigger3 = Random <= 975
Trigger4 = var(21) != 3
Trigger4 = EnemyNear(var(52)),MoveType = A
Trigger4 = (EnemyNear(var(52)),NumProj > 0) || (enemynear(var(52)), hitdefattr = SCA,HA,AP,SP,HP)
Trigger4 = Random <= (975)
Trigger5 = var(21) != 3
Trigger5 = EnemyNear(var(52)),MoveType = A
Trigger5 = InGuardDist
Trigger5 = prevstateno = 5120

;---------------------------------------------------------------------------
[State -1,立ち移行]
type = ChangeState
value = 12
TriggerAll = Var(59) > 0
TriggerAll = RoundState = 2
TriggerAll = StateType = C
TriggerAll = Ctrl
TriggerAll = EnemyNear(var(52)),StateType = A
TriggerAll = P2BodyDist X < 60
Trigger1 = Random < (750)

;---------------------------------------------------------------------------
;通常屈み移行
[State -1, 屈み移行]
type = ChangeState
value = 10
TriggerAll = Var(59) > 0
TriggerAll = RoundState = 2
Trigger1 = EnemyNear(var(52)),StateType = S || EnemyNear(var(52)),StateType = C
Trigger1 = (StateType = S) && (Time > 30)
Trigger1 = Ctrl
Trigger1 = P2BodyDist X = [0,40]
Trigger1 = Random < (550)

[State -1,避け]
Type = ChangeState
Value = 850
TriggerAll = var(59) > 0
TriggerAll = var(58) = 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerall = statetype != A
triggerall = MoveType != H
TriggerAll = NumHelper(25000)!=0
TriggerAll = Ctrl
Trigger1 = EnemyNear(Var(52)),HitDefAttr = SCA,NA,SA,HA
Trigger1 = !(Facing*EnemyNear(Var(52)),Facing!=-1 || P2Dist X<0)
Trigger2 = EnemyNear(Var(52)),time=[40,50]
Trigger3 = EnemyNear(Var(52)),HitDefAttr = SCA,NA,SA,HA
Trigger3 = P2BodyDist X=[-44,40]

[State -1, 地上シールド]
type = ChangeState
value = ifelse(statetype = A,920,ifelse(statetype = C,910,900))
TriggerAll = var(59) > 0
TriggerAll = var(58) = 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerall = statetype != A
triggerall = MoveType != H
TriggerAll = EnemyNear(Var(52)),MoveType=A
TriggerAll = P2BodyDist X=[-40,60]
TriggerAll = P2BodyDist Y=[-80,4]
TriggerAll = EnemyNear(Var(52)),HitDefAttr = S,NA,SA,HA || EnemyNear(Var(52)),HitDefAttr=A,NA
TriggerAll = Enemy,NumProj=0
TriggerAll = (EnemyNear(Var(52)),StateType=A && EnemyNear(Var(52)),Vel Y>=-1) || (EnemyNear(Var(52)),StateType!=A && EnemyNear(Var(52)),StateType=S) 
trigger1 = ctrl
Trigger1 = Random <= 400+(var(21)=3)*200

[State -1, 空中シールド]
type = ChangeState
value = ifelse(statetype = A,920,ifelse(statetype = C,910,900))
TriggerAll = var(59) > 0
TriggerAll = var(58) = 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerall = statetype = A
triggerall = MoveType != H
TriggerAll = EnemyNear(Var(52)),MoveType=A
TriggerAll = P2BodyDist X=[-2,40]
TriggerAll = EnemyNear(Var(52)),HitDefAttr = SA,NA,SA,HA     
Triggerall = Random <= 600
Trigger1 = Ctrl || Var(2) >1
Trigger1 = P2BodyDist Y=[-70,70]
Trigger1 = EnemyNear(Var(52)),StateType=A
Trigger2 = Ctrl || Var(2) >1
Trigger2 = P2BodyDist Y=[0,70]
Trigger2 = EnemyNear(Var(52)),StateType!=A
Trigger2 = Vel Y>=-1


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;その他システム
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[State -1, 強制解放]
type = ChangeState
value = 700
TriggerAll = var(59) > 0
TriggerAll = var(58) = 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerall = statetype != A
triggerall = MoveType != H
triggerall = power >= 1000 || Var(21) = 1
triggerall = Var(21) = [0,1]
TriggerAll = ((P2BodyDist X=[-17,17]) && (P2BodyDist Y>=-50))
triggerall = ctrl
trigger1 = Life >= LifeMax*0.5
trigger1 = power >= 2000
trigger1 = Random < 50+var(21)*power*.4
trigger2 = (Life >= LifeMax*0.3) && (Life < LifeMax*0.5)
trigger2 = power >= 2000
trigger2 = Random < 100+var(21)*power*.8
trigger3 = (Life >= LifeMax*0.3) && (Life < LifeMax*0.5)
trigger3 = power >= 1000
trigger3 = Random < 25+var(21)*power*.2
trigger4 = Life < LifeMax*0.3
trigger4 = power >= 1000
trigger4 = Random < 800
[State -1, 強制解放]
type = ChangeState
value = 700
TriggerAll = var(59) > 0
TriggerAll = var(58) = 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerall = statetype != A
triggerall = MoveType != H
triggerall = power >= 1000 || Var(21) = 1
triggerall = Var(21) = [0,1]
TriggerAll = P2StateType = L && P2BodyDist X>=100
triggerall = ctrl
trigger1 = Life >= LifeMax*0.5
trigger1 = power >= 2000
trigger1 = Random < 50+var(21)*power*.4
trigger2 = (Life >= LifeMax*0.3) && (Life < LifeMax*0.5)
trigger2 = power >= 2000
trigger2 = Random < 100+var(21)*power*.8
trigger3 = (Life >= LifeMax*0.3) && (Life < LifeMax*0.5)
trigger3 = power >= 1000
trigger3 = Random < 25+var(21)*power*.2
trigger4 = Life < LifeMax*0.3
trigger4 = power >= 1000
trigger4 = Random < 800
[State -1, 強制解放]
type = ChangeState
value = 700
TriggerAll = var(59) > 0
TriggerAll = var(58) = 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerall = statetype != A
triggerall = MoveType != H
triggerall = power >= 1000 || Var(21) = 1
triggerall = Var(21) = [0,1]
TriggerAll = P2BodyDist X>=200
triggerall = ctrl
trigger1 = Life >= LifeMax*0.5
trigger1 = power >= 2000
trigger1 = Random < 50+var(21)*power*.4
trigger2 = (Life >= LifeMax*0.3) && (Life < LifeMax*0.5)
trigger2 = power >= 2000
trigger2 = Random < 100+var(21)*power*.8
trigger3 = (Life >= LifeMax*0.3) && (Life < LifeMax*0.5)
trigger3 = power >= 1000
trigger3 = Random < 25+var(21)*power*.2
trigger4 = Life < LifeMax*0.3
trigger4 = power >= 1000
trigger4 = Random < 800

[State -1, サーキットスパーク]
type = ChangeState
value = 710
TriggerAll = var(59) > 0
TriggerAll = var(58) = 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerall = statetype = S || statetype = C
triggerall = MoveType = H
triggerall = StateNo != 150 || StateNo != 152
triggerall = hitshakeover != 0
triggerall = var(6) = 0
triggerall = power >= 2000 || Var(21) = [1,3]
trigger1 = ctrl
trigger1 = Life >= LifeMax*0.5
trigger1 = Random < 5
trigger2 = ctrl
trigger2 = Life >= LifeMax*0.2
trigger2 = Random < 50
trigger3 = ctrl
trigger3 = Life < LifeMax*0.2
trigger3 = Random < 800

:充電
[State -1, 挑発]
type = ChangeState
value = 195
TriggerAll = var(59) > 0
TriggerAll = var(58) = 0
TriggerAll = RoundState = 2
TriggerAll = Alive
trigger1 = statetype != A
trigger1 = ctrl
Trigger1 = EnemyNear(Var(52)),StateType = L
trigger1 = BackEdgeBodyDist > 75
trigger1 = var(6) > 1
trigger1 = Random < 5

;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;対空・起き攻め・ぶっぱなど
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;====================================================================================
;対空
;====================================================================================
[State -1, ブラシ投げ中]
type = ChangeState
value = 1110
TriggerAll = var(59) > 0
TriggerAll = Alive
TriggerAll = RoundState = 2
TriggerAll = var(58) = 0
triggerAll = statetype != A
triggerall = movetype != H
triggerall = ctrl
triggerall = P2MoveType != H
triggerall = Random < 250
trigger1 = P2Dist X+P2Dist Y > 0
trigger1 = EnemyNear(Var(52)),Vel Y < -1
trigger2 = P2Dist X+P2Dist Y < 0
trigger2 = EnemyNear(Var(52)),Vel Y > 1
persistent = 20


;====================================================================================
;起き攻め
;====================================================================================

;====================================================================================
;ぶっぱ
;====================================================================================
[State -1, レールガン]
type = ChangeState
value = ifelse(var(21) = 3,3050,3000)
TriggerAll = var(59) > 0
TriggerAll = RoundState = 2
TriggerAll = Alive
TriggerAll = var(58) = 0
triggerall = power >= 3000 || var(21)
triggerall = statetype != A
triggerall = movetype != H
triggerall = var(6) = 0
triggerall = ctrl
triggerall = EnemyNear(Var(52)),HitDefAttr = SC,NA,SA,HA
triggerall = p2statetype != A && p2statetype != L
trigger1 = P2MoveType = A
trigger1 = p2bodydist X < 60
trigger1 = random <= 250+var(21)*50
trigger1 = P2MoveType = A
trigger1 = p2bodydist X > 180
trigger1 = random <= 200-var(21)*50
persistent = 20


;対空ぶっぱ
[State -1, 招雷]
type = ChangeState
value = 2420
TriggerAll = var(59) > 0
TriggerAll = RoundState = 2
TriggerAll = Alive
TriggerAll = var(58) = 0
triggerall = power >= 1000 || var(21)
triggerall = statetype != A
triggerall = movetype != H
triggerall = var(6) = 0
trigger1 = ctrl
trigger1 = P2Dist Y < -30
trigger1 = p2bodydist X + facing*EnemyNear(Var(52)),facing*EnemyNear(Var(52)),Vel X*11 = [-20, 40]
trigger1 = p2statetype != L
trigger1 = P2MoveType = A
trigger1 = power >= 1500 || var(21)
trigger1 = random <= 350
persistent = 20

;自分画面端でのぶっぱ
[State -1, イリュージョン];ゲージレベル１
type = ChangeState
value = 2501
TriggerAll = var(59) > 0
TriggerAll = RoundState = 2
TriggerAll = Alive
TriggerAll = var(58) = 0
triggerall = power >= 1500 || var(21)
triggerall = statetype != A
triggerall = MoveType != H
trigger1 = ctrl
trigger1 = BackEdgeBodyDist < 50
trigger1 = p2bodydist X < 50
trigger1 = P2Dist Y > -50
trigger1 = p2statetype != L
trigger1 = power >= 2000 || var(21)
trigger1 = random <= 3

;その他ぶっぱ
[State -1, ネットワーク];ゲージレベル１
type = ChangeState
value = 2502
TriggerAll = var(59) > 0
TriggerAll = RoundState = 2
TriggerAll = Alive
TriggerAll = var(58) = 0
triggerall = power >= 1500 || var(21)
triggerall = statetype != A
triggerall = MoveType != H
triggerall = numhelper(2530) = 0
trigger1 = ctrl
trigger1 = p2bodydist X > 100
trigger1 = P2Dist Y > -90
trigger1 = p2statetype != L
trigger1 = power >= 2200 || var(21)
trigger1 = random <= 2

[State -1, ウェーブ];ゲージレベル１
type = ChangeState
value = 2500
TriggerAll = var(59) > 0
TriggerAll = RoundState = 2
TriggerAll = Alive
TriggerAll = var(58) = 0
triggerall = power >= 1500 || var(21)
triggerall = statetype != A
triggerall = MoveType != H
triggerall = numhelper(2510) = 0
trigger1 = ctrl
trigger1 = p2statetype != A && p2statetype != L
trigger1 = p2bodydist X = [60, 130]
trigger1 = power >= 2300 || var(21)
trigger1 = random <= 2


[State -1, 磁性操作引]
type = ChangeState
value = 2120
TriggerAll = var(59) > 0
TriggerAll = RoundState = 2
TriggerAll = Alive
TriggerAll = var(58) = 0
triggerall = power >= 1000 || var(21)
triggerall = statetype != A
triggerall = movetype != H
triggerall = numhelper(2121) = 0
triggerall = numhelper > 0
triggerall = helper,movehit
trigger1 = ctrl
trigger1 = p2statetype != A && var(15) = 0
trigger1 = p2bodydist X > 130
trigger1 = power >= 2000 || var(21)
trigger1 = random <= 2


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;移動行動
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[State -1, 歩く]
type = ChangeState
value = 21
TriggerAll = var(59) > 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerAll = var(55) != 1
TriggerAll = var(58) = 0
triggerall = statetype = S
triggerall = MoveType != H
triggerall = stateno != 100
triggerall = ctrl
trigger1 = Random < 250
trigger1 = var(55) := 1

[State -1, 走る]
type = ChangeState
value = 100
TriggerAll = var(59) > 0
TriggerAll = RoundState = 2
TriggerAll = Alive
TriggerAll = var(58) = 0
triggerall = var(55) != 5
triggerall = statetype = S
triggerall = MoveType != H
triggerall = stateno != 100
triggerall = ctrl
trigger1 = Random < 50
trigger1 = var(55) := 5
trigger2 = P2StateType = A
trigger2 = Random < 250
trigger2 = var(55) := 5

[State -1, バックステップ]
type = ChangeState
value = 105
TriggerAll = var(59) > 0
TriggerAll = RoundState = 2
TriggerAll = Alive
TriggerAll = var(58) = 0
triggerall = statetype = S
triggerall = MoveType != H
triggerall = ctrl
trigger1 = EnemyNear(Var(52)),MoveType = A
trigger1 = EnemyNear(Var(52)),Time < 3
trigger1 = Random < 150-(Var(21)=3)*100

[State -1, 地上ジャンプ]
type = ChangeState
value = 43
TriggerAll = var(59) > 0
TriggerAll = RoundState = 2
TriggerAll = Alive
TriggerAll = var(58) = 0
triggerall = statetype != A
triggerall = MoveType != H
triggerall = stateno != [120,155]
triggerall = stateno != 105
trigger1 = ctrl
trigger1 = P2BodyDist X = [30,60]
trigger1 = Random < 150
trigger1 = var(58) := 900

;飛び込み
[State -1, 地上ジャンプ前]
type = ChangeState
value = 43
TriggerAll = var(59) > 0
TriggerAll = RoundState = 2
TriggerAll = Alive
TriggerAll = var(58) = 0
triggerall = statetype != A
triggerall = MoveType != H
triggerall = P2MoveType != A
triggerall = stateno != [120,155]
triggerall = stateno != 105
trigger1 = ctrl
trigger1 = P2BodyDist X < 100
trigger1 = Random < 50
trigger1 = var(58) := 901

;飛び退き
[State -1, 地上ジャンプ後]
type = ChangeState
value = 43
TriggerAll = var(59) > 0
TriggerAll = RoundState = 2
TriggerAll = Alive
TriggerAll = var(58) = 0
triggerall = statetype != A
triggerall = MoveType != H
triggerall = P2statetype != A
triggerall = P2MoveType = A
triggerall = stateno != [120,155]
triggerall = stateno != 105
triggerall = P2BodyDist X < 10
triggerall = Random < 150
trigger1 = ctrl
trigger1 = var(58) := 902
trigger2 = Var(2) >1 
trigger2 = Var(9)%2 = 0 && movehit
trigger2 = var(58) := 902

;距離が離れている時、飛び込みを試みる
[State -1, ハイジャンプ]
type = ChangeState
value = 41
TriggerAll = var(59) > 0
TriggerAll = RoundState = 2
TriggerAll = Alive
TriggerAll = var(58) = 0
triggerall = statetype != A
triggerall = MoveType != H
triggerall = stateno != 105
triggerall = stateno != [120,155]
trigger1 = ctrl
trigger1 = P2BodyDist X >= 120
trigger1 = Random < 50

;相手がダウン中、自分が画面端でなければバクステで一旦距離を取る
[State -1, バックステップ]
type = ChangeState
value = 105
TriggerAll = var(59) > 0
TriggerAll = RoundState = 2
TriggerAll = Alive
TriggerAll = var(58) = 0
triggerall = statetype != A
triggerall = MoveType != H
trigger1 = ctrl
Trigger1 = EnemyNear(Var(52)),StateType = L
trigger1 = BackEdgeBodyDist > 75

;相手ダウン中、自分が画面に追い詰められているなら張り付き移動で反対側へ
[State -1, 電磁跳躍B]
type = ChangeState
value = 1200+ifelse(statetype = A,3,0)
TriggerAll = var(59) > 0
TriggerAll = RoundState = 2
TriggerAll = Alive
TriggerAll = var(58) = 0
triggerall = statetype != A
triggerall = MoveType != H
triggerall = var(8) = 0
trigger1 = ctrl
Trigger1 = EnemyNear(Var(52)),StateType = L
trigger1 = P2BodyDist X <= 50
trigger1 = BackEdgeBodyDist <= 25
trigger1 = var(55) := 11

[State -1, 壁張り付き対岸跳躍]
type = ChangeState
value = 1212
TriggerAll = var(59) > 0
TriggerAll = RoundState = 2
TriggerAll = Alive
TriggerAll = var(58) = 0
trigger1 = stateno = 1210
trigger1 = var(8) = 2
trigger1 = var(55) = 11
trigger1 = var(55) := 999


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;立ち回り技
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;====================================================================================
;至近距離 0　～　12
;====================================================================================
[State -1, 投げ]
type = ChangeState
value = 800
TriggerAll = var(59) > 0
triggerall = statetype != A
triggerall = ctrl || Var(2) >1
triggerall = stateno != 100
TriggerAll = RoundState = 2
TriggerAll = P2BodyDist X = [0,12]
TriggerAll = EnemyNear(var(52)),StateType = S || EnemyNear(var(52)),StateType = C
Trigger1 = Random < 350

;====================================================================================
;至近距離 20　～　70
;====================================================================================
[State -1, 立ち弱]
type = ChangeState
value = 200
TriggerAll = var(59) > 0
TriggerAll = var(58) = 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerAll = statetype != A
triggerall = p2bodydist X < 20
triggerall = P2Dist Y > -50
triggerall = Random < 500
trigger1 = ctrl
trigger1 = Random < 400
trigger2 = Var(2) >1
trigger2 = Var(10)%100%2 < 1
trigger2 = animelemtime(2) >= 1
trigger3 = Var(2) >1
trigger3 = stateno = 200 || stateno = 400
trigger3 = animelemtime(2) >= 1

[State -1, 屈弱]
type = ChangeState
value = 400
TriggerAll = var(59) > 0
TriggerAll = var(58) = 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerAll = statetype != A
triggerall = p2bodydist X < 20
triggerall = P2Dist Y > -20
triggerall = Random < 500
trigger1 = ctrl
trigger1 = Random < 400
trigger2 = Var(2) >1
trigger2 = Var(10)%100%4 < 2
trigger2 = animelemtime(2) >= 1
trigger3 = Var(2) >1
trigger3 = stateno = 200 || stateno = 400
trigger3 = animelemtime(2) >= 1

[State -1, 屈中]
type = ChangeState
value = 410
TriggerAll = var(59) > 0
TriggerAll = var(58) = 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerAll = statetype != A
triggerall = movetype != H
trigger1 = ctrl
trigger1 = p2bodydist X < 35
trigger1 = P2Dist Y > -40
trigger1 = Random < 300

[State -1, 跳電]
type = ChangeState
value = 1400
TriggerAll = var(59) > 0
TriggerAll = var(58) = 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerall = statetype != A
triggerall = movetype != H
trigger1 = ctrl
trigger1 = P2statetype != A
trigger1 = p2bodydist X < 50
trigger1 = Random < 200

[State -1, 3中]
type = ChangeState
value = 411
TriggerAll = var(59) > 0
TriggerAll = var(58) = 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerAll = statetype != A
triggerall = movetype != H
trigger1 = ctrl
trigger1 = p2bodydist X < 65
trigger1 = P2Dist Y > -50
trigger1 = Random < 150

[State -1, シールドバンカー]
type = ChangeState
value = 930
TriggerAll = var(59) > 0
TriggerAll = var(58) = 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerall = statetype != A
TriggerAll = EnemyNear(Var(52)),MoveType=A
trigger1 = ctrl
trigger1 = p2bodydist X = [0, 60]
trigger1 = P2Dist Y > -50
trigger1 = Random < 250

[State -1, 立ち強]
type = ChangeState
value = 220
TriggerAll = var(59) > 0
TriggerAll = var(58) = 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerAll = statetype != A
triggerAll = ctrl
trigger1 = p2bodydist X = [60,80]
trigger1 = P2Dist Y > -50
trigger1 = Random < 100
trigger1 = var(55) := 221

[State -1, 屈強]
type = ChangeState
value = 420
TriggerAll = var(59) > 0
TriggerAll = var(58) = 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerAll = statetype != A
triggerAll = ctrl
trigger1 = p2bodydist X = [60,90]
trigger1 = P2Dist Y > -50
trigger1 = Random < 50
trigger1 = var(55) := 421

[State -1,reset];BE発動したら状況の初期化
type = varset
TriggerAll = var(59) > 0
trigger1 = var(55) = 221
trigger1 = stateno != 220
trigger2 = var(55) = 421
trigger2 = stateno != 420
var(55) = 999

;====================================================================================
;近距離 80　～　100
;====================================================================================
[State -1, 電撃波弱]
type = ChangeState
value = 1000
TriggerAll = var(59) > 0
TriggerAll = var(58) = 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerall = statetype != A
triggerall = movetype != H
trigger1 = ctrl
trigger1 = p2bodydist X = [75, 100]
trigger1 = P2Dist Y > -50
trigger1 = Random < 5

[State -1, 這電]
type = ChangeState
value = 1410
TriggerAll = var(59) > 0
TriggerAll = var(58) = 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerall = statetype != A
triggerall = movetype != H
trigger1 = ctrl
trigger1 = P2statetype != A
trigger1 = p2bodydist X = [100, 180]
trigger1 = Random < 3

;====================================================================================
;中距離 130　～　
;====================================================================================
[State -1, 電撃波中]
type = ChangeState
value = 1010
TriggerAll = var(59) > 0
TriggerAll = var(58) = 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerall = statetype != A
triggerall = movetype != H
trigger1 = ctrl
trigger1 = p2bodydist X = [130, 190]
trigger1 = P2Dist Y > -50
trigger1 = Random < 3

[State -1, ブラシ投げ弱]
type = ChangeState
value = 1100
TriggerAll = var(59) > 0
TriggerAll = var(58) = 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerall = statetype != A
triggerall = movetype != H
trigger1 = ctrl
trigger1 = p2bodydist X > 130
trigger1 = P2Dist Y > -90
trigger1 = Random < 30


;====================================================================================
;空中
;====================================================================================
[State -1, 空中弱]
type = ChangeState
value = 600
TriggerAll = var(59) > 0
TriggerAll = var(58) = 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerall = statetype = A
triggerall = movetype != H
triggerall = Random < 250
trigger1 = ctrl
trigger1 = p2bodydist X - vel X*3 + facing*EnemyNear(Var(52)),facing*EnemyNear(Var(52)),vel X*3 < 10
trigger1 = p2dist Y - vel Y*3-const(movement.yaccel)*3 + EnemyNear(Var(52)),vel Y*3+EnemyNear(Var(52)),const(movement.yaccel)*3 > -50
trigger1 = p2dist Y - vel Y*3-const(movement.yaccel)*3 + EnemyNear(Var(52)),vel Y*3+EnemyNear(Var(52)),const(movement.yaccel)*3 < -30-EnemyNear(Var(52)),const(size.head.pos.y)
trigger2 = Var(2) >1
trigger2 = Var(10)%100%8 < 4
trigger2 = p2bodydist X - vel X*3 + facing*EnemyNear(Var(52)),facing*EnemyNear(Var(52)),vel X*3 < 10
trigger2 = p2dist Y - vel Y*3-const(movement.yaccel)*3 + EnemyNear(Var(52)),vel Y*3+EnemyNear(Var(52)),const(movement.yaccel)*3 > -50
trigger2 = p2dist Y - vel Y*3-const(movement.yaccel)*3 + EnemyNear(Var(52)),vel Y*3+EnemyNear(Var(52)),const(movement.yaccel)*3 < -30-EnemyNear(Var(52)),const(size.head.pos.y)

[State -1, 空中2中]
type = ChangeState
value = 611
TriggerAll = var(59) > 0
TriggerAll = var(58) = 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerall = statetype = A
triggerall = movetype != H
triggerall = ctrl || Var(2) >1
triggerall = p2statetype = S || p2statetype = C
triggerall = p2dist X - vel X*15 + facing*EnemyNear(Var(52)),facing*EnemyNear(Var(52)),vel X*15 = [20,30]
trigger1 = Random < 350
trigger2 = p2movetype = H

[State -1, 空中中]
type = ChangeState
value = 610
TriggerAll = var(59) > 0
TriggerAll = var(58) = 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerall = statetype = A
triggerall = movetype != H
triggerall = Random < 250
trigger1 = ctrl
trigger1 = p2bodydist X - vel X*5 + facing*EnemyNear(Var(52)),facing*EnemyNear(Var(52)),vel X*5 < 20
trigger1 = p2dist Y - vel Y*5-const(movement.yaccel)*10 + EnemyNear(Var(52)),vel Y*5+EnemyNear(Var(52)),const(movement.yaccel)*10 > -20
trigger1 = p2dist Y - vel Y*5-const(movement.yaccel)*10 + EnemyNear(Var(52)),vel Y*5+EnemyNear(Var(52)),const(movement.yaccel)*10 < -EnemyNear(Var(52)),const(size.head.pos.y)
trigger2 = Var(2) >1
trigger2 = Var(11)%100%16 < 8
trigger2 = p2bodydist X - vel X*5 + facing*EnemyNear(Var(52)),facing*EnemyNear(Var(52)),vel X*5 < 20
trigger2 = p2dist Y - vel Y*5-const(movement.yaccel)*10 + EnemyNear(Var(52)),vel Y*5+EnemyNear(Var(52)),const(movement.yaccel)*10 > -20
trigger2 = p2dist Y - vel Y*5-const(movement.yaccel)*10 + EnemyNear(Var(52)),vel Y*5+EnemyNear(Var(52)),const(movement.yaccel)*10 < -EnemyNear(Var(52)),const(size.head.pos.y)


[State -1, 空中2強]
type = ChangeState
value = 621
TriggerAll = var(59) > 0
TriggerAll = var(58) = 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerall = statetype = A
triggerall = movetype != H
trigger1 = ctrl || Var(2) >1
trigger1 = p2bodydist X - vel X*8 + facing*EnemyNear(Var(52)),facing*EnemyNear(Var(52)),vel X*8 < 20
trigger1 = p2dist Y - vel Y*8-const(movement.yaccel)*28 + EnemyNear(Var(52)),vel Y*8+EnemyNear(Var(52)),const(movement.yaccel)*28 > -40
trigger1 = p2dist Y - vel Y*8-const(movement.yaccel)*28 + EnemyNear(Var(52)),vel Y*8+EnemyNear(Var(52)),const(movement.yaccel)*28 < -EnemyNear(Var(52)),const(size.head.pos.y)
trigger1 = Random < 150

[State -1, 空中強]
type = ChangeState
value = 620
TriggerAll = var(59) > 0
TriggerAll = var(58) = 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerall = statetype = A
triggerall = movetype != H
triggerall = Random < 250
trigger1 = ctrl
trigger1 = p2bodydist X-vel X*8 + facing*EnemyNear(Var(52)),facing*EnemyNear(Var(52)),vel X*8 < 30
trigger1 = p2dist Y - vel Y*8-const(movement.yaccel)*28 + EnemyNear(Var(52)),vel Y*8+EnemyNear(Var(52)),const(movement.yaccel)*28 > -35
trigger1 = p2dist Y - vel Y*8-const(movement.yaccel)*28 + EnemyNear(Var(52)),vel Y*8+EnemyNear(Var(52)),const(movement.yaccel)*28 < -10-EnemyNear(Var(52)),const(size.head.pos.y)
trigger2 = Var(2) >1
trigger2 = Var(12)%100%16 < 8
trigger2 = p2bodydist X-vel X*8 + facing*EnemyNear(Var(52)),facing*EnemyNear(Var(52)),vel X*8 < 30
trigger2 = p2dist Y - vel Y*8-const(movement.yaccel)*28 + EnemyNear(Var(52)),vel Y*8+EnemyNear(Var(52)),const(movement.yaccel)*28 > -35
trigger2 = p2dist Y - vel Y*8-const(movement.yaccel)*28 + EnemyNear(Var(52)),vel Y*8+EnemyNear(Var(52)),const(movement.yaccel)*28 < -10-EnemyNear(Var(52)),const(size.head.pos.y)

[State -1, 空中投げ]
type = ChangeState
value = 810
TriggerAll = var(59) > 0
TriggerAll = var(58) = 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerall = statetype = A
triggerall = movetype != H
triggerall = p2statetype = A
triggerall = P2BodyDist X = [0,15]
triggerall = P2BodyDist Y = [-20,40]
trigger1 = ctrl || Var(2) >1
trigger1 = Random < 250

[State -1, 電磁跳躍A]
type = ChangeState
value = 1201+ifelse(statetype = A,3,0)
TriggerAll = var(59) > 0
TriggerAll = var(58) = 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerall = movetype != H
triggerall = var(8) = 0
trigger1 = ctrl
trigger1 = p2bodydist X > 130
trigger1 = Random < 3

;着地地点に敵がいるとき
[State -1, 磁性操作霰]
type = ChangeState
value = 1300
TriggerAll = var(59) > 0
TriggerAll = var(58) = 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerall = statetype = A
triggerall = movetype != H
trigger1 = ctrl
trigger1 = P2statetype != A
trigger1 = abs(Pos Y+Vel Y*3-18) > P2BodyDist X
trigger1 = abs(Pos Y+Vel Y*3-18) < P2Dist X*2-P2BodyDist X
trigger1 = Pos Y+Vel Y*8+2 < 0
trigger1 = Random < 50

[State -1, 磁性操作雹]
type = ChangeState
value = 1310
TriggerAll = var(59) > 0
TriggerAll = var(58) = 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerall = statetype = A
triggerall = movetype != H
triggerall = P2statetype != A
trigger1 = ctrl
trigger1 = Random < 10
;溜める
trigger2 = ctrl
trigger2 = Random < 10
trigger2 = var(55) := 32

[State -1, 空中ジャンプ]
type = ChangeState
value = 46
TriggerAll = var(59) > 0
TriggerAll = var(58) = 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerall = statetype = A
triggerall = MoveType != H
triggerall = P2statetype != A
triggerall = Var(9)%4 > 1 && Var(9)%8 < 4
triggerall = stateno != 105
triggerall = stateno != [120,155]
triggerall = Pos Y < -30
triggerall = Vel Y = [-3,3]
triggerall = ctrl
triggerall = Random < 250
trigger1 = StateNo = 50 && Time >= 8
trigger1 = var(58) := 910
trigger2 = StateNo = 120 || StateNo = 132 || StateNo = 140 || StateNo = 155 || StateNo = 1201
trigger2 = var(58) := 910

[State -1, 空中ジャンプ前]
type = ChangeState
value = 46
TriggerAll = var(59) > 0
TriggerAll = var(58) = 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerall = statetype = A
triggerall = MoveType != H
triggerall = P2MoveType != A
triggerall = Var(9)%4 > 1 && Var(9)%8 < 4
triggerall = stateno != 105
triggerall = stateno != [120,155]
triggerall = Pos Y < -30
triggerall = Vel Y = [-3,3]
triggerall = ctrl
triggerall = Random < 250
trigger1 = StateNo = 50 && Time >= 8
trigger1 = var(58) := 911
trigger2 = StateNo = 120 || StateNo = 132 || StateNo = 140 || StateNo = 155 || StateNo = 1201
trigger2 = var(58) := 911

[State -1, 空中ジャンプ後]
type = ChangeState
value = 46
TriggerAll = var(59) > 0
TriggerAll = var(58) = 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerall = statetype = A
triggerall = MoveType != H
triggerall = P2statetype = A
triggerall = P2MoveType = A
triggerall = Var(9)%4 > 1 && Var(9)%8 < 4
triggerall = stateno != 105
triggerall = stateno != [120,155]
triggerall = Pos Y < -30
triggerall = ctrl
triggerall = Random < 250
trigger1 = StateNo = 50 && Time >= 8
trigger1 = var(58) := 912
trigger2 = StateNo = 120 || StateNo = 132 || StateNo = 140 || StateNo = 155 || StateNo = 1201
trigger2 = var(58) := 912

[State -1, 空中ダッシュ前]
type = ChangeState
value = 44
TriggerAll = var(59) > 0
TriggerAll = var(58) = 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerall = statetype = A
triggerall = MoveType != H
triggerall = P2statetype = A
triggerall = P2MoveType != A
triggerall = Var(9)%4 > 1 && Var(9)%16 < 8
triggerall = stateno != 105
triggerall = stateno != [120,155]
triggerall = ctrl
triggerall = Random < 250
trigger1 = StateNo = 50 && Time >= 8
trigger1 = var(58) := 920
trigger2 = StateNo = 120 || StateNo = 132 || StateNo = 140 || StateNo = 155 || StateNo = 1201
trigger2 = var(58) := 920

[State -1, 空中ダッシュ後]
type = ChangeState
value = 44
TriggerAll = var(59) > 0
TriggerAll = var(58) = 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerall = statetype = A
triggerall = MoveType != H
triggerall = P2MoveType = A
triggerall = Var(9)%4 > 1 && Var(9)%16 < 8
triggerall = stateno != 105
triggerall = stateno != [120,155]
triggerall = ctrl
triggerall = Random < 250
trigger1 = StateNo = 50 && Time >= 8
trigger1 = var(58) := 921
trigger2 = StateNo = 120 || StateNo = 132 || StateNo = 140 || StateNo = 155 || StateNo = 1201
trigger2 = var(58) := 921

[State -1,reset]
type = varset
;着地したら状況の初期化
trigger1 = var(55) = 32
trigger1 = statetype != A
var(55) = 999


;---------------------------------------------------------------------------
;壁張り付きから各種行動
;---------------------------------------------------------------------------
[State -1, 電磁跳躍B]
type = ChangeState
value = 1200+ifelse(statetype = A,3,0)
TriggerAll = var(59) > 0
TriggerAll = var(58) = 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerall = movetype != H
triggerall = var(8) = 0
trigger1 = ctrl
trigger1 = p2bodydist X > 130 || BackEdgeBodyDist <= 75
trigger1 = Random < 5
trigger1 = var(55) := 51
;近距離でも低確率で
trigger2 = ctrl
trigger2 = p2bodydist X <= 130
trigger2 = Random < 2
trigger2 = var(55) := 51

[State -1, 壁張り付き電撃]
type = ChangeState
value = 1220
TriggerAll = var(59) > 0
TriggerAll = var(58) = 0
TriggerAll = RoundState = 2
TriggerAll = Alive
triggerall = stateno = 1210
triggerall = var(8) = 2
triggerall = var(55) = 51
trigger1 = p2bodydist X > 70
trigger1 = P2StateType = S || P2StateType = C
trigger1 = Random < 150
;BEじゃないパターン
trigger2 = p2bodydist X <= 70
trigger2 = Random < 150
trigger2 = var(55) := 999
persistent = 5

[State -1, 壁張り付き電磁跳躍A]
type = ChangeState
value = 1211
TriggerAll = var(59) > 0
TriggerAll = var(58) = 0
TriggerAll = RoundState = 2
TriggerAll = Alive
trigger1 = stateno = 1210
trigger1 = var(8) = 2
trigger1 = var(55) = 51
trigger1 = Random < 250
persistent = 5

[State -1, 壁張り付き対岸跳躍]
type = ChangeState
value = 1212
TriggerAll = var(59) > 0
TriggerAll = var(58) = 0
TriggerAll = RoundState = 2
TriggerAll = Alive
trigger1 = stateno = 1210
trigger1 = var(8) = 2
trigger1 = p2bodydist X <= 60
trigger1 = var(55) = 51
