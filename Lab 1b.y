%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
int yyerror();
%}
%token NUM ENTER
%left '+' '-'
%right '*' '/'
%%
E: expr ENTER { printf("Result is %d \n",$$); exit(0); } 
expr: expr '+' expr { $$ = $1+$3; } 
	| expr '-' expr { $$ = $1-$3; } 
	| expr '*' expr { $$=$1*$3; } 
	| expr '/' expr { if($3==0) { printf("infinity\n"); exit(0); } else { $$=$1/$3; } }
	| NUM { $$=$1; }
	;
%%
int main() {
	printf("Enter the Expession\n");
	yyparse();
	return 0;
}
int yyerror() {
	printf("invalid expression\n");
	return 0;
}
