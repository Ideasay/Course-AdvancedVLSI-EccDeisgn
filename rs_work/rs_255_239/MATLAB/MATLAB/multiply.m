%% to realize the multiplication in verilog 
% to calculate the coefficiency
% edit by leo
% 2015-09-25 14:52

%% input the num of gi
g = [79 44 81 100 49 183 56 17 232 187 126 104 31 103 52 118 1];
gi = 79;
seq = [0 0 0 0 0 0 0 0];
cnt = 0;
syms x;
gf2poly = gf([1 0 0 0 1 1 1 0 1], 8);
a = roots(gf2poly);
%x = a;
% convert gi into bin mode
xx = fi(gi,0,8,0);
bxx = bin(xx);
% bxx is in char type, change to double and store in sequence m
for i = 1 : 1 : 8
    m(i) =  double( bxx(i) - 48 );
end
%%
% x is primitive polynomial with coeffiency (79)D = (01001111)B , or
% x = x^6 + x^3 + x^2 + x^1 + 1;
% here,we replace the x with a, for the reason that we can easily calc
% the product of x;
% eg: 2*x = x^7 + x^4 + x^3 + x^2 + x^1;   (158)D = (10011110)B
% 
% why in this format?
% for a is primitive, it has not only 1 element, we choose the first
% primitive to calculate
%%
x = m(1)*a.^7 + m(2)*a.^6 + m(3)*a.^5 + m(4)*a.^4 + m(5)*a.^3 + ...
    m(6)*a.^2 + m(7)*a.^1 + m(8);

% here we calc the first input num - x[0] 's contribute to y;
for j = 1 : 1 : 8 
    xi = x*2^(j-1);
    temp = xi(1);
    t1 = double(temp.x);
    t2 = fi(t1,0,8,0);
    ct = bin(t2);
    for i = 1 : 1 : 8
        mm(i,9-j) = double(ct(i) - 48);
    end
end

%% mm matrix is as follows:
% col 7 6 5 4 3 2 1 0 end coloum
%    [0,0,0,1,0,0,1,0;
%     1,0,0,0,1,0,0,1;
%     0,1,0,0,0,1,0,0;
%     1,0,1,0,0,0,1,0;
%     0,1,0,0,0,0,1,1;
%     1,0,1,1,0,0,1,1;
%     0,1,0,0,1,0,1,1;
%     0,0,1,0,0,1,0,1;]
% Y' = mm * X'
% or, to say:
% y[7] = x[1]^ x[4]; 
% ...
% y[0] = x[5]^ x[2]^ x[0];
%

% try to printf the code
fid = fopen('D:\MUL.txt','wt');

for j = 8 : -1 : 1       %line
    for i = 8 : -1 : 1  %coloum
        if(mm(j,i) ~= 0) 
            seq(cnt+1) = (8 - i);
            cnt = cnt + 1;
        end
    end
    fprintf(fid,'   y[%d] = x[%d]',8-j,seq(1));
    if(cnt >= 2)
        for i = 2: 1: cnt
            fprintf(fid,' ^ x[%d]',seq(i));
        end
    end
    fprintf(fid,';\n');
    cnt = 0;
end
fclose(fid);

%% end
