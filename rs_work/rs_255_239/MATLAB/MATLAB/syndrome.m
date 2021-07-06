% syndrome.m
% to calsulate the logic in verilog
% to treat primitive a = 2, for easy calc
% 2015-09-29 15:48 ->2015-10-08 9:50 copy from multi_multiply.m file
% directively change the coefficiencies... from g[] to ai[]!
% line 21, g[] -> ai[]; line
% edit by leo

% % syms x temp2;
% % gf2poly = gf([1 0 0 0 1 1 1 0 1], 8);
% % a = roots(gf2poly);
% % % ai = [a a2 a3 a4 a5 ... a16]
% % for i = 1 : 1 : 16
% %     temp = a.^i;
% %     temp2 = temp(1);
% %     ai(i) = double(temp2.x);
% % end
% ai = [2  4  8 16 32 64 128 29 58 116 232 205 135 19 38 76]
% now, calc the x[i]'s contribute to y[0]~y[7]

ai = [2  4  8 16 32 64 128 29 58 116 232 205 135 19 38 76 1];
seq = [0 0 0 0 0 0 0 0];
cnt = 0;
syms x;
gf2poly = gf([1 0 0 0 1 1 1 0 1], 8);
a = roots(gf2poly);
fid1 = fopen('D:\SYNDEOME.txt','wt');
fprintf('copy from multi_multiply.m\n');
for z = 0 : 1 : 16;
gi = ai(z+1);
xx = fi(gi,0,8,0);
bxx = bin(xx);
for i = 1 : 1 : 8
    m(i) =  double( bxx(i) - 48 );
end
x = m(1)*a.^7 + m(2)*a.^6 + m(3)*a.^5 + m(4)*a.^4 + m(5)*a.^3 + ...
    m(6)*a.^2 + m(7)*a.^1 + m(8);
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
fprintf(fid1,'ai[%d] = %d \n',z,ai(z+1));
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





