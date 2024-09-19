%Mitchell Cook
%2/12/2020
%Section 032
%Partner cooperdj
function [ img ] = zones( img, rad )
    %zones Generates an image colored according to radiation threat 
    %  zones. Values from rad are used to determine the zone, and the hue
    %  value in img is set accordingly.
    %     img: a 3-dimensional matrix of numbers representing an image in
    %          RGB (red-green-blue) format, which forms the background for
    %          to which the heatmap colors are applied.
    %     rad: a matrix of numbers representing the radiation
    %          measurements, between 0 and 100 millisieverts.
    %          It is has the same width and height as the img parameter.


    zoneshsv = rgb2hsv(img);
    %changing image from hsv to rgb
    
    hue = zoneshsv(:,:,1); 
    sat = zoneshsv(:,:,2); 
    val = zoneshsv(:,:,3);
    %setting hue, saturation, and values of zonehsv
    sat = 1;
    
    hue(rad >= 90) = 0;
    hue(rad < 90 & rad >= 70) = 0.1;
    hue(rad < 70 & rad >= 50) = 0.2;
    hue(rad < 50 & rad >= 20) = 0.4;
    hue(rad < 20 & rad >= 0) = 0.6;
    %hue is being changed according to table
    zoneshsv(:,:,1) = hue;
    zoneshsv(:,:,2) = sat;
    zoneshsv(:,:,3) = val;
    %hue, sat, and val of zonehsv are being reset
    img = hsv2rgb(zoneshsv);
    %image is being converted back to rgb
end

