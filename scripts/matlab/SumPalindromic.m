function [sumPal, Pal, Dm] = SumPalindromic(max_val)
%SUMPALINDROMIC Summary of this function goes here
%   Detailed explanation goes here
tic
sumPal = 0;
Pal = [];
Dm = [];
% for i=0:max_val-1
%     sumPal = sumPal + PalindroDist(i);
% end
i=11;
while(i<max_val)
    Pnext = NextPalindrome(i);
    dToNext = Pnext - i;
    
    if(max_val<Pnext)
        d = Pnext - max_val;
        S = sum(dToNext-1:-1:dToNext-(dToNext-d));
    else
        S = sum(dToNext-1:-1:1);
    end
    sumPal = sumPal + S;
    i = i + dToNext;
    %pause
end
toc
end

