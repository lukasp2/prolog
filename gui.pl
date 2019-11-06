:- use_module(library(pce)).

gui :-
    new(D, dialog('10 Questions')),
    send(D, append, label("hello sddpl")),
    send(D, append, label("hello sddpl")),
    send(D, append, label("hello sddpl")),

    send(D, append, button(ok, message(@prolog, pressed, D))),
    send(D, open)
    .

pressed(D) :-
    send(D, destroy),
    gui_category.

gui_category :-
    new(D, dialog('10 Questions')),
    new(T, text_item(category)),
    send(D, append, T),
    send(D, append, button("OK", message(@prolog, choose_cat, T))),
    send(D, append, button("Exit Game", message(@prolog, end, D))),
    send(D, open).

choose_cat(T):-
    get(T, value, Text), writeln(Text),
    new(D, message(@prolog, format, Text, @arg1)),
    send(D, forward, .),
    send(T, destroy).

end(D) :-
    send(D, destroy).


text_box(TB, Text) :-
        new(TB, device),
        send(TB, display, new(B, box(300, 200))),
        send(TB, display, new(T, text(Text, center, normal))),
        send(T, center, B, center)

        .
