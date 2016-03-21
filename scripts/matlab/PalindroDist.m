%function [d1,d2] = PalindroDist(m)
function d1 = PalindroDist(m)
%PALINDRODIST Summary of this function goes here
%   Detailed explanation goes here
j = 0;
while (true)
    P = m + j;
    if(Palindromic(P) == 1)
        d1 = j;
        break
    end
    j = j+1;
end

% if(Palindromic(m) == 1)
%     d2 = 0;
% else
%     d2 = NextPalindrome(m) - m;
% end
% d2 = NextPalindrome(m)-m;

end

