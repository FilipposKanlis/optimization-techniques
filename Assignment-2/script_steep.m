%Filippos Kanlis 9829
%Script for Steepest Descent Method

clear; 
close all;

%function
syms x y ;
f(x,y) = (x.^5).*exp(-x.^2 - y.^2);

X = [0 -1 1;0 1 -1];

epsilon = 0.01;
gamma = 0.1;

%steep_descent_gamma_const
for i=1:3
    [xk,n] = steepest_descent_const(f,epsilon,gamma,X(:,i));
    fig=figure('Name','Steepest descent with constant gamma','NumberTitle','off');
    fcontour(f,[-3 3]);
    hold on;
    grid on;
    txt=sprintf(['Steepest descent with constant gamma for f \n Starting point = (%d,%d) \n iterations = %d, Minimum = (%.2f,%.2f)'],X(1,i),X(2,i),n,xk(1,end),xk(2,end));
    title(txt);
    xlabel('x');
    ylabel('y');
    plot(xk(1,1:end),xk(2,1:end));
    scatter(xk(1,end),xk(2,end),'*');
    saveas(fig,'steep_descent_gamma_const_on_('+string(X(1,i))+','+string(X(2,i))+').jpg')

    fig2=figure('Name','f over iterations (k)','NumberTitle','off');
    hold on;
    plot(0:n,f(xk(1,:),xk(2,:)));
    scatter(n,f(xk(1,end),xk(2,end)),'*');
    kpointssize=size(xk);
    kmax=kpointssize(2)-1;
    txt = sprintf('Minimum @(%.3f,%.2f)\n f = %.3f on k = %d',xk(1,end),...
    xk(2,end),double(f(xk(1,end),xk(2,end))),kmax); 
    annotation('textbox', 'String', txt);
    fig2_txt = sprintf( 'Value of f over iterations (k), \n using steepest descent with constant gamma \n and (%d,%d) as starting point.',X(1,i),X(2,i));
    title(fig2_txt);
    xlabel('k-th iteration');
    ylabel('f(xk,yk)');
    saveas(fig2,'f_vs_k_const_on('+string(X(1,i))+','+string(X(2,i))+').jpg')
end

%steep_descent_variable_gamma_using minimization with golden section method
for i=1:3
    [xk,n] = steepest_descent_gamma(f,epsilon,gamma,X(:,i));
    fig=figure('Name','Steepest descent with variable gamma','NumberTitle','off');
    fcontour(f,[-3 3]);
    hold on;
    grid on;
    txt=sprintf(['Steepest descent with variable gamma \n using minimization with golden section method \n for f \n Starting point = (%d,%d) \n iterations = %d, Minimum = (%.2f,%.2f)'],X(1,i),X(2,i),n,xk(1,end),xk(2,end));
    title(txt);
    xlabel('x');
    ylabel('y');
    plot(xk(1,1:end),xk(2,1:end));
    scatter(xk(1,end),xk(2,end),'*');
    saveas(fig,'steep_descent_gamma_var_on_('+string(X(1,i))+','+string(X(2,i))+').jpg')

    fig2=figure('Name','f over iterations (k)','NumberTitle','off');
    hold on;
    plot(0:n,f(xk(1,:),xk(2,:)));
    scatter(n,f(xk(1,end),xk(2,end)),'*');
    kpointssize=size(xk);
    kmax=kpointssize(2)-1;
    txt = sprintf('Minimum @(%.3f,%.2f)\n f = %.3f on k = %d',xk(1,end),...
    xk(2,end),double(f(xk(1,end),xk(2,end))),kmax); 
    annotation('textbox', 'String', txt);
    fig2_txt = sprintf( 'Value of f over iterations (k) \n using minimization with golden section method to find gamma \n and (%d,%d) as starting point.',X(1,i),X(2,i));
    title(fig2_txt);
    xlabel('k-th iteration');
    ylabel('f(xk,yk)');
    saveas(fig2,'f_vs_k_var_on('+string(X(1,i))+','+string(X(2,i))+').jpg')
end

%steep_descent_using armijo rule for gamma
for i=1:3
    [xk,n] = steepest_descent_armijo(f,epsilon,gamma,X(:,i));
    fig=figure('Name','Steepest descent using armijo rule for gamma','NumberTitle','off');
    fcontour(f,[-3 3]);
    hold on;
    grid on;
    txt=sprintf(['Steepest descent using armijo rule for gamma for f \n Starting point = (%d,%d) \n iterations = %d, Minimum = (%.2f,%.2f)'],X(1,i),X(2,i),n,xk(1,end),xk(2,end));
    title(txt);
    xlabel('x');
    ylabel('y');
    plot(xk(1,1:end),xk(2,1:end));
    scatter(xk(1,end),xk(2,end),'*');
    saveas(fig,'steep_descent_gamma_armijo_on_('+string(X(1,i))+','+string(X(2,i))+').jpg')

    fig2=figure('Name','f over iterations (k)','NumberTitle','off');
    hold on;
    plot(0:n,f(xk(1,:),xk(2,:)));
    scatter(n,f(xk(1,end),xk(2,end)),'*');
    kpointssize=size(xk);
    kmax=kpointssize(2)-1;
    txt = sprintf('Minimum @(%.3f,%.2f)\n f = %.3f on k = %d',xk(1,end),...
    xk(2,end),double(f(xk(1,end),xk(2,end))),kmax); 
    annotation('textbox', 'String', txt);
    fig2_txt = sprintf( 'Value of f over iterations (k) \n using armijo rule for gamma \n and (%d,%d) as starting point.',X(1,i),X(2,i));
    title(fig2_txt);
    xlabel('k-th iteration');
    ylabel('f(xk,yk)');
    saveas(fig2,'f_vs_k_armijo_on('+string(X(1,i))+','+string(X(2,i))+').jpg')
end
