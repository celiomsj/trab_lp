/*
  Programa 2
  
  Multiiplicar duas matrizes quadráticas de dimensões NxN.
 */

% primeira coluna de uma matriz
primeira_coluna([], [], []).
primeira_coluna([[]|_], [], []).
primeira_coluna([[ElemCol|OutrosElem]|OutrasLinhas], [ElemCol|RestoPrimColuna], [OutrosElem|RestoMatriz]) :-
    primeira_coluna(OutrasLinhas, RestoPrimColuna, RestoMatriz).
    
% transposta de uma matriz
transposta([[]|_], []) :- !.
transposta([[A|As]|ARs], [Col|BRs]) :-
    primeira_coluna([[A|As]|ARs], Col, [As|NARs]),
    transposta([As|NARs], BRs).

% produto interno de dois vetores
produto_interno([], [], 0).
produto_interno([A|As], [B|Bs], Soma) :-
    produto_interno(As, Bs, Subtotal),
    Soma is Subtotal + (A*B).


/** <examples>
?- maplist(produto_interno, [[1,2],[3,4]], [[1,2],[3,4]], X).
*/

% multiplicação de duas matrizes
multimatriz([], _, []).
multimatriz([A|As], B, [M|Ms]) :-
    transposta(B, T),
    multimatrizl(A, T, M),
    multimatriz(As, B, Ms).

% predicado auxiliar para multimatriz vetor de produtos internos de um vetor
% com todos as linhas de uma matriz
multimatrizl(_,[],[]) :- !.
multimatrizl(L, [B|Bs], [M|Ms]) :- 
    produto_interno(L, B, K),
    M is K,
    multimatrizl(L, Bs, Ms).


/** <examples>
?- multimatriz([[1,2],[3,4]], [[1,2],[3,4]], X).
*/

% geração de um vetor com números aleatórios
vetor_aleatorio(0, []).
vetor_aleatorio(N, [V|Vs]) :-
    N > 0,
    N1 is N-1,    
    random(V),
    vetor_aleatorio(N1, Vs).

% geração de uma matriz com números aleatórios
matriz_aleatoria(0, _, []).
matriz_aleatoria(L, C, [[M|Ms]|MRs]) :-
    L > 0, C > 0,
    L1 is L-1,
    vetor_aleatorio(C, [M|Ms]),
    matriz_aleatoria(L1, C, MRs).

% geração de uma matriz quadrada com números aleatórios
matriz_quad_aleatoria(N, M) :- matriz_aleatoria(N, N, M).


/** <examples>
?- matriz_quad_aleatoria(100, A), multimatriz(A,A, X)
*/

% predicado para escrever uma matriz na tela
print_matriz([]).
print_matriz([H|T]) :- write(H), nl, print_matriz(T).


main(Argv) :-
    concat_atom(Argv, SingleArg),
    term_to_atom(Term, SingleArg),
    matriz_quad_aleatoria(Term, M1),
    matriz_quad_aleatoria(Term, M2),
    multimatriz(M1, M2, MR),
    print_matriz(MR), halt.
