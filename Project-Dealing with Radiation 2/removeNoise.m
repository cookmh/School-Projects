%Mitchell Cook
%2/12/2020
%Section 032
%Partner cooperdj
function [ rad ] = removeNoise( rad, n )
    %removeNoise Removes noise from a matrix of radiation values by
    %  applying an nxn mean filter three times.
    %       n: The size of the filter (e.g. if n=3, use a 3x3 filter)
    %     rad: a matrix of numbers representing the radiation
    %          measurements from the scanner.
    %          NOTE: A matrix obtained from a call to the scan_radiation()
    %          may be used as an input argument when calling this function,
    %          but you should NOT call scan_radiation() inside of this
    %          function!
    
    replace = ones(n);
    replace = replace .* (1/n.^2);
    % replace computes an average of close values
    
    rad = imfilter(rad,replace,'replicate');
    rad = imfilter(rad,replace,'replicate');
    rad = imfilter(rad,replace,'replicate');
    % repeated three times to apply filter three times
end