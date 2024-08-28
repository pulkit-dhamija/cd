%{
    #include<stdio.h>
    #include<stdlib.h>
    int yyerror();
    int yylex();
%}

%token TYPE IDEN NUM RET
%left '+' '-'
%left '*' '/'

%%
S: FUN  { printf("Accepted\n"); exit(0); } ;
FUN: TYPE IDEN '(' PARAMS ')' BODY ;
BODY: S1';' | '{'SS'}'
PARAMS: PARAMS ','PARAM | PARAM | ;
PARAM:  TYPE IDEN;
SS: S1';'SS | RET E';' | ;
S1: ASSGN | E | DECL ;
DECL: TYPE IDEN | TYPE ASSGN ;
ASSGN : IDEN '=' E ;
E : E '+' E | E '-' E | E '*' E | E '/' E | '-''-'E | '+''+'E | E'+''+' | E'-''-' | T ;
T : NUM | IDEN ;
%%
int main()
{
    printf("enter input: ");
    yyparse();
    printf("successfull\n");
    return 0;
}
int yyerror()
{
    printf("ERROR\n");
    exit(0);
}

