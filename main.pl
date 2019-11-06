% Game: 10 questions, the program thinks of something, the user tries to
% figure out what the program is thinking about by asking
% questions. The questions are on the format has(X) or is(Y).

% program flow
%                                                  MAX 10 LOOPS
%                                                   <---<---<--
%                                                  |           |
% start() --> begin() --> randomize_answer() --> input() --> has()
%                                                  |
%  ---------------<-------------<--------------<---
% |
% |             -> correct()  -                           -NO-> begin()
% |           /                 \                       |
%  -> is() ->                     -> next_game(), played 5 games?
%             \                 /                       |
%               -> incorrect() -                          -YES-> done.
%

consult('variables.pl') .
consult('functions.pl') .

% call this predicate to start, this function initiates the counters,
% and prints startup message
start() :-
    write("Welcome to the game '10 questions'! In this game, I will think of something,"),
    nl(),
    write("and you will try to figure out what I am thinking about by asking me"),
    nl(),
    write("questions. You can ask 10 yes or no questions, then you have to guess what"),
    nl(),
    write("I'm thinking about. I'll make it easy on you, I'll let you choose if the"),
    nl(),
    write("answer is going to be a sport, an animal, or a celebrity."),
    nl(), nl(),
    write("Instructions:"), nl(),
    write("Ask yes and no questions with the has() function, and guess the answer with"),
    nl(),
    write("the is() function. You can try to guess the answer before asking all 10"),
    nl(),
    write("questions, but be careful, if the guess is wrong you lose!"), nl(), nl(),
    write("You can use the all_options(X) function if you want to display all"), nl(),
    write("attributes that belongs to a category."), nl(), nl(),
    write("Let's play!"),
    nl(), nl(),

    % initiates game counter
    retractall(games_counter(_)),
    assertz(games_counter(0)),
    incr_games_counter(),

    % initiate correct answers counter
    retractall(corr_answers_counter(_)),
    assertz(corr_answers_counter(0)),

    % begins game
    choose_category()
 .

% call this predicate to display answer. (debug tool)
show_answer() :-
    answer(Ans),
    nth0(0, Ans, Idx0),
    nth0(1, Ans, Idx1),
    write("The answer is "), write(Idx0), nl(),
    write("with attributes: "), write(Idx1)
    .

% display all attributes for your answer
all_options(X) :-
    unique(AllOptions),
    (X==celebs -> nth0(0, AllOptions, List), print_list(List, 0)
     ;
     X==animals -> nth0(1, AllOptions, List), print_list(List, 0)
     ;
     X==sports -> nth0(2, AllOptions, List), print_list(List, 0)
     ;
     write('Usage: all_options(X), X = {sports, animals, celebs}')
    )
    .
















