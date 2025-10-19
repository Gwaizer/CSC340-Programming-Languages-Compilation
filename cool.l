%option noyywrap
%{
#include "cool.tab.h"
%}
WS        [ \t\r\f\v]+
DIGIT     [0-9]+
TYPEID    [A-Z][A-Za-z0-9_]*
OBJECTID  [a-z][A-Za-z0-9_]*
STR       \"([^\\\"\n]|\\.)*\"
%%
{WS}                          ;
"--".*                        ;
"class"                       return CLASS;
"else"                        return ELSE;
"fi"                          return FI;
"if"                          return IF;
"in"                          return IN;
"inherits"                    return INHERITS;
"isvoid"                      return ISVOID;
"let"                         return LET;
"loop"                        return LOOP;
"pool"                        return POOL;
"then"                        return THEN;
"while"                       return WHILE;
"case"                        return CASE;
"esac"                        return ESAC;
"of"                          return OF;
"new"                         return NEW;
"not"                         return NOT;
"self"                        return SELF;
"SELF_TYPE"                   return SELF_TYPE;
"true"                        return TRUE;
"false"                       return FALSE;
"<-"                          return ASSIGN;
"=>"                          return DARROW;
"<="                          return LE;
{DIGIT}                       return INT_CONST;
{STR}                         return STR_CONST;
{TYPEID}                      return TYPEID;
{OBJECTID}                    return OBJECTID;
[+\-*/~<.=,;:(){}@]           return yytext[0];
\n                            ;
.                             return yytext[0];
%%