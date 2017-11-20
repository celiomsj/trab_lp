/*
  Programa 1

  Eleva ao quadrado os N elementos de um vetor e calcula a soma.
*/


% Criação de vetor com números aleatórios
vetor_aleatorio(0, []).
vetor_aleatorio(N, [V|Vs]) :-
	N > 0,
	N1 is N-1,
	random(V),
	vetor_aleatorio(N1, Vs).

% Soma dos quadrados dos elementos de um vetor
soma_q([], 0).
soma_q([H|T], Soma) :-
    soma_q(T, Subtotal),
    Soma is (H*H) + Subtotal.


main(Argv) :-
	concat_atom(Argv, SingleArg),
	term_to_atom(Term, SingleArg),
	vetor_aleatorio(Term, X),
	soma_q(X, Y),
	format('~w~n', Y).
