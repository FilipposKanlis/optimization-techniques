%Filippos Kanlis 9829
%Newton Method With Variable Gamma

function [xk,n] = newton_gamma(f,epsilon,~,X)
%X = x0,y0 pair of starting point
%n: number of iterations

d = []; 
k = 1;
xk = X;

gradient_f = gradient(f);
hess_f = hessian(f);
max_step = 100;
 
syms v_gamma
        
 while (norm(double(subs(gradient_f,symvar(gradient_f),{xk(:,k)'}))) > epsilon)
       grad_matrix = double(subs(gradient_f,symvar(gradient_f),{xk(:,k)'}));
       hess_matrix = double(subs(hess_f,symvar(hess_f),{xk(:,k)'}));
       d = [d -hess_matrix\grad_matrix];
       func_min(v_gamma) = f(xk(1,k)+v_gamma*d(1,k),xk(2,k)+v_gamma*d(2,k));       
       gamma = gold_sect(func_min,0.001,0,1);
       xk_new = xk(:,k) + gamma * d(:,k);
       xk = [xk xk_new];
       k = k + 1;
       if (k == max_step || f(xk(1,k),xk(2,k)) >= f(xk(1,k-1),xk(2,k-1)))
            break
       end
 end
n = k - 1;
end

