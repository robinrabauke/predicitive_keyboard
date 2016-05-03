% %author: robinrabauke
/* 	TODO!
*	write some more comments
*	make real probability with inputs - could students understand that?
* 	???
* 	profit.b
*/


%outsourcing the database:
:- use_module(word).
:- use_module(transition).
%:- use_module(state).
:- use_module(specialstate).
:- use_module(element_at).

%start the program and generate 10(variable) random sentences
main :- make_transition(25).

decrement(X,X1) :-
	X1 is X - 1.

make_transition(0).
make_transition(N) :-
		random_transition(0),
		decrement(N,N1),
		make_transition(N1).
	


/*
*	makes a random-transition on a (naive) determitistic finite automaton
*	from give Start-State(State)
*	to whatever End (random-number compared to probability of state).
* TODO: should work on lists of transitions! -done!
* TODO: remove the pseudo-probability and use real probabilites.
*/

%exit
random_transition(State) :-
		%current State is a endstate 
		endstate(State),

		%print the word:
		word(State, Word),
		writef('%t\n', [Word]).
		%DONE!
						

%start
random_transition(0) :-
		%dont print the first word!

		%get the possible transitions
		transition(0, State_List, _Probability),

		%choose a random element from the possbile transitions
		length(State_List, Length),
		random_between(1, Length, RandomState),
		element_at(FutureState, State_List, RandomState),
		
		%recursive progression on the randomly chosen transition.
		random_transition(FutureState).



%random_transition with probability
random_transition(State) :- 	
		%print the word
		word(State, Word),
		writef('%t\t', [Word]),

		%get the list of possible transitions
		transition(State, State_List, _Probability),

		%choose a random element from the possbile transitions
		%!TODO!: insert real probability HERE!	
		length(State_List, Length),
		random_between(1, Length, RandomState),
		element_at(FutureState, State_List, RandomState),
				
		%recursive progression on randomly chosen State	
		random_transition(FutureState).
						
						
