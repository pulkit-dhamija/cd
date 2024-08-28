%{
#include <stdio.h>
int posint,negint,posfrac,negfrac=0;
%}

NUM [0-9]+

%%
[+]?{NUM} {posint++;}
[-]{NUM} {negint++;}
[+]?{NUM}[/][+]?{NUM} | 
[-]{NUM}[/][-]{NUM} | 
[+]?{NUM}"."{NUM} {posfrac++;}
[+]?{NUM}[/][-]{NUM} | 
[-]{NUM}[/][+]?{NUM} | 
[-]{NUM}"."{NUM} {negfrac++;}
"\n" {return 0;}
%%

int main()
{
yylex();
printf("posint:%d,negint:%d,posfrac:%d,negfrac:%d",posint,negint,posfrac,negfrac);
return 0;
}

int yywrap()
{
return 1;
}
