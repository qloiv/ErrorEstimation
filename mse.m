function [ err ] = mse( func1, func2 )
%MSE Summary of this function goes here
%   Detailed explanation goes here

err = mean(abs(func1-func2).^2)
end

