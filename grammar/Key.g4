grammar Key;

key : Keyboard? ;
keyboard_key : N1 | Shift1 | ;

//#TODO: Multimedia keys
//#TODO: Virtual key code and scan code

Keyboard : [Kk]('eyboard' | 'bd') | '键盘' ;
fragment Key : ([Kk]'ey' | '键')? EOF ;

N1 : '1' Key ;
Shift1 : '!' Key ;
N2 : '2' Key ;
Shift2 : '@' Key ;
N3 : '3' Key ;
Shift3 : '#' Key ;
N4 : '4' Key ;
Shift4 : '$' Key ;
N5 : '5' Key ;
Shift5 : '%' Key ;
N6 : '6' Key ;
Shift6 : '^' Key ;
N7 : '7' Key ;
Shift7 : '&' Key ;
N8 : '8' Key ;
Shift8 : '*' Key ;
N9 : '9' Key ;
Shift9 : '(' Key ;
N0 : '0' Key ;
Shift0 : ')' Key ;

A : [Aa] Key ;
B : [Bb] Key ;
C : [Cc] Key ;
D : [Dd] Key ;
E : [Ee] Key ;
F : [Ff] Key ;
G : [Gg] Key ;
H : [Hh] Key ;
I : [Ii] Key ;
J : [Jj] Key ;
K : [Kk] Key ;
L : [Ll] Key ;
M : [Mm] Key ;
N : [Nn] Key ;
O : [Oo] Key ;
P : [Pp] Key ;
Q : [Qq] Key ;
R : [Rr] Key ;
S : [Ss] Key ;
T : [Tt] Key ;
U : [Uu] Key ;
V : [Vv] Key ;
W : [Ww] Key ;
X : [Xx] Key ;
Y : [Yy] Key ;
Z : [Zz] Key ;

Grave : '`' Key ;
ShiftGrave : '~' Key ;

fragment HyphenSuffix : ([Ss]'ubtract' | '减') Key ;
Hyphen : HyphenSuffix ;
ShiftHyphen : '_' Key ;

Equal : '=' Key ;
fragment AdditionSuffix : ('+' | [Aa]'dd''ition'?) Key ;
ShiftEqual : AdditionSuffix ;

fragment Numpad : ([Nn]'um''ber'?([Pp]'ad')? | '小键盘') ;
NumpadLock : Numpad ([Ll]'ock' | '锁') Key ;
Numpad0 : Numpad (N0 | InsertSuffix) ;
Numpad1 : Numpad (N1 | EndSuffix) ;
Numpad2 : Numpad (N2 | DownSuffix) ;
Numpad3 : Numpad (N3 | PageDownSuffix) ;
Numpad4 : Numpad (N4 | LeftSuffix) ;
Numpad5 : Numpad (N5 | [Cc]'lear' Key) ;
Numpad6 : Numpad (N6 | RightSuffix) ;
Numpad7 : Numpad (N7 | HomeSuffix) ;
Numpad8 : Numpad (N8 | UpSuffix) ;
Numpad9 : Numpad (N9 | PageUpSuffix) ;
NumpadDot : Numpad (DotSuffix | DeleteSuffix) ;
NumpadAdd : Numpad AdditionSuffix ;
NumpadSub : Numpad HyphenSuffix ;
NumpadMul : Numpad ('*' | [Mm]'ul'('t''iply'?)?) ;
NumpadDiv : Numpad ('/' | [Dd]'iv''ison'?) ;
NumpadEnter : Numpad EnterSuffix ;

fragment DotSuffix : ('.' | [Dd]'ot' | '小数点' | '句'[点号]) Key ;
Dot : DotSuffix ;

Ctrl : ([Cc]('trl' | 'ontrol') | '控制') Key ;
Shift : ([Ss]'hift' | '转换') Key ;
Alt : [Aa]'lt' Key ;
Win : [Ww]'in' Key ;
LCtrl : LPrefix Ctrl ;
RCtrl : LPrefix Ctrl ;
LShift : LPrefix Shift ;
RShift : LPrefix Shift ;
LAlt : LPrefix Alt ;
RAlt : LPrefix Alt ;
LWin : LPrefix Win ;
RWin : LPrefix Win ;

CapsLock : ([Cc]'aps'[Ll]'ock' | '大写''锁定'?) Key ;
Space : [Ss]'pace' Key ;
Tab : [Tt]'ab' Key ;
fragment EnterSuffix : ([Ee]'nter' | '回车') Key ;
Enter : EnterSuffix ;
Escape : ([Ee]'scape' | [Ee]'sc' | '返回') Key ;
Backspace : ([Bb]'ack'?[Ss]'pace'? | [Bb]'ack'[Ss]'p' | '退格') Key ;

ScrollLock : ([Ss]'croll'[Ll]'ock' | '滚动锁定') Key ;

fragment InsertSuffix : ([Ii]'ns''ert'? | '插入') Key ;
Insert : InsertSuffix ;
fragment DeleteSuffix : ([Dd]'el''ete'? | '删除') Key ;
Delete : DeleteSuffix ;

fragment HomeSuffix : [Hh]'ome' Key ;
fragment EndSuffix : [Ee]'nd' Key ;
Home : HomeSuffix ;
End : EndSuffix ;

Up : UpSuffix ;
Down : DownSuffix ;
Left : LeftSuffix ;
Right : RightSuffix ;

fragment Page : [Pp]'age' Key ;
fragment PageDownSuffix : Page Down Key ;
fragment PageUpSuffix : Page Up Key ;
PageDown : PageDownSuffix ;
PageUp : PageUpSuffix ;

AppsKey : ([Aa]'pps' | [Mm]'enu' | '菜单') Key ;
PrintScreen : ([Pp]'rint'[Ss]'creen' | '截屏') Key ;
CtrlPause : [Cc]'trl'[Pp]'ause' Key ;
Pause : ([Pp]'ause' | '暂停') Key ;
Help : ([Hh]'elp' | '帮助') Key ;
Sleep : ([Ss]'leep' | '睡眠') Key ;

fragment FPrefix : [Ff] ;
F1 : FPrefix '1' Key ;
F2 : FPrefix '2' Key ;
F3 : FPrefix '3' Key ;
F4 : FPrefix '4' Key ;
F5 : FPrefix '5' Key ;
F6 : FPrefix '6' Key ;
F7 : FPrefix '7' Key ;
F8 : FPrefix '8' Key ;
F9 : FPrefix '9' Key ;
F10 : FPrefix '10' Key ;
F11 : FPrefix '11' Key ;
F12 : FPrefix '12' Key ;
F13 : FPrefix '13' Key ;
F14 : FPrefix '14' Key ;
F15 : FPrefix '15' Key ;
F16 : FPrefix '16' Key ;
F17 : FPrefix '17' Key ;
F18 : FPrefix '18' Key ;
F19 : FPrefix '19' Key ;
F20 : FPrefix '20' Key ;
F21 : FPrefix '21' Key ;
F22 : FPrefix '22' Key ;
F23 : FPrefix '23' Key ;
F24 : FPrefix '24' Key ;


fragment Mouse : [Mm]'ouse' | '鼠标' ;

fragment Button : [Bb]'utton' | [Bb]'tn' | '键' ;
LButton : Mouse? LPrefix Button ;
RButton : Mouse? RPrefix Button ;
MButton : Mouse? MPrefix Button ;

fragment XPrefix : [Xx] | '侧' ;
XButton1 : Mouse? XPrefix Button '1' ;
XButton2 : Mouse? XPrefix Button '2' ;

fragment Wheel : [Ww]'heel' | '滚轮' ;
WheelDown : Mouse? Wheel DownSuffix ;
WheelUp : Mouse? Wheel DownSuffix ;
WheelLeft : Mouse? Wheel DownSuffix ;
WheelRight : Mouse? Wheel DownSuffix ;


fragment LPrefix : [Ll]'eft'? | '左' ;
fragment RPrefix : [Rr]'ight'? | '右' ;
fragment MPrefix : [Mm]'iddle'? | '中'  ;

fragment UpSuffix : ([Uu]'p' | '向'?'上') Key ;
fragment DownSuffix : ([Dd]'own' | '向'?'下') Key ;
fragment LeftSuffix : ([Ll]'eft' | '向'?'左') Key ;
fragment RightSuffix : ([Rr]'ight' | '向'?'右') Key ;