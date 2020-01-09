permutate([],[]).
permutate([H|T],L):-permutate(T,L1),insert(H,L1,L).

append([],L,L).
append([H|T],L,[H|L1]):-append(T,L,L1).

insert(H,L,LR):-append(A,B,L),append(A,[H|B],LR).

simpleListSort(L,LR):-permutate(L,LR),isSorted(LR).

length2([],0).
length2([_|T],N):-length2(T,M),N is M+1.

isSorted([H1,H2]):-length2(H1,L1),length(H2,L2),L1=<L2.
isSorted([H,H1|T]):-length2(H,L1),length(H1,L2),L1=<L2,isSorted([H1|T]).

member(H,[H|_]).
member(X,[_|T]):-member(X,T).

isSubset([],_).
isSubset([H|T],L):-member(H,L),isSubset(T,L).

not_major(_,[]).
not_major(X,[H|T]):-not(isSubset(X,H)),not_major(X,T).

%p(L,M)
p([],[]).
p([H|T],R):-not(not_major(H,T)),p(T,R).
p([H|T],[H|R]):-not_major(H,T),p(T,R).
