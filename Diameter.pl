%count(ELEM,LST,NUM)
count(_,[],0).
count(X,[X|T],N):-count(X,T,M),N is M+1.
count(X,[H|T],N):-X\=H,count(X,T,N).

%removeAll(Elem,Lst,NewLst)
removeAll(_,[],[]).
removeAll(X,[H|T],[H|Lst]):-X\=H,removeAll(X,T,Lst).
removeAll(X,[X|T],Lst):-removeAll(X,T,Lst).

%elemFrequency(LST,LstFreq)
elemFrequency([],[]).
elemFrequency([H|T],[X|LstFreq]):-count(H,[H|T],X),
    removeAll(H,T,T1),
    elemFrequency(T1,LstFreq).

min([X],X).
min([H|T],H):-min(T,Y),H=<Y.
min([H|T],Y):-min(T,Y),H>Y.

max([X],X).
max([H|T],H):-max(T,Y),H>=Y.
max([H|T],Y):-max(T,Y),H<Y.

getHead([],[]).
getHead([H],H).
getHead([H|_],H).

%diameterGen(LST,Gen).
diameterGen([],[]).
diameterGen([H|T],[Z|RES]):-elemFrequency(H,GEN),
    min(GEN,X),
    max(GEN,Y),
    Z is Y-X,diameterGen(T,RES).

%diameter(LST)
diameter([H|T]):-diameterGen([H|T],Diam),
    getHead(Diam,DiamHead),
    removeAll(DiamHead,Diam,RES),[] == RES.
