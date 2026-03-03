; サンプルキャラクター『カンフーマン』のコマンドファイルです。
; コマンドに関する設定は４部構成になっています。
;==============================================================================
; Win版専用パート
;==============================================================================
;------------------------------------------------------------------------------
; ここはWin版から（正確にはLinux版から）追加された要素の二つ。
; コマンド関連の初期設定を任意に指定出来るようになった(`・ω・´)
;
;『ボタンリマップ』はボタン配置変更用の項目。
; 定義パートでいちいち変更しなくても良いようになっちゃった。
; 面倒臭い人用かな！（ﾏﾃｺﾗ
;
;『デフォルト設定』では各[Command]で省略した場合の
; 入力受付時間と入力記憶時間を予め決めておく項目。
;
;
; この２項目は省略可能。
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

;------------------------------------------------------------------------------
; 例えば「本来Ｘボタンで出す弱パンチをＢボタンに変えたい場合」なら、
;
; x = b
;
; で簡単に出来る。使わないボタンを使っているボタンに割り当てる事も可能。
;------------------------------------------------------------------------------
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
;------------------------------------------------------------------------------
; ここがキーとボタンの組み合わせで格闘ゲームにおける
;『入力コマンド』を直接設定・編集するパート。
;
; 一つずつコマンドに名前を付けて入力キーを組み合わせる単純な作業になるけど、
; 組み合わせが独特だから覚えるのは難易度が少し高い。
;
; 下記で「書式の決まり」と「組み合わせに必要なアルファベットと記号」を
; 全て説明しましょう。
;------------------------------------------------------------------------------
;■書式の決まり■
;
; [Command]         ：入力コマンドを１個定義する。
; name = "***"      ：コマンド名を決める。大文字と小文字も区別される。
; command = ###     ：実際に入力するキーを組み合わせる。詳細は後述。
; time = &&&        ：入力受付時間を設定（オプション）。
; buffer.time = @@@ ：入力記憶時間を設定（オプション）。
;
; 小ネタでも説明している通り、登録が可能な数は最大『１２８個』まで。
;
;
;※『必須コマンド名』と書いてるコマンドは、システム側で処理してます。
;　コマンド名を変えたり、消してはいけません。キーの変更は出来ます。
;------------------------------------------------------------------------------
;■必要なアルファベットと記号■
;
; 上記の「command = ###」の『###』に該当する部分で、
; 組み合わせるキーとボタンを設定しなければならない。
;
; ※設定したキーやボタンはM.U.G.E.Nのオプションモードにある
;  「キーコンフィグ」にて設定したキーなどに対応しています。
;
; ★方向キー★（全て必ず大文字で）
;
; 　B 　：「後方」にキーを入れる（ Backward ）
; 　D 　：「下方」にキーを入れる（ Downward ）
; 　F 　：「前方」にキーを入れる（ Forward ）
; 　U 　：「上方」にキーを入れる（ Upward ）
;
; 　DB　：「後ろ斜め下」にキーを入れる（「D」と「B」が同時に入力された事を認識）
; 　UB　：「後ろ斜め上」にキーを入れる（「U」と「B」が同時に入力された事を認識）
; 　DF　：「前斜め下」にキーを入れる（「D」と「F」が同時に入力された事を認識）
; 　UF　：「前斜め上」にキーを入れる（「U」と「F」が同時に入力された事を認識）
;
; ★ボタン★（全て必ず小文字で）
;
; 　a 　：「Ａボタン」を押す
; 　b 　：「Ｂボタン」を押す
; 　c 　：「Ｃボタン」を押す
; 　x 　：「Ｘボタン」を押す
; 　y 　：「Ｙボタン」を押す
; 　z 　：「Ｚボタン」を押す
; 　s 　：「スタートボタン」を押す
;
; ★記号★（入力効果を変化させる命令）
;
; 　/ 　：（スラッシュ）キーやボタンを「押しっぱなし」にしている事を認識する場合に追加する
;
; 　　（例）：　/b       = Ｂボタンを押したままにする
; 　　　　　　　/F       = 前キーを押したままにする
; 　　　　　　　/U,z     = 上キーを押したままＺボタンを入力する
;
;　　━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;
; 　~ 　：（チルダ）キーやボタンが「離された時」を認識する場合に追加する
;
; 　　（例）：　~x       = Ｘボタンを離す
; 　　　　　　　~DF      =「前斜め下」のキーを離す
; 　　　　　　　~DB,F,c  =「後ろ斜め下」を離した後に前キー・Ｃボタンの順番に入力する
;
; 　　　　　　※「ボタンを離すまでの時間（溜め時間）」も設定する事が出来る
;
; 　　　　　　　~30x     = Ｘボタンを押したままにして、３０フレーム以上経ったら離す
; 　　　　　　　~50B,F,a = 後ろキーを５０フレームまで溜めて前キー・Ａボタンの順番に入力する
;
;　　━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;
; 　$ 　：（ドル）方向キーの「複数の内どれかが入力されている事」を認識する場合に追加する
;
; 　　（例）：　$B       =「後方」「後ろ斜め下」「後ろ斜め上」のどれかが入力されている状態
; 　　　　　　　$UF      =「前」「上」「前斜め上」のどれかが入力されている状態
;
; 　　　　　　※この記号は「方向キー」でしか使えません。
;
;　　━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;
; 　+ 　：（プラス）ボタンを「同時押し」している事を認識する場合に追加する
;
; 　　（例）：　x+y      = ＸボタンとＹボタンを同時押しする
; 　　　　　　　a+b+c    = ＡボタンとＢボタンとＣボタンを同時押しする
;
; 　　　　　　※この記号は「ボタン」でしか使えません。
;
;　　━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;
; 　> 　：（グレーターザン）大なり（Win版で追加された記号）
; 　　　　　　　　　　　　「他のキーが入力されていない事を確認して、そのキーを押す」場合
;
; 　　（例）：　a,>~a    = Ａボタン以外が入力されていない状態でＡボタンを離す
; 　　　　　　　F,>~F,>F = 前キー以外が入力されていない状態で前キーを離し、
;　　　　　　　　　　　　　もう一度前キーを入力する
;
;-------------------------------------------------------------------------------
; ●これらの記号は全て組み合わせて使う事が出来る●
;
; 　　（例）：　~80$DB,DF,F,/a+y+c
; 　　　　　　　
; 　　　　　　「後方」「下」「後ろ斜め下」のどれかを８０フレームまで溜めて
; 　　　　　　「前斜め下」→「前」を入力した後、ＡとＹとＣを同時押ししたままにする
;
;------------------------------------------------------------------------------
;-| 超必殺技 |-----------------------------------------------------------------

;※名前が同じならば、違うコマンドでも同じステートの技を出す事が可能。

;----------------------------------------
;SUPERS HYPERS
;-----------------------------------------



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
name = "DP_c"
command = ~F,D,DF,c
Time=20
buffer.Time=10




[Command];空中電撃EX
name = "QCF_c"
command = ~D, DF, F, c
time = 20
buffer.Time=10

[Command];空中電撃EX
name = "QCB_c"
command = ~D, DB, B, c
time = 10
buffer.Time=10

[Command]
name = "DD_c"
command = ~D, D, c
time = 20
buffer.time = 10


;----------------------------------------
;SPECIALS
;-----------------------------------------


[Command]
name = "DP_a"
command = ~F,D,DF,a
Time=20
buffer.Time=10

[Command]
name = "DP_b"
command = ~F,D,DF,b
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
name = "F_z"
command = F,z
time = 25
buffer.time = 15



[Command]
	name = "Burst"
	command = a+b
	time = 1

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

;------------------------------------------------------------------------------
;-| 同時押し |-----------------------------------------------------------------

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


[Command]
name="holdfwd"
command=/$F
Time=1

[Command]
name="holdback"
command=/$B
Time=1


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

;---------------------------
;(「パワー溜め」用にコマンドを追加してます)
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
; ■準常時監視ステート（‐１）■
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
;------------------------------------------------------------------------------
; ここで↑にて実際に使っている「スマッシュカンフー昇竜のChangeState」を例に
; 見て行きましょ！m9っ｀Д´)
;
; まず特定のコマンドを入力したいならば、
; 必ず『呼び出すコマンドのトリガー』は設定しましょう。
; 特殊な条件でない限り、コマンドは通常「triggerall」の方で設定した方が良い。
;
;「triggerall」とは『有効になる状況を限定するための条件』を指定する。
; triggerallの条件が有効にならない限り、trigger1以降の条件も有効にはならない。
; 何個でも増やせる。ステート作成の基本テクニックの一つなので覚えておいてね。
; しかしtriggerallはtrigger1以降が無いと「単体では」使えないので注意。
;（trigger1以降を全てコメント化してM.U.G.E.Nでそのキャラを選んで試してみよう）
;
;
; ※『パワーゲージ』は「スーパーコンボゲージ」や「超必殺技ゲージ」などで
; 　呼ばれてる部分のゲージです。
; 　ゲージが「１０００ポイント」なら『レベル１』と同じ意味になります。
;
; 　まぁパッと見、M.U.G.E.Nのパワーゲージって仕組みが
; 　ストＺＥＲＯシリーズの「スーパーコンボレベルゲージ」まんまだよね（苦笑
;------------------------------------------------------------------------------
;HYPERS
;------------------------------------------------------------------------------

;Railgun
[State -1, 超電磁砲]
type = ChangeState
value = 3000
triggerall = command = "HCF_c"
triggerall = power >= 2000
triggerall= stateno!=3100
triggerall = statetype!= A
trigger1 = ctrl
trigger2 = var(1)


;Hyper Railgun
[State -1, 超超電磁砲]
type = ChangeState
value = 3100
triggerall = command = "HCB_c"
triggerall = numProjID(11200)=0
triggerall = power >= 4000
triggerall = statetype !=A 
trigger1 = ctrl = 1
trigger2=var(1)
;------------------------------------------------------------------------------
;SUPERS
;------------------------------------------------------------------------------

;Elec Zone EX
[State -1, 超超電磁砲]
type = ChangeState
value = 2400
triggerall = command = "DD_c"
triggerall = numProjID(11200)=0
triggerall= stateno!=[3000,3100]
triggerall = power >= 2000
triggerall = statetype !=A 
trigger1 = ctrl = 1
trigger2=var(1)

;DP EX
[State -1, 超超電磁砲]
type = ChangeState
value = 2200
triggerall = command = "DP_c"
triggerall = numProjID(11200)=0
triggerall= stateno!=[3000,3100]
triggerall= stateno!=2400
triggerall = power >= 1000
triggerall = statetype !=A 
trigger1 = ctrl = 1
trigger2=var(1)

;Elec Proj EX
[State -1, 超超電磁砲]
type = ChangeState
value = 2000
triggerall = command = "QCF_c"
triggerall = numhelper(2050)=0
triggerall= stateno!=[3000,3100]
triggerall= stateno!=2400
triggerall = power >= 1000
triggerall = statetype !=A 
trigger1 = ctrl = 1
trigger2=var(1)




;Iron Sand Sword EX
[State -1, 超超電磁砲]
type = ChangeState
value = 2100
triggerall = command = "QCB_c"
triggerall = numProjID(11200)=0
triggerall= stateno!=3100
triggerall= stateno!=2400
triggerall = power >= 1000
triggerall = statetype !=A 
trigger1 = ctrl = 1
trigger2=var(1) && stateno!=3000
trigger3=var(1) && stateno=3000 && animelemtime(33)>=0




;Air Elec Ball EX
[State -1, 電撃EX_空中]
type = ChangeState
value = 2800
triggerall = command = "QCF_c"
triggerall = numProjID(11100)=0
triggerall= stateno!=[3000,3100]
triggerall= stateno!=2400
triggerall = power >= 1000
triggerall = statetype = A
trigger1 = ctrl
trigger2=var(1)
trigger3=stateno=934


;------------------------------------------------------------------------------


;==============================================================================
;SPECIALS
;------------------------------------------------------------------------------



;DP
[State -1, 電撃飛ばし]
type = ChangeState
value = 1400
triggerall = command = "DP_a"
triggerall = statetype !=A
trigger1 = ctrl 
Trigger2 = StateNo = [200,499] 
trigger2 = var(1)
trigger3=stateno=1175 && var(1)

;Vertical Lightning
[State -1, 電撃飛ばし]
type = ChangeState
value = 1450 
triggerall= command = "DP_b"
triggerall = statetype !=A
trigger1 = ctrl 
Trigger2 = StateNo = [200,499] 
trigger2 = var(1)
trigger3=stateno=1175 && var(1)

;Air Elec Ball
[State -1, 電撃飛ばし]
type = ChangeState
value = 1800
triggerall = command = "QCF_a"
triggerall = statetype =A
triggerall = numProjID(6131)=0
trigger1 = ctrl 
Trigger2 = StateNo = [600,699] 
trigger2 = var(1)
trigger3=stateno=934


;Air Elec Ball Straight
[State -1, 電撃飛ばし]
type = ChangeState
value = 1850
triggerall = command = "QCF_b"
triggerall = statetype =A
triggerall = numProjID(6131)=0
triggerall=cond(vel Y <0,pos Y <=-49,1)
trigger1 = ctrl 
Trigger2 = StateNo = [600,699] 
trigger2 = var(1)
trigger3=stateno=934


;Elec Ball
[State -1, 電撃飛ばし]
type = ChangeState
value = 1000
triggerall = command = "QCF_a"
triggerall = numProjID(6150)=0
triggerall = statetype !=A
trigger1 = ctrl 
Trigger2 = StateNo = [200,499] 
trigger2 = var(1)

;Horizontal Lightning
[State -1, 電撃飛ばし]
type = ChangeState
value = 1050
triggerall = command = "QCF_b"
triggerall = statetype !=A
trigger1 = ctrl 
Trigger2 = StateNo = [200,499] 
trigger2 = var(1)


;Iron Sand Sword Rekka
[State -1, 電撃飛ばし]
type = ChangeState
value = 1100
triggerall = command = "QCB_a"
triggerall = statetype !=A
trigger1 = ctrl 
Trigger2 = StateNo = [200,499] 
trigger2 = var(1)

;Iron Sand Sword Rekka A Second
[State -1, 電撃飛ばし]
type = ChangeState
value = 1125
triggerall = command = "a"
triggerall = statetype !=A
triggerall = stateno= 1100
Trigger1 = animelemtime(5)>=5
Trigger1 = animelemtime(6)<=0
trigger2= var(1)

;Iron Sand Sword Rekka B Second
[State -1, 電撃飛ばし]
type = ChangeState
value = 1150
triggerall = command = "b"
triggerall = statetype !=A
triggerall = stateno= 1100
Trigger1 = animelemtime(5)>=5
Trigger1 = animelemtime(6)<=0
trigger2= var(1)

;Iron Sand Sword Rekka B Final
[State -1, 電撃飛ばし]
type = ChangeState
value = 1175
triggerall = command = "b"
triggerall = statetype !=A
triggerall = stateno= 1150
Trigger1 = animelemtime(7)>=0
Trigger1 = animelemtime(9)<=0
trigger2= var(1)

;Iron Sand Sword Rekka C Crossup
[State -1, 電撃飛ばし]
type = ChangeState
value = 1200
triggerall = command = "c"
triggerall = command = "holdfwd"
triggerall = statetype !=A
triggerall = stateno= 1100
Trigger1 = animelemtime(5)>=5
Trigger1 = animelemtime(6)<=0
trigger2= var(1)



;Iron Sand Sword Wave
[State -1, 電撃飛ばし]
type = ChangeState
value = 1275
triggerall = command = "c"
triggerall = command = "holdback"
triggerall = statetype !=A
triggerall = stateno= 1100
Trigger1 = animelemtime(5)>=5
Trigger1 = animelemtime(6)<=0
trigger2= var(1)



;Iron Sand Drill
[State -1, 電撃飛ばし]
type = ChangeState
value = 1300
triggerall = command = "QCB_b"
triggerall = statetype !=A
trigger1 = ctrl 
Trigger2 = StateNo = [200,499] 
trigger2 = var(1)
trigger3= (stateno=1125) && var(1)

;Drill Followup
[State -1, 砂鉄ドリル2]
type = ChangeState
value = 1305
triggerall = command = "b"
triggerall = statetype!=A
trigger1 = stateno = 1300
trigger1 = var(1)

;Elec Zone Small
[State -1, 電撃飛ばし]
type = ChangeState
value = 1500
triggerall = command = "DD_a"
triggerall = statetype !=A
trigger1 = ctrl 
Trigger2 = StateNo = [200,499] 
trigger2 = var(1)

;Elec Zone Medium
[State -1, 電撃飛ばし]
type = ChangeState
value = 1550
triggerall = command = "DD_b"
triggerall = statetype !=A
trigger1 = ctrl 
Trigger2 = StateNo = [200,499] 
trigger2 = var(1)




;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
; 変数の使い方の例。
;
; カンフーマンの「地上で必殺技が出せる状況」や、
; 通常技から必殺技へ繋ぐ時の「キャンセル」の部分を設定している。
; 地上で成功すれば、『変数の例２』のステートコントローラで設定した
; 変数が実行され、それ以外なら『変数の例１』でリセットする、という処理。

[State -1, Combo condition Reset]
type = VarSet
trigger1 = movetype=H
trigger2 = stateno = [0,160]
var(1) = 0
ignorehitpause=1

;------------------------------------------------------------------------------
;==============================================================================
; 移動関連
;==============================================================================
;------------------------------------------------------------------------------
[State -1,AirDash];空中ダッシュ
Type=ChangeState
value=110
TriggerAll=Alive!=0
TriggerAll=command="FF"
TriggerAll=StateType=A
TriggerAll=pos Y<=-30+(vel y>0)*20
TriggerAll=anim!=110
Trigger1=Ctrl
trigger2=var(1)

[State -1, 走る]
type = ChangeState
value = 100
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl

[State -1, バックステップ]
type = ChangeState
value = 105
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl

[State -1,ジャンプキャンセル]
Type=ChangeState
value=40
TriggerAll=StateType!=A
TriggerAll=command="holdup"
Trigger1=var(1)
Trigger1=StateNo=220 || StateNo= 6430 
trigger2= stateno=100
trigger3= stateno=1275 && var(1) && animelemtime(7)>=0
trigger4=stateno= 1305 && var(1) && !moveguarded

;Magnetic Parry
[State -1, Super Armor]
type = ChangeState
value = 750
triggerall = command = "z"
triggerall = command = "holdfwd"
triggerall= statetype !=A
trigger1 = ctrl


;==============================================================================
; 特殊技
;==============================================================================
;------------------------------------------------------------------------------
;--------------------------------------------------------------------------
;---------------------------------------------------------------------------
[State -1, Go on wall]
type = ChangeState
value = 930+ifelse(statetype = A,3,0)
TriggerAll = Var(59) <= 0
triggerall = command = "z"
triggerall = command = "holdback"
triggerall = movetype != H
triggerall = var(8) = 0
triggerall=power>199
trigger1 = ctrl
trigger2 = Var(2) >1
trigger3=stateno=934

[State -1, Go on wall forward]
type = ChangeState
value = 934;+ifelse(statetype = A,3,0)
TriggerAll = Var(59) <= 0
triggerall = command = "z"
triggerall = command = "holdfwd"
triggerall = movetype != H
triggerall=var(9)<3
triggerall=power>199
trigger1 = var(8) = 0
trigger1 = ctrl
trigger1=statetype=A
trigger2 = stateno=931
trigger3=stateno=930
trigger4=stateno=933

[State -1, Fall]
type = ChangeState
value = 939
TriggerAll = Var(59) <= 0
trigger1 = 0;command = "y"
trigger2 = command = "x"
trigger3 = command = "y"
;triggerall = command != "holdfwd"
;triggerall = command != "holdback"
;triggerall = command = "holddown"
triggerall = movetype != H
;trigger1 = var(8) = 0
triggerall = stateno=[930,938]
triggerall=time>=10
;trigger2 = stateno=931



;--------------------------------------------------------------------------

;Spot Dodge
[State -1, 回避]
type = ChangeState
value = 850
triggerall = command = "y"
triggerall=command!="holdfwd"
triggerall=command!="holdback"
triggerall = statetype != A
trigger1 = ctrl 
trigger2=stateno=100

;Roll
[State -1, 前転]
type = ChangeState
value = 860
triggerall = command = "y"
triggerall = statetype != A
triggerall = command = "holdback" || command = "holdfwd"
trigger1 = ctrl 
trigger2=stateno=100



;Throw
;[State -1, カンフースルー];投げ技
;type = null;ChangeState
;value = 800
;triggerall = command = "x"
;triggerall = statetype = S
;triggerall = ctrl
;triggerall = stateno != 100
;trigger1 = command = "holdfwd"
;trigger1 = p2bodydist X < 3
;trigger1 = (p2statetype = S) || (p2statetype = C)
;trigger1 = p2movetype != H
;trigger2 = command = "holdback"
;trigger2 = p2bodydist X < 5
;trigger2 = (p2statetype = S) || (p2statetype = C)
;trigger2 = p2movetype != H

;------------------------------------------------------------------------------
;Grab
[State -1, Throw]
type = ChangeState
value = 800
triggerall = command = "x"
triggerall = statetype != A
triggerall = ctrl || stateno=100
trigger1 = command = "holdfwd"
trigger2 = command = "holdback"
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;Burst
[State -1];くらい抜け
type = ChangeState
value = ifelse(statetype !=A,730,740)
TriggerAll = Alive
triggerall = command = "Burst"
triggerall = MoveType = H 
triggerall = var(14) = 0
trigger1 = stateno = 5000 && time > 0
trigger2 = stateno = 5010 && time > 0
trigger3 = stateno = 5020 && time > 0
trigger4 = stateno = 5070 && time > 0
trigger5 = stateno != 5000 && stateno != 5010 && stateno != 5020 && stateno != 5070
trigger5 = stateno = [5001,5099] 

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------

;Charge
[State -1, ゲージ溜め];ちょっとこ丸が追加した技
type = ChangeState
value = 700
	TriggerAll = StateType != A
	triggerall = (command = "hold_a" && command = "hold_c") && !(command =  "holdback" || command = "holdfwd")
	TriggerAll=Power<PowerMax
	Trigger1=Ctrl


;==============================================================================
; 通常攻撃技
;==============================================================================
;------------------------------------------------------------------------------

[State -1, しゃがみ弱パンチ]
type = ChangeState
value = 400
triggerall = command = "a"
triggerall = command = "holddown"
triggerall = statetype !=A
trigger1 = ctrl
trigger2 = stateno = 400 && var(1)
trigger3=stateno=100

[State -1, しゃがみ弱キック]
type = ChangeState
value = 430
triggerall = command = "b"
triggerall = command = "holddown"
triggerall = statetype !=A
trigger1 = ctrl
trigger2 = stateno = 400 && var(1)
trigger3=stateno=100

[State -1, しゃがみ強キック]
type = ChangeState
value = 440
triggerall = command = "c"
triggerall = command = "holddown"
triggerall = statetype !=A
trigger1 = ctrl
trigger2 = stateno = 400 && var(1)
trigger3 = stateno = 430 && var(1)
trigger4=stateno=100

;------------------------------------------------------------------------------

;Slide
[State -1, スライディング]
type = ChangeState
value = 370
triggerall = statetype != A
triggerall = command = "c"
trigger1 = stateno = 100

[State -1, 立ち弱パンチ]
type = ChangeState
value = 200
triggerall = command = "a"
triggerall = command != "holddown"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = StateNo = 200 && (var(1) || animelemtime(4)>=0)
trigger3=stateno=100

[State -1, 立ち弱キック]
type = ChangeState
value = 230
triggerall = command = "b"
triggerall = command != "holddown"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = StateNo = 200 && var(1)
trigger3=stateno=100


[State -1, 立ち強キック]
type = ChangeState
value = 240
triggerall = command = "c"
triggerall = command != "holddown"
triggerall = statetype !=A
trigger1 = ctrl
Trigger2 = StateNo = 200 && var(1)
trigger3=0;stateno=100
Trigger4 = StateNo = 230 && var(1)

;------------------------------------------------------------------------------

[State -1, 挑発]
type = ChangeState
value = 195
triggerall = command = "start"
trigger1 = statetype != A
trigger1 = ctrl


;------------------------------------------------------------------------------

[State -1, ジャンプ弱パンチ]
type = ChangeState
value = 600
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = ctrl

[State -1, ジャンプ強パンチ]
type = ChangeState
value = 610
triggerall = command = "b"
trigger1 = statetype = A
trigger1 = ctrl
Trigger2 = stateno=600 & var(1)

[State -1, ジャンプ弱キック]
type = ChangeState
value = 640
triggerall = command = "c"
triggerall = command != "holddown"
trigger1 = statetype = A
trigger1 = ctrl
Trigger2 = stateno=600 & var(1)
Trigger3 = stateno=610 & var(1)

[State -1, 叩きつけ]
type = ChangeState
value = 680
triggerall = command = "c"
triggerall = command = "holddown"
trigger1 = statetype = A
trigger1 = ctrl
Trigger2 = stateno=600 & var(1)
Trigger3 = stateno=610 & var(1)
Trigger4 = stateno=640 & var(1)


;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
