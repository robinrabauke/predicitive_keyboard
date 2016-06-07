:- module(transition, [transition/3]).
%transition (word, possibleNextWords, Probabilities in Ascending Order)
transition(start, 		[das, du , ich], 					[0.3, 0.3, 0.4]).
transition(ich, 		[laufe, bin, habe], 				[0.3, 0.3, 0.4]).
transition(habe, 		[urlaub, lust, durst], 				[0.2, 0.3, 0.5]).
transition(bin, 		[klug, traurig, schoen], 			[0.3, 0.3, 0.4]).
transition(laufe, 		[rechts, links, heim], 				[0.3, 0.3, 0.4]).
transition(du, 			[bist, laeufst, redest], 			[0.2, 0.3, 0.5]).
transition(bist, 		[schoen, da, klug], 				[0.3, 0.34, 0.36]).
transition(laeufst, 	[rechts, links, witzig], 			[0.2, 0.2, 0.6]).
transition(redest, 		[schoen, klug, unfug], 				[0.2, 0.25, 0.55]).
transition(das,			[ist, wird, kind, wetter, essen], 	[0.2, 0.2, 0.2, 0.2,0.2]).
transition(ist,			[urlaub, schoen, unfug],			[0.1, 0.4 ,0.5]).
transition(wird,		[schoen, traurig, unfug], 			[0.3, 0.3, 0.4]).
transition(kind,		[ist, wird], 						[0.5, 0.5]).
transition(wetter,		[ist, wird], 						[0.5, 0.5]).
transition(essen,		[ist, wird],	 					[0.5, 0.5]).





