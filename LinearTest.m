clc; clear all; close all;

Fs = 100;
ts = 1/Fs;

Fc_1 = 1;
Fc_2 = 3;

a=1; b=1;
ind = 1;
x1 = []; x2 = []; x3 = []; y1 = []; y2 = []; y3 = []; ys = []; 
for n = 0:Fs
    x1(ind) = a*sin(2*pi*Fc_1*n*ts);
    x2(ind) = b*sin(2*pi*Fc_2*n*ts);
    ind = ind + 1;
end

x3 = x1 + x2;
y1 = -(x1/2);
y2 = -(x2/2);
y3 = -(x3/2);

ys = y1 + y2;

y = 0:Fs;


subplot(5,1,1);
plot(y, x1, 'b--*');    grid on;
xlabel('Time (s)');
ylabel('Amplitude');
subplot(5,1,2);
plot(y, x2, 'b--*');    grid on;
subplot(5,1,3);
plot(y, y3, 'b--*');    grid on;
subplot(5,1,4);
plot(y, ys, 'b--*');    grid on;

yd = sum(abs(ys-y3));
subplot(5,1,5);
plot(y, yd, 'b--*');    grid on;
fprintf('Linearity Check: %ld\n', yd);
disp('Linearity Status: ');
if(yd == 0)
    disp('YES');
else
    disp('NO');
end
