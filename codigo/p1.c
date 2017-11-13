/*
Programa 1

Eleva ao quadrado os N elementos de um vetor e calcula a soma.

*/

#include <stdio.h>

int main() {

	double vetor [5] = {1,2,3,4,5};

	double somaQuadrados(double v[], int tam) {
		
		double soma;
		int i;

		soma = 0.0;
		for (i = 0; i < tam; i++) {
			soma += pow(v[i], 2);
		}

		return soma;
	}

	printf("%f\n", somaQuadrados(vetor, 5));
	
}