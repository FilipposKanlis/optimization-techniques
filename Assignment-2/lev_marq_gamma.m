%Filippos Kanlis 9829
%Levenberg-Marquardt With Variable Gamma

function [xk,n] = lev_marq_gamma(f,epsilon,~,X)

%X = x0,y0 pair of starting point
%n: number of iterations

d = []; 
k = 1;
xk = X;

gradient_f = gradient(f);
hess_f = hessian(f);

syms v_gamma
        
 while (norm(double(subs(gradient_f,symvar(gradient_f),{xk(:,k)'}))) > epsilon)
        
    hess_matrix = double(subs(hess_f,symvar(hess_f),{xk(:,k)'}));
    eigen_values = eig(hess_matrix);
    if (sum(eigen_values < 0) > 0)
        uk = max(abs(eigen_values))+0.2;
    end
    A = hess_matrix + uk*eye(2);
    B = -double(subs(gradient_f,symvar(gradient_f),{xk(:,k)'}));
    d = [d linsolve(A,B)];
    func_min(v_gamma) = f(xk(1,k)+v_gamma*d(1,k),xk(2,k)+v_gamma*d(2,k));
    gamma = gold_sect(func_min,0.001,0,1);
    xk_new = xk(:,k) + gamma * d(:,k);
    xk = [xk xk_new];
    k = k + 1;
end
n = k - 1;
end

