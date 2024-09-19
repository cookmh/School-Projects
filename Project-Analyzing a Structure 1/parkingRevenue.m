% Mitchell Cook, Partner: cooperdj , Section 032, 1/30/2020
function [revenue] = parkingRevenue(timeUsed, price)
%parkingRevenue computes the revenue from parking fees
% timeUsed: a matrix with the number of hours each spot was used
% price: a matrix with the price per hour for each spot
% ONLY THE EDGE VALUES FROM EACH MATRIX SHOULD BE USED
%
% revenue: the total amount earned from all parking spots

timerow1 = timeUsed(1,:); %Takes the entire first row of time
timerow2 = timeUsed(end,2:end-1); %Takes bottom center portion of matrix, not first and last element, so to not overlap with timecol1 and timecol2


timecol1 = timeUsed(2:end,1); %Takes entire first column of time minus first element, so it doesnt overlap with timerow1
timecol2 = timeUsed(2:end,end); %Takes last column of time minus first elemtn, so it doesnt overlap with timerow2


pricerow1 = price(1,:);
pricerow2 = price(end,2:end-1);

pricecol1 = price(2:end,1);
pricecol2 = price(2:end,end);

%Exact same process as turing the timeUsed matrix into seperate rows and
%colums to isolate all of the elements from the empty inside of the matrix
row1 = timerow1 .* pricerow1;
row2 = timerow2 .* pricerow2;
col1 = timecol1 .* pricecol1;
col2 = timecol2 .* pricecol2;

%Time * dollars / time gives dollars which is what we want
%Multiplying the respective time and row columns to produce four different
%variables which each represent revenue

revenue = sum(row1) + sum(row2) + sum(col1) + sum(col2); 

%Sums all of the row and column revenues individully to get four scalar values,
% and then adds all of the four scalar values to get the total revenue











end