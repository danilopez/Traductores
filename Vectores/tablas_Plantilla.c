/*Fichero tablas.c: contiene la tabla de símbolos para yaccay.yac*/

#include <stdio.h>
#include <stdlib.h>
typedef struct simbolo {
        struct simbolo *sig;
        //RELLENAR
        }simbolo;

void insertar(simbolo **p_t, simbolo *s)
{
     s->sig=(*p_t);
     (*p_t)=s;
}

simbolo *buscar(simbolo *t, char nombre[20])
{
        while((t!=NULL) && (strcmp(nombre, t->nombre)))
                        t=t->sig;
        return (t);
}

void imprimir(simbolo *t)
{
     while(t!=NULL)
     {
                   if(t->tipo=='V')
                       printf("%s^={%f,%f,%f}\n ", t->nombre, t->info.valorv[0],t->info.valorv[1],t->info.valorv[2]);
			else if (t->tipo=='N')
                           printf("%s=%f\n",t->nombre,t->info.valorn);
                   t=t->sig;
     }
}

     
