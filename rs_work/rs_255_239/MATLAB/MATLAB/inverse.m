% inverse.m
% to calculate the inverse num of alpha in GF(2^m)
% try to save it to txt and in standard case(x) mode
% edit by leo
% 20150923
%
clc

syms x;
gf2poly = gf([1 0 0 0 1 1 1 0 1], 8);
a = roots(gf2poly);
x = a;
% to get x aequence and y sequence
for i = 1 : 1 : 255
    x1 = a.^(i - 1);
    x2 = double(x1.x);
    xx(i) = x2(1);
    y1 = a.^(256 - i);
    y2 = double(y1.x);
    yy(i) = y2(1);
end
% value store in matrix...
for i = 1 : 1 : 255
    m(1,i) = xx(i);
    m(2,i) = yy(i);
end
% rearrange sequence, not neccessary!
for i = 1 : 1 : 254
    for j = i + 1 : 1 : 255
        if(m(1,i) > m(1,j))
          mm = m(1,i);
          m(1,i) = m(1,j);
          m(1,j) = mm;
          mm = m(2,i);
          m(2,i) = m(2,j);
          m(2,j) = mm;
        end
    end
end

% print in txt, and for convience to copy...
fid = fopen('D:\INV.txt','wt');
for i = 1: 1: 254
    fprintf(fid,'   %d : y = ',m(1,i));
    fprintf(fid,'%d; \n',m(2,i));
end
fclose(fid);



