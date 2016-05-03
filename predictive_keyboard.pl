% %author: robinrabauke
/* 	TODO!
*	write some more comments
* 	???
* 	profit.b
*/


%outsourcing the database:
:- use_module(transition).
:- use_module(specialstate).  
:- use_module(element_at).
%:- use_module(choose_prob_word).
%start the program and generate 10(variable) random sentences
main :- make_transition(20).
%main :- nextWord(start).


decrement(X,X1) :-
	X1 is X - 1.

make_transition(0).
make_transition(N) :-
		nextWord(start),
		decrement(N,N1),
		writef('\n',[]),
		make_transition(N1).
	


nextWord(start) :-

	transition(Word, WordList, ProbList),
	choose_by_prob(Word, WordList, ProbList).				
	


nextWord(Word) :-
	endstate(Word);

	
	transition(Word, WordList, ProbList),
	choose_by_prob(Word, WordList, ProbList).				



choose_by_prob(Word, [FirstWord|WordList], [FirstProb|ProbList]) :-

	(random(X),
	X < FirstProb,
	writef('%t\t \t', [FirstWord]),
	nextWord(FirstWord));

	%failed, let's go on.
	choose_by_prob(Word, WordList, ProbList).


choose_by_prob(Word, [], []) :-
	endstate(Word),
	
	writef('%t\n', [" end"]).