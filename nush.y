%{
#include <stdio.h>
extern FILE* yyin;
extern char* yytext;
extern int yylineno;
%}

%token ID CID TIP_VAR TIP_CONST TIP_FUNCTIE TIP_VAR_BOOL TIP_VAR_STRING TIP_CONST_BOOL TIP_CONST_STRING RETURN
       NUME_STRUCT TIP_STRUCT REF
       IF ELSE WHILE FOR
       NR BOOL ASSIGN AND OR NOT INC DEC COMP
       STRING
       PRINT COMMENT BEGIN END
%start progr

%%
progr : declaratii bloc {printf("program corect sintactic\n");}
      ;

declaratii  : declaratie '?'
	      | declaratii declaratie '?'
	      ;

declaratie  : TIP_VAR ID
            | TIP_VAR ID '[' NR ']'
            | TIP_VAR ID ASSIGN NR
            | TIP_VAR_BOOL ID
            | TIP_VAR_BOOL '[' NR ']'
            | TIP_VAR_BOOL ID ASSIGN BOOL
            | TIP_CONST CID NR
            | TIP_CONST_BOOL CID BOOL
            | TIP_VAR_STRING ID STRING
            | TIP_CONST_STRING CID STRING
            | TIP_FUNCTIE ID '(' lista_param ')'
            | TIP_FUNCTIE ID '(' ')'
            | TIP_FUNCTIE ID '(' lista_param ')' bloc
            | TIP_FUNCTIE ID '(' ')' bloc 
            ;


lista_param : param
            | lista_param ',' param 
            ;
            
param : TIP_VAR ID
      | TIP_FUNCTIE ID '(' lista_param ')'
      | TIP_FUNCTIE ID '(' ')'
      ; 
      
/* bloc */
main : BEGIN list END  
     ;

bloc : '<' list '>'
     | '<' list RETURN '>'
     ; 

/* lista instructiuni */
list :  statement '?' 
     | list statement '?'
     | control
     | list control
     ;

/* instructiune */
statement: ID ASSIGN ID
         | ID ASSIGN NR  
         | ID ASSIGN Aexp		 
         | ID ASSIGN Bexp
         | ID '(' lista_apel ')'
         | declaratie
         | PRINT '(' Aexp ')'
         | COMMENT
         ;
        
control: WHILE '(' Bexp ')' bloc
       | IF '(' Bexp ')' bloc ELSE bloc
       | FOR '(' Aexp '?' Bexp '?' Aexp ')'
       ;

/* Expresii aritmetice */
Aexp: NR
    | '(' Aexp ')'
    | Aexp '+' Aexp  
    | Aexp '*' Aexp
    | Aexp '-' Aexp
    | Aexp '/' Aexp
    | INC ID
    | ID INC
    | DEC ID
    | ID DEC
    ;

Bexp: BOOL
    | Aexp COMP Aexp
    | Bexp AND Bexp
    | Bexp OR Bexp
    | Bexp NOT Bexp
    | (Bexp)
    ; 
        
lista_apel : NR
           | lista_apel ',' NR
           ;
%%
int yyerror(char * s){
printf("eroare: %s la linia:%d\n",s,yylineno);
}

int main(int argc, char** argv){
yyin=fopen(argv[1],"r");
yyparse();
} 