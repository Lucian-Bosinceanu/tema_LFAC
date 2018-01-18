%{
#include <stdio.h>
#include "y.tab.h"
%}

%%
 /*variable declarations, constant declarations (different kind of constants) , function declarations and definitions*/
 
"cred ca "("int"|"float") {return TIP_VAR;}
"cred ca bool" {return TIP_VAR_BOOL;}
"mereu "("int"|"float") {return TIP_CONST;}
"mereu bool" {return TIP_CONST_BOOL;}
"o functie "("int"|"float"|"bool"|"string"|"void") {return TIP_FUNCTIE;}

"intoarce" {return RETURN;}

 /*user defined data types (similar to classes in object orientated languages, but with your ownsyntax); provide specific syntax for working with these types*/

_[a-zA-Z][_a-zA-Z0-9]* {return NUME_STRUCT;}
"un struct " {return STRUCT;}
"~>" {return REF;}
 
 /*array types ->> YACC*/

 /*control statements (if, for, while, etc.), assignment statements*/

"daca" {return IF;}
"altfel" {return ELSE;}
"cat timp" {return WHILE;}
"pentru" {return FOR;}

 /*arithmetic and boolean expressions with complex operands*/

-?([1-9][0-9]*|0)(\.[0-9]+)? {return NR;}
("adivarat"|"fals") {return BOOL;} 

"=?" {return ASSIGN;}

"&?&" {return AND;}
"|?|" {return OR;}
"?!" {return NOT;}

"+?+" {return INC;}
"-?-" {return DEC;}

">?"|"<?"|"=?="|"<?="|">?="|"!?=" {return COMP;}

 /*operations with string types*/

"cred ca string" {return TIP_VAR_STRING;}
"mereu string" {return TIP_CONST_STRING;}
\".*\" {return STRING;}

 /*function calls which can have as parameters: expressions, other function calls, identifiers, constants,etc. ->> YAC*/
 /*A predefined function called print which has a parameter of an integer type*/

"????" {return PRINT;}

\/\/\?.+/\n {return COMMENT;}
"aa..." {return BGIN;}
"...da" {return END;}


[A-Z]+ {return CID;}
[a-zA-Z][_a-zA-Z0-9]* {return ID;}

[ \t] ;
\n {yylineno++;}
. {return yytext[0];}

 
