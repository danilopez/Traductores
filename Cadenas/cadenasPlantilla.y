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
%token <texto>ID
%token <texto>CAD
%left '+' '-'
%error-verbose
%%
prog	: 
		| prog ID ASIG cadena ';'	{
									}
		| prog PRINT cadena ';'		{}
		| prog error ';'			{}
		;
cadena	: cadena '+' cadena			{
									}
		| cadena '-' NUM			{
									}
		| CAD						{}
		| ID						{}
		;
%% 
void main(){
	// Inicializar variable 

	yyparse();
}
