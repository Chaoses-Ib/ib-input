parser grammar InputParser;

options { tokenVocab=InputLexer; }

expr        : expr_branch (OR expr_branch)* ;
expr_branch : block* ;
block       : key_event_expr
            | key_event_block
            | key_block
            | when_block
            | string_block
            | text_block
            | RELEASE_ANY
            | BREAK
            ;


// Key event block
key_event_block     : KEY_EVENT_OPEN key_event_expr KEY_CLOSE ;
key_event_expr      : key_state_specifier? KEY key_event_type? time_block?;
key_state_specifier : (KEY KEY_EVENT_PLUS)+ ;
key_event_type      : KEY_EVENT_DOWN | KEY_EVENT_UP ;


// Time block (only used in key event block)
time_block          : TIME_OPEN time_stat TIME_CLOSE ;
time_stat           : TIME_ID TIME_ASSIGN time_expr                 # assign
                    | time_expr op=(TIME_LT | TIME_GT) time_expr    # compare
                    ;
time_expr           : time_value op=(TIME_MUL | TIME_DIV) time_value
                    | time_value op=(TIME_PLUS | TIME_MINUS) time_value
                    | time_value ;
time_value          : TIME_NOW | TIME_ID | TIME_VALUE ;


// Key block
key_block   : KEY KEY_OPEN expr KEY_CLOSE ;


// When block
when_block  : WHEN_OPEN when_expr WHEN_CLOSE ;
when_expr   : WHEN_NOT when_expr
            | when_expr WHEN_AND when_expr
            | when_expr WHEN_OR when_expr
            | WHEN_LPAREN when_expr WHEN_RPAREN
            | WHEN_ID
            ;


// String block
string_block : STRING_OPEN STRING_EXPR STRING_CLOSE ;


// Text block
text_block   : TEXT_OPEN TEXT_EXPR TEXT_CLOSE ;