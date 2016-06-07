:- module(choose_prob_word, [choose_prob_word/4]).


choose_prob_word(Word, [Firstword|WordList], [FirstProb|ProbList], NewWord) :-
	%get the List of Words an Probabilities
	% word_1 = 0,7
	% word_2 = 0,2
	% word_3 = 0.1
	% we generate a random-number between 0 and 1 and test it agains the
	% the Probabilities. If it's smaller, the word will be the next one.
	%
	random(X),
	Random < FirstProb,
	choose_prob_word(Word, Firstword, FirstProb),!;
	
	%failed, go on.
	NewRandom is Random + FirstProb,
	choose_prob(Word, WordList, ProbList, NewWord, NewRandom).



choose_prob_word(Word, [Firstword|WordList], [FirstProb|ProbList], NewWord, Random) :-
	Random < FirstProb,
	choose_prob_word(Word, Firstword, FirstProb),!;
	
	%failed, go on.
	NewRandom is Random + FirstProb,
	choose_prob(Word, WordList, ProbList, NewWord, NewRandom).





