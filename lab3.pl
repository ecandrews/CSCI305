% Elizabeth Andrews
% Prolog Lab
% collaboration with Brock Ellefson

% Question 1

connected(1,2).
connected(3,4).
connected(5,6).
connected(7,8).
connected(9,10).
connected(12,13).
connected(13,14).
connected(15,16).
connected(17,18).
connected(19,20).
connected(4,1).
connected(6,3).
connected(4,7).
connected(6,11).
connected(14,9).
connected(11,15).
connected(16,12).
connected(14,17).
connected(16,19).

% tells from which points in the maze you can get to which other points.
% there is a path connecting X and Y if
path(X,Y) :-
  % there is a rule saying that X and Y are connected
  % base case
  connected(X,Y);
  % a path exists from X to another number, and from that number to Y
  % recursive step
  connected(X,Z), path(Z,Y).



% Question 2
byCar(auckland,hamilton).
byCar(hamilton,raglan).
byCar(valmont,saarbruecken).
byCar(valmont,metz).

byTrain(metz,frankfurt).
byTrain(saarbruecken,frankfurt).
byTrain(metz,paris).
byTrain(saarbruecken,paris).

byPlane(frankfurt,bangkok).
byPlane(frankfurt,singapore).
byPlane(paris,losAngeles).
byPlane(bangkok,auckland).
byPlane(singapore,auckland).
byPlane(losAngeles,auckland).

% determines whether it is possible to travel from one city to another.
% it is possible to travel from X to Y if
travel(X,Y) :-
  % there is a rule saying you can travel directly from X to Y by some means of transportation
  % base case
  byCar(X,Y);
  byTrain(X,Y);
  byPlane(X,Y);
  % you can travel from X to some other city, then from that city to your destination
  % recursive case
  (byCar(X,Z); byTrain(X,Z); byPlane(X,Z)), travel(Z,Y).



% Question 3

% uses the travel/2 query to find the exact path from X to Y
% exact path from X to Y if there is an exact rule connecting the two 
travel(X,Y,go(X,Y)) :- 
  % base case
  byCar(X,Y); 
  byPlane(X,Y); 
  byTrain(X,Y).
% exact path from X to Y if the cities are not adjacent
travel(X,Y,go(X,Z,R)) :-
  % if you can travel from X to Z, and then from Z to Y
  % recursive case
  (byCar(X,Z); byPlane(X,Z); byTrain(X,Z)), travel(Z,Y,R).



% Extra Credit

% produces a mirror image of a tree
% creates a tree Z with two child nodes X and Y
tree(X,Y,Z) :- Z = (X,Y). 
% swaps two leaves in a tree
swap(leaf(X), leaf(X)).
% takes in two trees and swaps all the nodes to make the mirror image
swap(tree(Y,Z), tree(J,K)) :- swap(Y,K), swap(Z,J).






