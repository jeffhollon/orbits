function [ ORBIT ] = getOrbits( n, t )
%GETORBITS Summary of this function goes here
%   Detailed explanation goes here
    if gcd(n,t)==1
        
                    count=2; %number of orbits
                    pos=1;  %position of orbit count
                    USED(1,1)=0; %The ID element is always separate
                    ORBITS(1,1)=0;  %The ID is by itself in an orbit

                    for i=0:n-1;
                        pos=1;  %reset position
                        %check if i is in USED
                        if i ~= USED(1,:)
                            a=i;
                            ORBITS(count,pos) = a;
                            USED(1,size(USED,2)+1) = a;
                            while mod(a*t,n) ~= i
                                pos = pos + 1;  %go to next position
                                a = mod(a*t,n);
                                USED(1,size(USED,2)+1) = a;
                                ORBITS(count,pos)=a;
                            end
                            count = count + 1;
                        end
                    end

                    [m n] = size(ORBITS);
                    SIZE(1,1)=1;  %ID always 1
                    for a=2:m
                        count=1;
                        for b=1:n
                            if ORBITS(a,b) ~= 0
                                SIZE(a,1) = count;
                                count = count + 1;
                            end
                        end
                    end        
    
                    ORBIT = ORBITS;
                    
    else
        ORBIT=0;
    end
    
    

end

