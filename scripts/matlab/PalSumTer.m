function sumPal = PalSumTer(max_val)
%PALSUMTER Summary of this function goes here
%   Detailed explanation goes here
tic
sumPal = 0;
if(max_val < 11)
    return
end
i=10;
while(i<max_val)
    Pnext = NextPalindrome(i);
    dToNext = Pnext - i;
    
    if(max_val<Pnext)
        d = Pnext - max_val;
        S = sum(dToNext:-1:dToNext-(dToNext-d-1));
    else
        S = sum(dToNext:-1:1);
    end
    sumPal = sumPal + S;
    i = i + dToNext+1;
    %pause
end
toc

end

