% Shows the elements from the list L which are a concatenation of other elements of L

subset([],[]).
subset(S,[_|T]):-subset(S,T).
subset([H|S],[H|T]):-subset(S,T).

flatten(X, [X]):- not(is_list(X)).
flatten([], []).
flatten([H|T], R):- flatten(H, FH), flatten(T, FT), 
	append(FH, FT, R).

concat_filter(L,Y):-member(Y,L),remove(Y,L,L1),subset(X,L1),flatten(X,X1),X1==Y.
