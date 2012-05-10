%{
/*Hacer un intérprete utilizando LEX y YACC que permita manipular cadenas de caracteres, y que permita la suma y la resta, la gramática del lenguaje es:

P -> ID ASIG cadena ';'
	| PRINT cadena ';'
cadena -> cadena + cadena | cadena - NUM | CAD | ID

1. La suma de dos cadenas, producirá otra cadena cuyo resultado será la concatenación de las primeras. 
2. La resta se producirá entre una cadena y un entero, de la forma c - n, y dará como resultado la cadena c pero sin los n últimos caracteres. 
	2.1 Si la cadena c tiene menos de n caracteres, se producirá un error
	2.2 Si el número n es negativo, en lugar de quitarse de c los n último caracteres, se quitarán los *n* primeros caracteres. 

Las cadenas se encierran entre comillas dobles y los números serán enteros incluido el cero, y sin decimales.
Debe haber recuperación de errores y se podrán utilizar variables a las que se les puede asignar el valor de una cadena. El programa debe aceptar 
*/
%}
%code requires {
	// Incluir las librerias y variables que se vayan a utilizar
	#include <stdio.h>
	#include <string.h>
	#include "tabSimbolos.h"
	simbolo * t;
}
%union{
	// Rellenar los tipos de los atributos
	int numero;
	char texto[50];
	simbolo *nodo;
}
%token ASIG PRINT
%token <numero>NUM
%token <nodo>ID
%token <texto>CAD
%type <texto>cadena
%left '+' '-'
%error-verbose
%%
prog	: 
		| prog ID ASIG cadena ';'	{strcpy(($2->texto),$4);}
		| prog PRINT cadena ';'		{printf("%s\n",$3);}
		| prog error ';'			{yyerrok;}
		;
cadena	: cadena '+' cadena			{sprintf($$,"%s%s",$1,$3);}
		| cadena '-' NUM			{
										int lenCad = strlen($1);
										if ($3 > 0) {
											if (lenCad > $3) {
												$1[lenCad - $3] = '\0';
												strcpy($$,$1);
											} else {
												// ERROR
												printf("La longitud de la cadena es menor que el numero.\n");
												$$[0] = '\0';
											}
										} else {
											// Quitamos los primeros elementos
											if (lenCad > -$3) {
												strcpy($$,$1-$3);
											} else {
												// ERROR
												printf("La longitud de la cadena es menor que el numero.\n");
												$$[0] = '\0';
											}
										}
									}
		| CAD						{strcpy($$,$1);}
		| ID						{strcpy($$,$1->texto);}
		;
%% 
void main(){
	// Inicializar variable 
	t = crear();

	yyparse();
}

yyerror(char *s) {
	printf("%s\n",s);
}
