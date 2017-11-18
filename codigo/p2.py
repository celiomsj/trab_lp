# Programa 2

# Multiiplicar duas matrizes quadráticas de dimensões NxN.

import sys
import random


def multiplica_matriz(m1, m2):
  mr = []
  for i in range(len(m1)):
    mr.append([])
    for j in range(len(m2[0])):
      mr[i].append(sum([x*y for x,y in zip(m1[i],m2[j])]))

  return mr


def main(argv):
	n = int(argv)
	matriz1 = [[random.random() for _ in range(n)] for _ in range(n)]
	matriz2 = [[random.random() for _ in range(n)] for _ in range(n)]

	print(multiplica_matriz(matriz1, matriz2))


if __name__ == "__main__":
	if len(sys.argv) != 2:
		print("Erro")
		sys.exit()

	main(sys.argv[1])