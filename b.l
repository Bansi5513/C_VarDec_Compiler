%{
#include<stdlib.h>
#include <string.h>
void yyerror(char *);
#include"b.tab.h"
%}
%%
"end"|"END" return end;
"int" return INTtype;
"float" return FLOATtype;
[0-9]+ {
    yylval.num_int = atoi(yytext);
    return INTEGER;}
[0-9]+([.][0-9]+)? {
    yylval.num_float = atof(yytext);
    return FLOAT;}
[a-zA-Z][a-zA-Z0-9_]* {
    yylval.str  = yytext;
    return varName; 
}
[,=\n;] return *yytext;
[ \t] ;
. {yyerror("Invalid Character");}
%%
int yywrap(){
return 0;
}
