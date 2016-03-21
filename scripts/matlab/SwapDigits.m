function newL = SwapDigits(L)
%SWAPDIGITS Summary of this function goes here
%   Detailed explanation goes here
n = length(L);
if(mod(n,2) == 0)
    j = n/2;
    left = L(1:j);
    right = L(j+1:end);
    l = j;
    r = 1;
  
    while(l>0)
        if(right(r) > left(l))
            t = j;
            while(t>0)
                if(left(t)+1 > 9)
                    left(t) = 0;
                    t = t-1;
                else
                    left(t) = left(t) + 1;
                    break
                end
            end
            newL = [left,flip(left)];
            break
        elseif(right(r) < left(l))
            right = flip(left);
            newL = [left,right];
            break;
        else
            l = l - 1; % l will never be decremented until 0 and r will never be incremented until n+1;
            r = r + 1;
            if(l==0)
                 t = j;
                 while(t>0)
                     if(left(t)+1 > 9)
                         left(t) = 0;
                         t = t-1;
                     else
                         left(t) = left(t) + 1;
                         break
                     end
                 end
                 newL = [left,flip(left)];
            end
        end
    end
else
    j = (n-1)/2;
    left = L(1:j);
    right = L(j+2:end);
    l = j;
    r = 1;
    if(L(j+1) < 9)
        while(l>0)
           if(right(r) > left(l))
               L(j+1) = L(j+1) + 1; % Might need to be changed to start incrementing last element of LEFT.
               right = flip(left);
               newL = [left,L(j+1),right];
               break
           elseif(right(r) < left(l))
               right = flip(left);
               newL = [left,L(j+1),right];
               break
           else
               l = l-1;
               r = r+1;
               if(l == 0)
                   L(j+1) = L(j+1) + 1;
                   %right = flip(left);
                   newL = [left,L(j+1),right];
                   break
               end
           end
        end
    else
        while(l>0)
           if(right(r) < left(l))
               right = flip(left);
               newL = [left,L(j+1),right];
               break
           elseif(right(r) > left(l))
               L(j+1) = 0;
               t = j;
               while(t>0)
                   if(left(t)+1 > 9)
                       left(t) = 0;
                       t = t-1;
                   else
                       left(t) = left(t) + 1;
                       break
                   end
               end
               %right = flip(left);
               newL = [left,L(j+1),flip(left)];
               break
           else
              l = l-1;
              r = r+1;
              if(l==0)
                  L(j+1) = 0;
                  t = j;
                  while(t>0)
                      if(left(t)+1 > 9)
                          left(t) = 0;
                          t = t-1;
                      else
                          left(t) = left(t) + 1;
                          break;
                      end
                  end
                  right = flip(left);
                  newL = [left,L(j+1),right];
              end
           end
        end
    end
end

end

