%mergeSorted(LST1,LST2,MERGED)
mergeSorted([],LST2,LST2).
mergeSorted(LST1,[],LST1).
mergeSorted([H1|T1],[H2|T2],[H1|Merged]):- H1=<H2,
            mergeSorted(T1,[H2|T2],Merged).
mergeSorted([H1|T1],[H2|T2],[H2|Merged]):-H1>H2,
            mergeSorted([H1|T1],T2,Merged).
            
%mergePartition(Len,BIGLIST,LST1,LST2)
mergePartition(0,Lst,[],Lst).
mergePartition(Len,[H|T],[H|Lst1],Lst2):-N is Len-1,
    mergePartition(N,T,Lst1,Lst2).

%length(LST,N)
length2([],0).
length2([_|T],N):-length(T,M),N is M+1.

%mergeSort(Lst1,Lst2)
mergeSort([],[]).
mergeSort([H],[H]).
mergeSort(LST,SORTED):-length2(LST,X),Y is integer(X/2),X>1,
    mergePartition(Y,LST,LLIST,RLIST),
    mergeSort(LLIST,SL),
    mergeSort(RLIST,SR),
    mergeSorted(SL,SR,SORTED).
