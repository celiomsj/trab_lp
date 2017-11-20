#!/bin/bash

rm -f tempo_p1*.txt

TIMEFORMAT=$'%R\t%U\t%S'

# C
gcc -o ../codigo/p1_c p1.c

for i in {1..30}
do
	(time ./p1_c 1000) 2>> tempo_p1_c_1000.txt
	(time ./p1_c 10000) 2>> tempo_p1_c_10000.txt
	(time ./p1_c 1000000) 2>> tempo_p1_c_1000000.txt
	sleep 1 # solução pra seed do rng
done


# GO
go build -o p1_go ../codigo/p1.go

for i in {1..30}
do
	(time ./p1_go 1000) 2>> tempo_p1_go_1000.txt
	(time ./p1_go 10000) 2>> tempo_p1_go_10000.txt
	(time ./p1_go 1000000) 2>> tempo_p1_go_1000000.txt
	sleep 1 # solução pra seed do rng
done


# Java
javac -d ./ ../codigo/p1.java

for i in {1..30}
do
	(time java p1 1000) 2>> tempo_p1_java_1000.txt
	(time java p1 10000) 2>> tempo_p1_java_10000.txt
	(time java p1 1000000) 2>> tempo_p1_java_1000000.txt
	sleep 1 # solução pra seed do rng
done


# Python
# Python pode ser compilado, mas sendo uma linguagem interpretada, executaremos
# o código diretamente.
for i in {1..30}
do
	(time python3.5 ../codigo/p1.py 1000) 2>> tempo_p1_python_1000.txt
	(time python3.5 ../codigo/p1.py 10000) 2>> tempo_p1_python_10000.txt
	(time python3.5 ../codigo/p1.py 1000000) 2>> tempo_p1_python_100000.txt
	sleep 1 # solução pra seed do rng
done


# Prolog
swipl -g main --stand_alone -o p1_prolog -c ../codigo/p1.pl

for i in {1..30}
do
	(time ./p1_prolog 1000) 2>> tempo_p1_prolog_1000.txt
	(time ./p1_prolog 10000) 2>> tempo_p1_prolog_10000.txt
	(time ./p1_prolog 1000000) 2>> tempo_p1_prolog_1000000.txt
	sleep 1 # solução pra seed do rng
done
