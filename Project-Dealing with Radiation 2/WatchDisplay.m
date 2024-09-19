%Mitchell Cook
%2/12/2020
%Section 032
%Partner cooperdj

% Driver program for smartwatch display

clear

domepic = imread('dome_area.jpg');


%% Get GPS data from user
% Note: For testing, use the following values
%   - row 622
%   - colum 942 
%   - time 935
% After you verify that you can create the sample images from the 
% project specs, then use the values returned by the GPS_data() function.

[r,c,t] = GPS_data(); 



%% Get display settings
% Note: For testing, use a zoom offset value of 173
% After you verify that you can create the sample images from the 
% project specs, then use the values returned by the displaySettings() function.

zoffset = display_settings();


%% Create the heatmap_local.png and zones_local.png images
% See the project spec for details.

radmap = scan_radiation(t);
%getting radiation data from the scanner
radmap = removeNoise(radmap,15);
%removing noice in the radiation data

zoomsize = radmap(r - zoffset : r + zoffset, c - zoffset : c + zoffset);
domepic = domepic(r - zoffset : r + zoffset, c - zoffset : c + zoffset,:);

zheatmap = heatmap(domepic,zoomsize);
zoomzones = zones(domepic,zoomsize);
%creating the local version of the heatmap and the zones image


imwrite(zheatmap,'heatmap_local.png')
imwrite(zoomzones,'zones_local.png')




