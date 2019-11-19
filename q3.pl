
/*Distances from 1 pt to another are stored in this fact 1st pt indicates starting gate number and 2n point indicated ending gate number*/
dist(1,5,4).
dist(2,5,6).
dist(3,5,8).
dist(4,5,9).
dist(1,6,10).
dist(2,6,9).
dist(3,6,3).
dist(4,6,5).
dist(5,7,3).
dist(5,10,4).
dist(5,11,6).
dist(5,12,7).
dist(5,6,7).
dist(5,8,9).
dist(6,8,2).
dist(6,12,3).
dist(6,11,5).
dist(6,10,9).
dist(6,7,10).
dist(7,10,2).
dist(7,11,5).
dist(7,12,7).
dist(7,8,10).
dist(8,9,3).
dist(8,12,3).
dist(8,11,4).
dist(8,10,8).
dist(10,15,5).
dist(10,11,2).
dist(10,12,5).
dist(11,15,4).
dist(11,13,5).
dist(11,12,4).
dist(12,13,7).
dist(12,14,8).
dist(15,13,3).
dist(13,14,4).
dist(14,17,5).
dist(14,18,4).
dist(17,18,8).







dist(5,1,4).
dist(5,2,6).
dist(5,3,8).
dist(5,4,9).
dist(6,1,10).
dist(6,2,9).
dist(6,3,3).
dist(6,4,5).
dist(7,5,3).
dist(10,5,4).
dist(11,5,6).
dist(12,5,7).
dist(6,5,7).
dist(8,5,9).
dist(8,6,2).
dist(12,6,3).
dist(11,6,5).
dist(10,6,9).
dist(7,6,10).
dist(10,7,2).
dist(11,7,5).
dist(12,7,7).
dist(8,7,10).
dist(9,8,3).
dist(12,8,3).
dist(11,8,4).
dist(10,8,8).
dist(15,10,5).
dist(11,10,2).
dist(12,10,5).
dist(15,11,4).
dist(13,11,5).
dist(12,11,4).
dist(13,12,7).
dist(14,12,8).
dist(13,15,3).
dist(14,13,4).
dist(17,14,5).
dist(18,14,4).
dist(18,17,8).



/*Starting gate should be either 1,2,3 or 4 so we check that with this rule*/
check(H):-
H==1;
H==2;
H==3;
H==4.

valid([H|T]):- check(H),val([H|T]).


/*final gate is 17 for escaping,so if we reach here we return true*/
val([17]).

/*checked for path between 1st 2 elements of list and this is recursive*/
val([H,X|T]):-numeric_string(H),numeric_string(X),H>0,X>0,dist(H,X,_),val([X|T]).


/*Both all possible paths  and optimal path are defined using this same rule*/
/*We define a global variable max and keep updating when we reach a more optimal path.At the end this is printed*/
optpath:-nb_setval(total,0),nb_setval(max,1000),nb_setval(list,[1,2]),set1(1,0,[1]);
		set1(2,0,[2]);
		set1(3,0,[3]);
		set1(4,0,[4]);
		write("Total Paths ="),nb_getval(total,N1),writeln(N1),nb_getval(max,N2),write("Optimal distance = "),writeln(N2),nb_getval(list,N3),write("Optimal Path = "),writeln(N3).


set1(X,Y,Z):-find(X,Y,Z).

find(X,Y,Z):- dist(X,A,Cost),A=\=17,\+member(A,Z),D=[A],append(Z,D,E),C is Y+Cost,find(A,C,E);
dist(X,A,Cost),A==17,\+member(A,Z),D=[A],append(Z,D,E),writeln(E),C is Y+Cost,nb_getval(total,N),N1 is N+1,nb_setval(total,N1),nb_getval(max,B),C<B,nb_setval(max,C),nb_setval(list,E).











numeric_string(String) :-
    atom_string(Atom, String),            /*this rule checks whether the give input string is comprised only of numbers or not*/
    atom_number(Atom, _).
