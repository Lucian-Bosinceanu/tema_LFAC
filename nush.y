%{
#include <stdio.h>
extern FILE* yyin;
extern char* yytext;
extern int yylineno;
%}

%token ID TIP_VAR TIP_CONST TIP_FUNCTIE RETURN
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
            | TIP_FUNCTIE ID '(' lista_param ')' definitie
            | TIP_FUNCTIE ID '(' ')' definitie
            ;

definitie   : bloc

lista_param : param
            | lista_param ',' param 
            ;
            
param : TIP_VAR ID
      | TIP_FUNCTIE ID '(' lista_param ')'
      | TIP_FUNCTIE ID '(' ')'
      ; 
      
/* bloc */
bloc : BEGIN list END  
     ;
     
/* lista instructiuni */
list :  statement ';' 
     | list statement ';'
     ;

/* instructiune */
statement: ID ASSIGN ID
         | ID ASSIGN NR  		 
         | ID '(' lista_apel ')'
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