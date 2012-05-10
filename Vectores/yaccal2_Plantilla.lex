/*Examen yacc avanzado, lex, grupo A */
%{
#include "stdlib.h"

%}

%%

":="	{return ASIG;}

[a-zA-z][a-zA-Z_0-9]*  { 
							
			if(buscar(t,yytext)==NULL){
			}else{
			}
			
			}
			
[0-9]+("."[0-9]+)?	{}



[" "\t\n]+                   {;}
.                       {return yytext[0];}
