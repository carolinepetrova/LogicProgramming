member(H,[H|_]).
member(X,[_|T]):-member(X,T).

append([],L,L).
append([H|T],L,[H|L1]):-append(T,L,L1).

subset([],[]).
subset(S,[_|T]):-subset(S,T).
subset([H|S],[H|T]):-subset(S,T).


%packSubsets(Lst,Buff,Res)
packSubsets(L,R,R):-not((subset(X,L),not(member(X,R)))).
packSubsets(L,B,R):-subset(X,L),not(member(X,B)),packSubsets(L,[X|B],R).

%p(X,Y,A,B) - pismen izpit 01.07.2018
p(X,Y,A,B):-packSubsets(X,[],XR),subset(Y,XR),
    reverse(Y,[],RS2),listAppender(RS2,[],RS3),
    append(_,X,RS3),listLengthGen(RS2,[],LR),lengthListCheck2(A,B,LR).

listLengthGen([],R,R).
listLengthGen([H|T],B,R):-length(H,X),listLengthGen(T,[X|B],R).

lengthListCheck([H|T]):-not((member(X,T),H\=X)).

lengthListCheck2(A,B,L):-not((member(H,L),not((H<A,H>=B,0 is mod(H,2))))).

listAppender([],R,R).
listAppender([H|T],B,R):-listAppender(T,R1,R),append(H,B,R1).

reverse([],R,R).
reverse([H|T],B,R):-reverse(T,[H|B],R).
