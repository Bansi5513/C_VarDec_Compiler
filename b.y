%{
#include <stdio.h>
int yylex(void);
void yyerror(char *);
extern FILE *yyin;
extern FILE *yyout;
%}
%union{
char *str;
int num_int;
float num_float;
}
%token <num_int> INTEGER
%token <num_float> FLOAT
%token <str> varName
%token INTtype
%token FLOATtype
%token end
%%
S: S E ';''\n' {fprintf(yyout, ";\n");}
| ;
E: INTtype T ;
|  FLOATtype G ;
|  end {fprintf(yyout, "\n------ END ------"); return 0;}
T: N {fprintf(yyout, ", DW ");}
|  N '=' {fprintf(yyout, ", DW ");} I X 
G: N {fprintf(yyout, ", DD ");}
|  N '=' {fprintf(yyout, ", DD ");} F Y 
X: ',' {fprintf(yyout, ";\n");} T ;
| ;
Y: ',' {fprintf(yyout, ";\n");} G ;
| ;
I: INTEGER {fprintf(yyout, "%d ", $1);}
F: FLOAT {fprintf(yyout, "%.4f ", $1);}
N: varName {fprintf(yyout, "%s ", $1);}
%%
void yyerror(char *s){
fprintf(stderr, "%s\n", s);
}
int main(){
yyin = fopen("input.txt","r");
yyout = fopen("output.txt","w");
yyparse();
return 0;
}