% %author: robinrabauke

:- use_module(transition).
:- use_module(specialstate).  

%start the program and generate random sentences with "main."


main :- 
	make_transition(20).
%	getTransitions(du).


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
	random(X),
	choose_by_prob(Word, WordList, ProbList, X).				
	
nextWord(Word) :-
	endstate(Word),!;
	transition(Word, WordList, ProbList),
	%comment in the next line if you want to look inside the probs while the program is running:
	%getTransitions(Word),
	random(X),
	choose_by_prob(Word, WordList, ProbList,X).				





choose_by_prob(Word, [FirstWord|WordList], [FirstProb|ProbList], X) :-

	
	(X < FirstProb,	
	writef('%t\t \t', [FirstWord]),
	nextWord(FirstWord));

	%failed, let's go on.
	NewRandom is X - FirstProb,
	choose_by_prob(Word, WordList, ProbList, NewRandom).





%prints the transitions of given word <Word>
getTransitions(Word) :-
	transition(Word,WordList, ProbList),

	write("Current word is: <"),
	write(Word),
	write("> possible next words are: "),nl,

	printTransitions(WordList, ProbList);
	write("no entry for "),
	write(Word).


%pretty print the possible transitions 
printTransitions([], []).
printTransitions([CurrentWord|RestWordList], [CurrentProb|RestProblist]):-
	write(CurrentWord),
	write(" \t with probability: \t"),
	write(CurrentProb),nl,
	printTransitions(RestWordList, RestProblist).



