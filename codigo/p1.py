# Programa 1

# Eleva ao quadrado os N elementos de um vetor e calcula a soma.

import sys
import random

def soma_quadrados(valores):
  return sum([x**2 for x in valores])


def main(argv):
	n = int(argv)
	vetor = [random.random() for _ in range(n)]
	print(soma_quadrados(vetor))


if __name__ == "__main__":
	if (len(sys.argv)) != 2:
		print("Erro")
		sys.exit()

	main(sys.argv[1])
