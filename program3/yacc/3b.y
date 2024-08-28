%{
#include<stdio.h>
int count=0;
%}

%token FOR IDEN NUM

%%
S:I
;
I:FOR A B {count++;}
;
A:'('E';'E';'E')'
;
E:IDEN Z IDEN
|IDEN Z NUM
|IDEN U
|IDEN
|
;
Z:'='|'>'|'<'|'<''='|'>''='|'=''+'|'=''-'
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
printf("Enter loops:");
yyparse();
printf("no of for loops:%d",count);
return 0;
}

int yyerror()
{
printf("error");
return 0;
}

