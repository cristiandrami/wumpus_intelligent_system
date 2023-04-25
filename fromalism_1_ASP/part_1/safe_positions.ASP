dim(3).
matrix(0,0).
matrix(0,1).
matrix(0,2).
matrix(1,0).
matrix(1,1).
matrix(1,2).
matrix(2,0).
matrix(2,1).
matrix(2,2).


knowledge(1,0, stench).
knowledge(0,1, stench).
knowledge(1,2, stench).
knowledge(2,1, stench).

knowledge(1,1,pit).

hero(2,0).




knowledge(X,Y, safe) :- knowledge(X,Y, breeze).
knowledge(X,Y, safe) :- knowledge(X,Y, stench).



knowledge(X1,Y1, gold)  :- knowledge(X1, Y1, glitter).
knowledge(X2,Y, safe) :- hero(X1,Y), not knowledge(X1,Y, stench), not knowledge(X1,Y, breeze), dim(D), X2=X1+1, X2<D.
knowledge(X2,Y, safe) :- hero(X1,Y), not knowledge(X1,Y, stench), not knowledge(X1,Y, breeze), X2=X1-1, X1!=0.
knowledge(X,Y2, safe) :- hero(X,Y1), not knowledge(X,Y1, stench), not knowledge(X,Y1, breeze), dim(D), Y2=Y1+1, Y2<D.
knowledge(X,Y2, safe) :- hero(X,Y1), not knowledge(X,Y1, stench), not knowledge(X,Y1, breeze), Y2=Y1-1, Y1!=0.



knowledge(X2,Y2, possiblePit) :- not knowledge(X2,Y2,pit), not knowledge(X2,Y2,wumpus), not knowledge(X2,Y2,safe), knowledge(X1, Y1, breeze), dim(D), X2<D,  X2=X1+1, Y2=Y1.
knowledge(X2,Y2, possiblePit) :- not knowledge(X2,Y2,pit), not knowledge(X2,Y2,wumpus), not knowledge(X2,Y2,safe), knowledge(X1, Y1, breeze), dim(D), Y2<D, X2=X1, Y2=Y1+1.
knowledge(X2,Y2, possiblePit) :- not knowledge(X2,Y2,pit), not knowledge(X2,Y2,wumpus), not knowledge(X2,Y2,safe), knowledge(X1, Y1, breeze), X2=X1-1, Y2=Y1, X1!=0.
knowledge(X2,Y2, possiblePit) :- not knowledge(X2,Y2,pit), not knowledge(X2,Y2,wumpus), not knowledge(X2,Y2,safe), knowledge(X1, Y1, breeze), X2=X1, Y2=Y1-1, Y1!=0.
 
knowledge(X2,Y2, possibleWumpus) :- not knowledge(X2,Y2,pit), not knowledge(X2,Y2,wumpus), not knowledge(X2,Y2,safe), knowledge(X1, Y1, stench), dim(D), X2<D, X2=X1+1, Y2=Y1.
knowledge(X2,Y2, possibleWumpus) :- not knowledge(X2,Y2,pit), not knowledge(X2,Y2,wumpus), not knowledge(X2,Y2,safe), knowledge(X1, Y1, stench), dim(D), Y2<D, X2=X1, Y2=Y1+1.
knowledge(X2,Y2, possibleWumpus) :- not knowledge(X2,Y2,pit), not knowledge(X2,Y2,wumpus), not knowledge(X2,Y2,safe), knowledge(X1, Y1, stench), X2=X1-1, Y2=Y1, X1!=0.
knowledge(X2,Y2, possibleWumpus) :- not knowledge(X2,Y2,pit), not knowledge(X2,Y2,wumpus), not knowledge(X2,Y2,safe), knowledge(X1, Y1, stench), X2=X1, Y2=Y1-1, Y1!=0.

%wumpus from knowledge when X is not 0 and y not 0
knowledge(X,Y, wumpus) :- knowledge(X1, Y, stench),knowledge(X2, Y, stench), knowledge(X, Y1, stench), knowledge(X, Y2, stench), X!=0, Y!=0, X1=X-1, X2=X+1, Y1=Y-1, Y2=Y+1.

%wumpus from knowledge when X is 0 and y not 0
knowledge(X,Y, wumpus) :- knowledge(X2, Y, stench), knowledge(X, Y1, stench), knowledge(X, Y2, stench), X=0, Y!=0, X2=X+1, Y1=Y-1, Y2=Y+1.

%wumpus from knowledge when X is not 0 and y is 0
knowledge(X,Y, wumpus) :- knowledge(X1, Y, stench),knowledge(X2, Y, stench), knowledge(X, Y2, stench), X!=0, Y=0, X1=X-1, X2=X+1, Y2=Y+1.

%wumpus from knowledge when X is 0 and y is 0
knowledge(X,Y, wumpus) :- knowledge(X2, Y, stench), knowledge(X, Y2, stench), X=0, Y=0, X2=X+1, Y2=Y+1.



%pit from knowledge when X is not 0 and y not 0
knowledge(X,Y, pit) :- knowledge(X1, Y, breeze),knowledge(X2, Y, breeze), knowledge(X, Y1, breeze), knowledge(X, Y2, breeze), X!=0, Y!=0, X1=X-1, X2=X+1, Y1=Y-1, Y2=Y+1.

%pit from knowledge when X is 0 and y not 0
knowledge(X,Y, pit) :- knowledge(X2, Y, breeze), knowledge(X, Y1, breeze), knowledge(X, Y2, breeze), X=0, Y!=0, X2=X+1, Y1=Y-1, Y2=Y+1.

%pit from knowledge when X is not 0 and y is 0
knowledge(X,Y, pit) :- knowledge(X1, Y, breeze),knowledge(X2, Y, breeze), knowledge(X, Y2, breeze), X!=0, Y=0, X1=X-1, X2=X+1, Y2=Y+1.

%pit from knowledge when X is 0 and y is 0
knowledge(X,Y, pit) :- knowledge(X2, Y, breeze), knowledge(X, Y2, breeze), X=0, Y=0, X2=X+1, Y2=Y+1.
