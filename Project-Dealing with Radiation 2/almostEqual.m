
% Helper function to compare floating point values
function [isEqual] = almostEqual(actual, correct)
  if ~isequal(size(actual), size(correct))
    isEqual = false;
  else
    matches = abs(actual - correct) < 0.01;
    isEqual = all(matches(:));
  end
end