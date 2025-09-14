%defines "cool.tab.h"
%{
#include <stdio.h>
int yylex(void);
void yyerror(const char*s);
int class_count=0;
%}
%token CLASS ELSE FI IF IN INHERITS ISVOID LET LOOP POOL THEN WHILE CASE ESAC OF NEW NOT SELF SELF_TYPE TRUE FALSE TYPEID OBJECTID INT_CONST STR_CONST ASSIGN DARROW LE
%%
program: class_list ;
class_list: class_list class_def | class_def ;
class_def: CLASS TYPEID opt_inherits '{' opt_features '}' ';' { if(++class_count>13){ yyerror("too many classes"); YYABORT; } } ;
opt_inherits: INHERITS TYPEID | /* empty */ ;
opt_features: feature_list | /* empty */ ;
feature_list: feature_list ';' feature | feature ;
feature: OBJECTID ':' TYPEID
      | OBJECTID '(' ')' ':' TYPEID '{' expr '}' ;
expr: OBJECTID
    | INT_CONST
    | STR_CONST
    | TRUE
    | FALSE
    | '(' expr ')'
    | IF expr THEN expr ELSE expr FI
    | LET OBJECTID ':' TYPEID IN expr ;
%%
int main(){return yyparse();}
void yyerror(const char*s){fprintf(stderr,"%s\n",s);}