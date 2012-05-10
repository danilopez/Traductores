%{
	#include "y.tab.h"
%}
ENTERO	"-"?[0-9]+
CADENA 	\"[^"]*\"
IDENTIFICADOR	[a-zA-Z][a-zA-Z0-9]*
%%
"PRINT" 				{return PRINT;}
":="					{return ASIG;}
{ENTERO}				{
							yylval.numero = atoi(yytext);
							return NUM;
						}
{IDENTIFICADOR}			{
							// Comprobar la tabla de simbolos
							yylval.nodo = buscar(t,yytext);
							if (yylval.nodo == NULL) {
								// No se encuentra en la tabla
								yylval.nodo = (simbolo *)malloc(sizeof(simbolo));
								strcpy(yylval.nodo -> nombre,yytext);
								yylval.nodo -> texto[0] = '\0';
								insertar(&t,yylval.nodo);
							}
							return ID;
						}
{CADENA}				{
							// Hay que quitar las comillas
							strcpy(yylval.texto,yytext + 1);
							yylval.texto[strlen(yylval.texto - 1)] = '\0';
							return CAD;
						}
[ \n\t]+		{;}
.				{return yytext[0];}
