%{
#include<stdio.h>
%}

%%
S:A B
|
;
A:'a'A'b'
|
;
B:'b'B'c'
|
;
%%

int main()
{
yyparse();
printf("valid");
}

int yyerror()
{
printf("error");
}
