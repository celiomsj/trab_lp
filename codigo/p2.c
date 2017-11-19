/*
Programa 2

Multiiplicar duas matrizes quadráticas de dimensões NxN.

*/

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {

	int n;
	if (argc == 2) {
		n = atoi(argv[1]);
	}

	srand(time(NULL));

	// Para vetores grandes é necessário utilizar alocação dinâmica
	// Necessário desalocar a memória antes do final do programa.
	double** m1 = (double**)malloc(n * sizeof(double));
	double** m2 = (double**)malloc(n * sizeof(double));
	double** mm = (double**)malloc(n * sizeof(double));

	int i,j;
	for (i = 0; i < n; i++) {
		m1[i] = (double*)malloc(n * sizeof(double));
		m2[i] = (double*)malloc(n * sizeof(double));
		mm[i] = (double*)malloc(n * sizeof(double));

		for (j = 0; j < n; j++) {
			m1[i][j] = ((double)rand()/(double)RAND_MAX);
			m2[i][j] = ((double)rand()/(double)RAND_MAX);
		}
	}


	void multiMatriz(double** mm, double** m1, double** m2, int l1, int c1, int l2, int c2) {
		int i, j, a;

		// if c1 == l2

		for (i = 0; i < l1; i++) {
			for (j = 0; j < c2; j++) {
        
				mm[i][j] = 0;

				for (a = 0; a < c1; a++) {
					mm[i][j] += (m1[i][a] * m2[a][j]);
				}
			}
		}
		
	}


	void printMatriz(double** mm, int l, int c) {
		int i,j;
		

		for (i = 0; i < l; i++) {
			for (j = 0; j < c; j++) {
				printf("%f\t", mm[i][j]);
			}
			printf("\n");
		}
	}

 	multiMatriz(mm, m1, m2, n, n, n, n);
	printMatriz(mm, n, n);

	for (i = 0; i < n; i++) {
		free(m1[i]);
		free(m2[i]);
		free(mm[i]);
	}
	free(m1); free(m2); free(mm);

	return 0;
}
	