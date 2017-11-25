#!/bin/bash

rm -f tempo_p2*.txt

TIMEFORMAT=$'%R\t%U\t%S'

# C
gcc -o p2_c ../codigo/p2.c

for i in {1..30}
do
	(time ./p2_c 100 > /dev/null) 2>> tempo_p2_c_100.txt
	(time ./p2_c 1000 > /dev/null) 2>> tempo_p2_c_1000.txt
	(time ./p2_c 2000 > /dev/null) 2>> tempo_p2_c_2000.txt
	sleep 1
done


# GO
go build -o p2_go ../codigo/p2.go

for i in {1..30}
do
	(time ./p2_go 100 > /dev/null) 2>> tempo_p2_go_100.txt
	(time ./p2_go 1000 > /dev/null) 2>> tempo_p2_go_1000.txt
	(time ./p2_go 2000 > /dev/null) 2>> tempo_p2_go_2000.txt
	sleep 1
done


# Java
javac -d ./ ../codigo/p2.java

for i in {1..30}
do
	(time java p2 100 > /dev/null) 2>> tempo_p2_java_100.txt
	(time java p2 1000 > /dev/null) 2>> tempo_p2_java_1000.txt
	(time java p2 2000 > /dev/null) 2>> tempo_p2_java_2000.txt
	sleep 1
done


# Python
# Python pode ser compilado, mas sendo uma linguagem interpretada, executaremos
# o código diretamente.
for i in {1..30}
do
	(time python3.5 ../codigo/p2.py 100 > /dev/null) 2>> tempo_p2_python_100.txt
	(time python3.5 ../codigo/p2.py 1000 > /dev/null) 2>> tempo_p2_python_1000.txt
	(time python3.5 ../codigo/p2.py 2000 > /dev/null) 2>> tempo_p2_python_2000.txt
	sleep 1
done


# Prolog
swipl -g main --stand_alone -o p2_prolog -c ../codigo/p2.pl

for i in {1..30}
do
	(time ./p2_prolog 100 > /dev/null) 2>> tempo_p2_prolog_100.txt
	(time ./p2_prolog 150 > /dev/null) 2>> tempo_p2_prolog_150.txt
	(time ./p2_prolog 200 > /dev/null) 2>> tempo_p2_prolog_200.txt
	sleep 1
done
