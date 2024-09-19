%Mitchell Cook
%2/12/2020
%Section 032
%Partner cooperdj
function [ img ] = heatmap( img, rad )
    %heatmap Generates a heatmap image by using values from rad to set
    %  values in the hue channel for img. Hue values vary smoothly
    %  depending on the corresponding radiation level.
    %     img: a 3-dimensional matrix of numbers representing an image in
    %          RGB (red-green-blue) format, which forms the background
    %          to which the heatmap colors are applied.
    %     rad: a matrix of numbers representing the radiation
    %          measurements, between 0 and 100 millisieverts.
    %          It is has the same width and height as the img parameter.

    heatmaphsv = rgb2hsv(img);
    %converts rgb image to hsv
    hue = heatmaphsv(:,:,1); 
    sat = heatmaphsv(:,:,2); 
    val = heatmaphsv(:,:,3);
    %sets hue, sat, and val of heatmaphsv
    hue = 0.7 - 0.7.* rad ./ 100.0;
    %converts from radiation to the appropriate hue value using the
    %equation
    sat = 1;
    %saturation is set to one to ensure colors are as vibrant as possible
    heatmaphsv(:,:,1) = hue;
    heatmaphsv(:,:,2) = sat;
    heatmaphsv(:,:,3) = val;
    
    img = hsv2rgb(heatmaphsv);
    %image is converted back into rgb
end

