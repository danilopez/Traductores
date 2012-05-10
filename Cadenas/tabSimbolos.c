#include <stdlib.h> 
#include <stdio.h> 
#include "tabSimbolos.h"

simbolo * crear()
{
	return NULL;
}; 
void insertar(simbolo **pT, simbolo *s)
{
	s->sig = (*pT); 
	(*pT) = s;
}; 
simbolo * buscar(simbolo * t, char nombre[20]){
	while ( (t != NULL) && (strcmp(nombre, t->nombre)))
		 t = t->sig;
	return (t);

}; 

void imprimir(simbolo * t) {
	while (t != NULL) 
	{ 
		printf("Variable: %s contiene la cadena: %s\n", t->nombre, t->texto); t = t->sig;
	} 
};
