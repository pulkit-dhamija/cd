%{
#include<stdio.h>
#include<stdlib.h>
int yyerror(char* s);
int yylex();
typedef char* string;
struct{
	string op1,op2,res;
	char op;
}code[100];
int idx=-1;

string addtotable(string,string,char);
void targetCode();
%}

%union{
char* exp;
}

%token <exp> IDEN NUM
%type <exp> EXP

%left '+''-'
%left '/''*'

%%
STMT:STMT ST
|;
ST:EXP '\n';
EXP:EXP'+'EXP {$$=addtotable($1,$3,'+');}
|EXP'-'EXP {$$=addtotable($1,$3,'-');}
|EXP'*'EXP {$$=addtotable($1,$3,'*');}
|EXP'/'EXP {$$=addtotable($1,$3,'/');}
|'('EXP')' {$$=$2;}
|IDEN'='EXP {$$=addtotable($1,$3,'=');}
|IDEN {$$=$1;}
|NUM {$$=$1;}
;
%%

int yyerror(char* s)
{printf("INvalid");
exit(0);
}

int main()
{
yyparse();
printf("Assembly code:\n");
targetCode();
return 0;
}

string addtotable(string op1,string op2,char op)
{
idx++;
if(op=='=')
{
code[idx].res=op1;
code[idx].op=' ';
code[idx].op1=op2;
code[idx].op2=" ";
return op1;
}

string res=malloc(3);
sprintf(res,"@%c",idx+'A');
code[idx].res=res;
code[idx].op1=op1;
code[idx].op2=op2;
code[idx].op=op;
return res;
}

void targetCode() {
	for(int i = 0; i <= idx; i++) {
		string instr;
		switch(code[i].op) {
		case '+': instr = "ADD"; break;
		case '-': instr = "SUB"; break;
		case '*': instr = "MUL"; break;
		case '/': instr = "DIV"; break;
		}
		if(code[i].op==' '){
			printf("LOAD\t R1,%s\n",code[i].op1);
			printf("STORE\t R1,%s",code[i].res);
		}
		else{
		printf("LOAD\t R1, %s\n", code[i].op1);
		printf("LOAD\t R2, %s\n", code[i].op2);
		printf("%s\t R3, R1, R2\n", instr);
		printf("STORE\t %s, R3\n", code[i].res);}
	}
}


