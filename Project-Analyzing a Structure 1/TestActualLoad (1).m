% Mitchell Cook, Partner: cooperdj , Section 032, 1/30/2020
%% Unit test for a case with the largest load in quadrant 1
W = [5, 4, 4, 3 ;
3, 9, 8, 3 ;
4, 2, 1, 8 ;
3, 4, 1, 2 ];
result = actualLoad(W);
expectedResult = 21;
assert(almostEqual(result, expectedResult));
% REQUIRED - Add more tests here
%Test for max not being in the first quadrant

%Quad 1 maximum load is in the first quadrant, and is equal to 35
W = [10, 5, 4, 3 ;
5, 15, 8, 3 ;
4, 2, 1, 8 ;
3, 4, 1, 2 ];
result = actualLoad(W);
expectedResult = 35;
assert(almostEqual(result, expectedResult));
%Quad 2 maximum load is in the second quadrant, and is equal to 53
W = [5, 4, 5, 3 ;
3, 9, 8, 3 ;
14, 12, 1, 8 ;
13, 14, 1, 2 ];
result = actualLoad(W);
expectedResult = 53;
assert(almostEqual(result, expectedResult));

%Quad 3 maximum load is in the third quadrant, and is equal to 75
W = [5, 4, 25, 15 ;
3, 9, 25, 10 ;
4, 2, 1, 8 ;
3, 4, 1, 2 ];
result = actualLoad(W);
expectedResult = 75;
assert(almostEqual(result, expectedResult));

%Quad 4 maximum load is in the fourth quadrant, and is equal to 52
W = [5, 4, 4, 3 ;
3, 9, 8, 3 ;
4, 2, 11, 18 ;
3, 4, 11, 12 ];
result = actualLoad(W);
expectedResult = 52;
assert(almostEqual(result, expectedResult));

%Square Test, Matrix is 4x6 and the maximum load is in the first quadrant
W = [15, 5, 20, 3,2,8 ;
10, 10, 5, 3,3,8 ;
4, 2, 1, 8,2,5 ;
3, 4, 1, 2,6,2 ];
result = actualLoad(W);
expectedResult = 65;
assert(almostEqual(result, expectedResult));

%% We only get to this point if all asserts passed successfully
disp('actualLoad: ALL TESTS PASS');