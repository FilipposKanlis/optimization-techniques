%Filippos Kanlis 9829
%script for steep descent projection method with constant gamma

clear;
close all;

syms x1 x2;
f(x1,x2) = (1/3) * x1^2 + 3 * x2^2;
gradient_f = gradient(f); 
variables=symvar(gradient_f); %creates an array with variables x1,x2

X = [5 -5 8;-5 10 -10];
gamma = [0.5 0.1 0.2];
sk=[5 15 0.1];
gammasize = size(gamma);
gammas=gammasize(2);
epsilon = 0.01;

figure_counter = 1;

for i=1:gammas
    i
    [xk,n] = steepest_descent_projection(f,epsilon,gamma(i),X(:,i),sk(i));
    conv=norm(double(subs(gradient_f,variables,xk(:,n-1)')))>norm(double(subs(gradient_f,variables,xk(:,n)')));

    fig1=figure(i);
    %conv=1; %An den einai energh auth h grammh tote se periptwsh mh sugklishs
             %to prwto grafima ginetai logarithmiko kai to deutero den ektupwnetai
    if (conv==0)
        semilogy(0:n,f(xk(1,:),xk(2,:)));
        hold on;
    else
      hold on;
        plot(0:n,f(xk(1,:),xk(2,:)));
    end
    scatter(n,f(xk(1,end),xk(2,end)),'x');
    graph_title = sprintf(['Value of f over iterations (k), \n using steepest descent with projection \ngamma = %0.2f sk = %0.2f and (%d,%d) as starting point.'],gamma(i),sk(i),X(1,i),X(2,i));
    title(graph_title);
    kpointssize=size(xk);
    kmax=kpointssize(2)-1;
    txt = sprintf('Minimum @(%.3f,%.2f)\n f = %.3f on k = %d',xk(1,end),...
    xk(2,end),double(f(xk(1,end),xk(2,end))),kmax); 
    if (conv== 1)
        annotation('textbox', 'String', txt);
    end
    xlabel("k-th iteration");
    ylabel("f(xk,yk)");
    save1name='steep_descent_proj_gamma_'+string(gamma(i))+'_sk_'+string(sk(i))+'_on_('+string(X(1,i))+','+string(X(2,i))+').jpg';
    saveas(fig1,save1name)
    %for results with convergence plot also fcontour
    if (conv== 1)
        fig2=figure(i+gammas);
        fcontour(f);
        hold on;
        title(sprintf('Convergence of (x_1,x_2) for gamma = %1.2f and sk = %1.2f',gamma(i),sk(i)));
        xlabel('x_1');
        ylabel('x_2');
        plot(xk(1,1:end),xk(2,1:end),'-.r');
        scatter(xk(1,end),xk(2,end),'x','r');
        grid on;
        save2name='f_vs_k_proj_gamma_'+string(gamma(i))+'_sk_'+string(sk(i))+'_on('+string(X(1,i))+','+string(X(2,i))+').jpg';
        saveas(fig2,save2name)
    end
end

