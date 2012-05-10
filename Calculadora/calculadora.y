%{
/*Realizar el ejercicio de la calculadora pero utilizando variables y la tabla de simbolos. Las declaraciones serán implicitas por lo que se crearán en el lex */
%}
%code requires {
	#include <stdio.h>
	#include "tabSimbolos.h"
	simbolo * t;
}
%union {
	simbolo * nodo;
	int numero;
}
%error-verbose
%token <numero>NUMERO
%token <nodo> ID
%token ASIG IMPRIMIR
%type <numero> expr asig
%left '+' '-'
%left '*' '/'
%right MENOS_UNARIO
%%
prog	:	prog asig ';'	{printf("Asignaciones efectuadas \n");}
		|	prog IMPRIMIR expr	';'	{printf("%d\n", $3);}
		|	prog error ';' 	{yyerrok;}
		|	{;}
		;
asig	:	ID ASIG expr	{$$ = $3;
							 $1->valor = $3;
							}
		|	ID ASIG asig	{$$ = $3;
							 $1 ->valor = $3;
							}
		;
expr	:	expr '+' expr	{$$ = $1 + $3;}
		|	expr '-' expr	{$$ = $1 - $3;}
 		|	expr '*' expr	{$$ = $1 * $3;}
		|	expr '/' expr	{$$ = $1 / $3;}
		|	'(' expr ')'	{$$ = $2;}
		|	'-' expr  %prec MENOS_UNARIO  {$$ = -$2;}
		|	ID	{$$ = $1->valor;}
		|	NUMERO {$$ = $1;}
		;
%%
void main(){
	t = crear();
	yyparse();
	imprimir(t);
}

		

