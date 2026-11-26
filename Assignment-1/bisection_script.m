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

%bisection method with fixed lambda for f1,f2,f3
%epsilon must be < lambda / 2
for f=1:1:3
    k=zeros(1,buffer);
    e=zeros(1,buffer);
    l=0.01;
    i=0;
    for epsilon = linspace(0.001,0.0048,buffer) 
        i = i + 1;
        [~,~,k(i)] = bisection_meth(functions(f), a, b, epsilon, l );
        e(i) = epsilon;
    end
    fig=figure('Name','Plot: fixed lambda for f ='+string(functions(f)),'NumberTitle','off');
    plot(e, (k-1)*2, 'b', 'LineWidth',1.5)
    xlabel('e value')
    ylabel('# of iterations')
    title('f(x)='+string(functions(f)), 'FontSize', 16')
    saveas(fig,'f'+string(f)+'fixedl.jpg')
end

%bisection method with fixed epsilon for f1,f2,f3
%lambda must be > 2 x epsilon
for f=1:1:3
    k=zeros(1,buffer);
    l=zeros(1,buffer);
    e=0.001;
    i=0;
    for lambda = linspace(0.0021,0.0048,buffer) 
        i = i + 1;
        [~,~,k(i)] = bisection_meth(functions(f), a, b, e, lambda );
        l(i) = lambda;
    end
    fig=figure('Name','Plot: fixed epsilon for f ='+string(functions(f)),'NumberTitle','off');
    plot(l, (k-1)*2, 'b', 'LineWidth',1.5)
    xlabel('l value')
    ylabel('# of iterations')
    title('f(x)='+string(functions(f)), 'FontSize', 16')
    saveas(fig,'f'+string(f)+'fixede.jpg')
end

colors=['k', 'r', 'g', 'b'];
lambdas=[0.01, 0.1, 1, 2];
e=0.001;
for f=1:1:3
    fig=figure('Name','Plot: Comparison of iterations as a dependence on the value of lambda for f ='+string(functions(f)),'NumberTitle','off');
    for i=1:1:4
        [ai,bi,k(i)] = bisection_meth(functions(f), a, b, e, lambdas(i) );
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


