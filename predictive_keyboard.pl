% %author: robinrabauke
/* 	TODO!
*	write some more comments
*	make real probability with inputs - could students understand that?
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
		writef('%t\n',['']),
		make_transition(N1).
	


/*
*	makes a random-transition on a (naive) determitistic finite automaton
*	from give Start-State(State)
*	to whatever End (random-number compared to probability of state).
* TODO: should work on lists of transitions! -done!
* TODO: remove the pseudo-probability and use real probabilites.
*/
%start
random_transition(start) :-
		%dont print the first word, because it's "start"

		%get the possible transitions
		transition(start, State_List, _Probability),

		%choose a random element from the possbile transitions
		length(State_List, Length),
		random_between(1, Length, RandomState),
		element_at(FutureState, State_List, RandomState),
		
		%recursive progression on the randomly chosen transition.
		random_transition(FutureState).



%exit
random_transition(State) :-
		%current State is a endstate 
		endstate(State),

		%print the word:
		%word(State, Word),
		writef('%t\n', [State]).
		
		%done
						


%random_transition with probability
random_transition(State) :- 	
		%print the word
		%word(State, Word),

		%get the list of possible transitions
		transition(State, State_List, _Probability),

		%choose a random element from the possbile transitions
		%!TODO!: insert real probability HERE!	
		length(State_List, Length),
		random_between(1, Length, RandomState),
		element_at(FutureState, State_List, RandomState),
				
		writef('%t\t', [State]),
		%recursive progression on randomly chosen State	
		random_transition(FutureState).
						

nextWord(start) :-

	transition(Word, WordList, ProbList),
	choose_by_prob(Word, WordList, ProbList).				
	


nextWord(Word) :-
	endstate(Word);

	
	transition(Word, WordList, ProbList),
	choose_by_prob(Word, WordList, ProbList).				



choose_by_prob(Word, [FirstWord|WordList], [FirstProb|ProbList]) :-
	%get the List of Words an Probabilities
	
	% word_1 = 0,7
	% word_2 = 0,2
	% word_3 = 0.1
	% we generate a random-number between 0 and 1 and test it agains the
	% the Probabilities. If it's smaller, the word will be the next one.
	%
	(random(X),
	X < FirstProb,
	writef('%t\t', [FirstWord]),
	nextWord(FirstWord));

	%failed, let's go on.
	%writef('%t', ["we failed"]),
	choose_by_prob(Word, WordList, ProbList).


choose_by_prob(Word, [], []) :-
	endstate(Word),
	
	%writef('%t\n', [Word]);
	writef('%t\n', [" end"]).