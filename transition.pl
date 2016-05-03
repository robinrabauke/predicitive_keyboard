:- module(transition, [transition/3]).
transition(start, 		[ich, du , das], 0.33).
transition(ich, 		[habe, bin, laufe], 0.33).
transition(habe, 		[durst, lust, urlaub], 0.33).
transition(bin, 		[schoen, traurig, klug], 0.33).
transition(laufe, 		[rechts, links, heim], 0.33).
transition(du, 			[bist, laeufst, redest], 0.33).
transition(bist, 		[schoen, da, klug], 0.33).
transition(laeufst, 	[rechts, links, witzig], 0.33).
transition(redest, 		[schoen, klug, unfug], 0.33).
transition(das,			[ist, wird, kind, wetter, essen], 0.2).
transition(ist,			[urlaub, schoen, unfug], 0.33).
transition(wird,		[schoen, traurig, unfug], 0.33).
transition(kind,		[ist, wird], 0.5).
transition(wetter,		[ist, wird], 0.5).
transition(essen,		[ist, wird], 0.5).

