% to realize the multiplication in verilog 
% to calculate the coefficiency
% edit by leo
% 2015-09-28 10:27

% input the num of gi
g = [79 44 81 100 49 183 56 17 232 187 126 104 31 103 52 118 1];
seq = [0 0 0 0 0 0 0 0];
cnt = 0;
syms x;
gf2poly = gf([1 0 0 0 1 1 1 0 1], 8);
a = roots(gf2poly);

fid1 = fopen('D:\MULTI_MUL.txt','wt');
fprintf('集成multiply.m，同时计算多个模块的输出\n');
for z = 0 : 1 : 16;
gi = g(z+1);
% convert gi into bin mode
xx = fi(gi,0,8,0);
bxx = bin(xx);
% bxx is in char type, change to double and store in sequence m
for i = 1 : 1 : 8
    m(i) =  double( bxx(i) - 48 );
end
x = m(1)*a.^7 + m(2)*a.^6 + m(3)*a.^5 + m(4)*a.^4 + m(5)*a.^3 + ...
    m(6)*a.^2 + m(7)*a.^1 + m(8);
% to generate Y = M * X; -> matrix M
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

fprintf(fid1,'g[%d] = %d \n',z,g(z+1));

for j = 8 : -1 : 1       %line
    for i = 8 : -1 : 1  %coloum
        if(mm(j,i) ~= 0) 
            seq(cnt+1) = (8 - i);
            cnt = cnt + 1;
        end
    end
    fprintf(fid1,'   y[%d] = x[%d]',8-j,seq(1));
    if(cnt >= 2)
        for i = 2: 1: cnt
            fprintf(fid1,' ^ x[%d]',seq(i));
        end
    end
    fprintf(fid1,';\n');
    cnt = 0;
end
end

fclose(fid1);
% end  
