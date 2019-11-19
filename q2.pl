menu("hungry",1,1,1).
menu("diet",1,0,0).
menu("diet",0,1,0).
menu("diet",0,0,1).
menu("not so hungry",1,1,0).
menu("not so hungry",0,1,1).


item(1,1,"Corn Tikki",30).
item(1,2,"Tomato Soup",20).
item(1,3,"Chilli Paneer",40).
item(1,4,"Crispy chicken",40).
item(1,5,"Papdi Chaat",20).
item(1,6,"Cold Drink",20).

item(2,1,"Kadhai Paneer with Butter/Plain Naan",50).
item(2,2,"Veg Korma with Butter/Plain Naan",40).
item(2,3,"Murgh Labadar with Butter/Plain Naan",50).
item(2,4,"Veg Dum Biryani with Dal Tadka",50).
item(2,5,"Steam Ricd with Dal Tadka",40).

item(3,1,"Ice-cream",20).
item(3,2,"Malai Sandwich",30).
item(3,3,"Rasmalai",10).



/*Given a Status,the products which he can eat are printed,This is the rule for that*/

find_items(Status,X,Y,Z):-

  menu(Status,X,Y,Z),Status=="hungry",item(1,_,A,_),item(2,_,C,_),item(3,_,E,_),string_concat(A," ,",G),string_concat(G,C,H),string_concat(H," ,",I),string_concat(I,E,J),writeln(J);
 
  menu(Status,X,Y,Z),Status=="diet",X==1,sum(1,40,[]);
  menu(Status,X,Y,Z),Status=="diet",Y==1,sum(2,40,[]);
  menu(Status,X,Y,Z),Status=="diet",Z==1,sum(3,40,[]);

  menu(Status,X,Y,Z),Status="not so hungry",X==1,sum1(1,80,[]);
  menu(Status,X,Y,Z),Status="not so hungry",Z==1,sum1(2,80,[]).



/*Used for diet Status*/
/*An item is selected ,if its already in list F,it is ignored ,checked for calary count,if well within limit added to list F and when adding we print the list*/
sum(X,Count,F):-item(X,C,A,B),\+member(A,F),Count>=B,P is Count-B,D=[A],append(F,D,E),writeln(E),sum(X,P,E).




/*Used for not so hungry status*/
/*An item is selected from categories 1 and 2 or from categories 2 and 3 such that calary count<80 and is printed thererafter.*/
sum1(X,Count,F):-item(X,C,A,B),Count>=B,P is Count-B,D=[A],append(F,D,E),W is X+1,item(W,J,K,L),P>=L,Q=[K],append(E,Q,H),writeln(H).


/*,M is P-L,s1(X,M,C,J,H).*/
/*s1(X,M,C,J,F):-X==1,item(Z,Y,A,B),Z==1,Y>C,M>=B,P is M-B,D=[A],append(F,D,E),writeln(E),s1(X,P,Y,J,E);X==1,item(Z,Y,A,B),Z==2,Y>J,M>=B,P is M-B,D=[A],append(F,D,E),writeln(E),s1(X,P,C,Y,E);X==2,item(Z,Y,A,B),Z==2,Y>C,M>=B,P is M-B,D=[A],append(F,D,E),writeln(E),s1(X,P,Y,J,E);X==2,item(Z,Y,A,B),Z==3,Y>J,M>=B,P is M-B,D=[A],append(F,D,E),writeln(E),s1(X,P,C,Y,E).*/

               






