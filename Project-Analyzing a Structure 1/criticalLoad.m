% Mitchell Cook, Partner: cooperdj , Section 032, 1/30/2020
function [P_cr] = criticalLoad(E, I, K, L)
%criticalLoad computes Euler?s critical load for a column with
% structural parameters: E, I, K, and L.
% E: Modulus of elasticity of the column material
% I: Minimum moment of inertia across cross section of the column
% K: Column effective length factor
% L: Length of column
%
% P_cr: Euler?s critical load of column

    [P_cr] = ((pi.^2).*(E.*I))./((K.*L).^2); %Transforming the critical load equation using MatLab operators
    
end 