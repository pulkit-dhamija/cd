%{
	#include<stdio.h>
	int single=0,multi=0,mlines=0,nest=0;
%}
%%
"//"[^\n\/\*]*	{if(nest==0){fprintf(yyout, "\n");}single++;}
"/*"[^\n\/*]*	{
	if(nest==0){fprintf(yyout, "\n");}
	multi++;
	nest++;
}
"*/"	{nest--;}
[\n]	{if(nest>0){mlines++;} else{fprintf(yyout, "\n");}}
.	{if(nest==0){fprintf(yyout, "%s", yytext);}}
%%
int yywrap()
{
	return 1;
}
int main()
{
	yyin=fopen("inp.txt","r");
	yyout=fopen("out.txt","w");
	yylex();
	printf("Single: %d\n Multi: %d\nMlines: %d\n",single,multi,mlines);
	return 0;
}