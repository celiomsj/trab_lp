/*
Programa 2

Multiiplicar duas matrizes quadráticas de dimensões NxN.

*/

#include <stdio.h>

int main() {

	double m1 [2][2] = { {1,2},{3,4} };
	double m2 [2][2] = { {1,2},{3,4} };
	double mm [2][2];

	void multiMatriz(double mm[2][2], double m1[2][2], double m2[2][2], int l1, int c1, int l2, int c2) {
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


	void printMatriz(double mm[2][2], int l, int c) {
		int i,j;
		

		for (i = 0; i < l; i++) {
			for (j = 0; j < c; j++) {
				printf("%f\t", mm[i][j]);
			}
			printf("\n");
		}
	}

 	multiMatriz(mm, m1, m2, 2, 2, 2, 2);
	printMatriz(mm, 2, 2);
}