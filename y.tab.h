/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    ID = 258,
    CID = 259,
    TIP_VAR = 260,
    TIP_CONST = 261,
    TIP_FUNCTIE = 262,
    TIP_VAR_BOOL = 263,
    TIP_VAR_STRING = 264,
    TIP_CONST_BOOL = 265,
    TIP_CONST_STRING = 266,
    RETURN = 267,
    NUME_STRUCT = 268,
    STRUCT = 269,
    REF = 270,
    IF = 271,
    WHILE = 272,
    FOR = 273,
    NR = 274,
    BOOL = 275,
    ASSIGN = 276,
    AND = 277,
    OR = 278,
    NOT = 279,
    INC = 280,
    DEC = 281,
    COMP = 282,
    STRING = 283,
    PRINT = 284,
    COMMENT = 285,
    BGIN = 286,
    END = 287,
    NO_ELSE = 288,
    ELSE = 289
  };
#endif
/* Tokens.  */
#define ID 258
#define CID 259
#define TIP_VAR 260
#define TIP_CONST 261
#define TIP_FUNCTIE 262
#define TIP_VAR_BOOL 263
#define TIP_VAR_STRING 264
#define TIP_CONST_BOOL 265
#define TIP_CONST_STRING 266
#define RETURN 267
#define NUME_STRUCT 268
#define STRUCT 269
#define REF 270
#define IF 271
#define WHILE 272
#define FOR 273
#define NR 274
#define BOOL 275
#define ASSIGN 276
#define AND 277
#define OR 278
#define NOT 279
#define INC 280
#define DEC 281
#define COMP 282
#define STRING 283
#define PRINT 284
#define COMMENT 285
#define BGIN 286
#define END 287
#define NO_ELSE 288
#define ELSE 289

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
