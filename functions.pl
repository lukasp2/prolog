% THE FOLLOWING TWO FUNCTIONS ARE CALLED IN THE BEGINNING OF EACH TURN
% TO CHOOSE A CATEGORY (INPUT FROM USER) AND AN ANSWER.
choose_category() :-
    games_counter(Value),
    write("Game No. "), write(Value), write("/5"), nl(),

    init_questions_counter(),

    write('What category would you like? sport/animal/celeb (press q to exit)'), nl(),
    read(Input),
        (Input==q -> abort
        ;
         Input==sport -> sports(AllSports), randomize_answer(Input, AllSports)
        ;
         Input==animal -> animals(AllAnimals), randomize_answer(Input, AllAnimals)
        ;
         Input==celeb -> celebs(AllCelebs), randomize_answer(Input, AllCelebs)
        ;
        write("Thats not a valid answer, I'll go to sleep now ..."), abort
        ),

    write('Can you guess what '), print(Input), write(' I am thinking about?'), nl(),
    input()
    .

randomize_answer(Input, CategoryList) :-
    write("Alright, "), write(Input), write("s it is!"), nl(), nl(),
    random_member(AnsList, CategoryList),
    retractall(answer(_)),
    assertz(answer(AnsList))
    .

% THIS FUNCTION IS CALLED AFTER EACH QUESTION THAT THE USER ASKS, AND
% DISPLAYS THE TOTAL NUMBER OF QUESTIONS THAT HAVE BEEN ASKED.
input():-
    incr_questions_counter(),

    questions_counter(10),
    write("OK, you have asked me 10 questions, now you need you guess what I'm"), nl(),
    write("thinking about."), nl()
    ;
    questions_counter(Q_count),
    write("This will be question number "), write(Q_count),
    write("/10"), nl(), nl()
    .

% THE USER ASKS QUESTIONS BY CALLING THIS FUNCTION.
has(Attr) :-
    questions_counter(10),
    write('You have already asked me 10 questions, you need to guess!'),nl()
    ;
    answer(Ans), nth0(1, Ans, AnsAttributes), member(Attr, AnsAttributes),
    write("Yes, that is an attribute!"), nl(), input()
    ;
    write("No, that is not an attribute .."), nl(), input()
    .

% THE FOLLOWING 4 FUNCTIONS ARE CALLED WHEN 'is()' IS CALLED.
is(Guess) :-
    answer(Answer), member(Guess, Answer),
    correct()
    ;
    incorrect(Guess)
    .

% if the answer was right
correct() :-
    write("Wow, what a lucky guess"), nl(), nl(),
    incr_corr_answers_counter(),
    next_game()
    .

% if the answer was wrong
incorrect(Guess) :-
    answer(Ans),
    nth0(0, Ans, Idx0),
    nth0(1, Ans, Idx1),
    write("Haha, "), write(Guess), write("?? Not even close."), nl(), nl(),
    write("The answer was '"), write(Idx0), write("', how did you not get that?"), nl(),
    write("The attributes were "), write(Idx1), nl(), nl(),
    next_game()
    .

% checks if we have played all the turns, if so prints statistics.
next_game() :-
    games_counter(5), %%%%%%% GAME COUNT
    corr_answers_counter(Val),
    write("Ok that's it! Congratulations, you got "), write(Val),
    write("/5 answers right.")
    ;
    incr_games_counter(),
    write("Lets do this again ..."), nl(), nl(),
    choose_category()
    .

% COUNTER FUNCTIONS
incr_games_counter() :-
    games_counter(Value),
    retractall(games_counter(_)),
    succ(Value, Incr),
    assertz(games_counter(Incr))
    .

init_questions_counter() :-
    retractall(questions_counter(_)),
    assertz(questions_counter(0))
    .

incr_questions_counter() :-
    questions_counter(Value),
    retractall(questions_counter(_)),
    succ(Value, Incr),
    assertz(questions_counter(Incr))
    .

incr_corr_answers_counter() :-
    corr_answers_counter(Value),
    retractall(corr_answers_counter(_)),
    succ(Value, Incr),
    assertz(corr_answers_counter(Incr))
    .






















