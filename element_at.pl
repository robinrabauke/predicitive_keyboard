:- module(element_at, [element_at/3]).
%element_at/1 returns the nth element in a list.
element_at(X,[X|_],1).
element_at(X,[_|L],N) :- element_at(X,L,N1), N is N1 + 1.
