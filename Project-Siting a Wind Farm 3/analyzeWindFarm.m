% Names: Peter Jaskoski, Mitchell Cook
% Uniquenames: pjask, cookmh
% ENGR 101 lab session: 032
% Date: 2/24/2020

function [ c1, c2, c3, c4, c5 ] = analyzeWindFarm( filenameWind, filenameWave, filenameBuoy, windSpeedMin, windSpeedMax, waveHeightMax, waveHeightRisk, deckHeight )
% Function to complete Task 1. Evaluates the 5 constraints on the location of a
% wind farm.
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
%         waveHeightMax: for constraints 2 & 3 -- maximum wave height (m)
%        waveHeightRisk: for constraint 3 -- maximum wave height risk (%)
%            deckHeight: for constraint 4 -- height of the deck that supports 
%                        the turbine base (m)
%
%   return values:
%                    c1: boolean values corresponding to whether the wind 
%                        farm location passes constraint #1
%                    c2: boolean values corresponding to whether the wind 
%                        farm location passes constraint #2
%                    c3: boolean values corresponding to whether the wind 
%                        farm location passes constraint #3
%                    c4: boolean values corresponding to whether the wind 
%                        farm location passes constraint #4
%                    c5: boolean values corresponding to whether the wind 
%                        farm location passes constraint #5

% Imports the files
wind = csvread(filenameWind);
heights = csvread(filenameWave);
buoy = csvread(filenameBuoy, 5, 0);
buoyHeights = buoy(:, 2);
% returns row vector with (lat,lon) 
buoyLoc = csvread(filenameBuoy, 1, 1,[1 1 1 2]);


% Constraint 1

%pulls the windspeed at the specific location
windSpeed = wind(buoyLoc(1,1), buoyLoc(1,2));
%returns true if the windspeed falls into the constraints
c1 = (windSpeed >= windSpeedMin & windSpeed <= windSpeedMax);


% Constraint 2

%pulls the waveheight at the specific location 
waveHeight = heights(buoyLoc(1,1), buoyLoc(1,2));
%returns true if any wave heights are over the wave height max 
c2 = (waveHeight < waveHeightMax);


% Constraint 3 

% number of waveheights that are less that a specific maximum
numWaveConst = sum(buoyHeights < waveHeightMax);
% number of waves recorded
numWaves = buoyHeights;
numWaves = (numWaves >= 0);
numWaves = sum(numWaves);
% ratio of waves under the limit over number of waves total
eval = (numWaveConst ./ numWaves);
% returns true if the ratio is greater than the risk 
risk = waveHeightRisk .* 0.01;
c3 = (eval > risk);


%Constraint 4

rogueHeights = 2.* buoyHeights;
rogueHeights = (rogueHeights < deckHeight);
% returns false if any rogue wave height is larger than the deckheight
c4 = all(rogueHeights);


% Constraint 5

stdevHeights = std(buoyHeights);
% pulls the height at the lat lon and crates a scalar that is 5% of it 
avgHeight = (heights(buoyLoc(1,1), buoyLoc(1,2)) .*0.05);
% returns true if the standard deviation is less that the average height
c5 = (stdevHeights < avgHeight);

end

