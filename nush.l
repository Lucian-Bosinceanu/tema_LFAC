%{
#include <stdio.h>
#include "y.tab.h"
%}

%%
 /*variable declarations, constant declarations (different kind of constants) , function declarations and definitions*/
 
"cred ca "("int"|"float"|"bool"|"string") {return TIP_VAR;}
"mereu "("int"|"float"|"bool"|"string") {return TIP_CONST;}
"o functie "("int"|"float"|"bool"|"string"|"void") {return TIP_FUNCTIE;}
[a-zA-Z][_a-zA-Z0-9]* {return ID;} 

 /*user defined data types (similar to classes in object orientated languages, but with your ownsyntax); provide specific syntax for working with these types*/

_[a-zA-Z][_a-zA-Z0-9]* {return NUME_STRUCT;}
"un struct " {return TIP_STRUCT;}
"~>" {return REF;}
 
 /*array types ->> YACC*/

 /*control statements (if, for, while, etc.), assignment statements*/

"daca" {return IF;}
"altfel" {return ELSE;}
"cat timp" {return WHILE;}
"pentru" {return FOR;}

 /*arithmetic and boolean expressions with complex operands*/

-?([1-9][0-9]*|0)(\.[0-9]+)? {return NR;}
"adivarat"|"fals" {return BOOL;} 

"=?" {return ASSIGN;}

"&?&" {return AND;}
"|?|" {return OR;}
"?!" {return NOT;}

"+?+" {return INC;}
"-?-" {return DEC;}

">?"|"<?"|"=?="|"<?="|">?="|"!?=" {return COMP;}

 /*operations with string types*/

\".*\" {return STRING;}

 /*function calls which can have as parameters: expressions, other function calls, identifiers, constants,etc. ->> YAC*/
 /*A predefined function called print which has a parameter of an integer type*/

"????" {return PRINT;}

\/\/\?.+ {return COMMENT;}
"aa..." {return BEGIN;}
"...da" {return END;}

[ \t] ;
\n {yylineno++;}
. {return yytext[0];}

 
