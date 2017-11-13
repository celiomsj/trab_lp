

soma_q([], 0).
soma_q([H|T], Soma) :-
    soma_q(T, Subtotal),
    Soma is (H*H) + Subtotal.
