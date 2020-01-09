permutate([],[]).
permutate([H|T],L):-permutate(T,L1),insert(H,L1,L).

append([],L,L).
append([H|T],L,[H|L1]):-append(T,L,L1).

insert(H,L,LR):-append(A,B,L),append(A,[H|B],LR).

member(H,[H|_]).
member(X,[_|T]):-member(X,T).

isSubset([],_).
isSubset([H|T],L):-member(H,L),isSubset(T,L).

major_checker([_]).
major_checker([H|T]):-not((member(X,T),isSubset(X,H))),major_checker(T),!.

%p(L,M)
p(L,R):-permutate(L,R),major_checker(R).
