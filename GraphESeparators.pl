subset([],[]).
subset(S,[_|T]):-subset(S,T).
subset([H|S],[H|T]):-subset(S,T).

member(H,[H|_]).
member(X,[_|T]):-member(X,T).

append([],L,L).
append([H|T],L,[H|R]):-append(T,L,R).

union(A,B,X):-append(A,B,X).

intersection(A,B):-member(X,A),member(X,B).

removeAll(_,[],[]).
removeAll(X,[H|T],[H|Lst]):-X\=H,removeAll(X,T,Lst).
removeAll(X,[X|T],Lst):-removeAll(X,T,Lst).

%removeElems(ToRemove,List,Res)
removeElems([],L,L).
removeElems([H|T],L,R):-removeAll(H,L,R1),removeElems(T,R1,R).

isSubset([],_).
isSubset([H|T],L):-member(H,L),isSubset(T,L).

%packSubsets(L,[],R)
packSubsets([],[],[]).
packSubsets(L,R,R):-not((subset(P,L),not(member(P,R)))).
packSubsets(L,B,R):-subset(P,L),not(member(P,B)),packSubsets(L,[P|B],R),!.

generate_partition(V,E,A,B,S):-packSubsets(V,[],VR),
    member(A,VR),member(B,VR),A\=B,not(intersection(A,B)),
   	packSubsets(E,[],RE),
    member(S,RE),B\=S,A\=S,union(A,B,X),
    isSubset(X,V),isSubset(V,X).

% without backtracking
generate_partition2(V,E,A,B,S):-subset(A,V),subset(B,V),not(intersection(A,B)),
    subset(S,E),union(A,B,X),isSubset(X,V),isSubset(V,X).

%are_edges_in_two_sets(E,A,B)
are_edges_in_two_sets([],_,_).
are_edges_in_two_sets([[H,H2]|T1],A,B):-are_edges_in_two_sets(T1,A,B),
    member(H,A),not(member(H2,B));
    member(H,B),not(member(H2,A)).

generate_eseparator(V,E,A,B,S):-generate_partition2(V,E,A,B,S),
    removeElems(S,E,S1),are_edges_in_two_sets(S1,A,B).

generate_k_eseparators(V,E,K,A,B,S):-generate_eseparator2(V,E,A,B,S),
    length2(A,LA),length2(B,LB),length2(S,LS),LB>=K,LA>=K,K>=LS.


length2([],0).
length2([_|T],N):-length2(T,M),N is M+1.
