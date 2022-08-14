lexer grammar InputLexer;

DEFAULT_KEY : SINGLE_CHAR_KEY -> type(KEY) ;

DEFAULT_FALLBACK : {_input.seek(0);} -> skip, mode(BLOCK_OR_KEY_EVENT_EXPR) ;

DEFAULT_WS : WS_FRAGMENT -> skip ;


mode BLOCK_OR_KEY_EVENT_EXPR;
KEY_EVENT_OPEN : '{' -> mode(KEY_EVENT_KEY) ;
WHEN_OPEN : ('when' | '当') WS? '{' -> mode(WHEN_BLOCK) ;
STRING_OPEN : ('str' | '串') WS? '{' -> mode(STRING_BLOCK) ;
TEXT_OPEN : ('text' | '文本') WS? '{' -> mode(TEXT_BLOCK) ;

OR : '|' | 'or' | '或' ;
RELEASE_ANY : ',' ;
BREAK : '^' ;

LIMITED_KEY : ([0-9] | [\p{XID_Start}][\p{XID_Continue}]*) -> type(KEY), mode(KEY_BLOCK_OR_KEY_EVENT_EXPR) ;

KEY_CLOSE : '}' ;

WS : WS_FRAGMENT -> skip ;


mode KEY_BLOCK_OR_KEY_EVENT_EXPR;
KEY_OPEN : '{' -> mode(BLOCK_OR_KEY_EVENT_EXPR) ;

KEY_EVENT_PLUS : '+' -> mode(KEY_EVENT_KEY) ;

KEY_EVENT_DOWN : ('down' | '按下') ;
KEY_EVENT_UP   : ('up' | '弹起') ;

TIME_OPEN : 't' {_input.seek(_input.index()-1);} -> mode(TIME_BLOCK) ;

KEY_BLOCK_OR_KEY_EVENT_EXPR_FALLBACK : -> skip, mode(BLOCK_OR_KEY_EVENT_EXPR) ;

KEY_BLOCK_OR_KEY_EVENT_EXPR_WS : WS_FRAGMENT -> skip ;


mode KEY_EVENT_KEY;
KEY : (SINGLE_CHAR_KEY | [\p{XID_Start}][\p{XID_Continue}]*) -> mode(KEY_BLOCK_OR_KEY_EVENT_EXPR) ;
fragment SINGLE_CHAR_KEY : [A-Z0-9`~!@#$%^&*()\-=+[\]{};:'"\\|,<.>/?] ;

KEY_EVENT_KEY_WS : WS_FRAGMENT -> skip ;


mode TIME_BLOCK;
TIME_ID : 't' [0-9]+ ;
TIME_NOW : 't' ;
TIME_VALUE : [0-9]+ ('.' [0-9]+)? ;

TIME_LT : '<' ;
TIME_GT : '>' ;
TIME_ASSIGN : '=' ;
TIME_PLUS : '+' ;
TIME_MINUS : '-' ;
TIME_MUL : '*' ;
TIME_DIV : '/' ;

//TIME_CLOSE : . {_input.seek(_input.index()-1);} -> mode(BLOCK_OR_KEY_EVENT_EXPR) ;
TIME_CLOSE : -> mode(BLOCK_OR_KEY_EVENT_EXPR) ;


mode WHEN_BLOCK;

WHEN_NOT : '!' | 'not' | '非' ;
WHEN_AND : '&&' | 'and' | '且' ;
WHEN_OR : '||' | 'or' | '或' ;
WHEN_LPAREN : '(' ;
WHEN_RPAREN : ')' ;

WHEN_ID : [\p{XID_Start}][\p{XID_Continue}]* ;

WHEN_CLOSE : '}' -> mode(BLOCK_OR_KEY_EVENT_EXPR) ;

WHEN_WS : WS_FRAGMENT -> skip ;


mode STRING_BLOCK;
STRING_EXPR : ~[}]+ ;
STRING_CLOSE : '}' -> mode(BLOCK_OR_KEY_EVENT_EXPR) ;

mode TEXT_BLOCK;
TEXT_EXPR : ~[}]+ ;
TEXT_CLOSE : '}' -> mode(BLOCK_OR_KEY_EVENT_EXPR) ;


fragment WS_FRAGMENT : [ \t\r\n]+ ;