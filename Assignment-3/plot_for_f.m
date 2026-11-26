%Filippos Kanlis 9829
%3Dplot for function f(x1,x2) = (1/3) * x1^2 + 3 * x2^2

clear;
close all;

syms x1 x2;
f(x1,x2) = (1/3) * x1^2 + 3 * x2^2;

%3D plot 
fsurf(f,[-10 10],'ShowContours','on');
title('3D plot of f(x_1,x_2) = (1/3)x1^2 + 3x2^2');
xlabel('x1');
ylabel('x2');
zlabel('f(x_1,x_2)');
grid on;

