timeUsed = [0.5 4.0 8.0 1.2;
            3.0 0.0 0.0 5.0;
            7.4 0.0 0.0 3.5;
            2.0 1.0 1.5 4.0];
 
price = [0.8 0.8 0.9 0.9;
         0.8 0.0 0.0 0.9;
         1.5 0.0 0.0 1.5;
         1.5 1.5 1.5 1.9];
     
revenue = parkingRevenue(timeUsed, price);
display(revenue);
