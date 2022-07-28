grammar Input;

expr        : expr_branch ('|' expr_branch)? ;
expr_branch : key_event_expr
            | block*
            ;
block   : key_event_block
        | key_block
        | string_block
        | text_block
        | time_block
        | if_block
        | RESET
        | BREAK
        ;

key_event_block     : '{' key_event_expr '}' ;
key_event_expr      : key_state_specifier? key key_state? ;
key_state_specifier : (key '+')+ ;
key_state           : ('d' | 'down')  # down
                    | ('u' | 'up')    # up
                    ;
            
key_block : key '{' expr  '}' ;

string_block : STRING_BLOCK ;
text_block : TEXT_BLOCK ;

time_block : TIME_BLOCK ;

if_block : IF_BLOCK ;

// UpperCase
key : KEY ;

// lexer

STRING_BLOCK : 'str' WS '{' .*? '}' ;
TEXT_BLOCK : 'text' WS '{' .*? '}' ;

TIME_BLOCK : 't' WS '{' .*? '}' ;

IF_BLOCK : 'if' WS '{' .*? '}' ;

BREAK : '^' ;

RESET : ',' ;

KEY : [A-Z0-9][A-Za-z0-9]* ;

/*
KEY : KEYBOARD_KEY | MOUSE_KEY ;

KEYBOARD_KEY: [0-9A-Z]
            | KEYBOARD_LR? ('Ctrl' | 'Shift' | 'Alt' | 'Win')
            | 'Space' | 'Tab' | 'Enter' | 'Backspace'
            | ('Delete' | 'Del') | ('Insert' | 'Ins')
            | 'CapsLock' | 'ScrollLock'
            | ('Escape' | 'Esc')
            | 'Home' | 'End' | 'PageUp' | 'PageDown'
            | 'Up' | 'Down' | 'Left' | 'Right'
            | ('Delete' | 'Del')
            | 'NumLock' | 'Numpad' ([0-9] | 'Add' | 'Sub' | 'Mul' | 'Div' | 'Dot' | 'Enter')
            | 'F' ('1-9' | '1'[0-9] | '2'[0-4])
            ;

KEYBOARD_LR : 'L' | 'R' ;

MOUSE_KEY   : ('LButton' | 'LBtn') | ('RButton' | 'RBtn') | ('MButton' | 'MBtn')
            | ('XButton1' | 'XBtn1') | ('XButton2' | 'XBtn2')
            | 'WheelDown' | 'WheelUp'
            | 'WheelLeft' | 'WheelRight'
            ;
*/

WS : [ \t\r\n]+ -> skip ;