%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
int yyerror();
%}
%token ENTER A B
%%
Stmt: s ENTER { printf("valid grammer\n"); exit(0); }
	s: c B | B
	c: A c | A
	;
%%
void main() {
	printf("Enter the string:");
	yyparse();
}
int yyerror() {
	printf("invalid grammer\n");
	return 0;
}	
