% Names: Peter Jaskoski, Mitchell Cook
% Uniquenames: pjask, cookmh
% ENGR 101 lab session: 032
% Date: 2/24/2020

function [  ] = makePlots( filenameWind, filenameWave, filenameBuoy, windSpeedMin, windSpeedMax, waveHeightMax )

% Function to complete Task 2. Creates a figure with multiple plots that 
% summarizes the environmental conditions for a wind farm.  Saves figure as 
% a .png file.
%
%   parameters: 
%          filenameWind: a string that names the file containing the 
%                        global-model-based average wind speed 
%                        (i.e. 'windSpeedTestCase.csv')
%          filenameWave: a string that names the file containing the 
%                        global-model-based average global wave heights 
%                        (i.e. 'waveHeightTestCase.csv')
%          filenameBuoy: a string that names the file containing the time 
%                        series of wave heights measured by the buoy          
%                        (i.e. 'buoyTestCase.csv')
%          windSpeedMin: for constraint 1 -- minimum wind speed (m/s)
%          windSpeedMax: for constraint 1 -- maximum wind speed (m/s)
%         waveHeightMax: for constraint 2 -- maximum wave height (m)
%
%   return values: none
%
%   notes:
%       Feel free to use different variable names than these if it makes 
%       your code more readable to you.  These are internal to your 
%       function, so it doesn't matter what you call them.

%% Load the data

% Get lat/lon data
lat = csvread('lat.csv');
lon = csvread('lon.csv');
wind = csvread(filenameWind);
heights = csvread(filenameWave);
buoy = csvread(filenameBuoy, 5, 0);
buoyHeights = buoy(:, 2);
buoyLoc = csvread(filenameBuoy, 1, 1,[1 1 1 2]);
% (lattitude, longitude), (y,x)

%% Figure Setup

% Set up the figure properties so it will be the correct size
Fig1 = figure(1);
Fig1.Units = 'normalized';
Fig1.OuterPosition = [0 0 0.5 1];

%% Make Plots

% Plot 1: Map of average wind speed across the planet 

[X,Y] = meshgrid(lon, lat);
subplot(3, 2, 1)
contourf(X, Y, wind,'LineStyle','none');
colormap(gca, 'parula');
colorbar('eastoutside');
title('Average Wind Speed (m/s) Across Planet');
xlabel('Longitude (deg)');
ylabel('Latitude (deg)');
xticks([0 100 200 300])
yticks([-50 0 50])


% Plot 2: Map of average wave height across the planet 

subplot(3, 2, 2)
contourf(X, Y, heights,'LineStyle','none');
colormap(gca, 'parula');
colorbar('eastoutside');
title('Average Wave Height (m) Across Planet');
xlabel('Longitude (deg)');
ylabel('Latitude (deg)');
xticks([0 100 200 300])
yticks([-50 0 50])


% Plot 3: Map of all potential wind farm locations based on constraints

const1 = (wind >= windSpeedMin & wind <= windSpeedMax);
const2 = (heights < waveHeightMax);
locations = (const1 .* const2);
subplot(3, 2, 3)
contourf(X, Y, locations,'LineStyle','none')
rg = gray;
rg = flipud(rg);
colormap(gca, rg);
title('Potential Wind Farm Locations');
xlabel('Longitude (deg)');
ylabel('Latitude (deg)');
xticks([0 100 200 300])
yticks([-50 0 50])
hold on
plot(lon(buoyLoc(1,2)), lat(buoyLoc(1,1)), 'rs')
hold off

% Plot 4: Histogram of buoy measured wave heights 

subplot(3, 2, 4)
histogram(buoyHeights);
axis([0 10 0 100]);
title('Wave Heights at Buoy Location');
xlabel('Wave Height (m)');
xticks([0 2 4 6 8 10])
ylabel('Number of Occurrences');
yticks([0 20 40 60 80 100])


% Plot 5: Time series of buoy measured wave heights 

time = buoy(:,1);
buoyavg = heights(buoyLoc(1,1), buoyLoc(1,2));
subplot(3,2, 5:6);
plot(time, buoyHeights);
yline(buoyavg, 'r');
axis([0 4500 0 10]);
title('Wave Heights Comparison: Global to Local (by Peter Jaskoski)');
xlabel('Time (Hours)');
xticks([0 500 1000 1500 2000 2500 3000 3500 4000 4500])
yticks([0 2 4 6 8 10])
legend('Buoy-Measured', 'Global Average', 'Location', 'northeast');
hold on
ylabel('Wave Height (m)');
hold off

%prints the figure out to a pdf

print('environmentalSummary.pdf','-dpdf', '-fillpage')


end

