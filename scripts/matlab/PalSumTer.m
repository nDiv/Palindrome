function sumPal = PalSumTer(max_val)
%PALSUMTER Summary of this function goes here
%   Detailed explanation goes here
tic
sumPal = 0;
if(max_val < 10)
    return
end
i=10;
while(i<max_val)
    Pnext = NextPalindrome(i);
    dToNext = Pnext - i;
    
    if(max_val<Pnext)
        d = Pnext - max_val;
        S = sum(dToNext-d-1:dToNext);
    else
        S = sum(1:dToNext);
    end
    sumPal = sumPal + S;
    i = i + dToNext+1;
    %pause
end
toc

end

