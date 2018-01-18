%{
#include <stdio.h>
extern FILE* yyin;
extern char* yytext;
extern int yylineno;
%}

%token ID CID TIP_VAR TIP_CONST TIP_FUNCTIE TIP_VAR_BOOL TIP_VAR_STRING TIP_CONST_BOOL TIP_CONST_STRING RETURN
       NUME_STRUCT STRUCT REF
       IF WHILE FOR
       NR BOOL ASSIGN AND OR NOT INC DEC COMP
       STRING
       PRINT COMMENT BGIN END
%start progr

%left '+' '-'
%left '*' '/' '%'
%nonassoc NO_ELSE 
%nonassoc ELSE 

%%
progr : declaratii main {printf("program corect sintactic\n");}
      ;

declaratii  : declaratie '?'
	        | declaratii declaratie '?'
            | COMMENT
	      ;

declaratie  : non_funct_decl
            | funct_decl
            | struct_decl
            ;

non_funct_decl: var_decl
              | const_decl
              ;

non_funct_decl_list: non_funct_decl '?'
                   | non_funct_decl_list non_funct_decl '?'

var_decl: TIP_VAR ID
        | TIP_VAR ID '[' NR ']'
        | TIP_VAR ID ASSIGN NR
        | TIP_VAR_BOOL ID
        | TIP_VAR_BOOL ID '[' NR ']'
        | TIP_VAR_BOOL ID ASSIGN BOOL
        | TIP_VAR_STRING ID ASSIGN STRING
        | NUME_STRUCT ID
        | NUME_STRUCT ID '[' NR ']'
        ;

const_decl: TIP_CONST CID NR
          | TIP_CONST_BOOL CID BOOL
          | TIP_CONST_STRING CID STRING
          ;

funct_decl: TIP_FUNCTIE ID '(' lista_param ')' bloc
          | TIP_FUNCTIE ID '(' ')' bloc
          | TIP_FUNCTIE ID '(' lista_param ')'
          | TIP_FUNCTIE ID '(' ')' 
          ;

struct_decl : STRUCT NUME_STRUCT '<' non_funct_decl_list '>'
            ;

struct_member_selection : NUME_STRUCT REF ID
                        | NUME_STRUCT REF CID 
                        ;

lista_param : param
            | lista_param ',' param 
            ;
            
param : TIP_VAR ID
      | TIP_VAR_BOOL ID
      | TIP_VAR_STRING ID
      ; 
      
main : BGIN list END  
     ;

bloc : '<' list '>'
     | '<' '>'
     ; 

/* lista instructiuni */
list :  statement '?' 
     | control
     | list statement '?'
     | list control
     ;

/* instructiune */
statement: ID ASSIGN Aexp		 
         | ID ASSIGN Bexp
         | ID ASSIGN STRING
         | declaratie
         | PRINT '(' Aexp ')'
         | COMMENT
         | Aexp
         | bloc
         | apel_functie
         | RETURN Aexp
         | RETURN Bexp
         | RETURN apel_functie
         ;

control: WHILE '(' Bexp ')' bloc
       | IF '(' Bexp ')' bloc  %prec NO_ELSE
       | IF '(' Bexp ')' bloc ELSE bloc
       | FOR '(' Bexp '?' Aexp ')' bloc
       ;

/* Expresii aritmetice */
Aexp: NR
    | '(' Aexp ')'
    | ID
    | CID
    | struct_member_selection
    | ID '[' Aexp ']'
    | Aexp '+' Aexp  
    | Aexp '*' Aexp
    | Aexp '-' Aexp
    | Aexp '/' Aexp
    | Aexp '%' Aexp
    | INC ID
    | ID INC
    | DEC ID
    | ID DEC
    ;

apel_functie: ID '(' lista_apel ')'
            ;

Bexp: BOOL
    | Aexp COMP Aexp
    | Aexp COMP Bexp
    | Aexp AND Aexp
    | Aexp OR Aexp
    | Aexp AND Bexp
    | Aexp OR Bexp
    | NOT Bexp 
    | '(' Bexp ')'
    ; 
        
lista_apel : apelabil
           | lista_apel ',' apelabil
           ;

apelabil: NR
        | BOOL
        | STRING 
        | ID
        | CID
        | apel_functie
        ;

%%
int yyerror(char * s){
printf("eroare: %s la linia:%d\n",s,yylineno);
}

int main(int argc, char** argv){
yyin=fopen(argv[1],"r");
yyparse();
} 