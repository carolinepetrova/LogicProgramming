% Генерира 4 точки с преудовлетворяване, които са върхове на правоъгълник, чиито параметър е равен на N. Координатите на точките са естествени числа.

nat(0).
nat(N):-nat(M),N is M+1.

between(A,B,A):-A=<B.
between(A,B,X):-A<B,A1 is A+1,between(A1,B,X).

pairs(A,B):-nat(N),between(1,N,A),B is N-A.

abs2(X, Y) :- X < 0, Y is -X.
abs2(X, X) :- X >= 0.

q(N, [Ax, Ay], [Bx, By], [Cx, Cy], [Dx, Dy]):-
    pairs(Ax,Ay),
    pairs(Cx,Cy),
    Ax\=Cx,Ay\=Cy,
    A is Ay-Cy,A\=0,
    B is Ax-Cx,B\=0,
    abs2(A,A1),abs2(B,B1),
    P is 2*(A1+B1), N==P,
    Bx is Cx,
    By is Ay,
    Dx is Ax,
    Dy is Cy.
