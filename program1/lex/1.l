%{
#include <stdio.h>
int words=0,dig=0,ch=0,spaces=0,lines=0;
%}

%%
[a-zA-Z]+ {words++;ch+=yyleng;}
[0-9] {dig++;}
[\n] {lines++;}
[ ] {spaces++;ch+=yyleng;}
"$" {return 0;}
%%

int main()
{
printf("Enter string:");
yylex();
printf("words:%d,digits:%d,characters:%d,spaces:%d,lines:%d",words,dig,ch,spaces,lines);
return 0;
}

int yywrap()
{
return 1;
}
