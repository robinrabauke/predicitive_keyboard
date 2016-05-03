:- module(transition, [transition/3]).
transition(0, 	[1,2,3], 0.33).
transition(1, 	[4,5,6], 0.33).
transition(4, 	[7,8,9], 0.33).
transition(5, 	[10,11,12], 0.33).
transition(6, 	[13,14,15], 0.33).
transition(2, 	[16,17,18], 0.33).
transition(16, 	[10,19,12], 0.33).
transition(17, 	[13,14,20], 0.33).
transition(18, 	[10,12,21], 0.33).
transition(3,	[22,23,24,25,26], 0.2).
transition(22,	[10,9,21], 0.33).
transition(23,	[11,27,10], 0.33).
transition(24,	[22,23], 0.5).
transition(25,	[22,23], 0.5).
transition(26,	[22,23], 0.5).

