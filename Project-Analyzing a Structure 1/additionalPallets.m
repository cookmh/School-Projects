% Mitchell Cook, Partner: cooperdj , Section 032, 1/30/2020
function [numPallets] = additionalPallets(roofHeight, pallets, palletHeight)
    %additionalPallets computes the number of additional storage pallets
    %     that can fit in the storage area of the structure
    %     roofHeight: scalar representing the height of the roof
    %     pallets: a matrix representing the number of pallets in 
    %              each storage cell of the storage area
    %     palletHeight: scalar representing the height of a single pallet
    %
    %     numPallets: number of additional pallets that can fit in 
    %                 the storage area

 Dims = size(pallets); %Finds dimensions of the pallet matrix
 floorarea = Dims(1) .* Dims(2); %Finds the area of the entire floor, by multiplying the dimensions of the matrix
 maxpallets =  (floor(roofHeight ./ palletHeight)) .* floorarea; %Finds the absolute most amount of pallets that can feasibly fit in the area
 numPallets = maxpallets - sum(sum(pallets)); %Takes the max amount of pallets possible, and subtracts from how many total pallets are remaining, to give how much space we have left
 



end