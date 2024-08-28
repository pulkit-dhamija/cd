%{
#include<stdio.h>
int count=0;
%}

%token IF IDEN NUM

%%
S:I
;
I:IF A B{count++;}
;
A:'(' E ')'
;
E:IDEN Z IDEN
|IDEN Z NUM
|IDEN U
|IDEN
;
Z:'<'|'>'|'<''='|'>''='|'=''='|'!''='
;
U:'+''+'|'-''-'
;
B:'{'B'}'
|I
|E';'
|
;
%%

int main()
{
printf("Enter loop");
yyparse();
printf("no of if loops:%d",count);
return 0;
}

int yyerror()
{
printf("error");
return 0;
}

