:- module(transition, [transition/3]).
transition(start, 		[ich, du , das], [0.7, 0.9 ,1.0]).
transition(ich, 		[habe, bin, laufe], [0.7, 0.9 ,1.0]).
transition(habe, 		[durst, lust, urlaub], [0.7, 0.9 ,1.0]).
transition(bin, 		[schoen, traurig, klug], [0.7, 0.9 ,1.0]).
transition(laufe, 		[rechts, links, heim], [0.7, 0.9 ,1.0]).
transition(du, 			[bist, laeufst, redest], [0.7, 0.9 ,1.0]).
transition(bist, 		[schoen, da, klug], [0.7, 0.9 ,1.0]).
transition(laeufst, 	[rechts, links, witzig], [0.7, 0.9 ,1.0]).
transition(redest, 		[schoen, klug, unfug], [0.7, 0.9 ,1.0]).
transition(das,			[ist, wird, kind, wetter, essen], [0.7, 0.9 ,1.0]).
transition(ist,			[urlaub, schoen, unfug],[0.7, 0.9 ,1.0]).
transition(wird,		[schoen, traurig, unfug], [0.7, 0.9 ,1.0]).
transition(kind,		[ist, wird], [0.7, 0.9 ,1.0]).
transition(wetter,		[ist, wird], [0.7, 0.9 ,1.0]).
transition(essen,		[ist, wird], [0.7, 0.9 ,1.0]).

