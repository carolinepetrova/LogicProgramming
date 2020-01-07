weighted_path(E,X,Y,[P,W]):-weighted_path1(E,X,[Y],W,P).
weighted_path1(_,X,[X|R],0,[X|R]).
weighted_path1(E,X,[Z|T],W,R):-X\=Z,member([Z1,Z,M],E),
    not(member(Z1,[Z|T])),
        weighted_path1(E,X,[Z1,Z|T],W1,R),W is W1+M.

member(H,[H|_]).
member(H,[_|T]):-member(H,T).

extract_vertices([],[]).
extract_vertices([[V1,V2|_]|T],[V1,V2|Res]):-extract_vertices(T,Res).

%to_set(Lst,Res)
toSet([], []).
toSet([H|T], [H|R]):- toSet(T, R), not( member(H, R)).
toSet([H|T], R):- toSet(T, R), member(H, R).

%generate_vertices(Edges,Res)
generate_vertices(E,R):-extract_vertices(E,R1),toSet(R1,R).

append([],Lst,Lst).
append([H|T],Lst,[H|Res]):-append(T,Lst,Res).

p(G,L):-generate_vertices(G,X),
    member(V1,X),member(V2,X),V1\=V2,
    weighted_path(G,V1,V2,[L,W]),W==0.
