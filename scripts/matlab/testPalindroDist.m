clc
clear
sum1 = 0;
sum2 = 0;
Pal1 = [];
Pal2 = [];
Dist1 = [];
Dist2 = [];
for i=0:10000
    [d1,d2] = PalindroDist(i);
    sum1 = sum1 + d1;
    sum2 = sum2 + d2;
    Pal1 = [Pal1,i+d1];
    Pal2 = [Pal2,i+d2];
    Dist1 = [Dist1, d1];
    Dist2 = [Dist2, d2];
end