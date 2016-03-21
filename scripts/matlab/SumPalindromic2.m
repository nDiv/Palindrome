function [sumPal, Pal, Dm] = SumPalindromic2(max_val)
%SUMPALINDROMIC Summary of this function goes here
%   Detailed explanation goes here
tic
sumPal = 0;
Pal = [];
Dm = [];
for i=0:max_val-1
     sumPal = sumPal + PalindroDist(i);
     Dm = [Dm,PalindroDist(i)];
end
toc
end

