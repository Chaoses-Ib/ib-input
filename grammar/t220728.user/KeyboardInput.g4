grammar KeyboardInput;
import CommonLexerRules;

keyboard_input : key_event+ ;

key_event : '{' state_prefix? key key_state? '}' ;
state_prefix : (key '+')+ ;
key_state : down | up;
down : 'd' | 'down' ;
up : 'u' | 'up' ;

key : 'a'..'z' ;