function [ err ] = mse( func1, func2 )
%MSE Summary of this function goes here
%   Detailed explanation goes here

err = sum((func1-func2).^2)
end

