%{
#include<stdio.h>
int identifiers=0,operators=0,braces=0,alpha=0,spaces=0;
%}
%%
      //[a-zA-Z] { alpha++; printf("\nAlphabet:"); ECHO; }
([ ])+ { spaces++; }   
[0-9]* { identifiers++; printf("\nIdentifiers:"); ECHO; }
[*\+\-\/] { operators++; printf("\nOperators:"); ECHO; }
[(] { braces++; }
[)] { braces--; }
[.\n] {;}
%%
void main() {
	printf("\nEnter the expression:");
	yylex();
	if((braces==0) && (operators==identifiers-1) /* && (alpha==0)*/ && (spaces==0 )) {
		printf("\n valid expression\nNumber of oprators:%d & identifiers:%d\n", operators, identifiers);
	}
	else {
		printf("\ninvalid expression\n");
	}
}
