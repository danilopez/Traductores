#ifndef __INTERFAZ_H__
#define __INTERFAZ_H__
typedef struct _simbolo {
		struct _simbolo * sig;
		char nombre [20]; 
		int valor;
} simbolo;

simbolo * crear();
void insertar(simbolo **pT, simbolo *s);
simbolo * buscar(simbolo * t, char nombre[20]);
void imprimir(simbolo * t);
#endif
