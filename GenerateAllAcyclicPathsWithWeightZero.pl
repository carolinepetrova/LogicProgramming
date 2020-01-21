% pismen izpit 02.07.2017 

%pathWithWeights(Edges,Start,Full,Res,Weight)

pathWithWeights(_,X,[X|R],[X|R],0).
pathWithWeights(E,X,[Z|T],R,W):-X\=Z,member([Z1,Z,W1],E),
    not(member(Z1,[Z|T])),pathWithWeights(E,X,[Z1,Z|T],R,W2),W is W2+W1.

extractVertices([],[]).
extractVertices([[V1,V2,_]|T],[V1,V2|L]):-extractVertices(T,L).

toSet([],[]).
toSet([H|T],[H|R]):-toSet(T,R),not(member(H,T)).
toSet([H|T],R):-toSet(T,R),member(H,T).

p(G,L):-extractVertices(G,V1),toSet(V1,V),
    member(X,V),member(Y,V),X\=Y,
    pathWithWeights(G,X,[Y],L,W),not(member([Y,X,_],G)),W==0.
