%{
#include<stdio.h>
#include "y.tab.h"
%}

%%
"int"      { return INT; }
"float"    { return FLOAT; }
"char"     { return CHAR; }
"double"   { return DOUBLE; }
[0-9]+ {return NUM;}
[a-zA-Z_][a-zA-Z0-9_]* {return IDEN;}
[ \t]    { /* ignore whitespace */; }
"$" {return 0;}
. {return yytext[0];}

%%

int yywrap()
{
return 1;
}
