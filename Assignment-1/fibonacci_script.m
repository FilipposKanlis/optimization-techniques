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
epsilon = 0.01;

% fibonacci method for f1,f2,f3
for f=1:1:3
    f %deixnei se poia sunarthsh vriskomai thn wra pou trexei to programma.
    k=zeros(1,buffer);
    l=zeros(1,buffer);
    i=0;
    for lambda = linspace(0.0021,0.0048,buffer) 
        i = i + 1;
        i %deixnei se poio lambda vriskomai.
        [~,~,k(i),~] = fibonacci_method(functions(f), a, b, epsilon, lambda );
        l(i) = lambda;
    end
    fig=figure('Name','Fibonacci: f ='+string(functions(f)),'NumberTitle','off');
    plot(l, (k-1), 'b', 'LineWidth',1.5)
    xlabel('l value')
    ylabel('# of iterations')
    title('f(x)='+string(functions(f)), 'FontSize', 16')
    saveas(fig,'F'+string(f)+'.jpg')
end

colors=['k', 'r', 'g', 'b'];
lambdas=[0.01, 0.1, 1, 2];
for f=1:1:3
    f %deixnei se poia sunarthsh vriskomai thn wra pou trexei to programma.
    fig=figure('Name','Fibonacci : Comparison of iterations as a dependence on the value of lambda for f ='+string(functions(f)),'NumberTitle','off');
    for i=1:1:4 
        i %deixnei se poio lambda vriskomai.
        [ai,bi,k(i),~] = fibonacci_method (functions(f), a, b, epsilon, lambdas(i) );
        plot(ai, colors(i), 'LineWidth',1.5)
        hold on;
        plot(bi, colors(i), 'LineWidth',1.5)
    end
    xlabel('# of iterations')
    ylabel('values of a and b')
    title('f(x)='+string(functions(f)), 'FontSize', 16')
    legend('l='+string(lambdas(1)),'','l='+string(lambdas(2)),'','l='+string(lambdas(3)),'','l='+string(lambdas(4)));
    saveas(fig,'F'+string(f)+'_comp.jpg')

end


