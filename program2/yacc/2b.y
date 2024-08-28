%{
#include <stdio.h>
%}

%token NUM
%left '+''-'
%left '*''/'

%%
S:E {printf("%d",$$);}
;
E: E '+' E {$$=$1+$3;}
|E '-' E {$$=$1-$3;}
|E '*' E {$$=$1*$3;}
|E '/' E {$$=$1/$3;}
|NUM {$$=$1;}
|"-"NUM {$$=-$2;}
;
%%

int main()
{
printf("Enter expression:");
yyparse();
return 0;
}

int yyerror()
{
printf("error");
return 0;
}
