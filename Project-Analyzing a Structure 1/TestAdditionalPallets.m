roofHeight = 10;
pallets = [3, 2, 4;
           4, 1, 3;
           1, 4, 5];
palletHeight = 2;

ap = additionalPallets(roofHeight, pallets, palletHeight);
display(ap);
