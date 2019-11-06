% :- dynamic counter/1.

answer([]) .
:- dynamic answer/1 .

% The categories contains two elements: what it is and what it has
% What it has is contained in the sublist.
% ex. sports = (is, [has,has,...,has])
celebs(
[
    [ "Michael Jacksson",     [ "good moves", "one glove", "hit songs", "mad skills"]],
    [ "Barrack Obama",        [ "a political carrer", "a wife"]],
    [ "Adam Sandler",         [ "been in a movie", "no acting skills", "a wife"]],
    [ "Slash",                [ "played guitar", "a top hat", "mad skills"]],
    [ "Jackie Chan",          [ "been in a movie", "done kung fu"]]
]).

animals(
[
    [ turtle,     [ legs(4), teeth(molar), diet(plants), tail, shell ]],
    [ mutant,     [ legs(3), teeth(canine), diet(pills), tail ]],
    [ dog,        [ legs(4), teeth(molar), diet(meat), tail ]],
    [ cat,        [ legs(4), teeth(canine), diet(meat), tail ]],
    [ ostrich,    [ legs(2), teeth(none), diet(plants), tail ]],
    [ human,      [ legs(2), teeth(hybrid), diet(hybrid) ]],
    [ tiger,      [ legs(4), teeth(canine), diet(meat), tail ]]
]).

sports(
[
    [ tennis,     [ball, racket, net, sweat, running]],
    [ basketball, [ball, sweat, net, goal, running]],
    [ bowling,    [ball, pins]],
    [ hockey,     [club, puck, net, goal, ice, sweat]],
    [ badminton,  [ball, net, racket, sweat, running]],
    [ chess,      [board, pieces]],
    [ waterpolo,  [water, ball, pool, net, goal]],
    [ diving,     [pool, singles, jump]]
]).

unique(
[
    ["good moves", "one glove", "hit songs", "mad skills", "a political carrer",
     "a wife", "been in a movie", "no acting skills", "played guitar", "a top hat",
     "mad skills", "been in a movie", "done kung fu"],

    [legs(4), legs(2), legs(3), teeth(molar), teeth(canine), teeth(hybrid),
     teeth(none), diet(meat), diet(plants), diet(pills), diet(hybrid), tail, shell],

    [ball, racket, net, sweat, running, goal, club, puck, ice, mindgame,
     water, pool, jump, pieces, board]
]
).
