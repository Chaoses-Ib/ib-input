<!--t220727~28-->
## KeyboardInput
按键设备的事件信息包括 (key, key_state, time, device)
最关键的是如何强大又简洁地描述时间关联
我们将每条语句的时间原点记为 0
需要一种定义和引用时间点的方法
t 引用当前按键的时间
定义时间点的话，t.a_down = t
时间默认以毫秒为单位
考虑到 >= 和 > 几乎没有区别，比较操作符只提供 > 和 <

按键名区分大小写，但提供修正大小写的工具

Ctrl+Alt+A
Ctrl d
Alt d
A d

A u
Alt u
Ctrl u

Ctrl+Alt+A 既可以解释为三次按下，也可以解释为按下A时其它键的状态也被按下，但按键事件的描述力比状态更强，为了减少语法冗余，我们只使用按键事件。
不过这样就会导致可以出现 Ctrl+Alt+A+D。
啊，但是状态允许乱序按下。

语句开头有个隐式的键盘重置点。

双击A:
A down
A up
A down t>200

完整的上下文识别太过复杂，很难加入语法，不过加一个简单的标识符还是没问题的。比如
{A down global}
但这就需要与 t 区分开来了
但上下文几乎不会用于单独的一个键，没有必要放在按键事件内
Ctrl+Alt+A if global
或者与 VSC 相符的 when

key set
0-9

hotstring 扩展

扩展按键

对象  参数 时间
Move ()
模式匹配

? 条件预检测，优化性能

Text mode
(text: )

Ctrl {
    Shift {
        A {}
    }
}
Ctrl { Shift { A {} } }
Ctrl { Shift { A {
Ctrl { Shift { A { ^ } } }
利用“按下的键只能按下一次，且必然弹起”进行简化

Ctrl d Shift d A d
Ctrl < Shift < A<> > >

\text { abcd }
!text { abcd }
%text { abcd }
既是热字符串，也是文本输出？还是 string 好些
{text:A}

A{}A{t<200^}
\r2{A}
{2:A}
{A:2}

\noreset

Python，语法→事件组合
AHK翻译器，最好是js
PyScript？

i18n，关键字双向翻译器
`zh-Hans{}`，同时兼容英文，便于隐式添加

| 分支
Ctrl+(A|B)
Ctrl+(A|Shift+B)

Ctrl+Alt+A 等价于
(Ctrl { Alt { A) | (Alt { Ctrl { A)
(Ctrl { Alt { A ^ } }) | (Alt { Ctrl { A ^ } })
(Ctrl { Alt { | Alt { Ctrl {) A {

Ctrl+K, Ctrl+F
,  wair for reset


A d
B d
A u
B u
嵌套层级无法表达这种操作
既然如此，那不如就强制要求括号配对吧
嵌套层级究竟增强了什么的表达能力？
比如 Ctrl{Alt 和 Alt Ctrl
大写开头为键，小写开头为宏？还是不要吧。

等一下，既然有state_prefix的话，那空prefix岂不是意味着没有其它键？
改成specifier吧

A{}A{t{dbclick*3/2 < 300}^}

单词语可省略 {}？
“t >200”太怪了，还是算了。

A{^} if{global}
还是 A{if{global} ^} ？不方便调整条件
那不如修改 ^ 的语义，改为跳出所有层级？

`antlr4 ..\..\Input.g4 -o .\out\test; javac *.java; grun Input expr -gui`

Event matching grammar
- [ ] Python, C# pattern matching

numlock block

重置点 `,` 的语义存在缺陷
如果在开头添加了隐式重置点，`Ctrl+A` 就会无法匹配
更严重的是，即使不添加重置点，`Ctrl+A, Ctrl+B` 也会无法匹配
需要修改 key_event_block 的语义，允许按下任意修饰键

AHK、Gradle、nftables

`python{}`
除了为已有功能定义热键，还可以自定义功能？