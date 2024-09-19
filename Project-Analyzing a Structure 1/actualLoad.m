% Mitchell Cook, Partner: cooperdj , Section 032, 1/30/2020
function [maxLoad] = actualLoad(W)
%actualLoad computes the largest load any of the support poles would
% need to bear based on the distribution of forces in the W matrix. We
% assume each pole is solely responsible for the forces in its
% quadrant.
% W: Weights matrix (Distribution of weight on the roof)
%
% maxLoad: the largest load among any of the four support poles

matrixW = size(W); % Gives dimensions of Matrix W of any size

    
if rem(matrixW(1),2) == 1 
    end
    
if rem(matrixW(2),2) ==1
    end
%Ends program if either dimension is odd, because a square of 4 equally sized quadrants
%wouldnt be possible otherwise
    
rowquad = matrixW(1) ./ 2;  %Gives row length of each quadrant
colquad = matrixW(2) ./ 2;  %Gives column length of each quadrant
     

   qone = W(1:rowquad,1:colquad);
   qtwo = W(rowquad + 1:rowquad.*2,1:colquad);
   qthree = W(1:rowquad,colquad + 1:colquad.*2);
   qfour = W(rowquad + 1:rowquad.*2,colquad + 1:colquad.*2);
   
   %Seperates the entire matrix into each of the different quadrants
   
   sum1 = sum(sum(qone));
   sum2 = sum(sum(qtwo));
   sum3 = sum(sum(qthree));
   sum4 = sum(sum(qfour));
   
   %Sums all of the elements in each of the quadrants
   
   maxLoad = max([sum1,sum2,sum3,sum4]); % Finds max out of all the differents quadrants
   
   
   
end