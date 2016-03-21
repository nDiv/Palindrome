function p = NextPalindrome(m)
%NEXTPALINDROME Summary of this function goes here
%   Detailed explanation goes here
Ints = [];
p = m;
while (floor(m) > 0)
    Ints = [Ints, floor(mod(m,10))];
    m = m/10;
end
n = length(Ints);
Ints = flip(Ints);

if(p<9)
    p = p+1;
elseif(sum(Ints == 9) == n)
    p = p+2;
else
    Ints = SwapDigits(Ints);
    p = 0;
    for i=0:n-1
        p = p + Ints(n-i)*10^i;
    end
end
    
end

