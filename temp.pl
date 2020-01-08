subset([],[]).
subset(S,[_|T]):-subset(S,T).
subset([H|S],[H|T]):-subset(S,T).

member(H,[H|_]).
member(X,[_|T]):-member(X,T).

append([],L,L).
append([H|T],L,[H|R]):-append(T,L,R).

union(A,B,S,X):-append(A,B,R1),append(R1,S,X).

%packSubsets(L,[],R)
packSubsets([],[],[]).
packSubsets(L,R,R):-not((subset(P,L),not(member(P,R)))).
packSubsets(L,B,R):-subset(P,L),not(member(P,B)),packSubsets(L,[P|B],R).

generate_partition(V,A,B,S):-packSubsets(V,[],VR),
    member(A,VR),member(B,VR),member(S,VR).
