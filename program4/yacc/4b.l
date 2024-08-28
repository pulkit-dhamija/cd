%{
#include<stdio.h>
#include "y.tab.h"
%}

%%
"if" {return IF;}
[0-9]+ {return NUM;}
[a-zA-Z]+ {return IDEN;}
"\n" {return 0;}
. {return yytext[0];}
%%

int yywrap()
{
return 1;
}
