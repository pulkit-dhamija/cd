%{
    #include<stdio.h>
    int id=0,key=0,op=0;
%}

%%
"int"|"char"|"float"|"double"|"if"|"else"|"for"|"while"|"exit"|"return" {key++;}
"#include".* {;}
"#define".* {;}
"//"[^\n]* {;}
"/*".*"*/" {;}
[a-zA-Z_][a-zA-Z0-9_]*  {id++;}
[\+\-\*\/\%\^\&\|\!\=]  {op++;}
"$" {return 0;}
%%


int main()
{
    yyin=fopen("4.c","r");
    yylex();
    printf("Identifiers: %d\nKeywords: %d\nOperators: %d\n",id,key,op);
    return 0;
}
int yywrap()
{
    return 1;
}
