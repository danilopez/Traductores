%{
	#include "y.tab.h"
%}
%%
[0-9]+	{
			yylval.numero = atoi(yytext);
			return NUMERO;
		}
":="	{return ASIG;
		}
"PRINT"	{return IMPRIMIR;
		}
[a-zA-Z][a-zA-Z0-9]*	{ yylval.nodo = buscar(t,yytext);
						  if (yylval.nodo == NULL) {
							yylval.nodo=(simbolo *) malloc(sizeof(simbolo));
							strcpy(yylval.nodo->nombre, yytext);
							yylval.nodo->valor=0;
							insertar(&t, yylval.nodo);
						  }
						  return ID;
						}
[ \t\n]					{;}
.					{
					return yytext[0];}
