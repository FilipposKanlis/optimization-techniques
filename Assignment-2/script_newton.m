%Filippos Kanlis 9829
%Script(Compact) for Newton Method 

clear; 
close all;

%function
syms x y ;
f(x,y) = (x.^5).*exp(-x.^2 - y.^2);

X = [0 -1 1;0 1 -1];

epsilon = 0.01;
gamma = 0.5;


for j=1:3
for i=1:3
    switch j
        case 1
            [xk,n] = newton_const(f,epsilon,gamma,X(:,i));
            fig1name='Newton method with constant gamma';
            fig1txt=sprintf(['Newton method with constant gamma for f \n Starting point = (%d,%d) \n iterations = %d, Minimum = (%.2f,%.2f)'],X(1,i),X(2,i),n,xk(1,end),xk(2,end));
            save1name='newton_gamma_const_on_('+string(X(1,i))+','+string(X(2,i))+').jpg';
            fig2name='f over iterations (k)';
            fig2txt=sprintf( 'Value of f over iterations (k), \n using newton method with constant gamma \n and (%d,%d) as starting point.',X(1,i),X(2,i));
            save2name='newton_f_vs_k_const_on('+string(X(1,i))+','+string(X(2,i))+').jpg';
        case 2
            [xk,n] = newton_gamma(f,epsilon,gamma,X(:,i));
            fig1name='Newton method with variable gamma';
            fig1txt=sprintf(['Newton method with variable gamma \n using minimization with golden section method \n for f \n Starting point = (%d,%d) \n iterations = %d, Minimum = (%.2f,%.2f)'],X(1,i),X(2,i),n,xk(1,end),xk(2,end));
            save1name='newton_gamma_var_on_('+string(X(1,i))+','+string(X(2,i))+').jpg';
            fig2name='f over iterations (k)';
            fig2txt= sprintf( 'Value of f over iterations (k) \n newton method using minimization with golden section method to find gamma \n and (%d,%d) as starting point.',X(1,i),X(2,i));
            save2name='newton_f_vs_k_var_on('+string(X(1,i))+','+string(X(2,i))+').jpg';

        case 3
            [xk,n] = newton_armijo(f,epsilon,gamma,X(:,i));
            fig1name='Newton method using armijo rule for gamma';
            fig1txt=sprintf(['Newton method using armijo rule for gamma for f \n Starting point = (%d,%d) \n iterations = %d, Minimum = (%.2f,%.2f)'],X(1,i),X(2,i),n,xk(1,end),xk(2,end));
            save1name='newton_gamma_armijo_on_('+string(X(1,i))+','+string(X(2,i))+').jpg';
            fig2name='f over iterations (k)';
            fig2txt=sprintf( 'Value of f over iterations (k) \n newton method using armijo rule for gamma \n and (%d,%d) as starting point.',X(1,i),X(2,i));
            save2name='newton_f_vs_k_armijo_on('+string(X(1,i))+','+string(X(2,i))+').jpg';
    end

    
    fig=figure('Name',fig1name,'NumberTitle','off');
    fcontour(f,[-3 3]);
    hold on;
    grid on;
    title(fig1txt);
    xlabel('x');
    ylabel('y');
    plot(xk(1,1:end),xk(2,1:end));
    scatter(xk(1,end),xk(2,end),'*');
    saveas(fig,save1name)

    fig2=figure('Name',fig2name,'NumberTitle','off');
    hold on;
    plot(0:n,f(xk(1,:),xk(2,:)));
    scatter(n,f(xk(1,end),xk(2,end)),'*');
    kpointssize=size(xk);
    kmax=kpointssize(2)-1;
    txt = sprintf('Minimum @(%.3f,%.2f)\n f = %.3f on k = %d',xk(1,end),...
    xk(2,end),double(f(xk(1,end),xk(2,end))),kmax); 
    annotation('textbox', 'String', txt);
    title(fig2txt);
    xlabel('k-th iteration');
    ylabel('f(xk,yk)');
    saveas(fig2,save2name)
end
end


