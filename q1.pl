decode(S,F):-numeric_string(S),string_length(S,N),check(S,N,K),F is K; 
			  Count is 0,F is Count.



numeric_string(String) :-
    atom_string(Atom, String),            /*this rule checks whether the give input string is comprised only of numbers or not*/
    atom_number(Atom, N),N>=0.


check(S,N,K):-
N==0,K is 1;
N==1,S=="0",K is 0;                     /*if string starting with 0 its not a valid string*/
N==1,S\=="0",K is 1;
N>1,check1(S,N,P),check2(S,N,M),K is P+M;    /*two subcases possible string */																	
Count is 0,K is Count.						
											

check1(S,N,K):- X is N-1,sub_string(S,X,1,_,D),D>"0",sub_string(S,0,X,_,E),check(E,X,P),K is P; /*Case1  deocding using first n-1 digits + lastdigit */
             X is N-1,sub_string(S,X,1,_,D),D=="0",K is 0.


check2(S,N,K):-   /*Case2  decoding using first n-2 digits+ last2digits*/

  X is N-2,Y is N-1,sub_string(S,X,1,_,D),sub_string(S,0,X,_,E),sub_string(S,Y,1,_,F),D=="1",check(E,X,P),K is P;
  X is N-2,Y is N-1,sub_string(S,X,1,_,D),sub_string(S,0,X,_,E),sub_string(S,Y,1,_,F),D=="2",F<"7",check(E,X,P),K is P;

  X is N-2,Y is N-1,sub_string(S,X,1,_,D),sub_string(S,0,X,_,E),sub_string(S,Y,1,_,F),D=="2",F>"7",K is 0;
  X is N-2,Y is N-1,sub_string(S,X,1,_,D),sub_string(S,0,X,_,E),sub_string(S,Y,1,_,F),D>="3",K is 0;
  Count is 0,K is Count.