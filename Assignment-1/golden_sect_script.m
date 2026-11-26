% Filippos Kanlis 9829
% plot the number of iterations of functions
clear; 
close all;

%functions 
syms x;
f_1 = (x-2)^2 + x*log(x+3); %log in matlab is ln 
f_2 = 5^x + (2-cos(x))^2;
f_3 = exp(x)*((x^3)-1)+(x-1)*sin(x);
functions = {f_1,f_2,f_3};
a=-1;
b=3;
buffer = 20;

%golden section method for f1,f2,f3
for f=1:1:3
    f
    k=zeros(1,buffer);
    l=zeros(1,buffer);
    i=0;
    for lambda = linspace(0.0021,0.05,buffer) 
        i = i + 1;
        i
        [~,~,k(i)] = golden_sect_meth(functions(f), a, b, lambda );
        l(i) = lambda;
    end
    fig=figure('Name','Golden Section: f ='+string(functions(f)),'NumberTitle','off');
    plot(l, (k+1), 'b', 'LineWidth',1.5)
    xlabel('l value')
    ylabel('# of iterations')
    title('f(x)='+string(functions(f)), 'FontSize', 16')
    saveas(fig,'f'+string(f)+'.jpg')
end

colors=['k', 'r', 'g', 'b'];
lambdas=[0.01, 0.1, 1, 2];
for f=1:1:3
    f
    fig=figure('Name','Golden Section Comparison of iterations as a dependence on the value of lambda for f ='+string(functions(f)),'NumberTitle','off');
    for i=1:1:4
        i
        [ai,bi,k(i)] = golden_sect_meth(functions(f), a, b, lambdas(i) );
        plot(ai, colors(i), 'LineWidth',1.5)
        hold on;
        plot(bi, colors(i), 'LineWidth',1.5)
    end
    xlabel('# of iterations')
    ylabel('values of a and b')
    title('f(x)='+string(functions(f)), 'FontSize', 16')
    legend('l='+string(lambdas(1)),'','l='+string(lambdas(2)),'','l='+string(lambdas(3)),'','l='+string(lambdas(4)));
    saveas(fig,'f'+string(f)+'comp.jpg')
end


