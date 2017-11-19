/*
Programa 1

Eleva ao quadrado os N elementos de um vetor e calcula a soma.

*/

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {

	int n;	
	if (argc == 2) {
		n = atoi(argv[1]);
		printf("%d\n", n);
	}

	srand(time(NULL));
	int i;
	double vetor[n];
	for (i = 0; i < n; i++) {
		// rand() gera um inteiro entre 0 e RAND_MAX
		vetor[i] = ((double)rand()/(double)RAND_MAX);
	}


	double somaQuadrados(double v[], int tam) {
		
		double soma;
		int i;

		soma = 0.0;
		for (i = 0; i < tam; i++) {
			soma += (v[i] * v[i]);
		}

		return soma;
	}

	printf("%f\n", somaQuadrados(vetor, n));

	return 0;
	
}