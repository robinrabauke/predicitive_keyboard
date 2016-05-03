%trying to build a tree-like (deterministic, finite) automaton for NLP
:- use_module(word).
:- use_module(transition).
:- use_module(state).
:- use_module(specialstate).
:- use_module(element_at).
main :- make_transition(10).

decrement(X,X1) :-
	X1 is X - 1.

make_transition(0).
make_transition(N) :-
	



/** state
*	contains a identification, 	connectedState1, state1-Probability,
*								connectedState2, state2-Probability,
*								Word and start/middle/end-ID 3/0/1
*
*	TODO: should be more readable
*/

/**
state(1, 2, ich, 3).
state(2, 3, 0.2, 4, 0.6, 	bin, 0).
state(3, _, _, _, _,		dumm, 1).
state(4, _, _, _, _, 		schlau, 1). 
*/


/*
state(1).
state(2).
state(3).
state(4).


word(1, ich).
word(2, bin).
word(3, dumm).
word(4, schlau).


%transition(1, [2]).
%transition(2, [3, 4]).

transition_probability(1, 2, 1.0).
transition_probability(2, 3, 0.3).
transition_probability(2, 4, 0.7).

endstate(3).
endstate(4).

startstate(1).
*/





/** random-transition
*	makes a random-transition on a (naive) determitistic finite automaton
*	from give Start-State(State)
*	to whatever End (random-number compared to probability of state).
* TODO: should work on lists of transitions!
*/

/**
random-transition(State) :- 	
						state(State,FutureState,Word,3),
						writef('%t\n', [Word]),
						random-transition(FutureState).

random-transition(State) :- 	
						state(State, _, _, _, _, Word, 1),
						writef('%t\n', [Word]).

random-transition(State) :- 	
						random(X),
						
						state(State, FutureState1, State1_Prob, FutureState2, _, Word, 0),
						writef('%t\n', [Word]),


						((X < State1_Prob) -> 	random-transition(FutureState1);
												random-transition(FutureState2)) .
*/
				
	

%get the first Element of a List
first([H|_T], H).



%increment a number
increment(X, X1) :-
						X1 is X + 1.

%exit
random_transition(State) :- 

						endstate(State),
						word(State, Word),
						writef('%t\n', [Word]).
						

%start

random_transition(0) :-transition(0, State_List, _Probability),
						%word(0, Word),
						%writef('%t\n', [Word]),

						length(State_List, Length),

						random_between(1, Length, RandomState),
					
						%writef('%t\n', [RandomState]),

						element_at(FutureState, State_List, RandomState),
						%writef('%t\n', [FutureState]),
						%word(FutureState, Word),
						%writef('%t\n', [Word]),
						random_transition(FutureState).



%random_transition with probability
random_transition(State) :- 

						word(State, Word),
						writef('%t\t', [Word]),

						transition(State, State_List, _Probability),

						length(State_List, Length),
					
						random_between(1, Length, RandomState),
						element_at(FutureState, State_List, RandomState),
						random_transition(FutureState).
						
						
	
						/*
						(Rand < Probability) -> 	(word(State, Word),
									writef('%t\n', [Word]),
									random_transition(H));

									random_transition(State, _T).
									*/
	
%if first transition wasn't successful:
/*
random_transition(State, [H|T]) :-	
						random(Rand),
						
						transition(State, [H|_T], Probability),
						(Rand < Probability) -> 	word(State, Word),
													writef('%t\n', [Word]),
													random_transition(H);
									
													random_transition(State, T).
*/
						