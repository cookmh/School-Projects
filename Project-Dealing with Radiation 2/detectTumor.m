%Mitchell Cook
%2/12/2020
%Section 032
%Partner cooperdj
function [ hasTumor ] = detectTumor( brain )
    %detectTumor Returns whether or not a tumor was found in the image.
    %     brain: a matrix of numbers representing a grayscale image of a 
    %            brain scan. Bright areas may be tumors and need to
    %            be flagged for further testing.
    %            To get test data for this function, you may call the
    %            provided scan_brain() function and pass the value it
    %            returns into this function. However, DO NOT call
    %            scan_brain() in the code for this function itself.
    
    
    filterbrain = removeNoise(brain,6);
    %the noise has been removed from brain 6
    brainscanner = (filterbrain > 0.88);
    %brainscanner finds any colors over a value of .88, equating to a tumor
    tumorffinder = any(any(brainscanner));
    %tumorffinder adds up all trues of brainscanner
    hasTumor =  tumorffinder;
    %if tumorffinder is true, hasTumor is also true

end

