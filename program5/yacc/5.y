%{
#include<stdio.h>
int yylex();
int count=0,arrcount=0;
%}

%token INT FLOAT CHAR DOUBLE IDEN NUM

%%

S:I
;
I:TYPE VARS ';'
;
TYPE:INT
|FLOAT
|CHAR
|DOUBLE
;

VARS: VAR ',' VARS
|VAR
|;

VAR: IDEN'['NUM']' {arrcount++;}
|IDEN {count++;}
;

%%

int yyerror() {
    printf("Error:");
    return 0;
}

int main() {
    printf("Enter a declaration statement:\n");
    yyparse();
    printf("no of varibles declared=%d %d",count,arrcount);
    return 0;
}
