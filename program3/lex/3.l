%{
	#include<stdio.h>
	int single=0,multi=0,mlines=0,nest=0;
%}
%%
"//"[^\n\/\*]*	{single++;}
"/*"[^\n\/*]*	{
	multi++;
	nest++;
}
"*/"	{nest--;}
[\n]	{if(nest>0){mlines++;}}
.	{if(nest==0){;}}
%%
int yywrap()
{
	return 1;
}
int main()
{
	yyin=fopen("input.txt","r");
	yyout=fopen("output.txt","w");
	yylex();
	printf("Single: %d\n Multi: %d\nMlines: %d\n",single,multi,mlines);
	return 0;
}


