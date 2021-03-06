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

%q(K,M) - pismen izpit 01.07.2018

subsequence([],[]).
subsequence(S,[_|T]):-subsequence(S,T).
subsequence([H|S],[H|T]):-subsequence(S,T).

%isElemAtPositionsIsmaller(L,M)
isElemAtPositionISmaller([],[]).
isElemAtPositionISmaller([X|T1],[X2|T2]):-
    X2=<X,isElemAtPositionISmaller(T1,T2).

length2([],0).
length2([_|T],N):-length2(T,M),N is M+1.

member(H,[H|_]).
member(X,[_|T]):-member(X,T).

%q(K,M)
q(K,M):-not((member(El,K),subsequence(SEl,El),
                length2(M,L1),length(SEl,L2),L1==L2,
    not(isElemAtPositionISmaller(M,SEl)))).
    
    
% ---------------------------
% changeSystem(N,S,R) - N is number, S is number system, R is result

change(N,S,[1]):-N<S.
change(N,S,[Q|R]):-N>=S,M is div(N,S),Q is mod(N,S), change(M,S,R).

% myPower(Num,Power,Res)
myPower(_,0,1).
myPower(N,P,R):-P>0,P1 is P-1,myPower(N,P1,R1),R is R1*N.
