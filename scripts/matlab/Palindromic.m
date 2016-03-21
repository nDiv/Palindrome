function out = Palindromic(P)
%PALINDROMIC Summary of this function goes here
%   Detailed explanation goes here
if P >= 0
    Ints = [];
    while (floor(P) > 0)
        Ints = [Ints, floor(mod(P,10))];
        P = P/10;
    end
  
    n = length(Ints);
    if (mod(n,2) == 0)
        for i=1:n/2
            if (Ints(i) ~= Ints(n-i+1))
                out = 0;
                return 
            end
        end
        out = 1;
    else
        for i=1:(n-1)/2
            if (Ints(i) ~= Ints(n-i+1))
                out = 0;
                return 
            end
        end
        out = 1;
    end
else
    out = -1;
end

end

