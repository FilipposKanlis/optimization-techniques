% Filippos Kanlis 9829
clear; 
close all;

%function
syms x y ;
f(x,y) = (x.^5).*exp(-x.^2 - y.^2);

%create the plots
fig3D=figure('Name','3D plot','NumberTitle','off');
grid on;
fsurf(f,'ShowContours','on');
title('3D plot of f ='+string(f));
xlabel('x');
ylabel('y');
zlabel('f(x,y)');
box on;
saveas(fig3D,'3D_plot.png');

%isohypses lines of the function
figiso=figure('Name','Isohypses','NumberTitle','off');
fcontour(f,[-3 3]);
grid on;
title('Isohypses lines of f ='+string(f));
xlabel('x');
ylabel('y');
saveas(figiso,'Isohypses.png');



