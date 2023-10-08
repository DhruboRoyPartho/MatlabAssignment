clc; clear; close all;

Fs = 100;
ts = 1/Fs;

Fc_1 = 1;
Fc_2 = 3;

a=1; b=1;
ind = 1;
x1 = []; x2 = []; x3 = []; 
for n = 0:Fs
    x1(ind) = a*sin(2*pi*Fc_1*n*ts);
    x2(ind) = b*sin(2*pi*Fc_2*n*ts);
    ind = ind + 1;
end

x3 = x1 + x2;
y = 0:Fs;

subplot(4,1,1);
plot(y, x1, 'b--*');  grid on;
subplot(4,1,2);
plot(y, x2, 'b--*');
subplot(4,1,3);
plot(y, x3, 'b--*');
